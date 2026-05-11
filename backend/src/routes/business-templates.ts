import { PermissionKey, TemplateAllergenCode, UserRole } from '@prisma/client'
import type { Request, Response } from 'express'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { importBusinessTemplateToTenant } from '../lib/business-template-import'
import { writeAuditLog } from '../lib/audit'

const router = Router()

function isTemplateImportRole(role: UserRole) {
  return role === UserRole.SUPERADMIN || role === UserRole.CHAINADMIN || role === UserRole.ADMIN
}

function ensureSuperadmin(req: Request, res: Response) {
  if (!req.authUser) {
    return { ok: false as const, response: res.status(401).json({ error: 'Nicht eingeloggt' }) }
  }
  if (req.authUser.role !== UserRole.SUPERADMIN) {
    return { ok: false as const, response: res.status(403).json({ error: 'Nur SUPERADMIN erlaubt' }) }
  }
  return { ok: true as const }
}

function toTemplateAllergenCodes(input: unknown): TemplateAllergenCode[] {
  if (!Array.isArray(input)) {
    return []
  }
  const allowed = new Set(Object.values(TemplateAllergenCode))
  return input
    .map((entry) => String(entry).trim())
    .filter((entry): entry is TemplateAllergenCode => allowed.has(entry as TemplateAllergenCode))
}

router.get('/', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const templates = await prisma.businessTemplate.findMany({
      where: {
        isActive: true,
      },
      select: {
        id: true,
        key: true,
        type: true,
        name: true,
        description: true,
        sortOrder: true,
        updatedAt: true,
        _count: {
          select: {
            categories: true,
            ingredients: true,
            products: true,
          },
        },
      },
      orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
    })

    return res.json(templates)
  } catch (error) {
    console.error('GET BUSINESS TEMPLATES ERROR:', error)
    return res.status(500).json({ error: 'Vorlagen konnten nicht geladen werden' })
  }
})

router.get('/:id', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    if (!id) {
      return res.status(400).json({ error: 'Template-ID fehlt' })
    }

    const template = await prisma.businessTemplate.findUnique({
      where: { id },
      include: {
        categories: {
          orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
        },
        ingredients: {
          orderBy: [{ name: 'asc' }],
        },
        products: {
          include: {
            category: true,
            ingredientLinks: {
              include: {
                ingredient: true,
              },
            },
          },
          orderBy: [{ name: 'asc' }],
        },
      },
    })

    if (!template || !template.isActive) {
      return res.status(404).json({ error: 'Vorlage nicht gefunden' })
    }

    return res.json(template)
  } catch (error) {
    console.error('GET BUSINESS TEMPLATE DETAIL ERROR:', error)
    return res.status(500).json({ error: 'Vorlage konnte nicht geladen werden' })
  }
})

router.get('/:id/full', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const auth = ensureSuperadmin(req, res)
    if (!auth.ok) return auth.response
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    if (!id) {
      return res.status(400).json({ error: 'Template-ID fehlt' })
    }

    const template = await prisma.businessTemplate.findUnique({
      where: { id },
      include: {
        categories: {
          orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
        },
        ingredients: {
          orderBy: [{ name: 'asc' }],
        },
        products: {
          include: {
            category: true,
            ingredientLinks: {
              include: {
                ingredient: true,
              },
            },
          },
          orderBy: [{ name: 'asc' }],
        },
      },
    })

    if (!template) {
      return res.status(404).json({ error: 'Vorlage nicht gefunden' })
    }
    return res.json(template)
  } catch (error) {
    console.error('GET BUSINESS TEMPLATE FULL ERROR:', error)
    return res.status(500).json({ error: 'Vollansicht konnte nicht geladen werden' })
  }
})

router.post('/:id/category', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const auth = ensureSuperadmin(req, res)
    if (!auth.ok) return auth.response
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const payload = req.body as { name?: string; sortOrder?: number }
    if (!id || !payload.name?.trim()) {
      return res.status(400).json({ error: 'Template-ID und Kategoriename sind erforderlich' })
    }

    const template = await prisma.businessTemplate.findUnique({ where: { id }, select: { id: true } })
    if (!template) {
      return res.status(404).json({ error: 'Vorlage nicht gefunden' })
    }

    const category = await prisma.businessTemplateCategory.upsert({
      where: {
        templateId_name: {
          templateId: id,
          name: payload.name.trim(),
        },
      },
      update: {
        sortOrder: Number.isFinite(payload.sortOrder) ? Number(payload.sortOrder) : 0,
      },
      create: {
        templateId: id,
        name: payload.name.trim(),
        sortOrder: Number.isFinite(payload.sortOrder) ? Number(payload.sortOrder) : 0,
      },
    })

    return res.status(201).json(category)
  } catch (error) {
    console.error('CREATE TEMPLATE CATEGORY ERROR:', error)
    return res.status(500).json({ error: 'Kategorie konnte nicht erstellt werden' })
  }
})

router.post('/:id/ingredient', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const auth = ensureSuperadmin(req, res)
    if (!auth.ok) return auth.response
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const payload = req.body as {
      name?: string
      unit?: string
      category?: 'FOOD' | 'PACKAGING'
      allergens?: string[]
    }
    if (!id || !payload.name?.trim() || !payload.unit?.trim()) {
      return res.status(400).json({ error: 'Template-ID, Zutatenname und Einheit sind erforderlich' })
    }

    const ingredient = await prisma.businessTemplateIngredient.upsert({
      where: {
        templateId_name: {
          templateId: id,
          name: payload.name.trim(),
        },
      },
      update: {
        unit: payload.unit.trim(),
        category: payload.category === 'PACKAGING' ? 'PACKAGING' : 'FOOD',
        allergens: toTemplateAllergenCodes(payload.allergens),
      },
      create: {
        templateId: id,
        name: payload.name.trim(),
        unit: payload.unit.trim(),
        category: payload.category === 'PACKAGING' ? 'PACKAGING' : 'FOOD',
        purchasePrice: 0,
        minimumStock: 0,
        allergens: toTemplateAllergenCodes(payload.allergens),
      },
    })

    return res.status(201).json(ingredient)
  } catch (error) {
    console.error('CREATE TEMPLATE INGREDIENT ERROR:', error)
    return res.status(500).json({ error: 'Zutat konnte nicht erstellt werden' })
  }
})

router.post('/:id/product', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const auth = ensureSuperadmin(req, res)
    if (!auth.ok) return auth.response
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const payload = req.body as {
      productNumber?: string
      name?: string
      categoryId?: string | null
      price?: number
    }
    if (!id || !payload.productNumber?.trim() || !payload.name?.trim()) {
      return res.status(400).json({ error: 'Template-ID, Produktnummer und Produktname sind erforderlich' })
    }

    const product = await prisma.businessTemplateProduct.upsert({
      where: {
        templateId_productNumber: {
          templateId: id,
          productNumber: payload.productNumber.trim(),
        },
      },
      update: {
        name: payload.name.trim(),
        categoryId: payload.categoryId || null,
        price: Number.isFinite(payload.price) ? Number(payload.price) : 0,
      },
      create: {
        templateId: id,
        productNumber: payload.productNumber.trim(),
        name: payload.name.trim(),
        categoryId: payload.categoryId || null,
        price: Number.isFinite(payload.price) ? Number(payload.price) : 0,
        vatRate: 7,
        available: true,
      },
    })

    return res.status(201).json(product)
  } catch (error) {
    console.error('CREATE TEMPLATE PRODUCT ERROR:', error)
    return res.status(500).json({ error: 'Produkt konnte nicht erstellt werden' })
  }
})

router.post('/:id/product-ingredient', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const auth = ensureSuperadmin(req, res)
    if (!auth.ok) return auth.response
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const payload = req.body as {
      templateProductId?: string
      templateIngredientId?: string
      quantity?: number
    }
    if (!id || !payload.templateProductId || !payload.templateIngredientId) {
      return res.status(400).json({ error: 'Template-ID, Produkt und Zutat sind erforderlich' })
    }

    const link = await prisma.businessTemplateProductIngredient.upsert({
      where: {
        templateProductId_templateIngredientId: {
          templateProductId: payload.templateProductId,
          templateIngredientId: payload.templateIngredientId,
        },
      },
      update: {
        quantity: Number.isFinite(payload.quantity) ? Number(payload.quantity) : 1,
      },
      create: {
        templateProductId: payload.templateProductId,
        templateIngredientId: payload.templateIngredientId,
        quantity: Number.isFinite(payload.quantity) ? Number(payload.quantity) : 1,
      },
    })

    return res.status(201).json(link)
  } catch (error) {
    console.error('CREATE TEMPLATE PRODUCT-INGREDIENT ERROR:', error)
    return res.status(500).json({ error: 'Verknüpfung konnte nicht erstellt werden' })
  }
})

router.post('/:id/import', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const actor = req.authUser
    if (!actor) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    if (!isTemplateImportRole(actor.role)) {
      return res.status(403).json({ error: 'Rolle darf keine Vorlagen importieren' })
    }

    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const payload = req.body as {
      tenantId?: string
      importOptions?: Record<string, unknown>
      importCategories?: unknown
      importProducts?: unknown
      importIngredients?: unknown
      importProductIngredients?: unknown
      importAllergens?: unknown
      importPriceSuggestions?: unknown
      overwriteExisting?: unknown
    }
    const tenantIdInput = payload.tenantId
    if (!id) {
      return res.status(400).json({ error: 'Template-ID fehlt' })
    }

    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string

    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: { id: true, chainId: true, name: true },
    })
    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    if (actor.role === UserRole.CHAINADMIN && actor.chainId && tenant.chainId !== actor.chainId) {
      return res.status(403).json({ error: 'Keine Berechtigung fuer diese Filiale' })
    }

    const result = await importBusinessTemplateToTenant({
      templateId: id,
      tenantId,
      options: {
        importCategories:
          typeof payload.importOptions?.importCategories === 'boolean'
            ? payload.importOptions.importCategories
            : typeof payload.importCategories === 'boolean'
              ? payload.importCategories
              : undefined,
        importProducts:
          typeof payload.importOptions?.importProducts === 'boolean'
            ? payload.importOptions.importProducts
            : typeof payload.importProducts === 'boolean'
              ? payload.importProducts
              : undefined,
        importIngredients:
          typeof payload.importOptions?.importIngredients === 'boolean'
            ? payload.importOptions.importIngredients
            : typeof payload.importIngredients === 'boolean'
              ? payload.importIngredients
              : undefined,
        importProductIngredients:
          typeof payload.importOptions?.importProductIngredients === 'boolean'
            ? payload.importOptions.importProductIngredients
            : typeof payload.importProductIngredients === 'boolean'
              ? payload.importProductIngredients
              : undefined,
        importAllergens:
          typeof payload.importOptions?.importAllergens === 'boolean'
            ? payload.importOptions.importAllergens
            : typeof payload.importAllergens === 'boolean'
              ? payload.importAllergens
              : undefined,
        importPriceSuggestions:
          typeof payload.importOptions?.importPriceSuggestions === 'boolean'
            ? payload.importOptions.importPriceSuggestions
            : typeof payload.importPriceSuggestions === 'boolean'
              ? payload.importPriceSuggestions
              : undefined,
        overwriteExisting:
          typeof payload.importOptions?.overwriteExisting === 'boolean'
            ? payload.importOptions.overwriteExisting
            : typeof payload.overwriteExisting === 'boolean'
              ? payload.overwriteExisting
              : undefined,
      },
    })

    await writeAuditLog({
      req,
      module: 'business_template',
      action: 'business_template_imported',
      targetType: 'tenant',
      targetId: tenant.id,
      tenantId: tenant.id,
      chainId: tenant.chainId,
      metadata: result,
    })

    return res.status(201).json(result)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    if (error instanceof Error && error.message.includes('Vorlage nicht gefunden')) {
      return res.status(404).json({ error: error.message })
    }
    console.error('IMPORT BUSINESS TEMPLATE ERROR:', error)
    return res.status(500).json({ error: 'Vorlage konnte nicht importiert werden' })
  }
})

export default router
