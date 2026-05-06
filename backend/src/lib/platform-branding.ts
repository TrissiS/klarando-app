import { promises as fs } from 'fs'
import path from 'path'

export type PlatformBrandingMode =
  | 'ICON_ONLY'
  | 'WORDMARK_ONLY'
  | 'ICON_WORDMARK'
  | 'WORDMARK_ICON'

export type PlatformBrandingSettings = {
  iconUrl: string | null
  wordmarkUrl: string | null
  sidebarMode: PlatformBrandingMode
  headerMode: PlatformBrandingMode
  sidebarIconSize: number
  sidebarWordmarkHeight: number
  headerIconSize: number
  headerWordmarkHeight: number
}

const DEFAULT_PLATFORM_BRANDING: PlatformBrandingSettings = {
  iconUrl: '/klarando_icon.png',
  wordmarkUrl: '/klarando_logo_wordmark.png',
  sidebarMode: 'ICON_WORDMARK',
  headerMode: 'ICON_WORDMARK',
  sidebarIconSize: 56,
  sidebarWordmarkHeight: 44,
  headerIconSize: 44,
  headerWordmarkHeight: 36,
}

const PLATFORM_BRANDING_FILE_PATH = path.resolve(
  __dirname,
  '..',
  '..',
  '..',
  'data',
  'platform-branding.json'
)

function clampInt(value: unknown, min: number, max: number, fallback: number) {
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return fallback
  }
  return Math.min(max, Math.max(min, Math.round(parsed)))
}

function normalizeMode(value: unknown, fallback: PlatformBrandingMode): PlatformBrandingMode {
  const raw = typeof value === 'string' ? value.trim().toUpperCase() : ''
  if (raw === 'ICON_ONLY' || raw === 'WORDMARK_ONLY' || raw === 'ICON_WORDMARK' || raw === 'WORDMARK_ICON') {
    return raw
  }
  return fallback
}

function normalizeAssetUrl(value: unknown, fallback: string | null) {
  if (value === null) {
    return null
  }

  if (typeof value !== 'string') {
    return fallback
  }

  const trimmed = value.trim()
  if (!trimmed) {
    return null
  }

  return trimmed
}

export function normalizePlatformBrandingSettings(
  input: unknown,
  fallback: PlatformBrandingSettings = DEFAULT_PLATFORM_BRANDING
): PlatformBrandingSettings {
  const source =
    input && typeof input === 'object' && !Array.isArray(input)
      ? (input as Record<string, unknown>)
      : {}

  return {
    iconUrl: normalizeAssetUrl(source.iconUrl, fallback.iconUrl),
    wordmarkUrl: normalizeAssetUrl(source.wordmarkUrl, fallback.wordmarkUrl),
    sidebarMode: normalizeMode(source.sidebarMode, fallback.sidebarMode),
    headerMode: normalizeMode(source.headerMode, fallback.headerMode),
    sidebarIconSize: clampInt(source.sidebarIconSize, 24, 180, fallback.sidebarIconSize),
    sidebarWordmarkHeight: clampInt(
      source.sidebarWordmarkHeight,
      18,
      120,
      fallback.sidebarWordmarkHeight
    ),
    headerIconSize: clampInt(source.headerIconSize, 20, 140, fallback.headerIconSize),
    headerWordmarkHeight: clampInt(
      source.headerWordmarkHeight,
      16,
      110,
      fallback.headerWordmarkHeight
    ),
  }
}

export async function readPlatformBrandingSettings() {
  try {
    const raw = await fs.readFile(PLATFORM_BRANDING_FILE_PATH, 'utf8')
    const parsed = JSON.parse(raw)
    return normalizePlatformBrandingSettings(parsed)
  } catch {
    return DEFAULT_PLATFORM_BRANDING
  }
}

export async function savePlatformBrandingSettings(input: unknown) {
  const current = await readPlatformBrandingSettings()
  const normalized = normalizePlatformBrandingSettings(input, current)
  await fs.mkdir(path.dirname(PLATFORM_BRANDING_FILE_PATH), { recursive: true })
  await fs.writeFile(
    PLATFORM_BRANDING_FILE_PATH,
    JSON.stringify(normalized, null, 2),
    'utf8'
  )
  return normalized
}
