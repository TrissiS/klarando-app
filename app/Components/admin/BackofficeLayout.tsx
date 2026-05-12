'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useEffect, useState } from 'react'
import PlatformBranding from '@/app/Components/admin/PlatformBranding'
import {
  getPlatformBrandingSettings,
  type PlatformBrandingSettings,
} from '@/lib/api'
import { appVersion, buildDateIso, commitSha, environment, formatBuildDateForUi } from '@/lib/version'
import { clearSuperadminTenantContext } from '@/lib/superadmin-tenant-context'

type BackofficeNavItem = {
  href: string
  label: string
}

type Props = {
  brand: string
  title: string
  subtitle?: string
  navItems: BackofficeNavItem[]
  children: React.ReactNode
}

export default function BackofficeLayout({
  brand,
  title,
  subtitle,
  navItems,
  children,
}: Props) {
  const pathname = usePathname()
  const [sessionName, setSessionName] = useState('')
  const [sessionRole, setSessionRole] = useState('')
  const [platformBranding, setPlatformBranding] = useState<PlatformBrandingSettings | null>(null)
  const [mobileNavOpen, setMobileNavOpen] = useState(false)
  const [isSidebarCollapsed, setIsSidebarCollapsed] = useState(false)
  const [authChecked, setAuthChecked] = useState(false)
  const [hasValidSession, setHasValidSession] = useState(false)
  const normalizedRole = sessionRole.trim().toLowerCase()
  const canSwitchToAdmin = normalizedRole === 'superadmin' || normalizedRole === 'chainadmin'

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
    const storageKey = 'klarando.backoffice.sidebar.collapsed.v1'
    try {
      const raw = window.localStorage.getItem(storageKey)
      if (raw === '1' || raw === '0') {
        setIsSidebarCollapsed(raw === '1')
      } else if (window.innerWidth < 1280) {
        setIsSidebarCollapsed(true)
      }
    } catch {
      if (window.innerWidth < 1280) {
        setIsSidebarCollapsed(true)
      }
    }

    const onResize = () => {
      if (window.innerWidth >= 768) {
        setMobileNavOpen(false)
      }
      if (window.innerWidth < 768) {
        return
      }
      if (window.innerWidth < 1280) {
        setIsSidebarCollapsed(true)
      }
    }

    window.addEventListener('resize', onResize)
    return () => window.removeEventListener('resize', onResize)
  }, [])

  useEffect(() => {
    if (process.env.NODE_ENV === 'production') {
      return
    }
    const probeLink = document.querySelector<HTMLElement>('[data-nav-anchor="backoffice-sidebar-link"]')
    if (!probeLink) {
      return
    }
    const rect = probeLink.getBoundingClientRect()
    const probeX = rect.left + Math.max(8, Math.min(rect.width - 8, rect.width / 2))
    const probeY = rect.top + Math.max(8, Math.min(rect.height - 8, rect.height / 2))
    const hit = document.elementFromPoint(probeX, probeY)
    const hitTag = hit?.tagName?.toLowerCase() || 'none'
    const hitClass = hit?.className || ''
    console.debug('[BackofficeLayout] elementFromPoint probe', {
      probeX,
      probeY,
      hitTag,
      hitClass,
      expectedTag: 'a',
    })
  }, [pathname, mobileNavOpen, isSidebarCollapsed])

  useEffect(() => {
    try {
      window.localStorage.setItem(
        'klarando.backoffice.sidebar.collapsed.v1',
        isSidebarCollapsed ? '1' : '0'
      )
    } catch {
      // ignore
    }
  }, [isSidebarCollapsed])

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

  return (
    <main className="safe-area-padding brand-shell min-h-screen">
      <div className="flex min-h-screen">
        <aside
          className={`brand-sidebar hidden shrink-0 border-r border-white/10 md:flex md:flex-col ${
            isSidebarCollapsed ? 'w-20' : 'w-72'
          } relative z-40 pointer-events-auto`}
        >
          <div className="border-b border-white/15 px-6 py-6">
            <PlatformBranding settings={platformBranding} area="sidebar" />
            {!isSidebarCollapsed ? (
              <>
                <p className="mt-3 text-xs font-semibold uppercase tracking-[0.22em] text-orange-200">
                  Klarando Plattform
                </p>
                <h1 className="mt-2 text-2xl font-bold">{brand}</h1>
                <p className="mt-2 text-sm text-orange-100/80">Verwaltung von Rollen, Rechten und Freigaben.</p>
              </>
            ) : null}
          </div>

          <nav className="relative z-40 flex-1 px-4 py-6 pointer-events-auto">
            <div className="space-y-2">
              {navItems.map((item) => {
                const isActive = pathname === item.href
                return (
                  <Link
                    key={item.href}
                    href={item.href}
                    title={item.label}
                    className={`brand-nav-link relative z-50 block w-full rounded-2xl px-4 py-3 text-sm font-medium pointer-events-auto ${
                      isActive ? 'brand-nav-link-active' : 'brand-nav-link-inactive'
                    }`}
                    data-nav-anchor="backoffice-sidebar-link"
                  >
                    {isSidebarCollapsed ? item.label.slice(0, 1) : item.label}
                  </Link>
                )
              })}
            </div>

            <div className="mt-4 border-t border-white/15 pt-4">
              <p className="pointer-events-none px-2 text-[11px] uppercase tracking-[0.18em] text-orange-100/70">
                Schnellzugriff
              </p>
              <div className="mt-2 space-y-2">
                {canSwitchToAdmin ? (
                  <Link
                    href="/admin"
                    title="Zum Adminbereich"
                    className="brand-nav-link brand-nav-link-inactive relative z-50 block w-full rounded-2xl px-4 py-3 text-sm font-medium pointer-events-auto"
                    data-nav-anchor="backoffice-sidebar-quicklink"
                  >
                    {isSidebarCollapsed ? '>>' : 'Zum Adminbereich'}
                  </Link>
                ) : null}
                <button
                  type="button"
                  onClick={handleLogout}
                  title="Logout"
                  className="block w-full rounded-2xl border border-red-300 bg-red-500/15 px-4 py-3 text-left text-sm font-medium text-red-100 transition hover:bg-red-500/25"
                >
                  {isSidebarCollapsed ? 'X' : 'Logout'}
                </button>
              </div>
            </div>
          </nav>

          <div className="border-t border-white/15 px-6 py-5">
            <div className="rounded-2xl bg-white/10 px-4 py-4 ring-1 ring-white/20">
              <p className="text-xs uppercase tracking-wide text-orange-100/80">Bereich</p>
              <p className="mt-2 text-sm text-white">{title}</p>
              {!isSidebarCollapsed ? (
                <div className="mt-3 border-t border-white/15 pt-3 text-[11px] text-orange-100/80">
                  <p>Klarando v{appVersion}</p>
                  <p>Build: {formatBuildDateForUi(buildDateIso)}</p>
                  <p>{environment.toUpperCase()}</p>
                  {commitSha ? <p>Commit: {commitSha.slice(0, 8)}</p> : null}
                </div>
              ) : null}
            </div>
          </div>
        </aside>

        <div className="relative z-10 min-w-0 flex-1">
          <header className="border-b border-[var(--brand-border)] bg-white/90 backdrop-blur">
            <div className="mx-auto max-w-7xl px-3 py-4 sm:px-4 sm:py-5 md:px-6 md:py-6">
              <div className="flex flex-wrap items-start justify-between gap-4">
                <div className="flex min-w-0 items-center gap-3">
                  <PlatformBranding settings={platformBranding} area="header" />
                  <div className="min-w-0">
                    <h1 className="text-2xl font-bold text-[var(--brand-ink)] sm:text-3xl">{title}</h1>
                    {subtitle ? <p className="mt-2 text-sm text-rose-900/70">{subtitle}</p> : null}
                  </div>
                </div>
                <div className="flex items-center gap-2">
                  <button
                    type="button"
                    onClick={() => setIsSidebarCollapsed((current) => !current)}
                    className="hidden rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-xs font-semibold text-rose-900 transition hover:bg-rose-100 md:inline-flex"
                  >
                    {isSidebarCollapsed ? 'Sidebar öffnen' : 'Sidebar einklappen'}
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
              className="fixed inset-0 z-[80] bg-slate-950/55 p-3 md:hidden"
              onClick={() => setMobileNavOpen(false)}
              data-overlay="backoffice-mobile-nav"
            >
              {process.env.NODE_ENV !== 'production' ? (
                <div className="pointer-events-none fixed left-3 top-3 z-[81] rounded bg-amber-300 px-2 py-1 text-[10px] font-bold text-black">
                  Overlay aktiv: backoffice-mobile-nav
                </div>
              ) : null}
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
                  <div className="space-y-2">
                    {navItems.map((item) => {
                      const isActive = pathname === item.href
                      return (
                        <Link
                          key={item.href}
                          href={item.href}
                          className={`block rounded-xl px-3 py-2 text-sm font-medium transition ${
                            isActive
                              ? 'brand-button-primary'
                              : 'bg-rose-50 text-rose-900 hover:bg-rose-100'
                          }`}
                        >
                          {item.label}
                        </Link>
                      )
                    })}
                    {canSwitchToAdmin ? (
                      <Link
                        href="/admin"
                        className="block rounded-xl bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900 hover:bg-rose-100"
                      >
                        Zum Adminbereich
                      </Link>
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
          <div className="mx-auto w-full max-w-[1400px] px-3 py-6 sm:px-4 md:px-6 md:py-8">
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
        </div>
      </div>
    </main>
  )
}
