'use client'

import { useEffect, useMemo, useState } from 'react'
import {
  getPublicScreenFeed,
  type PublicScreenFeed,
  type ScreenConfig,
  type ScreenAllergenLegendPosition,
  type ScreenCardStyle,
  type ScreenPriceDisplayMode,
} from '@/lib/api'
import {
  fetchDisplayRuntimeConfig,
  getLastDisplayRuntimeDebug,
  readCachedDisplayRuntimeConfig,
  type DisplayRuntimeConfig,
  type DisplayRuntimeConnectionState,
} from '@/lib/display-runtime'
import {
  listOfflineOrders,
  readOfflineDisplaySnapshot,
  removeOfflineOrder,
  writeOfflineDisplaySnapshot,
} from '@/lib/display-offline'
import { DisplayConnectionStatus } from '@/app/Components/display/DisplayConnectionStatus'
import { DisplayRuntimeShell } from '@/app/Components/display/DisplayRuntimeShell'

type Props = {
  params: Promise<{
    deviceCode: string
  }>
}

const ALLERGEN_LABELS: Record<string, string> = {
  A: 'Glutenhaltiges Getreide',
  B: 'Krebstiere',
  C: 'Ei',
  D: 'Fisch',
  E: 'Erdnuesse',
  F: 'Soja',
  G: 'Milch',
  H: 'Schalenfruechte',
  I: 'Sellerie',
  J: 'Senf',
  K: 'Sesam',
  L: 'Schwefeldioxid / Sulfite',
  M: 'Lupinen',
  N: 'Weichtiere',
  '1': 'Konservierungsstoff',
  '2': 'Farbstoff',
  '3': 'Antioxidationsmittel',
  '4': 'Geschmacksverstaerker',
  '5': 'geschwefelt',
  '6': 'geschwaerzt',
  '7': 'gewachst',
  '8': 'mit Phosphat',
}

function getYouTubeEmbedUrl(input?: string | null) {
  const raw = input?.trim()
  if (!raw) {
    return null
  }

  let parsed: URL
  try {
    parsed = new URL(raw)
  } catch {
    return null
  }

  const host = parsed.hostname.replace(/^www\./, '').toLowerCase()
  let videoId = ''

  if (host === 'youtu.be') {
    videoId = parsed.pathname.split('/').filter(Boolean)[0] || ''
  } else if (
    host === 'youtube.com' ||
    host === 'm.youtube.com' ||
    host === 'youtube-nocookie.com'
  ) {
    if (parsed.pathname === '/watch') {
      videoId = parsed.searchParams.get('v') || ''
    } else {
      const parts = parsed.pathname.split('/').filter(Boolean)
      if (parts[0] === 'shorts' || parts[0] === 'embed' || parts[0] === 'live') {
        videoId = parts[1] || ''
      }
    }
  }

  if (!videoId) {
    return null
  }

  const params = new URLSearchParams({
    autoplay: '1',
    mute: '1',
    loop: '1',
    controls: '0',
    rel: '0',
    modestbranding: '1',
    playsinline: '1',
    iv_load_policy: '3',
    disablekb: '1',
    playlist: videoId,
  })

  return `https://www.youtube-nocookie.com/embed/${videoId}?${params.toString()}`
}

function clampInt(value: number, min: number, max: number) {
  if (!Number.isFinite(value)) {
    return min
  }
  return Math.min(max, Math.max(min, Math.trunc(value)))
}

function hexToRgba(color: string | null | undefined, alpha: number) {
  const safeAlpha = Math.max(0, Math.min(1, alpha))
  const raw = (color || '').trim()
  const match = /^#([0-9a-fA-F]{6})$/.exec(raw)
  if (!match) {
    return `rgba(249, 115, 22, ${safeAlpha})`
  }
  const hex = match[1]
  const red = Number.parseInt(hex.slice(0, 2), 16)
  const green = Number.parseInt(hex.slice(2, 4), 16)
  const blue = Number.parseInt(hex.slice(4, 6), 16)
  return `rgba(${red}, ${green}, ${blue}, ${safeAlpha})`
}

function cardClassByStyle(style: ScreenCardStyle) {
  if (style === 'BOLD') {
    return 'rounded-3xl border-2 border-white/45 bg-slate-900/75 shadow-[0_12px_34px_rgba(2,6,23,0.45)]'
  }

  if (style === 'OUTLINE') {
    return 'rounded-2xl border-2 border-white/60 bg-transparent'
  }

  if (style === 'MINIMAL') {
    return 'rounded-xl border border-white/10 bg-slate-900/40'
  }

  if (style === 'SHARP') {
    return 'rounded-lg border border-white/20 bg-black/45'
  }

  if (style === 'GLASS') {
    return 'rounded-2xl border border-white/25 bg-white/10 backdrop-blur-md'
  }

  return 'rounded-2xl border border-white/15 bg-black/35'
}

function formatPriceForDisplay(value: number, mode: ScreenPriceDisplayMode) {
  if (mode === 'COMMA_DECIMAL') {
    return value.toFixed(2).replace('.', ',')
  }

  if (mode === 'NO_DECIMALS') {
    return `${Math.round(value)} EUR`
  }

  const formatted = value.toFixed(2)
  if (mode === 'EUR_PREFIX') {
    return `EUR ${formatted}`
  }
  if (mode === 'CURRENCY_SYMBOL') {
    return `EUR ${formatted}`
  }
  return `${formatted} EUR`
}

function productAnimationStyle(animation: string | null | undefined, index: number): React.CSSProperties {
  const normalized = (animation || 'NONE').toUpperCase()
  if (normalized === 'FLOAT') {
    return {
      animation: `klarandoScreenFloat 5.5s ease-in-out ${index * 0.08}s infinite`,
    }
  }
  if (normalized === 'SLIDE') {
    return {
      animation: `klarandoScreenSlideIn 0.55s ease ${Math.min(index * 0.06, 0.7)}s both`,
    }
  }
  if (normalized === 'SPARKLE') {
    return {
      animation: `klarandoScreenSparkle 2.6s ease-in-out ${index * 0.1}s infinite`,
    }
  }
  return {}
}

function formatTickerClock(value: Date) {
  return value.toLocaleTimeString('de-DE', {
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
  })
}

function tickerFallbackLabel(source: string | null | undefined) {
  if (source === 'WEATHER_API') {
    return 'Wetterdaten derzeit nicht verfuegbar.'
  }
  if (source === 'TRAFFIC_API') {
    return 'Verkehrsdaten derzeit nicht verfuegbar.'
  }
  return 'Nachrichten derzeit nicht verfuegbar.'
}

function collectTickerParts(payload: unknown): string[] {
  if (payload === null || payload === undefined) {
    return []
  }

  if (typeof payload === 'string') {
    return payload.trim() ? [payload.trim()] : []
  }

  if (typeof payload === 'number' || typeof payload === 'boolean') {
    return [String(payload)]
  }

  if (Array.isArray(payload)) {
    return payload
      .flatMap((entry) => collectTickerParts(entry))
      .map((entry) => entry.trim())
      .filter(Boolean)
  }

  if (typeof payload === 'object') {
    const map = payload as Record<string, unknown>
    const directKeys = ['title', 'headline', 'text', 'message', 'summary', 'description']
    for (const key of directKeys) {
      const value = map[key]
      if (typeof value === 'string' && value.trim()) {
        return [value.trim()]
      }
    }

    const collectionKeys = ['items', 'articles', 'results', 'alerts', 'data', 'feeds']
    for (const key of collectionKeys) {
      const value = map[key]
      if (Array.isArray(value)) {
        const parts = collectTickerParts(value)
        if (parts.length > 0) {
          return parts
        }
      }
    }
  }

  return []
}

function extractTickerText(payload: unknown, maxLength = 460) {
  const parts = collectTickerParts(payload)
    .map((entry) => entry.replace(/\s+/g, ' ').trim())
    .filter(Boolean)

  if (parts.length === 0) {
    return ''
  }

  const joined = Array.from(new Set(parts)).slice(0, 12).join(' | ')
  if (joined.length <= maxLength) {
    return joined
  }
  return `${joined.slice(0, maxLength - 1)}…`
}

function formatPickupNumber(value: number) {
  return String(value).padStart(3, '0')
}

function announcementRemainingSeconds(announceUntil: string | null) {
  if (!announceUntil) {
    return null
  }

  const remainingMs = new Date(announceUntil).getTime() - Date.now()
  if (remainingMs <= 0) {
    return 0
  }

  return Math.ceil(remainingMs / 1000)
}

function formatIngredientLine(
  ingredients: Array<{ name: string; allergens: string[] }>,
  showAllergens: boolean
) {
  if (ingredients.length === 0) {
    return []
  }

  return ingredients.map((entry) => ({
    name: entry.name,
    superscript: showAllergens && entry.allergens.length > 0 ? entry.allergens.join(',') : null,
  }))
}

function formatDepositLine(
  beverageContainerType: 'NONE' | 'EINWEG' | 'MEHRWEG',
  depositValue: number
) {
  if (beverageContainerType === 'NONE') {
    return null
  }

  if (!Number.isFinite(depositValue) || depositValue <= 0) {
    return null
  }

  return `inkl. ${depositValue.toFixed(2).replace('.', ',')} EUR Pfand`
}

function resolveProductCategory(product: PublicScreenFeed['products'][number]) {
  return product.screen.displayCategory || product.category?.name || 'Allgemein'
}

function legendPositionClass(position: ScreenAllergenLegendPosition) {
  if (position === 'TOP_LEFT') {
    return 'left-6 top-6'
  }

  if (position === 'TOP_RIGHT') {
    return 'right-6 top-6'
  }

  if (position === 'BOTTOM_LEFT') {
    return 'left-6 bottom-6'
  }

  if (position === 'BOTTOM_CENTER') {
    return 'left-1/2 bottom-6 -translate-x-1/2'
  }

  return 'right-6 bottom-6'
}

function defaultOfferWindowCoordinates(position: string | null | undefined) {
  const normalized = (position || '').toUpperCase()
  if (normalized === 'LEFT') {
    return { x: 16, y: 14 }
  }
  if (normalized === 'TOP') {
    return { x: 50, y: 12 }
  }
  if (normalized === 'BOTTOM') {
    return { x: 50, y: 86 }
  }
  return { x: 84, y: 14 }
}

function resolveOfferWindowCoordinates(
  position: string | null | undefined,
  xPercent: number | null | undefined,
  yPercent: number | null | undefined
) {
  const fallback = defaultOfferWindowCoordinates(position)
  return {
    x: clampInt(Number(xPercent ?? fallback.x), 0, 100),
    y: clampInt(Number(yPercent ?? fallback.y), 0, 100),
  }
}

function offerWindowWidth(size: string | null | undefined) {
  const normalized = (size || '').toUpperCase()
  if (normalized === 'S') {
    return 280
  }
  if (normalized === 'L') {
    return 520
  }
  return 380
}

function resolveOfferWindowWidthPx(config: PublicScreenFeed['config']) {
  if (Number.isFinite(config.offerWindowWidthPx) && config.offerWindowWidthPx > 0) {
    return clampInt(Number(config.offerWindowWidthPx), 180, 1400)
  }
  return offerWindowWidth(config.offerWindowSize)
}

function resolveOfferWindowHeightPx(config: PublicScreenFeed['config']) {
  if (Number.isFinite(config.offerWindowHeightPx) && config.offerWindowHeightPx > 0) {
    return clampInt(Number(config.offerWindowHeightPx), 120, 1200)
  }
  const widthFallback = offerWindowWidth(config.offerWindowSize)
  return clampInt(Math.round(widthFallback * 0.72), 120, 1200)
}

function resolveOfferReservePaddingStyle(params: {
  enabled: boolean
  reserveSpace: boolean
  xPercent: number
  yPercent: number
  widthPx: number
  heightPx: number
  viewportWidthPx: number
  viewportHeightPx: number
}) {
  if (!params.enabled || !params.reserveSpace) {
    return {} as React.CSSProperties
  }

  const xPx = (params.xPercent / 100) * params.viewportWidthPx
  const yPx = (params.yPercent / 100) * params.viewportHeightPx
  const halfW = params.widthPx / 2
  const halfH = params.heightPx / 2

  const distances = {
    left: xPx - halfW,
    right: params.viewportWidthPx - (xPx + halfW),
    top: yPx - halfH,
    bottom: params.viewportHeightPx - (yPx + halfH),
  }

  const side = (Object.entries(distances).sort((a, b) => a[1] - b[1])[0]?.[0] ||
    'right') as 'left' | 'right' | 'top' | 'bottom'
  const gapPx = 22

  if (side === 'left') {
    return { paddingLeft: `${params.widthPx + gapPx}px` } as React.CSSProperties
  }
  if (side === 'right') {
    return { paddingRight: `${params.widthPx + gapPx}px` } as React.CSSProperties
  }
  if (side === 'top') {
    return { paddingTop: `${params.heightPx + gapPx}px` } as React.CSSProperties
  }
  return { paddingBottom: `${params.heightPx + gapPx}px` } as React.CSSProperties
}

export default function ScreenDevicePage({ params }: Props) {
  const [deviceCode, setDeviceCode] = useState('')
  const [feed, setFeed] = useState<PublicScreenFeed | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [offerMediaIndex, setOfferMediaIndex] = useState(0)
  const [tickerText, setTickerText] = useState('')
  const [tickerClock, setTickerClock] = useState<Date>(() => new Date())
  const [runtimeConfig, setRuntimeConfig] = useState<DisplayRuntimeConfig | null>(null)
  const [connectionState, setConnectionState] = useState<DisplayRuntimeConnectionState>('online')
  const [isOfflineNoticeVisible, setIsOfflineNoticeVisible] = useState(false)
  const [debugMode, setDebugMode] = useState(false)
  const [manifestDebugOpen, setManifestDebugOpen] = useState(false)
  const [manifestRuntimeError, setManifestRuntimeError] = useState('')
  const [runtimeNetworkDebug, setRuntimeNetworkDebug] = useState<ReturnType<typeof getLastDisplayRuntimeDebug> | null>(null)
  const loadedAt = useMemo(() => new Date().toISOString(), [])
  const buildVersion = process.env.NEXT_PUBLIC_APP_VERSION || '0.1.22'
  const commitId = process.env.NEXT_PUBLIC_GIT_SHA || 'unknown'
  const [viewportResolution, setViewportResolution] = useState<{ width: number; height: number }>({
    width: 1920,
    height: 1080,
  })
  const isLowPerformanceMode = runtimeConfig?.performanceMode === 'LOW'

  useEffect(() => {
    function updateViewportResolution() {
      setViewportResolution({
        width: Math.max(320, window.innerWidth || 1920),
        height: Math.max(240, window.innerHeight || 1080),
      })
    }
    updateViewportResolution()
    window.addEventListener('resize', updateViewportResolution)
    return () => window.removeEventListener('resize', updateViewportResolution)
  }, [])

  useEffect(() => {
    if (typeof window === 'undefined') return
    const params = new URLSearchParams(window.location.search)
    const byQuery = params.get('debugDisplay') === '1'
    const byStorage = window.localStorage.getItem('klarando:display-debug') === '1'
    setDebugMode(byQuery || byStorage)
  }, [])

  useEffect(() => {
    params.then((resolved) => {
      setDeviceCode(resolved.deviceCode.toUpperCase())
    })
  }, [params])

  useEffect(() => {
    if (!deviceCode) {
      return
    }

    let isMounted = true
    let timer: ReturnType<typeof setTimeout> | null = null
    let restoredFromCache = false

    const cachedSnapshot = readOfflineDisplaySnapshot(deviceCode)
    if (cachedSnapshot?.feed) {
      setFeed(cachedSnapshot.feed)
      if (cachedSnapshot.runtimeConfig) {
        setRuntimeConfig(cachedSnapshot.runtimeConfig)
      }
      restoredFromCache = true
      setLoading(false)
    }

    async function loadFeed() {
      try {
        if (!restoredFromCache) {
          setLoading(true)
        }
        const data = await getPublicScreenFeed(deviceCode)
        if (!isMounted) {
          return
        }

        setFeed(data)
        setError('')
        setIsOfflineNoticeVisible(false)
        const publishedVersion = data.config?.updatedAt || null
        writeOfflineDisplaySnapshot({
          deviceCode,
          savedAt: new Date().toISOString(),
          publishedVersion,
          cachedVersion: runtimeConfig?.cacheVersion || null,
          lastSyncedAt: runtimeConfig?.lastSyncAt || null,
          feed: data,
          runtimeConfig,
          device: runtimeConfig?.device ?? null,
          mode: runtimeConfig?.mode ?? null,
          template: runtimeConfig?.template ?? null,
          layoutSettings: runtimeConfig?.layoutSettings ?? null,
          brandingSettings: runtimeConfig?.brandingSettings ?? null,
          offlineSettings: runtimeConfig?.offlineSettings ?? null,
          easyOrderSettings: runtimeConfig?.easyOrderSettings ?? null,
          signageSettings: runtimeConfig?.signageSettings ?? null,
          contentSettings: runtimeConfig?.contentSettings ?? null,
          slides: runtimeConfig?.slides ?? [],
          categories: runtimeConfig?.categories ?? [],
          products: runtimeConfig?.products ?? [],
        })

        const configuredMinInterval = isLowPerformanceMode ? 15 : 8
        const baseIntervalMs = Math.max(configuredMinInterval, data.device.refreshIntervalSec) * 1000
        const intervalMs = document.hidden
          ? Math.max(30000, baseIntervalMs * 2)
          : baseIntervalMs
        timer = setTimeout(() => {
          loadFeed().catch(() => null)
        }, intervalMs)
      } catch (loadError) {
        if (!isMounted) {
          return
        }
        if (restoredFromCache || Boolean(cachedSnapshot?.feed)) {
          setConnectionState('offline_cached')
          setIsOfflineNoticeVisible(true)
          setError('')
        } else {
          setError(loadError instanceof Error ? loadError.message : 'Feed konnte nicht geladen werden')
        }
        timer = setTimeout(() => {
          loadFeed().catch(() => null)
        }, document.hidden ? 30000 : 12000)
      } finally {
        if (isMounted) {
          setLoading(false)
        }
      }
    }

    loadFeed().catch(() => null)

    return () => {
      isMounted = false
      if (timer) {
        clearTimeout(timer)
      }
    }
  }, [deviceCode, isLowPerformanceMode, runtimeConfig])

  useEffect(() => {
    if (!deviceCode) {
      return
    }

    let isMounted = true
    let timer: ReturnType<typeof setTimeout> | null = null

    const loadRuntime = async () => {
      try {
        setConnectionState((current) => (current === 'offline_cached' ? 'reconnecting' : current))
        const config = await fetchDisplayRuntimeConfig(deviceCode, { strictManifest: true, debugNoCache: true })
        if (!isMounted) {
          return
        }
        setManifestRuntimeError('')
        setRuntimeNetworkDebug(getLastDisplayRuntimeDebug(deviceCode))
        setRuntimeConfig(config)
        if (feed) {
          writeOfflineDisplaySnapshot({
            deviceCode,
            savedAt: new Date().toISOString(),
            publishedVersion: feed.config?.updatedAt || null,
            cachedVersion: config.cacheVersion || null,
            lastSyncedAt: config.lastSyncAt || null,
            feed,
            runtimeConfig: config,
            device: config.device ?? null,
            mode: config.mode ?? null,
            template: config.template ?? null,
            layoutSettings: config.layoutSettings ?? null,
            brandingSettings: config.brandingSettings ?? null,
            offlineSettings: config.offlineSettings ?? null,
            easyOrderSettings: config.easyOrderSettings ?? null,
            signageSettings: config.signageSettings ?? null,
            contentSettings: config.contentSettings ?? null,
            slides: config.slides ?? [],
            categories: config.categories ?? [],
            products: config.products ?? [],
          })
        }
        setConnectionState('online')
        const retryMs = document.hidden
          ? Math.max(30000, config.refreshIntervalMs * 2)
          : Math.max(isLowPerformanceMode ? 18000 : 12000, config.refreshIntervalMs)
        timer = setTimeout(() => {
          void loadRuntime()
        }, retryMs)
      } catch (runtimeError) {
        if (!isMounted) {
          return
        }
        const cachedConfig = readCachedDisplayRuntimeConfig(deviceCode)
        if (cachedConfig && cachedConfig.runtimeSourceRoute === '/api/display-runtime/:deviceCode/manifest') {
          setRuntimeConfig(cachedConfig)
          setConnectionState('offline_cached')
        } else {
          setManifestRuntimeError(
            runtimeError instanceof Error
              ? runtimeError.message
              : 'Kein gültiges Display-Manifest geladen'
          )
          setConnectionState('reconnecting')
        }
        setRuntimeNetworkDebug(getLastDisplayRuntimeDebug(deviceCode))
        timer = setTimeout(() => {
          void loadRuntime()
        }, document.hidden ? 30000 : isLowPerformanceMode ? 18000 : 12000)
      }
    }

    void loadRuntime()

    return () => {
      isMounted = false
      if (timer) {
        clearTimeout(timer)
      }
    }
  }, [deviceCode, feed, isLowPerformanceMode])

  async function handleClearDisplayRuntimeCache() {
    if (typeof window === 'undefined') return
    window.localStorage.removeItem(`klarando:display-runtime:${deviceCode.toUpperCase()}`)
    window.location.reload()
  }

  async function handleHardManifestReload() {
    try {
      const fresh = await fetchDisplayRuntimeConfig(deviceCode, { strictManifest: true, debugNoCache: true })
      setRuntimeConfig(fresh)
      setManifestRuntimeError('')
      setConnectionState('online')
      setRuntimeNetworkDebug(getLastDisplayRuntimeDebug(deviceCode))
    } catch (reloadError) {
      setManifestRuntimeError(
        reloadError instanceof Error ? reloadError.message : 'Kein gültiges Display-Manifest geladen'
      )
      setRuntimeNetworkDebug(getLastDisplayRuntimeDebug(deviceCode))
    }
  }

  useEffect(() => {
    if (!feed || !feed.config.offerWindowEnabled) {
      setOfferMediaIndex(0)
      return
    }

    const mediaUrls = Array.isArray(feed.config.offerMediaUrls)
      ? feed.config.offerMediaUrls.filter((entry) => typeof entry === 'string' && entry.trim().length > 0)
      : []
    if (mediaUrls.length <= 1) {
      setOfferMediaIndex(0)
      return
    }

    const rotateSec = clampInt(Number(feed.config.offerMediaRotateSec || 12), 3, 120)
    const handle = window.setInterval(() => {
      setOfferMediaIndex((current) => (current + 1) % mediaUrls.length)
    }, rotateSec * 1000)

    return () => window.clearInterval(handle)
  }, [feed])

  useEffect(() => {
    const offlineOrderingEnabled = Boolean(
      (runtimeConfig?.easyOrderSettings as Record<string, unknown> | undefined)?.offlineOrderingEnabled ??
        (runtimeConfig?.layoutSettings as Record<string, unknown> | undefined)?.offlineOrderingEnabled
    )
    if (!offlineOrderingEnabled || !feed) {
      return
    }
    void (async () => {
      try {
        const queued = await listOfflineOrders(deviceCode)
        for (const order of queued) {
          const response = await fetch('/api/easy-order/offline-sync', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
              ...order.payload,
              clientOrderId: order.clientOrderId,
              idempotencyKey: order.idempotencyKey,
              tenantId: order.tenantId,
              deviceCode: order.deviceCode,
            }),
          })
          if (response.ok) {
            await removeOfflineOrder(order.id)
          }
        }
      } catch {
        // Queue bleibt erhalten und wird beim nächsten Online-Zyklus erneut versucht.
      }
    })()
  }, [deviceCode, feed, runtimeConfig?.layoutSettings])

  useEffect(() => {
    if (!feed?.config.tickerEnabled || !feed.config.tickerShowClock) {
      return
    }

    const handle = window.setInterval(() => {
      setTickerClock(new Date())
    }, 1000)

    return () => window.clearInterval(handle)
  }, [feed?.config.tickerEnabled, feed?.config.tickerShowClock])

  useEffect(() => {
    if (!feed?.config.tickerEnabled) {
      setTickerText('')
      return
    }

    const source = feed.config.tickerDataSource || 'CUSTOM'
    const customText = feed.config.tickerCustomText?.trim() || 'Willkommen bei Klarando.'
    if (source === 'CUSTOM') {
      setTickerText(customText)
      return
    }

    const apiUrl = feed.config.tickerApiUrl?.trim()
    if (!apiUrl) {
      setTickerText(tickerFallbackLabel(source))
      return
    }
    const apiEndpoint = apiUrl

    let disposed = false
    let timer: number | null = null
    const refreshSec = clampInt(Number(feed.config.tickerRefreshSec || 180), 10, 3600)

    async function loadTicker() {
      const abort = new AbortController()
      const timeout = window.setTimeout(() => abort.abort(), 8000)
      try {
        const res = await fetch(apiEndpoint, { signal: abort.signal })
        if (!res.ok) {
          throw new Error(`Ticker API Fehler ${res.status}`)
        }
        const payload = await res.json().catch(async () => await res.text())
        const parsedText = extractTickerText(payload)
        if (!disposed) {
          setTickerText(parsedText || tickerFallbackLabel(source))
        }
      } catch {
        if (!disposed) {
          setTickerText(customText || tickerFallbackLabel(source))
        }
      } finally {
        window.clearTimeout(timeout)
        if (!disposed) {
          timer = window.setTimeout(() => {
            void loadTicker()
          }, refreshSec * 1000)
        }
      }
    }

    void loadTicker()

    return () => {
      disposed = true
      if (timer) {
        window.clearTimeout(timer)
      }
    }
  }, [feed])

  const displayConfig = useMemo(() => {
    if (!feed) {
      return null
    }

    const layout = (runtimeConfig?.layoutSettings || {}) as Record<string, unknown>
    const branding = (runtimeConfig?.brandingSettings || {}) as Record<string, unknown>
    const content = (runtimeConfig?.contentSettings || {}) as Record<string, unknown>

    const merged = {
      ...feed.config,
      defaultColumnCount:
        typeof layout.columnCount === 'number'
          ? clampInt(layout.columnCount, 1, 8)
          : feed.config.defaultColumnCount,
      cardStyle:
        typeof layout.cardStyle === 'string'
          ? layout.cardStyle
          : feed.config.cardStyle,
      cardPadding:
        typeof layout.cardPadding === 'number'
          ? clampInt(layout.cardPadding, 8, 48)
          : feed.config.cardPadding,
      cardBackgroundOpacity:
        typeof layout.cardBackgroundOpacity === 'number'
          ? clampInt(layout.cardBackgroundOpacity, 0, 100)
          : feed.config.cardBackgroundOpacity,
      cardBorderOpacity:
        typeof layout.cardBorderOpacity === 'number'
          ? clampInt(layout.cardBorderOpacity, 0, 100)
          : feed.config.cardBorderOpacity,
      overlayAnimation:
        typeof layout.overlayAnimation === 'string'
          ? layout.overlayAnimation
          : feed.config.overlayAnimation,
      productFontSize:
        typeof layout.productFontSize === 'number'
          ? clampInt(layout.productFontSize, 14, 64)
          : feed.config.productFontSize,
      ingredientFontSize:
        typeof layout.ingredientFontSize === 'number'
          ? clampInt(layout.ingredientFontSize, 10, 30)
          : feed.config.ingredientFontSize,
      categoryFontSize:
        typeof layout.categoryFontSize === 'number'
          ? clampInt(layout.categoryFontSize, 10, 32)
          : feed.config.categoryFontSize,
      priceFontSize:
        typeof layout.priceFontSize === 'number'
          ? clampInt(layout.priceFontSize, 12, 62)
          : feed.config.priceFontSize,
      showCategoryOnCard:
        typeof layout.showCategoryOnCard === 'boolean'
          ? layout.showCategoryOnCard
          : feed.config.showCategoryOnCard,
      showCategoryHeaders:
        typeof layout.showCategoryHeaders === 'boolean'
          ? layout.showCategoryHeaders
          : feed.config.showCategoryHeaders,
      showAllergens:
        typeof content.showIngredients === 'boolean'
          ? content.showIngredients
          : typeof layout.showAllergens === 'boolean'
            ? layout.showAllergens
            : feed.config.showAllergens,
      showPrices:
        typeof layout.showPrices === 'boolean'
          ? layout.showPrices
          : feed.config.showPrices,
      accentColor:
        typeof branding.accentColor === 'string' && branding.accentColor.trim().length > 0
          ? branding.accentColor
          : feed.config.accentColor,
      textColor:
        typeof branding.textColor === 'string' && branding.textColor.trim().length > 0
          ? branding.textColor
          : feed.config.textColor,
      productNameColor:
        typeof branding.productNameColor === 'string' && branding.productNameColor.trim().length > 0
          ? branding.productNameColor
          : feed.config.productNameColor,
      ingredientTextColor:
        typeof branding.ingredientTextColor === 'string' && branding.ingredientTextColor.trim().length > 0
          ? branding.ingredientTextColor
          : feed.config.ingredientTextColor,
      categoryTextColor:
        typeof branding.categoryTextColor === 'string' && branding.categoryTextColor.trim().length > 0
          ? branding.categoryTextColor
          : feed.config.categoryTextColor,
      priceTextColor:
        typeof branding.priceTextColor === 'string' && branding.priceTextColor.trim().length > 0
          ? branding.priceTextColor
          : feed.config.priceTextColor,
      logoUrl:
        typeof branding.logoUrl === 'string'
          ? branding.logoUrl
          : feed.config.logoUrl,
      logoSize:
        typeof branding.logoSize === 'number'
          ? clampInt(branding.logoSize, 24, 320)
          : feed.config.logoSize,
      backgroundMode:
        typeof branding.backgroundMode === 'string'
          ? branding.backgroundMode
          : feed.config.backgroundMode,
      backgroundValue:
        typeof branding.backgroundValue === 'string'
          ? branding.backgroundValue
          : feed.config.backgroundValue,
      backgroundMediaUrl:
        typeof branding.backgroundMediaUrl === 'string'
          ? branding.backgroundMediaUrl
          : feed.config.backgroundMediaUrl,
      fontFamily:
        typeof layout.fontFamily === 'string' && layout.fontFamily.trim().length > 0
          ? layout.fontFamily
          : feed.config.fontFamily,
    }

    return merged
  }, [feed, runtimeConfig])
  const rendererVersion = 'screen-manifest-renderer-v2'
  const runtimeRouteLabel = runtimeConfig?.runtimeSourceRoute || 'unbekannt'
  const manifestVersionLabel = runtimeConfig?.loadedManifestVersion || '-'

  const backgroundStyle = useMemo(() => {
    if (!feed) {
      return {
        backgroundImage: 'linear-gradient(145deg, #0f172a, #1e293b)',
      }
    }

    if (displayConfig?.backgroundMode === 'COLOR') {
      return {
        backgroundColor: displayConfig?.backgroundValue || '#0f172a',
      }
    }

    if (displayConfig?.backgroundMode === 'IMAGE' && displayConfig?.backgroundMediaUrl) {
      return {
        backgroundImage: `linear-gradient(120deg, rgba(2,6,23,0.65), rgba(2,6,23,0.35)), url(${displayConfig?.backgroundMediaUrl})`,
        backgroundSize: 'cover',
        backgroundPosition: 'center',
      }
    }

    return {
      backgroundImage: 'linear-gradient(145deg, #0f172a, #1e293b)',
    }
  }, [feed, displayConfig])

  const hasVideoBackground = Boolean(
    feed &&
      displayConfig?.backgroundMode === 'VIDEO' &&
      displayConfig?.backgroundMediaUrl
  )
  const youtubeBackgroundEmbedUrl = useMemo(
    () =>
      feed && displayConfig?.backgroundMode === 'VIDEO'
        ? getYouTubeEmbedUrl(displayConfig?.backgroundMediaUrl)
        : null,
    [feed, displayConfig]
  )

  const showCategoryOnCardEnabled = useMemo(() => {
    if (!feed || !displayConfig) return false
    const fromRuntime =
      runtimeConfig?.layoutSettings?.showCategoryOnCard ?? runtimeConfig?.contentSettings?.showCategoryOnCard
    return typeof fromRuntime === 'boolean' ? fromRuntime : displayConfig?.showCategoryOnCard
  }, [displayConfig, feed, runtimeConfig])

  const showCategoryHeadersEnabled = useMemo(() => {
    if (!feed || !displayConfig) return false
    const fromRuntime =
      runtimeConfig?.layoutSettings?.showCategoryHeaders ?? runtimeConfig?.contentSettings?.showCategoryHeaders
    return typeof fromRuntime === 'boolean' ? fromRuntime : displayConfig?.showCategoryHeaders
  }, [displayConfig, feed, runtimeConfig])

  const showIngredientsEnabled = useMemo(() => {
    if (!feed || !displayConfig) return false
    const fromRuntime =
      runtimeConfig?.layoutSettings?.showAllergens ?? runtimeConfig?.contentSettings?.showIngredients
    return typeof fromRuntime === 'boolean' ? fromRuntime : displayConfig?.showAllergens
  }, [displayConfig, feed, runtimeConfig])

  const displayedProducts = useMemo(() => {
    if (!feed) return [] as PublicScreenFeed['products']
    const runtimeProductMap = new Map(
      (runtimeConfig?.products || []).map((entry) => [entry.id, entry])
    )
    const withRuntimeMeta = feed.products.map((product) => {
      const runtimeProduct = runtimeProductMap.get(product.id)
      if (!runtimeProduct) {
        return product
      }
      const derivedIngredients =
        runtimeProduct.ingredients.length > 0
          ? runtimeProduct.ingredients.map((name) => ({ name, allergens: runtimeProduct.allergens || [] }))
          : product.ingredients
      return {
        ...product,
        category: runtimeProduct.categoryName
          ? { ...(product.category || { id: runtimeProduct.categoryId || 'runtime-category', tenantId: product.tenantId, name: runtimeProduct.categoryName, sortOrder: 0, imageUrl: null, createdAt: new Date().toISOString() }), name: runtimeProduct.categoryName }
          : product.category,
        ingredients: derivedIngredients,
        screen: {
          ...product.screen,
          displayCategory: runtimeProduct.categoryName || product.screen.displayCategory,
        },
      }
    })

    const distribution = runtimeConfig?.distribution
    if (!distribution || distribution.strategy === 'duplicate-all') {
      return withRuntimeMeta
    }
    if (distribution.productIdsForDisplay.length === 0) {
      return withRuntimeMeta
    }
    const idSet = new Set(distribution.productIdsForDisplay)
    const filtered = withRuntimeMeta.filter((product) => idSet.has(product.id))
    return filtered.length > 0 ? filtered : withRuntimeMeta
  }, [feed, runtimeConfig])

  const allergenLegendEntries = useMemo(() => {
    if (!feed || !showIngredientsEnabled || !displayConfig?.allergenLegendEnabled) {
      return [] as Array<{ code: string; label: string }>
    }

    const usedCodes = new Set<string>()
    for (const product of displayedProducts) {
      for (const ingredient of product.ingredients) {
        for (const code of ingredient.allergens) {
          usedCodes.add(code)
        }
      }
    }

    return Array.from(usedCodes)
      .sort((left, right) => left.localeCompare(right, 'de-DE', { numeric: true }))
      .map((code) => ({
        code,
        label: ALLERGEN_LABELS[code] || 'Allergen/Zusatzstoff',
      }))
  }, [displayedProducts, feed, showIngredientsEnabled])
  const activePickupAnnouncements = useMemo(() => {
    if (!feed) {
      return [] as PublicScreenFeed['pickupAnnouncements']
    }

    const now = Date.now()
    return [...feed.pickupAnnouncements]
      .filter((entry) => {
        if (!entry.announceUntil) {
          return true
        }
        return new Date(entry.announceUntil).getTime() > now
      })
      .sort((left, right) => {
        const leftTime = left.announceUntil ? new Date(left.announceUntil).getTime() : 0
        const rightTime = right.announceUntil ? new Date(right.announceUntil).getTime() : 0
        return rightTime - leftTime
      })
  }, [feed])

  const screenRows = useMemo(() => {
    if (!feed) {
      return [] as Array<
        | { type: 'category'; key: string; label: string }
        | { type: 'product'; key: string; product: PublicScreenFeed['products'][number] }
      >
    }

    if (!showCategoryHeadersEnabled) {
      return displayedProducts.map((product) => ({
        type: 'product' as const,
        key: product.id,
        product,
      }))
    }

    const rows: Array<
      | { type: 'category'; key: string; label: string }
      | { type: 'product'; key: string; product: PublicScreenFeed['products'][number] }
    > = []
    let previousCategory = ''

    for (const product of displayedProducts) {
      const currentCategory = resolveProductCategory(product)
      if (currentCategory !== previousCategory) {
        rows.push({
          type: 'category',
          key: `category-${currentCategory}`,
          label: currentCategory,
        })
        previousCategory = currentCategory
      }

      rows.push({
        type: 'product',
        key: product.id,
        product,
      })
    }

    return rows
  }, [displayedProducts, feed, showCategoryHeadersEnabled])
  const deviceResolutionWidth = Number(feed?.device.resolutionWidth || 1920)
  const deviceResolutionHeight = Number(feed?.device.resolutionHeight || 1080)
  const effectiveResolutionWidth = Math.max(320, Math.min(7680, viewportResolution.width || deviceResolutionWidth))
  const effectiveResolutionHeight = Math.max(240, Math.min(4320, viewportResolution.height || deviceResolutionHeight))
  const columnCount = feed ? clampInt(Number(displayConfig?.defaultColumnCount || 4), 1, 6) : 4
  const isListMode = displayConfig?.cardStyle === 'LIST'
  const responsiveColumnLimit =
    effectiveResolutionWidth < 700
      ? 1
      : effectiveResolutionWidth < 1040
        ? 2
        : effectiveResolutionWidth < 1460
          ? 3
          : effectiveResolutionWidth < 1780
            ? 4
            : 6
  const effectiveColumnCount = isListMode
    ? 1
    : Math.max(1, Math.min(columnCount, responsiveColumnLimit))
  const distributionDisplayCount = Math.max(1, Number(runtimeConfig?.distribution?.displayCount || 1))
  const totalDistributedProducts = Math.max(0, Number(runtimeConfig?.distribution?.totalProducts || displayedProducts.length))
  const densityFactor =
    distributionDisplayCount === 1 && totalDistributedProducts > 20
      ? Math.max(0.72, Math.min(1, 20 / totalDistributedProducts))
      : 1
  const scaledProductFontSize = feed
    ? clampInt(Math.round(Number(displayConfig?.productFontSize || 34) * densityFactor), 14, 64)
    : 34
  const scaledIngredientFontSize = feed
    ? clampInt(Math.round(Number(displayConfig?.ingredientFontSize || 12) * densityFactor), 10, 30)
    : 12
  const scaledCategoryFontSize = feed
    ? clampInt(Math.round(Number(displayConfig?.categoryFontSize || 12) * densityFactor), 10, 32)
    : 12
  const scaledPriceFontSize = feed
    ? clampInt(Math.round(Number(displayConfig?.priceFontSize || 30) * densityFactor), 12, 62)
    : 30
  const cardBackgroundOpacity = feed
    ? clampInt(Number(displayConfig?.cardBackgroundOpacity || 35), 0, 100) / 100
    : 0.35
  const cardBorderOpacity = feed
    ? clampInt(Number(displayConfig?.cardBorderOpacity || 20), 0, 100) / 100
    : 0.2
  const cardPadding = feed ? clampInt(Number(displayConfig?.cardPadding || 16), 8, 48) : 16
  const offerMediaUrls =
    feed && Array.isArray(displayConfig?.offerMediaUrls)
      ? displayConfig?.offerMediaUrls.filter((entry) => typeof entry === 'string' && entry.trim().length > 0)
      : []
  const activeOfferActions = feed?.activeActions || []
  const hasOfferActions = activeOfferActions.length > 0
  const activeOfferMediaUrl =
    offerMediaUrls.length > 0 ? offerMediaUrls[offerMediaIndex % offerMediaUrls.length] : null
  const activeOfferMediaIsVideo = Boolean(
    activeOfferMediaUrl && /\.(mp4|webm|ogg)(\?.*)?$/i.test(activeOfferMediaUrl)
  )
  const offerWindowCoordinates = resolveOfferWindowCoordinates(
    displayConfig?.offerWindowPosition,
    displayConfig?.offerWindowXPercent,
    displayConfig?.offerWindowYPercent
  )
  const offerWindowConfig = displayConfig || feed?.config || null
  const offerWindowWidthPx = offerWindowConfig ? resolveOfferWindowWidthPx(offerWindowConfig as ScreenConfig) : 380
  const offerWindowHeightPx = offerWindowConfig ? resolveOfferWindowHeightPx(offerWindowConfig as ScreenConfig) : 280
  const offerWindowWidthEffectivePx = Math.min(
    offerWindowWidthPx,
    Math.max(220, effectiveResolutionWidth - 36)
  )
  const offerWindowHeightEffectivePx = Math.min(
    offerWindowHeightPx,
    Math.max(
      160,
      Math.round((effectiveResolutionWidth < 768 ? 0.64 : 0.78) * offerWindowWidthEffectivePx)
    )
  )
  const offerWindowOpacity = clampInt(Number(displayConfig?.offerWindowOpacity || 28), 0, 100)
  const offerWindowBackgroundColor = hexToRgba(
    displayConfig?.offerWindowBackgroundColor || '#f97316',
    offerWindowOpacity / 100
  )
  const offerWindowBorderColor = hexToRgba(displayConfig?.offerWindowBackgroundColor || '#f97316', 0.55)
  const offerWindowTextColor = displayConfig?.offerWindowTextColor || '#ffffff'
  const offerMediaRenderHeightPx = feed
    ? clampInt(
        Math.round(
          Math.min(
            Math.max(120, offerWindowHeightPx * 0.58),
            effectiveResolutionHeight * 0.42
          )
        ),
        120,
        520
      )
    : 180
  const tickerEnabled = Boolean(displayConfig?.tickerEnabled)
  const tickerOnTop = tickerEnabled && displayConfig?.tickerPosition === 'TOP'
  const tickerOnBottom = tickerEnabled && !tickerOnTop
  const tickerBarText = tickerText || displayConfig?.tickerCustomText?.trim() || 'Willkommen bei Klarando.'
  const tickerFontSize = clampInt(Number(displayConfig?.tickerFontSize || 14), 10, 42)
  const tickerClockFontSize = clampInt(Number(displayConfig?.tickerClockFontSize || 12), 10, 48)
  const tickerInsetPx = clampInt(Number(displayConfig?.tickerInsetPx || 0), 0, 420)
  const tickerInsetEffectivePx = Math.min(
    tickerInsetPx,
    Math.max(0, Math.round(Number(feed?.device.resolutionWidth || 1920) / 2) - 120)
  )
  const tickerOffsetPx = clampInt(Number(displayConfig?.tickerOffsetPx || 0), 0, 260)
  const tickerBarHeightPx = Math.max(42, Math.max(tickerClockFontSize, tickerFontSize) + 26)
  const contentViewportHeightPx = Math.max(
    240,
    effectiveResolutionHeight - (tickerEnabled ? tickerBarHeightPx + tickerOffsetPx : 0)
  )
  const offerReservePaddingStyle =
    feed && feed.device
      ? resolveOfferReservePaddingStyle({
          enabled: Boolean(displayConfig?.offerWindowEnabled),
          reserveSpace: Boolean(displayConfig?.offerWindowReserveSpace),
          xPercent: offerWindowCoordinates.x,
          yPercent: offerWindowCoordinates.y,
          widthPx: offerWindowWidthEffectivePx,
          heightPx: offerWindowHeightEffectivePx,
          viewportWidthPx: effectiveResolutionWidth,
          viewportHeightPx: contentViewportHeightPx,
        })
      : {}
  const effectiveOfferReservePaddingStyle =
    effectiveResolutionWidth < 1280 ? {} : offerReservePaddingStyle
  const runtimeLastSyncMs = runtimeConfig?.lastSyncAt ? Date.parse(runtimeConfig.lastSyncAt) : Number.NaN
  const connectionStaleSeconds = Number.isFinite(runtimeLastSyncMs)
    ? Math.max(0, Math.floor((Date.now() - runtimeLastSyncMs) / 1000))
    : null

  if (loading && !feed) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-slate-950 text-white">
        <p className="text-lg">Bildschirm wird geladen...</p>
      </main>
    )
  }

  if (!feed) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-slate-950 px-6 text-white">
        <div className="max-w-xl rounded-2xl border border-white/20 bg-black/30 p-6 text-center">
          <p className="text-xl font-semibold">Display wird eingerichtet</p>
          <p className="mt-2 text-sm text-white/85">
            {error || 'Noch keine veröffentlichten Bildschirmdaten gefunden. Bitte im Admin einen Bildschirm verbinden und Inhalte veröffentlichen.'}
          </p>
        </div>
      </main>
    )
  }

  if (manifestRuntimeError) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-slate-950 px-6 text-white">
        <div className="w-full max-w-3xl rounded-2xl border border-red-300/60 bg-red-500/20 p-6">
          <p className="text-sm font-semibold uppercase tracking-wide text-red-100">
            STRICT MANIFEST FAILED - Legacy Renderer disabled
          </p>
          <p className="mt-2 text-lg font-bold">{manifestRuntimeError}</p>
          <div className="mt-4 space-y-1 text-sm text-red-100/90">
            <p>Route: /screen/[deviceCode]</p>
            <p>Build: {buildVersion}</p>
            <p>Commit: {commitId}</p>
            <p>deviceCode: {deviceCode || '-'}</p>
            <p>Runtime API: {runtimeConfig?.runtimeSourceRoute || 'manifest required'}</p>
            <p>Manifest HTTP: {runtimeNetworkDebug?.manifestStatus ?? 'n/a'}</p>
            <p>Manifest URL: {runtimeNetworkDebug?.manifestUrl || 'n/a'}</p>
            <p>LoadedAt: {loadedAt}</p>
          </div>
        </div>
      </main>
    )
  }

  return (
    <main
      style={{
        ...backgroundStyle,
        fontFamily: displayConfig?.fontFamily,
      }}
      className="safe-area-padding relative flex min-h-screen flex-col overflow-hidden text-white"
    >
      <DisplayRuntimeShell runtimeConfig={runtimeConfig}>
      <div className="absolute left-3 top-3 z-50 max-w-[92vw] rounded-xl border border-cyan-200/55 bg-slate-950/85 px-3 py-2 text-[11px] text-cyan-100 shadow-lg backdrop-blur">
        <div className="font-semibold">Display Diagnose</div>
        <div>Route: <span className="font-mono">/screen/[deviceCode]</span></div>
        <div>Renderer: <span className="font-mono">{rendererVersion}</span></div>
        <div>Build: <span className="font-mono">{buildVersion}</span></div>
        <div>Commit: <span className="font-mono">{commitId}</span></div>
        <div>Runtime API: <span className="font-mono">{runtimeRouteLabel}</span></div>
        <div>Manifest-Version: <span className="font-mono">{manifestVersionLabel}</span></div>
        <div>deviceCode: <span className="font-mono">{deviceCode || '-'}</span></div>
        <div>displayId: <span className="font-mono">{runtimeConfig?.displayId || '-'}</span></div>
        <div>template: <span className="font-mono">{runtimeConfig?.template || '-'}</span></div>
        <div>showCategories: <span className="font-mono">{String(showCategoryHeadersEnabled || showCategoryOnCardEnabled)}</span></div>
        <div>showIngredients: <span className="font-mono">{String(showIngredientsEnabled)}</span></div>
        <div>host/path: <span className="font-mono">{typeof window !== 'undefined' ? `${window.location.host}${window.location.pathname}` : '-'}</span></div>
        <div>query: <span className="font-mono">{typeof window !== 'undefined' ? window.location.search || '-' : '-'}</span></div>
        <div>lastFetch: <span className="font-mono">{runtimeNetworkDebug?.lastSuccessfulUrl || '-'}</span></div>
        <div>manifestHTTP: <span className="font-mono">{runtimeNetworkDebug?.manifestStatus ?? 'n/a'}</span></div>
        <div>loadedAt: <span className="font-mono">{loadedAt}</span></div>
        {manifestRuntimeError ? (
          <div className="mt-1 rounded border border-red-300/60 bg-red-500/20 px-2 py-1 text-red-100">
            Kein gueltiges Display-Manifest geladen: {manifestRuntimeError}
          </div>
        ) : null}
        <div className="mt-2 flex flex-wrap gap-2">
          <button
            type="button"
            onClick={() => setManifestDebugOpen((current) => !current)}
            className="rounded border border-cyan-200/60 bg-cyan-500/15 px-2 py-1 text-[11px] font-semibold hover:bg-cyan-500/25"
          >
            {manifestDebugOpen ? 'Manifest Debug aus' : 'Manifest Debug'}
          </button>
          <button
            type="button"
            onClick={() => void handleHardManifestReload()}
            className="rounded border border-emerald-200/60 bg-emerald-500/15 px-2 py-1 text-[11px] font-semibold hover:bg-emerald-500/25"
          >
            Manifest neu laden
          </button>
          <button
            type="button"
            onClick={() => void handleClearDisplayRuntimeCache()}
            className="rounded border border-amber-200/60 bg-amber-500/15 px-2 py-1 text-[11px] font-semibold hover:bg-amber-500/25"
          >
            Cache loeschen
          </button>
        </div>
      </div>
      {manifestDebugOpen ? (
        <pre className="absolute left-3 top-56 z-50 max-h-[45vh] w-[min(760px,92vw)] overflow-auto rounded-xl border border-slate-300/50 bg-slate-950/90 p-3 text-[11px] text-emerald-200">
{JSON.stringify({
  rendererVersion,
  runtimeRoute: runtimeRouteLabel,
  buildVersion,
  commitId,
  manifestVersion: manifestVersionLabel,
  deviceCode,
  displayId: runtimeConfig?.displayId || null,
  templateName: runtimeConfig?.template || null,
  showCategories: showCategoryHeadersEnabled || showCategoryOnCardEnabled,
  showIngredients: showIngredientsEnabled,
  distribution: runtimeConfig?.distribution || null,
  productsLoaded: displayedProducts.length,
}, null, 2)}
        </pre>
      ) : null}
      {debugMode && isOfflineNoticeVisible ? (
        <div className="absolute right-3 top-3 z-40 rounded-full border border-amber-300 bg-amber-100 px-3 py-1 text-xs font-semibold text-amber-900">
          Offline-Cache aktiv
        </div>
      ) : null}
      <DisplayConnectionStatus state={connectionState} staleSeconds={connectionStaleSeconds} />
      {hasVideoBackground ? (
        <>
          {youtubeBackgroundEmbedUrl ? (
            <iframe
              className="pointer-events-none absolute inset-0 h-full w-full"
              src={youtubeBackgroundEmbedUrl}
              title="YouTube Hintergrund"
              allow="autoplay; encrypted-media; picture-in-picture"
              referrerPolicy="strict-origin-when-cross-origin"
            />
          ) : (
            <video
              className="absolute inset-0 h-full w-full object-cover"
              src={displayConfig?.backgroundMediaUrl || undefined}
              autoPlay
              muted
              loop
              playsInline
            />
          )}
          <div className="absolute inset-0 bg-slate-950/45" />
        </>
      ) : null}

      {tickerEnabled && tickerOnTop ? (
        <aside
          className="relative z-40"
          style={{
            minHeight: `${tickerBarHeightPx + tickerOffsetPx}px`,
          }}
        >
          <div
            className="absolute rounded-xl border border-white/20 px-4 py-2"
            style={{
              top: `${tickerOffsetPx}px`,
              left: `${tickerInsetEffectivePx}px`,
              right: `${tickerInsetEffectivePx}px`,
              backgroundColor: displayConfig?.tickerBackgroundColor || '#111827',
              color: displayConfig?.tickerTextColor || '#ffffff',
              minHeight: `${tickerBarHeightPx}px`,
            }}
          >
          <div className="flex items-center gap-4">
            {displayConfig?.tickerShowClock ? (
              <span
                className="shrink-0 rounded-md bg-black/25 px-2 py-1 font-semibold"
                style={{ fontSize: `${tickerClockFontSize}px` }}
              >
                {formatTickerClock(tickerClock)}
              </span>
            ) : null}
            <div className="relative min-w-0 flex-1 overflow-hidden">
              <p
                className="whitespace-nowrap font-medium klarando-screen-ticker-track"
                style={{ fontSize: `${tickerFontSize}px` }}
              >
                {tickerBarText}
              </p>
            </div>
          </div>
          </div>
        </aside>
      ) : null}

      {activePickupAnnouncements.length > 0 ? (
        <div
          className="pointer-events-none absolute left-1/2 z-30 w-full max-w-2xl -translate-x-1/2 px-4"
          style={{ top: tickerOnTop ? `${tickerBarHeightPx + tickerOffsetPx + 12}px` : '20px' }}
        >
          <div className="space-y-2">
            {activePickupAnnouncements.slice(0, 3).map((announcement) => (
              <article
                key={announcement.orderId}
                className="mx-auto rounded-2xl border border-amber-200/50 bg-amber-500/90 px-5 py-3 text-slate-950 shadow-2xl backdrop-blur-sm animate-pulse"
              >
                <div className="flex flex-wrap items-center justify-between gap-2">
                  <p className="text-sm font-semibold uppercase tracking-[0.15em]">
                    Abholung bereit
                  </p>
                  <p className="text-3xl font-black">
                    #{formatPickupNumber(announcement.pickupNumber)}
                  </p>
                </div>
                <p className="mt-1 text-xs font-medium text-slate-900/80">
                  Terminal: {announcement.terminal?.name || '-'} | Display:{' '}
                  {announcement.pickupDisplay?.name || '-'}
                  {announcementRemainingSeconds(announcement.announceUntil) !== null
                    ? ` | noch ${announcementRemainingSeconds(announcement.announceUntil)}s`
                    : ''}
                </p>
              </article>
            ))}
          </div>
        </div>
      ) : null}

      <div className="relative z-10 flex-1 px-3 py-4 sm:px-5 sm:py-5 md:px-6 md:py-6">
        <div className="mx-auto flex max-w-[1800px] flex-wrap items-start justify-between gap-4">
          <div className="min-w-0 flex-1">
            <p className="text-xs uppercase tracking-[0.26em] text-white/70">
              Klarando Screen {feed.device.deviceCode}
            </p>
            <h1 className="mt-1 break-words text-3xl font-black tracking-tight sm:text-4xl xl:text-5xl" style={{ color: displayConfig?.textColor }}>
              {displayConfig?.title}
            </h1>
            {displayConfig?.subtitle ? (
              <p className="mt-2 break-words text-base text-white/85 sm:text-lg xl:text-xl">{displayConfig?.subtitle}</p>
            ) : null}
            <p className="mt-2 text-xs text-white/70">
              Auflösung: {effectiveResolutionWidth}×{effectiveResolutionHeight} · Device-ID: {feed.device.id.slice(0, 8)} · Letzter Sync:{' '}
              {runtimeConfig?.lastSyncAt ? new Date(runtimeConfig.lastSyncAt).toLocaleTimeString('de-DE') : '-'}
            </p>
            {runtimeConfig?.distribution ? (
              <p className="mt-1 text-xs text-white/70">
                Display {runtimeConfig.distribution.currentDisplayIndex} von {runtimeConfig.distribution.displayCount} ·
                Produkte {runtimeConfig.distribution.productIdsForDisplay.length} von {runtimeConfig.distribution.totalProducts}
              </p>
            ) : null}
          </div>

          {displayConfig?.logoUrl ? (
            <img
              src={displayConfig?.logoUrl}
              alt="Betreiber-Logo"
            className="rounded-lg object-contain"
            style={{
              width: `${clampInt(Number(displayConfig?.logoSize || 72), 28, effectiveResolutionWidth < 640 ? 80 : 220)}px`,
              height: `${clampInt(Number(displayConfig?.logoSize || 72), 28, effectiveResolutionWidth < 640 ? 80 : 220)}px`,
            }}
          />
          ) : null}

        </div>

        {displayConfig?.offerWindowEnabled &&
        (hasOfferActions || displayConfig?.offerWindowTitle || displayConfig?.offerWindowText || activeOfferMediaUrl) ? (
          <aside
            className="absolute z-20 rounded-2xl border p-4 shadow-2xl backdrop-blur-sm"
            style={{
              left: `${offerWindowCoordinates.x}%`,
              top: `${offerWindowCoordinates.y}%`,
              transform: 'translate(-50%, -50%)',
              width: `${offerWindowWidthEffectivePx}px`,
              minHeight: `${offerWindowHeightEffectivePx}px`,
              maxWidth: '95vw',
              backgroundColor: offerWindowBackgroundColor,
              borderColor: offerWindowBorderColor,
              color: offerWindowTextColor,
            }}
          >
            <p className="text-xs uppercase tracking-wide opacity-90">
              {hasOfferActions ? 'Aktionen' : 'Angebot'}
            </p>
            {hasOfferActions ? (
              <div className="mt-2 space-y-3">
                {activeOfferActions.slice(0, 3).map((action) => (
                  <article key={action.id} className="rounded-xl border border-white/30 bg-black/25 p-2.5">
                    {action.imageUrl ? (
                      <div className="mb-2 flex items-center justify-center overflow-hidden rounded-lg border border-white/25 bg-black/25">
                        <img
                          src={action.imageUrl}
                          alt={`${action.name} Bild`}
                          className="w-full object-contain"
                          style={{ height: `${Math.max(90, Math.round(offerMediaRenderHeightPx * 0.48))}px` }}
                        />
                      </div>
                    ) : null}
                    <div className="flex items-start justify-between gap-2">
                      <p className="text-sm font-bold leading-snug">{action.name}</p>
                      {action.priceLabel ? (
                        <span className="rounded-md bg-white/90 px-2 py-0.5 text-xs font-bold text-slate-900">
                          {action.priceLabel}
                        </span>
                      ) : null}
                    </div>
                    {action.description ? (
                      <p className="mt-1 text-xs opacity-90">{action.description}</p>
                    ) : null}
                    {action.products.length > 0 ? (
                      <p className="mt-1 text-[11px] opacity-90">
                        {action.displayAsMenu ? 'Menue: ' : 'Artikel: '}
                        {action.products
                          .slice(0, 4)
                          .map((entry) => entry.name)
                          .join(', ')}
                        {action.products.length > 4 ? ' ...' : ''}
                      </p>
                    ) : null}
                  </article>
                ))}
              </div>
            ) : (
              <>
                {displayConfig?.offerWindowTitle ? (
                  <p className="mt-1 text-2xl font-bold">{displayConfig?.offerWindowTitle}</p>
                ) : null}
                {displayConfig?.offerWindowText ? (
                  <p className="mt-1 text-sm opacity-90">{displayConfig?.offerWindowText}</p>
                ) : null}
                {activeOfferMediaUrl ? (
                  <div className="mt-3 flex items-center justify-center overflow-hidden rounded-xl border border-white/35 bg-black/25">
                    {activeOfferMediaIsVideo ? (
                      <video
                        src={activeOfferMediaUrl}
                        className="w-full object-contain"
                        style={{ height: `${offerMediaRenderHeightPx}px` }}
                        autoPlay
                        muted
                        loop
                        playsInline
                      />
                    ) : (
                      <img
                        src={activeOfferMediaUrl}
                        alt="Angebot"
                        className="w-full object-contain"
                        style={{ height: `${offerMediaRenderHeightPx}px` }}
                      />
                    )}
                  </div>
                ) : null}
                {offerMediaUrls.length > 1 ? (
                  <p className="mt-2 text-xs opacity-90">
                    Bild {offerMediaIndex + 1} / {offerMediaUrls.length}
                  </p>
                ) : null}
              </>
            )}
          </aside>
        ) : null}

        {error ? (
          <div className="mx-auto mt-4 max-w-[1800px] rounded-xl border border-red-300/30 bg-red-500/20 px-4 py-2 text-sm text-red-100">
            {error}
          </div>
        ) : null}

        <section
          className="mx-auto mt-6 grid max-w-[1800px] gap-4"
          style={{
            gridTemplateColumns: `repeat(${effectiveColumnCount}, minmax(0, 1fr))`,
            ...effectiveOfferReservePaddingStyle,
          }}
        >
          {screenRows.length === 0 ? (
            <article className="col-span-full rounded-2xl border border-amber-200 bg-amber-50 px-5 py-6 text-center text-slate-800">
              <p className="text-lg font-semibold">Keine Produkte für diesen Bildschirm freigegeben.</p>
              <p className="mt-1 text-sm text-slate-700">
                Bitte im Bildschirmstudio Produkte/Kategorien aktivieren oder einen anderen Bildschirm zuweisen.
              </p>
            </article>
          ) : null}
          {screenRows.map((row, rowIndex) => {
            if (row.type === 'category') {
              return (
                <div
                  key={row.key}
                  className="col-span-full rounded-2xl border border-white/25 bg-black/35 px-4 py-2 font-semibold tracking-[0.14em] text-white/85"
                  style={{
                    fontSize: `${scaledCategoryFontSize}px`,
                    color: displayConfig?.categoryTextColor || displayConfig?.textColor,
                    textTransform: displayConfig?.categoryUppercase ? 'uppercase' : 'none',
                  }}
                >
                  {row.label}
                </div>
              )
            }

            const ingredientLine = formatIngredientLine(row.product.ingredients, showIngredientsEnabled)
            const depositLine = formatDepositLine(
              row.product.beverageContainerType,
              Number(row.product.deposit)
            )
            const detailLine = depositLine
              ? [...ingredientLine, { name: depositLine, superscript: null }]
              : ingredientLine
            const sizeOptions = row.product.sizeOptions || []
            const minSizePrice =
              sizeOptions.length > 0
                ? Math.min(...sizeOptions.map((entry) => Number(entry.totalPrice)))
                : null
            const displayPriceText = displayConfig?.showPrices
              ? sizeOptions.length > 0 && minSizePrice !== null
                ? `ab ${formatPriceForDisplay(minSizePrice, displayConfig?.priceDisplayMode)}`
                : formatPriceForDisplay(Number(row.product.price), displayConfig?.priceDisplayMode)
              : null
            return (
              <article
                key={row.key}
                className={
                  isListMode
                    ? 'border-b border-white/20 px-2 py-3'
                    : cardClassByStyle((displayConfig?.cardStyle as ScreenCardStyle) || 'SOFT')
                }
                style={{
                  ...(isListMode
                    ? {
                        ...productAnimationStyle(displayConfig?.overlayAnimation, rowIndex),
                      }
                    : {
                        padding: `${cardPadding}px`,
                        borderColor: `rgba(255,255,255,${cardBorderOpacity})`,
                        backgroundColor:
                          displayConfig?.cardStyle === 'GLASS'
                            ? `rgba(255,255,255,${Math.max(0.08, cardBackgroundOpacity * 0.6)})`
                            : displayConfig?.cardStyle === 'OUTLINE'
                            ? 'transparent'
                            : displayConfig?.cardStyle === 'MINIMAL'
                            ? `rgba(15,23,42,${Math.max(0.08, cardBackgroundOpacity * 0.5)})`
                            : displayConfig?.cardStyle === 'BOLD'
                            ? `rgba(15,23,42,${Math.max(0.45, cardBackgroundOpacity)})`
                            : `rgba(15,23,42,${Math.max(0.15, cardBackgroundOpacity)})`,
                        ...productAnimationStyle(displayConfig?.overlayAnimation, rowIndex),
                      }),
                }}
              >
                <div className="flex items-start justify-between gap-3">
                  <h2
                    className="min-w-0 flex-1 font-bold leading-tight"
                    style={{
                      fontSize: `${scaledProductFontSize}px`,
                      color: displayConfig?.productNameColor || displayConfig?.textColor,
                      overflowWrap: 'anywhere',
                    }}
                  >
                    {displayConfig?.showProductNumber ? (
                      <span className="mr-2 opacity-80">Nr. {row.product.productNumber}</span>
                    ) : null}
                    {row.product.name}
                  </h2>
                  <div className="flex shrink-0 items-start gap-2">
                    {row.product.screen.badgeText ? (
                      <span
                        className="rounded-md px-2 py-1 text-xs font-semibold text-slate-900"
                        style={{
                          backgroundColor: row.product.screen.highlightColor || displayConfig?.accentColor,
                        }}
                      >
                        {row.product.screen.badgeText}
                      </span>
                    ) : null}
                    {!displayConfig?.pricePinnedLeft && displayPriceText ? (
                      <span
                        className="font-extrabold leading-none"
                        style={{
                          fontSize: `${scaledPriceFontSize}px`,
                          color: displayConfig?.priceTextColor || displayConfig?.textColor,
                        }}
                      >
                        {displayPriceText}
                      </span>
                    ) : null}
                  </div>
                </div>

                {detailLine.length > 0 ? (
                  <p
                    className="mt-2"
                    style={{
                      fontSize: `${scaledIngredientFontSize}px`,
                      color: displayConfig?.ingredientTextColor || displayConfig?.textColor,
                    }}
                  >
                    {detailLine.map((entry, index) => (
                      <span key={`${entry.name}-${index}`}>
                        {entry.name}
                        {entry.superscript ? <sup className="ml-0.5 text-[10px]">{entry.superscript}</sup> : null}
                        {index < detailLine.length - 1 ? ', ' : ''}
                      </span>
                    ))}
                  </p>
                ) : null}

                <div className="mt-2 flex items-center justify-between gap-3">
                  {displayConfig?.pricePinnedLeft ? (
                    <>
                      {displayPriceText ? (
                        <span
                          className="font-extrabold leading-none"
                          style={{
                            fontSize: `${scaledPriceFontSize}px`,
                            color: displayConfig?.priceTextColor || displayConfig?.textColor,
                          }}
                        >
                          {displayPriceText}
                        </span>
                      ) : (
                        <span />
                      )}
                      {showCategoryOnCardEnabled ? (
                        <span
                          className="tracking-wide"
                          style={{
                            fontSize: `${scaledCategoryFontSize}px`,
                            color: displayConfig?.categoryTextColor || displayConfig?.textColor,
                            textTransform: displayConfig?.categoryUppercase ? 'uppercase' : 'none',
                          }}
                        >
                          {resolveProductCategory(row.product)}
                        </span>
                      ) : (
                        <span />
                      )}
                    </>
                  ) : (
                    <>
                      {showCategoryOnCardEnabled ? (
                        <span
                          className="tracking-wide"
                          style={{
                            fontSize: `${scaledCategoryFontSize}px`,
                            color: displayConfig?.categoryTextColor || displayConfig?.textColor,
                            textTransform: displayConfig?.categoryUppercase ? 'uppercase' : 'none',
                          }}
                        >
                          {resolveProductCategory(row.product)}
                        </span>
                      ) : (
                        <span />
                      )}
                    </>
                  )}
                </div>

                {displayConfig?.showPrices && sizeOptions.length > 0 ? (
                  <div className="mt-2 flex flex-wrap gap-2">
                    {sizeOptions.map((entry) => (
                      <span
                        key={`${row.product.id}-size-${entry.id}`}
                        className={`rounded-lg px-2.5 py-1 text-xs font-semibold ${
                          entry.isDefaultSelected
                            ? 'bg-amber-300/90 text-slate-900'
                            : 'bg-white/15 text-white'
                        }`}
                      >
                        {entry.name}: {formatPriceForDisplay(Number(entry.totalPrice), displayConfig?.priceDisplayMode)}
                      </span>
                    ))}
                  </div>
                ) : null}
              </article>
            )
          })}
        </section>
      </div>

      {showIngredientsEnabled && displayConfig?.allergenLegendEnabled && allergenLegendEntries.length > 0 ? (
        <aside
          className={`absolute z-20 max-w-md rounded-2xl border border-white/30 bg-black/50 px-4 py-3 backdrop-blur-sm ${legendPositionClass(displayConfig?.allergenLegendPosition)}`}
          style={{
            bottom:
              tickerOnBottom && displayConfig?.allergenLegendPosition !== 'TOP_LEFT' && displayConfig?.allergenLegendPosition !== 'TOP_RIGHT'
                ? `${tickerBarHeightPx + tickerOffsetPx + 24}px`
                : undefined,
          }}
        >
          <p className="text-[10px] uppercase tracking-[0.18em] text-white/80">Allergen-Legende</p>
          <div className="mt-1 grid gap-1 text-xs">
            {allergenLegendEntries.map((entry) => (
              <p key={entry.code}>
                <span className="font-bold">{entry.code}</span> - {entry.label}
              </p>
            ))}
          </div>
        </aside>
      ) : null}

      {tickerEnabled && tickerOnBottom ? (
        <aside
          className="relative z-40"
          style={{
            minHeight: `${tickerBarHeightPx + tickerOffsetPx}px`,
          }}
        >
          <div
            className="absolute rounded-xl border border-white/20 px-4 py-2"
            style={{
              bottom: `${tickerOffsetPx}px`,
              left: `${tickerInsetEffectivePx}px`,
              right: `${tickerInsetEffectivePx}px`,
              backgroundColor: displayConfig?.tickerBackgroundColor || '#111827',
              color: displayConfig?.tickerTextColor || '#ffffff',
              minHeight: `${tickerBarHeightPx}px`,
            }}
          >
          <div className="flex items-center gap-4">
            {displayConfig?.tickerShowClock ? (
              <span
                className="shrink-0 rounded-md bg-black/25 px-2 py-1 font-semibold"
                style={{ fontSize: `${tickerClockFontSize}px` }}
              >
                {formatTickerClock(tickerClock)}
              </span>
            ) : null}
            <div className="relative min-w-0 flex-1 overflow-hidden">
              <p
                className="whitespace-nowrap font-medium klarando-screen-ticker-track"
                style={{ fontSize: `${tickerFontSize}px` }}
              >
                {tickerBarText}
              </p>
            </div>
          </div>
          </div>
        </aside>
      ) : null}

      <style jsx global>{`
        @keyframes klarandoScreenFloat {
          0%,
          100% {
            transform: translateY(0px);
          }
          50% {
            transform: translateY(-6px);
          }
        }

        @keyframes klarandoScreenSlideIn {
          0% {
            transform: translateY(12px);
            opacity: 0;
          }
          100% {
            transform: translateY(0px);
            opacity: 1;
          }
        }

        @keyframes klarandoScreenSparkle {
          0%,
          100% {
            box-shadow: 0 0 0 rgba(255, 255, 255, 0);
          }
          50% {
            box-shadow: 0 0 22px rgba(255, 255, 255, 0.24);
          }
        }

        @keyframes klarandoTickerScroll {
          0% {
            transform: translateX(100%);
          }
          100% {
            transform: translateX(-100%);
          }
        }

        .klarando-screen-ticker-track {
          display: inline-block;
          min-width: 100%;
          animation: klarandoTickerScroll 26s linear infinite;
          will-change: transform;
        }

        ${isLowPerformanceMode
          ? `
        .klarando-screen-ticker-track {
          animation: none !important;
          transform: none !important;
          white-space: normal !important;
        }`
          : ''}

        @media (prefers-reduced-motion: reduce) {
          * {
            animation: none !important;
            transition: none !important;
          }
        }
      `}</style>
      </DisplayRuntimeShell>
    </main>
  )
}


