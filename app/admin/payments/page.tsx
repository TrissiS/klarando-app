'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createStripeAccountLink,
  createStripeConnectedAccount,
  getStoredAccessToken,
  getStoredTenantId,
  getStripeConnectStatus,
  type TenantStripeConnectStatus,
} from '@/lib/api'

export default function AdminPaymentsPage() {
  const [tenantId, setTenantId] = useState<string | null>(null)
  const [token, setToken] = useState<string | null>(null)
  const [status, setStatus] = useState<TenantStripeConnectStatus | null>(null)
  const [loading, setLoading] = useState(false)
  const [actionLoading, setActionLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [notice, setNotice] = useState<string | null>(null)

  useEffect(() => {
    setTenantId(getStoredTenantId())
    setToken(getStoredAccessToken())
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
      setNotice('Stripe-Onboarding wurde geöffnet. Bitte Verifizierung vollständig abschließen.')
      if (typeof window !== 'undefined') {
        window.open(response.onboardingUrl, '_blank', 'noopener,noreferrer')
      }
      await loadStatus()
    } catch (connectError) {
      setError(connectError instanceof Error ? connectError.message : 'Stripe-Onboarding konnte nicht gestartet werden')
    } finally {
      setActionLoading(false)
    }
  }

  async function handleOpenAccountLink() {
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
        window.open(response.onboardingUrl, '_blank', 'noopener,noreferrer')
      }
      setNotice('Stripe-Account-Link wurde geöffnet.')
      await loadStatus()
    } catch (linkError) {
      setError(linkError instanceof Error ? linkError.message : 'Stripe-Account-Link konnte nicht geöffnet werden')
    } finally {
      setActionLoading(false)
    }
  }

  const stateLabel = useMemo(() => {
    if (!status?.stripeAccountId) {
      return 'Zahlungen nicht eingerichtet'
    }
    if (!status.detailsSubmitted) {
      return 'Verifizierung offen'
    }
    if (status.chargesEnabled && status.payoutsEnabled) {
      return 'Zahlungen aktiv'
    }
    return 'Onboarding läuft'
  }, [status])

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
            <div className="rounded-xl border border-rose-100 bg-rose-50 p-3">
              <p className="text-xs uppercase tracking-wide text-rose-900/60">Status</p>
              <p className="mt-1 text-sm font-semibold text-rose-900">{stateLabel}</p>
            </div>
            <div className="rounded-xl border border-rose-100 bg-rose-50 p-3">
              <p className="text-xs uppercase tracking-wide text-rose-900/60">Filiale</p>
              <p className="mt-1 text-sm font-semibold text-rose-900">{tenantId || 'Nicht ausgewählt'}</p>
            </div>
            <div className="rounded-xl border border-rose-100 bg-rose-50 p-3">
              <p className="text-xs uppercase tracking-wide text-rose-900/60">Stripe Account</p>
              <p className="mt-1 break-all text-sm font-semibold text-rose-900">
                {status?.stripeAccountId || 'Noch nicht verbunden'}
              </p>
            </div>
            <div className="rounded-xl border border-rose-100 bg-rose-50 p-3">
              <p className="text-xs uppercase tracking-wide text-rose-900/60">Auszahlungen</p>
              <p className="mt-1 text-sm font-semibold text-rose-900">
                {status?.payoutsEnabled ? 'Aktiv' : 'Noch nicht aktiv'}
              </p>
            </div>
          </div>

          <div className="mt-5 flex flex-wrap gap-2">
            <button
              type="button"
              onClick={handleConnect}
              disabled={actionLoading}
              className="rounded-xl bg-rose-600 px-4 py-2 text-sm font-semibold text-white disabled:opacity-60"
            >
              Stripe-Konto verbinden
            </button>
            <button
              type="button"
              onClick={handleOpenAccountLink}
              disabled={actionLoading || !status?.stripeAccountId}
              className="rounded-xl border border-rose-300 bg-white px-4 py-2 text-sm font-semibold text-rose-900 disabled:opacity-60"
            >
              Onboarding fortsetzen
            </button>
            <button
              type="button"
              onClick={() => void loadStatus()}
              disabled={loading || actionLoading}
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
