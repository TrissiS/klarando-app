import { PromotionPlacementKey, PromotionTargetAudience, UserRole } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requireAuth } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'

const router = Router()

function ensureSuperadmin(role: UserRole | undefined) {
  return role === UserRole.SUPERADMIN
}

function parseIsoDate(raw: unknown) {
  if (!raw) return null
  const parsed = new Date(String(raw))
  return Number.isNaN(parsed.getTime()) ? null : parsed
}

function sanitizeText(value: unknown, max = 500) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  if (!trimmed) return null
  return trimmed.slice(0, max)
}

function validateLink(value: unknown) {
  const link = sanitizeText(value, 1000)
  if (!link) return null
  if (link.startsWith('/')) return link
  try {
    const parsed = new URL(link)
    if (parsed.protocol === 'http:' || parsed.protocol === 'https:') {
      return parsed.toString()
    }
  } catch {
    return null
  }
  return null
}

function normalizePlacement(value: unknown): PromotionPlacementKey {
  if (Object.values(PromotionPlacementKey).includes(value as PromotionPlacementKey)) {
    return value as PromotionPlacementKey
  }
  return PromotionPlacementKey.MAIN_APP
}

function normalizeAudience(value: unknown): PromotionTargetAudience {
  if (Object.values(PromotionTargetAudience).includes(value as PromotionTargetAudience)) {
    return value as PromotionTargetAudience
  }
  return PromotionTargetAudience.ALL
}

router.get('/admin', requireAuth, async (req, res) => {
  try {
    if (!ensureSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const rows = await prisma.platformPromotion.findMany({
      orderBy: [{ priority: 'desc' }, { createdAt: 'desc' }],
      include: {
        placements: true,
        targetings: true,
      },
    })
    return res.json(rows)
  } catch (error) {
    console.error('GET PROMOTIONS ADMIN ERROR:', error)
    return res.status(500).json({ error: 'Aktionen konnten nicht geladen werden' })
  }
})

router.post('/admin', requireAuth, async (req, res) => {
  try {
    if (!ensureSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const title = sanitizeText(req.body?.title, 140)
    if (!title) {
      return res.status(400).json({ error: 'Titel ist erforderlich' })
    }

    const promotion = await prisma.platformPromotion.create({
      data: {
        title,
        description: sanitizeText(req.body?.description, 2000),
        imageUrl: validateLink(req.body?.imageUrl),
        buttonText: sanitizeText(req.body?.buttonText, 80),
        linkUrl: validateLink(req.body?.linkUrl),
        productLink: sanitizeText(req.body?.productLink, 200),
        merchantLink: sanitizeText(req.body?.merchantLink, 200),
        priority: Math.max(0, Number(req.body?.priority || 100)),
        isActive: Boolean(req.body?.isActive ?? true),
        rotationSeconds: Math.min(60, Math.max(5, Number(req.body?.rotationSeconds || 10))),
        startsAt: parseIsoDate(req.body?.startsAt),
        endsAt: parseIsoDate(req.body?.endsAt),
        createdByUserId: req.authUser?.id || null,
        placements: {
          create: [
            {
              placement: normalizePlacement(req.body?.placement),
              isEnabled: true,
            },
          ],
        },
        targetings: {
          create: [
            {
              audience: normalizeAudience(req.body?.targetAudience),
              isEnabled: true,
            },
          ],
        },
      },
      include: { placements: true, targetings: true },
    })

    await writeAuditLog({
      req,
      module: 'promotions',
      action: 'PROMOTION_CREATE',
      targetType: 'PlatformPromotion',
      targetId: promotion.id,
      metadata: {
        title: promotion.title,
      },
    })

    return res.status(201).json(promotion)
  } catch (error) {
    console.error('POST PROMOTIONS ADMIN ERROR:', error)
    return res.status(500).json({ error: 'Aktion konnte nicht erstellt werden' })
  }
})

router.patch('/admin/:id', requireAuth, async (req, res) => {
  try {
    if (!ensureSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const id = String(req.params.id || '')
    if (!id) return res.status(400).json({ error: 'ID fehlt' })

    const existing = await prisma.platformPromotion.findUnique({ where: { id } })
    if (!existing) return res.status(404).json({ error: 'Aktion nicht gefunden' })

    const updated = await prisma.platformPromotion.update({
      where: { id },
      data: {
        title: sanitizeText(req.body?.title, 140) || existing.title,
        description: sanitizeText(req.body?.description, 2000),
        imageUrl: validateLink(req.body?.imageUrl),
        buttonText: sanitizeText(req.body?.buttonText, 80),
        linkUrl: validateLink(req.body?.linkUrl),
        productLink: sanitizeText(req.body?.productLink, 200),
        merchantLink: sanitizeText(req.body?.merchantLink, 200),
        priority: Number.isFinite(Number(req.body?.priority)) ? Math.max(0, Number(req.body.priority)) : existing.priority,
        isActive: typeof req.body?.isActive === 'boolean' ? req.body.isActive : existing.isActive,
        rotationSeconds: Number.isFinite(Number(req.body?.rotationSeconds))
          ? Math.min(60, Math.max(5, Number(req.body.rotationSeconds)))
          : existing.rotationSeconds,
        startsAt: req.body?.startsAt === undefined ? existing.startsAt : parseIsoDate(req.body?.startsAt),
        endsAt: req.body?.endsAt === undefined ? existing.endsAt : parseIsoDate(req.body?.endsAt),
      },
      include: { placements: true, targetings: true },
    })

    return res.json(updated)
  } catch (error) {
    console.error('PATCH PROMOTIONS ADMIN ERROR:', error)
    return res.status(500).json({ error: 'Aktion konnte nicht aktualisiert werden' })
  }
})

router.get('/active', async (req, res) => {
  try {
    const placement = normalizePlacement(req.query.placement)
    const audience = normalizeAudience(req.query.audience)
    const now = new Date()

    const rows = await prisma.platformPromotion.findMany({
      where: {
        isActive: true,
        OR: [{ startsAt: null }, { startsAt: { lte: now } }],
        AND: [{ OR: [{ endsAt: null }, { endsAt: { gte: now } }] }],
        placements: {
          some: {
            placement,
            isEnabled: true,
          },
        },
        targetings: {
          some: {
            isEnabled: true,
            OR: [{ audience: PromotionTargetAudience.ALL }, { audience }],
          },
        },
      },
      orderBy: [{ priority: 'desc' }, { createdAt: 'desc' }],
      include: { placements: true, targetings: true },
      take: 20,
    })

    return res.json(rows)
  } catch (error) {
    console.error('GET PROMOTIONS ACTIVE ERROR:', error)
    return res.status(500).json({ error: 'Aktionen konnten nicht geladen werden' })
  }
})

export default router
