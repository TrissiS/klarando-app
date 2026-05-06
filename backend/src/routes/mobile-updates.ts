import { Router } from 'express'
import { readFile } from 'fs/promises'
import path from 'path'

const router = Router()

type MobileUpdateManifest = {
  channel: string
  packageName: string
  latestVersionName: string
  latestVersionCode: number
  minSupportedVersionCode: number
  mandatoryFromVersionCode: number
  apkUrl: string
  apkSha256: string | null
  notes: string
  publishedAt: string
}

const DEFAULT_MANIFEST: MobileUpdateManifest = {
  channel: 'stable',
  packageName: 'com.example.klarando.app',
  latestVersionName: '1.0.0',
  latestVersionCode: 1,
  minSupportedVersionCode: 1,
  mandatoryFromVersionCode: 0,
  apkUrl: '',
  apkSha256: null,
  notes: 'Initiale Version',
  publishedAt: new Date().toISOString(),
}

type AppKey = 'cashier' | 'driver' | 'customer'

const APP_CONFIG: Record<AppKey, { fileName: string; packageName: string }> = {
  cashier: {
    fileName: 'cashier-stable.json',
    packageName: 'com.klarando.orderdesk',
  },
  driver: {
    fileName: 'driver-stable.json',
    packageName: 'com.klarando.driver',
  },
  customer: {
    fileName: 'customer-stable.json',
    packageName: 'com.klarando.customer',
  },
}

function normalizeAppKey(value: string): AppKey | null {
  const normalized = value.trim().toLowerCase()
  if (normalized === 'cashier' || normalized === 'driver' || normalized === 'customer') {
    return normalized
  }
  return null
}

function normalizeManifest(
  value: unknown,
  options: { defaultPackageName: string }
): MobileUpdateManifest {
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    return {
      ...DEFAULT_MANIFEST,
      packageName: options.defaultPackageName,
    }
  }
  const source = value as Record<string, unknown>
  const toNumber = (entry: unknown, fallback: number) => {
    const parsed = Number(entry)
    return Number.isFinite(parsed) ? Math.max(0, Math.trunc(parsed)) : fallback
  }
  const toText = (entry: unknown, fallback: string) =>
    typeof entry === 'string' && entry.trim().length > 0 ? entry.trim() : fallback

  const fallbackManifest: MobileUpdateManifest = {
    ...DEFAULT_MANIFEST,
    packageName: options.defaultPackageName,
  }

  return {
    channel: toText(source.channel, fallbackManifest.channel),
    packageName: toText(source.packageName, fallbackManifest.packageName),
    latestVersionName: toText(source.latestVersionName, fallbackManifest.latestVersionName),
    latestVersionCode: toNumber(source.latestVersionCode, fallbackManifest.latestVersionCode),
    minSupportedVersionCode: toNumber(
      source.minSupportedVersionCode,
      fallbackManifest.minSupportedVersionCode
    ),
    mandatoryFromVersionCode: toNumber(
      source.mandatoryFromVersionCode,
      fallbackManifest.mandatoryFromVersionCode
    ),
    apkUrl: typeof source.apkUrl === 'string' ? source.apkUrl.trim() : '',
    apkSha256:
      typeof source.apkSha256 === 'string' && source.apkSha256.trim().length > 0
        ? source.apkSha256.trim()
        : null,
    notes: typeof source.notes === 'string' ? source.notes.trim() : '',
    publishedAt: toText(source.publishedAt, new Date().toISOString()),
  }
}

async function loadManifest(appKey: AppKey) {
  const appConfig = APP_CONFIG[appKey]
  const filePath = path.resolve(process.cwd(), 'mobile-updates', appConfig.fileName)
  try {
    const raw = await readFile(filePath, 'utf8')
    const parsed = JSON.parse(raw) as unknown
    return normalizeManifest(parsed, { defaultPackageName: appConfig.packageName })
  } catch (error) {
    console.warn(`MOBILE UPDATE MANIFEST READ FAILED for ${appKey}, using defaults:`, error)
    return {
      ...DEFAULT_MANIFEST,
      packageName: appConfig.packageName,
    }
  }
}

router.get('/:appKey', async (req, res) => {
  const appKey = normalizeAppKey(req.params.appKey ?? '')
  if (!appKey) {
    return res.status(404).json({
      ok: false,
      message: 'Unbekannter App-Kanal. Erlaubt: cashier, driver, customer.',
    })
  }

  const manifest = await loadManifest(appKey)
  return res.json({
    ok: true,
    appKey,
    ...manifest,
  })
})

export default router
