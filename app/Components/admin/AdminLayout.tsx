'use client'

import Link from 'next/link'
import { usePathname, useSearchParams } from 'next/navigation'
import { Suspense, useEffect, useMemo, useState } from 'react'
import PlatformBranding from '@/app/Components/admin/PlatformBranding'
import {
  getBusinessSettings,
  getMyEffectiveFeatureModules,
  getPlatformBrandingSettings,
  type AccessPermission,
  type BusinessSettings,
  type EffectiveFeatureSetResponse,
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
    id: 'overview',
    label: 'Übersicht',
    items: [
      { href: '/admin', label: 'Dashboard', moduleKey: 'dashboard' },
    ],
  },
  {
    id: 'orders',
    label: 'Bestellungen',
    items: [
      { href: '/admin/orders', label: 'Bestellungen', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
    ],
  },
  {
    id: 'products',
    label: 'Produkte',
    items: [
      { href: '/admin/products', label: 'Produkte', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/business-templates', label: 'Business-Vorlagen', moduleKey: 'products', requiredPermission: 'PRODUCTS_WRITE' },
      { href: '/admin/categories', label: 'Kategorien', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/ingredients', label: 'Zutaten & Allergene', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/calculation', label: 'Preise & Kalkulation', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/actions', label: 'Aktionen', moduleKey: 'actions', requiredPermission: 'PRODUCTS_READ' },
    ],
  },
  {
    id: 'operations',
    label: 'Betrieb',
    items: [
      { href: '/admin/staff', label: 'Mitarbeiter', moduleKey: 'staff', requiredPermission: 'USERS_READ' },
      { href: '/admin/settings', label: 'Einstellungen', moduleKey: 'settings', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/app-settings', label: 'Öffnungszeiten & Lieferung', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/drivers', label: 'Fahrer-App', moduleKey: 'drivers', requiredPermission: 'SETTINGS_READ' },
    ],
  },
  {
    id: 'devices',
    label: 'Geräte',
    items: [
      { href: '/admin/displays', label: 'Displays', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/terminals', label: 'OrderDesk & Terminals', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/order-displays', label: 'Order-Displays', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/screen', label: 'Display-Design', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
    ],
  },
  {
    id: 'stock',
    label: 'Lager',
    items: [
      { href: '/admin/stock', label: 'Bestand', moduleKey: 'inventory', requiredPermission: 'INVENTORY_READ' },
      { href: '/admin/suppliers', label: 'Lieferanten', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
    ],
  },
  {
    id: 'reports',
    label: 'Auswertung',
    items: [
      { href: '/admin/closings', label: 'Tagesabschluss', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
    ],
  },
  {
    id: 'design',
    label: 'Design',
    items: [
      { href: '/admin/screen', label: 'Display-Design', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/app-settings', label: 'Branding', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
    ],
  },
]

const subNavGroups: SubNavGroup[] = [
  {
    id: 'catalog',
    label: 'Unterkategorien: Produkte',
    routePrefixes: ['/admin/products', '/admin/business-templates', '/admin/categories', '/admin/ingredients', '/admin/calculation', '/admin/actions'],
    items: [
      { href: '/admin/products', label: 'Produkte', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/business-templates', label: 'Business-Vorlagen', moduleKey: 'products', requiredPermission: 'PRODUCTS_WRITE' },
      { href: '/admin/categories', label: 'Kategorien', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/ingredients', label: 'Zutaten', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/ingredients', label: 'Allergene', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/calculation', label: 'Preise & Kalkulation', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/actions', label: 'Aktionen', moduleKey: 'actions', requiredPermission: 'PRODUCTS_READ' },
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
      { href: '/admin/screen', label: 'Display-Design', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
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
    label: 'Unterkategorien: Betrieb',
    routePrefixes: ['/admin/drivers', '/admin/app-settings', '/admin/settings', '/admin/staff'],
    items: [
      { href: '/admin/staff', label: 'Mitarbeiter', moduleKey: 'staff', requiredPermission: 'USERS_READ' },
      { href: '/admin/drivers', label: 'Fahrer-App', moduleKey: 'drivers', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/app-settings', label: 'Öffnungszeiten & Lieferung', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
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
  const [featureScope, setFeatureScope] = useState<EffectiveFeatureSetResponse | null>(null)
  const [platformBranding, setPlatformBranding] = useState<PlatformBrandingSettings | null>(null)
  const [mobileNavOpen, setMobileNavOpen] = useState(false)
  const [isSidebarCollapsed, setIsSidebarCollapsed] = useState(false)
  const enabledFeatureKeys = useMemo(() => {
    if (!featureScope) {
      return null
    }
    return new Set(featureScope.modules.filter((entry) => entry.enabled).map((entry) => entry.key))
  }, [featureScope])
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
    let cancelled = false

    async function loadFeatureScope() {
      try {
        const effective = await getMyEffectiveFeatureModules()
        if (!cancelled) {
          setFeatureScope(effective)
        }
      } catch {
        if (!cancelled) {
          setFeatureScope(null)
        }
      }
    }

    void loadFeatureScope()
    return () => {
      cancelled = true
    }
  }, [])

  useEffect(() => {
    setMobileNavOpen(false)
  }, [pathname, searchKey])

  useEffect(() => {
    const storageKey = 'klarando.admin.sidebar.collapsed.v1'
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
    try {
      window.localStorage.setItem('klarando.admin.sidebar.collapsed.v1', isSidebarCollapsed ? '1' : '0')
    } catch {
      // ignore write failures
    }
  }, [isSidebarCollapsed])

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
        enabledFeatureKeys,
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

  function inferPathModuleKey(path: string): AdminModuleKey | null {
    if (path === '/admin') return 'dashboard'
    if (path.startsWith('/admin/products') || path.startsWith('/admin/business-templates') || path.startsWith('/admin/categories') || path.startsWith('/admin/ingredients') || path.startsWith('/admin/suppliers') || path.startsWith('/admin/calculation')) {
      return 'products'
    }
    if (path.startsWith('/admin/stock')) return 'inventory'
    if (path.startsWith('/admin/orders') || path.startsWith('/admin/closings')) return 'orders'
    if (
      path.startsWith('/admin/displays') ||
      path.startsWith('/admin/terminals') ||
      path.startsWith('/admin/order-displays') ||
      path.startsWith('/admin/screen')
    ) {
      return 'displays'
    }
    if (path.startsWith('/admin/actions')) return 'actions'
    if (path.startsWith('/admin/staff')) return 'staff'
    if (path.startsWith('/admin/drivers')) return 'drivers'
    if (path.startsWith('/admin/app-settings')) return 'app-settings'
    if (path.startsWith('/admin/settings')) return 'settings'
    return null
  }

  const routeModuleKey = inferPathModuleKey(pathname)
  const routeModuleAllowed = routeModuleKey
    ? isModuleEnabled(routeModuleKey, {
        permissions,
        businessSettings,
        enabledFeatureKeys,
      })
    : true

  return (
    <main className="safe-area-padding brand-shell min-h-screen overflow-x-hidden">
      <div className="flex min-h-screen min-w-0">
        <aside
          className={`brand-sidebar hidden shrink-0 border-r border-white/10 md:flex md:flex-col ${
            isSidebarCollapsed ? 'w-20' : 'w-72'
          }`}
        >
          <div className="border-b border-white/15 px-6 py-6">
            <PlatformBranding settings={platformBranding} area="sidebar" />
            {!isSidebarCollapsed ? (
              <>
                <p className="mt-3 text-xs font-semibold uppercase tracking-[0.22em] text-orange-200">
                  Klarando Plattform
                </p>
                <h1 className="mt-2 text-2xl font-bold">Admin Panel</h1>
                <p className="mt-2 text-sm text-orange-100/80">
                  Zentrale Verwaltung für Produkte, Mitarbeiter und Prozesse.
                </p>
              </>
            ) : null}
          </div>

          <nav className="flex-1 overflow-y-auto px-4 py-6">
            <div className="space-y-4">
              {visibleNavSections.map((section) => (
                <div key={section.id}>
                  {!isSidebarCollapsed ? (
                    <p className="px-2 text-[11px] uppercase tracking-[0.18em] text-orange-100/70">
                      {section.label}
                    </p>
                  ) : null}
                  <div className="mt-2 space-y-2">
                    {section.items.map((item) => {
                      const isActive = isItemActive(item)

                      return (
                        <Link
                          key={item.href}
                          href={item.href}
                          title={item.label}
                          className={`brand-nav-link block rounded-2xl px-4 py-3 text-sm font-medium ${
                            isActive ? 'brand-nav-link-active' : 'brand-nav-link-inactive'
                          }`}
                        >
                          {isSidebarCollapsed ? item.label.slice(0, 1) : item.label}
                        </Link>
                      )
                    })}
                  </div>
                </div>
              ))}
            </div>

            {!isSidebarCollapsed && showSubNavGroup && activeSubNavGroup ? (
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
                    title={switchTarget.label}
                    className="brand-nav-link brand-nav-link-inactive block rounded-2xl px-4 py-3 text-sm font-medium"
                  >
                    {isSidebarCollapsed ? '>>' : switchTarget.label}
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
            <div className="fixed inset-0 z-50 bg-slate-950/55 p-3 md:hidden">
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

          <div className="mx-auto w-full max-w-[1400px] min-w-0 px-3 py-6 sm:px-4 md:px-6 md:py-8">
            {routeModuleAllowed ? (
              children
            ) : (
              <section className="rounded-3xl border border-amber-200 bg-amber-50 px-5 py-6 text-sm text-amber-900">
                Modul nicht aktiviert. Diese Funktion wurde fuer diese Filiale deaktiviert.
              </section>
            )}
          </div>
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
