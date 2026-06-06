import { PermissionKey, UserRole } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { calculateKlarandoFees } from '../lib/klarando-fees'
import { calculateBillingSummary, calculateTenantBilling, parseBillingMonthOrCurrent } from '../lib/billing-engine'
import { syncStripeTransactionFeeSnapshot } from '../lib/stripe'

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

    const [tenant, orders, tipRows, paymentTransactions] = await Promise.all([
      prisma.tenant.findUnique({
        where: { id: tenantId },
        select: {
          id: true,
          chainId: true,
          name: true,
          tenantBillingPlan: {
            select: {
              planType: true,
              monthlyFeeCents: true,
              includedOrders: true,
              commissionPercent: true,
              commissionAfterIncludedOrdersPercent: true,
              fixedFeePerOrderCents: true,
              activeFrom: true,
              activeUntil: true,
              isActive: true,
            },
          },
          billingProfile: {
            select: {
              paymentTermsDays: true,
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
          publicOrderCode: true,
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
      prisma.paymentTransaction.findMany({
        where: {
          tenantId,
          createdAt: { gte: fromDate },
        },
        orderBy: { createdAt: 'desc' },
        select: {
          id: true,
          orderId: true,
          provider: true,
          status: true,
          amountCents: true,
          feeAmountCents: true,
          platformFeeCents: true,
          providerFeeCents: true,
          providerPaymentId: true,
          stripeChargeId: true,
          createdAt: true,
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

    const commissionPercent = Number(
      tenant.tenantBillingPlan?.commissionAfterIncludedOrdersPercent ??
        tenant.tenantBillingPlan?.commissionPercent ??
        0
    )
    const fixedFeePerOrderCents = tenant.tenantBillingPlan?.fixedFeePerOrderCents ?? 0
    const hydratedPaymentTransactions = await Promise.all(
      paymentTransactions.map(async (transaction) => {
        if (
          transaction.provider !== 'STRIPE' ||
          transaction.providerFeeCents > 0 ||
          (!transaction.providerPaymentId && !transaction.stripeChargeId)
        ) {
          return transaction
        }

        try {
          const synced = await syncStripeTransactionFeeSnapshot({
            id: transaction.id,
            providerPaymentId: transaction.providerPaymentId,
            stripeChargeId: transaction.stripeChargeId,
            platformFeeCents: transaction.platformFeeCents,
            providerFeeCents: transaction.providerFeeCents,
          })

          return {
            ...transaction,
            stripeChargeId: synced.stripeChargeId,
            platformFeeCents: synced.platformFeeCents,
            providerFeeCents: synced.providerFeeCents,
            feeAmountCents: synced.totalFeeCents,
          }
        } catch {
          return transaction
        }
      })
    )
    const paymentByOrderId = new Map<string, (typeof hydratedPaymentTransactions)[number]>()
    for (const transaction of hydratedPaymentTransactions) {
      if (!transaction.orderId || paymentByOrderId.has(transaction.orderId)) {
        continue
      }
      paymentByOrderId.set(transaction.orderId, transaction)
    }

    const transactions = orders.map((order) => {
      const payment = paymentByOrderId.get(order.id)
      const grossAmountCents = payment?.amountCents ?? toCents(order.total)
      const deliveryFeeCents = toCents(order.deliveryFee)
      const tipAmountCents = tipByOrderId.get(order.id) || 0
      const fallbackFees = calculateKlarandoFees({
        grossAmountCents,
        deliveryFeeCents,
        tipAmountCents,
        klarandoPercentFee: commissionPercent,
        klarandoFixedFeeCents: fixedFeePerOrderCents,
      })
      const platformFeeCents = payment?.platformFeeCents ?? fallbackFees.klarandoTotalFeeCents
      const providerFeeCents = payment?.providerFeeCents ?? 0
      const totalFeeCents = payment
        ? Math.max(payment.feeAmountCents, platformFeeCents + providerFeeCents)
        : platformFeeCents

      return {
        orderId: order.id,
        orderNumber: order.pickupNumber,
        publicOrderCode: order.publicOrderCode,
        paymentMethod: order.paymentMethod || payment?.provider || null,
        paymentStatus: payment?.status || order.paymentStatus,
        grossAmountCents,
        deliveryFeeCents,
        tipAmountCents,
        klarandoFeeCents: platformFeeCents,
        providerFeeCents,
        totalFeeCents,
        merchantPayoutAmountCents: Math.max(0, grossAmountCents - totalFeeCents),
        customerNameMasked: order.customerName
          ? `${String(order.customerName).trim().slice(0, 1)}***`
          : null,
        createdAt: (payment?.createdAt ?? order.createdAt).toISOString(),
      }
    })

    const paidTransactions = transactions.filter((entry) =>
      ['PAID', 'SUCCEEDED', 'COMPLETED', 'CAPTURED'].includes(String(entry.paymentStatus).toUpperCase())
    )
    const summary = paidTransactions.reduce(
      (acc, entry) => {
        acc.grossAmountCents += entry.grossAmountCents
        acc.klarandoFeeCents += entry.klarandoFeeCents
        acc.providerFeeCents += entry.providerFeeCents
        acc.merchantPayoutAmountCents += entry.merchantPayoutAmountCents
        acc.tipAmountCents += entry.tipAmountCents
        return acc
      },
      {
        grossAmountCents: 0,
        klarandoFeeCents: 0,
        providerFeeCents: 0,
        merchantPayoutAmountCents: 0,
        tipAmountCents: 0,
      }
    )

    return res.json({
      tenant: { id: tenant.id, name: tenant.name, chainId: tenant.chainId },
      period: { days, from: fromDate.toISOString(), to: new Date().toISOString() },
      activeTariff: {
        planType: tenant.tenantBillingPlan?.planType ?? null,
        isActive: tenant.tenantBillingPlan?.isActive ?? false,
        monthlyFeeCents: tenant.tenantBillingPlan?.monthlyFeeCents ?? 0,
        includedOrders: tenant.tenantBillingPlan?.includedOrders ?? 0,
        commissionPercent,
        fixedFeePerOrderCents,
        paymentTermsDays: tenant.billingProfile?.paymentTermsDays ?? null,
        activeFrom: tenant.tenantBillingPlan?.activeFrom?.toISOString() ?? null,
        activeUntil: tenant.tenantBillingPlan?.activeUntil?.toISOString() ?? null,
      },
      feeConfig: {
        commissionPercent,
        fixedFeePerOrderCents,
      },
      summary: {
        ...summary,
        orderCount: orders.length,
        paidTransactions: paidTransactions.length,
        averageOrderValueCents:
          orders.length > 0
            ? Math.round(
                orders.reduce((sum, order) => sum + toCents(order.total), 0) / Math.max(1, orders.length)
              )
            : 0,
        onlineRevenueCents: paidTransactions.reduce((sum, entry) => sum + entry.grossAmountCents, 0),
      },
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
