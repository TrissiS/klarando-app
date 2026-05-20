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
  contentSettings: RuntimeSettingsMap
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
  videoBackgroundEnabled: boolean
  videoBackgroundUrl: string | null
  fallbackBackgroundUrl: string | null
  cacheVersion: string
  lastSeenAt: string | null
  lastSyncAt: string | null
  updatedAt: string
  serverTime: string
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
    const [categories, products] = await Promise.all([
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
    ])
    const displayType: RuntimeDisplayType = 'MENU'
    const mode = toModeFromDisplayType(displayType)
    const template = (screenDevice.cardStyleOverride || 'MODERN_GRID').toUpperCase()
    const cacheVersion = screenDevice.updatedAt.toISOString()
    const refreshIntervalMs = Math.max(5000, screenDevice.refreshIntervalSec * 1000)

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
        resolutionWidth: screenDevice.resolutionWidth,
        resolutionHeight: screenDevice.resolutionHeight,
        cardStyle: screenDevice.cardStyleOverride || null,
        columnCount: screenDevice.columnCountOverride ?? null,
        showPrices: screenDevice.showPricesOverride,
        showAllergens: screenDevice.showAllergensOverride,
        showUnavailable: screenDevice.showUnavailableOverride,
        showProductNumber: screenDevice.showProductNumberOverride,
      },
      brandingSettings: {
        tenantName,
        logoUrl: businessSettings.logoUrl,
        accentColor: screenDevice.accentColorOverride ?? null,
        textColor: screenDevice.textColorOverride ?? null,
      },
      offlineSettings: {
        enabled: true,
        publishedVersion: cacheVersion,
        cachedVersion: cacheVersion,
      },
      easyOrderSettings: {
        offlineOrderingEnabled: false,
        touchModeEnabled: false,
      },
      contentSettings: {
        selectedCategoryIds,
        selectedProductIds,
        offerWindowEnabled: screenDevice.offerWindowEnabledOverride ?? null,
        offerWindowPosition: screenDevice.offerWindowPositionOverride ?? null,
        offerWindowSize: screenDevice.offerWindowSizeOverride ?? null,
        offerMediaUrls: screenDevice.offerMediaUrlsOverride ?? [],
        offerMediaRotateSec: screenDevice.offerMediaRotateSecOverride ?? null,
      },
      categories,
      products: products.map((product) => ({
        id: product.id,
        name: product.name,
        categoryId: product.categoryId,
        categoryName: product.category?.name ?? null,
      })),
      publishedVersion: cacheVersion,
      cachedVersion: cacheVersion,
      runtimeConfig: {
        refreshIntervalMs,
        performanceMode,
        displayType,
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
        logoUrl: businessSettings.logoUrl,
        primaryColor: screenDevice.accentColorOverride ?? null,
        secondaryColor: null,
        textColor: screenDevice.textColorOverride ?? null,
      },
      refreshIntervalMs,
      performanceMode,
      assetSettings: {
        baseUrl: null,
        preferredFormats: ['mp4', 'webm', 'jpg', 'png'],
      },
      videoBackgroundEnabled: Boolean(screenDevice.backgroundMediaUrlOverride),
      videoBackgroundUrl: screenDevice.backgroundMediaUrlOverride,
      fallbackBackgroundUrl: null,
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
    contentSettings: {},
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
