'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import rootVersion from '@/VERSION.json'
import {
  getAccessContext,
  getBackendHealthOverview,
  getBackendVersionOverview,
  getAccessUsers,
  getSuperadminDriverOverview,
  getSuperadminOrderRatingsDashboard,
  getSuperadminSalesDashboard,
  type AccessContext,
  type AccessRole,
  type AccessUser,
  type BackendHealthOverview,
  type BackendVersionOverview,
  type SuperadminOrderRatingsDashboard,
  type SuperadminSalesDashboard,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

const roleOrder: AccessRole[] = ['SUPERADMIN', 'CHAINADMIN', 'ADMIN', 'STAFF', 'DRIVER']

const roleLabels: Record<AccessRole, string> = {
  SUPERADMIN: 'Superadmins',
  CHAINADMIN: 'Kettenadmins',
  ADMIN: 'Admins',
  STAFF: 'Staff',
  DRIVER: 'Fahrer',
}

function formatTimestamp(value: string) {
  return new Date(value).toLocaleString('de-DE')
}

export default function SuperadminPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [users, setUsers] = useState<AccessUser[]>([])
  const [salesDashboard, setSalesDashboard] = useState<SuperadminSalesDashboard | null>(null)
  const [ratingsDashboard, setRatingsDashboard] = useState<SuperadminOrderRatingsDashboard | null>(null)
  const [isLoading, setIsLoading] = useState(true)
  const [lastUpdatedAt, setLastUpdatedAt] = useState<Date | null>(null)
  const [connectedDriversCount, setConnectedDriversCount] = useState(0)
  const [activeDriversCount, setActiveDriversCount] = useState(0)
  const [backendHealth, setBackendHealth] = useState<BackendHealthOverview | null>(null)
  const [backendVersion, setBackendVersion] = useState<BackendVersionOverview | null>(null)
  const [error, setError] = useState('')
  const sectionOrder = ['kpi', 'sales', 'quick', 'activity'] as const

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null

    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }

    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    setSession(parsed)
    setToken(accessToken)
  }, [])

  useEffect(() => {
    if (!session) return

    if (!token) {
      setError('Kein Backend-Token gefunden. Bitte neu einloggen.')
      setIsLoading(false)
      return
    }

    void loadDashboardData(token)
  }, [session, token])

  async function loadDashboardData(accessToken: string, options: { silent?: boolean } = {}) {
    try {
      if (!options.silent) {
        setIsLoading(true)
      }
      setError('')

      const [loadedContext, loadedUsers, loadedSalesDashboard, loadedRatingsDashboard, driverOverview] = await Promise.all([
        getAccessContext(accessToken),
        getAccessUsers(accessToken),
        getSuperadminSalesDashboard(accessToken, 30),
        getSuperadminOrderRatingsDashboard(accessToken, 180),
        getSuperadminDriverOverview(accessToken, { includeInactive: true, limit: 400 }),
      ])

      setContext(loadedContext)
      setUsers(loadedUsers)
      setSalesDashboard(loadedSalesDashboard)
      setRatingsDashboard(loadedRatingsDashboard)
      setConnectedDriversCount(
        driverOverview.rows.filter((entry) => entry.isActive).length
      )
      setActiveDriversCount(
        driverOverview.rows.filter((entry) => entry.stats.activeDeliveries > 0).length
      )
      setLastUpdatedAt(new Date())

      try {
        const version = await getBackendVersionOverview()
        setBackendVersion(version)
      } catch {
        setBackendVersion(null)
      }

      try {
        const health = await getBackendHealthOverview()
        setBackendHealth(health)
      } catch {
        setBackendHealth(null)
      }
    } catch (loadError) {
      const message =
        loadError instanceof Error ? loadError.message : 'Dashboard konnte nicht geladen werden'
      setError(message)
    } finally {
      if (!options.silent) {
        setIsLoading(false)
      }
    }
  }

  const roleCounts = useMemo(() => {
    const initial = {
      SUPERADMIN: 0,
      CHAINADMIN: 0,
      ADMIN: 0,
      STAFF: 0,
      DRIVER: 0,
    } satisfies Record<AccessRole, number>

    for (const user of users) {
      initial[user.role] += 1
    }

    return initial
  }, [users])

  const activeUsers = useMemo(() => users.filter((entry) => entry.isActive).length, [users])
  const inactiveUsers = users.length - activeUsers

  const chainNameById = useMemo(
    () => new Map((context?.chains || []).map((chain) => [chain.id, chain.name])),
    [context]
  )

  const tenantNameById = useMemo(
    () => new Map((context?.tenants || []).map((tenant) => [tenant.id, tenant.name])),
    [context]
  )

  const recentUsers = useMemo(
    () =>
      [...users]
        .sort(
          (a, b) =>
            new Date(b.updatedAt || b.createdAt).getTime() -
            new Date(a.updatedAt || a.createdAt).getTime()
        )
        .slice(0, 8),
    [users]
  )

  function renderSection(sectionId: string) {
    if (sectionId === 'kpi') {
      return (
        <section className="grid gap-4 sm:grid-cols-2 xl:grid-cols-6">
          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Ketten</p>
            <p className="mt-2 text-3xl font-bold text-[var(--brand-ink)]">{context?.chains.length || 0}</p>
            <Link
              href="/superadmin/security"
              className="mt-3 inline-flex rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] hover:bg-rose-100"
            >
              Quelle öffnen
            </Link>
          </article>
          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Filialen</p>
            <p className="mt-2 text-3xl font-bold text-[var(--brand-ink)]">{context?.tenants.length || 0}</p>
            <Link
              href="/superadmin/security"
              className="mt-3 inline-flex rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] hover:bg-rose-100"
            >
              Quelle öffnen
            </Link>
          </article>
          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Benutzer aktiv</p>
            <p className="mt-2 text-3xl font-bold text-emerald-700">{activeUsers}</p>
            <Link
              href="/superadmin/security"
              className="mt-3 inline-flex rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] hover:bg-rose-100"
            >
              Quelle öffnen
            </Link>
          </article>
          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Benutzer inaktiv</p>
            <p className="mt-2 text-3xl font-bold text-rose-900/85">{inactiveUsers}</p>
            <Link
              href="/superadmin/security"
              className="mt-3 inline-flex rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] hover:bg-rose-100"
            >
              Quelle öffnen
            </Link>
          </article>
          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Benutzer gesamt</p>
            <p className="mt-2 text-3xl font-bold text-orange-600">{users.length}</p>
            <Link
              href="/superadmin/security"
              className="mt-3 inline-flex rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] hover:bg-rose-100"
            >
              Quelle öffnen
            </Link>
          </article>
          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Fahrer verbunden</p>
            <p className="mt-2 text-3xl font-bold text-sky-700">{connectedDriversCount}</p>
            <p className="mt-1 text-xs text-rose-900/75">Fahrer unterwegs jetzt: {activeDriversCount}</p>
            <Link
              href="/superadmin/drivers"
              className="mt-3 inline-flex rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] hover:bg-rose-100"
            >
              Quelle öffnen
            </Link>
          </article>
        </section>
      )
    }

    if (sectionId === 'sales') {
      if (!salesDashboard) {
        return (
          <section className="rounded-3xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
            Umsatzbereich lädt...
          </section>
        )
      }

      return (
        <section className="grid gap-4 xl:grid-cols-[1fr_1fr]">
          <article className="rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4 xl:col-span-2">
            <div className="flex flex-wrap gap-2">
              <Link
                href="/superadmin/orders"
                className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-semibold text-[var(--brand-ink)] hover:bg-rose-100"
              >
                Quelle Umsatz: Bestellungen
              </Link>
              <Link
                href="/superadmin/customers"
                className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-semibold text-[var(--brand-ink)] hover:bg-rose-100"
              >
                Quelle Bewertung: Kundenstamm
              </Link>
            </div>
          </article>

          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Plattform-Umsatz</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Letzte {salesDashboard.periodDays} Tage über alle angelegten Ketten und Admin-Filialen.
            </p>
            <div className="mt-4 grid gap-3 sm:grid-cols-3">
              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
                <p className="text-xs uppercase tracking-wide text-rose-900/70">Gesamtumsatz</p>
                <p className="mt-1 text-2xl font-bold text-emerald-700">
                  {salesDashboard.totals.revenue.toFixed(2)} EUR
                </p>
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
                <p className="text-xs uppercase tracking-wide text-rose-900/70">Bezahlte Orders</p>
                <p className="mt-1 text-2xl font-bold text-[var(--brand-ink)]">
                  {salesDashboard.totals.paidOrders}
                </p>
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
                <p className="text-xs uppercase tracking-wide text-rose-900/70">Aktive Filialen</p>
                <p className="mt-1 text-2xl font-bold text-[var(--brand-ink)]">
                  {salesDashboard.totals.activeTenantsWithRevenue} / {salesDashboard.totals.tenants}
                </p>
              </div>
            </div>
          </article>

          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Top Ketten Umsatz</h2>
            <div className="mt-4 space-y-2">
              {salesDashboard.chains.slice(0, 6).map((entry, index) => (
                <div
                  key={entry.chainId}
                  className="flex items-center justify-between rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm"
                >
                  <span>
                    {index + 1}. {entry.chainName}
                  </span>
                  <span className="font-semibold text-[var(--brand-ink)]">{entry.revenue.toFixed(2)} EUR</span>
                </div>
              ))}
              {salesDashboard.chains.length === 0 ? (
                <p className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                  Noch keine Kettenumsatzdaten vorhanden.
                </p>
              ) : null}
            </div>

            <h3 className="mt-5 text-sm font-semibold uppercase tracking-wide text-rose-900/70">
              Top Filialen Umsatz
            </h3>
            <div className="mt-2 space-y-2">
              {salesDashboard.tenants.slice(0, 6).map((entry, index) => (
                <div
                  key={entry.tenantId}
                  className="flex items-center justify-between rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-2 text-sm"
                >
                  <span>
                    {index + 1}. {entry.tenantName}
                  </span>
                  <span className="font-semibold text-[var(--brand-ink)]">{entry.revenue.toFixed(2)} EUR</span>
                </div>
              ))}
              {salesDashboard.tenants.length === 0 ? (
                <p className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                  Noch keine Filialumsatzdaten vorhanden.
                </p>
              ) : null}
            </div>
          </article>

          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)] xl:col-span-2">
            <h2 className="text-xl font-semibold">Kundenbewertungen Plattform</h2>
            {!ratingsDashboard ? (
              <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                Bewertungsdaten werden geladen...
              </p>
            ) : ratingsDashboard.totalRatings === 0 ? (
              <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                Noch keine Bewertungen vorhanden.
              </p>
            ) : (
              <div className="mt-4 grid gap-4 xl:grid-cols-[280px_1fr_1fr]">
                <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">Gesamtdurchschnitt</p>
                  <p className="mt-1 text-3xl font-bold text-amber-600">
                    {ratingsDashboard.averageRating?.toFixed(2) || '-'} / 5
                  </p>
                  <p className="mt-1 text-sm text-rose-900/75">
                    {ratingsDashboard.totalRatings} Bewertungen in {ratingsDashboard.periodDays} Tagen
                  </p>
                  <p className="mt-2 text-sm font-semibold text-[var(--brand-ink)]">
                    Ausstehende Bewertungen (72h): {ratingsDashboard.pendingRatings72h.currentlyRateable}
                  </p>
                  <p className="mt-1 text-xs text-rose-900/75">
                    Offen gesamt: {ratingsDashboard.pendingRatings72h.unratedTotal} | Wartezeit:{' '}
                    {ratingsDashboard.pendingRatings72h.waitingForCooldown} | Abgelaufen:{' '}
                    {ratingsDashboard.pendingRatings72h.expiredWithoutRating}
                  </p>
                </div>

                <div>
                  <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/70">
                    Top Ketten Bewertung
                  </h3>
                  <div className="mt-2 space-y-2">
                    {ratingsDashboard.chains.slice(0, 5).map((entry, index) => (
                      <div
                        key={entry.chainId}
                        className="flex items-center justify-between rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-2 text-sm"
                      >
                        <span>
                          {index + 1}. {entry.chainName}
                        </span>
                        <span className="font-semibold text-amber-700">
                          {entry.ratingAverage.toFixed(2)} ({entry.ratingCount})
                        </span>
                      </div>
                    ))}
                  </div>
                </div>

                <div>
                  <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/70">
                    Letzte Bewertungen
                  </h3>
                  <div className="mt-2 space-y-2">
                    {ratingsDashboard.latest.slice(0, 5).map((entry) => (
                      <div
                        key={entry.id}
                        className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm"
                      >
                        <p className="font-semibold text-[var(--brand-ink)]">
                          {'★'.repeat(entry.stars)}
                          {'☆'.repeat(5 - entry.stars)}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          {entry.tenantName || 'Filiale'} |{' '}
                          {new Date(entry.createdAt).toLocaleString('de-DE')}
                        </p>
                        {entry.comment ? <p className="mt-1 text-slate-800">{entry.comment}</p> : null}
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            )}
          </article>
        </section>
      )
    }

    if (sectionId === 'quick') {
      return (
        <section className="grid gap-6 xl:grid-cols-[1.05fr_1fr]">
          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Schnellzugriff</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Direkter Einstieg in die Sicherheits- und Benutzerverwaltung.
            </p>
            <div className="mt-4 grid gap-3 sm:grid-cols-3">
              <Link
                href="/superadmin/onboarding"
                className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm font-medium text-[var(--brand-ink)] transition hover:border-orange-300 hover:bg-orange-50"
              >
                Neues Unternehmen anlegen
              </Link>
              <Link
                href="/superadmin/security"
                className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm font-medium text-[var(--brand-ink)] transition hover:border-orange-300 hover:bg-orange-50"
              >
                Benutzer verwalten
              </Link>
              <Link
                href="/superadmin/business-data"
                className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm font-medium text-[var(--brand-ink)] transition hover:border-orange-300 hover:bg-orange-50"
              >
                Neue Filiale anlegen
              </Link>
              <Link
                href="/superadmin/trade-catalog"
                className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm font-medium text-[var(--brand-ink)] transition hover:border-orange-300 hover:bg-orange-50"
              >
                Templates verwalten
              </Link>
            </div>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Session</p>
              <p className="mt-1 text-sm text-slate-800">
                Angemeldet als {session?.name} ({session?.email})
              </p>
            </div>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Plattform Version</p>
              {(() => {
                const resolvedCommit =
                  (backendVersion?.gitCommit || rootVersion.gitCommit || '').trim() || '-'
                const shortCommit =
                  resolvedCommit === '-' ? '-' : resolvedCommit.slice(0, 7)
                const resolvedBuildTime = backendVersion?.buildTime || rootVersion.buildTime

                return (
              <div className="mt-2 grid gap-2 text-sm text-slate-800 sm:grid-cols-2">
                <p>
                  Plattform: <span className="font-semibold">{backendVersion?.version || rootVersion.version}</span>
                </p>
                <p>
                  Release: <span className="font-semibold">{backendVersion?.releaseName || rootVersion.releaseName || '-'}</span>
                </p>
                <p>
                  Backend: <span className="font-semibold">{backendVersion?.version || backendHealth?.backendVersion || rootVersion.version}</span>
                </p>
                <p>
                  Buildnummer: <span className="font-semibold">{backendVersion?.buildNumber ?? rootVersion.buildNumber}</span>
                </p>
                <p>
                  Commit: <span className="font-semibold">{shortCommit}</span>
                </p>
                <p className="sm:col-span-2">
                  Build-Datum: <span className="font-semibold">{resolvedBuildTime ? new Date(resolvedBuildTime).toLocaleString('de-DE') : '-'}</span>
                </p>
                <p className="sm:col-span-2">
                  Backend gestartet: <span className="font-semibold">{backendHealth?.startedAt ? new Date(backendHealth.startedAt).toLocaleString('de-DE') : '-'}</span>
                </p>
              </div>
                )
              })()}
            </div>
          </article>

          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Rollenverteilung</h2>
            <div className="mt-4 grid gap-3 sm:grid-cols-2">
              {roleOrder.map((role) => (
                <div key={role} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">{roleLabels[role]}</p>
                  <p className="mt-1 text-2xl font-bold text-[var(--brand-ink)]">{roleCounts[role]}</p>
                </div>
              ))}
            </div>
          </article>
        </section>
      )
    }

    return (
      <section className="grid gap-6">
        <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <h2 className="text-xl font-semibold">Letzte Benutzer-Änderungen</h2>
          <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
            <table className="w-full min-w-[760px] border-collapse">
              <thead>
                <tr>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Name
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Rolle
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Kette
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Filiale
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Zuletzt
                  </th>
                </tr>
              </thead>
              <tbody>
                {recentUsers.map((user) => (
                  <tr key={user.id}>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {user.name}
                      <p className="text-xs text-rose-900/70">{user.email}</p>
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">{user.role}</td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {user.chainId ? chainNameById.get(user.chainId) || user.chainId : '-'}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {user.tenantId ? tenantNameById.get(user.tenantId) || user.tenantId : '-'}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {formatTimestamp(user.updatedAt || user.createdAt)}
                    </td>
                  </tr>
                ))}
                {recentUsers.length === 0 ? (
                  <tr>
                    <td className="border-t border-slate-100 px-3 py-4 text-sm text-rose-900/70" colSpan={5}>
                      Noch keine Benutzer vorhanden.
                    </td>
                  </tr>
                ) : null}
              </tbody>
            </table>
          </div>
        </article>
      </section>
    )
  }

  if (!session) return null

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Dashboard"
      subtitle="Klarando Plattformüberblick für Rollen, Filialen und Sicherheitsaktivitäten"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      {error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}

      {isLoading ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/75">Lade Superadmin-Dashboard...</p>
        </section>
      ) : (
        <div className="grid gap-6">
          <section className="rounded-3xl bg-white p-4 shadow-sm ring-1 ring-[var(--brand-border)]">
            <div className="text-sm text-rose-900/80">
              Letztes Update:{' '}
              <span className="font-semibold text-[var(--brand-ink)]">
                {lastUpdatedAt ? lastUpdatedAt.toLocaleString('de-DE') : '-'}
              </span>
            </div>
          </section>
          {sectionOrder.map((sectionId) => (
            <section key={sectionId} className="rounded-3xl border border-transparent bg-transparent p-1">
              {renderSection(sectionId)}
            </section>
          ))}
        </div>
      )}
    </BackofficeLayout>
  )
}



