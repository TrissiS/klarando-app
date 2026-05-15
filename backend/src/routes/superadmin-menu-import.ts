import { UserRole } from '@prisma/client'
import multer from 'multer'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requireAuth } from '../middleware/auth'
import { analyzeMenuImages } from '../lib/menu-import-analyzer'
import { writeAuditLog } from '../lib/audit'

const router = Router()

const upload = multer({
  storage: multer.memoryStorage(),
  limits: {
    fileSize: 20 * 1024 * 1024,
    files: 10,
  },
})

const allowedMimeTypes = new Set(['image/jpeg', 'image/jpg', 'image/png', 'image/webp'])

function parseTenantId(value: unknown) {
  return typeof value === 'string' ? value.trim() : ''
}

router.post('/analyze', requireAuth, upload.array('files', 10), async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const tenantId = parseTenantId(req.body?.tenantId || req.query?.tenantId)
    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId ist erforderlich.' })
    }

    const files = (req.files as Express.Multer.File[] | undefined) || []
    if (files.length < 1 || files.length > 10) {
      return res.status(400).json({ error: 'Bitte 1 bis 10 Bilder hochladen.' })
    }

    for (const file of files) {
      if (!allowedMimeTypes.has(file.mimetype)) {
        return res.status(400).json({
          error: 'Nur JPG, PNG oder WEBP sind erlaubt.',
        })
      }
    }

    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: { id: true, name: true },
    })

    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden.' })
    }

    const result = await analyzeMenuImages(
      files.map((file) => ({
        mimeType: file.mimetype,
        fileName: file.originalname || 'upload',
        base64Data: file.buffer.toString('base64'),
      })),
      {
        tenantId: tenant.id,
        tenantName: tenant.name,
      }
    )

    await writeAuditLog({
      req,
      module: 'superadmin-menu-import',
      action: 'MENU_IMPORT_ANALYZE',
      targetType: 'Tenant',
      targetId: tenant.id,
      tenantId: tenant.id,
      metadata: {
        fileCount: files.length,
        fileNames: files.map((file) => file.originalname || null),
      },
    })

    return res.json(result)
  } catch (error) {
    console.error('SUPERADMIN MENU IMPORT ANALYZE ERROR:', error)
    if (error instanceof multer.MulterError && error.code === 'LIMIT_FILE_SIZE') {
      return res.status(413).json({ error: 'Datei ist zu groß (max. 20 MB je Datei).' })
    }
    if (error instanceof Error && error.message.includes('OPENAI_API_KEY')) {
      return res
        .status(500)
        .json({ error: 'KI-Analyse ist noch nicht eingerichtet. OPENAI_API_KEY fehlt.' })
    }
    return res.status(500).json({ error: 'Analyse konnte nicht durchgeführt werden.' })
  }
})

export default router
