import { prisma } from './prisma'
import {
  parseSettings,
  type BusinessSettings,
  type DeliverySchedulingSettings,
  type WeekDay,
} from './business-settings'
import { type OrderingType } from './ordering-availability'

export type DeliverySlotOption = {
  date: string
  day: WeekDay
  start: string
  end: string
  maxOrders: number | null
}

export type DeliverySlotsResult = {
  earliestDeliveryAt: string | null
  availableDates: string[]
  timeSlots: DeliverySlotOption[]
  reason: string | null
  message: string
}

const WEEK_DAYS_BY_INDEX: WeekDay[] = [
  'SUNDAY',
  'MONDAY',
  'TUESDAY',
  'WEDNESDAY',
  'THURSDAY',
  'FRIDAY',
  'SATURDAY',
]

function toIsoDate(date: Date) {
  return date.toISOString().slice(0, 10)
}

function atTime(base: Date, hhmm: string) {
  const [hoursRaw, minutesRaw] = hhmm.split(':')
  const copy = new Date(base)
  copy.setHours(Number(hoursRaw), Number(minutesRaw), 0, 0)
  return copy
}

function startOfDay(date: Date) {
  const copy = new Date(date)
  copy.setHours(0, 0, 0, 0)
  return copy
}

function addDays(base: Date, days: number) {
  const copy = new Date(base)
  copy.setDate(copy.getDate() + days)
  return copy
}

function getBaseLeadDays(settings: DeliverySchedulingSettings) {
  if (!settings.immediateDeliveryEnabled || settings.deliveryMode === 'NEXT_DAY') {
    return 1
  }
  if (settings.deliveryMode === 'AFTER_DAYS') {
    return Math.max(0, settings.minDaysAhead)
  }
  if (settings.deliveryMode === 'SLOT_ONLY') {
    return Math.max(0, settings.minDaysAhead || 1)
  }
  return 0
}

function applyCutoff(now: Date, leadDays: number, cutoffTime: string | null) {
  if (!cutoffTime) return leadDays
  const cutoffAt = atTime(now, cutoffTime)
  if (now > cutoffAt) {
    return Math.max(leadDays, 1)
  }
  return leadDays
}

function collectSlotsForDate(
  date: Date,
  settings: DeliverySchedulingSettings,
  now: Date
): DeliverySlotOption[] {
  const day = WEEK_DAYS_BY_INDEX[date.getDay()]
  if (!settings.allowedDeliveryDays.includes(day)) {
    return []
  }

  const dateIso = toIsoDate(date)
  return settings.timeSlots
    .filter((entry) => entry.day === day)
    .filter((entry) => {
      if (toIsoDate(now) !== dateIso) return true
      return atTime(date, entry.start) > now
    })
    .map((entry) => ({
      date: dateIso,
      day,
      start: entry.start,
      end: entry.end,
      maxOrders: entry.maxOrders,
    }))
}

function createDeliveryMessage(
  hasSlots: boolean,
  orderType: OrderingType,
  earliestDeliveryAt: string | null,
  settings: DeliverySchedulingSettings
) {
  if (orderType === 'PICKUP') {
    return 'Abholung wird separat konfiguriert.'
  }

  if (!hasSlots) {
    return 'Aktuell sind keine Liefertermine verfügbar.'
  }

  if (!earliestDeliveryAt) {
    return 'Liefertermine sind verfügbar.'
  }

  if (settings.deliveryMode === 'IMMEDIATE') {
    return `Sofortlieferung aktiv. Nächster Lieferzeitpunkt: ${earliestDeliveryAt}.`
  }

  return `Lieferung frühestens ab ${earliestDeliveryAt} möglich.`
}

export function getAvailableDeliverySlotsFromSettings(
  settings: BusinessSettings,
  orderType: OrderingType,
  now: Date
): DeliverySlotsResult {
  if (orderType !== 'DELIVERY') {
    return {
      earliestDeliveryAt: null,
      availableDates: [],
      timeSlots: [],
      reason: 'PICKUP_NOT_SUPPORTED',
      message: 'Liefertermine gelten nur für Lieferbestellungen.',
    }
  }

  if (!settings.ordering.deliveryEnabled || !settings.customerApp.orderingEnabled) {
    return {
      earliestDeliveryAt: null,
      availableDates: [],
      timeSlots: [],
      reason: 'DELIVERY_DISABLED',
      message: 'Lieferung ist aktuell nicht aktiviert.',
    }
  }

  if (settings.ordering.deliveryPauseEnabled) {
    return {
      earliestDeliveryAt: null,
      availableDates: [],
      timeSlots: [],
      reason: 'DELIVERY_PAUSED',
      message: 'Lieferung ist derzeit pausiert.',
    }
  }

  const scheduling = settings.deliveryScheduling
  const leadDaysWithCutoff = applyCutoff(now, getBaseLeadDays(scheduling), scheduling.orderCutoffTime)
  const firstDay = startOfDay(addDays(now, leadDaysWithCutoff))
  const slotHorizonDays = Math.max(1, scheduling.maxPreorderDays)

  const slots: DeliverySlotOption[] = []
  for (let offset = 0; offset <= slotHorizonDays; offset += 1) {
    const date = addDays(firstDay, offset)
    slots.push(...collectSlotsForDate(date, scheduling, now))
  }

  const availableDates = Array.from(new Set(slots.map((entry) => entry.date)))
  const earliest = slots[0] ? `${slots[0].date} ${slots[0].start}` : null
  const message =
    scheduling.customerHint ||
    createDeliveryMessage(slots.length > 0, orderType, earliest, scheduling)

  return {
    earliestDeliveryAt: earliest,
    availableDates,
    timeSlots: slots,
    reason: slots.length > 0 ? null : 'NO_SLOTS_AVAILABLE',
    message,
  }
}

export async function getAvailableDeliverySlots(
  tenantId: string,
  orderType: OrderingType,
  now: Date = new Date()
): Promise<DeliverySlotsResult> {
  const tenant = await prisma.tenant.findUnique({
    where: { id: tenantId },
    select: { id: true, name: true, email: true, businessSettings: true },
  })

  if (!tenant) {
    throw new Error('TENANT_NOT_FOUND')
  }

  const settings = parseSettings(tenant.businessSettings, {
    name: tenant.name,
    email: tenant.email,
  })

  return getAvailableDeliverySlotsFromSettings(settings, orderType, now)
}
