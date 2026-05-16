'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  getAdminFinanceOverview,
  getBillingInvoices,
  getBillingMailboxMessages,
  getFinanceUsageCurrent,
  type AdminFinanceOverviewResponse,
  type BillingInvoice,
  type BillingMailboxMessage,
  type FinanceUsageCurrent,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function centsToEuro(cents: number) {
  return `${(Math.max(0, cents) / 100).toFixed(2)} €`
}

function formatDateTime(value: string) {
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) {
    return '-'
  }
  return parsed.toLocaleString('de-DE')
}

export default function AdminFinanzenPage() {
  const [token, setToken] = useState('')
  const [tenantId, setTenantId] = useState('')
  const [days, setDays] = useState(30)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [data, setData] = useState<AdminFinanceOverviewResponse | null>(null)
  const [invoices, setInvoices] = useState<BillingInvoice[]>([])
  const [mailboxMessages, setMailboxMessages] = useState<BillingMailboxMessage[]>([])
  const [usage, setUsage] = useState<FinanceUsageCurrent | null>(null)

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    const accessToken = parsed?.accessToken || localStorage.getItem('accessToken') || ''
    const resolvedTenantId =
      parsed?.activeTenantId ||
      parsed?.tenantId ||
      localStorage.getItem('tenantId') ||
      localStorage.getItem('klarando.defaultTenantId') ||
      ''
    setToken(accessToken)
    setTenantId(resolvedTenantId)
  }, [])

  useEffect(() => {
    if (!token || !tenantId) {
      return
    }
    let cancelled = false
    ;(async () => {
      try {
        setLoading(true)
        setError('')
        const response = await getAdminFinanceOverview(token, tenantId, days)
        const [invoiceRows, mailboxRows] = await Promise.all([
          getBillingInvoices(token, { tenantId }),
          getBillingMailboxMessages(token, { tenantId }),
        ])
        const usageRow = await getFinanceUsageCurrent(token, { tenantId })
        if (!cancelled) {
          setData(response)
          setInvoices(invoiceRows)
          setMailboxMessages(mailboxRows)
          setUsage(usageRow)
        }
      } catch (cause) {
        if (!cancelled) {
          setError(cause instanceof Error ? cause.message : 'Finanzdaten konnten nicht geladen werden')
        }
      } finally {
        if (!cancelled) {
          setLoading(false)
        }
      }
    })()

    return () => {
      cancelled = true
    }
  }, [token, tenantId, days])

  const paidCount = useMemo(
    () => data?.transactions.filter((entry) => entry.paymentStatus.toUpperCase() === 'PAID').length || 0,
    [data]
  )

  return (
    <AdminLayout title="Finanzen" subtitle="Zahlungen, Gebühren und Auszahlungsübersicht">
      <div className="space-y-5">
        {!tenantId ? (
          <section className="rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
            Bitte zuerst eine Filiale auswählen.
          </section>
        ) : null}

        {error ? (
          <section className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
            {error}
          </section>
        ) : null}

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
          <div className="flex flex-wrap items-end gap-3">
            <label className="text-sm">
              Zeitraum
              <select
                value={String(days)}
                onChange={(event) => setDays(Number(event.target.value))}
                className="ml-2 rounded-xl border border-slate-300 px-3 py-2 text-sm"
              >
                <option value="7">7 Tage</option>
                <option value="30">30 Tage</option>
                <option value="90">90 Tage</option>
                <option value="180">180 Tage</option>
              </select>
            </label>
          </div>
        </section>

        <section className="grid gap-3 md:grid-cols-2 xl:grid-cols-4">
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Brutto (bezahlt)</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">
              {centsToEuro(data?.summary.grossAmountCents || 0)}
            </p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Klarando-Gebühren</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">
              {centsToEuro(data?.summary.klarandoFeeCents || 0)}
            </p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Voraussichtliche Auszahlung</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">
              {centsToEuro(data?.summary.merchantPayoutAmountCents || 0)}
            </p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Bezahlte Transaktionen</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">{paidCount}</p>
          </article>
        </section>

        {usage ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Abo & Inklusivbestellungen</h3>
            <p className="mt-2 text-sm text-rose-900/80">{usage.infoMessage}</p>
            <p className="mt-1 text-sm text-rose-900/80">{usage.thresholdMessage}</p>
            <div className="mt-3 grid gap-3 md:grid-cols-4">
              <div className="rounded-xl bg-slate-50 px-3 py-2 text-sm">Monatsgebühr: <strong>{centsToEuro(usage.monthlyFeeCents)}</strong></div>
              <div className="rounded-xl bg-slate-50 px-3 py-2 text-sm">Provision: <strong>{usage.commissionPercentApplied.toFixed(2)} %</strong></div>
              <div className="rounded-xl bg-slate-50 px-3 py-2 text-sm">Fixbetrag: <strong>{centsToEuro(usage.fixedFeePerOrderCents)}</strong></div>
              <div className="rounded-xl bg-slate-50 px-3 py-2 text-sm">Voraussichtliche Monatsrechnung: <strong>{centsToEuro(usage.totalFeeGrossCents)}</strong></div>
            </div>
          </section>
        ) : null}

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Transaktionen</h3>
          {loading ? (
            <p className="mt-3 text-sm text-rose-900/70">Lade Transaktionen…</p>
          ) : (
            <div className="mt-3 overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                    <th className="px-2 py-2">Zeit</th>
                    <th className="px-2 py-2">Bestellnr.</th>
                    <th className="px-2 py-2">Zahlungsart</th>
                    <th className="px-2 py-2">Status</th>
                    <th className="px-2 py-2">Brutto</th>
                    <th className="px-2 py-2">Trinkgeld</th>
                    <th className="px-2 py-2">Gebühr</th>
                    <th className="px-2 py-2">Auszahlung</th>
                  </tr>
                </thead>
                <tbody>
                  {(data?.transactions || []).map((row) => (
                    <tr key={row.orderId} className="border-b border-slate-100">
                      <td className="px-2 py-2">{formatDateTime(row.createdAt)}</td>
                      <td className="px-2 py-2">{row.orderNumber ?? row.orderId.slice(0, 8)}</td>
                      <td className="px-2 py-2">{row.paymentMethod || '-'}</td>
                      <td className="px-2 py-2">{row.paymentStatus}</td>
                      <td className="px-2 py-2">{centsToEuro(row.grossAmountCents)}</td>
                      <td className="px-2 py-2">{centsToEuro(row.tipAmountCents)}</td>
                      <td className="px-2 py-2">{centsToEuro(row.klarandoFeeCents)}</td>
                      <td className="px-2 py-2">{centsToEuro(row.merchantPayoutAmountCents)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </section>

        <section className="grid gap-4 xl:grid-cols-2">
          <article className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Rechnungen</h3>
            <div className="mt-3 overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                    <th className="px-2 py-2">Rechnung</th>
                    <th className="px-2 py-2">Zeitraum</th>
                    <th className="px-2 py-2">Status</th>
                    <th className="px-2 py-2">Betrag</th>
                  </tr>
                </thead>
                <tbody>
                  {invoices.slice(0, 10).map((invoice) => (
                    <tr key={invoice.id} className="border-b border-slate-100">
                      <td className="px-2 py-2">{invoice.invoiceNumber}</td>
                      <td className="px-2 py-2">
                        {new Date(invoice.periodStart).toLocaleDateString('de-DE')} - {new Date(invoice.periodEnd).toLocaleDateString('de-DE')}
                      </td>
                      <td className="px-2 py-2">{invoice.status}</td>
                      <td className="px-2 py-2">{centsToEuro(invoice.totalGrossCents)}</td>
                    </tr>
                  ))}
                  {invoices.length === 0 ? (
                    <tr>
                      <td className="px-2 py-3 text-sm text-slate-500" colSpan={4}>
                        Noch keine Rechnungen vorhanden.
                      </td>
                    </tr>
                  ) : null}
                </tbody>
              </table>
            </div>
          </article>

          <article className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Postfach</h3>
            <div className="mt-3 space-y-2">
              {mailboxMessages.slice(0, 8).map((message) => (
                <div key={message.id} className="rounded-2xl border border-slate-200 px-3 py-2">
                  <p className="text-sm font-medium text-[var(--brand-ink)]">{message.title}</p>
                  <p className="mt-1 text-xs text-rose-900/70">{message.body}</p>
                  <p className="mt-1 text-[11px] text-slate-500">
                    {new Date(message.createdAt).toLocaleString('de-DE')} · {message.status || 'Info'}
                  </p>
                </div>
              ))}
              {mailboxMessages.length === 0 ? (
                <p className="text-sm text-slate-500">Keine Nachrichten im Postfach.</p>
              ) : null}
            </div>
          </article>
        </section>
      </div>
    </AdminLayout>
  )
}
