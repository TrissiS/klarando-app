import { promises as fs } from 'fs'
import path from 'path'

export type PlatformHolidayEntry = {
  id: string
  name: string
  date: string
  countryCode: string | null
  stateCode: string | null
  regionName: string | null
  isNationwide: boolean
  active: boolean
  repeatsYearly: boolean
  source: string | null
  createdAt: string
  updatedAt: string
}

const PLATFORM_HOLIDAY_CALENDAR_FILE_PATH = path.resolve(
  __dirname,
  '..',
  '..',
  '..',
  'data',
  'platform-holidays.json'
)

function normalizeText(value: unknown, fallback: string | null = null) {
  if (typeof value !== 'string') {
    return fallback
  }

  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : fallback
}

function normalizeCode(value: unknown, fallback: string | null = null) {
  const normalized = normalizeText(value, fallback)
  return normalized ? normalized.toUpperCase().slice(0, 32) : null
}

function normalizeIsoDate(value: unknown, fallback: string) {
  const raw = normalizeText(value, null)
  if (!raw) {
    return fallback
  }

  const match = raw.match(/^(\d{4})-(\d{2})-(\d{2})$/)
  if (!match) {
    return fallback
  }

  const year = Number(match[1])
  const month = Number(match[2])
  const day = Number(match[3])
  const candidate = new Date(Date.UTC(year, month - 1, day))
  if (
    candidate.getUTCFullYear() !== year ||
    candidate.getUTCMonth() !== month - 1 ||
    candidate.getUTCDate() !== day
  ) {
    return fallback
  }

  return `${match[1]}-${match[2]}-${match[3]}`
}

function normalizeTimestamp(value: unknown, fallback: string) {
  const raw = normalizeText(value, null)
  if (!raw) {
    return fallback
  }

  const parsed = new Date(raw)
  if (Number.isNaN(parsed.getTime())) {
    return fallback
  }

  return parsed.toISOString()
}

function createHolidayId(index: number) {
  return `holiday-${index + 1}`
}

export function normalizePlatformHolidayEntry(
  input: unknown,
  index: number,
  fallbackNow = new Date().toISOString()
): PlatformHolidayEntry | null {
  if (!input || typeof input !== 'object' || Array.isArray(input)) {
    return null
  }

  const source = input as Record<string, unknown>
  const id = normalizeText(source.id, createHolidayId(index))
  const name = normalizeText(source.name, null)
  const date = normalizeIsoDate(source.date, '')

  if (!id || !name || !date) {
    return null
  }

  const createdAt = normalizeTimestamp(source.createdAt, fallbackNow)
  const updatedAt = normalizeTimestamp(source.updatedAt, createdAt)

  return {
    id,
    name,
    date,
    countryCode: normalizeCode(source.countryCode),
    stateCode: normalizeCode(source.stateCode),
    regionName: normalizeText(source.regionName),
    isNationwide: typeof source.isNationwide === 'boolean' ? source.isNationwide : false,
    active: typeof source.active === 'boolean' ? source.active : true,
    repeatsYearly: typeof source.repeatsYearly === 'boolean' ? source.repeatsYearly : false,
    source: normalizeText(source.source),
    createdAt,
    updatedAt,
  }
}

export function normalizePlatformHolidayCalendar(input: unknown) {
  if (!Array.isArray(input)) {
    return [] as PlatformHolidayEntry[]
  }

  const nowIso = new Date().toISOString()
  return input
    .map((entry, index) => normalizePlatformHolidayEntry(entry, index, nowIso))
    .filter((entry): entry is PlatformHolidayEntry => entry !== null)
    .slice(0, 1000)
}

export async function readPlatformHolidayCalendar() {
  try {
    const raw = await fs.readFile(PLATFORM_HOLIDAY_CALENDAR_FILE_PATH, 'utf8')
    const parsed = JSON.parse(raw)
    return normalizePlatformHolidayCalendar(parsed)
  } catch {
    return [] as PlatformHolidayEntry[]
  }
}

export async function savePlatformHolidayCalendar(input: unknown) {
  const current = await readPlatformHolidayCalendar()
  const currentById = new Map(current.map((entry) => [entry.id, entry]))
  const normalized = normalizePlatformHolidayCalendar(input).map((entry) => {
    const existing = currentById.get(entry.id)
    return {
      ...entry,
      createdAt: existing?.createdAt ?? entry.createdAt,
      updatedAt: new Date().toISOString(),
    }
  })

  await fs.mkdir(path.dirname(PLATFORM_HOLIDAY_CALENDAR_FILE_PATH), { recursive: true })
  await fs.writeFile(
    PLATFORM_HOLIDAY_CALENDAR_FILE_PATH,
    JSON.stringify(normalized, null, 2),
    'utf8'
  )

  return normalized
}
