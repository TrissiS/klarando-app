'use client'

import Link from 'next/link'
import { usePathname, useSearchParams } from 'next/navigation'
import { Suspense, useEffect, useState } from 'react'
import PlatformBranding from '@/app/Components/admin/PlatformBranding'
import {
  getBusinessSettings,
  getPlatformBrandingSettings,
  type AccessPermission,
  type BusinessSettings,
  type PlatformBrandingSettings,
} from '@/lib/api'
import { isModuleEnabled, type AdminModuleKey } from '@/lib/admin-module-visibility'

type Props = {
  title: string
  subtitle?: string
  children: React.ReactNode
}

type NavItem = {
  href: string
  label: string
  moduleKey: AdminModuleKey
  requiredPermission?: AccessPermission
}

type NavSection = {
  id: string
  label: string
  items: NavItem[]
}

type SubNavGroup = {
  id: string
  label: string
  routePrefixes: string[]
  items: NavItem[]
}

const navSections: NavSection[] = [
  {
    id: 'core',
    label: 'Hauptmenü',
    items: [
      { href: '/admin', label: 'Dashboard', moduleKey: 'dashboard' },
      { href: '/admin/products', label: 'Produkte', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/staff', label: 'Mitarbeiter', moduleKey: 'staff', requiredPermission: 'USERS_READ' },
      { href: '/admin/displays', label: 'Bildschirme & Displays', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/orders', label: 'Bestellungen', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/closings', label: 'Abschlüsse', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/actions', label: 'Aktionen', moduleKey: 'actions', requiredPermission: 'PRODUCTS_READ' },
    ],
  },
  {
    id: 'stock',
    label: 'Lager',
    items: [
      { href: '/admin/stock', label: 'Lager', moduleKey: 'inventory', requiredPermission: 'INVENTORY_READ' },
    ],
  },
  {
    id: 'settings',
    label: 'Einstellungen',
    items: [
      { href: '/admin/drivers', label: 'Fahrer-App', moduleKey: 'drivers', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/app-settings', label: 'App-Einstellungen', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/settings', label: 'Systemeinstellungen', moduleKey: 'settings', requiredPermission: 'SETTINGS_READ' },
    ],
  },
]

const subNavGroups: SubNavGroup[] = [
  {
    id: 'catalog',
    label: 'Unterkategorien: Produkte',
    routePrefixes: ['/admin/products', '/admin/categories', '/admin/ingredients', '/admin/suppliers'],
    items: [
      { href: '/admin/products', label: 'Produkte', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/categories', label: 'Kategorien', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/ingredients', label: 'Zutaten', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/suppliers', label: 'Lieferanten', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      {
        href: '/admin/suppliers?focus=quick-order',
        label: 'Schnellbestellung',
        moduleKey: 'products',
        requiredPermission: 'PRODUCTS_READ',
      },
      {
        href: '/admin/suppliers?focus=order-suggestion',
        label: 'Bestellvorschlag',
        moduleKey: 'products',
        requiredPermission: 'PRODUCTS_READ',
      },
    ],
  },
  {
    id: 'displays',
    label: 'Unterkategorien: Displays',
    routePrefixes: ['/admin/displays', '/admin/terminals', '/admin/order-displays', '/admin/screen'],
    items: [
      { href: '/admin/displays', label: 'Displays', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/terminals', label: 'OrderDesk-Geräte', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/order-displays', label: 'Order-Displays', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/screen', label: 'Screen', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
    ],
  },
  {
    id: 'orders',
    label: 'Unterkategorien: Bestellungen',
    routePrefixes: ['/admin/orders', '/admin/closings'],
    items: [
      { href: '/admin/orders', label: 'Bestellungen', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/closings', label: 'Abschlüsse', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
    ],
  },
  {
    id: 'settings',
    label: 'Unterkategorien: Einstellungen',
    routePrefixes: ['/admin/drivers', '/admin/app-settings', '/admin/settings'],
    items: [
      { href: '/admin/drivers', label: 'Fahrer-App', moduleKey: 'drivers', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/app-settings', label: 'App-Einstellungen', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/settings', label: 'Systemeinstellungen', moduleKey: 'settings', requiredPermission: 'SETTINGS_READ' },
    ],
  },
]

function AdminLayoutContent({ title, subtitle, children }: Props) {
  const pathname = usePathname()
  const searchParams = useSearchParams()
  const searchKey = searchParams.toString()
  const [permissions, setPermissions] = useState<Set<string> | null>(null)
  const [sessionName, setSessionName] = useState('')
  const [sessionRole, setSessionRole] = useState('')
  const [businessSettings, setBusinessSettings] = useState<BusinessSettings | null>(null)
  const [platformBranding, setPlatformBranding] = useState<PlatformBrandingSettings | null>(null)
  const [mobileNavOpen, setMobileNavOpen] = useState(false)
  const normalizedRole = sessionRole.trim().toLowerCase()
  const switchTarget =
    normalizedRole === 'superadmin'
      ? { href: '/superadmin', label: 'Zum Superadminbereich' }
      : normalizedRole === 'chainadmin'
        ? { href: '/chainadmin', label: 'Zum Kettenadminbereich' }
        : null

  useEffect(() => {
    try {
      const rawSession =
        typeof window !== 'undefined' ? window.localStorage.getItem('sessionUser') : null
      if (!rawSession) {
        setPermissions(null)
        return
      }

      const parsed = JSON.parse(rawSession) as {
        permissions?: string[]
        name?: string
        role?: string
      }
      setSessionName(parsed.name || '')
      setSessionRole(parsed.role || '')
      if (!Array.isArray(parsed.permissions)) {
        setPermissions(null)
        return
      }

      setPermissions(new Set<string>(parsed.permissions))
    } catch {
      setPermissions(new Set<string>())
      setSessionName('')
      setSessionRole('')
    }
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

  useEffect(() => {
    let cancelled = false

    async function loadBusinessSettings() {
      try {
        const settings = await getBusinessSettings()
        if (!cancelled) {
          setBusinessSettings(settings)
        }
      } catch {
        if (!cancelled) {
          setBusinessSettings(null)
        }
      }
    }

    void loadBusinessSettings()
    return () => {
      cancelled = true
    }
  }, [])

  useEffect(() => {
    setMobileNavOpen(false)
  }, [pathname, searchKey])

  function handleLogout() {
    if (typeof window === 'undefined') return
    localStorage.removeItem('sessionUser')
    localStorage.removeItem('accessToken')
    window.location.href = '/'
  }

  function isItemEnabled(item: NavItem) {
    if (
      !isModuleEnabled(item.moduleKey, {
        permissions,
        businessSettings,
      })
    ) {
      return false
    }

    if (!item.requiredPermission) {
      return true
    }

    if (permissions === null) {
      return true
    }

    return permissions.has(item.requiredPermission)
  }

  function isItemActive(item: NavItem) {
    const focus = searchParams.get('focus')

    if (item.href.includes('focus=quick-order')) {
      return pathname === '/admin/suppliers' && focus === 'quick-order'
    }

    if (item.href.includes('focus=order-suggestion')) {
      return pathname === '/admin/suppliers' && focus === 'order-suggestion'
    }

    if (item.href === '/admin/suppliers') {
      return pathname === '/admin/suppliers' && !focus
    }

    if (item.href === '/admin/closings') {
      return pathname === item.href || pathname.startsWith('/admin/closings/')
    }

    if (item.href === '/admin/displays') {
      return (
        pathname.startsWith('/admin/displays') ||
        pathname.startsWith('/admin/screen') ||
        pathname.startsWith('/admin/terminals') ||
        pathname.startsWith('/admin/order-displays')
      )
    }

    return pathname === item.href
  }

  const activeSubNavGroup =
    subNavGroups.find((group) =>
      group.routePrefixes.some((prefix) => pathname === prefix || pathname.startsWith(`${prefix}/`))
    ) ?? null
  const visibleNavSections = navSections
    .map((section) => ({
      ...section,
      items: section.items.filter((item) => isItemEnabled(item)),
    }))
    .filter((section) => section.items.length > 0)
  const visibleActiveSubNavItems = activeSubNavGroup
    ? activeSubNavGroup.items.filter((item) => isItemEnabled(item))
    : []
  const showSubNavGroup = Boolean(activeSubNavGroup && visibleActiveSubNavItems.length > 0)

  return (
    <main className="brand-shell min-h-screen overflow-x-hidden">
      <div className="flex min-h-screen min-w-0">
        <aside className="brand-sidebar hidden w-72 shrink-0 border-r border-white/10 lg:flex lg:flex-col">
          <div className="border-b border-white/15 px-6 py-6">
            <PlatformBranding settings={platformBranding} area="sidebar" />
            <p className="mt-3 text-xs font-semibold uppercase tracking-[0.22em] text-orange-200">
              Klarando Plattform
            </p>
            <h1 className="mt-2 text-2xl font-bold">Admin Panel</h1>
            <p className="mt-2 text-sm text-orange-100/80">
              Zentrale Verwaltung für Produkte, Mitarbeiter und Prozesse.
            </p>
          </div>

          <nav className="flex-1 overflow-y-auto px-4 py-6">
            <div className="space-y-4">
              {visibleNavSections.map((section) => (
                <div key={section.id}>
                  <p className="px-2 text-[11px] uppercase tracking-[0.18em] text-orange-100/70">
                    {section.label}
                  </p>
                  <div className="mt-2 space-y-2">
                    {section.items.map((item) => {
                      const isActive = isItemActive(item)

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
                </div>
              ))}
            </div>

            {showSubNavGroup && activeSubNavGroup ? (
              <div className="mt-4 rounded-2xl border border-white/20 bg-white/10 p-3">
                <p className="px-1 text-[11px] uppercase tracking-[0.18em] text-orange-100/75">
                  {activeSubNavGroup.label}
                </p>
                <div className="mt-2 space-y-2">
                  {visibleActiveSubNavItems.map((item) => {
                    const isActive = isItemActive(item)

                    return (
                      <Link
                        key={`sidebar-sub-${item.href}`}
                        href={item.href}
                        className={`brand-nav-link block rounded-xl px-3 py-2 text-xs font-medium ${
                          isActive ? 'brand-nav-link-active' : 'brand-nav-link-inactive'
                        }`}
                      >
                        {item.label}
                      </Link>
                    )
                  })}
                </div>
              </div>
            ) : null}

            <div className="mt-4 border-t border-white/15 pt-4">
              <p className="px-2 text-[11px] uppercase tracking-[0.18em] text-orange-100/70">
                Schnellzugriff
              </p>
              <div className="mt-2 space-y-2">
                {switchTarget ? (
                  <Link
                    href={switchTarget.href}
                    className="brand-nav-link brand-nav-link-inactive block rounded-2xl px-4 py-3 text-sm font-medium"
                  >
                    {switchTarget.label}
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
            <div className="w-full min-w-0 px-3 py-4 sm:px-4 sm:py-5 md:px-6 md:py-6">
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

              {showSubNavGroup && activeSubNavGroup ? (
                <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/70 px-3 py-3">
                  <p className="text-[11px] font-semibold uppercase tracking-[0.14em] text-rose-900/70">
                    {activeSubNavGroup.label}
                  </p>
                  <div className="mt-2 flex flex-wrap gap-2">
                    {visibleActiveSubNavItems.map((item) => {
                      const isActive = isItemActive(item)
                      return (
                        <Link
                          key={item.href}
                          href={item.href}
                          className={`rounded-xl border px-3 py-1.5 text-xs font-semibold transition ${
                            isActive
                              ? 'border-[var(--brand-ink)] bg-[var(--brand-ink)] text-white'
                              : 'border-[var(--brand-border)] bg-white text-rose-900 hover:bg-rose-100'
                          }`}
                        >
                          {item.label}
                        </Link>
                      )
                    })}
                  </div>
                </div>
              ) : null}
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
                    Schließen
                  </button>
                </div>
                <div className="flex-1 overflow-y-auto px-4 py-4">
                  <div className="space-y-4">
                    {visibleNavSections.map((section) => (
                      <div key={section.id}>
                        <p className="px-1 text-[11px] uppercase tracking-[0.18em] text-rose-900/60">
                          {section.label}
                        </p>
                        <div className="mt-2 space-y-2">
                          {section.items.map((item) => {
                            const isActive = isItemActive(item)

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
                        </div>
                      </div>
                    ))}
                    {showSubNavGroup && activeSubNavGroup ? (
                      <div>
                        <p className="px-1 text-[11px] uppercase tracking-[0.18em] text-rose-900/60">
                          {activeSubNavGroup.label}
                        </p>
                        <div className="mt-2 space-y-2">
                          {visibleActiveSubNavItems.map((item) => {
                            const isActive = isItemActive(item)
                            return (
                              <Link
                                key={`mobile-sub-${item.href}`}
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
                        </div>
                      </div>
                    ) : null}
                    {switchTarget ? (
                      <Link
                        href={switchTarget.href}
                        className="block rounded-xl bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900 hover:bg-rose-100"
                      >
                        {switchTarget.label}
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

          <div className="w-full min-w-0 px-3 py-6 sm:px-4 md:px-6 md:py-8">{children}</div>
        </div>
      </div>
    </main>
  )
}

export default function AdminLayout(props: Props) {
  return (
    <Suspense fallback={<div className="min-h-screen bg-white" />}>
      <AdminLayoutContent {...props} />
    </Suspense>
  )
}
