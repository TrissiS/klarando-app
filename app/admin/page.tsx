'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import AdminScreenPreviews from '@/app/Components/admin/AdminScreenPreviews'
import AdminStats from '@/app/Components/admin/AdminStats'
import {
  getOrderManagementList,
  getAdminOrderRatingsDashboard,
  getAdminOrderDashboard,
  getActions,
  type AdminOrderRatingsDashboard,
  type AdminOrderDashboard,
  getCategories,
  getIngredients,
  getOrderDisplays,
  getOrderTerminals,
  getProducts,
  getScreenDevices,
  getScreenProducts,
  type OrderDisplay,
  type OrderTerminal,
  type ScreenDevice,
  getSuppliers,
} from '@/lib/api'
import { isModuleEnabled } from '@/lib/admin-module-visibility'

export default function AdminPage() {
  const [categoriesCount, setCategoriesCount] = useState(0)
  const [productsCount, setProductsCount] = useState(0)
  const [ingredientsCount, setIngredientsCount] = useState(0)
  const [suppliersCount, setSuppliersCount] = useState(0)
  const [actionsCount, setActionsCount] = useState(0)
  const [screenDevicesCount, setScreenDevicesCount] = useState(0)
  const [screenVisibleProductsCount, setScreenVisibleProductsCount] = useState(0)
  const [orderTerminalCount, setOrderTerminalCount] = useState(0)
  const [orderDisplayCount, setOrderDisplayCount] = useState(0)
  const [checkoutReadyTerminalCount, setCheckoutReadyTerminalCount] = useState(0)
  const [orderTerminals, setOrderTerminals] = useState<OrderTerminal[]>([])
  const [orderDisplays, setOrderDisplays] = useState<OrderDisplay[]>([])
  const [screenDevices, setScreenDevices] = useState<ScreenDevice[]>([])
  const [salesDashboard, setSalesDashboard] = useState<AdminOrderDashboard | null>(null)
  const [ratingsDashboard, setRatingsDashboard] = useState<AdminOrderRatingsDashboard | null>(null)
  const [openComplaintsCount, setOpenComplaintsCount] = useState(0)
  const [loadWarning, setLoadWarning] = useState<string | null>(null)
  const [isRefreshing, setIsRefreshing] = useState(false)
  const [autoRefreshEnabled, setAutoRefreshEnabled] = useState(true)
  const [lastUpdatedAt, setLastUpdatedAt] = useState<Date | null>(null)
  const [dashboardStorageScope, setDashboardStorageScope] = useState('default')
  const [grantedPermissions, setGrantedPermissions] = useState<Set<string> | null>(null)
  const [visibleSectionIds, setVisibleSectionIds] = useState<string[]>([
    'stats',
    'sales',
    'liveLinks',
    'previews',
  ])
  const [refreshTick, setRefreshTick] = useState(0)
  const [draggingSection, setDraggingSection] = useState<string | null>(null)
  const [sectionOrder, setSectionOrder] = useState<string[]>([
    'stats',
    'sales',
    'liveLinks',
    'previews',
  ])
  const sectionMeta = [
    { id: 'stats', label: 'Kennzahlen' },
    { id: 'sales', label: 'Umsatz & Bewertung' },
    { id: 'liveLinks', label: 'Aktive Links Screens/Displays' },
    { id: 'previews', label: 'Bildschirm-Vorschau' },
  ] as const
  const moduleContext = { permissions: grantedPermissions }
  const productsModuleEnabled = isModuleEnabled('products', moduleContext)
  const inventoryModuleEnabled = isModuleEnabled('inventory', moduleContext)
  const ordersModuleEnabled = isModuleEnabled('orders', moduleContext)
  const displaysModuleEnabled = isModuleEnabled('displays', moduleContext)
  const actionsModuleEnabled = isModuleEnabled('actions', moduleContext)
  const sectionAvailability: Record<(typeof sectionMeta)[number]['id'], boolean> = {
    stats:
      productsModuleEnabled ||
      inventoryModuleEnabled ||
      ordersModuleEnabled ||
      displaysModuleEnabled ||
      actionsModuleEnabled,
    sales: ordersModuleEnabled,
    liveLinks: ordersModuleEnabled || displaysModuleEnabled,
    previews: displaysModuleEnabled,
  }
  const availableSectionMeta = sectionMeta.filter((section) => sectionAvailability[section.id])
  const availableSectionIds = availableSectionMeta.map((section) => section.id)
  const availableSectionIdSet = useMemo(
    () => new Set<string>(availableSectionIds),
    [availableSectionIds]
  )
  const visibleStatCardIds = [
    ...(productsModuleEnabled ? ['categories', 'products', 'ingredients'] : []),
    ...(inventoryModuleEnabled ? ['suppliers'] : []),
    ...(actionsModuleEnabled ? ['actions'] : []),
    ...(displaysModuleEnabled ? ['screens-active', 'screen-products', 'terminals', 'order-displays'] : []),
    ...(ordersModuleEnabled ? ['checkout-ready'] : []),
  ]

  useEffect(() => {
    let cancelled = false

    async function loadData(options: { silent?: boolean } = {}) {
      setLoadWarning(null)
      setIsRefreshing(true)

      const result = await Promise.allSettled([
        getCategories(),
        getProducts(),
        getIngredients(),
        getSuppliers(),
        getActions(),
        getScreenDevices(),
        getScreenProducts({ showOnScreen: true }),
        getOrderTerminals(),
        getOrderDisplays(),
        getAdminOrderDashboard(30),
        getAdminOrderRatingsDashboard(180),
        getOrderManagementList({ status: 'all', source: 'ALL', limit: 300 }),
      ])

      const failedSections: string[] = []
      const fromResult = <T,>(entry: PromiseSettledResult<T>, fallback: T, section: string) => {
        if (entry.status === 'fulfilled') {
          return entry.value
        }

        const reasonText =
          entry.reason instanceof Error ? entry.reason.message : String(entry.reason)
        console.warn(`ADMIN DASHBOARD LOAD WARNING (${section}): ${reasonText}`)
        failedSections.push(section)
        return fallback
      }

      const categories = fromResult(result[0], [] as Awaited<ReturnType<typeof getCategories>>, 'Kategorien')
      const products = fromResult(result[1], [] as Awaited<ReturnType<typeof getProducts>>, 'Produkte')
      const ingredients = fromResult(
        result[2],
        [] as Awaited<ReturnType<typeof getIngredients>>,
        'Zutaten'
      )
      const suppliers = fromResult(result[3], [] as Awaited<ReturnType<typeof getSuppliers>>, 'Lieferanten')
      const actions = fromResult(result[4], [] as Awaited<ReturnType<typeof getActions>>, 'Aktionen')
      const screenDevices = fromResult(
        result[5],
        [] as Awaited<ReturnType<typeof getScreenDevices>>,
        'Bildschirme'
      )
      const screenProducts = fromResult(
        result[6],
        [] as Awaited<ReturnType<typeof getScreenProducts>>,
        'Bildschirm-Produkte'
      )
      const orderTerminals = fromResult(
        result[7],
        [] as Awaited<ReturnType<typeof getOrderTerminals>>,
        'Bestellterminals'
      )
      const orderDisplays = fromResult(
        result[8],
        [] as Awaited<ReturnType<typeof getOrderDisplays>>,
        'Bestell-Displays'
      )
      const dashboardSales = fromResult(
        result[9],
        null as Awaited<ReturnType<typeof getAdminOrderDashboard>> | null,
        'Umsatzdaten'
      )
      const dashboardRatings = fromResult(
        result[10],
        null as Awaited<ReturnType<typeof getAdminOrderRatingsDashboard>> | null,
        'Bewertungen'
      )
      const managementOrders = fromResult(
        result[11],
        null as Awaited<ReturnType<typeof getOrderManagementList>> | null,
        'Reklamationen'
      )

      if (cancelled) {
        return
      }

      setCategoriesCount(categories.length)
      setProductsCount(products.length)
      setIngredientsCount(ingredients.length)
      setSuppliersCount(suppliers.length)
      setActionsCount(actions.length)
      setScreenDevicesCount(screenDevices.filter((entry) => entry.isActive).length)
      setScreenVisibleProductsCount(screenProducts.length)
      setOrderTerminalCount(orderTerminals.length)
      setOrderDisplayCount(orderDisplays.length)
      setCheckoutReadyTerminalCount(
        orderTerminals.filter(
          (entry) => entry.isActive && (entry.allowCashPayment || entry.allowCardPayment)
        ).length
      )
      setOrderTerminals(orderTerminals)
      setOrderDisplays(orderDisplays)
      setScreenDevices(screenDevices)
      setSalesDashboard(dashboardSales)
      setRatingsDashboard(dashboardRatings)
      setOpenComplaintsCount(
        managementOrders
          ? managementOrders.orders.filter(
              (entry) => (entry.complaintOpen ?? false) || (entry.complaintCount ?? 0) > 0
            ).length
          : 0
      )
      setLastUpdatedAt(new Date())

      if (failedSections.length > 0) {
        setLoadWarning(`Teilweise geladen: ${failedSections.join(', ')}`)
      } else {
        setLoadWarning(null)
      }

      void options.silent
      setIsRefreshing(false)
    }

    void loadData()

    if (!autoRefreshEnabled) {
      return () => {
        cancelled = true
      }
    }

    const intervalId = window.setInterval(() => {
      void loadData({ silent: true })
    }, 45000)

    return () => {
      cancelled = true
      window.clearInterval(intervalId)
    }
  }, [refreshTick, autoRefreshEnabled])

  useEffect(() => {
    try {
      const rawSession = window.localStorage.getItem('sessionUser')
      const parsed = rawSession
        ? (JSON.parse(rawSession) as {
            userId?: string
            email?: string
            role?: string
            permissions?: string[]
          })
        : null
      const userPart = parsed?.userId || parsed?.email || parsed?.role || 'default'
      setDashboardStorageScope(String(userPart).toLowerCase())
      setGrantedPermissions(
        parsed?.permissions && Array.isArray(parsed.permissions)
          ? new Set(parsed.permissions)
          : null
      )
    } catch {
      setDashboardStorageScope('default')
      setGrantedPermissions(null)
    }
  }, [])

  useEffect(() => {
    try {
      const raw = window.localStorage.getItem(
        `klarando.admin.dashboard.order.v1:${dashboardStorageScope}`
      )
      if (!raw) return

      const parsed = JSON.parse(raw) as string[]
      const allowed = ['stats', 'sales', 'liveLinks', 'previews']
      const filtered = parsed.filter((entry) => allowed.includes(entry))
      if (filtered.length === allowed.length) {
        setSectionOrder(filtered)
      }
    } catch {
      // ignore malformed local storage
    }
  }, [dashboardStorageScope])

  useEffect(() => {
    window.localStorage.setItem(
      `klarando.admin.dashboard.order.v1:${dashboardStorageScope}`,
      JSON.stringify(sectionOrder)
    )
  }, [sectionOrder, dashboardStorageScope])

  useEffect(() => {
    try {
      const raw = window.localStorage.getItem(
        `klarando.admin.dashboard.visible.v1:${dashboardStorageScope}`
      )
      if (!raw) return
      const parsed = JSON.parse(raw) as string[]
      if (!Array.isArray(parsed)) return
      const allowed = new Set(['stats', 'sales', 'liveLinks', 'previews'])
      const filtered = parsed.filter((entry) => allowed.has(entry))
      if (filtered.length > 0) {
        setVisibleSectionIds(filtered)
      }
    } catch {
      // ignore malformed local storage
    }
  }, [dashboardStorageScope])

  useEffect(() => {
    window.localStorage.setItem(
      `klarando.admin.dashboard.visible.v1:${dashboardStorageScope}`,
      JSON.stringify(visibleSectionIds)
    )
  }, [visibleSectionIds, dashboardStorageScope])

  useEffect(() => {
    setSectionOrder((current) => {
      const cleaned = current.filter((entry) => availableSectionIdSet.has(entry))
      const missing = availableSectionIds.filter((entry) => !cleaned.includes(entry))
      return [...cleaned, ...missing]
    })
    setVisibleSectionIds((current) => {
      const filtered = current.filter((entry) => availableSectionIdSet.has(entry))
      return filtered.length > 0 ? filtered : [...availableSectionIds]
    })
  }, [availableSectionIds.join('|'), availableSectionIdSet])

  function moveSection(sourceId: string, targetId: string) {
    if (!sourceId || !targetId || sourceId === targetId) {
      return
    }

    setSectionOrder((current) => {
      const sourceIndex = current.indexOf(sourceId)
      const targetIndex = current.indexOf(targetId)
      if (sourceIndex < 0 || targetIndex < 0) {
        return current
      }

      const next = [...current]
      const [moved] = next.splice(sourceIndex, 1)
      next.splice(targetIndex, 0, moved)
      return next
    })
  }

  function triggerRefresh() {
    setRefreshTick((current) => current + 1)
  }

  function toggleSectionVisibility(sectionId: string, enabled: boolean) {
    setVisibleSectionIds((current) => {
      if (enabled) {
        return Array.from(new Set([...current, sectionId]))
      }
      return current.filter((entry) => entry !== sectionId)
    })
  }

  function renderSection(sectionId: string) {
    if (sectionId === 'stats') {
      return (
        <AdminStats
          categoriesCount={categoriesCount}
          productsCount={productsCount}
          ingredientsCount={ingredientsCount}
          suppliersCount={suppliersCount}
          actionsCount={actionsCount}
          screenDevicesCount={screenDevicesCount}
          screenVisibleProductsCount={screenVisibleProductsCount}
          orderTerminalCount={orderTerminalCount}
          orderDisplayCount={orderDisplayCount}
          checkoutReadyTerminalCount={checkoutReadyTerminalCount}
          storageScope={dashboardStorageScope}
          visibleCardIds={visibleStatCardIds}
        />
      )
    }

    if (sectionId === 'sales') {
      if (!salesDashboard) {
        return (
          <section className="rounded-3xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
            Umsatz-Widget lädt...
          </section>
        )
      }

      return (
        <section className="grid gap-4 xl:grid-cols-[1.1fr_1fr_1fr]">
          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">
              Umsatz letzte {salesDashboard.periodDays} Tage
            </p>
            <p className="mt-2 text-3xl font-bold text-emerald-700">
              {salesDashboard.totals.revenue.toFixed(2)} EUR
            </p>
            <p className="mt-2 text-sm text-rose-900/70">
              Bezahlt: {salesDashboard.totals.paidOrders} | Unbezahlt:{' '}
              {salesDashboard.totals.unpaidOrders} | Offen: {salesDashboard.totals.openOrders}
            </p>
            <Link
              href="/admin/orders"
              className="mt-3 inline-flex rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] transition hover:bg-rose-100"
            >
              Quelle öffnen
            </Link>
          </article>

          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-base font-semibold text-[var(--brand-ink)]">Renner-Produkte</h2>
            <Link
              href="/admin/orders"
              className="mt-2 inline-flex rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] transition hover:bg-rose-100"
            >
              Quelle öffnen
            </Link>
            <div className="mt-3 space-y-2">
              {salesDashboard.topProducts.length > 0 ? (
                salesDashboard.topProducts.map((entry, index) => (
                  <div
                    key={entry.productId}
                    className="flex items-center justify-between rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm"
                  >
                    <span>
                      {index + 1}. {entry.productName}
                    </span>
                    <span className="font-semibold text-rose-900/85">{entry.quantity}x</span>
                  </div>
                ))
              ) : (
                <p className="rounded-xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/70">
                  Noch keine bezahlten Verkäufe im Zeitraum.
                </p>
              )}
            </div>
          </article>

          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-base font-semibold text-[var(--brand-ink)]">Penner-Produkte</h2>
            <Link
              href="/admin/orders"
              className="mt-2 inline-flex rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] transition hover:bg-rose-100"
            >
              Quelle öffnen
            </Link>
            <div className="mt-3 space-y-2">
              {salesDashboard.flopProducts.length > 0 ? (
                salesDashboard.flopProducts.map((entry, index) => (
                  <div
                    key={entry.productId}
                    className="flex items-center justify-between rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm"
                  >
                    <span>
                      {index + 1}. {entry.productName}
                    </span>
                    <span className="font-semibold text-rose-900/85">{entry.quantity}x</span>
                  </div>
                ))
              ) : (
                <p className="rounded-xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/70">
                  Noch keine Produktdaten im Zeitraum.
                </p>
              )}
            </div>
          </article>

          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)] xl:col-span-3">
            <div className="flex flex-wrap items-center justify-between gap-2">
              <h2 className="text-base font-semibold text-[var(--brand-ink)]">Kundenbewertungen</h2>
              <Link
                href="/admin/orders"
                className="inline-flex rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] transition hover:bg-rose-100"
              >
              Quelle öffnen
              </Link>
            </div>
            {!ratingsDashboard ? (
              <p className="mt-3 rounded-xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/70">
                Bewertungen werden geladen...
              </p>
            ) : ratingsDashboard.totalRatings === 0 ? (
              <p className="mt-3 rounded-xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/70">
                Noch keine Bewertungen vorhanden.
              </p>
            ) : (
              <div className="mt-3 grid gap-3 xl:grid-cols-[280px_1fr]">
                <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">Durchschnitt</p>
                  <p className="mt-1 text-3xl font-bold text-amber-600">
                    {ratingsDashboard.averageRating?.toFixed(2) || '-'} / 5
                  </p>
                  <p className="mt-1 text-sm text-rose-900/75">
                    {ratingsDashboard.totalRatings} Bewertungen in den letzten {ratingsDashboard.periodDays} Tagen
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
                <div className="space-y-2">
                  {ratingsDashboard.latest.slice(0, 6).map((entry) => (
                    <div
                      key={entry.id}
                      className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm"
                    >
                      <p className="font-semibold text-[var(--brand-ink)]">
                        {'★'.repeat(entry.stars)}{'☆'.repeat(5 - entry.stars)}
                      </p>
                      <p className="text-xs text-rose-900/75">
                        Bestellung {entry.orderId ? entry.orderId.slice(0, 8).toUpperCase() : '-'} |{' '}
                        {new Date(entry.createdAt).toLocaleString('de-DE')}
                      </p>
                      {entry.comment ? (
                        <p className="mt-1 text-sm text-slate-800">{entry.comment}</p>
                      ) : null}
                    </div>
                  ))}
                </div>
              </div>
            )}
          </article>
        </section>
      )
    }

    if (sectionId === 'liveLinks') {
      const activeScreens = screenDevices.filter((entry) => entry.isActive)
      const activeDisplays = orderDisplays.filter((entry) => entry.isActive)
      const activeTerminals = orderTerminals.filter((entry) => entry.isActive)

      return (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <div className="flex flex-wrap items-center justify-between gap-2">
            <div>
              <h2 className="text-xl font-semibold text-[var(--brand-ink)]">Aktive Links</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Direkter Zugriff auf aktive Bildschirme, Bestell-Displays und Terminals.
              </p>
            </div>
            <div className="flex flex-wrap gap-2">
              <Link
                href="/admin/screen"
                className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1.5 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-100"
              >
                Quelle Bildschirme
              </Link>
              <Link
                href="/admin/order-displays"
                className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1.5 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-100"
              >
                Quelle Bestell-Displays
              </Link>
              <Link
                href="/admin/terminals"
                className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1.5 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-100"
              >
                Quelle Terminals
              </Link>
              <Link
                href="/admin/orders"
                className="rounded-xl border border-amber-300 bg-amber-50 px-3 py-1.5 text-xs font-semibold text-amber-800 transition hover:bg-amber-100"
              >
                Reklamationen ({openComplaintsCount})
              </Link>
            </div>
          </div>

          <div className="mt-4 grid gap-4 xl:grid-cols-3">
            <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <h3 className="text-sm font-semibold text-[var(--brand-ink)]">
                Bildschirme ({activeScreens.length})
              </h3>
              <div className="mt-2 space-y-2">
                {activeScreens.slice(0, 10).map((device) => (
                  <div
                    key={device.id}
                    className="flex items-center justify-between rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs"
                  >
                    <span className="truncate pr-2">
                      {device.name} | {device.deviceCode}
                    </span>
                    <a
                      href={`/screen/${device.deviceCode}`}
                      target="_blank"
                      rel="noreferrer"
                      className="rounded-md bg-slate-900 px-2 py-1 font-semibold text-white hover:bg-slate-800"
                    >
                      Öffnen
                    </a>
                  </div>
                ))}
                {activeScreens.length === 0 ? (
                  <p className="rounded-xl border border-dashed border-[var(--brand-border)] bg-white px-3 py-3 text-xs text-rose-900/70">
                    Keine aktiven Bildschirme.
                  </p>
                ) : null}
              </div>
            </article>

            <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <h3 className="text-sm font-semibold text-[var(--brand-ink)]">
                Bestell-Displays ({activeDisplays.length})
              </h3>
              <div className="mt-2 space-y-2">
                {activeDisplays.slice(0, 10).map((display) => (
                  <div
                    key={display.id}
                    className="flex items-center justify-between rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs"
                  >
                    <span className="truncate pr-2">
                      {display.name} | {display.displayCode}
                    </span>
                    <a
                      href={`/order-display/${display.displayCode}`}
                      target="_blank"
                      rel="noreferrer"
                      className="rounded-md bg-slate-900 px-2 py-1 font-semibold text-white hover:bg-slate-800"
                    >
                      Öffnen
                    </a>
                  </div>
                ))}
                {activeDisplays.length === 0 ? (
                  <p className="rounded-xl border border-dashed border-[var(--brand-border)] bg-white px-3 py-3 text-xs text-rose-900/70">
                    Keine aktiven Bestell-Displays.
                  </p>
                ) : null}
              </div>
            </article>

            <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <h3 className="text-sm font-semibold text-[var(--brand-ink)]">
                Terminals ({activeTerminals.length})
              </h3>
              <div className="mt-2 space-y-2">
                {activeTerminals.slice(0, 10).map((terminal) => (
                  <div
                    key={terminal.id}
                    className="flex items-center justify-between rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs"
                  >
                    <span className="truncate pr-2">
                      {terminal.name} | {terminal.terminalCode}
                    </span>
                    <a
                      href={`/terminal/${terminal.terminalCode}`}
                      target="_blank"
                      rel="noreferrer"
                      className="rounded-md bg-slate-900 px-2 py-1 font-semibold text-white hover:bg-slate-800"
                    >
                      Öffnen
                    </a>
                  </div>
                ))}
                {activeTerminals.length === 0 ? (
                  <p className="rounded-xl border border-dashed border-[var(--brand-border)] bg-white px-3 py-3 text-xs text-rose-900/70">
                    Keine aktiven Terminals.
                  </p>
                ) : null}
              </div>
            </article>
          </div>
        </section>
      )
    }

    return <AdminScreenPreviews devices={screenDevices} />
  }

  return (
    <AdminLayout
      title="Dashboard"
      subtitle="Zentraler Einstieg in deinen Admin-Bereich"
    >
      <section className="mb-4 rounded-3xl bg-white p-4 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div className="text-sm text-rose-900/80">
            Letztes Update:{' '}
            <span className="font-semibold text-[var(--brand-ink)]">
              {lastUpdatedAt ? lastUpdatedAt.toLocaleString('de-DE') : '-'}
            </span>
          </div>
          <div className="flex flex-wrap items-center gap-2">
            <label className="flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs font-medium text-rose-900/85">
              <input
                type="checkbox"
                checked={autoRefreshEnabled}
                onChange={(event) => setAutoRefreshEnabled(event.target.checked)}
              />
              Auto-Refresh (45s)
            </label>
            <button
              type="button"
              className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
              onClick={triggerRefresh}
              disabled={isRefreshing}
            >
              {isRefreshing ? 'Aktualisiere...' : 'Jetzt aktualisieren'}
            </button>
          </div>
        </div>
      </section>

      <p className="mb-4 text-xs uppercase tracking-wide text-rose-900/70">
        Dashboard per Drag and Drop anpassen
      </p>
      <section className="mb-4 rounded-3xl bg-white p-4 shadow-sm ring-1 ring-[var(--brand-border)]">
        <p className="text-xs uppercase tracking-wide text-rose-900/70">Widgets ein-/ausblenden</p>
        <div className="mt-2 flex flex-wrap gap-2">
          {availableSectionMeta.map((section) => {
            const checked = visibleSectionIds.includes(section.id)
            return (
              <label
                key={section.id}
                className={`flex items-center gap-2 rounded-xl border px-3 py-1.5 text-xs transition ${
                  checked
                    ? 'border-emerald-300 bg-emerald-50 text-emerald-800'
                    : 'border-[var(--brand-border)] bg-rose-50/60 text-rose-900/80'
                }`}
              >
                <input
                  type="checkbox"
                  checked={checked}
                  onChange={(event) => toggleSectionVisibility(section.id, event.target.checked)}
                />
                {section.label}
              </label>
            )
          })}
        </div>
      </section>
      {availableSectionIds.length === 0 ? (
        <div className="mb-4 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/70 px-4 py-4 text-sm text-rose-900/80">
          Keine Daten vorhanden.
        </div>
      ) : null}
      {loadWarning ? (
        <div className="mb-4 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
          {loadWarning}
        </div>
      ) : null}

      <div className="space-y-6">
        {sectionOrder.map((sectionId) =>
          visibleSectionIds.includes(sectionId) ? (
          <section
            key={sectionId}
            draggable
            onDragStart={() => setDraggingSection(sectionId)}
            onDragEnd={() => setDraggingSection(null)}
            onDragOver={(event) => event.preventDefault()}
            onDrop={() => {
              if (!draggingSection) return
              moveSection(draggingSection, sectionId)
              setDraggingSection(null)
            }}
            className={`rounded-3xl border-2 border-dashed bg-transparent p-1 transition ${
              draggingSection === sectionId
                ? 'border-orange-300'
                : 'border-transparent hover:border-[var(--brand-border)]'
            }`}
          >
            {renderSection(sectionId)}
          </section>
          ) : null
        )}
      </div>
    </AdminLayout>
  )
}

