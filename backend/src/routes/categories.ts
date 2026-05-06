import { Router } from 'express'
import { PermissionKey } from '@prisma/client'
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

  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

router.get('/', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string

    const categories = await prisma.category.findMany({
      where: { tenantId },
      orderBy: [
        { sortOrder: 'asc' },
        { createdAt: 'desc' },
      ],
    })

    res.json(categories)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error(error)
    return res.status(500).json({ error: 'Fehler beim Laden der Kategorien' })
  }
})

router.post('/', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const { tenantId, name, sortOrder, imageUrl } = req.body as {
      tenantId?: string
      name?: string
      sortOrder?: number
      imageUrl?: string | null
    }

    if (!name) {
      return res.status(400).json({ error: 'tenantId oder name fehlt' })
    }
    const scope = await resolveTenantScope(req, tenantId)
    const scopedTenantId = scope.tenantId as string

    const category = await prisma.category.create({
      data: {
        tenantId: scopedTenantId,
        name: name.trim(),
        sortOrder: sortOrder ?? 0,
        imageUrl: normalizeText(imageUrl),
      },
    })

    res.status(201).json(category)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error(error)
    return res.status(500).json({ error: 'Fehler beim Erstellen der Kategorie' })
  }
})

router.put('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const { tenantId, name, sortOrder, imageUrl } = req.body as {
      tenantId?: string
      name?: string
      sortOrder?: number
      imageUrl?: string | null
    }

    if (!id || !tenantId) {
      return res.status(400).json({ error: 'id oder tenantId fehlt' })
    }
    const scope = await resolveTenantScope(req, tenantId)
    const scopedTenantId = scope.tenantId as string

    const existing = await prisma.category.findUnique({
      where: { id },
      select: { id: true, tenantId: true },
    })

    if (!existing || existing.tenantId !== scopedTenantId) {
      return res.status(404).json({ error: 'Kategorie nicht gefunden' })
    }

    const updated = await prisma.category.update({
      where: { id },
      data: {
        name: name === undefined ? undefined : name.trim(),
        sortOrder,
        imageUrl: normalizeText(imageUrl),
      },
    })

    return res.json(updated)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error(error)
    return res.status(500).json({ error: 'Fehler beim Aktualisieren der Kategorie' })
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

    const existing = await prisma.category.findUnique({
      where: { id },
      select: {
        id: true,
        tenantId: true,
        name: true,
      },
    })

    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Kategorie nicht gefunden' })
    }

    const productCount = await prisma.product.count({
      where: {
        tenantId,
        categoryId: id,
      },
    })

    if (productCount > 0) {
      return res.status(409).json({
        error: 'Kategorie wird noch von Produkten verwendet',
        productCount,
      })
    }

    await prisma.category.delete({
      where: { id },
    })

    await writeAuditLog({
      req,
      module: 'category',
      action: 'category_deleted',
      targetType: 'category',
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
    return res.status(500).json({ error: 'Kategorie konnte nicht geloescht werden' })
  }
})

export default router
