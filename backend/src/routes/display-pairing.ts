import crypto from 'crypto'
import { DisplayPairingStatus, PermissionKey } from '@prisma/client'
import { Router } from 'express'
import { signDisplayDeviceToken, verifyDisplayDeviceToken } from '../auth/display-device-token'
import { writeAuditLog } from '../lib/audit'
import { prisma } from '../lib/prisma'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { requirePermission } from '../middleware/auth'

const router = Router()

const DISPLAY_PAIRING_MODULE = 'display_pairing'
const PAIRING_EXPIRES_MINUTES = 5

function normalizeText(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function hashToken(value: string) {
  return crypto.createHash('sha256').update(value).digest('hex')
}

function createPairingCode() {
  return Math.floor(100000 + Math.random() * 900000).toString()
}

function resolvePublicApiBaseUrl() {
  const candidate =
    normalizeText(process.env.PUBLIC_API_BASE_URL) ??
    normalizeText(process.env.NEXT_PUBLIC_API_BASE_URL) ??
    normalizeText(process.env.NEXT_PUBLIC_API_URL)
  if (candidate) {
    return candidate.replace(/\/+$/, '')
  }
  return 'https://api.klarando.com'
}

async function expireOutdatedSessions() {
  await prisma.displayPairingSession.updateMany({
    where: {
      status: DisplayPairingStatus.PENDING,
      expiresAt: {
        lte: new Date(),
      },
    },
    data: {
      status: DisplayPairingStatus.EXPIRED,
    },
  })
}

function parseBearerToken(authHeader: string | undefined) {
  if (!authHeader) {
    return null
  }
  const [scheme, token] = authHeader.trim().split(/\s+/, 2)
  if (!scheme || !token || scheme.toLowerCase() !== 'bearer') {
    return null
  }
  return token.trim()
}

router.post('/display/pairing/session', async (req, res) => {
  try {
    await expireOutdatedSessions()

    const payload = req.body as {
      deviceName?: string | null
      appVersion?: string | null
      platform?: string | null
    }

    const deviceName = normalizeText(payload.deviceName) ?? 'Klarando Display'
    const appVersion = normalizeText(payload.appVersion)
    const platform = normalizeText(payload.platform) ?? 'android-tv'

    const session = await prisma.displayPairingSession.create({
      data: {
        pairingTokenHash: hashToken(crypto.randomBytes(32).toString('hex')),
        pairingCode: createPairingCode(),
        expiresAt: new Date(Date.now() + PAIRING_EXPIRES_MINUTES * 60 * 1000),
        deviceName,
        appVersion,
        platform,
      },
    })

    const pairingToken = signDisplayDeviceToken({
      sid: session.id,
      did: null,
      kind: 'PAIRING',
      expiresAtMs: session.expiresAt.getTime(),
    })

    await prisma.displayPairingSession.update({
      where: { id: session.id },
      data: {
        pairingTokenHash: hashToken(pairingToken),
      },
    })

    const qrPayload = {
      type: 'DISPLAY_PAIRING',
      pairingToken,
      pairingCode: session.pairingCode,
      apiBaseUrl: resolvePublicApiBaseUrl(),
      expiresAt: session.expiresAt.toISOString(),
    }

    return res.status(201).json({
      pairingToken,
      pairingCode: session.pairingCode,
      qrPayload,
      expiresAt: session.expiresAt.toISOString(),
    })
  } catch (error) {
    console.error('CREATE DISPLAY PAIRING SESSION ERROR:', error)
    return res.status(500).json({
      code: 'DISPLAY_PAIRING_CREATE_FAILED',
      message: 'Pairing-Session konnte nicht erstellt werden.',
    })
  }
})

router.get('/display/pairing/session/:pairingToken', async (req, res) => {
  try {
    await expireOutdatedSessions()

    const token = normalizeText(req.params.pairingToken)
    if (!token) {
      return res.status(400).json({ code: 'PAIRING_TOKEN_MISSING', message: 'pairingToken fehlt.' })
    }

    const tokenPayload = verifyDisplayDeviceToken(token)
    if (!tokenPayload || tokenPayload.kind !== 'PAIRING') {
      return res.status(401).json({ code: 'PAIRING_TOKEN_INVALID', message: 'Pairing-Token ist ungültig.' })
    }

    const session = await prisma.displayPairingSession.findUnique({
      where: { id: tokenPayload.sid },
      include: {
        device: {
          select: {
            id: true,
            screenId: true,
            tenantId: true,
          },
        },
      },
    })

    if (!session) {
      return res.status(404).json({ code: 'PAIRING_SESSION_NOT_FOUND', message: 'Pairing-Session wurde nicht gefunden.' })
    }

    if (session.expiresAt.getTime() <= Date.now() && session.status === DisplayPairingStatus.PENDING) {
      await prisma.displayPairingSession.update({
        where: { id: session.id },
        data: { status: DisplayPairingStatus.EXPIRED },
      })
      return res.status(410).json({ code: 'PAIRING_EXPIRED', message: 'Code abgelaufen.' })
    }

    if (session.status !== DisplayPairingStatus.CLAIMED || !session.device) {
      return res.json({ status: 'PENDING' })
    }

    const deviceToken = signDisplayDeviceToken({
      sid: session.id,
      did: session.device.id,
      kind: 'SESSION',
      expiresAtMs: Date.now() + 180 * 24 * 60 * 60 * 1000,
    })

    return res.json({
      status: 'CLAIMED',
      deviceToken,
      displayId: session.device.id,
      screenId: session.device.screenId,
      tenantId: session.device.tenantId,
    })
  } catch (error) {
    console.error('GET DISPLAY PAIRING SESSION STATUS ERROR:', error)
    return res.status(500).json({
      code: 'DISPLAY_PAIRING_STATUS_FAILED',
      message: 'Pairing-Status konnte nicht geladen werden.',
    })
  }
})

router.post('/display/content', async (_req, res) => {
  return res.status(405).json({ code: 'METHOD_NOT_ALLOWED', message: 'Bitte GET verwenden.' })
})

router.get('/display/content', async (req, res) => {
  try {
    const token = parseBearerToken(req.header('authorization') ?? undefined)
    if (!token) {
      return res.status(401).json({ code: 'DEVICE_TOKEN_MISSING', message: 'Device-Token fehlt.' })
    }
    const payload = verifyDisplayDeviceToken(token)
    if (!payload || payload.kind !== 'SESSION' || !payload.did) {
      return res.status(401).json({ code: 'DEVICE_TOKEN_INVALID', message: 'Device-Token ist ungültig.' })
    }

    const device = await prisma.displayDevice.findUnique({
      where: { id: payload.did },
      include: {
        screen: {
          select: {
            id: true,
            deviceCode: true,
            name: true,
            isActive: true,
            tenantId: true,
          },
        },
      },
    })

    if (!device || device.revokedAt) {
      return res.status(401).json({ code: 'DEVICE_REVOKED', message: 'Display-Gerät ist nicht mehr aktiv.' })
    }
    if (!device.screen || !device.screen.isActive) {
      return res.status(409).json({ code: 'SCREEN_NOT_AVAILABLE', message: 'Bildschirm ist aktuell nicht verfügbar.' })
    }

    return res.json({
      displayId: device.id,
      tenantId: device.tenantId,
      screenId: device.screen.id,
      screenName: device.screen.name,
      contentUrl: `/screen/${device.screen.deviceCode}`,
      updatedAt: device.updatedAt.toISOString(),
    })
  } catch (error) {
    console.error('GET DISPLAY CONTENT ERROR:', error)
    return res.status(500).json({
      code: 'DISPLAY_CONTENT_FAILED',
      message: 'Display-Inhalte konnten nicht geladen werden.',
    })
  }
})

router.post('/display/heartbeat', async (req, res) => {
  try {
    const token = parseBearerToken(req.header('authorization') ?? undefined)
    if (!token) {
      return res.status(401).json({ code: 'DEVICE_TOKEN_MISSING', message: 'Device-Token fehlt.' })
    }
    const payload = verifyDisplayDeviceToken(token)
    if (!payload || payload.kind !== 'SESSION' || !payload.did) {
      return res.status(401).json({ code: 'DEVICE_TOKEN_INVALID', message: 'Device-Token ist ungültig.' })
    }

    const body = req.body as { appVersion?: string | null; screenStatus?: string | null }
    const appVersion = normalizeText(body.appVersion)

    const device = await prisma.displayDevice.findUnique({ where: { id: payload.did } })
    if (!device || device.revokedAt) {
      return res.status(401).json({ code: 'DEVICE_REVOKED', message: 'Display-Gerät ist nicht mehr aktiv.' })
    }

    await prisma.displayDevice.update({
      where: { id: device.id },
      data: {
        lastSeenAt: new Date(),
        appVersion: appVersion ?? device.appVersion,
        status: 'ACTIVE',
      },
    })

    return res.json({ ok: true, serverTime: new Date().toISOString() })
  } catch (error) {
    console.error('DISPLAY HEARTBEAT ERROR:', error)
    return res.status(500).json({
      code: 'DISPLAY_HEARTBEAT_FAILED',
      message: 'Heartbeat konnte nicht gespeichert werden.',
    })
  }
})

router.post('/admin/displays/pairing/claim', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    await expireOutdatedSessions()

    const payload = req.body as {
      pairingToken?: string | null
      pairingCode?: string | null
      tenantId?: string | null
      screenId?: string | null
      displayName?: string | null
    }

    const pairingToken = normalizeText(payload.pairingToken)
    const pairingCode = normalizeText(payload.pairingCode)
    const tenantIdInput = normalizeText(payload.tenantId)
    if ((!pairingToken && !pairingCode) || !tenantIdInput) {
      return res.status(400).json({
        code: 'PAIRING_INPUT_INVALID',
        message: 'Bitte Pairing-Token oder Pairing-Code sowie eine Filiale angeben.',
      })
    }

    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string

    let session = null as Awaited<ReturnType<typeof prisma.displayPairingSession.findUnique>>
    if (pairingToken) {
      const tokenPayload = verifyDisplayDeviceToken(pairingToken)
      if (!tokenPayload || tokenPayload.kind !== 'PAIRING') {
        return res.status(401).json({ code: 'PAIRING_TOKEN_INVALID', message: 'Code ungültig oder abgelaufen.' })
      }
      session = await prisma.displayPairingSession.findUnique({ where: { id: tokenPayload.sid } })
    } else if (pairingCode) {
      session = await prisma.displayPairingSession.findFirst({
        where: {
          pairingCode,
          status: DisplayPairingStatus.PENDING,
        },
        orderBy: { createdAt: 'desc' },
      })
    }

    if (!session) {
      return res.status(404).json({
        code: 'PAIRING_SESSION_NOT_FOUND',
        message: 'Pairing-Code wurde nicht gefunden.',
      })
    }
    if (session.status !== DisplayPairingStatus.PENDING) {
      return res.status(409).json({ code: 'PAIRING_ALREADY_USED', message: 'Code bereits verwendet.' })
    }
    if (session.expiresAt.getTime() <= Date.now()) {
      await prisma.displayPairingSession.update({
        where: { id: session.id },
        data: { status: DisplayPairingStatus.EXPIRED },
      })
      return res.status(410).json({ code: 'PAIRING_EXPIRED', message: 'Code abgelaufen.' })
    }
    if (pairingToken && session.pairingTokenHash !== hashToken(pairingToken)) {
      return res.status(401).json({ code: 'PAIRING_TOKEN_INVALID', message: 'Code ungültig oder abgelaufen.' })
    }

    const requestedScreenId = normalizeText(payload.screenId)
    let screen = null as null | { id: string; tenantId: string; name: string }
    if (requestedScreenId) {
      screen = await prisma.screenDevice.findFirst({
        where: {
          id: requestedScreenId,
          tenantId,
          isActive: true,
        },
        select: { id: true, tenantId: true, name: true },
      })
      if (!screen) {
        return res.status(404).json({ code: 'SCREEN_NOT_FOUND', message: 'Bildschirm nicht gefunden.' })
      }
    } else {
      screen = await prisma.screenDevice.findFirst({
        where: {
          tenantId,
          isActive: true,
        },
        orderBy: { createdAt: 'asc' },
        select: { id: true, tenantId: true, name: true },
      })
      if (!screen) {
        return res.status(409).json({ code: 'SCREEN_REQUIRED', message: 'Bitte zuerst einen aktiven Bildschirm anlegen.' })
      }
    }

    const displayName = normalizeText(payload.displayName) ?? session.deviceName ?? `Display ${screen.name}`

    const deviceToken = signDisplayDeviceToken({
      sid: session.id,
      did: null,
      kind: 'SESSION',
      expiresAtMs: Date.now() + 180 * 24 * 60 * 60 * 1000,
    })

    const device = await prisma.displayDevice.create({
      data: {
        tenantId,
        screenId: screen.id,
        pairingSessionId: session.id,
        name: displayName,
        platform: session.platform,
        appVersion: session.appVersion,
        status: 'ACTIVE',
        deviceTokenHash: hashToken(deviceToken),
        lastSeenAt: null,
      },
    })

    await prisma.displayPairingSession.update({
      where: { id: session.id },
      data: {
        status: DisplayPairingStatus.CLAIMED,
        claimedAt: new Date(),
        claimedByUserId: req.authUser?.id ?? null,
        tenantId,
        screenId: screen.id,
        displayName,
        deviceId: device.id,
      },
    })

    await writeAuditLog({
      req,
      module: DISPLAY_PAIRING_MODULE,
      action: 'display_pairing_claimed',
      targetType: 'display_pairing_session',
      targetId: session.id,
      tenantId,
      metadata: {
        screenId: screen.id,
        displayId: device.id,
        displayName,
      },
    })

    return res.json({
      display: {
        id: device.id,
        tenantId,
        screenId: screen.id,
        name: displayName,
        status: device.status,
      },
      message: 'Display erfolgreich verbunden.',
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ code: 'NO_PERMISSION', message: scopeError.message })
    }
    console.error('CLAIM DISPLAY PAIRING ERROR:', error)
    return res.status(500).json({ code: 'DISPLAY_PAIRING_CLAIM_FAILED', message: 'Display konnte nicht verbunden werden.' })
  }
})

export default router
