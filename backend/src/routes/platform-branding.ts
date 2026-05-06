import { PermissionKey, UserRole } from '@prisma/client'
import { Router } from 'express'
import { writeAuditLog } from '../lib/audit'
import {
  readPlatformBrandingSettings,
  savePlatformBrandingSettings,
} from '../lib/platform-branding'
import { requirePermission } from '../middleware/auth'

const router = Router()

router.get('/', requirePermission(PermissionKey.SETTINGS_READ), async (_req, res) => {
  try {
    const settings = await readPlatformBrandingSettings()
    return res.json(settings)
  } catch (error) {
    console.error('GET PLATFORM BRANDING ERROR:', error)
    return res.status(500).json({ error: 'Branding-Einstellungen konnten nicht geladen werden' })
  }
})

router.put('/', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res
        .status(403)
        .json({ error: 'Nur Superadmin darf zentrale Branding-Einstellungen ändern' })
    }

    const payload =
      req.body && typeof req.body === 'object' && 'settings' in req.body
        ? req.body.settings
        : req.body
    const saved = await savePlatformBrandingSettings(payload)

    await writeAuditLog({
      req,
      module: 'settings',
      action: 'platform_branding_updated',
      targetType: 'platform_branding',
      targetId: 'global',
      tenantId: null,
      metadata: {
        sidebarMode: saved.sidebarMode,
        headerMode: saved.headerMode,
      },
    })

    return res.json(saved)
  } catch (error) {
    console.error('UPDATE PLATFORM BRANDING ERROR:', error)
    return res
      .status(500)
      .json({ error: 'Branding-Einstellungen konnten nicht gespeichert werden' })
  }
})

export default router
