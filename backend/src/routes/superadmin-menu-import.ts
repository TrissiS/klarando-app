import { Prisma, UserRole } from '@prisma/client'
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

type MenuImportPayload = {
  tenantId?: string
  categories?: Array<{
    name?: string
    products?: Array<{
      name?: string
      productNumber?: string | null
      description?: string | null
      price?: number | null
      confidence?: number
    }>
  }>
}

function parseTenantId(value: unknown) {
  return typeof value === 'string' ? value.trim() : ''
}

router.get('/status', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const model = (process.env.OPENAI_MENU_IMPORT_MODEL || '').trim()
    const hasApiKey = Boolean((process.env.OPENAI_API_KEY || '').trim())
    return res.json({
      model: model || null,
      modelLabel: model || 'Standardmodell aktiv',
      apiConnected: hasApiKey,
      apiKeyPresent: hasApiKey,
    })
  } catch (error) {
    console.error('SUPERADMIN MENU IMPORT STATUS ERROR:', error)
    return res.status(500).json({ error: 'Status konnte nicht geladen werden.' })
  }
})

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
    const message = error instanceof Error ? error.message : 'Unbekannter Fehler'
    return res.status(500).json({ error: `KI-Analyse fehlgeschlagen: ${message}` })
  }
})

router.post('/import', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const body = (req.body || {}) as MenuImportPayload
    const tenantId = parseTenantId(body.tenantId || req.query?.tenantId)
    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId ist erforderlich.' })
    }

    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: { id: true, name: true },
    })
    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden.' })
    }

    const categories = Array.isArray(body.categories) ? body.categories : []
    if (categories.length === 0) {
      return res.status(400).json({ error: 'Keine Importdaten vorhanden.' })
    }

    const preparedProducts: Array<{
      categoryName: string
      name: string
      productNumber: string | null
      description: string | null
      price: number
    }> = []

    for (const category of categories) {
      const categoryName = typeof category.name === 'string' ? category.name.trim() : ''
      if (!categoryName) continue
      const products = Array.isArray(category.products) ? category.products : []
      for (const product of products) {
        const name = typeof product.name === 'string' ? product.name.trim() : ''
        const numberRaw = typeof product.productNumber === 'string' ? product.productNumber.trim() : ''
        const descriptionRaw = typeof product.description === 'string' ? product.description.trim() : ''
        const priceRaw = Number(product.price)
        if (!name || !Number.isFinite(priceRaw) || priceRaw <= 0) continue
        preparedProducts.push({
          categoryName,
          name,
          productNumber: numberRaw || null,
          description: descriptionRaw || null,
          price: Number(priceRaw.toFixed(2)),
        })
      }
    }

    if (preparedProducts.length === 0) {
      return res.status(400).json({ error: 'Keine gültigen Produkte für den Import gefunden.' })
    }

    const duplicateNumbers = preparedProducts
      .map((entry) => entry.productNumber)
      .filter((entry): entry is string => Boolean(entry))
      .filter((entry, index, list) => list.indexOf(entry) !== index)
    if (duplicateNumbers.length > 0) {
      return res.status(409).json({
        error: `Doppelte Produktnummern im Import: ${Array.from(new Set(duplicateNumbers)).join(', ')}`,
      })
    }

    const existingWithNumbers = await prisma.product.findMany({
      where: {
        tenantId,
        productNumber: {
          in: preparedProducts
            .map((entry) => entry.productNumber)
            .filter((entry): entry is string => Boolean(entry)),
        },
      },
      select: { productNumber: true },
    })
    if (existingWithNumbers.length > 0) {
      return res.status(409).json({
        error: `Diese Produktnummern sind bereits vergeben: ${existingWithNumbers
          .map((entry) => entry.productNumber)
          .filter(Boolean)
          .join(', ')}`,
      })
    }

    const result = await prisma.$transaction(async (tx) => {
      const categoryByName = new Map<string, string>()
      const distinctCategories = Array.from(new Set(preparedProducts.map((entry) => entry.categoryName)))
      for (const categoryName of distinctCategories) {
        const existing = await tx.category.findFirst({
          where: {
            tenantId,
            name: { equals: categoryName, mode: Prisma.QueryMode.insensitive },
          },
          select: { id: true },
        })
        if (existing) {
          categoryByName.set(categoryName, existing.id)
          continue
        }
        const created = await tx.category.create({
          data: {
            tenantId,
            name: categoryName,
            sortOrder: 0,
          },
          select: { id: true },
        })
        categoryByName.set(categoryName, created.id)
      }

      let importedCount = 0
      for (const product of preparedProducts) {
        const categoryId = categoryByName.get(product.categoryName) || null
        await tx.product.create({
          data: {
            tenantId,
            categoryId,
            productNumber: product.productNumber,
            name: product.name,
            articleInfo: product.description,
            price: product.price,
            vatRate: 19,
            available: false,
            unitEans: [],
          },
        })
        importedCount += 1
      }
      return { importedCount, categoryCount: distinctCategories.length }
    })

    await writeAuditLog({
      req,
      module: 'superadmin-menu-import',
      action: 'MENU_IMPORT_EXECUTE',
      targetType: 'Tenant',
      targetId: tenant.id,
      tenantId: tenant.id,
      metadata: {
        importedProducts: result.importedCount,
        importedCategories: result.categoryCount,
      },
    })

    return res.status(201).json({
      ok: true,
      importedProducts: result.importedCount,
      importedCategories: result.categoryCount,
      message: `${result.importedCount} Produkte importiert. Produkte sind zunächst nicht aktiv.`,
    })
  } catch (error) {
    console.error('SUPERADMIN MENU IMPORT EXECUTE ERROR:', error)
    const message = error instanceof Error ? error.message : 'Unbekannter Fehler'
    return res.status(500).json({ error: `Import fehlgeschlagen: ${message}` })
  }
})

export default router
