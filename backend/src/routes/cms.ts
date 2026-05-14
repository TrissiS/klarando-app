import { CmsPageStatus, Prisma, UserRole } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requireAuth } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'

const router = Router()

type CmsBlockType =
  | 'Hero'
  | 'FeatureGrid'
  | 'TextImage'
  | 'FAQ'
  | 'CTA'
  | 'PromotionSlider'
  | 'LegalNoticeBlock'

type CmsBlock = {
  type: CmsBlockType
  data: Record<string, unknown>
}

function isSuperadmin(role: UserRole | undefined) {
  return role === UserRole.SUPERADMIN
}

function normalizeText(value: unknown, max = 500) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  if (!trimmed) return null
  return trimmed.slice(0, max)
}

function normalizeSlug(value: unknown) {
  if (typeof value !== 'string') return null
  const normalized = value
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9/-]/g, '-')
    .replace(/\/+/g, '/')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '')
  return normalized || null
}

function normalizeStatus(value: unknown): CmsPageStatus {
  if (value === CmsPageStatus.PUBLISHED) return CmsPageStatus.PUBLISHED
  if (value === CmsPageStatus.ARCHIVED) return CmsPageStatus.ARCHIVED
  return CmsPageStatus.DRAFT
}

function isPlainObject(value: unknown): value is Record<string, unknown> {
  return Boolean(value && typeof value === 'object' && !Array.isArray(value))
}

function sanitizeBlockData(type: CmsBlockType, data: unknown): Record<string, unknown> {
  const source = isPlainObject(data) ? data : {}

  if (type === 'Hero') {
    return {
      headline: normalizeText(source.headline, 180),
      subline: normalizeText(source.subline, 400),
      buttonText: normalizeText(source.buttonText, 80),
      buttonUrl: normalizeText(source.buttonUrl, 500),
      imageUrl: normalizeText(source.imageUrl, 500),
    }
  }

  if (type === 'FeatureGrid') {
    const items = Array.isArray(source.items)
      ? source.items
          .filter(isPlainObject)
          .slice(0, 12)
          .map((item) => ({
            title: normalizeText(item.title, 120),
            text: normalizeText(item.text, 300),
            icon: normalizeText(item.icon, 80),
          }))
      : []

    return {
      title: normalizeText(source.title, 180),
      items,
    }
  }

  if (type === 'TextImage') {
    const imagePosition = normalizeText(source.imagePosition, 20)
    return {
      title: normalizeText(source.title, 180),
      text: normalizeText(source.text, 1500),
      imageUrl: normalizeText(source.imageUrl, 500),
      imagePosition: imagePosition === 'right' ? 'right' : 'left',
    }
  }

  if (type === 'FAQ') {
    const items = Array.isArray(source.items)
      ? source.items
          .filter(isPlainObject)
          .slice(0, 30)
          .map((item) => ({
            question: normalizeText(item.question, 240),
            answer: normalizeText(item.answer, 1200),
          }))
      : []

    return {
      title: normalizeText(source.title, 180),
      items,
    }
  }

  if (type === 'CTA') {
    return {
      headline: normalizeText(source.headline, 180),
      text: normalizeText(source.text, 500),
      buttonText: normalizeText(source.buttonText, 80),
      buttonUrl: normalizeText(source.buttonUrl, 500),
    }
  }

  if (type === 'PromotionSlider') {
    return {
      placement: normalizeText(source.placement, 60) || 'PUBLIC_HOMEPAGE',
      audience: normalizeText(source.audience, 60) || 'ALL',
      maxItems: Number.isFinite(Number(source.maxItems))
        ? Math.min(20, Math.max(1, Number(source.maxItems)))
        : 8,
    }
  }

  return {
    title: normalizeText(source.title, 180),
    text: normalizeText(source.text, 800),
    linkLabel: normalizeText(source.linkLabel, 100),
    linkUrl: normalizeText(source.linkUrl, 500),
  }
}

function sanitizeContentJson(value: unknown): CmsBlock[] {
  if (!Array.isArray(value)) return []
  const allowed: CmsBlockType[] = [
    'Hero',
    'FeatureGrid',
    'TextImage',
    'FAQ',
    'CTA',
    'PromotionSlider',
    'LegalNoticeBlock',
  ]

  return value
    .filter(isPlainObject)
    .map((entry) => {
      const type = normalizeText(entry.type, 40) as CmsBlockType | null
      if (!type || !allowed.includes(type)) return null
      return { type, data: sanitizeBlockData(type, entry.data) }
    })
    .filter((entry): entry is CmsBlock => Boolean(entry))
    .slice(0, 80)
}

function toInputJsonValue(value: unknown): Prisma.InputJsonValue {
  return value as Prisma.InputJsonValue
}

function mapPage(page: {
  id: string
  key: string
  slug: string
  title: string
  status: CmsPageStatus
  seoTitle: string | null
  seoDescription: string | null
  ogImageUrl: string | null
  contentJson: unknown
  publishedAt: Date | null
  createdAt: Date
  updatedAt: Date
}) {
  return {
    ...page,
    contentJson: sanitizeContentJson(page.contentJson),
  }
}

router.get('/pages', requireAuth, async (req, res) => {
  try {
    if (!isSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const pages = await prisma.cmsPage.findMany({
      orderBy: [{ updatedAt: 'desc' }],
    })
    return res.json(pages.map(mapPage))
  } catch (error) {
    console.error('GET CMS PAGES ERROR:', error)
    return res.status(500).json({ error: 'CMS-Seiten konnten nicht geladen werden' })
  }
})

router.get('/pages/:id', requireAuth, async (req, res) => {
  try {
    if (!isSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const page = await prisma.cmsPage.findUnique({ where: { id: String(req.params.id) } })
    if (!page) return res.status(404).json({ error: 'Seite nicht gefunden' })
    return res.json(mapPage(page))
  } catch (error) {
    console.error('GET CMS PAGE ERROR:', error)
    return res.status(500).json({ error: 'CMS-Seite konnte nicht geladen werden' })
  }
})

router.post('/pages', requireAuth, async (req, res) => {
  try {
    if (!isSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const key = normalizeSlug(req.body?.key)
    const slug = normalizeSlug(req.body?.slug)
    const title = normalizeText(req.body?.title, 180)
    if (!key || !slug || !title) {
      return res.status(400).json({ error: 'key, slug und title sind erforderlich' })
    }

    const created = await prisma.cmsPage.create({
      data: {
        key,
        slug,
        title,
        status: normalizeStatus(req.body?.status),
        seoTitle: normalizeText(req.body?.seoTitle, 180),
        seoDescription: normalizeText(req.body?.seoDescription, 320),
        ogImageUrl: normalizeText(req.body?.ogImageUrl, 500),
        contentJson: toInputJsonValue(sanitizeContentJson(req.body?.contentJson)),
      },
    })

    await prisma.cmsRevision.create({
      data: {
        pageId: created.id,
        version: 1,
        contentJson: toInputJsonValue(sanitizeContentJson(created.contentJson)),
        seoTitle: created.seoTitle,
        seoDescription: created.seoDescription,
        createdByUserId: req.authUser?.id || null,
      },
    })

    await writeAuditLog({
      req,
      module: 'cms',
      action: 'CMS_PAGE_CREATE',
      targetType: 'CmsPage',
      targetId: created.id,
      metadata: { key, slug, status: created.status },
    })

    return res.status(201).json(mapPage(created))
  } catch (error) {
    console.error('POST CMS PAGE ERROR:', error)
    return res.status(500).json({ error: 'CMS-Seite konnte nicht erstellt werden' })
  }
})

router.patch('/pages/:id', requireAuth, async (req, res) => {
  try {
    if (!isSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const id = String(req.params.id)
    const existing = await prisma.cmsPage.findUnique({ where: { id } })
    if (!existing) return res.status(404).json({ error: 'Seite nicht gefunden' })

    const contentJson =
      req.body?.contentJson === undefined
        ? sanitizeContentJson(existing.contentJson)
        : sanitizeContentJson(req.body?.contentJson)

    const updated = await prisma.cmsPage.update({
      where: { id },
      data: {
        key: normalizeSlug(req.body?.key) || existing.key,
        slug: normalizeSlug(req.body?.slug) || existing.slug,
        title: normalizeText(req.body?.title, 180) || existing.title,
        status: req.body?.status ? normalizeStatus(req.body?.status) : existing.status,
        seoTitle:
          req.body?.seoTitle === undefined
            ? existing.seoTitle
            : normalizeText(req.body?.seoTitle, 180),
        seoDescription:
          req.body?.seoDescription === undefined
            ? existing.seoDescription
            : normalizeText(req.body?.seoDescription, 320),
        ogImageUrl:
          req.body?.ogImageUrl === undefined
            ? existing.ogImageUrl
            : normalizeText(req.body?.ogImageUrl, 500),
        contentJson: toInputJsonValue(contentJson),
      },
    })

    const lastRevision = await prisma.cmsRevision.findFirst({
      where: { pageId: id },
      orderBy: { version: 'desc' },
      select: { version: true },
    })

    await prisma.cmsRevision.create({
      data: {
        pageId: id,
        version: (lastRevision?.version || 0) + 1,
        contentJson: toInputJsonValue(contentJson),
        seoTitle: updated.seoTitle,
        seoDescription: updated.seoDescription,
        createdByUserId: req.authUser?.id || null,
      },
    })

    return res.json(mapPage(updated))
  } catch (error) {
    console.error('PATCH CMS PAGE ERROR:', error)
    return res.status(500).json({ error: 'CMS-Seite konnte nicht aktualisiert werden' })
  }
})

router.post('/pages/:id/publish', requireAuth, async (req, res) => {
  try {
    if (!isSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const id = String(req.params.id)
    const existing = await prisma.cmsPage.findUnique({ where: { id } })
    if (!existing) return res.status(404).json({ error: 'Seite nicht gefunden' })

    const updated = await prisma.cmsPage.update({
      where: { id },
      data: {
        status: CmsPageStatus.PUBLISHED,
        publishedAt: new Date(),
      },
    })

    await writeAuditLog({
      req,
      module: 'cms',
      action: 'CMS_PAGE_PUBLISH',
      targetType: 'CmsPage',
      targetId: id,
      metadata: { slug: updated.slug },
    })

    return res.json(mapPage(updated))
  } catch (error) {
    console.error('PUBLISH CMS PAGE ERROR:', error)
    return res.status(500).json({ error: 'CMS-Seite konnte nicht veröffentlicht werden' })
  }
})

router.get('/pages/:id/revisions', requireAuth, async (req, res) => {
  try {
    if (!isSuperadmin(req.authUser?.role)) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const rows = await prisma.cmsRevision.findMany({
      where: { pageId: String(req.params.id) },
      include: {
        createdByUser: {
          select: { id: true, name: true, email: true },
        },
      },
      orderBy: { version: 'desc' },
      take: 50,
    })
    return res.json(rows)
  } catch (error) {
    console.error('GET CMS REVISIONS ERROR:', error)
    return res.status(500).json({ error: 'CMS-Versionen konnten nicht geladen werden' })
  }
})

router.get('/public/:slug', async (req, res) => {
  try {
    const slug = normalizeSlug(req.params.slug)
    if (!slug) return res.status(400).json({ error: 'Slug fehlt' })

    const page = await prisma.cmsPage.findFirst({
      where: {
        slug,
        status: CmsPageStatus.PUBLISHED,
      },
    })

    if (!page) {
      return res.status(404).json({ error: 'Keine veröffentlichte Seite vorhanden' })
    }

    return res.json(mapPage(page))
  } catch (error) {
    console.error('GET CMS PUBLIC PAGE ERROR:', error)
    return res.status(500).json({ error: 'CMS-Seite konnte nicht geladen werden' })
  }
})

export default router
