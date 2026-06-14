import { PermissionKey, UserRole } from '@prisma/client'
import { Router } from 'express'
import { writeAuditLog } from '../lib/audit'
import {
  mergePlatformHolidayEntries,
  normalizePlatformHolidayCalendar,
  readPlatformHolidayCalendar,
  savePlatformHolidayCalendar,
} from '../lib/platform-holiday-calendar'
import {
  generateGermanHolidayEntries,
  isSupportedGermanStateCode,
  listSupportedGermanStates,
} from '../lib/german-holidays'
import { requirePermission } from '../middleware/auth'

const router = Router()

function parseImportRowsFromCsv(raw: string) {
  const lines = raw
    .split(/\r?\n/)
    .map((line) => line.trim())
    .filter(Boolean)

  if (lines.length === 0) {
    return [] as Array<Record<string, string>>
  }

  const parseLine = (line: string) =>
    line.split(',').map((cell) => cell.trim().replace(/^"(.*)"$/, '$1'))

  const headers = parseLine(lines[0])
  return lines.slice(1).map((line) => {
    const values = parseLine(line)
    return headers.reduce<Record<string, string>>((acc, header, index) => {
      acc[header] = values[index] ?? ''
      return acc
    }, {})
  })
}

function normalizeIcsTextValue(value: string) {
  return value
    .replace(/\\n/gi, '\n')
    .replace(/\\,/g, ',')
    .replace(/\\;/g, ';')
    .trim()
}

function normalizeIcsDateToIso(raw: string) {
  const value = raw.trim()
  const dateOnlyMatch = value.match(/^(\d{4})(\d{2})(\d{2})$/)
  if (dateOnlyMatch) {
    return `${dateOnlyMatch[1]}-${dateOnlyMatch[2]}-${dateOnlyMatch[3]}`
  }

  const dateTimeMatch = value.match(/^(\d{4})(\d{2})(\d{2})T\d{6}Z?$/i)
  if (dateTimeMatch) {
    return `${dateTimeMatch[1]}-${dateTimeMatch[2]}-${dateTimeMatch[3]}`
  }

  return null
}

function foldIcsLines(raw: string) {
  const normalized = raw.replace(/\r\n/g, '\n').replace(/\r/g, '\n')
  const lines = normalized.split('\n')
  const unfolded: string[] = []

  for (const line of lines) {
    if ((line.startsWith(' ') || line.startsWith('\t')) && unfolded.length > 0) {
      unfolded[unfolded.length - 1] += line.slice(1)
    } else {
      unfolded.push(line)
    }
  }

  return unfolded
}

function createHolidayIdFromImport(name: string, date: string, stateCode: string | null) {
  const slug =
    name
      .trim()
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '')
      .slice(0, 80) || 'holiday'

  return ['ics', date, stateCode?.toLowerCase() || 'nationwide', slug].join('-')
}

function parseHolidayRowsFromIcs(
  raw: string,
  options: {
    stateCode: string | null
    isNationwide: boolean
    countryCode?: string | null
  }
) {
  const rows: Array<Record<string, unknown>> = []
  const lines = foldIcsLines(raw)
  let currentEvent: Record<string, string> | null = null

  for (const line of lines) {
    const trimmed = line.trim()
    if (!trimmed) {
      continue
    }

    if (trimmed.toUpperCase() === 'BEGIN:VEVENT') {
      currentEvent = {}
      continue
    }

    if (trimmed.toUpperCase() === 'END:VEVENT') {
      if (currentEvent) {
        const summary = normalizeIcsTextValue(currentEvent.SUMMARY || '')
        const isoDate = normalizeIcsDateToIso(currentEvent.DTSTART || '')

        if (summary && isoDate) {
          rows.push({
            id: createHolidayIdFromImport(summary, isoDate, options.stateCode),
            name: summary,
            date: isoDate,
            countryCode: options.countryCode || 'DE',
            stateCode: options.isNationwide ? null : options.stateCode,
            regionName: null,
            isNationwide: options.isNationwide,
            active: true,
            repeatsYearly:
              typeof currentEvent.RRULE === 'string' &&
              currentEvent.RRULE.toUpperCase().includes('FREQ=YEARLY'),
            source: 'ICS_IMPORT',
          })
        }
      }

      currentEvent = null
      continue
    }

    if (!currentEvent) {
      continue
    }

    const separatorIndex = trimmed.indexOf(':')
    if (separatorIndex < 0) {
      continue
    }

    const rawKey = trimmed.slice(0, separatorIndex).trim()
    const rawValue = trimmed.slice(separatorIndex + 1).trim()
    const key = rawKey.split(';')[0].trim().toUpperCase()

    if (key === 'SUMMARY' || key === 'DTSTART' || key === 'RRULE') {
      currentEvent[key] = rawValue
    }
  }

  return rows
}

router.get('/germany/options', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  if (req.authUser?.role !== UserRole.SUPERADMIN) {
    return res.status(403).json({ error: 'Nur Superadmin darf Feiertagsoptionen laden' })
  }

  return res.json({
    countryCode: 'DE',
    states: listSupportedGermanStates(),
  })
})

router.get('/', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin darf den Feiertagskalender laden' })
    }

    const holidays = await readPlatformHolidayCalendar()
    return res.json({ holidays })
  } catch (error) {
    console.error('GET PLATFORM HOLIDAYS ERROR:', error)
    return res.status(500).json({ error: 'Feiertagskalender konnte nicht geladen werden' })
  }
})

router.put('/', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res
        .status(403)
        .json({ error: 'Nur Superadmin darf den Feiertagskalender speichern' })
    }

    const payload =
      req.body && typeof req.body === 'object' && 'holidays' in req.body
        ? (req.body as { holidays?: unknown }).holidays
        : req.body

    const saved = await savePlatformHolidayCalendar(payload)

    await writeAuditLog({
      req,
      module: 'settings',
      action: 'platform_holidays_updated',
      targetType: 'platform_holidays',
      targetId: 'global',
      tenantId: null,
      metadata: {
        count: saved.length,
        activeCount: saved.filter((entry) => entry.active).length,
      },
    })

    return res.json({ holidays: saved })
  } catch (error) {
    console.error('UPDATE PLATFORM HOLIDAYS ERROR:', error)
    return res.status(500).json({ error: 'Feiertagskalender konnte nicht gespeichert werden' })
  }
})

router.post('/import/germany', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res
        .status(403)
        .json({ error: 'Nur Superadmin darf deutsche Feiertage importieren' })
    }

    const mode =
      typeof req.body?.mode === 'string' ? req.body.mode.trim().toUpperCase() : 'GENERATE'

    const current = await readPlatformHolidayCalendar()
    let incoming = [] as ReturnType<typeof normalizePlatformHolidayCalendar>

    if (mode === 'GENERATE') {
      const year = Number(req.body?.year)
      if (!Number.isInteger(year) || year < 2000 || year > 2100) {
        return res.status(400).json({ error: 'Jahr muss zwischen 2000 und 2100 liegen' })
      }

      const rawStateCode =
        typeof req.body?.stateCode === 'string' ? req.body.stateCode.trim().toUpperCase() : ''
      const stateCode =
        rawStateCode && isSupportedGermanStateCode(rawStateCode) ? rawStateCode : null
      const includeNationwide = req.body?.includeNationwide !== false

      incoming = generateGermanHolidayEntries({
        year,
        stateCode,
        includeNationwide,
        source: stateCode ? `DE_STATIC_GENERATED_${stateCode}` : 'DE_STATIC_GENERATED',
      })
    } else if (mode === 'JSON') {
      incoming = normalizePlatformHolidayCalendar(req.body?.holidays)
    } else if (mode === 'CSV') {
      const rawCsv = typeof req.body?.csv === 'string' ? req.body.csv : ''
      const csvRows = parseImportRowsFromCsv(rawCsv)
      incoming = normalizePlatformHolidayCalendar(csvRows)
    } else if (mode === 'ICS') {
      const rawIcs = typeof req.body?.ics === 'string' ? req.body.ics : ''
      const rawStateCode =
        typeof req.body?.stateCode === 'string' ? req.body.stateCode.trim().toUpperCase() : ''
      const stateCode =
        rawStateCode && isSupportedGermanStateCode(rawStateCode) ? rawStateCode : null
      const isNationwide = req.body?.isNationwide !== false
      const countryCode =
        typeof req.body?.countryCode === 'string' && req.body.countryCode.trim().length > 0
          ? req.body.countryCode.trim().toUpperCase()
          : 'DE'

      const rows = parseHolidayRowsFromIcs(rawIcs, {
        stateCode,
        isNationwide,
        countryCode,
      })
      incoming = normalizePlatformHolidayCalendar(rows)
    } else {
      return res.status(400).json({ error: 'Unbekannter Importmodus' })
    }

    const merged = mergePlatformHolidayEntries(current, incoming)
    const saved = await savePlatformHolidayCalendar(merged)
    const addedCount = saved.length - current.length

    await writeAuditLog({
      req,
      module: 'settings',
      action: 'platform_holidays_imported',
      targetType: 'platform_holidays',
      targetId: 'global',
      tenantId: null,
      metadata: {
        mode,
        importedCount: incoming.length,
        addedCount,
        totalCount: saved.length,
      },
    })

    return res.json({
      holidays: saved,
      summary: {
        mode,
        importedCount: incoming.length,
        addedCount,
        skippedDuplicates: Math.max(0, incoming.length - addedCount),
        totalCount: saved.length,
      },
    })
  } catch (error) {
    console.error('IMPORT PLATFORM HOLIDAYS GERMANY ERROR:', error)
    return res.status(500).json({ error: 'Deutscher Feiertagsimport konnte nicht ausgeführt werden' })
  }
})

export default router
