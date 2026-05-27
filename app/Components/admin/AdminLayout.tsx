'use client'

import Link from 'next/link'
import { usePathname, useSearchParams } from 'next/navigation'
import { Suspense, useEffect, useMemo, useState } from 'react'
import PlatformBranding from '@/app/Components/admin/PlatformBranding'
import {
  getBusinessSettings,
  getOrderManagementList,
  getMyEffectiveFeatureModules,
  getStoredAccessToken,
  getStoredTenantId,
  getPlatformBrandingSettings,
  type AccessPermission,
  type BusinessSettings,
  type EffectiveFeatureSetResponse,
  type PlatformBrandingSettings,
} from '@/lib/api'
import {
  collectComplaintAlerts,
  getComplaintReadState,
  markComplaintAlertsRead,
  type ComplaintAlertItem,
} from '@/lib/complaint-notifications'
import { isModuleEnabled, type AdminModuleKey } from '@/lib/admin-module-visibility'
import {
  clearSuperadminTenantContext,
  isSuperadminTenantPreviewEnabled,
} from '@/lib/superadmin-tenant-context'
import { ADMIN_SEARCH_PREPARED_DOMAINS, ADMIN_SEARCH_STATIC_ENTRIES } from '@/app/Components/admin/admin-search'

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
  items: NavItem[]
}

type MainNavSection = {
  id: string
  label: string
  href: string
  moduleKey: AdminModuleKey
  requiredPermission?: AccessPermission
}

type AdminUiMode = 'compact' | 'touch'
type HeaderInboxItem = {
  id: string
  title: string
  href?: string
  unread: boolean
  meta?: string
  status?: 'NEW' | 'IN_PROGRESS' | 'RESOLVED' | 'REJECTED'
}

const sectionNavSections: NavSection[] = [
  {
    id: 'dashboard',
    label: 'Dashboard',
    items: [
      { href: '/admin', label: 'Dashboard', moduleKey: 'dashboard' },
    ],
  },
  {
    id: 'daily',
    label: 'Tagesgeschäft',
    items: [
      { href: '/admin/bestellungen', label: 'Übersicht', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
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
    items: [
      { href: '/admin/menu', label: 'Workspace', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/products', label: 'Produkte', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      { href: '/admin/products?tab=categories', label: 'Kategorien', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
      {
        href: '/admin/products?tab=ingredients',
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
        href: '/admin/products?tab=pricing',
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
      { href: '/admin/devices', label: 'Workspace', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
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
      { href: '/admin/delivery', label: 'Workspace', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/app-settings?section=delivery-area', label: 'Lieferzonen', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/drivers', label: 'Fahrer', moduleKey: 'drivers', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/app-settings?section=delivery-priority', label: 'Touren', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
    ],
  },
  {
    id: 'marketing',
    label: 'Marketing',
    items: [
      { href: '/admin/marketing', label: 'Übersicht', moduleKey: 'actions', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/actions', label: 'Aktionen', moduleKey: 'actions', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/actions?tab=vouchers', label: 'Gutscheine', moduleKey: 'actions', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/orders?tab=ratings', label: 'Bewertungen', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
    ],
  },
  {
    id: 'finance',
    label: 'Finanzen',
    items: [
      { href: '/admin/billing', label: 'Workspace', moduleKey: 'payment', requiredPermission: 'ORDERS_READ' },
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
      { href: '/admin/verwaltung', label: 'Übersicht', moduleKey: 'staff', requiredPermission: 'USERS_READ' },
      { href: '/admin/staff', label: 'Benutzer & Rechte', moduleKey: 'staff', requiredPermission: 'USERS_READ' },
      { href: '/admin/app-settings?section=business', label: 'Filialdaten', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
      { href: '/admin/settings', label: 'Einstellungen', moduleKey: 'settings', requiredPermission: 'SETTINGS_READ' },
    ],
  },
]

const mainSidebarSections: MainNavSection[] = [
  { id: 'dashboard', label: 'Dashboard', href: '/admin', moduleKey: 'dashboard' },
  { id: 'daily', label: 'Bestellungen', href: '/admin/bestellungen', moduleKey: 'orders', requiredPermission: 'ORDERS_READ' },
  { id: 'menu', label: 'Speisekarte', href: '/admin/menu', moduleKey: 'products', requiredPermission: 'PRODUCTS_READ' },
  { id: 'devices', label: 'Geräte', href: '/admin/devices', moduleKey: 'displays', requiredPermission: 'ORDERS_READ' },
  { id: 'delivery', label: 'Lieferung', href: '/admin/delivery', moduleKey: 'app-settings', requiredPermission: 'SETTINGS_READ' },
  { id: 'marketing', label: 'Marketing', href: '/admin/marketing', moduleKey: 'actions', requiredPermission: 'SETTINGS_READ' },
  { id: 'finance', label: 'Finanzen', href: '/admin/billing', moduleKey: 'payment', requiredPermission: 'ORDERS_READ' },
  { id: 'admin', label: 'Verwaltung', href: '/admin/verwaltung', moduleKey: 'staff', requiredPermission: 'USERS_READ' },
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
  const [globalSearchQuery, setGlobalSearchQuery] = useState('')
  const [globalSearchOpen, setGlobalSearchOpen] = useState(false)
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
    const canReadOrders = permissions?.has('ORDERS_READ') ?? false
    const hasComplaintsPermission =
      permissions?.has('COMPLAINTS_READ') ?? true
    if (!canReadOrders || !hasComplaintsPermission) {
      setNotificationItems([])
      return
    }

    let cancelled = false

    const applyNotificationItems = (alerts: ComplaintAlertItem[]) => {
      const readState = getComplaintReadState()
      const mapped = alerts
        .slice(0, 8)
        .map((alert): HeaderInboxItem => {
          const isRead = Boolean(readState[alert.id])
          let status: HeaderInboxItem['status'] = 'IN_PROGRESS'
          if (alert.isResolved) {
            status = 'RESOLVED'
          } else if (!isRead) {
            status = 'NEW'
          }
          return {
            id: alert.id,
            title: `${alert.customerName} · Bestellung ${alert.orderId.slice(0, 8).toUpperCase()}`,
            href: '/admin/orders',
            unread: !isRead && !alert.isResolved,
            meta: `${alert.branchLabel} · ${new Date(alert.createdAt).toLocaleString('de-DE')}`,
            status,
          }
        })

      setNotificationItems(mapped)
    }

    const loadComplaintNotifications = async () => {
      try {
        const management = await getOrderManagementList({ limit: 100 })
        if (cancelled) return
        const alerts = collectComplaintAlerts(management.orders).filter((entry) => !entry.isResolved)
        applyNotificationItems(alerts)
      } catch {
        if (cancelled) return
        setNotificationItems([])
      }
    }

    void loadComplaintNotifications()
    const intervalId = window.setInterval(() => {
      void loadComplaintNotifications()
    }, 30000)

    return () => {
      cancelled = true
      window.clearInterval(intervalId)
    }
  }, [authChecked, hasValidSession, permissions, pathname])

  useEffect(() => {
    if (!authChecked || !hasValidSession) {
      return
    }
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
      if (itemPath === '/admin/products' && searchParams.has('tab')) {
        return false
      }
      return true
    }

    return [...itemQuery.entries()].every(([key, value]) => searchParams.get(key) === value)
  }
  const visibleNavSections = sectionNavSections
    .map((section) => ({
      ...section,
      items: section.items.filter((item) => isItemEnabled(item)),
    }))
    .filter((section) => section.items.length > 0)

  const visibleMainSections = mainSidebarSections.filter((section) => {
    if (
      !isModuleEnabled(section.moduleKey, {
        permissions,
        businessSettings,
        enabledFeatureKeys,
      })
    ) {
      return false
    }
    if (!section.requiredPermission || permissions === null) return true
    return permissions.has(section.requiredPermission)
  })
  const visibleMainAreas = [
    ...visibleMainSections,
    ...(normalizedRole === 'superadmin' || normalizedRole === 'chainadmin'
      ? [{
          id: 'superadmin',
          label: 'Superadmin',
          href: normalizedRole === 'superadmin' ? '/superadmin' : '/chainadmin',
        }]
      : []),
  ]

  const activeSection =
    visibleNavSections.find((section) => section.items.some((item) => isItemActive(item))) ??
    visibleNavSections.find((section) => section.id === 'dashboard') ??
    visibleNavSections[0]

  const contextualTabs = activeSection?.items ?? []

  const globalSearchIndex = useMemo(() => {
    const fromNav = visibleNavSections.flatMap((section) =>
      section.items.map((item) => ({
        href: item.href,
        label: item.label,
        domain: 'menu',
        keywords: [section.label, item.label, item.href],
      }))
    )
    return [...fromNav, ...ADMIN_SEARCH_STATIC_ENTRIES]
  }, [visibleNavSections])

  const globalSearchResults = useMemo(() => {
    const query = globalSearchQuery.trim().toLowerCase()
    if (!query) return []
    return globalSearchIndex
      .filter((entry) =>
        entry.keywords.some((keyword) => keyword.toLowerCase().includes(query))
      )
      .slice(0, 8)
  }, [globalSearchIndex, globalSearchQuery])

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
        <aside className={`brand-sidebar pointer-events-auto fixed inset-y-0 left-0 z-[120] hidden border-r border-white/10 md:flex md:flex-col ${sidebarWidthClass}`}>
          <div className={`sticky top-0 z-10 border-b border-white/15 ${isTouchMode ? 'px-6 py-6' : 'px-5 py-5'}`}>
            <PlatformBranding settings={platformBranding} area="sidebar" />
            <p className="mt-3 text-xs font-semibold uppercase tracking-[0.22em] text-orange-200">
              Klarando Plattform
            </p>
            <h1 className={`mt-2 font-bold text-white ${isTouchMode ? 'text-2xl' : 'text-[1.35rem]'}`}>Admin Panel</h1>
            <p className={`mt-2 text-orange-100/80 ${isTouchMode ? 'text-sm' : 'text-xs leading-relaxed'}`}>
              Zentrale Verwaltung für Produkte, Mitarbeiter und Prozesse.
            </p>
          </div>

          <nav className={`pointer-events-auto flex-1 overflow-y-auto ${isTouchMode ? 'px-4 py-6' : 'px-3 py-4'}`}>
            <div className={isTouchMode ? 'space-y-4' : 'space-y-3'}>
              {visibleMainAreas.map((section) => {
                const isActive =
                    activeSection?.id === section.id ||
                    (section.id === 'dashboard' && pathname === '/admin')
                return (
                  <a
                    key={section.id}
                    href={section.href}
                    aria-current={isActive ? 'page' : undefined}
                    title={section.label}
                    className={`${navLinkClassBase} brand-nav-link ${
                      isActive ? 'brand-nav-link-active' : 'brand-nav-link-inactive'
                    }`}
                    data-nav-anchor="admin-sidebar-link"
                    onClick={() => setMobileNavOpen(false)}
                  >
                    {section.label}
                  </a>
                )
              })}
            </div>
            <div className="mt-4 border-t border-white/15 pt-4">
              <p className="pointer-events-none px-2 text-[11px] uppercase tracking-[0.18em] text-orange-100/70">
                Schnellzugriff
              </p>
              <div className="mt-2 space-y-2">
                {switchTarget ? (
                  <a
                    href={switchTarget.href}
                    title={switchTarget.label}
                    className={`${navLinkClassBase} brand-nav-link brand-nav-link-inactive`}
                    data-nav-anchor="admin-sidebar-quicklink"
                  >
                    {switchTarget.label}
                  </a>
                ) : null}
                <button
                  type="button"
                  onClick={handleLogout}
                  title="Logout"
                  className={`block w-full rounded-xl border border-red-300 bg-red-500/15 text-left font-medium text-red-100 transition hover:bg-red-500/25 ${isTouchMode ? 'px-4 py-3 text-sm' : 'px-3 py-2 text-xs'}`}
                >
                  Logout
                </button>
              </div>
            </div>
          </nav>

          <div className={`sticky bottom-0 border-t border-white/15 ${isTouchMode ? 'px-6 py-5' : 'px-5 py-4'}`}>
            <div className="rounded-2xl bg-white/10 px-4 py-4 ring-1 ring-white/20">
              <p className="text-xs uppercase tracking-wide text-orange-100/80">Bereich</p>
              <p className="mt-2 text-sm text-white">{title}</p>
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
                  <div className="relative hidden sm:block">
                    <input
                      value={globalSearchQuery}
                      onChange={(event) => {
                        setGlobalSearchQuery(event.target.value)
                        setGlobalSearchOpen(true)
                      }}
                      onFocus={() => setGlobalSearchOpen(true)}
                      onBlur={() => setTimeout(() => setGlobalSearchOpen(false), 120)}
                      placeholder="Suche: Menü, Produkte, Geräte, Einstellungen..."
                      className="w-[300px] rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs text-rose-900 outline-none"
                    />
                    {globalSearchOpen && globalSearchResults.length > 0 ? (
                      <div className="absolute right-0 z-[160] mt-2 w-[340px] rounded-2xl border border-[var(--brand-border)] bg-white p-2 shadow-xl">
                        {globalSearchResults.map((entry) => (
                          <a
                            key={`${entry.href}-${entry.label}`}
                            href={entry.href}
                            className="block rounded-xl px-3 py-2 text-sm text-rose-900 transition hover:bg-rose-50"
                          >
                            <span className="flex items-center justify-between gap-2">
                              <span>{entry.label}</span>
                              <span className="rounded-full bg-slate-100 px-2 py-0.5 text-[10px] font-semibold uppercase tracking-wide text-slate-500">
                                {entry.domain}
                              </span>
                            </span>
                          </a>
                        ))}
                        <p className="px-3 pb-1 pt-2 text-[11px] text-slate-500">
                          Vorbereitete Entitätssuche: {ADMIN_SEARCH_PREPARED_DOMAINS.join(', ')}
                        </p>
                      </div>
                    ) : null}
                  </div>
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
                      title="Benachrichtigungen"
                      aria-label="Benachrichtigungen"
                      className="relative inline-flex h-9 w-9 items-center justify-center rounded-xl border border-[var(--brand-border)] bg-white text-rose-900 transition hover:bg-rose-100"
                    >
                      <svg
                        aria-hidden="true"
                        viewBox="0 0 24 24"
                        className="h-4 w-4"
                        fill="none"
                        stroke="currentColor"
                        strokeWidth="2"
                        strokeLinecap="round"
                        strokeLinejoin="round"
                      >
                        <path d="M15 17h5l-1.4-1.4A2 2 0 0 1 18 14.2V11a6 6 0 1 0-12 0v3.2a2 2 0 0 1-.6 1.4L4 17h5" />
                        <path d="M9.7 17a2.3 2.3 0 0 0 4.6 0" />
                      </svg>
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
                              setNotificationItems((current) => {
                                const unreadIds = current.filter((entry) => entry.unread).map((entry) => entry.id)
                                markComplaintAlertsRead(unreadIds)
                                return current.map((entry) => ({ ...entry, unread: false, status: entry.status === 'RESOLVED' ? 'RESOLVED' : 'IN_PROGRESS' }))
                              })
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
                                <div className="flex items-start justify-between gap-2">
                                  <div>
                                    {entry.href ? (
                                      <Link href={entry.href} className="font-semibold text-rose-900 underline-offset-2 hover:underline">
                                        {entry.title}
                                      </Link>
                                    ) : (
                                      <p className="font-semibold text-rose-900">{entry.title}</p>
                                    )}
                                    {entry.meta ? <p className="text-[11px] text-rose-900/70">{entry.meta}</p> : null}
                                  </div>
                                  <span className={`rounded-full px-1.5 py-0.5 text-[10px] font-bold ${
                                    entry.status === 'NEW'
                                      ? 'bg-rose-600 text-white'
                                      : entry.status === 'RESOLVED'
                                        ? 'bg-emerald-100 text-emerald-700'
                                        : 'bg-amber-100 text-amber-700'
                                  }`}>
                                    {entry.status === 'NEW' ? 'NEW' : entry.status === 'RESOLVED' ? 'RESOLVED' : 'IN_PROGRESS'}
                                  </span>
                                </div>
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
                      title="Postfach"
                      aria-label="Postfach"
                      className="relative inline-flex h-9 w-9 items-center justify-center rounded-xl border border-[var(--brand-border)] bg-white text-rose-900 transition hover:bg-rose-100"
                    >
                      <svg
                        aria-hidden="true"
                        viewBox="0 0 24 24"
                        className="h-4 w-4"
                        fill="none"
                        stroke="currentColor"
                        strokeWidth="2"
                        strokeLinecap="round"
                        strokeLinejoin="round"
                      >
                        <path d="M4 7h16v10H4z" />
                        <path d="m4 8 8 6 8-6" />
                      </svg>
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

              {contextualTabs.length > 0 ? (
                <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-white/90 px-3 py-3">
                  <p className="text-[11px] font-semibold uppercase tracking-[0.16em] text-rose-900/70">
                    {activeSection?.label || 'Bereich'}
                  </p>
                  <div className="mt-2 flex flex-wrap gap-2">
                    {contextualTabs.map((tab) => {
                      const active = isItemActive(tab)
                      return (
                        <a
                          key={tab.href}
                          href={tab.href}
                          title={tab.tooltip || tab.label}
                          className={`rounded-xl px-3 py-2 text-xs font-semibold transition ${
                            active
                              ? 'brand-button-primary text-white'
                              : 'border border-[var(--brand-border)] bg-rose-50 text-rose-900 hover:bg-rose-100'
                          }`}
                        >
                          {tab.label}
                        </a>
                      )
                    })}
                  </div>
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
                    {visibleMainAreas.map((section) => {
                      const isActive =
                        activeSection?.id === section.id ||
                        (section.id === 'dashboard' && pathname === '/admin')
                      return (
                        <a
                          key={section.id}
                          href={section.href}
                          className={`block rounded-xl px-3 py-2 text-sm font-medium transition ${
                            isActive ? 'brand-button-primary text-white' : 'bg-rose-50 text-rose-900 hover:bg-rose-100'
                          }`}
                        >
                          {section.label}
                        </a>
                      )
                    })}
                    {contextualTabs.length > 0 ? (
                      <div className="rounded-2xl border border-rose-200 bg-rose-50 p-3">
                        <p className="text-[11px] uppercase tracking-[0.16em] text-rose-900/70">
                          {activeSection?.label || 'Bereich'}
                        </p>
                        <div className="mt-2 space-y-2">
                          {contextualTabs.map((tab) => {
                            const active = isItemActive(tab)
                            return (
                              <a
                                key={tab.href}
                                href={tab.href}
                                title={tab.tooltip || tab.label}
                                className={`block rounded-xl px-3 py-2 text-sm font-medium transition ${
                                  active
                                    ? 'brand-button-primary text-white'
                                    : 'bg-white text-rose-900 hover:bg-rose-100'
                                }`}
                              >
                                {tab.label}
                              </a>
                            )
                          })}
                        </div>
                      </div>
                    ) : null}
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

          <div className={`relative z-10 ${pageSpacingClass} pb-8`}>
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
          <footer className="mt-8 border-t border-[var(--brand-border)] bg-white px-4 py-3">
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
