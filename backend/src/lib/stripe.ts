import StripeConstructor = require('stripe')
import { PaymentProvider, PaymentStatus } from '@prisma/client'
import { prisma } from './prisma'

let stripeClient: StripeConstructor.Stripe | null = null

function requireEnv(name: string) {
  const value = process.env[name]?.trim()
  if (!value) {
    throw new Error(`${name} fehlt`)
  }
  return value
}

function readNumberEnv(name: string, fallback: number) {
  const raw = process.env[name]
  if (!raw || raw.trim().length === 0) {
    return fallback
  }

  const parsed = Number(raw)
  if (!Number.isFinite(parsed)) {
    return fallback
  }
  return parsed
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

function normalizeRequirementList(value: unknown) {
  if (!Array.isArray(value)) {
    return []
  }
  return value
    .filter((entry): entry is string => typeof entry === 'string')
    .map((entry) => entry.trim())
    .filter(Boolean)
}

function appendConnectQuery(baseUrl: string, query: Record<string, string>) {
  const url = new URL(baseUrl)
  for (const [key, value] of Object.entries(query)) {
    url.searchParams.set(key, value)
  }
  return url.toString()
}

export function getStripe() {
  if (stripeClient) {
    return stripeClient
  }

  stripeClient = new StripeConstructor(requireEnv('STRIPE_SECRET_KEY'))
  return stripeClient
}

export function calculatePlatformFee(amountCents: number) {
  const normalizedAmount = Math.max(0, Math.round(amountCents))
  const percent = Math.max(
    0,
    readNumberEnvWithAliases(['STRIPE_PLATFORM_FEE_PERCENT', 'KLARANDO_PLATFORM_FEE_PERCENT'], 12)
  )
  const fixed = Math.max(
    0,
    Math.round(
      readNumberEnvWithAliases(['STRIPE_PLATFORM_FEE_FIXED_CENTS', 'KLARANDO_PLATFORM_FEE_FIXED_CENTS'], 0)
    )
  )
  const percentFee = Math.round((normalizedAmount * percent) / 100)
  const totalFee = Math.max(0, percentFee + fixed)

  return {
    percent,
    fixedCents: fixed,
    platformFeeCents: totalFee,
  }
}

async function persistStripeStatusSnapshot(args: {
  tenantId: string
  onboarded: boolean
  requirements: { currentlyDue: string[]; eventuallyDue: string[] }
  lastStatusSyncAt: Date
}) {
  await prisma.$executeRawUnsafe(
    `
      UPDATE "TenantPaymentConfig"
      SET "stripeOnboarded" = $1,
          "stripeRequirementsDue" = $2::jsonb,
          "stripeLastStatusSyncAt" = $3
      WHERE "tenantId" = $4
    `,
    args.onboarded,
    JSON.stringify(args.requirements),
    args.lastStatusSyncAt,
    args.tenantId
  )
}

export async function createConnectedAccountForTenant(tenantId: string) {
  const tenant = await prisma.tenant.findUnique({
    where: { id: tenantId },
    select: {
      id: true,
      name: true,
      paymentConfig: {
        select: {
          id: true,
          stripeAccountId: true,
          stripeDefaultCurrency: true,
        },
      },
    },
  })

  if (!tenant) {
    throw new Error('Filiale nicht gefunden')
  }

  const existingAccountId = tenant.paymentConfig?.stripeAccountId
  if (existingAccountId) {
    return {
      tenantId: tenant.id,
      stripeAccountId: existingAccountId,
      created: false,
    }
  }

  const stripe = getStripe()
  const account = await stripe.accounts.create({
    type: 'express',
    country: 'DE',
    capabilities: {
      card_payments: { requested: true },
      transfers: { requested: true },
    },
    business_type: 'company',
    metadata: {
      tenantId: tenant.id,
      tenantName: tenant.name,
    },
    default_currency: tenant.paymentConfig?.stripeDefaultCurrency || 'eur',
  })

  await prisma.tenantPaymentConfig.upsert({
    where: { tenantId: tenant.id },
    update: {
      stripeAccountId: account.id,
      defaultProvider: PaymentProvider.STRIPE,
    },
    create: {
      tenantId: tenant.id,
      defaultProvider: PaymentProvider.STRIPE,
      stripeAccountId: account.id,
    },
  })

  return {
    tenantId: tenant.id,
    stripeAccountId: account.id,
    created: true,
  }
}

export async function createAccountLink(stripeAccountId: string, tenantId?: string) {
  const stripe = getStripe()
  const refreshUrl = requireEnv('STRIPE_CONNECT_REFRESH_URL')
  const returnUrl = requireEnv('STRIPE_CONNECT_RETURN_URL')
  const refreshUrlWithContext = tenantId
    ? appendConnectQuery(refreshUrl, { tenantId, stripe: 'refresh' })
    : refreshUrl
  const returnUrlWithContext = tenantId
    ? appendConnectQuery(returnUrl, { tenantId, stripe: 'return' })
    : returnUrl

  return stripe.accountLinks.create({
    account: stripeAccountId,
    refresh_url: refreshUrlWithContext,
    return_url: returnUrlWithContext,
    type: 'account_onboarding',
  })
}

export async function refreshTenantStripeAccountStatus(tenantId: string) {
  const config = await prisma.tenantPaymentConfig.findUnique({
    where: { tenantId },
    select: {
      tenantId: true,
      stripeAccountId: true,
    },
  })

  if (!config?.stripeAccountId) {
    return {
      tenantId,
      stripeAccountId: null,
      onboarded: false,
      chargesEnabled: false,
      payoutsEnabled: false,
      detailsSubmitted: false,
      onboardingCompleted: false,
      requirements: {
        currentlyDue: [] as string[],
        eventuallyDue: [] as string[],
      },
      lastStatusSyncAt: null as string | null,
    }
  }

  const stripe = getStripe()
  const account = await stripe.accounts.retrieve(config.stripeAccountId)
  const currentlyDue = normalizeRequirementList(account.requirements?.currently_due)
  const eventuallyDue = normalizeRequirementList(account.requirements?.eventually_due)
  const lastStatusSyncAt = new Date()
  const onboarded = Boolean(account.details_submitted) && currentlyDue.length === 0

  const status = {
    tenantId,
    stripeAccountId: config.stripeAccountId,
    onboarded,
    chargesEnabled: Boolean(account.charges_enabled),
    payoutsEnabled: Boolean(account.payouts_enabled),
    detailsSubmitted: Boolean(account.details_submitted),
    onboardingCompleted:
      Boolean(account.details_submitted) &&
      Boolean(account.charges_enabled) &&
      Boolean(account.payouts_enabled),
    requirements: {
      currentlyDue,
      eventuallyDue,
    },
    lastStatusSyncAt: lastStatusSyncAt.toISOString(),
  }

  await prisma.tenantPaymentConfig.upsert({
    where: { tenantId },
    update: {
      stripeChargesEnabled: status.chargesEnabled,
      stripePayoutsEnabled: status.payoutsEnabled,
      stripeDetailsSubmitted: status.detailsSubmitted,
      stripeOnboardingCompleted: status.onboardingCompleted,
      defaultProvider: PaymentProvider.STRIPE,
    },
    create: {
      tenantId,
      defaultProvider: PaymentProvider.STRIPE,
      stripeAccountId: config.stripeAccountId,
      stripeChargesEnabled: status.chargesEnabled,
      stripePayoutsEnabled: status.payoutsEnabled,
      stripeDetailsSubmitted: status.detailsSubmitted,
      stripeOnboardingCompleted: status.onboardingCompleted,
    },
  })

  await persistStripeStatusSnapshot({
    tenantId,
    onboarded: status.onboarded,
    requirements: status.requirements,
    lastStatusSyncAt,
  })

  return status
}

export async function createOrderPaymentIntent(input: {
  tenantId: string
  orderId: string
  amountCents?: number
  currency?: string
}) {
  const order = await prisma.order.findUnique({
    where: { id: input.orderId },
    select: {
      id: true,
      tenantId: true,
      total: true,
      paymentStatus: true,
    },
  })

  if (!order) {
    throw new Error('Bestellung nicht gefunden')
  }

  if (order.tenantId !== input.tenantId) {
    throw new Error('Bestellung gehört nicht zur gewählten Filiale')
  }

  if (String(order.paymentStatus).toUpperCase() === 'PAID') {
    throw new Error('Bestellung ist bereits bezahlt')
  }

  const config = await prisma.tenantPaymentConfig.findUnique({
    where: { tenantId: input.tenantId },
  })

  if (!config?.stripeAccountId || !config.stripeChargesEnabled) {
    throw new Error('Zahlungen für diese Filiale sind noch nicht eingerichtet.')
  }

  const orderAmountCents = Math.max(0, Math.round(Number(order.total) * 100))
  // TODO: Der Betrag muss langfristig vollständig aus Warenkorb/Order-Items serverseitig berechnet werden.
  const requestedAmount = typeof input.amountCents === 'number' ? Math.max(0, Math.round(input.amountCents)) : 0
  const amountCents = orderAmountCents > 0 ? orderAmountCents : requestedAmount

  if (amountCents <= 0) {
    throw new Error('Bestellsumme ist ungültig')
  }

  const currency = (input.currency || config.stripeDefaultCurrency || 'eur').toLowerCase()
  const fee = calculatePlatformFee(amountCents)

  const stripe = getStripe()
  const intent = await stripe.paymentIntents.create({
    amount: amountCents,
    currency,
    application_fee_amount: fee.platformFeeCents,
    transfer_data: {
      destination: config.stripeAccountId,
    },
    metadata: {
      tenantId: input.tenantId,
      orderId: input.orderId,
      platformFeeCents: String(fee.platformFeeCents),
      platformFeePercent: String(fee.percent),
    },
    automatic_payment_methods: {
      enabled: true,
    },
  })

  const payment = await prisma.paymentTransaction.create({
    data: {
      tenantId: input.tenantId,
      orderId: input.orderId,
      provider: PaymentProvider.STRIPE,
      status: PaymentStatus.REQUIRES_ACTION,
      providerPaymentId: intent.id,
      providerClientSecretRef: intent.client_secret || null,
      amountCents,
      currency: currency.toUpperCase(),
      platformFeeCents: fee.platformFeeCents,
      feeAmountCents: fee.platformFeeCents,
      stripeAccountId: config.stripeAccountId,
      metadata: {
        stripePaymentIntentStatus: intent.status,
      },
    },
  })

  return {
    paymentId: payment.id,
    orderId: input.orderId,
    tenantId: input.tenantId,
    paymentIntentId: intent.id,
    clientSecret: intent.client_secret,
    amountCents,
    currency,
    platformFeeCents: fee.platformFeeCents,
    platformFeePercent: fee.percent,
    connectedAccountId: config.stripeAccountId,
  }
}

export async function refundPayment(input: {
  paymentId: string
  amountCents?: number
  reason?: string
}) {
  const payment = await prisma.paymentTransaction.findUnique({
    where: { id: input.paymentId },
  })

  if (!payment) {
    throw new Error('Zahlung nicht gefunden')
  }

  if (payment.provider !== PaymentProvider.STRIPE) {
    throw new Error('Nur Stripe-Zahlungen können über diesen Endpunkt erstattet werden')
  }

  if (!payment.providerPaymentId) {
    throw new Error('Stripe PaymentIntent-ID fehlt')
  }

  const amountCents =
    typeof input.amountCents === 'number'
      ? Math.max(0, Math.round(input.amountCents))
      : Math.max(0, Math.round(payment.amountCents))

  if (amountCents <= 0) {
    throw new Error('Erstattungsbetrag ist ungültig')
  }

  const stripe = getStripe()
  const refund = await stripe.refunds.create({
    payment_intent: payment.providerPaymentId,
    amount: amountCents,
    reason: input.reason ? 'requested_by_customer' : undefined,
    metadata: {
      paymentId: payment.id,
      tenantId: payment.tenantId,
      orderId: payment.orderId || '',
      customReason: input.reason || '',
    },
  })

  const paymentRefund = await prisma.paymentRefund.create({
    data: {
      tenantId: payment.tenantId,
      paymentTransactionId: payment.id,
      orderId: payment.orderId,
      provider: PaymentProvider.STRIPE,
      providerRefundId: refund.id,
      amountCents,
      reason: input.reason || null,
      status: refund.status === 'succeeded' ? 'SUCCEEDED' : 'PENDING',
      metadata: {
        stripeStatus: refund.status,
      },
    },
  })

  await prisma.paymentTransaction.update({
    where: { id: payment.id },
    data: {
      status: PaymentStatus.PARTIALLY_REFUNDED,
    },
  })

  return {
    paymentId: payment.id,
    refundId: paymentRefund.id,
    stripeRefundId: refund.id,
    status: refund.status,
    amountCents,
  }
}
