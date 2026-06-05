export const ORDER_WORKFLOW_STATUSES = [
  'pending_payment',
  'open',
  'preparing',
  'out_for_delivery',
  'done',
  'archived',
] as const

export const ORDER_ITEM_PRODUCTION_STATUSES = ['OPEN', 'DONE'] as const

export const ORDER_PAYMENT_STATUSES = ['UNPAID', 'PAID', 'FAILED', 'REFUNDED'] as const

export type OrderWorkflowStatus = (typeof ORDER_WORKFLOW_STATUSES)[number]
export type OrderItemProductionStatus = (typeof ORDER_ITEM_PRODUCTION_STATUSES)[number]
export type OrderPaymentStatus = (typeof ORDER_PAYMENT_STATUSES)[number]

export class OrderTransitionError extends Error {
  statusCode: number

  constructor(statusCode: number, message: string) {
    super(message)
    this.name = 'OrderTransitionError'
    this.statusCode = statusCode
  }
}

const ORDER_WORKFLOW_TRANSITIONS: Record<OrderWorkflowStatus, readonly OrderWorkflowStatus[]> = {
  pending_payment: ['open', 'preparing', 'out_for_delivery', 'done', 'archived'],
  open: ['pending_payment', 'preparing', 'out_for_delivery', 'done', 'archived'],
  preparing: ['open', 'done', 'out_for_delivery', 'archived'],
  out_for_delivery: ['preparing', 'done', 'archived'],
  done: ['archived'],
  archived: [],
}

const ORDER_PAYMENT_TRANSITIONS: Record<OrderPaymentStatus, readonly OrderPaymentStatus[]> = {
  UNPAID: ['PAID', 'FAILED'],
  PAID: ['REFUNDED'],
  FAILED: ['PAID'],
  REFUNDED: [],
}

const ORDER_ITEM_TRANSITIONS: Record<OrderItemProductionStatus, readonly OrderItemProductionStatus[]> = {
  OPEN: ['DONE'],
  DONE: ['OPEN'],
}

function includesValue<T extends string>(values: readonly T[], candidate: string): candidate is T {
  return values.includes(candidate as T)
}

export function normalizeOrderWorkflowStatus(value: unknown): OrderWorkflowStatus | null {
  if (typeof value !== 'string') return null
  const normalized = value.trim().toLowerCase()
  return includesValue(ORDER_WORKFLOW_STATUSES, normalized) ? normalized : null
}

export function normalizeOrderItemProductionStatus(value: unknown): OrderItemProductionStatus | null {
  if (typeof value !== 'string') return null
  const normalized = value.trim().toUpperCase()
  return includesValue(ORDER_ITEM_PRODUCTION_STATUSES, normalized) ? normalized : null
}

export function normalizeOrderPaymentStatus(value: unknown): OrderPaymentStatus | null {
  if (typeof value !== 'string') return null
  const normalized = value.trim().toUpperCase()
  return includesValue(ORDER_PAYMENT_STATUSES, normalized) ? normalized : null
}

export function assertOrderWorkflowTransition(
  currentStatus: OrderWorkflowStatus,
  nextStatus: OrderWorkflowStatus
) {
  if (currentStatus === nextStatus) {
    return
  }
  if (!ORDER_WORKFLOW_TRANSITIONS[currentStatus].includes(nextStatus)) {
    throw new OrderTransitionError(
      409,
      `Ungueltiger Bestellstatus-Wechsel: ${currentStatus} -> ${nextStatus}`
    )
  }
}

export function assertOrderPaymentTransition(
  currentStatus: OrderPaymentStatus,
  nextStatus: OrderPaymentStatus
) {
  if (currentStatus === nextStatus) {
    return
  }
  if (!ORDER_PAYMENT_TRANSITIONS[currentStatus].includes(nextStatus)) {
    throw new OrderTransitionError(
      409,
      `Ungueltiger Zahlungsstatus-Wechsel: ${currentStatus} -> ${nextStatus}`
    )
  }
}

export function assertOrderItemTransition(
  currentStatus: OrderItemProductionStatus,
  nextStatus: OrderItemProductionStatus
) {
  if (currentStatus === nextStatus) {
    return
  }
  if (!ORDER_ITEM_TRANSITIONS[currentStatus].includes(nextStatus)) {
    throw new OrderTransitionError(
      409,
      `Ungueltiger Item-Status-Wechsel: ${currentStatus} -> ${nextStatus}`
    )
  }
}

export function deriveOrderStatusFromItemStatuses(
  statuses: OrderItemProductionStatus[]
): Extract<OrderWorkflowStatus, 'open' | 'preparing' | 'done'> {
  if (statuses.length === 0) {
    return 'open'
  }
  const allDone = statuses.every((entry) => entry === 'DONE')
  if (allDone) {
    return 'done'
  }
  const anyDone = statuses.some((entry) => entry === 'DONE')
  return anyDone ? 'preparing' : 'open'
}

export function buildOrderStatusUpdate(params: {
  currentStatus: OrderWorkflowStatus
  nextStatus: OrderWorkflowStatus
  now?: Date
  currentAcceptedAt?: Date | null
}) {
  const now = params.now ?? new Date()
  assertOrderWorkflowTransition(params.currentStatus, params.nextStatus)

  return {
    status: params.nextStatus,
    forwardedToKitchenAt:
      params.nextStatus === 'open' ||
      params.nextStatus === 'preparing' ||
      params.nextStatus === 'out_for_delivery' ||
      params.nextStatus === 'done'
        ? now
        : undefined,
    driverDepartedAt: params.nextStatus === 'out_for_delivery' ? now : undefined,
    acceptedAt:
      params.nextStatus === 'out_for_delivery' ? params.currentAcceptedAt ?? now : undefined,
  }
}

export function buildOrderItemStatusUpdate(params: {
  currentStatus: OrderItemProductionStatus
  nextStatus: OrderItemProductionStatus
  now?: Date
}) {
  const now = params.now ?? new Date()
  assertOrderItemTransition(params.currentStatus, params.nextStatus)

  return {
    productionStatus: params.nextStatus,
    productionDoneAt: params.nextStatus === 'DONE' ? now : null,
  }
}

export function buildOrderPaymentStatusUpdate(params: {
  currentStatus: OrderPaymentStatus
  nextStatus: OrderPaymentStatus
  now?: Date
  preservePaidAt?: Date | null
}) {
  const now = params.now ?? new Date()
  assertOrderPaymentTransition(params.currentStatus, params.nextStatus)

  return {
    paymentStatus: params.nextStatus,
    paidAt:
      params.nextStatus === 'PAID'
        ? params.preservePaidAt ?? now
        : params.nextStatus === 'UNPAID' || params.nextStatus === 'FAILED'
          ? null
          : params.preservePaidAt ?? null,
  }
}

export function buildOrderAcceptanceUpdate(params: {
  currentStatus: OrderWorkflowStatus
  currentAcceptedAt?: Date | null
  estimatedMinutes: number
  pickupNumber: number
  now?: Date
}) {
  const now = params.now ?? new Date()
  const nextStatus = params.currentStatus === 'pending_payment' ? 'open' : params.currentStatus
  const base = buildOrderStatusUpdate({
    currentStatus: params.currentStatus,
    nextStatus,
    now,
    currentAcceptedAt: params.currentAcceptedAt ?? null,
  })

  return {
    ...base,
    acceptedAt: params.currentAcceptedAt ?? now,
    estimatedMinutes: Math.round(params.estimatedMinutes),
    estimatedReadyAt: new Date(now.getTime() + Math.round(params.estimatedMinutes) * 60 * 1000),
    pickupNumber: params.pickupNumber,
    forwardedToKitchenAt: now,
  }
}

export function buildOrderDispatchUpdate(params: {
  currentStatus: OrderWorkflowStatus
  currentAcceptedAt?: Date | null
  currentDriverAssignedAt?: Date | null
  estimatedMinutes: number
  pickupNumber?: number | null
  assignedDriverId?: string | null
  assignedDriverName?: string | null
  now?: Date
}) {
  const now = params.now ?? new Date()
  const base = buildOrderStatusUpdate({
    currentStatus: params.currentStatus,
    nextStatus: 'out_for_delivery',
    now,
    currentAcceptedAt: params.currentAcceptedAt ?? null,
  })

  return {
    ...base,
    status: 'out_for_delivery' as const,
    assignedDriverId: params.assignedDriverId ?? null,
    assignedDriverName: params.assignedDriverName ?? null,
    driverAssignedAt: params.currentDriverAssignedAt ?? now,
    driverDepartedAt: now,
    acceptedAt: params.currentAcceptedAt ?? now,
    estimatedMinutes: Math.round(params.estimatedMinutes),
    estimatedReadyAt: new Date(now.getTime() + Math.round(params.estimatedMinutes) * 60 * 1000),
    pickupNumber: params.pickupNumber ?? undefined,
    forwardedToKitchenAt: now,
  }
}

export function asOrderTransitionError(error: unknown) {
  return error instanceof OrderTransitionError ? error : null
}
