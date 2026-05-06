import { Router } from 'express'
import { PermissionKey, Prisma } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'

const router = Router()

type UnitEanEntry = {
  label: string
  ean: string
  unitCount: number
  unitLabel: string | null
}

type IngredientCategory = 'FOOD' | 'PACKAGING'

function normalizeAllergens(input?: string | null) {
  if (!input) {
    return null
  }

  const unique = Array.from(
    new Set(
      input
        .split(',')
        .map((part) => part.trim().toUpperCase())
        .filter(Boolean)
    )
  )

  return unique.length > 0 ? unique.join(',') : null
}

function normalizeText(input?: string | null) {
  if (!input) {
    return null
  }

  const trimmed = input.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeEan(input?: string | null) {
  const value = normalizeText(input)
  return value ? value.toUpperCase() : null
}

function normalizeIngredientCategory(value: unknown): IngredientCategory {
  if (typeof value !== 'string') {
    return 'FOOD'
  }

  const normalized = value.trim().toUpperCase()
  if (normalized === 'PACKAGING') {
    return 'PACKAGING'
  }

  return 'FOOD'
}

const INTEGER_ONLY_UNITS = new Set(['Stueck', 'Dose'])

function isIntegerOnlyUnit(unit?: string | null) {
  return Boolean(unit && INTEGER_ONLY_UNITS.has(unit))
}

function parseOptionalPositiveNumber(value: unknown) {
  if (value === undefined) {
    return { ok: true, value: undefined as number | null | undefined }
  }

  if (value === null || value === '') {
    return { ok: true, value: null as number | null | undefined }
  }

  const parsed = Number(value)
  if (!Number.isFinite(parsed) || parsed <= 0) {
    return { ok: false, value: null as number | null | undefined }
  }

  return { ok: true, value: Number(parsed.toFixed(3)) as number | null | undefined }
}

function parseOptionalNonNegativeNumber(
  value: unknown,
  options?: { integerOnly?: boolean }
) {
  if (value === undefined) {
    return { ok: true, value: undefined as number | undefined }
  }

  if (value === null || value === '') {
    return { ok: true, value: 0 as number }
  }

  const parsed = Number(value)
  if (!Number.isFinite(parsed) || parsed < 0) {
    return { ok: false, value: undefined as number | undefined }
  }

  if (options?.integerOnly && !Number.isInteger(parsed)) {
    return { ok: false, value: undefined as number | undefined }
  }

  return { ok: true, value: Number(parsed.toFixed(3)) as number }
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

async function ensureSupplierExists(tenantId: string, supplierName: string | null) {
  if (!supplierName) {
    return
  }

  await prisma.supplier.upsert({
    where: {
      tenantId_name: {
        tenantId,
        name: supplierName,
      },
    },
    update: {},
    create: {
      tenantId,
      name: supplierName,
    },
  })
}

function mapIngredientOutput(
  ingredient: {
    ean: string | null
    unitEans: Prisma.JsonValue | null
  } & Record<string, unknown>
) {
  const unit = typeof ingredient.unit === 'string' ? ingredient.unit : null
  const minimumStockRaw = Number(ingredient.minimumStock ?? 0)
  const minimumStock = Number.isFinite(minimumStockRaw)
    ? isIntegerOnlyUnit(unit)
      ? Math.round(minimumStockRaw)
      : Number(minimumStockRaw.toFixed(3))
    : 0

  return {
    ...ingredient,
    minimumStock,
    ean: normalizeEan(ingredient.ean) ?? null,
    unitEans: normalizeUnitEans(ingredient.unitEans),
  }
}

router.get('/', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string

    const ingredients = await prisma.ingredient.findMany({
      where: { tenantId },
      orderBy: { createdAt: 'desc' },
    })

    return res.json(ingredients.map(mapIngredientOutput))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error(error)
    return res.status(500).json({ error: 'Fehler beim Laden der Zutaten' })
  }
})

router.post('/', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const {
      tenantId,
      name,
      unit,
      recipeUnit,
      gramsPerPurchaseUnit,
      purchasePrice,
      deposit,
      consumptionFactorPercent,
      minimumStock,
      ean,
      unitEans,
      supplier,
      articleNumber,
      allergens,
      category,
    } = req.body as {
      tenantId?: string
      name?: string
      unit?: string
      recipeUnit?: string | null
      gramsPerPurchaseUnit?: number | null
      purchasePrice?: number
      deposit?: number
      consumptionFactorPercent?: number | null
      minimumStock?: number | null
      ean?: string | null
      unitEans?: unknown
      supplier?: string
      articleNumber?: string
      allergens?: string
      category?: string
    }

    if (!name || !unit || purchasePrice === undefined) {
      return res.status(400).json({ error: 'Pflichtfelder fehlen' })
    }
    const scope = await resolveTenantScope(req, tenantId)
    const scopedTenantId = scope.tenantId as string

    const normalizedUnit = normalizeText(unit) ?? unit
    const integerOnlyMinimumStock = isIntegerOnlyUnit(normalizedUnit)

    const normalizedSupplier = normalizeText(supplier)
    await ensureSupplierExists(scopedTenantId, normalizedSupplier)

    const parsedGramsPerPurchaseUnit = parseOptionalPositiveNumber(gramsPerPurchaseUnit)
    if (!parsedGramsPerPurchaseUnit.ok) {
      return res.status(400).json({ error: 'gramsPerPurchaseUnit muss groesser als 0 sein' })
    }
    const parsedMinimumStock = parseOptionalNonNegativeNumber(minimumStock, {
      integerOnly: integerOnlyMinimumStock,
    })
    if (!parsedMinimumStock.ok) {
      return res.status(400).json({
        error: integerOnlyMinimumStock
          ? 'minimumStock muss bei Stueck/Dose eine ganze Zahl >= 0 sein'
          : 'minimumStock muss >= 0 sein',
      })
    }
    const parsedConsumptionFactorPercent = parseOptionalNonNegativeNumber(consumptionFactorPercent)
    if (!parsedConsumptionFactorPercent.ok) {
      return res
        .status(400)
        .json({ error: 'consumptionFactorPercent muss >= 0 sein' })
    }

    const normalizedUnitEans = normalizeUnitEans(unitEans)
    const ingredient = await prisma.ingredient.create({
      data: {
        tenantId: scopedTenantId,
        name,
        unit: normalizedUnit,
        recipeUnit: normalizeText(recipeUnit) ?? normalizedUnit,
        gramsPerPurchaseUnit:
          parsedGramsPerPurchaseUnit.value === undefined
            ? null
            : parsedGramsPerPurchaseUnit.value,
        purchasePrice: Number(purchasePrice),
        consumptionFactorPercent: parsedConsumptionFactorPercent.value ?? 0,
        minimumStock: parsedMinimumStock.value ?? 0,
        deposit: deposit ? Number(deposit) : 0,
        ean: normalizeEan(ean),
        unitEans: normalizedUnitEans as unknown as Prisma.InputJsonValue,
        supplier: normalizedSupplier,
        articleNumber: normalizeText(articleNumber),
        allergens: normalizeAllergens(allergens),
        category: normalizeIngredientCategory(category),
      },
    })

    await writeAuditLog({
      req,
      module: 'ingredient',
      action: 'ingredient_created',
      targetType: 'ingredient',
      targetId: ingredient.id,
      tenantId: ingredient.tenantId,
      metadata: {
        name: ingredient.name,
        allergens: ingredient.allergens,
        category: ingredient.category,
        minimumStock: ingredient.minimumStock,
        consumptionFactorPercent: ingredient.consumptionFactorPercent,
      },
    })

    return res.status(201).json(mapIngredientOutput(ingredient))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error(error)
    return res.status(500).json({ error: 'Fehler beim Erstellen der Zutat' })
  }
})

router.put('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const {
      name,
      unit,
      recipeUnit,
      gramsPerPurchaseUnit,
      purchasePrice,
      deposit,
      consumptionFactorPercent,
      minimumStock,
      ean,
      unitEans,
      supplier,
      articleNumber,
      allergens,
      category,
    } = req.body as {
      name?: string
      unit?: string
      recipeUnit?: string | null
      gramsPerPurchaseUnit?: number | null
      purchasePrice?: number
      deposit?: number
      consumptionFactorPercent?: number | null
      minimumStock?: number | null
      ean?: string | null
      unitEans?: unknown
      supplier?: string | null
      articleNumber?: string | null
      allergens?: string | null
      category?: string | null
    }

    if (!id) {
      return res.status(400).json({ error: 'id fehlt' })
    }

    const existing = await prisma.ingredient.findUnique({
      where: { id },
      select: { tenantId: true, unit: true },
    })

    if (!existing) {
      return res.status(404).json({ error: 'Zutat nicht gefunden' })
    }
    await resolveTenantScope(req, existing.tenantId)

    const normalizedUnit = unit === undefined ? existing.unit : normalizeText(unit) ?? unit
    const integerOnlyMinimumStock = isIntegerOnlyUnit(normalizedUnit)

    const parsedGramsPerPurchaseUnit = parseOptionalPositiveNumber(gramsPerPurchaseUnit)
    if (!parsedGramsPerPurchaseUnit.ok) {
      return res.status(400).json({ error: 'gramsPerPurchaseUnit muss groesser als 0 sein' })
    }
    const parsedMinimumStock = parseOptionalNonNegativeNumber(minimumStock, {
      integerOnly: integerOnlyMinimumStock,
    })
    if (!parsedMinimumStock.ok) {
      return res.status(400).json({
        error: integerOnlyMinimumStock
          ? 'minimumStock muss bei Stueck/Dose eine ganze Zahl >= 0 sein'
          : 'minimumStock muss >= 0 sein',
      })
    }
    const parsedConsumptionFactorPercent = parseOptionalNonNegativeNumber(consumptionFactorPercent)
    if (!parsedConsumptionFactorPercent.ok) {
      return res
        .status(400)
        .json({ error: 'consumptionFactorPercent muss >= 0 sein' })
    }

    const normalizedSupplier = supplier === undefined ? undefined : normalizeText(supplier)
    await ensureSupplierExists(existing.tenantId, normalizedSupplier ?? null)

    const normalizedUnitEans = unitEans === undefined ? undefined : normalizeUnitEans(unitEans)

    const updated = await prisma.ingredient.update({
      where: { id },
      data: {
        name,
        unit: normalizedUnit,
        recipeUnit: recipeUnit === undefined ? undefined : normalizeText(recipeUnit),
        gramsPerPurchaseUnit:
          parsedGramsPerPurchaseUnit.value === undefined
            ? undefined
            : parsedGramsPerPurchaseUnit.value,
        purchasePrice: purchasePrice === undefined ? undefined : Number(purchasePrice),
        consumptionFactorPercent:
          parsedConsumptionFactorPercent.value === undefined
            ? undefined
            : parsedConsumptionFactorPercent.value,
        minimumStock:
          parsedMinimumStock.value === undefined ? undefined : parsedMinimumStock.value,
        deposit: deposit === undefined ? undefined : Number(deposit),
        ean: ean === undefined ? undefined : normalizeEan(ean),
        unitEans:
          normalizedUnitEans === undefined
            ? undefined
            : (normalizedUnitEans as unknown as Prisma.InputJsonValue),
        supplier: supplier === undefined ? undefined : normalizedSupplier,
        articleNumber:
          articleNumber === undefined ? undefined : normalizeText(articleNumber),
        allergens:
          allergens === undefined ? undefined : normalizeAllergens(allergens || undefined),
        category:
          category === undefined ? undefined : normalizeIngredientCategory(category),
      },
    })

    await writeAuditLog({
      req,
      module: 'ingredient',
      action: 'ingredient_updated',
      targetType: 'ingredient',
      targetId: updated.id,
      tenantId: updated.tenantId,
      metadata: {
        name: updated.name,
        allergens: updated.allergens,
        category: updated.category,
        minimumStock: updated.minimumStock,
        consumptionFactorPercent: updated.consumptionFactorPercent,
      },
    })

    return res.json(mapIngredientOutput(updated))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error(error)
    return res.status(500).json({ error: 'Zutat konnte nicht aktualisiert werden' })
  }
})

router.delete('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const tenantIdInput = req.query.tenantId

    if (!id || !tenantIdInput) {
      return res.status(400).json({ error: 'id oder tenantId fehlt' })
    }
    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string

    const existing = await prisma.ingredient.findUnique({
      where: { id },
      select: {
        id: true,
        tenantId: true,
        name: true,
      },
    })

    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Zutat nicht gefunden' })
    }

    const [productUsageCount, stockMovementCount] = await Promise.all([
      prisma.productIngredient.count({
        where: { ingredientId: id },
      }),
      prisma.stockMovement.count({
        where: { ingredientId: id },
      }),
    ])

    if (productUsageCount > 0 || stockMovementCount > 0) {
      return res.status(409).json({
        error: 'Zutat wird noch verwendet und kann nicht geloescht werden',
        productUsageCount,
        stockMovementCount,
      })
    }

    await prisma.ingredient.delete({
      where: { id },
    })

    await writeAuditLog({
      req,
      module: 'ingredient',
      action: 'ingredient_deleted',
      targetType: 'ingredient',
      targetId: existing.id,
      tenantId: existing.tenantId,
      metadata: {
        name: existing.name,
      },
    })

    return res.json({ ok: true })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error(error)
    return res.status(500).json({ error: 'Zutat konnte nicht geloescht werden' })
  }
})

export default router
