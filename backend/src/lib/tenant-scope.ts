import { UserRole } from '@prisma/client'
import type { Request } from 'express'
import type { AuthenticatedUser } from '../middleware/auth'
import { prisma } from './prisma'

export class TenantScopeError extends Error {
  status: number

  constructor(status: number, message: string) {
    super(message)
    this.name = 'TenantScopeError'
    this.status = status
  }
}

type ScopeOptions = {
  allowMissingTenant?: boolean
}

type TenantScopeResult = {
  tenantId: string | null
  allowedTenantIds: string[]
}

function normalizeTenantId(input: unknown) {
  if (typeof input === 'string') {
    const trimmed = input.trim()
    return trimmed.length > 0 ? trimmed : null
  }

  if (Array.isArray(input)) {
    return normalizeTenantId(input[0])
  }

  return null
}

async function resolveAllowedTenantIdsForUser(user: AuthenticatedUser) {
  if (user.role === UserRole.SUPERADMIN) {
    const tenants = await prisma.tenant.findMany({
      select: { id: true },
    })
    return tenants.map((entry) => entry.id)
  }

  if (user.role === UserRole.CHAINADMIN) {
    if (!user.chainId) {
      return [] as string[]
    }

    const tenants = await prisma.tenant.findMany({
      where: { chainId: user.chainId },
      select: { id: true },
    })
    return tenants.map((entry) => entry.id)
  }

  if (
    (user.role === UserRole.ADMIN || user.role === UserRole.STAFF || user.role === UserRole.DRIVER) &&
    user.tenantId
  ) {
    return [user.tenantId]
  }

  if (user.role === UserRole.DRIVER) {
    const assignedOrders = await prisma.order.findMany({
      where: {
        assignedDriverId: user.id,
      },
      select: {
        tenantId: true,
      },
      distinct: ['tenantId'],
    })

    return assignedOrders
      .map((entry) => entry.tenantId)
      .filter((entry): entry is string => Boolean(entry))
  }

  return [] as string[]
}

export async function resolveTenantScope(
  req: Request,
  requestedTenantInput: unknown,
  options?: ScopeOptions
): Promise<TenantScopeResult> {
  const authUser = req.authUser
  if (!authUser) {
    throw new TenantScopeError(401, 'Nicht eingeloggt')
  }

  const requestedTenantId = normalizeTenantId(requestedTenantInput)
  const allowedTenantIds = await resolveAllowedTenantIdsForUser(authUser)

  if (requestedTenantId) {
    if (!allowedTenantIds.includes(requestedTenantId)) {
      throw new TenantScopeError(403, 'Keine Berechtigung fuer diese Filiale')
    }

    return {
      tenantId: requestedTenantId,
      allowedTenantIds,
    }
  }

  if (options?.allowMissingTenant) {
    return {
      tenantId: null,
      allowedTenantIds,
    }
  }

  throw new TenantScopeError(400, 'tenantId fehlt')
}

export function asTenantScopeError(error: unknown) {
  if (error instanceof TenantScopeError) {
    return error
  }

  return null
}
