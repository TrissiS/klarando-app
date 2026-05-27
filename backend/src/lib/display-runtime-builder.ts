import { prisma } from './prisma'
import { parseSettings } from './business-settings'
import { parseDisplayMetaFromNotes, type DisplayPerformanceMode } from './display-performance-mode'

export type RuntimeDisplayType = 'MENU' | 'ORDER' | 'KITCHEN' | 'CUSTOMER' | 'TERMINAL'
export type RuntimeDeviceMode =
  | 'MENU_DISPLAY'
  | 'EASY_ORDER'
  | 'PICKUP_MONITOR'
  | 'PROMOTION_SCREEN'
  | 'KITCHEN_DISPLAY'
  | 'ORDER_DESK'

type RuntimeSettingsMap = Record<string, unknown>
type LiveStatsSummary = {
  topProductsToday: Array<{ productId: string; quantity: number }>
  topProductsWeek: Array<{ productId: string; quantity: number }>
  currentKitchenLoad: number
  averageWaitTimeMinutes: number | null
  soldOutProductIds: string[]
  lowStockProductIds: string[]
  activeOrderCount: number
  completedOrdersToday: number
  statsUpdatedAt: string
}

const LIVE_STATS_CACHE_TTL_MS = 30_000
const liveStatsCache = new Map<string, { expiresAt: number; value: LiveStatsSummary }>()

type RuntimeShape = {
  device: {
    id: string
    deviceCode: string
    name: string
    type: RuntimeDisplayType
    mode: RuntimeDeviceMode
    branchId: string | null
    tenantId: string
    status: 'ONLINE' | 'OFFLINE' | 'INACTIVE'
    appVersion: string | null
    resolution: {
      width: number | null
      height: number | null
      orientation: string | null
    }
    lastSeenAt: string | null
  }
  tenant: {
    id: string
    name: string
    chainId: string | null
  }
  branch: {
    id: string
    name: string
  } | null
  mode: RuntimeDeviceMode
  template: string
  layoutSettings: RuntimeSettingsMap
  brandingSettings: RuntimeSettingsMap
  offlineSettings: RuntimeSettingsMap
  easyOrderSettings: RuntimeSettingsMap
  signageSettings: RuntimeSettingsMap
  contentSettings: RuntimeSettingsMap
  slides: Array<{
    id: string
    type: string
    title: string | null
    scheduleName: string | null
    durationSeconds: number
    background: string | null
    mediaUrl: string | null
    productIds: string[]
    categoryIds: string[]
    textBlocks: string[]
    animation: string | null
    sortOrder: number
    active: boolean
    validFrom: string | null
    validUntil: string | null
    daysOfWeek: number[]
    timeWindows: Array<{ from: string; until: string }>
    priority: number
    fallbackItem: boolean
  }>
  categories: Array<{ id: string; name: string }>
  products: Array<{
    id: string
    name: string
    price: number
    categoryId: string | null
    categoryName: string | null
    ingredients: string[]
    allergens: string[]
    isHero: boolean
    isBestseller: boolean
    isNew: boolean
    isPromotion: boolean
    promotionText: string | null
    badgeLabel: string | null
    badgeColor: string | null
    highlightPriority: number
    heroImageUrl: string | null
    originalPrice: number | null
    promoPrice: number | null
    validFrom: string | null
    validUntil: string | null
    soldToday: number
    isTopSeller: boolean
    isLowStock: boolean
    isSoldOut: boolean
    estimatedPrepTime: number | null
    popularityRank: number | null
  }>
  liveStats: LiveStatsSummary
  distribution: {
    displayGroupId: string
    displayCount: number
    currentDisplayIndex: number
    strategy: 'split-products' | 'duplicate-all' | 'category-based'
    productsPerDisplay: number
    totalProducts: number
    pageNumber: number
    totalPages: number
    productIdsForDisplay: string[]
  }
  publishedVersion: string
  cachedVersion: string
  runtimeConfig: RuntimeSettingsMap
  debug: {
    source: 'screenDevice' | 'orderDisplay'
    builtAt: string
  }
  deviceCode: string
  displayType: RuntimeDisplayType
  tenantId: string
  chainId: string | null
  displayId: string
  isActive: boolean
  branding: {
    tenantName: string
    logoUrl: string | null
    primaryColor: string | null
    secondaryColor: string | null
    textColor: string | null
  }
  refreshIntervalMs: number
  performanceMode: DisplayPerformanceMode
  assetSettings: {
    baseUrl: string | null
    preferredFormats: string[]
  }
  diagnostics: {
    effectiveResolution: string | null
    devicePixelRatio: number | null
    viewport: string | null
    orientation: string | null
    fullscreenSupported: boolean | null
    touchSupported: boolean | null
    userAgent: string | null
    appVersion: string | null
    estimatedPerformanceClass: string | null
    supportedVideoFormats: string[]
    recommendedResolution: string | null
    lastDiagnosticsAt: string | null
  }
  videoBackgroundEnabled: boolean
  videoBackgroundUrl: string | null
  fallbackBackgroundUrl: string | null
  cacheVersion: string
  lastSeenAt: string | null
  lastSyncAt: string | null
  updatedAt: string
  serverTime: string
}

async function loadLiveStats(tenantId: string, branchId: string | null): Promise<LiveStatsSummary> {
  const cacheKey = `${tenantId}:${branchId ?? 'all'}`
  const nowMs = Date.now()
  const cached = liveStatsCache.get(cacheKey)
  if (cached && cached.expiresAt > nowMs) return cached.value

  const now = new Date()
  const startOfDay = new Date(now.getFullYear(), now.getMonth(), now.getDate())
  const startOfWeek = new Date(startOfDay)
  const mondayOffset = (startOfDay.getDay() + 6) % 7
  startOfWeek.setDate(startOfWeek.getDate() - mondayOffset)

  const orderWhere = { tenantId }

  const [todayItems, weekItems, openOrders, todayCompleted, todayOrdersWithEstimate, soldOutProducts] = await Promise.all([
    prisma.orderItem.findMany({
      where: {
        order: {
          ...orderWhere,
          createdAt: { gte: startOfDay },
        },
      },
      select: { productId: true, quantity: true },
    }),
    prisma.orderItem.findMany({
      where: {
        order: {
          ...orderWhere,
          createdAt: { gte: startOfWeek },
        },
      },
      select: { productId: true, quantity: true },
    }),
    prisma.order.count({
      where: {
        ...orderWhere,
        status: { in: ['OPEN', 'PREPARING', 'READY', 'ON_THE_WAY'] },
      },
    }),
    prisma.order.count({
      where: {
        ...orderWhere,
        createdAt: { gte: startOfDay },
        status: { in: ['DONE', 'COMPLETED', 'DELIVERED', 'PICKED_UP'] },
      },
    }),
    prisma.order.findMany({
      where: {
        ...orderWhere,
        createdAt: { gte: startOfDay },
        estimatedMinutes: { not: null },
      },
      select: { estimatedMinutes: true },
      take: 200,
      orderBy: { createdAt: 'desc' },
    }),
    prisma.product.findMany({
      where: { tenantId, available: false },
      select: { id: true },
    }),
  ])

  const aggregate = (rows: Array<{ productId: string; quantity: number }>) => {
    const map = new Map<string, number>()
    for (const row of rows) map.set(row.productId, (map.get(row.productId) ?? 0) + row.quantity)
    return Array.from(map.entries())
      .sort((a, b) => b[1] - a[1])
      .map(([productId, quantity]) => ({ productId, quantity }))
  }

  const avgWait =
    todayOrdersWithEstimate.length > 0
      ? Math.round(
          todayOrdersWithEstimate.reduce((sum, order) => sum + (order.estimatedMinutes ?? 0), 0) /
            todayOrdersWithEstimate.length
        )
      : null

  const summary: LiveStatsSummary = {
    topProductsToday: aggregate(todayItems).slice(0, 10),
    topProductsWeek: aggregate(weekItems).slice(0, 10),
    currentKitchenLoad: openOrders,
    averageWaitTimeMinutes: avgWait,
    soldOutProductIds: soldOutProducts.map((p) => p.id),
    lowStockProductIds: [],
    activeOrderCount: openOrders,
    completedOrdersToday: todayCompleted,
    statsUpdatedAt: new Date().toISOString(),
  }

  liveStatsCache.set(cacheKey, { expiresAt: nowMs + LIVE_STATS_CACHE_TTL_MS, value: summary })
  return summary
}

function deriveRecommendedResolution(width: number | null | undefined, height: number | null | undefined) {
  if (!width || !height) return null
  const landscape = width >= height
  if (width >= 3500 || height >= 2000) {
    return landscape ? '3840x2160 (16:9, 4K)' : '2160x3840 (9:16, 4K)'
  }
  if (width >= 1800 || height >= 1000) {
    return landscape ? '1920x1080 (16:9)' : '1080x1920 (9:16)'
  }
  return landscape ? '1280x720 (16:9)' : '720x1280 (9:16)'
}

function toDisplayTypeFromOrderRole(role: string): RuntimeDisplayType {
  if (role === 'KITCHEN') return 'KITCHEN'
  if (role === 'PICKUP') return 'CUSTOMER'
  return 'ORDER'
}

function toModeFromDisplayType(displayType: RuntimeDisplayType): RuntimeDeviceMode {
  if (displayType === 'KITCHEN') return 'KITCHEN_DISPLAY'
  if (displayType === 'CUSTOMER') return 'PICKUP_MONITOR'
  if (displayType === 'TERMINAL') return 'EASY_ORDER'
  if (displayType === 'ORDER') return 'ORDER_DESK'
  return 'MENU_DISPLAY'
}

function parseCsvIds(value: string | null | undefined) {
  if (!value) return []
  return value
    .split(',')
    .map((entry) => entry.trim())
    .filter(Boolean)
}

function readScreenSettingJson(value: unknown) {
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    return null
  }
  return value as Record<string, unknown>
}

function asString(value: unknown, fallback = '') {
  return typeof value === 'string' && value.trim().length > 0 ? value : fallback
}

function asNumber(value: unknown, fallback: number) {
  const parsed = Number(value)
  return Number.isFinite(parsed) ? parsed : fallback
}

function asBoolean(value: unknown, fallback: boolean) {
  return typeof value === 'boolean' ? value : fallback
}

function inferTemplateFromScreenSettings(params: {
  cardStyle: string
  overlayAnimation: string
  showCategoryOnCard: boolean
  showCategoryHeaders: boolean
  showPrices: boolean
}) {
  const cardStyle = params.cardStyle.toUpperCase()
  const overlay = params.overlayAnimation.toUpperCase()
  if (overlay !== 'NONE' && params.showCategoryOnCard && cardStyle === 'SOFT') return 'MODERN_GRID'
  if (overlay !== 'NONE' && params.showPrices && cardStyle === 'GLASS') return 'PROMOTION_HIGHLIGHT'
  if (cardStyle === 'MINIMAL' || cardStyle === 'LIST') return 'TOUCH_KIOSK_PREVIEW'
  if (params.showCategoryHeaders && cardStyle === 'OUTLINE') return 'CLASSIC_MENU'
  return 'MODERN_GRID'
}

function toStatus(isActive: boolean, lastSeenAt: Date | null | undefined): 'ONLINE' | 'OFFLINE' | 'INACTIVE' {
  if (!isActive) return 'INACTIVE'
  if (!lastSeenAt) return 'OFFLINE'
  const diffMs = Date.now() - lastSeenAt.getTime()
  return diffMs <= 90_000 ? 'ONLINE' : 'OFFLINE'
}

export async function buildDisplayRuntimeForDevice(deviceCode: string): Promise<RuntimeShape | null> {
  const nowIso = new Date().toISOString()

  const screenDevice = await prisma.screenDevice.findFirst({
    where: {
      deviceCode: {
        equals: deviceCode,
        mode: 'insensitive',
      },
    },
  })

  if (screenDevice) {
    const tenant = await prisma.tenant.findUnique({
      where: { id: screenDevice.tenantId },
      select: {
        id: true,
        chainId: true,
        name: true,
        businessSettings: true,
      },
    })
    const tenantName = tenant?.name ?? 'Tenant'
    const businessSettings = parseSettings(tenant?.businessSettings, { name: tenantName, email: null })
    const meta = parseDisplayMetaFromNotes(screenDevice.notes)
    const performanceMode = meta.performanceMode ?? 'AUTO'
    const selectedCategoryIds = parseCsvIds(screenDevice.selectedCategoryIds)
    const selectedProductIds = parseCsvIds(screenDevice.selectedProductIds)
    const [screenSettingRaw, siblingDevices, categories, productsBySelection, productsByVisibility, activePlaylist] = await Promise.all([
      prisma.screenSetting.findUnique({
        where: { tenantId: screenDevice.tenantId },
      }),
      prisma.screenDevice.findMany({
        where: { tenantId: screenDevice.tenantId, isActive: true },
        select: { id: true, deviceCode: true, name: true },
        orderBy: [{ name: 'asc' }, { deviceCode: 'asc' }],
      }),
      selectedCategoryIds.length > 0
        ? prisma.category.findMany({
            where: { id: { in: selectedCategoryIds }, tenantId: screenDevice.tenantId },
            select: { id: true, name: true },
            orderBy: { name: 'asc' },
          })
        : Promise.resolve([]),
      selectedProductIds.length > 0
        ? prisma.product.findMany({
            where: { id: { in: selectedProductIds }, tenantId: screenDevice.tenantId },
            select: {
              id: true,
              name: true,
              imageUrl: true,
              categoryId: true,
              price: true,
              category: { select: { name: true } },
              ingredients: {
                include: {
                  ingredient: {
                    select: {
                      name: true,
                      allergens: true,
                    },
                  },
                },
              },
            },
            orderBy: { name: 'asc' },
          })
        : Promise.resolve([]),
      prisma.screenProductSetting.findMany({
        where: { tenantId: screenDevice.tenantId, showOnScreen: true },
        include: {
          product: {
            select: {
              id: true,
              name: true,
              imageUrl: true,
              categoryId: true,
              price: true,
              category: { select: { id: true, name: true } },
              ingredients: {
                include: {
                  ingredient: {
                    select: {
                      name: true,
                      allergens: true,
                    },
                  },
                },
              },
            },
          },
        },
        orderBy: [{ sortOrder: 'asc' }, { product: { name: 'asc' } }],
      }),
      prisma.displayPlaylist.findFirst({
        where: {
          tenantId: screenDevice.tenantId,
          isActive: true,
        },
        include: {
          items: {
            orderBy: { sortOrder: 'asc' },
          },
        },
        orderBy: { updatedAt: 'desc' },
      }),
    ])
    const screenSetting = readScreenSettingJson(screenSettingRaw)
    const productSettingsMap = new Map(
      productsByVisibility.map((entry) => [
        entry.product.id,
        {
          isFeatured: Boolean(entry.isFeatured),
          badgeText: entry.badgeText ?? null,
          highlightColor: entry.highlightColor ?? null,
          sortOrder: entry.sortOrder ?? 0,
        },
      ])
    )
    const visibleProductsFromSettings = productsByVisibility.map((entry) => entry.product)
    const products = productsBySelection.length > 0 ? productsBySelection : visibleProductsFromSettings
    const categoryMap = new Map<string, { id: string; name: string }>()
    for (const category of categories) {
      categoryMap.set(category.id, category)
    }
    for (const product of products) {
      if (product.categoryId && product.category?.name && !categoryMap.has(product.categoryId)) {
        categoryMap.set(product.categoryId, { id: product.categoryId, name: product.category.name })
      }
    }
    const categoriesFinal = Array.from(categoryMap.values()).sort((a, b) => a.name.localeCompare(b.name, 'de'))

    const cardStyle =
      asString(screenDevice.cardStyleOverride, '') || asString(screenSetting?.cardStyle, 'SOFT')
    const overlayAnimation = asString(screenSetting?.overlayAnimation, 'NONE')
    const showCategoryOnCard = asBoolean(screenSetting?.showCategoryOnCard, true)
    const showCategoryHeaders = asBoolean(screenSetting?.showCategoryHeaders, false)
    const showPrices = screenDevice.showPricesOverride ?? asBoolean(screenSetting?.showPrices, true)
    const inferredTemplate = inferTemplateFromScreenSettings({
      cardStyle,
      overlayAnimation,
      showCategoryOnCard,
      showCategoryHeaders,
      showPrices,
    })

    const displayType: RuntimeDisplayType = 'MENU'
    const mode = toModeFromDisplayType(displayType)
    const template = inferredTemplate
    const cacheVersion = screenDevice.updatedAt.toISOString()
    const publishedVersion = screenSettingRaw?.updatedAt?.toISOString() || cacheVersion
    const refreshIntervalMs = Math.max(5000, screenDevice.refreshIntervalSec * 1000)

    const signageSettingsInput: Record<string, unknown> = {}
    const signageEnabled = Boolean(signageSettingsInput.enabled ?? activePlaylist?.id)
    const signageSettings = {
      enabled: signageEnabled,
      playlistId: (signageSettingsInput.playlistId as string | undefined) || activePlaylist?.id || null,
      rotationMode: (signageSettingsInput.rotationMode as string | undefined) || 'SEQUENTIAL',
      defaultSlideDurationSeconds: Number(signageSettingsInput.defaultSlideDurationSeconds) || 12,
      transitionType: (signageSettingsInput.transitionType as string | undefined) || 'FADE',
      loopEnabled: signageSettingsInput.loopEnabled !== false,
      preloadMedia: signageSettingsInput.preloadMedia !== false,
      offlineCacheEnabled: signageSettingsInput.offlineCacheEnabled !== false,
    }
    const slides = (activePlaylist?.items || []).map((item) => {
      const config = item.config && typeof item.config === 'object' ? (item.config as Record<string, unknown>) : {}
      const weekdaysRaw = Array.isArray(item.weekdays) ? item.weekdays : Array.isArray(config.daysOfWeek) ? config.daysOfWeek : []
      const daysOfWeek = weekdaysRaw
        .map((entry) => Number(entry))
        .filter((day) => Number.isInteger(day) && day >= 1 && day <= 7)
      const validFrom = item.activeFrom ? item.activeFrom.toISOString() : null
      const validUntil = item.activeUntil ? item.activeUntil.toISOString() : null
      const scheduleName = typeof config.scheduleName === 'string' ? config.scheduleName : null
      const fallbackItem = config.fallbackItem === true
      const priority =
        Number.isFinite(Number(config.priority)) && Number(config.priority) > 0 ? Number(config.priority) : 100
      return {
        id: item.id,
        type: item.type,
        title: typeof config.title === 'string' ? config.title : null,
        scheduleName,
        durationSeconds: item.durationSeconds,
        background: typeof config.background === 'string' ? config.background : null,
        mediaUrl: typeof config.mediaUrl === 'string' ? config.mediaUrl : null,
        productIds: Array.isArray(config.productIds) ? config.productIds.filter((entry): entry is string => typeof entry === 'string') : [],
        categoryIds: Array.isArray(config.categoryIds) ? config.categoryIds.filter((entry): entry is string => typeof entry === 'string') : [],
        textBlocks: Array.isArray(config.textBlocks) ? config.textBlocks.filter((entry): entry is string => typeof entry === 'string') : [],
        animation: typeof config.animation === 'string' ? config.animation : null,
        sortOrder: item.sortOrder,
        active: true,
        validFrom,
        validUntil,
        daysOfWeek: daysOfWeek.length > 0 ? daysOfWeek : [1, 2, 3, 4, 5, 6, 7],
        timeWindows:
          item.timeStart && item.timeEnd
            ? [{ from: item.timeStart, until: item.timeEnd }]
            : Array.isArray(config.timeWindows)
              ? config.timeWindows
                  .map((entry) =>
                    entry && typeof entry === 'object'
                      ? {
                          from: String((entry as Record<string, unknown>).from || (entry as Record<string, unknown>).start || ''),
                          until: String((entry as Record<string, unknown>).until || (entry as Record<string, unknown>).end || ''),
                        }
                      : null
                  )
                  .filter((entry): entry is { from: string; until: string } => !!entry && entry.from.length > 0 && entry.until.length > 0)
              : [],
        priority,
        fallbackItem,
      }
    })
    const distributionMeta = meta.distribution || null
    const displayGroupId = asString(distributionMeta?.displayGroupId, `tenant-${screenDevice.tenantId}`)
    const distributionStrategy =
      distributionMeta?.strategy === 'duplicate-all' || distributionMeta?.strategy === 'category-based'
        ? distributionMeta.strategy
        : 'split-products'
    const displayCount =
      distributionMeta?.displayCount && distributionMeta.displayCount > 0
        ? Math.trunc(distributionMeta.displayCount)
        : Math.max(1, siblingDevices.length)
    const sortedDeviceCodes = siblingDevices.map((entry) => entry.deviceCode).sort((a, b) => a.localeCompare(b))
    const currentDisplayIndex = Math.max(1, sortedDeviceCodes.indexOf(screenDevice.deviceCode) + 1)
    const totalProducts = products.length
    const productsPerDisplay = Math.max(1, Math.ceil(totalProducts / Math.max(1, displayCount)))
    const totalPages = Math.max(1, Math.ceil(totalProducts / productsPerDisplay))
    const pageNumber = Math.min(Math.max(1, currentDisplayIndex), totalPages)
    const distributedProducts =
      distributionStrategy === 'duplicate-all'
        ? products
        : products.slice((pageNumber - 1) * productsPerDisplay, pageNumber * productsPerDisplay)

    const diagnosticsMeta = meta.diagnostics || null
    const liveStats = await loadLiveStats(screenDevice.tenantId, null)
    const topTodayMap = new Map(liveStats.topProductsToday.map((entry, index) => [entry.productId, { qty: entry.quantity, rank: index + 1 }]))
    const soldOutSet = new Set(liveStats.soldOutProductIds)
    const lowStockSet = new Set(liveStats.lowStockProductIds)
    const effectiveWidth = diagnosticsMeta?.viewportWidth ?? screenDevice.resolutionWidth
    const effectiveHeight = diagnosticsMeta?.viewportHeight ?? screenDevice.resolutionHeight

    return {
      device: {
        id: screenDevice.id,
        deviceCode: screenDevice.deviceCode,
        name: screenDevice.name,
        type: displayType,
        mode,
        branchId: screenDevice.tenantId,
        tenantId: screenDevice.tenantId,
        status: toStatus(screenDevice.isActive, screenDevice.lastSeenAt),
        appVersion: null,
        resolution: {
          width: screenDevice.resolutionWidth,
          height: screenDevice.resolutionHeight,
          orientation: screenDevice.orientation,
        },
        lastSeenAt: screenDevice.lastSeenAt?.toISOString() ?? null,
      },
      tenant: {
        id: screenDevice.tenantId,
        name: tenantName,
        chainId: tenant?.chainId ?? null,
      },
      branch: {
        id: screenDevice.tenantId,
        name: tenantName,
      },
      mode,
      template,
      layoutSettings: {
        orientation: screenDevice.orientation,
        defaultOrientation: asString(screenSetting?.defaultOrientation, screenDevice.orientation),
        resolutionWidth: screenDevice.resolutionWidth,
        resolutionHeight: screenDevice.resolutionHeight,
        defaultResolutionWidth: asNumber(screenSetting?.defaultResolutionWidth, screenDevice.resolutionWidth),
        defaultResolutionHeight: asNumber(screenSetting?.defaultResolutionHeight, screenDevice.resolutionHeight),
        cardStyle,
        columnCount:
          screenDevice.columnCountOverride ?? asNumber(screenSetting?.defaultColumnCount, 4),
        cardPadding: asNumber(screenSetting?.cardPadding, 16),
        cardBackgroundOpacity: asNumber(screenSetting?.cardBackgroundOpacity, 35),
        cardBorderOpacity: asNumber(screenSetting?.cardBorderOpacity, 20),
        overlayAnimation,
        showPrices,
        showAllergens:
          screenDevice.showAllergensOverride ?? asBoolean(screenSetting?.showAllergens, true),
        showUnavailable:
          screenDevice.showUnavailableOverride ?? asBoolean(screenSetting?.showUnavailable, false),
        showProductNumber:
          screenDevice.showProductNumberOverride ?? asBoolean(screenSetting?.showProductNumber, false),
        showCategoryOnCard,
        showCategoryHeaders,
        productFontSize: asNumber(screenSetting?.productFontSize, 34),
        ingredientFontSize: asNumber(screenSetting?.ingredientFontSize, 12),
        categoryFontSize: asNumber(screenSetting?.categoryFontSize, 12),
        priceFontSize: asNumber(screenSetting?.priceFontSize, 30),
      },
      brandingSettings: {
        tenantName,
        logoUrl: asString(screenSetting?.logoUrl, businessSettings.logoUrl || '') || null,
        accentColor:
          (screenDevice.accentColorOverride ?? asString(screenSetting?.accentColor, '')) || null,
        textColor:
          (screenDevice.textColorOverride ?? asString(screenSetting?.textColor, '')) || null,
        productNameColor: asString(screenSetting?.productNameColor, '#ffffff'),
        ingredientTextColor: asString(screenSetting?.ingredientTextColor, '#e2e8f0'),
        categoryTextColor: asString(screenSetting?.categoryTextColor, '#cbd5e1'),
        priceTextColor: asString(screenSetting?.priceTextColor, '#ffffff'),
        logoSize: asNumber(screenSetting?.logoSize, 72),
        backgroundMode: asString(screenSetting?.backgroundMode, 'COLOR'),
        backgroundValue: asString(screenSetting?.backgroundValue, '#111827'),
        backgroundMediaUrl:
          (screenDevice.backgroundMediaUrlOverride ??
            asString(screenSetting?.backgroundMediaUrl, '')) || null,
      },
      offlineSettings: {
        enabled: true,
        publishedVersion,
        cachedVersion: cacheVersion,
      },
      easyOrderSettings: {
        offlineOrderingEnabled: false,
        touchModeEnabled: false,
      },
      signageSettings,
      contentSettings: {
        selectedCategoryIds,
        selectedProductIds,
        showCategories: showCategoryOnCard || showCategoryHeaders,
        showCategoryOnCard,
        showCategoryHeaders,
        showIngredients:
          screenDevice.showAllergensOverride ?? asBoolean(screenSetting?.showAllergens, true),
        distributionDisplayCount: displayCount,
        distributionStrategy,
        offerWindowEnabled: screenDevice.offerWindowEnabledOverride ?? null,
        offerWindowPosition: screenDevice.offerWindowPositionOverride ?? null,
        offerWindowSize: screenDevice.offerWindowSizeOverride ?? null,
        offerMediaUrls: screenDevice.offerMediaUrlsOverride ?? [],
        offerMediaRotateSec: screenDevice.offerMediaRotateSecOverride ?? null,
      },
      slides,
      categories: categoriesFinal,
      products: distributedProducts.map((product) => ({
        ...(() => {
          const setting = productSettingsMap.get(product.id)
          const badgeLabel = setting?.badgeText ?? null
          const isHero = Boolean(setting?.isFeatured)
          const isPromotion =
            isHero || (badgeLabel ? /(aktion|deal|promo|angebot)/i.test(badgeLabel) : false)
          const isNew = badgeLabel ? /\bneu\b/i.test(badgeLabel) : false
          const isBestseller =
            isHero || (badgeLabel ? /(bestseller|top|hit|beliebt)/i.test(badgeLabel) : false)
          return {
            isHero,
            isBestseller,
            isNew,
            isPromotion,
            promotionText: isPromotion ? badgeLabel : null,
            badgeLabel,
            badgeColor: setting?.highlightColor ?? null,
            highlightPriority: isHero ? 1000 - Math.min(setting?.sortOrder ?? 0, 999) : 0,
            heroImageUrl: product.imageUrl ?? null,
            originalPrice: null as number | null,
            promoPrice: null as number | null,
            validFrom: null as string | null,
            validUntil: null as string | null,
            soldToday: topTodayMap.get(product.id)?.qty ?? 0,
            isTopSeller: topTodayMap.has(product.id),
            isLowStock: lowStockSet.has(product.id),
            isSoldOut: soldOutSet.has(product.id),
            estimatedPrepTime: liveStats.averageWaitTimeMinutes,
            popularityRank: topTodayMap.get(product.id)?.rank ?? null,
          }
        })(),
        id: product.id,
        name: product.name,
        price: Number(product.price),
        categoryId: product.categoryId,
        categoryName: product.category?.name ?? null,
        ingredients: product.ingredients?.map((entry) => entry.ingredient.name).filter(Boolean) || [],
        allergens:
          product.ingredients
            ?.flatMap((entry) =>
              String(entry.ingredient.allergens || '')
                .split(',')
                .map((allergen) => allergen.trim())
                .filter(Boolean)
            )
            .filter((value, index, array) => array.indexOf(value) === index) || [],
      })),
      liveStats,
      distribution: {
        displayGroupId,
        displayCount,
        currentDisplayIndex: pageNumber,
        strategy: distributionStrategy,
        productsPerDisplay,
        totalProducts,
        pageNumber,
        totalPages,
        productIdsForDisplay: distributedProducts.map((product) => product.id),
      },
      publishedVersion,
      cachedVersion: cacheVersion,
      runtimeConfig: {
        refreshIntervalMs,
        performanceMode,
        displayType,
        template,
        source: 'screenDevice',
        showPrices,
        showCategories: showCategoryOnCard || showCategoryHeaders,
        showCategoryOnCard,
        showCategoryHeaders,
        showIngredients:
          screenDevice.showAllergensOverride ?? asBoolean(screenSetting?.showAllergens, true),
        accentColor:
          (screenDevice.accentColorOverride ?? asString(screenSetting?.accentColor, '#ea580c')) || '#ea580c',
        backgroundColor: asString(screenSetting?.backgroundValue, '#111827') || '#111827',
        gradientFrom: asString(screenSetting?.backgroundValue, '#111827') || '#111827',
        gradientTo: asString(screenSetting?.accentColor, '#1f2937') || '#1f2937',
        cardStyle,
        cardOpacity: Math.max(0.35, Math.min(0.95, asNumber(screenSetting?.cardBackgroundOpacity, 35) / 100)),
        productFontSize: asNumber(screenSetting?.productFontSize, 34),
        categoryFontSize: asNumber(screenSetting?.categoryFontSize, 12),
        priceFontSize: asNumber(screenSetting?.priceFontSize, 30),
        ingredientFontSize: asNumber(screenSetting?.ingredientFontSize, 12),
        ingredientTextColor: asString(screenSetting?.ingredientTextColor, '#e2e8f0'),
        defaultColumnCount: asNumber(screenSetting?.defaultColumnCount, 2),
        overlayAnimation,
        backgroundMode: asString(screenSetting?.backgroundMode, 'COLOR'),
        backgroundValue: asString(screenSetting?.backgroundValue, '#111827'),
        backgroundMediaUrl:
          (screenDevice.backgroundMediaUrlOverride ??
            asString(screenSetting?.backgroundMediaUrl, '')) || null,
        logoUrl: asString(screenSetting?.logoUrl, businessSettings.logoUrl || '') || null,
        logoSize: asNumber(screenSetting?.logoSize, 120),
        offerMediaRotateSec: asNumber(screenSetting?.offerMediaRotateSec, 10),
        themePreset: asString((screenSetting as Record<string, unknown> | null)?.themePreset, 'PREMIUM_DARK'),
      },
      debug: {
        source: 'screenDevice',
        builtAt: nowIso,
      },
      deviceCode: screenDevice.deviceCode,
      displayType,
      tenantId: screenDevice.tenantId,
      chainId: tenant?.chainId ?? null,
      displayId: screenDevice.id,
      isActive: screenDevice.isActive,
      branding: {
        tenantName,
        logoUrl: asString(screenSetting?.logoUrl, businessSettings.logoUrl || '') || null,
        primaryColor:
          (screenDevice.accentColorOverride ?? asString(screenSetting?.accentColor, '')) || null,
        secondaryColor: null,
        textColor:
          (screenDevice.textColorOverride ?? asString(screenSetting?.textColor, '')) || null,
      },
      refreshIntervalMs,
      performanceMode,
      assetSettings: {
        baseUrl: null,
        preferredFormats: ['mp4', 'webm', 'jpg', 'png'],
      },
      diagnostics: {
        effectiveResolution:
          effectiveWidth && effectiveHeight ? `${effectiveWidth}x${effectiveHeight}` : null,
        devicePixelRatio:
          typeof diagnosticsMeta?.devicePixelRatio === 'number'
            ? diagnosticsMeta.devicePixelRatio
            : null,
        viewport:
          diagnosticsMeta?.viewportWidth && diagnosticsMeta?.viewportHeight
            ? `${diagnosticsMeta.viewportWidth}x${diagnosticsMeta.viewportHeight}`
            : null,
        orientation: diagnosticsMeta?.orientation || screenDevice.orientation || null,
        fullscreenSupported:
          typeof diagnosticsMeta?.fullscreenSupported === 'boolean'
            ? diagnosticsMeta.fullscreenSupported
            : null,
        touchSupported:
          typeof diagnosticsMeta?.touchSupported === 'boolean'
            ? diagnosticsMeta.touchSupported
            : null,
        userAgent: diagnosticsMeta?.userAgent || null,
        appVersion: diagnosticsMeta?.appVersion || null,
        estimatedPerformanceClass: diagnosticsMeta?.estimatedPerformanceClass || null,
        supportedVideoFormats: diagnosticsMeta?.supportedVideoFormats || [],
        recommendedResolution:
          diagnosticsMeta?.recommendedResolution ||
          deriveRecommendedResolution(effectiveWidth, effectiveHeight),
        lastDiagnosticsAt: diagnosticsMeta?.measuredAt || null,
      },
      videoBackgroundEnabled: Boolean(
        screenDevice.backgroundMediaUrlOverride ||
          asString(screenSetting?.backgroundMode, '').toUpperCase() === 'VIDEO'
      ),
      videoBackgroundUrl:
        (screenDevice.backgroundMediaUrlOverride ??
          asString(screenSetting?.backgroundMediaUrl, '')) || null,
      fallbackBackgroundUrl:
        asString(screenSetting?.backgroundMode, '').toUpperCase() === 'IMAGE'
          ? asString(screenSetting?.backgroundMediaUrl, '') || null
          : null,
      cacheVersion,
      lastSeenAt: screenDevice.lastSeenAt?.toISOString() ?? null,
      lastSyncAt: cacheVersion,
      updatedAt: cacheVersion,
      serverTime: nowIso,
    }
  }

  const orderDisplay = await prisma.orderDisplay.findUnique({
    where: { displayCode: deviceCode },
  })

  if (!orderDisplay) {
    return null
  }

  const tenant = await prisma.tenant.findUnique({
    where: { id: orderDisplay.tenantId },
    select: {
      id: true,
      chainId: true,
      name: true,
      businessSettings: true,
    },
  })
  const tenantName = tenant?.name ?? 'Tenant'
  const businessSettings = parseSettings(tenant?.businessSettings, { name: tenantName, email: null })
  const meta = parseDisplayMetaFromNotes(orderDisplay.notes)
  const performanceMode = meta.performanceMode ?? 'AUTO'
  const latestBinding = await prisma.orderDeskDeviceBinding.findFirst({
    where: { displayId: orderDisplay.id },
    orderBy: { lastSeenAt: 'desc' },
    select: { lastSeenAt: true, appVersion: true },
  })
  const displayType = toDisplayTypeFromOrderRole(orderDisplay.displayRole)
  const mode = toModeFromDisplayType(displayType)
  const cacheVersion = orderDisplay.updatedAt.toISOString()
  const refreshIntervalMs = Math.max(3000, orderDisplay.refreshIntervalSec * 1000)
  const liveStats = await loadLiveStats(orderDisplay.tenantId, null)

  return {
    device: {
      id: orderDisplay.id,
      deviceCode: orderDisplay.displayCode,
      name: orderDisplay.name,
      type: displayType,
      mode,
      branchId: orderDisplay.tenantId,
      tenantId: orderDisplay.tenantId,
      status: toStatus(orderDisplay.isActive, latestBinding?.lastSeenAt),
      appVersion: latestBinding?.appVersion ?? null,
      resolution: {
        width: null,
        height: null,
        orientation: null,
      },
      lastSeenAt: latestBinding?.lastSeenAt?.toISOString() ?? null,
    },
    tenant: {
      id: orderDisplay.tenantId,
      name: tenantName,
      chainId: tenant?.chainId ?? null,
    },
    branch: {
      id: orderDisplay.tenantId,
      name: tenantName,
    },
    mode,
    template: 'CLASSIC_MENU',
    layoutSettings: {
      autoScaleLayout: orderDisplay.autoScaleLayout,
      sortMode: orderDisplay.sortMode,
      showOrderAge: orderDisplay.showOrderAge,
      showTerminalInfo: orderDisplay.showTerminalInfo,
      showPaymentInfo: orderDisplay.showPaymentInfo,
      showTotal: orderDisplay.showTotal,
      showItems: orderDisplay.showItems,
      showStatusBadge: orderDisplay.showStatusBadge,
    },
    brandingSettings: {
      tenantName,
      logoUrl: businessSettings.logoUrl,
      displayBackgroundColor: orderDisplay.displayBackgroundColor,
      orderCardBackgroundColor: orderDisplay.orderCardBackgroundColor,
      statusColorOpen: orderDisplay.statusColorOpen,
    },
    offlineSettings: {
      enabled: true,
      publishedVersion: cacheVersion,
      cachedVersion: cacheVersion,
    },
    easyOrderSettings: {
      offlineOrderingEnabled: false,
      touchModeEnabled: mode === 'EASY_ORDER',
    },
    signageSettings: {
      enabled: false,
      playlistId: null,
      rotationMode: 'SEQUENTIAL',
      defaultSlideDurationSeconds: 12,
      transitionType: 'FADE',
      loopEnabled: true,
      preloadMedia: true,
      offlineCacheEnabled: true,
    },
    contentSettings: {},
    slides: [],
    categories: [],
    products: [],
    liveStats,
    distribution: {
      displayGroupId: `order-display-${orderDisplay.tenantId}`,
      displayCount: 1,
      currentDisplayIndex: 1,
      strategy: 'duplicate-all',
      productsPerDisplay: 0,
      totalProducts: 0,
      pageNumber: 1,
      totalPages: 1,
      productIdsForDisplay: [],
    },
    publishedVersion: cacheVersion,
    cachedVersion: cacheVersion,
    runtimeConfig: {
      refreshIntervalMs,
      performanceMode,
      displayType,
      source: 'orderDisplay',
    },
    debug: {
      source: 'orderDisplay',
      builtAt: nowIso,
    },
    deviceCode: orderDisplay.displayCode,
    displayType,
    tenantId: orderDisplay.tenantId,
    chainId: tenant?.chainId ?? null,
    displayId: orderDisplay.id,
    isActive: orderDisplay.isActive,
    branding: {
      tenantName,
      logoUrl: businessSettings.logoUrl,
      primaryColor: orderDisplay.statusColorOpen ?? null,
      secondaryColor: null,
      textColor: null,
    },
    refreshIntervalMs,
    performanceMode,
    assetSettings: {
      baseUrl: null,
      preferredFormats: ['mp4', 'webm', 'jpg', 'png'],
    },
    diagnostics: {
      effectiveResolution: null,
      devicePixelRatio: null,
      viewport: null,
      orientation: null,
      fullscreenSupported: null,
      touchSupported: null,
      userAgent: null,
      appVersion: latestBinding?.appVersion ?? null,
      estimatedPerformanceClass: null,
      supportedVideoFormats: [],
      recommendedResolution: null,
      lastDiagnosticsAt: null,
    },
    videoBackgroundEnabled:
      orderDisplay.backgroundMediaMode !== 'NONE' && Boolean(orderDisplay.backgroundMediaUrl),
    videoBackgroundUrl: orderDisplay.backgroundMediaUrl,
    fallbackBackgroundUrl: null,
    cacheVersion,
    lastSeenAt: latestBinding?.lastSeenAt?.toISOString() ?? null,
    lastSyncAt: cacheVersion,
    updatedAt: cacheVersion,
    serverTime: nowIso,
  }
}
