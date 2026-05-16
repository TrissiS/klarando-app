'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { CHAINADMIN_NAV_ITEMS } from '@/app/chainadmin/nav'
import { getChainFinanceInvoices, getChainFinanceUsageCurrent, type BillingInvoice, type ChainFinanceUsageCurrent } from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function centsToEuro(value: number) {
  return `${(Math.max(0, value) / 100).toFixed(2)} €`
}

function currentMonth() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

export default function ChainadminFinanzenPage() {
  const [token, setToken] = useState('')
  const [month, setMonth] = useState(currentMonth())
  const [usage, setUsage] = useState<ChainFinanceUsageCurrent | null>(null)
  const [invoices, setInvoices] = useState<BillingInvoice[]>([])
  const [error, setError] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || (parsed.role !== 'chainadmin' && parsed.role !== 'superadmin')) {
      window.location.href = '/chainadmin'
      return
    }
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    if (!token) return
    ;(async () => {
      try {
        setError('')
        const [usageResult, invoiceResult] = await Promise.all([
          getChainFinanceUsageCurrent(token, { month }),
          getChainFinanceInvoices(token),
        ])
        setUsage(usageResult)
        setInvoices(invoiceResult)
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Chain-Finanzdaten konnten nicht geladen werden')
      }
    })()
  }, [token, month])

  return (
    <BackofficeLayout brand="Chainadmin" title="Chain-Finanzen" subtitle="Abrechnung und Rechnungen je Filiale" navItems={CHAINADMIN_NAV_ITEMS}>
      <div className="space-y-4">
        {error ? <div className="rounded-xl border border-red-200 bg-red-50 px-3 py-2 text-sm text-red-700">{error}</div> : null}
        <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
          <label className="text-sm">
            Monat
            <input type="month" value={month} onChange={(event) => setMonth(event.target.value)} className="ml-2 rounded-xl border border-slate-300 px-3 py-2 text-sm" />
          </label>
        </section>

        <section className="grid gap-3 md:grid-cols-4">
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Plattformumsatz netto</p><p className="mt-1 text-xl font-semibold">{centsToEuro(usage?.summary.platformRevenueNetCents || 0)}</p></article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Klarando-Marge</p><p className="mt-1 text-xl font-semibold">{centsToEuro(usage?.summary.estimatedMarginNetCents || 0)}</p></article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Offene Rechnungen</p><p className="mt-1 text-xl font-semibold">{usage?.summary.openInvoices || 0}</p></article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Kostenpflichtige Filialen</p><p className="mt-1 text-xl font-semibold">{usage?.summary.chargeableTenants || 0}</p></article>
        </section>

        <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
          <h3 className="text-sm font-semibold">Filialübersicht</h3>
          <div className="mt-3 overflow-x-auto">
            <table className="min-w-full text-sm">
              <thead>
                <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                  <th className="px-2 py-2">Filiale</th>
                  <th className="px-2 py-2">Bestellungen</th>
                  <th className="px-2 py-2">Inklusive</th>
                  <th className="px-2 py-2">Zusatz</th>
                  <th className="px-2 py-2">Voraussichtliche Rechnung</th>
                </tr>
              </thead>
              <tbody>
                {(usage?.rows || []).map((row) => (
                  <tr key={row.tenantId} className="border-b border-slate-100">
                    <td className="px-2 py-2">{row.tenantName}</td>
                    <td className="px-2 py-2">{row.ordersCounted}</td>
                    <td className="px-2 py-2">{row.includedOrders}</td>
                    <td className="px-2 py-2">{row.extraOrders}</td>
                    <td className="px-2 py-2">{centsToEuro(row.totalFeeGrossCents)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </section>

        <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
          <h3 className="text-sm font-semibold">Rechnungsarchiv</h3>
          <div className="mt-3 overflow-x-auto">
            <table className="min-w-full text-sm">
              <thead>
                <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                  <th className="px-2 py-2">Rechnung</th>
                  <th className="px-2 py-2">Filiale</th>
                  <th className="px-2 py-2">Status</th>
                  <th className="px-2 py-2">Betrag</th>
                </tr>
              </thead>
              <tbody>
                {invoices.slice(0, 25).map((invoice) => (
                  <tr key={invoice.id} className="border-b border-slate-100">
                    <td className="px-2 py-2">{invoice.invoiceNumber}</td>
                    <td className="px-2 py-2">{invoice.tenant?.name || '-'}</td>
                    <td className="px-2 py-2">{invoice.status}</td>
                    <td className="px-2 py-2">{centsToEuro(invoice.totalGrossCents)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </BackofficeLayout>
  )
}
