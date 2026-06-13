import { Request, Router } from 'express'
import { PermissionKey, Prisma, UserRole } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import {
  matchServiceArea,
  normalizeText,
  normalizeZipCode,
  parseSettings,
  resolveEffectiveServiceAreaFromBusinessSettings,
  type DeliveryZoneSettings,
  type ServiceAreaSettings,
  type WeekDay,
} from '../lib/business-settings'
import { getTenantOrderingAvailabilityFromSettings } from '../lib/ordering-availability'
import { resolveDeliveryAvailabilityTimeZone } from '../lib/delivery-availability'
import { resolveProductOffers } from '../lib/action-pricing'
import {
  provisionTenantDatabase,
  releaseTenantDatabaseToUnassigned,
} from '../lib/database-provisioning'
import { mergePayoutProfile, readDefaultPayoutProfile } from '../lib/payout-profile'
import { decodeStoredProductModifierName } from '../lib/product-modifiers'
import { isStripePublishableKeyConfigured, resolveStripeRuntimeMode } from '../lib/stripe'
import {
  ensureProductBadgesColumn,
  isMissingProductBadgesColumnError,
  readStoredProductBadges,
} from '../lib/product-badges-store'
import {
  getLegacyProductBadgeFlags,
  normalizeProductBadges,
} from '../lib/product-badges'

const router = Router()
const MAX_PUBLIC_INLINE_ASSET_LENGTH = 12_000_000
const ENABLE_PUBLIC_DISCOVERY_DEBUG_LOGS =
  String(process.env.DELIVERY_AREA_DEBUG || '').trim().toLowerCase() === 'true'

function formatZoneAmountLabel(value: number | null | undefined) {
  if (typeof value !== 'number' || !Number.isFinite(value)) {
    return null
  }
  return `${value.toFixed(2)} EUR`
}

function parseAmountLabel(value: string | null | undefined) {
  if (typeof value !== 'string') {
    return null
  }

  const normalized = value.replace(',', '.')
  const match = normalized.match(/-?\d+(?:\.\d+)?/)
  if (!match) {
    return null
  }

  const parsed = Number(match[0])
  return Number.isFinite(parsed) ? parsed : null
}

function toPublicTenantSlug(value: string | null | undefined, fallbackId: string) {
  const base = normalizeText(value)?.toLowerCase() ?? ''
  const slug = base
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')

  return slug || fallbackId
}

function deliveryZoneToServiceArea(zone: DeliveryZoneSettings): ServiceAreaSettings {
  return {
    enabled: zone.enabled,
    strategy: zone.strategy,
    zipCodes: zone.zipCodes,
    excludedZipCodes: zone.excludedZipCodes,
    excludedStreets: zone.excludedStreets,
    radiusKm: zone.radiusKm,
    polygonPath: zone.polygonPath,
    centerLatitude: zone.centerLatitude,
    centerLongitude: zone.centerLongitude,
    centerZipCode: zone.centerZipCode,
    centerCity: zone.centerCity,
    centerStreet: zone.centerStreet,
    notes: zone.notes,
  }
}

function scopedTenantWhere(req: Request) {
  const actor = req.authUser

  if (!actor) {
    return {}
  }

  if (actor.role === UserRole.CHAINADMIN && actor.chainId) {
    return { chainId: actor.chainId }
  }

  if ((actor.role === UserRole.ADMIN || actor.role === UserRole.STAFF) && actor.tenantId) {
    return { id: actor.tenantId }
  }

  return {}
}

function parseCoordinate(value: unknown) {
  if (typeof value === 'number' && Number.isFinite(value)) {
    return value
  }

  if (typeof value === 'string') {
    const trimmed = value.trim()
    if (!trimmed) {
      return null
    }

    const parsed = Number(trimmed.replace(',', '.'))
    if (Number.isFinite(parsed)) {
      return parsed
    }
  }

  return null
}

async function geocodeSearchLocation(input: {
  zipCode: string
  street?: string | null
  city?: string | null
}) {
  const street = normalizeText(input.street)
  const city = normalizeText(input.city)
  const normalizeStreetInput = (value: string) =>
    value
      .trim()
      .replace(/\s+/g, ' ')
      .replace(/\bstr\.\b/gi, 'straße')
      .replace(/\bstr\b/gi, 'straße')

  const toStreetVariants = (value: string | null) => {
    if (!value) return [] as string[]
    const base = normalizeStreetInput(value)
    const variants = new Set<string>([base])
    if (base.includes('ß')) variants.add(base.replace(/ß/g, 'ss'))
    if (base.toLowerCase().includes('ss')) variants.add(base.replace(/ss/gi, 'ß'))
    if (base.toLowerCase().includes('straße')) variants.add(base.replace(/straße/gi, 'strasse'))
    if (base.toLowerCase().includes('strasse')) variants.add(base.replace(/strasse/gi, 'straße'))
    return Array.from(variants).slice(0, 6)
  }

  const streetVariants = toStreetVariants(street)
  const queryVariants = (streetVariants.length > 0 ? streetVariants : [null]).map((streetVariant) =>
    streetVariant
      ? `${streetVariant}, ${input.zipCode}${city != null ? `, ${city}` : ''}, Germany`
      : `${input.zipCode}${city != null ? `, ${city}` : ''}, Germany`
  )

  const triedVariants: string[] = []
  for (const query of queryVariants) {
    triedVariants.push(query)
    const url = `https://nominatim.openstreetmap.org/search?format=jsonv2&limit=5&q=${encodeURIComponent(query)}`
    const controller = new AbortController()
    const timeout = setTimeout(() => controller.abort(), 4500)
    try {
      const response = await fetch(url, {
        method: 'GET',
        headers: {
          'User-Agent': 'Klarando/1.0 (public-discovery geocoding)',
          Accept: 'application/json',
        },
        signal: controller.signal,
      })
      if (!response.ok) {
        continue
      }
      const payload = (await response.json()) as Array<{ lat?: string; lon?: string; display_name?: string }>
      if (!Array.isArray(payload) || payload.length === 0) {
        continue
      }
      const first = payload[0]
      const latitude = parseCoordinate(first.lat ?? null)
      const longitude = parseCoordinate(first.lon ?? null)
      if (latitude === null || longitude === null) {
        continue
      }
      console.info('ADDRESS_NORMALIZATION', {
        inputStreet: street,
        triedVariants,
        selectedAddress: first.display_name ?? query,
        latitude,
        longitude,
      })
      return {
        latitude,
        longitude,
        selectedAddress: first.display_name ?? null,
        triedVariants,
      }
    } catch {
      // continue with next variant
    } finally {
      clearTimeout(timeout)
    }
  }
  console.info('ADDRESS_NORMALIZATION', {
    inputStreet: street,
    triedVariants,
    selectedAddress: null,
    latitude: null,
    longitude: null,
  })
  return null
}

const WEEKDAY_INDEX: Record<string, number> = {
  SUNDAY: 0,
  MONDAY: 1,
  TUESDAY: 2,
  WEDNESDAY: 3,
  THURSDAY: 4,
  FRIDAY: 5,
  SATURDAY: 6,
}

function dayKeyFromIndex(value: number): WeekDay {
  const entry = (Object.entries(WEEKDAY_INDEX) as Array<[WeekDay, number]>).find(
    ([, index]) => index === value
  )
  return entry?.[0] ?? 'MONDAY'
}

function parseTimeToMinutes(value: string | null) {
  if (!value || !/^\d{2}:\d{2}$/.test(value)) {
    return null
  }
  const [hourRaw, minuteRaw] = value.split(':')
  const hour = Number(hourRaw)
  const minute = Number(minuteRaw)
  if (!Number.isInteger(hour) || !Number.isInteger(minute)) {
    return null
  }
  return hour * 60 + minute
}

function resolveDeliveryScheduleState(settings: ReturnType<typeof parseSettings>) {
  const now = new Date()
  const schedule = settings.timeManagement.deliveryScheduling
  const dayIndex = now.getDay()
  const nowMinutes = now.getHours() * 60 + now.getMinutes()
  const todayKey = dayKeyFromIndex(dayIndex)
  const allowedDays = new Set(schedule.allowedDeliveryDays)
  const dayAllowed = allowedDays.has(todayKey)

  const normalizedSlots = schedule.timeSlots
    .map((slot) => ({
      ...slot,
      dayIndex: WEEKDAY_INDEX[slot.day] ?? -1,
      startMinutes: parseTimeToMinutes(slot.start),
      endMinutes: parseTimeToMinutes(slot.end),
    }))
    .filter(
      (slot) =>
        slot.dayIndex >= 0 &&
        slot.startMinutes !== null &&
        slot.endMinutes !== null &&
        slot.startMinutes < slot.endMinutes
    )

  const hasSlots = normalizedSlots.length > 0
  const isWithinTodaySlot = normalizedSlots.some(
    (slot) =>
      slot.dayIndex === dayIndex &&
      nowMinutes >= (slot.startMinutes as number) &&
      nowMinutes <= (slot.endMinutes as number)
  )

  const availableNow = dayAllowed && (!hasSlots || isWithinTodaySlot)

  let nextAvailableAt: string | null = null
  if (!availableNow) {
    const horizonDays = 21
    const midnightToday = new Date(now)
    midnightToday.setHours(0, 0, 0, 0)
    let bestCandidate: Date | null = null
    for (let offset = 0; offset <= horizonDays; offset += 1) {
      const dayDate = new Date(midnightToday)
      dayDate.setDate(midnightToday.getDate() + offset)
      const checkDayIndex = dayDate.getDay()
      const checkDayKey = dayKeyFromIndex(checkDayIndex)
      if (!checkDayKey || !allowedDays.has(checkDayKey)) {
        continue
      }

      const slotsForDay = normalizedSlots
        .filter((slot) => slot.dayIndex === checkDayIndex)
        .sort((left, right) => (left.startMinutes as number) - (right.startMinutes as number))

      if (slotsForDay.length === 0) {
        if (offset > 0) {
          bestCandidate = dayDate
          break
        }
        continue
      }

      for (const slot of slotsForDay) {
        const candidate = new Date(dayDate)
        candidate.setHours(Math.floor((slot.startMinutes as number) / 60), (slot.startMinutes as number) % 60, 0, 0)
        if (candidate.getTime() > now.getTime()) {
          bestCandidate = candidate
          break
        }
      }

      if (bestCandidate) {
        break
      }
    }
    nextAvailableAt = bestCandidate ? bestCandidate.toISOString() : null
  }

  return {
    availableNow,
    nextAvailableAt,
    hasSlots,
    todayKey,
  }
}

function resolveDiscoveryRejectionReason(input: {
  areaMatched: boolean
  configurationIncomplete: boolean
  requiresLocation: boolean
  orderIntakeEnabled: boolean
  serviceEnabledNow: boolean
  canOrderNow: boolean
  canPreorder: boolean
  isOpen: boolean
}) {
  if (!input.areaMatched) {
    if (input.requiresLocation) {
      return 'LOCATION_REQUIRED'
    }
    if (input.configurationIncomplete) {
      return 'CONFIG_PENDING'
    }
    return 'OUT_OF_AREA'
  }

  if (!input.orderIntakeEnabled) {
    return 'ORDER_INTAKE_PAUSED'
  }
  if (!input.serviceEnabledNow) {
    return 'SERVICE_DISABLED_NOW'
  }
  if (input.canOrderNow) {
    return null
  }
  if (input.canPreorder) {
    return 'PREORDER_ONLY'
  }
  if (!input.isOpen) {
    return 'CLOSED'
  }
  return 'OUTSIDE_SCHEDULE'
}

function parseAllergenCodes(raw: string | null) {
  if (!raw) {
    return [] as string[]
  }

  return Array.from(
    new Set(
      raw
        .split(',')
        .map((entry) => entry.trim().toUpperCase())
        .filter(Boolean)
    )
  ).sort()
}

function isPackagingCategory(value: unknown) {
  return typeof value === 'string' && value.trim().toUpperCase() === 'PACKAGING'
}

function readBooleanQuery(value: unknown) {
  const raw = Array.isArray(value) ? value[0] : value
  if (typeof raw !== 'string') {
    return false
  }

  const normalized = raw.trim().toLowerCase()
  return normalized === '1' || normalized === 'true' || normalized === 'yes'
}

function sanitizePublicAssetUrl(value: string | null | undefined) {
  if (typeof value !== 'string') {
    return null
  }

  const trimmed = value.trim()
  if (!trimmed) {
    return null
  }

  // Oversized inline base64 payloads make discovery/catalog responses very slow for mobile clients.
  if (trimmed.toLowerCase().startsWith('data:')) {
    if (trimmed.length > MAX_PUBLIC_INLINE_ASSET_LENGTH) {
      return null
    }
    return trimmed
  }

  return trimmed
}

function sanitizePublicCustomerApp(
  customerApp: ReturnType<typeof parseSettings>['customerApp']
) {
  return {
    ...customerApp,
    orderHeaderImageUrl: sanitizePublicAssetUrl(customerApp.orderHeaderImageUrl),
  }
}

function parseStarsFromAuditMetadata(metadata: unknown) {
  if (!metadata || typeof metadata !== 'object') {
    return null
  }
  const raw = (metadata as { stars?: unknown }).stars
  const parsed = Number(raw)
  if (!Number.isInteger(parsed) || parsed < 1 || parsed > 5) {
    return null
  }
  return parsed
}

function normalizeMoney(value: unknown, fallback = 0) {
  const parsed = Number(value)
  if (!Number.isFinite(parsed) || parsed < 0) {
    return fallback
  }
  return Number(parsed.toFixed(2))
}

function normalizeAgeRestriction(value: unknown) {
  if (typeof value !== 'string') {
    return 'NONE'
  }
  const normalized = value.trim().toUpperCase()
  if (normalized === 'AGE_16' || normalized === 'AGE_18') {
    return normalized
  }
  return 'NONE'
}

function isMissingProductColumnsError(error: unknown) {
  if (!(error instanceof Error)) {
    return false
  }

  return (
    isMissingProductBadgesColumnError(error) ||
    error.message.includes('Category.imageUrl') ||
    error.message.includes('"Category"."imageUrl"') ||
    error.message.includes('ProductIngredient.displayNameOverride') ||
    error.message.includes('"displayNameOverride"') ||
    error.message.includes('ProductIngredient.showInCustomerApp') ||
    error.message.includes('"showInCustomerApp"') ||
    error.message.includes('ProductIngredient.showInOrderDisplay') ||
    error.message.includes('"showInOrderDisplay"') ||
    error.message.includes('ProductIngredient.showInMenuBoard') ||
    error.message.includes('"showInMenuBoard"') ||
    error.message.includes('ProductIngredient.showInOrderDesk') ||
    error.message.includes('"showInOrderDesk"') ||
    error.message.includes('ProductIngredient.showInCashierDisplay') ||
    error.message.includes('"showInCashierDisplay"') ||
    error.message.includes('Product.beverageContainerType') ||
    error.message.includes('beverageContainerType') ||
    error.message.includes('Product.deposit') ||
    error.message.includes('"deposit"') ||
    error.message.includes('Product.articleInfo') ||
    error.message.includes('"articleInfo"') ||
    error.message.includes('Product.foodBusinessOperator') ||
    error.message.includes('"foodBusinessOperator"') ||
    error.message.includes('Product.nutritionInfo') ||
    error.message.includes('"nutritionInfo"') ||
    error.message.includes('Product.nutrition') ||
    error.message.includes('"nutrition"') ||
    error.message.includes('Product.isBeverage') ||
    error.message.includes('Product.contentVolumeLiters') ||
    error.message.includes('Product.ageRestriction') ||
    error.message.includes('Product.isVegetarian') ||
    error.message.includes('Product.isVegan') ||
    error.message.includes('Product.isSpicy') ||
    error.message.includes('Product.isVerySpicy') ||
    error.message.includes('Product.isNew') ||
    error.message.includes('Product.isPopular')
  )
}

function isMissingProductModifierSchemaError(error: unknown) {
  if (!(error instanceof Error)) {
    return false
  }

  return (
    error.message.includes('ProductModifier') ||
    error.message.includes('"ProductModifier"') ||
    error.message.includes('modifiers')
  )
}

function isMissingActionPricingSchemaError(error: unknown) {
  if (!(error instanceof Error)) {
    return false
  }

  return (
    error.message.includes('Action.displayAsMenu') ||
    error.message.includes('"displayAsMenu"') ||
    error.message.includes('Action.hidePriceOnScreen') ||
    error.message.includes('"hidePriceOnScreen"') ||
    error.message.includes('ActionProduct') ||
    error.message.includes('"ActionProduct"')
  )
}

async function ensureProductColumns() {
  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Category"
    ADD COLUMN IF NOT EXISTS "imageUrl" TEXT;
  `)

  await prisma.$executeRawUnsafe(`
    DO $$
    BEGIN
      IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'BeverageContainerType') THEN
        CREATE TYPE "BeverageContainerType" AS ENUM ('NONE', 'EINWEG', 'MEHRWEG');
      END IF;
    END
    $$;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "beverageContainerType" "BeverageContainerType" NOT NULL DEFAULT 'NONE';
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "deposit" DECIMAL(10, 2) NOT NULL DEFAULT 0;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "articleInfo" TEXT;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "foodBusinessOperator" TEXT;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "nutritionInfo" TEXT;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "nutrition" JSONB;
  `)

  await prisma.$executeRawUnsafe(`
    DO $$
    BEGIN
      IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'ProductAgeRestriction') THEN
        CREATE TYPE "ProductAgeRestriction" AS ENUM ('NONE', 'AGE_16', 'AGE_18');
      END IF;
    END
    $$;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "isBeverage" BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN IF NOT EXISTS "contentVolumeLiters" DECIMAL(10, 3),
    ADD COLUMN IF NOT EXISTS "ageRestriction" "ProductAgeRestriction" NOT NULL DEFAULT 'NONE',
    ADD COLUMN IF NOT EXISTS "badges" TEXT[] NOT NULL DEFAULT ARRAY[]::TEXT[],
    ADD COLUMN IF NOT EXISTS "isVegetarian" BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN IF NOT EXISTS "isVegan" BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN IF NOT EXISTS "isSpicy" BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN IF NOT EXISTS "isVerySpicy" BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN IF NOT EXISTS "isNew" BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN IF NOT EXISTS "isPopular" BOOLEAN NOT NULL DEFAULT false;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "ProductIngredient"
    ADD COLUMN IF NOT EXISTS "displayNameOverride" TEXT,
    ADD COLUMN IF NOT EXISTS "showInCustomerApp" BOOLEAN NOT NULL DEFAULT true,
    ADD COLUMN IF NOT EXISTS "showInOrderDisplay" BOOLEAN NOT NULL DEFAULT true,
    ADD COLUMN IF NOT EXISTS "showInMenuBoard" BOOLEAN NOT NULL DEFAULT true,
    ADD COLUMN IF NOT EXISTS "showInOrderDesk" BOOLEAN NOT NULL DEFAULT true,
    ADD COLUMN IF NOT EXISTS "showInCashierDisplay" BOOLEAN NOT NULL DEFAULT true;
  `)
}

async function loadProductBadges(productIds: string[]) {
  try {
    return await readStoredProductBadges(productIds)
  } catch (error) {
    if (!isMissingProductBadgesColumnError(error)) {
      console.error('PUBLIC_TENANT_CATALOG_BADGES_FALLBACK', {
        productIds,
        message: error instanceof Error ? error.message : String(error),
        stack: error instanceof Error ? error.stack : undefined,
      })
      return new Map()
    }
    await ensureProductBadgesColumn()
    try {
      return await readStoredProductBadges(productIds)
    } catch (retryError) {
      console.error('PUBLIC_TENANT_CATALOG_BADGES_FALLBACK', {
        productIds,
        message: retryError instanceof Error ? retryError.message : String(retryError),
        stack: retryError instanceof Error ? retryError.stack : undefined,
      })
      return new Map()
    }
  }
}

async function copyTenantBaseData(
  sourceTenantId: string,
  targetTenantId: string
) {
  const [sourceTenant, categories, ingredients, products] = await Promise.all([
    prisma.tenant.findUnique({
      where: { id: sourceTenantId },
      select: { businessSettings: true },
    }),
    prisma.category.findMany({
      where: { tenantId: sourceTenantId },
      orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
    }),
    prisma.ingredient.findMany({
      where: { tenantId: sourceTenantId },
      orderBy: [{ createdAt: 'asc' }],
    }),
    prisma.product.findMany({
      where: { tenantId: sourceTenantId },
      include: {
        ingredients: true,
        modifiers: true,
      },
      orderBy: [{ createdAt: 'asc' }],
    }),
  ])

  await prisma.$transaction(async (tx) => {
    const categoryIdMap = new Map<string, string>()
    for (const category of categories) {
      const created = await tx.category.create({
        data: {
          tenantId: targetTenantId,
          name: category.name,
          sortOrder: category.sortOrder,
          imageUrl: category.imageUrl,
        },
      })
      categoryIdMap.set(category.id, created.id)
    }

    const ingredientIdMap = new Map<string, string>()
    for (const ingredient of ingredients) {
      const created = await tx.ingredient.create({
        data: {
          tenantId: targetTenantId,
          name: ingredient.name,
          category: ingredient.category,
          unit: ingredient.unit,
          recipeUnit: ingredient.recipeUnit,
          gramsPerPurchaseUnit: ingredient.gramsPerPurchaseUnit,
          purchasePrice: ingredient.purchasePrice,
          minimumStock: ingredient.minimumStock,
          consumptionFactorPercent: ingredient.consumptionFactorPercent,
          deposit: ingredient.deposit,
          ean: ingredient.ean,
          unitEans: ingredient.unitEans
            ? (ingredient.unitEans as Prisma.InputJsonValue)
            : undefined,
          allergens: ingredient.allergens,
          supplier: ingredient.supplier,
          articleNumber: ingredient.articleNumber,
        },
      })
      ingredientIdMap.set(ingredient.id, created.id)
    }

    for (const product of products) {
      const nutritionInput =
        product.nutrition == null
          ? undefined
          : (product.nutrition as Prisma.InputJsonValue)

      const createdProduct = await tx.product.create({
        data: {
          tenantId: targetTenantId,
          categoryId: product.categoryId ? categoryIdMap.get(product.categoryId) || null : null,
          productNumber: product.productNumber,
          name: product.name,
          imageUrl: product.imageUrl,
          ean: product.ean,
          unitEans: product.unitEans
            ? (product.unitEans as Prisma.InputJsonValue)
            : undefined,
          beverageContainerType: product.beverageContainerType,
          isBeverage: product.isBeverage,
          contentVolumeLiters: product.contentVolumeLiters,
          deposit: product.deposit,
          ageRestriction: product.ageRestriction,
          isVegetarian: product.isVegetarian,
          isVegan: product.isVegan,
          isSpicy: product.isSpicy,
          isVerySpicy: product.isVerySpicy,
          isNew: product.isNew,
          isPopular: product.isPopular,
          articleInfo: product.articleInfo,
          foodBusinessOperator: product.foodBusinessOperator,
          nutritionInfo: product.nutritionInfo,
          nutrition: nutritionInput,
          price: product.price,
          vatRate: product.vatRate,
          available: product.available,
        },
      })

      for (const relation of product.ingredients) {
        const mappedIngredientId = ingredientIdMap.get(relation.ingredientId)
        if (!mappedIngredientId) {
          continue
        }
        await tx.productIngredient.create({
          data: {
            productId: createdProduct.id,
            ingredientId: mappedIngredientId,
            quantity: relation.quantity,
          },
        })
      }

      for (const modifier of product.modifiers) {
        await tx.productModifier.create({
          data: {
            tenantId: targetTenantId,
            productId: createdProduct.id,
            ingredientId: modifier.ingredientId
              ? ingredientIdMap.get(modifier.ingredientId) || null
              : null,
            name: modifier.name,
            priceDelta: modifier.priceDelta,
            isDefaultSelected: modifier.isDefaultSelected,
            isActive: modifier.isActive,
            sortOrder: modifier.sortOrder,
          },
        })
      }
    }

    if (sourceTenant?.businessSettings) {
      await tx.tenant.update({
        where: { id: targetTenantId },
        data: {
          businessSettings: sourceTenant.businessSettings as Prisma.InputJsonValue,
        },
      })
    }
  })
}

async function resolvePayoutProfileForTenant(chainId: string | null) {
  const envDefaults = readDefaultPayoutProfile()

  if (!chainId) {
    return envDefaults
  }

  const chain = await prisma.chain.findUnique({
    where: { id: chainId },
    select: {
      payoutAccountHolder: true,
      payoutBankName: true,
      payoutIban: true,
      payoutBic: true,
      payoutEmail: true,
      payoutReference: true,
    },
  })

  if (!chain) {
    return envDefaults
  }

  return mergePayoutProfile(
    {
      payoutAccountHolder: chain.payoutAccountHolder || undefined,
      payoutBankName: chain.payoutBankName || undefined,
      payoutIban: chain.payoutIban || undefined,
      payoutBic: chain.payoutBic || undefined,
      payoutEmail: chain.payoutEmail || undefined,
      payoutReference: chain.payoutReference || undefined,
    },
    envDefaults
  )
}

async function ensureTenantPayoutSettings(tenantId: string) {
  const tenant = await prisma.tenant.findUnique({
    where: { id: tenantId },
    select: {
      id: true,
      name: true,
      email: true,
      chainId: true,
      businessSettings: true,
    },
  })

  if (!tenant) {
    return false
  }

  const current = parseSettings(tenant.businessSettings, {
    name: tenant.name,
    email: tenant.email,
  })

  const payoutProfile = await resolvePayoutProfileForTenant(tenant.chainId)

  const next = {
    ...current,
    payoutAccountHolder: current.payoutAccountHolder || payoutProfile.payoutAccountHolder,
    payoutBankName: current.payoutBankName || payoutProfile.payoutBankName,
    payoutIban: current.payoutIban || payoutProfile.payoutIban,
    payoutBic: current.payoutBic || payoutProfile.payoutBic,
    payoutEmail: current.payoutEmail || payoutProfile.payoutEmail,
    payoutReference:
      current.payoutReference || `${payoutProfile.payoutReference}-${tenant.id.slice(0, 8).toUpperCase()}`,
  }

  const changed =
    next.payoutAccountHolder !== current.payoutAccountHolder ||
    next.payoutBankName !== current.payoutBankName ||
    next.payoutIban !== current.payoutIban ||
    next.payoutBic !== current.payoutBic ||
    next.payoutEmail !== current.payoutEmail ||
    next.payoutReference !== current.payoutReference

  if (!changed) {
    return false
  }

  await prisma.tenant.update({
    where: { id: tenant.id },
    data: {
      businessSettings: next as unknown as Prisma.InputJsonValue,
    },
  })

  return true
}

router.get('/public/discovery', async (req, res) => {
  try {
    const zipCode = normalizeZipCode(req.query.zipCode)
    if (!zipCode) {
      return res.status(400).json({ error: 'zipCode fehlt oder ist ungueltig (5-stellig)' })
    }

    const modeRaw = typeof req.query.mode === 'string' ? req.query.mode.trim().toLowerCase() : ''
    const mode = modeRaw === 'pickup' || modeRaw === 'delivery' ? modeRaw : 'all'
    const includeOutOfArea = readBooleanQuery(req.query.includeOutOfArea)
    const street = normalizeText(
      req.query.street ??
        req.query.strasse ??
        req.query.address ??
        req.query.streetAddress ??
        null
    )
    const city = normalizeText(req.query.city)
    const latitude = parseCoordinate(req.query.latitude ?? req.query.lat)
    const longitude = parseCoordinate(
      req.query.longitude ?? req.query.lng ?? req.query.lon
    )
    const geocodedLocation =
      latitude === null || longitude === null
        ? await geocodeSearchLocation({ zipCode, street, city })
        : null
    const effectiveLatitude = latitude ?? geocodedLocation?.latitude ?? null
    const effectiveLongitude = longitude ?? geocodedLocation?.longitude ?? null
    console.info('DISCOVERY_GEOCODE_RESULT', {
      street,
      city,
      zipCode,
      latitude: effectiveLatitude,
      longitude: effectiveLongitude,
      geocodeSuccess: Boolean(geocodedLocation),
      requestLatitude: latitude,
      requestLongitude: longitude,
    })

    const tenants = await prisma.tenant.findMany({
      where: {
        ...scopedTenantWhere(req),
      },
      select: {
        id: true,
        name: true,
        email: true,
        chainId: true,
        businessSettings: true,
        tenantBillingSettings: {
          select: {
            timezone: true,
          },
        },
        paymentConfig: {
          select: {
            stripeAccountId: true,
            stripeChargesEnabled: true,
            stripeOnboardingCompleted: true,
          },
        },
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
      take: 1000,
    })

    const tenantIds = tenants.map((entry) => entry.id)
    const ratingLogs =
      tenantIds.length > 0
        ? await prisma.auditLog.findMany({
            where: {
              module: 'order_rating',
              action: 'order_rating_submitted',
              tenantId: {
                in: tenantIds,
              },
            },
            select: {
              tenantId: true,
              metadata: true,
            },
            orderBy: [{ createdAt: 'desc' }],
            take: 4000,
          })
        : []
    const ratingByTenant = new Map<string, { count: number; sum: number }>()
    for (const ratingLog of ratingLogs) {
      if (!ratingLog.tenantId) {
        continue
      }
      const stars = parseStarsFromAuditMetadata(ratingLog.metadata)
      if (!stars) {
        continue
      }
      const current = ratingByTenant.get(ratingLog.tenantId) ?? { count: 0, sum: 0 }
      current.count += 1
      current.sum += stars
      ratingByTenant.set(ratingLog.tenantId, current)
    }

    const includeDelivery = mode === 'all' || mode === 'delivery'
    const includePickup = mode === 'all' || mode === 'pickup'
    const rows = tenants
      .map((tenant) => {
        const settings = parseSettings(tenant.businessSettings, {
          name: tenant.name,
          email: tenant.email,
        })
        const deliveryAreaResolution = resolveEffectiveServiceAreaFromBusinessSettings(
          tenant.businessSettings,
          settings.deliveryArea,
          'deliveryArea',
          { tenantId: tenant.id }
        )
        const effectiveDeliveryArea = deliveryAreaResolution.area
        console.info('PUBLIC_DISCOVERY_SETTINGS_SOURCE', {
          route: 'GET /api/tenants/public/discovery',
          tenantId: tenant.id,
          queryStreetRaw: req.query.street ?? null,
          normalizedStreet: street,
          source: deliveryAreaResolution.source,
        })
        console.info('PUBLIC_DISCOVERY_RAW_DELIVERY_AREA', {
          tenantId: tenant.id,
          rawPolygonPathPoints: deliveryAreaResolution.rawPolygonPathPoints,
          parsedPolygonPathPoints: deliveryAreaResolution.parsedPolygonPathPoints,
          effectivePolygonPathPoints: deliveryAreaResolution.effectivePolygonPathPoints,
          strategy: effectiveDeliveryArea.strategy,
        })
        const intake = settings.orderIntake
        const tenantRating = ratingByTenant.get(tenant.id)

        if (!settings.customerApp.listingEnabled) {
          return null
        }

        const activeDeliveryZones = (settings.deliveryZones ?? [])
          .filter((zone) => zone.enabled)
          .sort((left, right) => {
            if (left.priority !== right.priority) {
              return left.priority - right.priority
            }
            return left.name.localeCompare(right.name, 'de-DE')
          })

        const deliveryZoneMatches = includeDelivery
          ? activeDeliveryZones.map((zone) => {
              const zoneArea = deliveryZoneToServiceArea(zone)
              const zoneMatch = matchServiceArea(zoneArea, {
                tenantId: tenant.id,
                zipCode,
                street,
                latitude: effectiveLatitude,
                longitude: effectiveLongitude,
              })
              const strictZoneMatch =
                zoneArea.strategy === 'POLYGON'
                  ? zoneArea.polygonPath.length >= 3 &&
                    effectiveLatitude !== null &&
                    effectiveLongitude !== null &&
                    Boolean(zoneMatch.matchedByPolygon)
                  : Boolean(zoneMatch.matched)

              return {
                zone,
                area: zoneArea,
                match: zoneMatch,
                matched: strictZoneMatch,
              }
            })
          : []

        const matchedDeliveryZoneEntry =
          deliveryZoneMatches.find((entry) => entry.matched) ?? null
        const useDeliveryZones = activeDeliveryZones.length > 0
        const effectiveDiscoveryMinOrderValue =
          matchedDeliveryZoneEntry && matchedDeliveryZoneEntry.zone.minOrderValue !== null
            ? formatZoneAmountLabel(matchedDeliveryZoneEntry.zone.minOrderValue)
            : settings.minOrderValue
        const effectiveDiscoveryDeliveryFee =
          matchedDeliveryZoneEntry && matchedDeliveryZoneEntry.zone.deliveryFee !== null
            ? formatZoneAmountLabel(matchedDeliveryZoneEntry.zone.deliveryFee)
            : settings.deliveryFeeNote
        const effectiveMinOrderValueAmount =
          matchedDeliveryZoneEntry?.zone.minOrderValue ?? parseAmountLabel(settings.minOrderValue)
        const effectiveDeliveryFeeAmount =
          matchedDeliveryZoneEntry?.zone.deliveryFee ?? parseAmountLabel(settings.deliveryFeeNote)
        const effectiveFreeDeliveryFromAmount =
          matchedDeliveryZoneEntry?.zone.freeDeliveryFrom ?? null
        const effectiveEstimatedDeliveryMinutes =
          matchedDeliveryZoneEntry?.zone.estimatedDeliveryMinutes ?? null

        const deliveryMatch = includeDelivery
          ? matchedDeliveryZoneEntry?.match ??
            (!useDeliveryZones
              ? matchServiceArea(effectiveDeliveryArea, {
                  tenantId: tenant.id,
                  zipCode,
                  street,
                  latitude: effectiveLatitude,
                  longitude: effectiveLongitude,
                })
              : null)
          : null
        const pickupMatch = includePickup
          ? matchServiceArea(settings.pickupArea, {
              tenantId: tenant.id,
              zipCode,
              street,
              latitude: effectiveLatitude,
              longitude: effectiveLongitude,
            })
          : null

        const effectiveDiscoveryDeliveryArea =
          matchedDeliveryZoneEntry?.area ?? effectiveDeliveryArea
        const strictDeliveryMatch = matchedDeliveryZoneEntry
          ? matchedDeliveryZoneEntry.matched
          : effectiveDiscoveryDeliveryArea.strategy === 'POLYGON'
            ? effectiveDiscoveryDeliveryArea.polygonPath.length >= 3 &&
              effectiveLatitude !== null &&
              effectiveLongitude !== null &&
              Boolean(deliveryMatch?.matchedByPolygon)
            : Boolean(deliveryMatch?.matched)
        if (effectiveDiscoveryDeliveryArea.strategy === 'POLYGON') {
          console.info('DISCOVERY_POLYGON_RESULT', {
            tenantId: tenant.id,
            latitude: effectiveLatitude,
            longitude: effectiveLongitude,
            insidePolygon: Boolean(deliveryMatch?.matchedByPolygon),
            polygonPoints: effectiveDiscoveryDeliveryArea.polygonPath.length,
            polygonPath: effectiveDiscoveryDeliveryArea.polygonPath,
          })
        }

        const strictPickupMatch =
          settings.pickupArea.strategy === 'POLYGON'
            ? settings.pickupArea.polygonPath.length >= 3 &&
              effectiveLatitude !== null &&
              effectiveLongitude !== null &&
              Boolean(pickupMatch?.matchedByPolygon)
            : Boolean(pickupMatch?.matched)

        const deliveryScheduleState = resolveDeliveryScheduleState(settings)
        const timeZone = resolveDeliveryAvailabilityTimeZone(tenant.tenantBillingSettings?.timezone)
        const deliveryOrderingAvailability = getTenantOrderingAvailabilityFromSettings(
          settings,
          'DELIVERY',
          new Date(),
          timeZone
        )
        const pickupOrderingAvailability = getTenantOrderingAvailabilityFromSettings(
          settings,
          'PICKUP',
          new Date(),
          timeZone
        )
        const deliveryIntakeEnabled =
          intake.orderIntakeEnabled && intake.services.deliveryEnabledNow
        const pickupIntakeEnabled =
          intake.orderIntakeEnabled && intake.services.pickupEnabledNow
        const matchesDelivery =
          strictDeliveryMatch &&
          deliveryIntakeEnabled &&
          deliveryOrderingAvailability.canOrderNow
        const matchesPickup =
          strictPickupMatch &&
          pickupIntakeEnabled &&
          pickupOrderingAvailability.canOrderNow
        const outOfArea = !matchesDelivery && !matchesPickup
        const deliveryRejectionReason = resolveDiscoveryRejectionReason({
          areaMatched: strictDeliveryMatch,
          configurationIncomplete: deliveryMatch?.configurationIncomplete ?? false,
          requiresLocation: deliveryMatch?.requiresLocation ?? false,
          orderIntakeEnabled: intake.orderIntakeEnabled,
          serviceEnabledNow: intake.services.deliveryEnabledNow,
          canOrderNow: deliveryOrderingAvailability.canOrderNow,
          canPreorder: deliveryOrderingAvailability.canPreorder,
          isOpen: deliveryOrderingAvailability.isOpen,
        })
        const pickupRejectionReason = resolveDiscoveryRejectionReason({
          areaMatched: strictPickupMatch,
          configurationIncomplete: pickupMatch?.configurationIncomplete ?? false,
          requiresLocation: pickupMatch?.requiresLocation ?? false,
          orderIntakeEnabled: intake.orderIntakeEnabled,
          serviceEnabledNow: intake.services.pickupEnabledNow,
          canOrderNow: pickupOrderingAvailability.canOrderNow,
          canPreorder: pickupOrderingAvailability.canPreorder,
          isOpen: pickupOrderingAvailability.isOpen,
        })
        const deliveryStatus = matchesDelivery
          ? 'AVAILABLE'
          : deliveryRejectionReason === 'CLOSED' || deliveryRejectionReason === 'PREORDER_ONLY'
            ? 'OUTSIDE_SCHEDULE'
          : deliveryRejectionReason === 'CONFIG_PENDING'
            ? 'CONFIG_PENDING'
            : deliveryRejectionReason === 'LOCATION_REQUIRED'
              ? 'LOCATION_REQUIRED'
              : 'OUT_OF_AREA'
        const pickupStatus = matchesPickup
          ? 'AVAILABLE'
          : pickupRejectionReason === 'CONFIG_PENDING'
            ? 'CONFIG_PENDING'
            : pickupRejectionReason === 'LOCATION_REQUIRED'
              ? 'LOCATION_REQUIRED'
              : 'OUT_OF_AREA'

        if (!matchesDelivery && !matchesPickup && !includeOutOfArea) {
          return null
        }

        console.info('PUBLIC_BRANCH_SEARCH_DELIVERY_CHECK', {
          route: 'GET /api/tenants/public/discovery',
          tenantId: tenant.id,
          branchId: tenant.id,
          strategy: effectiveDiscoveryDeliveryArea.strategy,
          zipCodes: effectiveDiscoveryDeliveryArea.zipCodes,
          zipCode,
          street,
          city,
          polygonPoints: effectiveDiscoveryDeliveryArea.polygonPath.length,
          customerLat: effectiveLatitude,
          customerLng: effectiveLongitude,
          zoneMatches: deliveryZoneMatches
            .filter((entry) => entry.matched)
            .map((entry) => ({
              id: entry.zone.id,
              name: entry.zone.name,
              priority: entry.zone.priority,
              strategy: entry.zone.strategy,
            })),
          matchedZoneNames: deliveryZoneMatches
            .filter((entry) => entry.matched)
            .map((entry) => entry.zone.name),
          matchedByZip: deliveryMatch?.matchedByZip ?? false,
          matchedByRadius: deliveryMatch?.matchedByRadius ?? false,
          matchedByPolygon: deliveryMatch?.matchedByPolygon ?? false,
          openingStatus: {
            isOpen: deliveryOrderingAvailability.isOpen,
            canOrderNow: deliveryOrderingAvailability.canOrderNow,
            canPreorder: deliveryOrderingAvailability.canPreorder,
            nextAvailableTime: deliveryOrderingAvailability.nextAvailableTime,
            message: deliveryOrderingAvailability.message,
          },
          orderIntakeEnabled: intake.orderIntakeEnabled,
          deliveryEnabledNow: intake.services.deliveryEnabledNow,
          rejectionReason: deliveryRejectionReason,
          usedCheck:
            effectiveDiscoveryDeliveryArea.strategy === 'POLYGON'
              ? 'POLYGON'
              : effectiveDiscoveryDeliveryArea.strategy === 'RADIUS'
                ? 'RADIUS'
                : effectiveDiscoveryDeliveryArea.strategy === 'ZIP_LIST'
                  ? 'POSTAL_CODES'
                  : effectiveDiscoveryDeliveryArea.strategy === 'ZIP_OR_RADIUS' ||
                      effectiveDiscoveryDeliveryArea.strategy === 'ZIP_AND_RADIUS'
                    ? deliveryMatch?.matchedByRadius
                      ? 'RADIUS'
                      : 'POSTAL_CODES'
                    : 'UNKNOWN',
          result: matchesDelivery,
        })
        const paused = !intake.orderIntakeEnabled
        const resolvedPauseReason =
          intake.orderIntakePausedReason?.trim() ||
          'Aufgrund hoher Auslastung nimmt dieses Restaurant aktuell keine neuen Online-Bestellungen an.'
        const publicTenantName = settings.businessName || tenant.name
        const publicImageUrl =
          sanitizePublicAssetUrl(settings.coverImageUrl) ??
          sanitizePublicAssetUrl(settings.thumbnailUrl) ??
          sanitizePublicAssetUrl(settings.logoUrl)
        console.info('ORDER_INTAKE_STATUS_SYNC', {
          route: 'GET /api/tenants/public/discovery',
          tenantId: tenant.id,
          branchId: tenant.id,
          source: 'tenant.businessSettings.orderIntake',
          orderIntakeEnabled: intake.orderIntakeEnabled,
          paused,
          reason: intake.orderIntakePausedReason,
          services: intake.services,
        })

        return {
          id: tenant.id,
          tenantId: tenant.id,
          name: publicTenantName,
          tenantName: publicTenantName,
          slug: toPublicTenantSlug(publicTenantName, tenant.id),
          ratingAverage:
            tenantRating && tenantRating.count > 0
              ? Number((tenantRating.sum / tenantRating.count).toFixed(2))
              : null,
          ratingCount: tenantRating?.count ?? 0,
          chain: tenant.chain
            ? {
                id: tenant.chain.id,
                name: tenant.chain.name,
                code: tenant.chain.code,
              }
            : null,
          contact: {
            phone: settings.phone,
            email: settings.email,
            website: settings.website,
            supportEmail: settings.supportEmail,
            accountDeletionEmail: settings.accountDeletionEmail,
          },
          legal: {
            imprintUrl: settings.imprintUrl,
            privacyPolicyUrl: settings.privacyPolicyUrl,
            termsUrl: settings.termsUrl,
          },
          address: {
            street: settings.street,
            zipCode: settings.zipCode,
            city: settings.city,
            country: settings.country,
          },
          city: settings.city,
          logoUrl: sanitizePublicAssetUrl(settings.logoUrl),
          imageUrl: publicImageUrl,
          deliveryFeeNote: effectiveDiscoveryDeliveryFee,
          minOrderValue: effectiveDiscoveryMinOrderValue,
          deliveryAvailable: matchesDelivery,
          pickupAvailable: matchesPickup,
          deliveryFee: effectiveDeliveryFeeAmount,
          freeDeliveryFrom: effectiveFreeDeliveryFromAmount,
          estimatedDeliveryMinutes: effectiveEstimatedDeliveryMinutes,
          openingStatus: {
            isOpenNow:
              deliveryOrderingAvailability.isOpen || pickupOrderingAvailability.isOpen,
            delivery: deliveryOrderingAvailability.isOpen ? 'OPEN' : 'CLOSED',
            pickup: pickupOrderingAvailability.isOpen ? 'OPEN' : 'CLOSED',
          },
          serviceFee: settings.serviceFee,
          customerApp: sanitizePublicCustomerApp(settings.customerApp),
          payments: {
            stripeAvailable:
              Boolean(tenant.paymentConfig?.stripeAccountId) &&
              Boolean(tenant.paymentConfig?.stripeChargesEnabled) &&
              Boolean(tenant.paymentConfig?.stripeOnboardingCompleted),
            stripeMode: resolveStripeRuntimeMode(),
            publishableKeyConfigured: isStripePublishableKeyConfigured(),
          },
          orderIntake: {
            enabled: intake.orderIntakeEnabled,
            paused,
            reason: intake.orderIntakePausedReason,
            pausedUntil: intake.orderIntakePausedUntil,
            services: {
              delivery: intake.services.deliveryEnabledNow,
              pickup: intake.services.pickupEnabledNow,
              tableOrdering: intake.services.tableOrderingEnabledNow,
              deliveryEnabledNow: intake.services.deliveryEnabledNow,
              pickupEnabledNow: intake.services.pickupEnabledNow,
              tableOrderingEnabledNow: intake.services.tableOrderingEnabledNow,
            },
            customerMessage: intake.orderIntakeEnabled ? null : resolvedPauseReason,
          },
          deliveryScheduling: {
            ...settings.timeManagement.deliveryScheduling,
            availableNow: deliveryScheduleState.availableNow,
            nextAvailableAt: deliveryScheduleState.nextAvailableAt,
            hasSlots: deliveryScheduleState.hasSlots,
            today: deliveryScheduleState.todayKey,
          },
          outOfArea,
          services: {
            delivery: {
              available: matchesDelivery,
              strategy: effectiveDiscoveryDeliveryArea.strategy,
              minOrderValue: effectiveMinOrderValueAmount,
              deliveryFee: effectiveDeliveryFeeAmount,
              freeDeliveryFrom: effectiveFreeDeliveryFromAmount,
              estimatedDeliveryMinutes: effectiveEstimatedDeliveryMinutes,
              polygonPoints: effectiveDiscoveryDeliveryArea.polygonPath.length,
              matchedByZip: deliveryMatch?.matchedByZip ?? false,
              matchedByRadius: deliveryMatch?.matchedByRadius ?? false,
              matchedByPolygon: deliveryMatch?.matchedByPolygon ?? false,
              usedZipFallback: deliveryMatch?.usedZipFallback ?? false,
              configurationIncomplete: deliveryMatch?.configurationIncomplete ?? false,
              requiresLocation: deliveryMatch?.requiresLocation ?? false,
              status: deliveryStatus,
              distanceKm: deliveryMatch?.distanceKm ?? null,
              nextAvailableAt: deliveryScheduleState.nextAvailableAt,
              debug: {
                customerLatitude: effectiveLatitude,
                customerLongitude: effectiveLongitude,
                matchedByZip: deliveryMatch?.matchedByZip ?? false,
                matchedByRadius: deliveryMatch?.matchedByRadius ?? false,
                matchedByPolygon: deliveryMatch?.matchedByPolygon ?? false,
                openingStatus: deliveryOrderingAvailability.isOpen ? 'OPEN' : 'CLOSED',
                canOrderNow: deliveryOrderingAvailability.canOrderNow,
                canPreorder: deliveryOrderingAvailability.canPreorder,
                orderIntakeEnabled: intake.orderIntakeEnabled,
                serviceEnabledNow: intake.services.deliveryEnabledNow,
                rejectionReason: deliveryRejectionReason,
                debugMessage: deliveryOrderingAvailability.message,
              },
            },
            pickup: {
              available: matchesPickup,
              strategy: settings.pickupArea.strategy,
              polygonPoints: settings.pickupArea.polygonPath.length,
              matchedByZip: pickupMatch?.matchedByZip ?? false,
              matchedByRadius: pickupMatch?.matchedByRadius ?? false,
              matchedByPolygon: pickupMatch?.matchedByPolygon ?? false,
              usedZipFallback: pickupMatch?.usedZipFallback ?? false,
              configurationIncomplete: pickupMatch?.configurationIncomplete ?? false,
              requiresLocation: pickupMatch?.requiresLocation ?? false,
              status: pickupStatus,
              distanceKm: pickupMatch?.distanceKm ?? null,
              debug: {
                customerLatitude: effectiveLatitude,
                customerLongitude: effectiveLongitude,
                matchedByZip: pickupMatch?.matchedByZip ?? false,
                matchedByRadius: pickupMatch?.matchedByRadius ?? false,
                matchedByPolygon: pickupMatch?.matchedByPolygon ?? false,
                openingStatus: pickupOrderingAvailability.isOpen ? 'OPEN' : 'CLOSED',
                canOrderNow: pickupOrderingAvailability.canOrderNow,
                canPreorder: pickupOrderingAvailability.canPreorder,
                orderIntakeEnabled: intake.orderIntakeEnabled,
                serviceEnabledNow: intake.services.pickupEnabledNow,
                rejectionReason: pickupRejectionReason,
                debugMessage: pickupOrderingAvailability.message,
              },
            },
          },
        }
      })
      .filter(
        (entry): entry is NonNullable<typeof entry> =>
          entry !== null
      )

    const sortedRows = rows.sort((left, right) => {
      const leftScore = Number(left.services.delivery.available) + Number(left.services.pickup.available)
      const rightScore = Number(right.services.delivery.available) + Number(right.services.pickup.available)
      if (leftScore !== rightScore) {
        return rightScore - leftScore
      }

      const leftDistance =
        left.services.delivery.distanceKm ??
        left.services.pickup.distanceKm ??
        Number.POSITIVE_INFINITY
      const rightDistance =
        right.services.delivery.distanceKm ??
        right.services.pickup.distanceKm ??
        Number.POSITIVE_INFINITY
      if (leftDistance !== rightDistance) {
        return leftDistance - rightDistance
      }

      return left.tenantName.localeCompare(right.tenantName, 'de-DE')
    })

    const deliveryAreaEnabledTenants = tenants.filter((tenant) => {
      const settings = parseSettings(tenant.businessSettings, {
        name: tenant.name,
        email: tenant.email,
      })
      return settings.deliveryArea.enabled
    }).length
    const polygonMatchedRows = rows.filter((entry) => entry.services.delivery.matchedByPolygon)
    const zipMatchedRows = rows.filter((entry) => entry.services.delivery.matchedByZip)
    const radiusMatchedRows = rows.filter((entry) => entry.services.delivery.matchedByRadius)
    const matchedRows = rows.filter(
      (entry) =>
        entry.services.delivery.matchedByPolygon ||
        entry.services.delivery.matchedByZip ||
        entry.services.delivery.matchedByRadius
    )

    if (ENABLE_PUBLIC_DISCOVERY_DEBUG_LOGS) {
      console.info('PUBLIC_DISCOVERY_MATCH_SUMMARY', {
        checkedTenants: tenants.length,
        deliveryAreaEnabledTenants,
        polygonMatches: polygonMatchedRows.length,
        zipMatches: zipMatchedRows.length,
        radiusMatches: radiusMatchedRows.length,
        returnedTenants: sortedRows.length,
        matchedTenantIds: matchedRows.map((entry) => entry.tenantId),
        matchedTenantNames: matchedRows.map((entry) => entry.tenantName),
      })
    }

    return res.json({
      query: {
        zipCode,
        street,
        mode,
        includeOutOfArea,
        latitude,
        longitude,
        effectiveLatitude,
        effectiveLongitude,
      },
      total: sortedRows.length,
      tenants: sortedRows,
    })
  } catch (error) {
    console.error('GET PUBLIC TENANT DISCOVERY ERROR:', error)
    return res.status(500).json({ error: 'Filialsuche konnte nicht geladen werden' })
  }
})

router.get('/public/:tenantId/catalog', async (req, res) => {
  try {
    const tenantId = Array.isArray(req.params.tenantId) ? req.params.tenantId[0] : req.params.tenantId
    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const tenant = await prisma.tenant.findUnique({
      where: {
        id: tenantId,
      },
      select: {
        id: true,
        name: true,
        email: true,
        businessSettings: true,
        tenantBillingSettings: {
          select: {
            timezone: true,
          },
        },
        paymentConfig: {
          select: {
            stripeAccountId: true,
            stripeChargesEnabled: true,
            stripeOnboardingCompleted: true,
          },
        },
        chain: {
          select: {
            id: true,
            name: true,
            code: true,
          },
        },
      },
    })

    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    const settings = parseSettings(tenant.businessSettings, {
      name: tenant.name,
      email: tenant.email,
    })
    const intake = settings.orderIntake
    const timeZone = resolveDeliveryAvailabilityTimeZone(tenant.tenantBillingSettings?.timezone)
    const deliveryOrderingAvailability = getTenantOrderingAvailabilityFromSettings(
      settings,
      'DELIVERY',
      new Date(),
      timeZone
    )
    const pickupOrderingAvailability = getTenantOrderingAvailabilityFromSettings(
      settings,
      'PICKUP',
      new Date(),
      timeZone
    )
    if (!settings.customerApp.listingEnabled) {
      return res.status(403).json({ error: 'Filiale ist in der App noch nicht freigegeben' })
    }

    const loadCatalogProducts = () =>
      prisma.product.findMany({
        where: {
          tenantId: tenant.id,
          available: true,
        },
        select: {
          id: true,
          tenantId: true,
          categoryId: true,
          productNumber: true,
          name: true,
          imageUrl: true,
          beverageContainerType: true,
          isBeverage: true,
          contentVolumeLiters: true,
          deposit: true,
          ageRestriction: true,
          isVegetarian: true,
          isVegan: true,
          isSpicy: true,
          isVerySpicy: true,
          isNew: true,
          isPopular: true,
          articleInfo: true,
          foodBusinessOperator: true,
          nutritionInfo: true,
          nutrition: true,
          price: true,
          vatRate: true,
          available: true,
          createdAt: true,
          category: {
            select: {
              id: true,
              name: true,
              sortOrder: true,
              imageUrl: true,
            },
          },
          ingredients: {
            select: {
              quantity: true,
              displayNameOverride: true,
              showInCustomerApp: true,
              showInOrderDisplay: true,
              showInMenuBoard: true,
              showInOrderDesk: true,
              showInCashierDisplay: true,
              ingredient: {
                select: {
                  id: true,
                  name: true,
                  allergens: true,
                  deposit: true,
                  category: true,
                },
              },
            },
          },
          modifiers: {
            where: {
              isActive: true,
            },
            select: {
              id: true,
              name: true,
              ingredientId: true,
              priceDelta: true,
              isDefaultSelected: true,
              sortOrder: true,
              ingredient: {
                select: {
                  id: true,
                  name: true,
                },
              },
            },
            orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
          },
        },
        orderBy: [{ createdAt: 'asc' }],
      })

    const loadCatalogProductsWithoutModifiers = () =>
      prisma.product.findMany({
        where: {
          tenantId: tenant.id,
          available: true,
        },
        select: {
          id: true,
          tenantId: true,
          categoryId: true,
          productNumber: true,
          name: true,
          imageUrl: true,
          beverageContainerType: true,
          isBeverage: true,
          contentVolumeLiters: true,
          deposit: true,
          ageRestriction: true,
          isVegetarian: true,
          isVegan: true,
          isSpicy: true,
          isVerySpicy: true,
          isNew: true,
          isPopular: true,
          articleInfo: true,
          foodBusinessOperator: true,
          nutritionInfo: true,
          nutrition: true,
          price: true,
          vatRate: true,
          available: true,
          createdAt: true,
          category: {
            select: {
              id: true,
              name: true,
              sortOrder: true,
              imageUrl: true,
            },
          },
          ingredients: {
            select: {
              quantity: true,
              displayNameOverride: true,
              showInCustomerApp: true,
              showInOrderDisplay: true,
              showInMenuBoard: true,
              showInOrderDesk: true,
              showInCashierDisplay: true,
              ingredient: {
                select: {
                  id: true,
                  name: true,
                  allergens: true,
                  deposit: true,
                  category: true,
                },
              },
            },
          },
        },
        orderBy: [{ createdAt: 'asc' }],
      })

    let products
    try {
      products = await loadCatalogProducts()
    } catch (loadError) {
      if (isMissingProductModifierSchemaError(loadError)) {
        products = await loadCatalogProductsWithoutModifiers()
      } else if (!isMissingProductColumnsError(loadError)) {
        throw loadError
      } else {
        await ensureProductColumns()
        try {
          products = await loadCatalogProducts()
        } catch (retryError) {
          if (!isMissingProductModifierSchemaError(retryError)) {
            throw retryError
          }
          products = await loadCatalogProductsWithoutModifiers()
        }
      }
    }
    const badgeMap = await loadProductBadges(products.map((product) => product.id))

    const loadCatalogCategories = () =>
      prisma.category.findMany({
        where: {
          tenantId: tenant.id,
        },
        select: {
          id: true,
          name: true,
          sortOrder: true,
          imageUrl: true,
        },
        orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
      })

    let categories
    try {
      categories = await loadCatalogCategories()
    } catch (loadError) {
      if (!isMissingProductColumnsError(loadError)) {
        throw loadError
      }
      await ensureProductColumns()
      categories = await loadCatalogCategories()
    }
    const publicCategories = categories.map((entry) => ({
      ...entry,
      imageUrl: sanitizePublicAssetUrl(entry.imageUrl),
    }))
    const categoryById = new Map(categories.map((entry) => [entry.id, entry]))
    let productOffers = new Map<string, Awaited<ReturnType<typeof resolveProductOffers>> extends Map<string, infer TValue> ? TValue : never>()
    try {
      productOffers = await resolveProductOffers(
        tenant.id,
        products.map((entry) => ({
          id: entry.id,
          price: Number(entry.price),
        }))
      )
    } catch (offerError) {
      if (!isMissingActionPricingSchemaError(offerError)) {
        throw offerError
      }
      console.warn('PUBLIC_TENANT_CATALOG_OFFERS_FALLBACK', {
        tenantId: tenant.id,
        message: offerError instanceof Error ? offerError.message : String(offerError),
      })
    }

    const mappedProducts = products
      .map((product) => {
        const badges = normalizeProductBadges({
          badges: badgeMap.get(product.id) ?? [],
          ageRestriction: product.ageRestriction,
          isVegetarian: product.isVegetarian,
          isVegan: product.isVegan,
          isSpicy: product.isSpicy,
          isVerySpicy: product.isVerySpicy,
          isNew: product.isNew,
          isPopular: product.isPopular,
        })
        const legacyFlags = getLegacyProductBadgeFlags(badges)
        const allergenSet = new Set<string>()
        const ingredients = product.ingredients
          .filter((entry) => entry.showInCustomerApp !== false)
          .filter((entry) => !isPackagingCategory(entry.ingredient.category))
          .map((entry) => {
            const allergens = parseAllergenCodes(entry.ingredient.allergens)
            for (const allergen of allergens) {
              allergenSet.add(allergen)
            }

            return {
              id: entry.ingredient.id,
              name: (entry.displayNameOverride || '').trim() || entry.ingredient.name,
              allergens,
            }
          })
        const productDepositAmount = normalizeMoney(product.deposit, 0)
        // Customer-facing deposit is calculated only from the sold product unit.
        // Ingredient deposit values are internal (purchasing/stock) and must not
        // be added to checkout/cart totals to avoid double charging.
        const depositAmount = productDepositAmount
        const offer = productOffers.get(product.id)
        const effectivePrice = offer ? offer.effectivePrice : Number(product.price)
        const originalPrice = offer ? offer.originalPrice : Number(product.price)
        const contentVolumeLiters =
          product.contentVolumeLiters == null ? null : normalizeMoney(product.contentVolumeLiters, 0)
        const literPrice =
          Boolean(product.isBeverage) && contentVolumeLiters != null && contentVolumeLiters > 0
            ? Number((effectivePrice / contentVolumeLiters).toFixed(2))
            : null

        return {
          id: product.id,
          tenantId: product.tenantId,
          categoryId: product.categoryId,
          categoryName: product.category?.name ?? null,
          productNumber: product.productNumber,
          name: product.name,
          imageUrl: sanitizePublicAssetUrl(product.imageUrl),
          beverageContainerType: product.beverageContainerType,
          isBeverage: Boolean(product.isBeverage),
          contentVolumeLiters: contentVolumeLiters == null ? null : contentVolumeLiters.toFixed(3),
          articleInfo: normalizeText(product.articleInfo),
          foodBusinessOperator: normalizeText(product.foodBusinessOperator),
          ageRestriction: legacyFlags.ageRestriction,
          badges,
          badgeKeys: badges,
          labels: badges,
          tags: {
            vegetarian: legacyFlags.isVegetarian,
            vegan: legacyFlags.isVegan,
            halal: badges.includes('HALAL'),
            glutenFree: badges.includes('GLUTEN_FREE'),
            lactoseFree: badges.includes('LACTOSE_FREE'),
            spicy: legacyFlags.isSpicy,
            verySpicy: legacyFlags.isVerySpicy,
            isNew: legacyFlags.isNew,
            popular: legacyFlags.isPopular,
            bestseller: badges.includes('BESTSELLER'),
            recommended: badges.includes('RECOMMENDED'),
            limited: badges.includes('LIMITED'),
            caffeine: badges.includes('CAFFEINE'),
            alcohol: badges.includes('ALCOHOL'),
            age16: badges.includes('AGE_16'),
            age18: badges.includes('AGE_18'),
            organic: badges.includes('ORGANIC'),
            regional: badges.includes('REGIONAL'),
          },
          nutritionInfo: normalizeText(product.nutritionInfo),
          nutrition:
            product.nutrition && typeof product.nutrition === 'object' && !Array.isArray(product.nutrition)
              ? product.nutrition
              : null,
          price: effectivePrice.toFixed(2),
          literPrice: literPrice == null ? null : literPrice.toFixed(2),
          originalPrice:
            offer && offer.hasOffer ? originalPrice.toFixed(2) : null,
          offerLabel:
            offer && offer.hasOffer && offer.actionName
              ? offer.actionName
              : null,
          offerValueType:
            offer && offer.hasOffer ? offer.actionValueType : null,
          offerValue:
            offer && offer.hasOffer && offer.actionValue !== null
              ? Number(offer.actionValue.toFixed(2))
              : null,
          vatRate: product.vatRate,
          available: product.available,
          depositAmount: depositAmount > 0 ? depositAmount.toFixed(2) : null,
          allergens: Array.from(allergenSet).sort(),
          ingredients,
          modifiers: ('modifiers' in product && Array.isArray(product.modifiers) ? product.modifiers : []).map((modifier) => {
            const parsedModifierName = decodeStoredProductModifierName(modifier.name)
            return {
              id: modifier.id,
              name: parsedModifierName.displayName,
              kind: parsedModifierName.kind,
              ingredientId: modifier.ingredientId,
              ingredientName: modifier.ingredient?.name ?? null,
              priceDelta: modifier.priceDelta,
              isDefaultSelected: modifier.isDefaultSelected,
              sortOrder: modifier.sortOrder,
            }
          }),
        }
      })
      .sort((left, right) => {
        const leftCategory = left.categoryId ? categoryById.get(left.categoryId) : undefined
        const rightCategory = right.categoryId ? categoryById.get(right.categoryId) : undefined
        const leftSort = leftCategory?.sortOrder ?? 9999
        const rightSort = rightCategory?.sortOrder ?? 9999
        if (leftSort !== rightSort) {
          return leftSort - rightSort
        }

        const leftCategoryName = leftCategory?.name ?? ''
        const rightCategoryName = rightCategory?.name ?? ''
        if (leftCategoryName !== rightCategoryName) {
          return leftCategoryName.localeCompare(rightCategoryName, 'de-DE')
        }

        return left.name.localeCompare(right.name, 'de-DE')
      })

    return res.json({
      tenant: {
        id: tenant.id,
        name: settings.businessName || tenant.name,
        chain: tenant.chain
          ? {
              id: tenant.chain.id,
              name: tenant.chain.name,
              code: tenant.chain.code,
            }
          : null,
        contact: {
          phone: settings.phone,
          email: settings.email,
          website: settings.website,
          supportEmail: settings.supportEmail,
          accountDeletionEmail: settings.accountDeletionEmail,
        },
        legal: {
          imprintUrl: settings.imprintUrl,
          privacyPolicyUrl: settings.privacyPolicyUrl,
          termsUrl: settings.termsUrl,
        },
        address: {
          street: settings.street,
          zipCode: settings.zipCode,
          city: settings.city,
          country: settings.country,
        },
        logoUrl: sanitizePublicAssetUrl(settings.logoUrl),
        deliveryFeeNote: settings.deliveryFeeNote,
        minOrderValue: settings.minOrderValue,
        serviceFee: settings.serviceFee,
        payments: {
          stripeAvailable:
            Boolean(tenant.paymentConfig?.stripeAccountId) &&
            Boolean(tenant.paymentConfig?.stripeChargesEnabled) &&
            Boolean(tenant.paymentConfig?.stripeOnboardingCompleted),
          stripeMode: resolveStripeRuntimeMode(),
          publishableKeyConfigured: isStripePublishableKeyConfigured(),
        },
      },
      customerApp: sanitizePublicCustomerApp(settings.customerApp),
      orderIntake: {
        enabled: intake.orderIntakeEnabled,
        paused: !intake.orderIntakeEnabled,
        reason: intake.orderIntakePausedReason,
        pausedUntil: intake.orderIntakePausedUntil,
        services: {
          delivery: intake.services.deliveryEnabledNow,
          pickup: intake.services.pickupEnabledNow,
          tableOrdering: intake.services.tableOrderingEnabledNow,
          deliveryEnabledNow: intake.services.deliveryEnabledNow,
          pickupEnabledNow: intake.services.pickupEnabledNow,
          tableOrderingEnabledNow: intake.services.tableOrderingEnabledNow,
        },
        customerMessage: intake.orderIntakeEnabled
          ? null
          : intake.orderIntakePausedReason?.trim() ||
            'Aufgrund hoher Auslastung nimmt dieses Restaurant aktuell keine neuen Online-Bestellungen an.',
      },
      availability: {
        isOpenNow: deliveryOrderingAvailability.isOpen || pickupOrderingAvailability.isOpen,
        delivery: {
          isOpen: deliveryOrderingAvailability.isOpen,
          canOrderNow: deliveryOrderingAvailability.canOrderNow,
          canPreorder: deliveryOrderingAvailability.canPreorder,
          nextAvailableTime: deliveryOrderingAvailability.nextAvailableTime,
          message: deliveryOrderingAvailability.message,
        },
        pickup: {
          isOpen: pickupOrderingAvailability.isOpen,
          canOrderNow: pickupOrderingAvailability.canOrderNow,
          canPreorder: pickupOrderingAvailability.canPreorder,
          nextAvailableTime: pickupOrderingAvailability.nextAvailableTime,
          message: pickupOrderingAvailability.message,
        },
      },
      categories: publicCategories,
      products: mappedProducts,
      generatedAt: new Date().toISOString(),
    })
  } catch (error) {
    console.error('PUBLIC_TENANT_CATALOG_ERROR', {
      tenantId: req.params.tenantId,
      message: error instanceof Error ? error.message : undefined,
      stack: error instanceof Error ? error.stack : undefined,
      name: error instanceof Error ? error.name : undefined,
    })
    return res.status(500).json({ error: 'Filialkatalog konnte nicht geladen werden' })
  }
})

router.get('/', requirePermission(PermissionKey.TENANTS_READ), async (req, res) => {
  try {
    const tenants = await prisma.tenant.findMany({
      where: scopedTenantWhere(req),
      include: {
        chain: true,
      },
      orderBy: { createdAt: 'desc' },
    })

    return res.json(tenants)
  } catch (error) {
    console.error('GET TENANTS ERROR:', error)
    return res.status(500).json({ error: 'Fehler beim Laden der Tenants' })
  }
})

router.post('/', requirePermission(PermissionKey.TENANTS_WRITE), async (req, res) => {
  try {
    const actor = req.authUser

    if (actor?.role === UserRole.ADMIN || actor?.role === UserRole.STAFF) {
      return res.status(403).json({ error: 'Diese Rolle darf keine Filiale erstellen' })
    }

    const { name, email, chainId, copyFromTenantId } = req.body as {
      name?: string
      email?: string
      chainId?: string
      copyFromTenantId?: string
    }

    if (!name) {
      return res.status(400).json({ error: 'Name fehlt' })
    }

    const resolvedChainId =
      actor?.role === UserRole.CHAINADMIN ? actor.chainId : chainId || null
    let resolvedChainCode: string | null = null

    if (actor?.role === UserRole.CHAINADMIN && !resolvedChainId) {
      return res.status(400).json({ error: 'CHAINADMIN braucht eine zugeordnete Kette' })
    }

    if (resolvedChainId) {
      const chain = await prisma.chain.findUnique({
        where: { id: resolvedChainId },
        select: { id: true, code: true },
      })

      if (!chain) {
        return res.status(400).json({ error: 'Ungueltige chainId' })
      }

      resolvedChainCode = chain.code
    }

    const normalizedCopyFromTenantId =
      typeof copyFromTenantId === 'string' && copyFromTenantId.trim().length > 0
        ? copyFromTenantId.trim()
        : null

    if (normalizedCopyFromTenantId) {
      if (!resolvedChainId) {
        return res.status(400).json({
          error: 'Kopiervorlage ist nur moeglich, wenn die neue Filiale einer Kette zugeordnet ist',
        })
      }

      const sourceTenant = await prisma.tenant.findUnique({
        where: { id: normalizedCopyFromTenantId },
        select: { id: true, chainId: true },
      })

      if (!sourceTenant) {
        return res.status(400).json({ error: 'copyFromTenantId ist ungueltig' })
      }

      if (!sourceTenant.chainId || sourceTenant.chainId !== resolvedChainId) {
        return res.status(403).json({
          error: 'Kopiervorlage ist nur kettenintern erlaubt',
        })
      }
    }

    const tenant = await prisma.tenant.create({
      data: {
        name: name.trim(),
        email: email?.trim().toLowerCase() || null,
        chainId: resolvedChainId,
      },
      include: {
        chain: true,
      },
    })

    let provisioningResult:
      | Awaited<ReturnType<typeof provisionTenantDatabase>>
      | null = null
    let provisioningWarning: string | null = null

    try {
      provisioningResult = await provisionTenantDatabase({
        tenantId: tenant.id,
        tenantName: tenant.name,
        chainCode: tenant.chain?.code || resolvedChainCode,
      })
    } catch (provisionError) {
      console.error('TENANT DATABASE PROVISION ERROR:', provisionError)
      provisioningWarning =
        'Filiale wurde erstellt, aber die automatische Datenbankanlage ist fehlgeschlagen.'
    }

    if (normalizedCopyFromTenantId) {
      await copyTenantBaseData(normalizedCopyFromTenantId, tenant.id)
    }

    const payoutAssigned = await ensureTenantPayoutSettings(tenant.id)

    await writeAuditLog({
      req,
      module: 'tenant',
      action: 'tenant_created',
      targetType: 'tenant',
      targetId: tenant.id,
      chainId: tenant.chainId,
      tenantId: tenant.id,
      metadata: {
        name: tenant.name,
        email: tenant.email,
        copyFromTenantId: normalizedCopyFromTenantId,
        separateDatabaseEnabled: provisioningResult?.enabled ?? false,
        separateDatabaseName: provisioningResult?.databaseName,
        separateDatabaseCreated: provisioningResult?.created ?? false,
        payoutAssigned,
        provisioningWarning,
      },
    })

    return res.status(201).json({
      ...tenant,
      separateDatabase: provisioningResult
        ? {
            enabled: provisioningResult.enabled,
            created: provisioningResult.created,
            databaseName: provisioningResult.databaseName,
          }
        : {
            enabled: false,
            created: false,
            databaseName: null,
          },
      provisioningWarning,
    })
  } catch (error) {
    console.error('CREATE TENANT ERROR:', error)
    return res.status(500).json({ error: 'Fehler beim Erstellen des Tenants' })
  }
})

router.patch('/:id', requirePermission(PermissionKey.TENANTS_WRITE), async (req, res) => {
  try {
    const actor = req.authUser
    if (actor?.role === UserRole.ADMIN || actor?.role === UserRole.STAFF) {
      return res.status(403).json({ error: 'Diese Rolle darf keine Filiale bearbeiten' })
    }

    const tenantId = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const { name, email, chainId } = req.body as {
      name?: string
      email?: string | null
      chainId?: string | null
    }

    const nextName = typeof name === 'string' ? name.trim() : undefined
    const nextEmailRaw = typeof email === 'string' ? email.trim().toLowerCase() : email
    const nextEmail =
      nextEmailRaw === undefined
        ? undefined
        : nextEmailRaw === null || nextEmailRaw === ''
          ? null
          : nextEmailRaw
    const nextChainIdRaw = typeof chainId === 'string' ? chainId.trim() : chainId
    const nextChainId =
      nextChainIdRaw === undefined
        ? undefined
        : nextChainIdRaw === null || nextChainIdRaw === ''
          ? null
          : nextChainIdRaw

    if (nextName === undefined && nextEmail === undefined && nextChainId === undefined) {
      return res.status(400).json({ error: 'Mindestens name, email oder chainId muss uebergeben werden' })
    }
    if (nextName !== undefined && nextName.length === 0) {
      return res.status(400).json({ error: 'name darf nicht leer sein' })
    }

    const existing = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: {
        id: true,
        name: true,
        email: true,
        chainId: true,
      },
    })
    if (!existing) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    if (actor?.role === UserRole.CHAINADMIN && existing.chainId !== actor.chainId) {
      return res.status(403).json({ error: 'Kein Zugriff auf diese Filiale' })
    }

    if (actor?.role === UserRole.CHAINADMIN && nextChainId !== undefined) {
      return res.status(403).json({ error: 'CHAINADMIN darf die Kettenzuordnung nicht aendern' })
    }

    if (nextChainId !== undefined && nextChainId !== null) {
      const targetChain = await prisma.chain.findUnique({
        where: { id: nextChainId },
        select: { id: true },
      })
      if (!targetChain) {
        return res.status(400).json({ error: 'Ungueltige chainId' })
      }
    }

    const updated = await prisma.tenant.update({
      where: { id: tenantId },
      data: {
        ...(nextName !== undefined ? { name: nextName } : {}),
        ...(nextEmail !== undefined ? { email: nextEmail } : {}),
        ...(nextChainId !== undefined ? { chainId: nextChainId } : {}),
      },
      include: {
        chain: true,
      },
    })

    await writeAuditLog({
      req,
      module: 'tenant',
      action: 'tenant_updated',
      targetType: 'tenant',
      targetId: updated.id,
      chainId: updated.chainId,
      tenantId: updated.id,
      metadata: {
        before: {
          name: existing.name,
          email: existing.email,
          chainId: existing.chainId,
        },
        after: {
          name: updated.name,
          email: updated.email,
          chainId: updated.chainId,
        },
      },
    })

    return res.json(updated)
  } catch (error) {
    console.error('UPDATE TENANT ERROR:', error)
    return res.status(500).json({ error: 'Filiale konnte nicht aktualisiert werden' })
  }
})

router.delete('/:id', requirePermission(PermissionKey.TENANTS_WRITE), async (req, res) => {
  try {
    const actor = req.authUser
    if (actor?.role === UserRole.ADMIN || actor?.role === UserRole.STAFF) {
      return res.status(403).json({ error: 'Diese Rolle darf keine Filiale loeschen' })
    }

    const tenantId = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const tenant = await prisma.tenant.findUnique({
      where: {
        id: tenantId,
      },
      select: {
        id: true,
        name: true,
        chainId: true,
        _count: {
          select: {
            products: true,
            categories: true,
            users: true,
            orders: true,
          },
        },
      },
    })

    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    if (actor?.role === UserRole.CHAINADMIN && tenant.chainId !== actor.chainId) {
      return res.status(403).json({ error: 'Kein Zugriff auf diese Filiale' })
    }

    const ingredientCount = await prisma.ingredient.count({
      where: {
        tenantId: tenant.id,
      },
    })

    const releasedDatabase = await releaseTenantDatabaseToUnassigned(
      tenant.id,
      `freigegeben_von_filiale_${tenant.name.toLowerCase().replace(/[^a-z0-9]+/g, '_')}`
    )

    await prisma.$transaction(async (tx) => {
      await tx.ingredient.deleteMany({
        where: {
          tenantId: tenant.id,
        },
      })

      await tx.tenant.delete({
        where: {
          id: tenant.id,
        },
      })
    })

    await writeAuditLog({
      req,
      module: 'tenant',
      action: 'tenant_deleted',
      targetType: 'tenant',
      targetId: tenant.id,
      chainId: tenant.chainId,
      tenantId: tenant.id,
      metadata: {
        name: tenant.name,
        releasedDatabaseName: releasedDatabase?.databaseName || null,
        deletedCounts: {
          products: tenant._count.products,
          categories: tenant._count.categories,
          users: tenant._count.users,
          orders: tenant._count.orders,
          ingredients: ingredientCount,
        },
      },
    })

    return res.json({
      ok: true,
      tenantId: tenant.id,
      tenantName: tenant.name,
      releasedDatabaseName: releasedDatabase?.databaseName || null,
      deletedCounts: {
        products: tenant._count.products,
        categories: tenant._count.categories,
        users: tenant._count.users,
        orders: tenant._count.orders,
        ingredients: ingredientCount,
      },
    })
  } catch (error) {
    console.error('DELETE TENANT ERROR:', error)
    return res.status(500).json({ error: 'Filiale konnte nicht geloescht werden' })
  }
})

export default router
