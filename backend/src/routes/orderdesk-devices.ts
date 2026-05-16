import crypto from 'crypto'
import { PermissionKey, UserRole } from '@prisma/client'
import { Router } from 'express'
import { signOrderDeskDeviceToken, verifyOrderDeskDeviceToken } from '../auth/orderdesk-device-token'
import { writeAuditLog } from '../lib/audit'
import { listDriverDeviceSessionsForTenant } from '../lib/driver-device-sessions'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { rateLimitOrderDeskPairing } from '../middleware/rate-limit'

const router = Router()

const ORDERDESK_DEVICE_MODULE = 'orderdesk_device'
const ORDERDESK_DEVICE_TARGET_TYPE = 'orderdesk_device_binding'
const ORDERDESK_PAIRING_TARGET_TYPE = 'orderdesk_pairing_session'
const ORDERDESK_PAIRING_EXPIRES_MINUTES = 5

function normalizeText(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function parsePositiveInteger(value: unknown) {
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return null
  }
  const rounded = Math.round(parsed)
  if (rounded <= 0) {
    return null
  }
  return rounded
}

function parseBoolean(value: unknown) {
  if (typeof value === 'boolean') {
    return value
  }
  if (typeof value === 'string') {
    const normalized = value.trim().toLowerCase()
    if (normalized === 'true' || normalized === '1' || normalized === 'yes') {
      return true
    }
    if (normalized === 'false' || normalized === '0' || normalized === 'no') {
      return false
    }
  }
  return null
}

function normalizeDeviceSerial(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const upper = value.trim().toUpperCase()
  if (upper.length < 4 || upper.length > 120) {
    return null
  }
  if (!/^[A-Z0-9._:-]+$/.test(upper)) {
    return null
  }
  return upper
}

function parsePairingPayload(rawValue: unknown) {
  if (typeof rawValue !== 'string') {
    return null
  }
  const raw = rawValue.trim()
  if (!raw) {
    return null
  }

  if (raw.startsWith('{')) {
    try {
      const parsed = JSON.parse(raw) as {
        type?: unknown
        pairingToken?: unknown
        token?: unknown
        displayCode?: unknown
      }
      const type = normalizeText(parsed.type)?.toUpperCase()
      if (type && type !== 'ORDER_DESK_PAIRING') {
        return {
          token: null,
          displayCode: null,
          invalidType: type,
        }
      }
      const token = normalizeText(parsed.pairingToken) ?? normalizeText(parsed.token)
      if (!token) {
        return null
      }
      return {
        token,
        displayCode: normalizeText(parsed.displayCode)?.toUpperCase() ?? null,
        invalidType: null,
      }
    } catch {
      return null
    }
  }

  if (raw.startsWith('klarando-orderdesk-pair:')) {
    const parts = raw.split(':')
    if (parts.length < 3) {
      return null
    }
    return {
      token: parts.slice(2).join(':'),
      displayCode: normalizeText(parts[1])?.toUpperCase() ?? null,
      invalidType: null,
    }
  }

  return {
    token: raw,
    displayCode: null,
    invalidType: null,
  }
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

function createPairingSessionId() {
  return `odpk_${Date.now().toString(36)}_${crypto.randomBytes(6).toString('hex')}`
}

function createDefaultAlias() {
  return `OrderDesk ${new Date().toLocaleString('de-DE')}`
}

router.get('/bindings', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId, { allowMissingTenant: true })

    const includeInactive = parseBoolean(req.query.includeInactive) ?? true
    const bindings = await prisma.orderDeskDeviceBinding.findMany({
      where: {
        ...(scope.tenantId
          ? { tenantId: scope.tenantId }
          : {
              tenantId: {
                in: scope.allowedTenantIds,
              },
            }),
        ...(includeInactive ? {} : { isActive: true }),
      },
      include: {
        display: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
            isActive: true,
          },
        },
      },
      orderBy: [{ isActive: 'desc' }, { lastSeenAt: 'desc' }, { boundAt: 'desc' }],
    })

    return res.json({
      total: bindings.length,
      bindings,
      generatedAt: new Date().toISOString(),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET ORDERDESK BINDINGS ERROR:', error)
    return res.status(500).json({ error: 'OrderDesk-Bindings konnten nicht geladen werden' })
  }
})

router.post(
  '/pairing-session',
  requirePermission(PermissionKey.ORDERS_WRITE),
  rateLimitOrderDeskPairing,
  async (req, res) => {
  try {
    const payload = req.body as {
      tenantId?: string | null
      displayId?: string | null
      displayCode?: string | null
      deviceAlias?: string | null
    }

    const tenantId = normalizeText(payload.tenantId)
    const displayId = normalizeText(payload.displayId)
    const displayCode = normalizeText(payload.displayCode)?.toUpperCase() ?? null
    const deviceAlias = normalizeText(payload.deviceAlias) ?? createDefaultAlias()

    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }
    const scope = await resolveTenantScope(req, tenantId)
    const scopedTenantId = scope.tenantId as string
    if (!displayId && !displayCode) {
      return res.status(400).json({ error: 'displayId oder displayCode fehlt' })
    }
    const resolvedDisplayCode = displayCode ?? undefined

    const display = await prisma.orderDisplay.findFirst({
      where: {
        tenantId: scopedTenantId,
        ...(displayId ? { id: displayId } : { displayCode: resolvedDisplayCode }),
      },
      select: {
        id: true,
        tenantId: true,
        displayCode: true,
        displayRole: true,
        isActive: true,
      },
    })
    if (!display) {
      return res.status(404).json({ error: 'Kassen-Display nicht gefunden' })
    }
    if (display.displayRole !== 'CASH') {
      return res.status(400).json({ error: 'OrderDesk darf nur mit Kassendisplay verbunden werden' })
    }
    if (!display.isActive) {
      return res.status(400).json({ error: 'Ausgewähltes Kassendisplay ist inaktiv' })
    }

    const sessionId = createPairingSessionId()
    const expiresAt = new Date(Date.now() + ORDERDESK_PAIRING_EXPIRES_MINUTES * 60 * 1000)

    await prisma.orderDeskPairingSession.create({
      data: {
        id: sessionId,
        tenantId: display.tenantId,
        displayId: display.id,
        displayCode: display.displayCode,
        deviceAlias,
        createdByUserId: req.authUser?.id ?? null,
        expiresAt,
      },
    })

    const pairingToken = signOrderDeskDeviceToken({
      sid: sessionId,
      tenantId: display.tenantId,
      displayCode: display.displayCode,
      bindingId: null,
      deviceSerial: null,
      deviceAlias,
      kind: 'PAIRING',
      expiresAtMs: expiresAt.getTime(),
    })
    const apiBaseUrl = resolvePublicApiBaseUrl()
    const pairingPayload = JSON.stringify({
      type: 'ORDER_DESK_PAIRING',
      apiBaseUrl,
      tenantId: display.tenantId,
      displayCode: display.displayCode,
      pairingToken,
      expiresAt: expiresAt.toISOString(),
    })
    const legacyPairingPayload = `klarando-orderdesk-pair:${display.displayCode}:${pairingToken}`

    await writeAuditLog({
      req,
      module: ORDERDESK_DEVICE_MODULE,
      action: 'pairing_session_created',
      targetType: ORDERDESK_PAIRING_TARGET_TYPE,
      targetId: sessionId,
      tenantId: display.tenantId,
      metadata: {
        displayId: display.id,
        displayCode: display.displayCode,
        deviceAlias,
        expiresAt: expiresAt.toISOString(),
        expiresMinutes: ORDERDESK_PAIRING_EXPIRES_MINUTES,
      },
    })

    return res.status(201).json({
      ok: true,
      sessionId,
      tenantId: display.tenantId,
      displayId: display.id,
      displayCode: display.displayCode,
      deviceAlias,
      expiresAt: expiresAt.toISOString(),
      pairingToken,
      pairingPayload,
      legacyPairingPayload,
      qrImageUrl: `https://api.qrserver.com/v1/create-qr-code/?size=360x360&data=${encodeURIComponent(
        pairingPayload
      )}`,
      expiresMinutes: ORDERDESK_PAIRING_EXPIRES_MINUTES,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('CREATE ORDERDESK PAIRING SESSION ERROR:', error)
    return res.status(500).json({ error: 'OrderDesk-QR konnte nicht erstellt werden' })
  }
})

router.post('/bindings/:bindingId/reset', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const bindingId = normalizeText(req.params.bindingId)
    if (!bindingId) {
      return res.status(400).json({ error: 'bindingId fehlt' })
    }

    const payload = req.body as {
      reason?: string | null
    }
    const reason = normalizeText(payload.reason)

    const binding = await prisma.orderDeskDeviceBinding.findUnique({
      where: { id: bindingId },
      select: {
        id: true,
        tenantId: true,
        displayId: true,
        displayCode: true,
        deviceSerial: true,
        deviceAlias: true,
        isActive: true,
      },
    })
    if (!binding) {
      return res.status(404).json({ error: 'OrderDesk-Binding nicht gefunden' })
    }

    const scope = await resolveTenantScope(req, binding.tenantId)
    if (!scope.allowedTenantIds.includes(binding.tenantId)) {
      return res.status(403).json({ error: 'Kein Zugriff auf dieses OrderDesk-Gerät' })
    }

    if (!binding.isActive) {
      return res.status(409).json({ error: 'Binding wurde bereits getrennt' })
    }

    const updated = await prisma.orderDeskDeviceBinding.update({
      where: { id: binding.id },
      data: {
        isActive: false,
        resetAt: new Date(),
        resetByUserId: req.authUser?.id ?? null,
        resetReason: reason,
      },
      include: {
        display: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
          },
        },
      },
    })

    await writeAuditLog({
      req,
      module: ORDERDESK_DEVICE_MODULE,
      action: 'binding_reset',
      targetType: ORDERDESK_DEVICE_TARGET_TYPE,
      targetId: binding.id,
      tenantId: binding.tenantId,
      metadata: {
        displayId: binding.displayId,
        displayCode: binding.displayCode,
        deviceSerial: binding.deviceSerial,
        deviceAlias: binding.deviceAlias,
        reason,
      },
    })

    return res.json({ ok: true, binding: updated })
  } catch (error) {
    console.error('RESET ORDERDESK BINDING ERROR:', error)
    return res.status(500).json({ error: 'OrderDesk-Binding konnte nicht zurückgesetzt werden' })
  }
})

router.patch('/bindings/:bindingId/deactivate', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const bindingId = normalizeText(req.params.bindingId)
    if (!bindingId) {
      return res.status(400).json({ error: 'bindingId fehlt' })
    }

    const binding = await prisma.orderDeskDeviceBinding.findUnique({
      where: { id: bindingId },
      select: {
        id: true,
        tenantId: true,
        isActive: true,
      },
    })

    if (!binding) {
      return res.status(404).json({ error: 'OrderDesk-Gerät nicht gefunden' })
    }
    await resolveTenantScope(req, binding.tenantId)

    if (!binding.isActive) {
      return res.json({ ok: true, alreadyInactive: true })
    }

    await prisma.orderDeskDeviceBinding.update({
      where: { id: binding.id },
      data: {
        isActive: false,
        resetAt: new Date(),
        resetByUserId: req.authUser?.id ?? null,
        resetReason: 'Manuell deaktiviert',
      },
    })
    return res.json({ ok: true })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DEACTIVATE ORDERDESK BINDING ERROR:', error)
    return res.status(500).json({ error: 'OrderDesk-Gerät konnte nicht deaktiviert werden' })
  }
})

router.delete('/bindings/:bindingId', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const bindingId = normalizeText(req.params.bindingId)
    if (!bindingId) {
      return res.status(400).json({ error: 'bindingId fehlt' })
    }

    const binding = await prisma.orderDeskDeviceBinding.findUnique({
      where: { id: bindingId },
      select: { id: true, tenantId: true },
    })
    if (!binding) {
      return res.status(404).json({ error: 'OrderDesk-Gerät nicht gefunden' })
    }
    await resolveTenantScope(req, binding.tenantId)

    await prisma.orderDeskDeviceBinding.update({
      where: { id: binding.id },
      data: {
        isActive: false,
        resetAt: new Date(),
        resetByUserId: req.authUser?.id ?? null,
        resetReason: 'Gerät gelöscht/entkoppelt',
      },
    })

    return res.json({ ok: true, softDeleted: true })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DELETE ORDERDESK BINDING ERROR:', error)
    return res.status(500).json({ error: 'OrderDesk-Gerät konnte nicht gelöscht werden' })
  }
})

router.post('/bindings/:bindingId/reset-pairing', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const bindingId = normalizeText(req.params.bindingId)
    if (!bindingId) {
      return res.status(400).json({ error: 'bindingId fehlt' })
    }

    const binding = await prisma.orderDeskDeviceBinding.findUnique({
      where: { id: bindingId },
      select: {
        id: true,
        tenantId: true,
        displayId: true,
        displayCode: true,
        deviceAlias: true,
      },
    })
    if (!binding) {
      return res.status(404).json({ error: 'OrderDesk-Gerät nicht gefunden' })
    }
    await resolveTenantScope(req, binding.tenantId)

    const sessionId = createPairingSessionId()
    const expiresAt = new Date(Date.now() + ORDERDESK_PAIRING_EXPIRES_MINUTES * 60 * 1000)
    const deviceAlias = binding.deviceAlias ?? createDefaultAlias()
    await prisma.orderDeskPairingSession.create({
      data: {
        id: sessionId,
        tenantId: binding.tenantId,
        displayId: binding.displayId,
        displayCode: binding.displayCode,
        deviceAlias,
        createdByUserId: req.authUser?.id ?? null,
        expiresAt,
      },
    })

    const pairingToken = signOrderDeskDeviceToken({
      sid: sessionId,
      tenantId: binding.tenantId,
      displayCode: binding.displayCode,
      bindingId: null,
      deviceSerial: null,
      deviceAlias,
      kind: 'PAIRING',
      expiresAtMs: expiresAt.getTime(),
    })
    const apiBaseUrl = resolvePublicApiBaseUrl()
    const pairingPayload = JSON.stringify({
      type: 'ORDER_DESK_PAIRING',
      apiBaseUrl,
      tenantId: binding.tenantId,
      displayCode: binding.displayCode,
      pairingToken,
      expiresAt: expiresAt.toISOString(),
    })

    return res.status(201).json({
      ok: true,
      sessionId,
      pairingToken,
      pairingPayload,
      expiresAt: expiresAt.toISOString(),
      qrImageUrl: `https://api.qrserver.com/v1/create-qr-code/?size=360x360&data=${encodeURIComponent(pairingPayload)}`,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('RESET ORDERDESK PAIRING ERROR:', error)
    return res.status(500).json({ error: 'Pairing-Code konnte nicht neu erstellt werden' })
  }
})

router.post('/public/bind', rateLimitOrderDeskPairing, async (req, res) => {
  try {
    const payload = req.body as {
      pairingToken?: string | null
      pairingPayload?: string | null
      qrPayload?: string | null
      deviceSerial?: string | null
      deviceAlias?: string | null
      deviceModel?: string | null
      devicePlatform?: string | null
      appVersion?: string | null
    }

    const parsedPair = parsePairingPayload(
      payload.pairingToken ?? payload.pairingPayload ?? payload.qrPayload
    )
    if (!parsedPair) {
      return res.status(400).json({ error: 'pairingToken oder QR-Payload fehlt' })
    }
    if (parsedPair.invalidType) {
      return res.status(400).json({
        error: 'Dieser QR-Code ist nicht für die OrderDesk-App geeignet.',
      })
    }

    const tokenPayload = verifyOrderDeskDeviceToken(parsedPair.token as string)
    if (!tokenPayload || tokenPayload.kind !== 'PAIRING') {
      return res.status(401).json({ error: 'OrderDesk-QR ist ungültig oder abgelaufen' })
    }
    if (parsedPair.displayCode && parsedPair.displayCode !== tokenPayload.displayCode) {
      return res.status(400).json({ error: 'QR-Code gehört nicht zu diesem Kassendisplay' })
    }

    const deviceSerial = normalizeDeviceSerial(payload.deviceSerial)
    if (!deviceSerial) {
      return res.status(400).json({
        error:
          'deviceSerial fehlt oder ist ungültig (4-120 Zeichen, A-Z, 0-9, Punkt, Doppelpunkt, Minus, Unterstrich)',
      })
    }

    const pairingSession = await prisma.orderDeskPairingSession.findUnique({
      where: { id: tokenPayload.sid },
      select: {
        id: true,
        tenantId: true,
        displayId: true,
        displayCode: true,
        deviceAlias: true,
        expiresAt: true,
        consumedAt: true,
        revokedAt: true,
      },
    })
    if (!pairingSession) {
      return res.status(404).json({ error: 'Pairing-Session wurde nicht gefunden' })
    }
    if (pairingSession.revokedAt) {
      return res.status(410).json({ error: 'Pairing-Session wurde bereits widerrufen' })
    }
    if (pairingSession.consumedAt) {
      return res.status(409).json({ error: 'Pairing-Session wurde bereits verwendet' })
    }
    if (pairingSession.expiresAt.getTime() <= Date.now()) {
      return res.status(401).json({ error: 'Pairing-Session ist abgelaufen' })
    }
    if (
      pairingSession.tenantId !== tokenPayload.tenantId ||
      pairingSession.displayCode !== tokenPayload.displayCode
    ) {
      return res.status(401).json({ error: 'Pairing-Session passt nicht zum Token' })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { id: pairingSession.displayId },
      select: {
        id: true,
        tenantId: true,
        displayCode: true,
        displayRole: true,
        isActive: true,
      },
    })
    if (!display || display.tenantId !== pairingSession.tenantId) {
      return res.status(404).json({ error: 'Kassendisplay nicht gefunden' })
    }
    if (display.displayRole !== 'CASH') {
      return res.status(400).json({ error: 'OrderDesk darf nur mit Kassendisplay verbunden werden' })
    }
    if (!display.isActive) {
      return res.status(400).json({ error: 'Kassendisplay ist inaktiv' })
    }

    const normalizedAlias = normalizeText(payload.deviceAlias) ?? pairingSession.deviceAlias
    const normalizedModel = normalizeText(payload.deviceModel)
    const normalizedPlatform = normalizeText(payload.devicePlatform)
    const normalizedAppVersion = normalizeText(payload.appVersion)

    const existingBinding = await prisma.orderDeskDeviceBinding.findUnique({
      where: { deviceSerial },
      select: {
        id: true,
        tenantId: true,
        displayId: true,
        displayCode: true,
        firstBoundAt: true,
        isActive: true,
      },
    })

    if (
      existingBinding &&
      existingBinding.isActive &&
      (existingBinding.tenantId !== display.tenantId || existingBinding.displayId !== display.id)
    ) {
      return res.status(409).json({
        error:
          'Dieses Gerät ist bereits mit einem anderen System verbunden. Nur Superadmin kann die Bindung zurücksetzen.',
      })
    }

    const now = new Date()
    const binding = existingBinding
      ? await prisma.orderDeskDeviceBinding.update({
          where: { id: existingBinding.id },
          data: {
            tenantId: display.tenantId,
            displayId: display.id,
            displayCode: display.displayCode,
            deviceAlias: normalizedAlias,
            deviceModel: normalizedModel,
            devicePlatform: normalizedPlatform ?? undefined,
            appVersion: normalizedAppVersion,
            boundAt: now,
            lastSeenAt: now,
            isActive: true,
            resetAt: null,
            resetByUserId: null,
            resetReason: null,
          },
          include: {
            display: {
              select: {
                id: true,
                name: true,
                displayCode: true,
                displayRole: true,
              },
            },
          },
        })
      : await prisma.orderDeskDeviceBinding.create({
          data: {
            deviceSerial,
            tenantId: display.tenantId,
            displayId: display.id,
            displayCode: display.displayCode,
            deviceAlias: normalizedAlias,
            deviceModel: normalizedModel,
            devicePlatform: normalizedPlatform ?? '',
            appVersion: normalizedAppVersion,
            boundAt: now,
            firstBoundAt: now,
            lastSeenAt: now,
            isActive: true,
          },
          include: {
            display: {
              select: {
                id: true,
                name: true,
                displayCode: true,
                displayRole: true,
              },
            },
          },
        })

    await prisma.orderDeskPairingSession.update({
      where: { id: pairingSession.id },
      data: {
        consumedAt: now,
        consumedBySerial: deviceSerial,
      },
    })

    const sessionExpiresAtMs = Date.now() + 365 * 24 * 60 * 60 * 1000
    const sessionToken = signOrderDeskDeviceToken({
      sid: pairingSession.id,
      tenantId: display.tenantId,
      displayCode: display.displayCode,
      bindingId: binding.id,
      deviceSerial: binding.deviceSerial,
      deviceAlias: binding.deviceAlias ?? null,
      kind: 'SESSION',
      expiresAtMs: sessionExpiresAtMs,
    })

    await writeAuditLog({
      req,
      module: ORDERDESK_DEVICE_MODULE,
      action: existingBinding ? 'binding_refreshed' : 'binding_created',
      targetType: ORDERDESK_DEVICE_TARGET_TYPE,
      targetId: binding.id,
      tenantId: display.tenantId,
      metadata: {
        sessionId: pairingSession.id,
        displayId: display.id,
        displayCode: display.displayCode,
        deviceSerial: binding.deviceSerial,
        deviceAlias: binding.deviceAlias,
        deviceModel: binding.deviceModel,
        devicePlatform: binding.devicePlatform,
        appVersion: binding.appVersion,
      },
    })

    return res.json({
      ok: true,
      authToken: sessionToken,
      binding: {
        id: binding.id,
        tenantId: binding.tenantId,
        displayId: binding.displayId,
        displayCode: binding.displayCode,
        deviceSerial: binding.deviceSerial,
        deviceAlias: binding.deviceAlias,
        deviceModel: binding.deviceModel,
        devicePlatform: binding.devicePlatform,
        appVersion: binding.appVersion,
        firstBoundAt: binding.firstBoundAt.toISOString(),
        boundAt: binding.boundAt.toISOString(),
        lastSeenAt: binding.lastSeenAt?.toISOString() ?? null,
        isActive: binding.isActive,
      },
      display: {
        id: display.id,
        displayCode: display.displayCode,
      },
      mode: existingBinding ? 'REBOUND' : 'BOUND',
      expiresAt: new Date(sessionExpiresAtMs).toISOString(),
      secondsUntilExpiry: Math.max(60, Math.floor((sessionExpiresAtMs - Date.now()) / 1000)),
    })
  } catch (error) {
    console.error('PUBLIC ORDERDESK BIND ERROR:', error)
    return res.status(500).json({ error: 'OrderDesk konnte nicht verbunden werden' })
  }
})

router.post('/public/heartbeat', async (req, res) => {
  try {
    const authHeader = req.header('authorization')
    if (!authHeader || !authHeader.toLowerCase().startsWith('bearer ')) {
      return res.status(401).json({
        error: 'OrderDesk-Sitzung fehlt',
        code: 'ORDERDESK_SESSION_MISSING',
      })
    }
    const token = authHeader.slice(7).trim()
    const tokenPayload = verifyOrderDeskDeviceToken(token)
    if (!tokenPayload || tokenPayload.kind !== 'SESSION') {
      return res.status(401).json({
        error: 'OrderDesk-Sitzung ist ungültig oder abgelaufen',
        code: 'ORDERDESK_SESSION_INVALID',
      })
    }
    if (!tokenPayload.bindingId || !tokenPayload.deviceSerial) {
      return res.status(401).json({
        error: 'OrderDesk-Sitzung ist unvollständig',
        code: 'ORDERDESK_SESSION_INCOMPLETE',
      })
    }

    const binding = await prisma.orderDeskDeviceBinding.findUnique({
      where: { id: tokenPayload.bindingId },
      select: {
        id: true,
        tenantId: true,
        displayCode: true,
        deviceSerial: true,
        isActive: true,
        lastSeenAt: true,
      },
    })
    if (!binding || !binding.isActive) {
      return res.status(403).json({
        error:
          'OrderDesk-Bindung ist nicht aktiv. Bitte Superadmin kontaktieren, falls eine Freigabe nötig ist.',
        code: 'ORDERDESK_BINDING_INACTIVE',
        reconnectAction: 'REPAIR_WITH_SUPERADMIN',
      })
    }
    if (
      binding.tenantId !== tokenPayload.tenantId ||
      binding.displayCode !== tokenPayload.displayCode ||
      binding.deviceSerial !== tokenPayload.deviceSerial
    ) {
      return res.status(403).json({
        error: 'OrderDesk-Sitzung passt nicht zur aktiven Bindung',
        code: 'ORDERDESK_SESSION_BINDING_MISMATCH',
        reconnectAction: 'REBIND_REQUIRED',
      })
    }

    const now = new Date()
    const lastSeenAtIso = binding.lastSeenAt?.toISOString() ?? null
    const staleMs = binding.lastSeenAt ? now.getTime() - binding.lastSeenAt.getTime() : null
    const recoveredAfterGap = staleMs !== null && staleMs > 75_000

    await prisma.orderDeskDeviceBinding.update({
      where: { id: binding.id },
      data: {
        lastSeenAt: now,
      },
    })

    if (recoveredAfterGap) {
      await writeAuditLog({
        req,
        module: ORDERDESK_DEVICE_MODULE,
        action: 'heartbeat_recovered',
        targetType: ORDERDESK_DEVICE_TARGET_TYPE,
        targetId: binding.id,
        tenantId: binding.tenantId,
        metadata: {
          displayCode: binding.displayCode,
          deviceSerial: binding.deviceSerial,
          previousLastSeenAt: lastSeenAtIso,
          reconnectGapMs: staleMs,
        },
      })
    }

    const tenant = await prisma.tenant.findUnique({
      where: { id: binding.tenantId },
      select: {
        id: true,
        name: true,
        chainId: true,
      },
    })
    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: binding.displayCode },
      select: {
        id: true,
        displayRole: true,
        isActive: true,
      },
    })

    const tenantAdmins = await prisma.user.findMany({
      where: {
        role: UserRole.ADMIN,
        isActive: true,
        tenantId: binding.tenantId,
      },
      select: {
        id: true,
        name: true,
        email: true,
      },
      orderBy: { name: 'asc' },
      take: 10,
    })

    const chainAdmins =
      tenant?.chainId
        ? await prisma.user.findMany({
            where: {
              role: UserRole.CHAINADMIN,
              isActive: true,
              chainId: tenant.chainId,
            },
            select: {
              id: true,
              name: true,
              email: true,
            },
            orderBy: { name: 'asc' },
            take: 10,
          })
        : []

    const activeDriverDevices = await listDriverDeviceSessionsForTenant(binding.tenantId)
    const onlineDriverDeviceCount = activeDriverDevices.filter((entry) => entry.isOnline).length

    return res.json({
      ok: true,
      status: binding.isActive ? 'online' : 'inactive',
      bindingId: binding.id,
      displayId: display?.id ?? null,
      displayCode: binding.displayCode,
      displayType:
        display?.displayRole === 'KITCHEN'
          ? 'KITCHEN'
          : display?.displayRole === 'PICKUP'
          ? 'PICKUP_NUMBERS'
          : 'MIXED',
      tenant: {
        id: tenant?.id ?? binding.tenantId,
        name: tenant?.name ?? null,
      },
      admins: tenantAdmins,
      chainadmins: chainAdmins,
      driverDevices: {
        activeCount: activeDriverDevices.length,
        onlineCount: onlineDriverDeviceCount,
      },
      recovery: {
        recoveredAfterGap,
        reconnectGapMs: staleMs,
        previousLastSeenAt: lastSeenAtIso,
      },
      recoveryHints: recoveredAfterGap
        ? [
            'Verbindung wurde nach einer Unterbrechung wiederhergestellt',
            'Bitte Netzwerkqualitaet am Geraet pruefen',
          ]
        : [],
      serverTime: now.toISOString(),
    })
  } catch (error) {
    console.error('PUBLIC ORDERDESK HEARTBEAT ERROR:', error)
    return res.status(500).json({ error: 'OrderDesk-Heartbeat konnte nicht verarbeitet werden' })
  }
})

export default router
