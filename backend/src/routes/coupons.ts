import { CouponDiscountType, CouponOrderType, PermissionKey, Prisma } from '@prisma/client'
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

function normalizeInt(value: unknown) {
  if (value === null || value === undefined || value === '') {
    return null
  }
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return null
  }
  return Math.max(0, Math.round(parsed))
}

function normalizePercent(value: unknown) {
  if (value === null || value === undefined || value === '') {
    return null
  }
  const parsed = Number(value)
  if (!Number.isFinite(parsed) || parsed < 0) {
    return null
  }
  return Number(parsed.toFixed(2))
}

function parseDate(value: unknown) {
  if (!value) {
    return null
  }
  const parsed = new Date(String(value))
  return Number.isNaN(parsed.getTime()) ? null : parsed
}

function mapCouponOutput<T extends { discountPercent: Prisma.Decimal | number | string | null }>(coupon: T & Record<string, unknown>) {
  return {
    ...coupon,
    discountPercent:
      coupon.discountPercent === null
        ? null
        : Number(coupon.discountPercent).toFixed(2),
  }
}

router.get('/', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId as string | undefined)
    const tenantId = scope.tenantId as string

    const coupons = await prisma.coupon.findMany({
      where: { tenantId },
      orderBy: [{ createdAt: 'desc' }],
    })

    return res.json(coupons.map(mapCouponOutput))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET COUPONS ERROR:', error)
    return res.status(500).json({ error: 'Gutscheine konnten nicht geladen werden' })
  }
})

router.post('/', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const {
      tenantId: requestedTenantId,
      code,
      name,
      description,
      discountType,
      discountValueCents,
      discountPercent,
      minOrderValueCents,
      maxUses,
      maxUsesPerCustomer,
      validFrom,
      validUntil,
      appliesToOrderType,
      newCustomersOnly,
      isActive,
    } = req.body as Record<string, unknown>

    if (
      !requestedTenantId ||
      typeof requestedTenantId !== 'string' ||
      !code ||
      !name ||
      !discountType
    ) {
      return res.status(400).json({ error: 'Pflichtfelder fehlen' })
    }
    const scope = await resolveTenantScope(req, requestedTenantId)
    const tenantId = scope.tenantId as string

    if (!Object.values(CouponDiscountType).includes(discountType as CouponDiscountType)) {
      return res.status(400).json({ error: 'ungueltiger discountType' })
    }

    const normalizedCode = String(code).trim().toUpperCase()
    if (normalizedCode.length < 3) {
      return res.status(400).json({ error: 'Code muss mindestens 3 Zeichen haben' })
    }

    const normalizedOrderType = Object.values(CouponOrderType).includes(appliesToOrderType as CouponOrderType)
      ? (appliesToOrderType as CouponOrderType)
      : CouponOrderType.ALL

    const normalizedDiscountValueCents = normalizeInt(discountValueCents)
    const normalizedDiscountPercent = normalizePercent(discountPercent)

    if (discountType === CouponDiscountType.AMOUNT && normalizedDiscountValueCents === null) {
      return res.status(400).json({ error: 'discountValueCents ist fuer Betrag erforderlich' })
    }

    if (discountType === CouponDiscountType.PERCENT) {
      if (normalizedDiscountPercent === null) {
        return res.status(400).json({ error: 'discountPercent ist fuer Prozent erforderlich' })
      }
      if (normalizedDiscountPercent <= 0 || normalizedDiscountPercent > 100) {
        return res.status(400).json({ error: 'discountPercent muss zwischen 0 und 100 liegen' })
      }
    }

    const normalizedValidFrom = parseDate(validFrom)
    const normalizedValidUntil = parseDate(validUntil)
    if (validFrom && !normalizedValidFrom) {
      return res.status(400).json({ error: 'ungueltiges validFrom' })
    }
    if (validUntil && !normalizedValidUntil) {
      return res.status(400).json({ error: 'ungueltiges validUntil' })
    }
    if (normalizedValidFrom && normalizedValidUntil && normalizedValidFrom > normalizedValidUntil) {
      return res.status(400).json({ error: 'validFrom darf nicht nach validUntil liegen' })
    }

    const coupon = await prisma.coupon.create({
      data: {
        tenantId,
        code: normalizedCode,
        name: String(name).trim(),
        description: normalizeText(description as string | null),
        discountType: discountType as CouponDiscountType,
        discountValueCents: discountType === CouponDiscountType.AMOUNT ? normalizedDiscountValueCents : null,
        discountPercent: discountType === CouponDiscountType.PERCENT ? normalizedDiscountPercent : null,
        minOrderValueCents: normalizeInt(minOrderValueCents),
        maxUses: normalizeInt(maxUses),
        maxUsesPerCustomer: normalizeInt(maxUsesPerCustomer),
        validFrom: normalizedValidFrom,
        validUntil: normalizedValidUntil,
        appliesToOrderType: normalizedOrderType,
        newCustomersOnly: Boolean(newCustomersOnly),
        isActive: isActive === undefined ? true : Boolean(isActive),
      },
    })

    await writeAuditLog({
      req,
      module: 'coupons',
      action: 'coupon_created',
      targetType: 'coupon',
      targetId: coupon.id,
      tenantId: coupon.tenantId,
      metadata: { code: coupon.code, name: coupon.name },
    })

    return res.status(201).json(mapCouponOutput(coupon))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    if (error instanceof Prisma.PrismaClientKnownRequestError && error.code === 'P2002') {
      return res.status(409).json({ error: 'Dieser Gutschein-Code existiert bereits' })
    }

    console.error('CREATE COUPON ERROR:', error)
    return res.status(500).json({ error: 'Gutschein konnte nicht erstellt werden' })
  }
})

router.patch('/:id', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const { tenantId: requestedTenantId, ...payload } = req.body as Record<string, unknown>

    if (!id || !requestedTenantId || typeof requestedTenantId !== 'string') {
      return res.status(400).json({ error: 'id und tenantId sind erforderlich' })
    }
    const scope = await resolveTenantScope(req, requestedTenantId)
    const tenantId = scope.tenantId as string

    const existing = await prisma.coupon.findUnique({ where: { id } })
    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Gutschein nicht gefunden' })
    }

    const discountType = payload.discountType as CouponDiscountType | undefined
    if (discountType && !Object.values(CouponDiscountType).includes(discountType)) {
      return res.status(400).json({ error: 'ungueltiger discountType' })
    }

    const appliesToOrderType = payload.appliesToOrderType as CouponOrderType | undefined
    if (appliesToOrderType && !Object.values(CouponOrderType).includes(appliesToOrderType)) {
      return res.status(400).json({ error: 'ungueltiger appliesToOrderType' })
    }

    const normalizedCode =
      payload.code === undefined ? undefined : String(payload.code).trim().toUpperCase()

    const coupon = await prisma.coupon.update({
      where: { id },
      data: {
        code: normalizedCode,
        name: payload.name === undefined ? undefined : String(payload.name).trim(),
        description:
          payload.description === undefined
            ? undefined
            : normalizeText(payload.description as string | null),
        discountType,
        discountValueCents:
          payload.discountValueCents === undefined
            ? undefined
            : normalizeInt(payload.discountValueCents),
        discountPercent:
          payload.discountPercent === undefined
            ? undefined
            : normalizePercent(payload.discountPercent),
        minOrderValueCents:
          payload.minOrderValueCents === undefined
            ? undefined
            : normalizeInt(payload.minOrderValueCents),
        maxUses: payload.maxUses === undefined ? undefined : normalizeInt(payload.maxUses),
        maxUsesPerCustomer:
          payload.maxUsesPerCustomer === undefined
            ? undefined
            : normalizeInt(payload.maxUsesPerCustomer),
        validFrom:
          payload.validFrom === undefined
            ? undefined
            : payload.validFrom
              ? parseDate(payload.validFrom)
              : null,
        validUntil:
          payload.validUntil === undefined
            ? undefined
            : payload.validUntil
              ? parseDate(payload.validUntil)
              : null,
        appliesToOrderType,
        newCustomersOnly:
          payload.newCustomersOnly === undefined
            ? undefined
            : Boolean(payload.newCustomersOnly),
        isActive: payload.isActive === undefined ? undefined : Boolean(payload.isActive),
      },
    })

    await writeAuditLog({
      req,
      module: 'coupons',
      action: 'coupon_updated',
      targetType: 'coupon',
      targetId: coupon.id,
      tenantId: coupon.tenantId,
      metadata: { code: coupon.code, name: coupon.name },
    })

    return res.json(mapCouponOutput(coupon))
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    if (error instanceof Prisma.PrismaClientKnownRequestError && error.code === 'P2002') {
      return res.status(409).json({ error: 'Dieser Gutschein-Code existiert bereits' })
    }

    console.error('UPDATE COUPON ERROR:', error)
    return res.status(500).json({ error: 'Gutschein konnte nicht aktualisiert werden' })
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

    const existing = await prisma.coupon.findUnique({ where: { id } })
    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Gutschein nicht gefunden' })
    }

    await prisma.coupon.delete({ where: { id } })

    await writeAuditLog({
      req,
      module: 'coupons',
      action: 'coupon_deleted',
      targetType: 'coupon',
      targetId: existing.id,
      tenantId: existing.tenantId,
      metadata: { code: existing.code, name: existing.name },
    })

    return res.json({ ok: true })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DELETE COUPON ERROR:', error)
    return res.status(500).json({ error: 'Gutschein konnte nicht geloescht werden' })
  }
})

router.post('/validate', async (req, res) => {
  try {
    const {
      tenantId: requestedTenantId,
      code,
      orderType,
      subtotalCents,
      customerOrderCount,
    } = req.body as Record<string, unknown>

    if (
      !requestedTenantId ||
      typeof requestedTenantId !== 'string' ||
      !code ||
      typeof code !== 'string'
    ) {
      return res.status(400).json({ error: 'tenantId und code sind erforderlich' })
    }
    const scope = await resolveTenantScope(req, requestedTenantId)
    const tenantId = scope.tenantId as string

    const coupon = await prisma.coupon.findFirst({
      where: {
        tenantId,
        code: code.trim().toUpperCase(),
      },
    })

    if (!coupon) {
      return res.json({ valid: false, reason: 'Code nicht gefunden', checkoutReady: false })
    }

    const now = new Date()
    if (!coupon.isActive) {
      return res.json({ valid: false, reason: 'Code ist deaktiviert', checkoutReady: false })
    }

    if (coupon.validFrom && now < coupon.validFrom) {
      return res.json({ valid: false, reason: 'Code ist noch nicht gueltig', checkoutReady: false })
    }

    if (coupon.validUntil && now > coupon.validUntil) {
      return res.json({ valid: false, reason: 'Code ist abgelaufen', checkoutReady: false })
    }

    if (coupon.maxUses !== null && coupon.usedCount >= coupon.maxUses) {
      return res.json({ valid: false, reason: 'Code ist aufgebraucht', checkoutReady: false })
    }

    if (
      coupon.appliesToOrderType !== CouponOrderType.ALL &&
      orderType &&
      typeof orderType === 'string' &&
      coupon.appliesToOrderType !== orderType
    ) {
      return res.json({ valid: false, reason: 'Code gilt nicht fuer diesen Bestelltyp', checkoutReady: false })
    }

    if (
      coupon.minOrderValueCents !== null &&
      typeof subtotalCents === 'number' &&
      subtotalCents < coupon.minOrderValueCents
    ) {
      return res.json({ valid: false, reason: 'Mindestbestellwert nicht erreicht', checkoutReady: false })
    }

    if (
      coupon.newCustomersOnly &&
      typeof customerOrderCount === 'number' &&
      customerOrderCount > 0
    ) {
      return res.json({ valid: false, reason: 'Code gilt nur fuer Neukunden', checkoutReady: false })
    }

    return res.json({
      valid: true,
      checkoutReady: false,
      note: 'Checkout-Verrechnung vorbereitet',
      coupon: mapCouponOutput(coupon),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('VALIDATE COUPON ERROR:', error)
    return res.status(500).json({ error: 'Gutschein konnte nicht validiert werden' })
  }
})

export default router
