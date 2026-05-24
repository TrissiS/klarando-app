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
    durationSeconds: number
    background: string | null
    mediaUrl: string | null
    productIds: string[]
    textBlocks: string[]
    animation: string | null
    sortOrder: number
    active: boolean
  }>
  categories: Array<{ id: string; name: string }>
  products: Array<{ id: string; name: string; categoryId: string | null; categoryName: string | null }>
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

  const screenDevice = await prisma.screenDevice.findUnique({
    where: { deviceCode },
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
    const [screenSettingRaw, categories, productsBySelection, productsByVisibility, activePlaylist] = await Promise.all([
      prisma.screenSetting.findUnique({
        where: { tenantId: screenDevice.tenantId },
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
              categoryId: true,
              category: { select: { name: true } },
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
              categoryId: true,
              category: { select: { id: true, name: true } },
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
      return {
        id: item.id,
        type: item.type,
        title: typeof config.title === 'string' ? config.title : null,
        durationSeconds: item.durationSeconds,
        background: typeof config.background === 'string' ? config.background : null,
        mediaUrl: typeof config.mediaUrl === 'string' ? config.mediaUrl : null,
        productIds: Array.isArray(config.productIds) ? config.productIds.filter((entry): entry is string => typeof entry === 'string') : [],
        textBlocks: Array.isArray(config.textBlocks) ? config.textBlocks.filter((entry): entry is string => typeof entry === 'string') : [],
        animation: typeof config.animation === 'string' ? config.animation : null,
        sortOrder: item.sortOrder,
        active: true,
      }
    })
    const diagnosticsMeta = meta.diagnostics || null
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
        offerWindowEnabled: screenDevice.offerWindowEnabledOverride ?? null,
        offerWindowPosition: screenDevice.offerWindowPositionOverride ?? null,
        offerWindowSize: screenDevice.offerWindowSizeOverride ?? null,
        offerMediaUrls: screenDevice.offerMediaUrlsOverride ?? [],
        offerMediaRotateSec: screenDevice.offerMediaRotateSecOverride ?? null,
      },
      slides,
      categories: categoriesFinal,
      products: products.map((product) => ({
        id: product.id,
        name: product.name,
        categoryId: product.categoryId,
        categoryName: product.category?.name ?? null,
      })),
      publishedVersion,
      cachedVersion: cacheVersion,
      runtimeConfig: {
        refreshIntervalMs,
        performanceMode,
        displayType,
        template,
        source: 'screenDevice',
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
