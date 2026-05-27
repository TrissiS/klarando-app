import { Router } from 'express'
import { prisma } from '../lib/prisma'

const router = Router()

const INTEGER_ONLY_UNITS = new Set(['Stueck', 'Dose'])

function isIntegerOnlyUnit(unit?: string | null) {
  return Boolean(unit && INTEGER_ONLY_UNITS.has(unit))
}

function normalizeRecipeQuantity(
  rawQuantity: number,
  unit: string | null | undefined,
  recipeUnit: string | null | undefined
) {
  const effectiveUnit = recipeUnit || unit
  if (isIntegerOnlyUnit(effectiveUnit)) {
    if (!Number.isInteger(rawQuantity)) {
      return { ok: false as const, value: 0 }
    }
    return { ok: true as const, value: rawQuantity }
  }

  return { ok: true as const, value: Number(rawQuantity.toFixed(3)) }
}

router.get('/', async (req, res) => {
  try {
    const productId = req.query.productId as string

    if (!productId) {
      return res.status(400).json({ error: 'productId fehlt' })
    }

    const productIngredients = await prisma.productIngredient.findMany({
      where: { productId },
      include: {
        ingredient: true,
      },
      orderBy: { createdAt: 'desc' },
    })

    res.json(productIngredients)
  } catch (error) {
    console.error('GET PRODUCT INGREDIENTS ERROR:', error)
    res.status(500).json({ error: 'Produkt-Zutaten konnten nicht geladen werden' })
  }
})

router.post('/', async (req, res) => {
  try {
    const { productId, ingredientId, quantity, displayNameOverride } = req.body

    if (!productId || !ingredientId || quantity === undefined) {
      return res.status(400).json({ error: 'Pflichtfelder fehlen' })
    }

    const parsedQuantity = Number(quantity)
    if (!Number.isFinite(parsedQuantity) || parsedQuantity <= 0) {
      return res.status(400).json({ error: 'Menge ist ungueltig' })
    }
    const normalizedDisplayNameOverride =
      typeof displayNameOverride === 'string' && displayNameOverride.trim().length > 0
        ? displayNameOverride.trim()
        : null

    const ingredient = await prisma.ingredient.findUnique({
      where: { id: ingredientId },
      select: {
        id: true,
        unit: true,
        recipeUnit: true,
      },
    })
    if (!ingredient) {
      return res.status(404).json({ error: 'Zutat nicht gefunden' })
    }

    const normalizedQuantity = normalizeRecipeQuantity(
      parsedQuantity,
      ingredient.unit,
      ingredient.recipeUnit
    )
    if (!normalizedQuantity.ok) {
      return res.status(400).json({
        error: 'Bei Rezept-Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt',
      })
    }

    const existingEntry = await prisma.productIngredient.findFirst({
      where: {
        productId,
        ingredientId,
      },
      orderBy: {
        createdAt: 'desc',
      },
      select: {
        id: true,
      },
    })

    const productIngredient = existingEntry
      ? await prisma.productIngredient.update({
          where: { id: existingEntry.id },
          data: {
            quantity: normalizedQuantity.value,
            displayNameOverride: normalizedDisplayNameOverride,
          },
          include: {
            ingredient: true,
          },
        })
      : await prisma.productIngredient.create({
          data: {
            productId,
            ingredientId,
            quantity: normalizedQuantity.value,
            displayNameOverride: normalizedDisplayNameOverride,
          },
          include: {
            ingredient: true,
          },
        })

    res.status(201).json(productIngredient)
  } catch (error) {
    console.error('CREATE PRODUCT INGREDIENT ERROR:', error)
    res.status(500).json({ error: 'Produkt-Zutat konnte nicht erstellt werden' })
  }
})

router.patch('/:id', async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const { quantity, displayNameOverride } = req.body as {
      quantity?: number | string
      displayNameOverride?: string | null
    }

    if (!id) {
      return res.status(400).json({ error: 'id fehlt' })
    }
    if (quantity === undefined && displayNameOverride === undefined) {
      return res.status(400).json({ error: 'Keine Aenderung uebergeben' })
    }

    let parsedQuantity: number | null = null
    if (quantity !== undefined) {
      parsedQuantity = Number(quantity)
      if (!Number.isFinite(parsedQuantity) || parsedQuantity <= 0) {
        return res.status(400).json({ error: 'Menge ist ungueltig' })
      }
    }

    const existing = await prisma.productIngredient.findUnique({
      where: { id },
      select: {
        id: true,
        ingredient: {
          select: {
            unit: true,
            recipeUnit: true,
          },
        },
      },
    })
    if (!existing) {
      return res.status(404).json({ error: 'Produkt-Zutat nicht gefunden' })
    }

    let normalizedQuantity: number | undefined
    if (parsedQuantity !== null) {
      const quantityCheck = normalizeRecipeQuantity(
        parsedQuantity,
        existing.ingredient.unit,
        existing.ingredient.recipeUnit
      )
      if (!quantityCheck.ok) {
        return res.status(400).json({
          error: 'Bei Rezept-Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt',
        })
      }
      normalizedQuantity = quantityCheck.value
    }

    const normalizedDisplayNameOverride =
      typeof displayNameOverride === 'string' && displayNameOverride.trim().length > 0
        ? displayNameOverride.trim()
        : displayNameOverride === null || displayNameOverride === ''
        ? null
        : undefined

    const updated = await prisma.productIngredient.update({
      where: { id },
      data: {
        quantity: normalizedQuantity,
        displayNameOverride: normalizedDisplayNameOverride,
      },
      include: {
        ingredient: true,
      },
    })

    return res.json(updated)
  } catch (error) {
    console.error('UPDATE PRODUCT INGREDIENT ERROR:', error)
    return res.status(500).json({ error: 'Produkt-Zutat konnte nicht gespeichert werden' })
  }
})

router.delete('/:id', async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id

    if (!id) {
      return res.status(400).json({ error: 'id fehlt' })
    }

    const existing = await prisma.productIngredient.findUnique({
      where: { id },
      select: { id: true },
    })
    if (!existing) {
      return res.status(404).json({ error: 'Produkt-Zutat nicht gefunden' })
    }

    await prisma.productIngredient.delete({
      where: { id },
    })

    return res.json({ ok: true })
  } catch (error) {
    console.error('DELETE PRODUCT INGREDIENT ERROR:', error)
    return res.status(500).json({ error: 'Produkt-Zutat konnte nicht geloescht werden' })
  }
})

export default router

