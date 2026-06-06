import { PermissionKey, UserRole } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import {
  createAccountLink,
  createConnectedAccountForTenant,
  createExpressDashboardLoginLink,
  createOrderPaymentIntent,
  refreshTenantStripeAccountStatus,
  refundPayment,
} from '../lib/stripe'
import { writeAuditLog } from '../lib/audit'
import { requireAuth, requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'

const router = Router()

function normalizeText(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

async function buildStripeOnboardingLink(tenantId: string) {
  const created = await createConnectedAccountForTenant(tenantId)
  const link = await createAccountLink(created.stripeAccountId, tenantId)
  return {
    tenantId,
    stripeAccountId: created.stripeAccountId,
    created: created.created,
    onboardingUrl: link.url,
    expiresAt: link.expires_at,
  }
}

router.post('/connect/onboard', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.body?.tenantId)
    if (!scope.tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const onboarding = await buildStripeOnboardingLink(scope.tenantId)

    await writeAuditLog({
      req,
      module: 'payments',
      action: onboarding.created ? 'stripe_connect_account_created' : 'stripe_connect_account_reused',
      targetType: 'tenant',
      targetId: scope.tenantId,
      tenantId: scope.tenantId,
      metadata: {
        stripeAccountId: onboarding.stripeAccountId,
      },
    })

    return res.status(201).json({
      ok: true,
      ...onboarding,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('STRIPE CONNECT ACCOUNT ERROR:', error)
    return res.status(500).json({
      error: error instanceof Error ? error.message : 'Stripe-Konto konnte nicht verbunden werden',
    })
  }
})

router.post('/connect/account', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.body?.tenantId)
    if (!scope.tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }
    return res.status(201).json({
      ok: true,
      ...(await buildStripeOnboardingLink(scope.tenantId)),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('STRIPE CONNECT ACCOUNT LEGACY ERROR:', error)
    return res.status(500).json({
      error: error instanceof Error ? error.message : 'Stripe-Konto konnte nicht verbunden werden',
    })
  }
})

router.post('/connect/refresh', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.body?.tenantId)
    if (!scope.tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const config = await prisma.tenantPaymentConfig.findUnique({
      where: { tenantId: scope.tenantId },
      select: { stripeAccountId: true },
    })

    if (!config?.stripeAccountId) {
      return res.status(400).json({ error: 'Für diese Filiale ist noch kein Stripe-Konto hinterlegt.' })
    }

    const link = await createAccountLink(config.stripeAccountId, scope.tenantId)
    return res.json({
      ok: true,
      tenantId: scope.tenantId,
      stripeAccountId: config.stripeAccountId,
      onboardingUrl: link.url,
      expiresAt: link.expires_at,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('STRIPE ACCOUNT LINK ERROR:', error)
    return res.status(500).json({
      error: error instanceof Error ? error.message : 'Stripe-Onboarding-Link konnte nicht erstellt werden',
    })
  }
})

router.post('/connect/account-link', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.body?.tenantId)
    if (!scope.tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const config = await prisma.tenantPaymentConfig.findUnique({
      where: { tenantId: scope.tenantId },
      select: { stripeAccountId: true },
    })

    if (!config?.stripeAccountId) {
      return res.status(400).json({ error: 'Für diese Filiale ist noch kein Stripe-Konto hinterlegt.' })
    }

    const link = await createAccountLink(config.stripeAccountId, scope.tenantId)
    return res.json({
      ok: true,
      tenantId: scope.tenantId,
      stripeAccountId: config.stripeAccountId,
      onboardingUrl: link.url,
      expiresAt: link.expires_at,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('STRIPE ACCOUNT LINK LEGACY ERROR:', error)
    return res.status(500).json({
      error: error instanceof Error ? error.message : 'Stripe-Onboarding-Link konnte nicht erstellt werden',
    })
  }
})

router.get('/connect/status', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    if (!scope.tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const status = await refreshTenantStripeAccountStatus(scope.tenantId)
    return res.json(status)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('STRIPE CONNECT STATUS ERROR:', error)
    return res.status(500).json({
      error: error instanceof Error ? error.message : 'Stripe-Status konnte nicht geladen werden',
    })
  }
})

router.post('/connect/dashboard-link', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.body?.tenantId)
    if (!scope.tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const config = await prisma.tenantPaymentConfig.findUnique({
      where: { tenantId: scope.tenantId },
      select: { stripeAccountId: true },
    })

    if (!config?.stripeAccountId) {
      return res.status(400).json({ error: 'Für diese Filiale ist noch kein Stripe-Konto hinterlegt.' })
    }

    const loginLink = await createExpressDashboardLoginLink(config.stripeAccountId)
    return res.json({
      ok: true,
      tenantId: scope.tenantId,
      stripeAccountId: config.stripeAccountId,
      dashboardUrl: loginLink.url,
      createdAt: Date.now(),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('STRIPE DASHBOARD LINK ERROR:', error)
    return res.status(500).json({
      error: error instanceof Error ? error.message : 'Stripe-Dashboard-Link konnte nicht erstellt werden',
    })
  }
})

router.post('/create-intent', requireAuth, async (req, res) => {
  try {
    const orderId = normalizeText(req.body?.orderId)
    const tenantIdInput = normalizeText(req.body?.tenantId)
    if (!orderId || !tenantIdInput) {
      return res.status(400).json({ error: 'tenantId und orderId sind erforderlich' })
    }

    await resolveTenantScope(req, tenantIdInput)

    const amountInput = Number(req.body?.amountCents)
    const amountCents = Number.isFinite(amountInput) ? Math.max(0, Math.round(amountInput)) : undefined

    const intent = await createOrderPaymentIntent({
      tenantId: tenantIdInput,
      orderId,
      amountCents,
    })

    await writeAuditLog({
      req,
      module: 'payments',
      action: 'stripe_payment_intent_created',
      targetType: 'order',
      targetId: orderId,
      tenantId: tenantIdInput,
      metadata: {
        paymentId: intent.paymentId,
        stripePaymentIntentId: intent.paymentIntentId,
        amountCents: intent.amountCents,
      },
    })

    return res.status(201).json(intent)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    const message = error instanceof Error ? error.message : 'Stripe PaymentIntent konnte nicht erstellt werden'
    console.error('STRIPE CREATE INTENT ERROR:', error)
    return res.status(400).json({ error: message })
  }
})

router.post('/refund', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const paymentId = normalizeText(req.body?.paymentId)
    if (!paymentId) {
      return res.status(400).json({ error: 'paymentId fehlt' })
    }

    const payment = await prisma.paymentTransaction.findUnique({
      where: { id: paymentId },
      select: {
        id: true,
        tenantId: true,
      },
    })

    if (!payment) {
      return res.status(404).json({ error: 'Zahlung nicht gefunden' })
    }

    await resolveTenantScope(req, payment.tenantId)

    const amountInput = Number(req.body?.amountCents)
    const amountCents = Number.isFinite(amountInput) ? Math.max(0, Math.round(amountInput)) : undefined

    const refund = await refundPayment({
      paymentId,
      amountCents,
      reason: normalizeText(req.body?.reason) || undefined,
    })

    await writeAuditLog({
      req,
      module: 'payments',
      action: 'stripe_refund_created',
      targetType: 'payment',
      targetId: paymentId,
      tenantId: payment.tenantId,
      metadata: {
        stripeRefundId: refund.stripeRefundId,
        amountCents: refund.amountCents,
      },
    })

    return res.status(201).json(refund)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    const message = error instanceof Error ? error.message : 'Erstattung konnte nicht erstellt werden'
    console.error('STRIPE REFUND ERROR:', error)
    return res.status(400).json({ error: message })
  }
})

router.get('/superadmin/tenants', requireAuth, async (req, res) => {
  try {
    if (!req.authUser || req.authUser.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin darf diese Übersicht sehen' })
    }

    const tenants = await prisma.tenant.findMany({
      orderBy: { name: 'asc' },
      select: {
        id: true,
        name: true,
        chain: {
          select: {
            id: true,
            name: true,
          },
        },
        paymentConfig: {
          select: {
            stripeAccountId: true,
            stripeChargesEnabled: true,
            stripePayoutsEnabled: true,
            stripeDetailsSubmitted: true,
            stripeOnboardingCompleted: true,
          },
        },
      },
    })

    return res.json(tenants)
  } catch (error) {
    console.error('SUPERADMIN STRIPE TENANT STATUS ERROR:', error)
    return res.status(500).json({ error: 'Stripe-Tenantstatus konnte nicht geladen werden' })
  }
})

export default router
