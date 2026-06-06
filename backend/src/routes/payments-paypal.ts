import { PaymentProvider, PaymentStatus, PermissionKey, Prisma } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requireAuth, requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { writeAuditLog } from '../lib/audit'
import { verifyAppAuthToken } from '../auth/app-token'
import { resolveTenantPlatformFee } from '../lib/platform-fees'
import {
  asOrderTransitionError,
  buildOrderPaymentStatusUpdate,
  normalizeOrderPaymentStatus,
} from '../lib/order-status-transitions'

const router = Router()

type PaypalApiOrderResponse = {
  id?: string
  status?: string
  links?: Array<{ rel?: string; href?: string }>
  purchase_units?: Array<{
    payments?: {
      captures?: Array<{ id?: string; status?: string }>
    }
  }>
}

function normalizeText(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function parseCentsFromDecimal(value: Prisma.Decimal | null | undefined) {
  const numberValue = Number(value ?? 0)
  if (!Number.isFinite(numberValue)) {
    return 0
  }
  return Math.max(0, Math.round(numberValue * 100))
}

function toAmountStringFromCents(cents: number) {
  return (Math.max(0, cents) / 100).toFixed(2)
}

function parseBoolEnv(value: string | undefined, fallback = false) {
  if (!value) {
    return fallback
  }
  return ['1', 'true', 'yes', 'on'].includes(value.trim().toLowerCase())
}

function getPaypalEnvironment() {
  const raw = normalizeText(process.env.PAYPAL_ENV)?.toLowerCase()
  return raw === 'live' ? 'live' : 'sandbox'
}

function getPaypalApiBaseUrl() {
  return getPaypalEnvironment() === 'live'
    ? 'https://api-m.paypal.com'
    : 'https://api-m.sandbox.paypal.com'
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

async function getPaypalAccessToken() {
  const clientId = normalizeText(process.env.PAYPAL_CLIENT_ID)
  const clientSecret = normalizeText(process.env.PAYPAL_CLIENT_SECRET)
  if (!clientId || !clientSecret) {
    throw new Error('PAYPAL_CLIENT_ID oder PAYPAL_CLIENT_SECRET fehlt')
  }

  const auth = Buffer.from(`${clientId}:${clientSecret}`).toString('base64')
  const response = await fetch(`${getPaypalApiBaseUrl()}/v1/oauth2/token`, {
    method: 'POST',
    headers: {
      Authorization: `Basic ${auth}`,
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: new URLSearchParams({
      grant_type: 'client_credentials',
    }),
  })

  if (!response.ok) {
    const errorBody = await response.text().catch(() => '')
    throw new Error(`PayPal Token-Fehler (${response.status}): ${errorBody || 'unbekannt'}`)
  }

  const payload = (await response.json()) as { access_token?: string }
  const accessToken = normalizeText(payload.access_token)
  if (!accessToken) {
    throw new Error('PayPal Access-Token fehlt in der Antwort')
  }
  return accessToken
}

function extractApprovalUrl(payload: PaypalApiOrderResponse) {
  const links = Array.isArray(payload.links) ? payload.links : []
  const approveLink = links.find((entry) => entry.rel === 'approve')
  return normalizeText(approveLink?.href)
}

router.get('/config', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string

    let config = await prisma.tenantPaymentConfig.findUnique({
      where: { tenantId },
    })

    if (!config) {
      config = await prisma.tenantPaymentConfig.create({
        data: {
          tenantId,
        },
      })
    }

    return res.json(config)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET PAYPAL CONFIG ERROR:', error)
    return res.status(500).json({ error: 'PayPal-Einstellungen konnten nicht geladen werden' })
  }
})

router.put('/config', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const tenantIdInput = req.body?.tenantId
    const scope = await resolveTenantScope(req, tenantIdInput)
    const tenantId = scope.tenantId as string

    const data = req.body?.settings as
      | {
          paypalMerchantId?: string | null
          paypalEmail?: string | null
          paypalOnboardingStatus?: string | null
          paypalEnvironment?: string | null
          paypalPaymentsEnabled?: boolean | null
          klarandoPlatformFeePercent?: number | string | null
          klarandoPlatformFeeFixed?: number | null
        }
      | undefined

    const paypalOnboardingStatus = normalizeText(data?.paypalOnboardingStatus)?.toUpperCase()
    const paypalEnvironment = normalizeText(data?.paypalEnvironment)?.toUpperCase()

    const updated = await prisma.tenantPaymentConfig.upsert({
      where: { tenantId },
      update: {
        paypalMerchantId: normalizeText(data?.paypalMerchantId),
        paypalEmail: normalizeText(data?.paypalEmail),
        paypalOnboardingStatus:
          paypalOnboardingStatus === 'PENDING' ||
          paypalOnboardingStatus === 'VERIFIED' ||
          paypalOnboardingStatus === 'RESTRICTED' ||
          paypalOnboardingStatus === 'DISABLED'
            ? paypalOnboardingStatus
            : 'NOT_STARTED',
        paypalEnvironment: paypalEnvironment === 'LIVE' ? 'LIVE' : 'SANDBOX',
        paypalPaymentsEnabled: Boolean(data?.paypalPaymentsEnabled),
        klarandoPlatformFeePercent:
          data?.klarandoPlatformFeePercent === null || data?.klarandoPlatformFeePercent === undefined
            ? null
            : new Prisma.Decimal(data.klarandoPlatformFeePercent),
        klarandoPlatformFeeFixed:
          typeof data?.klarandoPlatformFeeFixed === 'number' &&
          Number.isInteger(data.klarandoPlatformFeeFixed) &&
          data.klarandoPlatformFeeFixed >= 0
            ? data.klarandoPlatformFeeFixed
            : null,
      },
      create: {
        tenantId,
        paypalMerchantId: normalizeText(data?.paypalMerchantId),
        paypalEmail: normalizeText(data?.paypalEmail),
        paypalOnboardingStatus:
          paypalOnboardingStatus === 'PENDING' ||
          paypalOnboardingStatus === 'VERIFIED' ||
          paypalOnboardingStatus === 'RESTRICTED' ||
          paypalOnboardingStatus === 'DISABLED'
            ? paypalOnboardingStatus
            : 'NOT_STARTED',
        paypalEnvironment: paypalEnvironment === 'LIVE' ? 'LIVE' : 'SANDBOX',
        paypalPaymentsEnabled: Boolean(data?.paypalPaymentsEnabled),
        klarandoPlatformFeePercent:
          data?.klarandoPlatformFeePercent === null || data?.klarandoPlatformFeePercent === undefined
            ? null
            : new Prisma.Decimal(data.klarandoPlatformFeePercent),
        klarandoPlatformFeeFixed:
          typeof data?.klarandoPlatformFeeFixed === 'number' &&
          Number.isInteger(data.klarandoPlatformFeeFixed) &&
          data.klarandoPlatformFeeFixed >= 0
            ? data.klarandoPlatformFeeFixed
            : null,
      },
    })

    await writeAuditLog({
      req,
      module: 'payments',
      action: 'paypal_config_updated',
      targetType: 'tenant',
      targetId: tenantId,
      tenantId,
      metadata: {
        paypalPaymentsEnabled: updated.paypalPaymentsEnabled,
        paypalOnboardingStatus: updated.paypalOnboardingStatus,
        paypalEnvironment: updated.paypalEnvironment,
      },
    })

    return res.json(updated)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE PAYPAL CONFIG ERROR:', error)
    return res.status(500).json({ error: 'PayPal-Einstellungen konnten nicht gespeichert werden' })
  }
})

router.post('/create-order', requireAuth, async (req, res) => {
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
        total: true,
        status: true,
        paymentStatus: true,
        paymentMethod: true,
        appCustomerAccountId: true,
      },
    })
    if (!order) {
      return res.status(404).json({ error: 'Bestellung nicht gefunden' })
    }

    await resolveTenantScope(req, order.tenantId)

    if (order.paymentStatus.toUpperCase() === 'PAID') {
      return res.status(400).json({ error: 'Bestellung ist bereits bezahlt' })
    }

    const config =
      (await prisma.tenantPaymentConfig.findUnique({
        where: { tenantId: order.tenantId },
      })) ??
      (await prisma.tenantPaymentConfig.create({
        data: { tenantId: order.tenantId },
      }))

    if (!config.paypalPaymentsEnabled) {
      return res.status(400).json({ error: 'PayPal ist für diese Filiale deaktiviert' })
    }

    if (
      !config.paypalMerchantId &&
      !config.paypalEmail
    ) {
      return res.status(400).json({ error: 'PayPal-Händlerdaten der Filiale fehlen' })
    }

    const amountCents = parseCentsFromDecimal(order.total)
    if (amountCents <= 0) {
      return res.status(400).json({ error: 'Bestellsumme ist ungültig' })
    }

    const platformFee = await resolveTenantPlatformFee({
      tenantId: order.tenantId,
      amountCents,
    })
    const calculatedPlatformFee = platformFee.platformFeeCents

    const paymentInstruction: Record<string, unknown> = {}
    if (calculatedPlatformFee > 0) {
      const platformMerchantId = normalizeText(process.env.PAYPAL_PLATFORM_MERCHANT_ID)
      paymentInstruction.platform_fees = [
        {
          amount: {
            currency_code: config.currency || 'EUR',
            value: toAmountStringFromCents(calculatedPlatformFee),
          },
          ...(platformMerchantId ? { payee: { merchant_id: platformMerchantId } } : {}),
        },
      ]
      paymentInstruction.disbursement_mode = 'INSTANT'
    }

    const createOrderPayload: Record<string, unknown> = {
      intent: 'CAPTURE',
      purchase_units: [
        {
          reference_id: order.id,
          amount: {
            currency_code: config.currency || 'EUR',
            value: toAmountStringFromCents(amountCents),
          },
          payee: config.paypalMerchantId
            ? { merchant_id: config.paypalMerchantId }
            : { email_address: config.paypalEmail },
          ...(calculatedPlatformFee > 0 ? { payment_instruction: paymentInstruction } : {}),
        },
      ],
    }

    const paypalAccessToken = await getPaypalAccessToken()
    const createResponse = await fetch(`${getPaypalApiBaseUrl()}/v2/checkout/orders`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${paypalAccessToken}`,
        'Content-Type': 'application/json',
        ...(normalizeText(process.env.PAYPAL_PARTNER_ATTRIBUTION_ID)
          ? { 'PayPal-Partner-Attribution-Id': process.env.PAYPAL_PARTNER_ATTRIBUTION_ID as string }
          : {}),
      },
      body: JSON.stringify(createOrderPayload),
    })

    if (!createResponse.ok) {
      const paypalError = await createResponse.text().catch(() => '')
      return res.status(502).json({
        error: 'PayPal-Order konnte nicht erstellt werden',
        details: paypalError || 'unbekannter Fehler',
      })
    }

    const paypalOrder = (await createResponse.json()) as PaypalApiOrderResponse
    const paypalOrderId = normalizeText(paypalOrder.id)
    const approvalUrl = extractApprovalUrl(paypalOrder)
    if (!paypalOrderId || !approvalUrl) {
      return res.status(502).json({ error: 'PayPal-Antwort war unvollständig' })
    }

    await prisma.paymentTransaction.create({
      data: {
        tenantId: order.tenantId,
        orderId: order.id,
        provider: PaymentProvider.PAYPAL,
        status: PaymentStatus.REQUIRES_ACTION,
        providerPaymentId: paypalOrderId,
        amountCents,
        platformFeeCents: calculatedPlatformFee,
        feeBearer: config.paymentFeeBearer,
        currency: config.currency || 'EUR',
        metadata: {
          paypalStatus: paypalOrder.status ?? null,
          approvalUrl,
        },
      },
    })

    await writeAuditLog({
      req,
      module: 'payments',
      action: 'paypal_order_created',
      targetType: 'order',
      targetId: order.id,
      tenantId: order.tenantId,
      metadata: {
        paypalOrderId,
        amountCents,
      },
    })

    return res.status(201).json({
      orderId: order.id,
      paypalOrderId,
      approvalUrl,
      status: paypalOrder.status ?? 'CREATED',
      environment: getPaypalEnvironment(),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('PAYPAL CREATE ORDER ERROR:', error)
    return res.status(500).json({ error: 'PayPal-Checkout konnte nicht vorbereitet werden' })
  }
})

router.post('/capture-order', async (req, res) => {
  try {
    const paypalOrderId = normalizeText(req.body?.paypalOrderId)
    const bodyOrderId = normalizeText(req.body?.orderId)
    if (!paypalOrderId) {
      return res.status(400).json({ error: 'paypalOrderId fehlt' })
    }

    const transaction = await prisma.paymentTransaction.findFirst({
      where: {
        provider: PaymentProvider.PAYPAL,
        providerPaymentId: paypalOrderId,
      },
      include: {
        order: {
          select: {
            id: true,
            tenantId: true,
            appCustomerAccountId: true,
            paymentStatus: true,
            paidAt: true,
          },
        },
      },
      orderBy: { createdAt: 'desc' },
    })

    if (!transaction || !transaction.order) {
      return res.status(404).json({ error: 'Zahlungstransaktion nicht gefunden' })
    }
    const transactionOrder = transaction.order

    if (bodyOrderId && bodyOrderId !== transactionOrder.id) {
      return res.status(400).json({ error: 'orderId passt nicht zu PayPal-Order' })
    }

    if (req.authUser) {
      await resolveTenantScope(req, transaction.tenantId)
    } else {
      const appAccount = await resolveAppCustomerAccountFromHeader(req.header('authorization'))
      if (
        !appAccount ||
        !appAccount.isActive ||
        appAccount.id !== transaction.order.appCustomerAccountId
      ) {
        return res.status(401).json({ error: 'Nicht eingeloggt' })
      }
    }

    const paypalAccessToken = await getPaypalAccessToken()
    const captureResponse = await fetch(
      `${getPaypalApiBaseUrl()}/v2/checkout/orders/${encodeURIComponent(paypalOrderId)}/capture`,
      {
        method: 'POST',
        headers: {
          Authorization: `Bearer ${paypalAccessToken}`,
          'Content-Type': 'application/json',
          ...(normalizeText(process.env.PAYPAL_PARTNER_ATTRIBUTION_ID)
            ? { 'PayPal-Partner-Attribution-Id': process.env.PAYPAL_PARTNER_ATTRIBUTION_ID as string }
            : {}),
        },
      }
    )

    if (!captureResponse.ok) {
      const paypalError = await captureResponse.text().catch(() => '')
      await prisma.paymentTransaction.update({
        where: { id: transaction.id },
        data: {
          status: PaymentStatus.FAILED,
          failureMessage: paypalError.slice(0, 1900),
        },
      })
      return res.status(502).json({
        error: 'PayPal-Zahlung konnte nicht abgeschlossen werden',
        details: paypalError || 'unbekannter Fehler',
      })
    }

    const capturePayload = (await captureResponse.json()) as PaypalApiOrderResponse
    const captureStatus = normalizeText(capturePayload.status)?.toUpperCase()
    const captureRecord = capturePayload.purchase_units?.[0]?.payments?.captures?.[0]
    const captureId = normalizeText(captureRecord?.id)
    const isSuccess = captureStatus === 'COMPLETED'

    await prisma.$transaction(async (tx) => {
      await tx.paymentTransaction.update({
        where: { id: transaction.id },
        data: {
          status: isSuccess ? PaymentStatus.SUCCEEDED : PaymentStatus.FAILED,
          processedAt: new Date(),
          failureMessage: isSuccess ? null : 'PayPal Capture nicht erfolgreich',
          metadata: {
            ...(typeof transaction.metadata === 'object' && transaction.metadata !== null
              ? (transaction.metadata as Record<string, unknown>)
              : {}),
            captureStatus,
            captureId,
          },
        },
      })

      if (isSuccess) {
        const currentPaymentStatus = normalizeOrderPaymentStatus(transactionOrder.paymentStatus)
        if (!currentPaymentStatus) {
          throw new Error(`Ungueltiger bestehender Zahlungsstatus: ${String(transactionOrder.paymentStatus)}`)
        }
        await tx.order.update({
          where: { id: transactionOrder.id },
          data: {
            ...buildOrderPaymentStatusUpdate({
              currentStatus: currentPaymentStatus,
              nextStatus: 'PAID',
              now: new Date(),
              preservePaidAt: transactionOrder.paidAt,
            }),
            paymentMethod: 'PAYPAL',
          },
        })
      }
    })

    await writeAuditLog({
      req,
      module: 'payments',
      action: isSuccess ? 'paypal_capture_succeeded' : 'paypal_capture_failed',
      targetType: 'order',
      targetId: transactionOrder.id,
      tenantId: transaction.tenantId,
      metadata: {
        paypalOrderId,
        captureId,
        captureStatus,
      },
    })

    return res.json({
      ok: isSuccess,
      orderId: transactionOrder.id,
      paypalOrderId,
      captureId,
      status: captureStatus ?? null,
      paymentStatus: isSuccess ? 'PAID' : 'FAILED',
    })
  } catch (error) {
    const transitionError = asOrderTransitionError(error)
    if (transitionError) {
      return res.status(transitionError.statusCode).json({ error: transitionError.message })
    }
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('PAYPAL CAPTURE ORDER ERROR:', error)
    return res.status(500).json({ error: 'PayPal-Zahlung konnte nicht abgeschlossen werden' })
  }
})

export default router
