import { PermissionKey } from '@prisma/client'
import { Router } from 'express'
import { buildDeliveryAvailabilityForTenant } from '../lib/delivery-availability'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { requirePermission } from '../middleware/auth'

const router = Router()

function readString(value: unknown) {
  if (typeof value === 'string') {
    const trimmed = value.trim()
    return trimmed.length > 0 ? trimmed : null
  }

  if (Array.isArray(value)) {
    return readString(value[0])
  }

  return null
}

function readCoordinate(value: unknown) {
  const raw = readString(value)
  if (!raw) {
    return null
  }

  const parsed = Number(raw.replace(',', '.'))
  return Number.isFinite(parsed) ? parsed : null
}

router.get('/availability', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const tenantId = readString(req.query.tenantId)
    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    await resolveTenantScope(req, tenantId)

    const at = readString(req.query.at)
    const parsedAt = at ? new Date(at) : null
    if (at && (!parsedAt || Number.isNaN(parsedAt.getTime()))) {
      return res.status(400).json({ error: 'at muss ein gueltiges ISO-Datum sein' })
    }

    const zipCode = readString(req.query.zipCode)
    const street = readString(req.query.street)
    const latitude = readCoordinate(req.query.latitude)
    const longitude = readCoordinate(req.query.longitude)

    const availabilityResult = await buildDeliveryAvailabilityForTenant(tenantId, {
      now: parsedAt ?? new Date(),
      deliveryAreaInput: {
        zipCode,
        street,
        latitude,
        longitude,
      },
    })

    return res.json({
      tenantId,
      evaluatedAt: availabilityResult.serverTime,
      serverTime: availabilityResult.serverTime,
      tenantLocalTime: availabilityResult.tenantLocalTime,
      timezone: availabilityResult.timeZone,
      input: {
        zipCode,
        street,
        latitude,
        longitude,
      },
      deliveryAvailability: {
        ...availabilityResult.deliveryAvailability,
        nextDeliveryAt: availabilityResult.deliveryAvailability.nextDeliveryAt?.toISOString() ?? null,
      },
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }

    if (error instanceof Error && error.message === 'TENANT_NOT_FOUND') {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    console.error('GET DELIVERY AVAILABILITY ERROR:', error)
    return res.status(500).json({ error: 'Delivery-Availability konnte nicht geladen werden' })
  }
})

export default router
