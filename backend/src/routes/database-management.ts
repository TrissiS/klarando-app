import { Router } from 'express'
import { PermissionKey, UserRole } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import {
  assignDatabaseToChain,
  assignDatabaseToTenant,
  buildDatabaseUrlFromName,
  createEmptyDatabase,
  databaseExists,
  findDatabaseAssignmentsByName,
  getDatabaseRegistryOverview,
  isDatabaseProvisioningBlockedError,
  removeDatabaseAssignmentsByName,
  removeUnassignedDatabaseByName,
  storeUnassignedDatabase,
} from '../lib/database-provisioning'

const router = Router()

type AssignType = 'UNASSIGNED' | 'CHAIN' | 'TENANT'

function normalizeAssignType(rawValue: unknown): AssignType {
  if (typeof rawValue !== 'string') {
    return 'UNASSIGNED'
  }

  const normalized = rawValue.trim().toUpperCase()
  if (normalized === 'CHAIN' || normalized === 'TENANT' || normalized === 'UNASSIGNED') {
    return normalized
  }

  return 'UNASSIGNED'
}

function normalizeDatabaseName(rawValue: unknown) {
  if (typeof rawValue !== 'string') {
    return null
  }

  const value = rawValue.trim().toLowerCase()
  if (!value) {
    return null
  }

  if (!/^[a-z_][a-z0-9_]{0,62}$/.test(value)) {
    return null
  }

  return value
}

function enforceDatabaseManagementActorRole(role?: UserRole) {
  if (!role) {
    return null
  }

  if (role === UserRole.ADMIN || role === UserRole.STAFF) {
    return 'Diese Rolle darf keine Datenbanken verwalten'
  }

  return null
}

function formatTimestamp(value: Date | string) {
  if (value instanceof Date) {
    return value.toISOString()
  }
  return value
}

router.get('/overview', requirePermission(PermissionKey.TENANTS_READ), async (req, res) => {
  try {
    const actor = req.authUser
    const roleError = enforceDatabaseManagementActorRole(actor?.role)
    if (roleError) {
      return res.status(403).json({ error: roleError })
    }

    const chainScopeId = actor?.role === UserRole.CHAINADMIN ? actor.chainId : null

    const [chains, tenants, registryOverview] = await Promise.all([
      prisma.chain.findMany({
        where: chainScopeId ? { id: chainScopeId } : undefined,
        select: {
          id: true,
          name: true,
          code: true,
        },
        orderBy: {
          name: 'asc',
        },
      }),
      prisma.tenant.findMany({
        where: chainScopeId ? { chainId: chainScopeId } : undefined,
        select: {
          id: true,
          name: true,
          chainId: true,
          chain: {
            select: {
              id: true,
              name: true,
              code: true,
            },
          },
        },
        orderBy: {
          name: 'asc',
        },
      }),
      getDatabaseRegistryOverview(),
    ])

    const chainAssignmentById = new Map(
      registryOverview.chainAssignments.map((entry) => [entry.chainId, entry])
    )
    const tenantAssignmentById = new Map(
      registryOverview.tenantAssignments.map((entry) => [entry.tenantId, entry])
    )

    return res.json({
      chains: chains.map((chain) => {
        const assignment = chainAssignmentById.get(chain.id) || null
        return {
          id: chain.id,
          name: chain.name,
          code: chain.code,
          database: assignment
            ? {
                databaseName: assignment.databaseName,
                databaseUrl: assignment.databaseUrl,
                updatedAt: assignment.updatedAt,
              }
            : null,
        }
      }),
      tenants: tenants.map((tenant) => {
        const assignment = tenantAssignmentById.get(tenant.id) || null
        return {
          id: tenant.id,
          name: tenant.name,
          chainId: tenant.chainId,
          chainName: tenant.chain?.name || null,
          chainCode: tenant.chain?.code || null,
          database: assignment
            ? {
                databaseName: assignment.databaseName,
                databaseUrl: assignment.databaseUrl,
                updatedAt: assignment.updatedAt,
              }
            : null,
        }
      }),
      unassigned:
        actor?.role === UserRole.CHAINADMIN
          ? []
          : registryOverview.unassignedDatabases.map((entry) => ({
              id: entry.id,
              databaseName: entry.databaseName,
              databaseUrl: entry.databaseUrl,
              label: entry.label,
              createdAt: entry.createdAt,
              updatedAt: entry.updatedAt,
            })),
    })
  } catch (error) {
    console.error('GET DATABASE MANAGEMENT OVERVIEW ERROR:', error)
    return res.status(500).json({ error: 'Datenbank-Uebersicht konnte nicht geladen werden' })
  }
})

router.get('/admin-overview', requirePermission(PermissionKey.TENANTS_READ), async (req, res) => {
  try {
    const actor = req.authUser
    const roleError = enforceDatabaseManagementActorRole(actor?.role)
    if (roleError) {
      return res.status(403).json({ error: roleError })
    }

    const chainScopeId = actor?.role === UserRole.CHAINADMIN ? actor.chainId : null

    const [chains, tenants, users, registryOverview] = await Promise.all([
      prisma.chain.findMany({
        where: chainScopeId ? { id: chainScopeId } : undefined,
        select: {
          id: true,
          name: true,
          code: true,
        },
        orderBy: { name: 'asc' },
      }),
      prisma.tenant.findMany({
        where: chainScopeId ? { chainId: chainScopeId } : undefined,
        select: {
          id: true,
          name: true,
          chainId: true,
          chain: {
            select: {
              id: true,
              name: true,
              code: true,
            },
          },
        },
        orderBy: { name: 'asc' },
      }),
      prisma.user.findMany({
        where: chainScopeId ? { chainId: chainScopeId } : undefined,
        select: {
          id: true,
          email: true,
          name: true,
          role: true,
          isActive: true,
          chainId: true,
          tenantId: true,
          createdAt: true,
        },
        orderBy: [{ role: 'asc' }, { name: 'asc' }],
      }),
      getDatabaseRegistryOverview(),
    ])

    const tenantIds = tenants.map((entry) => entry.id)
    const chainIds = chains.map((entry) => entry.id)

    const [productCounts, categoryCounts, ingredientCounts, tenantUserCounts, chainUserCounts] =
      await Promise.all([
        tenantIds.length === 0
          ? Promise.resolve([])
          : prisma.product.groupBy({
              by: ['tenantId'],
              where: { tenantId: { in: tenantIds } },
              _count: { _all: true },
            }),
        tenantIds.length === 0
          ? Promise.resolve([])
          : prisma.category.groupBy({
              by: ['tenantId'],
              where: { tenantId: { in: tenantIds } },
              _count: { _all: true },
            }),
        tenantIds.length === 0
          ? Promise.resolve([])
          : prisma.ingredient.groupBy({
              by: ['tenantId'],
              where: { tenantId: { in: tenantIds } },
              _count: { _all: true },
            }),
        tenantIds.length === 0
          ? Promise.resolve([])
          : prisma.user.groupBy({
              by: ['tenantId'],
              where: { tenantId: { in: tenantIds } },
              _count: { _all: true },
            }),
        chainIds.length === 0
          ? Promise.resolve([])
          : prisma.user.groupBy({
              by: ['chainId'],
              where: { chainId: { in: chainIds } },
              _count: { _all: true },
            }),
      ])

    const productCountByTenantId = new Map(
      productCounts.map((entry) => [entry.tenantId, entry._count._all])
    )
    const categoryCountByTenantId = new Map(
      categoryCounts.map((entry) => [entry.tenantId, entry._count._all])
    )
    const ingredientCountByTenantId = new Map(
      ingredientCounts.map((entry) => [entry.tenantId, entry._count._all])
    )
    const userCountByTenantId = new Map(
      tenantUserCounts
        .filter((entry) => typeof entry.tenantId === 'string')
        .map((entry) => [entry.tenantId as string, entry._count._all])
    )
    const userCountByChainId = new Map(
      chainUserCounts
        .filter((entry) => typeof entry.chainId === 'string')
        .map((entry) => [entry.chainId as string, entry._count._all])
    )

    const tenantCountByChainId = new Map<string, number>()
    for (const tenant of tenants) {
      if (!tenant.chainId) {
        continue
      }
      tenantCountByChainId.set(
        tenant.chainId,
        (tenantCountByChainId.get(tenant.chainId) || 0) + 1
      )
    }

    const chainById = new Map(chains.map((entry) => [entry.id, entry]))
    const tenantById = new Map(tenants.map((entry) => [entry.id, entry]))
    const chainDbById = new Map(
      registryOverview.chainAssignments.map((entry) => [entry.chainId, entry])
    )
    const tenantDbById = new Map(
      registryOverview.tenantAssignments.map((entry) => [entry.tenantId, entry])
    )

    return res.json({
      generatedAt: new Date().toISOString(),
      users: users.map((user) => {
        const chain = user.chainId ? chainById.get(user.chainId) || null : null
        const tenant = user.tenantId ? tenantById.get(user.tenantId) || null : null
        const chainDb = user.chainId ? chainDbById.get(user.chainId) || null : null
        const tenantDb = user.tenantId ? tenantDbById.get(user.tenantId) || null : null
        const effectiveDb = tenantDb || chainDb || null

        return {
          id: user.id,
          email: user.email,
          name: user.name,
          role: user.role,
          isActive: user.isActive,
          createdAt: formatTimestamp(user.createdAt),
          chain: chain
            ? {
                id: chain.id,
                name: chain.name,
                code: chain.code,
                databaseName: chainDb?.databaseName || null,
              }
            : null,
          tenant: tenant
            ? {
                id: tenant.id,
                name: tenant.name,
                databaseName: tenantDb?.databaseName || null,
              }
            : null,
          effectiveDatabaseName: effectiveDb?.databaseName || null,
        }
      }),
      chains: chains.map((chain) => {
        const chainDb = chainDbById.get(chain.id) || null
        return {
          id: chain.id,
          name: chain.name,
          code: chain.code,
          tenantCount: tenantCountByChainId.get(chain.id) || 0,
          userCount: userCountByChainId.get(chain.id) || 0,
          databaseName: chainDb?.databaseName || null,
          databaseUpdatedAt: chainDb?.updatedAt ? formatTimestamp(chainDb.updatedAt) : null,
        }
      }),
      tenants: tenants.map((tenant) => {
        const tenantDb = tenantDbById.get(tenant.id) || null
        return {
          id: tenant.id,
          name: tenant.name,
          chainId: tenant.chainId,
          chainName: tenant.chain?.name || null,
          chainCode: tenant.chain?.code || null,
          productCount: productCountByTenantId.get(tenant.id) || 0,
          categoryCount: categoryCountByTenantId.get(tenant.id) || 0,
          ingredientCount: ingredientCountByTenantId.get(tenant.id) || 0,
          userCount: userCountByTenantId.get(tenant.id) || 0,
          databaseName: tenantDb?.databaseName || null,
          databaseUpdatedAt: tenantDb?.updatedAt ? formatTimestamp(tenantDb.updatedAt) : null,
        }
      }),
      unassignedDatabases:
        actor?.role === UserRole.CHAINADMIN
          ? []
          : registryOverview.unassignedDatabases.map((entry) => ({
              id: entry.id,
              databaseName: entry.databaseName,
              label: entry.label,
              createdAt: formatTimestamp(entry.createdAt),
              updatedAt: formatTimestamp(entry.updatedAt),
            })),
    })
  } catch (error) {
    console.error('GET DATABASE MANAGEMENT ADMIN OVERVIEW ERROR:', error)
    return res.status(500).json({ error: 'Admin-Uebersicht konnte nicht geladen werden' })
  }
})

router.post('/create-empty', requirePermission(PermissionKey.TENANTS_WRITE), async (req, res) => {
  try {
    const actor = req.authUser
    const roleError = enforceDatabaseManagementActorRole(actor?.role)
    if (roleError) {
      return res.status(403).json({ error: roleError })
    }

    const {
      label,
      databaseName,
      assignType: rawAssignType,
      chainId,
      tenantId,
      templateDatabase,
    } = req.body as {
      label?: string
      databaseName?: string
      assignType?: string
      chainId?: string
      tenantId?: string
      templateDatabase?: string
    }

    const assignType = normalizeAssignType(rawAssignType)
    if (actor?.role === UserRole.CHAINADMIN && assignType === 'UNASSIGNED') {
      return res.status(403).json({
        error: 'CHAINADMIN darf keine unzugeordneten Datenbanken erstellen',
      })
    }

    let targetChainId: string | null = null
    let targetChainCode: string | null = null
    let targetTenantId: string | null = null
    let targetTenantName: string | null = null

    if (assignType === 'CHAIN') {
      const requestedChainId =
        actor?.role === UserRole.CHAINADMIN ? actor.chainId : chainId || null
      if (!requestedChainId) {
        return res.status(400).json({ error: 'chainId ist erforderlich' })
      }

      const chain = await prisma.chain.findUnique({
        where: { id: requestedChainId },
        select: { id: true, code: true },
      })
      if (!chain) {
        return res.status(400).json({ error: 'Ungueltige chainId' })
      }

      targetChainId = chain.id
      targetChainCode = chain.code
    }

    if (assignType === 'TENANT') {
      if (!tenantId) {
        return res.status(400).json({ error: 'tenantId ist erforderlich' })
      }

      const tenant = await prisma.tenant.findUnique({
        where: {
          id: tenantId,
        },
        select: {
          id: true,
          name: true,
          chainId: true,
          chain: {
            select: {
              code: true,
            },
          },
        },
      })
      if (!tenant) {
        return res.status(400).json({ error: 'Ungueltige tenantId' })
      }

      if (actor?.role === UserRole.CHAINADMIN && tenant.chainId !== actor.chainId) {
        return res.status(403).json({ error: 'Kein Zugriff auf diese Filiale' })
      }

      targetTenantId = tenant.id
      targetTenantName = tenant.name
      targetChainCode = tenant.chain?.code || null
    }

    const createdDatabase = await createEmptyDatabase({
      label,
      databaseName,
      templateDatabase,
    })

    await removeDatabaseAssignmentsByName(createdDatabase.databaseName)

    if (assignType === 'CHAIN' && targetChainId) {
      await assignDatabaseToChain({
        chainId: targetChainId,
        databaseName: createdDatabase.databaseName,
        databaseUrl: createdDatabase.databaseUrl,
      })
      await removeUnassignedDatabaseByName(createdDatabase.databaseName)
    } else if (assignType === 'TENANT' && targetTenantId) {
      await assignDatabaseToTenant({
        tenantId: targetTenantId,
        databaseName: createdDatabase.databaseName,
        databaseUrl: createdDatabase.databaseUrl,
        chainCode: targetChainCode,
        tenantName: targetTenantName,
      })
      await removeUnassignedDatabaseByName(createdDatabase.databaseName)
    } else {
      await storeUnassignedDatabase({
        databaseName: createdDatabase.databaseName,
        databaseUrl: createdDatabase.databaseUrl,
        label: label || null,
      })
    }

    await writeAuditLog({
      req,
      module: 'database_management',
      action: 'empty_database_created',
      targetType: 'database',
      targetId: createdDatabase.databaseName,
      chainId: targetChainId,
      tenantId: targetTenantId,
      metadata: {
        assignType,
        chainId: targetChainId,
        tenantId: targetTenantId,
        chainCode: targetChainCode,
        created: createdDatabase.created,
      },
    })

    return res.status(201).json({
      ok: true,
      assignType,
      database: {
        databaseName: createdDatabase.databaseName,
        databaseUrl: createdDatabase.databaseUrl,
        created: createdDatabase.created,
      },
    })
  } catch (error) {
    if (isDatabaseProvisioningBlockedError(error)) {
      await writeAuditLog({
        req,
        module: 'database_management',
        action: 'database_provisioning_blocked',
        targetType: 'database',
        metadata: {
          reason: 'ALLOW_PRODUCTION_DB_PROVISIONING_DISABLED',
        },
      })
      return res.status(403).json({ error: error.message, code: error.code })
    }
    console.error('CREATE EMPTY DATABASE ERROR:', error)
    return res.status(500).json({ error: 'Leere Datenbank konnte nicht erstellt werden' })
  }
})

router.post('/assign', requirePermission(PermissionKey.TENANTS_WRITE), async (req, res) => {
  try {
    const actor = req.authUser
    const roleError = enforceDatabaseManagementActorRole(actor?.role)
    if (roleError) {
      return res.status(403).json({ error: roleError })
    }

    const { databaseName: rawDatabaseName, assignType: rawAssignType, chainId, tenantId } =
      req.body as {
        databaseName?: string
        assignType?: string
        chainId?: string
        tenantId?: string
      }

    const databaseName = normalizeDatabaseName(rawDatabaseName)
    if (!databaseName) {
      return res.status(400).json({ error: 'databaseName ist ungueltig' })
    }

    const assignType = normalizeAssignType(rawAssignType)
    if (assignType === 'UNASSIGNED') {
      return res.status(400).json({ error: 'assignType muss CHAIN oder TENANT sein' })
    }

    const knownAssignments = await findDatabaseAssignmentsByName(databaseName)
    const knownInRegistry =
      knownAssignments.chainAssignments.length > 0 ||
      knownAssignments.tenantAssignments.length > 0 ||
      knownAssignments.unassignedEntries.length > 0

    let existsOnServer = false
    try {
      existsOnServer = await databaseExists(databaseName)
    } catch (lookupError) {
      console.warn('DATABASE EXISTS LOOKUP FAILED, CONTINUING WITH REGISTRY CHECK:', lookupError)
    }

    if (!knownInRegistry && !existsOnServer) {
      return res.status(400).json({ error: 'Datenbank existiert nicht auf dem Server' })
    }

    let targetChainId: string | null = null
    let targetChainCode: string | null = null
    let targetTenantId: string | null = null
    let targetTenantName: string | null = null

    if (assignType === 'CHAIN') {
      const requestedChainId =
        actor?.role === UserRole.CHAINADMIN ? actor.chainId : chainId || null
      if (!requestedChainId) {
        return res.status(400).json({ error: 'chainId ist erforderlich' })
      }

      const chain = await prisma.chain.findUnique({
        where: { id: requestedChainId },
        select: { id: true, code: true },
      })
      if (!chain) {
        return res.status(400).json({ error: 'Ungueltige chainId' })
      }

      targetChainId = chain.id
      targetChainCode = chain.code
    }

    if (assignType === 'TENANT') {
      if (!tenantId) {
        return res.status(400).json({ error: 'tenantId ist erforderlich' })
      }

      const tenant = await prisma.tenant.findUnique({
        where: {
          id: tenantId,
        },
        select: {
          id: true,
          name: true,
          chainId: true,
          chain: {
            select: {
              code: true,
            },
          },
        },
      })
      if (!tenant) {
        return res.status(400).json({ error: 'Ungueltige tenantId' })
      }

      if (actor?.role === UserRole.CHAINADMIN && tenant.chainId !== actor.chainId) {
        return res.status(403).json({ error: 'Kein Zugriff auf diese Filiale' })
      }

      targetTenantId = tenant.id
      targetTenantName = tenant.name
      targetChainCode = tenant.chain?.code || null
    }

    const databaseUrl = buildDatabaseUrlFromName(databaseName)
    await removeDatabaseAssignmentsByName(databaseName)

    if (assignType === 'CHAIN' && targetChainId) {
      await assignDatabaseToChain({
        chainId: targetChainId,
        databaseName,
        databaseUrl,
      })
    } else if (assignType === 'TENANT' && targetTenantId) {
      await assignDatabaseToTenant({
        tenantId: targetTenantId,
        databaseName,
        databaseUrl,
        chainCode: targetChainCode,
        tenantName: targetTenantName,
      })
    }

    await removeUnassignedDatabaseByName(databaseName)

    await writeAuditLog({
      req,
      module: 'database_management',
      action: 'database_assigned',
      targetType: 'database',
      targetId: databaseName,
      chainId: targetChainId,
      tenantId: targetTenantId,
      metadata: {
        assignType,
        chainId: targetChainId,
        tenantId: targetTenantId,
        chainCode: targetChainCode,
      },
    })

    return res.json({
      ok: true,
      assignType,
      database: {
        databaseName,
        databaseUrl,
      },
    })
  } catch (error) {
    console.error('ASSIGN DATABASE ERROR:', error)
    return res.status(500).json({ error: 'Datenbank konnte nicht zugewiesen werden' })
  }
})

router.delete('/:databaseName', requirePermission(PermissionKey.TENANTS_WRITE), async (req, res) => {
  try {
    const actor = req.authUser
    const roleError = enforceDatabaseManagementActorRole(actor?.role)
    if (roleError) {
      return res.status(403).json({ error: roleError })
    }

    const rawDatabaseName = Array.isArray(req.params.databaseName)
      ? req.params.databaseName[0]
      : req.params.databaseName
    const databaseName = normalizeDatabaseName(rawDatabaseName)
    if (!databaseName) {
      return res.status(400).json({ error: 'databaseName ist ungueltig' })
    }

    await writeAuditLog({
      req,
      module: 'database_management',
      action: 'database_delete_blocked',
      targetType: 'database',
      targetId: databaseName,
      metadata: {
        reason: 'UI_DATABASE_DELETE_DISABLED',
        actorRole: actor?.role || null,
      },
    })

    return res
      .status(403)
      .json({ error: 'Datenbanken koennen nicht ueber die UI geloescht werden.' })
  } catch (error) {
    console.error('DELETE DATABASE ERROR:', error)
    return res.status(500).json({ error: 'Datenbank konnte nicht geloescht werden' })
  }
})

export default router
