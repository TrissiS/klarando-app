import { Request } from 'express'
import { UserRole } from '@prisma/client'
import { prisma } from './prisma'

type AuditParams = {
  req: Request
  module: string
  action: string
  targetType?: string
  targetId?: string
  chainId?: string | null
  tenantId?: string | null
  metadata?: unknown
}

export async function writeAuditLog(params: AuditParams) {
  const actor = params.req.authUser
  const headerEmail = params.req.header('x-user-email') || null

  try {
    await prisma.auditLog.create({
      data: {
        actorUserId: actor?.id || null,
        actorEmail: actor?.email || headerEmail,
        actorRole: actor?.role || null,
        chainId: params.chainId ?? actor?.chainId ?? null,
        tenantId: params.tenantId ?? actor?.tenantId ?? null,
        module: params.module,
        action: params.action,
        targetType: params.targetType || null,
        targetId: params.targetId || null,
        metadata: params.metadata as object | undefined,
      },
    })
  } catch (error) {
    console.error('AUDIT LOG ERROR:', error)
  }
}

export function parseUserRole(value: string): UserRole | null {
  if (Object.values(UserRole).includes(value as UserRole)) {
    return value as UserRole
  }

  return null
}
