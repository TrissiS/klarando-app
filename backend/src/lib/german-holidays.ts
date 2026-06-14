import type { PlatformHolidayEntry } from './platform-holiday-calendar'

export type GermanHolidayImportStateCode =
  | 'BW'
  | 'BY'
  | 'HE'
  | 'NI'
  | 'NW'
  | 'RP'

type HolidayTemplate = {
  key: string
  name: string
  month?: number
  day?: number
  offsetFromEaster?: number
  nationwide: boolean
  states?: GermanHolidayImportStateCode[]
}

const STATE_LABELS: Record<GermanHolidayImportStateCode, string> = {
  BW: 'Baden-Württemberg',
  BY: 'Bayern',
  HE: 'Hessen',
  NI: 'Niedersachsen',
  NW: 'Nordrhein-Westfalen',
  RP: 'Rheinland-Pfalz',
}

const GERMAN_HOLIDAY_TEMPLATES: HolidayTemplate[] = [
  { key: 'new-year', name: 'Neujahr', month: 1, day: 1, nationwide: true },
  { key: 'epiphany', name: 'Heilige Drei Könige', month: 1, day: 6, nationwide: false, states: ['BW', 'BY'] },
  { key: 'good-friday', name: 'Karfreitag', offsetFromEaster: -2, nationwide: true },
  { key: 'easter-monday', name: 'Ostermontag', offsetFromEaster: 1, nationwide: true },
  { key: 'labour-day', name: 'Tag der Arbeit', month: 5, day: 1, nationwide: true },
  { key: 'ascension-day', name: 'Christi Himmelfahrt', offsetFromEaster: 39, nationwide: true },
  { key: 'whit-monday', name: 'Pfingstmontag', offsetFromEaster: 50, nationwide: true },
  { key: 'corpus-christi', name: 'Fronleichnam', offsetFromEaster: 60, nationwide: false, states: ['BW', 'BY', 'HE', 'NW', 'RP'] },
  { key: 'german-unity-day', name: 'Tag der Deutschen Einheit', month: 10, day: 3, nationwide: true },
  { key: 'reformation-day', name: 'Reformationstag', month: 10, day: 31, nationwide: false, states: ['NI'] },
  { key: 'all-saints-day', name: 'Allerheiligen', month: 11, day: 1, nationwide: false, states: ['BW', 'BY', 'NW', 'RP'] },
  { key: 'christmas-day', name: '1. Weihnachtstag', month: 12, day: 25, nationwide: true },
  { key: 'boxing-day', name: '2. Weihnachtstag', month: 12, day: 26, nationwide: true },
]

function pad(value: number) {
  return String(value).padStart(2, '0')
}

function formatIsoDate(date: Date) {
  return `${date.getUTCFullYear()}-${pad(date.getUTCMonth() + 1)}-${pad(date.getUTCDate())}`
}

function addDays(date: Date, days: number) {
  const next = new Date(date.getTime())
  next.setUTCDate(next.getUTCDate() + days)
  return next
}

function calculateEasterSunday(year: number) {
  const a = year % 19
  const b = Math.floor(year / 100)
  const c = year % 100
  const d = Math.floor(b / 4)
  const e = b % 4
  const f = Math.floor((b + 8) / 25)
  const g = Math.floor((b - f + 1) / 3)
  const h = (19 * a + b - d - g + 15) % 30
  const i = Math.floor(c / 4)
  const k = c % 4
  const l = (32 + 2 * e + 2 * i - h - k) % 7
  const m = Math.floor((a + 11 * h + 22 * l) / 451)
  const month = Math.floor((h + l - 7 * m + 114) / 31)
  const day = ((h + l - 7 * m + 114) % 31) + 1
  return new Date(Date.UTC(year, month - 1, day))
}

function buildHolidayDate(year: number, template: HolidayTemplate) {
  if (typeof template.month === 'number' && typeof template.day === 'number') {
    return new Date(Date.UTC(year, template.month - 1, template.day))
  }

  const easterSunday = calculateEasterSunday(year)
  return addDays(easterSunday, template.offsetFromEaster ?? 0)
}

function buildGeneratedHolidayId(
  year: number,
  template: HolidayTemplate,
  stateCode: GermanHolidayImportStateCode | null
) {
  return [
    'de',
    year,
    stateCode ? stateCode.toLowerCase() : 'nationwide',
    template.key,
  ].join('-')
}

export function generateGermanHolidayEntries(params: {
  year: number
  stateCode?: GermanHolidayImportStateCode | null
  includeNationwide?: boolean
  source?: string | null
}) {
  const includeNationwide = params.includeNationwide !== false
  const stateCode = params.stateCode ?? null
  const nowIso = new Date().toISOString()

  return GERMAN_HOLIDAY_TEMPLATES.flatMap((template): PlatformHolidayEntry[] => {
    if (template.nationwide) {
      if (!includeNationwide) {
        return []
      }
      const holidayDate = buildHolidayDate(params.year, template)
      return [
        {
          id: buildGeneratedHolidayId(params.year, template, null),
          name: template.name,
          date: formatIsoDate(holidayDate),
          countryCode: 'DE',
          stateCode: null,
          regionName: null,
          isNationwide: true,
          active: true,
          repeatsYearly: true,
          source: params.source ?? 'DE_STATIC_GENERATED',
          createdAt: nowIso,
          updatedAt: nowIso,
        },
      ]
    }

    if (!stateCode || !template.states?.includes(stateCode)) {
      return []
    }

    const holidayDate = buildHolidayDate(params.year, template)
    return [
      {
        id: buildGeneratedHolidayId(params.year, template, stateCode),
        name: template.name,
        date: formatIsoDate(holidayDate),
        countryCode: 'DE',
        stateCode,
        regionName: STATE_LABELS[stateCode],
        isNationwide: false,
        active: true,
        repeatsYearly: true,
        source: params.source ?? 'DE_STATIC_GENERATED',
        createdAt: nowIso,
        updatedAt: nowIso,
      },
    ]
  })
}

export function isSupportedGermanStateCode(value: string): value is GermanHolidayImportStateCode {
  return value in STATE_LABELS
}

export function listSupportedGermanStates() {
  return Object.entries(STATE_LABELS).map(([code, label]) => ({
    code: code as GermanHolidayImportStateCode,
    label,
  }))
}
