import { PermissionKey, UserRole } from '@prisma/client'
import { Router } from 'express'
import { writeAuditLog } from '../lib/audit'
import {
  readPlatformHolidayCalendar,
  savePlatformHolidayCalendar,
} from '../lib/platform-holiday-calendar'
import { requirePermission } from '../middleware/auth'

const router = Router()

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

export default router
