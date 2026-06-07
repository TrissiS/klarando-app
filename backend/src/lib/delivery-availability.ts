import { prisma } from './prisma'
import {
  matchServiceArea,
  parseSettings,
  type BusinessSettings,
  type DailyWindow,
  type ServiceAreaMatchInput,
  type ServiceAreaSettings,
  type WeekDay,
  resolveEffectiveServiceAreaFromBusinessSettings,
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
  deliveryAreaOverride?: ServiceAreaSettings | null
  timeZone?: string | null
}

export const DEFAULT_DELIVERY_TIME_ZONE = 'Europe/Berlin'

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

type TenantLocalDateParts = {
  year: number
  month: number
  day: number
  hour: number
  minute: number
  second: number
  isoDate: string
  weekDay: WeekDay
}

const formatterByTimeZone = new Map<string, Intl.DateTimeFormat>()

function getTenantDateFormatter(timeZone: string) {
  const existing = formatterByTimeZone.get(timeZone)
  if (existing) {
    return existing
  }

  const formatter = new Intl.DateTimeFormat('en-CA', {
    timeZone,
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hourCycle: 'h23',
  })
  formatterByTimeZone.set(timeZone, formatter)
  return formatter
}

export function resolveDeliveryAvailabilityTimeZone(timeZone?: string | null) {
  const candidate = typeof timeZone === 'string' ? timeZone.trim() : ''
  if (!candidate) {
    return DEFAULT_DELIVERY_TIME_ZONE
  }

  try {
    new Intl.DateTimeFormat('de-DE', { timeZone: candidate }).format(new Date())
    return candidate
  } catch {
    return DEFAULT_DELIVERY_TIME_ZONE
  }
}

export function getTenantLocalDate(value: Date, timeZone = DEFAULT_DELIVERY_TIME_ZONE): TenantLocalDateParts {
  const formatter = getTenantDateFormatter(timeZone)
  const parts = formatter.formatToParts(value)
  const values = new Map(parts.map((entry) => [entry.type, entry.value]))

  const year = Number(values.get('year'))
  const month = Number(values.get('month'))
  const day = Number(values.get('day'))
  const hour = Number(values.get('hour'))
  const minute = Number(values.get('minute'))
  const second = Number(values.get('second'))

  const isoDate = `${String(year).padStart(4, '0')}-${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}`
  const weekday = DAY_BY_INDEX[new Date(Date.UTC(year, month - 1, day)).getUTCDay()]

  return {
    year,
    month,
    day,
    hour,
    minute,
    second,
    isoDate,
    weekDay: weekday,
  }
}

function getTimeZoneOffsetMs(value: Date, timeZone: string) {
  const parts = getTenantLocalDate(value, timeZone)
  const asUtc = Date.UTC(parts.year, parts.month - 1, parts.day, parts.hour, parts.minute, parts.second)
  return asUtc - value.getTime()
}

function buildTenantDate(
  year: number,
  month: number,
  day: number,
  hour: number,
  minute: number,
  second: number,
  timeZone: string
) {
  let utcGuess = Date.UTC(year, month - 1, day, hour, minute, second)

  for (let iteration = 0; iteration < 4; iteration += 1) {
    const offset = getTimeZoneOffsetMs(new Date(utcGuess), timeZone)
    const adjusted = Date.UTC(year, month - 1, day, hour, minute, second) - offset
    if (adjusted === utcGuess) {
      break
    }
    utcGuess = adjusted
  }

  return new Date(utcGuess)
}

function addTenantDays(value: Date, days: number, timeZone: string, hour?: number, minute?: number, second?: number) {
  const parts = getTenantLocalDate(value, timeZone)
  const shifted = new Date(
    Date.UTC(
      parts.year,
      parts.month - 1,
      parts.day + days,
      hour ?? parts.hour,
      minute ?? parts.minute,
      second ?? parts.second,
    )
  )

  return buildTenantDate(
    shifted.getUTCFullYear(),
    shifted.getUTCMonth() + 1,
    shifted.getUTCDate(),
    hour ?? parts.hour,
    minute ?? parts.minute,
    second ?? parts.second,
    timeZone
  )
}

function startOfTenantDay(value: Date, timeZone: string) {
  const parts = getTenantLocalDate(value, timeZone)
  return buildTenantDate(parts.year, parts.month, parts.day, 0, 0, 0, timeZone)
}

function minutesFromTenantDate(value: Date, timeZone: string) {
  const parts = getTenantLocalDate(value, timeZone)
  return parts.hour * 60 + parts.minute
}

function formatTenantLocalDateTime(value: Date, timeZone: string) {
  const parts = getTenantLocalDate(value, timeZone)
  return `${parts.isoDate} ${String(parts.hour).padStart(2, '0')}:${String(parts.minute).padStart(2, '0')}:${String(parts.second).padStart(2, '0')}`
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

function getHolidayWindow(settings: BusinessSettings, date: Date, timeZone: string) {
  const currentDate = getTenantLocalDate(date, timeZone).isoDate
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

function applyCutoff(now: Date, leadDays: number, cutoffTime: string | null, timeZone: string) {
  const cutoffMinutes = toMinutes(cutoffTime)
  if (cutoffMinutes === null) {
    return leadDays
  }

  return minutesFromTenantDate(now, timeZone) > cutoffMinutes ? Math.max(leadDays, 1) : leadDays
}

function hasConfiguredTimeSlots(settings: BusinessSettings['timeManagement']['deliveryScheduling']) {
  return settings.timeSlots.some((slot) => {
    const startMinutes = toMinutes(slot.start)
    const endMinutes = toMinutes(slot.end)
    return startMinutes !== null && endMinutes !== null && startMinutes < endMinutes
  })
}

function buildSlotRangesForDate(settings: BusinessSettings, date: Date, timeZone: string) {
  const holiday = getHolidayWindow(settings, date, timeZone)
  if (holiday?.isClosed) {
    return [] as TimeRange[]
  }

  const weekday = getTenantLocalDate(date, timeZone).weekDay
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

function buildDeliveryWindowsForDate(
  settings: BusinessSettings,
  date: Date,
  timeZone: string
): DeliveryAvailabilityWindow[] {
  const weekday = getTenantLocalDate(date, timeZone).weekDay
  const holiday = getHolidayWindow(settings, date, timeZone)
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

  const slotRanges = buildSlotRangesForDate(settings, date, timeZone)
  return slotRanges
    .map((slotRange) => intersectRanges(baseRange, slotRange))
    .filter((entry): entry is TimeRange => entry !== null)
    .map((entry) => ({
      start: entry.start,
      end: entry.end,
      source: 'SLOT' as const,
    }))
}

function getNextDeliveryAt(settings: BusinessSettings, now: Date, timeZone: string) {
  const scheduling = settings.timeManagement.deliveryScheduling
  const leadDays = applyCutoff(now, getBaseLeadDays(scheduling), scheduling.orderCutoffTime, timeZone)
  const firstDay = startOfTenantDay(addTenantDays(now, leadDays, timeZone), timeZone)
  const horizonDays = Math.max(1, scheduling.maxPreorderDays, 21)

  for (let offset = 0; offset <= horizonDays; offset += 1) {
    const date = addTenantDays(firstDay, offset, timeZone, 0, 0, 0)
    const windows = buildDeliveryWindowsForDate(settings, date, timeZone)
    const dateParts = getTenantLocalDate(date, timeZone)
    for (const window of windows) {
      const [hoursRaw, minutesRaw] = window.start.split(':')
      const candidate = buildTenantDate(
        dateParts.year,
        dateParts.month,
        dateParts.day,
        Number(hoursRaw),
        Number(minutesRaw),
        0,
        timeZone
      )
      if (candidate.getTime() > now.getTime()) {
        return candidate
      }
    }
  }

  return null
}

function isNowWithinWindows(windows: DeliveryAvailabilityWindow[], now: Date, timeZone: string) {
  const nowMinutes = minutesFromTenantDate(now, timeZone)
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
  deliveryAreaInput: ServiceAreaMatchInput | null | undefined,
  deliveryAreaOverride?: ServiceAreaSettings | null
) {
  const area = deliveryAreaOverride ?? settings.deliveryArea
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

function formatCustomerDateTime(value: Date, timeZone: string) {
  return value.toLocaleString('de-DE', {
    day: '2-digit',
    month: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
    timeZone,
  })
}

export function buildDeliveryAvailability(
  input: BuildDeliveryAvailabilityInput
): DeliveryAvailabilityResult {
  const now = input.now ?? new Date()
  const settings = input.settings
  const timeZone = resolveDeliveryAvailabilityTimeZone(input.timeZone)
  const blockingReasons: string[] = []
  const debugReasons: string[] = []

  const todayDeliveryWindows = buildDeliveryWindowsForDate(settings, now, timeZone)
  const hasWindowsToday = todayDeliveryWindows.length > 0
  const isWithinTodayWindow = isNowWithinWindows(todayDeliveryWindows, now, timeZone)
  const nextDeliveryAt = getNextDeliveryAt(settings, now, timeZone)

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

  const effectiveArea = input.deliveryAreaOverride ?? settings.deliveryArea
  const areaEvaluation = resolveAreaBlockingReason(
    settings,
    input.deliveryAreaInput,
    effectiveArea
  )
  if (areaEvaluation.blockingReason) {
    blockingReasons.push(areaEvaluation.blockingReason)
  }
  debugReasons.push(areaEvaluation.debugReason)

  const leadDays = applyCutoff(
    now,
    getBaseLeadDays(settings.timeManagement.deliveryScheduling),
    settings.timeManagement.deliveryScheduling.orderCutoffTime,
    timeZone
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
    customerMessage = `Aktuell geschlossen. Du kannst vorbestellen. Erste Lieferung ab ${formatCustomerDateTime(nextDeliveryAt, timeZone)} Uhr.`
  } else if (nextDeliveryAt) {
    customerMessage = `Aktuell geschlossen. Naechste Lieferung ab ${formatCustomerDateTime(nextDeliveryAt, timeZone)} Uhr moeglich.`
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
    select: {
      id: true,
      name: true,
      email: true,
      businessSettings: true,
      tenantBillingSettings: {
        select: {
          timezone: true,
        },
      },
    },
  })

  if (!tenant) {
    throw new Error('TENANT_NOT_FOUND')
  }

  const settings = parseSettings(tenant.businessSettings, {
    name: tenant.name,
    email: tenant.email,
  })
  const deliveryAreaResolution = resolveEffectiveServiceAreaFromBusinessSettings(
    tenant.businessSettings,
    settings.deliveryArea,
    'deliveryArea'
  )

  const timeZone = resolveDeliveryAvailabilityTimeZone(tenant.tenantBillingSettings?.timezone)
  const now = input?.now ?? new Date()
  const deliveryAvailability = buildDeliveryAvailability({
    settings,
    now,
    deliveryAreaInput: input?.deliveryAreaInput,
    deliveryAreaOverride: deliveryAreaResolution.area,
    timeZone,
  })

  return {
    deliveryAvailability,
    timeZone,
    serverTime: now.toISOString(),
    tenantLocalTime: formatTenantLocalDateTime(now, timeZone),
  }
}
