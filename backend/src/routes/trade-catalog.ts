import { Router } from 'express'
import { Prisma, UserRole } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { requireAuth } from '../middleware/auth'

const router = Router()

const DEFAULT_TRADE_ITEMS = [
  { name: 'Coca-Cola 0,33 l', brand: 'Coca-Cola', category: 'Softdrink', contentVolumeLiters: 0.33, deposit: 0.25, beverageContainerType: 'EINWEG', ageRestriction: 'NONE' },
  { name: 'Fanta 0,33 l', brand: 'Coca-Cola', category: 'Softdrink', contentVolumeLiters: 0.33, deposit: 0.25, beverageContainerType: 'EINWEG', ageRestriction: 'NONE' },
  { name: 'Sprite 0,33 l', brand: 'Coca-Cola', category: 'Softdrink', contentVolumeLiters: 0.33, deposit: 0.25, beverageContainerType: 'EINWEG', ageRestriction: 'NONE' },
  { name: 'Mezzo Mix 0,33 l', brand: 'Coca-Cola', category: 'Softdrink', contentVolumeLiters: 0.33, deposit: 0.25, beverageContainerType: 'EINWEG', ageRestriction: 'NONE' },
  { name: 'Mineralwasser 0,5 l', brand: 'Klarando Standard', category: 'Wasser', contentVolumeLiters: 0.5, deposit: 0.25, beverageContainerType: 'MEHRWEG', ageRestriction: 'NONE' },
  { name: 'Ayran 0,25 l', brand: 'Klarando Standard', category: 'Milchgetränk', contentVolumeLiters: 0.25, deposit: 0, beverageContainerType: 'NONE', ageRestriction: 'NONE' },
  { name: 'Red Bull 0,25 l', brand: 'Red Bull', category: 'Energy', contentVolumeLiters: 0.25, deposit: 0.25, beverageContainerType: 'EINWEG', ageRestriction: 'AGE_16' },
]

function normalizeText(value: unknown) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeMoney(value: unknown, fallback = 0) {
  const parsed = Number(value)
  if (!Number.isFinite(parsed) || parsed < 0) return fallback
  return Number(parsed.toFixed(2))
}

function normalizeVolume(value: unknown) {
  if (value === null || value === undefined || value === '') return null
  const parsed = Number(value)
  if (!Number.isFinite(parsed) || parsed <= 0) return null
  return Number(parsed.toFixed(3))
}

function assertSuperadmin(role?: UserRole) {
  return role === UserRole.SUPERADMIN
}

function mapItem(item: {
  id: string
  name: string
  brand: string | null
  category: string | null
  ean: string | null
  articleNumber: string | null
  imageUrl: string | null
  contentVolumeLiters: Prisma.Decimal | number | string | null
  beverageContainerType: 'NONE' | 'EINWEG' | 'MEHRWEG'
  deposit: Prisma.Decimal | number | string
  ageRestriction: 'NONE' | 'AGE_16' | 'AGE_18'
  isActive: boolean
  createdAt: Date
  updatedAt: Date
}) {
  return {
    ...item,
    contentVolumeLiters:
      item.contentVolumeLiters == null ? null : Number(item.contentVolumeLiters).toFixed(3),
    deposit: Number(item.deposit).toFixed(2),
  }
}

router.get('/', requireAuth, async (req, res) => {
  try {
    if (!assertSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur SUPERADMIN darf Handelsartikel sehen' })
    }

    const existingCount = await prisma.tradeCatalogItem.count()
    if (existingCount === 0) {
      await prisma.tradeCatalogItem.createMany({
        data: DEFAULT_TRADE_ITEMS.map((entry) => ({
          name: entry.name,
          brand: entry.brand,
          category: entry.category,
          contentVolumeLiters: entry.contentVolumeLiters,
          deposit: entry.deposit,
          beverageContainerType: entry.beverageContainerType as 'NONE' | 'EINWEG' | 'MEHRWEG',
          ageRestriction: entry.ageRestriction as 'NONE' | 'AGE_16' | 'AGE_18',
          isActive: true,
        })),
      })
    }

    const rows = await prisma.tradeCatalogItem.findMany({
      orderBy: [{ isActive: 'desc' }, { brand: 'asc' }, { name: 'asc' }],
    })

    return res.json(rows.map(mapItem))
  } catch (error) {
    console.error('GET TRADE CATALOG ERROR:', error)
    return res.status(500).json({ error: 'Handelsartikel konnten nicht geladen werden' })
  }
})

router.post('/', requireAuth, async (req, res) => {
  try {
    if (!assertSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur SUPERADMIN darf Handelsartikel bearbeiten' })
    }

    const name = normalizeText(req.body?.name)
    if (!name) {
      return res.status(400).json({ error: 'Name fehlt' })
    }

    const created = await prisma.tradeCatalogItem.create({
      data: {
        name,
        brand: normalizeText(req.body?.brand),
        category: normalizeText(req.body?.category),
        ean: normalizeText(req.body?.ean),
        articleNumber: normalizeText(req.body?.articleNumber),
        imageUrl: normalizeText(req.body?.imageUrl),
        contentVolumeLiters: normalizeVolume(req.body?.contentVolumeLiters),
        beverageContainerType:
          req.body?.beverageContainerType === 'EINWEG' || req.body?.beverageContainerType === 'MEHRWEG'
            ? req.body.beverageContainerType
            : 'NONE',
        deposit: normalizeMoney(req.body?.deposit, 0),
        ageRestriction:
          req.body?.ageRestriction === 'AGE_16' || req.body?.ageRestriction === 'AGE_18'
            ? req.body.ageRestriction
            : 'NONE',
        isActive: req.body?.isActive !== false,
      },
    })

    return res.status(201).json(mapItem(created))
  } catch (error) {
    console.error('CREATE TRADE CATALOG ERROR:', error)
    return res.status(500).json({ error: 'Handelsartikel konnte nicht erstellt werden' })
  }
})

export default router
