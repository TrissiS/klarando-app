'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import { getStoredAccessToken, getSuperadminStripeTenantStatuses, type SuperadminStripeTenantStatusRow } from '@/lib/api'

export default function SuperadminPaymentsPage() {
  const [token, setToken] = useState('')
  const [rows, setRows] = useState<SuperadminStripeTenantStatusRow[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    const stored = getStoredAccessToken()
    if (!stored) {
      window.location.href = '/'
      return
    }
    setToken(stored)
  }, [])

  async function load() {
    if (!token) return
    setLoading(true)
    setError('')
    try {
      const data = await getSuperadminStripeTenantStatuses(token)
      setRows(data)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Stripe-Status konnte nicht geladen werden')
      setRows([])
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void load()
  }, [token])

  const counts = useMemo(() => {
    return rows.reduce(
      (acc, row) => {
        const cfg = row.paymentConfig
        if (!cfg?.stripeAccountId) {
          acc.notConnected += 1
          return acc
        }
        if (cfg.stripeChargesEnabled && cfg.stripePayoutsEnabled) {
          acc.active += 1
          return acc
        }
        acc.pending += 1
        return acc
      },
      { active: 0, pending: 0, notConnected: 0 }
    )
  }, [rows])

  return (
    <BackofficeLayout
      brand="superadmin"
      title="Stripe-Status je Filiale"
      subtitle="Superadmin-Übersicht für Stripe Connect"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <section className="grid gap-4 sm:grid-cols-3">
        <div className="rounded-2xl border border-emerald-200 bg-emerald-50 p-4">
          <p className="text-xs uppercase tracking-wide text-emerald-800/70">Aktiv</p>
          <p className="mt-1 text-2xl font-semibold text-emerald-900">{counts.active}</p>
        </div>
        <div className="rounded-2xl border border-amber-200 bg-amber-50 p-4">
          <p className="text-xs uppercase tracking-wide text-amber-800/70">Onboarding offen</p>
          <p className="mt-1 text-2xl font-semibold text-amber-900">{counts.pending}</p>
        </div>
        <div className="rounded-2xl border border-rose-200 bg-rose-50 p-4">
          <p className="text-xs uppercase tracking-wide text-rose-800/70">Nicht verbunden</p>
          <p className="mt-1 text-2xl font-semibold text-rose-900">{counts.notConnected}</p>
        </div>
      </section>

      <section className="mt-4 rounded-2xl border border-rose-200 bg-white p-4">
        <div className="mb-3 flex items-center justify-between">
          <h2 className="text-sm font-semibold uppercase tracking-wide text-rose-900/70">Filialen</h2>
          <button
            type="button"
            onClick={() => void load()}
            className="rounded-lg border border-rose-300 bg-white px-3 py-1.5 text-xs font-semibold text-rose-900"
          >
            Aktualisieren
          </button>
        </div>

        {loading ? <p className="text-sm text-rose-900/70">Wird geladen...</p> : null}
        {error ? <p className="rounded-lg bg-red-50 px-3 py-2 text-sm text-red-700">{error}</p> : null}

        {!loading && !error ? (
          <div className="overflow-x-auto">
            <table className="min-w-full text-sm">
              <thead>
                <tr className="border-b border-rose-100 text-left text-rose-900/70">
                  <th className="px-2 py-2">Filiale</th>
                  <th className="px-2 py-2">Chain</th>
                  <th className="px-2 py-2">Stripe Account</th>
                  <th className="px-2 py-2">Zahlungen</th>
                  <th className="px-2 py-2">Auszahlungen</th>
                  <th className="px-2 py-2">Details</th>
                </tr>
              </thead>
              <tbody>
                {rows.map((row) => {
                  const cfg = row.paymentConfig
                  return (
                    <tr key={row.id} className="border-b border-rose-50">
                      <td className="px-2 py-2 font-medium text-rose-900">{row.name}</td>
                      <td className="px-2 py-2 text-rose-900/75">{row.chain?.name || '—'}</td>
                      <td className="px-2 py-2 text-xs text-rose-900/75">{cfg?.stripeAccountId || '—'}</td>
                      <td className="px-2 py-2">{cfg?.stripeChargesEnabled ? 'Aktiv' : 'Nein'}</td>
                      <td className="px-2 py-2">{cfg?.stripePayoutsEnabled ? 'Aktiv' : 'Nein'}</td>
                      <td className="px-2 py-2">{cfg?.stripeDetailsSubmitted ? 'Vollständig' : 'Offen'}</td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        ) : null}
      </section>
    </BackofficeLayout>
  )
}
