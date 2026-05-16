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
} from '../lib/business-settings'
import { resolveProductOffers } from '../lib/action-pricing'
import {
  provisionTenantDatabase,
  releaseTenantDatabaseToUnassigned,
} from '../lib/database-provisioning'
import { mergePayoutProfile, readDefaultPayoutProfile } from '../lib/payout-profile'
import { decodeStoredProductModifierName } from '../lib/product-modifiers'

const router = Router()
const MAX_PUBLIC_INLINE_ASSET_LENGTH = 12_000_000

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

function isMissingProductColumnsError(error: unknown) {
  if (!(error instanceof Error)) {
    return false
  }

  return (
    error.message.includes('Product.beverageContainerType') ||
    error.message.includes('beverageContainerType') ||
    error.message.includes('Product.deposit') ||
    error.message.includes('"deposit"') ||
    error.message.includes('Product.articleInfo') ||
    error.message.includes('"articleInfo"') ||
    error.message.includes('Product.foodBusinessOperator') ||
    error.message.includes('"foodBusinessOperator"') ||
    error.message.includes('Product.nutritionInfo') ||
    error.message.includes('"nutritionInfo"')
  )
}

async function ensureProductColumns() {
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
          deposit: product.deposit,
          articleInfo: product.articleInfo,
          foodBusinessOperator: product.foodBusinessOperator,
          nutritionInfo: product.nutritionInfo,
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
    const street = normalizeText(req.query.street)
    const latitude = parseCoordinate(req.query.latitude)
    const longitude = parseCoordinate(req.query.longitude)

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
        const tenantRating = ratingByTenant.get(tenant.id)

        if (!settings.customerApp.listingEnabled) {
          return null
        }

        const deliveryMatch = includeDelivery
          ? matchServiceArea(settings.deliveryArea, {
              zipCode,
              street,
              latitude,
              longitude,
            })
          : null
        const pickupMatch = includePickup
          ? matchServiceArea(settings.pickupArea, {
              zipCode,
              street,
              latitude,
              longitude,
            })
          : null

        const matchesDelivery = Boolean(deliveryMatch?.matched)
        const matchesPickup = Boolean(pickupMatch?.matched)
        const outOfArea = !matchesDelivery && !matchesPickup
        const deliveryStatus = matchesDelivery
          ? 'AVAILABLE'
          : deliveryMatch?.configurationIncomplete
            ? 'CONFIG_PENDING'
            : deliveryMatch?.requiresLocation
              ? 'LOCATION_REQUIRED'
              : 'OUT_OF_AREA'
        const pickupStatus = matchesPickup
          ? 'AVAILABLE'
          : pickupMatch?.configurationIncomplete
            ? 'CONFIG_PENDING'
            : pickupMatch?.requiresLocation
              ? 'LOCATION_REQUIRED'
              : 'OUT_OF_AREA'

        if (!matchesDelivery && !matchesPickup && !includeOutOfArea) {
          return null
        }

        return {
          tenantId: tenant.id,
          tenantName: settings.businessName || tenant.name,
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
          logoUrl: sanitizePublicAssetUrl(settings.logoUrl),
          deliveryFeeNote: settings.deliveryFeeNote,
          minOrderValue: settings.minOrderValue,
          customerApp: sanitizePublicCustomerApp(settings.customerApp),
          outOfArea,
          services: {
            delivery: {
              available: matchesDelivery,
              strategy: settings.deliveryArea.strategy,
              matchedByZip: deliveryMatch?.matchedByZip ?? false,
              matchedByRadius: deliveryMatch?.matchedByRadius ?? false,
              matchedByPolygon: deliveryMatch?.matchedByPolygon ?? false,
              usedZipFallback: deliveryMatch?.usedZipFallback ?? false,
              configurationIncomplete: deliveryMatch?.configurationIncomplete ?? false,
              requiresLocation: deliveryMatch?.requiresLocation ?? false,
              status: deliveryStatus,
              distanceKm: deliveryMatch?.distanceKm ?? null,
            },
            pickup: {
              available: matchesPickup,
              strategy: settings.pickupArea.strategy,
              matchedByZip: pickupMatch?.matchedByZip ?? false,
              matchedByRadius: pickupMatch?.matchedByRadius ?? false,
              matchedByPolygon: pickupMatch?.matchedByPolygon ?? false,
              usedZipFallback: pickupMatch?.usedZipFallback ?? false,
              configurationIncomplete: pickupMatch?.configurationIncomplete ?? false,
              requiresLocation: pickupMatch?.requiresLocation ?? false,
              status: pickupStatus,
              distanceKm: pickupMatch?.distanceKm ?? null,
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

    return res.json({
      query: {
        zipCode,
        street,
        mode,
        includeOutOfArea,
        latitude,
        longitude,
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
          deposit: true,
          articleInfo: true,
          foodBusinessOperator: true,
          nutritionInfo: true,
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

    let products
    try {
      products = await loadCatalogProducts()
    } catch (loadError) {
      if (!isMissingProductColumnsError(loadError)) {
        throw loadError
      }
      await ensureProductColumns()
      products = await loadCatalogProducts()
    }

    const categories = await prisma.category.findMany({
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
    const publicCategories = categories.map((entry) => ({
      ...entry,
      imageUrl: sanitizePublicAssetUrl(entry.imageUrl),
    }))
    const categoryById = new Map(categories.map((entry) => [entry.id, entry]))
    const productOffers = await resolveProductOffers(
      tenant.id,
      products.map((entry) => ({
        id: entry.id,
        price: Number(entry.price),
      }))
    )

    const mappedProducts = products
      .map((product) => {
        const allergenSet = new Set<string>()
        const ingredients = product.ingredients
          .filter((entry) => !isPackagingCategory(entry.ingredient.category))
          .map((entry) => {
            const allergens = parseAllergenCodes(entry.ingredient.allergens)
            for (const allergen of allergens) {
              allergenSet.add(allergen)
            }

            return {
              id: entry.ingredient.id,
              name: entry.ingredient.name,
              allergens,
            }
          })
        const ingredientDepositAmount = product.ingredients.reduce((sum, entry) => {
          const deposit = Number(entry.ingredient.deposit || 0)
          const quantity = Number(entry.quantity || 0)
          if (!Number.isFinite(deposit) || !Number.isFinite(quantity)) {
            return sum
          }
          return sum + deposit * quantity
        }, 0)
        const productDepositAmount = normalizeMoney(product.deposit, 0)
        const depositAmount = ingredientDepositAmount + productDepositAmount
        const offer = productOffers.get(product.id)
        const effectivePrice = offer ? offer.effectivePrice : Number(product.price)
        const originalPrice = offer ? offer.originalPrice : Number(product.price)

        return {
          id: product.id,
          tenantId: product.tenantId,
          categoryId: product.categoryId,
          categoryName: product.category?.name ?? null,
          productNumber: product.productNumber,
          name: product.name,
          imageUrl: sanitizePublicAssetUrl(product.imageUrl),
          beverageContainerType: product.beverageContainerType,
          articleInfo: normalizeText(product.articleInfo),
          foodBusinessOperator: normalizeText(product.foodBusinessOperator),
          nutritionInfo: normalizeText(product.nutritionInfo),
          price: effectivePrice.toFixed(2),
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
          modifiers: product.modifiers.map((modifier) => {
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
      },
      customerApp: sanitizePublicCustomerApp(settings.customerApp),
      categories: publicCategories,
      products: mappedProducts,
      generatedAt: new Date().toISOString(),
    })
  } catch (error) {
    console.error('GET PUBLIC TENANT CATALOG ERROR:', error)
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
