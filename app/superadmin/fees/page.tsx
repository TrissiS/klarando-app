'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createBillingRun,
  getBillingInvoices,
  getBillingSummary,
  getBillingTenants,
  type BillingInvoice,
  type BillingTenantRow,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type FeesTab = 'MODELS' | 'COMMISSIONS' | 'INCLUDED' | 'CLOSING' | 'INVOICES'

const TABS: Array<{ key: FeesTab; label: string }> = [
  { key: 'MODELS', label: 'Gebührenmodelle' },
  { key: 'COMMISSIONS', label: 'Provisionen' },
  { key: 'INCLUDED', label: 'Inklusivkontingente' },
  { key: 'CLOSING', label: 'Monatsabrechnung' },
  { key: 'INVOICES', label: 'Rechnungen' },
]

function currentMonth() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

function centsToEuro(value: number) {
  return `${(Math.max(0, value) / 100).toFixed(2)} €`
}

export default function SuperadminFeesPage() {
  const [token, setToken] = useState('')
  const [tab, setTab] = useState<FeesTab>('MODELS')
  const [month, setMonth] = useState(currentMonth())
  const [tenantRows, setTenantRows] = useState<BillingTenantRow[]>([])
  const [invoices, setInvoices] = useState<BillingInvoice[]>([])
  const [summary, setSummary] = useState<Awaited<ReturnType<typeof getBillingSummary>> | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    if (!token) return
    void (async () => {
      try {
        setLoading(true)
        const [summaryResult, rowsResult, invoiceRows] = await Promise.all([
          getBillingSummary(token, { month }),
          getBillingTenants(token, { month }),
          getBillingInvoices(token),
        ])
        setSummary(summaryResult)
        setTenantRows(rowsResult.rows)
        setInvoices(invoiceRows)
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Gebühren konnten nicht geladen werden')
      } finally {
        setLoading(false)
      }
    })()
  }, [token, month])

  const chargeableRows = useMemo(() => tenantRows.filter((row) => row.extraOrders > 0), [tenantRows])

  async function handleCreateClosing() {
    if (!token) return
    try {
      setLoading(true)
      setError('')
      const result = await createBillingRun(token, { month })
      setInfo(`Monatsabrechnung erstellt: ${result.invoicesCreated} Rechnungsentwürfe.`)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Monatsabrechnung konnte nicht erstellt werden')
    } finally {
      setLoading(false)
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Gebühren & Provisionen"
      subtitle="Abrechnung, Provisionen, Zusatzkosten und Marge klar getrennt von Modulfreigaben"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-4">
        {error ? <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-2 text-sm text-red-700">{error}</div> : null}
        {info ? <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-2 text-sm text-emerald-700">{info}</div> : null}

        <section className="rounded-2xl border bg-white p-4">
          <div className="flex flex-wrap items-end gap-3">
            <label className="text-sm">
              Monat
              <input type="month" value={month} onChange={(event) => setMonth(event.target.value)} className="ml-2 rounded-xl border px-3 py-2" />
            </label>
            <button type="button" onClick={() => void handleCreateClosing()} className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-medium text-white">
              Monatsabrechnung erstellen
            </button>
          </div>
          <div className="mt-3 grid gap-3 md:grid-cols-4">
            <Kpi label="Plattformumsatz Monat" value={centsToEuro(summary?.summary.platformRevenueGrossCents || 0)} />
            <Kpi label="Erwartete Klarando-Marge" value={centsToEuro(summary?.summary.estimatedMarginNetCents || 0)} />
            <Kpi label="Offene Rechnungen" value={summary?.summary.openInvoices || 0} />
            <Kpi label="Kostenpflichtige Betriebe" value={summary?.summary.chargeableTenants || 0} />
          </div>
          <div className="mt-4 flex flex-wrap gap-2">
            {TABS.map((entry) => (
              <button key={entry.key} type="button" onClick={() => setTab(entry.key)} className={`rounded-xl px-3 py-1.5 text-sm ${tab === entry.key ? 'bg-slate-900 text-white' : 'border bg-white'}`}>
                {entry.label}
              </button>
            ))}
          </div>
        </section>

        {tab === 'MODELS' ? (
          <section className="rounded-2xl border bg-white p-4">
            <h3 className="mb-3 text-sm font-semibold">Gebührenmodelle</h3>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {tenantRows.map((row) => (
                <article key={row.tenantId} className="rounded-xl border p-3">
                  <p className="font-semibold text-slate-900">{row.tenantName}</p>
                  <p className="mt-1 text-xs text-slate-600">Monatsgebühr: {centsToEuro(row.monthlyFeeCents)}</p>
                  <p className="text-xs text-slate-600">Preis pro weiterer Bestellung: {centsToEuro(row.fixedFeePerOrderCents)}</p>
                  <p className="text-xs text-slate-600">Zusatzkosten Display/OrderDesk/Fahrer-App: vorbereitet</p>
                  <div className="mt-2">
                    <button type="button" className="rounded-lg border px-2 py-1 text-xs">Gebühren speichern</button>
                  </div>
                </article>
              ))}
            </div>
          </section>
        ) : null}

        {tab === 'COMMISSIONS' ? (
          <section className="rounded-2xl border bg-white p-4">
            <h3 className="mb-3 text-sm font-semibold">Provisionen</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[760px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th>Filiale</th><th>Provision</th><th>Zusatzbestellungen</th><th>Provisionsbetrag</th></tr></thead>
                <tbody>
                  {tenantRows.map((row) => (
                    <tr key={row.tenantId} className="border-t">
                      <td className="py-2">{row.tenantName}</td>
                      <td>{row.commissionPercentApplied.toFixed(2)} %</td>
                      <td>{row.extraOrders}</td>
                      <td>{centsToEuro(row.commissionCents)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {tab === 'INCLUDED' ? (
          <section className="rounded-2xl border bg-white p-4">
            <h3 className="mb-3 text-sm font-semibold">Inklusivkontingente</h3>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {tenantRows.map((row) => (
                <article key={row.tenantId} className="rounded-xl border p-3">
                  <p className="font-semibold text-slate-900">{row.tenantName}</p>
                  <p className="mt-1 text-sm text-slate-700">{row.ordersCounted} von {row.includedOrders} verbraucht</p>
                  <div className="mt-2 h-2 w-full rounded-full bg-slate-200">
                    <div className="h-2 rounded-full bg-orange-500" style={{ width: `${Math.min(100, row.includedUsagePercent)}%` }} />
                  </div>
                  <p className="mt-1 text-xs text-slate-600">Zusatzbestellungen: {row.extraOrders}</p>
                </article>
              ))}
            </div>
          </section>
        ) : null}

        {tab === 'CLOSING' ? (
          <section className="rounded-2xl border bg-white p-4">
            <h3 className="mb-3 text-sm font-semibold">Monatsabrechnung</h3>
            <p className="text-sm text-slate-700">
              Monat {month}: {chargeableRows.length} Filialen haben kostenpflichtige Zusatzbestellungen.
            </p>
            <button type="button" onClick={() => void handleCreateClosing()} className="mt-3 rounded-xl bg-slate-900 px-4 py-2 text-sm font-medium text-white">
              Monatsabrechnung erstellen
            </button>
          </section>
        ) : null}

        {tab === 'INVOICES' ? (
          <section className="rounded-2xl border bg-white p-4">
            <h3 className="mb-3 text-sm font-semibold">Rechnungen</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[820px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th>Rechnung</th><th>Filiale</th><th>Status</th><th>Betrag</th><th>Zeitraum</th></tr></thead>
                <tbody>
                  {invoices.slice(0, 100).map((invoice) => (
                    <tr key={invoice.id} className="border-t">
                      <td className="py-2">{invoice.invoiceNumber}</td>
                      <td>{invoice.tenant?.name || '-'}</td>
                      <td>{invoice.status}</td>
                      <td>{centsToEuro(invoice.totalGrossCents)}</td>
                      <td>{new Date(invoice.periodStart).toLocaleDateString('de-DE')} – {new Date(invoice.periodEnd).toLocaleDateString('de-DE')}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {loading ? <p className="text-sm text-slate-600">Lade Daten…</p> : null}
      </div>
    </BackofficeLayout>
  )
}

function Kpi({ label, value }: { label: string; value: string | number }) {
  return (
    <article className="rounded-xl border p-3">
      <p className="text-xs text-slate-500">{label}</p>
      <p className="mt-1 text-xl font-semibold text-slate-900">{value}</p>
    </article>
  )
}
