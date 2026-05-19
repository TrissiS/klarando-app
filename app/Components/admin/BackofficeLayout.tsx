'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useEffect, useMemo, useState } from 'react'
import PlatformBranding from '@/app/Components/admin/PlatformBranding'
import {
  getBackendVersionOverview,
  getPlatformBrandingSettings,
  type PlatformBrandingSettings,
} from '@/lib/api'
import { appVersion, buildDateIso, buildNumber, commitSha, environment, formatBuildDateForUi, releaseName } from '@/lib/version'
import { clearSuperadminTenantContext } from '@/lib/superadmin-tenant-context'

type BackofficeNavItem = {
  href: string
  label: string
  tooltip?: string
}

type BackofficeNavGroup = {
  id: string
  label: string
  defaultOpen?: boolean
  items: BackofficeNavItem[]
}

type Props = {
  brand: string
  title: string
  subtitle?: string
  navItems?: BackofficeNavItem[]
  navGroups?: BackofficeNavGroup[]
  children: React.ReactNode
}

type AdminUiMode = 'compact' | 'touch'

export default function BackofficeLayout({
  brand,
  title,
  subtitle,
  navItems,
  navGroups,
  children,
}: Props) {
  const pathname = usePathname()
  const [sessionName, setSessionName] = useState('')
  const [sessionRole, setSessionRole] = useState('')
  const [platformBranding, setPlatformBranding] = useState<PlatformBrandingSettings | null>(null)
  const [mobileNavOpen, setMobileNavOpen] = useState(false)
  const [menuQuery, setMenuQuery] = useState('')
  const [uiMode, setUiMode] = useState<AdminUiMode>('compact')
  const [uiModeReady, setUiModeReady] = useState(false)
  const [openGroupIds, setOpenGroupIds] = useState<Set<string>>(new Set())
  const [authChecked, setAuthChecked] = useState(false)
  const [hasValidSession, setHasValidSession] = useState(false)
  const [backendCommitSha, setBackendCommitSha] = useState<string | null>(null)
  const [sessionWarningOpen, setSessionWarningOpen] = useState(false)
  const [sessionCountdown, setSessionCountdown] = useState(60)
  const normalizedRole = sessionRole.trim().toLowerCase()
  const canSwitchToAdmin = normalizedRole === 'superadmin' || normalizedRole === 'chainadmin'
  const lowerBrand = brand.trim().toLowerCase()
  const sourceItems = navItems || []
  function pickItemsByHref(candidates: string[]) {
    return sourceItems.filter((item) => candidates.includes(item.href))
  }
  const resolvedNavGroups: BackofficeNavGroup[] = useMemo(
    () =>
      navGroups && navGroups.length > 0
      ? navGroups
      : lowerBrand.includes('superadmin')
        ? [
            {
              id: 'overview',
              label: 'Übersicht',
              defaultOpen: true,
              items: pickItemsByHref(['/superadmin']),
            },
            {
              id: 'companies',
              label: 'Unternehmen & Filialen',
              defaultOpen: true,
              items: pickItemsByHref(['/superadmin/business-data', '/superadmin/onboarding']),
            },
            {
              id: 'templates',
              label: 'Vorlagen',
              items: pickItemsByHref(['/superadmin/business-templates', '/superadmin/template-editor']),
            },
            {
              id: 'security',
              label: 'Benutzer & Rechte',
              items: pickItemsByHref(['/superadmin/security', '/superadmin/customers', '/superadmin/drivers']),
            },
            {
              id: 'system',
              label: 'System',
              items: pickItemsByHref([
                '/superadmin/orders',
                '/superadmin/display-devices',
                '/superadmin/fees',
                '/superadmin/app-settings',
                '/superadmin/misc-settings',
                '/superadmin/module-billing',
              ]),
            },
          ].filter((group) => group.items.length > 0)
        : lowerBrand.includes('kettenadmin') || lowerBrand.includes('chainadmin')
          ? [
              {
                id: 'overview',
                label: 'Übersicht',
                defaultOpen: true,
                items: pickItemsByHref(['/chainadmin']),
              },
              {
                id: 'operations',
                label: 'Unternehmen',
                defaultOpen: true,
                items: pickItemsByHref(['/chainadmin/app-settings', '/chainadmin/closings']),
              },
              {
                id: 'templates',
                label: 'Vorlagen',
                items: pickItemsByHref(['/chainadmin/business-templates']),
              },
              {
                id: 'devices',
                label: 'Geräte',
                items: pickItemsByHref(['/chainadmin/display-devices']),
              },
              {
                id: 'links',
                label: 'Schnellzugriff',
                items: pickItemsByHref(['/admin/orders', '/admin']),
              },
            ].filter((group) => group.items.length > 0)
          : [
              {
                id: 'default',
                label: 'Navigation',
                defaultOpen: true,
                items: sourceItems,
              },
            ],
    [navGroups, lowerBrand, sourceItems]
  )

  useEffect(() => {
    if (typeof window === 'undefined') {
      return
    }
    const stored = window.localStorage.getItem('klarando.adminUiMode')
    if (stored === 'compact' || stored === 'touch') {
      setUiMode(stored)
      setUiModeReady(true)
      return
    }
    const inferred: AdminUiMode = window.innerWidth < 1100 ? 'touch' : 'compact'
    setUiMode(inferred)
    setUiModeReady(true)
  }, [])

  useEffect(() => {
    let cancelled = false
    getBackendVersionOverview()
      .then((overview) => {
        if (!cancelled) {
          setBackendCommitSha(overview.gitCommit || null)
        }
      })
      .catch(() => {
        if (!cancelled) {
          setBackendCommitSha(null)
        }
      })
    return () => {
      cancelled = true
    }
  }, [])

  useEffect(() => {
    if (!uiModeReady || typeof window === 'undefined') {
      return
    }
    window.localStorage.setItem('klarando.adminUiMode', uiMode)
    document.documentElement.dataset.adminUiMode = uiMode
  }, [uiMode, uiModeReady])

  useEffect(() => {
    setOpenGroupIds(
      new Set(
        resolvedNavGroups
          .filter((group) => group.defaultOpen ?? true)
          .map((group) => group.id)
      )
    )
  }, [resolvedNavGroups])

  function toggleGroup(groupId: string) {
    setOpenGroupIds((current) => {
      const next = new Set(current)
      if (next.has(groupId)) {
        next.delete(groupId)
      } else {
        next.add(groupId)
      }
      return next
    })
  }
  const visibleNavGroups = useMemo(
    () =>
      resolvedNavGroups
        .map((group) => ({
          ...group,
          items: group.items.filter((item) =>
            menuQuery.trim()
              ? item.label.toLowerCase().includes(menuQuery.trim().toLowerCase())
              : true
          ),
        }))
        .filter((group) => group.items.length > 0),
    [menuQuery, resolvedNavGroups]
  )

  useEffect(() => {
    try {
      const raw =
        typeof window !== 'undefined' ? window.localStorage.getItem('sessionUser') : null
      const token = typeof window !== 'undefined' ? window.localStorage.getItem('accessToken') : null
      if (!raw) {
        setSessionName('')
        setSessionRole('')
        setHasValidSession(false)
        setAuthChecked(true)
        return
      }

      const parsed = JSON.parse(raw) as { name?: string; role?: string }
      setSessionName(parsed.name || '')
      setSessionRole(parsed.role || '')
      setHasValidSession(Boolean(token))
      setAuthChecked(true)
    } catch {
      setSessionName('')
      setSessionRole('')
      setHasValidSession(false)
      setAuthChecked(true)
    }
  }, [])

  useEffect(() => {
    if (!authChecked || hasValidSession) {
      return
    }
    if (typeof window !== 'undefined') {
      window.location.href = '/'
    }
  }, [authChecked, hasValidSession])

  useEffect(() => {
    setMobileNavOpen(false)
  }, [pathname])

  useEffect(() => {
    const onResize = () => {
      if (window.innerWidth >= 768) {
        setMobileNavOpen(false)
      }
    }

    window.addEventListener('resize', onResize)
    return () => window.removeEventListener('resize', onResize)
  }, [])

  useEffect(() => {
    let cancelled = false

    async function loadPlatformBranding() {
      try {
        const settings = await getPlatformBrandingSettings()
        if (!cancelled) {
          setPlatformBranding(settings)
        }
      } catch {
        if (!cancelled) {
          setPlatformBranding(null)
        }
      }
    }

    void loadPlatformBranding()
    return () => {
      cancelled = true
    }
  }, [])

  function handleLogout() {
    if (typeof window === 'undefined') return
    localStorage.removeItem('sessionUser')
    localStorage.removeItem('accessToken')
    clearSuperadminTenantContext()
    window.location.href = '/'
  }

  useEffect(() => {
    if (!authChecked || !hasValidSession) return
    if (typeof window === 'undefined') return

    const idleMs = 30 * 60 * 1000
    const warnMs = 60 * 1000
    let warningTimeout: ReturnType<typeof setTimeout> | null = null
    let logoutTimeout: ReturnType<typeof setTimeout> | null = null
    let countdownInterval: ReturnType<typeof setInterval> | null = null

    const clearTimers = () => {
      if (warningTimeout) clearTimeout(warningTimeout)
      if (logoutTimeout) clearTimeout(logoutTimeout)
      if (countdownInterval) clearInterval(countdownInterval)
      warningTimeout = null
      logoutTimeout = null
      countdownInterval = null
    }

    const startTimers = () => {
      clearTimers()
      setSessionWarningOpen(false)
      setSessionCountdown(60)
      warningTimeout = setTimeout(() => {
        setSessionWarningOpen(true)
        setSessionCountdown(60)
        countdownInterval = setInterval(() => {
          setSessionCountdown((current) => {
            if (current <= 1) {
              if (countdownInterval) clearInterval(countdownInterval)
              return 0
            }
            return current - 1
          })
        }, 1000)
      }, idleMs - warnMs)
      logoutTimeout = setTimeout(() => handleLogout(), idleMs)
    }

    const onActivity = () => startTimers()
    const events: Array<keyof WindowEventMap> = ['mousemove', 'keydown', 'click', 'scroll', 'touchstart']
    events.forEach((eventName) => window.addEventListener(eventName, onActivity, { passive: true }))
    startTimers()

    return () => {
      clearTimers()
      events.forEach((eventName) => window.removeEventListener(eventName, onActivity))
    }
  }, [authChecked, hasValidSession])

  useEffect(() => {
    if (!mobileNavOpen) {
      document.body.style.overflow = ''
      return
    }

    document.body.style.overflow = 'hidden'
    return () => {
      document.body.style.overflow = ''
    }
  }, [mobileNavOpen])

  useEffect(() => {
    if (!mobileNavOpen) {
      return
    }

    const onKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'Escape') {
        setMobileNavOpen(false)
      }
    }

    window.addEventListener('keydown', onKeyDown)
    return () => window.removeEventListener('keydown', onKeyDown)
  }, [mobileNavOpen])

  const isTouchMode = uiMode === 'touch'
  const sidebarWidthClass = isTouchMode ? 'w-[248px]' : 'w-[276px]'
  const contentOffsetClass = isTouchMode ? 'md:ml-[248px]' : 'md:ml-[276px]'
  const navLinkPaddingClass = isTouchMode ? 'px-4 py-3.5 text-sm' : 'px-3.5 py-2.5 text-[13px]'
  const headerSpacingClass = isTouchMode
    ? 'mx-auto max-w-7xl px-3 py-4 sm:px-4 sm:py-5 md:px-6 md:py-6'
    : 'mx-auto max-w-7xl px-3 py-3 sm:px-4 sm:py-4 md:px-5 md:py-5'
  const pageSpacingClass = isTouchMode
    ? 'mx-auto w-full max-w-[1400px] px-3 py-6 sm:px-4 md:px-6 md:py-8'
    : 'mx-auto w-full max-w-[1500px] px-2 py-4 sm:px-3 md:px-5 md:py-6'

  return (
    <main
      className={`safe-area-padding brand-shell klarando-admin-scope min-h-screen ${
        isTouchMode ? 'klarando-touch-mode' : 'klarando-compact-mode'
      }`}
      data-admin-ui-mode={uiMode}
    >
      <div className="relative isolate min-h-screen min-w-0">
        <aside className={`brand-sidebar pointer-events-auto fixed inset-y-0 left-0 z-[120] hidden border-r border-white/10 md:flex md:flex-col ${sidebarWidthClass}`}>
          <div className="border-b border-white/15 px-6 py-6">
            <PlatformBranding settings={platformBranding} area="sidebar" />
            <p className="mt-3 text-xs font-semibold uppercase tracking-[0.22em] text-orange-200">
              Klarando Plattform
            </p>
            <h1 className="mt-2 text-2xl font-bold">{brand}</h1>
            <p className={`mt-2 text-orange-100/80 ${isTouchMode ? 'text-sm' : 'text-xs leading-relaxed'}`}>Verwaltung von Rollen, Rechten und Freigaben.</p>
          </div>

          <nav className={`pointer-events-auto flex-1 overflow-y-auto ${isTouchMode ? 'px-4 py-6' : 'px-3 py-4'}`}>
            <div className="mb-4 rounded-2xl border border-white/20 bg-white/10 p-3">
              <p className="text-[11px] uppercase tracking-[0.16em] text-orange-100/75">Menüsuche</p>
              <input
                value={menuQuery}
                onChange={(event) => setMenuQuery(event.target.value)}
                placeholder="Menüpunkt suchen..."
                className={`mt-2 w-full rounded-xl border border-white/20 bg-white/90 text-slate-800 outline-none ${isTouchMode ? 'px-3 py-2 text-xs' : 'px-2.5 py-1.5 text-[11px]'}`}
              />
            </div>
            <div className={isTouchMode ? 'space-y-4' : 'space-y-3'}>
              {visibleNavGroups.map((group) => (
                <div key={group.id}>
                  <button
                    type="button"
                    onClick={() => toggleGroup(group.id)}
                    className="flex w-full items-center justify-between rounded-xl px-2 py-1 text-left"
                  >
                    <p className="pointer-events-none text-[11px] uppercase tracking-[0.18em] text-orange-100/70">
                      {group.label}
                    </p>
                    <span className="text-xs text-orange-200">{openGroupIds.has(group.id) ? '−' : '+'}</span>
                  </button>
                  {openGroupIds.has(group.id) ? (
                    <div className={isTouchMode ? 'mt-2 space-y-2' : 'mt-1.5 space-y-1.5'}>
                      {group.items.map((item) => {
                        const isActive = pathname === item.href
                        return (
                          <a
                            key={item.href}
                            href={item.href}
                            title={item.tooltip || item.label}
                            className={`brand-nav-link block w-full rounded-2xl font-medium ${navLinkPaddingClass} ${
                              isActive ? 'brand-nav-link-active' : 'brand-nav-link-inactive'
                            }`}
                            data-nav-anchor="backoffice-sidebar-link"
                            onClick={() => setMobileNavOpen(false)}
                          >
                            {item.label}
                          </a>
                        )
                      })}
                    </div>
                  ) : null}
                </div>
              ))}
            </div>

            <div className="mt-4 border-t border-white/15 pt-4">
              <p className="pointer-events-none px-2 text-[11px] uppercase tracking-[0.18em] text-orange-100/70">
                Schnellzugriff
              </p>
              <div className="mt-2 space-y-2">
                {canSwitchToAdmin ? (
                  <a
                    href="/admin"
                    title="Zum Adminbereich"
                    className={`brand-nav-link brand-nav-link-inactive block w-full rounded-2xl font-medium ${navLinkPaddingClass}`}
                    data-nav-anchor="backoffice-sidebar-quicklink"
                  >
                    Zum Adminbereich
                  </a>
                ) : null}
                <button
                  type="button"
                  onClick={handleLogout}
                  title="Logout"
                  className={`block w-full rounded-2xl border border-red-300 bg-red-500/15 text-left font-medium text-red-100 transition hover:bg-red-500/25 ${isTouchMode ? 'px-4 py-3 text-sm' : 'px-3 py-2 text-xs'}`}
                >
                  Logout
                </button>
              </div>
            </div>
          </nav>

          <div className="border-t border-white/15 px-6 py-5">
            <div className="rounded-2xl bg-white/10 px-4 py-4 ring-1 ring-white/20">
              <p className="text-xs uppercase tracking-wide text-orange-100/80">Bereich</p>
              <p className="mt-2 text-sm text-white">{title}</p>
              <div className="mt-3 border-t border-white/15 pt-3 text-[11px] text-orange-100/80">
                <p>Klarando v{appVersion} · Build {buildNumber}</p>
                <p>{releaseName}</p>
                <p>Build: {formatBuildDateForUi(buildDateIso)}</p>
                <p>{environment.toUpperCase()}</p>
                {commitSha ? <p>Commit: {commitSha.slice(0, 8)}</p> : null}
                {backendCommitSha ? <p>Backend: {backendCommitSha.slice(0, 8)}</p> : null}
              </div>
            </div>
          </div>
        </aside>

        <div className={`relative z-10 min-w-0 overflow-x-hidden ${contentOffsetClass}`}>
          <header className="relative z-20 border-b border-[var(--brand-border)] bg-white/90 backdrop-blur">
            <div className={headerSpacingClass}>
              <div className="flex flex-wrap items-start justify-between gap-4">
                <div className="flex min-w-0 items-center gap-3">
                  <PlatformBranding settings={platformBranding} area="header" />
                  <div className="min-w-0">
                    <h1 className="text-2xl font-bold text-[var(--brand-ink)] sm:text-3xl">{title}</h1>
                    {subtitle ? <p className="mt-2 text-sm text-rose-900/70">{subtitle}</p> : null}
                  </div>
                </div>
                <div className="flex items-center gap-2">
                  <span className="rounded-xl border border-[var(--brand-border)] bg-amber-50 px-3 py-2 text-xs font-semibold text-amber-900">
                    Modus: {isTouchMode ? 'Touch' : 'Kompakt'}
                  </span>
                  <button
                    type="button"
                    onClick={() => setUiMode((current) => (current === 'compact' ? 'touch' : 'compact'))}
                    className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs font-semibold text-rose-900 transition hover:bg-rose-100"
                    title={isTouchMode ? 'Auf Kompakt-Modus umstellen' : 'Auf Touch-Modus umstellen'}
                  >
                    {isTouchMode ? 'Touch' : 'Kompakt'}
                  </button>
                  <button
                    type="button"
                    onClick={() => setMobileNavOpen(true)}
                    className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-xs font-semibold text-rose-900 transition hover:bg-rose-100 md:hidden"
                  >
                    Menü
                  </button>
                  <div className="brand-chip rounded-xl px-3 py-2 text-xs">
                    {sessionName || 'Benutzer'} {sessionRole ? `(${sessionRole})` : ''}
                  </div>
                  <button
                    type="button"
                    onClick={handleLogout}
                    className="brand-button-danger hidden rounded-xl px-3 py-2 text-sm font-medium transition sm:inline-flex"
                  >
                    Logout
                  </button>
                </div>
              </div>

              <div className="mt-4 flex items-center justify-between gap-2 sm:hidden">
                <button
                  type="button"
                  onClick={handleLogout}
                  className="brand-button-danger rounded-xl px-3 py-2 text-sm font-medium transition"
                >
                  Logout
                </button>
                <span className="text-xs text-rose-900/70">Tippe auf „Menü“ für Navigation</span>
              </div>
            </div>
          </header>

          {mobileNavOpen ? (
            <div
              className="fixed inset-0 z-[120] bg-slate-950/55 p-3 md:hidden"
              onClick={() => setMobileNavOpen(false)}
              data-overlay="backoffice-mobile-nav"
            >
              <div
                className="flex h-full flex-col overflow-hidden rounded-3xl border border-[var(--brand-border)] bg-white"
                onClick={(event) => event.stopPropagation()}
              >
                <div className="flex items-center justify-between border-b border-[var(--brand-border)] px-4 py-3">
                  <p className="text-sm font-semibold text-[var(--brand-ink)]">Navigation</p>
                  <button
                    type="button"
                    onClick={() => setMobileNavOpen(false)}
                    className="rounded-lg border border-[var(--brand-border)] bg-rose-50 px-3 py-1.5 text-xs font-semibold text-rose-900"
                  >
                    Schließen
                  </button>
                </div>
                <div className="flex-1 overflow-y-auto px-4 py-4">
                  <div className="space-y-4">
                    <div className="rounded-2xl border border-rose-200 bg-rose-50 p-3">
                      <p className="text-[11px] uppercase tracking-[0.16em] text-rose-900/70">Menüsuche</p>
                      <input
                        value={menuQuery}
                        onChange={(event) => setMenuQuery(event.target.value)}
                        placeholder="Menüpunkt suchen..."
                        className="mt-2 w-full rounded-xl border border-rose-200 bg-white px-3 py-2 text-sm text-rose-900 outline-none"
                      />
                    </div>
                    {visibleNavGroups.map((group) => (
                      <div key={`mobile-${group.id}`}>
                        <button
                          type="button"
                          onClick={() => toggleGroup(group.id)}
                          className="flex w-full items-center justify-between px-1"
                        >
                          <p className="text-[11px] uppercase tracking-[0.18em] text-rose-900/60">{group.label}</p>
                          <span className="text-xs text-rose-900/70">{openGroupIds.has(group.id) ? '−' : '+'}</span>
                        </button>
                        {openGroupIds.has(group.id) ? (
                          <div className="mt-2 space-y-2">
                            {group.items.map((item) => {
                              const isActive = pathname === item.href
                              return (
                                <a
                                  key={item.href}
                                  href={item.href}
                                  title={item.tooltip || item.label}
                                  className={`block rounded-xl px-3 py-2 text-sm font-medium transition ${
                                    isActive
                                      ? 'brand-button-primary'
                                      : 'bg-rose-50 text-rose-900 hover:bg-rose-100'
                                  }`}
                                >
                                  {item.label}
                                </a>
                              )
                            })}
                          </div>
                        ) : null}
                      </div>
                    ))}
                    {canSwitchToAdmin ? (
                      <a
                        href="/admin"
                        className="block rounded-xl bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900 hover:bg-rose-100"
                      >
                        Zum Adminbereich
                      </a>
                    ) : null}
                    <button
                      type="button"
                      onClick={handleLogout}
                      className="brand-button-danger w-full rounded-xl px-3 py-2 text-sm font-medium transition"
                    >
                      Logout
                    </button>
                  </div>
                </div>
              </div>
            </div>
          ) : null}
          <div className={`relative z-10 ${pageSpacingClass} pb-20`}>
            {!authChecked ? (
              <section className="rounded-3xl border border-rose-200 bg-rose-50 px-5 py-6 text-sm text-rose-900">
                Sitzung wird geprüft...
              </section>
            ) : !hasValidSession ? (
              <section className="rounded-3xl border border-rose-200 bg-rose-50 px-5 py-6 text-sm text-rose-900">
                Sitzung ist abgelaufen. Du wirst zum Login weitergeleitet.
              </section>
            ) : (
              children
            )}
          </div>
          <footer className="fixed bottom-0 left-0 right-0 z-40 border-t border-[var(--brand-border)] bg-white/95 px-4 py-3 backdrop-blur">
            <div className="mx-auto flex max-w-[1600px] flex-wrap items-center gap-3 text-xs text-rose-900/70">
              <Link href="/impressum" className="hover:text-rose-900">Impressum</Link>
              <Link href="/datenschutz" className="hover:text-rose-900">Datenschutz</Link>
              <Link href="/agb" className="hover:text-rose-900">AGB</Link>
              <Link href="/cookies" className="hover:text-rose-900">Cookies</Link>
              <Link href="/jugendschutz" className="hover:text-rose-900">Jugendschutz</Link>
              <Link href="/partner-agb" className="hover:text-rose-900">Partner-AGB</Link>
            </div>
          </footer>
          {sessionWarningOpen ? (
            <div className="fixed inset-0 z-[80] flex items-center justify-center bg-black/40 px-4">
              <div className="w-full max-w-md rounded-2xl bg-white p-5 shadow-xl">
                <h3 className="text-base font-semibold text-slate-900">Sitzung läuft bald ab</h3>
                <p className="mt-2 text-sm text-slate-700">
                  Du wirst in {sessionCountdown} Sekunden automatisch ausgeloggt.
                </p>
                <div className="mt-4 flex gap-2">
                  <button
                    type="button"
                    onClick={() => {
                      setSessionWarningOpen(false)
                      setSessionCountdown(60)
                      if (typeof window !== 'undefined') {
                        window.dispatchEvent(new Event('mousemove'))
                      }
                    }}
                    className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white"
                  >
                    Sitzung verlängern
                  </button>
                  <button
                    type="button"
                    onClick={handleLogout}
                    className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-semibold text-slate-700"
                  >
                    Jetzt ausloggen
                  </button>
                </div>
              </div>
            </div>
          ) : null}
        </div>
      </div>
    </main>
  )
}
