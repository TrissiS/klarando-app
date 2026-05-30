import {
  ActionKind,
  ActionValueType,
  PermissionKey,
  Prisma,
} from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'

const router = Router()

function normalizeText(value?: string | null) {
  if (!value) {
    return null
  }

  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeMoney(value: unknown, fallback = 0) {
  const parsed = Number(value)
  if (!Number.isFinite(parsed) || parsed < 0) {
    return fallback
  }
  return Number(parsed.toFixed(2))
}

function parseWeeklyDays(input: unknown): number[] {
  if (!Array.isArray(input)) {
    return []
  }

  const parsed = Array.from(
    new Set(
      input
        .map((entry) => Number(entry))
        .filter((entry) => Number.isInteger(entry) && entry >= 1 && entry <= 7)
    )
  )

  return parsed.sort((a, b) => a - b)
}

function normalizeWeeklyDays(input: unknown) {
  const parsed = parseWeeklyDays(input)
  return parsed.length > 0 ? parsed.join(',') : null
}

function readWeeklyDays(raw: string | null): number[] {
  if (!raw) {
    return []
  }

  return raw
    .split(',')
    .map((entry) => Number(entry))
    .filter((entry) => Number.isInteger(entry) && entry >= 1 && entry <= 7)
}

function isMissingActionColumnsError(error: unknown) {
  if (!(error instanceof Error)) {
    return false
  }

  return (
    error.message.includes('Action.imageUrl') ||
    error.message.includes('"imageUrl"') ||
    error.message.includes('Action.displayAsMenu') ||
    error.message.includes('"displayAsMenu"') ||
    error.message.includes('Action.hidePriceOnScreen') ||
    error.message.includes('"hidePriceOnScreen"')
  )
}

async function ensureActionColumns() {
  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Action"
    ADD COLUMN IF NOT EXISTS "imageUrl" TEXT;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Action"
    ADD COLUMN IF NOT EXISTS "displayAsMenu" BOOLEAN NOT NULL DEFAULT false;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Action"
    ADD COLUMN IF NOT EXISTS "hidePriceOnScreen" BOOLEAN NOT NULL DEFAULT false;
  `)
}

function parseTime(input: string | null) {
  if (!input) {
    return null
  }

  if (!/^\d{2}:\d{2}$/.test(input)) {
    return null
  }

  const [hourText, minuteText] = input.split(':')
  const hour = Number(hourText)
  const minute = Number(minuteText)

  if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
    return null
  }

  return `${hourText}:${minuteText}`
}

function currentTimeHHMM(date = new Date()) {
  const hour = String(date.getHours()).padStart(2, '0')
  const minute = String(date.getMinutes()).padStart(2, '0')
  return `${hour}:${minute}`
}

function isActionCurrentlyActive(action: {
  isActive: boolean
  kind: ActionKind
  startAt: Date | null
  endAt: Date | null
  weeklyDays: string | null
  dailyStartTime: string | null
  dailyEndTime: string | null
}) {
  if (!action.isActive) {
    return false
  }

  const now = new Date()
  if (action.startAt && now < action.startAt) {
    return false
  }

  if (action.endAt && now > action.endAt) {
    return false
  }

  const currentTime = currentTimeHHMM(now)
  const startTime = parseTime(action.dailyStartTime)
  const endTime = parseTime(action.dailyEndTime)

  if (startTime && endTime) {
    if (currentTime < startTime || currentTime > endTime) {
      return false
    }
  }

  if (action.kind === ActionKind.WEEKLY) {
    const weekday = now.getDay() === 0 ? 7 : now.getDay()
    const allowedDays = readWeeklyDays(action.weeklyDays)

    if (allowedDays.length === 0 || !allowedDays.includes(weekday)) {
      return false
    }
  }

  return true
}

function mapActionOutput<T extends { weeklyDays: string | null; value: Prisma.Decimal | number | string; imageUrl: string | null }>(
  action: T & Record<string, unknown>
) {
  return {
    ...action,
    weeklyDays: readWeeklyDays(action.weeklyDays),
    value: normalizeMoney(action.value, 0).toFixed(2),
    imageUrl: normalizeText(action.imageUrl) ?? null,
  }
}

async function validateProductScope(tenantId: string, productIds: string[]) {
  if (productIds.length === 0) {
    return true
  }

  const products = await prisma.product.findMany({
    where: {
      tenantId,
      id: {
        in: productIds,
      },
    },
    select: { id: true },
  })

  return products.length === productIds.length
}

router.get('/', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId as string | undefined)
    const tenantId = scope.tenantId as string

    const loadActions = () =>
      prisma.action.findMany({
        where: { tenantId },
        include: {
          products: {
            include: {
              product: {
                select: {
                  id: true,
                  name: true,
                  productNumber: true,
                  price: true,
                  available: true,
                },
              },
            },
            orderBy: [{ createdAt: 'asc' }],
          },
        },
        orderBy: [{ createdAt: 'desc' }],
      })

    let actions
    try {
      actions = await loadActions()
    } catch (loadError) {
      if (!isMissingActionColumnsError(loadError)) {
        throw loadError
      }
      await ensureActionColumns()
      actions = await loadActions()
    }

    return res.json(actions.map(mapActionOutput))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET ACTIONS ERROR:', error)
    return res.status(500).json({ error: 'Aktionen konnten nicht geladen werden' })
  }
})

router.get('/active', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId as string | undefined)
    const tenantId = scope.tenantId as string

    const loadActions = () =>
      prisma.action.findMany({
        where: {
          tenantId,
          isActive: true,
        },
        include: {
          products: {
            include: {
              product: {
                select: {
                  id: true,
                  name: true,
                  productNumber: true,
                  price: true,
                },
              },
            },
          },
        },
        orderBy: [{ createdAt: 'desc' }],
      })

    let actions
    try {
      actions = await loadActions()
    } catch (loadError) {
      if (!isMissingActionColumnsError(loadError)) {
        throw loadError
      }
      await ensureActionColumns()
      actions = await loadActions()
    }

    const active = actions.filter((action) => isActionCurrentlyActive(action))

    return res.json(active.map(mapActionOutput))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET ACTIVE ACTIONS ERROR:', error)
    return res.status(500).json({ error: 'Aktive Aktionen konnten nicht geladen werden' })
  }
})

router.post('/', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const {
      tenantId: requestedTenantId,
      name,
      description,
      imageUrl,
      displayAsMenu,
      hidePriceOnScreen,
      kind,
      valueType,
      value,
      isActive,
      startAt,
      endAt,
      weeklyDays,
      dailyStartTime,
      dailyEndTime,
      productIds,
    } = req.body as {
      tenantId?: string
      name?: string
      description?: string | null
      imageUrl?: string | null
      displayAsMenu?: boolean
      hidePriceOnScreen?: boolean
      kind?: ActionKind
      valueType?: ActionValueType
      value?: number
      isActive?: boolean
      startAt?: string | null
      endAt?: string | null
      weeklyDays?: unknown
      dailyStartTime?: string | null
      dailyEndTime?: string | null
      productIds?: string[]
    }

    if (!requestedTenantId || !name || !kind || !valueType || value === undefined) {
      return res.status(400).json({ error: 'Pflichtfelder fehlen' })
    }
    const scope = await resolveTenantScope(req, requestedTenantId)
    const tenantId = scope.tenantId as string

    if (!Object.values(ActionKind).includes(kind)) {
      return res.status(400).json({ error: 'ungueltiger kind' })
    }

    if (!Object.values(ActionValueType).includes(valueType)) {
      return res.status(400).json({ error: 'ungueltiger valueType' })
    }

    const parsedValue = Number(value)
    if (!Number.isFinite(parsedValue) || parsedValue <= 0) {
      return res.status(400).json({ error: 'value muss groesser als 0 sein' })
    }

    if (valueType === ActionValueType.PERCENT && parsedValue > 100) {
      return res.status(400).json({ error: 'Prozentwert darf max. 100 sein' })
    }
    if (displayAsMenu !== undefined && typeof displayAsMenu !== 'boolean') {
      return res.status(400).json({ error: 'displayAsMenu muss true oder false sein' })
    }
    if (hidePriceOnScreen !== undefined && typeof hidePriceOnScreen !== 'boolean') {
      return res.status(400).json({ error: 'hidePriceOnScreen muss true oder false sein' })
    }

    const normalizedStartAt = startAt ? new Date(startAt) : null
    const normalizedEndAt = endAt ? new Date(endAt) : null

    if (startAt && Number.isNaN(normalizedStartAt?.getTime())) {
      return res.status(400).json({ error: 'ungueltiges startAt' })
    }

    if (endAt && Number.isNaN(normalizedEndAt?.getTime())) {
      return res.status(400).json({ error: 'ungueltiges endAt' })
    }

    if (normalizedStartAt && normalizedEndAt && normalizedStartAt > normalizedEndAt) {
      return res.status(400).json({ error: 'startAt darf nicht nach endAt liegen' })
    }

    if (kind === ActionKind.ONE_TIME && (!normalizedStartAt || !normalizedEndAt)) {
      return res
        .status(400)
        .json({ error: 'Einmalige Aktionen benoetigen startAt und endAt' })
    }

    const normalizedWeeklyDays = normalizeWeeklyDays(weeklyDays)
    if (kind === ActionKind.WEEKLY && !normalizedWeeklyDays) {
      return res.status(400).json({ error: 'Woechentliche Aktionen brauchen Wochentage' })
    }

    const normalizedDailyStartTime = parseTime(normalizeText(dailyStartTime))
    const normalizedDailyEndTime = parseTime(normalizeText(dailyEndTime))

    if (normalizeText(dailyStartTime) && !normalizedDailyStartTime) {
      return res.status(400).json({ error: 'ungueltige dailyStartTime (HH:mm)' })
    }

    if (normalizeText(dailyEndTime) && !normalizedDailyEndTime) {
      return res.status(400).json({ error: 'ungueltige dailyEndTime (HH:mm)' })
    }

    if (
      normalizedDailyStartTime &&
      normalizedDailyEndTime &&
      normalizedDailyStartTime > normalizedDailyEndTime
    ) {
      return res
        .status(400)
        .json({ error: 'dailyStartTime darf nicht nach dailyEndTime liegen' })
    }

    const normalizedProductIds = Array.isArray(productIds)
      ? Array.from(new Set(productIds.filter((id) => typeof id === 'string' && id.length > 0)))
      : []

    const productsAreValid = await validateProductScope(tenantId, normalizedProductIds)
    if (!productsAreValid) {
      return res.status(400).json({ error: 'Mindestens ein Produkt gehoert nicht zum Tenant' })
    }
    if ((displayAsMenu ?? false) && normalizedProductIds.length < 2) {
      return res.status(400).json({ error: 'Ein Menue braucht mindestens zwei Artikel' })
    }

    await ensureActionColumns()

    const action = await prisma.action.create({
      data: {
        tenantId,
        name: name.trim(),
        description: normalizeText(description),
        imageUrl: normalizeText(imageUrl),
        displayAsMenu: displayAsMenu ?? false,
        hidePriceOnScreen: hidePriceOnScreen ?? false,
        kind,
        valueType,
        value: parsedValue,
        isActive: isActive ?? true,
        startAt: normalizedStartAt,
        endAt: normalizedEndAt,
        weeklyDays: kind === ActionKind.WEEKLY ? normalizedWeeklyDays : null,
        dailyStartTime: normalizedDailyStartTime,
        dailyEndTime: normalizedDailyEndTime,
        products: {
          create: normalizedProductIds.map((productId) => ({
            productId,
          })),
        },
      },
      include: {
        products: {
          include: {
            product: {
              select: {
                id: true,
                name: true,
                productNumber: true,
                price: true,
                available: true,
              },
            },
          },
          orderBy: [{ createdAt: 'asc' }],
        },
      },
    })

    await writeAuditLog({
      req,
      module: 'actions',
      action: 'action_created',
      targetType: 'action',
      targetId: action.id,
      tenantId: action.tenantId,
      metadata: {
        name: action.name,
        kind: action.kind,
        productCount: action.products.length,
      },
    })

    return res.status(201).json(mapActionOutput(action))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    if (
      error instanceof Prisma.PrismaClientKnownRequestError &&
      error.code === 'P2003'
    ) {
      return res.status(400).json({ error: 'Ungueltige Referenzdaten' })
    }

    console.error('CREATE ACTION ERROR:', error)
    return res.status(500).json({ error: 'Aktion konnte nicht erstellt werden' })
  }
})

router.patch('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const {
      tenantId: requestedTenantId,
      name,
      description,
      imageUrl,
      displayAsMenu,
      hidePriceOnScreen,
      kind,
      valueType,
      value,
      isActive,
      startAt,
      endAt,
      weeklyDays,
      dailyStartTime,
      dailyEndTime,
      productIds,
    } = req.body as {
      tenantId?: string
      name?: string
      description?: string | null
      imageUrl?: string | null
      displayAsMenu?: boolean
      hidePriceOnScreen?: boolean
      kind?: ActionKind
      valueType?: ActionValueType
      value?: number
      isActive?: boolean
      startAt?: string | null
      endAt?: string | null
      weeklyDays?: unknown
      dailyStartTime?: string | null
      dailyEndTime?: string | null
      productIds?: string[]
    }

    if (!id || !requestedTenantId) {
      return res.status(400).json({ error: 'id und tenantId sind erforderlich' })
    }
    const scope = await resolveTenantScope(req, requestedTenantId)
    const tenantId = scope.tenantId as string

    const existing = await prisma.action.findUnique({
      where: { id },
      select: { id: true, tenantId: true },
    })

    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Aktion nicht gefunden' })
    }

    if (kind && !Object.values(ActionKind).includes(kind)) {
      return res.status(400).json({ error: 'ungueltiger kind' })
    }

    if (valueType && !Object.values(ActionValueType).includes(valueType)) {
      return res.status(400).json({ error: 'ungueltiger valueType' })
    }

    const parsedValue = value === undefined ? undefined : Number(value)
    if (parsedValue !== undefined && (!Number.isFinite(parsedValue) || parsedValue <= 0)) {
      return res.status(400).json({ error: 'value muss groesser als 0 sein' })
    }

    if (
      valueType === ActionValueType.PERCENT &&
      parsedValue !== undefined &&
      parsedValue > 100
    ) {
      return res.status(400).json({ error: 'Prozentwert darf max. 100 sein' })
    }
    if (displayAsMenu !== undefined && typeof displayAsMenu !== 'boolean') {
      return res.status(400).json({ error: 'displayAsMenu muss true oder false sein' })
    }
    if (hidePriceOnScreen !== undefined && typeof hidePriceOnScreen !== 'boolean') {
      return res.status(400).json({ error: 'hidePriceOnScreen muss true oder false sein' })
    }

    const normalizedStartAt =
      startAt === undefined ? undefined : startAt ? new Date(startAt) : null
    const normalizedEndAt = endAt === undefined ? undefined : endAt ? new Date(endAt) : null

    if (normalizedStartAt && Number.isNaN(normalizedStartAt.getTime())) {
      return res.status(400).json({ error: 'ungueltiges startAt' })
    }

    if (normalizedEndAt && Number.isNaN(normalizedEndAt.getTime())) {
      return res.status(400).json({ error: 'ungueltiges endAt' })
    }

    if (normalizedStartAt && normalizedEndAt && normalizedStartAt > normalizedEndAt) {
      return res.status(400).json({ error: 'startAt darf nicht nach endAt liegen' })
    }

    const normalizedDailyStartTime =
      dailyStartTime === undefined ? undefined : parseTime(normalizeText(dailyStartTime))
    const normalizedDailyEndTime =
      dailyEndTime === undefined ? undefined : parseTime(normalizeText(dailyEndTime))

    if (dailyStartTime !== undefined && normalizeText(dailyStartTime) && !normalizedDailyStartTime) {
      return res.status(400).json({ error: 'ungueltige dailyStartTime (HH:mm)' })
    }

    if (dailyEndTime !== undefined && normalizeText(dailyEndTime) && !normalizedDailyEndTime) {
      return res.status(400).json({ error: 'ungueltige dailyEndTime (HH:mm)' })
    }

    if (
      normalizedDailyStartTime &&
      normalizedDailyEndTime &&
      normalizedDailyStartTime > normalizedDailyEndTime
    ) {
      return res
        .status(400)
        .json({ error: 'dailyStartTime darf nicht nach dailyEndTime liegen' })
    }

    let normalizedProductIds: string[] | undefined
    if (productIds !== undefined) {
      normalizedProductIds = Array.from(
        new Set(productIds.filter((entry) => typeof entry === 'string' && entry.length > 0))
      )

      const productsAreValid = await validateProductScope(tenantId, normalizedProductIds)
      if (!productsAreValid) {
        return res
          .status(400)
          .json({ error: 'Mindestens ein Produkt gehoert nicht zum Tenant' })
      }
      if (displayAsMenu === true && normalizedProductIds.length < 2) {
        return res.status(400).json({ error: 'Ein Menue braucht mindestens zwei Artikel' })
      }
    }

    const normalizedWeeklyDays =
      weeklyDays === undefined ? undefined : normalizeWeeklyDays(weeklyDays)

    await ensureActionColumns()

    const action = await prisma.$transaction(async (tx) => {
      const updated = await tx.action.update({
        where: { id },
        data: {
          name: name === undefined ? undefined : name.trim(),
          description: description === undefined ? undefined : normalizeText(description),
          imageUrl: imageUrl === undefined ? undefined : normalizeText(imageUrl),
          displayAsMenu,
          hidePriceOnScreen,
          kind,
          valueType,
          value: parsedValue,
          isActive,
          startAt: normalizedStartAt,
          endAt: normalizedEndAt,
          weeklyDays: normalizedWeeklyDays,
          dailyStartTime: normalizedDailyStartTime,
          dailyEndTime: normalizedDailyEndTime,
        },
      })

      if (normalizedProductIds !== undefined) {
        await tx.actionProduct.deleteMany({
          where: { actionId: id },
        })

        if (normalizedProductIds.length > 0) {
          await tx.actionProduct.createMany({
            data: normalizedProductIds.map((productId) => ({
              actionId: id,
              productId,
            })),
            skipDuplicates: true,
          })
        }
      }

      return tx.action.findUniqueOrThrow({
        where: { id: updated.id },
        include: {
          products: {
            include: {
              product: {
                select: {
                  id: true,
                  name: true,
                  productNumber: true,
                  price: true,
                  available: true,
                },
              },
            },
            orderBy: [{ createdAt: 'asc' }],
          },
        },
      })
    })

    await writeAuditLog({
      req,
      module: 'actions',
      action: 'action_updated',
      targetType: 'action',
      targetId: action.id,
      tenantId: action.tenantId,
      metadata: {
        name: action.name,
        kind: action.kind,
        productCount: action.products.length,
      },
    })

    return res.json(mapActionOutput(action))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE ACTION ERROR:', error)
    return res.status(500).json({ error: 'Aktion konnte nicht aktualisiert werden' })
  }
})

router.delete('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const requestedTenantId = req.query.tenantId as string | undefined

    if (!id || !requestedTenantId) {
      return res.status(400).json({ error: 'id und tenantId sind erforderlich' })
    }
    const scope = await resolveTenantScope(req, requestedTenantId)
    const tenantId = scope.tenantId as string

    const existing = await prisma.action.findUnique({
      where: { id },
      select: { id: true, tenantId: true, name: true },
    })

    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Aktion nicht gefunden' })
    }

    await prisma.action.delete({
      where: { id },
    })

    await writeAuditLog({
      req,
      module: 'actions',
      action: 'action_deleted',
      targetType: 'action',
      targetId: existing.id,
      tenantId: existing.tenantId,
      metadata: {
        name: existing.name,
      },
    })

    return res.json({ ok: true })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DELETE ACTION ERROR:', error)
    return res.status(500).json({ error: 'Aktion konnte nicht geloescht werden' })
  }
})

export default router
