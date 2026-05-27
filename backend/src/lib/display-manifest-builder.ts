import { createHash } from 'crypto'
import { buildDisplayRuntimeForDevice } from './display-runtime-builder'

type DisplayAssetType =
  | 'logo'
  | 'backgroundImage'
  | 'backgroundVideo'
  | 'productImage'
  | 'promoImage'
  | 'slideImage'
  | 'slideVideo'

type DisplayManifestAsset = {
  id: string
  type: DisplayAssetType
  url: string
  mimeType: string | null
  size: number | null
  width: number | null
  height: number | null
  duration: number | null
  checksum: string
  updatedAt: string
}

type DisplayManifestPlaylistItem = {
  id: string
  type: 'MENU' | 'IMAGE' | 'VIDEO' | 'PROMO' | 'HERO_PRODUCT' | 'INFO'
  title: string | null
  durationSeconds: number
  order: number
  active: boolean
  validFrom: string | null
  validUntil: string | null
  daysOfWeek: number[]
  timeWindows: Array<{ from: string; until: string }>
  priority: number
  fallbackItem: boolean
  scheduleName: string | null
  assetUrl: string | null
  assetType: 'IMAGE' | 'VIDEO' | null
  backgroundColor: string | null
  transition: string | null
  productIds: string[]
  categoryIds: string[]
}

export type DisplayManifest = {
  manifestVersion: string
  tenantId: string
  branchId: string | null
  displayId: string
  deviceCode: string
  displayGroupId: string
  displayGroupName: string
  displayIndex: number
  displayCount: number
  syncMode: 'DUPLICATE_ALL' | 'SPLIT_PRODUCTS' | 'CATEGORY_BASED' | 'PLAYLIST_SYNC' | 'CUSTOM_ASSIGNMENT'
  layout: Record<string, unknown>
  theme: Record<string, unknown>
  playlistItems: DisplayManifestPlaylistItem[]
  playlist: DisplayManifestPlaylistItem[]
  assets: DisplayManifestAsset[]
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
  }>
  distribution: {
    displayCount: number
    currentDisplayIndex: number
    strategy: 'split-products' | 'duplicate-all' | 'category-based'
    productsPerDisplay: number
    totalProducts: number
    pageNumber: number
    totalPages: number
  }
  categories: Array<{ id: string; name: string }>
  schedule: {
    timezone: string
    generatedAt: string
    currentTime: string
    presets: Array<{
      key: string
      name: string
      daysOfWeek: number[]
      timeWindows: Array<{ from: string; until: string }>
    }>
  }
  generatedAt: string
  expiresAt: string
  checksum: string
  hash: string
  fallback: {
    emptyStateTitle: string
    emptyStateHint: string
    fallbackBackgroundUrl: string | null
  }
}

function isLikelyVideo(url: string) {
  return /\.(mp4|webm|mov)(\?.*)?$/i.test(url)
}

function mimeTypeFromUrl(url: string) {
  if (/\.mp4(\?.*)?$/i.test(url)) return 'video/mp4'
  if (/\.webm(\?.*)?$/i.test(url)) return 'video/webm'
  if (/\.jpg|\.jpeg(\?.*)?$/i.test(url)) return 'image/jpeg'
  if (/\.png(\?.*)?$/i.test(url)) return 'image/png'
  if (/\.webp(\?.*)?$/i.test(url)) return 'image/webp'
  return null
}

function buildAsset(type: DisplayAssetType, url: string, updatedAt: string): DisplayManifestAsset {
  const checksum = createHash('sha256').update(`${type}:${url}:${updatedAt}`).digest('hex')
  return {
    id: `${type}-${checksum.slice(0, 12)}`,
    type,
    url,
    mimeType: mimeTypeFromUrl(url),
    size: null,
    width: null,
    height: null,
    duration: null,
    checksum,
    updatedAt,
  }
}

function normalizePlaylistType(type: string): DisplayManifestPlaylistItem['type'] {
  const normalized = type.toUpperCase()
  if (normalized.includes('HERO')) return 'HERO_PRODUCT'
  if (normalized.includes('INFO') || normalized.includes('TEXT')) return 'INFO'
  if (normalized.includes('VIDEO')) return 'VIDEO'
  if (normalized.includes('IMAGE')) return 'IMAGE'
  if (normalized.includes('PROMO')) return 'PROMO'
  return 'MENU'
}

export async function buildDisplayManifestForDevice(deviceCode: string) {
  const runtime = await buildDisplayRuntimeForDevice(deviceCode)
  if (!runtime) {
    return null
  }

  const now = new Date()
  const generatedAt = now.toISOString()
  const expiresAt = new Date(now.getTime() + 1000 * 60 * 15).toISOString()

  const rawAssets: Array<{ type: DisplayAssetType; url: string | null | undefined }> = [
    { type: 'logo', url: runtime.branding.logoUrl },
    { type: 'backgroundVideo', url: runtime.videoBackgroundUrl },
    { type: 'backgroundImage', url: runtime.fallbackBackgroundUrl },
  ]

  for (const slide of runtime.slides) {
    if (!slide.mediaUrl) continue
    rawAssets.push({
      type: isLikelyVideo(slide.mediaUrl) ? 'slideVideo' : 'slideImage',
      url: slide.mediaUrl,
    })
  }

  const assets = rawAssets
    .filter((entry) => typeof entry.url === 'string' && entry.url.trim().length > 0)
    .map((entry) => buildAsset(entry.type, (entry.url || '').trim(), generatedAt))

  const playlistItems: DisplayManifestPlaylistItem[] =
    runtime.slides.length > 0
      ? runtime.slides
          .filter((slide) => slide.active)
          .map((slide) => {
            const assetUrl = slide.mediaUrl && slide.mediaUrl.trim().length > 0 ? slide.mediaUrl.trim() : null
            const assetType = assetUrl ? (isLikelyVideo(assetUrl) ? 'VIDEO' : 'IMAGE') : null
            return {
            id: slide.id,
            type: normalizePlaylistType(slide.type),
            title: slide.title ?? null,
            durationSeconds: Math.max(5, slide.durationSeconds || 10),
            order: slide.sortOrder,
            active: slide.active,
            validFrom: slide.validFrom ?? null,
            validUntil: slide.validUntil ?? null,
            daysOfWeek: slide.daysOfWeek?.length ? slide.daysOfWeek : [1, 2, 3, 4, 5, 6, 7],
            timeWindows: slide.timeWindows || [],
            priority: Number(slide.priority || 100),
            fallbackItem: slide.fallbackItem === true,
            scheduleName: slide.scheduleName ?? null,
            assetUrl,
            assetType,
            backgroundColor: slide.background ?? null,
            transition: slide.animation ?? 'FADE',
            productIds: slide.productIds || [],
            categoryIds: slide.categoryIds || [],
          }})
      : [
          {
            id: 'menu-default',
            type: 'MENU',
            title: 'Menü',
            durationSeconds: Number(runtime.contentSettings?.offerMediaRotateSec) || 12,
            order: 1,
            active: true,
            validFrom: null,
            validUntil: null,
            daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
            timeWindows: [],
            priority: 1,
            fallbackItem: true,
            scheduleName: 'Fallback Menü',
            assetUrl: null,
            assetType: null,
            backgroundColor: null,
            transition: 'FADE',
            productIds: [],
            categoryIds: [],
          },
        ]

  const layout = {
    template: runtime.template,
    ...runtime.layoutSettings,
  }

  const theme = {
    ...runtime.brandingSettings,
    ...runtime.runtimeConfig,
  }
  const requestedSyncMode = String(runtime.runtimeConfig?.syncMode || '').toUpperCase()
  const resolvedSyncMode: DisplayManifest['syncMode'] =
    requestedSyncMode === 'DUPLICATE_ALL' ||
    requestedSyncMode === 'SPLIT_PRODUCTS' ||
    requestedSyncMode === 'CATEGORY_BASED' ||
    requestedSyncMode === 'PLAYLIST_SYNC' ||
    requestedSyncMode === 'CUSTOM_ASSIGNMENT'
      ? (requestedSyncMode as DisplayManifest['syncMode'])
      : runtime.distribution.strategy === 'duplicate-all'
        ? 'DUPLICATE_ALL'
        : runtime.distribution.strategy === 'category-based'
          ? 'CATEGORY_BASED'
          : 'SPLIT_PRODUCTS'

  const manifestCore: Omit<DisplayManifest, 'checksum' | 'hash'> = {
    manifestVersion: runtime.publishedVersion || runtime.cacheVersion || generatedAt,
    tenantId: runtime.tenantId,
    branchId: runtime.device.branchId,
    displayId: runtime.displayId,
    deviceCode: runtime.deviceCode,
    displayGroupId: runtime.distribution.displayGroupId,
    displayGroupName: runtime.distribution.displayGroupId,
    displayIndex: runtime.distribution.currentDisplayIndex,
    displayCount: runtime.distribution.displayCount,
    syncMode: resolvedSyncMode,
    layout,
    theme,
    playlistItems,
    playlist: playlistItems,
    assets,
    products: runtime.products.map((product) => ({
      ...product,
      isHero: Boolean(product.isHero),
      isBestseller: Boolean(product.isBestseller),
      isNew: Boolean(product.isNew),
      isPromotion: Boolean(product.isPromotion),
      promotionText: product.promotionText ?? null,
      badgeLabel: product.badgeLabel ?? null,
      badgeColor: product.badgeColor ?? null,
      highlightPriority: Number(product.highlightPriority ?? 0),
      heroImageUrl: product.heroImageUrl ?? null,
      originalPrice: product.originalPrice ?? null,
      promoPrice: product.promoPrice ?? null,
      validFrom: product.validFrom ?? null,
      validUntil: product.validUntil ?? null,
    })),
    categories: runtime.categories,
    distribution: {
      displayCount: runtime.distribution.displayCount,
      currentDisplayIndex: runtime.distribution.currentDisplayIndex,
      strategy: runtime.distribution.strategy,
      productsPerDisplay: runtime.distribution.productsPerDisplay,
      totalProducts: runtime.distribution.totalProducts,
      pageNumber: runtime.distribution.pageNumber,
      totalPages: runtime.distribution.totalPages,
    },
    schedule: {
      timezone: 'Europe/Berlin',
      generatedAt,
      currentTime: generatedAt,
      presets: [
        { key: 'BREAKFAST', name: 'Frühstück', daysOfWeek: [1, 2, 3, 4, 5, 6, 7], timeWindows: [{ from: '06:00', until: '10:59' }] },
        { key: 'LUNCH', name: 'Mittag', daysOfWeek: [1, 2, 3, 4, 5], timeWindows: [{ from: '11:00', until: '14:59' }] },
        { key: 'DINNER', name: 'Abend', daysOfWeek: [1, 2, 3, 4, 5, 6, 7], timeWindows: [{ from: '17:00', until: '22:59' }] },
        { key: 'HAPPY_HOUR', name: 'Happy Hour', daysOfWeek: [1, 2, 3, 4, 5], timeWindows: [{ from: '15:00', until: '17:00' }] },
        { key: 'WEEKEND', name: 'Wochenende', daysOfWeek: [6, 7], timeWindows: [{ from: '00:00', until: '23:59' }] },
        { key: 'HOLIDAY', name: 'Feiertag', daysOfWeek: [1, 2, 3, 4, 5, 6, 7], timeWindows: [{ from: '00:00', until: '23:59' }] },
        { key: 'EVENT', name: 'Eventmodus', daysOfWeek: [1, 2, 3, 4, 5, 6, 7], timeWindows: [{ from: '00:00', until: '23:59' }] },
      ],
    },
    generatedAt,
    expiresAt,
    fallback: {
      emptyStateTitle: 'Keine Produkte verfügbar',
      emptyStateHint: 'Bitte Inhalte im Bildschirmstudio freigeben.',
      fallbackBackgroundUrl: runtime.fallbackBackgroundUrl || null,
    },
  }

  const hash = createHash('sha256').update(JSON.stringify(manifestCore)).digest('hex')
  return {
    ...manifestCore,
    checksum: hash,
    hash,
    runtime,
  }
}
