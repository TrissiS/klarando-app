import type { Request } from 'express'
import { type Prisma } from '@prisma/client'
import { writeAuditLog } from './audit'

export type OrderStatusHistorySource =
  | 'ORDERDESK'
  | 'DRIVER_APP'
  | 'ADMIN'
  | 'SYSTEM'
  | 'WEBHOOK'

export type OrderStatusHistoryEvent = {
  id: string
  timestamp: string
  fromStatus: string | null
  toStatus: string
  changedBy: string | null
  actorRole: string | null
  source: OrderStatusHistorySource
  deviceId: string | null
  deviceName: string | null
  driverId: string | null
  driverName: string | null
  durationInPreviousStatusSeconds: number | null
  note: string | null
  reason: string | null
  isFallback: boolean
}

export type OrderStatusDurationSummary = {
  timeToAcceptanceSeconds: number | null
  timeToKitchenSeconds: number | null
  timeToReadySeconds: number | null
  timeToDriverHandoverSeconds: number | null
  deliveryDurationSeconds: number | null
  totalDurationSeconds: number | null
}

export type OrderSignatureDetails = {
  captured: boolean
  signerName: string | null
  capturedAt: string | null
  imageDataUrl: string | null
  imageAvailable: boolean
  imageError: string | null
  source: OrderStatusHistorySource | null
  deviceId: string | null
  deviceName: string | null
  driverId: string | null
  driverName: string | null
  location: {
    latitude: number | null
    longitude: number | null
  } | null
}

export type OrderStatusHistoryOrderSnapshot = {
  id: string
  createdAt: Date | string
  status: string
  acceptedAt?: Date | string | null
  estimatedReadyAt?: Date | string | null
  driverAssignedAt?: Date | string | null
  driverDepartedAt?: Date | string | null
  forwardedToKitchenAt?: Date | string | null
  paidAt?: Date | string | null
}

type AuditRow = {
  id: string
  module: string
  action: string
  actorEmail: string | null
  actorRole: string | null
  metadata: Prisma.JsonValue | null
  createdAt: Date
}

function toIsoString(value: Date | string | null | undefined) {
  if (!value) {
    return null
  }
  const parsed = value instanceof Date ? value : new Date(value)
  return Number.isNaN(parsed.getTime()) ? null : parsed.toISOString()
}

function secondsBetween(start: string | null, end: string | null) {
  if (!start || !end) {
    return null
  }
  const startMs = new Date(start).getTime()
  const endMs = new Date(end).getTime()
  if (!Number.isFinite(startMs) || !Number.isFinite(endMs) || endMs < startMs) {
    return null
  }
  return Math.round((endMs - startMs) / 1000)
}

function normalizeText(value: unknown) {
  return typeof value === 'string' && value.trim().length > 0 ? value.trim() : null
}

function normalizeStatus(value: unknown) {
  const normalized = normalizeText(value)
  return normalized ? normalized.toLowerCase() : null
}

function readMetadataObject(value: Prisma.JsonValue | null | undefined) {
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    return null
  }
  return value as Record<string, unknown>
}

function inferSource(moduleName: string, metadata: Record<string, unknown> | null): OrderStatusHistorySource {
  const rawSource = normalizeText(metadata?.source)
  if (rawSource) {
    const normalized = rawSource.trim().toUpperCase()
    if (
      normalized === 'ORDERDESK' ||
      normalized === 'DRIVER_APP' ||
      normalized === 'ADMIN' ||
      normalized === 'SYSTEM' ||
      normalized === 'WEBHOOK'
    ) {
      return normalized
    }
  }

  if (moduleName === 'order_display') {
    return 'ORDERDESK'
  }
  if (moduleName.startsWith('driver_')) {
    return 'DRIVER_APP'
  }
  if (moduleName === 'orders') {
    return 'ADMIN'
  }
  return 'SYSTEM'
}

function inferChangedBy(
  row: AuditRow,
  metadata: Record<string, unknown> | null,
  source: OrderStatusHistorySource
) {
  return (
    normalizeText(metadata?.actorName) ||
    normalizeText(metadata?.capturedByName) ||
    normalizeText(metadata?.driverName) ||
    normalizeText(metadata?.deviceName) ||
    normalizeText(metadata?.displayName) ||
    normalizeText(row.actorEmail) ||
    (source === 'SYSTEM' ? 'System' : null)
  )
}

function parseStatusEventRow(row: AuditRow): Omit<OrderStatusHistoryEvent, 'durationInPreviousStatusSeconds'> | null {
  const metadata = readMetadataObject(row.metadata)

  let fromStatus = normalizeStatus(metadata?.previousStatus ?? metadata?.oldStatus)
  let toStatus = normalizeStatus(metadata?.nextStatus ?? metadata?.newStatus)
  let note = normalizeText(metadata?.note)
  const reason = normalizeText(metadata?.reason)

  if (row.module === 'order_status' && row.action === 'changed') {
    if (!toStatus) {
      return null
    }
  } else if (row.module === 'order_display' && row.action === 'order_accepted_with_eta') {
    toStatus = toStatus ?? 'open'
    note = note ?? 'Bestellung am OrderDesk angenommen'
  } else if (
    (row.module === 'orders' && row.action === 'order_dispatch_to_driver') ||
    (row.module === 'order_display' && row.action === 'order_dispatched_to_driver') ||
    (row.module === 'driver_tracking' && row.action === 'route_started')
  ) {
    toStatus = toStatus ?? 'out_for_delivery'
    note = note ?? 'Fahrer-Route gestartet'
  } else if (row.module === 'driver_delivery' && row.action === 'completed') {
    toStatus = toStatus ?? 'done'
    note = note ?? 'Lieferung abgeschlossen'
  } else {
    return null
  }

  const source = inferSource(row.module, metadata)
  return {
    id: row.id,
    timestamp: row.createdAt.toISOString(),
    fromStatus,
    toStatus,
    changedBy: inferChangedBy(row, metadata, source),
    actorRole: row.actorRole,
    source,
    deviceId:
      normalizeText(metadata?.deviceId) ||
      normalizeText(metadata?.deviceSessionId) ||
      normalizeText(metadata?.driverDeviceId) ||
      normalizeText(metadata?.displayId),
    deviceName:
      normalizeText(metadata?.deviceName) ||
      normalizeText(metadata?.displayName) ||
      normalizeText(metadata?.displayCode) ||
      normalizeText(metadata?.displayRole),
    driverId: normalizeText(metadata?.driverId) || normalizeText(metadata?.driverUserId),
    driverName: normalizeText(metadata?.driverName),
    note,
    reason,
    isFallback: false,
  }
}

function buildFallbackTimeline(order: OrderStatusHistoryOrderSnapshot) {
  const createdAt = toIsoString(order.createdAt)
  const acceptedAt = toIsoString(order.acceptedAt)
  const kitchenAt = toIsoString(order.forwardedToKitchenAt)
  const readyAt = toIsoString(order.estimatedReadyAt)
  const driverAssignedAt = toIsoString(order.driverAssignedAt)
  const driverDepartedAt = toIsoString(order.driverDepartedAt)

  const initialStatus = normalizeStatus(order.status) || 'open'
  const events: Omit<OrderStatusHistoryEvent, 'durationInPreviousStatusSeconds'>[] = []

  if (createdAt) {
    events.push({
      id: `fallback-created-${order.id}`,
      timestamp: createdAt,
      fromStatus: null,
      toStatus: 'pending_payment',
      changedBy: 'System',
      actorRole: null,
      source: 'SYSTEM',
      deviceId: null,
      deviceName: null,
      driverId: null,
      driverName: null,
      note: 'Bestellung eingegangen',
      reason: null,
      isFallback: true,
    })
  }

  if (acceptedAt) {
    events.push({
      id: `fallback-accepted-${order.id}`,
      timestamp: acceptedAt,
      fromStatus: 'pending_payment',
      toStatus: 'open',
      changedBy: 'System',
      actorRole: null,
      source: 'SYSTEM',
      deviceId: null,
      deviceName: null,
      driverId: null,
      driverName: null,
      note: 'Annahme aus vorhandenem Timestamp abgeleitet',
      reason: null,
      isFallback: true,
    })
  }

  if (kitchenAt) {
    events.push({
      id: `fallback-kitchen-${order.id}`,
      timestamp: kitchenAt,
      fromStatus: acceptedAt ? 'open' : 'pending_payment',
      toStatus: 'preparing',
      changedBy: 'System',
      actorRole: null,
      source: 'SYSTEM',
      deviceId: null,
      deviceName: null,
      driverId: null,
      driverName: null,
      note: 'Kuechenstart aus vorhandenem Timestamp abgeleitet',
      reason: null,
      isFallback: true,
    })
  }

  if (driverAssignedAt) {
    events.push({
      id: `fallback-driver-assigned-${order.id}`,
      timestamp: driverAssignedAt,
      fromStatus: kitchenAt ? 'preparing' : acceptedAt ? 'open' : 'pending_payment',
      toStatus: 'preparing',
      changedBy: 'System',
      actorRole: null,
      source: 'SYSTEM',
      deviceId: null,
      deviceName: null,
      driverId: null,
      driverName: null,
      note: 'Fahrerzuweisung aus vorhandenem Timestamp abgeleitet',
      reason: null,
      isFallback: true,
    })
  }

  if (driverDepartedAt) {
    events.push({
      id: `fallback-driver-departed-${order.id}`,
      timestamp: driverDepartedAt,
      fromStatus: 'preparing',
      toStatus: 'out_for_delivery',
      changedBy: 'System',
      actorRole: null,
      source: 'SYSTEM',
      deviceId: null,
      deviceName: null,
      driverId: null,
      driverName: null,
      note: 'Fahrerabfahrt aus vorhandenem Timestamp abgeleitet',
      reason: null,
      isFallback: true,
    })
  }

  if (initialStatus === 'done' && readyAt) {
    events.push({
      id: `fallback-completed-${order.id}`,
      timestamp: readyAt,
      fromStatus: driverDepartedAt ? 'out_for_delivery' : kitchenAt ? 'preparing' : acceptedAt ? 'open' : 'pending_payment',
      toStatus: 'done',
      changedBy: 'System',
      actorRole: null,
      source: 'SYSTEM',
      deviceId: null,
      deviceName: null,
      driverId: null,
      driverName: null,
      note: 'Abschluss aus vorhandenem Timestamp abgeleitet',
      reason: null,
      isFallback: true,
    })
  } else if (initialStatus === 'preparing' && readyAt) {
    events.push({
      id: `fallback-ready-${order.id}`,
      timestamp: readyAt,
      fromStatus: kitchenAt ? 'preparing' : acceptedAt ? 'open' : 'pending_payment',
      toStatus: 'preparing',
      changedBy: 'System',
      actorRole: null,
      source: 'SYSTEM',
      deviceId: null,
      deviceName: null,
      driverId: null,
      driverName: null,
      note: 'Bereit-Zeit aus ETA-Timestamp abgeleitet',
      reason: null,
      isFallback: true,
    })
  }

  return events
}

function applyDurations(
  events: Omit<OrderStatusHistoryEvent, 'durationInPreviousStatusSeconds'>[]
): OrderStatusHistoryEvent[] {
  const sorted = [...events].sort((left, right) => left.timestamp.localeCompare(right.timestamp))
  return sorted.map((event, index) => {
    const previous = sorted[index - 1]
    return {
      ...event,
      durationInPreviousStatusSeconds: previous
        ? secondsBetween(previous.timestamp, event.timestamp)
        : null,
    }
  })
}

function buildStatusDurationSummary(
  order: OrderStatusHistoryOrderSnapshot,
  timeline: OrderStatusHistoryEvent[]
): OrderStatusDurationSummary {
  const createdAt = toIsoString(order.createdAt)
  const acceptedAt = toIsoString(order.acceptedAt)
  const kitchenAt =
    timeline.find((event) => event.toStatus === 'preparing')?.timestamp ??
    toIsoString(order.forwardedToKitchenAt)
  const readyAt = toIsoString(order.estimatedReadyAt)
  const handoffAt =
    timeline.find((event) => event.toStatus === 'out_for_delivery')?.timestamp ??
    toIsoString(order.driverDepartedAt) ??
    toIsoString(order.driverAssignedAt)
  const completedAt =
    timeline.find((event) => event.toStatus === 'done' || event.toStatus === 'archived')?.timestamp ??
    (normalizeStatus(order.status) === 'done' ? readyAt : null)

  return {
    timeToAcceptanceSeconds: secondsBetween(createdAt, acceptedAt),
    timeToKitchenSeconds: secondsBetween(createdAt, kitchenAt),
    timeToReadySeconds: secondsBetween(createdAt, readyAt),
    timeToDriverHandoverSeconds: secondsBetween(createdAt, handoffAt),
    deliveryDurationSeconds: secondsBetween(handoffAt, completedAt),
    totalDurationSeconds: secondsBetween(createdAt, completedAt),
  }
}

function buildSignatureDetails(rows: AuditRow[]): OrderSignatureDetails {
  const signatureRow = [...rows]
    .reverse()
    .find((row) => row.module === 'order_signature' && row.action === 'captured')

  if (!signatureRow) {
    return {
      captured: false,
      signerName: null,
      capturedAt: null,
      imageDataUrl: null,
      imageAvailable: false,
      imageError: null,
      source: null,
      deviceId: null,
      deviceName: null,
      driverId: null,
      driverName: null,
      location: null,
    }
  }

  const metadata = readMetadataObject(signatureRow.metadata)
  const imageDataUrl = normalizeText(metadata?.signatureImageDataUrl)
  const source = inferSource(signatureRow.module, metadata)
  return {
    captured: true,
    signerName: normalizeText(metadata?.signerName),
    capturedAt: signatureRow.createdAt.toISOString(),
    imageDataUrl,
    imageAvailable: Boolean(imageDataUrl),
    imageError: imageDataUrl ? null : 'Signaturdaten vorhanden, Bild konnte aber nicht geladen werden.',
    source,
    deviceId: normalizeText(metadata?.deviceSessionId),
    deviceName: normalizeText(metadata?.displayCode) || normalizeText(metadata?.deviceLabel),
    driverId: normalizeText(metadata?.driverUserId),
    driverName:
      normalizeText(metadata?.capturedByName) ||
      normalizeText(metadata?.driverName),
    location: null,
  }
}

export function buildOrderStatusHistory(input: {
  order: OrderStatusHistoryOrderSnapshot
  auditRows: AuditRow[]
}) {
  const statusEvents = input.auditRows
    .map((row) => parseStatusEventRow(row))
    .filter((entry): entry is Omit<OrderStatusHistoryEvent, 'durationInPreviousStatusSeconds'> => Boolean(entry))

  const combinedEvents = statusEvents.length > 0 ? statusEvents : buildFallbackTimeline(input.order)
  const timeline = applyDurations(combinedEvents)
  const signature = buildSignatureDetails(input.auditRows)
  const summary = buildStatusDurationSummary(input.order, timeline)

  return {
    timeline,
    summary,
    signature,
  }
}

export async function writeOrderStatusAuditEvent(input: {
  req: Request
  module: string
  action?: string
  orderId: string
  tenantId: string
  chainId?: string | null
  previousStatus: string | null
  nextStatus: string
  source: OrderStatusHistorySource
  actorName?: string | null
  deviceId?: string | null
  deviceName?: string | null
  driverId?: string | null
  driverName?: string | null
  note?: string | null
  reason?: string | null
}) {
  await writeAuditLog({
    req: input.req,
    module: input.module,
    action: input.action ?? 'changed',
    targetType: 'order',
    targetId: input.orderId,
    tenantId: input.tenantId,
    chainId: input.chainId ?? null,
    metadata: {
      previousStatus: input.previousStatus,
      nextStatus: input.nextStatus,
      source: input.source,
      actorName: input.actorName ?? null,
      deviceId: input.deviceId ?? null,
      deviceName: input.deviceName ?? null,
      driverId: input.driverId ?? null,
      driverName: input.driverName ?? null,
      note: input.note ?? null,
      reason: input.reason ?? null,
    },
  })
}
