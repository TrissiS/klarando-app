import { Prisma, PermissionKey } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'

const router = Router()

function normalizeText(value?: string | null) {
  if (value === undefined) {
    return undefined
  }

  if (value === null) {
    return null
  }

  const normalized = value.trim()
  return normalized.length > 0 ? normalized : null
}

router.get('/', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string
    const includeIngredients = req.query.includeIngredients === 'true'

    const suppliers = await prisma.supplier.findMany({
      where: { tenantId },
      orderBy: [{ name: 'asc' }],
    })

    const supplierNames = suppliers.map((supplier) => supplier.name)
    const ingredientsBySupplier = new Map<
      string,
      Array<{
        id: string
        name: string
        unit: string
        purchasePrice: Prisma.Decimal
        articleNumber: string | null
        ean: string | null
      }>
    >()
    const supplierKey = (rowTenantId: string, supplierName: string) =>
      `${rowTenantId}::${supplierName}`

    if (includeIngredients && supplierNames.length > 0) {
      const ingredients = await prisma.ingredient.findMany({
        where: {
          tenantId,
          supplier: {
            in: supplierNames,
          },
        },
        select: {
          id: true,
          name: true,
          unit: true,
          purchasePrice: true,
          articleNumber: true,
          ean: true,
          supplier: true,
        },
        orderBy: [{ name: 'asc' }],
      })

      for (const ingredient of ingredients) {
        if (!ingredient.supplier) {
          continue
        }

        const key = supplierKey(tenantId, ingredient.supplier)
        const current = ingredientsBySupplier.get(key) || []
        current.push({
          id: ingredient.id,
          name: ingredient.name,
          unit: ingredient.unit,
          purchasePrice: ingredient.purchasePrice,
          articleNumber: ingredient.articleNumber,
          ean: ingredient.ean,
        })
        ingredientsBySupplier.set(key, current)
      }
    }

    return res.json(
      suppliers.map((supplier) => {
        const supplierIngredients = ingredientsBySupplier.get(supplierKey(supplier.tenantId, supplier.name)) || []

        return {
          ...supplier,
          ingredientCount: supplierIngredients.length,
          ingredients: supplierIngredients,
        }
      })
    )
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET SUPPLIERS ERROR:', error)
    return res.status(500).json({ error: 'Lieferanten konnten nicht geladen werden' })
  }
})

router.post('/', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const { tenantId, name, contactName, phone, email, notes } = req.body as {
      tenantId?: string
      name?: string
      contactName?: string | null
      phone?: string | null
      email?: string | null
      notes?: string | null
    }

    if (!name) {
      return res.status(400).json({ error: 'tenantId und name sind erforderlich' })
    }
    const scope = await resolveTenantScope(req, tenantId)
    const scopedTenantId = scope.tenantId as string

    const supplier = await prisma.supplier.create({
      data: {
        tenantId: scopedTenantId,
        name: name.trim(),
        contactName: normalizeText(contactName),
        phone: normalizeText(phone),
        email: normalizeText(email),
        notes: normalizeText(notes),
      },
    })

    await writeAuditLog({
      req,
      module: 'supplier',
      action: 'supplier_created',
      targetType: 'supplier',
      targetId: supplier.id,
      tenantId: supplier.tenantId,
      metadata: {
        name: supplier.name,
      },
    })

    return res.status(201).json({
      ...supplier,
      ingredientCount: 0,
      ingredients: [],
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    if (
      error instanceof Prisma.PrismaClientKnownRequestError &&
      error.code === 'P2002'
    ) {
      return res.status(409).json({ error: 'Lieferant existiert bereits' })
    }

    console.error('CREATE SUPPLIER ERROR:', error)
    return res.status(500).json({ error: 'Lieferant konnte nicht erstellt werden' })
  }
})

router.patch('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const { tenantId, name, contactName, phone, email, notes } = req.body as {
      tenantId?: string
      name?: string
      contactName?: string | null
      phone?: string | null
      email?: string | null
      notes?: string | null
    }

    if (!id || !tenantId) {
      return res.status(400).json({ error: 'id und tenantId sind erforderlich' })
    }
    const scope = await resolveTenantScope(req, tenantId)
    const scopedTenantId = scope.tenantId as string

    const existing = await prisma.supplier.findUnique({
      where: { id },
    })

    if (!existing || existing.tenantId !== scopedTenantId) {
      return res.status(404).json({ error: 'Lieferant nicht gefunden' })
    }

    const nextName = name?.trim()
    if (nextName !== undefined && nextName.length === 0) {
      return res.status(400).json({ error: 'Name darf nicht leer sein' })
    }

    const updated = await prisma.supplier.update({
      where: { id },
      data: {
        name: nextName,
        contactName: normalizeText(contactName),
        phone: normalizeText(phone),
        email: normalizeText(email),
        notes: normalizeText(notes),
      },
    })

    let updatedIngredients = 0
    if (nextName && nextName !== existing.name) {
      const updateResult = await prisma.ingredient.updateMany({
        where: {
          tenantId: scopedTenantId,
          supplier: existing.name,
        },
        data: {
          supplier: nextName,
        },
      })
      updatedIngredients = updateResult.count
    }

    const ingredients = await prisma.ingredient.findMany({
      where: {
        tenantId: scopedTenantId,
        supplier: updated.name,
      },
      select: {
        id: true,
        name: true,
        unit: true,
        purchasePrice: true,
        articleNumber: true,
        ean: true,
      },
      orderBy: [{ name: 'asc' }],
    })

    await writeAuditLog({
      req,
      module: 'supplier',
      action: 'supplier_updated',
      targetType: 'supplier',
      targetId: updated.id,
      tenantId: updated.tenantId,
      metadata: {
        oldName: existing.name,
        newName: updated.name,
        updatedIngredients,
      },
    })

    return res.json({
      ...updated,
      ingredientCount: ingredients.length,
      ingredients,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    if (
      error instanceof Prisma.PrismaClientKnownRequestError &&
      error.code === 'P2002'
    ) {
      return res.status(409).json({ error: 'Lieferant existiert bereits' })
    }

    console.error('UPDATE SUPPLIER ERROR:', error)
    return res.status(500).json({ error: 'Lieferant konnte nicht aktualisiert werden' })
  }
})

router.delete('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const tenantIdInput = req.query.tenantId

    if (!id || !tenantIdInput) {
      return res.status(400).json({ error: 'id und tenantId sind erforderlich' })
    }
    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string

    const existing = await prisma.supplier.findUnique({
      where: { id },
    })

    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Lieferant nicht gefunden' })
    }

    const ingredientCount = await prisma.ingredient.count({
      where: {
        tenantId,
        supplier: existing.name,
      },
    })

    if (ingredientCount > 0) {
      return res.status(409).json({
        error: 'Lieferant wird noch von Zutaten verwendet',
        ingredientCount,
      })
    }

    await prisma.supplier.delete({
      where: { id },
    })

    await writeAuditLog({
      req,
      module: 'supplier',
      action: 'supplier_deleted',
      targetType: 'supplier',
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
    console.error('DELETE SUPPLIER ERROR:', error)
    return res.status(500).json({ error: 'Lieferant konnte nicht geloescht werden' })
  }
})

export default router
