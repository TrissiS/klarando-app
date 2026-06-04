'use client'

import { useEffect, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import { getAdminOrderRatingsDashboard, type AdminOrderRatingsDashboard } from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

export default function AdminMarketingRatingsPage() {
  const [dashboard, setDashboard] = useState<AdminOrderRatingsDashboard | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    let cancelled = false

    ;(async () => {
      try {
        const rawSession = localStorage.getItem('sessionUser')
        const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null
        const token = parsed?.accessToken || localStorage.getItem('accessToken') || undefined
        const tenantId = parsed?.tenantId || localStorage.getItem('selectedTenantId') || undefined

        if (!tenantId) {
          if (!cancelled) {
            setDashboard(null)
          }
          return
        }

        const nextDashboard = await getAdminOrderRatingsDashboard(180, tenantId, token)
        if (!cancelled) {
          setDashboard(nextDashboard)
        }
      } catch (loadError) {
        if (!cancelled) {
          setError(loadError instanceof Error ? loadError.message : 'Bewertungen konnten nicht geladen werden')
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
  }, [])

  return (
    <AdminLayout
      title="Marketing · Bewertungen"
      subtitle="Bewertungen bleiben im Marketingbereich und werden hier zentral angezeigt."
    >
      <div className="rounded-2xl border border-rose-200 bg-white p-6 shadow-sm">
        <h2 className="text-lg font-semibold text-rose-950">Bewertungen</h2>
        {error ? (
          <p className="mt-2 text-sm text-rose-700">{error}</p>
        ) : loading ? (
          <p className="mt-2 text-sm text-rose-900/75">Bewertungen werden geladen...</p>
        ) : !dashboard || dashboard.totalRatings === 0 ? (
          <p className="mt-2 text-sm text-rose-900/75">Bewertungen werden hier angezeigt.</p>
        ) : (
          <div className="mt-4 space-y-4">
            <div className="grid gap-3 md:grid-cols-3">
              <div className="rounded-xl border border-rose-100 bg-rose-50 px-4 py-3">
                <div className="text-xs font-semibold uppercase tracking-wide text-rose-700">Durchschnitt</div>
                <div className="mt-1 text-2xl font-semibold text-rose-950">
                  {dashboard.averageRating?.toFixed(2) || '-'} / 5
                </div>
              </div>
              <div className="rounded-xl border border-rose-100 bg-rose-50 px-4 py-3">
                <div className="text-xs font-semibold uppercase tracking-wide text-rose-700">Anzahl</div>
                <div className="mt-1 text-2xl font-semibold text-rose-950">{dashboard.totalRatings}</div>
              </div>
              <div className="rounded-xl border border-rose-100 bg-rose-50 px-4 py-3">
                <div className="text-xs font-semibold uppercase tracking-wide text-rose-700">Offen in 72h</div>
                <div className="mt-1 text-2xl font-semibold text-rose-950">
                  {dashboard.pendingRatings72h.currentlyRateable}
                </div>
              </div>
            </div>

            <div className="rounded-xl border border-rose-100 bg-rose-50/60 p-4">
              <h3 className="text-sm font-semibold text-rose-950">Letzte Bewertungen</h3>
              <div className="mt-3 space-y-3">
                {dashboard.latest.length === 0 ? (
                  <p className="text-sm text-rose-900/75">Bewertungen werden hier angezeigt.</p>
                ) : (
                  dashboard.latest.slice(0, 12).map((entry) => (
                    <div key={entry.id} className="rounded-xl border border-rose-100 bg-white px-4 py-3">
                      <div className="flex flex-wrap items-center justify-between gap-2">
                        <div className="text-sm font-semibold text-rose-950">
                          {entry.stars} / 5 Sterne
                        </div>
                        <div className="text-xs text-rose-900/60">
                          {new Date(entry.createdAt).toLocaleString('de-DE')}
                        </div>
                      </div>
                      <div className="mt-1 text-xs text-rose-900/60">
                        {entry.tenantName || 'Filiale unbekannt'}
                      </div>
                      <p className="mt-2 text-sm text-rose-900/80">
                        {entry.comment?.trim() || 'Keine Kommentarangabe'}
                      </p>
                    </div>
                  ))
                )}
              </div>
            </div>
          </div>
        )}
      </div>
    </AdminLayout>
  )
}
