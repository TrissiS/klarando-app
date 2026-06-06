import { PermissionKey } from '@prisma/client'
import { Router } from 'express'
import { createAccountLink, createTenantStripeOnboardingLink, refreshTenantStripeAccountStatus } from '../lib/stripe'
import { prisma } from '../lib/prisma'
import { writeAuditLog } from '../lib/audit'
import { requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'

const router = Router()

router.post('/connect/account', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
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
        endpoint: '/api/stripe/connect/account',
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
    console.error('STRIPE CONNECT ACCOUNT ALIAS ERROR:', error)
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
    console.error('STRIPE CONNECT ONBOARDING LINK ALIAS ERROR:', error)
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
    console.error('STRIPE CONNECT STATUS ALIAS ERROR:', error)
    return res.status(500).json({
      error: error instanceof Error ? error.message : 'Stripe-Status konnte nicht geladen werden',
    })
  }
})

export default router
