'use client'

import Link from 'next/link'
import { usePathname, useSearchParams } from 'next/navigation'
import { Suspense, useEffect, useMemo, useState } from 'react'
import PlatformBranding from '@/app/Components/admin/PlatformBranding'
import {
  getBusinessSettings,
  getMyEffectiveFeatureModules,
  getStoredAccessToken,
  getStoredTenantId,
  getPlatformBrandingSettings,
  type AccessPermission,
  type BusinessSettings,
  type EffectiveFeatureSetResponse,
  type PlatformBrandingSettings,
} from '@/lib/api'
import { isModuleEnabled, type AdminModuleKey } from '@/lib/admin-module-visibility'
import {
  clearSuperadminTenantContext,
  isSuperadminTenantPreviewEnabled,
} from '@/lib/superadmin-tenant-context'

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
  tooltip?: string
}

type NavSection = {
  id: string
  label: string
  defaultOpen?: boolean
  items: NavItem[]
}

type AdminUiMode = 'compact' | 'touch'
type HeaderInboxItem = {
  id: string
  title: string
  href?: string
  unread: boolean
}

const navSections: NavSection[] = [
  {
    id: 'dashboard',
    label: 'Dashboard',
    defaultOpen: true,
    items: [
      { href: '/admin', label: 'Dashboard', moduleKey: 'dashboard' },
    ],
  },
  {
    id: 'daily',
    label: 'Tagesgeschäft',
    defaultOpen: true,
    items: [
      { href: '/admin/orders', label: 'Bestellungen', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
      {
        href: '/admin/terminals',
        label: 'Küche / Orderdesk',
        moduleKey: 'displays',
        requiredPermission: 'ORDERS_READ',
      },
      {
        href: '/admin/drivers',
        label: 'Fahrer / Lieferung',
        moduleKey: 'drivers',
        requiredPermission: 'SETTINGS_READ',
        tooltip: 'Fahrerstatus, Zuweisung und Lieferablauf',
      },
    ],
  },
  {
    id: 'menu',
    label: 'Speisekarte',
    defaultOpen: true,
    items: [
      { href: '/admin/products?tab=overview', label: 'Übersicht', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/products', label: 'Produkte', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/categories', label: 'Kategorien', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      {
        href: '/admin/ingredients',
        label: 'Zutaten & Allergene',
        moduleKey: 'products',
        requiredPermission: 'PRODUCTS_READ',
      },
      {
        href: '/admin/products?tab=modifiers',
        label: 'Extras / Optionen',
        moduleKey: 'products',
        requiredPermission: 'PRODUCTS_READ',
      },
      {
        href: '/admin/business-templates',
        label: 'Business-Vorlagen',
        moduleKey: 'products',
        requiredPermission: 'PRODUCTS_WRITE',
      },
      {
        href: '/admin/products/pricing',
        label: 'Preise & Kalkulation',
        moduleKey: 'products',
        requiredPermission: 'PRODUCTS_READ',
      },
    ],
  },
  {
    id: 'devices',
    label: 'Geräte',
    items: [
      { href: '/admin/display-devices', label: 'Displays', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/screen-studio', label: 'Bildschirmstudio', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/terminals', label: 'OrderDesk-Geräte', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/drivers', label: 'Fahrergeräte', moduleKey: 'drivers', requiredPermission: 'SETTINGS_READ' },
    ],
  },
  {
    id: 'delivery',
    label: 'Lieferbetrieb',
    items: [
      { href: '/admin/app-settings?section=delivery-area', label: 'Lieferzonen', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/drivers', label: 'Fahrer', moduleKey: 'drivers', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/app-settings?section=delivery-priority', label: 'Touren', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
    ],
  },
  {
    id: 'marketing',
    label: 'Marketing',
    items: [
      { href: '/admin/actions', label: 'Aktionen', moduleKey: 'actions', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/actions?tab=vouchers', label: 'Gutscheine', moduleKey: 'actions', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/orders?tab=ratings', label: 'Bewertungen', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
    ],
  },
  {
    id: 'finance',
    label: 'Finanzen',
    items: [
      { href: '/admin/finanzen', label: 'Gebühren & Provisionen', moduleKey: 'payment', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/payments', label: 'Abrechnung', moduleKey: 'payment', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/closings/daily', label: 'Tagesabschluss', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
      { href: '/admin/closings', label: 'Auswertungen', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
    ],
  },
  {
    id: 'admin',
    label: 'Verwaltung',
    items: [
      { href: '/admin/staff', label: 'Benutzer & Rechte', moduleKey: 'staff', requiredPermission: 'USERS_READ' },
      { href: '/admin/app-settings?section=business', label: 'Filialdaten', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/settings', label: 'Einstellungen', moduleKey: 'settings', requiredPermission: 'SETTINGS_READ' },
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
  const [menuQuery, setMenuQuery] = useState('')
  const [openSectionIds, setOpenSectionIds] = useState<Set<string>>(
    () => new Set(navSections.filter((section) => section.defaultOpen).map((section) => section.id))
  )
  const [authChecked, setAuthChecked] = useState(false)
  const [hasValidSession, setHasValidSession] = useState(false)
  const [sessionTenantId, setSessionTenantId] = useState<string | null>(null)
  const [sessionActiveTenantName, setSessionActiveTenantName] = useState<string | null>(null)
  const [allowSuperadminTenantView, setAllowSuperadminTenantView] = useState(false)
  const [uiMode, setUiMode] = useState<AdminUiMode>('compact')
  const [uiModeReady, setUiModeReady] = useState(false)
  const [notificationOpen, setNotificationOpen] = useState(false)
  const [mailboxOpen, setMailboxOpen] = useState(false)
  const [notificationItems, setNotificationItems] = useState<HeaderInboxItem[]>([])
  const [mailboxItems, setMailboxItems] = useState<HeaderInboxItem[]>([])
  const [sessionWarningOpen, setSessionWarningOpen] = useState(false)
  const [sessionCountdown, setSessionCountdown] = useState(60)
  const enabledFeatureKeys = useMemo(() => {
    if (!featureScope) {
      return null
    }
    return new Set(featureScope.modules.filter((entry) => entry.enabled).map((entry) => entry.key))
  }, [featureScope])
  const normalizedRole = sessionRole.trim().toLowerCase()
  const unreadNotifications = notificationItems.filter((entry) => entry.unread).length
  const unreadMailboxItems = mailboxItems.filter((entry) => entry.unread).length
  const switchTarget =
    normalizedRole === 'superadmin'
      ? { href: '/superadmin', label: 'Zum Superadminbereich' }
      : normalizedRole === 'chainadmin'
        ? { href: '/chainadmin', label: 'Zum Kettenadminbereich' }
        : null

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
    if (!uiModeReady || typeof window === 'undefined') {
      return
    }
    window.localStorage.setItem('klarando.adminUiMode', uiMode)
    document.documentElement.dataset.adminUiMode = uiMode
  }, [uiMode, uiModeReady])

  useEffect(() => {
    if (!authChecked || !hasValidSession) {
      return
    }
    // TODO: Sobald Backend-Endpunkte verfügbar sind, hier echte Daten laden.
    setNotificationItems([])
    setMailboxItems([])
  }, [authChecked, hasValidSession])

  useEffect(() => {
    try {
      const rawSession =
        typeof window !== 'undefined' ? window.localStorage.getItem('sessionUser') : null
      if (!rawSession) {
        setPermissions(null)
        setHasValidSession(false)
        setSessionTenantId(null)
        setAllowSuperadminTenantView(false)
        setAuthChecked(true)
        return
      }

      const parsed = JSON.parse(rawSession) as {
        permissions?: string[]
        name?: string
        role?: string
        tenantId?: string | null
        activeTenantName?: string | null
      }
      const token = getStoredAccessToken()
      const tenantId = getStoredTenantId()
      setSessionName(parsed.name || '')
      setSessionRole(parsed.role || '')
      setSessionTenantId(tenantId || null)
      setSessionActiveTenantName(
        typeof parsed.activeTenantName === 'string' && parsed.activeTenantName.trim().length > 0
          ? parsed.activeTenantName.trim()
          : null
      )
      setHasValidSession(Boolean(token))
      setAllowSuperadminTenantView(isSuperadminTenantPreviewEnabled())
      if (!Array.isArray(parsed.permissions)) {
        setPermissions(null)
        setAuthChecked(true)
        return
      }

      setPermissions(new Set<string>(parsed.permissions))
      setAuthChecked(true)
    } catch {
      setPermissions(new Set<string>())
      setSessionName('')
      setSessionRole('')
      setSessionTenantId(null)
      setSessionActiveTenantName(null)
      setHasValidSession(false)
      setAllowSuperadminTenantView(false)
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
    if (!authChecked || !hasValidSession || !sessionTenantId) {
      return
    }
    if (
      normalizedRole === 'superadmin' &&
      pathname.startsWith('/admin') &&
      (!allowSuperadminTenantView || !sessionTenantId)
    ) {
      if (typeof window !== 'undefined') {
        window.location.href = '/superadmin'
      }
    }
  }, [authChecked, hasValidSession, normalizedRole, pathname, allowSuperadminTenantView, sessionTenantId])

  useEffect(() => {
    if (!authChecked || !hasValidSession) {
      return
    }
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
  }, [authChecked, hasValidSession, sessionTenantId])

  useEffect(() => {
    if (!authChecked || !hasValidSession || !sessionTenantId) {
      return
    }
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
  }, [authChecked, hasValidSession, sessionTenantId])

  useEffect(() => {
    if (!authChecked || !hasValidSession || !sessionTenantId) {
      return
    }
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
  }, [authChecked, hasValidSession, sessionTenantId])

  useEffect(() => {
    setMobileNavOpen(false)
  }, [pathname, searchKey])

  useEffect(() => {
    const onResize = () => {
      if (window.innerWidth >= 768) {
        setMobileNavOpen(false)
      }
    }

    window.addEventListener('resize', onResize)
    return () => window.removeEventListener('resize', onResize)
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
      logoutTimeout = setTimeout(() => {
        handleLogout()
      }, idleMs)
    }

    const onActivity = () => {
      startTimers()
    }

    const events: Array<keyof WindowEventMap> = ['mousemove', 'keydown', 'click', 'scroll', 'touchstart']
    events.forEach((eventName) => window.addEventListener(eventName, onActivity, { passive: true }))
    startTimers()

    return () => {
      clearTimers()
      events.forEach((eventName) => window.removeEventListener(eventName, onActivity))
    }
  }, [authChecked, hasValidSession])

  function handleLeaveTenant() {
    if (typeof window === 'undefined') return
    clearSuperadminTenantContext()
    window.location.href = '/superadmin'
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
    const [itemPath, itemQueryRaw] = item.href.split('?')
    const itemQuery = new URLSearchParams(itemQueryRaw || '')

    if (item.href.includes('focus=quick-order')) {
      return pathname === '/admin/suppliers' && focus === 'quick-order'
    }

    if (item.href.includes('focus=order-suggestion')) {
      return pathname === '/admin/suppliers' && focus === 'order-suggestion'
    }

    if (item.href === '/admin/suppliers') {
      return pathname === '/admin/suppliers' && !focus
    }

    if (itemPath === '/admin/closings') {
      return pathname === itemPath || pathname.startsWith('/admin/closings/')
    }

    if (itemPath === '/admin/displays') {
      return (
        pathname.startsWith('/admin/displays') ||
        pathname.startsWith('/admin/screen') ||
        pathname.startsWith('/admin/screen-studio') ||
        pathname.startsWith('/admin/terminals') ||
        pathname.startsWith('/admin/order-displays')
      )
    }

    if (pathname !== itemPath) {
      return false
    }

    if ([...itemQuery.keys()].length === 0) {
      return true
    }

    return [...itemQuery.entries()].every(([key, value]) => searchParams.get(key) === value)
  }
  function toggleSection(sectionId: string) {
    setOpenSectionIds((current) => {
      const next = new Set(current)
      if (next.has(sectionId)) {
        next.delete(sectionId)
      } else {
        next.add(sectionId)
      }
      return next
    })
  }
  const visibleNavSections = navSections
    .map((section) => ({
      ...section,
      items: section.items.filter((item) => {
        if (!isItemEnabled(item)) {
          return false
        }
        const normalizedQuery = menuQuery.trim().toLowerCase()
        if (!normalizedQuery) {
          return true
        }
        return item.label.toLowerCase().includes(normalizedQuery)
      }),
    }))
    .filter((section) => section.items.length > 0)

  useEffect(() => {
    const activeSections = visibleNavSections
      .filter((section) => section.items.some((item) => isItemActive(item)))
      .map((section) => section.id)
    if (activeSections.length === 0) return
    setOpenSectionIds((current) => {
      const next = new Set(current)
      let changed = false
      for (const sectionId of activeSections) {
        if (!next.has(sectionId)) {
          next.add(sectionId)
          changed = true
        }
      }
      return changed ? next : current
    })
  }, [pathname, searchKey, visibleNavSections])

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
      path.startsWith('/admin/screen') ||
      path.startsWith('/admin/screen-studio')
    ) {
      return 'displays'
    }
    if (path.startsWith('/admin/actions')) return 'actions'
    if (path.startsWith('/admin/finanzen')) return 'payment'
    if (path.startsWith('/admin/payments')) return 'payment'
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
  const requiresTenantContext =
    pathname === '/admin' || pathname.startsWith('/admin/')
  const missingTenantContext = requiresTenantContext && !sessionTenantId
  const isTouchMode = uiMode === 'touch'
  const sidebarWidthClass = isTouchMode ? 'w-[248px]' : 'w-[276px]'
  const contentOffsetClass = isTouchMode ? 'md:ml-[248px]' : 'md:ml-[276px]'
  const navLinkPaddingClass = isTouchMode ? 'px-4 py-3.5 text-sm' : 'px-3.5 py-2.5 text-[13px]'
  const navLinkClassBase = `block w-full rounded-xl font-medium transition-colors ${navLinkPaddingClass}`
  const pageSpacingClass = isTouchMode
    ? 'mx-auto w-full max-w-[1400px] min-w-0 px-3 py-6 sm:px-4 md:px-6 md:py-8'
    : 'mx-auto w-full max-w-[1500px] min-w-0 px-2 py-4 sm:px-3 md:px-5 md:py-6'
  const headerSpacingClass = isTouchMode
    ? 'w-full min-w-0 px-3 py-4 sm:px-4 sm:py-5 md:px-6 md:py-6'
    : 'w-full min-w-0 px-3 py-3 sm:px-4 sm:py-4 md:px-5 md:py-5'

  return (
    <main
      className={`safe-area-padding brand-shell klarando-admin-scope min-h-screen overflow-x-hidden ${
        isTouchMode ? 'klarando-touch-mode' : 'klarando-compact-mode'
      }`}
      data-admin-ui-mode={uiMode}
    >
      <div className="relative isolate min-h-screen min-w-0">
        <aside className={`brand-sidebar pointer-events-auto fixed inset-y-0 left-0 z-[120] hidden border-r border-slate-200 bg-white md:flex md:flex-col ${sidebarWidthClass}`}>
          <div className={`sticky top-0 z-10 border-b border-slate-200 bg-white ${isTouchMode ? 'px-6 py-6' : 'px-5 py-5'}`}>
            <PlatformBranding settings={platformBranding} area="sidebar" />
            <p className="mt-3 text-xs font-semibold uppercase tracking-[0.22em] text-slate-500">
              Klarando Plattform
            </p>
            <h1 className={`mt-2 font-bold text-slate-900 ${isTouchMode ? 'text-2xl' : 'text-[1.35rem]'}`}>Admin Panel</h1>
            <p className={`mt-2 text-slate-500 ${isTouchMode ? 'text-sm' : 'text-xs leading-relaxed'}`}>
              Zentrale Verwaltung für Produkte, Mitarbeiter und Prozesse.
            </p>
          </div>

          <nav className={`pointer-events-auto flex-1 overflow-y-auto ${isTouchMode ? 'px-4 py-6' : 'px-3 py-4'}`}>
            <div className="mb-4 rounded-2xl border border-slate-200 bg-slate-50 p-3">
              <p className="text-[11px] uppercase tracking-[0.16em] text-slate-500">Menüsuche</p>
              <input
                value={menuQuery}
                onChange={(event) => setMenuQuery(event.target.value)}
                placeholder="Menüpunkt suchen..."
                className={`mt-2 w-full rounded-xl border border-slate-200 bg-white text-slate-800 outline-none ${isTouchMode ? 'px-3 py-2 text-xs' : 'px-2.5 py-1.5 text-[11px]'}`}
              />
            </div>
            <div className={isTouchMode ? 'space-y-4' : 'space-y-3'}>
              {visibleNavSections.map((section) => (
                <div key={section.id}>
                  <button
                    type="button"
                    onClick={() => toggleSection(section.id)}
                    className="flex w-full items-center justify-between rounded-xl px-2 py-1 text-left"
                  >
                    <p className="pointer-events-none text-[11px] uppercase tracking-[0.18em] text-slate-500">
                      {section.label}
                    </p>
                    <span className="text-xs text-slate-500">{openSectionIds.has(section.id) ? '−' : '+'}</span>
                  </button>
                  {openSectionIds.has(section.id) ? (
                    <div className={isTouchMode ? 'mt-2 space-y-2' : 'mt-1.5 space-y-1.5'}>
                      {section.items.map((item) => {
                        const isActive = isItemActive(item)

                        return (
                          <a
                            key={item.href}
                            href={item.href}
                            aria-current={isActive ? 'page' : undefined}
                            title={item.tooltip || item.label}
                            className={`${navLinkClassBase} ${
                              isActive
                                ? 'bg-slate-900 text-white ring-1 ring-slate-900'
                                : 'bg-slate-50 text-slate-700 hover:bg-slate-100'
                            }`}
                            data-nav-anchor="admin-sidebar-link"
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
            <div className="mt-4 border-t border-slate-200 pt-4">
              <p className="pointer-events-none px-2 text-[11px] uppercase tracking-[0.18em] text-slate-500">
                Schnellzugriff
              </p>
              <div className="mt-2 space-y-2">
                {switchTarget ? (
                  <a
                    href={switchTarget.href}
                    title={switchTarget.label}
                    className={`${navLinkClassBase} bg-slate-50 text-slate-700 hover:bg-slate-100`}
                    data-nav-anchor="admin-sidebar-quicklink"
                  >
                    {switchTarget.label}
                  </a>
                ) : null}
                <button
                  type="button"
                  onClick={handleLogout}
                  title="Logout"
                  className={`block w-full rounded-xl border border-red-200 bg-red-50 text-left font-medium text-red-700 transition hover:bg-red-100 ${isTouchMode ? 'px-4 py-3 text-sm' : 'px-3 py-2 text-xs'}`}
                >
                  Logout
                </button>
              </div>
            </div>
          </nav>

          <div className={`sticky bottom-0 border-t border-slate-200 bg-white ${isTouchMode ? 'px-6 py-5' : 'px-5 py-4'}`}>
            <div className="rounded-2xl bg-slate-50 px-4 py-4 ring-1 ring-slate-200">
              <p className="text-xs uppercase tracking-wide text-slate-500">Bereich</p>
              <p className="mt-2 text-sm text-slate-900">{title}</p>
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
                    onClick={() => setMobileNavOpen(true)}
                    className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-xs font-semibold text-rose-900 transition hover:bg-rose-100 md:hidden"
                  >
                    Menü
                  </button>
                  <div className="brand-chip rounded-xl px-3 py-2 text-xs">
                    {sessionName || 'Benutzer'} {sessionRole ? `(${sessionRole})` : ''}
                  </div>
                  <div className="relative">
                    <button
                      type="button"
                      onClick={() => {
                        setNotificationOpen((current) => !current)
                        setMailboxOpen(false)
                      }}
                      className="relative rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs font-semibold text-rose-900 transition hover:bg-rose-100"
                    >
                      Glocke
                      {unreadNotifications > 0 ? (
                        <span className="absolute -right-1 -top-1 rounded-full bg-rose-600 px-1.5 py-0.5 text-[10px] font-bold text-white">
                          {unreadNotifications}
                        </span>
                      ) : null}
                    </button>
                    {notificationOpen ? (
                      <div className="absolute right-0 z-[140] mt-2 w-72 rounded-2xl border border-[var(--brand-border)] bg-white p-3 shadow-xl">
                        <div className="mb-2 flex items-center justify-between">
                          <p className="text-xs font-semibold uppercase tracking-wide text-rose-900/70">
                            Benachrichtigungen
                          </p>
                          <button
                            type="button"
                            onClick={() =>
                              setNotificationItems((current) =>
                                current.map((entry) => ({ ...entry, unread: false }))
                              )
                            }
                            className="text-[11px] font-semibold text-rose-700 hover:text-rose-900"
                          >
                            Alle als gelesen
                          </button>
                        </div>
                        {notificationItems.length === 0 ? (
                          <p className="text-xs text-rose-900/70">Derzeit keine neuen Einträge.</p>
                        ) : (
                          <ul className="space-y-1">
                            {notificationItems.map((entry) => (
                              <li key={entry.id} className="rounded-lg border border-rose-100 px-2 py-1 text-xs">
                                {entry.title}
                              </li>
                            ))}
                          </ul>
                        )}
                      </div>
                    ) : null}
                  </div>
                  <div className="relative">
                    <button
                      type="button"
                      onClick={() => {
                        setMailboxOpen((current) => !current)
                        setNotificationOpen(false)
                      }}
                      className="relative rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs font-semibold text-rose-900 transition hover:bg-rose-100"
                    >
                      Postfach
                      {unreadMailboxItems > 0 ? (
                        <span className="absolute -right-1 -top-1 rounded-full bg-rose-600 px-1.5 py-0.5 text-[10px] font-bold text-white">
                          {unreadMailboxItems}
                        </span>
                      ) : null}
                    </button>
                    {mailboxOpen ? (
                      <div className="absolute right-0 z-[140] mt-2 w-72 rounded-2xl border border-[var(--brand-border)] bg-white p-3 shadow-xl">
                        <p className="mb-2 text-xs font-semibold uppercase tracking-wide text-rose-900/70">
                          Nachrichten
                        </p>
                        {mailboxItems.length === 0 ? (
                          <p className="text-xs text-rose-900/70">Keine neuen Nachrichten.</p>
                        ) : (
                          <ul className="space-y-1">
                            {mailboxItems.map((entry) => (
                              <li key={entry.id} className="rounded-lg border border-rose-100 px-2 py-1 text-xs">
                                {entry.title}
                              </li>
                            ))}
                          </ul>
                        )}
                      </div>
                    ) : null}
                  </div>
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

              {normalizedRole === 'superadmin' && sessionTenantId ? (
                <div className="mt-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-3 py-3">
                  <p className="text-[11px] font-semibold uppercase tracking-[0.14em] text-emerald-900/70">
                    Superadmin-Tenantmodus
                  </p>
                  <p className="mt-1 text-sm text-emerald-900">
                    Sie verwalten aktuell: {sessionActiveTenantName || sessionTenantId}
                  </p>
                  <button
                    type="button"
                    onClick={handleLeaveTenant}
                    className="mt-2 rounded-lg border border-emerald-300 bg-white px-3 py-1.5 text-xs font-semibold text-emerald-900 hover:bg-emerald-100"
                  >
                    Filiale verlassen
                  </button>
                </div>
              ) : null}
            </div>
          </header>

          {mobileNavOpen ? (
            <div
              className="fixed inset-0 z-[120] bg-slate-950/55 p-3 md:hidden"
              onClick={() => setMobileNavOpen(false)}
              data-overlay="admin-mobile-nav"
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
                    {visibleNavSections.map((section) => (
                      <div key={section.id}>
                        <button
                          type="button"
                          onClick={() => toggleSection(section.id)}
                          className="flex w-full items-center justify-between px-1"
                        >
                          <p className="text-[11px] uppercase tracking-[0.18em] text-rose-900/60">
                            {section.label}
                          </p>
                          <span className="text-xs text-rose-900/70">{openSectionIds.has(section.id) ? '−' : '+'}</span>
                        </button>
                        {openSectionIds.has(section.id) ? (
                          <div className="mt-2 space-y-2">
                            {section.items.map((item) => {
                              const isActive = isItemActive(item)

                              return (
                                <a
                                  key={item.href}
                                  href={item.href}
                                  className={`block rounded-xl px-3 py-2 text-sm font-medium transition ${
                                    isActive
                                      ? 'brand-button-primary'
                                      : 'bg-rose-50 text-rose-900 hover:bg-rose-100'
                                  }`}
                                  title={item.tooltip || item.label}
                                >
                                  {item.label}
                                </a>
                              )
                            })}
                          </div>
                        ) : null}
                      </div>
                    ))}
                    {switchTarget ? (
                      <a
                        href={switchTarget.href}
                        className="block rounded-xl bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900 hover:bg-rose-100"
                        onClick={() => setMobileNavOpen(false)}
                      >
                        {switchTarget.label}
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
            ) : missingTenantContext ? (
              <section className="rounded-3xl border border-amber-200 bg-amber-50 px-5 py-6 text-sm text-amber-900">
                <p>Bitte zuerst eine Filiale im Superadminbereich auswählen.</p>
                <button
                  type="button"
                  onClick={() => {
                    if (typeof window !== 'undefined') {
                      window.location.href = '/superadmin'
                    }
                  }}
                  className="mt-3 rounded-xl border border-amber-300 bg-white px-3 py-2 text-xs font-semibold text-amber-900 hover:bg-amber-100"
                >
                  Zurück zum Superadmin
                </button>
              </section>
            ) : routeModuleAllowed ? (
              children
            ) : (
              <section className="rounded-3xl border border-amber-200 bg-amber-50 px-5 py-6 text-sm text-amber-900">
                Modul nicht aktiviert. Diese Funktion wurde fuer diese Filiale deaktiviert.
              </section>
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

export default function AdminLayout(props: Props) {
  return (
    <Suspense fallback={<div className="min-h-screen bg-white" />}>
      <AdminLayoutContent {...props} />
    </Suspense>
  )
}
