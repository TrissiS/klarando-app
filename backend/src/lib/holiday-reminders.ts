import { InvoiceStatus, MailboxMessageType } from '@prisma/client'
import { prisma } from './prisma'
import { parseSettings } from './business-settings'
import { readPlatformHolidayCalendar, type PlatformHolidayEntry } from './platform-holiday-calendar'

function toIsoDate(date: Date) {
  return `${date.getUTCFullYear()}-${String(date.getUTCMonth() + 1).padStart(2, '0')}-${String(date.getUTCDate()).padStart(2, '0')}`
}

function addUtcDays(date: Date, days: number) {
  const next = new Date(date.getTime())
  next.setUTCDate(next.getUTCDate() + days)
  return next
}

function normalizeUpper(value: string | null | undefined) {
  return typeof value === 'string' && value.trim().length > 0
    ? value.trim().toUpperCase()
    : null
}

function normalizeLower(value: string | null | undefined) {
  return typeof value === 'string' && value.trim().length > 0
    ? value.trim().toLowerCase()
    : null
}

function holidayMatchesTenant(holiday: PlatformHolidayEntry, settings: ReturnType<typeof parseSettings>) {
  if (!holiday.active) {
    return false
  }

  const tenantCountry = normalizeUpper(settings.country)
  const holidayCountry = normalizeUpper(holiday.countryCode)

  if (holidayCountry && tenantCountry && holidayCountry !== tenantCountry && tenantCountry !== 'DEUTSCHLAND') {
    return false
  }

  if (holiday.isNationwide || !holiday.stateCode) {
    return true
  }

  const tenantStateCode = normalizeUpper(settings.stateCode)
  if (tenantStateCode && tenantStateCode === normalizeUpper(holiday.stateCode)) {
    return true
  }

  const tenantRegionName = normalizeLower(settings.regionName)
  const holidayRegionName = normalizeLower(holiday.regionName)
  return Boolean(tenantRegionName && holidayRegionName && tenantRegionName === holidayRegionName)
}

function buildReminderBody(holiday: PlatformHolidayEntry) {
  const localizedDate = new Date(`${holiday.date}T00:00:00.000Z`).toLocaleDateString('de-DE')
  return `Am ${localizedDate} ist ${holiday.name}. Bitte prüfe Lieferzeiten, Öffnungszeiten und gesonderte Lieferpreise.`
}

export async function ensureUpcomingHolidayReminderForTenant(tenantId: string) {
  const tenant = await prisma.tenant.findUnique({
    where: { id: tenantId },
    select: {
      id: true,
      name: true,
      email: true,
      businessSettings: true,
    },
  })

  if (!tenant) {
    return { created: 0 }
  }

  const settings = parseSettings(tenant.businessSettings, {
    name: tenant.name,
    email: tenant.email,
  })
  const targetDate = toIsoDate(addUtcDays(new Date(), 7))
  const holidays = await readPlatformHolidayCalendar()
  const relevantHolidays = holidays.filter(
    (holiday) => holiday.date === targetDate && holidayMatchesTenant(holiday, settings)
  )

  let created = 0

  for (const holiday of relevantHolidays) {
    const title = 'Feiertag nächste Woche'
    const body = buildReminderBody(holiday)
    const actionUrl = '/admin/settings?section=liefergebiete-kosten#delivery-area'

    const existing = await prisma.klarandoMailboxMessage.findFirst({
      where: {
        tenantId,
        messageType: MailboxMessageType.GENERAL,
        title,
        body,
        actionUrl,
        NOT: {
          status: InvoiceStatus.DRAFT,
        },
      },
    })

    if (existing) {
      continue
    }

    await prisma.klarandoMailboxMessage.create({
      data: {
        tenantId,
        messageType: MailboxMessageType.GENERAL,
        title,
        body,
        status: null,
        actionUrl,
        metadata: {
          category: 'HOLIDAY',
          reminderType: 'UPCOMING_HOLIDAY',
          holidayId: holiday.id,
          holidayDate: holiday.date,
          holidayName: holiday.name,
          countryCode: holiday.countryCode,
          stateCode: holiday.stateCode,
          regionName: holiday.regionName,
          generatedAt: new Date().toISOString(),
        },
      },
    })

    created += 1
  }

  return { created }
}
