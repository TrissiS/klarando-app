'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useEffect, useState } from 'react'
import PlatformBranding from '@/app/Components/admin/PlatformBranding'
import {
  getPlatformBrandingSettings,
  type PlatformBrandingSettings,
} from '@/lib/api'

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
  const normalizedRole = sessionRole.trim().toLowerCase()
  const canSwitchToAdmin = normalizedRole === 'superadmin' || normalizedRole === 'chainadmin'

  useEffect(() => {
    try {
      const raw =
        typeof window !== 'undefined' ? window.localStorage.getItem('sessionUser') : null
      if (!raw) {
        setSessionName('')
        setSessionRole('')
        return
      }

      const parsed = JSON.parse(raw) as { name?: string; role?: string }
      setSessionName(parsed.name || '')
      setSessionRole(parsed.role || '')
    } catch {
      setSessionName('')
      setSessionRole('')
    }
  }, [])

  useEffect(() => {
    setMobileNavOpen(false)
  }, [pathname])

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
    window.location.href = '/'
  }

  return (
    <main className="brand-shell min-h-screen">
      <div className="flex min-h-screen">
        <aside className="brand-sidebar hidden w-72 shrink-0 border-r border-white/10 lg:flex lg:flex-col">
          <div className="border-b border-white/15 px-6 py-6">
            <PlatformBranding settings={platformBranding} area="sidebar" />
            <p className="mt-3 text-xs font-semibold uppercase tracking-[0.22em] text-orange-200">
              Klarando Plattform
            </p>
            <h1 className="mt-2 text-2xl font-bold">{brand}</h1>
            <p className="mt-2 text-sm text-orange-100/80">Verwaltung von Rollen, Rechten und Freigaben.</p>
          </div>

          <nav className="flex-1 px-4 py-6">
            <div className="space-y-2">
              {navItems.map((item) => {
                const isActive = pathname === item.href
                return (
                  <Link
                    key={item.href}
                    href={item.href}
                    className={`brand-nav-link block rounded-2xl px-4 py-3 text-sm font-medium ${
                      isActive ? 'brand-nav-link-active' : 'brand-nav-link-inactive'
                    }`}
                  >
                    {item.label}
                  </Link>
                )
              })}
            </div>

            <div className="mt-4 border-t border-white/15 pt-4">
              <p className="px-2 text-[11px] uppercase tracking-[0.18em] text-orange-100/70">
                Schnellzugriff
              </p>
              <div className="mt-2 space-y-2">
                {canSwitchToAdmin ? (
                  <Link
                    href="/admin"
                    className="brand-nav-link brand-nav-link-inactive block rounded-2xl px-4 py-3 text-sm font-medium"
                  >
                    Zum Adminbereich
                  </Link>
                ) : null}
                <button
                  type="button"
                  onClick={handleLogout}
                  className="block w-full rounded-2xl border border-red-300 bg-red-500/15 px-4 py-3 text-left text-sm font-medium text-red-100 transition hover:bg-red-500/25"
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
            </div>
          </div>
        </aside>

        <div className="min-w-0 flex-1">
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
                    onClick={() => setMobileNavOpen(true)}
                    className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-xs font-semibold text-rose-900 transition hover:bg-rose-100 lg:hidden"
                  >
                    Menue
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
                <span className="text-xs text-rose-900/70">Tippe auf „Menue“ fuer Navigation</span>
              </div>
            </div>
          </header>

          {mobileNavOpen ? (
            <div className="fixed inset-0 z-50 bg-slate-950/55 p-3 lg:hidden">
              <div className="flex h-full flex-col overflow-hidden rounded-3xl border border-[var(--brand-border)] bg-white">
                <div className="flex items-center justify-between border-b border-[var(--brand-border)] px-4 py-3">
                  <p className="text-sm font-semibold text-[var(--brand-ink)]">Navigation</p>
                  <button
                    type="button"
                    onClick={() => setMobileNavOpen(false)}
                    className="rounded-lg border border-[var(--brand-border)] bg-rose-50 px-3 py-1.5 text-xs font-semibold text-rose-900"
                  >
                    Schliessen
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

          <div className="mx-auto max-w-7xl px-3 py-6 sm:px-4 md:px-6 md:py-8">{children}</div>
        </div>
      </div>
    </main>
  )
}
