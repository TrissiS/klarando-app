import { FeatureModuleKey, PermissionKey, Prisma } from '@prisma/client'
import { prisma } from './prisma'

export type FeatureModuleCategory =
  | 'BESTELLUNG'
  | 'KATALOG'
  | 'BETRIEB'
  | 'GERAETE'
  | 'FINANZEN'
  | 'PLATTFORM'

export type FeatureModuleDefinition = {
  key: FeatureModuleKey
  name: string
  description: string
  category: FeatureModuleCategory
  defaultEnabled: boolean
  adminNavPath?: string
  requiredPermissions?: PermissionKey[]
  dependencies?: FeatureModuleKey[]
}

export const FEATURE_MODULE_REGISTRY: readonly FeatureModuleDefinition[] = [
  { key: FeatureModuleKey.ORDERS, name: 'Bestellungen', description: 'Bestellfluss, Annahme und Statuspflege', category: 'BESTELLUNG', defaultEnabled: true, adminNavPath: '/admin/orders', requiredPermissions: [PermissionKey.ORDERS_READ] },
  { key: FeatureModuleKey.PRODUCTS, name: 'Produkte', description: 'Produktverwaltung mit Preisen und Verfuegbarkeit', category: 'KATALOG', defaultEnabled: true, adminNavPath: '/admin/products', requiredPermissions: [PermissionKey.PRODUCTS_READ] },
  { key: FeatureModuleKey.CATEGORIES, name: 'Kategorien', description: 'Produktkategorien und Sortierung', category: 'KATALOG', defaultEnabled: true, adminNavPath: '/admin/categories', requiredPermissions: [PermissionKey.PRODUCTS_READ], dependencies: [FeatureModuleKey.PRODUCTS] },
  { key: FeatureModuleKey.INGREDIENTS, name: 'Zutaten', description: 'Zutatenverwaltung und Grunddaten', category: 'KATALOG', defaultEnabled: true, adminNavPath: '/admin/ingredients', requiredPermissions: [PermissionKey.PRODUCTS_READ], dependencies: [FeatureModuleKey.PRODUCTS] },
  { key: FeatureModuleKey.ALLERGENS, name: 'Allergene', description: 'Allergen- und Kennzeichnungsdaten', category: 'KATALOG', defaultEnabled: true, adminNavPath: '/admin/ingredients', requiredPermissions: [PermissionKey.PRODUCTS_READ], dependencies: [FeatureModuleKey.INGREDIENTS] },
  { key: FeatureModuleKey.STOCK, name: 'Lager', description: 'Bestandsbewegungen und Inventur', category: 'BETRIEB', defaultEnabled: true, adminNavPath: '/admin/stock', requiredPermissions: [PermissionKey.INVENTORY_READ] },
  { key: FeatureModuleKey.SUPPLIERS, name: 'Lieferanten', description: 'Lieferantenstamm und Bestellungen', category: 'BETRIEB', defaultEnabled: true, adminNavPath: '/admin/suppliers', requiredPermissions: [PermissionKey.PRODUCTS_READ], dependencies: [FeatureModuleKey.STOCK] },
  { key: FeatureModuleKey.STAFF, name: 'Mitarbeiter', description: 'Benutzer und Teamverwaltung', category: 'BETRIEB', defaultEnabled: true, adminNavPath: '/admin/staff', requiredPermissions: [PermissionKey.USERS_READ] },
  { key: FeatureModuleKey.DRIVERS, name: 'Fahrer', description: 'Fahrerstatus und Liefergeraete', category: 'BESTELLUNG', defaultEnabled: true, adminNavPath: '/admin/drivers', requiredPermissions: [PermissionKey.SETTINGS_READ], dependencies: [FeatureModuleKey.ORDERS] },
  { key: FeatureModuleKey.DISPLAYS, name: 'Displays', description: 'Order- und Screen-Displays', category: 'GERAETE', defaultEnabled: true, adminNavPath: '/admin/displays', requiredPermissions: [PermissionKey.ORDERS_READ] },
  { key: FeatureModuleKey.DISPLAY_DESIGN, name: 'Display-Design', description: 'Darstellung, Farben und Layout fuer Displays', category: 'GERAETE', defaultEnabled: true, adminNavPath: '/admin/screen', requiredPermissions: [PermissionKey.ORDERS_READ], dependencies: [FeatureModuleKey.DISPLAYS] },
  { key: FeatureModuleKey.SIGNAGE_STUDIO, name: 'Klarando Signage Studio', description: 'Display Slides & Werbung mit Playlists, Animationen und Mediaplaenen', category: 'GERAETE', defaultEnabled: false, adminNavPath: '/admin/screen-studio?tab=signage', requiredPermissions: [PermissionKey.ORDERS_READ], dependencies: [FeatureModuleKey.DISPLAYS, FeatureModuleKey.DISPLAY_DESIGN] },
  { key: FeatureModuleKey.ORDERDESK, name: 'OrderDesk', description: 'OrderDesk-Geraetelogik und Pairing', category: 'GERAETE', defaultEnabled: true, adminNavPath: '/admin/terminals', requiredPermissions: [PermissionKey.ORDERS_READ], dependencies: [FeatureModuleKey.ORDERS] },
  { key: FeatureModuleKey.TERMINALS, name: 'Terminals', description: 'Kassen- und Bestellterminals', category: 'GERAETE', defaultEnabled: true, adminNavPath: '/admin/terminals', requiredPermissions: [PermissionKey.ORDERS_READ], dependencies: [FeatureModuleKey.ORDERS] },
  { key: FeatureModuleKey.POS, name: 'POS', description: 'Point of Sale Prozesse und Kassenfluss', category: 'BESTELLUNG', defaultEnabled: true, adminNavPath: '/admin/orders', requiredPermissions: [PermissionKey.ORDERS_READ], dependencies: [FeatureModuleKey.ORDERS] },
  { key: FeatureModuleKey.DELIVERY_ZONES, name: 'Lieferzonen', description: 'Liefergebiete und Lieferlogik', category: 'BESTELLUNG', defaultEnabled: true, adminNavPath: '/admin/lieferung', requiredPermissions: [PermissionKey.SETTINGS_READ], dependencies: [FeatureModuleKey.ORDERS] },
  { key: FeatureModuleKey.RATINGS, name: 'Bewertungen', description: 'Kundenbewertungen und Feedback', category: 'BESTELLUNG', defaultEnabled: true, adminNavPath: '/admin/marketing/ratings', requiredPermissions: [PermissionKey.ORDERS_READ], dependencies: [FeatureModuleKey.ORDERS] },
  { key: FeatureModuleKey.TIPS, name: 'Trinkgeld', description: 'Trinkgeldfunktionen fuer Kunden', category: 'FINANZEN', defaultEnabled: false, dependencies: [FeatureModuleKey.PAYMENT] },
  { key: FeatureModuleKey.LOYALTY, name: 'Loyalty', description: 'Sammelkarten und Treuepunkte', category: 'BESTELLUNG', defaultEnabled: false, dependencies: [FeatureModuleKey.ORDERS] },
  { key: FeatureModuleKey.PAYMENT, name: 'Payment', description: 'Zentrale Zahlungsarten und Abwicklung', category: 'FINANZEN', defaultEnabled: false, requiredPermissions: [PermissionKey.SETTINGS_READ] },
  { key: FeatureModuleKey.ANALYTICS, name: 'Analytics', description: 'Auswertungen und Kennzahlen', category: 'FINANZEN', defaultEnabled: true, adminNavPath: '/admin', requiredPermissions: [PermissionKey.ORDERS_READ] },
  { key: FeatureModuleKey.CASH_CLOSING, name: 'Kassenabschluss', description: 'Tages- und Monatsabschluesse', category: 'FINANZEN', defaultEnabled: true, adminNavPath: '/admin/closings', requiredPermissions: [PermissionKey.ORDERS_READ], dependencies: [FeatureModuleKey.ORDERS] },
  { key: FeatureModuleKey.PLATFORM_BRANDING, name: 'Plattform Branding', description: 'Logos, Farben und Markenvorgaben', category: 'PLATTFORM', defaultEnabled: true, adminNavPath: '/admin/settings', requiredPermissions: [PermissionKey.SETTINGS_READ] },
]

const registryByKey = new Map(FEATURE_MODULE_REGISTRY.map((entry) => [entry.key, entry]))

export const FEATURE_PACKAGES = [
  { key: 'STARTER', name: 'Starter', description: 'Basisbetrieb fuer Produkte und Bestellungen', features: [FeatureModuleKey.ORDERS, FeatureModuleKey.PRODUCTS, FeatureModuleKey.CATEGORIES, FeatureModuleKey.INGREDIENTS, FeatureModuleKey.DISPLAYS] },
  { key: 'DELIVERY', name: 'Delivery', description: 'Erweitert um Fahrer, Lieferzonen und Dispatch', features: [FeatureModuleKey.ORDERS, FeatureModuleKey.DRIVERS, FeatureModuleKey.DELIVERY_ZONES, FeatureModuleKey.DISPLAYS, FeatureModuleKey.ORDERDESK] },
  { key: 'PRO', name: 'Pro', description: 'Mit Lager, Lieferanten und erweiterten Auswertungen', features: [FeatureModuleKey.ORDERS, FeatureModuleKey.PRODUCTS, FeatureModuleKey.CATEGORIES, FeatureModuleKey.INGREDIENTS, FeatureModuleKey.STOCK, FeatureModuleKey.SUPPLIERS, FeatureModuleKey.DISPLAYS, FeatureModuleKey.DISPLAY_DESIGN, FeatureModuleKey.SIGNAGE_STUDIO, FeatureModuleKey.ANALYTICS, FeatureModuleKey.CASH_CLOSING] },
  { key: 'CHAIN', name: 'Chain', description: 'Fuer Kettenbetrieb mit mehreren Standorten', features: [FeatureModuleKey.ORDERS, FeatureModuleKey.PRODUCTS, FeatureModuleKey.CATEGORIES, FeatureModuleKey.INGREDIENTS, FeatureModuleKey.STOCK, FeatureModuleKey.SUPPLIERS, FeatureModuleKey.STAFF, FeatureModuleKey.DRIVERS, FeatureModuleKey.DISPLAYS, FeatureModuleKey.DISPLAY_DESIGN, FeatureModuleKey.SIGNAGE_STUDIO, FeatureModuleKey.ORDERDESK, FeatureModuleKey.TERMINALS, FeatureModuleKey.ANALYTICS, FeatureModuleKey.CASH_CLOSING] },
  { key: 'ENTERPRISE', name: 'Enterprise', description: 'Voller Funktionsumfang inklusive Payment/Tips/Loyalty', features: FEATURE_MODULE_REGISTRY.map((entry) => entry.key) },
] as const

type EffectiveFeatureEntry = {
  key: FeatureModuleKey
  enabled: boolean
  source: 'default' | 'chain' | 'tenant'
  name: string
  description: string
  category: FeatureModuleCategory
  adminNavPath: string | null
  requiredPermissions: PermissionKey[]
  dependencies: FeatureModuleKey[]
  dependencyIssues: FeatureModuleKey[]
}

export type EffectiveFeatureSet = {
  tenantId: string
  chainId: string | null
  modules: EffectiveFeatureEntry[]
}

function withDependencyHealth(entries: EffectiveFeatureEntry[]) {
  const enabledByKey = new Map(entries.map((entry) => [entry.key, entry.enabled]))
  return entries.map((entry) => ({
    ...entry,
    dependencyIssues: entry.dependencies.filter((dependency) => !enabledByKey.get(dependency)),
  }))
}

export async function resolveEffectiveFeatureSetForTenant(tenantId: string): Promise<EffectiveFeatureSet | null> {
  const tenant = await prisma.tenant.findUnique({
    where: { id: tenantId },
    select: { id: true, chainId: true },
  })

  if (!tenant) {
    return null
  }

  const [chainSettings, tenantSettings] = await Promise.all([
    tenant.chainId
      ? prisma.chainFeatureModuleSetting.findMany({
          where: { chainId: tenant.chainId },
          select: { featureKey: true, enabled: true },
        })
      : Promise.resolve([]),
    prisma.tenantFeatureModuleSetting.findMany({
      where: { tenantId: tenant.id },
      select: { featureKey: true, enabled: true },
    }),
  ])

  const chainOverrides = new Map(chainSettings.map((entry) => [entry.featureKey, entry.enabled]))
  const tenantOverrides = new Map(tenantSettings.map((entry) => [entry.featureKey, entry.enabled]))

  const modules = FEATURE_MODULE_REGISTRY.map((definition) => {
    if (tenantOverrides.has(definition.key)) {
      return {
        ...definition,
        enabled: tenantOverrides.get(definition.key) === true,
        source: 'tenant' as const,
      }
    }

    if (chainOverrides.has(definition.key)) {
      return {
        ...definition,
        enabled: chainOverrides.get(definition.key) === true,
        source: 'chain' as const,
      }
    }

    return {
      ...definition,
      enabled: definition.defaultEnabled,
      source: 'default' as const,
    }
  }).map((entry) => ({
    key: entry.key,
    enabled: entry.enabled,
    source: entry.source,
    name: entry.name,
    description: entry.description,
    category: entry.category,
    adminNavPath: entry.adminNavPath ?? null,
    requiredPermissions: entry.requiredPermissions ? [...entry.requiredPermissions] : [],
    dependencies: entry.dependencies ? [...entry.dependencies] : [],
    dependencyIssues: [] as FeatureModuleKey[],
  }))

  return {
    tenantId: tenant.id,
    chainId: tenant.chainId,
    modules: withDependencyHealth(modules),
  }
}

export function moduleKeyFromString(value: unknown): FeatureModuleKey | null {
  if (typeof value !== 'string') {
    return null
  }
  const normalized = value.trim().toUpperCase()
  const candidate = normalized as FeatureModuleKey
  return registryByKey.has(candidate) ? candidate : null
}

export function normalizeModuleKeyList(values: unknown) {
  if (!Array.isArray(values)) {
    return null
  }
  const parsed: FeatureModuleKey[] = []
  for (const value of values) {
    const key = moduleKeyFromString(value)
    if (!key) {
      return null
    }
    parsed.push(key)
  }
  return Array.from(new Set(parsed))
}

export type BillingUsageSnapshot = {
  periodStart: string
  periodEnd: string
  ordersTotal: number
  ordersBillable: number
  ordersCounted: number
  ordersCanceled: number
  ordersTest: number
  ordersRefunded: number
  ordersOpen: number
  ordersCompleted: number
  ordersPaid: number
  ordersNonBillable: number
  includedOrdersUsed: number
  additionalOrders: number
  revenueGrossCents: number
  grossOrderValueCents: number
  billableOrderValueCents: number
  revenueCountedCents: number
  netOrderValueCents: number | null
  countingMode: {
    countOnlyPaidOrders: boolean
    countOnlyCompletedOrders: boolean
    excludeCanceledOrders: boolean
  }
  countingNotes: string[]
}

export async function calculateBillingUsageSnapshot(params: {
  tenantId: string
  periodStart: Date
  periodEnd: Date
  countOnlyPaidOrders: boolean
  countOnlyCompletedOrders: boolean
  excludeCanceledOrders: boolean
}) {
  const baseWhere: Prisma.OrderWhereInput = {
    tenantId: params.tenantId,
    createdAt: {
      gte: params.periodStart,
      lt: params.periodEnd,
    },
  }

  const allOrders = await prisma.order.findMany({
    where: baseWhere,
    select: {
      id: true,
      status: true,
      paymentStatus: true,
      sourceChannel: true,
      clientOrderId: true,
      idempotencyKey: true,
      total: true,
    },
  })

  const canceledStatus = new Set(['CANCELED', 'CANCELLED', 'STORNO'])
  const refundedPaymentStatus = new Set(['REFUNDED', 'PARTIALLY_REFUNDED'])
  const paidPaymentStatus = new Set(['PAID', 'PAYED'])
  const completedStatus = new Set(['DONE', 'DELIVERED', 'COMPLETED', 'FINISHED'])
  const testSourceChannels = new Set(['TEST', 'DEMO', 'SANDBOX'])
  const uncertainStatuses = new Set<string>()

  let ordersCounted = 0
  let revenueCountedCents = 0
  let ordersCanceled = 0
  let revenueGrossCents = 0
  let ordersTest = 0
  let ordersRefunded = 0
  let ordersOpen = 0
  let ordersCompleted = 0
  let ordersPaid = 0

  for (const order of allOrders) {
    const totalCents = Math.round(Number(order.total) * 100)
    revenueGrossCents += Number.isFinite(totalCents) ? totalCents : 0

    const statusUpper = String(order.status || '').toUpperCase()
    const paymentStatusUpper = String(order.paymentStatus || '').toUpperCase()
    const sourceChannelUpper = String(order.sourceChannel || '').toUpperCase()
    const testMarker = `${order.clientOrderId || ''} ${order.idempotencyKey || ''}`.toUpperCase()
    const isCanceled = canceledStatus.has(statusUpper)
    const isCompleted = completedStatus.has(statusUpper)
    const isPaid = paidPaymentStatus.has(paymentStatusUpper)
    const isRefunded = refundedPaymentStatus.has(paymentStatusUpper)
    const isTestOrder =
      testSourceChannels.has(sourceChannelUpper) ||
      testMarker.includes('TEST') ||
      testMarker.includes('DEMO') ||
      testMarker.includes('SANDBOX')

    if (isCanceled) {
      ordersCanceled += 1
    }
    if (isCompleted) {
      ordersCompleted += 1
    }
    if (isPaid) {
      ordersPaid += 1
    }
    if (isRefunded) {
      ordersRefunded += 1
    }
    if (isTestOrder) {
      ordersTest += 1
    }

    let include = true
    let excludedAsOpen = false

    if (params.excludeCanceledOrders && isCanceled) {
      include = false
    }

    if (include && isRefunded) {
      include = false
    }

    if (include && isTestOrder) {
      include = false
    }

    if (include && params.countOnlyCompletedOrders && !isCompleted) {
      include = false
      excludedAsOpen = true
      if (statusUpper && statusUpper !== 'ARCHIVED') {
        uncertainStatuses.add(statusUpper)
      }
    }

    if (include && params.countOnlyPaidOrders && !isPaid) {
      include = false
      excludedAsOpen = true
    }

    if (include) {
      ordersCounted += 1
      revenueCountedCents += Number.isFinite(totalCents) ? totalCents : 0
    } else if (
      !isCanceled &&
      !isTestOrder &&
      !isRefunded &&
      excludedAsOpen
    ) {
      ordersOpen += 1
    }
  }

  const countingNotes: string[] = []
  if (ordersTest > 0) {
    countingNotes.push(
      `${ordersTest} Test-/Demo-Bestellungen wurden anhand von sourceChannel oder technischen IDs ausgeschlossen.`
    )
  }
  if (ordersRefunded > 0) {
    countingNotes.push(
      `${ordersRefunded} erstattete oder teilweise erstattete Bestellungen wurden nicht als abrechnungsrelevant gewertet.`
    )
  }
  if (ordersOpen > 0) {
    countingNotes.push(
      `${ordersOpen} offene oder unvollstaendige Bestellungen wurden defensiv nicht abgerechnet.`
    )
  }
  if (uncertainStatuses.size > 0) {
    countingNotes.push(
      `Status ausserhalb der sicheren Abschlusslogik wurden defensiv ausgeschlossen: ${Array.from(
        uncertainStatuses
      )
        .sort()
        .join(', ')}.`
    )
  }

  const ordersBillable = ordersCounted
  const ordersNonBillable = Math.max(0, allOrders.length - ordersBillable)

  return {
    periodStart: params.periodStart.toISOString(),
    periodEnd: params.periodEnd.toISOString(),
    ordersTotal: allOrders.length,
    ordersBillable,
    ordersCounted,
    ordersCanceled,
    ordersTest,
    ordersRefunded,
    ordersOpen,
    ordersCompleted,
    ordersPaid,
    ordersNonBillable,
    includedOrdersUsed: 0,
    additionalOrders: 0,
    revenueGrossCents,
    grossOrderValueCents: revenueGrossCents,
    billableOrderValueCents: revenueCountedCents,
    revenueCountedCents,
    netOrderValueCents: null,
    countingMode: {
      countOnlyPaidOrders: params.countOnlyPaidOrders,
      countOnlyCompletedOrders: params.countOnlyCompletedOrders,
      excludeCanceledOrders: params.excludeCanceledOrders,
    },
    countingNotes,
  } satisfies BillingUsageSnapshot
}
