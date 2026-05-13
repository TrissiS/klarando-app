import { type Request, Router } from 'express'
import { createReadStream } from 'fs'
import { access, readFile } from 'fs/promises'
import path from 'path'

const router = Router()

type AppKey = 'customer' | 'driver' | 'orderdesk'
type PlatformType = 'android'
type PaymentMethodStatus = 'enabled' | 'disabled'

type MobileUpdateManifest = {
  appKey: AppKey
  platform: PlatformType
  latestVersion: string
  minRequiredVersion: string
  buildNumber: number
  apkUrl: string
  sha256: string | null
  releaseNotes: string
  forceUpdate: boolean
  publishedAt: string
  enabled: boolean
  status: PaymentMethodStatus
}

type NormalizedManifestResponse = {
  ok: true
  appKey: AppKey
  platform: PlatformType
  latestVersion: string
  minRequiredVersion: string
  buildNumber: number
  apkUrl: string
  sha256: string | null
  releaseNotes: string
  forceUpdate: boolean
  publishedAt: string
  enabled: boolean
  updateAvailable: boolean
}

const APP_CONFIG: Record<AppKey, { fileName: string; packageName: string; aliases: string[] }> = {
  customer: {
    fileName: 'customer-stable.json',
    packageName: 'com.klarando.customer',
    aliases: ['customer'],
  },
  driver: {
    fileName: 'driver-stable.json',
    packageName: 'com.klarando.driver',
    aliases: ['driver'],
  },
  orderdesk: {
    fileName: 'orderdesk-stable.json',
    packageName: 'com.klarando.orderdesk',
    aliases: ['orderdesk', 'cashier'],
  },
}

const DEFAULT_MANIFEST: Omit<MobileUpdateManifest, 'appKey'> = {
  platform: 'android',
  latestVersion: '1.0.0',
  minRequiredVersion: '1.0.0',
  buildNumber: 1,
  apkUrl: '',
  sha256: null,
  releaseNotes: 'Initiale Version',
  forceUpdate: false,
  publishedAt: new Date().toISOString(),
  enabled: false,
  status: 'enabled',
}

function resolveManifestDirectory() {
  const backendLocal = path.resolve(process.cwd(), 'mobile-updates')
  const repoLocal = path.resolve(process.cwd(), 'backend', 'mobile-updates')
  return {
    backendLocal,
    repoLocal,
  }
}

async function resolveManifestFilePath(fileName: string) {
  const dirs = resolveManifestDirectory()
  const backendPath = path.resolve(dirs.backendLocal, fileName)
  try {
    await access(backendPath)
    return backendPath
  } catch {
    return path.resolve(dirs.repoLocal, fileName)
  }
}

function normalizeAppKey(raw: string): AppKey | null {
  const normalized = raw.trim().toLowerCase()
  for (const [appKey, config] of Object.entries(APP_CONFIG) as Array<[AppKey, (typeof APP_CONFIG)[AppKey]]>) {
    if (config.aliases.includes(normalized)) {
      return appKey
    }
  }
  return null
}

function parseVersion(value: string | null | undefined) {
  if (!value) {
    return [0, 0, 0]
  }
  const core = value.trim().split('-')[0].split('+')[0]
  const parts = core.split('.').map((entry) => Number(entry))
  return [parts[0] || 0, parts[1] || 0, parts[2] || 0]
}

function compareVersions(left: string, right: string) {
  const l = parseVersion(left)
  const r = parseVersion(right)
  for (let index = 0; index < 3; index += 1) {
    if (l[index] > r[index]) {
      return 1
    }
    if (l[index] < r[index]) {
      return -1
    }
  }
  return 0
}

function toNumber(value: unknown, fallback: number) {
  const parsed = Number(value)
  return Number.isFinite(parsed) ? Math.max(0, Math.trunc(parsed)) : fallback
}

function toText(value: unknown, fallback: string) {
  if (typeof value !== 'string') {
    return fallback
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : fallback
}

function toNullableText(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function toBool(value: unknown, fallback: boolean) {
  if (typeof value === 'boolean') {
    return value
  }
  if (typeof value === 'string') {
    const normalized = value.trim().toLowerCase()
    if (normalized === 'true') {
      return true
    }
    if (normalized === 'false') {
      return false
    }
  }
  return fallback
}

function normalizeManifest(value: unknown, appKey: AppKey): MobileUpdateManifest {
  const base = {
    appKey,
    ...DEFAULT_MANIFEST,
  }
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    return base
  }
  const source = value as Record<string, unknown>
  const latestVersion = toText(
    source.latestVersion ?? source.latestVersionName,
    base.latestVersion
  )
  const minRequiredVersion = toText(
    source.minRequiredVersion,
    source.minSupportedVersionName as string | undefined ?? latestVersion
  )
  const buildNumber = toNumber(
    source.buildNumber ?? source.latestVersionCode,
    base.buildNumber
  )
  const forceUpdate = toBool(
    source.forceUpdate,
    toNumber(source.mandatoryFromVersionCode, 0) > 0
  )

  return {
    appKey,
    platform: 'android',
    latestVersion,
    minRequiredVersion,
    buildNumber,
    apkUrl: toText(source.apkUrl, ''),
    sha256: toNullableText(source.sha256 ?? source.apkSha256),
    releaseNotes: toText(source.releaseNotes ?? source.notes, base.releaseNotes),
    forceUpdate,
    publishedAt: toText(source.publishedAt, new Date().toISOString()),
    enabled: toBool(source.enabled, base.enabled),
    status: toBool(source.enabled, base.enabled) ? 'enabled' : 'disabled',
  }
}

async function loadManifest(appKey: AppKey) {
  const appConfig = APP_CONFIG[appKey]
  const primaryPath = await resolveManifestFilePath(appConfig.fileName)
  try {
    const raw = await readFile(primaryPath, 'utf8')
    const parsed = JSON.parse(raw) as unknown
    return normalizeManifest(parsed, appKey)
  } catch (error) {
    if (appKey === 'orderdesk') {
      const legacyPath = await resolveManifestFilePath('cashier-stable.json')
      try {
        const rawLegacy = await readFile(legacyPath, 'utf8')
        const parsedLegacy = JSON.parse(rawLegacy) as unknown
        return normalizeManifest(parsedLegacy, appKey)
      } catch (legacyError) {
        console.warn('ORDERDESK MANIFEST READ FAILED, using defaults:', legacyError)
      }
    }
    console.warn(`MOBILE UPDATE MANIFEST READ FAILED for ${appKey}, using defaults:`, error)
    return normalizeManifest({}, appKey)
  }
}

function buildApkUrl(req: Request, appKey: AppKey) {
  return `${req.protocol}://${req.get('host')}/api/mobile-updates/${appKey}/apk`
}

function buildManifestResponse(
  manifest: MobileUpdateManifest,
  options: { currentVersion?: string | null; currentBuildNumber?: number | null }
): NormalizedManifestResponse {
  const isEnabled = manifest.enabled && manifest.status === 'enabled'
  const currentBuild = options.currentBuildNumber ?? 0
  const versionCompare = options.currentVersion
    ? compareVersions(manifest.latestVersion, options.currentVersion)
    : 0

  const hasBuildUpdate = currentBuild > 0 && manifest.buildNumber > currentBuild
  const hasVersionUpdate = options.currentVersion ? versionCompare > 0 : false

  return {
    ok: true,
    appKey: manifest.appKey,
    platform: manifest.platform,
    latestVersion: manifest.latestVersion,
    minRequiredVersion: manifest.minRequiredVersion,
    buildNumber: manifest.buildNumber,
    apkUrl: manifest.apkUrl,
    sha256: manifest.sha256,
    releaseNotes: manifest.releaseNotes,
    forceUpdate: Boolean(isEnabled && manifest.forceUpdate),
    publishedAt: manifest.publishedAt,
    enabled: isEnabled,
    updateAvailable: Boolean(isEnabled && (hasBuildUpdate || hasVersionUpdate)),
  }
}

router.get('/:appKey', async (req, res) => {
  const appKey = normalizeAppKey(req.params.appKey ?? '')
  if (!appKey) {
    return res.status(404).json({
      ok: false,
      code: 'UNKNOWN_APP_KEY',
      message: 'Unbekannter App-Key. Erlaubt: customer, driver, orderdesk.',
    })
  }

  const currentVersion =
    typeof req.query.currentVersion === 'string' ? req.query.currentVersion.trim() : null
  const currentBuildNumber =
    typeof req.query.buildNumber === 'string'
      ? toNumber(req.query.buildNumber, 0)
      : null

  const manifest = await loadManifest(appKey)
  const apkUrl = manifest.apkUrl.trim().length > 0 ? manifest.apkUrl.trim() : buildApkUrl(req, appKey)
  const response = buildManifestResponse({ ...manifest, apkUrl }, { currentVersion, currentBuildNumber })

  return res.json(response)
})

router.get('/:appKey/apk', async (req, res) => {
  const appKey = normalizeAppKey(req.params.appKey ?? '')
  if (!appKey) {
    return res.status(404).json({
      ok: false,
      code: 'UNKNOWN_APP_KEY',
      message: 'Unbekannter App-Key.',
    })
  }

  const manifest = await loadManifest(appKey)
  if (!manifest.enabled) {
    return res.status(404).json({
      ok: false,
      code: 'APK_DISABLED',
      message: 'APK-Download ist für diese App aktuell deaktiviert.',
    })
  }

  const dirs = resolveManifestDirectory()
  const backendPath = path.resolve(dirs.backendLocal, 'apks', appKey, 'latest.apk')
  const repoPath = path.resolve(dirs.repoLocal, 'apks', appKey, 'latest.apk')

  let filePath = backendPath
  try {
    await access(backendPath)
  } catch {
    filePath = repoPath
  }

  try {
    await access(filePath)
  } catch {
    return res.status(404).json({
      ok: false,
      code: 'APK_NOT_FOUND',
      message: 'Für diese App ist derzeit keine APK hinterlegt.',
    })
  }

  res.setHeader('Content-Type', 'application/vnd.android.package-archive')
  res.setHeader('Content-Disposition', `attachment; filename="klarando-${appKey}-latest.apk"`)
  res.setHeader('X-Klarando-App-Key', appKey)
  const stream = createReadStream(filePath)
  stream.on('error', () => {
    if (!res.headersSent) {
      res.status(500).json({
        ok: false,
        code: 'APK_STREAM_ERROR',
        message: 'APK-Datei konnte nicht ausgeliefert werden.',
      })
    }
  })
  stream.pipe(res)
})

export default router
