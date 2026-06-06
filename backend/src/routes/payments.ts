import { PermissionKey, UserRole } from '@prisma/client'
import { Router } from 'express'
import type { Request } from 'express'
import { prisma } from '../lib/prisma'
import {
  createAccountLink,
  createConnectedAccountForTenant,
  createExpressDashboardLoginLink,
  createOrderCheckoutSession,
  createOrderPaymentIntent,
  createTenantStripeOnboardingLink,
  refreshTenantStripeAccountStatus,
  refundPayment,
} from '../lib/stripe'
import { writeAuditLog } from '../lib/audit'
import { requireAuth, requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { verifyAppAuthToken } from '../auth/app-token'

const router = Router()

function normalizeText(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function readBearerToken(authorizationHeader: string | undefined) {
  if (!authorizationHeader || !authorizationHeader.toLowerCase().startsWith('bearer ')) {
    return null
  }
  return authorizationHeader.slice(7).trim()
}

async function resolveAppCustomerAccountFromHeader(authorizationHeader: string | undefined) {
  const token = readBearerToken(authorizationHeader)
  if (!token) {
    return null
  }

  const payload = verifyAppAuthToken(token)
  if (!payload) {
    return null
  }

  return prisma.appCustomerAccount.findUnique({
    where: { id: payload.sub },
    select: {
      id: true,
      email: true,
      isActive: true,
    },
  })
}

function buildCheckoutCallbackUrl(req: Request, path: string, orderId: string) {
  const originOverride = normalizeText(process.env.STRIPE_CHECKOUT_BASE_URL)
  const protocol = normalizeText(req.header('x-forwarded-proto')) || req.protocol || 'https'
  const host = normalizeText(req.header('x-forwarded-host')) || normalizeText(req.get('host')) || 'localhost'
  const baseUrl = originOverride || `${protocol}://${host}`
  const url = new URL(path, baseUrl)
  url.searchParams.set('orderId', orderId)
  return url.toString()
}

router.post('/connect/onboard', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.body?.tenantId)
    if (!scope.tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const onboarding = await createTenantStripeOnboardingLink(scope.tenantId)

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
      ...(await createTenantStripeOnboardingLink(scope.tenantId)),
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

router.post('/connect/onboarding-link', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
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
      const onboarding = await createTenantStripeOnboardingLink(scope.tenantId)
      return res.status(201).json({
        ok: true,
        ...onboarding,
      })
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
    console.error('STRIPE ONBOARDING LINK ERROR:', error)
    return res.status(500).json({
      error: error instanceof Error ? error.message : 'Stripe-Onboarding-Link konnte nicht erstellt werden',
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

router.post('/checkout-session', async (req, res) => {
  try {
    const orderId = normalizeText(req.body?.orderId)
    if (!orderId) {
      return res.status(400).json({ error: 'orderId fehlt' })
    }

    const order = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        appCustomerAccountId: true,
      },
    })

    if (!order) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    const appCustomer = await resolveAppCustomerAccountFromHeader(req.header('authorization') || undefined)

    if (appCustomer?.id) {
      if (order.appCustomerAccountId !== appCustomer.id) {
        return res.status(403).json({ error: 'Diese Bestellung gehört nicht zu diesem Kundenkonto' })
      }
    } else {
      await resolveTenantScope(req, order.tenantId)
    }

    const successUrl = buildCheckoutCallbackUrl(req, '/api/payments/checkout/success', order.id)
    const cancelUrl = buildCheckoutCallbackUrl(req, '/api/payments/checkout/cancel', order.id)

    const session = await createOrderCheckoutSession({
      orderId: order.id,
      successUrl,
      cancelUrl,
    })

    return res.status(201).json({
      ok: true,
      ...session,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('STRIPE CHECKOUT SESSION ERROR:', error)
    return res.status(400).json({
      error: error instanceof Error ? error.message : 'Stripe-Checkout konnte nicht gestartet werden',
    })
  }
})

router.get('/checkout/success', (_req, res) => {
  res
    .status(200)
    .type('html')
    .send(`<!doctype html><html lang="de"><head><meta charset="utf-8"/><meta name="viewport" content="width=device-width, initial-scale=1"/><title>Zahlung erfolgreich</title><style>body{font-family:Arial,sans-serif;background:#f9fafb;color:#111827;padding:32px;text-align:center}main{max-width:520px;margin:0 auto;background:#fff;border:1px solid #d1fae5;border-radius:16px;padding:24px;box-shadow:0 10px 30px rgba(0,0,0,.08)}h1{color:#047857}p{line-height:1.5}</style></head><body><main><h1>Zahlung erfolgreich</h1><p>Die Bestellung wurde bezahlt. Du kannst dieses Fenster jetzt schließen und zur Klarando-App zurückkehren.</p></main></body></html>`)
})

router.get('/checkout/cancel', (_req, res) => {
  res
    .status(200)
    .type('html')
    .send(`<!doctype html><html lang="de"><head><meta charset="utf-8"/><meta name="viewport" content="width=device-width, initial-scale=1"/><title>Zahlung abgebrochen</title><style>body{font-family:Arial,sans-serif;background:#fff7ed;color:#111827;padding:32px;text-align:center}main{max-width:520px;margin:0 auto;background:#fff;border:1px solid #fdba74;border-radius:16px;padding:24px;box-shadow:0 10px 30px rgba(0,0,0,.08)}h1{color:#c2410c}p{line-height:1.5}</style></head><body><main><h1>Zahlung abgebrochen</h1><p>Die Online-Zahlung wurde nicht abgeschlossen. Du kannst dieses Fenster jetzt schließen und zur Klarando-App zurückkehren.</p></main></body></html>`)
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

router.post('/stripe/payment-intent', async (req, res) => {
  try {
    const orderId = normalizeText(req.body?.orderId)
    const tenantIdInput = normalizeText(req.body?.tenantId)
    if (!orderId) {
      return res.status(400).json({ error: 'orderId ist erforderlich' })
    }

    const order = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        appCustomerAccountId: true,
      },
    })

    if (!order) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    if (tenantIdInput && tenantIdInput !== order.tenantId) {
      return res.status(400).json({ error: 'tenantId passt nicht zur Bestellung' })
    }

    const appCustomer = await resolveAppCustomerAccountFromHeader(req.header('authorization') || undefined)
    if (appCustomer?.id) {
      if (order.appCustomerAccountId !== appCustomer.id) {
        return res.status(403).json({ error: 'Diese Bestellung gehört nicht zu diesem Kundenkonto' })
      }
    } else {
      await resolveTenantScope(req, order.tenantId)
    }

    const amountInput = Number(req.body?.amountCents)
    const amountCents = Number.isFinite(amountInput) ? Math.max(0, Math.round(amountInput)) : undefined

    const intent = await createOrderPaymentIntent({
      tenantId: order.tenantId,
      orderId: order.id,
      amountCents,
    })

    if (req.authUser) {
      await writeAuditLog({
        req,
        module: 'payments',
        action: 'stripe_payment_intent_created',
        targetType: 'order',
        targetId: order.id,
        tenantId: order.tenantId,
        metadata: {
          paymentId: intent.paymentId,
          stripePaymentIntentId: intent.paymentIntentId,
          amountCents: intent.amountCents,
          endpoint: '/api/payments/stripe/payment-intent',
        },
      })
    }

    return res.status(201).json(intent)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    const message = error instanceof Error ? error.message : 'Stripe PaymentIntent konnte nicht erstellt werden'
    console.error('STRIPE PUBLIC CREATE INTENT ERROR:', error)
    return res.status(400).json({ error: message })
  }
})

router.put('/connect/config', requireAuth, async (req, res) => {
  try {
    if (!req.authUser || req.authUser.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin darf Stripe-Gebühren verwalten' })
    }

    const tenantId = normalizeText(req.body?.tenantId)
    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const percentRaw = req.body?.klarandoPlatformFeePercent
    const fixedRaw = req.body?.klarandoPlatformFeeFixed
    const percent =
      percentRaw === null || percentRaw === undefined || String(percentRaw).trim() === ''
        ? null
        : Number(percentRaw)
    const fixed =
      fixedRaw === null || fixedRaw === undefined || String(fixedRaw).trim() === ''
        ? null
        : Number(fixedRaw)

    if (percent !== null && (!Number.isFinite(percent) || percent < 0)) {
      return res.status(400).json({ error: 'klarandoPlatformFeePercent ist ungültig' })
    }
    if (fixed !== null && (!Number.isFinite(fixed) || fixed < 0)) {
      return res.status(400).json({ error: 'klarandoPlatformFeeFixed ist ungültig' })
    }

    const updated = await prisma.tenantPaymentConfig.upsert({
      where: { tenantId },
      update: {
        klarandoPlatformFeePercent: percent,
        klarandoPlatformFeeFixed: fixed === null ? null : Math.round(fixed),
      },
      create: {
        tenantId,
        klarandoPlatformFeePercent: percent ?? 5,
        klarandoPlatformFeeFixed: fixed === null ? null : Math.round(fixed),
      },
    })

    return res.json({
      ok: true,
      tenantId,
      klarandoPlatformFeePercent: updated.klarandoPlatformFeePercent,
      klarandoPlatformFeeFixed: updated.klarandoPlatformFeeFixed,
    })
  } catch (error) {
    console.error('STRIPE CONNECT CONFIG UPDATE ERROR:', error)
    return res.status(500).json({
      error: error instanceof Error ? error.message : 'Stripe-Gebühren konnten nicht gespeichert werden',
    })
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
            stripeOnboarded: true,
            stripeChargesEnabled: true,
            stripePayoutsEnabled: true,
            stripeDetailsSubmitted: true,
            stripeOnboardingCompleted: true,
            klarandoPlatformFeePercent: true,
            klarandoPlatformFeeFixed: true,
            stripeRequirementsDue: true,
            stripeLastStatusSyncAt: true,
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
