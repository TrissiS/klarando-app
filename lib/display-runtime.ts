import { API_BASE_URL } from './config'

export type DisplayRuntimeType = 'MENU' | 'ORDER' | 'KITCHEN' | 'CUSTOMER' | 'TERMINAL'

export type DisplayRuntimeConfig = {
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
  layoutSettings: Record<string, unknown>
  refreshIntervalMs: number
  performanceMode: 'AUTO' | 'NORMAL' | 'LOW'
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

export async function fetchDisplayRuntimeConfig(deviceCode: string) {
  const response = await fetch(`${API_BASE_URL}/api/display-runtime/${deviceCode}/config`, {
    cache: 'no-store',
  })

  if (!response.ok) {
    const payload = await response.json().catch(() => null)
    throw new Error(payload?.error || 'Display-Runtime konnte nicht geladen werden')
  }

  const config = (await response.json()) as DisplayRuntimeConfig
  writeCachedDisplayRuntimeConfig(config)
  return config
}
