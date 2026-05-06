'use client'

import { useEffect, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  getCashClosingMonthly,
  getManagedTenants,
  submitCashClosingMonthly,
  type CashClosingMonthlyResponse,
  type ManagedTenant,
} from '@/lib/api'

type SessionShape = {
  role?: string
  tenantId?: string | null
  accessToken?: string
}

function currentMonthIso() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

function money(value: number) {
  return `${value.toFixed(2)} EUR`
}

export default function AdminMonthlyClosingPage() {
  const [role, setRole] = useState('admin')
  const [token, setToken] = useState('')
  const [sessionReady, setSessionReady] = useState(false)
  const [month, setMonth] = useState(currentMonthIso())
  const [tenantId, setTenantId] = useState('')
  const [tenants, setTenants] = useState<ManagedTenant[]>([])
  const [data, setData] = useState<CashClosingMonthlyResponse | null>(null)
  const [note, setNote] = useState('')
  const [isLoading, setIsLoading] = useState(true)
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const showTenantSelect = role === 'superadmin' || role === 'chainadmin'
  const selectedTenantId = showTenantSelect
    ? (tenantId || data?.tenantId || tenants[0]?.id || '')
    : undefined

  useEffect(() => {
    try {
      const raw = localStorage.getItem('sessionUser')
      const parsed = raw ? (JSON.parse(raw) as SessionShape) : null
      setRole((parsed?.role || 'admin').toLowerCase())
      setTenantId(parsed?.tenantId || '')
      setToken(parsed?.accessToken || localStorage.getItem('accessToken') || '')
    } catch {
      setToken(localStorage.getItem('accessToken') || '')
    } finally {
      setSessionReady(true)
    }
  }, [])

  useEffect(() => {
    async function loadTenants() {
      if (!token) return
      try {
        const loaded = await getManagedTenants(token)
        setTenants(loaded)
      } catch {
        // optional
      }
    }
    void loadTenants()
  }, [token])

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
    if (!month) return
    if (showTenantSelect && !selectedTenantId) {
      setIsLoading(false)
      setData(null)
      setError('')
      return
    }
    try {
      setIsLoading(true)
      setError('')
      const loaded = await getCashClosingMonthly({
        month,
        tenantId: selectedTenantId,
      })
      setData(loaded)
      setNote('')
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Monatsabschluss konnte nicht geladen werden')
      setData(null)
    } finally {
      setIsLoading(false)
    }
  }

  useEffect(() => {
    void loadData()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [month, tenantId, role, sessionReady])

  async function submitMonthly() {
    if (!data?.canSubmit) return
    const firstConfirm = window.confirm('Monatsabschluss wirklich einreichen?')
    if (!firstConfirm) return
    const secondConfirm = window.confirm('Zweite Bestaetigung: Monatsabschluss jetzt final einreichen?')
    if (!secondConfirm) return

    try {
      setIsSaving(true)
      setError('')
      setSuccess('')
      await submitCashClosingMonthly({
        month,
        tenantId: selectedTenantId,
        note: note || null,
        dayCount: data.days.length,
        totals: data.totals,
      })
      setSuccess('Monatsabschluss eingereicht.')
      await loadData()
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Monatsabschluss konnte nicht eingereicht werden')
    } finally {
      setIsSaving(false)
    }
  }

  return (
    <AdminLayout
      title="Monatsabschluss"
      subtitle="Monatsuebersicht pruefen und den Abschluss zur Freigabe einreichen"
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
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Monat</span>
            <input type="month" value={month} onChange={(event) => setMonth(event.target.value)} className="input-ui" />
          </label>
          <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Status</p>
            <p className="mt-1 text-sm font-semibold text-[var(--brand-ink)]">{data?.status || '-'}</p>
          </div>
        </div>
      </section>

      {isLoading ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/70">Lade Monatsabschluss...</p>
        </section>
      ) : data ? (
        <div className="grid gap-5">
          <section className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Bestellungen</p>
              <p className="mt-2 text-2xl font-bold text-[var(--brand-ink)]">{data.totals.orderCount}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Umsatz gesamt</p>
              <p className="mt-2 text-2xl font-bold text-emerald-700">{money(data.totals.grossTotal)}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Bar bezahlt</p>
              <p className="mt-2 text-2xl font-bold text-sky-700">{money(data.totals.paidCashTotal)}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Abschlusstage</p>
              <p className="mt-2 text-2xl font-bold text-orange-600">{data.days.length}</p>
            </article>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold text-[var(--brand-ink)]">Eingereichte Tagesabschluesse</h2>
            {data.days.length === 0 ? (
              <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                Keine Tagesabschluesse fuer diesen Monat vorhanden.
              </p>
            ) : (
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[760px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Tag</th>
                      <th className="th-ui">Einreichung</th>
                      <th className="th-ui">Status</th>
                      <th className="th-ui">Review</th>
                    </tr>
                  </thead>
                  <tbody>
                    {data.days.map((entry) => (
                      <tr key={entry.submissionId}>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.closingDate}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{new Date(entry.submittedAt).toLocaleString('de-DE')}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.status}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          {entry.review ? `${entry.review.decision || '-'} (${new Date(entry.review.createdAt).toLocaleString('de-DE')})` : '-'}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}

            <label className="mt-4 block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Monatsnotiz</span>
              <textarea value={note} onChange={(event) => setNote(event.target.value)} className="input-ui min-h-24" />
            </label>

            <div className="mt-5 flex flex-wrap gap-2">
              <button
                type="button"
                onClick={() => void submitMonthly()}
                disabled={isSaving || !data.canSubmit}
                className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:opacity-60"
              >
                Monatsabschluss einreichen
              </button>
            </div>
          </section>
        </div>
      ) : null}
    </AdminLayout>
  )
}
