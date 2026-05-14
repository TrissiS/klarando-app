'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import { finalizeBillingRun, getBillingPreview, type BillingPreviewItem } from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function currentPeriodKey() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

function centsToEuro(value: number) {
  return `${(Math.max(0, value) / 100).toFixed(2)} €`
}

export default function SuperadminBillingPage() {
  const [token, setToken] = useState('')
  const [period, setPeriod] = useState(currentPeriodKey())
  const [preview, setPreview] = useState<BillingPreviewItem[]>([])
  const [loading, setLoading] = useState(false)
  const [finalizing, setFinalizing] = useState(false)
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

  async function loadPreview() {
    if (!token) return
    try {
      setLoading(true)
      setError('')
      const data = await getBillingPreview(token, period)
      setPreview(data.invoicesPreview)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rechnungsvorschau konnte nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadPreview()
  }, [token, period])

  const totals = useMemo(
    () =>
      preview.reduce(
        (acc, row) => {
          acc.invoices += 1
          acc.amountCents += row.estimatedTotalCents
          return acc
        },
        { invoices: 0, amountCents: 0 }
      ),
    [preview]
  )

  async function handleFinalize() {
    if (!token) return
    try {
      setFinalizing(true)
      setError('')
      const result = await finalizeBillingRun(token, period)
      setInfo(`Monatslauf finalisiert. ${result.invoicesCreated} Rechnungen erstellt.`)
      await loadPreview()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Monatslauf konnte nicht finalisiert werden')
    } finally {
      setFinalizing(false)
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Billing"
      subtitle="Monatsläufe, Rechnungsvorschau und Finalisierung"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-5">
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
        {info ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{info}</div> : null}

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
          <div className="flex flex-wrap items-end gap-3">
            <label className="text-sm">
              Monatslauf
              <input
                type="month"
                value={period}
                onChange={(event) => setPeriod(event.target.value)}
                className="ml-2 rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <button
              type="button"
              onClick={() => void loadPreview()}
              disabled={loading}
              className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-medium"
            >
              Vorschau laden
            </button>
            <button
              type="button"
              onClick={() => void handleFinalize()}
              disabled={finalizing || preview.length === 0}
              className="rounded-xl bg-[var(--brand-strong)] px-4 py-2 text-sm font-semibold text-white disabled:opacity-50"
            >
              Rechnungen finalisieren
            </button>
          </div>
        </section>

        <section className="grid gap-3 md:grid-cols-2">
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Rechnungen in Vorschau</p>
            <p className="mt-1 text-2xl font-semibold text-[var(--brand-ink)]">{totals.invoices}</p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Voraussichtliche Summe</p>
            <p className="mt-1 text-2xl font-semibold text-[var(--brand-ink)]">{centsToEuro(totals.amountCents)}</p>
          </article>
        </section>

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Rechnungsvorschau</h3>
          {loading ? <p className="mt-3 text-sm text-rose-900/70">Lade Vorschau…</p> : null}
          {!loading && preview.length === 0 ? (
            <p className="mt-3 text-sm text-rose-900/70">Keine aktiven Billing-Pläne gefunden.</p>
          ) : null}
          {!loading && preview.length > 0 ? (
            <div className="mt-3 overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                    <th className="px-2 py-2">Filiale</th>
                    <th className="px-2 py-2">Plan</th>
                    <th className="px-2 py-2">Monatsgebühr</th>
                    <th className="px-2 py-2">Provision %</th>
                    <th className="px-2 py-2">Summe (MVP)</th>
                    <th className="px-2 py-2">Status</th>
                  </tr>
                </thead>
                <tbody>
                  {preview.map((row) => (
                    <tr key={row.tenantId} className="border-b border-slate-100">
                      <td className="px-2 py-2">{row.tenantName}</td>
                      <td className="px-2 py-2">{row.planType}</td>
                      <td className="px-2 py-2">{centsToEuro(row.monthlyFeeCents)}</td>
                      <td className="px-2 py-2">{row.commissionPercent.toFixed(2)} %</td>
                      <td className="px-2 py-2">{centsToEuro(row.estimatedTotalCents)}</td>
                      <td className="px-2 py-2">{row.invoiceStatus}</td>
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
