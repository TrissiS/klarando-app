import { PermissionKey, UserRole } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { calculateKlarandoFees } from '../lib/klarando-fees'
import { calculateBillingSummary, calculateTenantBilling, parseBillingMonthOrCurrent } from '../lib/billing-engine'

const router = Router()

function toCents(value: unknown) {
  const amount = Number(value || 0)
  return Number.isFinite(amount) ? Math.max(0, Math.round(amount * 100)) : 0
}

router.get('/overview', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = String(scope.tenantId || '')
    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const daysRaw = Number(req.query.days || 30)
    const days = Number.isFinite(daysRaw) ? Math.min(180, Math.max(1, Math.trunc(daysRaw))) : 30
    const fromDate = new Date(Date.now() - days * 24 * 60 * 60 * 1000)

    const [tenant, orders, tipRows] = await Promise.all([
      prisma.tenant.findUnique({
        where: { id: tenantId },
        select: {
          id: true,
          chainId: true,
          name: true,
          tenantBillingPlan: {
            select: {
              commissionPercent: true,
              fixedFeePerOrderCents: true,
            },
          },
        },
      }),
      prisma.order.findMany({
        where: {
          tenantId,
          createdAt: { gte: fromDate },
        },
        orderBy: { createdAt: 'desc' },
        select: {
          id: true,
          createdAt: true,
          total: true,
          subtotal: true,
          deliveryFee: true,
          paymentStatus: true,
          paymentMethod: true,
          pickupNumber: true,
          customerName: true,
        },
      }),
      prisma.tipTransaction.findMany({
        where: {
          tenantId,
          createdAt: { gte: fromDate },
        },
        select: {
          orderId: true,
          amountCents: true,
        },
      }),
    ])

    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    if (authUser.role === UserRole.CHAINADMIN && authUser.chainId && tenant.chainId !== authUser.chainId) {
      return res.status(403).json({ error: 'Keine Berechtigung für diese Filiale' })
    }

    const tipByOrderId = new Map<string, number>()
    for (const row of tipRows) {
      tipByOrderId.set(row.orderId, (tipByOrderId.get(row.orderId) || 0) + row.amountCents)
    }

    const commissionPercent = Number(tenant.tenantBillingPlan?.commissionPercent || 0)
    const fixedFeePerOrderCents = tenant.tenantBillingPlan?.fixedFeePerOrderCents ?? 0

    const transactions = orders.map((order) => {
      const grossAmountCents = toCents(order.total)
      const deliveryFeeCents = toCents(order.deliveryFee)
      const tipAmountCents = tipByOrderId.get(order.id) || 0
      const fees = calculateKlarandoFees({
        grossAmountCents,
        deliveryFeeCents,
        tipAmountCents,
        klarandoPercentFee: commissionPercent,
        klarandoFixedFeeCents: fixedFeePerOrderCents,
      })

      return {
        orderId: order.id,
        orderNumber: order.pickupNumber,
        paymentMethod: order.paymentMethod,
        paymentStatus: order.paymentStatus,
        grossAmountCents,
        deliveryFeeCents,
        tipAmountCents,
        klarandoFeeCents: fees.klarandoTotalFeeCents,
        merchantPayoutAmountCents: fees.merchantPayoutAmountCents,
        customerNameMasked: order.customerName
          ? `${String(order.customerName).trim().slice(0, 1)}***`
          : null,
        createdAt: order.createdAt.toISOString(),
      }
    })

    const paidTransactions = transactions.filter((entry) => String(entry.paymentStatus).toUpperCase() === 'PAID')
    const summary = paidTransactions.reduce(
      (acc, entry) => {
        acc.grossAmountCents += entry.grossAmountCents
        acc.klarandoFeeCents += entry.klarandoFeeCents
        acc.merchantPayoutAmountCents += entry.merchantPayoutAmountCents
        acc.tipAmountCents += entry.tipAmountCents
        return acc
      },
      {
        grossAmountCents: 0,
        klarandoFeeCents: 0,
        merchantPayoutAmountCents: 0,
        tipAmountCents: 0,
      }
    )

    return res.json({
      tenant: { id: tenant.id, name: tenant.name, chainId: tenant.chainId },
      period: { days, from: fromDate.toISOString(), to: new Date().toISOString() },
      feeConfig: {
        commissionPercent,
        fixedFeePerOrderCents,
      },
      summary,
      transactions,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET FINANCE OVERVIEW ERROR:', error)
    return res.status(500).json({ error: 'Finanzübersicht konnte nicht geladen werden' })
  }
})

router.get('/usage/current', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) return res.status(401).json({ error: 'Nicht eingeloggt' })
    const scope = await resolveTenantScope(req, req.query.tenantId)
    if (!scope.tenantId) return res.status(400).json({ error: 'tenantId fehlt' })
    const period = parseBillingMonthOrCurrent(req.query.month)
    const result = await calculateTenantBilling(scope.tenantId, period)
    if (!result) return res.status(404).json({ error: 'Filiale nicht gefunden' })
    return res.json({
      ...result,
      remainingIncludedOrders: Math.max(0, result.includedOrders - result.ordersCounted),
      infoMessage: `Du hast ${result.ordersCounted} von ${result.includedOrders} Inklusivbestellungen verbraucht.`,
      thresholdMessage: `Ab der ${result.includedOrders + 1}. Bestellung fallen ${result.commissionPercentApplied.toFixed(2)} % Provision und ${(result.fixedFeePerOrderCents / 100).toFixed(2)} € Fixbetrag an.`,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ error: scopeError.message })
    console.error('GET FINANCE USAGE CURRENT ERROR:', error)
    return res.status(500).json({ error: 'Nutzungsdaten konnten nicht geladen werden' })
  }
})

router.get('/chain/usage/current', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) return res.status(401).json({ error: 'Nicht eingeloggt' })
    if (authUser.role !== UserRole.CHAINADMIN && authUser.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Chainadmin oder Superadmin erlaubt' })
    }
    const period = parseBillingMonthOrCurrent(req.query.month)
    const chainId = authUser.role === UserRole.CHAINADMIN ? authUser.chainId : String(req.query.chainId || '')
    if (!chainId) return res.status(400).json({ error: 'chainId fehlt' })
    const tenantRows = await prisma.tenant.findMany({ where: { chainId: chainId as string }, select: { id: true } })
    const summary = await calculateBillingSummary(
      period,
      tenantRows.map((row) => row.id)
    )
    return res.json({ month: period.key, chainId: chainId as string, ...summary })
  } catch (error) {
    console.error('GET FINANCE CHAIN USAGE CURRENT ERROR:', error)
    return res.status(500).json({ error: 'Chain-Abrechnung konnte nicht geladen werden' })
  }
})

router.get('/invoices', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) return res.status(401).json({ error: 'Nicht eingeloggt' })
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const invoices = await prisma.invoice.findMany({
      where: { tenantId: scope.tenantId },
      orderBy: { createdAt: 'desc' },
      take: 100,
    })
    return res.json(invoices)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) return res.status(scopeError.status).json({ error: scopeError.message })
    console.error('GET FINANCE INVOICES ERROR:', error)
    return res.status(500).json({ error: 'Rechnungen konnten nicht geladen werden' })
  }
})

router.get('/chain/invoices', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) return res.status(401).json({ error: 'Nicht eingeloggt' })
    if (authUser.role !== UserRole.CHAINADMIN && authUser.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Chainadmin oder Superadmin erlaubt' })
    }
    const chainId = authUser.role === UserRole.CHAINADMIN ? authUser.chainId : String(req.query.chainId || '')
    if (!chainId) return res.status(400).json({ error: 'chainId fehlt' })
    const invoices = await prisma.invoice.findMany({
      where: { chainId },
      orderBy: { createdAt: 'desc' },
      take: 200,
      include: { tenant: { select: { id: true, name: true } } },
    })
    return res.json(invoices)
  } catch (error) {
    console.error('GET FINANCE CHAIN INVOICES ERROR:', error)
    return res.status(500).json({ error: 'Chain-Rechnungen konnten nicht geladen werden' })
  }
})

export default router
