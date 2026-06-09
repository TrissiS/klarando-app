import type { Request } from 'express'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { createOrderCheckoutSession } from '../lib/stripe'
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

router.post('/stripe', async (req, res) => {
  try {
    const orderId = normalizeText(req.body?.orderId)
    if (!orderId) {
      return res.status(400).json({ error: 'orderId fehlt' })
    }

    const appCustomer = await resolveAppCustomerAccountFromHeader(req.header('authorization') || undefined)
    if (!appCustomer?.id || !appCustomer.isActive) {
      return res.status(401).json({ error: 'Bitte zuerst im Kundenkonto einloggen.' })
    }

    const order = await prisma.order.findUnique({
      where: { id: orderId },
      select: {
        id: true,
        tenantId: true,
        appCustomerAccountId: true,
        serviceType: true,
        customerAddress: true,
        customerZipCode: true,
        customerCity: true,
      },
    })

    if (!order) {
      console.error('MOBILE_CHECKOUT_ERROR', { reason: 'order_not_found' })
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    if (order.appCustomerAccountId !== appCustomer.id) {
      console.error('MOBILE_CHECKOUT_ERROR', { reason: 'order_customer_mismatch' })
      return res.status(403).json({ error: 'Diese Bestellung gehört nicht zu diesem Kundenkonto' })
    }

    console.info('MOBILE_CHECKOUT_DEBUG', {
      branchId: order.tenantId,
      tenantId: order.tenantId,
      orderType: order.serviceType ?? null,
      deliveryType: order.serviceType ?? null,
      customerAddress:
        [order.customerAddress, order.customerZipCode, order.customerCity]
          .filter((entry) => typeof entry === 'string' && entry.trim().length > 0)
          .join(', ') || null,
      latitude: null,
      longitude: null,
      deliveryAvailable: null,
      rejectionReason: null,
    })

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
    console.error('MOBILE_CHECKOUT_ERROR', {
      reason: error instanceof Error ? error.message : 'unknown',
    })
    console.error('MOBILE STRIPE CHECKOUT ERROR:', error)
    return res.status(400).json({
      error: error instanceof Error ? error.message : 'Stripe-Checkout konnte nicht gestartet werden',
    })
  }
})

export default router
