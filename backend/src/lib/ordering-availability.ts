import { prisma } from './prisma'
import { parseSettings, type BusinessSettings, type DailyWindow, type WeekDay } from './business-settings'

export type OrderingType = 'DELIVERY' | 'PICKUP'

export type TenantOrderingAvailability = {
  isOpen: boolean
  canOrderNow: boolean
  canPreorder: boolean
  nextAvailableTime: string | null
  closingSoon: boolean
  minutesUntilCutoff: number | null
  message: string
  allowedOrderTypes: OrderingType[]
}

const DAY_BY_INDEX: WeekDay[] = [
  'SUNDAY',
  'MONDAY',
  'TUESDAY',
  'WEDNESDAY',
  'THURSDAY',
  'FRIDAY',
  'SATURDAY',
]

function toMinutes(value: string | null) {
  if (!value) return null
  const [hoursRaw, minutesRaw] = value.split(':')
  const hours = Number(hoursRaw)
  const minutes = Number(minutesRaw)
  if (!Number.isInteger(hours) || !Number.isInteger(minutes)) return null
  return hours * 60 + minutes
}

function minutesFromDate(value: Date) {
  return value.getHours() * 60 + value.getMinutes()
}

function getWindowForDay(windows: DailyWindow[], day: WeekDay) {
  return windows.find((entry) => entry.day === day) || null
}

function toLocalIsoDate(value: Date) {
  const year = value.getFullYear()
  const month = String(value.getMonth() + 1).padStart(2, '0')
  const day = String(value.getDate()).padStart(2, '0')
  return `${year}-${month}-${day}`
}

function getHolidayWindow(settings: BusinessSettings, now: Date) {
  const currentDate = toLocalIsoDate(now)
  return settings.timeManagement.holidayHours.find((entry) => entry.date === currentDate) || null
}

function applyHolidayOverride(
  window: DailyWindow | null,
  day: WeekDay,
  holiday: BusinessSettings['timeManagement']['holidayHours'][number] | null
): DailyWindow | null {
  if (!holiday) {
    return window
  }

  if (holiday.isClosed) {
    return {
      day,
      isClosed: true,
      open: null,
      close: null,
    }
  }

  return {
    day,
    isClosed: false,
    open: holiday.open ?? window?.open ?? null,
    close: holiday.close ?? window?.close ?? null,
  }
}

function isWindowOpen(window: DailyWindow | null, nowMinutes: number) {
  if (!window || window.isClosed) return false
  const openMinutes = toMinutes(window.open)
  const closeMinutes = toMinutes(window.close)
  if (openMinutes === null || closeMinutes === null) return false
  return nowMinutes >= openMinutes && nowMinutes < closeMinutes
}

function cutoffMinutes(window: DailyWindow | null, cutoffOffset: number) {
  if (!window || window.isClosed) return null
  const closeMinutes = toMinutes(window.close)
  if (closeMinutes === null) return null
  return Math.max(0, closeMinutes - cutoffOffset)
}

function formatNextTime(window: DailyWindow | null) {
  if (!window || window.isClosed || !window.open) return null
  return window.open
}

export function getTenantOrderingAvailabilityFromSettings(
  settings: BusinessSettings,
  orderType: OrderingType,
  now: Date
): TenantOrderingAvailability {
  const weekday = DAY_BY_INDEX[now.getDay()]
  const nowMinutes = minutesFromDate(now)
  const timeManagement = settings.timeManagement
  const holidayWindow = getHolidayWindow(settings, now)
  const openingWindow = applyHolidayOverride(
    getWindowForDay(timeManagement.openingHours, weekday),
    weekday,
    holidayWindow
  )
  const serviceWindows =
    orderType === 'DELIVERY' ? timeManagement.deliveryHours : timeManagement.openingHours
  const serviceWindow = applyHolidayOverride(
    getWindowForDay(serviceWindows, weekday),
    weekday,
    holidayWindow
  )
  const isBusinessOpen = isWindowOpen(openingWindow, nowMinutes)
  const isServiceOpen = isWindowOpen(serviceWindow, nowMinutes)
  const isOpen = isBusinessOpen && isServiceOpen

  const ordering = timeManagement.ordering
  const orderingSwitchOn = settings.customerApp.orderingEnabled
  const modeEnabled = orderType === 'DELIVERY' ? ordering.deliveryEnabled : ordering.pickupEnabled
  const isPaused = orderType === 'DELIVERY' && ordering.deliveryPauseEnabled
  const cutoffOffset =
    orderType === 'DELIVERY'
      ? ordering.deliveryCutoffMinutesBeforeClose
      : ordering.pickupCutoffMinutesBeforeClose
  const cutoffAt = cutoffMinutes(serviceWindow, cutoffOffset)
  const minutesUntilCutoff = cutoffAt === null ? null : cutoffAt - nowMinutes
  const beforeCutoff = cutoffAt === null ? true : nowMinutes < cutoffAt
  const canOrderNow = orderingSwitchOn && modeEnabled && !isPaused && isOpen && beforeCutoff
  const canPreorder = orderingSwitchOn && modeEnabled && ordering.preorderEnabled && !canOrderNow
  const closingSoon =
    Boolean(canOrderNow) &&
    minutesUntilCutoff !== null &&
    minutesUntilCutoff <= ordering.closingSoonThresholdMinutes

  let message = 'Bestellung aktuell nicht möglich.'
  if (!orderingSwitchOn) {
    message = 'Bestellungen sind aktuell deaktiviert.'
  } else if (!modeEnabled) {
    message =
      orderType === 'DELIVERY'
        ? 'Lieferung ist aktuell deaktiviert.'
        : 'Abholung ist aktuell deaktiviert.'
  } else if (isPaused) {
    message = 'Lieferung ist derzeit pausiert.'
  } else if (canOrderNow && closingSoon && minutesUntilCutoff !== null) {
    message = `Bestelle innerhalb der nächsten ${minutesUntilCutoff} Minuten – wir schließen bald.`
  } else if (canOrderNow) {
    message = 'Bestellung ist möglich.'
  } else if (canPreorder) {
    const nextTime = ordering.preorderEarliestTime || formatNextTime(serviceWindow)
    message = nextTime
      ? `Aktuell geschlossen. Du kannst vorbestellen. Erste ${orderType === 'DELIVERY' ? 'Lieferung' : 'Abholung'} ab ${nextTime} Uhr.`
      : 'Aktuell geschlossen. Du kannst vorbestellen.'
  } else if (!isOpen) {
    message = 'Aktuell geschlossen. Der Betrieb nimmt derzeit keine Bestellungen an.'
  }

  if (ordering.manualNoticeText) {
    message = ordering.manualNoticeText
  }

  const allowedOrderTypes: OrderingType[] = []
  if (ordering.deliveryEnabled) allowedOrderTypes.push('DELIVERY')
  if (ordering.pickupEnabled) allowedOrderTypes.push('PICKUP')

  return {
    isOpen,
    canOrderNow,
    canPreorder,
    nextAvailableTime: formatNextTime(serviceWindow),
    closingSoon,
    minutesUntilCutoff: minutesUntilCutoff === null ? null : Math.max(0, minutesUntilCutoff),
    message,
    allowedOrderTypes,
  }
}

export async function getTenantOrderingAvailability(
  tenantId: string,
  orderType: OrderingType,
  now: Date = new Date()
): Promise<TenantOrderingAvailability> {
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

  return getTenantOrderingAvailabilityFromSettings(settings, orderType, now)
}
