import { Router } from 'express'
import { PermissionKey, Prisma, UserRole } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { resolveProductOffers } from '../lib/action-pricing'
import { matchServiceArea, parseSettings } from '../lib/business-settings'
import { verifyAppAuthToken } from '../auth/app-token'
import { hashPassword, needsPasswordRehash, verifyPassword } from '../auth/password'
import { decodeStoredProductModifierName } from '../lib/product-modifiers'
import { generateNextPickupNumberForTenant } from '../lib/pickup-number'
import { resolveDisplayRouting } from '../lib/order-routing'
import { signDriverDeviceToken, verifyDriverDeviceToken } from '../auth/driver-device-token'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import {
  beginOrderCreateIdempotency,
  completeOrderCreateIdempotency,
  extractOrderIdempotencyKey,
  releaseOrderCreateIdempotency,
} from '../lib/order-idempotency'
import {
  rateLimitDriverDeviceLogin,
  rateLimitPublicOrderCreate,
} from '../middleware/rate-limit'
import {
  DRIVER_DEVICE_SESSION_MODULE,
  DRIVER_DEVICE_SESSION_TARGET_TYPE,
  type DriverDeviceSessionState,
  listDriverDeviceSessionsForTenant,
  resolveDriverDeviceSession,
} from '../lib/driver-device-sessions'

const router = Router()

const PAYMENT_METHODS = new Set(['CASH', 'CARD', 'PAYPAL', 'KLARNA'])
const SOURCE_CHANNELS = new Set(['POS', 'TERMINAL', 'APP', 'DELIVERY', 'TABLET'])
const APP_ORDER_CHANNELS = new Set(['APP', 'DELIVERY'])
const ORDER_STATUSES = new Set([
  'pending_payment',
  'open',
  'preparing',
  'out_for_delivery',
  'done',
  'archived',
])
const RATING_COOLDOWN_MS = 60 * 60 * 1000
const RATING_WINDOW_MS = 24 * 60 * 60 * 1000
const PENDING_RATING_LOOKBACK_MS = 72 * 60 * 60 * 1000
const MAX_COMPLAINT_IMAGES = 5
const MAX_COMPLAINT_TEXT_LENGTH = 2000
const MAX_COMPLAINT_IMAGE_PAYLOAD = 2_500_000
const MAX_SIGNATURE_IMAGE_PAYLOAD = 3_000_000
const DRIVER_DEVICE_ONLINE_HEARTBEAT_MS = 90_000
const ORDER_MANAGEMENT_SOURCE_FILTERS = new Set([
  'ALL',
  'APP_ONLY',
  'TERMINAL_ONLY',
  ...SOURCE_CHANNELS,
])
const ORDER_MANAGEMENT_STATUS_FILTERS = new Set(['all', ...ORDER_STATUSES])
const ORDER_PAYMENT_STATUSES = new Set(['PAID', 'UNPAID', 'FAILED', 'REFUNDED'])
const ORDER_SERVICE_TYPES = new Set(['DELIVERY', 'PICKUP', 'DINE_IN'])

function sanitizeOrderManagementSource(value: string | null) {
  if (!value) return 'ALL'
  const normalized = value.toUpperCase()
  return ORDER_MANAGEMENT_SOURCE_FILTERS.has(normalized) ? normalized : 'ALL'
}

function sanitizeOrderManagementStatus(value: string | null) {
  if (!value) return 'all'
  const normalized = value.toLowerCase()
  return ORDER_MANAGEMENT_STATUS_FILTERS.has(normalized) ? normalized : 'all'
}

function sanitizeOrderPaymentStatus(value: string | null) {
  if (!value) return null
  const normalized = value.toUpperCase()
  if (normalized === 'ALL') return null
  return ORDER_PAYMENT_STATUSES.has(normalized) ? normalized : null
}

function sanitizeOrderServiceType(value: string | null) {
  if (!value) return null
  const normalized = value.toUpperCase()
  if (normalized === 'ALL') return null
  return ORDER_SERVICE_TYPES.has(normalized) ? normalized : null
}

function toErrorMessage(error: unknown) {
  if (error instanceof Error && error.message.trim().length > 0) {
    return error.message
  }
  return String(error)
}

function extractPrismaErrorDetails(error: unknown) {
  if (!error || typeof error !== 'object') {
    return { code: null as string | null, meta: null as unknown, stack: null as string | null }
  }
  const withCode = error as { code?: string; meta?: unknown; stack?: string }
  return {
    code: typeof withCode.code === 'string' ? withCode.code : null,
    meta: withCode.meta ?? null,
    stack: typeof withCode.stack === 'string' ? withCode.stack : null,
  }
}

function isPrismaMissingColumnOrRelationError(error: unknown) {
  const details = extractPrismaErrorDetails(error)
  if (details.code === 'P2022') return true
  const message = toErrorMessage(error).toLowerCase()
  return message.includes('column') && message.includes('does not exist')
}

type DriverActor =
  | {
      actorType: 'USER'
      tenantId: string
      driverUserId: string
      driverName: string
      sessionId: null
      displayCode: null
      expiresAt: null
      isDeviceActor: false
    }
  | {
      actorType: 'DEVICE'
      tenantId: string
      driverUserId: string | null
      driverName: string
      sessionId: string
      displayCode: string
      expiresAt: string
      isDeviceActor: true
      session: DriverDeviceSessionState
    }

function normalizeText(input?: string | null) {
  if (input === undefined || input === null) {
    return null
  }

  const trimmed = input.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeZipCode(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const digits = value.replace(/[^\d]/g, '')
  if (!digits) {
    return null
  }
  return digits.slice(0, 5)
}

function isPrismaUniqueConstraintError(error: unknown) {
  if (!error || typeof error !== 'object') return false
  return (error as { code?: string }).code === 'P2002'
}

function parseAmountFromText(value: string | null | undefined) {
  if (!value) {
    return null
  }

  const normalized = value.replace(',', '.')
  const match = normalized.match(/-?\d+(?:\.\d+)?/)
  if (!match) {
    return null
  }

  const parsed = Number(match[0])
  if (!Number.isFinite(parsed)) {
    return null
  }

  return Number(parsed.toFixed(2))
}

function readAppBearerToken(authorizationHeader: string | undefined) {
  if (!authorizationHeader || !authorizationHeader.toLowerCase().startsWith('bearer ')) {
    return null
  }
  return authorizationHeader.slice(7).trim()
}

function normalizeDriverLabel(value: string | null | undefined) {
  const normalized = normalizeText(value)
  return normalized ? normalized.toLowerCase() : null
}

function isOrderAssignedToDriverActor(
  order: {
    assignedDriverId: string | null
    assignedDriverName: string | null
  },
  actor: DriverActor
) {
  if (actor.driverUserId && order.assignedDriverId === actor.driverUserId) {
    return true
  }

  const assignedName = normalizeDriverLabel(order.assignedDriverName)
  const actorName = normalizeDriverLabel(actor.driverName)
  if (!assignedName || !actorName) {
    return false
  }
  return assignedName === actorName
}

function parseDriverAccessHours(value: unknown) {
  if (value === undefined || value === null) {
    return null
  }
  const parsed = Math.round(Number(value))
  if (!Number.isFinite(parsed) || parsed < 1 || parsed > 168) {
    return null
  }
  return parsed
}

function parseDriverDevicePairingToken(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  if (!trimmed) {
    return null
  }
  return trimmed
}

function parseDriverPairPayload(value: unknown) {
  const raw = parseDriverDevicePairingToken(value)
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
      const normalizedText = (input: unknown) =>
        typeof input === 'string' && input.trim().length > 0 ? input.trim() : null
      const type = normalizedText(parsed.type)?.toUpperCase()
      if (type && type !== 'DRIVER_PAIRING') {
        return {
          token: null,
          displayCode: null,
          invalidType: type,
        }
      }
      const token = normalizedText(parsed.pairingToken) ?? normalizedText(parsed.token)
      if (!token) {
        return null
      }
      return {
        token,
        displayCode: normalizedText(parsed.displayCode)?.toUpperCase() ?? null,
        invalidType: null,
      }
    } catch {
      return null
    }
  }

  if (raw.startsWith('klarando-driver-pair:')) {
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

async function resolveDriverActor(req: {
  authUser?: {
    id: string
    role: UserRole
    tenantId: string | null
    name: string
  }
  header(name: string): string | undefined
}) {
  const authUser = req.authUser
  if (authUser && authUser.role === UserRole.DRIVER && authUser.tenantId) {
    return {
      actorType: 'USER',
      tenantId: authUser.tenantId,
      driverUserId: authUser.id,
      driverName: authUser.name,
      sessionId: null,
      displayCode: null,
      expiresAt: null,
      isDeviceActor: false,
    } satisfies DriverActor
  }

  const bearerToken = readAppBearerToken(req.header('authorization'))
  if (!bearerToken) {
    return null
  }

  const tokenPayload = verifyDriverDeviceToken(bearerToken)
  if (!tokenPayload || tokenPayload.kind !== 'SESSION') {
    return null
  }

  const session = await resolveDriverDeviceSession(tokenPayload.sid, tokenPayload.tenantId)
  if (!session || !session.isActive || session.revokedAt) {
    return null
  }
  if (session.displayCode !== tokenPayload.displayCode) {
    return null
  }

  if (tokenPayload.driverUserId) {
    const driver = await prisma.user.findUnique({
      where: { id: tokenPayload.driverUserId },
      select: {
        id: true,
        role: true,
        isActive: true,
        tenantId: true,
        name: true,
      },
    })
    if (
      !driver ||
      !driver.isActive ||
      driver.role !== UserRole.DRIVER ||
      driver.tenantId !== session.tenantId
    ) {
      return null
    }
    return {
      actorType: 'DEVICE',
      tenantId: session.tenantId,
      driverUserId: driver.id,
      driverName:
        normalizeText(tokenPayload.driverName) ??
        normalizeText(session.driverName) ??
        driver.name,
      sessionId: session.sessionId,
      displayCode: session.displayCode,
      expiresAt: session.expiresAt,
      isDeviceActor: true,
      session,
    } satisfies DriverActor
  }

  const resolvedDriverName =
    normalizeText(tokenPayload.driverName) ??
    normalizeText(session.driverName) ??
    normalizeText(session.deviceLabel)
  if (!resolvedDriverName) {
    return null
  }

  return {
    actorType: 'DEVICE',
    tenantId: session.tenantId,
    driverUserId: null,
    driverName: resolvedDriverName,
    sessionId: session.sessionId,
    displayCode: session.displayCode,
    expiresAt: session.expiresAt,
    isDeviceActor: true,
    session,
  } satisfies DriverActor
}

async function resolveAppAccountFromAuthorizationHeader(authorizationHeader: string | undefined) {
  const token = readAppBearerToken(authorizationHeader)
  if (!token) {
    return null
  }

  const payload = verifyAppAuthToken(token)
  if (!payload) {
    return null
  }

  const account = await prisma.appCustomerAccount.findUnique({
    where: {
      id: payload.sub,
    },
    select: {
      id: true,
      email: true,
      fullName: true,
      phone: true,
      street: true,
      zipCode: true,
      city: true,
      isActive: true,
    },
  })

  if (!account || !account.isActive || account.email !== payload.email) {
    return null
  }

  return account
}

function parseRatingStars(value: unknown) {
  const parsed = Number(value)
  if (!Number.isInteger(parsed) || parsed < 1 || parsed > 5) {
    return null
  }
  return parsed
}

function parseRatingComment(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  if (!trimmed) {
    return null
  }
  if (trimmed.length > 1000) {
    return null
  }
  return trimmed
}

function parseStarsFromAuditMetadata(metadata: unknown) {
  if (!metadata || typeof metadata !== 'object') {
    return null
  }
  const raw = (metadata as { stars?: unknown }).stars
  const parsed = Number(raw)
  if (!Number.isInteger(parsed) || parsed < 1 || parsed > 5) {
    return null
  }
  return parsed
}

function parseCommentFromAuditMetadata(metadata: unknown) {
  if (!metadata || typeof metadata !== 'object') {
    return null
  }
  const raw = (metadata as { comment?: unknown }).comment
  if (typeof raw !== 'string') {
    return null
  }
  const trimmed = raw.trim()
  return trimmed.length > 0 ? trimmed : null
}

function parseTenantIdQuery(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function parseFiniteNumber(value: unknown) {
  const parsed = Number(value)
  return Number.isFinite(parsed) ? parsed : null
}

function parseDriverLocationFromAuditMetadata(
  metadata: Prisma.JsonValue | null | undefined
): {
  latitude: number
  longitude: number
  accuracyMeters: number | null
  heading: number | null
  speedKmh: number | null
} | null {
  if (!metadata || typeof metadata !== 'object' || Array.isArray(metadata)) {
    return null
  }

  const source = metadata as Record<string, unknown>
  const latitude = parseFiniteNumber(source.latitude)
  const longitude = parseFiniteNumber(source.longitude)
  if (latitude === null || longitude === null) {
    return null
  }

  return {
    latitude,
    longitude,
    accuracyMeters: parseFiniteNumber(source.accuracyMeters),
    heading: parseFiniteNumber(source.heading),
    speedKmh: parseFiniteNumber(source.speedKmh),
  }
}

async function loadLatestDriverLocationByOrderId(orderIds: string[]) {
  const normalizedIds = Array.from(new Set(orderIds.filter(Boolean)))
  const locationByOrderId = new Map<
    string,
    {
      latitude: number
      longitude: number
      accuracyMeters: number | null
      heading: number | null
      speedKmh: number | null
      updatedAt: string
    }
  >()

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

type OrderComplaintEntry = {
  id: string
  message: string
  images: string[]
  createdAt: string
  createdBy: string | null
  isResolved: boolean
}

type OrderIssueState = {
  complaintCount: number
  complaintOpen: boolean
  latestComplaintAt: string | null
  latestComplaintMessage: string | null
  latestComplaintImageCount: number
  complaints: OrderComplaintEntry[]
  signatureCaptured: boolean
  signatureCapturedAt: string | null
  signatureSignerName: string | null
  signatureImageDataUrl: string | null
}

const EMPTY_ORDER_ISSUE_STATE: OrderIssueState = {
  complaintCount: 0,
  complaintOpen: false,
  latestComplaintAt: null,
  latestComplaintMessage: null,
  latestComplaintImageCount: 0,
  complaints: [],
  signatureCaptured: false,
  signatureCapturedAt: null,
  signatureSignerName: null,
  signatureImageDataUrl: null,
}

function sanitizeImagePayload(input: unknown) {
  if (typeof input !== 'string') {
    return null
  }
  const trimmed = input.trim()
  if (!trimmed) {
    return null
  }
  if (trimmed.length > MAX_COMPLAINT_IMAGE_PAYLOAD) {
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

function parseComplaintPayloadFromAuditMetadata(metadata: Prisma.JsonValue | null | undefined) {
  if (!metadata || typeof metadata !== 'object' || Array.isArray(metadata)) {
    return null
  }
  const source = metadata as Record<string, unknown>
  const message = normalizeText(typeof source.message === 'string' ? source.message : null)
  if (!message) {
    return null
  }
  const rawImages = Array.isArray(source.images) ? source.images : []
  const images = rawImages
    .map((entry) => sanitizeImagePayload(entry))
    .filter((entry): entry is string => Boolean(entry))
    .slice(0, MAX_COMPLAINT_IMAGES)

  const complaintId = normalizeText(typeof source.complaintId === 'string' ? source.complaintId : null)
  const createdBy = normalizeText(typeof source.createdBy === 'string' ? source.createdBy : null)

  return {
    complaintId,
    message,
    images,
    createdBy,
  }
}

function parseSignaturePayloadFromAuditMetadata(metadata: Prisma.JsonValue | null | undefined) {
  if (!metadata || typeof metadata !== 'object' || Array.isArray(metadata)) {
    return null
  }
  const source = metadata as Record<string, unknown>
  const signerName = normalizeText(typeof source.signerName === 'string' ? source.signerName : null)
  const signatureImageDataUrl = sanitizeImagePayload(source.signatureImageDataUrl)

  if (!signerName && !signatureImageDataUrl) {
    return null
  }

  return {
    signerName,
    signatureImageDataUrl,
  }
}

async function loadOrderIssueStateByOrderId(orderIds: string[]) {
  const normalizedIds = Array.from(new Set(orderIds.filter(Boolean)))
  const stateByOrderId = new Map<string, OrderIssueState>()

  if (normalizedIds.length === 0) {
    return stateByOrderId
  }

  const rows = await prisma.auditLog.findMany({
    where: {
      targetType: 'order',
      targetId: {
        in: normalizedIds,
      },
      OR: [
        {
          module: 'order_complaint',
          action: {
            in: ['created', 'resolved'],
          },
        },
        {
          module: 'order_signature',
          action: 'captured',
        },
      ],
    },
    select: {
      id: true,
      targetId: true,
      module: true,
      action: true,
      metadata: true,
      createdAt: true,
    },
    orderBy: {
      createdAt: 'asc',
    },
    take: Math.min(12000, Math.max(300, normalizedIds.length * 40)),
  })

  for (const row of rows) {
    const orderId = normalizeText(row.targetId)
    if (!orderId) {
      continue
    }

    const current =
      stateByOrderId.get(orderId) ??
      ({
        ...EMPTY_ORDER_ISSUE_STATE,
        complaints: [],
      } satisfies OrderIssueState)

    if (row.module === 'order_complaint' && row.action === 'created') {
      const payload = parseComplaintPayloadFromAuditMetadata(row.metadata)
      if (payload) {
        const complaintEntry: OrderComplaintEntry = {
          id: payload.complaintId ?? row.id,
          message: payload.message,
          images: payload.images,
          createdAt: row.createdAt.toISOString(),
          createdBy: payload.createdBy ?? null,
          isResolved: false,
        }
        current.complaints.push(complaintEntry)
        current.complaintCount = current.complaints.length
        current.latestComplaintAt = complaintEntry.createdAt
        current.latestComplaintMessage = complaintEntry.message
        current.latestComplaintImageCount = complaintEntry.images.length
        current.complaintOpen = true
      }
    } else if (row.module === 'order_complaint' && row.action === 'resolved') {
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
    } else if (row.module === 'order_signature' && row.action === 'captured') {
      const payload = parseSignaturePayloadFromAuditMetadata(row.metadata)
      if (payload) {
        current.signatureCaptured = true
        current.signatureCapturedAt = row.createdAt.toISOString()
        current.signatureSignerName = payload.signerName ?? null
        current.signatureImageDataUrl = payload.signatureImageDataUrl ?? null
      }
    }

    stateByOrderId.set(orderId, current)
  }

  for (const orderId of normalizedIds) {
    if (!stateByOrderId.has(orderId)) {
      stateByOrderId.set(orderId, {
        ...EMPTY_ORDER_ISSUE_STATE,
        complaints: [],
      })
    }
  }

  return stateByOrderId
}

async function loadOrderForCreateResponse(orderId: string) {
  return prisma.order.findUnique({
    where: {
      id: orderId,
    },
    include: {
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
              category: true,
            },
          },
        },
      },
    },
  })
}

async function findExistingOrderForIdempotency(params: {
  tenantId: string
  clientOrderId: string | null
  idempotencyKey: string | null
}) {
  const checks: Prisma.OrderWhereInput[] = []
  if (params.clientOrderId) {
    checks.push({
      tenantId: params.tenantId,
      clientOrderId: params.clientOrderId,
    })
  }
  if (params.idempotencyKey) {
    checks.push({
      tenantId: params.tenantId,
      idempotencyKey: params.idempotencyKey,
    })
  }
  if (checks.length === 0) {
    return null
  }

  const existing = await prisma.order.findFirst({
    where: { OR: checks },
    select: { id: true },
    orderBy: { createdAt: 'desc' },
  })
  if (!existing) {
    return null
  }
  return loadOrderForCreateResponse(existing.id)
}

function modifierSelectionGroupKey(modifier: { name: string; ingredientId: string | null }) {
  const parsedName = decodeStoredProductModifierName(modifier.name)
  if (parsedName.kind === 'SIZE') {
    return 'SIZE'
  }
  const ingredientGroup = normalizeText(modifier.ingredientId) ?? '__default'
  return `OPTION:${ingredientGroup}`
}

function round3(value: number) {
  return Number(value.toFixed(3))
}

function normalizeUnit(value: string | null | undefined) {
  return (value || '').trim().toLowerCase()
}

function normalizeStockMatchingKey(value: string | null | undefined) {
  const normalized = normalizeText(value)
  return normalized ? normalized.toLowerCase().replace(/\s+/g, ' ') : null
}

function convertToPurchaseQuantity(params: {
  quantity: number
  purchaseUnit: string
  recipeUnit: string | null
  gramsPerPurchaseUnit: number | null
}) {
  const recipeUnit = normalizeUnit(params.recipeUnit || params.purchaseUnit)
  const purchaseUnit = normalizeUnit(params.purchaseUnit)
  const quantity = Number.isFinite(params.quantity) ? params.quantity : 0

  if (recipeUnit === purchaseUnit) {
    return quantity
  }

  if (purchaseUnit === 'kg' && recipeUnit === 'g') {
    return quantity / 1000
  }

  if (purchaseUnit === 'g' && recipeUnit === 'kg') {
    return quantity * 1000
  }

  if (purchaseUnit === 'l' && recipeUnit === 'ml') {
    return quantity / 1000
  }

  if (purchaseUnit === 'ml' && recipeUnit === 'l') {
    return quantity * 1000
  }

  const isPiecePurchaseUnit = new Set(['stueck', 'stk', 'piece', 'dose', 'becher', 'flasche'])
  const gramsPerPurchaseUnit =
    params.gramsPerPurchaseUnit && params.gramsPerPurchaseUnit > 0
      ? params.gramsPerPurchaseUnit
      : null

  if (isPiecePurchaseUnit.has(purchaseUnit) && gramsPerPurchaseUnit) {
    if (recipeUnit === 'g') {
      return quantity / gramsPerPurchaseUnit
    }

    if (recipeUnit === 'kg') {
      return (quantity * 1000) / gramsPerPurchaseUnit
    }
  }

  return quantity
}

function shouldDeductInventoryForStatus(status: string) {
  return (
    status === 'open' ||
    status === 'preparing' ||
    status === 'out_for_delivery' ||
    status === 'done' ||
    status === 'archived'
  )
}

async function applyInventoryConsumptionForOrder(
  tx: Prisma.TransactionClient,
  orderId: string
) {
  const order = await tx.order.findUnique({
    where: { id: orderId },
    select: {
      id: true,
      tenantId: true,
      status: true,
      inventoryDeductedAt: true,
      items: {
        select: {
          productId: true,
          quantity: true,
        },
      },
    },
  })

  if (!order) {
    return false
  }

  if (order.inventoryDeductedAt || !shouldDeductInventoryForStatus(order.status)) {
    return false
  }

  const productIds = Array.from(new Set(order.items.map((item) => item.productId)))
  if (productIds.length === 0) {
    await tx.order.update({
      where: { id: order.id },
      data: {
        inventoryDeductedAt: new Date(),
      },
    })
    return true
  }

  const recipeLines = await tx.productIngredient.findMany({
    where: {
      productId: {
        in: productIds,
      },
    },
    select: {
      productId: true,
      ingredientId: true,
      quantity: true,
      ingredient: {
        select: {
          id: true,
          name: true,
          unit: true,
          recipeUnit: true,
          gramsPerPurchaseUnit: true,
          consumptionFactorPercent: true,
          purchasePrice: true,
        },
      },
    },
  })

  type ConsumptionRecipeLine = {
    ingredientId: string
    quantity: number
    ingredient: {
      id: string
      name: string
      unit: string
      recipeUnit: string | null
      gramsPerPurchaseUnit: Prisma.Decimal | null
      consumptionFactorPercent: Prisma.Decimal
      purchasePrice: Prisma.Decimal
    }
  }

  const recipeByProductId = new Map<string, ConsumptionRecipeLine[]>()
  for (const line of recipeLines) {
    const current = recipeByProductId.get(line.productId) || []
    current.push({
      ingredientId: line.ingredientId,
      quantity: Number(line.quantity),
      ingredient: line.ingredient,
    })
    recipeByProductId.set(line.productId, current)
  }

  const missingProductIds = productIds.filter((productId) => !recipeByProductId.has(productId))
  if (missingProductIds.length > 0) {
    const missingProducts = await tx.product.findMany({
      where: {
        tenantId: order.tenantId,
        id: {
          in: missingProductIds,
        },
      },
      select: {
        id: true,
        name: true,
        ean: true,
        beverageContainerType: true,
        deposit: true,
      },
    })

    const beverageProducts = missingProducts.filter((product) => {
      const hasDeposit = Number(product.deposit ?? 0) > 0
      return product.beverageContainerType !== 'NONE' || hasDeposit
    })

    if (beverageProducts.length > 0) {
      const eanCandidates = Array.from(
        new Set(
          beverageProducts
            .map((product) => normalizeStockMatchingKey(product.ean))
            .filter((entry): entry is string => Boolean(entry))
        )
      )

      const nameCandidates = Array.from(
        new Set(
          beverageProducts
            .map((product) => normalizeStockMatchingKey(product.name))
            .filter((entry): entry is string => Boolean(entry))
        )
      )

      if (eanCandidates.length > 0 || nameCandidates.length > 0) {
        const ingredientLookupFilters: Prisma.IngredientWhereInput[] = [
          ...(eanCandidates.length > 0 ? [{ ean: { in: eanCandidates } }] : []),
          ...beverageProducts.map((entry) => ({
            name: {
              equals: entry.name,
              mode: 'insensitive' as const,
            },
          })),
        ]

        const ingredientCandidates = await tx.ingredient.findMany({
          where: {
            tenantId: order.tenantId,
            OR: ingredientLookupFilters,
          },
          select: {
            id: true,
            name: true,
            unit: true,
            recipeUnit: true,
            gramsPerPurchaseUnit: true,
            consumptionFactorPercent: true,
            purchasePrice: true,
            ean: true,
          },
        })

        const ingredientByEan = new Map<string, (typeof ingredientCandidates)[number]>()
        const ingredientByName = new Map<string, (typeof ingredientCandidates)[number]>()

        for (const ingredient of ingredientCandidates) {
          const ingredientEanKey = normalizeStockMatchingKey(ingredient.ean)
          if (ingredientEanKey && !ingredientByEan.has(ingredientEanKey)) {
            ingredientByEan.set(ingredientEanKey, ingredient)
          }

          const ingredientNameKey = normalizeStockMatchingKey(ingredient.name)
          if (ingredientNameKey && !ingredientByName.has(ingredientNameKey)) {
            ingredientByName.set(ingredientNameKey, ingredient)
          }
        }

        for (const product of beverageProducts) {
          if (recipeByProductId.has(product.id)) {
            continue
          }

          const eanKey = normalizeStockMatchingKey(product.ean)
          const nameKey = normalizeStockMatchingKey(product.name)
          const matchedIngredient =
            (eanKey ? ingredientByEan.get(eanKey) : undefined) ??
            (nameKey ? ingredientByName.get(nameKey) : undefined)

          if (!matchedIngredient) {
            continue
          }

          recipeByProductId.set(product.id, [
            {
              ingredientId: matchedIngredient.id,
              quantity: 1,
              ingredient: matchedIngredient,
            },
          ])
        }
      }
    }
  }

  const totalsByIngredientId = new Map<
    string,
    {
      quantity: number
      ingredientName: string
      unit: string
      unitCost: number
    }
  >()

  for (const orderItem of order.items) {
    const recipe = recipeByProductId.get(orderItem.productId) || []
    for (const line of recipe) {
      const convertedQuantity = convertToPurchaseQuantity({
        quantity: line.quantity,
        purchaseUnit: line.ingredient.unit,
        recipeUnit: line.ingredient.recipeUnit,
        gramsPerPurchaseUnit: Number(line.ingredient.gramsPerPurchaseUnit ?? 0) || null,
      })
      const consumptionFactorPercent = Math.max(
        0,
        Number(line.ingredient.consumptionFactorPercent ?? 0)
      )
      const quantityForItem =
        convertedQuantity * orderItem.quantity * (1 + consumptionFactorPercent / 100)
      if (!Number.isFinite(quantityForItem) || quantityForItem <= 0) {
        continue
      }

      const current = totalsByIngredientId.get(line.ingredientId) || {
        quantity: 0,
        ingredientName: line.ingredient.name,
        unit: line.ingredient.unit,
        unitCost: Number(line.ingredient.purchasePrice),
      }
      current.quantity += quantityForItem
      totalsByIngredientId.set(line.ingredientId, current)
    }
  }

  for (const [ingredientId, totals] of totalsByIngredientId.entries()) {
    const consumptionQuantity = round3(totals.quantity)
    if (consumptionQuantity <= 0) {
      continue
    }

    const aggregate = await tx.stockMovement.aggregate({
      where: {
        tenantId: order.tenantId,
        ingredientId,
      },
      _sum: {
        quantityDelta: true,
      },
    })
    const currentQuantity = Number(aggregate._sum.quantityDelta ?? 0)
    const resultingQuantity = round3(currentQuantity - consumptionQuantity)

    await tx.stockMovement.create({
      data: {
        tenantId: order.tenantId,
        ingredientId,
        type: 'WRITE_OFF',
        quantityDelta: -consumptionQuantity,
        resultingQuantity,
        unitCost: totals.unitCost,
        reference: `ORDER:${order.id}`,
        note: 'Automatischer Verbrauch aus Verkauf',
      },
    })
  }

  await tx.order.update({
    where: { id: order.id },
    data: {
      inventoryDeductedAt: new Date(),
    },
  })

  return true
}

async function resolveScopedTenantIdsForRatings(
  requestedTenantId: string | null,
  authUser: {
    role: UserRole
    chainId: string | null
    tenantId: string | null
  } | undefined
) {
  if (!authUser) {
    return [] as string[]
  }

  if (authUser.role === UserRole.SUPERADMIN) {
    if (requestedTenantId) {
      return [requestedTenantId]
    }
    const tenants = await prisma.tenant.findMany({
      select: { id: true },
    })
    return tenants.map((entry) => entry.id)
  }

  if (authUser.role === UserRole.CHAINADMIN) {
    if (!authUser.chainId) {
      return [] as string[]
    }

    const tenants = await prisma.tenant.findMany({
      where: {
        chainId: authUser.chainId,
      },
      select: {
        id: true,
      },
    })
    const tenantIds = tenants.map((entry) => entry.id)
    if (requestedTenantId && !tenantIds.includes(requestedTenantId)) {
      return [] as string[]
    }
    return requestedTenantId ? [requestedTenantId] : tenantIds
  }

  if (authUser.tenantId) {
    if (requestedTenantId && requestedTenantId !== authUser.tenantId) {
      return [] as string[]
    }
    return [authUser.tenantId]
  }

  return [] as string[]
}

async function resolveScopedTenantIdsForOrderManagement(input: {
  requestedTenantId: string | null
  requestedChainId: string | null
  authUser: {
    role: UserRole
    chainId: string | null
    tenantId: string | null
  }
}) {
  const { requestedTenantId, requestedChainId, authUser } = input

  if (authUser.role === UserRole.SUPERADMIN) {
    const where: Record<string, unknown> = {}
    if (requestedTenantId) {
      where.id = requestedTenantId
    } else if (requestedChainId) {
      where.chainId = requestedChainId
    }

    const tenants = await prisma.tenant.findMany({
      where,
      select: {
        id: true,
      },
      orderBy: [{ name: 'asc' }],
    })
    return tenants.map((entry) => entry.id)
  }

  if (authUser.role === UserRole.CHAINADMIN) {
    if (!authUser.chainId) {
      return [] as string[]
    }

    if (requestedChainId && requestedChainId !== authUser.chainId) {
      return [] as string[]
    }

    const where: Record<string, unknown> = {
      chainId: authUser.chainId,
    }
    if (requestedTenantId) {
      where.id = requestedTenantId
    }

    const tenants = await prisma.tenant.findMany({
      where,
      select: {
        id: true,
      },
      orderBy: [{ name: 'asc' }],
    })
    return tenants.map((entry) => entry.id)
  }

  if ((authUser.role === UserRole.ADMIN || authUser.role === UserRole.STAFF) && authUser.tenantId) {
    if (requestedTenantId && requestedTenantId !== authUser.tenantId) {
      return [] as string[]
    }
    return [authUser.tenantId]
  }

  return [] as string[]
}

function parseDashboardDays(rawValue: unknown) {
  const parsed = Number(rawValue)
  if (!Number.isFinite(parsed)) {
    return 30
  }

  return Math.min(365, Math.max(1, Math.trunc(parsed)))
}

function parseEstimatedMinutes(value: unknown) {
  if (value === undefined || value === null || value === '') {
    return null
  }
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return null
  }
  const rounded = Math.trunc(parsed)
  if (rounded < 5 || rounded > 240) {
    return null
  }
  return rounded
}

function resolveDashboardRange(days: number) {
  const to = new Date()
  const from = new Date(to.getTime() - days * 24 * 60 * 60 * 1000)
  return { from, to }
}

function formatTimestamp(value: Date) {
  const day = String(value.getDate()).padStart(2, '0')
  const month = String(value.getMonth() + 1).padStart(2, '0')
  const year = value.getFullYear()
  const hour = String(value.getHours()).padStart(2, '0')
  const minute = String(value.getMinutes()).padStart(2, '0')
  return `${day}.${month}.${year} ${hour}:${minute}`
}

function resolveOrderRatingWindow(paidAt: Date, now = new Date()) {
  const opensAt = new Date(paidAt.getTime() + RATING_COOLDOWN_MS)
  const closesAt = new Date(paidAt.getTime() + RATING_WINDOW_MS)
  const nowTs = now.getTime()
  const opensAtTs = opensAt.getTime()
  const closesAtTs = closesAt.getTime()

  if (nowTs < opensAtTs) {
    return {
      canRate: false,
      reason: 'cooldown' as const,
      opensAt,
      closesAt,
    }
  }

  if (nowTs > closesAtTs) {
    return {
      canRate: false,
      reason: 'expired' as const,
      opensAt,
      closesAt,
    }
  }

  return {
    canRate: true,
    reason: null,
    opensAt,
    closesAt,
  }
}

async function collectPendingRatingStatsLast72h(tenantIds: string[]) {
  if (tenantIds.length === 0) {
    return {
      windowHours: 72,
      unratedTotal: 0,
      currentlyRateable: 0,
      waitingForCooldown: 0,
      expiredWithoutRating: 0,
    }
  }

  const now = new Date()
  const from = new Date(now.getTime() - PENDING_RATING_LOOKBACK_MS)

  const paidOrders = await prisma.order.findMany({
    where: {
      tenantId: {
        in: tenantIds,
      },
      sourceChannel: {
        in: ['APP', 'DELIVERY'],
      },
      paymentStatus: 'PAID',
      paidAt: {
        not: null,
        gte: from,
      },
    },
    select: {
      id: true,
      tenantId: true,
      paidAt: true,
    },
  })

  if (paidOrders.length === 0) {
    return {
      windowHours: 72,
      unratedTotal: 0,
      currentlyRateable: 0,
      waitingForCooldown: 0,
      expiredWithoutRating: 0,
    }
  }

  const ratedRows = await prisma.auditLog.findMany({
    where: {
      module: 'order_rating',
      action: 'order_rating_submitted',
      targetType: 'order',
      targetId: {
        in: paidOrders.map((entry) => entry.id),
      },
    },
    select: {
      targetId: true,
    },
  })
  const ratedOrderIds = new Set(
    ratedRows.map((entry) => entry.targetId).filter((entry): entry is string => Boolean(entry))
  )

  let unratedTotal = 0
  let currentlyRateable = 0
  let waitingForCooldown = 0
  let expiredWithoutRating = 0

  for (const order of paidOrders) {
    if (!order.paidAt || ratedOrderIds.has(order.id)) {
      continue
    }

    unratedTotal += 1
    const window = resolveOrderRatingWindow(order.paidAt, now)
    if (window.canRate) {
      currentlyRateable += 1
      continue
    }

    if (window.reason === 'cooldown') {
      waitingForCooldown += 1
      continue
    }

    expiredWithoutRating += 1
  }

  return {
    windowHours: 72,
    unratedTotal,
    currentlyRateable,
    waitingForCooldown,
    expiredWithoutRating,
  }
}

router.get('/', async (req, res) => {
  try {
    const tenantId = parseTenantIdQuery(req.query.tenantId)
    const channel = sanitizeOrderManagementSource(
      normalizeText(req.query.channel as string | undefined)
    )
    const paymentStatus = sanitizeOrderPaymentStatus(
      normalizeText(req.query.paymentStatus as string | undefined)
    )
    const serviceType = sanitizeOrderServiceType(
      normalizeText(req.query.serviceType as string | undefined)
    )
    const appOnly = channel === 'APP_ONLY'
    const authUser = req.authUser
    const appAccount = await resolveAppAccountFromAuthorizationHeader(
      req.header('authorization') || undefined
    )

    if (!authUser && !appAccount) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    let where: Prisma.OrderWhereInput
    if (appAccount) {
      where = {
        ...(tenantId
          ? {
              tenantId,
            }
          : {}),
        appCustomerAccountId: appAccount.id,
        sourceChannel: {
          in: ['APP', 'DELIVERY'],
        },
      }
    } else {
      if (!authUser) {
        return res.status(401).json({ error: 'Nicht eingeloggt' })
      }

      if (
        authUser.role !== UserRole.SUPERADMIN &&
        !authUser.permissions.has(PermissionKey.ORDERS_READ)
      ) {
        return res.status(403).json({ error: `Keine Berechtigung: ${PermissionKey.ORDERS_READ}` })
      }
      if (tenantId) {
        await resolveTenantScope(req, tenantId)
      }

      const scopedTenantIds = await resolveScopedTenantIdsForOrderManagement({
        requestedTenantId: tenantId,
        requestedChainId: null,
        authUser: {
          role: authUser.role,
          chainId: authUser.chainId,
          tenantId: authUser.tenantId,
        },
      })

      if (scopedTenantIds.length === 0) {
        return res.status(403).json({ error: 'Keine Berechtigung fuer diese Filiale' })
      }

      where = {
        tenantId: {
          in: scopedTenantIds,
        },
      }

      if (appOnly) {
        where.sourceChannel = {
          in: ['APP', 'DELIVERY'],
        }
      } else if (channel !== 'ALL') {
        where.sourceChannel = channel
      }
    }

    if (paymentStatus) {
      where.paymentStatus = paymentStatus
    }
    if (serviceType) {
      where.serviceType = serviceType
    }

    const orders = await prisma.order.findMany({
      where,
      include: {
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
                category: true,
              },
            },
          },
        },
      },
      orderBy: [{ createdAt: 'desc' }],
    })

    const latestDriverLocations = await loadLatestDriverLocationByOrderId(
      orders.map((entry) => entry.id)
    )
    const issueStateByOrderId = await loadOrderIssueStateByOrderId(orders.map((entry) => entry.id))
    const response = orders.map((entry) => ({
      ...entry,
      driverLocation: latestDriverLocations.get(entry.id) ?? null,
      complaintOpen: issueStateByOrderId.get(entry.id)?.complaintOpen ?? false,
      complaintCount: issueStateByOrderId.get(entry.id)?.complaintCount ?? 0,
      latestComplaintAt: issueStateByOrderId.get(entry.id)?.latestComplaintAt ?? null,
      latestComplaintMessage: issueStateByOrderId.get(entry.id)?.latestComplaintMessage ?? null,
      latestComplaintImageCount: issueStateByOrderId.get(entry.id)?.latestComplaintImageCount ?? 0,
      signatureCaptured: issueStateByOrderId.get(entry.id)?.signatureCaptured ?? false,
      signatureCapturedAt: issueStateByOrderId.get(entry.id)?.signatureCapturedAt ?? null,
      signatureSignerName: issueStateByOrderId.get(entry.id)?.signatureSignerName ?? null,
    }))

    return res.json(response)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    const prismaCode =
      error && typeof error === 'object' && 'code' in error ? (error as { code?: string }).code : null
    console.error('ORDERS_API_ERROR', {
      route: '/api/orders',
      tenantId: parseTenantIdQuery(req.query.tenantId),
      branchId: parseTenantIdQuery(req.query.branchId),
      query: req.query,
      message: toErrorMessage(error),
      prismaCode,
    })
    return res.status(500).json({ error: 'Fehler beim Laden der Bestellungen' })
  }
})

router.get('/management', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    if (!req.authUser) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    const requestedTenantId = parseTenantIdQuery(req.query.tenantId)
    const requestedChainId = parseTenantIdQuery(req.query.chainId)
    const rawSource = normalizeText(
      (req.query.source as string | undefined) ?? (req.query.channel as string | undefined)
    )
    const rawStatus = normalizeText(req.query.status as string | undefined)
    const source = sanitizeOrderManagementSource(rawSource)
    const status = sanitizeOrderManagementStatus(rawStatus)
    const paymentStatus = sanitizeOrderPaymentStatus(
      normalizeText(req.query.paymentStatus as string | undefined)
    )
    const serviceType = sanitizeOrderServiceType(
      normalizeText(req.query.serviceType as string | undefined)
    )
    const limitRaw = Number(req.query.limit)
    const limit = Number.isFinite(limitRaw) ? Math.max(20, Math.min(500, Math.trunc(limitRaw))) : 200
    if (rawSource && source === 'ALL' && rawSource.toUpperCase() !== 'ALL') {
      return res.status(400).json({ error: `Ungültiger source/channel Filter: ${rawSource}` })
    }
    if (rawStatus && status === 'all' && rawStatus.toLowerCase() !== 'all') {
      return res.status(400).json({ error: `Ungültiger status Filter: ${rawStatus}` })
    }
    if (req.query.paymentStatus && !paymentStatus && String(req.query.paymentStatus).toUpperCase() !== 'ALL') {
      return res.status(400).json({ error: `Ungültiger paymentStatus Filter: ${String(req.query.paymentStatus)}` })
    }
    if (req.query.serviceType && !serviceType && String(req.query.serviceType).toUpperCase() !== 'ALL') {
      return res.status(400).json({ error: `Ungültiger serviceType Filter: ${String(req.query.serviceType)}` })
    }
    if (requestedTenantId) {
      await resolveTenantScope(req, requestedTenantId)
    }

    const tenantIds = await resolveScopedTenantIdsForOrderManagement({
      requestedTenantId,
      requestedChainId,
      authUser: {
        role: req.authUser.role,
        chainId: req.authUser.chainId,
        tenantId: req.authUser.tenantId,
      },
    })

    if (tenantIds.length === 0) {
      return res.json({
        total: 0,
        byStatus: {},
        bySource: {},
        orders: [],
      })
    }

    const where: Record<string, unknown> = {
      tenantId: {
        in: tenantIds,
      },
    }

    if (source === 'APP_ONLY') {
      where.sourceChannel = {
        in: ['APP', 'DELIVERY'],
      }
    } else if (source === 'TERMINAL_ONLY') {
      where.sourceChannel = 'TERMINAL'
    } else if (source !== 'ALL') {
      where.sourceChannel = source
    }

    if (status !== 'all') {
      where.status = status
    }
    if (paymentStatus) {
      where.paymentStatus = paymentStatus
    }
    if (serviceType) {
      where.serviceType = serviceType
    }

    let orders: Awaited<ReturnType<typeof prisma.order.findMany>> = []
    try {
      orders = await prisma.order.findMany({
        where,
        include: {
          tenant: {
            select: {
              id: true,
              name: true,
              chain: {
                select: {
                  id: true,
                  name: true,
                },
              },
            },
          },
          terminal: {
            select: {
              id: true,
              name: true,
              terminalCode: true,
              location: true,
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
                select: {
                  id: true,
                  name: true,
                },
              },
            },
          },
        },
        orderBy: [{ createdAt: 'desc' }],
        take: limit,
      })
    } catch (queryError) {
      console.error('ORDERS_MANAGEMENT_INCLUDE_FALLBACK', {
        route: '/api/orders/management',
        message: toErrorMessage(queryError),
        ...extractPrismaErrorDetails(queryError),
      })
      try {
        orders = await prisma.order.findMany({
          where,
          include: {
            tenant: {
              select: {
                id: true,
                name: true,
              },
            },
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
                  select: {
                    id: true,
                    name: true,
                  },
                },
              },
            },
          },
          orderBy: [{ createdAt: 'desc' }],
          take: limit,
        })
      } catch (fallbackError) {
        console.error('ORDERS_MANAGEMENT_MINIMAL_FALLBACK', {
          route: '/api/orders/management',
          message: toErrorMessage(fallbackError),
          ...extractPrismaErrorDetails(fallbackError),
        })
        orders = await prisma.order.findMany({
          where,
          include: {
            tenant: {
              select: {
                id: true,
                name: true,
              },
            },
            items: true,
          },
          orderBy: [{ createdAt: 'desc' }],
          take: limit,
        })
      }
    }

    const byStatus: Record<string, number> = {}
    const bySource: Record<string, number> = {}
    let issueStateByOrderId = new Map<string, OrderIssueState>()
    try {
      issueStateByOrderId = await loadOrderIssueStateByOrderId(orders.map((entry) => entry.id))
    } catch (issueStateError) {
      console.error('ORDERS_MANAGEMENT_ISSUESTATE_FALLBACK', {
        route: '/api/orders/management',
        message: toErrorMessage(issueStateError),
        ...extractPrismaErrorDetails(issueStateError),
      })
    }
    for (const order of orders) {
      byStatus[order.status] = (byStatus[order.status] ?? 0) + 1
      bySource[order.sourceChannel] = (bySource[order.sourceChannel] ?? 0) + 1
    }

    return res.json({
      total: orders.length,
      byStatus,
      bySource,
      orders: orders.map((order) => ({
        ...order,
        complaintOpen: issueStateByOrderId.get(order.id)?.complaintOpen ?? false,
        complaintCount: issueStateByOrderId.get(order.id)?.complaintCount ?? 0,
        latestComplaintAt: issueStateByOrderId.get(order.id)?.latestComplaintAt ?? null,
        latestComplaintMessage: issueStateByOrderId.get(order.id)?.latestComplaintMessage ?? null,
        latestComplaintImageCount:
          issueStateByOrderId.get(order.id)?.latestComplaintImageCount ?? 0,
        complaints: issueStateByOrderId.get(order.id)?.complaints ?? [],
        signatureCaptured: issueStateByOrderId.get(order.id)?.signatureCaptured ?? false,
        signatureCapturedAt: issueStateByOrderId.get(order.id)?.signatureCapturedAt ?? null,
        signatureSignerName: issueStateByOrderId.get(order.id)?.signatureSignerName ?? null,
        signatureImageDataUrl: issueStateByOrderId.get(order.id)?.signatureImageDataUrl ?? null,
      })),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    const prismaDetails = extractPrismaErrorDetails(error)
    console.error('ORDERS_API_ERROR', {
      route: '/api/orders/management',
      tenantId: parseTenantIdQuery(req.query.tenantId),
      branchId: parseTenantIdQuery(req.query.branchId),
      resolvedTenantId: req.authUser?.tenantId ?? null,
      resolvedChainId: req.authUser?.chainId ?? null,
      resolvedRole: req.authUser?.role ?? null,
      query: req.query,
      prismaWhere: {
        source: req.query.source ?? req.query.channel ?? null,
        status: req.query.status ?? null,
        paymentStatus: req.query.paymentStatus ?? null,
        serviceType: req.query.serviceType ?? null,
        limit: req.query.limit ?? null,
      },
      message: toErrorMessage(error),
      prismaCode: prismaDetails.code,
      prismaMeta: prismaDetails.meta,
      stack: prismaDetails.stack,
    })
    return res.status(500).json({ error: 'Bestelluebersicht konnte nicht geladen werden' })
  }
})

router.get('/dashboard/admin', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string

    const periodDays = parseDashboardDays(req.query.days)
    const { from, to } = resolveDashboardRange(periodDays)

    const [products, ordersInPeriod, paidOrders, paidOrderItems] = await Promise.all([
      prisma.product.findMany({
        where: { tenantId },
        select: {
          id: true,
          name: true,
        },
      }),
      prisma.order.findMany({
        where: {
          tenantId,
          createdAt: {
            gte: from,
            lte: to,
          },
        },
        select: {
          id: true,
          paymentStatus: true,
          status: true,
        },
      }),
      prisma.order.findMany({
        where: {
          tenantId,
          paymentStatus: 'PAID',
          createdAt: {
            gte: from,
            lte: to,
          },
        },
        select: {
          id: true,
          total: true,
        },
      }),
      prisma.orderItem.findMany({
        where: {
          order: {
            tenantId,
            paymentStatus: 'PAID',
            createdAt: {
              gte: from,
              lte: to,
            },
          },
        },
        select: {
          productId: true,
          quantity: true,
          price: true,
        },
      }),
    ])

    const revenueTotal = paidOrders.reduce((sum, order) => sum + Number(order.total), 0)

    const productStatsMap = new Map(
      products.map((product) => [
        product.id,
        {
          productId: product.id,
          productName: product.name,
          quantity: 0,
          revenue: 0,
        },
      ])
    )

    for (const item of paidOrderItems) {
      const existing = productStatsMap.get(item.productId)
      if (!existing) {
        continue
      }

      existing.quantity += item.quantity
      existing.revenue += Number(item.price) * item.quantity
    }

    const productStats = Array.from(productStatsMap.values())
    const topProducts = [...productStats]
      .filter((entry) => entry.quantity > 0)
      .sort((left, right) => {
        if (left.quantity !== right.quantity) {
          return right.quantity - left.quantity
        }
        if (left.revenue !== right.revenue) {
          return right.revenue - left.revenue
        }
        return left.productName.localeCompare(right.productName, 'de-DE')
      })
      .slice(0, 5)
      .map((entry) => ({
        ...entry,
        revenue: Number(entry.revenue.toFixed(2)),
      }))

    const flopProducts = [...productStats]
      .sort((left, right) => {
        if (left.quantity !== right.quantity) {
          return left.quantity - right.quantity
        }
        if (left.revenue !== right.revenue) {
          return left.revenue - right.revenue
        }
        return left.productName.localeCompare(right.productName, 'de-DE')
      })
      .slice(0, 5)
      .map((entry) => ({
        ...entry,
        revenue: Number(entry.revenue.toFixed(2)),
      }))

    const paidOrdersCount = paidOrders.length
    const unpaidOrdersCount = ordersInPeriod.filter((entry) => entry.paymentStatus !== 'PAID').length
    const openOrdersCount = ordersInPeriod.filter((entry) => entry.status !== 'archived').length

    return res.json({
      periodDays,
      from: from.toISOString(),
      to: to.toISOString(),
      totals: {
        revenue: Number(revenueTotal.toFixed(2)),
        totalOrders: ordersInPeriod.length,
        paidOrders: paidOrdersCount,
        unpaidOrders: unpaidOrdersCount,
        openOrders: openOrdersCount,
      },
      topProducts,
      flopProducts,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET ADMIN DASHBOARD ORDERS ERROR:', error)
    return res.status(500).json({ error: 'Admin-Dashboarddaten konnten nicht geladen werden' })
  }
})

router.get('/dashboard/superadmin', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    if (!req.authUser || req.authUser.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur SUPERADMIN erlaubt' })
    }

    const periodDays = parseDashboardDays(req.query.days)
    const { from, to } = resolveDashboardRange(periodDays)

    const [chains, tenants, paidOrders] = await Promise.all([
      prisma.chain.findMany({
        select: {
          id: true,
          name: true,
        },
      }),
      prisma.tenant.findMany({
        select: {
          id: true,
          name: true,
          chainId: true,
          chain: {
            select: {
              id: true,
              name: true,
            },
          },
        },
      }),
      prisma.order.findMany({
        where: {
          paymentStatus: 'PAID',
          createdAt: {
            gte: from,
            lte: to,
          },
        },
        select: {
          tenantId: true,
          total: true,
        },
      }),
    ])

    const byTenant = new Map<string, { revenue: number; paidOrders: number }>()
    for (const order of paidOrders) {
      const existing = byTenant.get(order.tenantId) ?? { revenue: 0, paidOrders: 0 }
      existing.revenue += Number(order.total)
      existing.paidOrders += 1
      byTenant.set(order.tenantId, existing)
    }

    const tenantsWithRevenue = tenants
      .map((tenant) => {
        const stats = byTenant.get(tenant.id) ?? { revenue: 0, paidOrders: 0 }
        return {
          tenantId: tenant.id,
          tenantName: tenant.name,
          chainId: tenant.chainId,
          chainName: tenant.chain?.name ?? null,
          paidOrders: stats.paidOrders,
          revenue: Number(stats.revenue.toFixed(2)),
        }
      })
      .sort((left, right) => {
        if (left.revenue !== right.revenue) {
          return right.revenue - left.revenue
        }
        return left.tenantName.localeCompare(right.tenantName, 'de-DE')
      })

    const byChain = new Map<string, { chainId: string; chainName: string; paidOrders: number; revenue: number; tenantCount: number }>()

    for (const chain of chains) {
      byChain.set(chain.id, {
        chainId: chain.id,
        chainName: chain.name,
        paidOrders: 0,
        revenue: 0,
        tenantCount: 0,
      })
    }

    for (const tenant of tenantsWithRevenue) {
      if (!tenant.chainId) {
        continue
      }

      const chainEntry = byChain.get(tenant.chainId)
      if (!chainEntry) {
        continue
      }

      chainEntry.tenantCount += 1
      chainEntry.paidOrders += tenant.paidOrders
      chainEntry.revenue += tenant.revenue
    }

    const chainsWithRevenue = Array.from(byChain.values())
      .map((entry) => ({
        ...entry,
        revenue: Number(entry.revenue.toFixed(2)),
      }))
      .sort((left, right) => {
        if (left.revenue !== right.revenue) {
          return right.revenue - left.revenue
        }
        return left.chainName.localeCompare(right.chainName, 'de-DE')
      })

    const revenueTotal = tenantsWithRevenue.reduce((sum, entry) => sum + entry.revenue, 0)
    const paidOrdersTotal = tenantsWithRevenue.reduce((sum, entry) => sum + entry.paidOrders, 0)
    const activeTenantCount = tenantsWithRevenue.filter((entry) => entry.revenue > 0).length

    return res.json({
      periodDays,
      from: from.toISOString(),
      to: to.toISOString(),
      totals: {
        revenue: Number(revenueTotal.toFixed(2)),
        paidOrders: paidOrdersTotal,
        tenants: tenants.length,
        chains: chains.length,
        activeTenantsWithRevenue: activeTenantCount,
      },
      chains: chainsWithRevenue,
      tenants: tenantsWithRevenue,
    })
  } catch (error) {
    console.error('GET SUPERADMIN DASHBOARD ORDERS ERROR:', error)
    return res.status(500).json({ error: 'Superadmin-Umsatzdaten konnten nicht geladen werden' })
  }
})

router.get('/ratings/admin', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const requestedTenantId = parseTenantIdQuery(req.query.tenantId)
    const periodDays = parseDashboardDays(req.query.days)
    const { from } = resolveDashboardRange(periodDays)
    if (requestedTenantId) {
      await resolveTenantScope(req, requestedTenantId)
    }

    const tenantIds = await resolveScopedTenantIdsForRatings(requestedTenantId, req.authUser)
    if (requestedTenantId && tenantIds.length === 0) {
      return res.status(403).json({ error: 'Keine Berechtigung fuer diese Filiale' })
    }
    if (tenantIds.length === 0) {
      return res.json({
        periodDays,
        from: from.toISOString(),
        totalRatings: 0,
        averageRating: null,
        pendingRatings72h: {
          windowHours: 72,
          unratedTotal: 0,
          currentlyRateable: 0,
          waitingForCooldown: 0,
          expiredWithoutRating: 0,
        },
        tenants: [],
        latest: [],
      })
    }

    const pendingRatings72h = await collectPendingRatingStatsLast72h(tenantIds)

    const ratings = await prisma.auditLog.findMany({
      where: {
        module: 'order_rating',
        action: 'order_rating_submitted',
        tenantId: {
          in: tenantIds,
        },
        createdAt: {
          gte: from,
        },
      },
      select: {
        id: true,
        tenantId: true,
        targetId: true,
        metadata: true,
        createdAt: true,
        tenant: {
          select: {
            id: true,
            name: true,
          },
        },
      },
      orderBy: [{ createdAt: 'desc' }],
      take: 1200,
    })

    const aggregateByTenant = new Map<
      string,
      { tenantId: string; tenantName: string; ratingSum: number; ratingCount: number; lastRatedAt: string | null }
    >()
    let totalRatings = 0
    let ratingSum = 0

    const latest = ratings
      .map((entry) => {
        const stars = parseStarsFromAuditMetadata(entry.metadata)
        if (!stars || !entry.tenantId) {
          return null
        }

        totalRatings += 1
        ratingSum += stars

        const current = aggregateByTenant.get(entry.tenantId) ?? {
          tenantId: entry.tenantId,
          tenantName: entry.tenant?.name ?? entry.tenantId,
          ratingSum: 0,
          ratingCount: 0,
          lastRatedAt: null,
        }
        current.ratingSum += stars
        current.ratingCount += 1
        if (!current.lastRatedAt || new Date(entry.createdAt).getTime() > new Date(current.lastRatedAt).getTime()) {
          current.lastRatedAt = entry.createdAt.toISOString()
        }
        aggregateByTenant.set(entry.tenantId, current)

        return {
          id: entry.id,
          orderId: entry.targetId,
          tenantId: entry.tenantId,
          tenantName: entry.tenant?.name ?? null,
          stars,
          comment: parseCommentFromAuditMetadata(entry.metadata),
          createdAt: entry.createdAt.toISOString(),
        }
      })
      .filter((entry): entry is NonNullable<typeof entry> => entry !== null)
      .slice(0, 120)

    const tenants = Array.from(aggregateByTenant.values())
      .map((entry) => ({
        tenantId: entry.tenantId,
        tenantName: entry.tenantName,
        ratingCount: entry.ratingCount,
        ratingAverage: Number((entry.ratingSum / entry.ratingCount).toFixed(2)),
        lastRatedAt: entry.lastRatedAt,
      }))
      .sort((left, right) => {
        if (left.ratingAverage !== right.ratingAverage) {
          return right.ratingAverage - left.ratingAverage
        }
        return right.ratingCount - left.ratingCount
      })

    return res.json({
      periodDays,
      from: from.toISOString(),
      totalRatings,
      averageRating: totalRatings > 0 ? Number((ratingSum / totalRatings).toFixed(2)) : null,
      pendingRatings72h,
      tenants,
      latest,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET ADMIN ORDER RATINGS ERROR:', error)
    return res.status(500).json({ error: 'Bewertungsdaten konnten nicht geladen werden' })
  }
})

router.get('/ratings/superadmin', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    if (!req.authUser || req.authUser.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur SUPERADMIN erlaubt' })
    }

    const periodDays = parseDashboardDays(req.query.days)
    const { from } = resolveDashboardRange(periodDays)

    const ratings = await prisma.auditLog.findMany({
      where: {
        module: 'order_rating',
        action: 'order_rating_submitted',
        createdAt: {
          gte: from,
        },
      },
      select: {
        id: true,
        chainId: true,
        tenantId: true,
        targetId: true,
        metadata: true,
        createdAt: true,
        chain: {
          select: {
            id: true,
            name: true,
          },
        },
        tenant: {
          select: {
            id: true,
            name: true,
          },
        },
      },
      orderBy: [{ createdAt: 'desc' }],
      take: 3000,
    })

    let totalRatings = 0
    let ratingSum = 0
    const tenantAgg = new Map<string, { tenantId: string; tenantName: string; count: number; sum: number }>()
    const chainAgg = new Map<string, { chainId: string; chainName: string; count: number; sum: number }>()

    for (const entry of ratings) {
      const stars = parseStarsFromAuditMetadata(entry.metadata)
      if (!stars) {
        continue
      }
      totalRatings += 1
      ratingSum += stars

      if (entry.tenantId) {
        const current = tenantAgg.get(entry.tenantId) ?? {
          tenantId: entry.tenantId,
          tenantName: entry.tenant?.name ?? entry.tenantId,
          count: 0,
          sum: 0,
        }
        current.count += 1
        current.sum += stars
        tenantAgg.set(entry.tenantId, current)
      }

      if (entry.chainId) {
        const current = chainAgg.get(entry.chainId) ?? {
          chainId: entry.chainId,
          chainName: entry.chain?.name ?? entry.chainId,
          count: 0,
          sum: 0,
        }
        current.count += 1
        current.sum += stars
        chainAgg.set(entry.chainId, current)
      }
    }

    const tenants = Array.from(tenantAgg.values())
      .map((entry) => ({
        tenantId: entry.tenantId,
        tenantName: entry.tenantName,
        ratingCount: entry.count,
        ratingAverage: Number((entry.sum / entry.count).toFixed(2)),
      }))
      .sort((left, right) => {
        if (left.ratingAverage !== right.ratingAverage) {
          return right.ratingAverage - left.ratingAverage
        }
        return right.ratingCount - left.ratingCount
      })

    const chains = Array.from(chainAgg.values())
      .map((entry) => ({
        chainId: entry.chainId,
        chainName: entry.chainName,
        ratingCount: entry.count,
        ratingAverage: Number((entry.sum / entry.count).toFixed(2)),
      }))
      .sort((left, right) => {
        if (left.ratingAverage !== right.ratingAverage) {
          return right.ratingAverage - left.ratingAverage
        }
        return right.ratingCount - left.ratingCount
      })

    const latest = ratings
      .map((entry) => {
        const stars = parseStarsFromAuditMetadata(entry.metadata)
        if (!stars) {
          return null
        }
        return {
          id: entry.id,
          orderId: entry.targetId,
          chainId: entry.chainId,
          chainName: entry.chain?.name ?? null,
          tenantId: entry.tenantId,
          tenantName: entry.tenant?.name ?? null,
          stars,
          comment: parseCommentFromAuditMetadata(entry.metadata),
          createdAt: entry.createdAt.toISOString(),
        }
      })
      .filter((entry): entry is NonNullable<typeof entry> => entry !== null)
      .slice(0, 150)

    const tenantsForPending = await prisma.tenant.findMany({
      select: {
        id: true,
      },
    })
    const pendingRatings72h = await collectPendingRatingStatsLast72h(
      tenantsForPending.map((entry) => entry.id)
    )

    return res.json({
      periodDays,
      from: from.toISOString(),
      totalRatings,
      averageRating: totalRatings > 0 ? Number((ratingSum / totalRatings).toFixed(2)) : null,
      pendingRatings72h,
      chains,
      tenants,
      latest,
    })
  } catch (error) {
    console.error('GET SUPERADMIN ORDER RATINGS ERROR:', error)
    return res.status(500).json({ error: 'Superadmin-Bewertungen konnten nicht geladen werden' })
  }
})

router.post('/', rateLimitPublicOrderCreate, async (req, res) => {
  let idempotencyReservation:
    | {
        key: string
        fingerprint: string
      }
    | null = null
  try {
    const {
      tenantId,
      terminalId,
      items,
      sourceChannel,
      paymentMethod,
      markPaid,
      forwardToKitchen,
      serviceType,
      customerName,
      customerPhone,
      customerAddress,
      customerZipCode,
      customerCity,
      customerLatitude,
      customerLongitude,
      branchId,
      clientOrderId,
      deviceCode,
      terminalDeviceId,
      idempotencyKey,
    } = req.body as {
      tenantId?: string
      terminalId?: string | null
      items?: Array<{
        productId: string
        quantity: number
        modifierIds?: string[]
      }>
      sourceChannel?: string
      paymentMethod?: string | null
      markPaid?: boolean
      forwardToKitchen?: boolean
      serviceType?: string | null
      customerName?: string | null
      customerPhone?: string | null
      customerAddress?: string | null
      customerZipCode?: string | null
      customerCity?: string | null
      customerLatitude?: number | string | null
      customerLongitude?: number | string | null
      branchId?: string | null
      clientOrderId?: string | null
      deviceCode?: string | null
      terminalDeviceId?: string | null
      idempotencyKey?: string | null
    }

    if (!tenantId || !items || items.length === 0) {
      return res.status(400).json({ error: 'tenantId oder items fehlen' })
    }

    const normalizedTerminalId = normalizeText(terminalId)
    const normalizedPaymentMethod = normalizeText(paymentMethod)?.toUpperCase() ?? null
    const normalizedSourceChannel = (
      normalizeText(sourceChannel)?.toUpperCase() ??
      (normalizedTerminalId ? 'TERMINAL' : 'POS')
    )
    const normalizedServiceTypeRaw = normalizeText(serviceType)?.toUpperCase() ?? null
    const normalizedCustomerName = normalizeText(customerName)
    const normalizedCustomerPhone = normalizeText(customerPhone)
    const normalizedCustomerAddress = normalizeText(customerAddress)
    const normalizedCustomerZipCode = normalizeZipCode(customerZipCode)
    const normalizedCustomerCity = normalizeText(customerCity)
    const normalizedCustomerLatitude = parseFiniteNumber(customerLatitude)
    const normalizedCustomerLongitude = parseFiniteNumber(customerLongitude)
    const normalizedBranchId = normalizeText(branchId)
    const normalizedClientOrderId = normalizeText(clientOrderId)
    const normalizedTerminalDeviceId =
      normalizeText(terminalDeviceId) ?? normalizeText(deviceCode)
    const requestIdempotencyKey = extractOrderIdempotencyKey(
      req.header('x-idempotency-key'),
      idempotencyKey
    )

    if (normalizedPaymentMethod && !PAYMENT_METHODS.has(normalizedPaymentMethod)) {
      return res.status(400).json({ error: 'ungültige paymentMethod' })
    }

    if (!SOURCE_CHANNELS.has(normalizedSourceChannel)) {
      return res.status(400).json({ error: 'ungültiger sourceChannel' })
    }

    const resolvedServiceType =
      normalizedServiceTypeRaw === 'DELIVERY' || normalizedServiceTypeRaw === 'PICKUP'
        ? normalizedServiceTypeRaw
        : normalizedSourceChannel === 'DELIVERY'
          ? 'DELIVERY'
          : APP_ORDER_CHANNELS.has(normalizedSourceChannel)
            ? 'PICKUP'
            : null

    const appAccount = APP_ORDER_CHANNELS.has(normalizedSourceChannel)
      ? await resolveAppAccountFromAuthorizationHeader(req.header('authorization') || undefined)
      : null
    const isAppOrderChannel = APP_ORDER_CHANNELS.has(normalizedSourceChannel)
    if (!isAppOrderChannel) {
      const actor = req.authUser
      if (!actor) {
        return res.status(401).json({ error: 'Nicht eingeloggt' })
      }
      if (
        actor.role !== UserRole.SUPERADMIN &&
        !actor.permissions.has(PermissionKey.ORDERS_WRITE)
      ) {
        return res.status(403).json({ error: `Keine Berechtigung: ${PermissionKey.ORDERS_WRITE}` })
      }
    }
    const resolvedTenantId = isAppOrderChannel
      ? tenantId
      : ((await resolveTenantScope(req, tenantId)).tenantId as string)

    if (normalizedBranchId && normalizedBranchId !== resolvedTenantId) {
      return res.status(400).json({
        error: 'branchId passt nicht zur ausgewaehlten Filiale',
      })
    }

    const likelyOfflineSyncRequest =
      Boolean(normalizedClientOrderId) ||
      Boolean(normalizedTerminalDeviceId) ||
      normalizedSourceChannel === 'TERMINAL'
    if (likelyOfflineSyncRequest && !requestIdempotencyKey) {
      return res.status(400).json({
        error: 'idempotencyKey ist für Offline-/Terminal-Sync erforderlich',
      })
    }

    console.info('ORDER IDEMPOTENCY CHECK START', {
      tenantId: resolvedTenantId,
      branchId: normalizedBranchId,
      recognizedClientOrderId: normalizedClientOrderId,
      recognizedIdempotencyKey: requestIdempotencyKey,
      terminalDeviceId: normalizedTerminalDeviceId,
      sourceTerminalDeviceField: normalizeText(terminalDeviceId) ? 'terminalDeviceId' : normalizeText(deviceCode) ? 'deviceCode' : null,
    })

    const existingOrder = await findExistingOrderForIdempotency({
      tenantId: resolvedTenantId,
      clientOrderId: normalizedClientOrderId,
      idempotencyKey: requestIdempotencyKey,
    })
    if (existingOrder) {
      console.info('ORDER IDEMPOTENCY DUPLICATE PREVENTED', {
        tenantId: resolvedTenantId,
        existingOrderId: existingOrder.id,
        clientOrderId: normalizedClientOrderId,
        idempotencyKey: requestIdempotencyKey,
      })
      await writeAuditLog({
        req,
        module: 'orders',
        action: 'order_create_duplicate_prevented',
        targetType: 'order',
        targetId: existingOrder.id,
        tenantId: existingOrder.tenantId,
        metadata: {
          clientOrderId: normalizedClientOrderId,
          idempotencyKey: requestIdempotencyKey,
          terminalDeviceId: normalizedTerminalDeviceId,
        },
      })
      return res.status(200).json({
        ...existingOrder,
        duplicatePrevented: true,
      })
    }

    const idempotencyResult = beginOrderCreateIdempotency({
      tenantId: resolvedTenantId,
      routeKey: 'orders',
      idempotencyKey: requestIdempotencyKey,
      fingerprintPayload: {
        tenantId: resolvedTenantId,
        branchId: normalizedBranchId,
        terminalId: normalizedTerminalId,
        sourceChannel: normalizedSourceChannel,
        serviceType: normalizedServiceTypeRaw,
        paymentMethod: normalizedPaymentMethod,
        markPaid: Boolean(markPaid),
        forwardToKitchen: forwardToKitchen ?? null,
        customerName: normalizedCustomerName,
        customerPhone: normalizedCustomerPhone,
        customerAddress: normalizedCustomerAddress,
        customerZipCode: normalizedCustomerZipCode,
        customerCity: normalizedCustomerCity,
        items,
      },
    })

    if (idempotencyResult.status === 'in_progress') {
      return res.status(409).json({
        error: 'Bestellung wird bereits verarbeitet. Bitte nicht mehrfach absenden.',
        code: 'ORDER_CREATE_IN_PROGRESS',
      })
    }

    if (idempotencyResult.status === 'conflict') {
      return res.status(409).json({
        error: 'Idempotency-Key passt nicht zur Anfrage-Payload',
        code: 'ORDER_IDEMPOTENCY_PAYLOAD_MISMATCH',
      })
    }

    if (idempotencyResult.status === 'replay') {
      const replayOrder = idempotencyResult.orderId
        ? await loadOrderForCreateResponse(idempotencyResult.orderId)
        : null
      if (replayOrder) {
        await writeAuditLog({
          req,
          module: 'orders',
          action: 'order_create_duplicate_replay',
          targetType: 'order',
          targetId: replayOrder.id,
          tenantId: replayOrder.tenantId,
          metadata: {
            idempotencySource: requestIdempotencyKey ? 'explicit' : 'derived',
          },
        })
        return res.status(200).json({
          ...replayOrder,
          idempotencyReplay: true,
          duplicatePrevented: true,
        })
      }
      return res.status(409).json({
        error: 'Bestellung wurde bereits verarbeitet',
        code: 'ORDER_CREATE_ALREADY_PROCESSED',
      })
    }

    if (idempotencyResult.status === 'proceed') {
      idempotencyReservation = idempotencyResult.reservation
    }

    let terminal:
        | {
            id: string
            tenantId: string
            name: string
            isActive: boolean
            allowCashPayment: boolean
            allowCardPayment: boolean
            autoForwardToKitchen: boolean
            cashDisplayId: string | null
            kitchenDisplayId: string | null
            pickupDisplayId: string | null
          }
      | null = null

    if (normalizedTerminalId) {
      terminal = await prisma.orderTerminal.findUnique({
        where: { id: normalizedTerminalId },
        select: {
          id: true,
          tenantId: true,
          name: true,
          isActive: true,
          allowCashPayment: true,
          allowCardPayment: true,
          autoForwardToKitchen: true,
          cashDisplayId: true,
          kitchenDisplayId: true,
          pickupDisplayId: true,
        },
      })

      if (!terminal || terminal.tenantId !== resolvedTenantId) {
        return res.status(404).json({ error: 'Bestellterminal nicht gefunden' })
      }

      if (!terminal.isActive) {
        return res.status(400).json({ error: 'Bestellterminal ist deaktiviert' })
      }

      if (normalizedPaymentMethod === 'CASH' && !terminal.allowCashPayment) {
        return res.status(400).json({ error: 'Barzahlung ist am Terminal deaktiviert' })
      }

      if (normalizedPaymentMethod === 'CARD' && !terminal.allowCardPayment) {
        return res.status(400).json({ error: 'Kartenzahlung ist am Terminal deaktiviert' })
      }
    }

    const productIds = items.map((item) => item.productId)
    const invalidQuantityItem = items.find(
      (item) => !Number.isInteger(item.quantity) || item.quantity <= 0 || item.quantity > 200
    )
    if (invalidQuantityItem) {
      return res.status(400).json({ error: 'ungültige quantity in items' })
    }

    const products = await prisma.product.findMany({
      where: {
        tenantId: resolvedTenantId,
        id: { in: productIds },
      },
    })
    const offeredPrices = await resolveProductOffers(
      resolvedTenantId,
      products.map((entry) => ({
        id: entry.id,
        price: Number(entry.price),
      }))
    )

    if (products.length !== productIds.length) {
      return res.status(400).json({ error: 'Ein oder mehrere Produkte wurden nicht gefunden' })
    }

    const unavailable = products.filter((product) => !product.available)

    if (unavailable.length > 0) {
      return res.status(400).json({
        error: `Nicht verfügbare Produkte in Bestellung: ${unavailable
          .map((product) => product.name)
          .join(', ')}`,
      })
    }

    const requestedModifierIds = Array.from(
      new Set(
        items.flatMap((item) =>
          Array.isArray(item.modifierIds)
            ? item.modifierIds
                .map((entry) => normalizeText(entry))
                .filter((entry): entry is string => Boolean(entry))
            : []
        )
      )
    )

    const modifiers =
      requestedModifierIds.length > 0
        ? await prisma.productModifier.findMany({
            where: {
              tenantId: resolvedTenantId,
              isActive: true,
              id: {
                in: requestedModifierIds,
              },
            },
            select: {
              id: true,
              productId: true,
              ingredientId: true,
              name: true,
              priceDelta: true,
              ingredient: {
                select: {
                  name: true,
                },
              },
            },
          })
        : []

    if (modifiers.length !== requestedModifierIds.length) {
      return res.status(400).json({ error: 'Eine oder mehrere Optionen sind ungültig' })
    }

    const modifierById = new Map(modifiers.map((entry) => [entry.id, entry]))

    let subtotal = 0

    const orderItemsData = items.map((item) => {
      const product = products.find((entry) => entry.id === item.productId)

      if (!product) {
        throw new Error(`Produkt ${item.productId} nicht gefunden`)
      }

      const requestedIdsForItem = Array.isArray(item.modifierIds)
        ? Array.from(
            new Set(
              item.modifierIds
                .map((entry) => normalizeText(entry))
                .filter((entry): entry is string => Boolean(entry))
            )
          )
        : []

      const selectedModifiers = requestedIdsForItem.map((modifierId) => {
        const modifier = modifierById.get(modifierId)
        if (!modifier || modifier.productId !== product.id) {
          throw new Error(`Ungültige Option für Produkt ${product.id}`)
        }

        return modifier
      })
      const selectedGroupKeys = new Set<string>()
      for (const selectedModifier of selectedModifiers) {
        const groupKey = modifierSelectionGroupKey(selectedModifier)
        if (selectedGroupKeys.has(groupKey)) {
          throw new Error(
            `Pro Gruppe/Typ darf nur eine Option je Produkt gewaehlt werden (${product.name})`
          )
        }
        selectedGroupKeys.add(groupKey)
      }

      const unitBasePrice =
        offeredPrices.get(product.id)?.effectivePrice ?? Number(product.price)
      const unitModifierDelta = selectedModifiers.reduce(
        (sum, entry) => sum + Number(entry.priceDelta),
        0
      )
      const price = unitBasePrice + unitModifierDelta
      subtotal += price * item.quantity

      return {
        productId: product.id,
        quantity: item.quantity,
        price,
        unitBasePrice,
        unitModifierDelta,
        modifierSnapshot:
          selectedModifiers.length > 0
            ? selectedModifiers.map((entry) => ({
                id: entry.id,
                name: decodeStoredProductModifierName(entry.name).displayName,
                ingredientId: entry.ingredientId,
                ingredientName: entry.ingredient?.name ?? null,
                priceDelta: Number(entry.priceDelta),
              }))
            : undefined,
      }
    })

    const shouldMarkPaid =
      normalizedPaymentMethod === 'PAYPAL' || normalizedPaymentMethod === 'KLARNA'
        ? true
        : Boolean(markPaid)
    const shouldForward =
      forwardToKitchen === undefined
        ? terminal?.autoForwardToKitchen ?? true
        : Boolean(forwardToKitchen)
    let deliveryFee = 0

    if (isAppOrderChannel) {
      const tenant = await prisma.tenant.findUnique({
        where: { id: resolvedTenantId },
        select: {
          id: true,
          name: true,
          email: true,
          businessSettings: true,
        },
      })

      if (!tenant) {
        return res.status(404).json({ error: 'Filiale nicht gefunden' })
      }

      const settings = parseSettings(tenant.businessSettings, {
        name: tenant.name,
        email: tenant.email,
      })

      const intake = settings.orderIntake
      const serviceAllowed =
        resolvedServiceType === 'DELIVERY'
          ? intake.services.deliveryEnabledNow
          : resolvedServiceType === 'PICKUP'
            ? intake.services.pickupEnabledNow
            : true
      if (!intake.orderIntakeEnabled || !serviceAllowed) {
        return res.status(423).json({
          error:
            intake.orderIntakePausedReason ||
            'Aufgrund hoher Auslastung nimmt dieses Restaurant aktuell keine neuen Bestellungen an. Bitte versuche es später erneut.',
          code: 'ORDER_INTAKE_PAUSED',
          orderIntakeEnabled: intake.orderIntakeEnabled,
          pausedUntil: intake.orderIntakePausedUntil,
          services: {
            delivery: intake.services.deliveryEnabledNow,
            pickup: intake.services.pickupEnabledNow,
            tableOrdering: intake.services.tableOrderingEnabledNow,
          },
        })
      }

      if (!settings.customerApp.orderingEnabled) {
        return res
          .status(403)
          .json({ error: 'App-Bestellungen sind fuer diese Filiale nicht freigegeben' })
      }

      if (!settings.customerApp.guestCheckoutEnabled && !appAccount) {
        return res
          .status(401)
          .json({ error: 'Bitte mit Kundenkonto einloggen, um zu bestellen.' })
      }

      if (resolvedServiceType === 'DELIVERY') {
        const requiresPolygonCoordinates = settings.deliveryArea.strategy === 'POLYGON'
        if (
          requiresPolygonCoordinates &&
          (normalizedCustomerLatitude === null || normalizedCustomerLongitude === null)
        ) {
          return res.status(422).json({
            error:
              'Für Lieferungen im Polygon-Modus werden Koordinaten benötigt. Bitte Adresse erneut auswählen oder Standort freigeben.',
            code: 'DELIVERY_COORDINATES_REQUIRED',
          })
        }

        const deliveryAreaCheck = matchServiceArea(settings.deliveryArea, {
          zipCode: normalizedCustomerZipCode,
          street: normalizedCustomerAddress,
          latitude: normalizedCustomerLatitude,
          longitude: normalizedCustomerLongitude,
        })
        const usedCheck =
          settings.deliveryArea.strategy === 'POLYGON'
            ? 'POLYGON'
            : settings.deliveryArea.strategy === 'RADIUS'
              ? 'RADIUS'
              : settings.deliveryArea.strategy === 'ZIP_LIST'
                ? 'POSTAL_CODES'
                : settings.deliveryArea.strategy === 'ZIP_OR_RADIUS' ||
                    settings.deliveryArea.strategy === 'ZIP_AND_RADIUS'
                  ? deliveryAreaCheck.matchedByRadius
                    ? 'RADIUS'
                    : 'POSTAL_CODES'
                  : 'UNKNOWN'
        const strictPolygonResult =
          settings.deliveryArea.strategy === 'POLYGON'
            ? deliveryAreaCheck.matchedByPolygon
            : deliveryAreaCheck.matched
        console.info('DELIVERY_VALIDATION_ACTIVE_PATH', {
          route: 'POST /api/orders',
          sourceFile: 'backend/src/routes/orders.ts',
          strategy: settings.deliveryArea.strategy,
          zipCodesCount: settings.deliveryArea.zipCodes.length,
          polygonPointsCount: settings.deliveryArea.polygonPath.length,
          customerPostalCode: normalizedCustomerZipCode,
          customerLat: normalizedCustomerLatitude,
          customerLng: normalizedCustomerLongitude,
          usedCheck,
          result: strictPolygonResult,
        })

        if (!strictPolygonResult) {
          return res.status(409).json({
            error:
              'Die Lieferadresse liegt außerhalb des Liefergebiets. Bitte andere Adresse wählen oder Abholung nutzen.',
            code: 'DELIVERY_AREA_MISMATCH',
            deliveryAreaCheck,
          })
        }

        const minOrderAmount = parseAmountFromText(settings.minOrderValue)
        if (minOrderAmount !== null && subtotal < minOrderAmount) {
          return res.status(400).json({
            error: `Mindestbestellwert nicht erreicht. Aktuell ${subtotal.toFixed(
              2
            )} EUR, erforderlich ${minOrderAmount.toFixed(2)} EUR.`,
          })
        }
        deliveryFee = parseAmountFromText(settings.deliveryFeeNote) ?? 0
      }
    }

    const fallbackRouting = await resolveDisplayRouting({
      tenantId: resolvedTenantId,
      terminalId: terminal?.id ?? null,
    })
    const routedCashDisplayId = terminal?.cashDisplayId ?? fallbackRouting.cashDisplayId ?? null
    const routedKitchenDisplayId =
      terminal?.kitchenDisplayId ?? fallbackRouting.kitchenDisplayId ?? null
    const routedPickupDisplayId =
      terminal?.pickupDisplayId ?? fallbackRouting.pickupDisplayId ?? null
    const shouldAssignLocalPickupNumber = isAppOrderChannel
    const localPickupNumber = shouldAssignLocalPickupNumber
      ? await generateNextPickupNumberForTenant(resolvedTenantId)
      : null

    const total = subtotal + deliveryFee

    let duplicatePrevented = false
    let order = null as Awaited<ReturnType<typeof loadOrderForCreateResponse>> | null
    try {
      order = await prisma.$transaction(async (tx) => {
        const created = await tx.order.create({
          data: {
            tenantId: resolvedTenantId,
            terminalId: terminal?.id ?? null,
            terminalDeviceId: normalizedTerminalDeviceId,
            clientOrderId: normalizedClientOrderId,
            idempotencyKey: requestIdempotencyKey,
            appCustomerAccountId: appAccount?.id ?? null,
            customerName: normalizedCustomerName ?? appAccount?.fullName ?? null,
            customerPhone: normalizedCustomerPhone ?? appAccount?.phone ?? null,
            customerAddress: normalizedCustomerAddress ?? appAccount?.street ?? null,
            customerZipCode: normalizedCustomerZipCode ?? appAccount?.zipCode ?? null,
            customerCity: normalizedCustomerCity ?? appAccount?.city ?? null,
            serviceType: resolvedServiceType,
            subtotal,
            deliveryFee,
            cashDisplayId: routedCashDisplayId,
            kitchenDisplayId: routedKitchenDisplayId,
            pickupDisplayId: routedPickupDisplayId,
            pickupNumber: localPickupNumber,
            total,
            status: shouldForward ? 'open' : 'pending_payment',
            sourceChannel: normalizedSourceChannel,
            paymentStatus: shouldMarkPaid ? 'PAID' : 'UNPAID',
            paymentMethod: normalizedPaymentMethod,
            paidAt: shouldMarkPaid ? new Date() : null,
            forwardedToKitchenAt: shouldForward ? new Date() : null,
            items: {
              create: orderItemsData.map((item) => ({
                quantity: item.quantity,
                price: item.price,
                unitBasePrice: item.unitBasePrice,
                unitModifierDelta: item.unitModifierDelta,
                modifierSnapshot: item.modifierSnapshot ?? undefined,
                product: {
                  connect: {
                    id: item.productId,
                  },
                },
              })),
            },
          },
          select: {
            id: true,
          },
        })

        await applyInventoryConsumptionForOrder(tx, created.id)

        const hydrated = await tx.order.findUnique({
          where: {
            id: created.id,
          },
          include: {
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
                    category: true,
                  },
                },
              },
            },
          },
        })

        if (!hydrated) {
          throw new Error('Bestellung konnte nach dem Speichern nicht geladen werden')
        }

        return hydrated
      })
    } catch (createError) {
      if (!isPrismaUniqueConstraintError(createError)) {
        throw createError
      }
      const existingAfterRace = await findExistingOrderForIdempotency({
        tenantId: resolvedTenantId,
        clientOrderId: normalizedClientOrderId,
        idempotencyKey: requestIdempotencyKey,
      })
      if (!existingAfterRace) {
        throw createError
      }
      duplicatePrevented = true
      order = existingAfterRace
    }

    if (!order) {
      throw new Error('Bestellung konnte nicht geladen werden')
    }

    console.info('ORDER IDEMPOTENCY FINAL', {
      tenantId: resolvedTenantId,
      orderId: order.id,
      finalClientOrderId: normalizedClientOrderId,
      finalIdempotencyKey: requestIdempotencyKey,
      finalTerminalDeviceId: normalizedTerminalDeviceId,
      duplicatePrevented,
    })

    if (idempotencyReservation) {
      completeOrderCreateIdempotency(idempotencyReservation, order.id)
    }

    return res.status(duplicatePrevented ? 200 : 201).json({
      ...order,
      duplicatePrevented,
    })
  } catch (error) {
    if (idempotencyReservation) {
      releaseOrderCreateIdempotency(idempotencyReservation)
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    if (
      error instanceof Error &&
      (error.message.startsWith('Ungültige Option für Produkt') ||
        error.message.startsWith('Pro Gruppe/Typ darf nur eine Option je Produkt') ||
        error.message.startsWith('Produkt '))
    ) {
      return res.status(400).json({ error: error.message })
    }
    console.error('POST ORDER ERROR:', error)
    return res.status(500).json({ error: 'Fehler beim Erstellen der Bestellung' })
  }
})

router.post('/:orderId/rating', async (req, res) => {
  try {
    const orderId = normalizeText(req.params.orderId)
    if (!orderId) {
      return res.status(400).json({ error: 'orderId fehlt' })
    }

    const stars = parseRatingStars((req.body as { stars?: unknown }).stars)
    const comment = parseRatingComment((req.body as { comment?: unknown }).comment)
    const appAccount = await resolveAppAccountFromAuthorizationHeader(
      req.header('authorization') || undefined
    )
    if (!appAccount) {
      return res.status(401).json({ error: 'Bitte in der App einloggen, um zu bewerten' })
    }
    if (!stars) {
      return res.status(400).json({ error: 'Sterne muessen als Wert von 1 bis 5 gesetzt sein' })
    }

    const order = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        sourceChannel: true,
        appCustomerAccountId: true,
        paymentStatus: true,
        paidAt: true,
        tenant: {
          select: {
            chainId: true,
          },
        },
      },
    })
    if (!order) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    if (order.sourceChannel !== 'APP' && order.sourceChannel !== 'DELIVERY') {
      return res.status(400).json({ error: 'Nur App-Bestellungen koennen bewertet werden' })
    }
    if (order.appCustomerAccountId !== appAccount.id) {
      return res.status(403).json({ error: 'Diese Bestellung gehoert nicht zu deinem Konto' })
    }

    if (order.paymentStatus !== 'PAID' || !order.paidAt) {
      return res.status(400).json({ error: 'Bewertung ist erst nach erfolgreicher Zahlung moeglich' })
    }

    const ratingWindow = resolveOrderRatingWindow(order.paidAt)
    if (!ratingWindow.canRate) {
      if (ratingWindow.reason === 'cooldown') {
        return res.status(400).json({
          error: `Bewertung ist 1 Stunde nach Zahlung moeglich (ab ${formatTimestamp(
            ratingWindow.opensAt
          )}).`,
        })
      }
      return res.status(400).json({
        error: `Bewertungsfenster abgelaufen (bis ${formatTimestamp(ratingWindow.closesAt)} moeglich).`,
      })
    }

    const existing = await prisma.auditLog.findFirst({
      where: {
        module: 'order_rating',
        action: 'order_rating_submitted',
        targetType: 'order',
        targetId: order.id,
      },
      select: { id: true },
    })

    if (existing) {
      return res.status(409).json({ error: 'Diese Bestellung wurde bereits bewertet' })
    }

    await writeAuditLog({
      req,
      module: 'order_rating',
      action: 'order_rating_submitted',
      targetType: 'order',
      targetId: order.id,
      chainId: order.tenant?.chainId ?? null,
      tenantId: order.tenantId,
      metadata: {
        stars,
        comment: comment ?? null,
      },
    })

    return res.status(201).json({
      ok: true,
      orderId: order.id,
      tenantId: order.tenantId,
      stars,
      comment: comment ?? null,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('POST ORDER RATING ERROR:', error)
    return res.status(500).json({ error: 'Bewertung konnte nicht gespeichert werden' })
  }
})

router.post('/:orderId/complaints', async (req, res) => {
  try {
    const orderId = normalizeText(req.params.orderId)
    if (!orderId) {
      return res.status(400).json({ error: 'orderId fehlt' })
    }

    const appAccount = await resolveAppAccountFromAuthorizationHeader(
      req.header('authorization') || undefined
    )
    if (!appAccount) {
      return res.status(401).json({ error: 'Bitte in der App einloggen, um zu reklamieren' })
    }

    const sourcePayload = req.body as {
      message?: unknown
      images?: unknown
    }

    const message = normalizeText(typeof sourcePayload.message === 'string' ? sourcePayload.message : null)
    if (!message) {
      return res.status(400).json({ error: 'Bitte einen Reklamationstext eingeben' })
    }
    if (message.length > MAX_COMPLAINT_TEXT_LENGTH) {
      return res
        .status(400)
        .json({ error: `Reklamationstext darf maximal ${MAX_COMPLAINT_TEXT_LENGTH} Zeichen haben` })
    }

    const images = (Array.isArray(sourcePayload.images) ? sourcePayload.images : [])
      .map((entry) => sanitizeImagePayload(entry))
      .filter((entry): entry is string => Boolean(entry))
      .slice(0, MAX_COMPLAINT_IMAGES)

    const order = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        appCustomerAccountId: true,
        sourceChannel: true,
        tenant: {
          select: {
            chainId: true,
          },
        },
      },
    })
    if (!order) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    if (order.sourceChannel !== 'APP' && order.sourceChannel !== 'DELIVERY') {
      return res.status(400).json({ error: 'Reklamation ist nur fuer App-Bestellungen verfuegbar' })
    }
    if (order.appCustomerAccountId !== appAccount.id) {
      return res.status(403).json({ error: 'Diese Bestellung gehoert nicht zu deinem Konto' })
    }

    const complaintId = `cmp_${Date.now().toString(36)}_${Math.random().toString(36).slice(2, 8)}`
    await writeAuditLog({
      req,
      module: 'order_complaint',
      action: 'created',
      targetType: 'order',
      targetId: order.id,
      chainId: order.tenant?.chainId ?? null,
      tenantId: order.tenantId,
      metadata: {
        complaintId,
        message,
        images,
        createdBy: 'app_customer',
        accountId: appAccount.id,
      },
    })

    return res.status(201).json({
      ok: true,
      complaintId,
      orderId: order.id,
      tenantId: order.tenantId,
      message,
      imageCount: images.length,
      createdAt: new Date().toISOString(),
    })
  } catch (error) {
    console.error('POST ORDER COMPLAINT ERROR:', error)
    return res.status(500).json({ error: 'Reklamation konnte nicht gespeichert werden' })
  }
})

router.post(
  '/:orderId/complaints/:complaintId/resolve',
  requirePermission(PermissionKey.ORDERS_WRITE),
  async (req, res) => {
    try {
      if (!req.authUser) {
        return res.status(401).json({ error: 'Nicht eingeloggt' })
      }

      const orderId = normalizeText(
        Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId
      )
      const complaintId = normalizeText(
        Array.isArray(req.params.complaintId)
          ? req.params.complaintId[0]
          : req.params.complaintId
      )
      if (!orderId || !complaintId) {
        return res.status(400).json({ error: 'orderId oder complaintId fehlt' })
      }

      const order = await prisma.order.findUnique({
        where: { id: orderId },
        select: {
          id: true,
          tenantId: true,
          tenant: {
            select: {
              chainId: true,
            },
          },
        },
      })
      if (!order) {
        return res.status(404).json({ error: 'Bestellung nicht gefunden' })
      }

      await resolveTenantScope(req, order.tenantId)

      const issueStateByOrderId = await loadOrderIssueStateByOrderId([order.id])
      const issueState = issueStateByOrderId.get(order.id)
      if (!issueState || issueState.complaints.length === 0) {
        return res.status(404).json({ error: 'Keine Reklamation zu dieser Bestellung gefunden' })
      }

      const targetComplaint = issueState.complaints.find(
        (entry) => entry.id === complaintId
      )
      if (!targetComplaint) {
        return res.status(404).json({ error: 'Reklamation nicht gefunden' })
      }
      if (targetComplaint.isResolved) {
        return res.status(400).json({ error: 'Reklamation ist bereits erledigt' })
      }

      await writeAuditLog({
        req,
        module: 'order_complaint',
        action: 'resolved',
        targetType: 'order',
        targetId: order.id,
        chainId: order.tenant?.chainId ?? null,
        tenantId: order.tenantId,
        metadata: {
          complaintId: targetComplaint.id,
        },
      })

      return res.json({
        ok: true,
        orderId: order.id,
        complaintId: targetComplaint.id,
        resolvedAt: new Date().toISOString(),
      })
    } catch (error) {
      const scopeError = asTenantScopeError(error)
      if (scopeError) {
        return res.status(scopeError.status).json({ error: scopeError.message })
      }
      console.error('RESOLVE ORDER COMPLAINT ERROR:', error)
      return res.status(500).json({ error: 'Reklamation konnte nicht erledigt werden' })
    }
  }
)

router.post('/driver/device-login', rateLimitDriverDeviceLogin, async (req, res) => {
  try {
    const payload = req.body as {
      pairingToken?: string | null
      pairingPayload?: string | null
      qrPayload?: string | null
      driverEmail?: string | null
      driverPassword?: string | null
      driverName?: string | null
      accessHours?: number | null
    }

    const parsedPair = parseDriverPairPayload(
      payload.pairingToken ?? payload.pairingPayload ?? payload.qrPayload
    )
    if (!parsedPair) {
      return res.status(400).json({ error: 'pairingToken oder QR-Payload fehlt' })
    }
    if (parsedPair.invalidType) {
      return res.status(400).json({
        error: 'Dieser QR-Code ist nicht für die Fahrer-App geeignet.',
      })
    }

    const pairingPayload = verifyDriverDeviceToken(parsedPair.token as string)
    if (!pairingPayload || pairingPayload.kind !== 'PAIRING') {
      return res.status(401).json({ error: 'QR-Pairing ist ungueltig oder abgelaufen' })
    }
    if (parsedPair.displayCode && parsedPair.displayCode !== pairingPayload.displayCode) {
      return res.status(400).json({ error: 'QR-Code gehoert nicht zu diesem Display' })
    }

    const session = await resolveDriverDeviceSession(pairingPayload.sid, pairingPayload.tenantId)
    if (!session || !session.isActive || session.revokedAt) {
      return res.status(401).json({ error: 'Fahrergeraet-Session ist nicht mehr aktiv' })
    }
    if (session.displayCode !== pairingPayload.displayCode) {
      return res.status(401).json({ error: 'Pairing passt nicht zur Session' })
    }

    const normalizedEmail = normalizeText(payload.driverEmail)?.toLowerCase() ?? null
    const rawPassword = typeof payload.driverPassword === 'string' ? payload.driverPassword : ''
    const normalizedName = normalizeText(payload.driverName)

    let boundDriverUserId: string | null = null
    let boundDriverName: string | null = null

    if (normalizedEmail || rawPassword.length > 0) {
      if (!normalizedEmail || rawPassword.length === 0) {
        return res
          .status(400)
          .json({ error: 'Bitte fuer Kontobindung E-Mail und Passwort angeben' })
      }

      const driver = await prisma.user.findUnique({
        where: { email: normalizedEmail },
        select: {
          id: true,
          name: true,
          role: true,
          isActive: true,
          tenantId: true,
          passwordHash: true,
        },
      })

      if (
        !driver ||
        !driver.isActive ||
        driver.role !== UserRole.DRIVER ||
        !verifyPassword(rawPassword, driver.passwordHash)
      ) {
        return res.status(401).json({ error: 'Fahrer-Login fehlgeschlagen' })
      }

      if (driver.tenantId !== session.tenantId) {
        return res
          .status(403)
          .json({ error: 'Fahrer gehoert nicht zur Filiale dieses Kassendisplays' })
      }

      if (needsPasswordRehash(driver.passwordHash)) {
        await prisma.user.update({
          where: { id: driver.id },
          data: {
            passwordHash: hashPassword(rawPassword),
          },
        })
      }

      boundDriverUserId = driver.id
      boundDriverName = driver.name
    } else {
      boundDriverName = normalizedName ?? normalizeText(session.deviceLabel)
    }

    if (!boundDriverName) {
      return res.status(400).json({ error: 'Fahrername konnte nicht ermittelt werden' })
    }

    const tenant = await prisma.tenant.findUnique({
      where: { id: session.tenantId },
      select: {
        id: true,
        name: true,
        email: true,
        businessSettings: true,
      },
    })
    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    const parsedSettings = parseSettings(tenant.businessSettings, {
      name: tenant.name,
      email: tenant.email,
    })
    const accessHours =
      parseDriverAccessHours(payload.accessHours) ?? parsedSettings.driver.defaultAccessHours
    const now = Date.now()
    const requestedExpiryMs = now + accessHours * 60 * 60 * 1000
    const maxSessionExpiryMs = new Date(session.expiresAt).getTime()
    const resolvedExpiryMs = Number.isFinite(maxSessionExpiryMs)
      ? Math.min(requestedExpiryMs, maxSessionExpiryMs)
      : requestedExpiryMs

    const sessionToken = signDriverDeviceToken({
      sid: session.sessionId,
      tenantId: session.tenantId,
      displayCode: session.displayCode,
      deviceLabel: session.deviceLabel,
      driverUserId: boundDriverUserId,
      driverName: boundDriverName,
      kind: 'SESSION',
      expiresAtMs: resolvedExpiryMs,
    })

    await writeAuditLog({
      req,
      module: DRIVER_DEVICE_SESSION_MODULE,
      action: 'session_bound',
      targetType: DRIVER_DEVICE_SESSION_TARGET_TYPE,
      targetId: session.sessionId,
      tenantId: session.tenantId,
      metadata: {
        displayId: session.displayId,
        displayCode: session.displayCode,
        deviceLabel: session.deviceLabel,
        expiresAt: new Date(resolvedExpiryMs).toISOString(),
        driverUserId: boundDriverUserId,
        driverName: boundDriverName,
      },
    })

    return res.json({
      ok: true,
      authToken: sessionToken,
      session: {
        sessionId: session.sessionId,
        tenantId: session.tenantId,
        displayCode: session.displayCode,
        deviceLabel: session.deviceLabel,
        expiresAt: new Date(resolvedExpiryMs).toISOString(),
        secondsUntilExpiry: Math.max(30, Math.floor((resolvedExpiryMs - now) / 1000)),
      },
      driver: {
        userId: boundDriverUserId,
        name: boundDriverName,
      },
      mode: boundDriverUserId ? 'DEVICE_WITH_DRIVER_USER' : 'DEVICE_ONLY',
    })
  } catch (error) {
    console.error('DRIVER DEVICE LOGIN ERROR:', error)
    return res.status(500).json({ error: 'Geraete-Login konnte nicht gestartet werden' })
  }
})

router.post('/driver/device-heartbeat', async (req, res) => {
  try {
    const actor = await resolveDriverActor(req)
    if (!actor) {
      return res.status(401).json({ error: 'Fahrersitzung fehlt oder ist ungueltig' })
    }
    if (!actor.isDeviceActor) {
      return res.json({
        ok: true,
        mode: 'USER_SESSION',
        serverTime: new Date().toISOString(),
      })
    }

    await writeAuditLog({
      req,
      module: DRIVER_DEVICE_SESSION_MODULE,
      action: 'session_heartbeat',
      targetType: DRIVER_DEVICE_SESSION_TARGET_TYPE,
      targetId: actor.sessionId,
      tenantId: actor.tenantId,
      metadata: {
        displayCode: actor.displayCode,
        deviceLabel: actor.session.deviceLabel,
        expiresAt: actor.expiresAt,
        driverUserId: actor.driverUserId,
        driverName: actor.driverName,
      },
    })

    const expiresAtMs = new Date(actor.expiresAt).getTime()
    const remainingSeconds = Number.isFinite(expiresAtMs)
      ? Math.max(0, Math.floor((expiresAtMs - Date.now()) / 1000))
      : 0
    return res.json({
      ok: true,
      mode: 'DEVICE_SESSION',
      sessionId: actor.sessionId,
      displayCode: actor.displayCode,
      expiresAt: actor.expiresAt,
      secondsUntilExpiry: remainingSeconds,
      onlineHeartbeatMs: DRIVER_DEVICE_ONLINE_HEARTBEAT_MS,
      serverTime: new Date().toISOString(),
    })
  } catch (error) {
    console.error('DRIVER DEVICE HEARTBEAT ERROR:', error)
    return res.status(500).json({ error: 'Heartbeat konnte nicht gespeichert werden' })
  }
})

router.post('/driver/route-start', async (req, res) => {
  try {
    const actor = await resolveDriverActor(req)
    if (!actor) {
      return res.status(401).json({ error: 'Fahrersitzung fehlt oder ist ungueltig' })
    }

    const payload = req.body as {
      orderId?: string | null
      estimatedMinutes?: number | string | null
    }
    const orderId = normalizeText(payload.orderId)
    if (!orderId) {
      return res.status(400).json({ error: 'orderId fehlt' })
    }

    const parsedEstimatedMinutes = parseFiniteNumber(payload.estimatedMinutes)
    if (
      parsedEstimatedMinutes !== null &&
      (!Number.isFinite(parsedEstimatedMinutes) ||
        parsedEstimatedMinutes < 5 ||
        parsedEstimatedMinutes > 240)
    ) {
      return res.status(400).json({ error: 'estimatedMinutes muss zwischen 5 und 240 liegen' })
    }

    const order = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        status: true,
        serviceType: true,
        assignedDriverId: true,
        assignedDriverName: true,
        acceptedAt: true,
        estimatedMinutes: true,
        tenant: {
          select: {
            chainId: true,
          },
        },
      },
    })

    if (!order) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }
    if (order.tenantId !== actor.tenantId) {
      return res.status(403).json({ error: 'Keine Berechtigung fuer diese Filiale' })
    }
    if (order.serviceType !== 'DELIVERY') {
      return res.status(400).json({ error: 'Route ist nur bei Lieferbestellungen moeglich' })
    }
    if (!isOrderAssignedToDriverActor(order, actor)) {
      return res.status(403).json({ error: 'Bestellung ist nicht diesem Fahrer/Geraet zugewiesen' })
    }
    if (order.status === 'archived') {
      return res.status(400).json({ error: 'Archivierte Bestellung kann nicht gestartet werden' })
    }

    const now = new Date()
    const nextEstimatedMinutes =
      parsedEstimatedMinutes === null
        ? order.estimatedMinutes ?? 30
        : Math.round(parsedEstimatedMinutes)
    const nextEstimatedReadyAt = new Date(now.getTime() + nextEstimatedMinutes * 60 * 1000)

    const updated = await prisma.order.update({
      where: { id: order.id },
      data: {
        status: 'out_for_delivery',
        driverDepartedAt: now,
        acceptedAt: order.acceptedAt ?? now,
        estimatedMinutes: nextEstimatedMinutes,
        estimatedReadyAt: nextEstimatedReadyAt,
      },
      include: {
        tenant: {
          select: {
            id: true,
            name: true,
          },
        },
        items: {
          include: {
            product: {
              include: {
                category: true,
              },
            },
          },
        },
      },
    })

    await writeAuditLog({
      req,
      module: 'driver_tracking',
      action: 'route_started',
      targetType: 'order',
      targetId: order.id,
      chainId: order.tenant?.chainId ?? null,
      tenantId: order.tenantId,
      metadata: {
        driverUserId: actor.driverUserId,
        driverName: actor.driverName,
        deviceSessionId: actor.isDeviceActor ? actor.sessionId : null,
        displayCode: actor.isDeviceActor ? actor.displayCode : null,
        estimatedMinutes: nextEstimatedMinutes,
      },
    })

    return res.json(updated)
  } catch (error) {
    console.error('POST DRIVER ROUTE START ERROR:', error)
    return res.status(500).json({ error: 'Route-Start konnte nicht gespeichert werden' })
  }
})

router.get('/driver/assigned', async (req, res) => {
  try {
    const actor = await resolveDriverActor(req)
    if (!actor) {
      return res.status(401).json({ error: 'Fahrersitzung fehlt oder ist ungueltig' })
    }

    const tenant = await prisma.tenant.findUnique({
      where: { id: actor.tenantId },
      select: {
        id: true,
        name: true,
        email: true,
        businessSettings: true,
      },
    })
    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }
    const parsedTenantSettings = parseSettings(tenant.businessSettings, {
      name: tenant.name,
      email: tenant.email,
    })
    const driverSettings = {
      locationTrackingEnabled: parsedTenantSettings.driver.locationTrackingEnabled,
      locationUpdateSeconds: parsedTenantSettings.driver.locationUpdateSeconds,
      customerLiveTrackingEnabled: parsedTenantSettings.driver.customerLiveTrackingEnabled,
    }

    const driverName = normalizeText(actor.driverName)
    const assignmentFilter: Prisma.OrderWhereInput[] = []
    if (actor.driverUserId) {
      assignmentFilter.push({ assignedDriverId: actor.driverUserId })
    }
    if (driverName) {
      assignmentFilter.push({ assignedDriverName: driverName })
    }
    if (assignmentFilter.length === 0) {
      return res.json({ total: 0, orders: [], driverSettings })
    }

    const orders = await prisma.order.findMany({
      where: {
        tenantId: actor.tenantId,
        OR: assignmentFilter,
        driverAssignedAt: {
          not: null,
        },
        status: {
          in: ['preparing', 'out_for_delivery'],
        },
      },
      include: {
        tenant: {
          select: {
            id: true,
            name: true,
          },
        },
        items: {
          include: {
            product: {
              include: {
                category: true,
              },
            },
          },
        },
      },
      orderBy: [{ createdAt: 'desc' }],
    })

    const latestDriverLocations = await loadLatestDriverLocationByOrderId(
      orders.map((entry) => entry.id)
    )
    const issueStateByOrderId = await loadOrderIssueStateByOrderId(orders.map((entry) => entry.id))

    return res.json({
      total: orders.length,
      driverSettings,
      actor: {
        mode: actor.actorType,
        driverUserId: actor.driverUserId,
        driverName: actor.driverName,
        sessionId: actor.sessionId,
        displayCode: actor.displayCode,
        expiresAt: actor.expiresAt,
        sessionHealth: actor.isDeviceActor
          ? {
              isOnline: actor.session.isOnline,
              isActive: actor.session.isActive,
              lastHeartbeatAt: actor.session.lastHeartbeatAt,
            }
          : null,
      },
      orders: orders.map((entry) => ({
        ...entry,
        driverLocation: latestDriverLocations.get(entry.id) ?? null,
        complaintOpen: issueStateByOrderId.get(entry.id)?.complaintOpen ?? false,
        complaintCount: issueStateByOrderId.get(entry.id)?.complaintCount ?? 0,
        latestComplaintAt: issueStateByOrderId.get(entry.id)?.latestComplaintAt ?? null,
        latestComplaintMessage: issueStateByOrderId.get(entry.id)?.latestComplaintMessage ?? null,
        latestComplaintImageCount:
          issueStateByOrderId.get(entry.id)?.latestComplaintImageCount ?? 0,
        signatureCaptured: issueStateByOrderId.get(entry.id)?.signatureCaptured ?? false,
        signatureCapturedAt: issueStateByOrderId.get(entry.id)?.signatureCapturedAt ?? null,
        signatureSignerName: issueStateByOrderId.get(entry.id)?.signatureSignerName ?? null,
      })),
    })
  } catch (error) {
    console.error('GET DRIVER ASSIGNED ORDERS ERROR:', error)
    return res.status(500).json({ error: 'Fahrerauftraege konnten nicht geladen werden' })
  }
})

router.post('/driver/signature', async (req, res) => {
  try {
    const actor = await resolveDriverActor(req)
    if (!actor) {
      return res.status(401).json({ error: 'Fahrersitzung fehlt oder ist ungueltig' })
    }

    const payload = req.body as {
      orderId?: string | null
      signerName?: string | null
      signatureImageDataUrl?: string | null
    }

    const orderId = normalizeText(payload.orderId)
    const signerName = normalizeText(payload.signerName)
    const signatureImageDataUrl = sanitizeImagePayload(payload.signatureImageDataUrl)

    if (!orderId) {
      return res.status(400).json({ error: 'orderId fehlt' })
    }
    if (!signerName) {
      return res.status(400).json({ error: 'Name fuer die Unterschrift fehlt' })
    }
    if (!signatureImageDataUrl) {
      return res.status(400).json({ error: 'Unterschrift-Bild fehlt oder ist ungueltig' })
    }
    if (signatureImageDataUrl.length > MAX_SIGNATURE_IMAGE_PAYLOAD) {
      return res.status(400).json({ error: 'Unterschrift-Bild ist zu gross' })
    }

    const order = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        assignedDriverId: true,
        assignedDriverName: true,
        status: true,
        tenant: {
          select: {
            chainId: true,
          },
        },
      },
    })
    if (!order) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }
    if (order.tenantId !== actor.tenantId) {
      return res.status(403).json({ error: 'Keine Berechtigung fuer diese Filiale' })
    }
    if (!isOrderAssignedToDriverActor(order, actor)) {
      return res.status(403).json({ error: 'Bestellung ist nicht diesem Fahrer/Geraet zugewiesen' })
    }
    if (order.status !== 'out_for_delivery' && order.status !== 'done') {
      return res
        .status(400)
        .json({ error: 'Unterschrift kann erst bei "Fahrer unterwegs" oder "Fertig" gesetzt werden' })
    }

    await writeAuditLog({
      req,
      module: 'order_signature',
      action: 'captured',
      targetType: 'order',
      targetId: order.id,
      chainId: order.tenant?.chainId ?? null,
      tenantId: order.tenantId,
      metadata: {
        signerName,
        signatureImageDataUrl,
        capturedBy: actor.driverUserId ?? `device:${actor.sessionId}`,
        capturedByName: actor.driverName,
        deviceSessionId: actor.isDeviceActor ? actor.sessionId : null,
      },
    })

    return res.status(201).json({
      ok: true,
      orderId: order.id,
      signerName,
      capturedAt: new Date().toISOString(),
    })
  } catch (error) {
    console.error('POST DRIVER SIGNATURE ERROR:', error)
    return res.status(500).json({ error: 'Unterschrift konnte nicht gespeichert werden' })
  }
})

router.post('/driver/location', async (req, res) => {
  try {
    const actor = await resolveDriverActor(req)
    if (!actor) {
      return res.status(401).json({ error: 'Fahrersitzung fehlt oder ist ungueltig' })
    }

    const {
      orderId,
      latitude,
      longitude,
      accuracyMeters,
      heading,
      speedKmh,
    } = req.body as {
      orderId?: string | null
      latitude?: number | string | null
      longitude?: number | string | null
      accuracyMeters?: number | string | null
      heading?: number | string | null
      speedKmh?: number | string | null
    }

    const normalizedOrderId = normalizeText(orderId)
    if (!normalizedOrderId) {
      return res.status(400).json({ error: 'orderId fehlt' })
    }

    const parsedLatitude = parseFiniteNumber(latitude)
    const parsedLongitude = parseFiniteNumber(longitude)
    if (
      parsedLatitude === null ||
      parsedLongitude === null ||
      parsedLatitude < -90 ||
      parsedLatitude > 90 ||
      parsedLongitude < -180 ||
      parsedLongitude > 180
    ) {
      return res.status(400).json({ error: 'Ungueltige Standortkoordinaten' })
    }

    const order = await prisma.order.findUnique({
      where: {
        id: normalizedOrderId,
      },
      select: {
        id: true,
        tenantId: true,
        status: true,
        assignedDriverId: true,
        assignedDriverName: true,
        tenant: {
          select: {
            chainId: true,
          },
        },
      },
    })

    if (!order) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    if (order.tenantId !== actor.tenantId) {
      return res.status(403).json({ error: 'Keine Berechtigung fuer diese Filiale' })
    }
    if (!isOrderAssignedToDriverActor(order, actor)) {
      return res.status(403).json({ error: 'Bestellung ist nicht diesem Fahrer/Geraet zugewiesen' })
    }

    if (order.status !== 'out_for_delivery' && order.status !== 'preparing') {
      return res.status(400).json({ error: 'Standort kann nur bei aktiven Lieferauftraegen gesendet werden' })
    }

    const parsedAccuracy = parseFiniteNumber(accuracyMeters)
    const parsedHeading = parseFiniteNumber(heading)
    const parsedSpeed = parseFiniteNumber(speedKmh)

    await writeAuditLog({
      req,
      module: 'driver_tracking',
      action: 'location_ping',
      targetType: 'order',
      targetId: order.id,
      chainId: order.tenant?.chainId ?? null,
      tenantId: order.tenantId,
      metadata: {
        latitude: parsedLatitude,
        longitude: parsedLongitude,
        accuracyMeters: parsedAccuracy,
        heading: parsedHeading,
        speedKmh: parsedSpeed,
        driverUserId: actor.driverUserId,
        driverName: actor.driverName,
        deviceSessionId: actor.isDeviceActor ? actor.sessionId : null,
      },
    })

    return res.json({
      ok: true,
      orderId: order.id,
      location: {
        latitude: parsedLatitude,
        longitude: parsedLongitude,
        accuracyMeters: parsedAccuracy,
        heading: parsedHeading,
        speedKmh: parsedSpeed,
      },
      updatedAt: new Date().toISOString(),
    })
  } catch (error) {
    console.error('POST DRIVER LOCATION ERROR:', error)
    return res.status(500).json({ error: 'Fahrerstandort konnte nicht gespeichert werden' })
  }
})

router.post('/:orderId/dispatch', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const rawOrderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId
    const orderId = normalizeText(rawOrderId)
    if (!orderId) {
      return res.status(400).json({ error: 'orderId fehlt' })
    }

    if (!req.authUser) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    const { driverUserId, driverName, estimatedMinutes } = req.body as {
      driverUserId?: string | null
      driverName?: string | null
      estimatedMinutes?: number | null
    }

    const normalizedDriverUserId = normalizeText(driverUserId)
    const normalizedDriverName = normalizeText(driverName)
    const normalizedEstimatedMinutes = parseEstimatedMinutes(estimatedMinutes)
    if (
      estimatedMinutes !== undefined &&
      estimatedMinutes !== null &&
      normalizedEstimatedMinutes === null
    ) {
      return res
        .status(400)
        .json({ error: 'estimatedMinutes muss zwischen 5 und 240 Minuten liegen' })
    }

    const currentOrder = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        serviceType: true,
        status: true,
        estimatedMinutes: true,
        acceptedAt: true,
        driverAssignedAt: true,
        tenant: {
          select: {
            chainId: true,
          },
        },
      },
    })

    if (!currentOrder) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    await resolveTenantScope(req, currentOrder.tenantId)

    if (currentOrder.serviceType !== 'DELIVERY') {
      return res.status(400).json({ error: 'Nur Lieferbestellungen koennen an Fahrer uebergeben werden' })
    }

    if (currentOrder.status === 'archived') {
      return res.status(400).json({ error: 'Archivierte Bestellungen koennen nicht versendet werden' })
    }

    let resolvedDriverUser:
      | {
          id: string
          name: string
        }
      | null = null
    let driverDeviceStatus:
      | {
          hasActiveSession: boolean
          isOnline: boolean
          sessionId: string | null
          lastHeartbeatAt: string | null
        }
      | null = null

    if (normalizedDriverUserId) {
      const foundDriver = await prisma.user.findUnique({
        where: { id: normalizedDriverUserId },
        select: {
          id: true,
          name: true,
          role: true,
          isActive: true,
          tenantId: true,
        },
      })

      if (!foundDriver || !foundDriver.isActive || foundDriver.role !== UserRole.DRIVER) {
        return res.status(400).json({ error: 'Ausgewaehlter Fahrer ist ungueltig oder inaktiv' })
      }

      if (foundDriver.tenantId !== currentOrder.tenantId) {
        return res.status(400).json({ error: 'Fahrer gehoert nicht zur Filiale der Bestellung' })
      }

      resolvedDriverUser = {
        id: foundDriver.id,
        name: foundDriver.name,
      }

      const driverSessions = await listDriverDeviceSessionsForTenant(currentOrder.tenantId, {
        includeExpired: false,
      })
      const driverSession =
        driverSessions.find((entry) => entry.driverUserId === foundDriver.id && entry.isOnline) ??
        driverSessions.find((entry) => entry.driverUserId === foundDriver.id && entry.isActive) ??
        null
      driverDeviceStatus = {
        hasActiveSession: Boolean(driverSession && driverSession.isActive),
        isOnline: Boolean(driverSession && driverSession.isOnline),
        sessionId: driverSession?.sessionId ?? null,
        lastHeartbeatAt: driverSession?.lastHeartbeatAt ?? null,
      }
    }

    if (!resolvedDriverUser && !normalizedDriverName) {
      return res.status(400).json({ error: 'Bitte Fahrer auswaehlen oder Fahrernamen angeben' })
    }

    const now = new Date()
    const nextEstimatedMinutes = normalizedEstimatedMinutes ?? currentOrder.estimatedMinutes ?? null
    const nextEstimatedReadyAt =
      nextEstimatedMinutes && nextEstimatedMinutes > 0
        ? new Date(now.getTime() + nextEstimatedMinutes * 60 * 1000)
        : null

    const updated = await prisma.order.update({
      where: { id: currentOrder.id },
      data: {
        status: 'out_for_delivery',
        assignedDriverId: resolvedDriverUser?.id ?? null,
        assignedDriverName: normalizedDriverName ?? resolvedDriverUser?.name ?? null,
        driverAssignedAt: currentOrder.driverAssignedAt ?? now,
        driverDepartedAt: now,
        acceptedAt: currentOrder.acceptedAt ?? now,
        estimatedMinutes: nextEstimatedMinutes,
        estimatedReadyAt: nextEstimatedReadyAt,
        forwardedToKitchenAt: now,
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
                category: true,
              },
            },
          },
        },
      },
    })

    await writeAuditLog({
      req,
      module: 'orders',
      action: 'order_dispatch_to_driver',
      targetType: 'order',
      targetId: updated.id,
      chainId: currentOrder.tenant?.chainId ?? null,
      tenantId: currentOrder.tenantId,
      metadata: {
        driverUserId: resolvedDriverUser?.id ?? null,
        driverName: normalizedDriverName ?? resolvedDriverUser?.name ?? null,
        estimatedMinutes: nextEstimatedMinutes,
      },
    })

    if (resolvedDriverUser && driverDeviceStatus && !driverDeviceStatus.isOnline) {
      await writeAuditLog({
        req,
        module: 'orders',
        action: 'order_dispatch_driver_offline_warning',
        targetType: 'order',
        targetId: updated.id,
        chainId: currentOrder.tenant?.chainId ?? null,
        tenantId: currentOrder.tenantId,
        metadata: {
          driverUserId: resolvedDriverUser.id,
          driverName: resolvedDriverUser.name,
          hasActiveSession: driverDeviceStatus.hasActiveSession,
          sessionId: driverDeviceStatus.sessionId,
          lastHeartbeatAt: driverDeviceStatus.lastHeartbeatAt,
        },
      })
    }

    return res.json({
      ...updated,
      driverDeviceStatus,
      recoveryHint:
        driverDeviceStatus && !driverDeviceStatus.isOnline
          ? 'Fahrer ist derzeit offline. Bei Bedarf bitte neu zuweisen.'
          : null,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DISPATCH ORDER ERROR:', error)
    return res.status(500).json({ error: 'Fahrerzuweisung konnte nicht gespeichert werden' })
  }
})

router.patch('/:orderId/status', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const orderId = normalizeText(
      Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId
    )
    const { status } = req.body as { status?: string }
    if (!req.authUser) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    if (!orderId || !status) {
      return res.status(400).json({ error: 'orderId oder status fehlt' })
    }

    if (!ORDER_STATUSES.has(status)) {
      return res.status(400).json({ error: 'Ungueltiger Status' })
    }

    const currentOrder = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        tenant: {
          select: {
            chainId: true,
          },
        },
      },
    })

    if (!currentOrder) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    await resolveTenantScope(req, currentOrder.tenantId)

    const order = await prisma.$transaction(async (tx) => {
      if (status === 'done') {
        await tx.orderItem.updateMany({
          where: {
            orderId,
          },
          data: {
            productionStatus: 'DONE',
            productionDoneAt: new Date(),
          },
        })
      } else if (status === 'open') {
        await tx.orderItem.updateMany({
          where: {
            orderId,
          },
          data: {
            productionStatus: 'OPEN',
            productionDoneAt: null,
          },
        })
      }

      await tx.order.update({
        where: { id: currentOrder.id },
        data: {
          status,
          forwardedToKitchenAt:
            status === 'open' ||
            status === 'preparing' ||
            status === 'out_for_delivery' ||
            status === 'done'
              ? new Date()
              : undefined,
          driverDepartedAt: status === 'out_for_delivery' ? new Date() : undefined,
          acceptedAt: status === 'out_for_delivery' ? new Date() : undefined,
        },
      })

      await applyInventoryConsumptionForOrder(tx, currentOrder.id)

      const hydrated = await tx.order.findUnique({
        where: { id: currentOrder.id },
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
                  category: true,
                },
              },
            },
          },
        },
      })

      if (!hydrated) {
        throw new Error('Bestellung nicht gefunden')
      }

      return hydrated
    })

    return res.json(order)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('PATCH ORDER STATUS ERROR:', error)
    return res.status(500).json({ error: 'Fehler beim Aktualisieren des Status' })
  }
})

export default router
