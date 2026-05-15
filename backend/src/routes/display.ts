import { DisplayDeviceStatus, DisplayPairingStatus } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { createPairingCode, createToken, hashToken, verifyToken } from '../lib/display-security'

const router = Router()
const PAIRING_TTL_MS = 5 * 60 * 1000

const claimedDeviceTokenBySession = new Map<string, string>()

function normalizeText(value: unknown) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function parseBearerToken(authHeader: string | undefined) {
  if (!authHeader) return null
  const [scheme, token] = authHeader.trim().split(/\s+/, 2)
  if (!scheme || !token || scheme.toLowerCase() !== 'bearer') return null
  return token.trim()
}

async function expireOutdatedSessions() {
  await prisma.displayPairingSession.updateMany({
    where: {
      status: DisplayPairingStatus.PENDING,
      expiresAt: { lte: new Date() },
    },
    data: { status: DisplayPairingStatus.EXPIRED },
  })
}

router.post('/pairing/session', async (req, res) => {
  try {
    await expireOutdatedSessions()

    const body = req.body as { deviceName?: string | null; appVersion?: string | null; platform?: string | null }
    const deviceName = normalizeText(body.deviceName) ?? 'Klarando Display'
    const platform = normalizeText(body.platform) ?? 'android-tv'
    const appVersion = normalizeText(body.appVersion)

    const pairingToken = createToken(32)
    const pairingCode = createPairingCode()
    const expiresAt = new Date(Date.now() + PAIRING_TTL_MS)

    const session = await prisma.displayPairingSession.create({
      data: {
        pairingTokenHash: hashToken(pairingToken),
        pairingCode,
        status: DisplayPairingStatus.PENDING,
        expiresAt,
        deviceName,
        platform,
        appVersion,
      },
    })

    return res.status(201).json({
      pairingToken,
      pairingCode,
      qrPayload: {
        type: 'DISPLAY_PAIRING',
        pairingToken,
        pairingCode,
        apiBaseUrl: 'https://api.klarando.com',
        expiresAt: expiresAt.toISOString(),
      },
      expiresAt: expiresAt.toISOString(),
      sessionId: session.id,
    })
  } catch (error) {
    console.error('DISPLAY PAIRING SESSION CREATE ERROR:', error)
    return res.status(500).json({ message: 'Pairing-Session konnte nicht erstellt werden.' })
  }
})

router.get('/pairing/session/:pairingToken', async (req, res) => {
  try {
    await expireOutdatedSessions()

    const pairingToken = normalizeText(req.params.pairingToken)
    if (!pairingToken) {
      return res.status(400).json({ message: 'pairingToken fehlt.' })
    }

    const session = await prisma.displayPairingSession.findFirst({
      where: {
        pairingTokenHash: hashToken(pairingToken),
      },
      include: {
        device: {
          select: {
            id: true,
            tenantId: true,
            screenId: true,
          },
        },
      },
    })

    if (!session) {
      return res.status(404).json({ status: 'EXPIRED', message: 'Code nicht gefunden.' })
    }

    if (session.status === DisplayPairingStatus.EXPIRED || session.expiresAt.getTime() <= Date.now()) {
      if (session.status !== DisplayPairingStatus.EXPIRED) {
        await prisma.displayPairingSession.update({
          where: { id: session.id },
          data: { status: DisplayPairingStatus.EXPIRED },
        })
      }
      return res.status(410).json({ status: 'EXPIRED', message: 'Code abgelaufen.' })
    }

    if (session.status !== DisplayPairingStatus.CLAIMED) {
      return res.json({ status: 'PENDING' })
    }

    const oneTimeToken = claimedDeviceTokenBySession.get(session.id)
    if (!oneTimeToken || !session.device) {
      return res.json({ status: 'PENDING' })
    }

    claimedDeviceTokenBySession.delete(session.id)

    return res.json({
      status: 'CLAIMED',
      deviceToken: oneTimeToken,
      deviceId: session.device.id,
      tenantId: session.device.tenantId,
      screenId: session.device.screenId,
    })
  } catch (error) {
    console.error('DISPLAY PAIRING STATUS ERROR:', error)
    return res.status(500).json({ message: 'Pairing-Status konnte nicht geladen werden.' })
  }
})

router.get('/content', async (req, res) => {
  try {
    const deviceToken = parseBearerToken(req.header('authorization') ?? undefined)
    if (!deviceToken) {
      return res.status(401).json({ message: 'Device-Token fehlt.' })
    }

    const devices = await prisma.displayDevice.findMany({
      where: { revokedAt: null },
      include: {
        screen: {
          include: {
            playlists: {
              where: { isActive: true },
              include: {
                items: { orderBy: { sortOrder: 'asc' } },
              },
              orderBy: { updatedAt: 'desc' },
              take: 1,
            },
          },
        },
      },
    })

    const device = devices.find((entry) => verifyToken(deviceToken, entry.deviceTokenHash))
    if (!device) {
      return res.status(401).json({ message: 'Device-Token ungültig.' })
    }

    if (device.status === DisplayDeviceStatus.REVOKED || device.revokedAt) {
      return res.status(403).json({ message: 'Gerät wurde getrennt.' })
    }

    if (!device.screen || !device.screen.isActive) {
      return res.status(409).json({ message: 'Display noch nicht eingerichtet.' })
    }

    const playlist = device.screen.playlists[0] ?? null
    const now = new Date()
    const items = (playlist?.items ?? []).filter((item) => {
      if (item.activeFrom && now < item.activeFrom) return false
      if (item.activeUntil && now > item.activeUntil) return false
      return true
    })

    res.setHeader('Cache-Control', 'no-store, no-cache, must-revalidate, proxy-revalidate')
    res.setHeader('Pragma', 'no-cache')
    res.setHeader('Expires', '0')

    return res.json({
      device: {
        id: device.id,
        name: device.name,
        status: device.status,
        appVersion: device.appVersion,
      },
      screen: {
        id: device.screen.id,
        name: device.screen.name,
        orientation: device.screen.orientation,
        resolutionPreset: device.screen.resolutionPreset,
        backgroundColor: device.screen.backgroundColor,
        accentColor: device.screen.accentColor,
        layoutType: device.screen.layoutType,
      },
      playlist: playlist
        ? {
            id: playlist.id,
            name: playlist.name,
          }
        : null,
      items: items.map((item) => ({
        id: item.id,
        type: item.type,
        sortOrder: item.sortOrder,
        durationSeconds: item.durationSeconds,
        config: item.config,
      })),
      tenantBranding: {
        tenantId: device.tenantId,
      },
      updatedAt: device.updatedAt.toISOString(),
    })
  } catch (error) {
    console.error('DISPLAY CONTENT ERROR:', error)
    return res.status(500).json({ message: 'Display-Inhalte konnten nicht geladen werden.' })
  }
})

router.post('/heartbeat', async (req, res) => {
  try {
    const deviceToken = parseBearerToken(req.header('authorization') ?? undefined)
    if (!deviceToken) {
      return res.status(401).json({ message: 'Device-Token fehlt.' })
    }

    const devices = await prisma.displayDevice.findMany({ where: { revokedAt: null }, select: { id: true, tenantId: true, deviceTokenHash: true } })
    const device = devices.find((entry) => verifyToken(deviceToken, entry.deviceTokenHash))
    if (!device) {
      return res.status(401).json({ message: 'Device-Token ungültig.' })
    }

    const body = req.body as { appVersion?: string | null; screenStatus?: string | null }
    await prisma.displayDevice.update({
      where: { id: device.id },
      data: {
        status: DisplayDeviceStatus.ONLINE,
        lastSeenAt: new Date(),
        lastIp: req.ip || req.socket.remoteAddress || null,
        appVersion: normalizeText(body.appVersion) ?? undefined,
      },
    })

    return res.json({ ok: true })
  } catch (error) {
    console.error('DISPLAY HEARTBEAT ERROR:', error)
    return res.status(500).json({ message: 'Heartbeat konnte nicht gespeichert werden.' })
  }
})

export function setClaimedDeviceToken(sessionId: string, deviceToken: string) {
  claimedDeviceTokenBySession.set(sessionId, deviceToken)
}

export default router
