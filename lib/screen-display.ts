import type { ScreenConfig, ScreenOrientation } from '@/lib/api'

export type NormalizedDisplayResolution = {
  width: number
  height: number
  orientation: ScreenOrientation
  aspectRatio: number
}

function clampInt(value: number, min: number, max: number) {
  if (!Number.isFinite(value)) return min
  return Math.min(max, Math.max(min, Math.trunc(value)))
}

export function normalizeDisplayResolution(settings: {
  width: number
  height: number
  orientation: ScreenOrientation
}): NormalizedDisplayResolution {
  const requestedWidth = clampInt(settings.width, 320, 10000)
  const requestedHeight = clampInt(settings.height, 240, 10000)
  const orientation = settings.orientation
  const shouldBePortrait = orientation === 'PORTRAIT'
  const width =
    shouldBePortrait && requestedWidth > requestedHeight
      ? requestedHeight
      : !shouldBePortrait && requestedWidth < requestedHeight
      ? requestedHeight
      : requestedWidth
  const height =
    shouldBePortrait && requestedWidth > requestedHeight
      ? requestedWidth
      : !shouldBePortrait && requestedWidth < requestedHeight
      ? requestedWidth
      : requestedHeight

  return {
    width,
    height,
    orientation,
    aspectRatio: width / height,
  }
}

export function getDisplayCanvasStyle(
  resolution: NormalizedDisplayResolution,
  previewScale: number
) {
  const safeScale = Number.isFinite(previewScale) ? Math.max(0.05, previewScale) : 1
  return {
    width: `${resolution.width}px`,
    height: `${resolution.height}px`,
    transform: `scale(${safeScale})`,
    transformOrigin: 'top left',
  } as const
}

export function getDisplayColumns(
  settings: Pick<ScreenConfig, 'cardStyle' | 'defaultColumnCount'>,
  resolution: NormalizedDisplayResolution
) {
  if (settings.cardStyle === 'LIST') {
    return 1
  }

  const configured = clampInt(Number(settings.defaultColumnCount || 0), 0, 5)
  if (configured >= 1) {
    return configured
  }

  if (resolution.orientation === 'PORTRAIT') {
    if (resolution.width >= 1080) return 3
    return 2
  }

  if (resolution.width >= 3200) return 5
  if (resolution.width >= 1920) return 4
  if (resolution.width >= 1280) return 3
  return 2
}

export function getDisplayFontSizes(
  settings: Pick<ScreenConfig, 'productFontSize' | 'ingredientFontSize' | 'categoryFontSize' | 'priceFontSize'>,
  resolution: NormalizedDisplayResolution
) {
  const baseWidth = 1920
  const scale = Math.max(0.7, Math.min(2, resolution.width / baseWidth))
  return {
    productFontSize: Math.round(Number(settings.productFontSize) * scale),
    ingredientFontSize: Math.round(Number(settings.ingredientFontSize) * scale),
    categoryFontSize: Math.round(Number(settings.categoryFontSize) * scale),
    priceFontSize: Math.round(Number(settings.priceFontSize) * scale),
  }
}

export function getKlarandoStandardBackground() {
  return 'radial-gradient(circle at 15% 10%, #ffd9c2 0%, #fff0e7 35%, #fff8f3 65%, #fffdfb 100%)'
}
