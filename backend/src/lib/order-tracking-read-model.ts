export type OrderTrackingTimelineEntry = {
  key:
    | 'received'
    | 'accepted'
    | 'processing'
    | 'preparing'
    | 'driver_assigned'
    | 'out_for_delivery'
    | 'delivered'
    | 'completed'
    | 'cancelled'
  label: string
  at: string | null
  completed: boolean
  current: boolean
}

export type OrderTrackingReadModel = {
  orderId: string
  publicTrackingCode: string | null
  orderStatus: string
  paymentStatus: string
  productionStatus: 'PENDING' | 'IN_PROGRESS' | 'DONE' | 'UNKNOWN'
  deliveryType: string | null
  assignedDriverId: string | null
  assignedDriverName: string | null
  acceptedAt: string | null
  estimatedReadyAt: string | null
  driverAssignedAt: string | null
  driverDepartedAt: string | null
  deliveredAt: string | null
  completedAt: string | null
  canceledAt: string | null
  customerVisibleStatus: string
  customerVisibleLabel: string
  timeline: OrderTrackingTimelineEntry[]
}

type TrackingOrderItem = {
  productionStatus?: string | null
}

type TrackingOrderInput = {
  id: string
  publicOrderCode?: string | null
  status?: string | null
  paymentStatus?: string | null
  serviceType?: string | null
  assignedDriverId?: string | null
  assignedDriverName?: string | null
  acceptedAt?: Date | string | null
  estimatedReadyAt?: Date | string | null
  driverAssignedAt?: Date | string | null
  driverDepartedAt?: Date | string | null
  forwardedToKitchenAt?: Date | string | null
  createdAt?: Date | string | null
  items?: TrackingOrderItem[] | null
}

function toIsoString(value: Date | string | null | undefined) {
  if (!value) return null
  if (value instanceof Date) return value.toISOString()
  const parsed = new Date(value)
  return Number.isNaN(parsed.getTime()) ? null : parsed.toISOString()
}

function normalizeStatus(value: string | null | undefined) {
  return typeof value === 'string' ? value.trim().toLowerCase() : ''
}

function normalizeItemStatus(value: string | null | undefined) {
  return typeof value === 'string' ? value.trim().toUpperCase() : ''
}

function deriveProductionStatus(order: TrackingOrderInput): OrderTrackingReadModel['productionStatus'] {
  const itemStatuses = (order.items ?? [])
    .map((entry) => normalizeItemStatus(entry.productionStatus ?? null))
    .filter((entry) => entry.length > 0)

  if (itemStatuses.length > 0) {
    const allDone = itemStatuses.every((entry) => entry === 'DONE')
    if (allDone) {
      return 'DONE'
    }
    const anyDone = itemStatuses.some((entry) => entry === 'DONE')
    return anyDone ? 'IN_PROGRESS' : 'PENDING'
  }

  const status = normalizeStatus(order.status)
  if (status === 'done') return 'DONE'
  if (status === 'preparing' || status === 'out_for_delivery') return 'IN_PROGRESS'
  if (status === 'pending_payment' || status === 'open') return 'PENDING'
  return 'UNKNOWN'
}

function deriveArchivedCompletionKind(order: TrackingOrderInput) {
  const status = normalizeStatus(order.status)
  if (status !== 'archived') {
    return null
  }

  if (order.driverDepartedAt) {
    return 'delivered'
  }
  if (order.acceptedAt || order.forwardedToKitchenAt || order.estimatedReadyAt) {
    return 'completed'
  }
  return 'cancelled'
}

function deriveCustomerVisibleState(order: TrackingOrderInput): Pick<OrderTrackingReadModel, 'customerVisibleStatus' | 'customerVisibleLabel'> {
  const status = normalizeStatus(order.status)
  const serviceType = normalizeStatus(order.serviceType)
  const archivedKind = deriveArchivedCompletionKind(order)

  if (status === 'pending_payment') {
    return {
      customerVisibleStatus: 'pending_payment',
      customerVisibleLabel: 'Zahlung ausstehend',
    }
  }
  if (status === 'open') {
    return {
      customerVisibleStatus: 'accepted',
      customerVisibleLabel: 'Bestellung angenommen',
    }
  }
  if (status === 'preparing') {
    return {
      customerVisibleStatus: 'preparing',
      customerVisibleLabel: 'In Zubereitung',
    }
  }
  if (status === 'out_for_delivery') {
    return {
      customerVisibleStatus: serviceType === 'delivery' ? 'out_for_delivery' : 'ready',
      customerVisibleLabel: serviceType === 'delivery' ? 'Fahrer unterwegs' : 'Bereit',
    }
  }
  if (status === 'done') {
    if (serviceType === 'delivery') {
      return {
        customerVisibleStatus: 'delivered',
        customerVisibleLabel: 'Geliefert',
      }
    }
    if (serviceType === 'pickup') {
      return {
        customerVisibleStatus: 'ready_for_pickup',
        customerVisibleLabel: 'Abholbereit',
      }
    }
    return {
      customerVisibleStatus: 'completed',
      customerVisibleLabel: 'Abgeschlossen',
    }
  }
  if (status === 'archived') {
    if (archivedKind === 'delivered') {
      return {
        customerVisibleStatus: 'delivered',
        customerVisibleLabel: 'Geliefert',
      }
    }
    if (archivedKind === 'completed') {
      return {
        customerVisibleStatus: 'completed',
        customerVisibleLabel: 'Abgeschlossen',
      }
    }
    return {
      customerVisibleStatus: 'cancelled',
      customerVisibleLabel: 'Storniert',
    }
  }

  return {
    customerVisibleStatus: status || 'unknown',
    customerVisibleLabel: 'Status unbekannt',
  }
}

function createTimelineEntry(
  key: OrderTrackingTimelineEntry['key'],
  label: string,
  at: string | null,
  completed: boolean,
  current: boolean
): OrderTrackingTimelineEntry {
  return { key, label, at, completed, current }
}

export function buildOrderTrackingReadModel(order: TrackingOrderInput): OrderTrackingReadModel {
  const status = normalizeStatus(order.status)
  const serviceType = normalizeStatus(order.serviceType)
  const createdAt = toIsoString(order.createdAt)
  const acceptedAt = toIsoString(order.acceptedAt)
  const estimatedReadyAt = toIsoString(order.estimatedReadyAt)
  const driverAssignedAt = toIsoString(order.driverAssignedAt)
  const driverDepartedAt = toIsoString(order.driverDepartedAt)
  const forwardedToKitchenAt = toIsoString(order.forwardedToKitchenAt)
  const archivedKind = deriveArchivedCompletionKind(order)
  const productionStatus = deriveProductionStatus(order)
  const customerVisible = deriveCustomerVisibleState(order)

  const deliveredAt =
    serviceType === 'delivery' && (status === 'done' || archivedKind === 'delivered')
      ? driverDepartedAt
      : null
  const completedAt =
    status === 'done' && serviceType !== 'delivery'
      ? estimatedReadyAt ?? acceptedAt ?? forwardedToKitchenAt
      : status === 'archived' && archivedKind === 'completed'
        ? estimatedReadyAt ?? acceptedAt ?? forwardedToKitchenAt
        : null
  const canceledAt = status === 'archived' && archivedKind === 'cancelled' ? createdAt : null

  const timeline: OrderTrackingTimelineEntry[] = [
    createTimelineEntry('received', 'Bestellung eingegangen', createdAt, true, status === 'pending_payment'),
    createTimelineEntry(
      'accepted',
      'Bestellung angenommen',
      acceptedAt,
      Boolean(acceptedAt) || ['open', 'preparing', 'out_for_delivery', 'done', 'archived'].includes(status),
      status === 'open'
    ),
    createTimelineEntry(
      'processing',
      'In Bearbeitung',
      forwardedToKitchenAt ?? acceptedAt,
      ['open', 'preparing', 'out_for_delivery', 'done', 'archived'].includes(status),
      status === 'open'
    ),
    createTimelineEntry(
      'preparing',
      'In Zubereitung',
      forwardedToKitchenAt ?? acceptedAt,
      productionStatus === 'IN_PROGRESS' || productionStatus === 'DONE' || ['preparing', 'out_for_delivery', 'done', 'archived'].includes(status),
      status === 'preparing'
    ),
    createTimelineEntry(
      'driver_assigned',
      'Fahrer zugewiesen',
      driverAssignedAt,
      Boolean(order.assignedDriverId || order.assignedDriverName || driverAssignedAt),
      serviceType === 'delivery' && !driverDepartedAt && Boolean(order.assignedDriverId || order.assignedDriverName) && status !== 'preparing'
    ),
    createTimelineEntry(
      'out_for_delivery',
      'Unterwegs',
      driverDepartedAt,
      Boolean(driverDepartedAt) || status === 'out_for_delivery' || status === 'done' || archivedKind === 'delivered',
      status === 'out_for_delivery'
    ),
    createTimelineEntry(
      'delivered',
      'Geliefert',
      deliveredAt,
      Boolean(deliveredAt),
      status === 'done' && serviceType === 'delivery'
    ),
    createTimelineEntry(
      'completed',
      'Abgeschlossen',
      completedAt,
      Boolean(completedAt),
      status === 'done' && serviceType !== 'delivery'
    ),
    createTimelineEntry(
      'cancelled',
      'Storniert',
      canceledAt,
      Boolean(canceledAt),
      status === 'archived' && archivedKind === 'cancelled'
    ),
  ]

  return {
    orderId: order.id,
    publicTrackingCode: order.publicOrderCode ?? null,
    orderStatus: order.status ?? 'unknown',
    paymentStatus: order.paymentStatus ?? 'UNKNOWN',
    productionStatus,
    deliveryType: order.serviceType ?? null,
    assignedDriverId: order.assignedDriverId ?? null,
    assignedDriverName: order.assignedDriverName ?? null,
    acceptedAt,
    estimatedReadyAt,
    driverAssignedAt,
    driverDepartedAt,
    deliveredAt,
    completedAt,
    canceledAt,
    customerVisibleStatus: customerVisible.customerVisibleStatus,
    customerVisibleLabel: customerVisible.customerVisibleLabel,
    timeline,
  }
}
