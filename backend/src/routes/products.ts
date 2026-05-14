import { Router } from 'express'
import { PermissionKey, Prisma } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'

const router = Router()
const BEVERAGE_CONTAINER_TYPES = new Set(['NONE', 'EINWEG', 'MEHRWEG'])

type UnitEanEntry = {
  label: string
  ean: string
  unitCount: number
  unitLabel: string | null
}

function normalizeText(value?: string | null) {
  if (value === undefined) {
    return undefined
  }

  if (value === null) {
    return null
  }

  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeEan(value?: string | null) {
  const normalized = normalizeText(value)
  if (normalized === undefined) {
    return undefined
  }
  if (normalized === null) {
    return null
  }

  return normalized.toUpperCase()
}

function normalizeProductNumber(value?: string | null) {
  const normalized = normalizeText(value)
  if (normalized === undefined || normalized === null) {
    return normalized
  }
  return normalized.toUpperCase()
}

function normalizeUnitEans(value: unknown): UnitEanEntry[] {
  if (!Array.isArray(value)) {
    return []
  }

  const output: UnitEanEntry[] = []
  const seen = new Set<string>()

  for (const item of value) {
    if (!item || typeof item !== 'object') {
      continue
    }

    const record = item as Record<string, unknown>
    const label = normalizeText(String(record.label ?? ''))
    const ean = normalizeEan(String(record.ean ?? ''))
    if (!label || !ean) {
      continue
    }

    const unitCountRaw = Number(record.unitCount ?? 1)
    const unitCount =
      Number.isFinite(unitCountRaw) && unitCountRaw > 0
        ? Number(unitCountRaw.toFixed(3))
        : 1
    const unitLabel = normalizeText(
      typeof record.unitLabel === 'string' ? record.unitLabel : null
    )

    const dedupeKey = `${label}::${ean}`
    if (seen.has(dedupeKey)) {
      continue
    }
    seen.add(dedupeKey)

    output.push({
      label,
      ean,
      unitCount,
      unitLabel: unitLabel ?? null,
    })
  }

  return output
}

function normalizeBeverageContainerType(value: unknown) {
  if (typeof value !== 'string') {
    return undefined
  }

  const normalized = value.trim().toUpperCase()
  if (!BEVERAGE_CONTAINER_TYPES.has(normalized)) {
    return undefined
  }

  return normalized as 'NONE' | 'EINWEG' | 'MEHRWEG'
}

function normalizeMoney(value: unknown, fallback = 0) {
  const parsed = Number(value)
  if (!Number.isFinite(parsed) || parsed < 0) {
    return fallback
  }
  return Number(parsed.toFixed(2))
}

function collectAllergens(product: {
  ingredients?: Array<{ ingredient: { allergens: string | null } }>
}) {
  const codes = new Set<string>()

  for (const item of product.ingredients || []) {
    const raw = item.ingredient.allergens

    if (!raw) {
      continue
    }

    raw
      .split(',')
      .map((part) => part.trim().toUpperCase())
      .filter(Boolean)
      .forEach((code) => codes.add(code))
  }

  return Array.from(codes).sort()
}

function mapProductOutput(
  product: {
    ean: string | null
    unitEans: Prisma.JsonValue | null
    deposit?: Prisma.Decimal | number | string | null
    articleInfo?: string | null
    foodBusinessOperator?: string | null
    nutritionInfo?: string | null
    ingredients?: Array<{ ingredient: { allergens: string | null } }>
  } & Record<string, unknown>
) {
  return {
    ...product,
    ean: normalizeEan(product.ean) ?? null,
    unitEans: normalizeUnitEans(product.unitEans),
    deposit: normalizeMoney(product.deposit, 0).toFixed(2),
    articleInfo: normalizeText(product.articleInfo) ?? null,
    foodBusinessOperator: normalizeText(product.foodBusinessOperator) ?? null,
    nutritionInfo: normalizeText(product.nutritionInfo) ?? null,
    allergens: collectAllergens(product),
  }
}

function isMissingProductColumnsError(error: unknown) {
  if (!(error instanceof Error)) {
    return false
  }

  return (
    error.message.includes('Product.beverageContainerType') ||
    error.message.includes('beverageContainerType') ||
    error.message.includes('Product.deposit') ||
    error.message.includes('"deposit"') ||
    error.message.includes('Product.articleInfo') ||
    error.message.includes('"articleInfo"') ||
    error.message.includes('Product.foodBusinessOperator') ||
    error.message.includes('"foodBusinessOperator"') ||
    error.message.includes('Product.nutritionInfo') ||
    error.message.includes('"nutritionInfo"')
  )
}

async function ensureProductColumns() {
  await prisma.$executeRawUnsafe(`
    DO $$
    BEGIN
      IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'BeverageContainerType') THEN
        CREATE TYPE "BeverageContainerType" AS ENUM ('NONE', 'EINWEG', 'MEHRWEG');
      END IF;
    END
    $$;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "beverageContainerType" "BeverageContainerType" NOT NULL DEFAULT 'NONE';
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "deposit" DECIMAL(10, 2) NOT NULL DEFAULT 0;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "articleInfo" TEXT;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "foodBusinessOperator" TEXT;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "nutritionInfo" TEXT;
  `)
}

async function validateCategoryScope(tenantId: string, categoryId: string | null | undefined) {
  if (!categoryId) {
    return true
  }

  const category = await prisma.category.findFirst({
    where: {
      id: categoryId,
      tenantId,
    },
    select: { id: true },
  })

  return Boolean(category)
}

router.get('/', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string
    const availableOnly = req.query.availableOnly === 'true'

    const loadProducts = () =>
      prisma.product.findMany({
        where: {
          tenantId,
          ...(availableOnly ? { available: true } : {}),
        },
        orderBy: { createdAt: 'desc' },
        include: {
          category: true,
          ingredients: {
            include: {
              ingredient: {
                select: {
                  allergens: true,
                },
              },
            },
          },
        },
      })

    let products
    try {
      products = await loadProducts()
    } catch (loadError) {
      if (!isMissingProductColumnsError(loadError)) {
        throw loadError
      }

      await ensureProductColumns()
      products = await loadProducts()
    }

    return res.json(products.map(mapProductOutput))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET PRODUCTS ERROR:', error)
    return res.status(500).json({ error: 'Fehler beim Laden der Produkte' })
  }
})

router.post('/', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const {
      tenantId,
      categoryId,
      productNumber,
      name,
      imageUrl,
      ean,
      unitEans,
      beverageContainerType,
      deposit,
      articleInfo,
      foodBusinessOperator,
      nutritionInfo,
      price,
      vatRate,
      available,
    } = req.body as {
      tenantId?: string
      categoryId?: string | null
      productNumber?: string
      name?: string
      imageUrl?: string | null
      ean?: string | null
      unitEans?: unknown
      beverageContainerType?: string
      deposit?: number
      articleInfo?: string | null
      foodBusinessOperator?: string | null
      nutritionInfo?: string | null
      price?: number
      vatRate?: number
      available?: boolean
    }

    const normalizedProductNumber = normalizeProductNumber(productNumber)
    const normalizedName = normalizeText(name)
    const targetAvailable = available ?? true

    if (!normalizedName || price === undefined) {
      return res.status(400).json({ error: 'Pflichtfelder fehlen' })
    }
    if (targetAvailable && !normalizedProductNumber) {
      return res.status(400).json({
        error: 'Bitte Produktnummer vergeben, bevor der Artikel verkauft werden kann.',
      })
    }
    const scope = await resolveTenantScope(req, tenantId)
    const scopedTenantId = scope.tenantId as string
    const resolvedCategoryId = categoryId || null
    const categoryInScope = await validateCategoryScope(scopedTenantId, resolvedCategoryId)
    if (!categoryInScope) {
      return res.status(400).json({ error: 'Kategorie gehoert nicht zur Filiale' })
    }

    if (normalizedProductNumber) {
      const existingWithProductNumber = await prisma.product.findFirst({
        where: {
          tenantId: scopedTenantId,
          productNumber: normalizedProductNumber,
        },
        select: {
          id: true,
        },
      })

      if (existingWithProductNumber) {
        return res.status(409).json({
          error: 'Diese Produktnummer ist bereits vergeben.',
        })
      }
    }

    const normalizedUnitEans = normalizeUnitEans(unitEans)
    const normalizedContainerType = normalizeBeverageContainerType(beverageContainerType)

    const createProductRecord = () =>
      prisma.product.create({
        data: {
          tenantId: scopedTenantId,
          categoryId: resolvedCategoryId,
          productNumber: normalizedProductNumber ?? null,
          name: normalizedName,
          imageUrl: normalizeText(imageUrl),
          ean: normalizeEan(ean),
          unitEans: normalizedUnitEans as unknown as Prisma.InputJsonValue,
          beverageContainerType: normalizedContainerType ?? 'NONE',
          deposit: normalizeMoney(deposit, 0),
          articleInfo: normalizeText(articleInfo),
          foodBusinessOperator: normalizeText(foodBusinessOperator),
          nutritionInfo: normalizeText(nutritionInfo),
          price: Number(price),
          vatRate: vatRate === undefined ? 19.0 : Number(vatRate),
          available: targetAvailable,
        },
        include: {
          category: true,
          ingredients: {
            include: {
              ingredient: {
                select: {
                  allergens: true,
                },
              },
            },
          },
        },
      })

    let product
    try {
      product = await createProductRecord()
    } catch (createError) {
      if (!isMissingProductColumnsError(createError)) {
        throw createError
      }

      await ensureProductColumns()
      product = await createProductRecord()
    }

    await writeAuditLog({
      req,
      module: 'product',
      action: 'product_created',
      targetType: 'product',
      targetId: product.id,
      tenantId: product.tenantId,
      metadata: {
        productNumber: product.productNumber,
        name: product.name,
        available: product.available,
      },
    })

    return res.status(201).json(mapProductOutput(product))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('CREATE PRODUCT ERROR:', error)
    return res.status(500).json({ error: 'Fehler beim Erstellen des Produkts' })
  }
})

router.put('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const {
      name,
      productNumber,
      imageUrl,
      ean,
      unitEans,
      beverageContainerType,
      deposit,
      articleInfo,
      foodBusinessOperator,
      nutritionInfo,
      price,
      vatRate,
      categoryId,
      available,
    } = req.body as {
      name?: string
      imageUrl?: string | null
      ean?: string | null
      unitEans?: unknown
      beverageContainerType?: string
      deposit?: number
      articleInfo?: string | null
      foodBusinessOperator?: string | null
      nutritionInfo?: string | null
      price?: number
      vatRate?: number
      categoryId?: string | null
      available?: boolean
      productNumber?: string | null
    }

    if (!id) {
      return res.status(400).json({ error: 'Produkt-ID fehlt' })
    }

    const existingProduct = await prisma.product.findUnique({
      where: { id },
      select: {
        id: true,
        tenantId: true,
        available: true,
        productNumber: true,
      },
    })
    if (!existingProduct) {
      return res.status(404).json({ error: 'Produkt nicht gefunden' })
    }
    await resolveTenantScope(req, existingProduct.tenantId)

    if (categoryId !== undefined) {
      const resolvedCategoryId = categoryId || null
      const categoryInScope = await validateCategoryScope(existingProduct.tenantId, resolvedCategoryId)
      if (!categoryInScope) {
        return res.status(400).json({ error: 'Kategorie gehoert nicht zur Filiale' })
      }
    }

    const normalizedUnitEans = unitEans === undefined ? undefined : normalizeUnitEans(unitEans)
    const normalizedContainerType = normalizeBeverageContainerType(beverageContainerType)
    const normalizedProductNumber = normalizeProductNumber(productNumber)
    const existingNormalizedProductNumber = normalizeProductNumber(existingProduct.productNumber)
    const targetAvailable = available ?? existingProduct.available
    const targetProductNumber =
      productNumber === undefined
        ? existingNormalizedProductNumber
        : normalizedProductNumber

    if (targetAvailable && !targetProductNumber) {
      return res.status(400).json({
        error: 'Bitte Produktnummer vergeben, bevor der Artikel verkauft werden kann.',
      })
    }

    if (
      existingNormalizedProductNumber &&
      productNumber !== undefined &&
      normalizedProductNumber !== existingNormalizedProductNumber
    ) {
      return res.status(409).json({
        error: 'Produktnummer kann nach Vergabe nicht mehr geändert werden.',
      })
    }

    if (normalizedProductNumber) {
      const existingWithProductNumber = await prisma.product.findFirst({
        where: {
          tenantId: existingProduct.tenantId,
          productNumber: normalizedProductNumber,
          NOT: { id },
        },
        select: {
          id: true,
        },
      })

      if (existingWithProductNumber) {
        return res.status(409).json({
          error: 'Diese Produktnummer ist bereits vergeben.',
        })
      }
    }

    const updateProductRecord = () =>
      prisma.product.update({
        where: { id },
        data: {
          name,
          imageUrl: normalizeText(imageUrl),
          ean: normalizeEan(ean),
          beverageContainerType:
            beverageContainerType === undefined ? undefined : (normalizedContainerType ?? 'NONE'),
          unitEans:
            normalizedUnitEans === undefined
              ? undefined
              : (normalizedUnitEans as unknown as Prisma.InputJsonValue),
          deposit: deposit === undefined ? undefined : normalizeMoney(deposit, 0),
          articleInfo: articleInfo === undefined ? undefined : normalizeText(articleInfo),
          foodBusinessOperator:
            foodBusinessOperator === undefined ? undefined : normalizeText(foodBusinessOperator),
          nutritionInfo: nutritionInfo === undefined ? undefined : normalizeText(nutritionInfo),
          productNumber:
            productNumber === undefined ? undefined : (normalizedProductNumber ?? null),
          price: price === undefined ? undefined : Number(price),
          vatRate: vatRate === undefined ? undefined : Number(vatRate),
          categoryId: categoryId === undefined ? undefined : categoryId || null,
          available,
        },
        include: {
          category: true,
          ingredients: {
            include: {
              ingredient: {
                select: {
                  allergens: true,
                },
              },
            },
          },
        },
      })

    let product
    try {
      product = await updateProductRecord()
    } catch (updateError) {
      if (!isMissingProductColumnsError(updateError)) {
        throw updateError
      }

      await ensureProductColumns()
      product = await updateProductRecord()
    }

    await writeAuditLog({
      req,
      module: 'product',
      action: 'product_updated',
      targetType: 'product',
      targetId: product.id,
      tenantId: product.tenantId,
      metadata: {
        name: product.name,
        available: product.available,
      },
    })

    return res.json(mapProductOutput(product))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE PRODUCT ERROR:', error)
    return res.status(500).json({ error: 'Produkt konnte nicht aktualisiert werden' })
  }
})

router.delete('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const tenantIdInput = req.query.tenantId

    if (!id || !tenantIdInput) {
      return res.status(400).json({ error: 'Produkt-ID oder tenantId fehlt' })
    }
    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string

    const existing = await prisma.product.findUnique({
      where: { id },
      select: {
        id: true,
        tenantId: true,
        name: true,
        productNumber: true,
      },
    })

    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Produkt nicht gefunden' })
    }

    const orderItemCount = await prisma.orderItem.count({
      where: { productId: id },
    })

    if (orderItemCount > 0) {
      return res.status(409).json({
        error: 'Produkt wird bereits in Bestellungen verwendet und kann nicht geloescht werden',
        orderItemCount,
      })
    }

    await prisma.product.delete({
      where: { id },
    })

    await writeAuditLog({
      req,
      module: 'product',
      action: 'product_deleted',
      targetType: 'product',
      targetId: existing.id,
      tenantId: existing.tenantId,
      metadata: {
        productNumber: existing.productNumber,
        name: existing.name,
      },
    })

    return res.json({ ok: true })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DELETE PRODUCT ERROR:', error)
    return res.status(500).json({ error: 'Produkt konnte nicht geloescht werden' })
  }
})

export default router
