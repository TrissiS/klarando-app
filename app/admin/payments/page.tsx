'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createStripeAccountLink,
  createStripeConnectedAccount,
  createStripeDashboardLink,
  getStoredAccessToken,
  getStoredTenantId,
  getStripeConnectStatus,
  type TenantStripeConnectStatus,
} from '@/lib/api'

const SUCCESS_CARD = 'border-[#36B37E] bg-[#E8F8EE] text-[#1F7A52]'
const DEFAULT_CARD = 'border-rose-100 bg-rose-50 text-rose-900'

function CheckCircleIcon({ success }: { success: boolean }) {
  if (success) {
    return (
      <span className="inline-flex h-8 w-8 items-center justify-center rounded-full border border-[#36B37E] bg-white text-[#1F7A52]">
        <svg viewBox="0 0 20 20" fill="currentColor" className="h-5 w-5" aria-hidden="true">
          <path
            fillRule="evenodd"
            d="M16.704 5.29a1 1 0 0 1 .006 1.414l-7.25 7.312a1 1 0 0 1-1.42-.002L4.3 10.25a1 1 0 1 1 1.4-1.428l3.03 2.97 6.562-6.617a1 1 0 0 1 1.412-.006Z"
            clipRule="evenodd"
          />
        </svg>
      </span>
    )
  }

  return (
    <span className="inline-flex h-8 w-8 items-center justify-center rounded-full border border-rose-200 bg-white text-rose-400">
      <svg viewBox="0 0 20 20" fill="none" className="h-5 w-5" aria-hidden="true">
        <circle cx="10" cy="10" r="6.5" stroke="currentColor" strokeWidth="1.5" />
      </svg>
    </span>
  )
}

function StatusCard({
  label,
  value,
  success,
}: {
  label: string
  value: string
  success: boolean
}) {
  return (
    <div className={`rounded-xl border p-4 ${success ? SUCCESS_CARD : DEFAULT_CARD}`}>
      <div className="flex items-start justify-between gap-3">
        <div>
          <p className="text-xs uppercase tracking-wide opacity-70">{label}</p>
          <p className="mt-1 text-sm font-semibold">{value}</p>
        </div>
        <CheckCircleIcon success={success} />
      </div>
    </div>
  )
}

export default function AdminPaymentsPage() {
  const [tenantId, setTenantId] = useState<string | null>(null)
  const [token, setToken] = useState<string | null>(null)
  const [status, setStatus] = useState<TenantStripeConnectStatus | null>(null)
  const [loading, setLoading] = useState(false)
  const [actionLoading, setActionLoading] = useState(false)
  const [dashboardLoading, setDashboardLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [notice, setNotice] = useState<string | null>(null)

  useEffect(() => {
    setTenantId(getStoredTenantId())
    setToken(getStoredAccessToken())
    if (typeof window !== 'undefined') {
      const params = new URLSearchParams(window.location.search)
      const stripeState = params.get('stripe')
      if (stripeState === 'return') {
        setNotice('Stripe-Onboarding abgeschlossen oder zu Klarando zurückgekehrt. Status wird geladen.')
      }
      if (stripeState === 'refresh') {
        setNotice('Stripe benötigt weitere Angaben. Bitte Onboarding fortsetzen.')
      }
    }
  }, [])

  async function loadStatus() {
    if (!token || !tenantId) {
      return
    }
    setLoading(true)
    setError(null)

    try {
      const next = await getStripeConnectStatus(token, tenantId)
      setStatus(next)
    } catch (loadError) {
      setStatus(null)
      setError(loadError instanceof Error ? loadError.message : 'Stripe-Status konnte nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadStatus()
  }, [token, tenantId])

  async function handleConnect() {
    if (!token || !tenantId) {
      setError('Bitte zuerst einloggen und eine Filiale auswählen.')
      return
    }

    setActionLoading(true)
    setError(null)
    setNotice(null)

    try {
      const response = await createStripeConnectedAccount(token, tenantId)
      setNotice('Stripe-Onboarding wurde gestartet. Nach Abschluss kehren Sie automatisch zu Klarando zurück.')
      if (typeof window !== 'undefined') {
        window.location.assign(response.onboardingUrl)
      }
    } catch (connectError) {
      setError(connectError instanceof Error ? connectError.message : 'Stripe-Onboarding konnte nicht gestartet werden')
    } finally {
      setActionLoading(false)
    }
  }

  async function handleReconnect() {
    if (!token || !tenantId) {
      setError('Bitte zuerst einloggen und eine Filiale auswählen.')
      return
    }

    setActionLoading(true)
    setError(null)
    setNotice(null)

    try {
      const response = await createStripeAccountLink(token, tenantId)
      if (typeof window !== 'undefined') {
        window.location.assign(response.onboardingUrl)
      }
      setNotice('Stripe-Onboarding wird fortgesetzt.')
    } catch (linkError) {
      setError(linkError instanceof Error ? linkError.message : 'Stripe-Onboarding-Link konnte nicht geöffnet werden')
    } finally {
      setActionLoading(false)
    }
  }

  async function handleOpenDashboard() {
    if (!token || !tenantId) {
      setError('Bitte zuerst einloggen und eine Filiale auswählen.')
      return
    }

    setDashboardLoading(true)
    setError(null)
    setNotice(null)

    try {
      const response = await createStripeDashboardLink(token, tenantId)
      if (typeof window !== 'undefined') {
        window.location.assign(response.dashboardUrl)
      }
    } catch (dashboardError) {
      setError(
        dashboardError instanceof Error ? dashboardError.message : 'Stripe-Dashboard konnte nicht geöffnet werden'
      )
    } finally {
      setDashboardLoading(false)
    }
  }

  const stateLabel = useMemo(() => {
    if (!status?.stripeAccountId) {
      return 'Zahlungen nicht eingerichtet'
    }
    if (status.chargesEnabled && status.payoutsEnabled) {
      return 'Stripe vollständig eingerichtet'
    }
    if (!status.detailsSubmitted || status.requirements.currentlyDue.length > 0) {
      return 'Verifizierung offen'
    }
    if (status.chargesEnabled && !status.payoutsEnabled) {
      return 'Verbunden, Auszahlungen noch nicht aktiv'
    }
    return 'Onboarding läuft'
  }, [status])

  const statusTone = useMemo(() => {
    if (!status?.stripeAccountId) {
      return 'border-red-200 bg-red-50 text-red-800'
    }
    if (status.chargesEnabled && status.payoutsEnabled) {
      return SUCCESS_CARD
    }
    if (!status.detailsSubmitted || status.requirements.currentlyDue.length > 0) {
      return 'border-amber-200 bg-amber-50 text-amber-800'
    }
    return 'border-orange-200 bg-orange-50 text-orange-800'
  }, [status])

  const hasConnectedAccount = Boolean(status?.stripeAccountId)
  const currentDueCount = status?.requirements.currentlyDue.length ?? 0
  const kycComplete = hasConnectedAccount && currentDueCount === 0

  return (
    <AdminLayout title="Zahlungen" subtitle="Stripe Connect Marketplace-Einrichtung für Ihre Filiale">
      <section className="grid gap-4 lg:grid-cols-3">
        <article className="rounded-2xl border border-rose-200 bg-white p-5 shadow-sm lg:col-span-2">
          <h2 className="text-lg font-semibold text-rose-950">Stripe Connect</h2>
          <p className="mt-2 text-sm text-rose-900/80">
            Zahlungen werden sicher über Stripe verarbeitet. Klarando behält die Plattformgebühr ein,
            der Rest wird automatisch an Ihr verbundenes Stripe-Konto ausgezahlt.
          </p>

          <div className="mt-4 grid gap-3 sm:grid-cols-2">
            <div className={`rounded-xl border p-4 ${statusTone}`}>
              <div className="flex items-start justify-between gap-3">
                <div>
                  <p className="text-xs uppercase tracking-wide opacity-70">Status</p>
                  <p className="mt-1 text-sm font-semibold">{stateLabel}</p>
                </div>
                <CheckCircleIcon success={Boolean(status?.chargesEnabled && status?.payoutsEnabled)} />
              </div>
            </div>

            <div className="rounded-xl border border-rose-100 bg-rose-50 p-4 text-rose-900">
              <p className="text-xs uppercase tracking-wide text-rose-900/60">Filiale</p>
              <p className="mt-1 text-sm font-semibold text-rose-900">{tenantId || 'Nicht ausgewählt'}</p>
            </div>

            <StatusCard
              label="Stripe Account"
              value={status?.stripeAccountId || 'Noch nicht verbunden'}
              success={hasConnectedAccount}
            />

            <StatusCard
              label="Auszahlungen"
              value={status?.payoutsEnabled ? 'Aktiv' : 'Noch nicht aktiv'}
              success={Boolean(status?.payoutsEnabled)}
            />

            <StatusCard
              label="Zahlungen"
              value={status?.chargesEnabled ? 'Aktiv' : 'Noch nicht aktiv'}
              success={Boolean(status?.chargesEnabled)}
            />
          </div>

          {status ? (
            kycComplete ? (
              <div className="mt-4 rounded-xl border border-[#36B37E] bg-[#E8F8EE] p-4 text-sm text-[#1F7A52]">
                <p className="font-semibold">KYC vollständig</p>
                <p className="mt-1">Es sind aktuell keine offenen Verifizierungsfelder bei Stripe vorhanden.</p>
                <p className="mt-1">
                  Letzte Synchronisierung:{' '}
                  {status.lastStatusSyncAt ? new Date(status.lastStatusSyncAt).toLocaleString('de-DE') : 'Noch nie'}
                </p>
              </div>
            ) : (
              <div className="mt-4 rounded-xl border border-rose-100 bg-rose-50 p-4 text-sm text-rose-900/80">
                <p>
                  Offene KYC-Felder:{' '}
                  {status.requirements.currentlyDue.length > 0
                    ? status.requirements.currentlyDue.join(', ')
                    : 'Keine'}
                </p>
                <p className="mt-1">
                  Später noch erforderlich:{' '}
                  {status.requirements.eventuallyDue.length > 0
                    ? status.requirements.eventuallyDue.join(', ')
                    : 'Keine'}
                </p>
                <p className="mt-1">
                  Letzte Synchronisierung:{' '}
                  {status.lastStatusSyncAt ? new Date(status.lastStatusSyncAt).toLocaleString('de-DE') : 'Noch nie'}
                </p>
              </div>
            )
          ) : null}

          <div className="mt-5 flex flex-wrap gap-2">
            {!hasConnectedAccount ? (
              <button
                type="button"
                onClick={handleConnect}
                disabled={actionLoading}
                className="rounded-xl bg-rose-600 px-4 py-2 text-sm font-semibold text-white disabled:opacity-60"
              >
                Stripe-Konto verbinden
              </button>
            ) : (
              <>
                <button
                  type="button"
                  onClick={handleReconnect}
                  disabled={actionLoading}
                  className="rounded-xl bg-rose-600 px-4 py-2 text-sm font-semibold text-white disabled:opacity-60"
                >
                  Stripe-Konto erneut verbinden
                </button>
                <button
                  type="button"
                  onClick={handleOpenDashboard}
                  disabled={dashboardLoading}
                  className="rounded-xl border border-[#36B37E] bg-[#E8F8EE] px-4 py-2 text-sm font-semibold text-[#1F7A52] disabled:opacity-60"
                >
                  Stripe Dashboard öffnen
                </button>
              </>
            )}

            <button
              type="button"
              onClick={() => void loadStatus()}
              disabled={loading || actionLoading || dashboardLoading}
              className="rounded-xl border border-rose-300 bg-white px-4 py-2 text-sm font-semibold text-rose-900 disabled:opacity-60"
            >
              Status aktualisieren
            </button>
          </div>

          {loading ? <p className="mt-4 text-sm text-rose-900/70">Stripe-Status wird geladen...</p> : null}
          {notice ? <p className="mt-4 rounded-xl bg-emerald-50 px-3 py-2 text-sm text-emerald-800">{notice}</p> : null}
          {error ? <p className="mt-4 rounded-xl bg-red-50 px-3 py-2 text-sm text-red-700">{error}</p> : null}
        </article>

        <aside className="rounded-2xl border border-rose-200 bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/70">MVP-Hinweise</h3>
          <ul className="mt-3 space-y-2 text-sm text-rose-900/80">
            <li>Plattformgebühren werden serverseitig berechnet.</li>
            <li>Stripe-KYC wird im Stripe-Onboarding erfasst.</li>
            <li>Keine Stripe-Secrets im Frontend oder in der App speichern.</li>
            <li>Webhook-Signaturen werden im Backend validiert.</li>
          </ul>
        </aside>
      </section>
    </AdminLayout>
  )
}
