'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createBillingRun,
  getAccessContext,
  getBillingInvoices,
  getBillingSummary,
  getBillingTenants,
  getTenantBillingConfig,
  updateTenantBillingConfig,
  type AccessContext,
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
  const [context, setContext] = useState<AccessContext | null>(null)
  const [selectedTenantId, setSelectedTenantId] = useState('')
  const [billingForm, setBillingForm] = useState<{
    monthlyFeeCents: number
    includedOrders: number
    commissionPercent: number
    fixedFeePerOrderCents: number
  } | null>(null)
  const [loading, setLoading] = useState(false)
  const [savingTenant, setSavingTenant] = useState(false)
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
        const [summaryResult, rowsResult, invoiceRows, loadedContext] = await Promise.all([
          getBillingSummary(token, { month }),
          getBillingTenants(token, { month }),
          getBillingInvoices(token),
          getAccessContext(token),
        ])
        setSummary(summaryResult)
        setTenantRows(rowsResult.rows)
        setInvoices(invoiceRows)
        setContext(loadedContext)
        if (!selectedTenantId && loadedContext.tenants[0]?.id) {
          setSelectedTenantId(loadedContext.tenants[0].id)
        }
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Gebühren konnten nicht geladen werden')
      } finally {
        setLoading(false)
      }
    })()
  }, [token, month, selectedTenantId])

  useEffect(() => {
    if (!token || !selectedTenantId) return
    void (async () => {
      try {
        const config = await getTenantBillingConfig(token, selectedTenantId)
        setBillingForm({
          monthlyFeeCents: config.plan.monthlyFeeCents,
          includedOrders: config.plan.includedOrders,
          commissionPercent: config.plan.commissionPercent,
          fixedFeePerOrderCents: config.plan.fixedFeePerOrderCents,
        })
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Filialprofil konnte nicht geladen werden')
      }
    })()
  }, [token, selectedTenantId])

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

  async function handleSaveTenantProfile() {
    if (!token || !selectedTenantId || !billingForm) return
    try {
      setSavingTenant(true)
      setError('')
      const result = await updateTenantBillingConfig(token, selectedTenantId, {
        monthlyFeeCents: Math.max(0, Math.round(billingForm.monthlyFeeCents)),
        includedOrders: Math.max(0, Math.round(billingForm.includedOrders)),
        commissionPercent: Math.max(0, billingForm.commissionPercent),
        fixedFeePerOrderCents: Math.max(0, Math.round(billingForm.fixedFeePerOrderCents)),
      })
      setInfo(`Abrechnungsprofil für ${context?.tenants.find((t) => t.id === selectedTenantId)?.name || 'Filiale'} gespeichert.`)
      setBillingForm({
        monthlyFeeCents: result.plan.monthlyFeeCents,
        includedOrders: result.plan.includedOrders,
        commissionPercent: result.plan.commissionPercent,
        fixedFeePerOrderCents: result.plan.fixedFeePerOrderCents,
      })
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Abrechnungsprofil konnte nicht gespeichert werden')
    } finally {
      setSavingTenant(false)
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Gebühren & Provisionen"
      subtitle="Abrechnung, Provisionen, Zusatzkosten und Marge klar getrennt von Modulfreigaben"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-5">
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 shadow-sm">{error}</div> : null}
        {info ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700 shadow-sm">{info}</div> : null}

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <div className="flex flex-wrap items-end gap-3">
            <label className="text-sm">
              Monat
              <input type="month" value={month} onChange={(event) => setMonth(event.target.value)} className="ml-2 rounded-xl border border-[var(--brand-border)] px-3 py-2.5" />
            </label>
            <button type="button" onClick={() => void handleCreateClosing()} className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white hover:bg-slate-800">
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
              <button key={entry.key} type="button" onClick={() => setTab(entry.key)} className={`rounded-xl px-3 py-2 text-sm font-medium transition ${tab === entry.key ? 'bg-slate-900 text-white shadow-sm' : 'border border-[var(--brand-border)] bg-white text-slate-700 hover:bg-slate-50'}`}>
                {entry.label}
              </button>
            ))}
          </div>
        </section>

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Zentrales Abrechnungsprofil je Filiale</h3>
          <p className="mt-1 text-xs text-slate-600">Hier legst du für jeden Betrieb explizit Gebühren, Provision, Inklusivbestellungen und Zahlungsziel fest.</p>
          <div className="mt-3 grid gap-3 md:grid-cols-3">
            <label className="block md:col-span-3">
              <span className="mb-1 block text-sm text-slate-700">Filiale</span>
              <select value={selectedTenantId} onChange={(e) => setSelectedTenantId(e.target.value)} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm">
                <option value="">Filiale wählen</option>
                {(context?.tenants || []).map((tenant) => <option key={tenant.id} value={tenant.id}>{tenant.name}</option>)}
              </select>
            </label>
            <BillingField label="Monatsgebühr (€)" value={billingForm ? billingForm.monthlyFeeCents / 100 : 0} onChange={(value) => setBillingForm((c) => (c ? { ...c, monthlyFeeCents: Math.round(value * 100) } : c))} />
            <BillingField label="Inklusivbestellungen" value={billingForm?.includedOrders || 0} onChange={(value) => setBillingForm((c) => (c ? { ...c, includedOrders: Math.round(value) } : c))} />
            <BillingField label="Provision (%)" value={billingForm?.commissionPercent || 0} onChange={(value) => setBillingForm((c) => (c ? { ...c, commissionPercent: value } : c))} />
            <BillingField label="Fixbetrag pro Zusatzorder (€)" value={billingForm ? billingForm.fixedFeePerOrderCents / 100 : 0} onChange={(value) => setBillingForm((c) => (c ? { ...c, fixedFeePerOrderCents: Math.round(value * 100) } : c))} />
          </div>
          <div className="mt-4 flex justify-end">
            <button type="button" onClick={() => void handleSaveTenantProfile()} disabled={!selectedTenantId || !billingForm || savingTenant} className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white hover:bg-slate-800 disabled:opacity-60">
              {savingTenant ? 'Speichert…' : 'Profil speichern'}
            </button>
          </div>
        </section>

        {tab === 'MODELS' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Gebührenmodelle</h3>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {tenantRows.map((row) => (
                <article key={row.tenantId} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/30 p-4">
                  <p className="font-semibold text-[var(--brand-ink)]">{row.tenantName}</p>
                  <p className="mt-1 text-xs text-slate-600">Monatsgebühr: {centsToEuro(row.monthlyFeeCents)}</p>
                  <p className="text-xs text-slate-600">Preis pro weiterer Bestellung: {centsToEuro(row.fixedFeePerOrderCents)}</p>
                  <p className="text-xs text-slate-600">Zusatzkosten Display/OrderDesk/Fahrer-App: vorbereitet</p>
                  <div className="mt-2">
                    <button type="button" className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-semibold text-white hover:bg-slate-800">Gebühren speichern</button>
                  </div>
                </article>
              ))}
            </div>
          </section>
        ) : null}

        {tab === 'COMMISSIONS' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Provisionen</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[760px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th className="py-2">Filiale</th><th className="py-2">Provision</th><th className="py-2">Zusatzbestellungen</th><th className="py-2">Provisionsbetrag</th></tr></thead>
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
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Inklusivkontingente</h3>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {tenantRows.map((row) => (
                <article key={row.tenantId} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/30 p-4">
                  <p className="font-semibold text-[var(--brand-ink)]">{row.tenantName}</p>
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
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Monatsabrechnung</h3>
            <p className="text-sm text-slate-700">
              Monat {month}: {chargeableRows.length} Filialen haben kostenpflichtige Zusatzbestellungen.
            </p>
            <button type="button" onClick={() => void handleCreateClosing()} className="mt-3 rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white hover:bg-slate-800">
              Monatsabrechnung erstellen
            </button>
          </section>
        ) : null}

        {tab === 'INVOICES' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Rechnungen</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[820px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th className="py-2">Rechnung</th><th className="py-2">Filiale</th><th className="py-2">Status</th><th className="py-2">Betrag</th><th className="py-2">Zeitraum</th></tr></thead>
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

function BillingField({
  label,
  value,
  onChange,
}: {
  label: string
  value: number
  onChange: (value: number) => void
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-sm text-slate-700">{label}</span>
      <input
        type="number"
        step="0.01"
        value={Number.isFinite(value) ? value : 0}
        onChange={(event) => onChange(Number(event.target.value))}
        className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
      />
    </label>
  )
}

function Kpi({ label, value }: { label: string; value: string | number }) {
  return (
    <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 p-3">
      <p className="text-xs text-slate-500">{label}</p>
      <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">{value}</p>
    </article>
  )
}
