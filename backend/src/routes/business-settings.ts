import { PermissionKey, Prisma, UserRole } from '@prisma/client'
import { Request, Router } from 'express'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import {
  parseSettings,
  type BusinessSettings,
} from '../lib/business-settings'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'

const router = Router()

type TenantRecord = {
  id: string
  chainId: string | null
  name: string
  email: string | null
  businessSettings: Prisma.JsonValue | null
}

type ChainadminSettingsAccess = {
  superadminGranted: boolean
  canManageAppOrders: boolean
  canManageDelivery: boolean
  canManagePickup: boolean
  canOverrideSettings: boolean
}

async function resolveChainadminSettingsAccess(
  actorId: string,
  tenantId: string
): Promise<ChainadminSettingsAccess | null> {
  const access = await prisma.chainAdminTenantAccess.findUnique({
    where: {
      chainAdminUserId_tenantId: {
        chainAdminUserId: actorId,
        tenantId,
      },
    },
    select: {
      superadminGranted: true,
      canManageAppOrders: true,
      canManageDelivery: true,
      canManagePickup: true,
      canOverrideSettings: true,
    },
  })

  if (!access) {
    return null
  }

  return access
}

async function enforceTenantAccess(
  req: Request,
  tenant: TenantRecord,
  operation: 'read' | 'write' = 'write'
) {
  const actor = req.authUser
  if (!actor) {
    return { allowed: true, chainAccess: null as ChainadminSettingsAccess | null }
  }

  if (actor.role === UserRole.SUPERADMIN) {
    return { allowed: true, chainAccess: null as ChainadminSettingsAccess | null }
  }

  if (actor.role === UserRole.CHAINADMIN) {
    if (!actor.chainId || tenant.chainId !== actor.chainId) {
      return {
        allowed: false,
        error: 'Filiale liegt nicht in deiner Kette',
        chainAccess: null as ChainadminSettingsAccess | null,
      }
    }

    const chainAccess = await resolveChainadminSettingsAccess(actor.id, tenant.id)
    if (!chainAccess || !chainAccess.superadminGranted) {
      return {
        allowed: false,
        error: 'Keine Superadmin-Freigabe fuer diese Filiale',
        chainAccess: null as ChainadminSettingsAccess | null,
      }
    }

    if (
      operation === 'write' &&
      !chainAccess.canOverrideSettings &&
      !chainAccess.canManageAppOrders &&
      !chainAccess.canManageDelivery &&
      !chainAccess.canManagePickup
    ) {
      return {
        allowed: false,
        error: 'Keine Berechtigung fuer App-Einstellungen',
        chainAccess: null as ChainadminSettingsAccess | null,
      }
    }

    return { allowed: true, chainAccess }
  }

  if (actor.tenantId !== tenant.id) {
    return {
      allowed: false,
      error: 'Kein Zugriff auf diese Filiale',
      chainAccess: null as ChainadminSettingsAccess | null,
    }
  }

  return { allowed: true, chainAccess: null as ChainadminSettingsAccess | null }
}

function applyChainadminRestrictions(
  requested: BusinessSettings,
  current: BusinessSettings,
  chainAccess: ChainadminSettingsAccess
) {
  if (chainAccess.canOverrideSettings) {
    return applyNonSuperadminRestrictions(requested, current)
  }

  const next = {
    ...current,
  }

  if (chainAccess.canManageAppOrders) {
    next.customerApp = {
      ...next.customerApp,
      orderHeaderImageUrl: requested.customerApp.orderHeaderImageUrl,
      localInfoTitle: requested.customerApp.localInfoTitle,
      localInfoText: requested.customerApp.localInfoText,
      listingDisplay: requested.customerApp.listingDisplay,
    }
  }

  if (chainAccess.canManageDelivery) {
    next.deliveryArea = requested.deliveryArea
    next.deliveryHours = requested.deliveryHours
    next.deliveryFeeNote = requested.deliveryFeeNote
    next.minOrderValue = requested.minOrderValue
    next.driver = requested.driver
  }

  if (chainAccess.canManagePickup) {
    next.pickupArea = requested.pickupArea
  }

  return applyNonSuperadminRestrictions(next, current)
}

function applyAdminRestrictions(
  requested: BusinessSettings,
  current: BusinessSettings
) {
  return applyNonSuperadminRestrictions(requested, current)
}

function applyNonSuperadminRestrictions(
  requested: BusinessSettings,
  current: BusinessSettings
) {
  return {
    ...requested,
    vatId: current.vatId,
    taxNumber: current.taxNumber,
    revenueId: current.revenueId,
    taxOffice: current.taxOffice,
    payoutAccountHolder: current.payoutAccountHolder,
    payoutBankName: current.payoutBankName,
    payoutIban: current.payoutIban,
    payoutBic: current.payoutBic,
    payoutEmail: current.payoutEmail,
    payoutReference: current.payoutReference,
    imprintUrl: current.imprintUrl,
    privacyPolicyUrl: current.privacyPolicyUrl,
    termsUrl: current.termsUrl,
    supportEmail: current.supportEmail,
    accountDeletionEmail: current.accountDeletionEmail,
    compliance: current.compliance,
    customerApp: {
      ...requested.customerApp,
      listingEnabled: current.customerApp.listingEnabled,
      orderingEnabled: current.customerApp.orderingEnabled,
      guestRegistrationEnabled: current.customerApp.guestRegistrationEnabled,
      guestCheckoutEnabled: current.customerApp.guestCheckoutEnabled,
      navigation: current.customerApp.navigation,
    },
  }
}

type RequiredFieldCheck = {
  key: string
  label: string
  value: string | null
}

function collectAppRequiredFieldErrors(settings: BusinessSettings) {
  if (!settings.customerApp.listingEnabled && !settings.customerApp.orderingEnabled) {
    return [] as Array<{ key: string; label: string }>
  }

  const checks: RequiredFieldCheck[] = [
    { key: 'businessName', label: 'Geschaeftsname', value: settings.businessName },
    { key: 'legalName', label: 'Rechtlicher Name', value: settings.legalName },
    { key: 'operatorName', label: 'Betreiber', value: settings.operatorName },
    { key: 'street', label: 'Strasse', value: settings.street },
    { key: 'zipCode', label: 'PLZ', value: settings.zipCode },
    { key: 'city', label: 'Ort', value: settings.city },
    { key: 'country', label: 'Land', value: settings.country },
    { key: 'phone', label: 'Telefon', value: settings.phone },
    { key: 'email', label: 'E-Mail', value: settings.email },
  ]

  return checks
    .filter((entry) => !entry.value || entry.value.trim().length === 0)
    .map((entry) => ({
      key: entry.key,
      label: entry.label,
    }))
}

function isPublicAppActivation(
  nextSettings: BusinessSettings,
  currentSettings: BusinessSettings
) {
  const activatesListing =
    nextSettings.customerApp.listingEnabled && !currentSettings.customerApp.listingEnabled
  const activatesOrdering =
    nextSettings.customerApp.orderingEnabled && !currentSettings.customerApp.orderingEnabled
  return activatesListing || activatesOrdering
}

function mirrorPickupAreaFromDelivery(settings: BusinessSettings) {
  return {
    ...settings,
    pickupArea: {
      ...settings.deliveryArea,
      enabled: settings.pickupArea.enabled,
    },
  }
}

router.get('/', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string

    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: {
        id: true,
        chainId: true,
        name: true,
        email: true,
        businessSettings: true,
      },
    })

    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    const access = await enforceTenantAccess(req, tenant, 'read')
    if (!access.allowed) {
      return res.status(403).json({ error: access.error })
    }

    return res.json(
      parseSettings(tenant.businessSettings, {
        name: tenant.name,
        email: tenant.email,
      })
    )
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET BUSINESS SETTINGS ERROR:', error)
    return res.status(500).json({ error: 'Einstellungen konnten nicht geladen werden' })
  }
})

router.put('/', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const tenantIdInput = req.body.tenantId as string | undefined
    const settingsInput = req.body.settings as unknown

    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string

    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: {
        id: true,
        chainId: true,
        name: true,
        email: true,
        businessSettings: true,
      },
    })

    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    const access = await enforceTenantAccess(req, tenant)
    if (!access.allowed) {
      return res.status(403).json({ error: access.error })
    }

    const requestedSettings = parseSettings(settingsInput, {
      name: tenant.name,
      email: tenant.email,
    })
    const currentSettings = parseSettings(tenant.businessSettings, {
      name: tenant.name,
      email: tenant.email,
    })

    const actorRole = req.authUser?.role
    const settings =
      actorRole === UserRole.CHAINADMIN && access.chainAccess
        ? applyChainadminRestrictions(requestedSettings, currentSettings, access.chainAccess)
        : actorRole === UserRole.ADMIN || actorRole === UserRole.STAFF
          ? applyAdminRestrictions(requestedSettings, currentSettings)
          : requestedSettings

    const normalizedSettings = mirrorPickupAreaFromDelivery(settings)

    const requiresAppActivationValidation = isPublicAppActivation(
      normalizedSettings,
      currentSettings
    )
    const missingRequiredFields = requiresAppActivationValidation
      ? collectAppRequiredFieldErrors(normalizedSettings)
      : []
    if (missingRequiredFields.length > 0) {
      return res.status(400).json({
        error:
          'Fuer die oeffentliche App fehlen Pflichtangaben. Bitte im Bereich Einstellungen vervollstaendigen.',
        missingRequiredFields,
      })
    }

    await prisma.tenant.update({
      where: { id: tenant.id },
      data: {
        businessSettings: normalizedSettings as unknown as Prisma.InputJsonValue,
      },
    })

    await writeAuditLog({
      req,
      module: 'settings',
      action: 'business_settings_updated',
      targetType: 'tenant',
      targetId: tenant.id,
      tenantId: tenant.id,
      metadata: {
        businessName: normalizedSettings.businessName,
      },
    })

    return res.json(normalizedSettings)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE BUSINESS SETTINGS ERROR:', error)
    return res.status(500).json({ error: 'Einstellungen konnten nicht gespeichert werden' })
  }
})

export default router
