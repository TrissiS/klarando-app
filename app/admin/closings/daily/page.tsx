'use client'

import { Suspense, useEffect, useMemo, useState } from 'react'
import { useSearchParams } from 'next/navigation'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  downloadCashClosingDailyPdf,
  getCashClosingDaily,
  getManagedTenants,
  requestCashClosingDailyReopen,
  saveCashClosingDaily,
  type CashClosingDailyResponse,
  type ManagedTenant,
} from '@/lib/api'

type SessionShape = {
  role?: string
  tenantId?: string | null
  accessToken?: string
}

const COUNT_SHEET_ROWS = [
  { key: '0.01', label: '1 Cent', value: 0.01 },
  { key: '0.02', label: '2 Cent', value: 0.02 },
  { key: '0.05', label: '5 Cent', value: 0.05 },
  { key: '0.10', label: '10 Cent', value: 0.1 },
  { key: '0.20', label: '20 Cent', value: 0.2 },
  { key: '0.50', label: '50 Cent', value: 0.5 },
  { key: '1.00', label: '1 EUR', value: 1 },
  { key: '2.00', label: '2 EUR', value: 2 },
  { key: '5.00', label: '5 EUR', value: 5 },
  { key: '10.00', label: '10 EUR', value: 10 },
  { key: '20.00', label: '20 EUR', value: 20 },
  { key: '50.00', label: '50 EUR', value: 50 },
  { key: '100.00', label: '100 EUR', value: 100 },
  { key: '200.00', label: '200 EUR', value: 200 },
] as const

type CountSheetState = Record<string, string>

type FormState = {
  countedCash: string
  cashExpenses: string
  tipsCash: string
  tipsCard: string
  keepInRegisterTarget: string
  note: string
  countSheet: CountSheetState
}

function createEmptyCountSheetState(): CountSheetState {
  return COUNT_SHEET_ROWS.reduce<CountSheetState>((acc, row) => {
    acc[row.key] = '0'
    return acc
  }, {})
}

function todayIso() {
  const now = new Date()
  const year = now.getFullYear()
  const month = String(now.getMonth() + 1).padStart(2, '0')
  const day = String(now.getDate()).padStart(2, '0')
  return `${year}-${month}-${day}`
}

function toSafeNumber(value: unknown) {
  if (typeof value === 'number' && Number.isFinite(value)) return value
  if (typeof value === 'string') {
    const parsed = Number(value.replace(',', '.'))
    if (Number.isFinite(parsed)) return parsed
  }
  return 0
}

function formatMoney(value: unknown) {
  return `${toSafeNumber(value).toFixed(2)} EUR`
}

function parseNumber(input: string) {
  const parsed = Number(input.replace(',', '.'))
  return Number.isFinite(parsed) ? parsed : null
}

function parseCountSheetForSave(state: CountSheetState) {
  const result: Record<string, number> = {}
  for (const row of COUNT_SHEET_ROWS) {
    const raw = (state[row.key] || '').trim()
    if (!raw) {
      result[row.key] = 0
      continue
    }
    const quantity = Number(raw)
    if (!Number.isInteger(quantity) || quantity < 0) return null
    result[row.key] = quantity
  }
  return result
}

function toFormState(data: CashClosingDailyResponse | null): FormState {
  const countSheet = createEmptyCountSheetState()
  const payloadCountSheet = data?.payload?.countSheet || null
  if (payloadCountSheet) {
    for (const row of COUNT_SHEET_ROWS) {
      const quantity = payloadCountSheet[row.key]
      countSheet[row.key] = Number.isFinite(quantity) ? String(quantity) : '0'
    }
  }

  return {
    countedCash: data?.payload ? String(data.payload.countedCash) : '',
    cashExpenses: data?.payload ? String(data.payload.cashExpenses) : '0',
    tipsCash: data?.payload ? String(data.payload.tipsCash) : '0',
    tipsCard: data?.payload ? String(data.payload.tipsCard) : '0',
    keepInRegisterTarget:
      data?.payload?.keepInRegisterTarget !== null && data?.payload?.keepInRegisterTarget !== undefined
        ? String(data.payload.keepInRegisterTarget)
        : '100',
    note: data?.payload?.note || '',
    countSheet,
  }
}

function statusLabel(status: CashClosingDailyResponse['status']) {
  switch (status) {
    case 'OPEN':
      return 'Offen'
    case 'SUBMITTED':
      return 'Eingereicht'
    case 'APPROVED':
      return 'Freigegeben'
    case 'RETURNED':
      return 'Zurueckgewiesen'
    case 'REOPEN_REQUESTED':
      return 'Wiedereroeffnung angefragt'
    case 'REOPENED':
      return 'Wiedereroeffnet'
    default:
      return status
  }
}

function AdminDailyClosingPageContent() {
  const searchParams = useSearchParams()
  const [role, setRole] = useState('admin')
  const [token, setToken] = useState('')
  const [sessionReady, setSessionReady] = useState(false)
  const [tenants, setTenants] = useState<ManagedTenant[]>([])
  const [tenantId, setTenantId] = useState('')
  const [date, setDate] = useState(todayIso())
  const [data, setData] = useState<CashClosingDailyResponse | null>(null)
  const [form, setForm] = useState<FormState>(toFormState(null))
  const [isLoading, setIsLoading] = useState(true)
  const [isSaving, setIsSaving] = useState(false)
  const [isDownloadingPdf, setIsDownloadingPdf] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [showRevenueDetails, setShowRevenueDetails] = useState(true)

  useEffect(() => {
    try {
      const raw = localStorage.getItem('sessionUser')
      const parsed = raw ? (JSON.parse(raw) as SessionShape) : null
      const normalizedRole = (parsed?.role || '').trim().toLowerCase()
      if (normalizedRole) {
        setRole(normalizedRole)
      }
      setTenantId(parsed?.tenantId || '')
      setToken(parsed?.accessToken || localStorage.getItem('accessToken') || '')
    } catch {
      setToken(localStorage.getItem('accessToken') || '')
    } finally {
      setSessionReady(true)
    }
  }, [])

  useEffect(() => {
    const dateFromUrl = searchParams.get('date')
    if (dateFromUrl && /^\d{4}-\d{2}-\d{2}$/.test(dateFromUrl)) {
      setDate(dateFromUrl)
    }
  }, [searchParams])

  useEffect(() => {
    async function loadTenants() {
      if (!token) return
      try {
        const loaded = await getManagedTenants(token)
        setTenants(loaded)
      } catch {
        // tenant list optional here
      }
    }
    void loadTenants()
  }, [token])

  const showTenantSelect = role === 'superadmin' || role === 'chainadmin'
  const selectedTenantId = showTenantSelect
    ? (tenantId || data?.tenantId || tenants[0]?.id || '')
    : undefined

  useEffect(() => {
    if (!showTenantSelect) {
      return
    }
    if (!tenantId && tenants[0]?.id) {
      setTenantId(tenants[0].id)
    }
  }, [showTenantSelect, tenantId, tenants])

  async function loadData() {
    if (!sessionReady) return
    if (!date) return
    if (showTenantSelect && !selectedTenantId) {
      setIsLoading(false)
      setData(null)
      setError('')
      return
    }

    try {
      setIsLoading(true)
      setError('')
      const loaded = await getCashClosingDaily({
        date,
        tenantId: selectedTenantId,
      })
      setData(loaded)
      setForm(toFormState(loaded))
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Tagesabschluss konnte nicht geladen werden')
      setData(null)
    } finally {
      setIsLoading(false)
    }
  }

  useEffect(() => {
    void loadData()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [date, tenantId, role, sessionReady])

  const countSheetTotal = useMemo(() => {
    return COUNT_SHEET_ROWS.reduce((sum, row) => {
      const quantity = Number(form.countSheet[row.key] || '0')
      if (!Number.isFinite(quantity) || quantity < 0) return sum
      return sum + row.value * quantity
    }, 0)
  }, [form.countSheet])

  const preview = useMemo(() => {
    if (!data) return null
    const countedCash = parseNumber(form.countedCash)
    const cashExpenses = parseNumber(form.cashExpenses)
    const tipsCash = parseNumber(form.tipsCash)
    const keepInRegisterTarget = parseNumber(form.keepInRegisterTarget)
    if (countedCash === null || cashExpenses === null || tipsCash === null || keepInRegisterTarget === null) {
      return null
    }
    const expectedCash = data.computed.paidCashTotal - cashExpenses - tipsCash
    const cashDifference = countedCash - expectedCash
    const bankDepositRaw = Math.max(0, countedCash - Math.max(0, keepInRegisterTarget))
    const bankDepositRounded = Math.floor(bankDepositRaw / 5) * 5
    return {
      expectedCash,
      cashDifference,
      bankDepositRaw,
      bankDepositRounded,
      cashAfterDeposit: countedCash - bankDepositRounded,
    }
  }, [data, form.countedCash, form.cashExpenses, form.tipsCash, form.keepInRegisterTarget])

  const editingLocked = Boolean(data?.submission && !data?.canSubmit)

  async function save(submit: boolean) {
    if (editingLocked) {
      setError('Tagesabschluss ist bereits eingereicht und aktuell gesperrt.')
      return
    }
    const countedCash = parseNumber(form.countedCash)
    const cashExpenses = parseNumber(form.cashExpenses)
    const tipsCash = parseNumber(form.tipsCash)
    const tipsCard = parseNumber(form.tipsCard)
    const keepInRegisterTarget = parseNumber(form.keepInRegisterTarget)
    const countSheet = parseCountSheetForSave(form.countSheet)
    if (
      countedCash === null ||
      cashExpenses === null ||
      tipsCash === null ||
      tipsCard === null ||
      keepInRegisterTarget === null
    ) {
      setError('Bitte nur gueltige Zahlen in die Betragsfelder eintragen.')
      return
    }
    if (!countSheet) {
      setError('Bitte in der Zaehlhilfe nur ganze, positive Zahlen eintragen.')
      return
    }

    if (submit) {
      const firstConfirm = window.confirm('Tagesabschluss wirklich einreichen?')
      if (!firstConfirm) return
      const secondConfirm = window.confirm('Zweite Bestaetigung: Tagesabschluss jetzt final einreichen?')
      if (!secondConfirm) return
    }

    try {
      setIsSaving(true)
      setError('')
      setSuccess('')
      await saveCashClosingDaily({
        date,
        tenantId: selectedTenantId,
        countedCash,
        cashExpenses,
        tipsCash,
        tipsCard,
        keepInRegisterTarget,
        countSheet,
        note: form.note || null,
        submit,
      })
      setSuccess(submit ? 'Tagesabschluss eingereicht.' : 'Tagesabschluss-Entwurf gespeichert.')
      await loadData()
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Speichern fehlgeschlagen')
    } finally {
      setIsSaving(false)
    }
  }

  async function requestReopen() {
    if (!data?.canRequestReopen) return
    const reason = window.prompt('Grund fuer Wiedereroeffnung (optional):') || ''
    const firstConfirm = window.confirm('Wiedereroeffnung jetzt anfragen?')
    if (!firstConfirm) return

    try {
      setIsSaving(true)
      setError('')
      setSuccess('')
      await requestCashClosingDailyReopen({
        date,
        tenantId: selectedTenantId,
        reason: reason || null,
      })
      setSuccess('Wiedereroeffnung wurde angefragt.')
      await loadData()
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Wiedereroeffnung fehlgeschlagen')
    } finally {
      setIsSaving(false)
    }
  }

  async function downloadPdf() {
    if (!data?.submission) return
    try {
      setIsDownloadingPdf(true)
      setError('')
      const response = await downloadCashClosingDailyPdf({
        date,
        tenantId: selectedTenantId,
      })
      const blobUrl = URL.createObjectURL(response.blob)
      const link = document.createElement('a')
      link.href = blobUrl
      link.download = response.fileName
      document.body.appendChild(link)
      link.click()
      link.remove()
      URL.revokeObjectURL(blobUrl)
      setSuccess('Tagesabschluss-PDF wurde heruntergeladen.')
      await loadData()
    } catch (downloadError) {
      setError(downloadError instanceof Error ? downloadError.message : 'PDF konnte nicht geladen werden')
    } finally {
      setIsDownloadingPdf(false)
    }
  }

  return (
    <Suspense fallback={<div className="p-4 text-sm text-rose-900/75">Lade Ansicht...</div>}>
      <AdminLayout
        title="Tagesabschluss"
        subtitle="Kassenabschluss je Tag erfassen, einreichen und bei Bedarf wiedereroeffnen"
      >
      {error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}
      {success ? (
        <div className="mb-4 rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
          {success}
        </div>
      ) : null}

      <section className="mb-5 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="grid gap-3 md:grid-cols-3">
          {showTenantSelect ? (
            <label className="block">
              <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Filiale</span>
              <select value={tenantId} onChange={(event) => setTenantId(event.target.value)} className="input-ui">
                <option value="">Filiale waehlen</option>
                {tenants.map((entry) => (
                  <option key={entry.id} value={entry.id}>
                    {entry.name}
                  </option>
                ))}
              </select>
            </label>
          ) : null}
          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Tag</span>
            <input type="date" value={date} onChange={(event) => setDate(event.target.value)} className="input-ui" />
          </label>
          <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Status</p>
            <p className="mt-1 text-sm font-semibold text-[var(--brand-ink)]">
              {data ? statusLabel(data.status) : '-'}
            </p>
          </div>
        </div>
        {data?.submission ? (
          <div className="mt-4 flex flex-wrap items-center gap-2">
            <button
              type="button"
              onClick={() => void downloadPdf()}
              disabled={isDownloadingPdf}
              className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:opacity-60"
            >
              {isDownloadingPdf ? 'PDF wird erstellt...' : 'Tagesabschluss-PDF laden'}
            </button>
            {data.dailyPdf ? (
              <p className="text-xs text-rose-900/70">
                Letztes PDF: {data.dailyPdf.fileName}
                {data.dailyPdf.sha256 ? ` | SHA256: ${data.dailyPdf.sha256.slice(0, 16)}...` : ''}
              </p>
            ) : (
              <p className="text-xs text-rose-900/70">Beim Einreichen wird automatisch ein unveraenderbares PDF erzeugt.</p>
            )}
          </div>
        ) : null}
      </section>

      {editingLocked ? (
        <section className="mb-5 rounded-3xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-800">
          Dieser Tagesabschluss ist eingereicht und bis zur Rueckgabe/Wiedereroeffnung gesperrt. Die Werte sind nicht mehr editierbar.
        </section>
      ) : null}

      {isLoading ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/70">Lade Tagesabschluss...</p>
        </section>
      ) : data ? (
        <div className="grid gap-5">
          <section className="grid gap-4 sm:grid-cols-2 xl:grid-cols-5">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Umsatz gesamt</p>
              <p className="mt-2 text-2xl font-bold text-[var(--brand-ink)]">{formatMoney(data.computed.grossTotal)}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Bar bezahlt</p>
              <p className="mt-2 text-2xl font-bold text-emerald-700">{formatMoney(data.computed.paidCashTotal)}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Mitnahme</p>
              <p className="mt-2 text-2xl font-bold text-sky-700">{formatMoney(data.computed.takeawayTotal)}</p>
              <p className="mt-1 text-xs text-rose-900/70">{data.computed.takeawayOrderCount} Bestellungen</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Vor Ort</p>
              <p className="mt-2 text-2xl font-bold text-violet-700">{formatMoney(data.computed.onSiteTotal)}</p>
              <p className="mt-1 text-xs text-rose-900/70">{data.computed.onSiteOrderCount} Bestellungen</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Wareneinsatz (Tag)</p>
              <p className="mt-2 text-2xl font-bold text-orange-600">
                {formatMoney(data.computed.goodsReceiptValue + data.computed.writeOffValue)}
              </p>
            </article>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <div className="flex flex-wrap items-center justify-between gap-3">
              <h2 className="text-xl font-semibold text-[var(--brand-ink)]">Taegliche Umsatz-Uebersicht</h2>
              <button
                type="button"
                onClick={() => setShowRevenueDetails((prev) => !prev)}
                className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900/85 transition hover:bg-rose-50"
              >
                {showRevenueDetails ? 'Uebersicht ausblenden' : 'Uebersicht einblenden'}
              </button>
            </div>
            {showRevenueDetails ? (
              <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-7">
                <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">Bar</p>
                  <p className="mt-1 text-lg font-bold text-[var(--brand-ink)]">{formatMoney(data.computed.paidCashTotal)}</p>
                </div>
                <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">EC / Karte</p>
                  <p className="mt-1 text-lg font-bold text-[var(--brand-ink)]">{formatMoney(data.computed.paidCardTotal)}</p>
                </div>
                <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">Mitnahme</p>
                  <p className="mt-1 text-lg font-bold text-[var(--brand-ink)]">{formatMoney(data.computed.takeawayTotal)}</p>
                </div>
                <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">Vor Ort</p>
                  <p className="mt-1 text-lg font-bold text-[var(--brand-ink)]">{formatMoney(data.computed.onSiteTotal)}</p>
                </div>
                <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">App gesamt</p>
                  <p className="mt-1 text-lg font-bold text-[var(--brand-ink)]">
                    {formatMoney(toSafeNumber(data.computed.appPickupTotal) + toSafeNumber(data.computed.appDeliveryTotal))}
                  </p>
                </div>
                <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">App Abholung</p>
                  <p className="mt-1 text-lg font-bold text-[var(--brand-ink)]">{formatMoney(data.computed.appPickupTotal)}</p>
                </div>
                <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">App Lieferung</p>
                  <p className="mt-1 text-lg font-bold text-[var(--brand-ink)]">{formatMoney(data.computed.appDeliveryTotal)}</p>
                </div>
              </div>
            ) : null}
            <p className="mt-3 text-xs text-rose-900/70">
              Fuer die steuerliche Trennung wird Mitnahme aus Lieferung/Abholung und Vor-Ort aus stationaeren Vor-Ort-Vorgaengen gebildet.
            </p>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold text-[var(--brand-ink)]">Abschlussdaten</h2>
            <div className="mt-4 grid gap-3 md:grid-cols-2">
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Gezaehlter Kassenbestand</span>
                <input
                  value={form.countedCash}
                  onChange={(event) => setForm((prev) => ({ ...prev, countedCash: event.target.value }))}
                  className="input-ui"
                  inputMode="decimal"
                  disabled={editingLocked}
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Kassenrest (Sollbetrag)</span>
                <input
                  value={form.keepInRegisterTarget}
                  onChange={(event) => setForm((prev) => ({ ...prev, keepInRegisterTarget: event.target.value }))}
                  className="input-ui"
                  inputMode="decimal"
                  disabled={editingLocked}
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Barausgaben</span>
                <input
                  value={form.cashExpenses}
                  onChange={(event) => setForm((prev) => ({ ...prev, cashExpenses: event.target.value }))}
                  className="input-ui"
                  inputMode="decimal"
                  disabled={editingLocked}
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Trinkgeld bar</span>
                <input
                  value={form.tipsCash}
                  onChange={(event) => setForm((prev) => ({ ...prev, tipsCash: event.target.value }))}
                  className="input-ui"
                  inputMode="decimal"
                  disabled={editingLocked}
                />
              </label>
              <label className="block md:col-span-2">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Trinkgeld Karte</span>
                <input
                  value={form.tipsCard}
                  onChange={(event) => setForm((prev) => ({ ...prev, tipsCard: event.target.value }))}
                  className="input-ui"
                  inputMode="decimal"
                  disabled={editingLocked}
                />
              </label>
            </div>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/50 p-4">
              <div className="flex flex-wrap items-center justify-between gap-2">
                <h3 className="text-base font-semibold text-[var(--brand-ink)]">Zaehlhilfe (Muenzen und Scheine)</h3>
                <button
                  type="button"
                  onClick={() =>
                    setForm((prev) => ({
                      ...prev,
                      countedCash: countSheetTotal.toFixed(2),
                    }))
                  }
                  disabled={editingLocked}
                  className="rounded-xl bg-slate-900 px-3 py-2 text-sm font-semibold text-white transition hover:bg-slate-800"
                >
                  Summe in Kassenbestand uebernehmen
                </button>
              </div>

              <div className="mt-3 grid gap-2 md:grid-cols-2 xl:grid-cols-3">
                {COUNT_SHEET_ROWS.map((row) => {
                  const quantity = Number(form.countSheet[row.key] || '0')
                  const subtotal = Number.isFinite(quantity) && quantity >= 0 ? row.value * quantity : 0
                  return (
                    <div key={row.key} className="grid grid-cols-[1fr_90px_120px] items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2">
                      <span className="text-sm font-semibold text-rose-900/90">{row.label}</span>
                      <input
                        value={form.countSheet[row.key] || '0'}
                        onChange={(event) =>
                          setForm((prev) => ({
                            ...prev,
                            countSheet: {
                              ...prev.countSheet,
                              [row.key]: event.target.value,
                            },
                          }))
                        }
                        className="input-ui h-9 px-2 text-right"
                        inputMode="numeric"
                        disabled={editingLocked}
                      />
                      <span className="text-right text-sm font-semibold text-[var(--brand-ink)]">{formatMoney(subtotal)}</span>
                    </div>
                  )
                })}
              </div>
              <p className="mt-3 text-sm font-semibold text-[var(--brand-ink)]">
                Gesamt laut Zaehlhilfe: {formatMoney(countSheetTotal)}
              </p>
            </div>

            <label className="mt-3 block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Notiz</span>
              <textarea
                value={form.note}
                onChange={(event) => setForm((prev) => ({ ...prev, note: event.target.value }))}
                className="input-ui min-h-24"
                disabled={editingLocked}
              />
            </label>

            <div className="mt-4 grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
              <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
                Erwarteter Kassenbestand: <strong>{preview ? formatMoney(preview.expectedCash) : '-'}</strong>
              </div>
              <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
                Kassendifferenz: <strong>{preview ? formatMoney(preview.cashDifference) : '-'}</strong>
              </div>
              <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
                Bankeinzahlung (auf 5 EUR gerundet):{' '}
                <strong>{preview ? formatMoney(preview.bankDepositRounded) : '-'}</strong>
              </div>
              <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
                Kasse nach Einzahlung: <strong>{preview ? formatMoney(preview.cashAfterDeposit) : '-'}</strong>
              </div>
            </div>

            <div className="mt-5 flex flex-wrap gap-2">
              <button
                type="button"
                onClick={() => void save(false)}
                disabled={isSaving || editingLocked}
                className="rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2.5 text-sm font-semibold text-rose-900/85 transition hover:bg-rose-50 disabled:opacity-60"
              >
                Entwurf speichern
              </button>
              <button
                type="button"
                onClick={() => void save(true)}
                disabled={isSaving || !data.canSubmit || editingLocked}
                className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:opacity-60"
              >
                Tagesabschluss einreichen
              </button>
              <button
                type="button"
                onClick={() => void requestReopen()}
                disabled={isSaving || !data.canRequestReopen}
                className="rounded-xl bg-amber-600 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-amber-500 disabled:opacity-60"
              >
                Wiedereroeffnung anfragen
              </button>
            </div>
          </section>
        </div>
      ) : null}
      </AdminLayout>
    </Suspense>
  )
}

export default function AdminDailyClosingPage() {
  return (
    <Suspense fallback={<div className="p-4 text-sm text-rose-900/75">Lade Tagesabschluss...</div>}>
      <AdminDailyClosingPageContent />
    </Suspense>
  )
}
