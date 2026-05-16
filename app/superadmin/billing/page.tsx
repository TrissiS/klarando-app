'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createBillingRun,
  createBillingRunPreview,
  getBillingSummary,
  getBillingTenants,
  type BillingSummaryResponse,
  type BillingTenantRow,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function currentMonth() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

function centsToEuro(value: number) {
  return `${(Math.max(0, value) / 100).toFixed(2)} €`
}

function statusLabel(value: string) {
  const map: Record<string, string> = {
    WITHIN_INCLUDED: 'Innerhalb Kontingent',
    NEAR_INCLUDED_LIMIT: 'Kontingent fast verbraucht',
    CHARGEABLE: 'Kostenpflichtig',
    INVOICE_OPEN: 'Rechnung offen',
    INVOICE_PAID: 'Bezahlt',
  }
  return map[value] || value
}

export default function SuperadminBillingPage() {
  const [token, setToken] = useState('')
  const [month, setMonth] = useState(currentMonth())
  const [tenantFilter, setTenantFilter] = useState('')
  const [statusFilter, setStatusFilter] = useState('')
  const [summary, setSummary] = useState<BillingSummaryResponse | null>(null)
  const [rows, setRows] = useState<BillingTenantRow[]>([])
  const [warnings, setWarnings] = useState<Array<{ tenantId: string; message: string }>>([])
  const [loading, setLoading] = useState(false)
  const [previewLoading, setPreviewLoading] = useState(false)
  const [creatingRun, setCreatingRun] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/superadmin'
      return
    }
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  async function loadOverview() {
    if (!token) return
    try {
      setLoading(true)
      setError('')
      const [summaryResult, tenantResult] = await Promise.all([
        getBillingSummary(token, { month, tenantId: tenantFilter || undefined }),
        getBillingTenants(token, { month, tenantId: tenantFilter || undefined, status: statusFilter || undefined }),
      ])
      setSummary(summaryResult)
      setRows(tenantResult.rows)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Abrechnung konnte nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadOverview()
  }, [token, month, tenantFilter, statusFilter])

  async function handlePreview() {
    if (!token) return
    try {
      setPreviewLoading(true)
      setInfo('')
      const result = await createBillingRunPreview(token, { month, tenantId: tenantFilter || undefined })
      setWarnings(result.warnings)
      setInfo(`Vorschau aktualisiert: ${result.rows.length} Betriebe geprüft.`)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Vorschau konnte nicht erzeugt werden')
    } finally {
      setPreviewLoading(false)
    }
  }

  async function handleCreateRun() {
    if (!token) return
    try {
      setCreatingRun(true)
      setError('')
      const result = await createBillingRun(token, { month })
      setInfo(`Monatsabrechnung erstellt. ${result.invoicesCreated} Rechnungsentwürfe wurden erzeugt.`)
      await loadOverview()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Monatsabrechnung konnte nicht erstellt werden')
    } finally {
      setCreatingRun(false)
    }
  }

  const cards = useMemo(() => {
    const fallback = {
      tenants: 0,
      platformRevenueNetCents: 0,
      platformRevenueGrossCents: 0,
      estimatedMarginNetCents: 0,
      openInvoices: 0,
      paidInvoices: 0,
      includedTenants: 0,
      chargeableTenants: 0,
    }
    return summary?.summary || fallback
  }, [summary])

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Abrechnung & Marge"
      subtitle="Inklusivbestellungen, Provisionen, Gebühren und Monatsabrechnung pro Tenant"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-5">
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
        {info ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{info}</div> : null}

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
          <div className="flex flex-wrap items-end gap-3">
            <label className="text-sm">
              Monat
              <input type="month" value={month} onChange={(event) => setMonth(event.target.value)} className="ml-2 rounded-xl border border-slate-300 px-3 py-2 text-sm" />
            </label>
            <label className="text-sm">
              Tenant (optional)
              <input value={tenantFilter} onChange={(event) => setTenantFilter(event.target.value)} placeholder="tenantId" className="ml-2 rounded-xl border border-slate-300 px-3 py-2 text-sm" />
            </label>
            <label className="text-sm">
              Status
              <select value={statusFilter} onChange={(event) => setStatusFilter(event.target.value)} className="ml-2 rounded-xl border border-slate-300 px-3 py-2 text-sm">
                <option value="">Alle</option>
                <option value="WITHIN_INCLUDED">Innerhalb Kontingent</option>
                <option value="NEAR_INCLUDED_LIMIT">Kontingent fast verbraucht</option>
                <option value="CHARGEABLE">Kostenpflichtig</option>
                <option value="INVOICE_OPEN">Rechnung offen</option>
                <option value="INVOICE_PAID">Bezahlt</option>
              </select>
            </label>
            <button type="button" onClick={() => void handlePreview()} disabled={previewLoading} className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-medium">
              Vorschau erstellen
            </button>
            <button type="button" onClick={() => void handleCreateRun()} disabled={creatingRun} className="rounded-xl bg-[var(--brand-strong)] px-4 py-2 text-sm font-semibold text-white disabled:opacity-50">
              Monatsabrechnung erstellen
            </button>
          </div>
        </section>

        <section className="grid gap-3 md:grid-cols-2 xl:grid-cols-4">
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4"><p className="text-xs uppercase tracking-wide text-rose-900/70">Plattformumsatz netto</p><p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">{centsToEuro(cards.platformRevenueNetCents)}</p></article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4"><p className="text-xs uppercase tracking-wide text-rose-900/70">Klarando-Marge (MVP)</p><p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">{centsToEuro(cards.estimatedMarginNetCents)}</p></article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4"><p className="text-xs uppercase tracking-wide text-rose-900/70">Offene Rechnungen</p><p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">{cards.openInvoices}</p></article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4"><p className="text-xs uppercase tracking-wide text-rose-900/70">Kostenpflichtige Betriebe</p><p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">{cards.chargeableTenants}</p></article>
        </section>

        {warnings.length ? (
          <section className="rounded-3xl border border-amber-200 bg-amber-50 p-4">
            <h3 className="text-sm font-semibold text-amber-900">Warnungen zur Abrechnung</h3>
            <ul className="mt-2 list-disc space-y-1 pl-5 text-sm text-amber-900">
              {warnings.slice(0, 10).map((warning, index) => (
                <li key={`${warning.tenantId}-${index}`}>{warning.message}</li>
              ))}
            </ul>
          </section>
        ) : null}

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Tenant-Abrechnung</h3>
          {loading ? <p className="mt-3 text-sm text-rose-900/70">Lade Abrechnung…</p> : null}
          {!loading && rows.length === 0 ? <p className="mt-3 text-sm text-rose-900/70">Keine Daten im ausgewählten Zeitraum.</p> : null}
          {!loading && rows.length > 0 ? (
            <div className="mt-3 overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                    <th className="px-2 py-2">Lokal</th>
                    <th className="px-2 py-2">Paket</th>
                    <th className="px-2 py-2">Bestellungen</th>
                    <th className="px-2 py-2">Inklusive</th>
                    <th className="px-2 py-2">Zusatz</th>
                    <th className="px-2 py-2">Monatsumsatz</th>
                    <th className="px-2 py-2">Klarando-Gebühr</th>
                    <th className="px-2 py-2">Marge</th>
                    <th className="px-2 py-2">Status</th>
                  </tr>
                </thead>
                <tbody>
                  {rows.map((row) => (
                    <tr key={row.tenantId} className="border-b border-slate-100 align-top">
                      <td className="px-2 py-2">
                        <p className="font-medium text-[var(--brand-ink)]">{row.tenantName}</p>
                        <p className="text-xs text-slate-500">{row.chainName || 'Ohne Chain'}</p>
                      </td>
                      <td className="px-2 py-2">{row.planType}</td>
                      <td className="px-2 py-2">{row.ordersCounted}</td>
                      <td className="px-2 py-2">
                        {row.includedOrders} ({row.includedUsagePercent.toFixed(0)} %)
                      </td>
                      <td className="px-2 py-2">{row.extraOrders}</td>
                      <td className="px-2 py-2">{centsToEuro(row.countedRevenueCents)}</td>
                      <td className="px-2 py-2">{centsToEuro(row.totalFeeGrossCents)}</td>
                      <td className="px-2 py-2">{centsToEuro(row.marginNetCents)}</td>
                      <td className="px-2 py-2">
                        <span className="rounded-full bg-slate-100 px-2 py-1 text-xs font-medium text-slate-700">{statusLabel(row.status)}</span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          ) : null}
        </section>
      </div>
    </BackofficeLayout>
  )
}
