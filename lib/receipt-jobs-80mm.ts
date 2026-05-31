import type { Order, OrderItem } from './api'
import { renderReceipt80mm, type ReceiptRenderResult } from './receipt-renderer-80mm'
import {
  CUSTOMER_RECEIPT_TEMPLATE_80MM,
  KITCHEN_RECEIPT_TEMPLATE_80MM,
  type ReceiptItemRow,
} from './receipt-template-80mm'

export type TenantReceiptProfile = {
  name: string
  street?: string | null
  zipCode?: string | null
  city?: string | null
  phone?: string | null
}

export type ReceiptJobContext = {
  tenant: {
    name: string
    street: string
    zipCode: string
    city: string
    phone: string
  }
  order: {
    shortId: string
    createdAtLocal: string
    sourceChannel: string
    serviceType: string
    subtotalEur: string
    deliveryFeeEur: string
    totalEur: string
    trackingUrl: string
    etaMinutes: string
    driverName: string
    customerName: string
    customerPhone: string
    customerAddressLine: string
  }
}

export type ReceiptJobOptions = {
  tenantProfile?: Partial<TenantReceiptProfile>
  trackingUrl?: string | null
  locale?: string
  timeZone?: string
}

function toSafeString(value: string | null | undefined) {
  return (value ?? '').trim()
}

function formatMoneyEur(value: string | number | null | undefined) {
  const parsed =
    typeof value === 'number' ? value : Number.parseFloat(String(value ?? '0').replace(',', '.'))
  const safe = Number.isFinite(parsed) ? parsed : 0
  return `${safe.toFixed(2)} EUR`
}

function formatDateTimeLocal(
  value: string,
  locale = 'de-DE',
  timeZone?: string
) {
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) {
    return '-'
  }

  return parsed.toLocaleString(locale, timeZone ? { timeZone } : undefined)
}

function labelServiceType(value: string | null | undefined) {
  if (value === 'DELIVERY') {
    return 'Lieferung'
  }
  if (value === 'PICKUP') {
    return 'Abholung'
  }
  return value || '-'
}

function labelSourceChannel(value: string | null | undefined) {
  if (!value) {
    return '-'
  }
  if (value === 'TERMINAL') {
    return 'Bestellterminal'
  }
  if (value === 'APP') {
    return 'App'
  }
  if (value === 'DELIVERY') {
    return 'Lieferung'
  }
  return value
}

function resolveOrderShortId(order: Order) {
  const publicCode = (order.publicOrderCode || '').trim().toUpperCase()
  if (publicCode) {
    return publicCode
  }
  return order.id.replace(/-/g, '').slice(0, 8).toUpperCase()
}

function resolveCustomerAddressLine(order: Order) {
  const line = [order.customerAddress, order.customerZipCode, order.customerCity]
    .map((entry) => toSafeString(entry))
    .filter(Boolean)
    .join(', ')
  return line || '-'
}

function resolveTenantProfile(order: Order, overrides?: Partial<TenantReceiptProfile>) {
  const tenantName = toSafeString(overrides?.name) || toSafeString(order.tenant?.name) || 'Klarando'
  return {
    name: tenantName,
    street: toSafeString(overrides?.street),
    zipCode: toSafeString(overrides?.zipCode),
    city: toSafeString(overrides?.city),
    phone: toSafeString(overrides?.phone),
  }
}

function mapItemModifiers(item: OrderItem) {
  const modifiers = item.modifierSnapshot ?? []
  return modifiers.map((entry) => {
    const delta = Number(entry.priceDelta ?? 0)
    if (!Number.isFinite(delta) || delta === 0) {
      return entry.name
    }
    return `${entry.name} (${delta >= 0 ? '+' : ''}${delta.toFixed(2)} EUR)`
  })
}

function mapCustomerItemRows(order: Order): ReceiptItemRow[] {
  return order.items.map((item) => ({
    qty: `${item.quantity}x`,
    label: item.product.name,
    price: formatMoneyEur(item.price),
    modifiers: mapItemModifiers(item),
  }))
}

function mapKitchenItemRows(order: Order): ReceiptItemRow[] {
  return order.items.map((item) => ({
    qty: `${item.quantity}x`,
    label: item.product.name,
    price: '',
    modifiers: mapItemModifiers(item),
  }))
}

export function createReceiptJobContextFromOrder(
  order: Order,
  options?: ReceiptJobOptions
): ReceiptJobContext {
  const tenant = resolveTenantProfile(order, options?.tenantProfile)
  return {
    tenant: {
      name: tenant.name,
      street: tenant.street,
      zipCode: tenant.zipCode,
      city: tenant.city,
      phone: tenant.phone,
    },
    order: {
      shortId: resolveOrderShortId(order),
      createdAtLocal: formatDateTimeLocal(order.createdAt, options?.locale, options?.timeZone),
      sourceChannel: labelSourceChannel(order.sourceChannel),
      serviceType: labelServiceType(order.serviceType),
      subtotalEur: formatMoneyEur(order.subtotal),
      deliveryFeeEur: formatMoneyEur(order.deliveryFee),
      totalEur: formatMoneyEur(order.total),
      trackingUrl: toSafeString(options?.trackingUrl) || '-',
      etaMinutes: order.estimatedMinutes ? String(order.estimatedMinutes) : '-',
      driverName: toSafeString(order.assignedDriverName) || toSafeString(order.assignedDriver?.name) || '-',
      customerName:
        toSafeString(order.customerName) || toSafeString(order.appCustomerAccount?.fullName) || '-',
      customerPhone: toSafeString(order.customerPhone) || '-',
      customerAddressLine: resolveCustomerAddressLine(order),
    },
  }
}

export function buildCustomerReceiptJob80mm(
  order: Order,
  options?: ReceiptJobOptions
): ReceiptRenderResult {
  const context = createReceiptJobContextFromOrder(order, options)
  return renderReceipt80mm({
    template: CUSTOMER_RECEIPT_TEMPLATE_80MM,
    data: context as unknown as Record<string, unknown>,
    itemRows: mapCustomerItemRows(order),
  })
}

export function buildKitchenReceiptJob80mm(
  order: Order,
  options?: ReceiptJobOptions
): ReceiptRenderResult {
  const context = createReceiptJobContextFromOrder(order, options)
  return renderReceipt80mm({
    template: KITCHEN_RECEIPT_TEMPLATE_80MM,
    data: context as unknown as Record<string, unknown>,
    itemRows: mapKitchenItemRows(order),
  })
}
