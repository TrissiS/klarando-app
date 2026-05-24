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
  type: 'menuBoard' | 'image' | 'video' | 'promo'
  durationSeconds: number
  order: number
  validFrom: string | null
  validUntil: string | null
  daysOfWeek: number[]
  timeWindows: Array<{ from: string; until: string }>
  refId: string | null
}

export type DisplayManifest = {
  manifestVersion: string
  tenantId: string
  branchId: string | null
  displayId: string
  deviceCode: string
  layout: Record<string, unknown>
  theme: Record<string, unknown>
  playlist: DisplayManifestPlaylistItem[]
  assets: DisplayManifestAsset[]
  products: Array<{
    id: string
    name: string
    categoryId: string | null
    categoryName: string | null
    ingredients: string[]
    allergens: string[]
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
  if (normalized.includes('VIDEO')) return 'video'
  if (normalized.includes('IMAGE')) return 'image'
  if (normalized.includes('PROMO')) return 'promo'
  return 'menuBoard'
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

  const playlist: DisplayManifestPlaylistItem[] =
    runtime.slides.length > 0
      ? runtime.slides
          .filter((slide) => slide.active)
          .map((slide) => ({
            id: slide.id,
            type: normalizePlaylistType(slide.type),
            durationSeconds: Math.max(5, slide.durationSeconds || 10),
            order: slide.sortOrder,
            validFrom: null,
            validUntil: null,
            daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
            timeWindows: [],
            refId: slide.mediaUrl,
          }))
      : [
          {
            id: 'menu-default',
            type: 'menuBoard',
            durationSeconds: Number(runtime.contentSettings?.offerMediaRotateSec) || 12,
            order: 1,
            validFrom: null,
            validUntil: null,
            daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
            timeWindows: [],
            refId: null,
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

  const manifestCore: Omit<DisplayManifest, 'checksum' | 'hash'> = {
    manifestVersion: runtime.publishedVersion || runtime.cacheVersion || generatedAt,
    tenantId: runtime.tenantId,
    branchId: runtime.device.branchId,
    displayId: runtime.displayId,
    deviceCode: runtime.deviceCode,
    layout,
    theme,
    playlist,
    assets,
    products: runtime.products,
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
