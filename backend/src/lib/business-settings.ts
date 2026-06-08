const WEEK_DAYS = [
  'MONDAY',
  'TUESDAY',
  'WEDNESDAY',
  'THURSDAY',
  'FRIDAY',
  'SATURDAY',
  'SUNDAY',
] as const

export const SERVICE_AREA_STRATEGIES = [
  'ZIP_LIST',
  'RADIUS',
  'ZIP_OR_RADIUS',
  'ZIP_AND_RADIUS',
  'POLYGON',
] as const

export type WeekDay = (typeof WEEK_DAYS)[number]
export type ServiceAreaStrategy = (typeof SERVICE_AREA_STRATEGIES)[number]

export type DailyWindow = {
  day: WeekDay
  isClosed: boolean
  open: string | null
  close: string | null
}

export type HolidayWindow = {
  date: string
  label: string | null
  isClosed: boolean
  open: string | null
  close: string | null
}

export type ServiceAreaSettings = {
  enabled: boolean
  strategy: ServiceAreaStrategy
  zipCodes: string[]
  excludedZipCodes: string[]
  excludedStreets: string[]
  radiusKm: number | null
  polygonPath: ServiceAreaPolygonPoint[]
  centerLatitude: number | null
  centerLongitude: number | null
  centerZipCode: string | null
  centerCity: string | null
  centerStreet: string | null
  notes: string | null
}

export type ServiceAreaPolygonPoint = {
  lat: number
  lng: number
}

export type CustomerAppSettings = {
  listingEnabled: boolean
  orderingEnabled: boolean
  guestRegistrationEnabled: boolean
  guestCheckoutEnabled: boolean
  orderHeaderImageUrl: string | null
  localInfoTitle: string | null
  localInfoText: string | null
  listingDisplay: CustomerAppListingDisplaySettings
  navigation: CustomerAppNavigationSettings
}

export type DriverSettings = {
  enabled: boolean
  allowOwnDevice: boolean
  defaultAccessHours: number
  maxActiveOrders: number
  locationTrackingEnabled: boolean
  locationUpdateSeconds: number
  customerLiveTrackingEnabled: boolean
}

export type OrderingAvailabilitySettings = {
  deliveryEnabled: boolean
  pickupEnabled: boolean
  preorderEnabled: boolean
  deliveryPauseEnabled: boolean
  deliveryCutoffMinutesBeforeClose: number
  pickupCutoffMinutesBeforeClose: number
  preorderEarliestTime: string | null
  preorderMaxDays: number
  closingSoonThresholdMinutes: number
  manualNoticeText: string | null
}

export type DeliveryAvailabilityMode =
  | 'IMMEDIATE'
  | 'NEXT_DAY'
  | 'AFTER_DAYS'
  | 'SLOT_ONLY'

export type DeliveryTimeSlot = {
  day: WeekDay
  start: string
  end: string
  maxOrders: number | null
}

export type DeliverySchedulingSettings = {
  deliveryMode: DeliveryAvailabilityMode
  immediateDeliveryEnabled: boolean
  minDaysAhead: number
  orderCutoffTime: string | null
  allowedDeliveryDays: WeekDay[]
  maxPreorderDays: number
  customerHint: string | null
  timeSlots: DeliveryTimeSlot[]
}

export type TimeManagementSettings = {
  openingHours: DailyWindow[]
  deliveryHours: DailyWindow[]
  holidayHours: HolidayWindow[]
  ordering: OrderingAvailabilitySettings
  deliveryScheduling: DeliverySchedulingSettings
}

export type ComplianceSettings = {
  cookieConsentRequired: boolean
  requirePrivacyConsentAtSignup: boolean
  requireTermsConsentAtCheckout: boolean
  orderButtonLabel: string
  dpoEmail: string | null
  securityContactEmail: string | null
  retentionDaysOrders: number | null
  retentionDaysCustomerData: number | null
  retentionDaysLogs: number | null
  enablePseudonymizedAnalytics: boolean
}

export type CustomerAppListingDisplaySettings = {
  showLogo: boolean
  showChainName: boolean
  showAddress: boolean
  showAvailabilityBadges: boolean
  showMinOrderValue: boolean
  showDeliveryFeeNote: boolean
  showDistance: boolean
}

export type CustomerAppNavigationSettings = {
  bottomTabs: CustomerAppMenuItem[]
}

export type CustomerAppMenuItem = {
  id: string
  label: string
  route: string
  enabled: boolean
  sortOrder: number
  children: CustomerAppSubMenuItem[]
}

export type CustomerAppSubMenuItem = {
  id: string
  label: string
  route: string
  enabled: boolean
  sortOrder: number
}

export type OrderIntakeServiceOverrides = {
  deliveryEnabledNow: boolean
  pickupEnabledNow: boolean
  tableOrderingEnabledNow: boolean
}

export type OrderIntakeSettings = {
  orderIntakeEnabled: boolean
  orderIntakePausedReason: string | null
  orderIntakePausedUntil: string | null
  orderIntakePausedByUserId: string | null
  orderIntakePausedAt: string | null
  services: OrderIntakeServiceOverrides
}

export type ServiceFeeMode = 'FIXED' | 'PERCENT'

export type ServiceFeeSettings = {
  enabled: boolean
  mode: ServiceFeeMode
  fixedAmount: string | null
  percent: number | null
  label: string | null
}

export type BusinessSettings = {
  businessName: string | null
  legalName: string | null
  operatorName: string | null
  street: string | null
  zipCode: string | null
  city: string | null
  country: string | null
  phone: string | null
  email: string | null
  website: string | null
  imprintUrl: string | null
  privacyPolicyUrl: string | null
  termsUrl: string | null
  supportEmail: string | null
  accountDeletionEmail: string | null
  vatId: string | null
  taxNumber: string | null
  revenueId: string | null
  taxOffice: string | null
  payoutAccountHolder: string | null
  payoutBankName: string | null
  payoutIban: string | null
  payoutBic: string | null
  payoutEmail: string | null
  payoutReference: string | null
  deliveryFeeNote: string | null
  minOrderValue: string | null
  serviceFee: ServiceFeeSettings
  logoUrl: string | null
  coverImageUrl: string | null
  thumbnailUrl: string | null
  originalFileName: string | null
  openingHours: DailyWindow[]
  holidayHours: HolidayWindow[]
  deliveryHours: DailyWindow[]
  timeManagement: TimeManagementSettings
  deliveryArea: ServiceAreaSettings
  pickupArea: ServiceAreaSettings
  driver: DriverSettings
  ordering: OrderingAvailabilitySettings
  deliveryScheduling: DeliverySchedulingSettings
  customerApp: CustomerAppSettings
  compliance: ComplianceSettings
  orderIntake: OrderIntakeSettings
  notes: string | null
}

export type ServiceAreaMatchInput = {
  zipCode: string | null
  street: string | null
  latitude: number | null
  longitude: number | null
  tenantId?: string | null
}

export type ServiceAreaMatchResult = {
  matched: boolean
  matchedByZip: boolean
  matchedByRadius: boolean
  matchedByPolygon: boolean
  usedZipFallback: boolean
  configurationIncomplete: boolean
  requiresLocation: boolean
  excludedByZip: boolean
  excludedByStreet: boolean
  distanceKm: number | null
}

export function normalizeText(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }

  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

export function normalizeZipCode(value: unknown) {
  const text = normalizeText(value)
  if (!text) {
    return null
  }

  const digitsOnly = text.replace(/[^\d]/g, '')
  if (!/^\d{5}$/.test(digitsOnly)) {
    return null
  }

  return digitsOnly
}

function normalizeTime(value: unknown) {
  const text = normalizeText(value)
  if (!text) {
    return null
  }

  if (!/^\d{2}:\d{2}$/.test(text)) {
    return null
  }

  const [hourRaw, minuteRaw] = text.split(':')
  const hour = Number(hourRaw)
  const minute = Number(minuteRaw)

  if (!Number.isInteger(hour) || !Number.isInteger(minute)) {
    return null
  }

  if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
    return null
  }

  return `${hourRaw}:${minuteRaw}`
}

function normalizeNumeric(value: unknown) {
  if (typeof value === 'number' && Number.isFinite(value)) {
    return value
  }

  if (typeof value === 'string') {
    const trimmed = value.trim()
    if (!trimmed) {
      return null
    }

    const normalized = trimmed.replace(',', '.')
    const parsed = Number(normalized)
    if (Number.isFinite(parsed)) {
      return parsed
    }
  }

  return null
}

function normalizeEmail(value: unknown) {
  const text = normalizeText(value)
  if (!text) {
    return null
  }
  return text.toLowerCase()
}

function normalizeIban(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }

  const normalized = value.replace(/\s+/g, '').toUpperCase()
  if (!/^[A-Z]{2}[A-Z0-9]{13,32}$/.test(normalized)) {
    return null
  }

  return normalized
}

function normalizeBic(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }

  const normalized = value.replace(/\s+/g, '').toUpperCase()
  if (!/^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(normalized)) {
    return null
  }

  return normalized
}

function normalizePublicUrl(value: unknown) {
  const text = normalizeText(value)
  if (!text) {
    return null
  }

  const candidates = text.includes('://') ? [text] : [`https://${text}`]
  try {
    for (const candidate of candidates) {
      const parsed = new URL(candidate)
      if (parsed.protocol === 'http:' || parsed.protocol === 'https:') {
        return parsed.toString()
      }
    }
  } catch {
    // ignore
  }

  return null
}

function normalizeIsoDateTimeString(value: unknown) {
  const text = normalizeText(value)
  if (!text) {
    return null
  }
  const parsed = new Date(text)
  if (Number.isNaN(parsed.getTime())) {
    return null
  }
  return parsed.toISOString()
}

function normalizeCoordinate(value: unknown, min: number, max: number) {
  const parsed = normalizeNumeric(value)
  if (parsed === null || parsed < min || parsed > max) {
    return null
  }

  return Number(parsed.toFixed(6))
}

function normalizeIntegerRange(value: unknown, min: number, max: number) {
  const parsed = normalizeNumeric(value)
  if (parsed === null) {
    return null
  }

  const rounded = Math.round(parsed)
  if (rounded < min || rounded > max) {
    return null
  }

  return rounded
}

function normalizeRadius(value: unknown) {
  const parsed = normalizeNumeric(value)
  if (parsed === null || parsed <= 0 || parsed > 120) {
    return null
  }

  return Number(parsed.toFixed(2))
}

function normalizePolygonPath(value: unknown) {
  if (typeof value === 'string') {
    try {
      const parsed = JSON.parse(value)
      return normalizePolygonPath(parsed)
    } catch {
      return [] as ServiceAreaPolygonPoint[]
    }
  }

  const points: ServiceAreaPolygonPoint[] = []
  const addPoint = (latCandidate: unknown, lngCandidate: unknown) => {
    const lat = normalizeCoordinate(latCandidate, -90, 90)
    const lng = normalizeCoordinate(lngCandidate, -180, 180)
    if (lat === null || lng === null) {
      return
    }
    points.push({ lat, lng })
  }

  const parseEntry = (entry: unknown): void => {
    if (Array.isArray(entry)) {
      if (entry.length >= 2 && !Array.isArray(entry[0])) {
        // Stored Klarando point order: [lat, lng]
        addPoint(entry[0], entry[1])
        return
      }
      for (const nested of entry) {
        parseEntry(nested)
      }
      return
    }

    if (!entry || typeof entry !== 'object') {
      return
    }

    const source = entry as {
      lat?: unknown
      lng?: unknown
      latitude?: unknown
      longitude?: unknown
      type?: unknown
      coordinates?: unknown
      polygonPath?: unknown
      polygonPoints?: unknown
      polygon?: unknown
      deliveryZone?: unknown
      geoJson?: unknown
      geojson?: unknown
      geoJSON?: unknown
    }
    if (typeof source.type === 'string' && source.type.toUpperCase() === 'POLYGON' && Array.isArray(source.coordinates)) {
      parseEntry(source.coordinates)
      return
    }
    if (
      source.lat !== undefined ||
      source.lng !== undefined ||
      source.latitude !== undefined ||
      source.longitude !== undefined
    ) {
      addPoint(
        source.lat !== undefined ? source.lat : source.latitude,
        source.lng !== undefined ? source.lng : source.longitude
      )
      return
    }
    if (Array.isArray(source.polygonPath)) {
      parseEntry(source.polygonPath)
      return
    }
    if (Array.isArray(source.polygonPoints)) {
      parseEntry(source.polygonPoints)
      return
    }
    if (Array.isArray(source.polygon)) {
      parseEntry(source.polygon)
      return
    }
    if (Array.isArray(source.deliveryZone)) {
      parseEntry(source.deliveryZone)
      return
    }
    if (Array.isArray(source.geoJson)) {
      parseEntry(source.geoJson)
      return
    }
    if (Array.isArray(source.geojson)) {
      parseEntry(source.geojson)
      return
    }
    if (Array.isArray(source.geoJSON)) {
      parseEntry(source.geoJSON)
      return
    }
    if (Array.isArray(source.coordinates)) {
      parseEntry(source.coordinates)
    }
  }

  parseEntry(value)

  const normalized = points.filter((entry, index) => {
    const previous = points[index - 1]
    return !previous || previous.lat !== entry.lat || previous.lng !== entry.lng
  })
  if (normalized.length >= 2) {
    const first = normalized[0]
    const last = normalized[normalized.length - 1]
    if (first.lat === last.lat && first.lng === last.lng) {
      normalized.pop()
    }
  }

  return normalized.slice(0, 200)
}

function normalizeUniqueList(items: string[]) {
  return Array.from(new Set(items)).slice(0, 500)
}

function normalizeZipCodeList(value: unknown) {
  const rawItems = Array.isArray(value)
    ? value
    : typeof value === 'string'
      ? value.split(/[\n,;]+/)
      : []

  const cleaned = rawItems
    .map((entry) => normalizeZipCode(entry))
    .filter((entry): entry is string => Boolean(entry))

  return normalizeUniqueList(cleaned)
}

function normalizeStreetToken(value: string) {
  return value.trim().replace(/\s+/g, ' ').toLowerCase()
}

function normalizeStreetList(value: unknown) {
  const rawItems = Array.isArray(value)
    ? value
    : typeof value === 'string'
      ? value.split(/[\n,;]+/)
      : []

  const cleaned = rawItems
    .filter((entry): entry is string => typeof entry === 'string')
    .map((entry) => normalizeStreetToken(entry))
    .filter((entry) => entry.length > 1)

  return normalizeUniqueList(cleaned)
}

function sanitizeMenuId(value: unknown, fallback: string) {
  if (typeof value !== 'string') {
    return fallback
  }

  const normalized = value
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9_-]/g, '')
    .slice(0, 40)

  return normalized || fallback
}

function sanitizeMenuRoute(value: unknown, fallback: string) {
  if (typeof value !== 'string') {
    return fallback
  }

  const trimmed = value.trim()
  if (!trimmed) {
    return fallback
  }

  return trimmed.startsWith('/') ? trimmed : `/${trimmed}`
}

function parseStrategy(value: unknown, fallback: ServiceAreaStrategy): ServiceAreaStrategy {
  if (typeof value !== 'string') {
    return fallback
  }

  const normalized = value.trim().toUpperCase()
  if ((SERVICE_AREA_STRATEGIES as readonly string[]).includes(normalized)) {
    return normalized as ServiceAreaStrategy
  }

  return fallback
}

export function defaultDailyHours() {
  return WEEK_DAYS.map((day) => ({
    day,
    isClosed: false,
    open: '10:00',
    close: '22:00',
  }))
}

export function defaultServiceArea(): ServiceAreaSettings {
  return {
    enabled: true,
    strategy: 'ZIP_LIST',
    zipCodes: [],
    excludedZipCodes: [],
    excludedStreets: [],
    radiusKm: null,
    polygonPath: [],
    centerLatitude: null,
    centerLongitude: null,
    centerZipCode: null,
    centerCity: null,
    centerStreet: null,
    notes: null,
  }
}

export function defaultCustomerAppSettings(): CustomerAppSettings {
  return {
    listingEnabled: false,
    orderingEnabled: false,
    guestRegistrationEnabled: false,
    guestCheckoutEnabled: true,
    orderHeaderImageUrl: null,
    localInfoTitle: null,
    localInfoText: null,
    listingDisplay: {
      showLogo: true,
      showChainName: true,
      showAddress: true,
      showAvailabilityBadges: true,
      showMinOrderValue: true,
      showDeliveryFeeNote: true,
      showDistance: true,
    },
    navigation: {
      bottomTabs: [
        {
          id: 'start',
          label: 'Start',
          route: '/start',
          enabled: true,
          sortOrder: 1,
          children: [],
        },
        {
          id: 'bestellen',
          label: 'Bestellen',
          route: '/bestellen',
          enabled: true,
          sortOrder: 2,
          children: [],
        },
        {
          id: 'meine-bestellungen',
          label: 'Meine Bestellungen',
          route: '/meine-bestellungen',
          enabled: true,
          sortOrder: 3,
          children: [],
        },
        {
          id: 'profil',
          label: 'Profil',
          route: '/profil',
          enabled: true,
          sortOrder: 4,
          children: [],
        },
        {
          id: 'infos',
          label: 'Infos',
          route: '/infos',
          enabled: true,
          sortOrder: 5,
          children: [
            {
              id: 'impressum',
              label: 'Impressum',
              route: '/infos/impressum',
              enabled: true,
              sortOrder: 1,
            },
            {
              id: 'datenschutz',
              label: 'Datenschutz',
              route: '/infos/datenschutz',
              enabled: true,
              sortOrder: 2,
            },
          ],
        },
      ],
    },
  }
}

export function defaultDriverSettings(): DriverSettings {
  return {
    enabled: true,
    allowOwnDevice: true,
    defaultAccessHours: 12,
    maxActiveOrders: 4,
    locationTrackingEnabled: true,
    locationUpdateSeconds: 15,
    customerLiveTrackingEnabled: true,
  }
}

export function defaultOrderingAvailabilitySettings(): OrderingAvailabilitySettings {
  return {
    deliveryEnabled: true,
    pickupEnabled: true,
    preorderEnabled: false,
    deliveryPauseEnabled: false,
    deliveryCutoffMinutesBeforeClose: 30,
    pickupCutoffMinutesBeforeClose: 15,
    preorderEarliestTime: null,
    preorderMaxDays: 3,
    closingSoonThresholdMinutes: 30,
    manualNoticeText: null,
  }
}

export function defaultDeliverySchedulingSettings(): DeliverySchedulingSettings {
  return {
    deliveryMode: 'IMMEDIATE',
    immediateDeliveryEnabled: true,
    minDaysAhead: 0,
    orderCutoffTime: '18:00',
    allowedDeliveryDays: [...WEEK_DAYS],
    maxPreorderDays: 14,
    customerHint: null,
    timeSlots: [
      { day: 'MONDAY', start: '09:00', end: '12:00', maxOrders: null },
      { day: 'MONDAY', start: '12:00', end: '15:00', maxOrders: null },
      { day: 'MONDAY', start: '15:00', end: '18:00', maxOrders: null },
    ],
  }
}

export function defaultTimeManagementSettings(): TimeManagementSettings {
  return {
    openingHours: defaultDailyHours(),
    deliveryHours: defaultDailyHours(),
    holidayHours: [],
    ordering: defaultOrderingAvailabilitySettings(),
    deliveryScheduling: defaultDeliverySchedulingSettings(),
  }
}

export function defaultComplianceSettings(): ComplianceSettings {
  return {
    cookieConsentRequired: true,
    requirePrivacyConsentAtSignup: true,
    requireTermsConsentAtCheckout: true,
    orderButtonLabel: 'zahlungspflichtig bestellen',
    dpoEmail: null,
    securityContactEmail: null,
    retentionDaysOrders: 365,
    retentionDaysCustomerData: 730,
    retentionDaysLogs: 180,
    enablePseudonymizedAnalytics: true,
  }
}

export function defaultOrderIntakeSettings(): OrderIntakeSettings {
  return {
    orderIntakeEnabled: true,
    orderIntakePausedReason: null,
    orderIntakePausedUntil: null,
    orderIntakePausedByUserId: null,
    orderIntakePausedAt: null,
    services: {
      deliveryEnabledNow: true,
      pickupEnabledNow: true,
      tableOrderingEnabledNow: true,
    },
  }
}

export function defaultServiceFeeSettings(): ServiceFeeSettings {
  return {
    enabled: false,
    mode: 'FIXED',
    fixedAmount: null,
    percent: null,
    label: 'Servicegebühr',
  }
}

function sanitizeServiceFeeSettings(value: unknown, fallback: ServiceFeeSettings): ServiceFeeSettings {
  if (!value || typeof value !== 'object') {
    return fallback
  }
  const source = value as Record<string, unknown>
  const parsedMode = normalizeText(source.mode)?.toUpperCase()
  const mode: ServiceFeeMode = parsedMode === 'PERCENT' ? 'PERCENT' : 'FIXED'
  const percentRaw = normalizeNumeric(source.percent)
  const percent =
    percentRaw !== null && percentRaw >= 0 && percentRaw <= 100
      ? Number(percentRaw.toFixed(2))
      : null
  return {
    enabled: typeof source.enabled === 'boolean' ? source.enabled : fallback.enabled,
    mode,
    fixedAmount: normalizeText(source.fixedAmount),
    percent,
    label: normalizeText(source.label) ?? fallback.label,
  }
}

function sanitizeDailyHours(value: unknown, fallback: DailyWindow[]) {
  if (!Array.isArray(value)) {
    return fallback
  }

  const byDay = new Map<WeekDay, DailyWindow>()
  for (const entry of value) {
    if (!entry || typeof entry !== 'object') {
      continue
    }

    const dayRaw = (entry as { day?: unknown }).day
    if (typeof dayRaw !== 'string') {
      continue
    }

    const dayUpper = dayRaw.toUpperCase() as WeekDay
    if (!(WEEK_DAYS as readonly string[]).includes(dayUpper)) {
      continue
    }

    const isClosed = Boolean((entry as { isClosed?: unknown }).isClosed)
    byDay.set(dayUpper, {
      day: dayUpper,
      isClosed,
      open: isClosed ? null : normalizeTime((entry as { open?: unknown }).open),
      close: isClosed ? null : normalizeTime((entry as { close?: unknown }).close),
    })
  }

  return fallback.map((entry) => {
    const next = byDay.get(entry.day)
    if (!next) {
      return entry
    }

    return {
      day: entry.day,
      isClosed: next.isClosed,
      open: next.isClosed ? null : next.open || entry.open,
      close: next.isClosed ? null : next.close || entry.close,
    }
  })
}

function sanitizeHolidayHours(value: unknown) {
  if (!Array.isArray(value)) {
    return [] as HolidayWindow[]
  }

  const items: HolidayWindow[] = []
  for (const entry of value) {
    if (!entry || typeof entry !== 'object') {
      continue
    }

    const dateRaw = normalizeText((entry as { date?: unknown }).date)
    if (!dateRaw || !/^\d{4}-\d{2}-\d{2}$/.test(dateRaw)) {
      continue
    }

    const isClosed = Boolean((entry as { isClosed?: unknown }).isClosed)
    items.push({
      date: dateRaw,
      label: normalizeText((entry as { label?: unknown }).label),
      isClosed,
      open: isClosed ? null : normalizeTime((entry as { open?: unknown }).open),
      close: isClosed ? null : normalizeTime((entry as { close?: unknown }).close),
    })
  }

  return items.slice(0, 200)
}

function sanitizeServiceArea(value: unknown, fallback: ServiceAreaSettings) {
  let source: Record<string, unknown> = {}
  if (value && typeof value === 'object') {
    source = value as Record<string, unknown>
  } else if (typeof value === 'string') {
    try {
      const parsed = JSON.parse(value)
      if (parsed && typeof parsed === 'object') {
        source = parsed as Record<string, unknown>
      }
    } catch {
      source = {}
    }
  }
  const polygonInput =
    source.polygonPath ??
    source.polygonPoints ??
    source.polygon ??
    source.deliveryZone ??
    source.geoJson ??
    source.geojson ??
    source.geoJSON ??
    source.coordinates ??
    null

  const sanitizedArea = {
    enabled:
      typeof source.enabled === 'boolean'
        ? source.enabled
        : fallback.enabled,
    strategy: parseStrategy(source.strategy, fallback.strategy),
    zipCodes: normalizeZipCodeList(source.zipCodes),
    excludedZipCodes: normalizeZipCodeList(source.excludedZipCodes),
    excludedStreets: normalizeStreetList(source.excludedStreets),
    radiusKm: normalizeRadius(source.radiusKm),
    polygonPath: normalizePolygonPath(polygonInput),
    centerLatitude: normalizeCoordinate(source.centerLatitude, -90, 90),
    centerLongitude: normalizeCoordinate(source.centerLongitude, -180, 180),
    centerZipCode: normalizeZipCode(source.centerZipCode),
    centerCity: normalizeText(source.centerCity),
    centerStreet: normalizeText(source.centerStreet),
    notes: normalizeText(source.notes),
  }

  return sanitizedArea
}

export function normalizeServiceAreaStrategy(area: Pick<
  ServiceAreaSettings,
  | 'strategy'
  | 'zipCodes'
  | 'radiusKm'
  | 'polygonPath'
  | 'centerLatitude'
  | 'centerLongitude'
  | 'centerZipCode'
>) {
  const hasZipCodes = area.zipCodes.length > 0
  const hasPolygon = area.polygonPath.length >= 3
  const hasRadius =
    typeof area.radiusKm === 'number' &&
    area.radiusKm > 0 &&
    ((typeof area.centerLatitude === 'number' &&
      typeof area.centerLongitude === 'number') ||
      Boolean(area.centerZipCode))

  if (area.strategy === 'POLYGON') {
    if (hasPolygon) return 'POLYGON' as ServiceAreaStrategy
    if (hasZipCodes) return 'ZIP_LIST' as ServiceAreaStrategy
    if (hasRadius) return 'RADIUS' as ServiceAreaStrategy
    return 'ZIP_LIST' as ServiceAreaStrategy
  }

  if (area.strategy === 'RADIUS') {
    if (hasRadius) return 'RADIUS' as ServiceAreaStrategy
    if (hasZipCodes) return 'ZIP_LIST' as ServiceAreaStrategy
    if (hasPolygon) return 'POLYGON' as ServiceAreaStrategy
    return 'ZIP_LIST' as ServiceAreaStrategy
  }

  if (area.strategy === 'ZIP_OR_RADIUS' || area.strategy === 'ZIP_AND_RADIUS') {
    if (hasZipCodes && hasRadius) return area.strategy
    if (hasZipCodes) return 'ZIP_LIST' as ServiceAreaStrategy
    if (hasRadius) return 'RADIUS' as ServiceAreaStrategy
    if (hasPolygon) return 'POLYGON' as ServiceAreaStrategy
    return 'ZIP_LIST' as ServiceAreaStrategy
  }

  if (area.strategy === 'ZIP_LIST') {
    if (hasZipCodes) return 'ZIP_LIST' as ServiceAreaStrategy
    if (hasRadius) return 'RADIUS' as ServiceAreaStrategy
    if (hasPolygon) return 'POLYGON' as ServiceAreaStrategy
  }

  return area.strategy
}

export function readRawServiceAreaFromBusinessSettings(
  raw: unknown,
  areaKey: 'deliveryArea' | 'pickupArea' = 'deliveryArea'
) {
  let source: Record<string, unknown> | null = null

  if (typeof raw === 'string') {
    try {
      const parsed = JSON.parse(raw)
      source =
        parsed && typeof parsed === 'object'
          ? (parsed as Record<string, unknown>)
          : null
    } catch {
      source = null
    }
  } else if (raw && typeof raw === 'object') {
    source = raw as Record<string, unknown>
  }

  if (!source) {
    return null
  }

  const nestedSettingsSource = (() => {
    if (!source?.settings) {
      return null
    }
    if (typeof source.settings === 'string') {
      try {
        const parsed = JSON.parse(source.settings)
        return parsed && typeof parsed === 'object'
          ? (parsed as Record<string, unknown>)
          : null
      } catch {
        return null
      }
    }
    return typeof source.settings === 'object'
      ? (source.settings as Record<string, unknown>)
      : null
  })()

  const directArea =
    source[areaKey] && typeof source[areaKey] === 'object'
      ? (source[areaKey] as Record<string, unknown>)
      : null
  const nestedArea =
    nestedSettingsSource?.[areaKey] && typeof nestedSettingsSource[areaKey] === 'object'
      ? (nestedSettingsSource[areaKey] as Record<string, unknown>)
      : null

  if (!directArea) {
    return nestedArea
  }

  if (!nestedArea) {
    return directArea
  }

  const directStrategy = parseStrategy(directArea.strategy, 'ZIP_LIST')
  const nestedStrategy = parseStrategy(nestedArea.strategy, 'ZIP_LIST')
  const directZipCodes = normalizeZipCodeList(directArea.zipCodes)
  const nestedZipCodes = normalizeZipCodeList(nestedArea.zipCodes)
  const directPolygonPoints = normalizePolygonPath(
    directArea.polygonPath ??
      directArea.polygonPoints ??
      directArea.polygon ??
      directArea.deliveryZone ??
      directArea.geoJson ??
      directArea.geojson ??
      directArea.geoJSON ??
      directArea.coordinates ??
      null
  ).length
  const nestedPolygonPoints = normalizePolygonPath(
    nestedArea.polygonPath ??
      nestedArea.polygonPoints ??
      nestedArea.polygon ??
      nestedArea.deliveryZone ??
      nestedArea.geoJson ??
      nestedArea.geojson ??
      nestedArea.geoJSON ??
      nestedArea.coordinates ??
      null
  ).length
  const directRadius = normalizeRadius(directArea.radiusKm)
  const nestedRadius = normalizeRadius(nestedArea.radiusKm)

  const directScore =
    (directZipCodes.length > 0 ? 1 : 0) +
    (directPolygonPoints >= 3 ? 1 : 0) +
    (typeof directRadius === 'number' && directRadius > 0 ? 1 : 0)
  const nestedScore =
    (nestedZipCodes.length > 0 ? 1 : 0) +
    (nestedPolygonPoints >= 3 ? 1 : 0) +
    (typeof nestedRadius === 'number' && nestedRadius > 0 ? 1 : 0)

  if (directStrategy === 'POLYGON' && directPolygonPoints >= 3) {
    return directArea
  }

  if (nestedStrategy === 'POLYGON' && nestedPolygonPoints >= 3) {
    return nestedArea
  }

  if (nestedScore > directScore) {
    return nestedArea
  }

  return directArea
}

function detectServiceAreaSource(
  raw: unknown,
  areaKey: 'deliveryArea' | 'pickupArea'
) {
  let source: Record<string, unknown> | null = null

  if (typeof raw === 'string') {
    try {
      const parsed = JSON.parse(raw)
      source =
        parsed && typeof parsed === 'object'
          ? (parsed as Record<string, unknown>)
          : null
    } catch {
      source = null
    }
  } else if (raw && typeof raw === 'object') {
    source = raw as Record<string, unknown>
  }

  if (!source) {
    return 'none'
  }

  const nestedSettingsSource = (() => {
    if (!source?.settings) {
      return null
    }
    if (typeof source.settings === 'string') {
      try {
        const parsed = JSON.parse(source.settings)
        return parsed && typeof parsed === 'object'
          ? (parsed as Record<string, unknown>)
          : null
      } catch {
        return null
      }
    }
    return typeof source.settings === 'object'
      ? (source.settings as Record<string, unknown>)
      : null
  })()

  if (source[areaKey] && typeof source[areaKey] === 'object') {
    return `tenant.businessSettings.${areaKey}`
  }
  if (nestedSettingsSource?.[areaKey] && typeof nestedSettingsSource[areaKey] === 'object') {
    return `tenant.businessSettings.settings.${areaKey}`
  }
  return 'parsedSettings'
}

export function resolveEffectiveServiceAreaFromBusinessSettings(
  rawBusinessSettings: unknown,
  parsedArea: ServiceAreaSettings,
  areaKey: 'deliveryArea' | 'pickupArea' = 'deliveryArea',
  options?: {
    tenantId?: string | null
  }
) {
  const rawArea = readRawServiceAreaFromBusinessSettings(rawBusinessSettings, areaKey)
  const effectiveArea = rawArea ? sanitizeServiceArea(rawArea, parsedArea) : parsedArea
  const source = detectServiceAreaSource(rawBusinessSettings, areaKey)
  const rawPolygonSource =
    rawArea?.polygonPath ??
    rawArea?.polygonPoints ??
    rawArea?.polygon ??
    rawArea?.deliveryZone ??
    rawArea?.geoJson ??
    rawArea?.geojson ??
    rawArea?.geoJSON ??
    rawArea?.coordinates ??
    null
  const normalizedRawPolygon = normalizePolygonPath(rawPolygonSource)

  console.info('EFFECTIVE_SERVICE_AREA_DEBUG', {
    tenantId: options?.tenantId ?? null,
    areaKey,
    source,
    rawArea: rawArea ?? null,
    strategy: effectiveArea.strategy,
    polygonPath: effectiveArea.polygonPath,
    zipCodes: effectiveArea.zipCodes,
    radiusKm: effectiveArea.radiusKm,
    rawPolygonPathPoints: normalizedRawPolygon.length,
    parsedPolygonPathPoints: parsedArea.polygonPath.length,
    effectivePolygonPathPoints: effectiveArea.polygonPath.length,
  })

  console.info('SERVICE_AREA_POLYGON_LOAD_DEBUG', {
    tenantId: options?.tenantId ?? null,
    strategy: effectiveArea.strategy,
    rawPolygonPathPoints: normalizedRawPolygon.length,
    parsedPolygonPathPoints: parsedArea.polygonPath.length,
    effectivePolygonPathPoints: effectiveArea.polygonPath.length,
    rawPolygonPathSample: normalizedRawPolygon.slice(0, 3),
    effectivePolygonPathSample: effectiveArea.polygonPath.slice(0, 3),
  })

  return {
    area: effectiveArea,
    source,
    rawPolygonPathPoints: normalizedRawPolygon.length,
    parsedPolygonPathPoints: parsedArea.polygonPath.length,
    effectivePolygonPathPoints: effectiveArea.polygonPath.length,
  }
}

function sanitizeCustomerAppNavigation(
  value: unknown,
  fallback: CustomerAppNavigationSettings
): CustomerAppNavigationSettings {
  const source = value && typeof value === 'object' ? (value as Record<string, unknown>) : {}
  const rawTabs = Array.isArray(source.bottomTabs) ? source.bottomTabs : fallback.bottomTabs

  const tabs = rawTabs
    .filter((entry): entry is Record<string, unknown> => Boolean(entry && typeof entry === 'object'))
    .map((entry, index) => {
      const fallbackItem = fallback.bottomTabs[index] || fallback.bottomTabs[0]
      const rawChildren = Array.isArray(entry.children) ? entry.children : fallbackItem?.children || []

      return {
        id: sanitizeMenuId(entry.id, fallbackItem?.id || `tab-${index + 1}`),
        label: normalizeText(entry.label) || fallbackItem?.label || `Tab ${index + 1}`,
        route: sanitizeMenuRoute(entry.route, fallbackItem?.route || '/'),
        enabled:
          typeof entry.enabled === 'boolean'
            ? entry.enabled
            : fallbackItem?.enabled ?? true,
        sortOrder:
          typeof entry.sortOrder === 'number' && Number.isFinite(entry.sortOrder)
            ? Math.max(0, Math.round(entry.sortOrder))
            : fallbackItem?.sortOrder ?? index + 1,
        children: rawChildren
          .filter(
            (child): child is Record<string, unknown> => Boolean(child && typeof child === 'object')
          )
          .map((child, childIndex) => ({
            id: sanitizeMenuId(child.id, `sub-${index + 1}-${childIndex + 1}`),
            label: normalizeText(child.label) || `Untermenue ${childIndex + 1}`,
            route: sanitizeMenuRoute(child.route, `/tab-${index + 1}/sub-${childIndex + 1}`),
            enabled:
              typeof child.enabled === 'boolean'
                ? child.enabled
                : true,
            sortOrder:
              typeof child.sortOrder === 'number' && Number.isFinite(child.sortOrder)
                ? Math.max(0, Math.round(child.sortOrder))
                : childIndex + 1,
          }))
          .sort((left, right) => left.sortOrder - right.sortOrder)
          .slice(0, 20),
      }
    })
    .sort((left, right) => left.sortOrder - right.sortOrder)
    .slice(0, 7)

  return {
    bottomTabs: tabs.length > 0 ? tabs : fallback.bottomTabs,
  }
}

function sanitizeCustomerApp(value: unknown, fallback: CustomerAppSettings) {
  const source = value && typeof value === 'object' ? (value as Record<string, unknown>) : {}
  const listingDisplaySource =
    source.listingDisplay && typeof source.listingDisplay === 'object'
      ? (source.listingDisplay as Record<string, unknown>)
      : {}
  const listingDisplayFallback = fallback.listingDisplay

  return {
    listingEnabled:
      typeof source.listingEnabled === 'boolean'
        ? source.listingEnabled
        : fallback.listingEnabled,
    orderingEnabled:
      typeof source.orderingEnabled === 'boolean'
        ? source.orderingEnabled
        : fallback.orderingEnabled,
    guestRegistrationEnabled:
      typeof source.guestRegistrationEnabled === 'boolean'
        ? source.guestRegistrationEnabled
        : fallback.guestRegistrationEnabled,
    guestCheckoutEnabled:
      typeof source.guestCheckoutEnabled === 'boolean'
        ? source.guestCheckoutEnabled
        : fallback.guestCheckoutEnabled,
    orderHeaderImageUrl: normalizeText(source.orderHeaderImageUrl),
    localInfoTitle: normalizeText(source.localInfoTitle),
    localInfoText: normalizeText(source.localInfoText),
    listingDisplay: {
      showLogo:
        typeof listingDisplaySource.showLogo === 'boolean'
          ? listingDisplaySource.showLogo
          : listingDisplayFallback.showLogo,
      showChainName:
        typeof listingDisplaySource.showChainName === 'boolean'
          ? listingDisplaySource.showChainName
          : listingDisplayFallback.showChainName,
      showAddress:
        typeof listingDisplaySource.showAddress === 'boolean'
          ? listingDisplaySource.showAddress
          : listingDisplayFallback.showAddress,
      showAvailabilityBadges:
        typeof listingDisplaySource.showAvailabilityBadges === 'boolean'
          ? listingDisplaySource.showAvailabilityBadges
          : listingDisplayFallback.showAvailabilityBadges,
      showMinOrderValue:
        typeof listingDisplaySource.showMinOrderValue === 'boolean'
          ? listingDisplaySource.showMinOrderValue
          : listingDisplayFallback.showMinOrderValue,
      showDeliveryFeeNote:
        typeof listingDisplaySource.showDeliveryFeeNote === 'boolean'
          ? listingDisplaySource.showDeliveryFeeNote
          : listingDisplayFallback.showDeliveryFeeNote,
      showDistance:
        typeof listingDisplaySource.showDistance === 'boolean'
          ? listingDisplaySource.showDistance
          : listingDisplayFallback.showDistance,
    },
    navigation: sanitizeCustomerAppNavigation(source.navigation, fallback.navigation),
  }
}

function sanitizeCompliance(value: unknown, fallback: ComplianceSettings): ComplianceSettings {
  const source = value && typeof value === 'object' ? (value as Record<string, unknown>) : {}
  const orderButtonLabel =
    normalizeText(source.orderButtonLabel) || fallback.orderButtonLabel

  return {
    cookieConsentRequired:
      typeof source.cookieConsentRequired === 'boolean'
        ? source.cookieConsentRequired
        : fallback.cookieConsentRequired,
    requirePrivacyConsentAtSignup:
      typeof source.requirePrivacyConsentAtSignup === 'boolean'
        ? source.requirePrivacyConsentAtSignup
        : fallback.requirePrivacyConsentAtSignup,
    requireTermsConsentAtCheckout:
      typeof source.requireTermsConsentAtCheckout === 'boolean'
        ? source.requireTermsConsentAtCheckout
        : fallback.requireTermsConsentAtCheckout,
    orderButtonLabel,
    dpoEmail: normalizeEmail(source.dpoEmail),
    securityContactEmail: normalizeEmail(source.securityContactEmail),
    retentionDaysOrders:
      normalizeIntegerRange(source.retentionDaysOrders, 1, 3650) ??
      fallback.retentionDaysOrders,
    retentionDaysCustomerData:
      normalizeIntegerRange(source.retentionDaysCustomerData, 1, 3650) ??
      fallback.retentionDaysCustomerData,
    retentionDaysLogs:
      normalizeIntegerRange(source.retentionDaysLogs, 1, 3650) ??
      fallback.retentionDaysLogs,
    enablePseudonymizedAnalytics:
      typeof source.enablePseudonymizedAnalytics === 'boolean'
        ? source.enablePseudonymizedAnalytics
        : fallback.enablePseudonymizedAnalytics,
  }
}

function sanitizeOrderIntakeSettings(
  value: unknown,
  fallback: OrderIntakeSettings
): OrderIntakeSettings {
  const source = value && typeof value === 'object' ? (value as Record<string, unknown>) : {}
  const rawServices =
    source.services && typeof source.services === 'object'
      ? (source.services as Record<string, unknown>)
      : {}
  const orderIntakeEnabled =
    typeof source.orderIntakeEnabled === 'boolean'
      ? source.orderIntakeEnabled
      : fallback.orderIntakeEnabled

  return {
    orderIntakeEnabled,
    orderIntakePausedReason: normalizeText(source.orderIntakePausedReason),
    orderIntakePausedUntil: normalizeIsoDateTimeString(source.orderIntakePausedUntil),
    orderIntakePausedByUserId: normalizeText(source.orderIntakePausedByUserId),
    orderIntakePausedAt: normalizeIsoDateTimeString(source.orderIntakePausedAt),
    services: {
      deliveryEnabledNow:
        typeof rawServices.deliveryEnabledNow === 'boolean'
          ? rawServices.deliveryEnabledNow
          : orderIntakeEnabled,
      pickupEnabledNow:
        typeof rawServices.pickupEnabledNow === 'boolean'
          ? rawServices.pickupEnabledNow
          : orderIntakeEnabled,
      tableOrderingEnabledNow:
        typeof rawServices.tableOrderingEnabledNow === 'boolean'
          ? rawServices.tableOrderingEnabledNow
          : orderIntakeEnabled,
    },
  }
}

function sanitizeDriverSettings(value: unknown, fallback: DriverSettings): DriverSettings {
  const source = value && typeof value === 'object' ? (value as Record<string, unknown>) : {}

  return {
    enabled:
      typeof source.enabled === 'boolean'
        ? source.enabled
        : fallback.enabled,
    allowOwnDevice:
      typeof source.allowOwnDevice === 'boolean'
        ? source.allowOwnDevice
        : fallback.allowOwnDevice,
    defaultAccessHours:
      normalizeIntegerRange(source.defaultAccessHours, 1, 168) ?? fallback.defaultAccessHours,
    maxActiveOrders:
      normalizeIntegerRange(source.maxActiveOrders, 1, 50) ?? fallback.maxActiveOrders,
    locationTrackingEnabled:
      typeof source.locationTrackingEnabled === 'boolean'
        ? source.locationTrackingEnabled
        : fallback.locationTrackingEnabled,
    locationUpdateSeconds:
      normalizeIntegerRange(source.locationUpdateSeconds, 5, 300) ??
      fallback.locationUpdateSeconds,
    customerLiveTrackingEnabled:
      typeof source.customerLiveTrackingEnabled === 'boolean'
        ? source.customerLiveTrackingEnabled
        : fallback.customerLiveTrackingEnabled,
  }
}

function sanitizeOrderingAvailabilitySettings(
  value: unknown,
  fallback: OrderingAvailabilitySettings
): OrderingAvailabilitySettings {
  const source = value && typeof value === 'object' ? (value as Record<string, unknown>) : {}

  return {
    deliveryEnabled:
      typeof source.deliveryEnabled === 'boolean'
        ? source.deliveryEnabled
        : fallback.deliveryEnabled,
    pickupEnabled:
      typeof source.pickupEnabled === 'boolean'
        ? source.pickupEnabled
        : fallback.pickupEnabled,
    preorderEnabled:
      typeof source.preorderEnabled === 'boolean'
        ? source.preorderEnabled
        : fallback.preorderEnabled,
    deliveryPauseEnabled:
      typeof source.deliveryPauseEnabled === 'boolean'
        ? source.deliveryPauseEnabled
        : fallback.deliveryPauseEnabled,
    deliveryCutoffMinutesBeforeClose:
      normalizeIntegerRange(source.deliveryCutoffMinutesBeforeClose, 0, 360) ??
      fallback.deliveryCutoffMinutesBeforeClose,
    pickupCutoffMinutesBeforeClose:
      normalizeIntegerRange(source.pickupCutoffMinutesBeforeClose, 0, 360) ??
      fallback.pickupCutoffMinutesBeforeClose,
    preorderEarliestTime: normalizeTime(source.preorderEarliestTime),
    preorderMaxDays:
      normalizeIntegerRange(source.preorderMaxDays, 1, 30) ?? fallback.preorderMaxDays,
    closingSoonThresholdMinutes:
      normalizeIntegerRange(source.closingSoonThresholdMinutes, 5, 240) ??
      fallback.closingSoonThresholdMinutes,
    manualNoticeText: normalizeText(source.manualNoticeText),
  }
}

function sanitizeDeliveryMode(
  value: unknown,
  fallback: DeliveryAvailabilityMode
): DeliveryAvailabilityMode {
  if (typeof value !== 'string') {
    return fallback
  }

  const normalized = value.trim().toUpperCase()
  if (
    normalized === 'IMMEDIATE' ||
    normalized === 'NEXT_DAY' ||
    normalized === 'AFTER_DAYS' ||
    normalized === 'SLOT_ONLY'
  ) {
    return normalized
  }

  return fallback
}

function sanitizeAllowedWeekDays(value: unknown, fallback: WeekDay[]) {
  if (!Array.isArray(value)) {
    return fallback
  }

  const validDays = value
    .filter((entry): entry is string => typeof entry === 'string')
    .map((entry) => entry.toUpperCase())
    .filter((entry): entry is WeekDay => (WEEK_DAYS as readonly string[]).includes(entry))

  return validDays.length > 0 ? Array.from(new Set(validDays)) : fallback
}

function sanitizeDeliveryTimeSlots(
  value: unknown,
  fallback: DeliveryTimeSlot[]
): DeliveryTimeSlot[] {
  if (!Array.isArray(value)) {
    return fallback
  }

  const slots = value
    .filter((entry): entry is Record<string, unknown> => Boolean(entry && typeof entry === 'object'))
    .map((entry) => {
      const dayRaw = typeof entry.day === 'string' ? entry.day.toUpperCase() : ''
      if (!(WEEK_DAYS as readonly string[]).includes(dayRaw)) {
        return null
      }

      const start = normalizeTime(entry.start)
      const end = normalizeTime(entry.end)
      if (!start || !end || start >= end) {
        return null
      }

      return {
        day: dayRaw as WeekDay,
        start,
        end,
        maxOrders: normalizeIntegerRange(entry.maxOrders, 1, 1000),
      }
    })
    .filter((entry): entry is DeliveryTimeSlot => Boolean(entry))

  return slots.length > 0 ? slots.slice(0, 100) : fallback
}

function sanitizeDeliverySchedulingSettings(
  value: unknown,
  fallback: DeliverySchedulingSettings
): DeliverySchedulingSettings {
  const source = value && typeof value === 'object' ? (value as Record<string, unknown>) : {}

  return {
    deliveryMode: sanitizeDeliveryMode(source.deliveryMode, fallback.deliveryMode),
    immediateDeliveryEnabled:
      typeof source.immediateDeliveryEnabled === 'boolean'
        ? source.immediateDeliveryEnabled
        : fallback.immediateDeliveryEnabled,
    minDaysAhead: normalizeIntegerRange(source.minDaysAhead, 0, 30) ?? fallback.minDaysAhead,
    orderCutoffTime: normalizeTime(source.orderCutoffTime) ?? fallback.orderCutoffTime,
    allowedDeliveryDays: sanitizeAllowedWeekDays(source.allowedDeliveryDays, fallback.allowedDeliveryDays),
    maxPreorderDays:
      normalizeIntegerRange(source.maxPreorderDays, 1, 90) ?? fallback.maxPreorderDays,
    customerHint: normalizeText(source.customerHint),
    timeSlots: sanitizeDeliveryTimeSlots(source.timeSlots, fallback.timeSlots),
  }
}

function sanitizeTimeManagementSettings(
  value: unknown,
  fallback: TimeManagementSettings,
  legacySource: Record<string, unknown>
): TimeManagementSettings {
  const source = value && typeof value === 'object' ? (value as Record<string, unknown>) : {}

  return {
    openingHours: sanitizeDailyHours(
      source.openingHours ?? legacySource.openingHours,
      fallback.openingHours
    ),
    deliveryHours: sanitizeDailyHours(
      source.deliveryHours ?? legacySource.deliveryHours,
      fallback.deliveryHours
    ),
    holidayHours: sanitizeHolidayHours(source.holidayHours ?? legacySource.holidayHours),
    ordering: sanitizeOrderingAvailabilitySettings(
      source.ordering ?? legacySource.ordering,
      fallback.ordering
    ),
    deliveryScheduling: sanitizeDeliverySchedulingSettings(
      source.deliveryScheduling ?? legacySource.deliveryScheduling,
      fallback.deliveryScheduling
    ),
  }
}

export function synchronizeLegacyTimeFields(settings: BusinessSettings): BusinessSettings {
  return {
    ...settings,
    openingHours: settings.timeManagement.openingHours,
    holidayHours: settings.timeManagement.holidayHours,
    deliveryHours: settings.timeManagement.deliveryHours,
    ordering: settings.timeManagement.ordering,
    deliveryScheduling: settings.timeManagement.deliveryScheduling,
  }
}

export function parseSettings(
  raw: unknown,
  tenantDefaults: { name: string; email: string | null }
): BusinessSettings {
  let source: Record<string, unknown> = {}
  if (raw && typeof raw === 'object') {
    source = raw as Record<string, unknown>
  } else if (typeof raw === 'string') {
    try {
      const parsed = JSON.parse(raw)
      if (parsed && typeof parsed === 'object') {
        source = parsed as Record<string, unknown>
      }
    } catch {
      source = {}
    }
  }
  const defaultArea = defaultServiceArea()
  const defaultCustomerApp = defaultCustomerAppSettings()
  const defaultDriver = defaultDriverSettings()
  const defaultTimeManagement = defaultTimeManagementSettings()
  const defaultCompliance = defaultComplianceSettings()
  const defaultOrderIntake = defaultOrderIntakeSettings()
  const defaultServiceFee = defaultServiceFeeSettings()

  const timeManagement = sanitizeTimeManagementSettings(
    source.timeManagement,
    defaultTimeManagement,
    source
  )

  return {
    businessName: normalizeText(source.businessName) ?? tenantDefaults.name,
    legalName: normalizeText(source.legalName),
    operatorName: normalizeText(source.operatorName),
    street: normalizeText(source.street),
    zipCode: normalizeZipCode(source.zipCode) ?? normalizeText(source.zipCode),
    city: normalizeText(source.city),
    country: normalizeText(source.country) ?? 'Deutschland',
    phone: normalizeText(source.phone),
    email: normalizeEmail(source.email) ?? tenantDefaults.email,
    website: normalizePublicUrl(source.website),
    imprintUrl: normalizePublicUrl(source.imprintUrl),
    privacyPolicyUrl: normalizePublicUrl(source.privacyPolicyUrl),
    termsUrl: normalizePublicUrl(source.termsUrl),
    supportEmail: normalizeEmail(source.supportEmail),
    accountDeletionEmail: normalizeEmail(source.accountDeletionEmail),
    vatId: normalizeText(source.vatId),
    taxNumber: normalizeText(source.taxNumber),
    revenueId: normalizeText(source.revenueId),
    taxOffice: normalizeText(source.taxOffice),
    payoutAccountHolder: normalizeText(source.payoutAccountHolder),
    payoutBankName: normalizeText(source.payoutBankName),
    payoutIban: normalizeIban(source.payoutIban),
    payoutBic: normalizeBic(source.payoutBic),
    payoutEmail: normalizeEmail(source.payoutEmail),
    payoutReference: normalizeText(source.payoutReference),
    deliveryFeeNote: normalizeText(source.deliveryFeeNote),
    minOrderValue: normalizeText(source.minOrderValue),
    serviceFee: sanitizeServiceFeeSettings(source.serviceFee, defaultServiceFee),
    logoUrl: normalizeText(source.logoUrl),
    coverImageUrl: normalizeText(source.coverImageUrl),
    thumbnailUrl: normalizeText(source.thumbnailUrl),
    originalFileName: normalizeText(source.originalFileName),
    openingHours: timeManagement.openingHours,
    holidayHours: timeManagement.holidayHours,
    deliveryHours: timeManagement.deliveryHours,
    timeManagement,
    deliveryArea: sanitizeServiceArea(source.deliveryArea, defaultArea),
    pickupArea: sanitizeServiceArea(source.pickupArea, defaultArea),
    driver: sanitizeDriverSettings(source.driver, defaultDriver),
    ordering: timeManagement.ordering,
    deliveryScheduling: timeManagement.deliveryScheduling,
    customerApp: sanitizeCustomerApp(source.customerApp, defaultCustomerApp),
    compliance: sanitizeCompliance(source.compliance, defaultCompliance),
    orderIntake: sanitizeOrderIntakeSettings(source.orderIntake, defaultOrderIntake),
    notes: normalizeText(source.notes),
  }
}

function toRadians(value: number) {
  return (value * Math.PI) / 180
}

function haversineDistanceKm(
  latitudeA: number,
  longitudeA: number,
  latitudeB: number,
  longitudeB: number
) {
  const earthRadiusKm = 6371
  const dLat = toRadians(latitudeB - latitudeA)
  const dLng = toRadians(longitudeB - longitudeA)
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRadians(latitudeA)) *
      Math.cos(toRadians(latitudeB)) *
      Math.sin(dLng / 2) ** 2

  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
  return earthRadiusKm * c
}

function normalizeStreetForMatch(value: string | null) {
  if (!value) {
    return null
  }

  return value
    .trim()
    .toLowerCase()
    .replace(/[.,]/g, ' ')
    .replace(/\s+/g, ' ')
}

function isPointOnLineSegment(
  latitude: number,
  longitude: number,
  start: ServiceAreaPolygonPoint,
  end: ServiceAreaPolygonPoint
) {
  const epsilon = 1e-9
  const crossProduct =
    (longitude - start.lng) * (end.lat - start.lat) -
    (latitude - start.lat) * (end.lng - start.lng)

  if (Math.abs(crossProduct) > epsilon) {
    return false
  }

  const dotProduct =
    (longitude - start.lng) * (end.lng - start.lng) +
    (latitude - start.lat) * (end.lat - start.lat)
  if (dotProduct < -epsilon) {
    return false
  }

  const squaredLength =
    (end.lng - start.lng) * (end.lng - start.lng) +
    (end.lat - start.lat) * (end.lat - start.lat)

  return dotProduct <= squaredLength + epsilon
}

function isPointInPolygon(
  latitude: number,
  longitude: number,
  polygonPath: ServiceAreaPolygonPoint[]
) {
  let inside = false
  const pointCount = polygonPath.length
  if (pointCount < 3) {
    return false
  }

  for (let i = 0, j = pointCount - 1; i < pointCount; j = i++) {
    const pointI = polygonPath[i]
    const pointJ = polygonPath[j]

    if (isPointOnLineSegment(latitude, longitude, pointI, pointJ)) {
      return true
    }

    const intersect =
      pointI.lng > longitude !== pointJ.lng > longitude &&
      latitude <
        ((pointJ.lat - pointI.lat) * (longitude - pointI.lng)) /
          (pointJ.lng - pointI.lng) +
          pointI.lat

    if (intersect) {
      inside = !inside
    }
  }

  return inside
}

export function matchServiceArea(
  area: ServiceAreaSettings,
  input: ServiceAreaMatchInput
): ServiceAreaMatchResult {
  if (!area.enabled) {
    return {
      matched: false,
      matchedByZip: false,
      matchedByRadius: false,
      matchedByPolygon: false,
      usedZipFallback: false,
      configurationIncomplete: false,
      requiresLocation: false,
      excludedByZip: false,
      excludedByStreet: false,
      distanceKm: null,
    }
  }

  const inputZipRaw = input.zipCode
  const inputZip = normalizeZipCode(input.zipCode)
  const inputStreet = normalizeStreetForMatch(input.street)
  const configuredZipCodesRaw = Array.isArray(area.zipCodes) ? area.zipCodes : []
  const configuredZipCodesNormalized = normalizeZipCodeList(configuredZipCodesRaw)
  const excludedZipCodesNormalized = normalizeZipCodeList(area.excludedZipCodes)

  const excludedByZip = Boolean(
    inputZip && excludedZipCodesNormalized.includes(inputZip)
  )
  const excludedByStreet = Boolean(
    inputStreet &&
      area.excludedStreets.some((blockedStreetToken) =>
        inputStreet.includes(blockedStreetToken)
      )
  )

  console.info('DELIVERY_ZIP_DEBUG', {
    customerZipRaw: inputZipRaw ?? null,
    customerZipNormalized: inputZip,
    configuredZipCodesRaw,
    configuredZipCodesNormalized,
    excludedZipCodesNormalized,
    strategy: area.strategy,
    matchedByZip: Boolean(
      inputZip && configuredZipCodesNormalized.includes(inputZip)
    ),
  })

  if (excludedByZip || excludedByStreet) {
    return {
      matched: false,
      matchedByZip: false,
      matchedByRadius: false,
      matchedByPolygon: false,
      usedZipFallback: false,
      configurationIncomplete: false,
      requiresLocation: false,
      excludedByZip,
      excludedByStreet,
      distanceKm: null,
    }
  }

  const zipRuleConfigured = configuredZipCodesNormalized.length > 0
  const matchedByZip = zipRuleConfigured
    ? Boolean(inputZip && configuredZipCodesNormalized.includes(inputZip))
    : false

  let matchedByRadius = false
  let matchedByPolygon = false
  let usedZipFallback = false
  let configurationIncomplete = false
  let requiresLocation = false
  let distanceKm: number | null = null
  const hasRadius = typeof area.radiusKm === 'number' && area.radiusKm > 0
  const hasCenterCoordinates =
    typeof area.centerLatitude === 'number' &&
    typeof area.centerLongitude === 'number'
  const hasInputCoordinates =
    typeof input.latitude === 'number' && typeof input.longitude === 'number'
  const canUseRadiusByCoordinates = hasRadius && hasCenterCoordinates && hasInputCoordinates
  const canUseRadiusByCenterZip = hasRadius && Boolean(area.centerZipCode && inputZip)
  const radiusConfigured = canUseRadiusByCoordinates || canUseRadiusByCenterZip

  if (canUseRadiusByCoordinates) {
    const calculatedDistanceKm = haversineDistanceKm(
      area.centerLatitude as number,
      area.centerLongitude as number,
      input.latitude as number,
      input.longitude as number
    )
    distanceKm = Number(calculatedDistanceKm.toFixed(2))
    matchedByRadius = calculatedDistanceKm <= (area.radiusKm as number)
  } else if (canUseRadiusByCenterZip && area.centerZipCode === inputZip) {
    matchedByRadius = true
    distanceKm = 0
  }

  const polygonConfigured = area.polygonPath.length >= 3
  if (hasInputCoordinates && polygonConfigured) {
    matchedByPolygon = isPointInPolygon(
      input.latitude as number,
      input.longitude as number,
      area.polygonPath
    )
  }

  if (area.strategy === 'POLYGON' || polygonConfigured) {
    console.info('DELIVERY_POLYGON_DEBUG', {
      tenantId: input.tenantId ?? null,
      customerLat: input.latitude ?? null,
      customerLng: input.longitude ?? null,
      polygonPoints: area.polygonPath.length,
      polygonPath: area.polygonPath,
      matchedByPolygon,
      strategy: area.strategy,
    })
  }

  let matched = false
  if (area.strategy === 'ZIP_LIST') {
    matched = zipRuleConfigured ? matchedByZip : false
    configurationIncomplete = !zipRuleConfigured
  } else if (area.strategy === 'RADIUS') {
    // Fallback: if radius strategy is selected but radius configuration is incomplete,
    // use ZIP matching so a branch is not silently hidden in the app.
    if (radiusConfigured) {
      matched = matchedByRadius
    } else if (zipRuleConfigured) {
      matched = matchedByZip
      usedZipFallback = true
      configurationIncomplete = true
    } else {
      matched = false
      configurationIncomplete = true
    }
  } else if (area.strategy === 'POLYGON') {
    if (polygonConfigured && hasInputCoordinates) {
      matched = matchedByPolygon
    } else if (zipRuleConfigured) {
      matched = matchedByZip
      usedZipFallback = true
      configurationIncomplete = !polygonConfigured
      requiresLocation = polygonConfigured && !hasInputCoordinates
    } else {
      matched = false
      configurationIncomplete = !polygonConfigured
      requiresLocation = polygonConfigured && !hasInputCoordinates
    }
  } else if (area.strategy === 'ZIP_OR_RADIUS') {
    if (!zipRuleConfigured && !radiusConfigured) {
      matched = false
      configurationIncomplete = true
    } else {
      matched = (zipRuleConfigured ? matchedByZip : false) || (radiusConfigured ? matchedByRadius : false)
    }
  } else {
    // ZIP_AND_RADIUS also falls back to ZIP when radius data is missing.
    if (!zipRuleConfigured && !radiusConfigured) {
      matched = false
      configurationIncomplete = true
    } else if (radiusConfigured && zipRuleConfigured) {
      matched = matchedByZip && matchedByRadius
    } else if (zipRuleConfigured) {
      matched = matchedByZip
      configurationIncomplete = true
    } else {
      matched = false
      configurationIncomplete = true
    }
  }

  return {
    matched,
    matchedByZip,
    matchedByRadius,
    matchedByPolygon,
    usedZipFallback,
    configurationIncomplete,
    requiresLocation,
    excludedByZip,
    excludedByStreet,
    distanceKm,
  }
}
