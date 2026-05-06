import { NextFunction, Request, Response } from 'express'
import { PermissionKey, UserRole } from '@prisma/client'
import { verifyAuthToken } from '../auth/token'
import { getDefaultPermissions, isAuthEnforced } from '../auth/permissions'
import { prisma } from '../lib/prisma'

export type AuthenticatedUser = {
  id: string
  email: string
  name: string
  role: UserRole
  chainId: string | null
  tenantId: string | null
  permissions: Set<PermissionKey>
}

declare global {
  namespace Express {
    interface Request {
      authUser?: AuthenticatedUser
    }
  }
}

function readBearerToken(req: Request) {
  const raw = req.header('authorization')

  if (!raw || !raw.toLowerCase().startsWith('bearer ')) {
    return null
  }

  return raw.slice(7).trim()
}

async function resolvePermissions(userId: string, role: UserRole) {
  const dbRolePermissions = await prisma.rolePermission.findMany({
    where: { role },
    select: { permission: true },
  })

  const basePermissions =
    dbRolePermissions.length > 0
      ? dbRolePermissions.map((entry) => entry.permission)
      : getDefaultPermissions(role)

  const userOverrides = await prisma.userPermission.findMany({
    where: { userId },
    select: { permission: true, allowed: true },
  })

  const effective = new Set<PermissionKey>(basePermissions)

  for (const entry of userOverrides) {
    if (entry.allowed) {
      effective.add(entry.permission)
      continue
    }

    effective.delete(entry.permission)
  }

  return effective
}

export async function optionalAuth(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const token = readBearerToken(req)

  if (!token) {
    return next()
  }

  const payload = verifyAuthToken(token)

  if (!payload) {
    return next()
  }

  try {
    const user = await prisma.user.findUnique({
      where: { id: payload.sub },
    })

    if (!user || !user.isActive) {
      return res.status(401).json({ error: 'Benutzer nicht aktiv oder nicht gefunden' })
    }

    const permissions = await resolvePermissions(user.id, user.role)

    req.authUser = {
      id: user.id,
      email: user.email,
      name: user.name,
      role: user.role,
      chainId: user.chainId,
      tenantId: user.tenantId,
      permissions,
    }

    return next()
  } catch (error) {
    console.error('OPTIONAL AUTH ERROR:', error)
    return res.status(503).json({ error: 'Auth-Datenbank ist noch nicht bereit' })
  }
}

export function requireAuth(req: Request, res: Response, next: NextFunction) {
  if (!isAuthEnforced() && !req.authUser) {
    return next()
  }

  if (!req.authUser) {
    return res.status(401).json({ error: 'Nicht eingeloggt' })
  }

  return next()
}

export function requirePermission(permission: PermissionKey) {
  return (req: Request, res: Response, next: NextFunction) => {
    if (!isAuthEnforced() && !req.authUser) {
      return next()
    }

    if (!req.authUser) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    if (req.authUser.role === UserRole.SUPERADMIN) {
      return next()
    }

    if (!req.authUser.permissions.has(permission)) {
      return res.status(403).json({ error: `Keine Berechtigung: ${permission}` })
    }

    return next()
  }
}
