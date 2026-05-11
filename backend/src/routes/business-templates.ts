import { PermissionKey, UserRole } from '@prisma/client'
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
    const tenantIdInput = (req.body as { tenantId?: string }).tenantId
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
