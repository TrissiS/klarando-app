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
