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
    if (normalized.performanceMode || normalized.diagnostics) {
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
