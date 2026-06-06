import { prisma } from './prisma'
import {
  matchServiceArea,
  parseSettings,
  type BusinessSettings,
  type DailyWindow,
  type ServiceAreaMatchInput,
  type WeekDay,
} from './business-settings'

export type DeliveryAvailabilityWindow = {
  start: string
  end: string
  source: 'BASE_WINDOW' | 'SLOT'
}

export type DeliveryAvailabilityResult = {
  isDeliveryAvailable: boolean
  nextDeliveryAt: Date | null
  customerMessage: string
  blockingReasons: string[]
  debugReasons: string[]
  todayDeliveryWindows: DeliveryAvailabilityWindow[]
}

export type BuildDeliveryAvailabilityInput = {
  settings: BusinessSettings
  now?: Date
  deliveryAreaInput?: ServiceAreaMatchInput | null
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

type TimeRange = {
  startMinutes: number
  endMinutes: number
  start: string
  end: string
}

function toLocalIsoDate(value: Date) {
  const year = value.getFullYear()
  const month = String(value.getMonth() + 1).padStart(2, '0')
  const day = String(value.getDate()).padStart(2, '0')
  return `${year}-${month}-${day}`
}

function toIsoDate(value: Date) {
  return toLocalIsoDate(value)
}

function startOfDay(value: Date) {
  const copy = new Date(value)
  copy.setHours(0, 0, 0, 0)
  return copy
}

function addDays(value: Date, days: number) {
  const copy = new Date(value)
  copy.setDate(copy.getDate() + days)
  return copy
}

function minutesFromDate(value: Date) {
  return value.getHours() * 60 + value.getMinutes()
}

function toMinutes(value: string | null) {
  if (!value) return null
  const [hoursRaw, minutesRaw] = value.split(':')
  const hours = Number(hoursRaw)
  const minutes = Number(minutesRaw)
  if (!Number.isInteger(hours) || !Number.isInteger(minutes)) return null
  if (hours < 0 || hours > 23 || minutes < 0 || minutes > 59) return null
  return hours * 60 + minutes
}

function minutesToTime(value: number) {
  const hours = Math.floor(value / 60)
  const minutes = value % 60
  return `${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}`
}

function getWindowForDay(windows: DailyWindow[], day: WeekDay) {
  return windows.find((entry) => entry.day === day) || null
}

function getHolidayWindow(settings: BusinessSettings, date: Date) {
  const currentDate = toLocalIsoDate(date)
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

function toTimeRange(window: DailyWindow | null): TimeRange | null {
  if (!window || window.isClosed) {
    return null
  }

  const startMinutes = toMinutes(window.open)
  const endMinutes = toMinutes(window.close)
  if (startMinutes === null || endMinutes === null || startMinutes >= endMinutes) {
    return null
  }

  return {
    startMinutes,
    endMinutes,
    start: minutesToTime(startMinutes),
    end: minutesToTime(endMinutes),
  }
}

function intersectRanges(left: TimeRange | null, right: TimeRange | null): TimeRange | null {
  if (!left || !right) {
    return null
  }

  const startMinutes = Math.max(left.startMinutes, right.startMinutes)
  const endMinutes = Math.min(left.endMinutes, right.endMinutes)
  if (startMinutes >= endMinutes) {
    return null
  }

  return {
    startMinutes,
    endMinutes,
    start: minutesToTime(startMinutes),
    end: minutesToTime(endMinutes),
  }
}

function getBaseLeadDays(settings: BusinessSettings['timeManagement']['deliveryScheduling']) {
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
  const cutoffMinutes = toMinutes(cutoffTime)
  if (cutoffMinutes === null) {
    return leadDays
  }

  return minutesFromDate(now) > cutoffMinutes ? Math.max(leadDays, 1) : leadDays
}

function hasConfiguredTimeSlots(settings: BusinessSettings['timeManagement']['deliveryScheduling']) {
  return settings.timeSlots.some((slot) => {
    const startMinutes = toMinutes(slot.start)
    const endMinutes = toMinutes(slot.end)
    return startMinutes !== null && endMinutes !== null && startMinutes < endMinutes
  })
}

function buildSlotRangesForDate(settings: BusinessSettings, date: Date) {
  const holiday = getHolidayWindow(settings, date)
  if (holiday?.isClosed) {
    return [] as TimeRange[]
  }

  const weekday = DAY_BY_INDEX[date.getDay()]
  const holidayStart = toMinutes(holiday?.open ?? null)
  const holidayEnd = toMinutes(holiday?.close ?? null)

  return settings.timeManagement.deliveryScheduling.timeSlots
    .filter((slot) => slot.day === weekday)
    .map((slot) => {
      const startMinutes = toMinutes(slot.start)
      const endMinutes = toMinutes(slot.end)
      if (startMinutes === null || endMinutes === null || startMinutes >= endMinutes) {
        return null
      }

      const croppedStart =
        holidayStart !== null ? Math.max(startMinutes, holidayStart) : startMinutes
      const croppedEnd = holidayEnd !== null ? Math.min(endMinutes, holidayEnd) : endMinutes
      if (croppedStart >= croppedEnd) {
        return null
      }

      return {
        startMinutes: croppedStart,
        endMinutes: croppedEnd,
        start: minutesToTime(croppedStart),
        end: minutesToTime(croppedEnd),
      }
    })
    .filter((entry): entry is TimeRange => entry !== null)
    .sort((left, right) => left.startMinutes - right.startMinutes)
}

function buildDeliveryWindowsForDate(settings: BusinessSettings, date: Date): DeliveryAvailabilityWindow[] {
  const weekday = DAY_BY_INDEX[date.getDay()]
  const holiday = getHolidayWindow(settings, date)
  const openingWindow = applyHolidayOverride(
    getWindowForDay(settings.timeManagement.openingHours, weekday),
    weekday,
    holiday
  )
  const deliveryWindow = applyHolidayOverride(
    getWindowForDay(settings.timeManagement.deliveryHours, weekday),
    weekday,
    holiday
  )

  const baseRange = intersectRanges(toTimeRange(openingWindow), toTimeRange(deliveryWindow))
  if (!baseRange) {
    return []
  }

  const scheduling = settings.timeManagement.deliveryScheduling
  const holidayAllowsDay = Boolean(holiday && !holiday.isClosed)
  const dayAllowed =
    holidayAllowsDay || scheduling.allowedDeliveryDays.includes(weekday)

  if (!dayAllowed) {
    return []
  }

  if (!hasConfiguredTimeSlots(scheduling)) {
    return [
      {
        start: baseRange.start,
        end: baseRange.end,
        source: 'BASE_WINDOW',
      },
    ]
  }

  const slotRanges = buildSlotRangesForDate(settings, date)
  return slotRanges
    .map((slotRange) => intersectRanges(baseRange, slotRange))
    .filter((entry): entry is TimeRange => entry !== null)
    .map((entry) => ({
      start: entry.start,
      end: entry.end,
      source: 'SLOT' as const,
    }))
}

function getNextDeliveryAt(settings: BusinessSettings, now: Date) {
  const scheduling = settings.timeManagement.deliveryScheduling
  const leadDays = applyCutoff(now, getBaseLeadDays(scheduling), scheduling.orderCutoffTime)
  const firstDay = startOfDay(addDays(now, leadDays))
  const horizonDays = Math.max(1, scheduling.maxPreorderDays, 21)

  for (let offset = 0; offset <= horizonDays; offset += 1) {
    const date = addDays(firstDay, offset)
    const windows = buildDeliveryWindowsForDate(settings, date)
    for (const window of windows) {
      const [hoursRaw, minutesRaw] = window.start.split(':')
      const candidate = new Date(date)
      candidate.setHours(Number(hoursRaw), Number(minutesRaw), 0, 0)
      if (candidate.getTime() > now.getTime()) {
        return candidate
      }
    }
  }

  return null
}

function isNowWithinWindows(windows: DeliveryAvailabilityWindow[], now: Date) {
  const nowMinutes = minutesFromDate(now)
  return windows.some((window) => {
    const startMinutes = toMinutes(window.start)
    const endMinutes = toMinutes(window.end)
    if (startMinutes === null || endMinutes === null) {
      return false
    }
    return nowMinutes >= startMinutes && nowMinutes < endMinutes
  })
}

function resolveAreaBlockingReason(
  settings: BusinessSettings,
  deliveryAreaInput: ServiceAreaMatchInput | null | undefined
) {
  const area = settings.deliveryArea
  if (!area.enabled) {
    return {
      blockingReason: null,
      debugReason: 'Liefergebiet deaktiviert; Area-Pruefung uebersprungen.',
    }
  }

  const hasAnyInput = Boolean(
    deliveryAreaInput &&
      (deliveryAreaInput.zipCode ||
        deliveryAreaInput.street ||
        typeof deliveryAreaInput.latitude === 'number' ||
        typeof deliveryAreaInput.longitude === 'number')
  )

  if (!hasAnyInput) {
    return {
      blockingReason: null,
      debugReason: 'Liefergebiet nicht geprueft; keine Kundenadresse uebergeben.',
    }
  }

  const result = matchServiceArea(area, {
    zipCode: deliveryAreaInput?.zipCode ?? null,
    street: deliveryAreaInput?.street ?? null,
    latitude: deliveryAreaInput?.latitude ?? null,
    longitude: deliveryAreaInput?.longitude ?? null,
  })
  const areaMatched =
    area.strategy === 'POLYGON'
      ? result.matchedByPolygon
      : result.matched

  if (areaMatched) {
    return {
      blockingReason: null,
      debugReason: 'Liefergebiet erfolgreich geprueft.',
    }
  }

  if (result.requiresLocation) {
    return {
      blockingReason: 'DELIVERY_AREA_LOCATION_REQUIRED',
      debugReason: 'Liefergebiet erfordert Koordinaten fuer die Pruefung.',
    }
  }

  if (result.configurationIncomplete) {
    return {
      blockingReason: 'DELIVERY_AREA_CONFIGURATION_INCOMPLETE',
      debugReason: 'Liefergebietskonfiguration ist unvollstaendig.',
    }
  }

  return {
    blockingReason: 'DELIVERY_AREA_OUT_OF_RANGE',
    debugReason: 'Lieferadresse liegt ausserhalb des Liefergebiets.',
  }
}

function formatCustomerDateTime(value: Date) {
  return value.toLocaleString('de-DE', {
    day: '2-digit',
    month: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
  })
}

export function buildDeliveryAvailability(
  input: BuildDeliveryAvailabilityInput
): DeliveryAvailabilityResult {
  const now = input.now ?? new Date()
  const settings = input.settings
  const blockingReasons: string[] = []
  const debugReasons: string[] = []

  const todayDeliveryWindows = buildDeliveryWindowsForDate(settings, now)
  const hasWindowsToday = todayDeliveryWindows.length > 0
  const isWithinTodayWindow = isNowWithinWindows(todayDeliveryWindows, now)
  const nextDeliveryAt = getNextDeliveryAt(settings, now)

  if (!settings.customerApp.orderingEnabled) {
    blockingReasons.push('CUSTOMER_APP_ORDERING_DISABLED')
    debugReasons.push('Customer-App Bestellungen sind global deaktiviert.')
  } else {
    debugReasons.push('Customer-App Bestellungen sind aktiviert.')
  }

  if (!settings.timeManagement.ordering.deliveryEnabled) {
    blockingReasons.push('DELIVERY_MODE_DISABLED')
    debugReasons.push('Liefermodus ist in den Bestelleinstellungen deaktiviert.')
  } else {
    debugReasons.push('Liefermodus ist aktiviert.')
  }

  if (!settings.orderIntake.orderIntakeEnabled) {
    blockingReasons.push('ORDER_INTAKE_PAUSED')
    debugReasons.push('Bestellannahme ist pausiert.')
  } else {
    debugReasons.push('Bestellannahme ist aktiv.')
  }

  if (!settings.orderIntake.services.deliveryEnabledNow) {
    blockingReasons.push('ORDER_INTAKE_DELIVERY_DISABLED')
    debugReasons.push('Lieferung ist in der aktiven Bestellannahme deaktiviert.')
  } else {
    debugReasons.push('Lieferung ist in der Bestellannahme aktiv.')
  }

  if (settings.timeManagement.ordering.deliveryPauseEnabled) {
    blockingReasons.push('DELIVERY_PAUSED')
    debugReasons.push('Sofortlieferung ist aktuell pausiert.')
  } else {
    debugReasons.push('Keine manuelle Lieferpause gesetzt.')
  }

  const areaEvaluation = resolveAreaBlockingReason(settings, input.deliveryAreaInput)
  if (areaEvaluation.blockingReason) {
    blockingReasons.push(areaEvaluation.blockingReason)
  }
  debugReasons.push(areaEvaluation.debugReason)

  const leadDays = applyCutoff(
    now,
    getBaseLeadDays(settings.timeManagement.deliveryScheduling),
    settings.timeManagement.deliveryScheduling.orderCutoffTime
  )
  if (leadDays > 0) {
    blockingReasons.push('MINIMUM_LEAD_TIME_ACTIVE')
    debugReasons.push(`Mindestvorlauf aktiv: ${leadDays} Tag(e) Vorlauf.`)
  } else {
    debugReasons.push('Kein zusaetzlicher Mindestvorlauf fuer sofortige Lieferung aktiv.')
  }

  if (!hasWindowsToday) {
    blockingReasons.push('NO_DELIVERY_WINDOWS_AVAILABLE')
    debugReasons.push('Heute existieren keine gueltigen Lieferfenster nach Oeffnungszeiten, Feiertagen und Slots.')
  } else if (!isWithinTodayWindow) {
    blockingReasons.push('OUTSIDE_DELIVERY_WINDOWS')
    debugReasons.push('Aktuelle Uhrzeit liegt ausserhalb der heutigen Lieferfenster.')
  } else {
    debugReasons.push('Aktuelle Uhrzeit liegt innerhalb eines gueltigen Lieferfensters.')
  }

  const uniqueBlockingReasons = Array.from(new Set(blockingReasons))
  const isDeliveryAvailable = uniqueBlockingReasons.length === 0

  let customerMessage = 'Bestellung aktuell nicht moeglich.'
  if (settings.timeManagement.ordering.manualNoticeText) {
    customerMessage = settings.timeManagement.ordering.manualNoticeText
  } else if (uniqueBlockingReasons.includes('DELIVERY_AREA_OUT_OF_RANGE')) {
    customerMessage = 'Die Lieferadresse liegt ausserhalb des Liefergebiets.'
  } else if (uniqueBlockingReasons.includes('DELIVERY_AREA_LOCATION_REQUIRED')) {
    customerMessage = 'Fuer diese Lieferung wird eine gueltige Standortangabe benoetigt.'
  } else if (uniqueBlockingReasons.includes('DELIVERY_AREA_CONFIGURATION_INCOMPLETE')) {
    customerMessage = 'Lieferung ist aktuell nicht verfuegbar, da das Liefergebiet noch unvollstaendig konfiguriert ist.'
  } else if (uniqueBlockingReasons.includes('CUSTOMER_APP_ORDERING_DISABLED')) {
    customerMessage = 'Bestellungen sind aktuell deaktiviert.'
  } else if (uniqueBlockingReasons.includes('DELIVERY_MODE_DISABLED')) {
    customerMessage = 'Lieferung ist aktuell deaktiviert.'
  } else if (uniqueBlockingReasons.includes('ORDER_INTAKE_PAUSED')) {
    customerMessage =
      settings.orderIntake.orderIntakePausedReason?.trim() ||
      'Aufgrund hoher Auslastung nimmt dieses Restaurant aktuell keine Lieferbestellungen an.'
  } else if (uniqueBlockingReasons.includes('ORDER_INTAKE_DELIVERY_DISABLED')) {
    customerMessage = 'Lieferung ist aktuell in der Bestellannahme deaktiviert.'
  } else if (uniqueBlockingReasons.includes('DELIVERY_PAUSED')) {
    customerMessage = 'Lieferung ist derzeit pausiert.'
  } else if (isDeliveryAvailable) {
    customerMessage = 'Bestellung ist moeglich.'
  } else if (nextDeliveryAt && settings.timeManagement.ordering.preorderEnabled) {
    customerMessage = `Aktuell geschlossen. Du kannst vorbestellen. Erste Lieferung ab ${formatCustomerDateTime(nextDeliveryAt)} Uhr.`
  } else if (nextDeliveryAt) {
    customerMessage = `Aktuell geschlossen. Naechste Lieferung ab ${formatCustomerDateTime(nextDeliveryAt)} Uhr moeglich.`
  } else {
    customerMessage = 'Aktuell sind keine Liefertermine verfuegbar.'
  }

  return {
    isDeliveryAvailable,
    nextDeliveryAt: isDeliveryAvailable ? null : nextDeliveryAt,
    customerMessage,
    blockingReasons: uniqueBlockingReasons,
    debugReasons,
    todayDeliveryWindows,
  }
}

export async function buildDeliveryAvailabilityForTenant(
  tenantId: string,
  input?: Omit<BuildDeliveryAvailabilityInput, 'settings'>
) {
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

  return buildDeliveryAvailability({
    settings,
    now: input?.now,
    deliveryAreaInput: input?.deliveryAreaInput,
  })
}
