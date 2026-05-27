export type DisplayPerformanceMode = 'AUTO' | 'NORMAL' | 'LOW'

const META_PREFIX = '@@klarando-display-meta:'

export type DisplayDeviceDiagnostics = {
  viewportWidth?: number | null
  viewportHeight?: number | null
  screenWidth?: number | null
  screenHeight?: number | null
  devicePixelRatio?: number | null
  orientation?: 'LANDSCAPE' | 'PORTRAIT' | null
  fullscreenSupported?: boolean | null
  touchSupported?: boolean | null
  userAgent?: string | null
  appVersion?: string | null
  estimatedPerformanceClass?: 'LOW' | 'MEDIUM' | 'HIGH' | null
  supportedVideoFormats?: string[] | null
  recommendedResolution?: string | null
  measuredAt?: string | null
}

type DisplayMeta = {
  performanceMode?: DisplayPerformanceMode
  diagnostics?: DisplayDeviceDiagnostics | null
  distribution?: {
    displayCount?: number
    strategy?: 'split-products' | 'duplicate-all' | 'category-based'
    displayGroupId?: string
  } | null
  settings?: {
    rotationEnabled?: boolean
    targetProductsPerScreen?: number | null
    layoutMode?: 'AUTO' | 'STANDARD' | 'COMPACT' | 'ULTRA_COMPACT'
    depositDisplayMode?: 'INCLUDED' | 'EXTRA'
  } | null
}

export function parseDisplayMetaFromNotes(notes: string | null | undefined): DisplayMeta {
  if (!notes) {
    return {}
  }
  const firstLine = notes.split('\n')[0]?.trim() || ''
  if (!firstLine.startsWith(META_PREFIX)) {
    return {}
  }

  const encoded = firstLine.slice(META_PREFIX.length).trim()
  try {
    const parsed = JSON.parse(encoded) as DisplayMeta
    const normalized: DisplayMeta = {}
    if (
      parsed.performanceMode === 'AUTO' ||
      parsed.performanceMode === 'NORMAL' ||
      parsed.performanceMode === 'LOW'
    ) {
      normalized.performanceMode = parsed.performanceMode
    }
    if (parsed.diagnostics && typeof parsed.diagnostics === 'object') {
      normalized.diagnostics = parsed.diagnostics
    }
    if (parsed.distribution && typeof parsed.distribution === 'object') {
      const dist = parsed.distribution
      const safeDisplayCount = Number(dist.displayCount)
      normalized.distribution = {
        displayCount:
          Number.isFinite(safeDisplayCount) && safeDisplayCount > 0
            ? Math.trunc(safeDisplayCount)
            : undefined,
        strategy:
          dist.strategy === 'split-products' ||
          dist.strategy === 'duplicate-all' ||
          dist.strategy === 'category-based'
            ? dist.strategy
            : undefined,
        displayGroupId:
          typeof dist.displayGroupId === 'string' && dist.displayGroupId.trim().length > 0
            ? dist.displayGroupId
            : undefined,
      }
    }
    if (parsed.settings && typeof parsed.settings === 'object') {
      const settings = parsed.settings
      const targetProductsRaw = Number(settings.targetProductsPerScreen)
      normalized.settings = {
        rotationEnabled:
          typeof settings.rotationEnabled === 'boolean' ? settings.rotationEnabled : undefined,
        targetProductsPerScreen:
          Number.isFinite(targetProductsRaw) && targetProductsRaw >= 10 && targetProductsRaw <= 60
            ? Math.trunc(targetProductsRaw)
            : null,
        layoutMode:
          settings.layoutMode === 'AUTO' ||
          settings.layoutMode === 'STANDARD' ||
          settings.layoutMode === 'COMPACT' ||
          settings.layoutMode === 'ULTRA_COMPACT'
            ? settings.layoutMode
            : 'AUTO',
        depositDisplayMode:
          settings.depositDisplayMode === 'EXTRA' || settings.depositDisplayMode === 'INCLUDED'
            ? settings.depositDisplayMode
            : 'INCLUDED',
      }
    }
    if (normalized.performanceMode || normalized.diagnostics || normalized.distribution || normalized.settings) {
      return normalized
    }
    return {}
  } catch {
    return {}
  }
}

export function applyPerformanceModeToNotes(
  notes: string | null | undefined,
  performanceMode: DisplayPerformanceMode
) {
  const currentMeta = parseDisplayMetaFromNotes(notes)
  const nextMeta: DisplayMeta = {
    ...currentMeta,
    performanceMode,
  }
  const metaLine = `${META_PREFIX}${JSON.stringify(nextMeta)}`

  const raw = notes || ''
  const lines = raw.split('\n')
  const firstLine = lines[0]?.trim() || ''
  if (firstLine.startsWith(META_PREFIX)) {
    lines[0] = metaLine
    return lines.join('\n')
  }
  if (!raw.trim()) {
    return metaLine
  }
  return `${metaLine}\n${raw}`
}

export function applyDiagnosticsToNotes(
  notes: string | null | undefined,
  diagnostics: DisplayDeviceDiagnostics
) {
  const currentMeta = parseDisplayMetaFromNotes(notes)
  const nextMeta: DisplayMeta = {
    ...currentMeta,
    diagnostics,
  }
  const metaLine = `${META_PREFIX}${JSON.stringify(nextMeta)}`

  const raw = notes || ''
  const lines = raw.split('\n')
  const firstLine = lines[0]?.trim() || ''
  if (firstLine.startsWith(META_PREFIX)) {
    lines[0] = metaLine
    return lines.join('\n')
  }
  if (!raw.trim()) {
    return metaLine
  }
  return `${metaLine}\n${raw}`
}
