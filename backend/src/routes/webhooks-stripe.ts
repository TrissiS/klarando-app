import express from 'express'
import { PaymentProvider, PaymentStatus } from '@prisma/client'
import StripeConstructor = require('stripe')
import { prisma } from '../lib/prisma'
import { getStripe, syncStripeTransactionFeeSnapshot } from '../lib/stripe'
import {
  buildOrderPaymentStatusUpdate,
  normalizeOrderPaymentStatus,
} from '../lib/order-status-transitions'

const router = express.Router()

type StripeEventLike = {
  id: string
  type: string
  account?: string | null
  data: {
    object: Record<string, unknown>
  }
}

function resolveWebhookSecret() {
  const secret = process.env.STRIPE_WEBHOOK_SECRET?.trim()
  if (!secret) {
    throw new Error('STRIPE_WEBHOOK_SECRET fehlt')
  }
  return secret
}

async function markWebhookProcessed(args: {
  eventDbId: string
  processed: boolean
  processingError?: string | null
}) {
  await prisma.paymentWebhookEvent.update({
    where: { id: args.eventDbId },
    data: {
      processed: args.processed,
      processedAt: new Date(),
      processingError: args.processingError || null,
    },
  })
}

async function resolveTenantIdFromStripeEvent(event: StripeEventLike) {
  const object = event.data.object as Record<string, unknown> & {
    metadata?: Record<string, string>
    id?: string
    account?: string
  }

  const metadataTenantId = object?.metadata?.tenantId
  if (metadataTenantId) {
    return metadataTenantId
  }

  const providerPaymentId = typeof object?.id === 'string' ? object.id : null
  if (providerPaymentId) {
    const tx = await prisma.paymentTransaction.findFirst({
      where: {
        provider: PaymentProvider.STRIPE,
        providerPaymentId,
      },
      select: {
        tenantId: true,
      },
      orderBy: { createdAt: 'desc' },
    })
    if (tx?.tenantId) {
      return tx.tenantId
    }
  }

  const stripeAccountId = event.account || (object as { destination?: string }).destination || null
  if (stripeAccountId) {
    const config = await prisma.tenantPaymentConfig.findFirst({
      where: {
        stripeAccountId,
      },
      select: {
        tenantId: true,
      },
    })
    if (config?.tenantId) {
      return config.tenantId
    }
  }

  return null
}

async function handlePaymentIntentSucceeded(event: StripeEventLike) {
  const intent = event.data.object as Record<string, unknown> & {
    id: string
    latest_charge?: string | null
    transfer_data?: { destination?: string | null }
    status?: string | null
    metadata?: { orderId?: string | null } | null
  }
  let tx = await prisma.paymentTransaction.findFirst({
    where: {
      provider: PaymentProvider.STRIPE,
      providerPaymentId: intent.id,
    },
    orderBy: { createdAt: 'desc' },
  })

  if (!tx && typeof intent.metadata?.orderId === 'string' && intent.metadata.orderId.trim().length > 0) {
    tx = await prisma.paymentTransaction.findFirst({
      where: {
        provider: PaymentProvider.STRIPE,
        orderId: intent.metadata.orderId.trim(),
      },
      orderBy: { createdAt: 'desc' },
    })
  }

  if (!tx) {
    return
  }

  const feeSnapshot = await syncStripeTransactionFeeSnapshot({
    id: tx.id,
    providerPaymentId: intent.id,
    stripeChargeId: tx.stripeChargeId,
    platformFeeCents: tx.platformFeeCents,
    providerFeeCents: tx.providerFeeCents,
  }).catch(() => null)

  await prisma.$transaction(async (db) => {
    await db.paymentTransaction.update({
      where: { id: tx.id },
      data: {
        status: PaymentStatus.SUCCEEDED,
        processedAt: new Date(),
        providerPaymentId: intent.id,
        stripeChargeId:
          feeSnapshot?.stripeChargeId ||
          (typeof intent.latest_charge === 'string' ? intent.latest_charge : tx.stripeChargeId),
        platformFeeCents: feeSnapshot?.platformFeeCents ?? tx.platformFeeCents,
        providerFeeCents: feeSnapshot?.providerFeeCents ?? tx.providerFeeCents,
        feeAmountCents: feeSnapshot?.totalFeeCents ?? tx.feeAmountCents,
        stripeAccountId:
          typeof intent.transfer_data?.destination === 'string' ? intent.transfer_data.destination : tx.stripeAccountId,
        metadata: {
          ...(typeof tx.metadata === 'object' && tx.metadata ? (tx.metadata as Record<string, unknown>) : {}),
          stripeStatus: intent.status,
        },
      },
    })

    if (tx.orderId) {
      const order = await db.order.findUnique({
        where: { id: tx.orderId },
        select: {
          status: true,
          paymentStatus: true,
          paidAt: true,
        },
      })
      const currentPaymentStatus = normalizeOrderPaymentStatus(order?.paymentStatus)
      if (!order || !currentPaymentStatus) {
        throw new Error(`Ungueltiger bestehender Zahlungsstatus fuer Bestellung ${tx.orderId}`)
      }
      await db.order.update({
        where: { id: tx.orderId },
        data: {
          ...buildOrderPaymentStatusUpdate({
            currentStatus: currentPaymentStatus,
            nextStatus: 'PAID',
            now: new Date(),
            preservePaidAt: order.paidAt,
          }),
          ...(order.status === 'pending_payment'
            ? {
                status: 'open',
                forwardedToKitchenAt: new Date(),
              }
            : {}),
        },
      })
    }
  })
}

async function handlePaymentIntentFailed(event: StripeEventLike) {
  const intent = event.data.object as Record<string, unknown> & {
    id: string
    last_payment_error?: { code?: string | null; message?: string | null } | null
    metadata?: { orderId?: string | null } | null
  }
  let tx = await prisma.paymentTransaction.findFirst({
    where: {
      provider: PaymentProvider.STRIPE,
      providerPaymentId: intent.id,
    },
    orderBy: { createdAt: 'desc' },
  })

  if (!tx && typeof intent.metadata?.orderId === 'string' && intent.metadata.orderId.trim().length > 0) {
    tx = await prisma.paymentTransaction.findFirst({
      where: {
        provider: PaymentProvider.STRIPE,
        orderId: intent.metadata.orderId.trim(),
      },
      orderBy: { createdAt: 'desc' },
    })
  }

  if (!tx) {
    return
  }

  await prisma.$transaction(async (db) => {
    await db.paymentTransaction.update({
      where: { id: tx.id },
      data: {
        status: PaymentStatus.FAILED,
        processedAt: new Date(),
        providerPaymentId: intent.id,
        failureCode: intent.last_payment_error?.code || null,
        failureMessage: intent.last_payment_error?.message || 'Stripe PaymentIntent fehlgeschlagen',
      },
    })

    if (tx.orderId) {
      const order = await db.order.findUnique({
        where: { id: tx.orderId },
        select: {
          paymentStatus: true,
          paidAt: true,
        },
      })
      const currentPaymentStatus = normalizeOrderPaymentStatus(order?.paymentStatus)
      if (!order || !currentPaymentStatus) {
        throw new Error(`Ungueltiger bestehender Zahlungsstatus fuer Bestellung ${tx.orderId}`)
      }
      await db.order.update({
        where: { id: tx.orderId },
        data: buildOrderPaymentStatusUpdate({
          currentStatus: currentPaymentStatus,
          nextStatus: 'FAILED',
          now: new Date(),
          preservePaidAt: order.paidAt,
        }),
      })
    }
  })
}

async function handleAccountUpdated(event: StripeEventLike) {
  const account = event.data.object as Record<string, unknown> & {
    id: string
    charges_enabled?: boolean
    payouts_enabled?: boolean
    details_submitted?: boolean
    requirements?: {
      currently_due?: string[]
      eventually_due?: string[]
    } | null
  }
  const config = await prisma.tenantPaymentConfig.findFirst({
    where: { stripeAccountId: account.id },
  })

  if (!config) {
    return
  }

  const currentlyDue = Array.isArray(account.requirements?.currently_due) ? account.requirements.currently_due : []
  const eventuallyDue = Array.isArray(account.requirements?.eventually_due)
    ? account.requirements.eventually_due
    : []

  await prisma.tenantPaymentConfig.update({
    where: { tenantId: config.tenantId },
    data: {
      stripeChargesEnabled: Boolean(account.charges_enabled),
      stripePayoutsEnabled: Boolean(account.payouts_enabled),
      stripeDetailsSubmitted: Boolean(account.details_submitted),
      stripeOnboardingCompleted:
        Boolean(account.details_submitted) &&
        Boolean(account.charges_enabled) &&
        Boolean(account.payouts_enabled),
    },
  })

  await prisma.$executeRawUnsafe(
    `
      UPDATE "TenantPaymentConfig"
      SET "stripeOnboarded" = $1,
          "stripeRequirementsDue" = $2::jsonb,
          "stripeLastStatusSyncAt" = $3
      WHERE "tenantId" = $4
    `,
    Boolean(account.details_submitted) && currentlyDue.length === 0,
    JSON.stringify({
      currentlyDue,
      eventuallyDue,
    }),
    new Date(),
    config.tenantId
  )
}

async function handleChargeRefunded(event: StripeEventLike) {
  const charge = event.data.object as Record<string, unknown> & { id: string }

  const tx = await prisma.paymentTransaction.findFirst({
    where: {
      provider: PaymentProvider.STRIPE,
      stripeChargeId: charge.id,
    },
    orderBy: { createdAt: 'desc' },
  })

  if (!tx) {
    return
  }

  await prisma.paymentTransaction.update({
    where: { id: tx.id },
    data: {
      status: PaymentStatus.REFUNDED,
      processedAt: new Date(),
    },
  })
}

async function handleRefundUpdated(event: StripeEventLike) {
  const refund = event.data.object as Record<string, unknown> & {
    id?: string
    status?: string | null
  }
  if (!refund.id) {
    return
  }

  const stored = await prisma.paymentRefund.findFirst({
    where: {
      provider: PaymentProvider.STRIPE,
      providerRefundId: refund.id,
    },
  })

  if (!stored) {
    return
  }

  await prisma.paymentRefund.update({
    where: { id: stored.id },
    data: {
      status: refund.status === 'succeeded' ? 'SUCCEEDED' : refund.status === 'failed' ? 'FAILED' : 'PENDING',
      metadata: {
        ...(typeof stored.metadata === 'object' && stored.metadata ? (stored.metadata as Record<string, unknown>) : {}),
        stripeStatus: refund.status,
      },
    },
  })
}

router.post('/', express.raw({ type: 'application/json' }), async (req, res) => {
  try {
    const signature = req.header('stripe-signature')
    if (!signature) {
      return res.status(400).json({ error: 'Stripe-Signatur fehlt' })
    }

    const stripe = getStripe()
    const secret = resolveWebhookSecret()
    const event = stripe.webhooks.constructEvent(req.body, signature, secret) as unknown as StripeEventLike

    const tenantId = await resolveTenantIdFromStripeEvent(event)
    if (!tenantId) {
      // Unknown tenant mapping should not break Stripe delivery retries forever.
      return res.status(200).json({ ok: true, ignored: true, reason: 'tenant_not_resolved' })
    }

    const existing = await prisma.paymentWebhookEvent.findUnique({
      where: {
        provider_providerEventId: {
          provider: PaymentProvider.STRIPE,
          providerEventId: event.id,
        },
      },
      select: {
        id: true,
        processed: true,
      },
    })

    if (existing?.processed) {
      return res.status(200).json({ ok: true, duplicate: true })
    }

    const dbEvent =
      existing ??
      (await prisma.paymentWebhookEvent.create({
        data: {
          tenantId,
          provider: PaymentProvider.STRIPE,
          providerEventId: event.id,
          eventType: event.type,
          payload: event as unknown as object,
        },
      }))

    try {
      switch (event.type) {
        case 'payment_intent.succeeded':
          await handlePaymentIntentSucceeded(event)
          break
        case 'payment_intent.payment_failed':
          await handlePaymentIntentFailed(event)
          break
        case 'charge.refunded':
          await handleChargeRefunded(event)
          break
        case 'refund.created':
        case 'refund.updated':
          await handleRefundUpdated(event)
          break
        case 'account.updated':
          await handleAccountUpdated(event)
          break
        case 'payout.created':
        case 'payout.paid':
        case 'payout.failed':
          // Payout snapshots are tracked in Stripe dashboard for MVP.
          break
        default:
          break
      }

      await markWebhookProcessed({
        eventDbId: dbEvent.id,
        processed: true,
      })

      return res.status(200).json({ ok: true })
    } catch (processingError) {
      await markWebhookProcessed({
        eventDbId: dbEvent.id,
        processed: false,
        processingError:
          processingError instanceof Error ? processingError.message.slice(0, 1800) : 'Unbekannter Verarbeitungsfehler',
      })
      throw processingError
    }
  } catch (error) {
    console.error('STRIPE WEBHOOK ERROR:', error)
    return res.status(400).json({ error: 'Stripe-Webhook konnte nicht verarbeitet werden' })
  }
})

export default router
