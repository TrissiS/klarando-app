import crypto from 'crypto'
import { OrderDisplayRole, PermissionKey, Prisma, UserRole } from '@prisma/client'
import { NextFunction, Request, Response, Router } from 'express'
import {
  DISPLAY_AGE_ALERT_ANIMATION_MODES,
  DISPLAY_BACKGROUND_MEDIA_MODES,
  DISPLAY_SORT_MODES,
  DISPLAY_STATUS_ANIMATION_MODES,
  clampAnimationDuration,
  clampAnnouncementDuration,
  clampDoneAutoHide,
  clampOrderAgeAlertThreshold,
  clampOrderAgeFontSize,
  clampRefreshInterval,
  createUniqueDisplayCode,
  feedStatusesForDisplay,
  mapDisplayOutput,
  normalizeColorHex,
  normalizeIdList,
  normalizeText,
  parseStoredIdList,
  roleOrderField,
  serializeIdList,
} from '../lib/order-display-utils'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { generateNextPickupNumberForTenant } from '../lib/pickup-number'
import { parseSettings } from '../lib/business-settings'
import { signDriverDeviceToken } from '../auth/driver-device-token'
import {
  type OrderDeskDeviceTokenPayload,
  verifyOrderDeskDeviceToken,
} from '../auth/orderdesk-device-token'
import {
  DRIVER_DEVICE_SESSION_MODULE,
  DRIVER_DEVICE_SESSION_TARGET_TYPE,
  listDriverDeviceSessionsForTenant,
  resolveDriverDeviceSession,
} from '../lib/driver-device-sessions'
import { buildCustomerReceiptJob80mm, buildKitchenReceiptJob80mm } from '../lib/receipt-jobs-80mm'
import { encodeReceiptToEscPosBytes } from '../lib/escpos-encoder-80mm'
import { excludeOperationallyHiddenStripeOrders } from '../lib/order-operational-visibility'
import { asTenantScopeError, resolveTenantScope, TenantScopeError } from '../lib/tenant-scope'
import { rateLimitDisplayPairing } from '../middleware/rate-limit'
import {
  asOrderTransitionError,
  buildOrderAcceptanceUpdate,
  buildOrderItemStatusUpdate,
  buildOrderPaymentStatusUpdate,
  buildOrderStatusUpdate,
  deriveOrderStatusFromItemStatuses,
  normalizeOrderItemProductionStatus,
  normalizeOrderPaymentStatus,
  normalizeOrderWorkflowStatus,
} from '../lib/order-status-transitions'
import { dispatchOrder, validateDispatchReadiness } from '../lib/order-dispatch'
import { resolveDriverAssignmentIdentity } from '../lib/driver-assignment'

const router = Router()

const ORDER_DISPLAY_DRIVER_DEVICE_SESSION_ROUTES: string[] = [
  '/:displayCode/driver-devices/session',
  // deprecated compatibility route, auth required
  '/public/:displayCode/driver-devices/session',
]

const ORDER_DISPLAY_DRIVER_DEVICE_ACTIVE_ROUTES: string[] = [
  '/:displayCode/driver-devices/active',
  // deprecated compatibility route, auth required
  '/public/:displayCode/driver-devices/active',
]

const ORDER_DISPLAY_DRIVER_DEVICE_REVOKE_ROUTES: string[] = [
  '/:displayCode/driver-devices/revoke',
  // deprecated compatibility route, auth required
  '/public/:displayCode/driver-devices/revoke',
]

const ORDER_DISPLAY_ORDER_STATUS_ROUTES: string[] = [
  '/:displayCode/orders/:orderId/status',
  // deprecated compatibility route, auth required
  '/public/:displayCode/orders/:orderId/status',
]

const ORDER_DISPLAY_ORDER_ITEM_STATUS_ROUTES: string[] = [
  '/:displayCode/orders/:orderId/items/:itemId/status',
  // deprecated compatibility route, auth required
  '/public/:displayCode/orders/:orderId/items/:itemId/status',
]

const ORDER_DISPLAY_ORDER_PAYMENT_ROUTES: string[] = [
  '/:displayCode/orders/:orderId/payment',
  // deprecated compatibility route, auth required
  '/public/:displayCode/orders/:orderId/payment',
]

const ORDER_DISPLAY_ORDER_ACCEPT_ROUTES: string[] = [
  '/:displayCode/orders/:orderId/accept',
  // deprecated compatibility route, auth required
  '/public/:displayCode/orders/:orderId/accept',
]

const ORDER_DISPLAY_ORDER_DISPATCH_ROUTES: string[] = [
  '/:displayCode/orders/:orderId/dispatch',
  // deprecated compatibility route, auth required
  '/public/:displayCode/orders/:orderId/dispatch',
]

type DisplayOrderComplaintEntry = {
  id: string
  message: string
  images: string[]
  createdAt: string
  createdBy: string | null
  isResolved: boolean
}

type DisplayOrderComplaintSummary = {
  complaintOpen: boolean
  complaintCount: number
  latestComplaintAt: string | null
  latestComplaintMessage: string | null
}

type DisplayOrderComplaintState = DisplayOrderComplaintSummary & {
  latestComplaintImageCount: number
  complaints: DisplayOrderComplaintEntry[]
}

type DisplayDriverLocationPoint = {
  latitude: number
  longitude: number
  accuracyMeters: number | null
  heading: number | null
  speedKmh: number | null
  updatedAt: string
}

declare global {
  namespace Express {
    interface Request {
      orderDeskDeviceSession?: OrderDeskDeviceTokenPayload
    }
  }
}

function normalizeComplaintText(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
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

function sanitizeComplaintImagePayload(input: unknown) {
  if (typeof input !== 'string') {
    return null
  }
  const trimmed = input.trim()
  if (!trimmed) {
    return null
  }
  if (
    trimmed.startsWith('data:image/') ||
    trimmed.startsWith('http://') ||
    trimmed.startsWith('https://')
  ) {
    return trimmed
  }
  return null
}

function parseComplaintPayloadFromAuditMetadata(metadata: unknown) {
  if (!metadata || typeof metadata !== 'object' || Array.isArray(metadata)) {
    return null
  }
  const source = metadata as Record<string, unknown>
  const message = normalizeComplaintText(source.message)
  if (!message) {
    return null
  }
  const complaintId = normalizeText(
    typeof source.complaintId === 'string' ? source.complaintId : null
  )
  const createdBy = normalizeText(typeof source.createdBy === 'string' ? source.createdBy : null)
  const images = (Array.isArray(source.images) ? source.images : [])
    .map((entry) => sanitizeComplaintImagePayload(entry))
    .filter((entry): entry is string => Boolean(entry))
    .slice(0, 5)
  return {
    complaintId,
    createdBy,
    message,
    images,
  }
}

function parseDriverLocationFromAuditMetadata(metadata: unknown) {
  if (!metadata || typeof metadata !== 'object' || Array.isArray(metadata)) {
    return null
  }
  const source = metadata as Record<string, unknown>
  const latitude = Number(source.latitude)
  const longitude = Number(source.longitude)
  if (!Number.isFinite(latitude) || !Number.isFinite(longitude)) {
    return null
  }
  const accuracyMeters = Number(source.accuracyMeters)
  const heading = Number(source.heading)
  const speedKmh = Number(source.speedKmh)
  return {
    latitude,
    longitude,
    accuracyMeters: Number.isFinite(accuracyMeters) ? accuracyMeters : null,
    heading: Number.isFinite(heading) ? heading : null,
    speedKmh: Number.isFinite(speedKmh) ? speedKmh : null,
  }
}

async function loadLatestDriverLocationByOrderId(orderIds: string[]) {
  const normalizedIds = Array.from(new Set(orderIds.filter(Boolean)))
  const locationByOrderId = new Map<string, DisplayDriverLocationPoint>()
  if (normalizedIds.length === 0) {
    return locationByOrderId
  }

  const rows = await prisma.auditLog.findMany({
    where: {
      module: 'driver_tracking',
      action: 'location_ping',
      targetType: 'order',
      targetId: {
        in: normalizedIds,
      },
    },
    select: {
      targetId: true,
      metadata: true,
      createdAt: true,
    },
    orderBy: {
      createdAt: 'desc',
    },
    take: Math.min(5000, Math.max(200, normalizedIds.length * 20)),
  })

  for (const row of rows) {
    if (!row.targetId || locationByOrderId.has(row.targetId)) {
      continue
    }
    const parsed = parseDriverLocationFromAuditMetadata(row.metadata)
    if (!parsed) {
      continue
    }
    locationByOrderId.set(row.targetId, {
      ...parsed,
      updatedAt: row.createdAt.toISOString(),
    })
  }
  return locationByOrderId
}

async function loadOrderComplaintStateByOrderId(orderIds: string[]) {
  const normalizedOrderIds = Array.from(new Set(orderIds.filter(Boolean)))
  const stateByOrderId = new Map<string, DisplayOrderComplaintState>()
  if (normalizedOrderIds.length === 0) {
    return stateByOrderId
  }

  const rows = await prisma.auditLog.findMany({
    where: {
      module: 'order_complaint',
      action: {
        in: ['created', 'resolved'],
      },
      targetType: 'order',
      targetId: {
        in: normalizedOrderIds,
      },
    },
    select: {
      id: true,
      targetId: true,
      action: true,
      metadata: true,
      createdAt: true,
    },
    orderBy: {
      createdAt: 'asc',
    },
    take: Math.min(12000, Math.max(300, normalizedOrderIds.length * 40)),
  })

  for (const row of rows) {
    const orderId = normalizeText(row.targetId)
    if (!orderId) {
      continue
    }
    const current =
      stateByOrderId.get(orderId) ??
      ({
        complaintOpen: false,
        complaintCount: 0,
        latestComplaintAt: null,
        latestComplaintMessage: null,
        latestComplaintImageCount: 0,
        complaints: [],
      } satisfies DisplayOrderComplaintState)

    if (row.action === 'created') {
      const payload = parseComplaintPayloadFromAuditMetadata(row.metadata)
      if (payload) {
        const complaintEntry: DisplayOrderComplaintEntry = {
          id: payload.complaintId ?? row.id,
          message: payload.message,
          images: payload.images,
          createdAt: row.createdAt.toISOString(),
          createdBy: payload.createdBy ?? null,
          isResolved: false,
        }
        current.complaints.push(complaintEntry)
        current.complaintCount = current.complaints.length
        current.complaintOpen = true
        current.latestComplaintAt = complaintEntry.createdAt
        current.latestComplaintMessage = complaintEntry.message
        current.latestComplaintImageCount = complaintEntry.images.length
      }
    } else if (row.action === 'resolved') {
      let resolved = false
      if (row.metadata && typeof row.metadata === 'object' && !Array.isArray(row.metadata)) {
        const source = row.metadata as Record<string, unknown>
        const complaintId = normalizeText(
          typeof source.complaintId === 'string' ? source.complaintId : null
        )
        if (complaintId) {
          const target = [...current.complaints]
            .reverse()
            .find((entry) => entry.id === complaintId && !entry.isResolved)
          if (target) {
            target.isResolved = true
            resolved = true
          }
        }
      }
      if (!resolved) {
        const target = [...current.complaints].reverse().find((entry) => !entry.isResolved)
        if (target) {
          target.isResolved = true
        }
      }
      current.complaintOpen = current.complaints.some((entry) => !entry.isResolved)
    }

    stateByOrderId.set(orderId, current)
  }

  for (const orderId of normalizedOrderIds) {
    if (!stateByOrderId.has(orderId)) {
      stateByOrderId.set(orderId, {
        complaintOpen: false,
        complaintCount: 0,
        latestComplaintAt: null,
        latestComplaintMessage: null,
        latestComplaintImageCount: 0,
        complaints: [],
      })
    }
  }

  return stateByOrderId
}

function parseDriverAccessHours(value: unknown) {
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return null
  }
  const rounded = Math.round(parsed)
  if (rounded < 1 || rounded > 168) {
    return null
  }
  return rounded
}

function createDriverDeviceSessionId() {
  return `drv_${Date.now().toString(36)}_${crypto.randomBytes(6).toString('hex')}`
}

function normalizeDeviceLabel(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim().slice(0, 80)
  return trimmed.length > 0 ? trimmed : null
}

function normalizeModifierSnapshot(
  value: unknown
): Array<{ name: string; priceDelta: number }> | null {
  if (!Array.isArray(value)) {
    return null
  }

  const items = value
    .map((entry) => {
      if (!entry || typeof entry !== 'object') {
        return null
      }
      const source = entry as { name?: unknown; priceDelta?: unknown }
      if (typeof source.name !== 'string' || !source.name.trim()) {
        return null
      }
      const parsedDelta = Number(source.priceDelta)
      return {
        name: source.name.trim(),
        priceDelta: Number.isFinite(parsedDelta) ? parsedDelta : 0,
      }
    })
    .filter((entry): entry is { name: string; priceDelta: number } => Boolean(entry))

  return items.length > 0 ? items : null
}

function readOrderDeskDeviceTokenFromRequest(req: Request) {
  const orderDeskHeader = normalizeText(req.header('x-orderdesk-device-token'))
  if (orderDeskHeader) {
    return {
      token: orderDeskHeader,
      headerName: 'x-orderdesk-device-token',
    }
  }

  const klarandoHeader = normalizeText(req.header('x-klarando-device-token'))
  if (klarandoHeader) {
    return {
      token: klarandoHeader,
      headerName: 'x-klarando-device-token',
    }
  }

  const authorizationHeader = req.header('authorization')
  if (authorizationHeader?.toLowerCase().startsWith('bearer ')) {
    const token = normalizeText(authorizationHeader.slice(7))
    if (token) {
      return {
        token,
        headerName: 'authorization',
      }
    }
  }

  return null
}

function summarizeOrderDeskAuthDebugToken(token: string | null | undefined) {
  const normalized = typeof token === 'string' ? token.trim() : ''
  return normalized ? normalized.slice(0, 8) : '-'
}

async function resolveOrderDeskDeviceSession(req: Request) {
  if (req.orderDeskDeviceSession) {
    return req.orderDeskDeviceSession
  }

  const tokenSource = readOrderDeskDeviceTokenFromRequest(req)
  if (!tokenSource) {
    console.info('ORDERDESK_AUTH_DEBUG', {
      action: 'mutation_auth',
      headerPresent: 'NEIN',
      tokenPrefix: '-',
      sessionFound: 'NEIN',
      sessionStatus: 'missing_header',
      tenantId: null,
      branchId: null,
      deviceId: null,
    })
    throw new TenantScopeError(401, 'OrderDesk ist nicht gekoppelt oder Anmeldung abgelaufen')
  }

  const tokenPayload = verifyOrderDeskDeviceToken(tokenSource.token)
  console.info('ORDERDESK_AUTH_DEBUG', {
    action: 'mutation_auth',
    headerPresent: 'JA',
    tokenPrefix: summarizeOrderDeskAuthDebugToken(tokenSource.token),
    sessionFound: tokenPayload ? 'JA' : 'NEIN',
    sessionStatus: !tokenPayload ? 'invalid_or_expired' : tokenPayload.kind,
    tenantId: tokenPayload?.tenantId ?? null,
    branchId: tokenPayload?.displayCode ?? null,
    deviceId: tokenPayload?.deviceSerial ?? null,
  })
  if (!tokenPayload || tokenPayload.kind !== 'SESSION') {
    throw new TenantScopeError(401, 'OrderDesk ist nicht gekoppelt oder Anmeldung abgelaufen')
  }

  if (!tokenPayload.bindingId || !tokenPayload.deviceSerial) {
    throw new TenantScopeError(401, 'OrderDesk-Sitzung ist unvollständig')
  }

  const binding = await prisma.orderDeskDeviceBinding.findUnique({
    where: { id: tokenPayload.bindingId },
    select: {
      id: true,
      tenantId: true,
      displayCode: true,
      deviceSerial: true,
      isActive: true,
    },
  })
  console.info('ORDERDESK_AUTH_DEBUG', {
    action: 'mutation_auth_binding_lookup',
    headerPresent: 'JA',
    tokenPrefix: summarizeOrderDeskAuthDebugToken(tokenSource.token),
    sessionFound: binding ? 'JA' : 'NEIN',
    sessionStatus: !binding ? 'binding_missing' : binding.isActive ? 'binding_active' : 'binding_inactive',
    tenantId: binding?.tenantId ?? tokenPayload.tenantId,
    branchId: binding?.displayCode ?? tokenPayload.displayCode,
    deviceId: binding?.deviceSerial ?? tokenPayload.deviceSerial,
  })

  if (!binding || !binding.isActive) {
    throw new TenantScopeError(
      403,
      'OrderDesk-Bindung ist nicht aktiv. Bitte Gerät neu verbinden.'
    )
  }

  if (
    binding.tenantId !== tokenPayload.tenantId ||
    binding.displayCode !== tokenPayload.displayCode ||
    binding.deviceSerial !== tokenPayload.deviceSerial
  ) {
    throw new TenantScopeError(403, 'OrderDesk-Sitzung passt nicht zur aktiven Bindung')
  }

  req.orderDeskDeviceSession = tokenPayload
  return tokenPayload
}

async function requireOrderDisplayMutationAccess(
  req: Request,
  res: Response,
  next: NextFunction
) {
  if (req.authUser) {
    if (
      req.authUser.role === UserRole.SUPERADMIN ||
      req.authUser.permissions.has(PermissionKey.ORDERS_WRITE)
    ) {
      return next()
    }

    return res
      .status(403)
      .json({ error: `Keine Berechtigung: ${PermissionKey.ORDERS_WRITE}` })
  }

  try {
    await resolveOrderDeskDeviceSession(req)
    return next()
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('ORDER DISPLAY MUTATION ACCESS ERROR:', error)
    return res.status(401).json({
      error: 'OrderDesk ist nicht gekoppelt oder Anmeldung abgelaufen',
    })
  }
}

async function ensureDisplayTenantAccess(
  req: Parameters<typeof resolveTenantScope>[0],
  tenantId: string,
  expectedDisplayCode?: string
) {
  if (req.authUser) {
    await resolveTenantScope(req, tenantId)
    return
  }

  const session = await resolveOrderDeskDeviceSession(req)
  if (session.tenantId !== tenantId) {
    throw new TenantScopeError(403, 'Keine Berechtigung fuer diese Filiale')
  }
  if (
    expectedDisplayCode &&
    session.displayCode.trim().toUpperCase() !== expectedDisplayCode.trim().toUpperCase()
  ) {
    throw new TenantScopeError(403, 'OrderDesk-Sitzung gehoert zu einem anderen Display')
  }
}


router.get('/', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string

    const displays = await prisma.orderDisplay.findMany({
      where: { tenantId },
      orderBy: [{ displayRole: 'asc' }, { name: 'asc' }],
    })

    return res.json(displays.map(mapDisplayOutput))
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET ORDER DISPLAYS ERROR:', error)
    return res.status(500).json({ error: 'Bestell-Displays konnten nicht geladen werden' })
  }
})

router.post('/', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const {
      tenantId,
      name,
      displayCode,
      displayRole,
      location,
      isActive,
      refreshIntervalSec,
      sortMode,
      doneAutoHideSec,
      sourceTerminalIds,
      announceOnMenuScreens,
      menuAnnouncementDurationSec,
      displayBackgroundColor,
      orderCardBackgroundColor,
      statusColorPendingPayment,
      statusColorOpen,
      statusColorPreparing,
      statusColorDone,
      showOrderAge,
      showTerminalInfo,
      showPaymentInfo,
      showTotal,
      showItems,
      showStatusBadge,
      showPickupNumber,
      showOrderNumber,
      autoScaleLayout,
      pickupShowOnlyNumber,
      pickupShowOpen,
      pickupShowPreparing,
      pickupShowDone,
      statusAnimationMode,
      statusAnimationDurationMs,
      orderAgeFontSize,
      orderAgeAlertThresholdSec,
      orderAgeAlertAnimationMode,
      backgroundMediaMode,
      backgroundMediaUrl,
      notes,
    } = req.body as {
      tenantId?: string
      name?: string
      displayCode?: string
      displayRole?: OrderDisplayRole
      location?: string | null
      isActive?: boolean
      refreshIntervalSec?: number
      sortMode?: string
      doneAutoHideSec?: number
      sourceTerminalIds?: string[] | string | null
      announceOnMenuScreens?: boolean
      menuAnnouncementDurationSec?: number
      displayBackgroundColor?: string | null
      orderCardBackgroundColor?: string | null
      statusColorPendingPayment?: string | null
      statusColorOpen?: string | null
      statusColorPreparing?: string | null
      statusColorDone?: string | null
      showOrderAge?: boolean
      showTerminalInfo?: boolean
      showPaymentInfo?: boolean
      showTotal?: boolean
      showItems?: boolean
      showStatusBadge?: boolean
      showPickupNumber?: boolean
      showOrderNumber?: boolean
      autoScaleLayout?: boolean
      pickupShowOnlyNumber?: boolean
      pickupShowOpen?: boolean
      pickupShowPreparing?: boolean
      pickupShowDone?: boolean
      statusAnimationMode?: string
      statusAnimationDurationMs?: number
      orderAgeFontSize?: number
      orderAgeAlertThresholdSec?: number
      orderAgeAlertAnimationMode?: string
      backgroundMediaMode?: string
      backgroundMediaUrl?: string | null
      notes?: string | null
    }

    if (!tenantId || !normalizeText(name)) {
      return res.status(400).json({ error: 'tenantId und name sind erforderlich' })
    }
    const scope = await resolveTenantScope(req, tenantId)
    const scopedTenantId = scope.tenantId as string

    const normalizedRole = displayRole ?? OrderDisplayRole.KITCHEN
    if (!Object.values(OrderDisplayRole).includes(normalizedRole)) {
      return res.status(400).json({ error: 'ungueltige displayRole' })
    }

    const normalizedSortMode = (normalizeText(sortMode)?.toUpperCase() ??
      'PRIORITY_OLDEST') as string
    if (!DISPLAY_SORT_MODES.has(normalizedSortMode)) {
      return res.status(400).json({ error: 'ungueltige sortMode' })
    }

    const normalizedStatusAnimationMode =
      normalizeText(statusAnimationMode)?.toUpperCase() ?? 'NONE'
    if (!DISPLAY_STATUS_ANIMATION_MODES.has(normalizedStatusAnimationMode)) {
      return res.status(400).json({ error: 'ungueltige statusAnimationMode' })
    }

    const normalizedAgeAlertAnimationMode =
      normalizeText(orderAgeAlertAnimationMode)?.toUpperCase() ?? 'BLINK'
    if (!DISPLAY_AGE_ALERT_ANIMATION_MODES.has(normalizedAgeAlertAnimationMode)) {
      return res.status(400).json({ error: 'ungueltige orderAgeAlertAnimationMode' })
    }

    const normalizedBackgroundMediaMode =
      normalizeText(backgroundMediaMode)?.toUpperCase() ?? 'NONE'
    if (!DISPLAY_BACKGROUND_MEDIA_MODES.has(normalizedBackgroundMediaMode)) {
      return res.status(400).json({ error: 'ungueltige backgroundMediaMode' })
    }

    const normalizedBackgroundMediaUrl = normalizeText(backgroundMediaUrl)
    if (normalizedBackgroundMediaMode !== 'NONE' && !normalizedBackgroundMediaUrl) {
      return res.status(400).json({
        error: 'backgroundMediaUrl ist erforderlich, wenn backgroundMediaMode aktiv ist',
      })
    }

    const normalizedDisplayBgColor = normalizeColorHex(displayBackgroundColor)
    const normalizedOrderCardBgColor = normalizeColorHex(orderCardBackgroundColor)
    const normalizedPendingColor = normalizeColorHex(statusColorPendingPayment)
    const normalizedOpenColor = normalizeColorHex(statusColorOpen)
    const normalizedPreparingColor = normalizeColorHex(statusColorPreparing)
    const normalizedDoneColor = normalizeColorHex(statusColorDone)
    if (
      normalizedDisplayBgColor === null ||
      normalizedOrderCardBgColor === null ||
      normalizedPendingColor === null ||
      normalizedOpenColor === null ||
      normalizedPreparingColor === null ||
      normalizedDoneColor === null
    ) {
      return res.status(400).json({ error: 'ungueltige Farbe (erwartet #RRGGBB)' })
    }

    const normalizedSourceTerminalIds = normalizeIdList(sourceTerminalIds)
    if (normalizedSourceTerminalIds.length > 0) {
      const count = await prisma.orderTerminal.count({
        where: {
          tenantId: scopedTenantId,
          id: {
            in: normalizedSourceTerminalIds,
          },
        },
      })

      if (count !== normalizedSourceTerminalIds.length) {
        return res.status(400).json({ error: 'Mindestens ein Quell-Terminal ist ungueltig' })
      }
    }

    const normalizedCode = normalizeText(displayCode) ?? (await createUniqueDisplayCode())

    const created = await prisma.orderDisplay.create({
      data: {
        tenantId: scopedTenantId,
        name: normalizeText(name) ?? 'Bestell-Display',
        displayCode: normalizedCode.toUpperCase(),
        displayRole: normalizedRole,
        location: normalizeText(location),
        isActive: isActive ?? true,
        refreshIntervalSec: clampRefreshInterval(refreshIntervalSec) ?? 10,
        sortMode: normalizedSortMode,
        doneAutoHideSec: clampDoneAutoHide(doneAutoHideSec) ?? 0,
        sourceTerminalIds: serializeIdList(normalizedSourceTerminalIds),
        announceOnMenuScreens: announceOnMenuScreens ?? true,
        menuAnnouncementDurationSec:
          clampAnnouncementDuration(menuAnnouncementDurationSec) ?? 45,
        displayBackgroundColor: normalizedDisplayBgColor ?? '#020617',
        orderCardBackgroundColor: normalizedOrderCardBgColor ?? '#0f172a',
        statusColorPendingPayment: normalizedPendingColor ?? '#ef4444',
        statusColorOpen: normalizedOpenColor ?? '#f97316',
        statusColorPreparing: normalizedPreparingColor ?? '#3b82f6',
        statusColorDone: normalizedDoneColor ?? '#16a34a',
        showOrderAge: showOrderAge ?? true,
        showTerminalInfo: showTerminalInfo ?? true,
        showPaymentInfo: showPaymentInfo ?? true,
        showTotal: showTotal ?? true,
        showItems: showItems ?? true,
        showStatusBadge: showStatusBadge ?? true,
        showPickupNumber: showPickupNumber ?? true,
        showOrderNumber: showOrderNumber ?? true,
        autoScaleLayout: autoScaleLayout ?? true,
        pickupShowOnlyNumber: pickupShowOnlyNumber ?? false,
        pickupShowOpen: pickupShowOpen ?? true,
        pickupShowPreparing: pickupShowPreparing ?? true,
        pickupShowDone: pickupShowDone ?? true,
        statusAnimationMode: normalizedStatusAnimationMode,
        statusAnimationDurationMs: clampAnimationDuration(statusAnimationDurationMs) ?? 2200,
        orderAgeFontSize: clampOrderAgeFontSize(orderAgeFontSize) ?? 22,
        orderAgeAlertThresholdSec:
          clampOrderAgeAlertThreshold(orderAgeAlertThresholdSec) ?? 900,
        orderAgeAlertAnimationMode: normalizedAgeAlertAnimationMode,
        backgroundMediaMode: normalizedBackgroundMediaMode,
        backgroundMediaUrl: normalizedBackgroundMediaUrl,
        notes: normalizeText(notes),
      },
    })

    await writeAuditLog({
      req,
      module: 'order_display',
      action: 'order_display_created',
      targetType: 'order_display',
      targetId: created.id,
      tenantId: created.tenantId,
      metadata: {
        name: created.name,
        displayCode: created.displayCode,
        displayRole: created.displayRole,
      },
    })

    return res.status(201).json(mapDisplayOutput(created))
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('CREATE ORDER DISPLAY ERROR:', error)
    return res.status(500).json({ error: 'Bestell-Display konnte nicht erstellt werden' })
  }
})

router.patch('/:id', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const {
      name,
      displayRole,
      location,
      isActive,
      refreshIntervalSec,
      sortMode,
      doneAutoHideSec,
      sourceTerminalIds,
      announceOnMenuScreens,
      menuAnnouncementDurationSec,
      displayBackgroundColor,
      orderCardBackgroundColor,
      statusColorPendingPayment,
      statusColorOpen,
      statusColorPreparing,
      statusColorDone,
      showOrderAge,
      showTerminalInfo,
      showPaymentInfo,
      showTotal,
      showItems,
      showStatusBadge,
      showPickupNumber,
      showOrderNumber,
      autoScaleLayout,
      pickupShowOnlyNumber,
      pickupShowOpen,
      pickupShowPreparing,
      pickupShowDone,
      statusAnimationMode,
      statusAnimationDurationMs,
      orderAgeFontSize,
      orderAgeAlertThresholdSec,
      orderAgeAlertAnimationMode,
      backgroundMediaMode,
      backgroundMediaUrl,
      notes,
    } = req.body as {
      name?: string
      displayRole?: OrderDisplayRole
      location?: string | null
      isActive?: boolean
      refreshIntervalSec?: number
      sortMode?: string
      doneAutoHideSec?: number
      sourceTerminalIds?: string[] | string | null
      announceOnMenuScreens?: boolean
      menuAnnouncementDurationSec?: number
      displayBackgroundColor?: string | null
      orderCardBackgroundColor?: string | null
      statusColorPendingPayment?: string | null
      statusColorOpen?: string | null
      statusColorPreparing?: string | null
      statusColorDone?: string | null
      showOrderAge?: boolean
      showTerminalInfo?: boolean
      showPaymentInfo?: boolean
      showTotal?: boolean
      showItems?: boolean
      showStatusBadge?: boolean
      showPickupNumber?: boolean
      showOrderNumber?: boolean
      autoScaleLayout?: boolean
      pickupShowOnlyNumber?: boolean
      pickupShowOpen?: boolean
      pickupShowPreparing?: boolean
      pickupShowDone?: boolean
      statusAnimationMode?: string
      statusAnimationDurationMs?: number
      orderAgeFontSize?: number
      orderAgeAlertThresholdSec?: number
      orderAgeAlertAnimationMode?: string
      backgroundMediaMode?: string
      backgroundMediaUrl?: string | null
      notes?: string | null
    }

    if (!id) {
      return res.status(400).json({ error: 'id ist erforderlich' })
    }

    const existing = await prisma.orderDisplay.findUnique({
      where: { id },
      select: {
        id: true,
        tenantId: true,
      },
    })

    if (!existing) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }
    await resolveTenantScope(req, existing.tenantId)

    if (displayRole !== undefined && !Object.values(OrderDisplayRole).includes(displayRole)) {
      return res.status(400).json({ error: 'ungueltige displayRole' })
    }

    const normalizedSortMode =
      sortMode === undefined ? undefined : (normalizeText(sortMode)?.toUpperCase() ?? undefined)
    if (normalizedSortMode !== undefined && !DISPLAY_SORT_MODES.has(normalizedSortMode)) {
      return res.status(400).json({ error: 'ungueltige sortMode' })
    }

    const normalizedStatusAnimationMode =
      statusAnimationMode === undefined
        ? undefined
        : normalizeText(statusAnimationMode)?.toUpperCase() ?? undefined
    if (
      normalizedStatusAnimationMode !== undefined &&
      !DISPLAY_STATUS_ANIMATION_MODES.has(normalizedStatusAnimationMode)
    ) {
      return res.status(400).json({ error: 'ungueltige statusAnimationMode' })
    }

    const normalizedAgeAlertAnimationMode =
      orderAgeAlertAnimationMode === undefined
        ? undefined
        : normalizeText(orderAgeAlertAnimationMode)?.toUpperCase() ?? undefined
    if (
      normalizedAgeAlertAnimationMode !== undefined &&
      !DISPLAY_AGE_ALERT_ANIMATION_MODES.has(normalizedAgeAlertAnimationMode)
    ) {
      return res.status(400).json({ error: 'ungueltige orderAgeAlertAnimationMode' })
    }

    const normalizedBackgroundMediaMode =
      backgroundMediaMode === undefined
        ? undefined
        : normalizeText(backgroundMediaMode)?.toUpperCase() ?? undefined
    if (
      normalizedBackgroundMediaMode !== undefined &&
      !DISPLAY_BACKGROUND_MEDIA_MODES.has(normalizedBackgroundMediaMode)
    ) {
      return res.status(400).json({ error: 'ungueltige backgroundMediaMode' })
    }

    const normalizedBackgroundMediaUrl =
      backgroundMediaUrl === undefined ? undefined : normalizeText(backgroundMediaUrl)
    if (
      normalizedBackgroundMediaMode !== undefined &&
      normalizedBackgroundMediaMode !== 'NONE' &&
      !normalizedBackgroundMediaUrl
    ) {
      return res.status(400).json({
        error: 'backgroundMediaUrl ist erforderlich, wenn backgroundMediaMode aktiv ist',
      })
    }
    const resolvedBackgroundMediaUrl =
      normalizedBackgroundMediaMode === undefined
        ? normalizedBackgroundMediaUrl
        : normalizedBackgroundMediaMode === 'NONE'
        ? null
        : normalizedBackgroundMediaUrl

    const normalizedDisplayBgColor =
      displayBackgroundColor === undefined
        ? undefined
        : normalizeColorHex(displayBackgroundColor)
    const normalizedOrderCardBgColor =
      orderCardBackgroundColor === undefined
        ? undefined
        : normalizeColorHex(orderCardBackgroundColor)
    const normalizedPendingColor =
      statusColorPendingPayment === undefined
        ? undefined
        : normalizeColorHex(statusColorPendingPayment)
    const normalizedOpenColor =
      statusColorOpen === undefined ? undefined : normalizeColorHex(statusColorOpen)
    const normalizedPreparingColor =
      statusColorPreparing === undefined
        ? undefined
        : normalizeColorHex(statusColorPreparing)
    const normalizedDoneColor =
      statusColorDone === undefined ? undefined : normalizeColorHex(statusColorDone)
    if (
      normalizedDisplayBgColor === null ||
      normalizedOrderCardBgColor === null ||
      normalizedPendingColor === null ||
      normalizedOpenColor === null ||
      normalizedPreparingColor === null ||
      normalizedDoneColor === null
    ) {
      return res.status(400).json({ error: 'ungueltige Farbe (erwartet #RRGGBB)' })
    }

    const normalizedSourceTerminalIds =
      sourceTerminalIds === undefined ? undefined : normalizeIdList(sourceTerminalIds)
    if (normalizedSourceTerminalIds && normalizedSourceTerminalIds.length > 0) {
      const count = await prisma.orderTerminal.count({
        where: {
          tenantId: existing.tenantId,
          id: {
            in: normalizedSourceTerminalIds,
          },
        },
      })

      if (count !== normalizedSourceTerminalIds.length) {
        return res.status(400).json({ error: 'Mindestens ein Quell-Terminal ist ungueltig' })
      }
    }

    const updated = await prisma.orderDisplay.update({
      where: { id },
      data: {
        name: name === undefined ? undefined : normalizeText(name) ?? undefined,
        displayRole,
        location: location === undefined ? undefined : normalizeText(location),
        isActive,
        refreshIntervalSec: clampRefreshInterval(refreshIntervalSec),
        sortMode: normalizedSortMode,
        doneAutoHideSec: clampDoneAutoHide(doneAutoHideSec),
        sourceTerminalIds:
          sourceTerminalIds === undefined
            ? undefined
            : serializeIdList(normalizedSourceTerminalIds || []),
        announceOnMenuScreens,
        menuAnnouncementDurationSec: clampAnnouncementDuration(menuAnnouncementDurationSec),
        displayBackgroundColor: normalizedDisplayBgColor,
        orderCardBackgroundColor: normalizedOrderCardBgColor,
        statusColorPendingPayment: normalizedPendingColor,
        statusColorOpen: normalizedOpenColor,
        statusColorPreparing: normalizedPreparingColor,
        statusColorDone: normalizedDoneColor,
        showOrderAge,
        showTerminalInfo,
        showPaymentInfo,
        showTotal,
        showItems,
        showStatusBadge,
        showPickupNumber,
        showOrderNumber,
        autoScaleLayout,
        pickupShowOnlyNumber,
        pickupShowOpen,
        pickupShowPreparing,
        pickupShowDone,
        statusAnimationMode: normalizedStatusAnimationMode,
        statusAnimationDurationMs: clampAnimationDuration(statusAnimationDurationMs),
        orderAgeFontSize: clampOrderAgeFontSize(orderAgeFontSize),
        orderAgeAlertThresholdSec: clampOrderAgeAlertThreshold(orderAgeAlertThresholdSec),
        orderAgeAlertAnimationMode: normalizedAgeAlertAnimationMode,
        backgroundMediaMode: normalizedBackgroundMediaMode,
        backgroundMediaUrl: resolvedBackgroundMediaUrl,
        notes: notes === undefined ? undefined : normalizeText(notes),
      },
    })

    await writeAuditLog({
      req,
      module: 'order_display',
      action: 'order_display_updated',
      targetType: 'order_display',
      targetId: updated.id,
      tenantId: existing.tenantId,
      metadata: {
        name: updated.name,
        isActive: updated.isActive,
        displayRole: updated.displayRole,
      },
    })

    return res.json(mapDisplayOutput(updated))
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE ORDER DISPLAY ERROR:', error)
    return res.status(500).json({ error: 'Bestell-Display konnte nicht aktualisiert werden' })
  }
})

router.delete('/:id', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id

    if (!id) {
      return res.status(400).json({ error: 'id ist erforderlich' })
    }
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string

    const existing = await prisma.orderDisplay.findUnique({
      where: { id },
      select: {
        id: true,
        tenantId: true,
        name: true,
      },
    })

    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }

    await prisma.orderDisplay.delete({
      where: { id },
    })

    await writeAuditLog({
      req,
      module: 'order_display',
      action: 'order_display_deleted',
      targetType: 'order_display',
      targetId: existing.id,
      tenantId,
      metadata: {
        name: existing.name,
      },
    })

    return res.json({ ok: true })
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DELETE ORDER DISPLAY ERROR:', error)
    return res.status(500).json({ error: 'Bestell-Display konnte nicht geloescht werden' })
  }
})

router.get('/public/:displayCode/feed', async (req, res) => {
  try {
    const displayCode = Array.isArray(req.params.displayCode)
      ? req.params.displayCode[0]
      : req.params.displayCode

    if (!displayCode) {
      return res.status(400).json({ error: 'displayCode fehlt' })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: displayCode.toUpperCase() },
      select: {
        id: true,
        tenantId: true,
        name: true,
        displayCode: true,
        displayRole: true,
        location: true,
        isActive: true,
        refreshIntervalSec: true,
        sortMode: true,
        doneAutoHideSec: true,
        sourceTerminalIds: true,
        announceOnMenuScreens: true,
        menuAnnouncementDurationSec: true,
        displayBackgroundColor: true,
        orderCardBackgroundColor: true,
        statusColorPendingPayment: true,
        statusColorOpen: true,
        statusColorPreparing: true,
        statusColorDone: true,
        showOrderAge: true,
        showTerminalInfo: true,
        showPaymentInfo: true,
        showTotal: true,
        showItems: true,
        showStatusBadge: true,
        showPickupNumber: true,
        showOrderNumber: true,
        autoScaleLayout: true,
        pickupShowOnlyNumber: true,
        pickupShowOpen: true,
        pickupShowPreparing: true,
        pickupShowDone: true,
        statusAnimationMode: true,
        statusAnimationDurationMs: true,
        orderAgeFontSize: true,
        orderAgeAlertThresholdSec: true,
        orderAgeAlertAnimationMode: true,
        backgroundMediaMode: true,
        backgroundMediaUrl: true,
        notes: true,
        createdAt: true,
        updatedAt: true,
      },
    })

    if (!display) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }

    if (!display.isActive) {
      return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' })
    }

    const acceptedTerminalIds = parseStoredIdList(display.sourceTerminalIds)
    const statusList = feedStatusesForDisplay(display)
    const assignmentField = roleOrderField(display.displayRole)

    const where: Prisma.OrderWhereInput = {
      tenantId: display.tenantId,
      status: {
        in: statusList,
      },
      [assignmentField]: display.id,
    }

    if (acceptedTerminalIds.length > 0) {
      where.AND = [
        {
          OR: [
            {
              terminalId: {
                in: acceptedTerminalIds,
              },
            },
            {
              sourceChannel: {
                in: ['APP', 'DELIVERY'],
              },
            },
          ],
        },
      ]
    }

    const sortNewest = display.sortMode === 'PRIORITY_NEWEST'

    const fetchedOrders = await prisma.order.findMany({
      where: excludeOperationallyHiddenStripeOrders(where),
      include: {
        terminal: {
          select: {
            id: true,
            name: true,
            terminalCode: true,
            location: true,
          },
        },
        items: {
          include: {
            product: {
              include: {
                category: {
                  select: {
                    id: true,
                    name: true,
                    imageUrl: true,
                  },
                },
              },
            },
          },
        },
      },
      orderBy: sortNewest ? [{ createdAt: 'desc' }] : [{ createdAt: 'asc' }],
      take: 150,
    })

    const drivers = await prisma.user.findMany({
      where: {
        tenantId: display.tenantId,
        role: 'DRIVER',
        isActive: true,
      },
      select: {
        id: true,
        name: true,
      },
      orderBy: [{ name: 'asc' }],
    })

    const complaintStateByOrderId = await loadOrderComplaintStateByOrderId(
      fetchedOrders.map((order) => order.id)
    )
    const latestDriverLocations = await loadLatestDriverLocationByOrderId(
      fetchedOrders.map((order) => order.id)
    )
    const doneAutoHideMs = Math.max(0, display.doneAutoHideSec) * 1000
    const nowMs = Date.now()
    const orders =
      doneAutoHideMs > 0
        ? fetchedOrders.filter((order) => {
            if (order.status !== 'done') {
              return true
            }

            const doneSince = order.forwardedToKitchenAt
              ? new Date(order.forwardedToKitchenAt).getTime()
              : new Date(order.createdAt).getTime()
            return nowMs - doneSince <= doneAutoHideMs
          })
        : fetchedOrders
    const ordersWithComplaintInfo = orders.map((order) => ({
      ...order,
      driverLocation: latestDriverLocations.get(order.id) ?? null,
      complaintOpen: complaintStateByOrderId.get(order.id)?.complaintOpen ?? false,
      complaintCount: complaintStateByOrderId.get(order.id)?.complaintCount ?? 0,
      latestComplaintAt: complaintStateByOrderId.get(order.id)?.latestComplaintAt ?? null,
      latestComplaintMessage:
        complaintStateByOrderId.get(order.id)?.latestComplaintMessage ?? null,
      latestComplaintImageCount: complaintStateByOrderId.get(order.id)?.latestComplaintImageCount ?? 0,
      complaints: complaintStateByOrderId.get(order.id)?.complaints ?? [],
    }))

    const activeDriverDevices = await listDriverDeviceSessionsForTenant(display.tenantId, {
      displayCode: display.displayCode,
    })
    const nowIso = new Date().toISOString()
    const displayType =
      display.displayRole === 'KITCHEN'
        ? 'KITCHEN'
        : display.displayRole === 'PICKUP'
        ? 'PICKUP_NUMBERS'
        : 'MIXED'

    return res.json({
      status: display.isActive ? 'online' : 'inactive',
      serverTime: nowIso,
      displayType,
      ...mapDisplayOutput(display),
      display: mapDisplayOutput(display),
      orders: ordersWithComplaintInfo,
      drivers,
      activeDriverDevices,
      generatedAt: nowIso,
    })
  } catch (error) {
    console.error('GET PUBLIC ORDER DISPLAY FEED ERROR:', error)
    return res.status(500).json({ error: 'Bestell-Display Feed konnte nicht geladen werden' })
  }
})

router.get('/public/:displayCode/orders/:orderId/receipt-jobs', async (req, res) => {
  try {
    const displayCode = Array.isArray(req.params.displayCode)
      ? req.params.displayCode[0]
      : req.params.displayCode
    const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId
    const queryKind = Array.isArray(req.query.kind) ? req.query.kind[0] : req.query.kind
    const queryTrackingUrl = Array.isArray(req.query.trackingUrl)
      ? req.query.trackingUrl[0]
      : req.query.trackingUrl
    const queryLocale = Array.isArray(req.query.locale) ? req.query.locale[0] : req.query.locale
    const queryTimeZone = Array.isArray(req.query.timeZone)
      ? req.query.timeZone[0]
      : req.query.timeZone
    const kindParam =
      normalizeText(typeof queryKind === 'string' ? queryKind : null)?.toLowerCase() ?? 'both'
    const trackingUrl = normalizeText(typeof queryTrackingUrl === 'string' ? queryTrackingUrl : null)
    const locale = normalizeText(typeof queryLocale === 'string' ? queryLocale : null) ?? 'de-DE'
    const timeZone =
      normalizeText(typeof queryTimeZone === 'string' ? queryTimeZone : null) ?? 'Europe/Berlin'

    if (!displayCode || !orderId) {
      return res.status(400).json({ error: 'displayCode oder orderId fehlt' })
    }
    if (!['customer', 'kitchen', 'both'].includes(kindParam)) {
      return res.status(400).json({ error: 'kind muss customer, kitchen oder both sein' })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: displayCode.toUpperCase() },
      select: {
        id: true,
        tenantId: true,
        displayRole: true,
        displayCode: true,
        isActive: true,
        sourceTerminalIds: true,
        tenant: {
          select: {
            name: true,
            email: true,
            businessSettings: true,
          },
        },
      },
    })

    if (!display) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }
    if (!display.isActive) {
      return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' })
    }

    const existingOrder = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        sourceChannel: true,
        terminalId: true,
        cashDisplayId: true,
        kitchenDisplayId: true,
        pickupDisplayId: true,
      },
    })

    if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    const expectedDisplayIdField = roleOrderField(display.displayRole)
    const assignedDisplayId =
      expectedDisplayIdField === 'cashDisplayId'
        ? existingOrder.cashDisplayId
        : expectedDisplayIdField === 'pickupDisplayId'
        ? existingOrder.pickupDisplayId
        : existingOrder.kitchenDisplayId

    if (assignedDisplayId !== display.id) {
      return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Display' })
    }

    const acceptedTerminalIds = parseStoredIdList(display.sourceTerminalIds)
    const isAppOrder =
      existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY'
    if (
      acceptedTerminalIds.length > 0 &&
      !isAppOrder &&
      (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))
    ) {
      return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' })
    }

    const order = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        createdAt: true,
        sourceChannel: true,
        serviceType: true,
        subtotal: true,
        deliveryFee: true,
        total: true,
        estimatedMinutes: true,
        assignedDriverName: true,
        customerName: true,
        customerPhone: true,
        customerAddress: true,
        customerZipCode: true,
        customerCity: true,
        appCustomerAccount: {
          select: {
            fullName: true,
          },
        },
        assignedDriver: {
          select: {
            name: true,
          },
        },
        items: {
          select: {
            quantity: true,
            price: true,
            modifierSnapshot: true,
            product: {
              select: {
                name: true,
              },
            },
          },
        },
      },
    })

    if (!order) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    const normalizedOrder = {
      ...order,
      items: order.items.map((item) => ({
        ...item,
        modifierSnapshot: normalizeModifierSnapshot(item.modifierSnapshot),
      })),
    }

    const parsedSettings = parseSettings(display.tenant.businessSettings, {
      name: display.tenant.name,
      email: display.tenant.email,
    })

    const tenantProfile = {
      name: parsedSettings.businessName ?? display.tenant.name,
      street: parsedSettings.street,
      zipCode: parsedSettings.zipCode,
      city: parsedSettings.city,
      phone: parsedSettings.phone,
    }

    const options = {
      tenantProfile,
      trackingUrl,
      locale,
      timeZone,
    }

    const jobs: Array<{
      kind: 'CUSTOMER' | 'KITCHEN'
      templateId: string
      codepage: string
      charsPerLine: number
      commands: unknown
      escposBase64: string
      escposHex: string
      bytesLength: number
    }> = []

    if (kindParam === 'customer' || kindParam === 'both') {
      const render = buildCustomerReceiptJob80mm(normalizedOrder, options)
      const encoded = encodeReceiptToEscPosBytes(render)
      jobs.push({
        kind: 'CUSTOMER',
        templateId: render.templateId,
        codepage: render.codepage,
        charsPerLine: render.charsPerLine,
        commands: render.commands,
        escposBase64: encoded.base64,
        escposHex: encoded.hex,
        bytesLength: encoded.bytes.length,
      })
    }

    if (kindParam === 'kitchen' || kindParam === 'both') {
      const render = buildKitchenReceiptJob80mm(normalizedOrder, options)
      const encoded = encodeReceiptToEscPosBytes(render)
      jobs.push({
        kind: 'KITCHEN',
        templateId: render.templateId,
        codepage: render.codepage,
        charsPerLine: render.charsPerLine,
        commands: render.commands,
        escposBase64: encoded.base64,
        escposHex: encoded.hex,
        bytesLength: encoded.bytes.length,
      })
    }

    return res.json({
      ok: true,
      displayCode: display.displayCode,
      orderId: order.id,
      requestedAt: new Date().toISOString(),
      jobs,
    })
  } catch (error) {
    console.error('GET PUBLIC ORDER DISPLAY RECEIPT JOBS ERROR:', error)
    return res.status(500).json({ error: 'Receipt-Jobs konnten nicht erstellt werden' })
  }
})

router.post(
  ORDER_DISPLAY_DRIVER_DEVICE_SESSION_ROUTES,
  requirePermission(PermissionKey.ORDERS_WRITE),
  rateLimitDisplayPairing,
  async (req, res) => {
  try {
    const displayCode = Array.isArray(req.params.displayCode)
      ? req.params.displayCode[0]
      : req.params.displayCode
    if (!displayCode) {
      return res.status(400).json({ error: 'displayCode fehlt' })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: displayCode.toUpperCase() },
      select: {
        id: true,
        tenantId: true,
        displayCode: true,
        isActive: true,
        tenant: {
          select: {
            name: true,
            email: true,
            businessSettings: true,
          },
        },
      },
    })

    if (!display) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }
    if (!display.isActive) {
      return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' })
    }
    await ensureDisplayTenantAccess(req, display.tenantId)

    const parsedTenantSettings = parseSettings(display.tenant.businessSettings, {
      name: display.tenant.name,
      email: display.tenant.email,
    })
    const requestedHours = parseDriverAccessHours((req.body as { accessHours?: unknown }).accessHours)
    const accessHours = requestedHours ?? parsedTenantSettings.driver.defaultAccessHours
    const normalizedDeviceLabel =
      normalizeDeviceLabel((req.body as { deviceLabel?: unknown }).deviceLabel) ??
      `Fahrergeraet ${new Date().toLocaleString('de-DE')}`
    const sessionId = createDriverDeviceSessionId()
    const expiresAtMs = Date.now() + accessHours * 60 * 60 * 1000
    const expiresAtIso = new Date(expiresAtMs).toISOString()
    const pairingToken = signDriverDeviceToken({
      sid: sessionId,
      tenantId: display.tenantId,
      displayCode: display.displayCode,
      deviceLabel: normalizedDeviceLabel,
      driverUserId: null,
      driverName: null,
      kind: 'PAIRING',
      expiresAtMs,
    })
    const apiBaseUrl = resolvePublicApiBaseUrl()
    const pairingPayload = JSON.stringify({
      type: 'DRIVER_PAIRING',
      apiBaseUrl,
      tenantId: display.tenantId,
      displayCode: display.displayCode,
      pairingToken,
      expiresAt: expiresAtIso,
    })
    const legacyPairingPayload = `klarando-driver-pair:${display.displayCode}:${pairingToken}`

    await writeAuditLog({
      req,
      module: DRIVER_DEVICE_SESSION_MODULE,
      action: 'session_issued',
      targetType: DRIVER_DEVICE_SESSION_TARGET_TYPE,
      targetId: sessionId,
      tenantId: display.tenantId,
      metadata: {
        displayId: display.id,
        displayCode: display.displayCode,
        deviceLabel: normalizedDeviceLabel,
        expiresAt: expiresAtIso,
        driverUserId: null,
        driverName: null,
      },
    })

    return res.status(201).json({
      ok: true,
      sessionId,
      displayCode: display.displayCode,
      tenantId: display.tenantId,
      deviceLabel: normalizedDeviceLabel,
      accessHours,
      expiresAt: expiresAtIso,
      pairingToken,
      pairingPayload,
      legacyPairingPayload,
      qrImageUrl: `https://api.qrserver.com/v1/create-qr-code/?size=340x340&data=${encodeURIComponent(
        pairingPayload
      )}`,
    })
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('CREATE DRIVER DEVICE SESSION ERROR:', error)
    return res.status(500).json({ error: 'Fahrergeraet-QR konnte nicht erstellt werden' })
  }
})

router.get(
  ORDER_DISPLAY_DRIVER_DEVICE_ACTIVE_ROUTES,
  requirePermission(PermissionKey.ORDERS_READ),
  async (req, res) => {
  try {
    const displayCode = Array.isArray(req.params.displayCode)
      ? req.params.displayCode[0]
      : req.params.displayCode
    if (!displayCode) {
      return res.status(400).json({ error: 'displayCode fehlt' })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: displayCode.toUpperCase() },
      select: {
        id: true,
        tenantId: true,
        displayCode: true,
      },
    })
    if (!display) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }
    await ensureDisplayTenantAccess(req, display.tenantId)

    const sessions = await listDriverDeviceSessionsForTenant(display.tenantId, {
      displayCode: display.displayCode,
    })

    return res.json({
      total: sessions.length,
      sessions,
      generatedAt: new Date().toISOString(),
    })
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET ACTIVE DRIVER DEVICES ERROR:', error)
    return res.status(500).json({ error: 'Aktive Fahrergeraete konnten nicht geladen werden' })
  }
})

router.post(
  ORDER_DISPLAY_DRIVER_DEVICE_REVOKE_ROUTES,
  requirePermission(PermissionKey.ORDERS_WRITE),
  async (req, res) => {
  try {
    const displayCode = Array.isArray(req.params.displayCode)
      ? req.params.displayCode[0]
      : req.params.displayCode
    const rawSessionId = (req.body as { sessionId?: unknown }).sessionId
    const sessionId = normalizeText(typeof rawSessionId === 'string' ? rawSessionId : null)

    if (!displayCode || !sessionId) {
      return res.status(400).json({ error: 'displayCode oder sessionId fehlt' })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: displayCode.toUpperCase() },
      select: {
        id: true,
        tenantId: true,
        displayCode: true,
      },
    })
    if (!display) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }
    await ensureDisplayTenantAccess(req, display.tenantId)

    const session = await resolveDriverDeviceSession(sessionId, display.tenantId)
    if (!session || session.displayCode !== display.displayCode) {
      return res.status(404).json({ error: 'Fahrergeraete-Session nicht gefunden' })
    }
    if (session.revokedAt) {
      return res.status(409).json({ error: 'Session wurde bereits getrennt' })
    }

    await writeAuditLog({
      req,
      module: DRIVER_DEVICE_SESSION_MODULE,
      action: 'session_revoked',
      targetType: DRIVER_DEVICE_SESSION_TARGET_TYPE,
      targetId: sessionId,
      tenantId: display.tenantId,
      metadata: {
        displayId: display.id,
        displayCode: display.displayCode,
        deviceLabel: session.deviceLabel,
        expiresAt: session.expiresAt,
        driverUserId: session.driverUserId,
        driverName: session.driverName,
      },
    })

    return res.json({ ok: true, sessionId })
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('REVOKE DRIVER DEVICE SESSION ERROR:', error)
    return res.status(500).json({ error: 'Fahrergeraete-Session konnte nicht getrennt werden' })
  }
})

router.post(
  ORDER_DISPLAY_ORDER_STATUS_ROUTES,
  requireOrderDisplayMutationAccess,
  async (req, res) => {
  try {
    const displayCode = Array.isArray(req.params.displayCode)
      ? req.params.displayCode[0]
      : req.params.displayCode
    const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId
    const { status } = req.body as { status?: string }

    if (!displayCode || !orderId || !status) {
      return res.status(400).json({ error: 'displayCode, orderId oder status fehlt' })
    }

    const normalizedStatus = normalizeOrderWorkflowStatus(status)
    if (!normalizedStatus) {
      return res.status(400).json({ error: 'Ungueltiger Status' })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: displayCode.toUpperCase() },
      select: {
        id: true,
        tenantId: true,
        displayRole: true,
        isActive: true,
        sourceTerminalIds: true,
      },
    })

    if (!display) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }

    if (!display.isActive) {
      return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' })
    }
    await ensureDisplayTenantAccess(req, display.tenantId, displayCode)

    if (display.displayRole === 'PICKUP') {
      return res.status(403).json({
        error: 'Abhol-Display ist nur fuer Anzeige konfiguriert und kann keine Statusaenderung ausfuehren',
      })
    }

    const existingOrder = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        serviceType: true,
        sourceChannel: true,
        terminalId: true,
        cashDisplayId: true,
        kitchenDisplayId: true,
        pickupDisplayId: true,
        pickupNumber: true,
        status: true,
        acceptedAt: true,
        assignedDriverId: true,
        assignedDriverName: true,
      },
    })

    if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    const expectedDisplayIdField = roleOrderField(display.displayRole)
    const assignedDisplayId =
      expectedDisplayIdField === 'cashDisplayId'
        ? existingOrder.cashDisplayId
        : expectedDisplayIdField === 'pickupDisplayId'
        ? existingOrder.pickupDisplayId
        : existingOrder.kitchenDisplayId

    if (assignedDisplayId !== display.id) {
      return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Display' })
    }

    const acceptedTerminalIds = parseStoredIdList(display.sourceTerminalIds)
    const isAppOrder =
      existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY'
    if (
      acceptedTerminalIds.length > 0 &&
      !isAppOrder &&
      (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))
    ) {
      return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' })
    }

    if (normalizedStatus === 'archived' && display.displayRole !== 'CASH') {
      return res.status(403).json({
        error: 'Archivierung ist nur am Kassendisplay zulaessig',
      })
    }

    if (normalizedStatus === 'out_for_delivery') {
      if (display.displayRole !== 'CASH') {
        return res.status(403).json({
          error: 'Status Fahrer unterwegs darf nur am Kassendisplay gesetzt werden',
        })
      }
      if (existingOrder.serviceType !== 'DELIVERY') {
        return res.status(400).json({
          error: 'Nur Lieferbestellungen koennen auf Fahrer unterwegs gesetzt werden',
        })
      }
    }

    const currentWorkflowStatus = normalizeOrderWorkflowStatus(existingOrder.status)
    if (!currentWorkflowStatus) {
      return res.status(409).json({ error: `Ungueltiger bestehender Bestellstatus: ${String(existingOrder.status)}` })
    }
    if (normalizedStatus === 'out_for_delivery') {
      validateDispatchReadiness(
        {
          serviceType: existingOrder.serviceType,
          status: currentWorkflowStatus,
          assignedDriverId: existingOrder.assignedDriverId,
          assignedDriverName: existingOrder.assignedDriverName,
        },
        { requireAssignedDriver: true, context: 'display-status' }
      )
    }

    const shouldAssignPickupNumber =
      existingOrder.pickupNumber === null &&
      (normalizedStatus === 'open' ||
        normalizedStatus === 'preparing' ||
        normalizedStatus === 'out_for_delivery' ||
        normalizedStatus === 'done')
    const resolvedPickupNumber = shouldAssignPickupNumber
      ? await generateNextPickupNumberForTenant(display.tenantId)
      : existingOrder.pickupNumber

    let pickupAnnouncedAt: Date | null | undefined
    let pickupAnnounceUntil: Date | null | undefined

    if (normalizedStatus === 'done' && existingOrder.pickupDisplayId && resolvedPickupNumber !== null) {
      const pickupDisplay = await prisma.orderDisplay.findUnique({
        where: { id: existingOrder.pickupDisplayId },
        select: {
          announceOnMenuScreens: true,
          menuAnnouncementDurationSec: true,
        },
      })

      if (pickupDisplay?.announceOnMenuScreens) {
        const now = new Date()
        pickupAnnouncedAt = now
        pickupAnnounceUntil = new Date(
          now.getTime() + pickupDisplay.menuAnnouncementDurationSec * 1000
        )
      }
    }

    if (normalizedStatus === 'archived') {
      pickupAnnouncedAt = null
      pickupAnnounceUntil = null
    }

    if (normalizedStatus === 'done') {
      await prisma.orderItem.updateMany({
        where: {
          orderId,
        },
        data: {
          productionStatus: 'DONE',
          productionDoneAt: new Date(),
        },
      })
    } else if (normalizedStatus === 'open') {
      await prisma.orderItem.updateMany({
        where: {
          orderId,
        },
        data: {
          productionStatus: 'OPEN',
          productionDoneAt: null,
        },
      })
    }

    const updated = await prisma.order.update({
      where: { id: orderId },
      data: {
        ...buildOrderStatusUpdate({
          currentStatus: currentWorkflowStatus,
          nextStatus: normalizedStatus,
          now: new Date(),
          currentAcceptedAt: existingOrder.acceptedAt,
        }),
        pickupNumber: shouldAssignPickupNumber ? resolvedPickupNumber : undefined,
        pickupAnnouncedAt,
        pickupAnnounceUntil,
      },
      include: {
        terminal: {
          select: {
            id: true,
            name: true,
            terminalCode: true,
            location: true,
          },
        },
        items: {
          include: {
            product: {
              include: {
                category: {
                  select: {
                    id: true,
                    name: true,
                    imageUrl: true,
                  },
                },
              },
            },
          },
        },
      },
    })

    return res.json(updated)
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE PUBLIC ORDER DISPLAY STATUS ERROR:', error)
    return res.status(500).json({ error: 'Status konnte nicht aktualisiert werden' })
  }
})

router.post(
  ORDER_DISPLAY_ORDER_ITEM_STATUS_ROUTES,
  requireOrderDisplayMutationAccess,
  async (req, res) => {
  try {
    const displayCode = Array.isArray(req.params.displayCode)
      ? req.params.displayCode[0]
      : req.params.displayCode
    const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId
    const itemId = Array.isArray(req.params.itemId) ? req.params.itemId[0] : req.params.itemId
    const { status } = req.body as { status?: string }

    if (!displayCode || !orderId || !itemId || !status) {
      return res.status(400).json({ error: 'displayCode, orderId, itemId oder status fehlt' })
    }

    const normalizedItemStatus = normalizeOrderItemProductionStatus(status)
    if (!normalizedItemStatus) {
      return res.status(400).json({ error: 'Ungueltiger Item-Status (OPEN oder DONE)' })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: displayCode.toUpperCase() },
      select: {
        id: true,
        tenantId: true,
        displayRole: true,
        isActive: true,
        sourceTerminalIds: true,
      },
    })

    if (!display) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }

    if (!display.isActive) {
      return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' })
    }
    await ensureDisplayTenantAccess(req, display.tenantId, displayCode)

    if (display.displayRole === 'PICKUP') {
      return res.status(403).json({
        error: 'Abhol-Display ist nur fuer Anzeige konfiguriert und kann keine Positionen bearbeiten',
      })
    }

    const existingOrder = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        sourceChannel: true,
        terminalId: true,
        cashDisplayId: true,
        kitchenDisplayId: true,
        pickupDisplayId: true,
        pickupNumber: true,
        status: true,
        acceptedAt: true,
      },
    })

    if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    const expectedDisplayIdField = roleOrderField(display.displayRole)
    const assignedDisplayId =
      expectedDisplayIdField === 'cashDisplayId'
        ? existingOrder.cashDisplayId
        : expectedDisplayIdField === 'pickupDisplayId'
        ? existingOrder.pickupDisplayId
        : existingOrder.kitchenDisplayId

    if (assignedDisplayId !== display.id) {
      return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Display' })
    }

    const acceptedTerminalIds = parseStoredIdList(display.sourceTerminalIds)
    const isAppOrder =
      existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY'
    if (
      acceptedTerminalIds.length > 0 &&
      !isAppOrder &&
      (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))
    ) {
      return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' })
    }

    const existingItem = await prisma.orderItem.findUnique({
      where: { id: itemId },
      select: {
        id: true,
        orderId: true,
        productionStatus: true,
      },
    })

    if (!existingItem || existingItem.orderId !== existingOrder.id) {
      return res.status(404).json({ error: 'Bestellposition nicht gefunden' })
    }

    const now = new Date()
    const currentItemStatus = normalizeOrderItemProductionStatus(existingItem.productionStatus)
    if (!currentItemStatus) {
      return res.status(409).json({ error: `Ungueltiger bestehender Item-Status: ${String(existingItem.productionStatus)}` })
    }
    await prisma.orderItem.update({
      where: { id: existingItem.id },
      data: buildOrderItemStatusUpdate({
        currentStatus: currentItemStatus,
        nextStatus: normalizedItemStatus,
        now,
      }),
    })

    const itemStatuses = await prisma.orderItem.findMany({
      where: { orderId: existingOrder.id },
      select: { productionStatus: true },
    })
    const normalizedItemStatuses = itemStatuses
      .map((entry) => normalizeOrderItemProductionStatus(entry.productionStatus))
      .filter((entry): entry is NonNullable<typeof entry> => Boolean(entry))
    if (normalizedItemStatuses.length !== itemStatuses.length) {
      return res.status(409).json({ error: 'Mindestens ein bestehender Item-Status ist ungueltig' })
    }

    const nextStatus = deriveOrderStatusFromItemStatuses(normalizedItemStatuses)
    const shouldAssignPickupNumber =
      existingOrder.pickupNumber === null &&
      (nextStatus === 'open' || nextStatus === 'preparing' || nextStatus === 'done')
    const resolvedPickupNumber = shouldAssignPickupNumber
      ? await generateNextPickupNumberForTenant(display.tenantId)
      : existingOrder.pickupNumber

    const currentWorkflowStatus = normalizeOrderWorkflowStatus(existingOrder.status)
    if (!currentWorkflowStatus) {
      return res.status(409).json({ error: `Ungueltiger bestehender Bestellstatus: ${String(existingOrder.status)}` })
    }

    if (nextStatus !== existingOrder.status || shouldAssignPickupNumber) {
      await prisma.order.update({
        where: { id: existingOrder.id },
        data: {
          ...buildOrderStatusUpdate({
            currentStatus: currentWorkflowStatus,
            nextStatus,
            now: new Date(),
            currentAcceptedAt: existingOrder.acceptedAt,
          }),
          pickupNumber: shouldAssignPickupNumber ? resolvedPickupNumber : undefined,
        },
      })
    }

    const updated = await prisma.order.findUnique({
      where: { id: existingOrder.id },
      include: {
        terminal: {
          select: {
            id: true,
            name: true,
            terminalCode: true,
            location: true,
          },
        },
        items: {
          include: {
            product: {
              include: {
                category: {
                  select: {
                    id: true,
                    name: true,
                    imageUrl: true,
                  },
                },
              },
            },
          },
        },
      },
    })

    return res.json(updated)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE PUBLIC ORDER DISPLAY ITEM STATUS ERROR:', error)
    return res.status(500).json({ error: 'Positionsstatus konnte nicht aktualisiert werden' })
  }
})

router.post(
  ORDER_DISPLAY_ORDER_PAYMENT_ROUTES,
  requireOrderDisplayMutationAccess,
  async (req, res) => {
  try {
    const displayCode = Array.isArray(req.params.displayCode)
      ? req.params.displayCode[0]
      : req.params.displayCode
    const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId
    const { paid } = req.body as {
      paid?: boolean
    }

    if (!displayCode || !orderId || typeof paid !== 'boolean') {
      return res.status(400).json({ error: 'displayCode, orderId oder paid fehlt' })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: displayCode.toUpperCase() },
      select: {
        id: true,
        tenantId: true,
        displayRole: true,
        isActive: true,
        sourceTerminalIds: true,
      },
    })

    if (!display) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }

    if (!display.isActive) {
      return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' })
    }
    await ensureDisplayTenantAccess(req, display.tenantId, displayCode)

    if (display.displayRole !== 'CASH') {
      return res.status(403).json({ error: 'Zahlungsstatus darf nur am Kassendisplay geaendert werden' })
    }

    const existingOrder = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        sourceChannel: true,
        terminalId: true,
        cashDisplayId: true,
        paymentStatus: true,
        paidAt: true,
      },
    })

    if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    if (existingOrder.cashDisplayId !== display.id) {
      return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Kassendisplay' })
    }

    const acceptedTerminalIds = parseStoredIdList(display.sourceTerminalIds)
    const isAppOrder =
      existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY'
    if (
      acceptedTerminalIds.length > 0 &&
      !isAppOrder &&
      (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))
    ) {
      return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' })
    }

    if (!paid) {
      return res.status(400).json({
        error:
          'Rueckgaengig ist am Kassendisplay deaktiviert. Zahlung kann hier nur als bezahlt markiert werden.',
      })
    }

    const currentPaymentStatus = normalizeOrderPaymentStatus(existingOrder.paymentStatus)
    if (!currentPaymentStatus) {
      return res.status(409).json({ error: `Ungueltiger bestehender Zahlungsstatus: ${String(existingOrder.paymentStatus)}` })
    }

    const updated = await prisma.order.update({
      where: { id: orderId },
      data: buildOrderPaymentStatusUpdate({
        currentStatus: currentPaymentStatus,
        nextStatus: paid ? 'PAID' : 'UNPAID',
        now: new Date(),
        preservePaidAt: existingOrder.paidAt,
      }),
      include: {
        terminal: {
          select: {
            id: true,
            name: true,
            terminalCode: true,
            location: true,
          },
        },
        items: {
          include: {
            product: {
              include: {
                category: {
                  select: {
                    id: true,
                    name: true,
                    imageUrl: true,
                  },
                },
              },
            },
          },
        },
      },
    })

    return res.json(updated)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE PUBLIC ORDER DISPLAY PAYMENT ERROR:', error)
    return res.status(500).json({ error: 'Zahlungsstatus konnte nicht aktualisiert werden' })
  }
})

router.post(
  ORDER_DISPLAY_ORDER_ACCEPT_ROUTES,
  requireOrderDisplayMutationAccess,
  async (req, res) => {
  try {
    const displayCode = Array.isArray(req.params.displayCode)
      ? req.params.displayCode[0]
      : req.params.displayCode
    const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId
    const { estimatedMinutes } = req.body as {
      estimatedMinutes?: number
    }

    const parsedEstimatedMinutes = Number(estimatedMinutes)
    if (
      !displayCode ||
      !orderId ||
      !Number.isFinite(parsedEstimatedMinutes) ||
      parsedEstimatedMinutes < 5 ||
      parsedEstimatedMinutes > 240
    ) {
      return res.status(400).json({
        error: 'displayCode, orderId oder estimatedMinutes (5-240) fehlt',
      })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: displayCode.toUpperCase() },
      select: {
        id: true,
        tenantId: true,
        displayRole: true,
        isActive: true,
        sourceTerminalIds: true,
      },
    })

    if (!display) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }

    if (!display.isActive) {
      return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' })
    }
    await ensureDisplayTenantAccess(req, display.tenantId, displayCode)

    if (display.displayRole !== 'CASH') {
      return res
        .status(403)
        .json({ error: 'Annahme mit Zeitvorschlag ist nur am Kassendisplay erlaubt' })
    }

    const existingOrder = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        sourceChannel: true,
        terminalId: true,
        cashDisplayId: true,
        pickupNumber: true,
        status: true,
        paymentStatus: true,
        acceptedAt: true,
      },
    })

    if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    if (existingOrder.cashDisplayId !== display.id) {
      return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Kassendisplay' })
    }

    const acceptedTerminalIds = parseStoredIdList(display.sourceTerminalIds)
    const isAppOrder =
      existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY'
    if (
      acceptedTerminalIds.length > 0 &&
      !isAppOrder &&
      (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))
    ) {
      return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' })
    }

    const now = new Date()
    const pickupNumber =
      existingOrder.pickupNumber ?? (await generateNextPickupNumberForTenant(display.tenantId))
    const currentWorkflowStatus = normalizeOrderWorkflowStatus(existingOrder.status)
    if (!currentWorkflowStatus) {
      return res.status(409).json({ error: `Ungueltiger bestehender Bestellstatus: ${String(existingOrder.status)}` })
    }
    console.info('ORDER_ACCEPT_DEBUG', {
      orderId: existingOrder.id,
      currentStatus: existingOrder.status,
      paymentStatus: existingOrder.paymentStatus,
      requestedStatus: 'accepted',
      userRole: req.authUser?.role ?? 'ORDERDESK_DEVICE',
      tenantId: display.tenantId,
      reason: 'accept_order_requested',
    })
    let updated: Awaited<ReturnType<typeof prisma.order.update>>
    try {
      console.info('ORDER_ACCEPT_UPDATE_ATTEMPT', {
        orderId: existingOrder.id,
        currentStatus: existingOrder.status,
        paymentStatus: existingOrder.paymentStatus,
        requestedStatus: 'accepted',
        estimatedMinutes: Math.round(parsedEstimatedMinutes),
        pickupNumber,
        userRole: req.authUser?.role ?? 'ORDERDESK_DEVICE',
        tenantId: display.tenantId,
      })
      updated = await prisma.order.update({
        where: { id: orderId },
        data: buildOrderAcceptanceUpdate({
          currentStatus: currentWorkflowStatus,
          currentAcceptedAt: existingOrder.acceptedAt,
          estimatedMinutes: Math.round(parsedEstimatedMinutes),
          pickupNumber,
          now,
        }),
        include: {
          terminal: {
            select: {
              id: true,
              name: true,
              terminalCode: true,
              location: true,
            },
          },
          tenant: {
            select: {
              id: true,
              name: true,
            },
          },
          appCustomerAccount: {
            select: {
              id: true,
              email: true,
              fullName: true,
            },
          },
          items: {
            include: {
              product: {
                include: {
                  category: {
                    select: {
                      id: true,
                      name: true,
                      imageUrl: true,
                    },
                  },
                },
              },
            },
          },
        },
      })
      console.info('ORDER_ACCEPT_UPDATE_SUCCESS', {
        orderId: updated.id,
        previousStatus: existingOrder.status,
        nextStatus: updated.status,
        paymentStatus: updated.paymentStatus,
        estimatedMinutes: updated.estimatedMinutes,
        tenantId: updated.tenantId,
        userRole: req.authUser?.role ?? 'ORDERDESK_DEVICE',
      })
    } catch (error) {
      const transitionError = asOrderTransitionError(error)
      console.error('ORDER_ACCEPT_UPDATE_FAILED', {
        orderId: existingOrder.id,
        currentStatus: existingOrder.status,
        paymentStatus: existingOrder.paymentStatus,
        requestedStatus: 'accepted',
        estimatedMinutes: Math.round(parsedEstimatedMinutes),
        tenantId: display.tenantId,
        userRole: req.authUser?.role ?? 'ORDERDESK_DEVICE',
        message:
          transitionError?.message ??
          (error instanceof Error ? error.message : String(error)),
      })
      throw error
    }

    try {
      await writeAuditLog({
        req,
        module: 'order_display',
        action: 'order_accepted_with_eta',
        targetType: 'order',
        targetId: updated.id,
        tenantId: updated.tenantId,
        metadata: {
          displayId: display.id,
          displayRole: display.displayRole,
          estimatedMinutes: Math.round(parsedEstimatedMinutes),
          pickupNumber,
        },
      })
    } catch (error) {
      console.error('ORDER_ACCEPT_AUDIT_FAILED', {
        orderId: updated.id,
        tenantId: updated.tenantId,
        message: error instanceof Error ? error.message : String(error),
      })
    }

    return res.json(updated)
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('ACCEPT ORDER WITH ETA ERROR:', error)
    return res.status(500).json({ error: 'Bestellannahme konnte nicht gespeichert werden' })
  }
})

router.post(
  ORDER_DISPLAY_ORDER_DISPATCH_ROUTES,
  requireOrderDisplayMutationAccess,
  async (req, res) => {
  try {
    const displayCode = Array.isArray(req.params.displayCode)
      ? req.params.displayCode[0]
      : req.params.displayCode
    const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId
    const { driverUserId, driverName, estimatedMinutes } = req.body as {
      driverUserId?: string
      driverName?: string
      estimatedMinutes?: number
    }

    const normalizedDriverUserId = normalizeText(driverUserId)
    const normalizedDriverName = normalizeText(driverName)
    const parsedEstimatedMinutes =
      estimatedMinutes === undefined || estimatedMinutes === null
        ? null
        : Math.trunc(Number(estimatedMinutes))

    if (!displayCode || !orderId) {
      return res.status(400).json({ error: 'displayCode oder orderId fehlt' })
    }

    if (
      parsedEstimatedMinutes !== null &&
      (!Number.isFinite(parsedEstimatedMinutes) ||
        parsedEstimatedMinutes < 5 ||
        parsedEstimatedMinutes > 240)
    ) {
      return res
        .status(400)
        .json({ error: 'estimatedMinutes muss zwischen 5 und 240 Minuten liegen' })
    }

    const display = await prisma.orderDisplay.findUnique({
      where: { displayCode: displayCode.toUpperCase() },
      select: {
        id: true,
        tenantId: true,
        displayRole: true,
        isActive: true,
        sourceTerminalIds: true,
      },
    })

    if (!display) {
      return res.status(404).json({ error: 'Bestell-Display nicht gefunden' })
    }

    if (!display.isActive) {
      return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' })
    }
    await ensureDisplayTenantAccess(req, display.tenantId, displayCode)

    if (display.displayRole !== 'CASH') {
      return res.status(403).json({
        error: 'Fahrerzuweisung ist nur am Kassendisplay erlaubt',
      })
    }

    const existingOrder = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        sourceChannel: true,
        terminalId: true,
        cashDisplayId: true,
        serviceType: true,
        status: true,
        estimatedMinutes: true,
        pickupNumber: true,
        acceptedAt: true,
        driverAssignedAt: true,
        assignedDriverId: true,
        assignedDriverName: true,
      },
    })

    if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    if (existingOrder.cashDisplayId !== display.id) {
      return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Kassendisplay' })
    }

    if (existingOrder.serviceType !== 'DELIVERY') {
      return res.status(400).json({ error: 'Nur Lieferbestellungen koennen einem Fahrer zugeordnet werden' })
    }

    if (existingOrder.status === 'archived') {
      return res.status(400).json({ error: 'Archivierte Bestellungen koennen nicht versendet werden' })
    }

    const acceptedTerminalIds = parseStoredIdList(display.sourceTerminalIds)
    const isAppOrder =
      existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY'
    if (
      acceptedTerminalIds.length > 0 &&
      !isAppOrder &&
      (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))
    ) {
      return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' })
    }

    let resolvedDriver:
      | {
          id: string
          name: string
        }
      | null = null

    if (normalizedDriverUserId) {
      const candidate = await prisma.user.findUnique({
        where: { id: normalizedDriverUserId },
        select: {
          id: true,
          name: true,
          role: true,
          isActive: true,
          tenantId: true,
        },
      })

      if (!candidate || !candidate.isActive || candidate.role !== 'DRIVER') {
        return res.status(400).json({ error: 'Fahrer ist ungueltig oder inaktiv' })
      }

      if (candidate.tenantId !== existingOrder.tenantId) {
        return res.status(400).json({ error: 'Fahrer gehoert nicht zur Filiale dieser Bestellung' })
      }

      resolvedDriver = {
        id: candidate.id,
        name: candidate.name,
      }
    }

    if (!resolvedDriver && !normalizedDriverName) {
      return res.status(400).json({ error: 'Bitte Fahrer auswaehlen oder Fahrernamen eingeben' })
    }

    const now = new Date()
    const nextEstimatedMinutes =
      parsedEstimatedMinutes ?? existingOrder.estimatedMinutes ?? 30
    const pickupNumber =
      existingOrder.pickupNumber ?? (await generateNextPickupNumberForTenant(display.tenantId))
    const currentWorkflowStatus = normalizeOrderWorkflowStatus(existingOrder.status)
    if (!currentWorkflowStatus) {
      return res.status(409).json({ error: `Ungueltiger bestehender Bestellstatus: ${String(existingOrder.status)}` })
    }
    const assignmentIdentity = resolveDriverAssignmentIdentity({
      driverUserId: resolvedDriver?.id ?? null,
      driverName: normalizedDriverName ?? null,
      canonicalDriverName: resolvedDriver?.name ?? null,
    })

    const updated = await prisma.order.update({
      where: { id: orderId },
      data: dispatchOrder(
        {
          serviceType: existingOrder.serviceType,
          status: currentWorkflowStatus,
          assignedDriverId: existingOrder.assignedDriverId,
          assignedDriverName: existingOrder.assignedDriverName,
          driverAssignedAt: existingOrder.driverAssignedAt,
          acceptedAt: existingOrder.acceptedAt,
          estimatedMinutes: existingOrder.estimatedMinutes,
          pickupNumber,
        },
        {
          estimatedMinutes: nextEstimatedMinutes,
          driverUserId: assignmentIdentity.assignedDriverId,
          driverName: assignmentIdentity.assignedDriverName,
          now,
        }
      ),
      include: {
        terminal: {
          select: {
            id: true,
            name: true,
            terminalCode: true,
            location: true,
          },
        },
        assignedDriver: {
          select: {
            id: true,
            name: true,
            email: true,
          },
        },
        items: {
          include: {
            product: {
              include: {
                category: {
                  select: {
                    id: true,
                    name: true,
                    imageUrl: true,
                  },
                },
              },
            },
          },
        },
      },
    })

    await writeAuditLog({
      req,
      module: 'order_display',
      action: 'order_dispatched_to_driver',
      targetType: 'order',
      targetId: updated.id,
      tenantId: updated.tenantId,
      metadata: {
        displayId: display.id,
        driverUserId: assignmentIdentity.assignedDriverId,
        driverName: assignmentIdentity.assignedDriverName,
        estimatedMinutes: nextEstimatedMinutes,
        pickupNumber,
      },
    })

    return res.json(updated)
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DISPATCH ORDER TO DRIVER ERROR:', error)
    return res.status(500).json({ error: 'Fahrerzuweisung konnte nicht gespeichert werden' })
  }
})

export default router
