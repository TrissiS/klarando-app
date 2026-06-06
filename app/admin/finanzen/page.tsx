'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createStripeAccountLink,
  createStripeConnectedAccount,
  createStripeDashboardLink,
  downloadBillingInvoicePdf,
  getAdminFinanceOverview,
  getBillingInvoices,
  getBillingMailboxMessages,
  getFinanceUsageCurrent,
  getStripeConnectStatus,
  markAllBillingMailboxMessagesRead,
  type AdminFinanceOverviewResponse,
  type BillingInvoice,
  type BillingMailboxMessage,
  type FinanceUsageCurrent,
  type TenantStripeConnectStatus,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function centsToEuro(cents: number) {
  return `${(Math.max(0, cents) / 100).toFixed(2)} €`
}

function formatDateTime(value: string | null | undefined) {
  if (!value) {
    return '—'
  }
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) {
    return '—'
  }
  return parsed.toLocaleString('de-DE')
}

function formatDate(value: string | null | undefined) {
  if (!value) {
    return '—'
  }
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) {
    return '—'
  }
  return parsed.toLocaleDateString('de-DE')
}

function formatStripeStatus(status: TenantStripeConnectStatus | null) {
  if (!status?.stripeAccountId) return 'Nicht verbunden'
  if (status.chargesEnabled && status.payoutsEnabled) return 'Vollständig eingerichtet'
  if (!status.detailsSubmitted || status.requirements.currentlyDue.length > 0) return 'KYC offen'
  if (status.chargesEnabled) return 'Zahlungen aktiv, Auszahlungen offen'
  return 'Verbunden, aber unvollständig'
}

function formatPayoutInterval(value: string | null | undefined) {
  switch ((value || '').toLowerCase()) {
    case 'daily':
      return 'Täglich'
    case 'weekly':
      return 'Wöchentlich'
    case 'monthly':
      return 'Monatlich'
    case 'manual':
      return 'Manuell'
    default:
      return '—'
  }
}

function getPrimaryOrderLabel(row: AdminFinanceOverviewResponse['transactions'][number]) {
  if (row.publicOrderCode) {
    return `Bestellung #${row.publicOrderCode}`
  }
  if (row.orderNumber !== null) {
    return `Bestellung #${row.orderNumber}`
  }
  return `Bestellung ${row.orderId.slice(0, 8)}`
}

function getStripeStatusTone(status: TenantStripeConnectStatus | null) {
  if (!status?.stripeAccountId) return 'border-red-200 bg-red-50 text-red-800'
  if (status.chargesEnabled && status.payoutsEnabled) return 'border-emerald-200 bg-emerald-50 text-emerald-800'
  if (!status.detailsSubmitted || status.requirements.currentlyDue.length > 0) {
    return 'border-amber-200 bg-amber-50 text-amber-800'
  }
  return 'border-orange-200 bg-orange-50 text-orange-800'
}

export default function AdminFinanzenPage() {
  const [token, setToken] = useState('')
  const [tenantId, setTenantId] = useState('')
  const [days, setDays] = useState(30)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [notice, setNotice] = useState('')
  const [data, setData] = useState<AdminFinanceOverviewResponse | null>(null)
  const [stripeStatus, setStripeStatus] = useState<TenantStripeConnectStatus | null>(null)
  const [stripeActionLoading, setStripeActionLoading] = useState<
    'none' | 'setup' | 'continue' | 'dashboard' | 'refresh'
  >('none')
  const [invoices, setInvoices] = useState<BillingInvoice[]>([])
  const [mailboxMessages, setMailboxMessages] = useState<BillingMailboxMessage[]>([])
  const [usage, setUsage] = useState<FinanceUsageCurrent | null>(null)
  const [pdfLoadingInvoiceId, setPdfLoadingInvoiceId] = useState('')

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
    if (typeof window !== 'undefined') {
      const params = new URLSearchParams(window.location.search)
      const stripeState = params.get('stripe')
      if (stripeState === 'return') {
        setNotice('Stripe-Onboarding abgeschlossen oder zu Klarando zurückgekehrt. Status wird aktualisiert.')
      }
      if (stripeState === 'refresh') {
        setNotice('Stripe benötigt weitere Angaben. Bitte den Status im Bereich Stripe Connect prüfen.')
      }
    }
  }, [])

  async function refreshStripeStatus(nextNotice?: string) {
    if (!token || !tenantId) {
      return
    }
    try {
      setStripeActionLoading('refresh')
      setError('')
      const refreshed = await getStripeConnectStatus(token, tenantId)
      setStripeStatus(refreshed)
      if (nextNotice) {
        setNotice(nextNotice)
      }
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Stripe-Status konnte nicht geladen werden')
    } finally {
      setStripeActionLoading('none')
    }
  }

  async function handleStartStripeSetup() {
    if (!token || !tenantId) return
    try {
      setStripeActionLoading('setup')
      setError('')
      const response = await createStripeConnectedAccount(token, tenantId)
      window.location.assign(response.onboardingUrl)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Stripe-Onboarding konnte nicht gestartet werden')
      setStripeActionLoading('none')
    }
  }

  async function handleContinueStripeSetup() {
    if (!token || !tenantId) return
    try {
      setStripeActionLoading('continue')
      setError('')
      const response = await createStripeAccountLink(token, tenantId)
      window.location.assign(response.onboardingUrl)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Stripe-Onboarding-Link konnte nicht erstellt werden')
      setStripeActionLoading('none')
    }
  }

  async function handleOpenStripeDashboard() {
    if (!token || !tenantId) return
    try {
      setStripeActionLoading('dashboard')
      setError('')
      const response = await createStripeDashboardLink(token, tenantId)
      window.open(response.dashboardUrl, '_blank', 'noopener,noreferrer')
      setNotice('Stripe Dashboard wurde in einem neuen Tab geöffnet.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Stripe-Dashboard-Link konnte nicht erstellt werden')
    } finally {
      setStripeActionLoading('none')
    }
  }

  useEffect(() => {
    if (!token || !tenantId) {
      return
    }
    let cancelled = false
    ;(async () => {
      try {
        setLoading(true)
        setError('')
        const [overview, invoiceRows, mailboxRows, usageRow, stripeRow] = await Promise.all([
          getAdminFinanceOverview(token, tenantId, days),
          getBillingInvoices(token, { tenantId }),
          getBillingMailboxMessages(token, { tenantId }),
          getFinanceUsageCurrent(token, { tenantId }),
          getStripeConnectStatus(token, tenantId),
        ])
        if (!cancelled) {
          setData(overview)
          setInvoices(invoiceRows)
          setMailboxMessages(mailboxRows)
          setUsage(usageRow)
          setStripeStatus(stripeRow)
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

  useEffect(() => {
    if (!token || !tenantId) return
    if (typeof window === 'undefined') return
    const section = new URLSearchParams(window.location.search).get('section')
    if (section !== 'postfach') return
    void (async () => {
      try {
        await markAllBillingMailboxMessagesRead(token, { tenantId })
        const mailboxRows = await getBillingMailboxMessages(token, { tenantId })
        setMailboxMessages(mailboxRows)
      } catch {
        // keep page usable even if read-state sync fails
      }
    })()
  }, [token, tenantId])

  async function handleOpenInvoicePdf(invoiceId: string) {
    if (!token) return
    try {
      setPdfLoadingInvoiceId(invoiceId)
      setError('')
      const { blob, fileName } = await downloadBillingInvoicePdf(token, invoiceId)
      const objectUrl = window.URL.createObjectURL(blob)
      const popup = window.open(objectUrl, '_blank', 'noopener,noreferrer')
      if (!popup) {
        const anchor = document.createElement('a')
        anchor.href = objectUrl
        anchor.download = fileName
        anchor.rel = 'noopener'
        anchor.click()
      }
      window.setTimeout(() => window.URL.revokeObjectURL(objectUrl), 60_000)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rechnungs-PDF konnte nicht geöffnet werden')
    } finally {
      setPdfLoadingInvoiceId('')
    }
  }

  const feeBreakdown = useMemo(() => {
    if (!usage) {
      return null
    }
    return {
      platformProvisionCents: usage.monthlyCommissionRevenueCents,
      stripeFeesCents: data?.summary.providerFeeCents || 0,
      baseFeeCents: usage.monthlyRevenueCents,
      moduleFeesCents: usage.monthlyModuleRevenueCents,
      additionalOrdersCents: usage.monthlyOrderRevenueCents,
      vatCents: usage.vatCents,
      totalCents: usage.totalFeeGrossCents,
    }
  }, [data?.summary.providerFeeCents, usage])

  return (
    <AdminLayout
      title="Abrechnung & Zahlungen"
      subtitle="Zentrale Finanzseite für Tarif, Stripe Connect, Umsatz, Gebühren und Monatsabrechnung."
    >
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

        {notice ? (
          <section className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">
            {notice}
          </section>
        ) : null}

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
          <div className="flex flex-wrap items-end justify-between gap-3">
            <div>
              <p className="text-xs uppercase tracking-wide text-rose-900/65">Zeitraum</p>
              <div className="mt-2 flex flex-wrap gap-2">
                {[7, 30, 90, 180].map((value) => (
                  <button
                    key={value}
                    type="button"
                    onClick={() => setDays(value)}
                    className={`rounded-xl px-3 py-2 text-sm font-medium ${
                      days === value
                        ? 'bg-slate-900 text-white'
                        : 'border border-slate-300 bg-white text-slate-700'
                    }`}
                  >
                    {value} Tage
                  </button>
                ))}
              </div>
            </div>
            <div className="text-sm text-slate-500">
              {data ? (
                <>
                  {formatDateTime(data.period.from)} bis {formatDateTime(data.period.to)}
                </>
              ) : (
                'Zeitraum wird geladen …'
              )}
            </div>
          </div>
        </section>

        <section className="grid gap-3 md:grid-cols-2 xl:grid-cols-4">
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Online-Umsatz</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">
              {centsToEuro(data?.summary.onlineRevenueCents || 0)}
            </p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Anzahl Bestellungen</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">
              {data?.summary.orderCount || 0}
            </p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Durchschnittlicher Bestellwert</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">
              {centsToEuro(data?.summary.averageOrderValueCents || 0)}
            </p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Voraussichtliche Auszahlung</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">
              {centsToEuro(data?.summary.merchantPayoutAmountCents || 0)}
            </p>
          </article>
        </section>

        <section className="grid gap-4 xl:grid-cols-[1.1fr_0.9fr]">
          <article className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Aktiver Tarif</h3>
            <div className="mt-3 grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Grundgebühr</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {centsToEuro(data?.activeTariff.monthlyFeeCents || 0)}
                </p>
              </div>
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Inklusivbestellungen</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {data?.activeTariff.includedOrders ?? 0}
                </p>
              </div>
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Zusatzbestellungen</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {usage?.additionalOrders ?? 0} · {centsToEuro(data?.activeTariff.fixedFeePerOrderCents || 0)}
                </p>
              </div>
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Plattformprovision</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {(data?.activeTariff.commissionPercent || 0).toFixed(2)} %
                </p>
              </div>
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Zahlungsziel</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {data?.activeTariff.paymentTermsDays ? `${data.activeTariff.paymentTermsDays} Tage` : '—'}
                </p>
              </div>
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Aktiv seit</p>
                <p className="mt-1 font-semibold text-slate-900">{formatDate(data?.activeTariff.activeFrom)}</p>
              </div>
            </div>
            {usage ? (
              <div className="mt-4 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 text-sm text-slate-700">
                <p>{usage.infoMessage}</p>
                <p className="mt-1">{usage.thresholdMessage}</p>
              </div>
            ) : null}
          </article>

          <article
            id="stripe-connect"
            className={`rounded-3xl border p-4 ${getStripeStatusTone(stripeStatus)}`}
          >
            <h3 className="text-sm font-semibold">Stripe Connect</h3>
            <div className="mt-3 grid gap-3 sm:grid-cols-2">
              <div className="rounded-2xl bg-white/70 px-4 py-3 text-sm">
                <p className="text-current/70">Status</p>
                <p className="mt-1 font-semibold">{formatStripeStatus(stripeStatus)}</p>
              </div>
              <div className="rounded-2xl bg-white/70 px-4 py-3 text-sm">
                <p className="text-current/70">Stripe Account</p>
                <p className="mt-1 break-all font-semibold">{stripeStatus?.stripeAccountId || '—'}</p>
              </div>
              <div className="rounded-2xl bg-white/70 px-4 py-3 text-sm">
                <p className="text-current/70">Auszahlungen</p>
                <p className="mt-1 font-semibold">
                  {stripeStatus?.payoutsEnabled ? 'Aktiv' : 'Noch nicht aktiv'}
                </p>
              </div>
              <div className="rounded-2xl bg-white/70 px-4 py-3 text-sm">
                <p className="text-current/70">Auszahlungsintervall</p>
                <p className="mt-1 font-semibold">{formatPayoutInterval(stripeStatus?.payoutInterval)}</p>
              </div>
              <div className="rounded-2xl bg-white/70 px-4 py-3 text-sm sm:col-span-2">
                <p className="text-current/70">Nächste Auszahlung</p>
                <p className="mt-1 font-semibold">{formatDateTime(stripeStatus?.nextPayoutAt)}</p>
              </div>
            </div>
            {stripeStatus?.requirements.currentlyDue.length ? (
              <p className="mt-3 text-sm">
                Offene KYC-Felder: {stripeStatus.requirements.currentlyDue.join(', ')}
              </p>
            ) : null}
            <div className="mt-4 space-y-3">
              {stripeStatus?.mode !== 'live' ? (
                <div className="rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
                  Testmodus aktiv: Stripe läuft derzeit im Testbetrieb. Es werden keine echten Live-Zahlungen
                  verarbeitet.
                </div>
              ) : null}
              {!stripeStatus?.publishableKeyConfigured ? (
                <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
                  Der öffentliche Stripe-Key ist noch nicht konfiguriert. Checkout-Clients können aktuell keine
                  Stripe-Zahlung initialisieren.
                </div>
              ) : null}
              <div className="flex flex-wrap gap-2">
                <button
                  type="button"
                  onClick={() => void handleStartStripeSetup()}
                  disabled={stripeActionLoading !== 'none'}
                  className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
                >
                  {stripeStatus?.stripeAccountId ? 'Stripe-Konto erneut verbinden' : 'Stripe einrichten'}
                </button>
                {stripeStatus?.stripeAccountId && !stripeStatus.onboardingCompleted ? (
                  <button
                    type="button"
                    onClick={() => void handleContinueStripeSetup()}
                    disabled={stripeActionLoading !== 'none'}
                    className="rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-800 transition hover:border-slate-400 disabled:cursor-not-allowed disabled:opacity-60"
                  >
                    Onboarding fortsetzen
                  </button>
                ) : null}
                <button
                  type="button"
                  onClick={() =>
                    void refreshStripeStatus('Stripe-Status wurde direkt bei Stripe aktualisiert.')
                  }
                  disabled={stripeActionLoading !== 'none'}
                  className="rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-800 transition hover:border-slate-400 disabled:cursor-not-allowed disabled:opacity-60"
                >
                  {stripeActionLoading === 'refresh' ? 'Aktualisiert…' : 'Status aktualisieren'}
                </button>
                {stripeStatus?.stripeAccountId ? (
                  <button
                    type="button"
                    onClick={() => void handleOpenStripeDashboard()}
                    disabled={stripeActionLoading !== 'none'}
                    className="rounded-xl border border-emerald-300 bg-emerald-50 px-4 py-2 text-sm font-semibold text-emerald-900 transition hover:border-emerald-400 disabled:cursor-not-allowed disabled:opacity-60"
                  >
                    Stripe Dashboard öffnen
                  </button>
                ) : null}
              </div>
            </div>
          </article>
        </section>

        <section className="grid gap-4 xl:grid-cols-[0.95fr_1.05fr]">
          <article className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Gebührenaufschlüsselung</h3>
            <div className="mt-3 grid gap-3 md:grid-cols-2">
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Plattformprovision</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {centsToEuro(feeBreakdown?.platformProvisionCents || 0)}
                </p>
              </div>
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Stripe Gebühren</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {centsToEuro(feeBreakdown?.stripeFeesCents || 0)}
                </p>
              </div>
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Grundgebühr</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {centsToEuro(feeBreakdown?.baseFeeCents || 0)}
                </p>
              </div>
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Modulgebühren</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {centsToEuro(feeBreakdown?.moduleFeesCents || 0)}
                </p>
              </div>
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">Zusatzbestellungen</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {centsToEuro(feeBreakdown?.additionalOrdersCents || 0)}
                </p>
              </div>
              <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm">
                <p className="text-slate-500">MwSt.</p>
                <p className="mt-1 font-semibold text-slate-900">
                  {centsToEuro(feeBreakdown?.vatCents || 0)}
                </p>
              </div>
              <div className="rounded-2xl border border-slate-200 bg-slate-900 px-4 py-3 text-sm text-white md:col-span-2">
                <p className="text-white/70">Gesamtsumme</p>
                <p className="mt-1 text-lg font-semibold">{centsToEuro(feeBreakdown?.totalCents || 0)}</p>
              </div>
            </div>
          </article>

          <article className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold text-[var(--brand-ink)]">
              Bestellungsbezogene Zahlungsübersicht
            </h3>
            {loading ? (
              <p className="mt-3 text-sm text-rose-900/70">Zahlungsübersicht wird geladen…</p>
            ) : (
              <div className="mt-3 overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead>
                    <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                      <th className="px-2 py-2">Bestellung</th>
                      <th className="px-2 py-2">Umsatz</th>
                      <th className="px-2 py-2">Stripe Fee</th>
                      <th className="px-2 py-2">Klarando Fee</th>
                      <th className="px-2 py-2">Auszahlung</th>
                    </tr>
                  </thead>
                  <tbody>
                    {(data?.transactions || []).map((row) => (
                      <tr key={row.orderId} className="border-b border-slate-100 align-top">
                        <td className="px-2 py-2">
                          <p className="font-medium text-slate-900">{getPrimaryOrderLabel(row)}</p>
                          <p className="text-xs text-slate-500">
                            {formatDateTime(row.createdAt)} · {row.paymentMethod || '—'} · {row.paymentStatus}
                          </p>
                        </td>
                        <td className="px-2 py-2">{centsToEuro(row.grossAmountCents)}</td>
                        <td className="px-2 py-2">{centsToEuro(row.providerFeeCents)}</td>
                        <td className="px-2 py-2">{centsToEuro(row.klarandoFeeCents)}</td>
                        <td className="px-2 py-2">{centsToEuro(row.merchantPayoutAmountCents)}</td>
                      </tr>
                    ))}
                    {(data?.transactions || []).length === 0 ? (
                      <tr>
                        <td className="px-2 py-3 text-sm text-slate-500" colSpan={5}>
                          Noch keine zahlungsrelevanten Bestellungen im gewählten Zeitraum.
                        </td>
                      </tr>
                    ) : null}
                  </tbody>
                </table>
              </div>
            )}
          </article>
        </section>

        <section className="grid gap-4 xl:grid-cols-2">
          <article className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Monatsabrechnung</h3>
            <p className="mt-1 text-sm text-slate-600">
              Finalisierte Rechnungen bleiben steuerlich nachvollziehbar abrufbar, inklusive PDF-Export und
              separat ausgewiesenen Gebühren.
            </p>
            <div className="mt-3 overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                    <th className="px-2 py-2">Rechnung</th>
                    <th className="px-2 py-2">Zeitraum</th>
                    <th className="px-2 py-2">Status</th>
                    <th className="px-2 py-2">Betrag</th>
                    <th className="px-2 py-2">Export</th>
                  </tr>
                </thead>
                <tbody>
                  {invoices
                    .filter((invoice) => invoice.status !== 'DRAFT')
                    .slice(0, 10)
                    .map((invoice) => (
                      <tr key={invoice.id} className="border-b border-slate-100">
                        <td className="px-2 py-2 font-medium text-slate-900">{invoice.invoiceNumber}</td>
                        <td className="px-2 py-2">
                          {formatDate(invoice.periodStart)} – {formatDate(invoice.periodEnd)}
                        </td>
                        <td className="px-2 py-2">{invoice.status}</td>
                        <td className="px-2 py-2">{centsToEuro(invoice.totalGrossCents)}</td>
                        <td className="px-2 py-2">
                          <button
                            type="button"
                            onClick={() => void handleOpenInvoicePdf(invoice.id)}
                            disabled={pdfLoadingInvoiceId === invoice.id}
                            className="rounded-lg border border-slate-300 px-3 py-2 text-xs font-semibold text-slate-700 transition hover:border-[var(--brand-strong)] hover:text-[var(--brand-strong)] disabled:cursor-not-allowed disabled:opacity-50"
                          >
                            {pdfLoadingInvoiceId === invoice.id ? 'Öffnet…' : 'PDF Export'}
                          </button>
                        </td>
                      </tr>
                    ))}
                  {invoices.filter((invoice) => invoice.status !== 'DRAFT').length === 0 ? (
                    <tr>
                      <td className="px-2 py-3 text-sm text-slate-500" colSpan={5}>
                        Noch keine finalisierten Monatsabrechnungen vorhanden.
                      </td>
                    </tr>
                  ) : null}
                </tbody>
              </table>
            </div>
          </article>

          <article id="postfach" className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Abrechnungspostfach</h3>
            <div className="mt-3 space-y-2">
              {mailboxMessages.slice(0, 8).map((message) => (
                <div key={message.id} className="rounded-2xl border border-slate-200 px-3 py-2">
                  <p className="text-sm font-medium text-[var(--brand-ink)]">{message.title}</p>
                  <p className="mt-1 text-xs text-rose-900/70">{message.body}</p>
                  <p className="mt-1 text-[11px] text-slate-500">
                    {formatDateTime(message.createdAt)} · {message.readAt ? 'Gelesen' : 'Ungelesen'} ·{' '}
                    {message.status || 'Info'}
                  </p>
                  {message.invoiceId ? (
                    <button
                      type="button"
                      onClick={() => void handleOpenInvoicePdf(message.invoiceId!)}
                      disabled={pdfLoadingInvoiceId === message.invoiceId}
                      className="mt-2 rounded-lg border border-slate-300 px-3 py-2 text-xs font-semibold text-slate-700 transition hover:border-[var(--brand-strong)] hover:text-[var(--brand-strong)] disabled:cursor-not-allowed disabled:opacity-50"
                    >
                      {pdfLoadingInvoiceId === message.invoiceId ? 'Öffnet…' : 'PDF öffnen'}
                    </button>
                  ) : null}
                </div>
              ))}
              {mailboxMessages.length === 0 ? (
                <p className="text-sm text-slate-500">Keine Nachrichten im Abrechnungspostfach.</p>
              ) : null}
            </div>
          </article>
        </section>
      </div>
    </AdminLayout>
  )
}
