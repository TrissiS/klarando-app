import { Prisma, UserRole } from '@prisma/client'
import { Router } from 'express'
import { parseSettings } from '../lib/business-settings'
import { prisma } from '../lib/prisma'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { writeAuditLog } from '../lib/audit'

const router = Router()

function readBranchId(raw: unknown) {
  if (typeof raw !== 'string') {
    return null
  }
  const trimmed = raw.trim()
  return trimmed.length > 0 ? trimmed : null
}

function readPauseReason(raw: unknown) {
  if (typeof raw !== 'string') {
    return null
  }
  const trimmed = raw.trim()
  return trimmed.length > 0 ? trimmed.slice(0, 300) : null
}

function readPausedUntil(raw: unknown) {
  if (typeof raw !== 'string') {
    return null
  }
  const parsed = new Date(raw)
  if (Number.isNaN(parsed.getTime())) {
    return null
  }
  return parsed.toISOString()
}

router.get('/:branchId/order-intake-status', async (req, res) => {
  try {
    const branchId = readBranchId(req.params.branchId)
    if (!branchId) {
      return res.status(400).json({ error: 'branchId fehlt' })
    }

    if (req.authUser) {
      await resolveTenantScope(req, branchId)
    }

    const tenant = await prisma.tenant.findUnique({
      where: { id: branchId },
      select: { id: true, name: true, email: true, businessSettings: true },
    })
    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    const settings = parseSettings(tenant.businessSettings, {
      name: tenant.name,
      email: tenant.email,
    })

    return res.json({
      branchId: tenant.id,
      tenantId: tenant.id,
      orderIntakeEnabled: settings.orderIntake.orderIntakeEnabled,
      reason: settings.orderIntake.orderIntakePausedReason,
      pausedUntil: settings.orderIntake.orderIntakePausedUntil,
      pausedAt: settings.orderIntake.orderIntakePausedAt,
      services: {
        delivery: settings.orderIntake.services.deliveryEnabledNow,
        pickup: settings.orderIntake.services.pickupEnabledNow,
        tableOrdering: settings.orderIntake.services.tableOrderingEnabledNow,
      },
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('ORDER_INTAKE_STATUS_READ_ERROR', {
      branchId: req.params.branchId ?? null,
      message: error instanceof Error ? error.message : String(error),
    })
    return res.status(500).json({ error: 'Bestellannahme-Status konnte nicht geladen werden' })
  }
})

router.patch(
  '/:branchId/order-intake-status',
  async (req, res) => {
    try {
      const role = req.authUser?.role ?? null
      const canManage =
        role === UserRole.ADMIN ||
        role === UserRole.SUPERADMIN
      if (!canManage) {
        return res.status(403).json({ error: 'Keine Berechtigung für Bestellannahme-Steuerung' })
      }

      const branchId = readBranchId(req.params.branchId)
      if (!branchId) {
        return res.status(400).json({ error: 'branchId fehlt' })
      }

      await resolveTenantScope(req, branchId)

      const tenant = await prisma.tenant.findUnique({
        where: { id: branchId },
        select: { id: true, name: true, email: true, businessSettings: true },
      })
      if (!tenant) {
        return res.status(404).json({ error: 'Filiale nicht gefunden' })
      }

      const payload = req.body as {
        orderIntakeEnabled?: unknown
        reason?: unknown
        pausedUntil?: unknown
        services?: { delivery?: unknown; pickup?: unknown; tableOrdering?: unknown } | null
      }
      if (typeof payload.orderIntakeEnabled !== 'boolean') {
        return res.status(400).json({ error: 'orderIntakeEnabled muss boolean sein' })
      }

      const settings = parseSettings(tenant.businessSettings, {
        name: tenant.name,
        email: tenant.email,
      })
      const previous = settings.orderIntake
      const nowIso = new Date().toISOString()
      const pausedUntil = readPausedUntil(payload.pausedUntil)

      const nextOrderIntake = {
        orderIntakeEnabled: payload.orderIntakeEnabled,
        orderIntakePausedReason: payload.orderIntakeEnabled ? null : readPauseReason(payload.reason),
        orderIntakePausedUntil: payload.orderIntakeEnabled ? null : pausedUntil,
        orderIntakePausedByUserId: payload.orderIntakeEnabled ? null : req.authUser?.id ?? null,
        orderIntakePausedAt: payload.orderIntakeEnabled ? null : nowIso,
        services: {
          deliveryEnabledNow:
            typeof payload.services?.delivery === 'boolean'
              ? payload.services.delivery
              : payload.orderIntakeEnabled,
          pickupEnabledNow:
            typeof payload.services?.pickup === 'boolean'
              ? payload.services.pickup
              : payload.orderIntakeEnabled,
          tableOrderingEnabledNow:
            typeof payload.services?.tableOrdering === 'boolean'
              ? payload.services.tableOrdering
              : payload.orderIntakeEnabled,
        },
      }

      const nextSettings = {
        ...settings,
        orderIntake: nextOrderIntake,
      }

      await prisma.tenant.update({
        where: { id: tenant.id },
        data: {
          businessSettings: nextSettings as Prisma.InputJsonValue,
        },
      })

      await writeAuditLog({
        req,
        module: 'order-intake',
        action: 'order_intake_status_updated',
        targetType: 'tenant',
        targetId: tenant.id,
        tenantId: tenant.id,
        metadata: {
          previous,
          next: nextOrderIntake,
        },
      })

      return res.json({
        branchId: tenant.id,
        tenantId: tenant.id,
        orderIntakeEnabled: nextOrderIntake.orderIntakeEnabled,
        reason: nextOrderIntake.orderIntakePausedReason,
        pausedUntil: nextOrderIntake.orderIntakePausedUntil,
        pausedAt: nextOrderIntake.orderIntakePausedAt,
        services: {
          delivery: nextOrderIntake.services.deliveryEnabledNow,
          pickup: nextOrderIntake.services.pickupEnabledNow,
          tableOrdering: nextOrderIntake.services.tableOrderingEnabledNow,
        },
      })
    } catch (error) {
      const scopeError = asTenantScopeError(error)
      if (scopeError) {
        return res.status(scopeError.status).json({ error: scopeError.message })
      }
      console.error('ORDER_INTAKE_STATUS_UPDATE_ERROR', {
        branchId: req.params.branchId ?? null,
        message: error instanceof Error ? error.message : String(error),
      })
      return res.status(500).json({ error: 'Bestellannahme-Status konnte nicht gespeichert werden' })
    }
  }
)

export default router
