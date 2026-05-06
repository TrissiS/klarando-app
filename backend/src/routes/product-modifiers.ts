import { PermissionKey } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import {
  decodeStoredProductModifierName,
  encodeStoredProductModifierName,
  isSizeProductModifierName,
  normalizeProductModifierKind,
} from '../lib/product-modifiers'

const router = Router()

function normalizeText(value?: string | null) {
  if (value === undefined) {
    return undefined
  }
  if (value === null) {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeNumber(value: unknown, min: number, max: number) {
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return null
  }
  return Math.min(max, Math.max(min, parsed))
}

function mapProductModifierOutput(modifier: {
  id: string
  tenantId: string
  productId: string
  ingredientId: string | null
  name: string
  priceDelta: unknown
  isDefaultSelected: boolean
  isActive: boolean
  sortOrder: number
  createdAt: Date
  updatedAt: Date
  ingredient: {
    id: string
    name: string
    unit: string
  } | null
}) {
  const parsedName = decodeStoredProductModifierName(modifier.name)

  return {
    ...modifier,
    name: parsedName.displayName,
    kind: parsedName.kind,
  }
}

router.get('/', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const productId = req.query.productId as string

    if (!productId) {
      return res.status(400).json({ error: 'productId fehlt' })
    }

    const modifiers = await prisma.productModifier.findMany({
      where: {
        productId,
      },
      include: {
        ingredient: {
          select: {
            id: true,
            name: true,
            unit: true,
          },
        },
      },
      orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
    })

    return res.json(modifiers.map(mapProductModifierOutput))
  } catch (error) {
    console.error('GET PRODUCT MODIFIERS ERROR:', error)
    return res.status(500).json({ error: 'Produktoptionen konnten nicht geladen werden' })
  }
})

router.post('/', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const {
      productId,
      ingredientId,
      kind,
      name,
      priceDelta,
      isDefaultSelected,
      isActive,
      sortOrder,
    } = req.body as {
      productId?: string
      ingredientId?: string | null
      kind?: string
      name?: string
      priceDelta?: number
      isDefaultSelected?: boolean
      isActive?: boolean
      sortOrder?: number
    }

    if (!productId) {
      return res.status(400).json({ error: 'productId fehlt' })
    }

    const product = await prisma.product.findUnique({
      where: { id: productId },
      select: {
        id: true,
        tenantId: true,
      },
    })

    if (!product) {
      return res.status(404).json({ error: 'Produkt nicht gefunden' })
    }

    const normalizedIngredientId = normalizeText(ingredientId)
    let ingredientName: string | null = null
    if (normalizedIngredientId) {
      const ingredient = await prisma.ingredient.findUnique({
        where: { id: normalizedIngredientId },
        select: {
          id: true,
          tenantId: true,
          name: true,
        },
      })

      if (!ingredient || ingredient.tenantId !== product.tenantId) {
        return res.status(400).json({ error: 'Zutat ist ungueltig' })
      }

      ingredientName = ingredient.name
    }

    const normalizedKind = normalizeProductModifierKind(kind)
    const normalizedName = normalizeText(name) ?? ingredientName
    if (!normalizedName) {
      return res.status(400).json({ error: 'name fehlt' })
    }

    const normalizedPriceDelta = normalizeNumber(priceDelta, -50, 50)
    if (normalizedPriceDelta === null) {
      return res.status(400).json({ error: 'priceDelta fehlt oder ist ungueltig' })
    }

    const normalizedSortOrder = normalizeNumber(sortOrder, -5000, 5000) ?? 0

    const storedName = encodeStoredProductModifierName(normalizedName, normalizedKind)
    const existingProductModifiers =
      normalizedKind === 'SIZE'
        ? await prisma.productModifier.findMany({
            where: {
              productId: product.id,
            },
            select: {
              id: true,
              name: true,
            },
          })
        : []
    const hasExistingSizeModifier = existingProductModifiers.some((entry) =>
      isSizeProductModifierName(entry.name)
    )
    const normalizedDefaultSelected =
      normalizedKind === 'SIZE' && isDefaultSelected === undefined
        ? !hasExistingSizeModifier
        : (isDefaultSelected ?? false)

    const created = await prisma.$transaction(async (tx) => {
      const inserted = await tx.productModifier.create({
        data: {
          tenantId: product.tenantId,
          productId: product.id,
          ingredientId: normalizedIngredientId,
          name: storedName,
          priceDelta: normalizedPriceDelta,
          isDefaultSelected: normalizedDefaultSelected,
          isActive: isActive ?? true,
          sortOrder: normalizedSortOrder,
        },
        include: {
          ingredient: {
            select: {
              id: true,
              name: true,
              unit: true,
            },
          },
        },
      })

      if (normalizedKind === 'SIZE' && normalizedDefaultSelected) {
        const otherSizeIds = existingProductModifiers
          .filter((entry) => isSizeProductModifierName(entry.name))
          .map((entry) => entry.id)
        if (otherSizeIds.length > 0) {
          await tx.productModifier.updateMany({
            where: {
              id: {
                in: otherSizeIds,
              },
            },
            data: {
              isDefaultSelected: false,
            },
          })
        }
      }

      return inserted
    })

    return res.status(201).json(mapProductModifierOutput(created))
  } catch (error) {
    console.error('CREATE PRODUCT MODIFIER ERROR:', error)
    return res.status(500).json({ error: 'Produktoption konnte nicht erstellt werden' })
  }
})

router.patch('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const {
      ingredientId,
      kind,
      name,
      priceDelta,
      isDefaultSelected,
      isActive,
      sortOrder,
    } = req.body as {
      ingredientId?: string | null
      kind?: string
      name?: string
      priceDelta?: number
      isDefaultSelected?: boolean
      isActive?: boolean
      sortOrder?: number
    }

    if (!id) {
      return res.status(400).json({ error: 'id fehlt' })
    }

    const existing = await prisma.productModifier.findUnique({
      where: { id },
      select: {
        id: true,
        tenantId: true,
        productId: true,
        name: true,
      },
    })

    if (!existing) {
      return res.status(404).json({ error: 'Produktoption nicht gefunden' })
    }

    const normalizedIngredientId =
      ingredientId === undefined ? undefined : normalizeText(ingredientId)
    if (normalizedIngredientId) {
      const ingredient = await prisma.ingredient.findUnique({
        where: { id: normalizedIngredientId },
        select: {
          id: true,
          tenantId: true,
        },
      })

      if (!ingredient || ingredient.tenantId !== existing.tenantId) {
        return res.status(400).json({ error: 'Zutat ist ungueltig' })
      }
    }

    const normalizedName = name === undefined ? undefined : normalizeText(name)
    if (name !== undefined && !normalizedName) {
      return res.status(400).json({ error: 'name darf nicht leer sein' })
    }
    const nextKind =
      kind === undefined
        ? decodeStoredProductModifierName(existing.name).kind
        : normalizeProductModifierKind(kind)
    const nextDisplayName =
      normalizedName ??
      (kind === undefined ? undefined : decodeStoredProductModifierName(existing.name).displayName)
    const nextStoredName =
      nextDisplayName === undefined
        ? undefined
        : encodeStoredProductModifierName(nextDisplayName, nextKind)

    const normalizedPriceDelta =
      priceDelta === undefined ? undefined : normalizeNumber(priceDelta, -50, 50)
    if (priceDelta !== undefined && normalizedPriceDelta === null) {
      return res.status(400).json({ error: 'priceDelta ist ungueltig' })
    }

    const normalizedSortOrder =
      sortOrder === undefined ? undefined : normalizeNumber(sortOrder, -5000, 5000)
    if (sortOrder !== undefined && normalizedSortOrder === null) {
      return res.status(400).json({ error: 'sortOrder ist ungueltig' })
    }

    const updated = await prisma.$transaction(async (tx) => {
      const persisted = await tx.productModifier.update({
        where: { id },
        data: {
          ingredientId: normalizedIngredientId,
          name: nextStoredName,
          priceDelta: normalizedPriceDelta ?? undefined,
          isDefaultSelected,
          isActive,
          sortOrder: normalizedSortOrder ?? undefined,
        },
        include: {
          ingredient: {
            select: {
              id: true,
              name: true,
              unit: true,
            },
          },
        },
      })

      const persistedKind = decodeStoredProductModifierName(persisted.name).kind
      if (persistedKind === 'SIZE' && persisted.isDefaultSelected) {
        const sameProductModifiers = await tx.productModifier.findMany({
          where: {
            productId: existing.productId,
          },
          select: {
            id: true,
            name: true,
          },
        })

        const otherSizeIds = sameProductModifiers
          .filter(
            (entry) => entry.id !== persisted.id && isSizeProductModifierName(entry.name)
          )
          .map((entry) => entry.id)

        if (otherSizeIds.length > 0) {
          await tx.productModifier.updateMany({
            where: {
              id: {
                in: otherSizeIds,
              },
            },
            data: {
              isDefaultSelected: false,
            },
          })
        }
      }

      return persisted
    })

    return res.json(mapProductModifierOutput(updated))
  } catch (error) {
    console.error('UPDATE PRODUCT MODIFIER ERROR:', error)
    return res.status(500).json({ error: 'Produktoption konnte nicht gespeichert werden' })
  }
})

router.delete('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id

    if (!id) {
      return res.status(400).json({ error: 'id fehlt' })
    }

    const existing = await prisma.productModifier.findUnique({
      where: { id },
      select: { id: true },
    })

    if (!existing) {
      return res.status(404).json({ error: 'Produktoption nicht gefunden' })
    }

    await prisma.productModifier.delete({
      where: { id },
    })

    return res.json({ ok: true })
  } catch (error) {
    console.error('DELETE PRODUCT MODIFIER ERROR:', error)
    return res.status(500).json({ error: 'Produktoption konnte nicht geloescht werden' })
  }
})

export default router
