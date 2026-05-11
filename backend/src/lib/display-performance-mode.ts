export type DisplayPerformanceMode = 'AUTO' | 'NORMAL' | 'LOW'

const META_PREFIX = '@@klarando-display-meta:'

type DisplayMeta = {
  performanceMode?: DisplayPerformanceMode
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
    if (
      parsed.performanceMode === 'AUTO' ||
      parsed.performanceMode === 'NORMAL' ||
      parsed.performanceMode === 'LOW'
    ) {
      return parsed
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
  const nextMeta: DisplayMeta = { performanceMode }
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
