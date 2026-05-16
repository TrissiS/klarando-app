import { DisplayDeviceStatus, DisplayPairingStatus, DisplayPlaylistItemType, PermissionKey } from '@prisma/client'
import { Router } from 'express'
import { createToken, hashToken } from '../lib/display-security'
import { prisma } from '../lib/prisma'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { requirePermission } from '../middleware/auth'
import { setClaimedDeviceToken } from './display'

const router = Router()

function normalizeText(value: unknown) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function parseDisplaySelectionRef(value: string | null) {
  if (!value) return null
  const trimmed = value.trim()
  if (!trimmed) return null
  if (trimmed.startsWith('order:')) {
    const id = trimmed.slice('order:'.length).trim()
    return id ? { kind: 'ORDER_DISPLAY' as const, id } : null
  }
  if (trimmed.startsWith('screen:')) {
    const id = trimmed.slice('screen:'.length).trim()
    return id ? { kind: 'SCREEN_DEVICE' as const, id } : null
  }
  return { kind: 'RAW' as const, id: trimmed }
}

router.post('/pairing/claim', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const body = req.body as {
      pairingToken?: string | null
      pairingCode?: string | null
      tenantId?: string | null
      screenId?: string | null
      displayId?: string | null
      displayName?: string | null
    }

    const pairingToken = normalizeText(body.pairingToken)
    const pairingCode = normalizeText(body.pairingCode)
    const tenantIdInput = normalizeText(body.tenantId)
    const screenIdInput = normalizeText(body.screenId)
    const displayIdInput = normalizeText(body.displayId)
    const displayName = normalizeText(body.displayName) ?? normalizeText(body.pairingCode) ?? 'Display'

    console.info('DISPLAY CLAIM REQUEST', {
      tenantIdInput,
      hasPairingToken: Boolean(pairingToken),
      hasPairingCode: Boolean(pairingCode),
      pairingToken: pairingToken ?? null,
      pairingCode: pairingCode ?? null,
      displayIdInput,
      screenIdInput,
    })
    console.info('DISPLAY CLAIM BODY', req.body)

    if (!tenantIdInput || (!pairingToken && !pairingCode)) {
      return res.status(400).json({ message: 'pairingToken oder pairingCode sowie tenantId sind erforderlich.' })
    }

    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string

    let screen = screenIdInput
      ? await prisma.displayScreen.findFirst({
          where: { id: screenIdInput, tenantId, isActive: true },
        })
      : null

    let targetDevice: { id: string; screenId: string | null } | null = null
    if (displayIdInput) {
      const selection = parseDisplaySelectionRef(displayIdInput)
      const selectedRawId = selection?.id ?? displayIdInput
      targetDevice = await prisma.displayDevice.findFirst({
        where: { id: selectedRawId, tenantId, revokedAt: null },
        select: { id: true, screenId: true },
      })
      if (!targetDevice && selection?.kind === 'ORDER_DISPLAY') {
        const legacy = await prisma.orderDisplay.findFirst({
          where: { id: selection.id, tenantId, isActive: true },
          select: { id: true, name: true },
        })
        if (!legacy) {
          return res.status(404).json({ message: 'Ausgewählter Bildschirm wurde nicht gefunden.' })
        }
        screen = await prisma.displayScreen.findFirst({
          where: { tenantId, name: legacy.name, isActive: true },
        })
        if (!screen) {
          screen = await prisma.displayScreen.create({
            data: {
              tenantId,
              name: legacy.name.substring(0, 80),
              layoutType: 'MENU_BOARD',
              orientation: 'LANDSCAPE',
              resolutionPreset: 'FULL_HD',
              backgroundColor: '#111827',
              accentColor: '#ff6b35',
              isActive: true,
            },
          })
        }
      } else if (!targetDevice && selection?.kind === 'SCREEN_DEVICE') {
        const legacy = await prisma.screenDevice.findFirst({
          where: { id: selection.id, tenantId, isActive: true },
          select: { id: true, name: true },
        })
        if (!legacy) {
          return res.status(404).json({ message: 'Ausgewählter Bildschirm wurde nicht gefunden.' })
        }
        screen = await prisma.displayScreen.findFirst({
          where: { tenantId, name: legacy.name, isActive: true },
        })
        if (!screen) {
          screen = await prisma.displayScreen.create({
            data: {
              tenantId,
              name: legacy.name.substring(0, 80),
              layoutType: 'MENU_BOARD',
              orientation: 'LANDSCAPE',
              resolutionPreset: 'FULL_HD',
              backgroundColor: '#111827',
              accentColor: '#ff6b35',
              isActive: true,
            },
          })
        }
      } else if (!targetDevice && selection?.kind === 'RAW') {
        const existingScreen = await prisma.displayScreen.findFirst({
          where: { id: selection.id, tenantId, isActive: true },
        })
        if (existingScreen) {
          screen = existingScreen
        } else {
          return res.status(404).json({ message: 'Ausgewählter Bildschirm wurde nicht gefunden.' })
        }
      }
      if (!screen && targetDevice?.screenId) {
        screen = await prisma.displayScreen.findFirst({
          where: { id: targetDevice.screenId, tenantId, isActive: true },
        })
      }
    }

    if (!screen && !targetDevice) {
      const fallbackScreenName = `Screen ${displayName}`
      screen = await prisma.displayScreen.create({
        data: {
          tenantId,
          name: fallbackScreenName.substring(0, 80),
          layoutType: 'MENU_BOARD',
          orientation: 'LANDSCAPE',
          resolutionPreset: 'FULL_HD',
          backgroundColor: '#111827',
          accentColor: '#ff6b35',
          isActive: true,
        },
      })
    }
    if (!screen) {
      return res.status(400).json({ message: 'Bitte wähle einen Bildschirm aus oder lege zuerst einen neuen an.' })
    }

    const session = pairingToken
      ? await prisma.displayPairingSession.findFirst({ where: { pairingTokenHash: hashToken(pairingToken) } })
      : await prisma.displayPairingSession.findFirst({ where: { pairingCode: pairingCode!, status: DisplayPairingStatus.PENDING } })

    if (!session) {
      console.info('DISPLAY CLAIM SESSION', {
        found: false,
        by: pairingToken ? 'token' : 'code',
        pairingToken: pairingToken ?? null,
        pairingCode: pairingCode ?? null,
      })
      return res.status(404).json({ message: 'Pairing-Code nicht gefunden.' })
    }
    console.info('DISPLAY CLAIM SESSION FOUND', { sessionId: session.id, sessionStatus: session.status })
    console.info('DISPLAY CLAIM SESSION', {
      found: true,
      sessionId: session.id,
      sessionStateBefore: session.status,
      by: pairingToken ? 'token' : 'code',
    })
    console.info('DISPLAY CLAIM BEFORE STATE', { sessionId: session.id, state: session.status })
    if (session.status !== DisplayPairingStatus.PENDING) {
      return res.status(409).json({ message: 'Code bereits verwendet.' })
    }
    if (session.expiresAt.getTime() <= Date.now()) {
      await prisma.displayPairingSession.update({ where: { id: session.id }, data: { status: DisplayPairingStatus.EXPIRED } })
      return res.status(410).json({ message: 'Code abgelaufen.' })
    }

    const deviceToken = createToken(32)
    const device = targetDevice
      ? await prisma.displayDevice.update({
          where: { id: targetDevice.id },
          data: {
            pairingSessionId: session.id,
            screenId: screen.id,
            name: normalizeText(body.displayName) ?? session.deviceName,
            deviceTokenHash: hashToken(deviceToken),
            platform: session.platform,
            appVersion: session.appVersion,
            status: DisplayDeviceStatus.OFFLINE,
            revokedAt: null,
          },
        })
      : await prisma.displayDevice.create({
          data: {
            tenantId,
            pairingSessionId: session.id,
            screenId: screen.id,
            name: normalizeText(body.displayName) ?? session.deviceName,
            deviceTokenHash: hashToken(deviceToken),
            platform: session.platform,
            appVersion: session.appVersion,
            status: DisplayDeviceStatus.OFFLINE,
          },
      })
    console.info('DISPLAY CLAIM DISPLAY FOUND', {
      displayId: device.id,
      tenantId: device.tenantId,
      screenId: device.screenId,
    })
    console.info('DISPLAY CLAIM BINDING CREATED', {
      displayId: device.id,
      pairingSessionId: session.id,
      screenId: device.screenId,
      tenantId: device.tenantId,
    })

    await prisma.displayPairingSession.update({
      where: { id: session.id },
      data: {
        status: DisplayPairingStatus.CLAIMED,
        claimedAt: new Date(),
        claimedByUserId: req.authUser?.id ?? null,
        tenantId,
        screenId: screen.id,
      },
    })

    console.info('DISPLAY CLAIM FINALIZED', {
      sessionId: session.id,
      deviceId: device.id,
      screenId: device.screenId,
      tenantId,
      sessionStateAfter: 'CLAIMED',
    })
    console.info('DISPLAY CLAIM AFTER STATE', {
      sessionId: session.id,
      state: 'CLAIMED',
      claimedAt: new Date().toISOString(),
    })

    setClaimedDeviceToken(session.id, deviceToken)

    return res.json({
      display: {
        id: device.id,
        name: device.name,
        tenantId,
        screenId: device.screenId,
      },
      pairing: {
        sessionId: session.id,
        state: 'CLAIMED',
        claimedAt: new Date().toISOString(),
        hasPairingToken: Boolean(pairingToken),
        hasPairingCode: Boolean(pairingCode),
      },
      message: 'Display erfolgreich verbunden.',
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ message: scopeError.message })
    }
    console.error('ADMIN DISPLAY CLAIM ERROR:', error)
    return res.status(500).json({ message: 'Display konnte nicht verbunden werden.' })
  }
})

router.get('/', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, normalizeText(req.query.tenantId))
    const tenantId = scope.tenantId as string
    const devices = await prisma.displayDevice.findMany({
      where: { tenantId },
      include: { screen: { select: { id: true, name: true } } },
      orderBy: { createdAt: 'desc' },
    })
    return res.json({ devices })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAYS LIST ERROR:', error)
    return res.status(500).json({ message: 'Displays konnten nicht geladen werden.' })
  }
})

router.get('/screens', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, normalizeText(req.query.tenantId))
    const tenantId = scope.tenantId as string
    const screens = await prisma.displayScreen.findMany({
      where: { tenantId },
      orderBy: { createdAt: 'desc' },
    })
    return res.json({ screens })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAY SCREENS LIST ERROR:', error)
    return res.status(500).json({ message: 'Screens konnten nicht geladen werden.' })
  }
})

router.post('/screens', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const body = req.body as {
      tenantId?: string | null
      name?: string | null
      orientation?: 'LANDSCAPE' | 'PORTRAIT'
      resolutionPreset?: 'HD' | 'FULL_HD' | 'FOUR_K' | 'CUSTOM'
      backgroundColor?: string | null
      accentColor?: string | null
      layoutType?: 'MENU_BOARD' | 'SLIDESHOW' | 'PROMO_SPLIT' | 'ORDER_STATUS'
    }
    const tenantIdInput = normalizeText(body.tenantId)
    const name = normalizeText(body.name)
    if (!tenantIdInput || !name) {
      return res.status(400).json({ message: 'tenantId und Name sind erforderlich.' })
    }
    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string
    const screen = await prisma.displayScreen.create({
      data: {
        tenantId,
        name,
        orientation: body.orientation ?? 'LANDSCAPE',
        resolutionPreset: body.resolutionPreset ?? 'FULL_HD',
        backgroundColor: normalizeText(body.backgroundColor) ?? '#111827',
        accentColor: normalizeText(body.accentColor) ?? '#ff6b35',
        layoutType: body.layoutType ?? 'MENU_BOARD',
      },
    })
    return res.status(201).json({ screen })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAY SCREEN CREATE ERROR:', error)
    return res.status(500).json({ message: 'Screen konnte nicht erstellt werden.' })
  }
})

router.put('/screens/:screenId', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const screenId = normalizeText(req.params.screenId)
    const body = req.body as {
      tenantId?: string | null
      name?: string | null
      orientation?: 'LANDSCAPE' | 'PORTRAIT'
      resolutionPreset?: 'HD' | 'FULL_HD' | 'FOUR_K' | 'CUSTOM'
      backgroundColor?: string | null
      accentColor?: string | null
      layoutType?: 'MENU_BOARD' | 'SLIDESHOW' | 'PROMO_SPLIT' | 'ORDER_STATUS'
      isActive?: boolean
    }
    if (!screenId) return res.status(400).json({ message: 'screenId fehlt.' })
    const existing = await prisma.displayScreen.findUnique({ where: { id: screenId }, select: { tenantId: true } })
    if (!existing) return res.status(404).json({ message: 'Screen nicht gefunden.' })
    await resolveTenantScope(req, normalizeText(body.tenantId) ?? existing.tenantId)

    const screen = await prisma.displayScreen.update({
      where: { id: screenId },
      data: {
        name: normalizeText(body.name) ?? undefined,
        orientation: body.orientation ?? undefined,
        resolutionPreset: body.resolutionPreset ?? undefined,
        backgroundColor: normalizeText(body.backgroundColor) ?? undefined,
        accentColor: normalizeText(body.accentColor) ?? undefined,
        layoutType: body.layoutType ?? undefined,
        isActive: typeof body.isActive === 'boolean' ? body.isActive : undefined,
      },
    })
    return res.json({ screen })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAY SCREEN UPDATE ERROR:', error)
    return res.status(500).json({ message: 'Screen konnte nicht aktualisiert werden.' })
  }
})

router.post('/playlists', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const body = req.body as { tenantId?: string | null; screenId?: string | null; name?: string | null; isActive?: boolean }
    const tenantIdInput = normalizeText(body.tenantId)
    const screenId = normalizeText(body.screenId)
    const name = normalizeText(body.name)
    if (!tenantIdInput || !screenId || !name) {
      return res.status(400).json({ message: 'tenantId, screenId und Name sind erforderlich.' })
    }
    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string
    const playlist = await prisma.displayPlaylist.create({
      data: {
        tenantId,
        screenId,
        name,
        isActive: body.isActive ?? true,
      },
    })
    return res.status(201).json({ playlist })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAY PLAYLIST CREATE ERROR:', error)
    return res.status(500).json({ message: 'Playlist konnte nicht erstellt werden.' })
  }
})

router.put('/playlists/:playlistId', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const playlistId = normalizeText(req.params.playlistId)
    const body = req.body as { tenantId?: string | null; name?: string | null; isActive?: boolean }
    if (!playlistId) return res.status(400).json({ message: 'playlistId fehlt.' })
    const existing = await prisma.displayPlaylist.findUnique({ where: { id: playlistId }, select: { tenantId: true } })
    if (!existing) return res.status(404).json({ message: 'Playlist nicht gefunden.' })
    await resolveTenantScope(req, normalizeText(body.tenantId) ?? existing.tenantId)

    const playlist = await prisma.displayPlaylist.update({
      where: { id: playlistId },
      data: {
        name: normalizeText(body.name) ?? undefined,
        isActive: typeof body.isActive === 'boolean' ? body.isActive : undefined,
      },
    })
    return res.json({ playlist })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAY PLAYLIST UPDATE ERROR:', error)
    return res.status(500).json({ message: 'Playlist konnte nicht aktualisiert werden.' })
  }
})

router.get('/playlists', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, normalizeText(req.query.tenantId))
    const tenantId = scope.tenantId as string
    const playlists = await prisma.displayPlaylist.findMany({
      where: { tenantId },
      orderBy: { createdAt: 'desc' },
    })
    return res.json({ playlists })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAY PLAYLISTS LIST ERROR:', error)
    return res.status(500).json({ message: 'Playlists konnten nicht geladen werden.' })
  }
})

router.post('/playlists/:playlistId/items', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const playlistId = normalizeText(req.params.playlistId)
    const body = req.body as {
      tenantId?: string | null
      type?: DisplayPlaylistItemType
      sortOrder?: number
      durationSeconds?: number
      config?: unknown
      activeFrom?: string | null
      activeUntil?: string | null
      weekdays?: unknown
      timeStart?: string | null
      timeEnd?: string | null
    }
    if (!playlistId || !body.type) {
      return res.status(400).json({ message: 'playlistId und type sind erforderlich.' })
    }
    const existing = await prisma.displayPlaylist.findUnique({ where: { id: playlistId }, select: { tenantId: true } })
    if (!existing) return res.status(404).json({ message: 'Playlist nicht gefunden.' })
    await resolveTenantScope(req, normalizeText(body.tenantId) ?? existing.tenantId)

    const item = await prisma.displayPlaylistItem.create({
      data: {
        playlistId,
        type: body.type,
        sortOrder: Number.isFinite(body.sortOrder) ? Math.max(0, Math.trunc(body.sortOrder as number)) : 0,
        durationSeconds: Number.isFinite(body.durationSeconds) ? Math.max(1, Math.trunc(body.durationSeconds as number)) : 10,
        config: body.config && typeof body.config === 'object' ? (body.config as object) : {},
        activeFrom: body.activeFrom ? new Date(body.activeFrom) : null,
        activeUntil: body.activeUntil ? new Date(body.activeUntil) : null,
        weekdays: Array.isArray(body.weekdays) ? body.weekdays : undefined,
        timeStart: normalizeText(body.timeStart),
        timeEnd: normalizeText(body.timeEnd),
      },
    })
    return res.status(201).json({ item })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAY ITEM CREATE ERROR:', error)
    return res.status(500).json({ message: 'Playlist-Element konnte nicht erstellt werden.' })
  }
})

router.put('/playlists/items/:itemId', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const itemId = normalizeText(req.params.itemId)
    const body = req.body as {
      tenantId?: string | null
      sortOrder?: number
      durationSeconds?: number
      config?: unknown
      activeFrom?: string | null
      activeUntil?: string | null
      weekdays?: unknown
      timeStart?: string | null
      timeEnd?: string | null
    }
    if (!itemId) return res.status(400).json({ message: 'itemId fehlt.' })

    const existing = await prisma.displayPlaylistItem.findUnique({
      where: { id: itemId },
      include: { playlist: { select: { tenantId: true } } },
    })
    if (!existing) return res.status(404).json({ message: 'Playlist-Element nicht gefunden.' })
    await resolveTenantScope(req, normalizeText(body.tenantId) ?? existing.playlist.tenantId)

    const item = await prisma.displayPlaylistItem.update({
      where: { id: itemId },
      data: {
        sortOrder: Number.isFinite(body.sortOrder) ? Math.max(0, Math.trunc(body.sortOrder as number)) : undefined,
        durationSeconds: Number.isFinite(body.durationSeconds) ? Math.max(1, Math.trunc(body.durationSeconds as number)) : undefined,
        config: body.config && typeof body.config === 'object' ? (body.config as object) : undefined,
        activeFrom: body.activeFrom ? new Date(body.activeFrom) : body.activeFrom === null ? null : undefined,
        activeUntil: body.activeUntil ? new Date(body.activeUntil) : body.activeUntil === null ? null : undefined,
        weekdays: Array.isArray(body.weekdays) ? body.weekdays : undefined,
        timeStart: normalizeText(body.timeStart) ?? (body.timeStart === null ? null : undefined),
        timeEnd: normalizeText(body.timeEnd) ?? (body.timeEnd === null ? null : undefined),
      },
    })
    return res.json({ item })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAY ITEM UPDATE ERROR:', error)
    return res.status(500).json({ message: 'Playlist-Element konnte nicht aktualisiert werden.' })
  }
})

router.delete('/playlists/items/:itemId', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const itemId = normalizeText(req.params.itemId)
    const tenantIdInput = normalizeText(req.query.tenantId)
    if (!itemId || !tenantIdInput) {
      return res.status(400).json({ message: 'itemId oder tenantId fehlt.' })
    }
    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string
    const existing = await prisma.displayPlaylistItem.findUnique({
      where: { id: itemId },
      include: { playlist: { select: { tenantId: true } } },
    })
    if (!existing || existing.playlist.tenantId !== tenantId) {
      return res.status(404).json({ message: 'Playlist-Element nicht gefunden.' })
    }

    await prisma.displayPlaylistItem.delete({ where: { id: itemId } })
    return res.json({ ok: true })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAY ITEM DELETE ERROR:', error)
    return res.status(500).json({ message: 'Playlist-Element konnte nicht gelöscht werden.' })
  }
})

router.post('/:deviceId/revoke', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const deviceId = normalizeText(req.params.deviceId)
    const tenantIdInput = normalizeText((req.body as { tenantId?: string | null }).tenantId)
    if (!deviceId || !tenantIdInput) {
      return res.status(400).json({ message: 'deviceId oder tenantId fehlt.' })
    }
    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string

    const device = await prisma.displayDevice.findFirst({ where: { id: deviceId, tenantId } })
    if (!device) {
      return res.status(404).json({ message: 'Gerät nicht gefunden.' })
    }

    await prisma.displayDevice.update({
      where: { id: deviceId },
      data: {
        status: DisplayDeviceStatus.REVOKED,
        revokedAt: new Date(),
      },
    })

    return res.json({ ok: true })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ message: scopeError.message })
    console.error('ADMIN DISPLAY REVOKE ERROR:', error)
    return res.status(500).json({ message: 'Gerät konnte nicht getrennt werden.' })
  }
})

export default router
