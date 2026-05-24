import { DisplayDeviceStatus, DisplayPairingStatus } from '@prisma/client'
import { Router } from 'express'
import { createHash } from 'crypto'
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

function createContentVersion(payload: unknown) {
  return createHash('sha1').update(JSON.stringify(payload)).digest('hex')
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
            deviceCode: true,
          },
        },
      },
    })

    if (!session) {
      console.info('DISPLAY PAIRING POLL', { found: false })
      return res.status(404).json({ status: 'expired', state: 'EXPIRED', message: 'Code nicht gefunden.' })
    }

    if (session.status === DisplayPairingStatus.EXPIRED || session.expiresAt.getTime() <= Date.now()) {
      if (session.status !== DisplayPairingStatus.EXPIRED) {
        await prisma.displayPairingSession.update({
          where: { id: session.id },
          data: { status: DisplayPairingStatus.EXPIRED },
        })
      }
      return res.status(410).json({ status: 'expired', state: 'EXPIRED', message: 'Code abgelaufen.' })
    }

    if (session.status !== DisplayPairingStatus.CLAIMED) {
      console.info('DISPLAY PAIRING POLL', {
        found: true,
        sessionId: session.id,
        state: 'PENDING',
      })
      return res.json({ status: 'pending', state: 'PENDING' })
    }

    if (!session.device) {
      console.info('DISPLAY PAIRING POLL', {
        found: true,
        sessionId: session.id,
        state: 'CLAIMED_BUT_MISSING_DEVICE',
      })
      return res.json({ status: 'pending', state: 'PENDING' })
    }

    let oneTimeToken = claimedDeviceTokenBySession.get(session.id) ?? null
    if (!oneTimeToken) {
      // Recovery path: if backend restarted after claim, recreate a device token once.
      oneTimeToken = createToken(32)
      await prisma.displayDevice.update({
        where: { id: session.device.id },
        data: { deviceTokenHash: hashToken(oneTimeToken) },
      })
      claimedDeviceTokenBySession.set(session.id, oneTimeToken)
      console.info('DISPLAY PAIRING POLL RECOVERY TOKEN CREATED', {
        sessionId: session.id,
        deviceId: session.device.id,
      })
    }

    return res.json({
      status: 'connected',
      state: 'CLAIMED',
      deviceToken: oneTimeToken,
      deviceId: session.device.id,
      tenantId: session.device.tenantId,
      screenId: session.device.screenId,
      displayId: session.device.id,
      displayCode: session.device.deviceCode,
      deviceCode: session.device.deviceCode,
      manifestEndpoint: `/api/display-runtime/${session.device.deviceCode}/manifest`,
      apiBaseUrl: process.env.API_BASE_URL || 'https://api.klarando.com',
      authToken: oneTimeToken,
    })
  } catch (error) {
    console.error('DISPLAY PAIRING STATUS ERROR:', error)
    return res.status(500).json({ message: 'Pairing-Status konnte nicht geladen werden.' })
  }
})

router.get('/content', async (req, res) => {
  try {
    console.info('DISPLAY CONTENT LOAD START')
    const deviceToken = parseBearerToken(req.header('authorization') ?? undefined)
    console.info('DISPLAY CONTENT TOKEN PRESENT', Boolean(deviceToken))
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
    console.info('DISPLAY CONTENT DISPLAY ID', device.id)
    console.info('DISPLAY CONTENT TENANT ID', device.tenantId)

    if (device.status === DisplayDeviceStatus.REVOKED || device.revokedAt) {
      return res.status(403).json({ message: 'Gerät wurde getrennt.' })
    }

    let resolvedScreen = device.screen
    if (!resolvedScreen || !resolvedScreen.isActive) {
      const fallbackScreen = await prisma.displayScreen.findFirst({
        where: { tenantId: device.tenantId, isActive: true },
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
        orderBy: { updatedAt: 'desc' },
      })
      if (fallbackScreen) {
        await prisma.displayDevice.update({
          where: { id: device.id },
          data: { screenId: fallbackScreen.id },
        })
        resolvedScreen = fallbackScreen
        console.info('DISPLAY CONTENT AUTO SCREEN LINKED', {
          deviceId: device.id,
          fallbackScreenId: fallbackScreen.id,
        })
      }
    }
    if (!resolvedScreen || !resolvedScreen.isActive) {
      return res.status(409).json({ message: 'Display noch nicht eingerichtet.' })
    }

    const playlist = resolvedScreen.playlists[0] ?? null
    const now = new Date()
    const items = (playlist?.items ?? []).filter((item) => {
      if (item.activeFrom && now < item.activeFrom) return false
      if (item.activeUntil && now > item.activeUntil) return false
      return true
    })

    const screenProductSettings = await prisma.screenProductSetting.findMany({
      where: { tenantId: device.tenantId, showOnScreen: true },
      select: {
        productId: true,
        displayCategory: true,
        sortOrder: true,
        isFeatured: true,
      },
      orderBy: { sortOrder: 'asc' },
    })
    const productSettingById = new Map(screenProductSettings.map((entry) => [entry.productId, entry]))
    const configuredProductIds = new Set(screenProductSettings.map((entry) => entry.productId))

    const allTenantProducts = await prisma.product.findMany({
      where: {
        tenantId: device.tenantId,
        available: true,
      },
      select: {
        id: true,
        name: true,
        price: true,
        productNumber: true,
        category: {
          select: {
            id: true,
            name: true,
          },
        },
      },
      orderBy: [{ category: { name: 'asc' } }, { name: 'asc' }],
    })

    const filteredProducts = allTenantProducts.filter((product) => {
      if (configuredProductIds.size === 0) return true
      return configuredProductIds.has(product.id)
    })

    const normalizedProducts = filteredProducts
      .map((product) => {
        const settings = productSettingById.get(product.id)
        const categoryName = settings?.displayCategory || product.category?.name || 'Weitere'
        return {
          id: product.id,
          name: product.name,
          price: Number(product.price),
          productNumber: product.productNumber,
          categoryName,
          sortOrder: settings?.sortOrder ?? 9999,
          isFeatured: settings?.isFeatured ?? false,
        }
      })
      .sort((left, right) => {
        if (left.sortOrder !== right.sortOrder) return left.sortOrder - right.sortOrder
        if (left.categoryName !== right.categoryName) return left.categoryName.localeCompare(right.categoryName, 'de')
        return left.name.localeCompare(right.name, 'de')
      })

    const categories = Array.from(new Set(normalizedProducts.map((entry) => entry.categoryName)))
    const tenantScreenDevices = await prisma.displayDevice.findMany({
      where: {
        tenantId: device.tenantId,
        screenId: resolvedScreen.id,
        revokedAt: null,
      },
      select: {
        id: true,
        lastSeenAt: true,
      },
      orderBy: { createdAt: 'asc' },
    })
    const activeWindowMs = 3 * 60 * 1000
    const nowMs = Date.now()
    const activeDevices = tenantScreenDevices.filter((entry) => {
      if (entry.id === device.id) return true
      if (!entry.lastSeenAt) return false
      return nowMs - entry.lastSeenAt.getTime() <= activeWindowMs
    })
    const wallDevices = activeDevices.length > 0 ? activeDevices : tenantScreenDevices
    const connectedDisplayCount = Math.max(1, wallDevices.length)
    const configuredWallDisplayCount = Math.max(
      1,
      Math.min(
        8,
        Number(
          items
            .map((entry) =>
              entry.config && typeof entry.config === 'object'
                ? (entry.config as Record<string, unknown>).wallDisplayCount
                : undefined
            )
            .find((entry) => typeof entry === 'number' && Number.isFinite(entry)) ?? connectedDisplayCount
        )
      )
    )
    const displayCount = configuredWallDisplayCount
    const displayIndex = Math.max(0, wallDevices.findIndex((entry) => entry.id === device.id))
    const perDisplay = Math.max(1, Math.ceil(normalizedProducts.length / displayCount))
    const start = Math.min(normalizedProducts.length, displayIndex * perDisplay)
    const end = Math.min(normalizedProducts.length, start + perDisplay)
    const distributedProducts = normalizedProducts.slice(start, end)

    const baseConfig = await prisma.screenSetting.upsert({
      where: { tenantId: device.tenantId },
      update: {},
      create: { tenantId: device.tenantId },
    })
    const screenDeviceOverride = await prisma.screenDevice.findFirst({
      where: { tenantId: device.tenantId, isActive: true, name: resolvedScreen.name },
      select: {
        columnCountOverride: true,
        backgroundMediaUrlOverride: true,
      },
    })
    const screenConfig = {
      backgroundMode: baseConfig.backgroundMode,
      backgroundValue: baseConfig.backgroundValue || resolvedScreen.backgroundColor,
      backgroundMediaUrl: screenDeviceOverride?.backgroundMediaUrlOverride ?? baseConfig.backgroundMediaUrl,
      cardPadding: baseConfig.cardPadding,
      productFontSize: baseConfig.productFontSize,
      categoryFontSize: baseConfig.categoryFontSize,
      ingredientFontSize: baseConfig.ingredientFontSize,
      priceFontSize: baseConfig.priceFontSize,
      defaultColumnCount: Math.max(
        1,
        Math.min(8, Number(screenDeviceOverride?.columnCountOverride ?? baseConfig.defaultColumnCount ?? 2))
      ),
      showPrices: baseConfig.showPrices,
      showCategoryOnCard: baseConfig.showCategoryOnCard,
      fontFamily: baseConfig.fontFamily,
    }
    const pageDurationSec = Math.max(
      8,
      Math.min(
        18,
        Number(
          (playlist?.items ?? [])
            .map((item) => item.durationSeconds)
            .find((entry) => Number.isFinite(entry) && entry > 0) ?? 10
        )
      )
    )
    const serverTimeMs = Date.now()
    console.info('DISPLAY CONTENT PRODUCTS COUNT', distributedProducts.length)

    const responsePayload = {
      device: {
        id: device.id,
        name: device.name,
        status: device.status,
        appVersion: device.appVersion,
      },
      screen: {
        id: resolvedScreen.id,
        name: resolvedScreen.name,
        orientation: resolvedScreen.orientation,
        resolutionPreset: resolvedScreen.resolutionPreset,
        backgroundColor: resolvedScreen.backgroundColor,
        accentColor: resolvedScreen.accentColor,
        layoutType: resolvedScreen.layoutType,
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
      categories,
      products: distributedProducts,
      screenConfig,
      layout: {
        displayCount,
        connectedDisplayCount,
        displayIndex,
        productsTotal: normalizedProducts.length,
        productsOnDisplay: distributedProducts.length,
      },
      sync: {
        mode: 'SERVER_TIME',
        serverTimeMs,
        pageDurationSec,
        wallSessionId: `${resolvedScreen.id}:${playlist?.id ?? 'default'}`,
      },
      tenantBranding: {
        tenantId: device.tenantId,
      },
      updatedAt: device.updatedAt.toISOString(),
    }
    const contentVersion = createContentVersion({
      deviceId: device.id,
      screenId: resolvedScreen.id,
      playlistId: playlist?.id ?? null,
      updatedAt: responsePayload.updatedAt,
      productsTotal: normalizedProducts.length,
      productsOnDisplay: distributedProducts.length,
      displayIndex,
      displayCount,
      itemIds: items.map((item) => item.id),
      productIds: distributedProducts.map((product) => product.id),
      screenConfig,
      sync: responsePayload.sync,
    })
    const etagValue = `"${contentVersion}"`
    const requestEtag = req.header('if-none-match')?.trim()

    res.setHeader('Cache-Control', 'private, no-cache, must-revalidate')
    res.setHeader('ETag', etagValue)
    res.setHeader('X-Display-Content-Version', contentVersion)

    if (requestEtag && requestEtag === etagValue) {
      return res.status(304).end()
    }

    return res.json(responsePayload)
  } catch (error) {
    console.error('DISPLAY CONTENT ERROR', error)
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
