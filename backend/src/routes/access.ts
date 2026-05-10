import { Request, Router } from 'express'
import { PermissionKey, Prisma, UserRole } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { hashPassword } from '../auth/password'
import { getDefaultPermissions } from '../auth/permissions'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'

const router = Router()
const ALL_PERMISSIONS = Object.values(PermissionKey)
const ALL_USER_ROLES = Object.values(UserRole)
let cachedSupportedUserRoles: Set<UserRole> | null = null
let supportedUserRolesPromise: Promise<Set<UserRole>> | null = null

async function loadSupportedUserRoles() {
  if (cachedSupportedUserRoles) {
    return cachedSupportedUserRoles
  }

  if (supportedUserRolesPromise) {
    return supportedUserRolesPromise
  }

  supportedUserRolesPromise = (async () => {
    try {
      const rows = await prisma.$queryRawUnsafe<Array<{ role: string }>>(
        'SELECT unnest(enum_range(NULL::\"UserRole\"))::text AS role'
      )
      const resolved = new Set<UserRole>()
      for (const row of rows) {
        if (ALL_USER_ROLES.includes(row.role as UserRole)) {
          resolved.add(row.role as UserRole)
        }
      }

      if (resolved.size === 0) {
        cachedSupportedUserRoles = new Set(ALL_USER_ROLES)
      } else {
        cachedSupportedUserRoles = resolved
      }
    } catch (error) {
      console.warn('LOAD SUPPORTED USER ROLES ERROR:', error)
      cachedSupportedUserRoles = new Set(ALL_USER_ROLES)
    } finally {
      supportedUserRolesPromise = null
    }

    return cachedSupportedUserRoles as Set<UserRole>
  })()

  return supportedUserRolesPromise
}

async function isUserRoleSupported(role: UserRole) {
  const roles = await loadSupportedUserRoles()
  return roles.has(role)
}

function parseRole(value?: string) {
  if (!value) {
    return null
  }

  if (ALL_USER_ROLES.includes(value as UserRole)) {
    return value as UserRole
  }

  return null
}

function parsePermissions(values: unknown) {
  if (!Array.isArray(values)) {
    return null
  }

  const parsed: PermissionKey[] = []

  for (const raw of values) {
    if (typeof raw !== 'string') {
      return null
    }

    if (!ALL_PERMISSIONS.includes(raw as PermissionKey)) {
      return null
    }

    parsed.push(raw as PermissionKey)
  }

  return Array.from(new Set(parsed))
}

function parsePositiveInt(value: unknown, fallback: number, max: number) {
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return fallback
  }
  return Math.min(Math.max(Math.round(parsed), 1), max)
}

function parseOptionalBoolean(value: unknown) {
  if (typeof value === 'boolean') {
    return value
  }

  if (typeof value === 'string') {
    const lowered = value.trim().toLowerCase()
    if (lowered === 'true' || lowered === '1' || lowered === 'yes') {
      return true
    }
    if (lowered === 'false' || lowered === '0' || lowered === 'no') {
      return false
    }
  }

  return null
}

function parseScopedId(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function canManageUsersRole(role: UserRole | undefined) {
  return role === UserRole.SUPERADMIN || role === UserRole.CHAINADMIN || role === UserRole.ADMIN
}

function enforceTargetUserAccess(
  req: Request,
  target: {
    id: string
    role: UserRole
    chainId: string | null
    tenantId: string | null
  },
  mode: 'read' | 'write'
) {
  const actor = req.authUser

  if (!actor) {
    return null
  }

  if (actor.role === UserRole.SUPERADMIN) {
    return null
  }

  if (actor.role === UserRole.CHAINADMIN) {
    if (!actor.chainId || target.chainId !== actor.chainId) {
      return 'Kein Zugriff auf diesen Benutzer'
    }

    if (
      mode === 'write' &&
      (target.role === UserRole.SUPERADMIN || target.role === UserRole.CHAINADMIN)
    ) {
      return 'CHAINADMIN darf diese Rolle nicht bearbeiten'
    }

    return null
  }

  if (actor.role === UserRole.ADMIN) {
    if (!actor.tenantId || target.tenantId !== actor.tenantId) {
      return 'Kein Zugriff auf diesen Benutzer'
    }

    if (mode === 'write' && target.role !== UserRole.STAFF && target.role !== UserRole.DRIVER) {
      return 'ADMIN darf nur STAFF/DRIVER bearbeiten'
    }

    return null
  }

  if (actor.id !== target.id) {
    return 'Kein Zugriff auf diesen Benutzer'
  }

  return null
}

async function resolveEffectivePermissionsForUser(userId: string, role: UserRole) {
  const dbRolePermissions = await prisma.rolePermission.findMany({
    where: { role },
    select: { permission: true },
  })

  const defaultPermissions =
    dbRolePermissions.length > 0
      ? dbRolePermissions.map((entry) => entry.permission)
      : getDefaultPermissions(role)

  const userOverrides = await prisma.userPermission.findMany({
    where: { userId },
    select: { permission: true, allowed: true },
  })

  const effective = new Set<PermissionKey>(defaultPermissions)

  for (const entry of userOverrides) {
    if (entry.allowed) {
      effective.add(entry.permission)
      continue
    }

    effective.delete(entry.permission)
  }

  return Array.from(effective).sort()
}

function enforceUserScope(req: Request, where: Record<string, unknown>) {
  const user = req.authUser

  if (!user) {
    return where
  }

  if (user.role === UserRole.CHAINADMIN && user.chainId) {
    return { ...where, chainId: user.chainId }
  }

  if (user.role === UserRole.ADMIN && user.tenantId) {
    return { ...where, tenantId: user.tenantId }
  }

  if (user.role === UserRole.STAFF) {
    return { ...where, id: user.id }
  }

  if (user.role === UserRole.DRIVER) {
    return { ...where, id: user.id }
  }

  return where
}

function enforceTenantScope(req: Request, where: Record<string, unknown>) {
  const user = req.authUser

  if (!user) {
    return where
  }

  if (user.role === UserRole.CHAINADMIN && user.chainId) {
    return { ...where, chainId: user.chainId }
  }

  if (
    (user.role === UserRole.ADMIN || user.role === UserRole.STAFF || user.role === UserRole.DRIVER) &&
    user.tenantId
  ) {
    return { ...where, id: user.tenantId }
  }

  return where
}

function enforceAuditScope(req: Request, where: Record<string, unknown>) {
  const user = req.authUser

  if (!user) {
    return where
  }

  if (user.role === UserRole.CHAINADMIN && user.chainId) {
    return { ...where, chainId: user.chainId }
  }

  if (
    (user.role === UserRole.ADMIN || user.role === UserRole.STAFF || user.role === UserRole.DRIVER) &&
    user.tenantId
  ) {
    return { ...where, tenantId: user.tenantId }
  }

  return where
}

router.get('/roles', requirePermission(PermissionKey.USERS_READ), async (_req, res) => {
  const supportedRoles = await loadSupportedUserRoles()
  return res.json({
    roles: Array.from(supportedRoles),
    permissions: Object.values(PermissionKey),
  })
})

router.get('/context', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    const actor = req.authUser

    const tenantWhere = enforceTenantScope(req, {})
    const tenants = await prisma.tenant.findMany({
      where: tenantWhere,
      select: {
        id: true,
        name: true,
        chainId: true,
      },
      orderBy: { createdAt: 'desc' },
    })

    let chainWhere: Record<string, unknown> = {}

    if (actor?.role === UserRole.CHAINADMIN && actor.chainId) {
      chainWhere = { id: actor.chainId }
    }

    if (
      (actor?.role === UserRole.ADMIN ||
        actor?.role === UserRole.STAFF ||
        actor?.role === UserRole.DRIVER) &&
      actor.tenantId
    ) {
      const tenant = tenants.find((entry) => entry.id === actor.tenantId)
      chainWhere = tenant?.chainId ? { id: tenant.chainId } : { id: '__none__' }
    }

    const chains = await prisma.chain.findMany({
      where: chainWhere,
      select: {
        id: true,
        name: true,
        code: true,
      },
      orderBy: { createdAt: 'desc' },
    })

    return res.json({
      me: actor
        ? {
            id: actor.id,
            role: actor.role,
            chainId: actor.chainId,
            tenantId: actor.tenantId,
          }
        : null,
      chains,
      tenants,
    })
  } catch (error) {
    console.error('GET ACCESS CONTEXT ERROR:', error)
    return res.status(500).json({ error: 'Kontext konnte nicht geladen werden' })
  }
})

router.get('/users', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    const where: Record<string, unknown> = {}
    const role = parseRole(req.query.role as string | undefined)
    const chainId = parseScopedId(req.query.chainId)
    const tenantId = parseScopedId(req.query.tenantId)

    if (role) {
      if (!(await isUserRoleSupported(role))) {
        return res.json([])
      }
      where.role = role
    }

    if (chainId) {
      where.chainId = chainId
    }

    if (tenantId) {
      where.tenantId = tenantId
      await resolveTenantScope(req, tenantId)
    }

    const scopedWhere = enforceUserScope(req, where)

    const users = await prisma.user.findMany({
      where: scopedWhere,
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        isActive: true,
        chainId: true,
        tenantId: true,
        createdAt: true,
        updatedAt: true,
      },
      orderBy: { createdAt: 'desc' },
    })

    return res.json(users)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET ACCESS USERS ERROR:', error)
    return res.status(500).json({ error: 'Benutzer konnten nicht geladen werden' })
  }
})

router.post('/users', requirePermission(PermissionKey.USERS_WRITE), async (req, res) => {
  try {
    const actor = req.authUser
    if (!canManageUsersRole(actor?.role)) {
      return res.status(403).json({ error: 'Keine Berechtigung zur Benutzerverwaltung' })
    }

    const {
      email,
      name,
      password,
      role: rawRole,
      chainId,
      tenantId,
      isActive,
    } = req.body as {
      email?: string
      name?: string
      password?: string
      role?: string
      chainId?: string | null
      tenantId?: string | null
      isActive?: boolean
    }

    const role = parseRole(rawRole)

    if (!email || !name || !password || !role) {
      return res.status(400).json({ error: 'email, name, password und role sind erforderlich' })
    }
    if (!(await isUserRoleSupported(role))) {
      return res.status(400).json({ error: `Rolle ${role} ist in dieser Datenbank nicht verfuegbar` })
    }

    if (
      actor?.role === UserRole.CHAINADMIN &&
      (role === UserRole.SUPERADMIN || role === UserRole.CHAINADMIN)
    ) {
      return res.status(403).json({ error: 'CHAINADMIN darf diese Rolle nicht erstellen' })
    }

    if (actor?.role === UserRole.ADMIN && role !== UserRole.STAFF && role !== UserRole.DRIVER) {
      return res.status(403).json({ error: 'ADMIN darf nur STAFF/DRIVER erstellen' })
    }

    let resolvedTenantId: string | null = parseScopedId(tenantId) || null
    let resolvedChainId: string | null = parseScopedId(chainId) || null

    if (actor?.role === UserRole.CHAINADMIN) {
      resolvedChainId = actor.chainId
    }

    if (actor?.role === UserRole.ADMIN) {
      resolvedTenantId = actor.tenantId
      resolvedChainId = actor.chainId
    }

    if (role === UserRole.CHAINADMIN && !resolvedChainId) {
      return res.status(400).json({ error: 'CHAINADMIN braucht eine chainId' })
    }

    if (
      (role === UserRole.ADMIN || role === UserRole.STAFF || role === UserRole.DRIVER) &&
      !resolvedTenantId
    ) {
      return res.status(400).json({ error: 'ADMIN/STAFF/DRIVER braucht eine tenantId' })
    }

    if (resolvedTenantId) {
      await resolveTenantScope(req, resolvedTenantId)

      const tenant = await prisma.tenant.findUnique({
        where: { id: resolvedTenantId },
        select: { id: true, chainId: true },
      })

      if (!tenant) {
        return res.status(400).json({ error: 'Ungueltige tenantId' })
      }

      if (actor?.role === UserRole.CHAINADMIN && tenant.chainId !== actor.chainId) {
        return res.status(403).json({ error: 'Filiale gehoert nicht zu deiner Kette' })
      }

      resolvedChainId = tenant.chainId || resolvedChainId
    }

    if (resolvedChainId) {
      const chain = await prisma.chain.findUnique({
        where: { id: resolvedChainId },
        select: { id: true },
      })

      if (!chain) {
        return res.status(400).json({ error: 'Ungueltige chainId' })
      }
    }

    const createdUser = await prisma.user.create({
      data: {
        email: email.trim().toLowerCase(),
        name: name.trim(),
        passwordHash: hashPassword(password),
        role,
        chainId: resolvedChainId,
        tenantId: resolvedTenantId,
        isActive: isActive ?? true,
      },
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        chainId: true,
        tenantId: true,
        isActive: true,
        createdAt: true,
      },
    })

    await writeAuditLog({
      req,
      module: 'access',
      action: 'user_created',
      targetType: 'user',
      targetId: createdUser.id,
      chainId: createdUser.chainId,
      tenantId: createdUser.tenantId,
      metadata: {
        role: createdUser.role,
        email: createdUser.email,
      },
    })

    return res.status(201).json(createdUser)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('CREATE ACCESS USER ERROR:', error)
    return res.status(500).json({ error: 'Benutzer konnte nicht erstellt werden' })
  }
})

router.patch('/users/:id', requirePermission(PermissionKey.USERS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const actor = req.authUser
    if (!canManageUsersRole(actor?.role)) {
      return res.status(403).json({ error: 'Keine Berechtigung zur Benutzerverwaltung' })
    }

    const current = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        role: true,
        chainId: true,
        tenantId: true,
      },
    })

    if (!current) {
      return res.status(404).json({ error: 'Benutzer nicht gefunden' })
    }

    const accessError = enforceTargetUserAccess(req, current, 'write')
    if (accessError) {
      return res.status(403).json({ error: accessError })
    }

    if (current.tenantId) {
      await resolveTenantScope(req, current.tenantId)
    }

    const {
      name,
      role: rawRole,
      chainId,
      tenantId,
      isActive,
      password,
    } = req.body as {
      name?: string
      role?: string
      chainId?: string | null
      tenantId?: string | null
      isActive?: boolean
      password?: string
    }

    const role = rawRole ? parseRole(rawRole) : null

    if (rawRole && !role) {
      return res.status(400).json({ error: 'Ungueltige Rolle' })
    }
    if (role && !(await isUserRoleSupported(role))) {
      return res.status(400).json({ error: `Rolle ${role} ist in dieser Datenbank nicht verfuegbar` })
    }

    if (
      actor?.role === UserRole.CHAINADMIN &&
      role &&
      (role === UserRole.SUPERADMIN || role === UserRole.CHAINADMIN)
    ) {
      return res.status(403).json({ error: 'CHAINADMIN darf diese Rolle nicht setzen' })
    }

    if (
      actor?.role === UserRole.ADMIN &&
      role &&
      role !== UserRole.STAFF &&
      role !== UserRole.DRIVER
    ) {
      return res.status(403).json({ error: 'ADMIN darf nur STAFF/DRIVER setzen' })
    }

    if (actor?.role !== UserRole.SUPERADMIN) {
      if (chainId !== undefined || tenantId !== undefined) {
        return res
          .status(403)
          .json({ error: 'Nur SUPERADMIN darf chainId oder tenantId anpassen' })
      }
    }

    const normalizedTenantId =
      actor?.role === UserRole.SUPERADMIN && tenantId !== undefined
        ? parseScopedId(tenantId)
        : undefined
    const normalizedChainId =
      actor?.role === UserRole.SUPERADMIN && chainId !== undefined
        ? parseScopedId(chainId)
        : undefined

    if (actor?.role === UserRole.SUPERADMIN && normalizedTenantId) {
      await resolveTenantScope(req, normalizedTenantId)
    }

    let validatedChainId = normalizedChainId
    if (actor?.role === UserRole.SUPERADMIN && normalizedTenantId) {
      const tenant = await prisma.tenant.findUnique({
        where: { id: normalizedTenantId },
        select: { id: true, chainId: true },
      })
      if (!tenant) {
        return res.status(400).json({ error: 'Ungueltige tenantId' })
      }
      validatedChainId = tenant.chainId ?? validatedChainId
    }

    const updated = await prisma.user.update({
      where: { id },
      data: {
        name,
        role: role || undefined,
        chainId:
          actor?.role === UserRole.SUPERADMIN
            ? normalizedChainId === undefined
              ? undefined
              : validatedChainId
            : undefined,
        tenantId:
          actor?.role === UserRole.SUPERADMIN
            ? normalizedTenantId === undefined
              ? undefined
              : normalizedTenantId
            : undefined,
        isActive,
        passwordHash: password ? hashPassword(password) : undefined,
      },
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        chainId: true,
        tenantId: true,
        isActive: true,
        updatedAt: true,
      },
    })

    await writeAuditLog({
      req,
      module: 'access',
      action: 'user_updated',
      targetType: 'user',
      targetId: updated.id,
      chainId: updated.chainId,
      tenantId: updated.tenantId,
      metadata: {
        role: updated.role,
        isActive: updated.isActive,
      },
    })

    return res.json(updated)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE ACCESS USER ERROR:', error)
    return res.status(500).json({ error: 'Benutzer konnte nicht aktualisiert werden' })
  }
})

router.delete('/users/:id', requirePermission(PermissionKey.USERS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const actor = req.authUser
    if (!canManageUsersRole(actor?.role)) {
      return res.status(403).json({ error: 'Keine Berechtigung zur Benutzerverwaltung' })
    }

    const current = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        role: true,
        chainId: true,
        tenantId: true,
        email: true,
        name: true,
      },
    })

    if (!current) {
      return res.status(404).json({ error: 'Benutzer nicht gefunden' })
    }

    const accessError = enforceTargetUserAccess(req, current, 'write')
    if (accessError) {
      return res.status(403).json({ error: accessError })
    }

    if (current.tenantId) {
      await resolveTenantScope(req, current.tenantId)
    }

    if (actor?.id === current.id) {
      return res.status(400).json({ error: 'Du kannst dein eigenes Benutzerkonto nicht loeschen' })
    }

    if (current.role === UserRole.SUPERADMIN) {
      const superadminCount = await prisma.user.count({
        where: { role: UserRole.SUPERADMIN },
      })

      if (superadminCount <= 1) {
        return res.status(400).json({ error: 'Der letzte SUPERADMIN kann nicht geloescht werden' })
      }
    }

    await prisma.user.delete({
      where: { id: current.id },
    })

    await writeAuditLog({
      req,
      module: 'access',
      action: 'user_deleted',
      targetType: 'user',
      targetId: current.id,
      chainId: current.chainId,
      tenantId: current.tenantId,
      metadata: {
        role: current.role,
        email: current.email,
        name: current.name,
      },
    })

    return res.json({
      ok: true,
      id: current.id,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DELETE ACCESS USER ERROR:', error)
    return res.status(500).json({ error: 'Benutzer konnte nicht geloescht werden' })
  }
})

router.get('/drivers/overview', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    if (!(await isUserRoleSupported(UserRole.DRIVER))) {
      return res.json({
        generatedAt: new Date().toISOString(),
        rows: [],
      })
    }

    const q =
      typeof req.query.q === 'string' && req.query.q.trim().length > 0
        ? req.query.q.trim()
        : null
    const chainId =
      typeof req.query.chainId === 'string' && req.query.chainId.trim().length > 0
        ? req.query.chainId.trim()
        : null
    const tenantId =
      typeof req.query.tenantId === 'string' && req.query.tenantId.trim().length > 0
        ? req.query.tenantId.trim()
        : null
    const includeInactive = parseOptionalBoolean(req.query.includeInactive) ?? false
    const limit = parsePositiveInt(req.query.limit, 300, 600)
    const scopedTenantId = tenantId ? (await resolveTenantScope(req, tenantId)).tenantId : null

    const scopedUserWhere = enforceAuditScope(req, {
      role: UserRole.DRIVER,
      chainId: chainId || undefined,
      tenantId: scopedTenantId || undefined,
      isActive: includeInactive ? undefined : true,
      OR: q
        ? [
            { name: { contains: q, mode: 'insensitive' as const } },
            { email: { contains: q, mode: 'insensitive' as const } },
          ]
        : undefined,
    }) as Prisma.UserWhereInput

    const drivers = await prisma.user.findMany({
      where: scopedUserWhere,
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        isActive: true,
        chainId: true,
        tenantId: true,
        createdAt: true,
        updatedAt: true,
        chain: {
          select: {
            id: true,
            name: true,
            code: true,
          },
        },
        tenant: {
          select: {
            id: true,
            name: true,
            chainId: true,
          },
        },
      },
      orderBy: [{ isActive: 'desc' }, { name: 'asc' }],
      take: limit,
    })

    if (drivers.length === 0) {
      return res.json({
        generatedAt: new Date().toISOString(),
        rows: [],
      })
    }

    const driverIds = drivers.map((entry) => entry.id)
    const scopedTenantIdsForOrders = Array.from(
      new Set(drivers.map((entry) => entry.tenantId).filter((entry): entry is string => Boolean(entry)))
    )
    const orderStats = await prisma.order.groupBy({
      by: ['assignedDriverId', 'status'],
      where: {
        assignedDriverId: {
          in: driverIds,
        },
        tenantId: {
          in: scopedTenantIdsForOrders,
        },
      },
      _count: {
        _all: true,
      },
      _max: {
        driverAssignedAt: true,
        driverDepartedAt: true,
        createdAt: true,
      },
    })

    const startOfToday = new Date()
    startOfToday.setHours(0, 0, 0, 0)

    const todayStats = await prisma.order.groupBy({
      by: ['assignedDriverId'],
      where: {
        assignedDriverId: {
          in: driverIds,
        },
        tenantId: {
          in: scopedTenantIdsForOrders,
        },
        createdAt: {
          gte: startOfToday,
        },
      },
      _count: {
        _all: true,
      },
    })

    const totalsByDriver = new Map<string, { total: number; active: number; completed: number; lastAt: string | null }>()
    for (const entry of orderStats) {
      if (!entry.assignedDriverId) {
        continue
      }

      const current = totalsByDriver.get(entry.assignedDriverId) || {
        total: 0,
        active: 0,
        completed: 0,
        lastAt: null as string | null,
      }

      current.total += entry._count._all
      if (
        entry.status === 'open' ||
        entry.status === 'preparing' ||
        entry.status === 'out_for_delivery'
      ) {
        current.active += entry._count._all
      }

      if (entry.status === 'done' || entry.status === 'archived') {
        current.completed += entry._count._all
      }

      const timestamps = [
        entry._max.driverDepartedAt,
        entry._max.driverAssignedAt,
        entry._max.createdAt,
      ].filter((value): value is Date => Boolean(value))
      if (timestamps.length > 0) {
        const latest = timestamps.reduce((left, right) => (left > right ? left : right))
        if (!current.lastAt || latest.toISOString() > current.lastAt) {
          current.lastAt = latest.toISOString()
        }
      }

      totalsByDriver.set(entry.assignedDriverId, current)
    }

    const todayByDriver = new Map<string, number>()
    for (const entry of todayStats) {
      if (entry.assignedDriverId) {
        todayByDriver.set(entry.assignedDriverId, entry._count._all)
      }
    }

    const rows = drivers.map((driver) => {
      const stats = totalsByDriver.get(driver.id) || {
        total: 0,
        active: 0,
        completed: 0,
        lastAt: null,
      }
      return {
        ...driver,
        stats: {
          totalAssignedOrders: stats.total,
          activeDeliveries: stats.active,
          completedDeliveries: stats.completed,
          todayAssignedOrders: todayByDriver.get(driver.id) || 0,
          lastAssignmentAt: stats.lastAt,
        },
      }
    })

    return res.json({
      generatedAt: new Date().toISOString(),
      rows,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET DRIVER OVERVIEW ERROR:', error)
    return res.status(500).json({ error: 'Fahrer-Uebersicht konnte nicht geladen werden' })
  }
})

router.get('/drivers/:id', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    if (!(await isUserRoleSupported(UserRole.DRIVER))) {
      return res.status(404).json({ error: 'Fahrer nicht gefunden' })
    }

    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    if (!id) {
      return res.status(400).json({ error: 'id fehlt' })
    }

    const driver = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        isActive: true,
        chainId: true,
        tenantId: true,
        createdAt: true,
        updatedAt: true,
        chain: {
          select: {
            id: true,
            name: true,
            code: true,
          },
        },
        tenant: {
          select: {
            id: true,
            name: true,
          },
        },
      },
    })

    if (!driver || driver.role !== UserRole.DRIVER) {
      return res.status(404).json({ error: 'Fahrer nicht gefunden' })
    }

    const accessError = enforceTargetUserAccess(req, driver, 'read')
    if (accessError) {
      return res.status(403).json({ error: accessError })
    }
    if (!driver.tenantId) {
      return res.status(409).json({ error: 'Fahrer hat keine zugeordnete Filiale' })
    }
    await resolveTenantScope(req, driver.tenantId)

    const grouped = await prisma.order.groupBy({
      by: ['status'],
      where: {
        assignedDriverId: driver.id,
        tenantId: driver.tenantId,
      },
      _count: {
        _all: true,
      },
      _max: {
        driverAssignedAt: true,
        driverDepartedAt: true,
      },
    })

    const recentOrders = await prisma.order.findMany({
      where: {
        assignedDriverId: driver.id,
        tenantId: driver.tenantId,
      },
      select: {
        id: true,
        tenantId: true,
        status: true,
        sourceChannel: true,
        serviceType: true,
        total: true,
        paymentStatus: true,
        pickupNumber: true,
        customerName: true,
        customerAddress: true,
        customerZipCode: true,
        customerCity: true,
        estimatedMinutes: true,
        driverAssignedAt: true,
        driverDepartedAt: true,
        createdAt: true,
        tenant: {
          select: {
            id: true,
            name: true,
            chain: {
              select: {
                id: true,
                name: true,
                code: true,
              },
            },
          },
        },
      },
      orderBy: [{ createdAt: 'desc' }],
      take: 80,
    })

    let totalAssignedOrders = 0
    let activeDeliveries = 0
    let completedDeliveries = 0
    let lastAssignmentAt: string | null = null

    for (const entry of grouped) {
      totalAssignedOrders += entry._count._all

      if (
        entry.status === 'open' ||
        entry.status === 'preparing' ||
        entry.status === 'out_for_delivery'
      ) {
        activeDeliveries += entry._count._all
      }

      if (entry.status === 'done' || entry.status === 'archived') {
        completedDeliveries += entry._count._all
      }

      const timestamps = [entry._max.driverDepartedAt, entry._max.driverAssignedAt].filter(
        (value): value is Date => Boolean(value)
      )
      if (timestamps.length > 0) {
        const latest = timestamps.reduce((left, right) => (left > right ? left : right))
        if (!lastAssignmentAt || latest.toISOString() > lastAssignmentAt) {
          lastAssignmentAt = latest.toISOString()
        }
      }
    }

    return res.json({
      driver,
      summary: {
        totalAssignedOrders,
        activeDeliveries,
        completedDeliveries,
        lastAssignmentAt,
      },
      recentOrders,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET DRIVER DETAIL ERROR:', error)
    return res.status(500).json({ error: 'Fahrer-Details konnten nicht geladen werden' })
  }
})

router.get('/users/:id/permissions', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id

    const current = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        role: true,
        chainId: true,
        tenantId: true,
      },
    })

    if (!current) {
      return res.status(404).json({ error: 'Benutzer nicht gefunden' })
    }

    const accessError = enforceTargetUserAccess(req, current, 'read')
    if (accessError) {
      return res.status(403).json({ error: accessError })
    }

    if (current.tenantId) {
      await resolveTenantScope(req, current.tenantId)
    }

    const effectivePermissions = await resolveEffectivePermissionsForUser(current.id, current.role)

    return res.json({
      userId: current.id,
      role: current.role,
      permissions: effectivePermissions,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET USER PERMISSIONS ERROR:', error)
    return res.status(500).json({ error: 'Berechtigungen konnten nicht geladen werden' })
  }
})

router.put('/users/:id/permissions', requirePermission(PermissionKey.USERS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const parsedPermissions = parsePermissions((req.body as { permissions?: unknown }).permissions)
    const actor = req.authUser
    if (!canManageUsersRole(actor?.role)) {
      return res.status(403).json({ error: 'Keine Berechtigung zur Benutzerverwaltung' })
    }

    if (!parsedPermissions) {
      return res.status(400).json({ error: 'permissions sind ungueltig' })
    }

    const current = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        role: true,
        chainId: true,
        tenantId: true,
      },
    })

    if (!current) {
      return res.status(404).json({ error: 'Benutzer nicht gefunden' })
    }

    const accessError = enforceTargetUserAccess(req, current, 'write')
    if (accessError) {
      return res.status(403).json({ error: accessError })
    }

    if (current.tenantId) {
      await resolveTenantScope(req, current.tenantId)
    }

    const roleDefaults = new Set(getDefaultPermissions(current.role))
    if (actor?.role !== UserRole.SUPERADMIN) {
      for (const permission of parsedPermissions) {
        if (!roleDefaults.has(permission)) {
          return res.status(403).json({
            error: `Berechtigung ${permission} darf fuer Rolle ${current.role} nicht vergeben werden`,
          })
        }
      }
    }

    const allowedSet = new Set(parsedPermissions)
    const data = ALL_PERMISSIONS.map((permission) => ({
      userId: current.id,
      permission,
      allowed: allowedSet.has(permission),
    }))

    await prisma.$transaction([
      prisma.userPermission.deleteMany({
        where: { userId: current.id },
      }),
      prisma.userPermission.createMany({
        data,
      }),
    ])

    await writeAuditLog({
      req,
      module: 'access',
      action: 'user_permissions_set',
      targetType: 'user',
      targetId: current.id,
      chainId: current.chainId,
      tenantId: current.tenantId,
      metadata: {
        permissions: parsedPermissions,
      },
    })

    return res.json({
      userId: current.id,
      role: current.role,
      permissions: parsedPermissions.sort(),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('SET USER PERMISSIONS ERROR:', error)
    return res.status(500).json({ error: 'Berechtigungen konnten nicht gespeichert werden' })
  }
})

router.get('/audit', requirePermission(PermissionKey.AUDIT_READ), async (req, res) => {
  try {
    const limit = Math.min(Number(req.query.limit || 100), 300)
    const module = parseScopedId(req.query.module)
    const tenantId = parseScopedId(req.query.tenantId)
    const chainId = parseScopedId(req.query.chainId)

    const where: Record<string, unknown> = {}

    if (module) {
      where.module = module
    }

    if (tenantId) {
      where.tenantId = tenantId
      await resolveTenantScope(req, tenantId)
    }

    if (chainId) {
      where.chainId = chainId
    }

    const scopedWhere = enforceAuditScope(req, where)

    const logs = await prisma.auditLog.findMany({
      where: scopedWhere,
      orderBy: { createdAt: 'desc' },
      take: Number.isFinite(limit) && limit > 0 ? limit : 100,
    })

    return res.json(logs)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET AUDIT LOGS ERROR:', error)
    return res.status(500).json({ error: 'Audit-Logs konnten nicht geladen werden' })
  }
})

export default router
