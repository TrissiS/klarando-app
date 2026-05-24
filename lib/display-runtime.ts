import { API_BASE_URL } from './config'

export type DisplayRuntimeType = 'MENU' | 'ORDER' | 'KITCHEN' | 'CUSTOMER' | 'TERMINAL'
export type DisplayRuntimeMode =
  | 'MENU_DISPLAY'
  | 'EASY_ORDER'
  | 'PICKUP_MONITOR'
  | 'PROMOTION_SCREEN'
  | 'KITCHEN_DISPLAY'
  | 'ORDER_DESK'

export type DisplayRuntimeConfig = {
  device: {
    id: string
    deviceCode: string
    name: string
    type: DisplayRuntimeType
    mode: DisplayRuntimeMode
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
  mode: DisplayRuntimeMode
  template: string
  layoutSettings: Record<string, unknown>
  brandingSettings: Record<string, unknown>
  offlineSettings: Record<string, unknown>
  easyOrderSettings: Record<string, unknown>
  signageSettings: Record<string, unknown>
  contentSettings: Record<string, unknown>
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
  products: Array<{
    id: string
    name: string
    categoryId: string | null
    categoryName: string | null
    ingredients: string[]
    allergens: string[]
  }>
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
  runtimeConfig: Record<string, unknown>
  deviceCode: string
  displayType: DisplayRuntimeType
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
  performanceMode: 'AUTO' | 'NORMAL' | 'LOW'
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
  runtimeSourceRoute?: string
  rendererVersion?: string
  loadedManifestVersion?: string | null
}

export type DisplayRuntimeFetchDebug = {
  deviceCode: string
  manifestUrl: string
  runtimeUrl: string
  manifestStatus: number | null
  runtimeStatus: number | null
  lastSuccessfulUrl: string | null
  lastError: string | null
  fetchedAt: string
}

const runtimeFetchDebugByDevice = new Map<string, DisplayRuntimeFetchDebug>()

export function getLastDisplayRuntimeDebug(deviceCode: string): DisplayRuntimeFetchDebug | null {
  return runtimeFetchDebugByDevice.get(deviceCode.toUpperCase()) || null
}

export type DisplayRuntimeConnectionState = 'online' | 'reconnecting' | 'offline_cached'

function cacheKey(deviceCode: string) {
  return `klarando:display-runtime:${deviceCode.toUpperCase()}`
}

export function withAssetCacheVersion(url: string | null | undefined, cacheVersion: string) {
  if (!url) {
    return null
  }

  try {
    const parsed = new URL(url, typeof window === 'undefined' ? 'http://localhost' : window.location.origin)
    parsed.searchParams.set('cv', cacheVersion)
    return parsed.toString()
  } catch {
    const separator = url.includes('?') ? '&' : '?'
    return `${url}${separator}cv=${encodeURIComponent(cacheVersion)}`
  }
}

export function readCachedDisplayRuntimeConfig(deviceCode: string) {
  if (typeof window === 'undefined') {
    return null
  }

  const raw = window.localStorage.getItem(cacheKey(deviceCode))
  if (!raw) {
    return null
  }

  try {
    return JSON.parse(raw) as DisplayRuntimeConfig
  } catch {
    return null
  }
}

export function writeCachedDisplayRuntimeConfig(config: DisplayRuntimeConfig) {
  if (typeof window === 'undefined') {
    return
  }
  window.localStorage.setItem(cacheKey(config.deviceCode), JSON.stringify(config))
}

export async function fetchDisplayRuntimeConfig(
  deviceCode: string,
  options?: { strictManifest?: boolean; debugNoCache?: boolean }
) {
  const strictManifest = options?.strictManifest === true
  const noCacheSuffix = options?.debugNoCache ? `?_ts=${Date.now()}` : ''
  const manifestUrl = `${API_BASE_URL}/api/display-runtime/${deviceCode}/manifest${noCacheSuffix}`
  const runtimeUrl = `${API_BASE_URL}/api/display-runtime/${deviceCode}${noCacheSuffix}`
  const debug: DisplayRuntimeFetchDebug = {
    deviceCode: deviceCode.toUpperCase(),
    manifestUrl,
    runtimeUrl,
    manifestStatus: null,
    runtimeStatus: null,
    lastSuccessfulUrl: null,
    lastError: null,
    fetchedAt: new Date().toISOString(),
  }

  const manifestResponse = await fetch(manifestUrl, {
    cache: 'no-store',
  })
  debug.manifestStatus = manifestResponse.status

  if (manifestResponse.ok) {
    const manifestPayload = (await manifestResponse.json()) as {
      runtime?: DisplayRuntimeConfig
      displayManifest?: { runtime?: DisplayRuntimeConfig }
    }
    const manifestRuntime =
      manifestPayload.runtime ||
      manifestPayload.displayManifest?.runtime ||
      null
    if (manifestRuntime) {
      const mergedRuntime: DisplayRuntimeConfig = {
        ...manifestRuntime,
        runtimeSourceRoute: '/api/display-runtime/:deviceCode/manifest',
        rendererVersion: 'manifest-v2',
        loadedManifestVersion:
          (manifestPayload.displayManifest as { manifestVersion?: string } | undefined)?.manifestVersion || null,
      }
      debug.lastSuccessfulUrl = manifestUrl
      runtimeFetchDebugByDevice.set(deviceCode.toUpperCase(), debug)
      writeCachedDisplayRuntimeConfig(mergedRuntime)
      return mergedRuntime
    }
  }

  if (strictManifest) {
    debug.lastError = `Manifest ungültig oder leer (HTTP ${debug.manifestStatus ?? 'n/a'})`
    runtimeFetchDebugByDevice.set(deviceCode.toUpperCase(), debug)
    throw new Error(`Kein gültiges Display-Manifest geladen (HTTP ${debug.manifestStatus ?? 'n/a'})`)
  }

  const response = await fetch(runtimeUrl, {
    cache: 'no-store',
  })
  debug.runtimeStatus = response.status

  if (!response.ok) {
    const payload = await response.json().catch(() => null)
    debug.lastError = payload?.error || `Runtime konnte nicht geladen werden (HTTP ${response.status})`
    runtimeFetchDebugByDevice.set(deviceCode.toUpperCase(), debug)
    throw new Error(payload?.error || 'Display-Runtime konnte nicht geladen werden')
  }

  const config = (await response.json()) as DisplayRuntimeConfig
  const legacyRuntime: DisplayRuntimeConfig = {
    ...config,
    runtimeSourceRoute: '/api/display-runtime/:deviceCode',
    rendererVersion: 'legacy-runtime',
    loadedManifestVersion: null,
  }
  debug.lastSuccessfulUrl = runtimeUrl
  runtimeFetchDebugByDevice.set(deviceCode.toUpperCase(), debug)

  writeCachedDisplayRuntimeConfig(legacyRuntime)
  return legacyRuntime
}
