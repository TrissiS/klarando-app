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
  analysisResult?: {
    categories?: Array<{
      name?: string
      products?: Array<{
        name?: string
        productNumber?: string | null
        description?: string | null
        price?: number | null
        confidence?: number
        variants?: Array<{
          name?: string
          price?: number | null
          confidence?: number
        }>
        ingredients?: string[]
        allergens?: string[]
        additives?: string[]
        notes?: string | null
      }>
    }>
  }
  categories?: Array<{
    name?: string
    products?: Array<{
      name?: string
      productNumber?: string | null
      description?: string | null
      price?: number | null
      confidence?: number
      variants?: Array<{
        name?: string
        price?: number | null
        confidence?: number
      }>
      ingredients?: string[]
      allergens?: string[]
      additives?: string[]
      notes?: string | null
    }>
  }>
}

function parseTenantId(value: unknown) {
  return typeof value === 'string' ? value.trim() : ''
}

function normalizeIngredientName(value: string): string {
  return value
    .trim()
    .replace(/\s+/g, ' ')
    .replace(/[.,;:]+$/g, '')
}

function toIngredientKey(value: string): string {
  const normalized = normalizeIngredientName(value).toLocaleLowerCase('de-DE')
  const singular = normalized
    .replace(/(en|er|e|n|s)$/i, '')
    .trim()
  return singular || normalized
}

function pushUniqueWarning(list: string[], warning: string) {
  if (!list.includes(warning)) {
    list.push(warning)
  }
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

    const categoriesSource = Array.isArray(body.analysisResult?.categories)
      ? body.analysisResult?.categories
      : body.categories
    const categories = Array.isArray(categoriesSource) ? categoriesSource : []
    if (categories.length === 0) {
      return res.status(400).json({ error: 'Keine Importdaten vorhanden.' })
    }

    const preparedProducts: Array<{
      categoryName: string
      name: string
      productNumber: string | null
      description: string | null
      price: number | null
      confidence: number
      variants: Array<{
        name: string
        price: number | null
      }>
      ingredients: string[]
      allergens: string[]
      additives: string[]
      notes: string | null
      warnings: string[]
    }> = []

    for (const category of categories) {
      const categoryName = typeof category.name === 'string' ? category.name.trim() : ''
      if (!categoryName) continue
      const products = Array.isArray(category.products) ? category.products : []
      for (const product of products) {
        const name = typeof product.name === 'string' ? product.name.trim() : ''
        const numberRaw = typeof product.productNumber === 'string' ? product.productNumber.trim() : ''
        const descriptionRaw = typeof product.description === 'string' ? product.description.trim() : ''
        if (!name) continue
        const priceRaw = product.price === null || product.price === undefined ? null : Number(product.price)
        const confidenceRaw = Number(product.confidence)
        const variantsRaw = Array.isArray(product.variants) ? product.variants : []
        const ingredientsRaw = Array.isArray(product.ingredients) ? product.ingredients : []
        const allergensRaw = Array.isArray(product.allergens) ? product.allergens : []
        const additivesRaw = Array.isArray(product.additives) ? product.additives : []
        const notesRaw = typeof product.notes === 'string' ? product.notes.trim() : null
        const warnings: string[] = []
        if (!Number.isFinite(priceRaw ?? NaN) || (priceRaw ?? 0) <= 0) {
          warnings.push('Preis fehlt – Produkt wurde als Entwurf importiert.')
        }
        if (Number.isFinite(confidenceRaw) && confidenceRaw < 0.85) {
          warnings.push('Bitte prüfen: Produkt-Erkennung unsicher.')
        }
        if (numberRaw) {
          warnings.push('Artikelnummer wird beim Import nicht übernommen.')
        }
        preparedProducts.push({
          categoryName,
          name,
          productNumber: numberRaw || null,
          description: descriptionRaw || null,
          price:
            Number.isFinite(priceRaw ?? NaN) && (priceRaw ?? 0) > 0
              ? Number((priceRaw as number).toFixed(2))
              : null,
          confidence: Number.isFinite(confidenceRaw) ? confidenceRaw : 0,
          variants: variantsRaw
            .map((variant) => {
              const variantName = typeof variant.name === 'string' ? variant.name.trim() : ''
              if (!variantName) return null
              const variantPrice =
                variant.price === null || variant.price === undefined ? null : Number(variant.price)
              return {
                name: variantName,
                price:
                  Number.isFinite(variantPrice ?? NaN) && (variantPrice ?? 0) >= 0
                    ? Number((variantPrice as number).toFixed(2))
                    : null,
              }
            })
            .filter((entry): entry is { name: string; price: number | null } => Boolean(entry)),
          ingredients: ingredientsRaw
            .map((entry) => normalizeIngredientName(String(entry || '')))
            .filter(Boolean),
          allergens: allergensRaw.map((entry) => String(entry || '').trim()).filter(Boolean),
          additives: additivesRaw.map((entry) => String(entry || '').trim()).filter(Boolean),
          notes: notesRaw,
          warnings,
        })
      }
    }

    if (preparedProducts.length === 0) {
      return res.status(400).json({ error: 'Produkt wurde wegen fehlendem Namen übersprungen.' })
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

      const existingIngredients = await tx.ingredient.findMany({
        where: { tenantId },
        select: { id: true, name: true },
      })
      const ingredientByKey = new Map<string, { id: string; name: string }>()
      for (const ingredient of existingIngredients) {
        ingredientByKey.set(toIngredientKey(ingredient.name), ingredient)
      }

      let importedCount = 0
      let createdIngredients = 0
      let reusedIngredients = 0
      let createdVariants = 0
      let productsWithWarnings = 0

      for (const product of preparedProducts) {
        const categoryId = categoryByName.get(product.categoryName) || null
        const extraWarnings: string[] = [...product.warnings]
        const productNotes: string[] = []
        if (product.productNumber) {
          productNotes.push(`Speisekarten-Nummer: ${product.productNumber}`)
        }
        if (product.notes) {
          productNotes.push(product.notes)
        }
        const allergensHint = product.allergens.length > 0 ? `Allergene: ${product.allergens.join(', ')}` : ''
        const additivesHint = product.additives.length > 0 ? `Zusatzstoffe: ${product.additives.join(', ')}` : ''
        if (allergensHint) productNotes.push(allergensHint)
        if (additivesHint) productNotes.push(additivesHint)
        const mergedArticleInfo = [product.description || null, productNotes.join(' | ') || null]
          .filter(Boolean)
          .join('\n')
          .trim()

        const createdProduct = await tx.product.create({
          data: {
            tenantId,
            categoryId,
            productNumber: null,
            name: product.name,
            articleInfo: mergedArticleInfo || null,
            price: product.price ?? 0.01,
            vatRate: 19,
            available: false,
            unitEans: [],
          },
          select: { id: true, price: true },
        })

        if (product.price === null) {
          pushUniqueWarning(extraWarnings, 'Preis fehlt – Produkt wurde als Entwurf importiert.')
        }

        for (const ingredientName of product.ingredients) {
          const key = toIngredientKey(ingredientName)
          let ingredientEntry = ingredientByKey.get(key)
          if (!ingredientEntry) {
            const created = await tx.ingredient.create({
              data: {
                tenantId,
                name: ingredientName,
                category: 'FOOD',
                unit: 'Stk',
                recipeUnit: 'Stk',
                purchasePrice: 0,
                minimumStock: 0,
                consumptionFactorPercent: 0,
                deposit: 0,
                allergens: null,
              },
              select: { id: true, name: true },
            })
            ingredientEntry = created
            ingredientByKey.set(key, created)
            createdIngredients += 1
          } else {
            reusedIngredients += 1
          }

          const existingProductIngredient = await tx.productIngredient.findFirst({
            where: {
              productId: createdProduct.id,
              ingredientId: ingredientEntry.id,
            },
            select: { id: true },
          })
          if (!existingProductIngredient) {
            await tx.productIngredient.create({
              data: {
                productId: createdProduct.id,
                ingredientId: ingredientEntry.id,
                quantity: 1,
              },
            })
          }
        }

        for (const variant of product.variants) {
          const delta = variant.price === null ? 0 : Number((variant.price - Number(createdProduct.price)).toFixed(2))
          await tx.productModifier.create({
            data: {
              tenantId,
              productId: createdProduct.id,
              name: variant.name,
              priceDelta: delta,
              isDefaultSelected: false,
              isActive: true,
              sortOrder: 0,
            },
          })
          createdVariants += 1
        }

        if (extraWarnings.length > 0) {
          productsWithWarnings += 1
        }
        importedCount += 1
      }
      return {
        importedCount,
        categoryCount: distinctCategories.length,
        createdIngredients,
        reusedIngredients,
        createdVariants,
        productsWithWarnings,
      }
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
        createdIngredients: result.createdIngredients,
        reusedIngredients: result.reusedIngredients,
        createdVariants: result.createdVariants,
        productsWithWarnings: result.productsWithWarnings,
      },
    })

    return res.status(201).json({
      ok: true,
      importedProducts: result.importedCount,
      importedCategories: result.categoryCount,
      importedVariants: result.createdVariants,
      createdIngredients: result.createdIngredients,
      reusedIngredients: result.reusedIngredients,
      productsWithWarnings: result.productsWithWarnings,
      message: `${result.importedCount} Produkte importiert. Produkte sind zunächst nicht aktiv.`,
    })
  } catch (error) {
    console.error('SUPERADMIN MENU IMPORT EXECUTE ERROR:', error)
    const message = error instanceof Error ? error.message : 'Unbekannter Fehler'
    return res.status(500).json({ error: `Import fehlgeschlagen: ${message}` })
  }
})

export default router
