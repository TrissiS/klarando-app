'use client'

import { useEffect, useMemo, useRef, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createScreenDevice,
  deleteScreenDevice,
  getCategories,
  getScreenConfig,
  getScreenDevices,
  getScreenProducts,
  updateScreenConfig,
  updateScreenDevice,
  updateScreenProduct,
  type ScreenAllergenLegendPosition,
  type Category,
  type ScreenBackgroundMode,
  type ScreenCardStyle,
  type ScreenConfig,
  type ScreenDevice,
  type ScreenDeviceOrientation,
  type ScreenOrientation,
  type ScreenOverlayAnimation,
  type ScreenOfferWindowPosition,
  type ScreenOfferWindowSize,
  type ScreenTickerDataSource,
  type ScreenTickerPosition,
  type ScreenProductSortMode,
  type ScreenPriceDisplayMode,
  type ScreenProduct,
} from '@/lib/api'

type VisibilityFilter = 'ALL' | 'VISIBLE' | 'HIDDEN' | 'FEATURED'
type TickerApiCheckState = 'IDLE' | 'CHECKING' | 'OK' | 'ERROR'

const COMMON_RESOLUTIONS = [
  { width: 1280, height: 720, label: '1280 x 720 (HD)' },
  { width: 1920, height: 1080, label: '1920 x 1080 (Full HD)' },
  { width: 3840, height: 2160, label: '3840 x 2160 (4K UHD)' },
  { width: 1080, height: 1920, label: '1080 x 1920 (Hochformat)' },
  { width: 720, height: 1280, label: '720 x 1280 (Hochformat)' },
] as const

const CUSTOM_RESOLUTION_VALUE = 'CUSTOM'

function resolutionKey(width: number, height: number) {
  return `${width}x${height}`
}

function resolveResolutionPreset(width: number, height: number) {
  const match = COMMON_RESOLUTIONS.find((entry) => entry.width === width && entry.height === height)
  return match ? resolutionKey(match.width, match.height) : CUSTOM_RESOLUTION_VALUE
}

function parseResolutionPreset(value: string) {
  const [widthRaw, heightRaw] = value.split('x')
  const width = Number(widthRaw)
  const height = Number(heightRaw)
  if (!Number.isFinite(width) || !Number.isFinite(height)) {
    return null
  }
  return {
    width: Math.trunc(width),
    height: Math.trunc(height),
  }
}

function resolutionLabel(width: number, height: number) {
  const match = COMMON_RESOLUTIONS.find((entry) => entry.width === width && entry.height === height)
  if (match) {
    return match.label
  }
  return `${width} x ${height} (Custom)`
}

const DEFAULT_CONFIG: ScreenConfig = {
  id: '',
  tenantId: '',
  title: 'Klarando Menu',
  subtitle: '',
  fontFamily: 'Poppins, sans-serif',
  defaultOrientation: 'LANDSCAPE',
  defaultResolutionWidth: 1920,
  defaultResolutionHeight: 1080,
  productFontSize: 34,
  ingredientFontSize: 12,
  categoryFontSize: 12,
  priceFontSize: 30,
  backgroundMode: 'COLOR',
  backgroundValue: '#0f172a',
  backgroundMediaUrl: '',
  overlayAnimation: 'NONE',
  cardStyle: 'SOFT',
  cardPadding: 16,
  cardBackgroundOpacity: 35,
  cardBorderOpacity: 20,
  productSortMode: 'CUSTOM',
  defaultColumnCount: 4,
  showCategoryHeaders: false,
  showCategoryOnCard: true,
  categoryUppercase: true,
  accentColor: '#ea580c',
  textColor: '#ffffff',
  productNameColor: '#ffffff',
  ingredientTextColor: '#e2e8f0',
  categoryTextColor: '#cbd5e1',
  priceTextColor: '#ffffff',
  showAllergens: true,
  allergenLegendEnabled: true,
  allergenLegendPosition: 'BOTTOM_RIGHT',
  showPrices: true,
  pricePinnedLeft: false,
  priceDisplayMode: 'EUR_SUFFIX',
  showUnavailable: false,
  logoUrl: null,
  logoSize: 72,
  offerWindowEnabled: false,
  offerWindowTitle: '',
  offerWindowText: '',
  showProductNumber: false,
  offerWindowPosition: 'RIGHT',
  offerWindowSize: 'M',
  offerWindowWidthPx: 380,
  offerWindowHeightPx: 280,
  offerWindowXPercent: 84,
  offerWindowYPercent: 14,
  offerWindowReserveSpace: true,
  offerWindowBackgroundColor: '#f97316',
  offerWindowTextColor: '#ffffff',
  offerWindowOpacity: 28,
  offerMediaUrls: [],
  offerMediaRotateSec: 12,
  tickerEnabled: false,
  tickerPosition: 'BOTTOM',
  tickerShowClock: true,
  tickerDataSource: 'CUSTOM',
  tickerCustomText: 'Mehr Auswahl. Weniger Klicks. Schneller am Ziel.',
  tickerApiUrl: '',
  tickerRefreshSec: 180,
  tickerClockFontSize: 12,
  tickerFontSize: 14,
  tickerInsetPx: 0,
  tickerOffsetPx: 0,
  tickerBackgroundColor: '#111827',
  tickerTextColor: '#ffffff',
  createdAt: '',
  updatedAt: '',
}

function normalizeText(input: string) {
  const trimmed = input.trim()
  return trimmed.length > 0 ? trimmed : null
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

function parseOfferMediaInput(input: string) {
  return Array.from(
    new Set(
      input
        .split(/\r?\n|,/g)
        .map((entry) => entry.trim())
        .filter((entry) => entry.length > 0)
    )
  )
}

function joinOfferMediaInput(values: string[] | null | undefined) {
  if (!values || values.length === 0) {
    return ''
  }
  return values.join('\n')
}

function cardClassByStyle(style: ScreenCardStyle) {
  if (style === 'LIST') {
    return 'rounded-none border-b border-white/20 bg-transparent shadow-none'
  }

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
    return 'rounded-lg border border-white/25 bg-black/45'
  }

  if (style === 'GLASS') {
    return 'rounded-2xl border border-white/30 bg-white/10 backdrop-blur-lg'
  }

  return 'rounded-2xl border border-white/20 bg-black/30'
}

function formatDate(value: string | null) {
  if (!value) {
    return '-'
  }

  return new Date(value).toLocaleString('de-DE')
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

function animationStyle(animation: ScreenOverlayAnimation, index: number): React.CSSProperties {
  if (animation === 'FLOAT') {
    return {
      animation: `klarandoScreenFloat 5.5s ease-in-out ${index * 0.1}s infinite`,
    }
  }

  if (animation === 'SLIDE') {
    return {
      animation: `klarandoScreenSlideIn 0.55s ease ${Math.min(index * 0.06, 0.7)}s both`,
    }
  }

  if (animation === 'SPARKLE') {
    return {
      animation: `klarandoScreenSparkle 2.6s ease-in-out ${index * 0.1}s infinite`,
    }
  }

  return {}
}

function ingredientPreview(
  ingredients: Array<{ name: string; allergens: string[] }>,
  showAllergens: boolean
) {
  return ingredients.map((ingredient, index) => (
    <span key={`${ingredient.name}-${index}`}>
      {ingredient.name}
      {showAllergens && ingredient.allergens.length > 0 ? (
        <sup className="ml-0.5 text-[10px]">{ingredient.allergens.join(',')}</sup>
      ) : null}
      {index < ingredients.length - 1 ? ', ' : ''}
    </span>
  ))
}

function resolveProductCategory(product: ScreenProduct) {
  return product.screen.displayCategory || product.category?.name || 'Allgemein'
}

function sortProductsForPreview(
  products: ScreenProduct[],
  mode: ScreenProductSortMode
) {
  return [...products].sort((left, right) => {
    const leftCategory = resolveProductCategory(left).toLowerCase()
    const rightCategory = resolveProductCategory(right).toLowerCase()
    const leftPrice = Number(left.price)
    const rightPrice = Number(right.price)

    if (mode === 'CATEGORY_THEN_CUSTOM') {
      if (leftCategory !== rightCategory) {
        return leftCategory.localeCompare(rightCategory, 'de-DE')
      }
      if (left.screen.sortOrder !== right.screen.sortOrder) {
        return left.screen.sortOrder - right.screen.sortOrder
      }
      return left.name.localeCompare(right.name, 'de-DE')
    }

    if (mode === 'CATEGORY_THEN_NAME') {
      if (leftCategory !== rightCategory) {
        return leftCategory.localeCompare(rightCategory, 'de-DE')
      }
      return left.name.localeCompare(right.name, 'de-DE')
    }

    if (mode === 'NAME_ASC') {
      return left.name.localeCompare(right.name, 'de-DE')
    }

    if (mode === 'PRICE_ASC') {
      if (leftPrice !== rightPrice) {
        return leftPrice - rightPrice
      }
      return left.name.localeCompare(right.name, 'de-DE')
    }

    if (mode === 'PRICE_DESC') {
      if (leftPrice !== rightPrice) {
        return rightPrice - leftPrice
      }
      return left.name.localeCompare(right.name, 'de-DE')
    }

    if (left.screen.sortOrder !== right.screen.sortOrder) {
      return left.screen.sortOrder - right.screen.sortOrder
    }

    return left.name.localeCompare(right.name, 'de-DE')
  })
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

function defaultOfferWindowCoordinates(position: ScreenOfferWindowPosition) {
  if (position === 'LEFT') {
    return { x: 16, y: 14 }
  }
  if (position === 'TOP') {
    return { x: 50, y: 12 }
  }
  if (position === 'BOTTOM') {
    return { x: 50, y: 86 }
  }
  return { x: 84, y: 14 }
}

function resolveOfferWindowCoordinates(
  position: ScreenOfferWindowPosition,
  xPercent: number | null | undefined,
  yPercent: number | null | undefined
) {
  const fallback = defaultOfferWindowCoordinates(position)
  return {
    x: clampInt(Number(xPercent ?? fallback.x), 0, 100),
    y: clampInt(Number(yPercent ?? fallback.y), 0, 100),
  }
}

function offerWindowWidthBySize(size: ScreenOfferWindowSize) {
  if (size === 'S') {
    return 280
  }
  if (size === 'L') {
    return 520
  }
  return 380
}

function resolveOfferWindowWidthPx(config: Pick<ScreenConfig, 'offerWindowWidthPx' | 'offerWindowSize'>) {
  if (Number.isFinite(config.offerWindowWidthPx) && config.offerWindowWidthPx > 0) {
    return clampInt(Number(config.offerWindowWidthPx), 180, 1400)
  }
  return offerWindowWidthBySize(config.offerWindowSize)
}

function resolveOfferWindowHeightPx(config: Pick<ScreenConfig, 'offerWindowHeightPx' | 'offerWindowSize'>) {
  if (Number.isFinite(config.offerWindowHeightPx) && config.offerWindowHeightPx > 0) {
    return clampInt(Number(config.offerWindowHeightPx), 120, 1200)
  }
  const widthFallback = offerWindowWidthBySize(config.offerWindowSize)
  return clampInt(Math.round(widthFallback * 0.72), 120, 1200)
}

function normalizeResolutionByOrientation(
  width: number,
  height: number,
  orientation: ScreenOrientation
) {
  const safeWidth = clampInt(width, 320, 10000)
  const safeHeight = clampInt(height, 240, 10000)
  if (orientation === 'PORTRAIT' && safeWidth > safeHeight) {
    return { width: safeHeight, height: safeWidth }
  }
  if (orientation === 'LANDSCAPE' && safeWidth < safeHeight) {
    return { width: safeHeight, height: safeWidth }
  }
  return { width: safeWidth, height: safeHeight }
}

function resolveOfferReservePaddingPercent(params: {
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
    return {
      paddingLeft: `${Math.min(50, ((params.widthPx + gapPx) / params.viewportWidthPx) * 100)}%`,
    } as React.CSSProperties
  }
  if (side === 'right') {
    return {
      paddingRight: `${Math.min(50, ((params.widthPx + gapPx) / params.viewportWidthPx) * 100)}%`,
    } as React.CSSProperties
  }
  if (side === 'top') {
    return {
      paddingTop: `${Math.min(55, ((params.heightPx + gapPx) / params.viewportHeightPx) * 100)}%`,
    } as React.CSSProperties
  }
  return {
    paddingBottom: `${Math.min(55, ((params.heightPx + gapPx) / params.viewportHeightPx) * 100)}%`,
  } as React.CSSProperties
}

export default function AdminScreenPage() {
  const [categories, setCategories] = useState<Category[]>([])
  const [products, setProducts] = useState<ScreenProduct[]>([])
  const [devices, setDevices] = useState<ScreenDevice[]>([])
  const [configDraft, setConfigDraft] = useState<ScreenConfig>(DEFAULT_CONFIG)

  const [editingProductId, setEditingProductId] = useState<string | null>(null)
  const [displayCategory, setDisplayCategory] = useState('')
  const [sortOrder, setSortOrder] = useState('0')
  const [showOnScreen, setShowOnScreen] = useState(true)
  const [isFeatured, setIsFeatured] = useState(false)
  const [badgeText, setBadgeText] = useState('')
  const [highlightColor, setHighlightColor] = useState('#ea580c')

  const [editingDeviceId, setEditingDeviceId] = useState<string | null>(null)
  const [deviceName, setDeviceName] = useState('')
  const [deviceCode, setDeviceCode] = useState('')
  const [deviceLocation, setDeviceLocation] = useState('')
  const [deviceOrientation, setDeviceOrientation] = useState<ScreenDeviceOrientation>('LANDSCAPE')
  const [deviceResolutionWidth, setDeviceResolutionWidth] = useState('1920')
  const [deviceResolutionHeight, setDeviceResolutionHeight] = useState('1080')
  const [deviceRefreshIntervalSec, setDeviceRefreshIntervalSec] = useState('30')
  const [deviceIsActive, setDeviceIsActive] = useState(true)
  const [deviceShowPrices, setDeviceShowPrices] = useState(true)
  const [deviceShowAllergens, setDeviceShowAllergens] = useState(true)
  const [deviceShowUnavailable, setDeviceShowUnavailable] = useState(false)
  const [deviceShowProductNumber, setDeviceShowProductNumber] = useState(false)
  const [deviceOfferWindow, setDeviceOfferWindow] = useState(false)
  const [deviceOfferWindowPosition, setDeviceOfferWindowPosition] =
    useState<ScreenOfferWindowPosition>('RIGHT')
  const [deviceOfferWindowSize, setDeviceOfferWindowSize] =
    useState<ScreenOfferWindowSize>('M')
  const [deviceOfferMediaRotateSec, setDeviceOfferMediaRotateSec] = useState('12')
  const [deviceOfferMediaUrlsInput, setDeviceOfferMediaUrlsInput] = useState('')
  const [deviceCardStyleOverride, setDeviceCardStyleOverride] = useState<ScreenCardStyle>('SOFT')
  const [deviceColumnCount, setDeviceColumnCount] = useState('')
  const [deviceSelectedCategoryIds, setDeviceSelectedCategoryIds] = useState<string[]>([])
  const [deviceSelectedProductIds, setDeviceSelectedProductIds] = useState<string[]>([])
  const [deviceProductSearch, setDeviceProductSearch] = useState('')
  const [deviceProductCategoryFilter, setDeviceProductCategoryFilter] = useState('ALL')
  const [deviceBackgroundMediaUrl, setDeviceBackgroundMediaUrl] = useState('')
  const [deviceAccentColor, setDeviceAccentColor] = useState('#ea580c')
  const [deviceTextColor, setDeviceTextColor] = useState('#ffffff')
  const [deviceNotes, setDeviceNotes] = useState('')
  const [previewDeviceId, setPreviewDeviceId] = useState('GLOBAL')
  const [offerDragActive, setOfferDragActive] = useState(false)
  const [offerResizeActive, setOfferResizeActive] = useState(false)
  const [tickerDragActive, setTickerDragActive] = useState(false)
  const previewViewportRef = useRef<HTMLDivElement | null>(null)

  const [search, setSearch] = useState('')
  const [categoryFilter, setCategoryFilter] = useState('ALL')
  const [visibilityFilter, setVisibilityFilter] = useState<VisibilityFilter>('ALL')

  const [loading, setLoading] = useState(true)
  const [savingConfig, setSavingConfig] = useState(false)
  const [savingProduct, setSavingProduct] = useState(false)
  const [savingDevice, setSavingDevice] = useState(false)
  const [reorderingProducts, setReorderingProducts] = useState(false)
  const [draggingProductId, setDraggingProductId] = useState<string | null>(null)
  const [deletingDeviceId, setDeletingDeviceId] = useState<string | null>(null)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [tickerApiCheckState, setTickerApiCheckState] = useState<TickerApiCheckState>('IDLE')
  const [tickerApiCheckMessage, setTickerApiCheckMessage] = useState('')
  const tickerApiCheckRunRef = useRef(0)

  const editingProduct = useMemo(
    () => products.find((entry) => entry.id === editingProductId) || null,
    [products, editingProductId]
  )

  const visibleCount = useMemo(
    () => products.filter((entry) => entry.screen.showOnScreen).length,
    [products]
  )

  const activeDevicesCount = useMemo(
    () => devices.filter((entry) => entry.isActive).length,
    [devices]
  )
  const globalResolutionPreset = useMemo(
    () =>
      resolveResolutionPreset(
        Number(configDraft.defaultResolutionWidth),
        Number(configDraft.defaultResolutionHeight)
      ),
    [configDraft.defaultResolutionHeight, configDraft.defaultResolutionWidth]
  )
  const deviceResolutionPreset = useMemo(
    () =>
      resolveResolutionPreset(
        Number(deviceResolutionWidth || 0),
        Number(deviceResolutionHeight || 0)
      ),
    [deviceResolutionHeight, deviceResolutionWidth]
  )
  const filteredDeviceProducts = useMemo(() => {
    const query = deviceProductSearch.trim().toLowerCase()
    return products.filter((product) => {
      if (
        deviceProductCategoryFilter !== 'ALL' &&
        (product.category?.id || '') !== deviceProductCategoryFilter
      ) {
        return false
      }
      if (!query) {
        return true
      }
      const haystack = `${product.name} ${product.category?.name || ''}`.toLowerCase()
      return haystack.includes(query)
    })
  }, [deviceProductCategoryFilter, deviceProductSearch, products])

  const filteredProducts = useMemo(() => {
    const query = search.trim().toLowerCase()

    return products.filter((product) => {
      if (query) {
        const source = [
          product.name,
          product.productNumber,
          product.category?.name || '',
          product.screen.displayCategory || '',
          product.allergens.join(','),
          product.ingredients.map((ingredient) => ingredient.name).join(','),
        ]
          .join(' ')
          .toLowerCase()

        if (!source.includes(query)) {
          return false
        }
      }

      if (categoryFilter !== 'ALL' && product.category?.id !== categoryFilter) {
        return false
      }

      if (visibilityFilter === 'VISIBLE' && !product.screen.showOnScreen) {
        return false
      }

      if (visibilityFilter === 'HIDDEN' && product.screen.showOnScreen) {
        return false
      }

      if (visibilityFilter === 'FEATURED' && !product.screen.isFeatured) {
        return false
      }

      return true
    })
  }, [products, search, categoryFilter, visibilityFilter])

  async function loadData() {
    try {
      setLoading(true)
      setError('')

      const [categoriesData, configData, productsData, devicesData] = await Promise.all([
        getCategories(),
        getScreenConfig(),
        getScreenProducts(),
        getScreenDevices(),
      ])

      setCategories(categoriesData)
      const normalizedOfferMediaUrls = Array.isArray(configData.offerMediaUrls)
        ? configData.offerMediaUrls.filter((entry) => typeof entry === 'string' && entry.trim().length > 0)
        : []
      setConfigDraft({
        ...DEFAULT_CONFIG,
        ...configData,
        offerMediaUrls: normalizedOfferMediaUrls,
      })
      if (!editingDeviceId) {
        setDeviceOrientation(
          (configData.defaultOrientation || 'LANDSCAPE') as ScreenDeviceOrientation
        )
        setDeviceResolutionWidth(String(configData.defaultResolutionWidth || 1920))
        setDeviceResolutionHeight(String(configData.defaultResolutionHeight || 1080))
      }
      setProducts(productsData)
      setDevices(devicesData)
    } catch (loadError) {
      setError(
        loadError instanceof Error
          ? loadError.message
          : 'Bildschirm-Modul konnte nicht geladen werden'
      )
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadData()
  }, [])

  useEffect(() => {
    if (previewDeviceId === 'GLOBAL') {
      return
    }
    const exists = devices.some((device) => device.id === previewDeviceId)
    if (!exists) {
      setPreviewDeviceId('GLOBAL')
    }
  }, [devices, previewDeviceId])

  useEffect(() => {
    if (!configDraft.tickerEnabled || configDraft.tickerDataSource === 'CUSTOM') {
      setTickerApiCheckState('IDLE')
      setTickerApiCheckMessage('')
    }
  }, [configDraft.tickerDataSource, configDraft.tickerEnabled])

  async function checkTickerApiConnection() {
    const apiUrl = (configDraft.tickerApiUrl || '').trim()
    if (!apiUrl) {
      setTickerApiCheckState('ERROR')
      setTickerApiCheckMessage('Bitte zuerst eine API URL eintragen.')
      return
    }

    let parsed: URL
    try {
      parsed = new URL(apiUrl)
      if (parsed.protocol !== 'http:' && parsed.protocol !== 'https:') {
        throw new Error('URL muss mit http:// oder https:// beginnen.')
      }
    } catch {
      setTickerApiCheckState('ERROR')
      setTickerApiCheckMessage('Die API URL ist ungueltig.')
      return
    }

    const runId = tickerApiCheckRunRef.current + 1
    tickerApiCheckRunRef.current = runId
    setTickerApiCheckState('CHECKING')
    setTickerApiCheckMessage('Verbindung wird geprueft...')

    const controller = new AbortController()
    const timeoutHandle = window.setTimeout(() => controller.abort(), 8000)

    try {
      const response = await fetch(parsed.toString(), {
        method: 'GET',
        mode: 'cors',
        signal: controller.signal,
        headers: {
          Accept: 'application/json, text/plain, */*',
        },
      })

      if (runId !== tickerApiCheckRunRef.current) {
        return
      }

      if (!response.ok) {
        setTickerApiCheckState('ERROR')
        setTickerApiCheckMessage(`API antwortet mit HTTP ${response.status}.`)
        return
      }

      setTickerApiCheckState('OK')
      setTickerApiCheckMessage(`Verbindung steht (HTTP ${response.status}).`)
    } catch (checkError) {
      if (runId !== tickerApiCheckRunRef.current) {
        return
      }

      if (checkError instanceof DOMException && checkError.name === 'AbortError') {
        setTickerApiCheckState('ERROR')
        setTickerApiCheckMessage('Zeitueberschreitung nach 8 Sekunden.')
        return
      }

      if (checkError instanceof TypeError) {
        setTickerApiCheckState('ERROR')
        setTickerApiCheckMessage(
          'Abruf blockiert oder nicht erreichbar (oft CORS, SSL oder falsche URL).'
        )
        return
      }

      setTickerApiCheckState('ERROR')
      setTickerApiCheckMessage(
        checkError instanceof Error ? checkError.message : 'Unbekannter Verbindungsfehler.'
      )
    } finally {
      window.clearTimeout(timeoutHandle)
    }
  }

  function editProduct(product: ScreenProduct) {
    setEditingProductId(product.id)
    setDisplayCategory(product.screen.displayCategory || '')
    setSortOrder(String(product.screen.sortOrder))
    setShowOnScreen(product.screen.showOnScreen)
    setIsFeatured(product.screen.isFeatured)
    setBadgeText(product.screen.badgeText || '')
    setHighlightColor(product.screen.highlightColor || '#ea580c')
    setError('')
    setSuccess('')
  }

  function resetProductForm() {
    setEditingProductId(null)
    setDisplayCategory('')
    setSortOrder('0')
    setShowOnScreen(true)
    setIsFeatured(false)
    setBadgeText('')
    setHighlightColor('#ea580c')
  }

  function resetDeviceForm() {
    setEditingDeviceId(null)
    setDeviceName('')
    setDeviceCode('')
    setDeviceLocation('')
    setDeviceOrientation(configDraft.defaultOrientation)
    setDeviceResolutionWidth(String(configDraft.defaultResolutionWidth))
    setDeviceResolutionHeight(String(configDraft.defaultResolutionHeight))
    setDeviceRefreshIntervalSec('30')
    setDeviceIsActive(true)
    setDeviceShowPrices(true)
    setDeviceShowAllergens(true)
    setDeviceShowUnavailable(false)
    setDeviceShowProductNumber(false)
    setDeviceOfferWindow(false)
    setDeviceOfferWindowPosition('RIGHT')
    setDeviceOfferWindowSize('M')
    setDeviceOfferMediaRotateSec('12')
    setDeviceOfferMediaUrlsInput('')
    setDeviceCardStyleOverride('SOFT')
    setDeviceColumnCount('')
    setDeviceSelectedCategoryIds([])
    setDeviceSelectedProductIds([])
    setDeviceBackgroundMediaUrl('')
    setDeviceAccentColor('#ea580c')
    setDeviceTextColor('#ffffff')
    setDeviceNotes('')
  }

  function editDevice(device: ScreenDevice) {
    setEditingDeviceId(device.id)
    setDeviceName(device.name)
    setDeviceCode(device.deviceCode)
    setDeviceLocation(device.location || '')
    setDeviceOrientation(device.orientation)
    setDeviceResolutionWidth(String(device.resolutionWidth))
    setDeviceResolutionHeight(String(device.resolutionHeight))
    setDeviceRefreshIntervalSec(String(device.refreshIntervalSec))
    setDeviceIsActive(device.isActive)
    setDeviceShowPrices(device.showPricesOverride ?? configDraft.showPrices)
    setDeviceShowAllergens(device.showAllergensOverride ?? configDraft.showAllergens)
    setDeviceShowUnavailable(device.showUnavailableOverride ?? configDraft.showUnavailable)
    setDeviceShowProductNumber(device.showProductNumberOverride ?? configDraft.showProductNumber)
    setDeviceOfferWindow(device.offerWindowEnabledOverride ?? configDraft.offerWindowEnabled)
    setDeviceOfferWindowPosition(
      device.offerWindowPositionOverride ?? configDraft.offerWindowPosition
    )
    setDeviceOfferWindowSize(device.offerWindowSizeOverride ?? configDraft.offerWindowSize)
    setDeviceOfferMediaRotateSec(
      String(device.offerMediaRotateSecOverride ?? configDraft.offerMediaRotateSec)
    )
    setDeviceOfferMediaUrlsInput(
      joinOfferMediaInput(
        device.offerMediaUrlsOverride.length > 0
          ? device.offerMediaUrlsOverride
          : configDraft.offerMediaUrls
      )
    )
    setDeviceCardStyleOverride(device.cardStyleOverride ?? configDraft.cardStyle)
    setDeviceColumnCount(device.columnCountOverride ? String(device.columnCountOverride) : '')
    setDeviceSelectedCategoryIds(device.selectedCategoryIds || [])
    setDeviceSelectedProductIds(device.selectedProductIds || [])
    setDeviceBackgroundMediaUrl(device.backgroundMediaUrlOverride || '')
    setDeviceAccentColor(device.accentColorOverride || configDraft.accentColor)
    setDeviceTextColor(device.textColorOverride || configDraft.textColor)
    setDeviceNotes(device.notes || '')
  }

  function toggleDeviceCategory(categoryId: string) {
    setDeviceSelectedCategoryIds((current) =>
      current.includes(categoryId)
        ? current.filter((entry) => entry !== categoryId)
        : [...current, categoryId]
    )
  }

  function toggleDeviceProduct(productId: string) {
    setDeviceSelectedProductIds((current) =>
      current.includes(productId)
        ? current.filter((entry) => entry !== productId)
        : [...current, productId]
    )
  }

  async function handleLogoUpload(file: File) {
    if (!file.type.startsWith('image/')) {
      setError('Bitte eine gueltige Bilddatei fuer das Logo auswaehlen.')
      return
    }

    const maxBytes = 2 * 1024 * 1024
    if (file.size > maxBytes) {
      setError('Logo ist zu gross (max. 2 MB).')
      return
    }

    const fileReader = new FileReader()
    const dataUrl = await new Promise<string>((resolve, reject) => {
      fileReader.onload = () => resolve(String(fileReader.result || ''))
      fileReader.onerror = () => reject(new Error('Logo konnte nicht gelesen werden'))
      fileReader.readAsDataURL(file)
    })

    setConfigDraft((current) => ({
      ...current,
      logoUrl: dataUrl,
    }))
    setError('')
  }

  async function handleOfferMediaUpload(fileList: FileList | null) {
    if (!fileList || fileList.length === 0) {
      return
    }

    const files = Array.from(fileList)
    const maxBytes = 4 * 1024 * 1024
    const nextUrls: string[] = []

    for (const file of files) {
      if (!file.type.startsWith('image/')) {
        setError('Bitte nur Bilddateien fuer Angebotsbilder auswaehlen.')
        return
      }
      if (file.size > maxBytes) {
        setError(`Datei "${file.name}" ist zu gross (max. 4 MB).`)
        return
      }

      const fileReader = new FileReader()
      const dataUrl = await new Promise<string>((resolve, reject) => {
        fileReader.onload = () => resolve(String(fileReader.result || ''))
        fileReader.onerror = () => reject(new Error(`Datei "${file.name}" konnte nicht gelesen werden`))
        fileReader.readAsDataURL(file)
      })
      nextUrls.push(dataUrl)
    }

    setConfigDraft((current) => ({
      ...current,
      offerMediaUrls: Array.from(new Set([...current.offerMediaUrls, ...nextUrls])),
    }))
    setError('')
  }

  async function handleSaveConfig(event: React.FormEvent) {
    event.preventDefault()

    try {
      setSavingConfig(true)
      setError('')
      setSuccess('')

      const updated = await updateScreenConfig({
        title: configDraft.title,
        subtitle: normalizeText(configDraft.subtitle || ''),
        fontFamily: normalizeText(configDraft.fontFamily) || 'Poppins, sans-serif',
        defaultOrientation: configDraft.defaultOrientation,
        defaultResolutionWidth: clampInt(Number(configDraft.defaultResolutionWidth), 320, 10000),
        defaultResolutionHeight: clampInt(Number(configDraft.defaultResolutionHeight), 240, 10000),
        productFontSize: clampInt(Number(configDraft.productFontSize), 16, 96),
        ingredientFontSize: clampInt(Number(configDraft.ingredientFontSize), 10, 48),
        categoryFontSize: clampInt(Number(configDraft.categoryFontSize), 10, 48),
        priceFontSize: clampInt(Number(configDraft.priceFontSize), 14, 72),
        backgroundMode: configDraft.backgroundMode,
        backgroundValue: normalizeText(configDraft.backgroundValue || ''),
        backgroundMediaUrl: normalizeText(configDraft.backgroundMediaUrl || ''),
        overlayAnimation: configDraft.overlayAnimation,
        cardStyle: configDraft.cardStyle,
        cardPadding: clampInt(Number(configDraft.cardPadding), 8, 48),
        cardBackgroundOpacity: clampInt(Number(configDraft.cardBackgroundOpacity), 0, 100),
        cardBorderOpacity: clampInt(Number(configDraft.cardBorderOpacity), 0, 100),
        productSortMode: configDraft.productSortMode,
        defaultColumnCount: clampInt(Number(configDraft.defaultColumnCount), 1, 6),
        showCategoryHeaders: configDraft.showCategoryHeaders,
        showCategoryOnCard: configDraft.showCategoryOnCard,
        categoryUppercase: configDraft.categoryUppercase,
        accentColor: configDraft.accentColor,
        textColor: configDraft.textColor,
        productNameColor: configDraft.productNameColor,
        ingredientTextColor: configDraft.ingredientTextColor,
        categoryTextColor: configDraft.categoryTextColor,
        priceTextColor: configDraft.priceTextColor,
        showAllergens: configDraft.showAllergens,
        allergenLegendEnabled: configDraft.allergenLegendEnabled,
        allergenLegendPosition: configDraft.allergenLegendPosition,
        showPrices: configDraft.showPrices,
        pricePinnedLeft: configDraft.pricePinnedLeft,
        priceDisplayMode: configDraft.priceDisplayMode,
        showUnavailable: configDraft.showUnavailable,
        showProductNumber: configDraft.showProductNumber,
        logoUrl: normalizeText(configDraft.logoUrl || ''),
        logoSize: clampInt(Number(configDraft.logoSize), 32, 220),
        offerWindowEnabled: configDraft.offerWindowEnabled,
        offerWindowTitle: normalizeText(configDraft.offerWindowTitle || ''),
        offerWindowText: normalizeText(configDraft.offerWindowText || ''),
        offerWindowPosition: configDraft.offerWindowPosition,
        offerWindowSize: configDraft.offerWindowSize,
        offerWindowWidthPx: clampInt(Number(configDraft.offerWindowWidthPx || 380), 180, 1400),
        offerWindowHeightPx: clampInt(Number(configDraft.offerWindowHeightPx || 280), 120, 1200),
        offerWindowXPercent: clampInt(Number(configDraft.offerWindowXPercent), 0, 100),
        offerWindowYPercent: clampInt(Number(configDraft.offerWindowYPercent), 0, 100),
        offerWindowReserveSpace: configDraft.offerWindowReserveSpace,
        offerWindowBackgroundColor: configDraft.offerWindowBackgroundColor,
        offerWindowTextColor: configDraft.offerWindowTextColor,
        offerWindowOpacity: clampInt(Number(configDraft.offerWindowOpacity || 28), 0, 100),
        offerMediaUrls: configDraft.offerMediaUrls,
        offerMediaRotateSec: clampInt(Number(configDraft.offerMediaRotateSec || 12), 3, 120),
        tickerEnabled: configDraft.tickerEnabled,
        tickerPosition: configDraft.tickerPosition,
        tickerShowClock: configDraft.tickerShowClock,
        tickerDataSource: configDraft.tickerDataSource,
        tickerCustomText: normalizeText(configDraft.tickerCustomText || ''),
        tickerApiUrl: normalizeText(configDraft.tickerApiUrl || ''),
        tickerRefreshSec: clampInt(Number(configDraft.tickerRefreshSec || 180), 10, 3600),
        tickerClockFontSize: clampInt(Number(configDraft.tickerClockFontSize || 12), 10, 48),
        tickerFontSize: clampInt(Number(configDraft.tickerFontSize || 14), 10, 42),
        tickerInsetPx: clampInt(Number(configDraft.tickerInsetPx || 0), 0, 420),
        tickerOffsetPx: clampInt(Number(configDraft.tickerOffsetPx || 0), 0, 260),
        tickerBackgroundColor: configDraft.tickerBackgroundColor,
        tickerTextColor: configDraft.tickerTextColor,
      })

      const normalizedOfferMediaUrls = Array.isArray(updated.offerMediaUrls)
        ? updated.offerMediaUrls.filter((entry) => typeof entry === 'string' && entry.trim().length > 0)
        : []
      setConfigDraft((current) => ({
        ...current,
        ...updated,
        offerMediaUrls: normalizedOfferMediaUrls,
      }))
      setSuccess('Bildschirm-Einstellungen gespeichert.')
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'Bildschirm-Einstellungen konnten nicht gespeichert werden'
      )
    } finally {
      setSavingConfig(false)
    }
  }

  async function handleSaveProduct(event: React.FormEvent) {
    event.preventDefault()
    if (!editingProductId) {
      return
    }

    try {
      setSavingProduct(true)
      setError('')
      setSuccess('')

      const updated = await updateScreenProduct(editingProductId, {
        displayCategory: normalizeText(displayCategory),
        sortOrder: Number(sortOrder),
        showOnScreen,
        isFeatured,
        badgeText: normalizeText(badgeText),
        highlightColor,
      })

      setProducts((current) =>
        current.map((entry) => (entry.id === updated.id ? updated : entry))
      )
      setSuccess(`Darstellung fuer "${updated.name}" gespeichert.`)
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'Produktdarstellung konnte nicht gespeichert werden'
      )
    } finally {
      setSavingProduct(false)
    }
  }

  async function handleSaveDevice(event: React.FormEvent) {
    event.preventDefault()

    try {
      setSavingDevice(true)
      setError('')
      setSuccess('')
      const parsedColumnCount = deviceColumnCount.trim()
        ? (() => {
            const value = Number(deviceColumnCount)
            return Number.isFinite(value) ? clampInt(value, 1, 6) : null
          })()
        : null
      const parsedOfferMediaRotateSec = deviceOfferMediaRotateSec.trim()
        ? (() => {
            const value = Number(deviceOfferMediaRotateSec)
            return Number.isFinite(value) ? clampInt(value, 3, 120) : null
          })()
        : null
      const parsedOfferMediaUrls = parseOfferMediaInput(deviceOfferMediaUrlsInput)

      if (editingDeviceId) {
        const updated = await updateScreenDevice(editingDeviceId, {
          name: deviceName,
          location: normalizeText(deviceLocation),
          orientation: deviceOrientation,
          resolutionWidth: Number(deviceResolutionWidth),
          resolutionHeight: Number(deviceResolutionHeight),
          refreshIntervalSec: Number(deviceRefreshIntervalSec),
          isActive: deviceIsActive,
          showPricesOverride: deviceShowPrices,
          showAllergensOverride: deviceShowAllergens,
          showUnavailableOverride: deviceShowUnavailable,
          showProductNumberOverride: deviceShowProductNumber,
          offerWindowEnabledOverride: deviceOfferWindow,
          offerWindowPositionOverride: deviceOfferWindowPosition,
          offerWindowSizeOverride: deviceOfferWindowSize,
          offerMediaUrlsOverride: parsedOfferMediaUrls,
          offerMediaRotateSecOverride: parsedOfferMediaRotateSec,
          cardStyleOverride: deviceCardStyleOverride,
          columnCountOverride: parsedColumnCount,
          selectedCategoryIds: deviceSelectedCategoryIds,
          selectedProductIds: deviceSelectedProductIds,
          backgroundMediaUrlOverride: normalizeText(deviceBackgroundMediaUrl),
          accentColorOverride: deviceAccentColor,
          textColorOverride: deviceTextColor,
          notes: normalizeText(deviceNotes),
        })

        setDevices((current) =>
          current.map((device) => (device.id === updated.id ? updated : device))
        )
        setSuccess(`Bildschirm "${updated.name}" aktualisiert.`)
      } else {
        const created = await createScreenDevice({
          name: deviceName,
          deviceCode: normalizeText(deviceCode) || undefined,
          location: normalizeText(deviceLocation),
          orientation: deviceOrientation,
          resolutionWidth: Number(deviceResolutionWidth),
          resolutionHeight: Number(deviceResolutionHeight),
          refreshIntervalSec: Number(deviceRefreshIntervalSec),
          isActive: deviceIsActive,
          showPricesOverride: deviceShowPrices,
          showAllergensOverride: deviceShowAllergens,
          showUnavailableOverride: deviceShowUnavailable,
          showProductNumberOverride: deviceShowProductNumber,
          offerWindowEnabledOverride: deviceOfferWindow,
          offerWindowPositionOverride: deviceOfferWindowPosition,
          offerWindowSizeOverride: deviceOfferWindowSize,
          offerMediaUrlsOverride: parsedOfferMediaUrls,
          offerMediaRotateSecOverride: parsedOfferMediaRotateSec,
          cardStyleOverride: deviceCardStyleOverride,
          columnCountOverride: parsedColumnCount,
          selectedCategoryIds: deviceSelectedCategoryIds,
          selectedProductIds: deviceSelectedProductIds,
          backgroundMediaUrlOverride: normalizeText(deviceBackgroundMediaUrl),
          accentColorOverride: deviceAccentColor,
          textColorOverride: deviceTextColor,
          notes: normalizeText(deviceNotes),
        })

        setDevices((current) => [...current, created].sort((a, b) => a.name.localeCompare(b.name)))
        setSuccess(`Bildschirm "${created.name}" erstellt.`)
      }

      resetDeviceForm()
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'Bildschirm konnte nicht gespeichert werden'
      )
    } finally {
      setSavingDevice(false)
    }
  }

  async function handleDeleteDevice(device: ScreenDevice) {
    if (!window.confirm(`Bildschirm "${device.name}" wirklich loeschen?`)) {
      return
    }

    try {
      setDeletingDeviceId(device.id)
      setError('')
      setSuccess('')
      await deleteScreenDevice(device.id)
      setDevices((current) => current.filter((entry) => entry.id !== device.id))
      if (editingDeviceId === device.id) {
        resetDeviceForm()
      }
      setSuccess(`Bildschirm "${device.name}" geloescht.`)
    } catch (deleteError) {
      setError(
        deleteError instanceof Error
          ? deleteError.message
          : 'Bildschirm konnte nicht geloescht werden'
      )
    } finally {
      setDeletingDeviceId(null)
    }
  }

  async function reorderProductsByDrag(targetProductId: string) {
    if (!draggingProductId || draggingProductId === targetProductId || reorderingProducts) {
      return
    }

    const ordered = [...filteredProducts].sort((left, right) => {
      if (left.screen.sortOrder !== right.screen.sortOrder) {
        return left.screen.sortOrder - right.screen.sortOrder
      }
      return left.name.localeCompare(right.name, 'de-DE')
    })

    const fromIndex = ordered.findIndex((entry) => entry.id === draggingProductId)
    const toIndex = ordered.findIndex((entry) => entry.id === targetProductId)
    if (fromIndex < 0 || toIndex < 0) {
      return
    }

    const nextOrdered = [...ordered]
    const [moved] = nextOrdered.splice(fromIndex, 1)
    nextOrdered.splice(toIndex, 0, moved)

    const sortMap = new Map(
      nextOrdered.map((entry, index) => [entry.id, (index + 1) * 10])
    )
    const changed = nextOrdered.filter((entry) => entry.screen.sortOrder !== sortMap.get(entry.id))
    if (changed.length === 0) {
      return
    }

    const previousProducts = products
    setReorderingProducts(true)
    setProducts((current) =>
      current.map((entry) =>
        sortMap.has(entry.id)
          ? {
              ...entry,
              screen: {
                ...entry.screen,
                sortOrder: sortMap.get(entry.id) ?? entry.screen.sortOrder,
              },
            }
          : entry
      )
    )

    try {
      await Promise.all(
        changed.map((entry) =>
          updateScreenProduct(entry.id, {
            sortOrder: sortMap.get(entry.id) ?? entry.screen.sortOrder,
          })
        )
      )
      setSuccess('Produktreihenfolge per Drag & Drop gespeichert.')
      setError('')
    } catch (errorByDrag) {
      setProducts(previousProducts)
      setError(
        errorByDrag instanceof Error
          ? errorByDrag.message
          : 'Produktreihenfolge konnte nicht gespeichert werden'
      )
    } finally {
      setDraggingProductId(null)
      setReorderingProducts(false)
    }
  }

  const previewDevice = useMemo(
    () =>
      previewDeviceId === 'GLOBAL'
        ? null
        : devices.find((device) => device.id === previewDeviceId) ?? null,
    [devices, previewDeviceId]
  )

  const previewConfig = useMemo(() => {
    if (!previewDevice) {
      return configDraft
    }
    return {
      ...configDraft,
      showPrices: previewDevice.showPricesOverride ?? configDraft.showPrices,
      showAllergens: previewDevice.showAllergensOverride ?? configDraft.showAllergens,
      showUnavailable: previewDevice.showUnavailableOverride ?? configDraft.showUnavailable,
      showProductNumber: previewDevice.showProductNumberOverride ?? configDraft.showProductNumber,
      offerWindowEnabled:
        previewDevice.offerWindowEnabledOverride ?? configDraft.offerWindowEnabled,
      offerWindowPosition:
        previewDevice.offerWindowPositionOverride ?? configDraft.offerWindowPosition,
      offerWindowSize: previewDevice.offerWindowSizeOverride ?? configDraft.offerWindowSize,
      offerMediaUrls:
        previewDevice.offerMediaUrlsOverride.length > 0
          ? previewDevice.offerMediaUrlsOverride
          : configDraft.offerMediaUrls,
      offerMediaRotateSec:
        previewDevice.offerMediaRotateSecOverride ?? configDraft.offerMediaRotateSec,
      cardStyle: previewDevice.cardStyleOverride ?? configDraft.cardStyle,
      defaultColumnCount: previewDevice.columnCountOverride ?? configDraft.defaultColumnCount,
      backgroundMediaUrl: previewDevice.backgroundMediaUrlOverride ?? configDraft.backgroundMediaUrl,
      accentColor: previewDevice.accentColorOverride ?? configDraft.accentColor,
      textColor: previewDevice.textColorOverride ?? configDraft.textColor,
    }
  }, [configDraft, previewDevice])

  const previewOrientation = (previewDevice?.orientation ??
    previewConfig.defaultOrientation) as ScreenOrientation
  const previewResolution = useMemo(
    () =>
      normalizeResolutionByOrientation(
        Number(previewDevice?.resolutionWidth ?? previewConfig.defaultResolutionWidth),
        Number(previewDevice?.resolutionHeight ?? previewConfig.defaultResolutionHeight),
        previewOrientation
      ),
    [
      previewDevice?.resolutionHeight,
      previewDevice?.resolutionWidth,
      previewConfig.defaultResolutionHeight,
      previewConfig.defaultResolutionWidth,
      previewOrientation,
    ]
  )
  const previewMaxWidthPx = 920
  const previewMaxHeightPx = 500
  const previewScale = useMemo(
    () =>
      Math.min(
        previewMaxWidthPx / Number(previewResolution.width || 1920),
        previewMaxHeightPx / Number(previewResolution.height || 1080),
        1
      ),
    [previewResolution.height, previewResolution.width]
  )
  const previewScaledWidthPx = useMemo(
    () => Math.max(280, Math.round(Number(previewResolution.width || 1920) * previewScale)),
    [previewResolution.width, previewScale]
  )
  const previewScaledHeightPx = useMemo(
    () => Math.max(180, Math.round(Number(previewResolution.height || 1080) * previewScale)),
    [previewResolution.height, previewScale]
  )
  const previewResolutionLabel = useMemo(
    () => resolutionLabel(previewResolution.width, previewResolution.height),
    [previewResolution.height, previewResolution.width]
  )
  const previewScalePercent = useMemo(() => Math.round(previewScale * 100), [previewScale])
  const previewRuntimeUrl = useMemo(() => {
    if (!previewDevice?.deviceCode) {
      return null
    }
    const origin =
      typeof window === 'undefined' ? 'http://localhost:3000' : window.location.origin
    return `${origin}/screen/${previewDevice.deviceCode}`
  }, [previewDevice?.deviceCode])

  const previewBg =
    previewConfig.backgroundMode === 'COLOR'
      ? { backgroundColor: previewConfig.backgroundValue || '#0f172a' }
      : previewConfig.backgroundMode === 'IMAGE' && previewConfig.backgroundMediaUrl
      ? {
          backgroundImage: `linear-gradient(115deg, rgba(2,6,23,0.72), rgba(15,23,42,0.45)), url(${previewConfig.backgroundMediaUrl})`,
          backgroundSize: 'cover',
          backgroundPosition: 'center',
        }
      : {
          backgroundImage: 'linear-gradient(150deg, rgba(2,6,23,0.95), rgba(30,41,59,0.84))',
        }
  const previewHasVideoBackground =
    previewConfig.backgroundMode === 'VIDEO' && Boolean(previewConfig.backgroundMediaUrl)
  const previewYouTubeEmbedUrl = useMemo(
    () =>
      previewConfig.backgroundMode === 'VIDEO'
        ? getYouTubeEmbedUrl(previewConfig.backgroundMediaUrl)
        : null,
    [previewConfig.backgroundMode, previewConfig.backgroundMediaUrl]
  )
  const previewOfferMediaUrls = useMemo(
    () =>
      Array.isArray(previewConfig.offerMediaUrls)
        ? previewConfig.offerMediaUrls.filter(
            (entry) => typeof entry === 'string' && entry.trim().length > 0
          )
        : [],
    [previewConfig.offerMediaUrls]
  )
  const previewTickerText =
    previewConfig.tickerDataSource === 'CUSTOM'
      ? previewConfig.tickerCustomText?.trim() || 'Willkommen bei Klarando.'
      : `Live-Feed: ${
          previewConfig.tickerDataSource === 'NEWS_API'
            ? 'News'
            : previewConfig.tickerDataSource === 'WEATHER_API'
            ? 'Wetter'
            : 'Traffic'
        } (${previewConfig.tickerApiUrl?.trim() || 'API URL fehlt'})`
  const previewTickerEnabled = Boolean(previewConfig.tickerEnabled)
  const previewTickerOnTop = previewTickerEnabled && previewConfig.tickerPosition === 'TOP'
  const previewTickerOnBottom = previewTickerEnabled && !previewTickerOnTop
  const previewTickerFontSize = clampInt(Number(previewConfig.tickerFontSize || 14), 10, 42)
  const previewTickerClockFontSize = clampInt(Number(previewConfig.tickerClockFontSize || 12), 10, 48)
  const previewTickerInsetPx = clampInt(Number(previewConfig.tickerInsetPx || 0), 0, 420)
  const previewTickerInsetEffectivePx = Math.min(
    previewTickerInsetPx,
    Math.max(0, Math.round(Number(previewResolution.width || 1920) / 2) - 120)
  )
  const previewTickerOffsetPx = clampInt(Number(previewConfig.tickerOffsetPx || 0), 0, 260)
  const previewTickerBarHeightPx = Math.max(
    38,
    Math.max(previewTickerClockFontSize, previewTickerFontSize) + 24
  )
  const previewContentHeightPx = Math.max(
    180,
    Number(previewResolution.height || 1080) -
      (previewTickerEnabled ? previewTickerBarHeightPx + previewTickerOffsetPx : 0)
  )

  const previewProducts = useMemo(() => {
    const selectedProductIds = previewDevice?.selectedProductIds ?? []
    const selectedCategoryIds = previewDevice?.selectedCategoryIds ?? []
    const visibleProducts = products
      .filter((entry) => entry.screen.showOnScreen)
      .filter((entry) => previewConfig.showUnavailable || entry.available)
      .filter((entry) => {
        if (selectedProductIds.length > 0) {
          return selectedProductIds.includes(entry.id)
        }
        if (selectedCategoryIds.length > 0) {
          return entry.category ? selectedCategoryIds.includes(entry.category.id) : false
        }
        return true
      })
    return sortProductsForPreview(visibleProducts, previewConfig.productSortMode).slice(0, 12)
  }, [
    previewConfig.productSortMode,
    previewConfig.showUnavailable,
    previewDevice?.selectedCategoryIds,
    previewDevice?.selectedProductIds,
    products,
  ])

  const previewRows = useMemo(() => {
    if (!previewConfig.showCategoryHeaders) {
      return previewProducts.map((product) => ({
        type: 'product' as const,
        key: product.id,
        product,
      }))
    }

    const rows: Array<
      | { type: 'category'; key: string; label: string }
      | { type: 'product'; key: string; product: ScreenProduct }
    > = []
    let lastCategory = ''

    for (const product of previewProducts) {
      const currentCategory = resolveProductCategory(product)
      if (currentCategory !== lastCategory) {
        rows.push({
          type: 'category',
          key: `preview-category-${currentCategory}`,
          label: currentCategory,
        })
        lastCategory = currentCategory
      }
      rows.push({
        type: 'product',
        key: product.id,
        product,
      })
    }

    return rows
  }, [previewProducts, previewConfig.showCategoryHeaders])
  const previewColumnCount = clampInt(Number(previewConfig.defaultColumnCount || 4), 1, 6)
  const previewDensityWarning = useMemo(() => {
    const rows = Math.ceil(previewProducts.length / Math.max(1, previewColumnCount))
    const maxRows = previewOrientation === 'PORTRAIT' ? 5 : 3
    const longNameRisk = previewProducts.some((entry) => entry.name.trim().length > 34)
    const largeFontRisk = Number(previewConfig.productFontSize || 0) >= 46
    if (rows > maxRows || longNameRisk || largeFontRisk) {
      return 'Warnung: Inhalte könnten abgeschnitten wirken. Prüfe Spaltenzahl, Schriftgröße und Produktnamen.'
    }
    return ''
  }, [
    previewColumnCount,
    previewConfig.productFontSize,
    previewOrientation,
    previewProducts,
  ])
  const previewCardBackgroundOpacity = clampInt(Number(previewConfig.cardBackgroundOpacity || 35), 0, 100) / 100
  const previewCardBorderOpacity = clampInt(Number(previewConfig.cardBorderOpacity || 20), 0, 100) / 100
  const isListPreviewMode = previewConfig.cardStyle === 'LIST'
  const previewOfferCoordinates = resolveOfferWindowCoordinates(
    previewConfig.offerWindowPosition,
    previewConfig.offerWindowXPercent,
    previewConfig.offerWindowYPercent
  )
  const previewOfferWindowWidthPx = resolveOfferWindowWidthPx(previewConfig)
  const previewOfferWindowHeightPx = resolveOfferWindowHeightPx(previewConfig)
  const previewOfferWindowOpacity = clampInt(Number(previewConfig.offerWindowOpacity || 28), 0, 100)
  const previewOfferWindowBackground = hexToRgba(
    previewConfig.offerWindowBackgroundColor || '#f97316',
    previewOfferWindowOpacity / 100
  )
  const previewOfferWindowBorder = hexToRgba(
    previewConfig.offerWindowBackgroundColor || '#f97316',
    0.55
  )
  const previewOfferWindowTextColor = previewConfig.offerWindowTextColor || '#ffffff'
  const previewOfferReservePadding = resolveOfferReservePaddingPercent({
    enabled: previewConfig.offerWindowEnabled,
    reserveSpace: previewConfig.offerWindowReserveSpace,
    xPercent: previewOfferCoordinates.x,
    yPercent: previewOfferCoordinates.y,
    widthPx: previewOfferWindowWidthPx,
    heightPx: previewOfferWindowHeightPx,
    viewportWidthPx: previewResolution.width,
    viewportHeightPx: previewContentHeightPx,
  })
  const previewCardStyle: React.CSSProperties = {
    padding: `${clampInt(Number(previewConfig.cardPadding || 16), 8, 48)}px`,
    borderColor: `rgba(255,255,255,${previewCardBorderOpacity})`,
    backgroundColor:
      previewConfig.cardStyle === 'GLASS'
        ? `rgba(255,255,255,${Math.max(0.08, previewCardBackgroundOpacity * 0.6)})`
        : previewConfig.cardStyle === 'OUTLINE'
        ? 'transparent'
        : previewConfig.cardStyle === 'MINIMAL'
        ? `rgba(15,23,42,${Math.max(0.08, previewCardBackgroundOpacity * 0.5)})`
        : previewConfig.cardStyle === 'BOLD'
        ? `rgba(15,23,42,${Math.max(0.45, previewCardBackgroundOpacity)})`
        : `rgba(15,23,42,${Math.max(0.15, previewCardBackgroundOpacity)})`,
  }

  function resolvePreviewPointer(clientX: number, clientY: number) {
    const viewport = previewViewportRef.current
    if (!viewport) {
      return null
    }
    const rect = viewport.getBoundingClientRect()
    if (rect.width <= 0 || rect.height <= 0) {
      return null
    }
    const safeScale = Math.max(previewScale, 0.001)
    return {
      x: (clientX - rect.left) / safeScale,
      y: (clientY - rect.top) / safeScale,
    }
  }

  function updateOfferWindowByPointer(clientX: number, clientY: number) {
    const pointer = resolvePreviewPointer(clientX, clientY)
    if (!pointer) {
      return
    }
    const nativeWidth = Number(previewResolution.width || 1920)
    const nativeY = pointer.y
    const nativeX = pointer.x
    const contentOffsetTopPx = previewTickerOnTop
      ? previewTickerBarHeightPx + previewTickerOffsetPx
      : 0
    const contentHeightPx = Math.max(1, previewContentHeightPx)
    const clampedX = Math.min(nativeWidth, Math.max(0, nativeX))
    const clampedContentY = Math.min(
      contentHeightPx,
      Math.max(0, nativeY - contentOffsetTopPx)
    )
    const nextX = clampInt(Math.round((clampedX / nativeWidth) * 100), 0, 100)
    const nextY = clampInt(Math.round((clampedContentY / contentHeightPx) * 100), 0, 100)
    setConfigDraft((current) => ({
      ...current,
      offerWindowXPercent: nextX,
      offerWindowYPercent: nextY,
    }))
  }

  function resizeOfferWindowByPointer(clientX: number, clientY: number) {
    const pointer = resolvePreviewPointer(clientX, clientY)
    if (!pointer) {
      return
    }
    const nativeWidth = Number(previewResolution.width || 1920)
    const contentOffsetTopPx = previewTickerOnTop
      ? previewTickerBarHeightPx + previewTickerOffsetPx
      : 0
    const centerX = (previewOfferCoordinates.x / 100) * nativeWidth
    const centerY = contentOffsetTopPx + (previewOfferCoordinates.y / 100) * previewContentHeightPx
    const deltaX = Math.abs(pointer.x - centerX)
    const deltaY = Math.abs(pointer.y - centerY)
    const nextWidth = clampInt(Math.round(deltaX * 2), 180, 1400)
    const nextHeight = clampInt(Math.round(deltaY * 2), 120, 1200)
    setConfigDraft((current) => ({
      ...current,
      offerWindowWidthPx: nextWidth,
      offerWindowHeightPx: nextHeight,
    }))
  }

  function updateTickerByPointer(clientX: number, clientY: number) {
    if (!previewTickerEnabled) {
      return
    }
    const pointer = resolvePreviewPointer(clientX, clientY)
    if (!pointer) {
      return
    }
    const nativeWidth = Number(previewResolution.width || 1920)
    const nativeHeight = Number(previewResolution.height || 1080)
    const clampedX = Math.min(nativeWidth, Math.max(0, pointer.x))
    const clampedY = Math.min(nativeHeight, Math.max(0, pointer.y))
    const maxInsetByWidth = Math.max(0, Math.round(nativeWidth / 2) - 120)
    const nextInset = clampInt(
      Math.round(Math.min(clampedX, nativeWidth - clampedX)),
      0,
      Math.min(420, maxInsetByWidth)
    )
    const baseHalfHeight = Math.round(previewTickerBarHeightPx / 2)
    const nextOffset = previewTickerOnTop
      ? clampInt(Math.round(clampedY - baseHalfHeight), 0, 260)
      : clampInt(Math.round(nativeHeight - clampedY - baseHalfHeight), 0, 260)
    setConfigDraft((current) => ({
      ...current,
      tickerInsetPx: nextInset,
      tickerOffsetPx: nextOffset,
    }))
  }

  function handleOfferPointerDown(event: React.PointerEvent<HTMLDivElement>) {
    if (!previewConfig.offerWindowEnabled) {
      return
    }
    event.preventDefault()
    event.stopPropagation()
    setOfferDragActive(true)
    updateOfferWindowByPointer(event.clientX, event.clientY)
    try {
      event.currentTarget.setPointerCapture(event.pointerId)
    } catch {
      // Fallback: Drag laeuft dann weiterhin ueber die Preview-Container-Events.
    }
  }

  function handleOfferResizePointerDown(event: React.PointerEvent<HTMLButtonElement>) {
    if (!previewConfig.offerWindowEnabled) {
      return
    }
    event.preventDefault()
    event.stopPropagation()
    setOfferResizeActive(true)
    resizeOfferWindowByPointer(event.clientX, event.clientY)
    try {
      event.currentTarget.setPointerCapture(event.pointerId)
    } catch {
      // Fallback ueber Preview-Container.
    }
  }

  function handleTickerPointerDown(event: React.PointerEvent<HTMLDivElement>) {
    if (!previewTickerEnabled) {
      return
    }
    event.preventDefault()
    event.stopPropagation()
    setTickerDragActive(true)
    updateTickerByPointer(event.clientX, event.clientY)
    try {
      event.currentTarget.setPointerCapture(event.pointerId)
    } catch {
      // Fallback ueber Preview-Container.
    }
  }

  function handlePreviewPointerMove(event: React.PointerEvent<HTMLDivElement>) {
    if (offerResizeActive) {
      resizeOfferWindowByPointer(event.clientX, event.clientY)
      return
    }
    if (offerDragActive) {
      updateOfferWindowByPointer(event.clientX, event.clientY)
      return
    }
    if (tickerDragActive) {
      updateTickerByPointer(event.clientX, event.clientY)
    }
  }

  function handlePreviewPointerUp() {
    if (offerDragActive) setOfferDragActive(false)
    if (offerResizeActive) setOfferResizeActive(false)
    if (tickerDragActive) setTickerDragActive(false)
  }

  const browserOrigin =
    typeof window === 'undefined' ? 'http://localhost:3000' : window.location.origin

  return (
    <AdminLayout
      title="Produkte auf Bildschirm"
      subtitle="Bildschirmverwaltung, Produktdarstellung und Live-Feed in einem Modul (Screen V2)"
    >
      <div className="mb-4 rounded-2xl border border-orange-200 bg-orange-50 px-4 py-3 text-sm text-orange-900">
        <p className="font-semibold">Screen V2 aktiv</p>
        <p className="mt-1">
          Neu: Angebotsfenster mit Position/Groesse/Bildwechsel, Produktnummern, Listenmodus ohne
          Karten, sowie Drag & Drop Sortierung.
        </p>
      </div>
      {error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}

      {success ? (
        <div className="mb-4 rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
          {success}
        </div>
      ) : null}

      <div className="mb-6 grid gap-4 md:grid-cols-4">
        <StatCard label="Produkte gesamt" value={products.length} hint="verfuegbare Datenbasis" />
        <StatCard label="Auf Bildschirm" value={visibleCount} hint="aktiv sichtbar" />
        <StatCard
          label="Highlights"
          value={products.filter((entry) => entry.screen.isFeatured).length}
          hint="mit Fokus-Badge"
        />
        <StatCard label="Bildschirme" value={activeDevicesCount} hint="aktiv geschaltet" />
      </div>

      <div className="grid gap-6 xl:grid-cols-[430px_1fr]">
        <section className="space-y-6">
          <form onSubmit={handleSaveConfig} className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Globale Bildschirm-Einstellungen</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Diese Werte gelten als Standard fuer alle Bildschirme.
            </p>

            <div className="mt-4 space-y-3">
              <Field label="Titel">
                <input
                  value={configDraft.title}
                  onChange={(event) =>
                    setConfigDraft((current) => ({ ...current, title: event.target.value }))
                  }
                  required
                  className="input-ui"
                />
              </Field>

              <Field label="Untertitel">
                <input
                  value={configDraft.subtitle || ''}
                  onChange={(event) =>
                    setConfigDraft((current) => ({ ...current, subtitle: event.target.value }))
                  }
                  className="input-ui"
                />
              </Field>

              <Field label="Schrifttyp (global)">
                <input
                  value={configDraft.fontFamily}
                  onChange={(event) =>
                    setConfigDraft((current) => ({ ...current, fontFamily: event.target.value }))
                  }
                  placeholder="z. B. Poppins, sans-serif"
                  className="input-ui"
                />
              </Field>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Produkt-Schriftgroesse">
                  <input
                    type="number"
                    min={16}
                    max={96}
                    value={configDraft.productFontSize}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        productFontSize: clampInt(Number(event.target.value || 34), 16, 96),
                      }))
                    }
                    className="input-ui"
                  />
                </Field>
                <Field label="Zutaten-Schriftgroesse">
                  <input
                    type="number"
                    min={10}
                    max={48}
                    value={configDraft.ingredientFontSize}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        ingredientFontSize: clampInt(Number(event.target.value || 12), 10, 48),
                      }))
                    }
                    className="input-ui"
                  />
                </Field>
              </div>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Kategorie-Schriftgroesse">
                  <input
                    type="number"
                    min={10}
                    max={48}
                    value={configDraft.categoryFontSize}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        categoryFontSize: clampInt(Number(event.target.value || 12), 10, 48),
                      }))
                    }
                    className="input-ui"
                  />
                </Field>
                <Field label="Preis-Schriftgroesse">
                  <input
                    type="number"
                    min={14}
                    max={72}
                    value={configDraft.priceFontSize}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        priceFontSize: clampInt(Number(event.target.value || 30), 14, 72),
                      }))
                    }
                    className="input-ui"
                  />
                </Field>
              </div>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Hintergrund">
                  <select
                    value={configDraft.backgroundMode}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        backgroundMode: event.target.value as ScreenBackgroundMode,
                      }))
                    }
                    className="input-ui"
                  >
                    <option value="COLOR">Farbe</option>
                    <option value="IMAGE">Bild</option>
                    <option value="VIDEO">Video</option>
                  </select>
                </Field>

                <Field label="Kartenstil">
                  <select
                    value={configDraft.cardStyle}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        cardStyle: event.target.value as ScreenCardStyle,
                      }))
                    }
                    className="input-ui"
                  >
                    <option value="SOFT">Soft</option>
                    <option value="SHARP">Sharp</option>
                    <option value="GLASS">Glass</option>
                    <option value="BOLD">Bold</option>
                    <option value="OUTLINE">Outline</option>
                    <option value="MINIMAL">Minimal</option>
                    <option value="LIST">Listenmodus (ohne Karten)</option>
                  </select>
                </Field>
              </div>

              {configDraft.backgroundMode === 'COLOR' ? (
                <Field label="Hintergrundfarbe">
                  <input
                    type="color"
                    value={configDraft.backgroundValue || '#0f172a'}
                    onChange={(event) =>
                      setConfigDraft((current) => ({ ...current, backgroundValue: event.target.value }))
                    }
                    className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                  />
                </Field>
              ) : (
                <Field label={configDraft.backgroundMode === 'IMAGE' ? 'Bild-URL' : 'Video-URL'}>
                  <div className="space-y-1">
                    <input
                      value={configDraft.backgroundMediaUrl || ''}
                      onChange={(event) =>
                        setConfigDraft((current) => ({ ...current, backgroundMediaUrl: event.target.value }))
                      }
                      placeholder="https://..."
                      className="input-ui"
                    />
                    {configDraft.backgroundMode === 'VIDEO' ? (
                      <p className="text-xs text-rose-900/70">
                        MP4/WebM oder YouTube-Link (watch/youtu.be/shorts) eintragen.
                      </p>
                    ) : null}
                  </div>
                </Field>
              )}

              <div className="grid grid-cols-2 gap-3">
                <Field label="Akzentfarbe">
                  <input
                    type="color"
                    value={configDraft.accentColor}
                    onChange={(event) =>
                      setConfigDraft((current) => ({ ...current, accentColor: event.target.value }))
                    }
                    className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                  />
                </Field>
                <Field label="Textfarbe">
                  <input
                    type="color"
                    value={configDraft.textColor}
                    onChange={(event) =>
                      setConfigDraft((current) => ({ ...current, textColor: event.target.value }))
                    }
                    className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                  />
                </Field>
              </div>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Produktname Farbe">
                  <input
                    type="color"
                    value={configDraft.productNameColor}
                    onChange={(event) =>
                      setConfigDraft((current) => ({ ...current, productNameColor: event.target.value }))
                    }
                    className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                  />
                </Field>
                <Field label="Zutaten Farbe">
                  <input
                    type="color"
                    value={configDraft.ingredientTextColor}
                    onChange={(event) =>
                      setConfigDraft((current) => ({ ...current, ingredientTextColor: event.target.value }))
                    }
                    className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                  />
                </Field>
                <Field label="Kategorie Farbe">
                  <input
                    type="color"
                    value={configDraft.categoryTextColor}
                    onChange={(event) =>
                      setConfigDraft((current) => ({ ...current, categoryTextColor: event.target.value }))
                    }
                    className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                  />
                </Field>
                <Field label="Preis Farbe">
                  <input
                    type="color"
                    value={configDraft.priceTextColor}
                    onChange={(event) =>
                      setConfigDraft((current) => ({ ...current, priceTextColor: event.target.value }))
                    }
                    className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                  />
                </Field>
              </div>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Logo (URL oder Data-URL)">
                  <input
                    value={configDraft.logoUrl || ''}
                    onChange={(event) =>
                      setConfigDraft((current) => ({ ...current, logoUrl: event.target.value }))
                    }
                    placeholder="https://... oder per Upload"
                    className="input-ui"
                  />
                </Field>
                <Field label="Logo-Groesse">
                  <input
                    type="number"
                    min={32}
                    max={220}
                    value={configDraft.logoSize}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        logoSize: clampInt(Number(event.target.value || 72), 32, 220),
                      }))
                    }
                    className="input-ui"
                  />
                </Field>
              </div>

              <Field label="Logo hochladen">
                <div className="space-y-2">
                  <input
                    type="file"
                    accept="image/*"
                    onChange={(event) => {
                      const file = event.target.files?.[0]
                      if (file) {
                        void handleLogoUpload(file)
                      }
                    }}
                    className="block w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm"
                  />
                  {configDraft.logoUrl ? (
                    <div className="flex items-center gap-3 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2">
                      <img
                        src={configDraft.logoUrl}
                        alt="Logo Vorschau"
                        className="h-10 w-10 rounded-md object-contain"
                      />
                      <button
                        type="button"
                        onClick={() =>
                          setConfigDraft((current) => ({
                            ...current,
                            logoUrl: null,
                          }))
                        }
                        className="rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50"
                      >
                        Logo entfernen
                      </button>
                    </div>
                  ) : null}
                </div>
              </Field>

              <Field label="Animation">
                <select
                  value={configDraft.overlayAnimation}
                  onChange={(event) =>
                    setConfigDraft((current) => ({
                      ...current,
                      overlayAnimation: event.target.value as ScreenOverlayAnimation,
                    }))
                  }
                  className="input-ui"
                >
                  <option value="NONE">Keine</option>
                  <option value="FLOAT">Float</option>
                  <option value="SLIDE">Slide</option>
                  <option value="SPARKLE">Sparkle</option>
                </select>
              </Field>

              <Field label="Produktsortierung">
                <select
                  value={configDraft.productSortMode}
                  onChange={(event) =>
                    setConfigDraft((current) => ({
                      ...current,
                      productSortMode: event.target.value as ScreenProductSortMode,
                    }))
                  }
                  className="input-ui"
                >
                  <option value="CUSTOM">Eigene Sortierung (manuell)</option>
                  <option value="CATEGORY_THEN_CUSTOM">Kategorie, dann manuell</option>
                  <option value="CATEGORY_THEN_NAME">Kategorie, dann Name</option>
                  <option value="NAME_ASC">Name (A-Z)</option>
                  <option value="PRICE_ASC">Preis aufsteigend</option>
                  <option value="PRICE_DESC">Preis absteigend</option>
                </select>
              </Field>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Preis-Darstellung">
                  <select
                    value={configDraft.priceDisplayMode}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        priceDisplayMode: event.target.value as ScreenPriceDisplayMode,
                      }))
                    }
                    className="input-ui"
                  >
                    <option value="EUR_SUFFIX">12.50 EUR</option>
                    <option value="EUR_PREFIX">EUR 12.50</option>
                    <option value="CURRENCY_SYMBOL">EUR 12.50 (Symbol)</option>
                    <option value="NO_DECIMALS">13 EUR</option>
                    <option value="COMMA_DECIMAL">5,50</option>
                  </select>
                </Field>

                <Field label="Standard-Spalten (alle Bildschirme)">
                  <input
                    type="number"
                    min={1}
                    max={6}
                    value={configDraft.defaultColumnCount}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        defaultColumnCount: clampInt(Number(event.target.value || 4), 1, 6),
                      }))
                    }
                    className="input-ui"
                  />
                </Field>
              </div>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Standard-Ausrichtung">
                  <select
                    value={configDraft.defaultOrientation}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        defaultOrientation: event.target.value as ScreenOrientation,
                      }))
                    }
                    className="input-ui"
                  >
                    <option value="LANDSCAPE">Querformat</option>
                    <option value="PORTRAIT">Hochformat</option>
                  </select>
                </Field>
                <Field label="Standard-Aufloesung (Dropdown)">
                  <select
                    value={globalResolutionPreset}
                    onChange={(event) => {
                      if (event.target.value === CUSTOM_RESOLUTION_VALUE) {
                        return
                      }
                      const parsed = parseResolutionPreset(event.target.value)
                      if (!parsed) {
                        return
                      }
                      setConfigDraft((current) => ({
                        ...current,
                        defaultResolutionWidth: clampInt(parsed.width, 320, 10000),
                        defaultResolutionHeight: clampInt(parsed.height, 240, 10000),
                      }))
                    }}
                    className="input-ui"
                  >
                    {COMMON_RESOLUTIONS.map((entry) => (
                      <option key={`global-resolution-${entry.width}-${entry.height}`} value={resolutionKey(entry.width, entry.height)}>
                        {entry.label}
                      </option>
                    ))}
                    <option value={CUSTOM_RESOLUTION_VALUE}>Benutzerdefiniert</option>
                  </select>
                </Field>
              </div>
              {globalResolutionPreset === CUSTOM_RESOLUTION_VALUE ? (
                <div className="grid grid-cols-2 gap-3">
                  <Field label="Benutzerdefiniert Breite">
                    <input
                      type="number"
                      min={320}
                      max={10000}
                      value={configDraft.defaultResolutionWidth}
                      onChange={(event) =>
                        setConfigDraft((current) => ({
                          ...current,
                          defaultResolutionWidth: clampInt(Number(event.target.value || 1920), 320, 10000),
                        }))
                      }
                      className="input-ui"
                    />
                  </Field>
                  <Field label="Benutzerdefiniert Hoehe">
                    <input
                      type="number"
                      min={240}
                      max={10000}
                      value={configDraft.defaultResolutionHeight}
                      onChange={(event) =>
                        setConfigDraft((current) => ({
                          ...current,
                          defaultResolutionHeight: clampInt(Number(event.target.value || 1080), 240, 10000),
                        }))
                      }
                      className="input-ui"
                    />
                  </Field>
                </div>
              ) : null}

              <div className="grid grid-cols-3 gap-3">
                <Field label="Karten-Padding">
                  <input
                    type="number"
                    min={8}
                    max={48}
                    value={configDraft.cardPadding}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        cardPadding: clampInt(Number(event.target.value || 16), 8, 48),
                      }))
                    }
                    className="input-ui"
                  />
                </Field>
                <Field label="Karten-Hintergrund %">
                  <input
                    type="number"
                    min={0}
                    max={100}
                    value={configDraft.cardBackgroundOpacity}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        cardBackgroundOpacity: clampInt(Number(event.target.value || 35), 0, 100),
                      }))
                    }
                    className="input-ui"
                  />
                </Field>
                <Field label="Karten-Rand %">
                  <input
                    type="number"
                    min={0}
                    max={100}
                    value={configDraft.cardBorderOpacity}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        cardBorderOpacity: clampInt(Number(event.target.value || 20), 0, 100),
                      }))
                    }
                    className="input-ui"
                  />
                </Field>
              </div>

              <div className="space-y-2 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <CheckField
                  checked={configDraft.showPrices}
                  onChange={(checked) => setConfigDraft((current) => ({ ...current, showPrices: checked }))}
                  label="Preise anzeigen"
                />
                <CheckField
                  checked={configDraft.pricePinnedLeft}
                  onChange={(checked) =>
                    setConfigDraft((current) => ({ ...current, pricePinnedLeft: checked }))
                  }
                  label="Preise links anheften"
                />
                <CheckField
                  checked={configDraft.showAllergens}
                  onChange={(checked) => setConfigDraft((current) => ({ ...current, showAllergens: checked }))}
                  label="Allergene anzeigen"
                />
                <CheckField
                  checked={configDraft.showCategoryHeaders}
                  onChange={(checked) =>
                    setConfigDraft((current) => ({ ...current, showCategoryHeaders: checked }))
                  }
                  label="Kategorie-Ueberschriften anzeigen"
                />
                <CheckField
                  checked={configDraft.showCategoryOnCard}
                  onChange={(checked) =>
                    setConfigDraft((current) => ({ ...current, showCategoryOnCard: checked }))
                  }
                  label="Kategorie auch auf Produktkarte anzeigen"
                />
                <CheckField
                  checked={configDraft.categoryUppercase}
                  onChange={(checked) =>
                    setConfigDraft((current) => ({ ...current, categoryUppercase: checked }))
                  }
                  label="Kategorie in Grossbuchstaben darstellen"
                />
                <CheckField
                  checked={configDraft.allergenLegendEnabled}
                  onChange={(checked) =>
                    setConfigDraft((current) => ({ ...current, allergenLegendEnabled: checked }))
                  }
                  label="Allergen-Legende anzeigen"
                />
                <CheckField
                  checked={configDraft.showUnavailable}
                  onChange={(checked) => setConfigDraft((current) => ({ ...current, showUnavailable: checked }))}
                  label="Nicht verfuegbare Produkte anzeigen"
                />
                <CheckField
                  checked={configDraft.showProductNumber}
                  onChange={(checked) =>
                    setConfigDraft((current) => ({ ...current, showProductNumber: checked }))
                  }
                  label="Produktnummer auf Bildschirm anzeigen"
                />
                <CheckField
                  checked={configDraft.offerWindowEnabled}
                  onChange={(checked) => setConfigDraft((current) => ({ ...current, offerWindowEnabled: checked }))}
                  label="Angebotsfenster aktivieren"
                />
              </div>

              {configDraft.showAllergens && configDraft.allergenLegendEnabled ? (
                <Field label="Position Allergen-Legende">
                  <select
                    value={configDraft.allergenLegendPosition}
                    onChange={(event) =>
                      setConfigDraft((current) => ({
                        ...current,
                        allergenLegendPosition: event.target.value as ScreenAllergenLegendPosition,
                      }))
                    }
                    className="input-ui"
                  >
                    <option value="TOP_LEFT">Oben links</option>
                    <option value="TOP_RIGHT">Oben rechts</option>
                    <option value="BOTTOM_LEFT">Unten links</option>
                    <option value="BOTTOM_RIGHT">Unten rechts</option>
                    <option value="BOTTOM_CENTER">Unten mittig</option>
                  </select>
                </Field>
              ) : null}

              {configDraft.offerWindowEnabled ? (
                <>
                  <div className="grid grid-cols-3 gap-3">
                    <Field label="Position">
                      <select
                        value={configDraft.offerWindowPosition}
                        onChange={(event) => {
                          const nextPosition = event.target.value as ScreenOfferWindowPosition
                          const defaults = defaultOfferWindowCoordinates(nextPosition)
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowPosition: nextPosition,
                            offerWindowXPercent: defaults.x,
                            offerWindowYPercent: defaults.y,
                          }))
                        }}
                        className="input-ui"
                      >
                        <option value="RIGHT">Rechts</option>
                        <option value="LEFT">Links</option>
                        <option value="TOP">Oben</option>
                        <option value="BOTTOM">Unten</option>
                      </select>
                    </Field>
                    <Field label="Groesse">
                      <select
                        value={configDraft.offerWindowSize}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowSize: event.target.value as ScreenOfferWindowSize,
                          }))
                        }
                        className="input-ui"
                      >
                        <option value="S">Klein</option>
                        <option value="M">Mittel</option>
                        <option value="L">Gross</option>
                      </select>
                    </Field>
                    <Field label="Bildwechsel (Sek.)">
                      <input
                        type="number"
                        min={3}
                        max={120}
                        value={configDraft.offerMediaRotateSec}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerMediaRotateSec: clampInt(Number(event.target.value || 12), 3, 120),
                          }))
                        }
                        className="input-ui"
                      />
                    </Field>
                  </div>
                  <div className="grid grid-cols-3 gap-3">
                    <Field label="Fenster-Breite (px)">
                      <input
                        type="number"
                        min={180}
                        max={1400}
                        value={configDraft.offerWindowWidthPx}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowWidthPx: clampInt(Number(event.target.value || 380), 180, 1400),
                          }))
                        }
                        className="input-ui"
                      />
                    </Field>
                    <Field label="Fenster-Hoehe (px)">
                      <input
                        type="number"
                        min={120}
                        max={1200}
                        value={configDraft.offerWindowHeightPx}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowHeightPx: clampInt(Number(event.target.value || 280), 120, 1200),
                          }))
                        }
                        className="input-ui"
                      />
                    </Field>
                    <div className="pt-7">
                      <CheckField
                        checked={configDraft.offerWindowReserveSpace}
                        onChange={(checked) =>
                          setConfigDraft((current) => ({ ...current, offerWindowReserveSpace: checked }))
                        }
                        label="Platz im Produktbereich freihalten"
                      />
                    </div>
                  </div>
                  <div className="grid grid-cols-3 gap-3">
                    <Field label="Fensterfarbe">
                      <input
                        type="color"
                        value={configDraft.offerWindowBackgroundColor}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowBackgroundColor: event.target.value,
                          }))
                        }
                        className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                      />
                    </Field>
                    <Field label="Textfarbe">
                      <input
                        type="color"
                        value={configDraft.offerWindowTextColor}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowTextColor: event.target.value,
                          }))
                        }
                        className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                      />
                    </Field>
                    <Field label="Transparenz (%)">
                      <input
                        type="number"
                        min={0}
                        max={100}
                        value={configDraft.offerWindowOpacity}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowOpacity: clampInt(Number(event.target.value || 28), 0, 100),
                          }))
                        }
                        className="input-ui"
                      />
                    </Field>
                  </div>
                  <div className="grid grid-cols-2 gap-3">
                    <Field label="X Position % (frei)">
                      <input
                        type="range"
                        min={0}
                        max={100}
                        value={configDraft.offerWindowXPercent}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowXPercent: clampInt(Number(event.target.value || 0), 0, 100),
                          }))
                        }
                        className="w-full"
                      />
                      <input
                        type="number"
                        min={0}
                        max={100}
                        value={configDraft.offerWindowXPercent}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowXPercent: clampInt(Number(event.target.value || 0), 0, 100),
                          }))
                        }
                        className="input-ui mt-2"
                      />
                    </Field>
                    <Field label="Y Position % (frei)">
                      <input
                        type="range"
                        min={0}
                        max={100}
                        value={configDraft.offerWindowYPercent}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowYPercent: clampInt(Number(event.target.value || 0), 0, 100),
                          }))
                        }
                        className="w-full"
                      />
                      <input
                        type="number"
                        min={0}
                        max={100}
                        value={configDraft.offerWindowYPercent}
                        onChange={(event) =>
                          setConfigDraft((current) => ({
                            ...current,
                            offerWindowYPercent: clampInt(Number(event.target.value || 0), 0, 100),
                          }))
                        }
                        className="input-ui mt-2"
                      />
                    </Field>
                  </div>
                  <div className="flex flex-wrap gap-2">
                    <button
                      type="button"
                      onClick={() =>
                        setConfigDraft((current) => ({
                          ...current,
                          offerWindowXPercent: 16,
                          offerWindowYPercent: 14,
                        }))
                      }
                      className="rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50"
                    >
                      Links oben
                    </button>
                    <button
                      type="button"
                      onClick={() =>
                        setConfigDraft((current) => ({
                          ...current,
                          offerWindowXPercent: 84,
                          offerWindowYPercent: 14,
                        }))
                      }
                      className="rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50"
                    >
                      Rechts oben
                    </button>
                    <button
                      type="button"
                      onClick={() =>
                        setConfigDraft((current) => ({
                          ...current,
                          offerWindowXPercent: 50,
                          offerWindowYPercent: 86,
                        }))
                      }
                      className="rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50"
                    >
                      Unten mittig
                    </button>
                  </div>
                  <p className="text-xs text-rose-900/70">
                    Tipp: In der Vorschau kannst du das Angebotsfenster direkt per Drag verschieben
                    und ueber die Ecke unten rechts in der Groesse ziehen.
                  </p>
                  <Field label="Angebotstitel">
                    <input
                      value={configDraft.offerWindowTitle || ''}
                      onChange={(event) =>
                        setConfigDraft((current) => ({ ...current, offerWindowTitle: event.target.value }))
                      }
                      className="input-ui"
                    />
                  </Field>
                  <Field label="Angebotstext">
                    <textarea
                      value={configDraft.offerWindowText || ''}
                      onChange={(event) =>
                        setConfigDraft((current) => ({ ...current, offerWindowText: event.target.value }))
                      }
                      className="input-ui min-h-[90px]"
                    />
                  </Field>
                  <Field label="Angebotsbilder (URL je Zeile, automatisch wechselnd)">
                    <textarea
                      value={joinOfferMediaInput(configDraft.offerMediaUrls)}
                      onChange={(event) =>
                        setConfigDraft((current) => ({
                          ...current,
                          offerMediaUrls: parseOfferMediaInput(event.target.value),
                        }))
                      }
                      className="input-ui min-h-[90px]"
                    />
                  </Field>
                  <Field label="Angebotsbilder hochladen">
                    <div className="space-y-2">
                      <input
                        type="file"
                        accept="image/*"
                        multiple
                        onChange={(event) => {
                          void handleOfferMediaUpload(event.target.files)
                          event.currentTarget.value = ''
                        }}
                        className="block w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm"
                      />
                      <div className="grid grid-cols-2 gap-2">
                        {configDraft.offerMediaUrls.map((url, index) => (
                          <div
                            key={`offer-media-item-${index}`}
                            className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 p-2"
                          >
                            <img
                              src={url}
                              alt={`Angebotsbild ${index + 1}`}
                              className="h-20 w-full rounded-md object-cover"
                            />
                            <button
                              type="button"
                              onClick={() =>
                                setConfigDraft((current) => ({
                                  ...current,
                                  offerMediaUrls: current.offerMediaUrls.filter(
                                    (_, mediaIndex) => mediaIndex !== index
                                  ),
                                }))
                              }
                              className="mt-2 w-full rounded-lg border border-[var(--brand-border)] bg-white px-2 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50"
                            >
                              Entfernen
                            </button>
                          </div>
                        ))}
                      </div>
                    </div>
                  </Field>
                </>
              ) : null}

              <div className="space-y-3 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <CheckField
                  checked={configDraft.tickerEnabled}
                  onChange={(checked) =>
                    setConfigDraft((current) => ({ ...current, tickerEnabled: checked }))
                  }
                  label="Lauftext + Uhrzeit aktivieren"
                />
                {configDraft.tickerEnabled ? (
                  <>
                    <div className="grid grid-cols-2 gap-3">
                      <Field label="Position">
                        <select
                          value={configDraft.tickerPosition}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerPosition: event.target.value as ScreenTickerPosition,
                            }))
                          }
                          className="input-ui"
                        >
                          <option value="TOP">Oben</option>
                          <option value="BOTTOM">Unten</option>
                        </select>
                      </Field>
                      <Field label="Datenquelle">
                        <select
                          value={configDraft.tickerDataSource}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerDataSource: event.target.value as ScreenTickerDataSource,
                            }))
                          }
                          className="input-ui"
                        >
                          <option value="CUSTOM">Eigener Text</option>
                          <option value="NEWS_API">News API</option>
                          <option value="WEATHER_API">Wetter API</option>
                          <option value="TRAFFIC_API">Traffic API</option>
                        </select>
                      </Field>
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <Field label="Hintergrund">
                        <input
                          type="color"
                          value={configDraft.tickerBackgroundColor}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerBackgroundColor: event.target.value,
                            }))
                          }
                          className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                        />
                      </Field>
                      <Field label="Textfarbe">
                        <input
                          type="color"
                          value={configDraft.tickerTextColor}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerTextColor: event.target.value,
                            }))
                          }
                          className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1"
                        />
                      </Field>
                    </div>
                    <div className="grid grid-cols-4 gap-3">
                      <Field label="Refresh (Sekunden)">
                        <input
                          type="number"
                          min={10}
                          max={3600}
                          value={configDraft.tickerRefreshSec}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerRefreshSec: clampInt(Number(event.target.value || 180), 10, 3600),
                            }))
                          }
                          className="input-ui"
                        />
                      </Field>
                      <Field label="Lauftext-Groesse (px)">
                        <input
                          type="number"
                          min={10}
                          max={42}
                          value={configDraft.tickerFontSize}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerFontSize: clampInt(Number(event.target.value || 14), 10, 42),
                            }))
                          }
                          className="input-ui"
                        />
                      </Field>
                      <Field label="Uhr-Groesse (px)">
                        <input
                          type="number"
                          min={10}
                          max={48}
                          value={configDraft.tickerClockFontSize}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerClockFontSize: clampInt(Number(event.target.value || 12), 10, 48),
                            }))
                          }
                          className="input-ui"
                        />
                      </Field>
                      <div className="pt-7">
                        <CheckField
                          checked={configDraft.tickerShowClock}
                          onChange={(checked) =>
                            setConfigDraft((current) => ({ ...current, tickerShowClock: checked }))
                          }
                          label="Uhrzeit einblenden"
                        />
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <Field label="Randkuerzung links/rechts (px)">
                        <input
                          type="range"
                          min={0}
                          max={420}
                          value={configDraft.tickerInsetPx}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerInsetPx: clampInt(Number(event.target.value || 0), 0, 420),
                            }))
                          }
                          className="w-full"
                        />
                        <input
                          type="number"
                          min={0}
                          max={420}
                          value={configDraft.tickerInsetPx}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerInsetPx: clampInt(Number(event.target.value || 0), 0, 420),
                            }))
                          }
                          className="input-ui mt-2"
                        />
                      </Field>
                      <Field label="Abstand vom Rand (px)">
                        <input
                          type="range"
                          min={0}
                          max={260}
                          value={configDraft.tickerOffsetPx}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerOffsetPx: clampInt(Number(event.target.value || 0), 0, 260),
                            }))
                          }
                          className="w-full"
                        />
                        <input
                          type="number"
                          min={0}
                          max={260}
                          value={configDraft.tickerOffsetPx}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerOffsetPx: clampInt(Number(event.target.value || 0), 0, 260),
                            }))
                          }
                          className="input-ui mt-2"
                        />
                      </Field>
                    </div>
                    <p className="text-xs text-rose-900/70">
                      Tipp: In der Vorschau kannst du die Laufschrift direkt ziehen, um Randkuerzung
                      und Abstand schnell einzustellen.
                    </p>
                    {configDraft.tickerDataSource === 'CUSTOM' ? (
                      <Field label="Eigener Lauftext">
                        <textarea
                          value={configDraft.tickerCustomText || ''}
                          onChange={(event) =>
                            setConfigDraft((current) => ({
                              ...current,
                              tickerCustomText: event.target.value,
                            }))
                          }
                          className="input-ui min-h-[80px]"
                          placeholder="z. B. Willkommen bei Klarando | Heute 2x Pizza..."
                        />
                      </Field>
                    ) : (
                      <Field label="API URL">
                        <div className="space-y-2">
                          <div className="flex gap-2">
                            <input
                              value={configDraft.tickerApiUrl || ''}
                              onChange={(event) => {
                                setConfigDraft((current) => ({
                                  ...current,
                                  tickerApiUrl: event.target.value,
                                }))
                                setTickerApiCheckState('IDLE')
                                setTickerApiCheckMessage('')
                              }}
                              onBlur={() => {
                                if ((configDraft.tickerApiUrl || '').trim()) {
                                  void checkTickerApiConnection()
                                }
                              }}
                              className="input-ui flex-1"
                              placeholder="https://api.example.com/feed"
                            />
                            <button
                              type="button"
                              onClick={() => void checkTickerApiConnection()}
                              disabled={tickerApiCheckState === 'CHECKING'}
                              className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-50 disabled:cursor-not-allowed disabled:opacity-60"
                            >
                              {tickerApiCheckState === 'CHECKING' ? 'Prueft...' : 'Pruefen'}
                            </button>
                          </div>
                          {tickerApiCheckState !== 'IDLE' ? (
                            <p
                              className={`rounded-xl border px-3 py-2 text-xs ${
                                tickerApiCheckState === 'OK'
                                  ? 'border-emerald-200 bg-emerald-50 text-emerald-800'
                                  : tickerApiCheckState === 'CHECKING'
                                  ? 'border-sky-200 bg-sky-50 text-sky-800'
                                  : 'border-rose-200 bg-rose-50 text-rose-800'
                              }`}
                            >
                              {tickerApiCheckState === 'OK' ? 'Verbunden: ' : ''}
                              {tickerApiCheckMessage}
                            </p>
                          ) : null}
                        </div>
                      </Field>
                    )}
                  </>
                ) : null}
              </div>
            </div>

            <button
              type="submit"
              disabled={savingConfig}
              className="mt-4 w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
            >
              {savingConfig ? 'Speichert...' : 'Globale Einstellungen speichern'}
            </button>
          </form>

          <form onSubmit={handleSaveProduct} className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Produktdarstellung</h2>
            {!editingProduct ? (
              <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                Rechts in der Liste ein Produkt auswaehlen.
              </p>
            ) : (
              <div className="mt-3 space-y-3">
                <p className="text-sm font-medium text-rose-900/85">
                  {editingProduct.name} (Nr. {editingProduct.productNumber})
                </p>
                <Field label="Display-Kategorie">
                  <input value={displayCategory} onChange={(event) => setDisplayCategory(event.target.value)} className="input-ui" />
                </Field>
                <div className="grid grid-cols-2 gap-3">
                  <Field label="Sortierung">
                    <input type="number" min="0" max="9999" value={sortOrder} onChange={(event) => setSortOrder(event.target.value)} className="input-ui" />
                  </Field>
                  <Field label="Highlight-Farbe">
                    <input type="color" value={highlightColor} onChange={(event) => setHighlightColor(event.target.value)} className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1" />
                  </Field>
                </div>
                <Field label="Badge-Text">
                  <input value={badgeText} onChange={(event) => setBadgeText(event.target.value)} className="input-ui" />
                </Field>
                <div className="space-y-2 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                  <CheckField checked={showOnScreen} onChange={setShowOnScreen} label="Auf Bildschirm anzeigen" />
                  <CheckField checked={isFeatured} onChange={setIsFeatured} label="Als Highlight markieren" />
                </div>
                <button type="submit" disabled={savingProduct} className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60">
                  {savingProduct ? 'Speichert...' : 'Produkt speichern'}
                </button>
                <button type="button" onClick={resetProductForm} className="w-full rounded-xl border border-[var(--brand-border)] px-4 py-2.5 font-medium text-rose-900/85 transition hover:bg-rose-50">
                  Bearbeitung abbrechen
                </button>
              </div>
            )}
          </form>
          <form onSubmit={handleSaveDevice} className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">
              {editingDeviceId ? 'Bildschirm bearbeiten' : 'Neuen Bildschirm anlegen'}
            </h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Je Bildschirm eigenes Verhalten, Aufloesung und Feed-Link.
            </p>

            <div className="mt-4 space-y-3">
              <Field label="Name">
                <input value={deviceName} onChange={(event) => setDeviceName(event.target.value)} required className="input-ui" />
              </Field>
              <Field label="Device-Code (optional bei Neuanlage)">
                <input value={deviceCode} onChange={(event) => setDeviceCode(event.target.value)} disabled={Boolean(editingDeviceId)} className="input-ui disabled:bg-rose-50" />
              </Field>
              <Field label="Standort">
                <input value={deviceLocation} onChange={(event) => setDeviceLocation(event.target.value)} className="input-ui" />
              </Field>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Ausrichtung">
                  <select value={deviceOrientation} onChange={(event) => setDeviceOrientation(event.target.value as ScreenDeviceOrientation)} className="input-ui">
                    <option value="LANDSCAPE">Landscape</option>
                    <option value="PORTRAIT">Portrait</option>
                  </select>
                </Field>
                <Field label="Aufloesung (Dropdown)">
                  <select
                    value={deviceResolutionPreset}
                    onChange={(event) => {
                      if (event.target.value === CUSTOM_RESOLUTION_VALUE) {
                        return
                      }
                      const parsed = parseResolutionPreset(event.target.value)
                      if (!parsed) {
                        return
                      }
                      setDeviceResolutionWidth(String(parsed.width))
                      setDeviceResolutionHeight(String(parsed.height))
                    }}
                    className="input-ui"
                  >
                    {COMMON_RESOLUTIONS.map((entry) => (
                      <option key={`device-resolution-${entry.width}-${entry.height}`} value={resolutionKey(entry.width, entry.height)}>
                        {entry.label}
                      </option>
                    ))}
                    <option value={CUSTOM_RESOLUTION_VALUE}>Benutzerdefiniert</option>
                  </select>
                </Field>
              </div>
              {deviceResolutionPreset === CUSTOM_RESOLUTION_VALUE ? (
                <div className="grid grid-cols-2 gap-3">
                  <Field label="Benutzerdefiniert Breite">
                    <input
                      type="number"
                      min={320}
                      max={10000}
                      value={deviceResolutionWidth}
                      onChange={(event) => setDeviceResolutionWidth(event.target.value)}
                      className="input-ui"
                    />
                  </Field>
                  <Field label="Benutzerdefiniert Hoehe">
                    <input
                      type="number"
                      min={240}
                      max={10000}
                      value={deviceResolutionHeight}
                      onChange={(event) => setDeviceResolutionHeight(event.target.value)}
                      className="input-ui"
                    />
                  </Field>
                </div>
              ) : null}

              <Field label="Refresh Sekunden">
                <input type="number" min="5" max="3600" value={deviceRefreshIntervalSec} onChange={(event) => setDeviceRefreshIntervalSec(event.target.value)} className="input-ui" />
              </Field>

              <Field label="Spalten fuer diesen Bildschirm (optional)">
                <input
                  type="number"
                  min="1"
                  max="6"
                  value={deviceColumnCount}
                  onChange={(event) => setDeviceColumnCount(event.target.value)}
                  placeholder={`Leer = Standard (${configDraft.defaultColumnCount})`}
                  className="input-ui"
                />
              </Field>

              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <p className="text-sm font-medium text-rose-900/85">
                  Kategorien auf diesen Bildschirm verschieben
                </p>
                <p className="mt-1 text-xs text-rose-900/70">
                  Wenn Produkte ausgewählt sind, haben Produkt-Zuordnungen Vorrang.
                </p>
                <div className="mt-2 grid max-h-36 grid-cols-1 gap-1 overflow-y-auto pr-1">
                  {categories.map((category) => (
                    <label key={`device-category-${category.id}`} className="flex items-center gap-2 text-xs text-rose-900/85">
                      <input
                        type="checkbox"
                        checked={deviceSelectedCategoryIds.includes(category.id)}
                        onChange={() => toggleDeviceCategory(category.id)}
                      />
                      <span>{category.name}</span>
                    </label>
                  ))}
                </div>
                <button
                  type="button"
                  onClick={() => setDeviceSelectedCategoryIds(categories.map((entry) => entry.id))}
                  className="mt-2 mr-2 rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50"
                >
                  Alle Kategorien wählen
                </button>
                <button
                  type="button"
                  onClick={() => setDeviceSelectedCategoryIds([])}
                  className="mt-2 rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50"
                >
                  Kategorien-Zuordnung leeren
                </button>
              </div>

              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <p className="text-sm font-medium text-rose-900/85">
                  Produkte direkt auf diesen Bildschirm verschieben
                </p>
                <p className="mt-1 text-xs text-rose-900/70">
                  Ausgewählte Produkte erscheinen nur auf diesem Bildschirm-Feed.
                </p>
                <div className="mt-2 grid gap-2 md:grid-cols-2">
                  <input
                    value={deviceProductSearch}
                    onChange={(event) => setDeviceProductSearch(event.target.value)}
                    placeholder="Produkt suchen"
                    className="input-ui"
                  />
                  <select
                    value={deviceProductCategoryFilter}
                    onChange={(event) => setDeviceProductCategoryFilter(event.target.value)}
                    className="input-ui"
                  >
                    <option value="ALL">Alle Kategorien</option>
                    {categories.map((category) => (
                      <option key={`device-filter-category-${category.id}`} value={category.id}>
                        {category.name}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="mt-2 grid max-h-44 grid-cols-1 gap-1 overflow-y-auto pr-1">
                  {filteredDeviceProducts.map((product) => (
                    <label key={`device-product-${product.id}`} className="flex items-center gap-2 text-xs text-rose-900/85">
                      <input
                        type="checkbox"
                        checked={deviceSelectedProductIds.includes(product.id)}
                        onChange={() => toggleDeviceProduct(product.id)}
                      />
                      <span>
                        {product.name} ({product.category?.name || 'Ohne Kategorie'})
                      </span>
                    </label>
                  ))}
                  {filteredDeviceProducts.length === 0 ? (
                    <p className="text-xs text-rose-900/60">Keine passenden Produkte gefunden.</p>
                  ) : null}
                </div>
                <button
                  type="button"
                  onClick={() => {
                    const visibleIds = filteredDeviceProducts.map((entry) => entry.id)
                    setDeviceSelectedProductIds((current) =>
                      Array.from(new Set([...current, ...visibleIds]))
                    )
                  }}
                  className="mt-2 mr-2 rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50"
                >
                  Gefilterte Produkte wählen ({filteredDeviceProducts.length})
                </button>
                {deviceProductCategoryFilter !== 'ALL' ? (
                  <button
                    type="button"
                    onClick={() => {
                      const categoryIds = products
                        .filter((entry) => (entry.category?.id || '') === deviceProductCategoryFilter)
                        .map((entry) => entry.id)
                      setDeviceSelectedProductIds((current) =>
                        Array.from(new Set([...current, ...categoryIds]))
                      )
                    }}
                    className="mt-2 mr-2 rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50"
                  >
                    Alle Produkte dieser Kategorie anzeigen
                  </button>
                ) : null}
                <button
                  type="button"
                  onClick={() => setDeviceSelectedProductIds([])}
                  className="mt-2 rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50"
                >
                  Produkt-Zuordnung leeren
                </button>
              </div>

              <div className="space-y-2 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <CheckField checked={deviceIsActive} onChange={setDeviceIsActive} label="Bildschirm aktiv" />
                <CheckField checked={deviceShowPrices} onChange={setDeviceShowPrices} label="Preise auf diesem Bildschirm anzeigen" />
                <CheckField checked={deviceShowAllergens} onChange={setDeviceShowAllergens} label="Allergene auf diesem Bildschirm anzeigen" />
                <CheckField checked={deviceShowUnavailable} onChange={setDeviceShowUnavailable} label="Nicht verfuegbare Produkte anzeigen" />
                <CheckField checked={deviceShowProductNumber} onChange={setDeviceShowProductNumber} label="Produktnummern anzeigen" />
                <CheckField checked={deviceOfferWindow} onChange={setDeviceOfferWindow} label="Angebotsfenster anzeigen" />
              </div>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Kartenstil-Override">
                  <select
                    value={deviceCardStyleOverride}
                    onChange={(event) => setDeviceCardStyleOverride(event.target.value as ScreenCardStyle)}
                    className="input-ui"
                  >
                    <option value="SOFT">Soft</option>
                    <option value="SHARP">Sharp</option>
                    <option value="GLASS">Glass</option>
                    <option value="BOLD">Bold</option>
                    <option value="OUTLINE">Outline</option>
                    <option value="MINIMAL">Minimal</option>
                    <option value="LIST">Listenmodus (ohne Karten)</option>
                  </select>
                </Field>
                <Field label="Angebotsfenster Position">
                  <select
                    value={deviceOfferWindowPosition}
                    onChange={(event) =>
                      setDeviceOfferWindowPosition(event.target.value as ScreenOfferWindowPosition)
                    }
                    className="input-ui"
                  >
                    <option value="RIGHT">Rechts</option>
                    <option value="LEFT">Links</option>
                    <option value="TOP">Oben</option>
                    <option value="BOTTOM">Unten</option>
                  </select>
                </Field>
              </div>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Angebotsfenster Groesse">
                  <select
                    value={deviceOfferWindowSize}
                    onChange={(event) =>
                      setDeviceOfferWindowSize(event.target.value as ScreenOfferWindowSize)
                    }
                    className="input-ui"
                  >
                    <option value="S">Klein</option>
                    <option value="M">Mittel</option>
                    <option value="L">Gross</option>
                  </select>
                </Field>
                <Field label="Bildwechsel (Sek.)">
                  <input
                    type="number"
                    min={3}
                    max={120}
                    value={deviceOfferMediaRotateSec}
                    onChange={(event) => setDeviceOfferMediaRotateSec(event.target.value)}
                    className="input-ui"
                  />
                </Field>
              </div>

              <Field label="Angebotsbilder (URL je Zeile)">
                <textarea
                  value={deviceOfferMediaUrlsInput}
                  onChange={(event) => setDeviceOfferMediaUrlsInput(event.target.value)}
                  className="input-ui min-h-[82px]"
                />
              </Field>

              <Field label="Background-Override URL (optional)">
                <input value={deviceBackgroundMediaUrl} onChange={(event) => setDeviceBackgroundMediaUrl(event.target.value)} className="input-ui" />
              </Field>

              <div className="grid grid-cols-2 gap-3">
                <Field label="Akzentfarbe">
                  <input type="color" value={deviceAccentColor} onChange={(event) => setDeviceAccentColor(event.target.value)} className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1" />
                </Field>
                <Field label="Textfarbe">
                  <input type="color" value={deviceTextColor} onChange={(event) => setDeviceTextColor(event.target.value)} className="h-11 w-full rounded-xl border border-[var(--brand-border)] bg-white p-1" />
                </Field>
              </div>

              <Field label="Notizen">
                <textarea value={deviceNotes} onChange={(event) => setDeviceNotes(event.target.value)} className="input-ui min-h-[70px]" />
              </Field>
            </div>

            <button type="submit" disabled={savingDevice} className="mt-4 w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60">
              {savingDevice ? 'Speichert...' : editingDeviceId ? 'Bildschirm aktualisieren' : 'Bildschirm speichern'}
            </button>

            {editingDeviceId ? (
              <button type="button" onClick={resetDeviceForm} className="mt-2 w-full rounded-xl border border-[var(--brand-border)] px-4 py-2.5 font-medium text-rose-900/85 transition hover:bg-rose-50">
                Bearbeitung abbrechen
              </button>
            ) : null}
          </form>
        </section>

        <section className="space-y-6">
          <div className="rounded-3xl bg-white p-4 shadow-sm ring-1 ring-[var(--brand-border)]">
            <div className="grid gap-3 md:grid-cols-3">
              <Field label="Vorschau fuer">
                <select
                  value={previewDeviceId}
                  onChange={(event) => setPreviewDeviceId(event.target.value)}
                  className="input-ui"
                >
                  <option value="GLOBAL">Globaler Standard</option>
                  {devices.map((device) => (
                    <option key={`preview-device-${device.id}`} value={device.id}>
                      {device.name} ({device.deviceCode})
                    </option>
                  ))}
                </select>
              </Field>
              <Field label="Ausrichtung">
                <div className="input-ui flex items-center text-sm text-rose-900/90">
                  {previewOrientation === 'PORTRAIT' ? 'Hochformat' : 'Querformat'}
                </div>
              </Field>
              <Field label="Aufloesung">
                <div className="input-ui flex items-center text-sm text-rose-900/90">
                  {previewResolution.width} x {previewResolution.height}
                </div>
              </Field>
            </div>
            <div className="mt-2 flex flex-wrap items-center gap-2 text-xs text-rose-900/70">
              <span>Profil: {previewResolutionLabel}</span>
              <span>·</span>
              <span>Skalierung: {previewScalePercent}%</span>
              {previewRuntimeUrl ? (
                <>
                  <span>·</span>
                  <a
                    href={previewRuntimeUrl}
                    target="_blank"
                    rel="noreferrer"
                    className="font-medium text-orange-700 underline underline-offset-2"
                  >
                    Vorschau in neuem Tab öffnen
                  </a>
                </>
              ) : null}
            </div>
            {previewDensityWarning ? (
              <div className="mt-2 rounded-xl border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
                {previewDensityWarning}
              </div>
            ) : (
              <p className="mt-2 text-xs text-rose-900/70">
                Die Vorschau passt sich automatisch an den ausgewählten Bildschirm an.
              </p>
            )}
          </div>

          <div
            ref={previewViewportRef}
            style={{
              width: `${previewScaledWidthPx}px`,
              height: `${previewScaledHeightPx}px`,
            }}
            className="relative mx-auto overflow-hidden rounded-3xl shadow-sm ring-1 ring-white/10"
            onPointerMove={handlePreviewPointerMove}
            onPointerUp={handlePreviewPointerUp}
            onPointerCancel={handlePreviewPointerUp}
            onPointerLeave={handlePreviewPointerUp}
          >
            <div
              style={{
                ...previewBg,
                width: `${previewResolution.width}px`,
                height: `${previewResolution.height}px`,
                transform: `scale(${previewScale})`,
                transformOrigin: 'top left',
              }}
              className="relative flex h-full flex-col overflow-hidden rounded-3xl text-white"
            >
            {previewHasVideoBackground ? (
              <>
                {previewYouTubeEmbedUrl ? (
                  <iframe
                    className="pointer-events-none absolute inset-0 h-full w-full"
                    src={previewYouTubeEmbedUrl}
                    title="YouTube Hintergrund Vorschau"
                    allow="autoplay; encrypted-media; picture-in-picture"
                    referrerPolicy="strict-origin-when-cross-origin"
                  />
                ) : (
                  <video
                    className="absolute inset-0 h-full w-full object-cover"
                    src={previewConfig.backgroundMediaUrl || undefined}
                    autoPlay
                    muted
                    loop
                    playsInline
                  />
                )}
                <div className="absolute inset-0 bg-slate-950/45" />
              </>
            ) : null}

            {previewTickerEnabled && previewTickerOnTop ? (
              <aside
                className="relative z-20"
                style={{
                  minHeight: `${previewTickerBarHeightPx + previewTickerOffsetPx}px`,
                }}
              >
                <div
                  onPointerDown={handleTickerPointerDown}
                  className="absolute rounded-xl border border-white/20 px-3 py-2"
                  style={{
                    top: `${previewTickerOffsetPx}px`,
                    left: `${previewTickerInsetEffectivePx}px`,
                    right: `${previewTickerInsetEffectivePx}px`,
                    backgroundColor: previewConfig.tickerBackgroundColor || '#111827',
                    color: previewConfig.tickerTextColor || '#ffffff',
                    minHeight: `${previewTickerBarHeightPx}px`,
                    cursor: tickerDragActive ? 'grabbing' : 'grab',
                    touchAction: 'none',
                  }}
                  title="Laufschrift per Drag verschieben"
                >
                <div className="flex items-center gap-4">
                  {previewConfig.tickerShowClock ? (
                    <span
                      className="shrink-0 rounded-md bg-black/25 px-2 py-1 font-semibold"
                      style={{ fontSize: `${previewTickerClockFontSize}px` }}
                    >
                      {new Date().toLocaleTimeString('de-DE', {
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit',
                      })}
                    </span>
                  ) : null}
                  <div className="relative min-w-0 flex-1 overflow-hidden">
                    <p
                      className="whitespace-nowrap font-medium klarando-preview-ticker-track"
                      style={{ fontSize: `${previewTickerFontSize}px` }}
                    >
                      {previewTickerText}
                    </p>
                  </div>
                </div>
                </div>
              </aside>
            ) : null}

            <div className="relative z-10 flex-1 overflow-hidden p-5" style={{ fontFamily: previewConfig.fontFamily }}>
              <p className="text-xs uppercase tracking-[0.2em] text-white/80">Vorschau</p>
              <div className="mt-1 flex items-start justify-between gap-3">
                <div>
                  <h2 className="text-2xl font-bold" style={{ color: previewConfig.textColor }}>
                    {previewConfig.title}
                  </h2>
                  <p className="mt-1 text-sm text-white/90">{previewConfig.subtitle || '-'}</p>
                </div>
                {previewConfig.logoUrl ? (
                  <img
                    src={previewConfig.logoUrl}
                    alt="Betreiber-Logo"
                    className="rounded-lg object-contain"
                    style={{
                      width: `${clampInt(Number(previewConfig.logoSize || 72), 32, 220)}px`,
                      height: `${clampInt(Number(previewConfig.logoSize || 72), 32, 220)}px`,
                    }}
                  />
                ) : null}
              </div>
              <div
                className="mt-4 grid gap-2"
                style={{
                  gridTemplateColumns: `repeat(${previewColumnCount}, minmax(0, 1fr))`,
                  ...previewOfferReservePadding,
                }}
              >
                {previewProducts.length === 0 ? (
                  <div className="rounded-2xl border border-dashed border-white/30 bg-black/30 px-3 py-4 text-sm text-white/80">
                    Keine sichtbaren Produkte
                  </div>
                ) : (
                  previewRows.map((row, rowIndex) =>
                    row.type === 'category' ? (
                      <div
                        key={row.key}
                        className="col-span-full rounded-xl border border-white/20 bg-black/30 px-3 py-2 font-semibold tracking-[0.12em] text-white/85"
                        style={{
                          fontSize: `${previewConfig.categoryFontSize}px`,
                          color: previewConfig.categoryTextColor,
                          textTransform: previewConfig.categoryUppercase ? 'uppercase' : 'none',
                        }}
                      >
                        {row.label}
                      </div>
                    ) : (
                      <div
                        key={row.key}
                        className={
                          isListPreviewMode
                            ? 'border-b border-white/20 px-1 py-2'
                            : cardClassByStyle(previewConfig.cardStyle)
                        }
                        style={
                          isListPreviewMode
                            ? animationStyle(previewConfig.overlayAnimation, rowIndex)
                            : {
                                ...previewCardStyle,
                                ...animationStyle(previewConfig.overlayAnimation, rowIndex),
                              }
                        }
                      >
                        {(() => {
                          const previewPriceText = previewConfig.showPrices
                            ? formatPriceForDisplay(
                                Number(row.product.price),
                                previewConfig.priceDisplayMode
                              )
                            : null
                          return (
                            <>
                              <div className="flex items-start justify-between gap-2">
                                <p
                                  className="min-w-0 flex-1 font-semibold"
                                  style={{
                                    fontSize: `${previewConfig.productFontSize}px`,
                                    color: previewConfig.productNameColor,
                                  }}
                                >
                                  {previewConfig.showProductNumber
                                    ? `Nr. ${row.product.productNumber} · `
                                    : ''}
                                  {row.product.name}
                                </p>
                                {!previewConfig.pricePinnedLeft && previewPriceText ? (
                                  <p
                                    className="shrink-0 font-extrabold leading-none"
                                    style={{
                                      fontSize: `${previewConfig.priceFontSize}px`,
                                      color: previewConfig.priceTextColor,
                                    }}
                                  >
                                    {previewPriceText}
                                  </p>
                                ) : null}
                              </div>
                              <p
                                className="mt-1 text-white/80"
                                style={{
                                  fontSize: `${previewConfig.ingredientFontSize}px`,
                                  color: previewConfig.ingredientTextColor,
                                }}
                              >
                                {ingredientPreview(row.product.ingredients, previewConfig.showAllergens)}
                              </p>
                              <div className="mt-1 flex items-center justify-between gap-3">
                                {previewConfig.pricePinnedLeft ? (
                                  <>
                                    {previewPriceText ? (
                                      <p
                                        className="font-extrabold leading-none"
                                        style={{
                                          fontSize: `${previewConfig.priceFontSize}px`,
                                          color: previewConfig.priceTextColor,
                                        }}
                                      >
                                        {previewPriceText}
                                      </p>
                                    ) : (
                                      <span />
                                    )}
                                    {previewConfig.showCategoryOnCard ? (
                                      <p
                                        className="text-white/70"
                                        style={{
                                          fontSize: `${previewConfig.categoryFontSize}px`,
                                          color: previewConfig.categoryTextColor,
                                          textTransform: previewConfig.categoryUppercase ? 'uppercase' : 'none',
                                        }}
                                      >
                                        {resolveProductCategory(row.product)}
                                      </p>
                                    ) : (
                                      <span />
                                    )}
                                  </>
                                ) : (
                                  <>
                                    {previewConfig.showCategoryOnCard ? (
                                      <p
                                        className="text-white/70"
                                        style={{
                                          fontSize: `${previewConfig.categoryFontSize}px`,
                                          color: previewConfig.categoryTextColor,
                                          textTransform: previewConfig.categoryUppercase ? 'uppercase' : 'none',
                                        }}
                                      >
                                        {resolveProductCategory(row.product)}
                                      </p>
                                    ) : (
                                      <span />
                                    )}
                                  </>
                                )}
                              </div>
                            </>
                          )
                        })()}
                      </div>
                    )
                  )
                )}
              </div>

              {previewConfig.offerWindowEnabled ? (
                <aside
                  className="absolute z-20 rounded-2xl border p-3 shadow-xl backdrop-blur-sm"
                  style={{
                    left: `${previewOfferCoordinates.x}%`,
                    top: `${previewOfferCoordinates.y}%`,
                    transform: 'translate(-50%, -50%)',
                    width: `${previewOfferWindowWidthPx}px`,
                    minHeight: `${previewOfferWindowHeightPx}px`,
                    maxWidth: '92%',
                    cursor: offerDragActive ? 'grabbing' : 'grab',
                    touchAction: 'none',
                    backgroundColor: previewOfferWindowBackground,
                    borderColor: previewOfferWindowBorder,
                    color: previewOfferWindowTextColor,
                  }}
                  onPointerDown={handleOfferPointerDown}
                  onPointerMove={handlePreviewPointerMove}
                  onPointerUp={handlePreviewPointerUp}
                  onPointerCancel={handlePreviewPointerUp}
                  onPointerLeave={handlePreviewPointerUp}
                  title="Per Drag frei verschieben"
                >
                  <p className="text-[11px] uppercase tracking-wide opacity-90">Angebot</p>
                  <p className="mt-1 text-xs opacity-90">
                    X: {previewOfferCoordinates.x}% | Y: {previewOfferCoordinates.y}%
                  </p>
                  {previewConfig.offerWindowTitle ? (
                    <p className="mt-1 text-sm font-semibold">{previewConfig.offerWindowTitle}</p>
                  ) : null}
                  {previewOfferMediaUrls[0] ? (
                    <div className="mt-2 flex items-center justify-center overflow-hidden rounded-lg border border-white/30 bg-black/25">
                      <img
                        src={previewOfferMediaUrls[0]}
                        alt="Angebotsbild Vorschau"
                        className="h-24 w-full object-contain"
                      />
                    </div>
                  ) : null}
                  <button
                    type="button"
                    onPointerDown={handleOfferResizePointerDown}
                    className="absolute bottom-1.5 right-1.5 rounded-md border border-white/40 bg-black/25 px-1.5 py-0.5 text-[11px] font-bold text-white"
                    title="Groesse ziehen"
                  >
                    ↘
                  </button>
                </aside>
              ) : null}
            </div>

            {previewTickerEnabled && previewTickerOnBottom ? (
              <aside
                className="relative z-20"
                style={{
                  minHeight: `${previewTickerBarHeightPx + previewTickerOffsetPx}px`,
                }}
              >
                <div
                  onPointerDown={handleTickerPointerDown}
                  className="absolute rounded-xl border border-white/20 px-3 py-2"
                  style={{
                    bottom: `${previewTickerOffsetPx}px`,
                    left: `${previewTickerInsetEffectivePx}px`,
                    right: `${previewTickerInsetEffectivePx}px`,
                    backgroundColor: previewConfig.tickerBackgroundColor || '#111827',
                    color: previewConfig.tickerTextColor || '#ffffff',
                    minHeight: `${previewTickerBarHeightPx}px`,
                    cursor: tickerDragActive ? 'grabbing' : 'grab',
                    touchAction: 'none',
                  }}
                  title="Laufschrift per Drag verschieben"
                >
                <div className="flex items-center gap-4">
                  {previewConfig.tickerShowClock ? (
                    <span
                      className="shrink-0 rounded-md bg-black/25 px-2 py-1 font-semibold"
                      style={{ fontSize: `${previewTickerClockFontSize}px` }}
                    >
                      {new Date().toLocaleTimeString('de-DE', {
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit',
                      })}
                    </span>
                  ) : null}
                  <div className="relative min-w-0 flex-1 overflow-hidden">
                    <p
                      className="whitespace-nowrap font-medium klarando-preview-ticker-track"
                      style={{ fontSize: `${previewTickerFontSize}px` }}
                    >
                      {previewTickerText}
                    </p>
                  </div>
                </div>
                </div>
              </aside>
            ) : null}
            </div>
          </div>

          <div className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <div className="grid gap-3 md:grid-cols-3">
              <Field label="Suche">
                <input value={search} onChange={(event) => setSearch(event.target.value)} placeholder="Name, Zutaten, Kategorie" className="input-ui" />
              </Field>
              <Field label="Kategorie">
                <select value={categoryFilter} onChange={(event) => setCategoryFilter(event.target.value)} className="input-ui">
                  <option value="ALL">Alle Kategorien</option>
                  {categories.map((category) => (
                    <option key={category.id} value={category.id}>
                      {category.name}
                    </option>
                  ))}
                </select>
              </Field>
              <Field label="Sichtbarkeit">
                <select value={visibilityFilter} onChange={(event) => setVisibilityFilter(event.target.value as VisibilityFilter)} className="input-ui">
                  <option value="ALL">Alle</option>
                  <option value="VISIBLE">Sichtbar</option>
                  <option value="HIDDEN">Versteckt</option>
                  <option value="FEATURED">Highlight</option>
                </select>
              </Field>
            </div>

            <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
              <table className="w-full min-w-[980px] border-collapse">
                <thead>
                  <tr>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Produkt</th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Zutaten</th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Display</th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Sortierung</th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Status</th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Aktion</th>
                  </tr>
                </thead>
                <tbody>
                  {loading ? (
                    <tr>
                      <td colSpan={6} className="px-3 py-3 text-sm text-rose-900/70">Lade Bildschirm-Produkte...</td>
                    </tr>
                  ) : filteredProducts.length === 0 ? (
                    <tr>
                      <td colSpan={6} className="px-3 py-3 text-sm text-rose-900/70">Keine Produkte gefunden.</td>
                    </tr>
                  ) : (
                    filteredProducts.map((product) => (
                      <tr
                        key={product.id}
                        draggable
                        onDragStart={() => setDraggingProductId(product.id)}
                        onDragEnd={() => setDraggingProductId(null)}
                        onDragOver={(event) => event.preventDefault()}
                        onDrop={(event) => {
                          event.preventDefault()
                          void reorderProductsByDrag(product.id)
                        }}
                        className={
                          draggingProductId === product.id
                            ? 'opacity-50'
                            : reorderingProducts
                            ? 'cursor-progress'
                            : 'cursor-grab'
                        }
                      >
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <p className="font-medium text-[var(--brand-ink)]">{product.name}</p>
                          <p className="text-xs text-rose-900/70">Nr. {product.productNumber || "-"}</p>
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-xs text-rose-900/85">
                          {product.ingredients.length > 0 ? ingredientPreview(product.ingredients, true) : '-'}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">{product.screen.displayCategory || product.category?.name || '-'}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">{product.screen.sortOrder}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                          {product.screen.showOnScreen ? 'Sichtbar' : 'Versteckt'} | {product.screen.isFeatured ? 'Highlight' : 'Standard'}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <div className="flex items-center gap-2">
                            <span className="text-xs text-rose-900/60">↕</span>
                            <button type="button" onClick={() => editProduct(product)} className={`rounded-lg px-2.5 py-1 text-xs font-medium text-white transition ${editingProductId === product.id ? 'bg-orange-600 hover:bg-orange-700' : 'bg-slate-900 hover:bg-slate-800'}`}>
                            {editingProductId === product.id ? 'In Bearbeitung' : 'Bearbeiten'}
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))
                  )}
                </tbody>
              </table>
            </div>
            <p className="mt-2 text-xs text-rose-900/70">
              Reihenfolge kann direkt per Drag & Drop angepasst werden.
            </p>
          </div>

          <div className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Bildschirme und Feed-Links</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Jeder Bildschirm erhaelt einen eigenen Link zur Datenversorgung.
            </p>

            <div className="mt-4 space-y-3">
              {devices.length === 0 ? (
                <p className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                  Noch keine Bildschirme angelegt.
                </p>
              ) : (
                devices.map((device) => {
                  const screenUrl = `${browserOrigin}/screen/${device.deviceCode}`
                  return (
                    <div key={device.id} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-4">
                      <div className="flex flex-wrap items-start justify-between gap-3">
                        <div>
                          <p className="text-base font-semibold text-[var(--brand-ink)]">{device.name}</p>
                          <p className="text-xs text-rose-900/75">
                            Code: {device.deviceCode} | Standort: {device.location || '-'} | Spalten:{' '}
                            {device.columnCountOverride || configDraft.defaultColumnCount}
                            {device.columnCountOverride ? '' : ' (Standard)'}
                          </p>
                          <p className="text-xs text-rose-900/75">
                            Kategorien: {device.selectedCategoryIds.length} | Produkte:{' '}
                            {device.selectedProductIds.length}
                          </p>
                          <p className="text-xs text-rose-900/75">
                            Zuletzt aktiv: {formatDate(device.lastSeenAt)}
                          </p>
                          <a href={screenUrl} target="_blank" rel="noreferrer" className="mt-1 inline-block text-xs font-medium text-orange-600 underline">
                            {screenUrl}
                          </a>
                        </div>
                        <div className="flex gap-2">
                          <button type="button" onClick={() => editDevice(device)} className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-slate-800">
                            Bearbeiten
                          </button>
                          <button type="button" disabled={deletingDeviceId === device.id} onClick={() => handleDeleteDevice(device)} className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-red-700 disabled:cursor-not-allowed disabled:opacity-60">
                            {deletingDeviceId === device.id ? 'Loescht...' : 'Loeschen'}
                          </button>
                        </div>
                      </div>
                    </div>
                  )
                })
              )}
            </div>
          </div>
        </section>
      </div>

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
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.24);
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

        .klarando-preview-ticker-track {
          display: inline-block;
          min-width: 100%;
          animation: klarandoTickerScroll 22s linear infinite;
          will-change: transform;
        }
      `}</style>
    </AdminLayout>
  )
}

function Field({
  label,
  children,
}: {
  label: string
  children: React.ReactNode
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-sm font-medium text-rose-900/85">{label}</span>
      {children}
    </label>
  )
}

function CheckField({
  checked,
  onChange,
  label,
}: {
  checked: boolean
  onChange: (checked: boolean) => void
  label: string
}) {
  return (
    <label className="flex items-center gap-2 text-sm text-rose-900/85">
      <input
        type="checkbox"
        checked={checked}
        onChange={(event) => onChange(event.target.checked)}
      />
      <span>{label}</span>
    </label>
  )
}

function StatCard({
  label,
  value,
  hint,
}: {
  label: string
  value: number
  hint: string
}) {
  return (
    <article className="rounded-2xl bg-white px-4 py-4 shadow-sm ring-1 ring-[var(--brand-border)]">
      <p className="text-xs uppercase tracking-wide text-rose-900/70">{label}</p>
      <p className="mt-1 text-2xl font-bold text-[var(--brand-ink)]">{value}</p>
      <p className="mt-1 text-xs text-rose-900/70">{hint}</p>
    </article>
  )
}

