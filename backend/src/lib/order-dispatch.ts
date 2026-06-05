import {
  OrderTransitionError,
  type OrderWorkflowStatus,
  buildOrderDispatchUpdate,
  normalizeOrderWorkflowStatus,
} from './order-status-transitions'
import { resolveDriverAssignmentIdentity } from './driver-assignment'

export type DispatchableOrder = {
  id: string
  serviceType: string | null | undefined
  status: string
  assignedDriverId?: string | null
  assignedDriverName?: string | null
  driverAssignedAt?: Date | null
  acceptedAt?: Date | null
  estimatedMinutes?: number | null
  pickupNumber?: number | null
}

type DriverAssignmentInput = {
  driverUserId?: string | null
  driverName?: string | null
}

function normalizeOptionalText(value: unknown) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

export function hasDriverAssignment(order: Pick<DispatchableOrder, 'assignedDriverId' | 'assignedDriverName'>) {
  return Boolean(normalizeOptionalText(order.assignedDriverId) || normalizeOptionalText(order.assignedDriverName))
}

export function validateDispatchReadiness(
  order: Pick<DispatchableOrder, 'serviceType' | 'status' | 'assignedDriverId' | 'assignedDriverName'>,
  options?: {
    requireAssignedDriver?: boolean
    allowNonDelivery?: boolean
    context?: string
  }
) {
  const normalizedStatus = normalizeOrderWorkflowStatus(order.status)
  if (!normalizedStatus) {
    throw new OrderTransitionError(409, `Ungueltiger bestehender Bestellstatus: ${String(order.status)}`)
  }

  if (!options?.allowNonDelivery && String(order.serviceType || '').toUpperCase() !== 'DELIVERY') {
    throw new OrderTransitionError(409, 'Dispatch ist nur fuer Lieferbestellungen erlaubt')
  }

  if (normalizedStatus === 'archived') {
    throw new OrderTransitionError(409, 'Archivierte Bestellungen koennen nicht disponiert werden')
  }

  if (options?.requireAssignedDriver && !hasDriverAssignment(order)) {
    const suffix = options?.context ? ` (${options.context})` : ''
    throw new OrderTransitionError(409, `Dispatch/Fahrerstatus ohne Fahrerzuweisung ist nicht erlaubt${suffix}`)
  }

  return {
    currentStatus: normalizedStatus,
  }
}

export function assignDriverToOrder(
  order: Pick<DispatchableOrder, 'serviceType' | 'status' | 'assignedDriverId' | 'assignedDriverName' | 'driverAssignedAt'>,
  input: DriverAssignmentInput & { now?: Date }
) {
  const now = input.now ?? new Date()
  validateDispatchReadiness(order, { requireAssignedDriver: false, context: 'assign' })

  const { assignedDriverId, assignedDriverName } = resolveDriverAssignmentIdentity({
    driverUserId: input.driverUserId,
    driverName: input.driverName,
  })
  if (!assignedDriverId && !assignedDriverName) {
    throw new OrderTransitionError(409, 'Fahrerzuweisung erfordert Fahrer-ID oder Fahrernamen')
  }

  return {
    assignedDriverId: assignedDriverId ?? null,
    assignedDriverName: assignedDriverName ?? null,
    driverAssignedAt: order.driverAssignedAt ?? now,
  }
}

export function dispatchOrder(
  order: Pick<
    DispatchableOrder,
    | 'serviceType'
    | 'status'
    | 'assignedDriverId'
    | 'assignedDriverName'
    | 'driverAssignedAt'
    | 'acceptedAt'
    | 'estimatedMinutes'
    | 'pickupNumber'
  >,
  input: DriverAssignmentInput & {
    estimatedMinutes: number
    pickupNumber?: number | null
    now?: Date
  }
) {
  const now = input.now ?? new Date()
  const assignment = assignDriverToOrder(order, {
    driverUserId: input.driverUserId,
    driverName: input.driverName,
    now,
  })
  const { currentStatus } = validateDispatchReadiness(
    {
      ...order,
      assignedDriverId: assignment.assignedDriverId,
      assignedDriverName: assignment.assignedDriverName,
    },
    { requireAssignedDriver: true, context: 'dispatch' }
  )

  return buildOrderDispatchUpdate({
    currentStatus,
    currentAcceptedAt: order.acceptedAt ?? null,
    currentDriverAssignedAt: assignment.driverAssignedAt,
    estimatedMinutes: input.estimatedMinutes,
    pickupNumber: input.pickupNumber ?? undefined,
    assignedDriverId: assignment.assignedDriverId,
    assignedDriverName: assignment.assignedDriverName,
    now,
  })
}

export function startDriverRoute(
  order: Pick<
    DispatchableOrder,
    | 'serviceType'
    | 'status'
    | 'assignedDriverId'
    | 'assignedDriverName'
    | 'driverAssignedAt'
    | 'acceptedAt'
    | 'estimatedMinutes'
    | 'pickupNumber'
  >,
  input: {
    estimatedMinutes: number
    now?: Date
  }
) {
  const now = input.now ?? new Date()
  const { currentStatus } = validateDispatchReadiness(order, {
    requireAssignedDriver: true,
    context: 'route-start',
  })

  return buildOrderDispatchUpdate({
    currentStatus,
    currentAcceptedAt: order.acceptedAt ?? null,
    currentDriverAssignedAt: order.driverAssignedAt ?? null,
    estimatedMinutes: input.estimatedMinutes,
    pickupNumber: order.pickupNumber ?? undefined,
    assignedDriverId: order.assignedDriverId ?? null,
    assignedDriverName: order.assignedDriverName ?? null,
    now,
  })
}

export function clearDriverAssignment(
  order: Pick<DispatchableOrder, 'status'>
) {
  const normalizedStatus: OrderWorkflowStatus | null = normalizeOrderWorkflowStatus(order.status)
  if (!normalizedStatus) {
    throw new OrderTransitionError(409, `Ungueltiger bestehender Bestellstatus: ${String(order.status)}`)
  }
  if (normalizedStatus === 'out_for_delivery') {
    throw new OrderTransitionError(
      409,
      'Fahrerzuweisung kann waehrend "Fahrer unterwegs" nicht ohne gesonderten Rueckfuehrungsprozess entfernt werden'
    )
  }

  return {
    assignedDriverId: null,
    assignedDriverName: null,
    driverAssignedAt: null,
  }
}
