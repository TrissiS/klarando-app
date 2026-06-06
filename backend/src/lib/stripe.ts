import StripeConstructor = require('stripe')
import { PaymentProvider, PaymentStatus } from '@prisma/client'
import { prisma } from './prisma'
import { getDefaultPlatformFeeConfig, resolveTenantPlatformFee } from './platform-fees'

let stripeClient: StripeConstructor.Stripe | null = null

function requireEnv(name: string) {
  const value = process.env[name]?.trim()
  if (!value) {
    throw new Error(`${name} fehlt`)
  }
  return value
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
  const defaults = getDefaultPlatformFeeConfig()
  const percent = defaults.percent
  const fixed = defaults.fixedCents
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

export async function createExpressDashboardLoginLink(stripeAccountId: string) {
  const stripe = getStripe()
  return stripe.accounts.createLoginLink(stripeAccountId)
}

export async function refreshTenantStripeAccountStatus(tenantId: string) {
  const tenant = await prisma.tenant.findUnique({
    where: { id: tenantId },
    select: {
      id: true,
      paymentConfig: {
        select: {
          tenantId: true,
          stripeAccountId: true,
        },
      },
    },
  })

  if (!tenant) {
    throw new Error('Filiale nicht gefunden')
  }

  const config = tenant.paymentConfig

  if (!config?.stripeAccountId) {
    return {
      tenantId: tenant.id,
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
      payoutInterval: null as string | null,
      nextPayoutAt: null as string | null,
      lastStatusSyncAt: null as string | null,
    }
  }

  const stripe = getStripe()
  const account = await stripe.accounts.retrieve(config.stripeAccountId)
  const pendingPayout = await stripe.payouts
    .list(
      {
        limit: 1,
        status: 'pending',
      },
      {
        stripeAccount: config.stripeAccountId,
      }
    )
    .then((result) => result.data[0] || null)
    .catch(() => null)
  const currentlyDue = normalizeRequirementList(account.requirements?.currently_due)
  const eventuallyDue = normalizeRequirementList(account.requirements?.eventually_due)
  const lastStatusSyncAt = new Date()
  const onboarded = Boolean(account.details_submitted) && currentlyDue.length === 0

  const status = {
    tenantId: tenant.id,
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
    payoutInterval:
      typeof account.settings?.payouts?.schedule?.interval === 'string'
        ? account.settings.payouts.schedule.interval
        : null,
    nextPayoutAt:
      typeof pendingPayout?.arrival_date === 'number'
        ? new Date(pendingPayout.arrival_date * 1000).toISOString()
        : null,
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

export async function syncStripeTransactionFeeSnapshot(input: {
  id: string
  providerPaymentId: string | null
  stripeChargeId: string | null
  platformFeeCents: number
  providerFeeCents: number
}) {
  const stripe = getStripe()
  let stripeChargeId = input.stripeChargeId
  let platformFeeCents = Math.max(0, Math.round(input.platformFeeCents))
  let providerFeeCents = Math.max(0, Math.round(input.providerFeeCents))

  if (input.providerPaymentId) {
    const intent = await stripe.paymentIntents.retrieve(input.providerPaymentId, {
      expand: ['latest_charge.balance_transaction'],
    })

    const latestCharge = intent.latest_charge
    if (latestCharge && typeof latestCharge !== 'string') {
      stripeChargeId = latestCharge.id
      if (typeof latestCharge.application_fee_amount === 'number') {
        platformFeeCents = Math.max(0, latestCharge.application_fee_amount)
      }
      const balanceTransaction = latestCharge.balance_transaction
      if (balanceTransaction && typeof balanceTransaction !== 'string') {
        providerFeeCents = Math.max(0, balanceTransaction.fee || 0)
      }
    }
  }

  if (stripeChargeId && providerFeeCents <= 0) {
    const charge = await stripe.charges.retrieve(stripeChargeId, {
      expand: ['balance_transaction'],
    })
    if (typeof charge.application_fee_amount === 'number') {
      platformFeeCents = Math.max(0, charge.application_fee_amount)
    }
    const balanceTransaction = charge.balance_transaction
    if (balanceTransaction && typeof balanceTransaction !== 'string') {
      providerFeeCents = Math.max(0, balanceTransaction.fee || 0)
    }
  }

  const totalFeeCents = Math.max(0, platformFeeCents + providerFeeCents)

  await prisma.paymentTransaction.update({
    where: { id: input.id },
    data: {
      stripeChargeId,
      platformFeeCents,
      providerFeeCents,
      feeAmountCents: totalFeeCents,
    },
  })

  return {
    stripeChargeId,
    platformFeeCents,
    providerFeeCents,
    totalFeeCents,
  }
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
  const fee = await resolveTenantPlatformFee({
    tenantId: input.tenantId,
    amountCents,
  })

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

export async function createOrderCheckoutSession(input: {
  orderId: string
  successUrl: string
  cancelUrl: string
}) {
  const order = await prisma.order.findUnique({
    where: { id: input.orderId },
    select: {
      id: true,
      tenantId: true,
      total: true,
      paymentStatus: true,
      paymentMethod: true,
      publicOrderCode: true,
      customerName: true,
      appCustomerAccountId: true,
      tenant: {
        select: {
          id: true,
          name: true,
          paymentConfig: true,
        },
      },
    },
  })

  if (!order) {
    throw new Error('Bestellung nicht gefunden')
  }

  if (String(order.paymentStatus).toUpperCase() === 'PAID') {
    throw new Error('Bestellung ist bereits bezahlt')
  }

  if (String(order.paymentMethod || '').toUpperCase() !== 'STRIPE') {
    throw new Error('Bestellung ist nicht für Stripe-Onlinezahlung markiert')
  }

  const config = order.tenant?.paymentConfig
  if (!config?.stripeAccountId || !config.stripeChargesEnabled) {
    throw new Error('Online-Zahlung ist für diese Filiale noch nicht eingerichtet.')
  }

  const amountCents = Math.max(0, Math.round(Number(order.total) * 100))
  if (amountCents <= 0) {
    throw new Error('Bestellsumme ist ungültig')
  }

  const fee = await resolveTenantPlatformFee({
    tenantId: order.tenantId,
    amountCents,
  })

  const stripe = getStripe()
  const session = await stripe.checkout.sessions.create({
    mode: 'payment',
    success_url: input.successUrl,
    cancel_url: input.cancelUrl,
    client_reference_id: order.id,
    line_items: [
      {
        quantity: 1,
        price_data: {
          currency: (config.stripeDefaultCurrency || 'eur').toLowerCase(),
          unit_amount: amountCents,
          product_data: {
            name: order.publicOrderCode
              ? `Bestellung #${order.publicOrderCode}`
              : `Bestellung ${order.id}`,
            description: order.tenant?.name || 'Klarando Bestellung',
          },
        },
      },
    ],
    metadata: {
      tenantId: order.tenantId,
      orderId: order.id,
      publicOrderCode: order.publicOrderCode || '',
      customerName: order.customerName || '',
    },
    payment_intent_data: {
      application_fee_amount: fee.platformFeeCents,
      transfer_data: {
        destination: config.stripeAccountId,
      },
      metadata: {
        tenantId: order.tenantId,
        orderId: order.id,
        publicOrderCode: order.publicOrderCode || '',
      },
    },
  })

  if (!session.url) {
    throw new Error('Stripe Checkout-URL fehlt in der Antwort')
  }

  await prisma.paymentTransaction.create({
    data: {
      tenantId: order.tenantId,
      orderId: order.id,
      provider: PaymentProvider.STRIPE,
      status: PaymentStatus.PENDING,
      providerPaymentId: session.payment_intent && typeof session.payment_intent === 'string' ? session.payment_intent : null,
      amountCents,
      currency: (config.currency || 'EUR').toUpperCase(),
      platformFeeCents: fee.platformFeeCents,
      feeAmountCents: fee.platformFeeCents,
      stripeAccountId: config.stripeAccountId,
      metadata: {
        stripeCheckoutSessionId: session.id,
        stripeCheckoutStatus: session.status,
        stripePaymentStatus: session.payment_status,
      },
    },
  })

  return {
    orderId: order.id,
    tenantId: order.tenantId,
    stripeAccountId: config.stripeAccountId,
    sessionId: session.id,
    checkoutUrl: session.url,
    amountCents,
    currency: (config.currency || 'EUR').toUpperCase(),
    platformFeeCents: fee.platformFeeCents,
    platformFeePercent: fee.percent,
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
