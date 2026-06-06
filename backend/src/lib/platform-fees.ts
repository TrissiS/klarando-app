import { prisma } from './prisma'

export type TenantPlatformFeeSource =
  | 'TENANT_BILLING_PLAN'
  | 'TENANT_PAYMENT_CONFIG'
  | 'ENV_DEFAULT'

export type TenantPlatformFeeConfig = {
  source: TenantPlatformFeeSource
  percent: number
  fixedCents: number
}

function readNumberEnv(name: string, fallback: number) {
  const raw = process.env[name]
  if (!raw || raw.trim().length === 0) {
    return fallback
  }

  const parsed = Number(raw)
  return Number.isFinite(parsed) ? parsed : fallback
}

function readNumberEnvWithAliases(names: string[], fallback: number) {
  for (const name of names) {
    const raw = process.env[name]
    if (!raw || raw.trim().length === 0) {
      continue
    }

    const parsed = Number(raw)
    if (Number.isFinite(parsed)) {
      return parsed
    }
  }

  return fallback
}

function normalizePercent(value: unknown) {
  const parsed = Number(value)
  return Number.isFinite(parsed) ? Math.max(0, parsed) : 0
}

function normalizeCents(value: unknown) {
  const parsed = Number(value)
  return Number.isFinite(parsed) ? Math.max(0, Math.round(parsed)) : 0
}

export function getDefaultPlatformFeeConfig(): TenantPlatformFeeConfig {
  return {
    source: 'ENV_DEFAULT',
    percent: Math.max(
      0,
      readNumberEnvWithAliases(['STRIPE_PLATFORM_FEE_PERCENT', 'KLARANDO_PLATFORM_FEE_PERCENT'], 5)
    ),
    fixedCents: Math.max(
      0,
      Math.round(
        readNumberEnvWithAliases(['STRIPE_PLATFORM_FEE_FIXED_CENTS', 'KLARANDO_PLATFORM_FEE_FIXED_CENTS'], 0)
      )
    ),
  }
}

export async function resolveTenantPlatformFeeConfig(tenantId: string): Promise<TenantPlatformFeeConfig> {
  const tenant = await prisma.tenant.findUnique({
    where: { id: tenantId },
    select: {
      tenantBillingPlan: {
        select: {
          isActive: true,
          commissionAfterIncludedOrdersPercent: true,
          commissionPercent: true,
          fixedFeePerOrderCents: true,
        },
      },
      paymentConfig: {
        select: {
          klarandoPlatformFeePercent: true,
          klarandoPlatformFeeFixed: true,
        },
      },
    },
  })

  const billingPlan = tenant?.tenantBillingPlan
  if (billingPlan?.isActive) {
    return {
      source: 'TENANT_BILLING_PLAN',
      percent: normalizePercent(
        billingPlan.commissionAfterIncludedOrdersPercent ?? billingPlan.commissionPercent ?? 0
      ),
      fixedCents: normalizeCents(billingPlan.fixedFeePerOrderCents ?? 0),
    }
  }

  const paymentConfig = tenant?.paymentConfig
  if (paymentConfig?.klarandoPlatformFeePercent !== null || paymentConfig?.klarandoPlatformFeeFixed !== null) {
    return {
      source: 'TENANT_PAYMENT_CONFIG',
      percent: normalizePercent(paymentConfig?.klarandoPlatformFeePercent ?? 0),
      fixedCents: normalizeCents(paymentConfig?.klarandoPlatformFeeFixed ?? 0),
    }
  }

  return getDefaultPlatformFeeConfig()
}

export async function resolveTenantPlatformFee(args: { tenantId: string; amountCents: number }) {
  const config = await resolveTenantPlatformFeeConfig(args.tenantId)
  const amountCents = Math.max(0, Math.round(args.amountCents))
  const percentFee = Math.round((amountCents * config.percent) / 100)
  const platformFeeCents = Math.max(0, percentFee + config.fixedCents)

  return {
    ...config,
    amountCents,
    platformFeeCents,
  }
}
