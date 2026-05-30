import { CustomerConsentType, CustomerPrivacyRequestStatus, CustomerPrivacyRequestType, PrivacyAuditActionType } from '@prisma/client'
import { Router } from 'express'
import { verifyAppAuthToken } from '../auth/app-token'
import { prisma } from '../lib/prisma'

type AppCustomerAccount = {
  id: string
  email: string
  fullName: string
  phone: string | null
  street: string | null
  zipCode: string | null
  city: string | null
  marketingOptIn: boolean
  createdAt: Date
  updatedAt: Date
}

const router = Router()

function readBearerToken(header: string | undefined) {
  if (!header) return null
  const [scheme, token] = header.split(' ')
  if (scheme?.toLowerCase() !== 'bearer' || !token) {
    return null
  }
  return token.trim()
}

async function resolveAccountFromRequest(authorizationHeader: string | undefined): Promise<AppCustomerAccount | null> {
  const token = readBearerToken(authorizationHeader)
  if (!token) return null
  const payload = verifyAppAuthToken(token)
  if (!payload?.sub) return null
  const account = await prisma.appCustomerAccount.findUnique({
    where: { id: payload.sub },
    select: {
      id: true,
      email: true,
      fullName: true,
      phone: true,
      street: true,
      zipCode: true,
      city: true,
      marketingOptIn: true,
      createdAt: true,
      updatedAt: true,
    },
  })
  return account
}

async function ensureConsent(
  db: Pick<typeof prisma, 'customerConsent'>,
  customerId: string,
  consentType: CustomerConsentType,
  granted: boolean
) {
  await db.customerConsent.upsert({
    where: {
      customerId_consentType: {
        customerId,
        consentType,
      },
    },
    create: {
      customerId,
      consentType,
      granted,
      grantedAt: granted ? new Date() : null,
      revokedAt: granted ? null : new Date(),
      source: 'customer-app',
      version: 'v1',
    },
    update: {
      granted,
      grantedAt: granted ? new Date() : undefined,
      revokedAt: granted ? null : new Date(),
      source: 'customer-app',
      version: 'v1',
    },
  })
}

router.get('/me', async (req, res) => {
  const account = await resolveAccountFromRequest(req.header('authorization') ?? undefined)
  if (!account) {
    return res.status(401).json({ error: 'Nicht angemeldet' })
  }

  const consents = await prisma.customerConsent.findMany({
    where: { customerId: account.id },
  })

  return res.json({
    customer: account,
    consents,
  })
})

router.get('/export', async (req, res) => {
  const account = await resolveAccountFromRequest(req.header('authorization') ?? undefined)
  if (!account) {
    return res.status(401).json({ error: 'Nicht angemeldet' })
  }

  const customer = await prisma.appCustomerAccount.findUnique({
    where: { id: account.id },
    include: {
      authProviders: true,
      privacyConsents: true,
      privacyRequests: true,
      orders: {
        orderBy: { createdAt: 'desc' },
        select: {
          id: true,
          createdAt: true,
          status: true,
          paymentStatus: true,
          total: true,
          customerAddress: true,
          customerName: true,
          customerPhone: true,
        },
      },
    },
  })

  if (!customer) {
    return res.status(404).json({ error: 'Konto nicht gefunden' })
  }

  await prisma.privacyAuditLog.create({
    data: {
      actorRole: 'CUSTOMER',
      customerId: customer.id,
      actionType: PrivacyAuditActionType.DATA_EXPORT_CREATED,
      metadata: { source: 'customer-app' },
    },
  })

  return res.json({
    customer,
    favorites: [],
    ratings: [],
    devices: [],
  })
})

router.post('/delete-request', async (req, res) => {
  const account = await resolveAccountFromRequest(req.header('authorization') ?? undefined)
  if (!account) {
    return res.status(401).json({ error: 'Nicht angemeldet' })
  }

  const reason = typeof req.body?.reason === 'string' ? req.body.reason.trim().slice(0, 500) : null

  const request = await prisma.customerPrivacyRequest.create({
    data: {
      customerId: account.id,
      type: CustomerPrivacyRequestType.DELETE,
      status: CustomerPrivacyRequestStatus.PENDING,
      reason,
      metadata: {
        source: 'customer-app',
      },
    },
  })

  await prisma.appCustomerAccount.update({
    where: { id: account.id },
    data: {
      deletionRequestedAt: new Date(),
      deletionRequestNote: reason,
    },
  })

  await prisma.privacyAuditLog.create({
    data: {
      actorRole: 'CUSTOMER',
      customerId: account.id,
      actionType: PrivacyAuditActionType.DELETE_REQUEST_CREATED,
      reason,
      metadata: { requestId: request.id, source: 'customer-app' },
    },
  })

  return res.status(201).json({ request })
})

router.patch('/consents', async (req, res) => {
  const account = await resolveAccountFromRequest(req.header('authorization') ?? undefined)
  if (!account) {
    return res.status(401).json({ error: 'Nicht angemeldet' })
  }

  const payload = req.body as {
    locationUsage?: unknown
    deliveryUpdates?: unknown
    favoriteOffers?: unknown
    marketing?: unknown
  }

  const locationUsage = Boolean(payload.locationUsage)
  const deliveryUpdates = Boolean(payload.deliveryUpdates)
  const favoriteOffers = Boolean(payload.favoriteOffers)
  const marketing = Boolean(payload.marketing)

  await prisma.$transaction(async (tx) => {
    await ensureConsent(tx, account.id, CustomerConsentType.LOCATION_USAGE, locationUsage)
    await ensureConsent(tx, account.id, CustomerConsentType.DELIVERY_UPDATES, deliveryUpdates)
    await ensureConsent(tx, account.id, CustomerConsentType.FAVORITE_OFFERS, favoriteOffers)
    await ensureConsent(tx, account.id, CustomerConsentType.MARKETING, marketing)

    await tx.appCustomerAccount.update({
      where: { id: account.id },
      data: {
        marketingOptIn: marketing,
      },
    })

    await tx.privacyAuditLog.create({
      data: {
        actorRole: 'CUSTOMER',
        customerId: account.id,
        actionType: PrivacyAuditActionType.CONSENT_CHANGED,
        metadata: {
          locationUsage,
          deliveryUpdates,
          favoriteOffers,
          marketing,
        },
      },
    })
  })

  const consents = await prisma.customerConsent.findMany({
    where: { customerId: account.id },
  })

  return res.json({ consents })
})

export default router
