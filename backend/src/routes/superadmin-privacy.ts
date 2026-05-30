import { CustomerConsentType, CustomerPrivacyRequestStatus, CustomerPrivacyRequestType, Prisma, PrivacyAuditActionType, UserRole } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'

type PrivacyActionInput = {
  actorUserId?: string | null
  actorRole?: string | null
  customerId: string
  actionType: PrivacyAuditActionType
  reason?: string | null
  oldStatus?: string | null
  newStatus?: string | null
  metadata?: Prisma.InputJsonValue
}

function requireSuperadmin(req: any, res: any) {
  const role = req.authUser?.role
  if (role !== UserRole.SUPERADMIN) {
    res.status(403).json({ error: 'Nur SUPERADMIN erlaubt' })
    return null
  }
  return req.authUser
}

function maskEmail(value: string | null) {
  if (!value) return null
  const [local, domain] = value.split('@')
  if (!domain) return value
  if (local.length <= 2) return `**@${domain}`
  return `${local.slice(0, 2)}***@${domain}`
}

function maskPhone(value: string | null) {
  if (!value) return null
  const normalized = value.trim()
  if (normalized.length <= 4) return '****'
  return `${'*'.repeat(Math.max(0, normalized.length - 4))}${normalized.slice(-4)}`
}

async function writePrivacyAudit(input: PrivacyActionInput) {
  await prisma.privacyAuditLog.create({
    data: {
      actorUserId: input.actorUserId ?? null,
      actorRole: input.actorRole ?? null,
      customerId: input.customerId,
      actionType: input.actionType,
      reason: input.reason ?? null,
      oldStatus: input.oldStatus ?? null,
      newStatus: input.newStatus ?? null,
      metadata: input.metadata,
    },
  })
}

function parseBool(raw: unknown) {
  if (typeof raw === 'boolean') return raw
  if (typeof raw === 'string') {
    const v = raw.trim().toLowerCase()
    return v === 'true' || v === '1' || v === 'yes'
  }
  return false
}

const router = Router()

router.get('/customers', async (req, res) => {
  const actor = requireSuperadmin(req, res)
  if (!actor) return

  const q = typeof req.query.q === 'string' ? req.query.q.trim() : ''
  const status = typeof req.query.status === 'string' ? req.query.status.trim().toUpperCase() : ''

  const where: Prisma.AppCustomerAccountWhereInput = {
    ...(q
      ? {
          OR: [
            { fullName: { contains: q, mode: 'insensitive' } },
            { email: { contains: q, mode: 'insensitive' } },
            { phone: { contains: q, mode: 'insensitive' } },
          ],
        }
      : {}),
    ...(status === 'ANONYMIZED'
      ? { fullName: { startsWith: 'Anonymized Customer' } }
      : status === 'ACTIVE'
        ? { isActive: true }
        : status === 'DISABLED'
          ? { isActive: false }
          : {}),
  }

  const rows = await prisma.appCustomerAccount.findMany({
    where,
    orderBy: { createdAt: 'desc' },
    take: 300,
    include: {
      authProviders: true,
      privacyConsents: true,
      privacyRequests: { orderBy: { requestedAt: 'desc' }, take: 1 },
      _count: { select: { orders: true } },
      orders: { orderBy: { createdAt: 'desc' }, take: 1, select: { createdAt: true } },
    },
  })

  return res.json({
    customers: rows.map((entry) => {
      const latestDeleteRequest = entry.privacyRequests.find((request) => request.type === CustomerPrivacyRequestType.DELETE)
      const isAnonymized = entry.fullName.startsWith('Anonymized Customer') || entry.email?.endsWith('@klarando.local')
      return {
        id: entry.id,
        name: entry.fullName,
        emailMasked: maskEmail(entry.email),
        phoneMasked: maskPhone(entry.phone),
        email: entry.email,
        phone: entry.phone,
        status: isAnonymized
          ? 'ANONYMIZED'
          : latestDeleteRequest?.status === CustomerPrivacyRequestStatus.PENDING
            ? 'DELETE_REQUESTED'
            : entry.isActive
              ? 'ACTIVE'
              : 'DISABLED',
        createdAt: entry.createdAt,
        lastLoginAt: entry.lastLoginAt,
        loginType: entry.authProviders.map((provider) => provider.provider),
        orderCount: entry._count.orders,
        lastOrderAt: entry.orders[0]?.createdAt ?? null,
        marketingOptIn: entry.marketingOptIn,
        consents: {
          location: entry.privacyConsents.find((consent) => consent.consentType === CustomerConsentType.LOCATION_USAGE)?.granted ?? false,
          deliveryUpdates:
            entry.privacyConsents.find((consent) => consent.consentType === CustomerConsentType.DELIVERY_UPDATES)?.granted ?? false,
          favoriteOffers:
            entry.privacyConsents.find((consent) => consent.consentType === CustomerConsentType.FAVORITE_OFFERS)?.granted ?? false,
          marketing:
            entry.privacyConsents.find((consent) => consent.consentType === CustomerConsentType.MARKETING)?.granted ?? entry.marketingOptIn,
        },
      }
    }),
  })
})

router.get('/customers/:id', async (req, res) => {
  const actor = requireSuperadmin(req, res)
  if (!actor) return

  const customer = await prisma.appCustomerAccount.findUnique({
    where: { id: req.params.id },
    include: {
      authProviders: true,
      privacyConsents: true,
      privacyRequests: { orderBy: { requestedAt: 'desc' } },
      privacyAuditLogs: { orderBy: { createdAt: 'desc' }, take: 100 },
      orders: {
        orderBy: { createdAt: 'desc' },
        take: 100,
        select: {
          id: true,
          createdAt: true,
          total: true,
          status: true,
          paymentStatus: true,
          serviceType: true,
        },
      },
    },
  })

  if (!customer) {
    return res.status(404).json({ error: 'Kunde nicht gefunden' })
  }

  await writePrivacyAudit({
    actorUserId: actor.id,
    actorRole: actor.role,
    customerId: customer.id,
    actionType: PrivacyAuditActionType.CUSTOMER_VIEWED,
  })

  return res.json({
    customer,
  })
})

router.get('/customers/:id/export', async (req, res) => {
  const actor = requireSuperadmin(req, res)
  if (!actor) return

  const customer = await prisma.appCustomerAccount.findUnique({
    where: { id: req.params.id },
    include: {
      authProviders: true,
      privacyConsents: true,
      privacyRequests: true,
      privacyAuditLogs: { orderBy: { createdAt: 'desc' }, take: 500 },
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
    return res.status(404).json({ error: 'Kunde nicht gefunden' })
  }

  await writePrivacyAudit({
    actorUserId: actor.id,
    actorRole: actor.role,
    customerId: customer.id,
    actionType: PrivacyAuditActionType.DATA_EXPORT_CREATED,
  })

  return res.json({
    customer,
    favorites: [],
    ratings: [],
    devices: [],
  })
})

router.post('/customers/:id/disable', async (req, res) => {
  const actor = requireSuperadmin(req, res)
  if (!actor) return

  const reason = typeof req.body?.reason === 'string' ? req.body.reason.trim().slice(0, 500) : null

  const existing = await prisma.appCustomerAccount.findUnique({ where: { id: req.params.id } })
  if (!existing) return res.status(404).json({ error: 'Kunde nicht gefunden' })

  const updated = await prisma.appCustomerAccount.update({
    where: { id: existing.id },
    data: { isActive: false },
  })

  await writePrivacyAudit({
    actorUserId: actor.id,
    actorRole: actor.role,
    customerId: existing.id,
    actionType: PrivacyAuditActionType.CUSTOMER_DISABLED,
    reason,
    oldStatus: existing.isActive ? 'ACTIVE' : 'DISABLED',
    newStatus: updated.isActive ? 'ACTIVE' : 'DISABLED',
  })

  return res.json({ ok: true, customerId: updated.id, isActive: updated.isActive })
})

router.post('/customers/:id/anonymize', async (req, res) => {
  const actor = requireSuperadmin(req, res)
  if (!actor) return

  const reason = typeof req.body?.reason === 'string' ? req.body.reason.trim().slice(0, 500) : null
  const confirmationChecked = parseBool(req.body?.confirmPrivacyCheck)
  if (!confirmationChecked) {
    return res.status(400).json({ error: 'DSGVO-Bestätigung fehlt' })
  }

  const existing = await prisma.appCustomerAccount.findUnique({ where: { id: req.params.id } })
  if (!existing) return res.status(404).json({ error: 'Kunde nicht gefunden' })

  const anonymizedEmail = `deleted-${existing.id}@klarando.local`

  await prisma.$transaction(async (tx) => {
    await tx.appCustomerAccount.update({
      where: { id: existing.id },
      data: {
        fullName: `Anonymized Customer ${existing.id.slice(0, 8)}`,
        email: anonymizedEmail,
        phone: null,
        street: null,
        zipCode: null,
        city: null,
        marketingOptIn: false,
        deletionRequestedAt: new Date(),
        deletionRequestNote: reason,
        isActive: false,
      },
    })

    await tx.appCustomerAuthProvider.deleteMany({ where: { appCustomerId: existing.id } })

    await tx.customerConsent.updateMany({
      where: { customerId: existing.id },
      data: {
        granted: false,
        revokedAt: new Date(),
      },
    })

    await tx.customerPrivacyRequest.create({
      data: {
        customerId: existing.id,
        type: CustomerPrivacyRequestType.DELETE,
        status: CustomerPrivacyRequestStatus.COMPLETED,
        processedAt: new Date(),
        processedByUserId: actor.id,
        reason,
        metadata: {
          mode: 'ANONYMIZE',
          removedAuthProviders: true,
        },
      },
    })

    await tx.privacyAuditLog.create({
      data: {
        actorUserId: actor.id,
        actorRole: actor.role,
        customerId: existing.id,
        actionType: PrivacyAuditActionType.CUSTOMER_ANONYMIZED,
        reason,
        oldStatus: existing.isActive ? 'ACTIVE' : 'DISABLED',
        newStatus: 'ANONYMIZED',
        metadata: {
          anonymizedEmail,
        },
      },
    })
  })

  return res.json({ ok: true, customerId: existing.id, mode: 'ANONYMIZE' })
})

router.post('/customers/:id/delete-request', async (req, res) => {
  const actor = requireSuperadmin(req, res)
  if (!actor) return

  const reason = typeof req.body?.reason === 'string' ? req.body.reason.trim().slice(0, 500) : null

  const existing = await prisma.appCustomerAccount.findUnique({ where: { id: req.params.id } })
  if (!existing) return res.status(404).json({ error: 'Kunde nicht gefunden' })

  const request = await prisma.customerPrivacyRequest.create({
    data: {
      customerId: existing.id,
      type: CustomerPrivacyRequestType.DELETE,
      status: CustomerPrivacyRequestStatus.PENDING,
      reason,
      metadata: {
        source: 'SUPERADMIN',
      },
    },
  })

  await writePrivacyAudit({
    actorUserId: actor.id,
    actorRole: actor.role,
    customerId: existing.id,
    actionType: PrivacyAuditActionType.DELETE_REQUEST_CREATED,
    reason,
    oldStatus: existing.isActive ? 'ACTIVE' : 'DISABLED',
    newStatus: 'DELETE_REQUESTED',
    metadata: { requestId: request.id },
  })

  return res.status(201).json({ request })
})

router.get('/audit-log', async (req, res) => {
  const actor = requireSuperadmin(req, res)
  if (!actor) return

  const logs = await prisma.privacyAuditLog.findMany({
    orderBy: { createdAt: 'desc' },
    take: 500,
  })

  return res.json({ logs })
})

router.get('/delete-requests', async (req, res) => {
  const actor = requireSuperadmin(req, res)
  if (!actor) return

  const rows = await prisma.customerPrivacyRequest.findMany({
    where: { type: CustomerPrivacyRequestType.DELETE },
    orderBy: { requestedAt: 'desc' },
    take: 300,
    include: {
      customer: {
        select: {
          id: true,
          fullName: true,
          email: true,
        },
      },
    },
  })

  return res.json({ requests: rows })
})

export default router
