import { Router } from 'express'
import { PermissionKey, UserRole } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { getDefaultPermissions, DEFAULT_ROLE_PERMISSIONS } from '../auth/permissions'
import { hashPassword, needsPasswordRehash, verifyPassword } from '../auth/password'
import { signAuthToken } from '../auth/token'
import { requireAuth, requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { rateLimitAuthLogin } from '../middleware/rate-limit'

const router = Router()

type LoginBody = {
  email?: string
  password?: string
}

async function loadSupportedUserRolesFromDatabase() {
  try {
    const rows = await prisma.$queryRawUnsafe<Array<{ role: string }>>(
      'SELECT unnest(enum_range(NULL::"UserRole"))::text AS role'
    )
    return new Set(rows.map((entry) => entry.role))
  } catch (error) {
    console.warn('LOAD USER ROLE ENUM ERROR:', error)
    return null
  }
}

async function seedRolePermissions() {
  try {
    const supportedRoles = await loadSupportedUserRolesFromDatabase()
    const rows = Object.entries(DEFAULT_ROLE_PERMISSIONS).flatMap(([role, permissions]) =>
      (supportedRoles && !supportedRoles.has(role)
        ? []
        : permissions.map((permission) => ({
            role: role as UserRole,
            permission,
          })))
    )

    if (rows.length === 0) {
      return
    }

    await prisma.rolePermission.createMany({
      data: rows,
      skipDuplicates: true,
    })
  } catch (error) {
    console.error('SEED ROLE PERMISSIONS ERROR:', error)
  }
}

async function resolvePermissionsForUser(userId: string, role: UserRole) {
  const dbRolePermissions = await prisma.rolePermission.findMany({
    where: { role },
    select: { permission: true },
  })

  const rolePermissions =
    dbRolePermissions.length > 0
      ? dbRolePermissions.map((entry) => entry.permission)
      : getDefaultPermissions(role)

  const userPermissions = await prisma.userPermission.findMany({
    where: { userId },
    select: { permission: true, allowed: true },
  })

  const effective = new Set<PermissionKey>(rolePermissions)

  for (const entry of userPermissions) {
    if (entry.allowed) {
      effective.add(entry.permission)
      continue
    }

    effective.delete(entry.permission)
  }

  return Array.from(effective)
}

router.post('/bootstrap-superadmin', async (req, res) => {
  try {
    const { email, password, name } = req.body as {
      email?: string
      password?: string
      name?: string
    }

    if (!email || !password) {
      return res.status(400).json({ error: 'email und password sind erforderlich' })
    }

    const normalizedEmail = email.trim().toLowerCase()
    const superadminCount = await prisma.user.count({
      where: { role: UserRole.SUPERADMIN },
    })

    if (superadminCount > 0 && req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Bootstrap nur fuer Superadmin erlaubt' })
    }

    await seedRolePermissions()

    const created = await prisma.user.create({
      data: {
        email: normalizedEmail,
        name: name?.trim() || 'Superadmin',
        passwordHash: hashPassword(password),
        role: UserRole.SUPERADMIN,
      },
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        createdAt: true,
      },
    })

    await writeAuditLog({
      req,
      module: 'auth',
      action: 'bootstrap_superadmin',
      targetType: 'user',
      targetId: created.id,
      metadata: { email: created.email },
    })

    return res.status(201).json(created)
  } catch (error) {
    console.error('BOOTSTRAP SUPERADMIN ERROR:', error)
    return res.status(500).json({ error: 'Superadmin konnte nicht erstellt werden' })
  }
})

router.post('/login', rateLimitAuthLogin, async (req, res) => {
  try {
    const { email, password } = req.body as LoginBody

    if (!email || !password) {
      return res.status(400).json({ error: 'email und password fehlen' })
    }

    const normalizedEmail = email.trim().toLowerCase()
    const user = await prisma.user.findUnique({
      where: { email: normalizedEmail },
    })

    if (!user || !user.isActive || !verifyPassword(password, user.passwordHash)) {
      await writeAuditLog({
        req,
        module: 'auth',
        action: 'login_failed',
        metadata: { email: normalizedEmail },
      })

      return res.status(401).json({ error: 'Login fehlgeschlagen' })
    }

    if (needsPasswordRehash(user.passwordHash)) {
      await prisma.user.update({
        where: { id: user.id },
        data: {
          passwordHash: hashPassword(password),
        },
      })
    }

    const permissions = await resolvePermissionsForUser(user.id, user.role)

    const token = signAuthToken({
      sub: user.id,
      email: user.email,
      role: user.role,
      chainId: user.chainId,
      tenantId: user.tenantId,
    })

    await writeAuditLog({
      req,
      module: 'auth',
      action: 'login_success',
      targetType: 'user',
      targetId: user.id,
      chainId: user.chainId,
      tenantId: user.tenantId,
    })

    return res.json({
      token,
      user: {
        id: user.id,
        email: user.email,
        name: user.name,
        role: user.role,
        chainId: user.chainId,
        tenantId: user.tenantId,
      },
      permissions,
    })
  } catch (error) {
    console.error('LOGIN ERROR:', error)
    return res.status(500).json({ error: 'Login konnte nicht verarbeitet werden' })
  }
})

router.get('/me', requireAuth, async (req, res) => {
  if (!req.authUser) {
    return res.status(401).json({ error: 'Nicht eingeloggt' })
  }

  return res.json({
    user: {
      id: req.authUser.id,
      email: req.authUser.email,
      name: req.authUser.name,
      role: req.authUser.role,
      chainId: req.authUser.chainId,
      tenantId: req.authUser.tenantId,
    },
    permissions: Array.from(req.authUser.permissions),
  })
})

router.get('/permissions/matrix', requirePermission(PermissionKey.USERS_READ), async (_req, res) => {
  try {
    await seedRolePermissions()

    const rows = await prisma.rolePermission.findMany({
      orderBy: [{ role: 'asc' }, { permission: 'asc' }],
    })

    return res.json(rows)
  } catch (error) {
    console.error('GET PERMISSION MATRIX ERROR:', error)
    return res.status(500).json({ error: 'Permissions konnten nicht geladen werden' })
  }
})

export { seedRolePermissions }
export default router
