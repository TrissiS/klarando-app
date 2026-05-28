import { PermissionKey, Prisma, UserRole } from '@prisma/client'
import { Request, Router } from 'express'
import multer from 'multer'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import {
  parseSettings,
  type BusinessSettings,
} from '../lib/business-settings'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import {
  isAllowedImageMimeType,
  processAndStoreTenantImage,
  type TenantImageType,
} from '../lib/tenant-image-upload'

const router = Router()
const upload = multer({
  storage: multer.memoryStorage(),
  limits: {
    fileSize: 10 * 1024 * 1024,
  },
})

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

function validatePolygonSettings(area: BusinessSettings['deliveryArea']) {
  if (!area.enabled || area.strategy !== 'POLYGON') {
    return null
  }
  if (!Array.isArray(area.polygonPath) || area.polygonPath.length < 3) {
    return 'Polygon ist ungültig: mindestens 3 Punkte erforderlich.'
  }
  const hasInvalidPoint = area.polygonPath.some(
    (point) =>
      !Number.isFinite(point.lat) ||
      !Number.isFinite(point.lng) ||
      point.lat < -90 ||
      point.lat > 90 ||
      point.lng < -180 ||
      point.lng > 180
  )
  if (hasInvalidPoint) {
    return 'Polygon ist ungültig: Koordinaten außerhalb des gültigen Bereichs.'
  }
  return null
}

function countRawPolygonPoints(value: unknown) {
  if (!Array.isArray(value)) return 0
  return value.length
}

function normalizePolygonInput(value: unknown) {
  if (!Array.isArray(value)) {
    return [] as Array<{ lat: number; lng: number }>
  }

  return value
    .map((point) => {
      const raw = point as
        | {
            lat?: unknown
            lng?: unknown
            latitude?: unknown
            longitude?: unknown
          }
        | null
        | undefined
      return {
        lat: Number(raw?.lat ?? raw?.latitude),
        lng: Number(raw?.lng ?? raw?.longitude),
      }
    })
    .filter(
      (point) =>
        Number.isFinite(point.lat) &&
        Number.isFinite(point.lng) &&
        point.lat >= -90 &&
        point.lat <= 90 &&
        point.lng >= -180 &&
        point.lng <= 180
    )
}

router.post(
  '/upload-image',
  requirePermission(PermissionKey.SETTINGS_WRITE),
  upload.single('file'),
  async (req, res) => {
    try {
      const scope = await resolveTenantScope(req, req.body?.tenantId)
      const tenantId = scope.tenantId as string

      const imageTypeRaw = typeof req.body?.imageType === 'string' ? req.body.imageType : ''
      const imageType = imageTypeRaw.toLowerCase() as TenantImageType
      if (!['logo', 'cover', 'list', 'thumbnail'].includes(imageType)) {
        return res.status(400).json({
          error: 'Ungueltiger Bildtyp',
        })
      }

      const file = req.file
      if (!file) {
        return res.status(400).json({
          error: 'Keine Datei uebergeben',
        })
      }

      if (!isAllowedImageMimeType(file.mimetype)) {
        return res.status(400).json({
          error: 'Nur JPG, PNG und WEBP sind erlaubt',
        })
      }

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
        return res.status(404).json({
          error: 'Filiale nicht gefunden',
        })
      }

      const access = await enforceTenantAccess(req, tenant, 'write')
      if (!access.allowed) {
        return res.status(403).json({
          error: access.error || 'Kein Zugriff auf diese Filiale',
        })
      }

      const uploaded = await processAndStoreTenantImage({
        tenantId,
        imageType,
        originalFileName: file.originalname || 'upload',
        buffer: file.buffer,
      })
      const uploadedList =
        imageType === 'cover'
          ? await processAndStoreTenantImage({
              tenantId,
              imageType: 'list',
              originalFileName: file.originalname || 'upload',
              buffer: file.buffer,
            })
          : null
      const uploadedThumbnail =
        imageType === 'cover'
          ? await processAndStoreTenantImage({
              tenantId,
              imageType: 'thumbnail',
              originalFileName: file.originalname || 'upload',
              buffer: file.buffer,
            })
          : null

      const currentSettings = parseSettings(tenant.businessSettings, {
        name: tenant.name,
        email: tenant.email,
      })

      const nextSettings: BusinessSettings = {
        ...currentSettings,
        originalFileName: uploaded.originalFileName,
      }

      if (imageType === 'logo') {
        nextSettings.logoUrl = uploaded.url
      } else if (imageType === 'cover') {
        nextSettings.coverImageUrl = uploaded.url
        if (uploadedThumbnail) {
          nextSettings.thumbnailUrl = uploadedThumbnail.url
        }
        nextSettings.customerApp = {
          ...nextSettings.customerApp,
          orderHeaderImageUrl: uploaded.url,
        }
      } else if (imageType === 'thumbnail') {
        nextSettings.thumbnailUrl = uploaded.url
      }

      await prisma.tenant.update({
        where: { id: tenantId },
        data: {
          businessSettings: nextSettings as Prisma.InputJsonValue,
        },
      })

      await writeAuditLog({
        req,
        module: 'business-settings',
        action: 'image-upload',
        targetType: 'Tenant',
        targetId: tenantId,
        tenantId,
        metadata: {
          imageType,
          imageUrl: uploaded.url,
          listImageUrl: uploadedList?.url || null,
          thumbnailUrl: uploadedThumbnail?.url || null,
        },
      })

      return res.json({
        ok: true,
        imageType,
        url: uploaded.url,
        originalFileName: uploaded.originalFileName,
        dimensions: {
          width: uploaded.width,
          height: uploaded.height,
        },
        listImageUrl: uploadedList?.url || null,
        thumbnailUrl: uploadedThumbnail?.url || null,
        note: 'Bild wird automatisch optimiert.',
      })
    } catch (error) {
      console.error('BUSINESS SETTINGS IMAGE UPLOAD ERROR:', error)
      if (error instanceof multer.MulterError && error.code === 'LIMIT_FILE_SIZE') {
        return res.status(413).json({
          error: 'Datei ist zu gross (max. 10 MB).',
        })
      }
      if (error instanceof Error && /Input buffer contains unsupported image format/i.test(error.message)) {
        return res.status(400).json({
          error: 'Bildformat wird nicht unterstuetzt',
        })
      }
      const tenantScopeError = asTenantScopeError(error)
      if (tenantScopeError) {
        return res.status(tenantScopeError.status).json({
          error: tenantScopeError.message,
        })
      }
      return res.status(500).json({
        error: 'Bild konnte nicht verarbeitet werden',
      })
    }
  }
)

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
    const bodyAsRecord =
      req.body && typeof req.body === 'object' ? (req.body as Record<string, unknown>) : null
    const looksLikeDirectSettingsPayload =
      Boolean(bodyAsRecord) &&
      (Object.prototype.hasOwnProperty.call(bodyAsRecord!, 'deliveryArea') ||
        Object.prototype.hasOwnProperty.call(bodyAsRecord!, 'customerApp') ||
        Object.prototype.hasOwnProperty.call(bodyAsRecord!, 'ordering') ||
        Object.prototype.hasOwnProperty.call(bodyAsRecord!, 'deliveryHours'))
    const settingsInputRaw =
      req.body.settings !== undefined
        ? (req.body.settings as unknown)
        : looksLikeDirectSettingsPayload
          ? req.body
          : null
    const settingsInput =
      settingsInputRaw && typeof settingsInputRaw === 'object'
        ? { ...(settingsInputRaw as Record<string, unknown>) }
        : settingsInputRaw
    const bodyDeliveryAreaPolygon = req.body?.deliveryAreaPolygon
    const bodyServiceAreaPolygon = req.body?.serviceAreaPolygon
    if (
      settingsInput &&
      typeof settingsInput === 'object' &&
      (Array.isArray(bodyDeliveryAreaPolygon) || Array.isArray(bodyServiceAreaPolygon))
    ) {
      const sourcePolygon = Array.isArray(bodyDeliveryAreaPolygon)
        ? bodyDeliveryAreaPolygon
        : bodyServiceAreaPolygon
      const currentDeliveryArea =
        (settingsInput as { deliveryArea?: unknown }).deliveryArea &&
        typeof (settingsInput as { deliveryArea?: unknown }).deliveryArea === 'object'
          ? ((settingsInput as { deliveryArea: Record<string, unknown> }).deliveryArea as Record<
              string,
              unknown
            >)
          : {}
      const currentPolygonPath = Array.isArray(
        (currentDeliveryArea as { polygonPath?: unknown }).polygonPath
      )
        ? ((currentDeliveryArea as { polygonPath?: unknown[] }).polygonPath as unknown[])
        : []
      // Backward compatibility: only lift top-level polygon fields when nested deliveryArea polygon is empty.
      if (currentPolygonPath.length === 0) {
        ;(settingsInput as Record<string, unknown>).deliveryArea = {
          ...currentDeliveryArea,
          polygonPath: sourcePolygon,
        }
      }
    }
    const deliveryAreaInput =
      settingsInput && typeof settingsInput === 'object'
        ? (settingsInput as { deliveryArea?: unknown }).deliveryArea
        : null
    console.log('BACKEND_POLYGON_INPUT', JSON.stringify(req.body, null, 2))

    if (deliveryAreaInput && typeof deliveryAreaInput === 'object') {
      const deliveryAreaRecord = deliveryAreaInput as Record<string, unknown>
      const rawPolygonInput = Array.isArray(deliveryAreaRecord.polygonPath)
        ? deliveryAreaRecord.polygonPath
        : Array.isArray(deliveryAreaRecord.polygonPoints)
          ? deliveryAreaRecord.polygonPoints
          : []

      const normalizedPolygon = rawPolygonInput
        .map((point: any) => {
          const rawLat = point?.lat ?? point?.latitude
          const rawLng = point?.lng ?? point?.longitude

          const lat = Number(rawLat)
          const lng = Number(rawLng)

          if (!Number.isFinite(lat) || !Number.isFinite(lng)) {
            return null
          }

          return { lat, lng }
        })
        .filter((point): point is { lat: number; lng: number } => Boolean(point))
        .filter(
          (point) =>
            Number.isFinite(point.lat) &&
            Number.isFinite(point.lng) &&
            point.lat >= -90 &&
            point.lat <= 90 &&
            point.lng >= -180 &&
            point.lng <= 180
        )
      console.log('NORMALIZED_POLYGON_FINAL', normalizedPolygon)

      ;(settingsInput as Record<string, unknown>).deliveryArea = {
        ...deliveryAreaRecord,
        polygonPath: normalizedPolygon,
      }
    }

    console.info('BUSINESS_SETTINGS_SAVE_PAYLOAD', {
      tenantIdInput: tenantIdInput ?? null,
      hasSettings: Boolean(settingsInput && typeof settingsInput === 'object'),
      topLevelKeys: req.body && typeof req.body === 'object' ? Object.keys(req.body) : [],
      topLevelDeliveryAreaPolygonLength: Array.isArray(bodyDeliveryAreaPolygon)
        ? bodyDeliveryAreaPolygon.length
        : null,
      topLevelServiceAreaPolygonLength: Array.isArray(bodyServiceAreaPolygon)
        ? bodyServiceAreaPolygon.length
        : null,
      deliveryAreaKeys:
        deliveryAreaInput && typeof deliveryAreaInput === 'object'
          ? Object.keys(deliveryAreaInput as Record<string, unknown>)
          : [],
      strategy:
        deliveryAreaInput && typeof deliveryAreaInput === 'object'
          ? ((deliveryAreaInput as { strategy?: unknown }).strategy ?? null)
          : null,
      polygonPathPoints:
        deliveryAreaInput &&
        typeof deliveryAreaInput === 'object' &&
        Array.isArray((deliveryAreaInput as { polygonPath?: unknown }).polygonPath)
          ? (deliveryAreaInput as { polygonPath: unknown[] }).polygonPath.length
          : null,
      polygonPoints:
        deliveryAreaInput &&
        typeof deliveryAreaInput === 'object' &&
        Array.isArray((deliveryAreaInput as { polygonPoints?: unknown }).polygonPoints)
          ? (deliveryAreaInput as { polygonPoints: unknown[] }).polygonPoints.length
          : null,
    })

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
    const rawPolygonPathLength =
      deliveryAreaInput &&
      typeof deliveryAreaInput === 'object' &&
      Array.isArray((deliveryAreaInput as { polygonPath?: unknown }).polygonPath)
        ? countRawPolygonPoints((deliveryAreaInput as { polygonPath: unknown[] }).polygonPath)
        : 0
    const rawPolygonPointsLength =
      deliveryAreaInput &&
      typeof deliveryAreaInput === 'object' &&
      Array.isArray((deliveryAreaInput as { polygonPoints?: unknown }).polygonPoints)
        ? countRawPolygonPoints((deliveryAreaInput as { polygonPoints: unknown[] }).polygonPoints)
        : 0
    const rawPolygonInputLength = Math.max(rawPolygonPathLength, rawPolygonPointsLength)
    console.info('BUSINESS_SETTINGS_DELIVERY_SAVE_ATTEMPT', {
      tenantId,
      strategy: normalizedSettings.deliveryArea.strategy,
      enabled: normalizedSettings.deliveryArea.enabled,
      polygonPoints: normalizedSettings.deliveryArea.polygonPath.length,
    })
    const polygonValidationError = validatePolygonSettings(normalizedSettings.deliveryArea)
    if (polygonValidationError) {
      const normalizedPolygonLength = normalizedSettings.deliveryArea.polygonPath.length
      const strategy = normalizedSettings.deliveryArea.strategy
      const hasReadableRawPolygon = rawPolygonInputLength >= 3
      const likelyFieldMappingIssue =
        strategy === 'POLYGON' && hasReadableRawPolygon && normalizedPolygonLength < 3
      const improvedError = likelyFieldMappingIssue
        ? 'Polygon konnte nicht normalisiert werden. Bitte Punkte als lat/lng oder latitude/longitude (Zahlen) senden.'
        : polygonValidationError
      console.warn('BUSINESS_SETTINGS_POLYGON_VALIDATION_ERROR', {
        tenantId,
        error: improvedError,
        requestBodyKeys: req.body && typeof req.body === 'object' ? Object.keys(req.body) : [],
        settingsKeys:
          settingsInput && typeof settingsInput === 'object'
            ? Object.keys(settingsInput as Record<string, unknown>)
            : [],
        deliveryAreaKeys:
          deliveryAreaInput && typeof deliveryAreaInput === 'object'
            ? Object.keys(deliveryAreaInput as Record<string, unknown>)
            : [],
        rawPolygonPathLength,
        rawPolygonPointsLength,
        rawPolygonInputLength,
        rawPolygonPathSample:
          deliveryAreaInput &&
          typeof deliveryAreaInput === 'object' &&
          Array.isArray((deliveryAreaInput as { polygonPath?: unknown }).polygonPath)
            ? (deliveryAreaInput as { polygonPath: unknown[] }).polygonPath.slice(0, 3)
            : null,
        rawPolygonPointsSample:
          deliveryAreaInput &&
          typeof deliveryAreaInput === 'object' &&
          Array.isArray((deliveryAreaInput as { polygonPoints?: unknown }).polygonPoints)
            ? (deliveryAreaInput as { polygonPoints: unknown[] }).polygonPoints.slice(0, 3)
            : null,
        normalizedPolygonLength: normalizedSettings.deliveryArea.polygonPath.length,
        normalizedPolygonSample: normalizedSettings.deliveryArea.polygonPath.slice(0, 3),
      })
      return res.status(400).json({
        error: improvedError,
        field: 'settings.deliveryArea.polygonPath',
        receivedPolygonPathLength: rawPolygonPathLength,
        receivedPolygonPointsLength: rawPolygonPointsLength,
        normalizedPolygonLength,
      })
    }

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
    console.error('UPDATE BUSINESS SETTINGS ERROR:', {
      tenantId: req.body?.tenantId ?? null,
      strategy: req.body?.settings?.deliveryArea?.strategy ?? null,
      polygonPoints: Array.isArray(req.body?.settings?.deliveryArea?.polygonPath)
        ? req.body.settings.deliveryArea.polygonPath.length
        : null,
      message: error instanceof Error ? error.message : String(error),
      stack: error instanceof Error ? error.stack : null,
    })
    return res.status(500).json({ error: 'Einstellungen konnten nicht gespeichert werden' })
  }
})

export default router
