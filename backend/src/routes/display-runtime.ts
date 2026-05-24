import { Router } from 'express'
import { PermissionKey } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { buildDisplayRuntimeForDevice } from '../lib/display-runtime-builder'
import { buildDisplayManifestForDevice } from '../lib/display-manifest-builder'
import {
  applyDiagnosticsToNotes,
  applyPerformanceModeToNotes,
  parseDisplayMetaFromNotes,
  type DisplayDeviceDiagnostics,
  type DisplayPerformanceMode,
} from '../lib/display-performance-mode'
import { requirePermission } from '../middleware/auth'

const router = Router()

function normalizeCodeParam(value: string | string[] | undefined) {
  if (Array.isArray(value)) {
    return value[0]?.trim().toUpperCase() || ''
  }
  return value?.trim().toUpperCase() || ''
}

function parsePerformanceMode(value: unknown): DisplayPerformanceMode | null {
  if (typeof value !== 'string') {
    return null
  }
  const normalized = value.trim().toUpperCase()
  if (normalized === 'AUTO' || normalized === 'NORMAL' || normalized === 'LOW') {
    return normalized
  }
  return null
}

function toPositiveInt(value: unknown) {
  if (typeof value !== 'number' || !Number.isFinite(value)) return null
  const normalized = Math.max(0, Math.trunc(value))
  return normalized > 0 ? normalized : null
}

function toSafeBoolean(value: unknown) {
  return typeof value === 'boolean' ? value : null
}

function toSafeString(value: unknown, maxLength = 220) {
  if (typeof value !== 'string') return null
  const normalized = value.trim()
  if (!normalized) return null
  return normalized.slice(0, maxLength)
}

function parseDiagnostics(value: unknown): DisplayDeviceDiagnostics | null {
  if (!value || typeof value !== 'object') return null
  const payload = value as Record<string, unknown>
  const orientationRaw = toSafeString(payload.orientation, 20)?.toUpperCase()
  const orientation =
    orientationRaw === 'PORTRAIT' || orientationRaw === 'LANDSCAPE' ? orientationRaw : null
  const estimatedPerformanceClassRaw = toSafeString(payload.estimatedPerformanceClass, 20)?.toUpperCase()
  const estimatedPerformanceClass =
    estimatedPerformanceClassRaw === 'LOW' ||
    estimatedPerformanceClassRaw === 'MEDIUM' ||
    estimatedPerformanceClassRaw === 'HIGH'
      ? estimatedPerformanceClassRaw
      : null
  const supportedVideoFormats = Array.isArray(payload.supportedVideoFormats)
    ? payload.supportedVideoFormats
        .map((entry) => toSafeString(entry, 30))
        .filter((entry): entry is string => Boolean(entry))
        .slice(0, 12)
    : null

  return {
    viewportWidth: toPositiveInt(payload.viewportWidth),
    viewportHeight: toPositiveInt(payload.viewportHeight),
    screenWidth: toPositiveInt(payload.screenWidth),
    screenHeight: toPositiveInt(payload.screenHeight),
    devicePixelRatio:
      typeof payload.devicePixelRatio === 'number' && Number.isFinite(payload.devicePixelRatio)
        ? Number(payload.devicePixelRatio)
        : null,
    orientation,
    fullscreenSupported: toSafeBoolean(payload.fullscreenSupported),
    touchSupported: toSafeBoolean(payload.touchSupported),
    userAgent: toSafeString(payload.userAgent, 512),
    appVersion: toSafeString(payload.appVersion, 80),
    estimatedPerformanceClass,
    supportedVideoFormats,
    recommendedResolution: toSafeString(payload.recommendedResolution, 32),
    measuredAt: new Date().toISOString(),
  }
}

router.get('/:deviceCode/config', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) {
      return res.status(400).json({ error: 'deviceCode fehlt' })
    }

    const runtime = await buildDisplayRuntimeForDevice(code)
    if (!runtime) {
      return res.status(404).json({ error: 'Display nicht gefunden' })
    }
    return res.json(runtime)
  } catch (error) {
    console.error('GET DISPLAY RUNTIME CONFIG ERROR:', error)
    return res.status(500).json({ error: 'Display-Konfiguration konnte nicht geladen werden' })
  }
})

router.get('/:deviceCode/manifest', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) {
      return res.status(400).json({ error: 'deviceCode fehlt' })
    }

    const manifestPayload = await buildDisplayManifestForDevice(code)
    if (!manifestPayload) {
      return res.status(404).json({ error: 'Display nicht gefunden' })
    }

    return res.json({
      primary: true,
      route: '/api/display-runtime/:deviceCode/manifest',
      displayManifest: manifestPayload,
      runtime: manifestPayload.runtime,
    })
  } catch (error) {
    console.error('GET DISPLAY MANIFEST ERROR:', error)
    return res.status(500).json({ error: 'Display-Manifest konnte nicht geladen werden' })
  }
})

router.get('/:deviceCode/debug', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) {
      return res.status(400).json({ error: 'deviceCode fehlt' })
    }

    const screenDevice = await prisma.screenDevice.findFirst({
      where: {
        deviceCode: {
          equals: code,
          mode: 'insensitive',
        },
      },
      select: {
        id: true,
        tenantId: true,
        name: true,
        deviceCode: true,
      },
    })

    const runtime = await buildDisplayRuntimeForDevice(code)
    const manifestPayload = runtime ? await buildDisplayManifestForDevice(code) : null

    return res.json({
      lookup: {
        inputDeviceCode: req.params.deviceCode,
        normalizedDeviceCode: code,
      },
      found: {
        display: Boolean(screenDevice),
        tenant: Boolean(runtime?.tenantId),
        products: (runtime?.products || []).length > 0,
        layout: Boolean(runtime?.layoutSettings),
        branding: Boolean(runtime?.brandingSettings),
        manifest: Boolean(manifestPayload),
      },
      screenDevice: screenDevice
        ? {
            id: screenDevice.id,
            name: screenDevice.name,
            tenantId: screenDevice.tenantId,
            deviceCode: screenDevice.deviceCode,
          }
        : null,
      runtime: runtime
        ? {
            tenantId: runtime.tenantId,
            productCount: runtime.products.length,
            categoryCount: runtime.categories.length,
            template: runtime.template,
            publishedVersion: runtime.publishedVersion,
          }
        : null,
      manifest: manifestPayload
        ? {
            manifestVersion: manifestPayload.manifestVersion,
            productCount: manifestPayload.products.length,
            categoryCount: manifestPayload.categories.length,
          }
        : null,
    })
  } catch (error) {
    console.error('GET DISPLAY RUNTIME DEBUG ERROR:', error)
    return res.status(500).json({ error: 'Display-Runtime-Debug konnte nicht geladen werden' })
  }
})

router.get('/:deviceCode', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) {
      return res.status(400).json({ error: 'deviceCode fehlt' })
    }
    const runtime = await buildDisplayRuntimeForDevice(code)
    if (!runtime) {
      return res.status(404).json({ error: 'Display nicht gefunden' })
    }
    return res.json(runtime)
  } catch (error) {
    console.error('GET DISPLAY RUNTIME ERROR:', error)
    return res.status(500).json({ error: 'Display-Konfiguration konnte nicht geladen werden' })
  }
})

router.patch(
  '/:deviceCode/performance-mode',
  requirePermission(PermissionKey.SETTINGS_WRITE),
  async (req, res) => {
    try {
      const code = normalizeCodeParam(req.params.deviceCode)
      const performanceMode = parsePerformanceMode((req.body as { performanceMode?: unknown }).performanceMode)
      if (!code || !performanceMode) {
        return res.status(400).json({ error: 'deviceCode oder performanceMode fehlt/ungueltig' })
      }

      const screenDevice = await prisma.screenDevice.findUnique({
        where: { deviceCode: code },
        select: { id: true, notes: true },
      })

      if (screenDevice) {
        const updatedNotes = applyPerformanceModeToNotes(screenDevice.notes, performanceMode)
        await prisma.screenDevice.update({
          where: { id: screenDevice.id },
          data: { notes: updatedNotes },
        })
        return res.json({ ok: true, deviceCode: code, performanceMode })
      }

      const orderDisplay = await prisma.orderDisplay.findUnique({
        where: { displayCode: code },
        select: { id: true, notes: true },
      })
      if (!orderDisplay) {
        return res.status(404).json({ error: 'Display nicht gefunden' })
      }
      const updatedNotes = applyPerformanceModeToNotes(orderDisplay.notes, performanceMode)
      await prisma.orderDisplay.update({
        where: { id: orderDisplay.id },
        data: { notes: updatedNotes },
      })
      return res.json({ ok: true, deviceCode: code, performanceMode })
    } catch (error) {
      console.error('SET DISPLAY PERFORMANCE MODE ERROR:', error)
      return res.status(500).json({ error: 'Performance-Profil konnte nicht gesetzt werden' })
    }
  }
)

router.post('/:deviceCode/heartbeat', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) {
      return res.status(400).json({ error: 'deviceCode fehlt' })
    }

    const now = new Date()
    const diagnostics = parseDiagnostics((req.body as { diagnostics?: unknown } | undefined)?.diagnostics)
    const screenDevice = await prisma.screenDevice.findUnique({
      where: { deviceCode: code },
      select: {
        id: true,
        isActive: true,
        notes: true,
      },
    })

    if (screenDevice) {
      await prisma.screenDevice.update({
        where: { id: screenDevice.id },
        data: {
          lastSeenAt: now,
          notes: diagnostics ? applyDiagnosticsToNotes(screenDevice.notes, diagnostics) : undefined,
        },
      })

      return res.json({
        status: screenDevice.isActive ? 'online' : 'inactive',
        serverTime: now.toISOString(),
        displayId: screenDevice.id,
        displayType: 'MENU',
        recoveryHints: [
          'Bei Offline-Phasen letzte Konfiguration aus dem Cache nutzen.',
          'Heartbeat-Intervall auf 20-30 Sekunden setzen.',
        ],
      })
    }

    const orderDisplay = await prisma.orderDisplay.findUnique({
      where: { displayCode: code },
      select: {
        id: true,
        isActive: true,
        displayRole: true,
        notes: true,
      },
    })

    if (!orderDisplay) {
      return res.status(404).json({ error: 'Display nicht gefunden' })
    }

    await prisma.orderDeskDeviceBinding.updateMany({
      where: {
        displayId: orderDisplay.id,
        isActive: true,
      },
      data: {
        lastSeenAt: now,
      },
    })

    if (diagnostics) {
      await prisma.orderDisplay.update({
        where: { id: orderDisplay.id },
        data: {
          notes: applyDiagnosticsToNotes(orderDisplay.notes, diagnostics),
        },
      })
    }

    return res.json({
      status: orderDisplay.isActive ? 'online' : 'inactive',
      serverTime: now.toISOString(),
      displayId: orderDisplay.id,
      displayType:
        orderDisplay.displayRole === 'KITCHEN'
          ? 'KITCHEN'
          : orderDisplay.displayRole === 'PICKUP'
            ? 'CUSTOMER'
            : 'ORDER',
      recoveryHints: [
        'Bei kurzen Ausfaellen automatische Reconnect-Logik aktiv lassen.',
        'Beim Start zuerst Runtime-Config neu laden, dann Feed pollen.',
      ],
    })
  } catch (error) {
    console.error('DISPLAY HEARTBEAT ERROR:', error)
    return res.status(500).json({ error: 'Heartbeat konnte nicht verarbeitet werden' })
  }
})

export default router
