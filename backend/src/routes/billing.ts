import { InvoiceRecipientType, InvoiceStatus, PermissionKey, UserRole } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requireAuth, requirePermission } from '../middleware/auth'
import { resolveTenantScope } from '../lib/tenant-scope'
import { writeAuditLog } from '../lib/audit'

const router = Router()

function queryString(value: unknown) {
  return typeof value === 'string' ? value : undefined
}

function paramString(value: unknown) {
  return typeof value === 'string' ? value : ''
}

function parseBillingPeriod(raw: unknown) {
  const value = String(raw || '').trim()
  const match = /^(\d{4})-(\d{2})$/.exec(value)
  if (!match) return null
  const year = Number(match[1])
  const month = Number(match[2])
  if (month < 1 || month > 12) return null
  const periodStart = new Date(Date.UTC(year, month - 1, 1, 0, 0, 0))
  const periodEnd = new Date(Date.UTC(year, month, 0, 23, 59, 59, 999))
  return { value, periodStart, periodEnd }
}

async function nextInvoiceNumber(scopeKey: string, issueDate: Date) {
  const sequence = await prisma.invoiceSequence.upsert({
    where: { scopeKey },
    update: { lastNumber: { increment: 1 } },
    create: {
      scopeKey,
      prefix: 'KLR',
      lastNumber: 1,
    },
  })

  return `${sequence.prefix}-${issueDate.getUTCFullYear()}-${String(sequence.lastNumber).padStart(6, '0')}`
}

router.get(
  '/superadmin/preview',
  requireAuth,
  async (req, res) => {
    try {
      if (req.authUser?.role !== UserRole.SUPERADMIN) {
        return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
      }

      const period = parseBillingPeriod(req.query.period)
      if (!period) {
        return res.status(400).json({ error: 'Ungültiger Zeitraum. Format YYYY-MM verwenden.' })
      }

      const plans = await prisma.tenantBillingPlan.findMany({
        where: { isActive: true },
        include: { tenant: { select: { id: true, name: true, chainId: true } } },
      })

      const preview = plans.map((plan) => {
        const monthlyFeeCents = plan.monthlyFeeCents
        const baseCommissionPercent = Number(plan.commissionPercent || 0)
        return {
          tenantId: plan.tenantId,
          tenantName: plan.tenant.name,
          chainId: plan.chainId || plan.tenant.chainId,
          planType: plan.planType,
          monthlyFeeCents,
          commissionPercent: baseCommissionPercent,
          estimatedTotalCents: monthlyFeeCents,
          invoiceStatus: InvoiceStatus.DRAFT,
        }
      })

      return res.json({
        period: {
          key: period.value,
          start: period.periodStart.toISOString(),
          end: period.periodEnd.toISOString(),
        },
        invoicesPreview: preview,
      })
    } catch (error) {
      console.error('GET BILLING PREVIEW ERROR:', error)
      return res.status(500).json({ error: 'Rechnungsvorschau konnte nicht geladen werden' })
    }
  }
)

router.post(
  '/superadmin/finalize',
  requireAuth,
  async (req, res) => {
    try {
      if (req.authUser?.role !== UserRole.SUPERADMIN) {
        return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
      }

      const period = parseBillingPeriod(req.body?.period)
      if (!period) {
        return res.status(400).json({ error: 'Ungültiger Zeitraum. Format YYYY-MM verwenden.' })
      }

      const result = await prisma.$transaction(async (tx) => {
        const billingRun = await tx.billingRun.create({
          data: {
            periodStart: period.periodStart,
            periodEnd: period.periodEnd,
            status: InvoiceStatus.ISSUED,
            finalizedAt: new Date(),
            finalizedByUserId: req.authUser!.id,
          },
        })

        const plans = await tx.tenantBillingPlan.findMany({
          where: { isActive: true },
          include: { tenant: { select: { id: true, chainId: true, name: true } } },
        })

        const createdInvoices: string[] = []
        for (const plan of plans) {
          const invoiceNumber = await nextInvoiceNumber('GLOBAL', new Date())
          const totalGrossCents = Math.max(0, plan.monthlyFeeCents)
          const invoice = await tx.invoice.create({
            data: {
              invoiceNumber,
              tenantId: plan.tenantId,
              chainId: plan.chainId || plan.tenant.chainId,
              billingRunId: billingRun.id,
              recipientType: InvoiceRecipientType.TENANT,
              status: InvoiceStatus.ISSUED,
              periodStart: period.periodStart,
              periodEnd: period.periodEnd,
              issuedAt: new Date(),
              dueAt: new Date(Date.now() + 14 * 24 * 60 * 60 * 1000),
              subTotalCents: totalGrossCents,
              taxTotalCents: 0,
              totalGrossCents,
              openAmountCents: totalGrossCents,
            },
          })

          await tx.invoiceItem.create({
            data: {
              invoiceId: invoice.id,
              lineNo: 1,
              title: 'Klarando Grundgebühr (MVP)',
              quantity: 1,
              unitPriceCents: totalGrossCents,
              netAmountCents: totalGrossCents,
              taxAmountCents: 0,
              grossAmountCents: totalGrossCents,
            },
          })

          await tx.klarandoMailboxMessage.create({
            data: {
              tenantId: plan.tenantId,
              chainId: plan.chainId || plan.tenant.chainId,
              invoiceId: invoice.id,
              messageType: 'INVOICE_ISSUED',
              title: `Neue Rechnung ${invoice.invoiceNumber}`,
              body: `Für den Zeitraum ${period.value} wurde eine neue Rechnung erstellt.`,
              status: InvoiceStatus.ISSUED,
              actionUrl: `/admin/finanzen?invoice=${invoice.id}`,
            },
          })

          createdInvoices.push(invoice.id)
        }

        return { billingRunId: billingRun.id, createdInvoices }
      })

      await writeAuditLog({
        req,
        module: 'billing',
        action: 'BILLING_RUN_FINALIZED',
        targetType: 'BillingRun',
        targetId: result.billingRunId,
        metadata: {
          period: period.value,
          invoicesCreated: result.createdInvoices.length,
        },
      })

      return res.status(201).json({
        billingRunId: result.billingRunId,
        invoicesCreated: result.createdInvoices.length,
      })
    } catch (error) {
      console.error('POST BILLING FINALIZE ERROR:', error)
      return res.status(500).json({ error: 'Monatslauf konnte nicht finalisiert werden' })
    }
  }
)

router.get('/invoices', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    let tenantId: string | null = null
    if (authUser.role === UserRole.ADMIN || authUser.role === UserRole.CHAINADMIN) {
      const scope = await resolveTenantScope(req, queryString(req.query.tenantId))
      tenantId = scope.tenantId
    } else {
      tenantId = typeof req.query.tenantId === 'string' ? req.query.tenantId : null
    }

    const chainId =
      authUser.role === UserRole.CHAINADMIN
        ? authUser.chainId
        : typeof req.query.chainId === 'string'
          ? req.query.chainId
          : null

    const invoices = await prisma.invoice.findMany({
      where: {
        ...(tenantId ? { tenantId } : {}),
        ...(chainId ? { chainId } : {}),
      },
      orderBy: { createdAt: 'desc' },
      take: 200,
      include: {
        tenant: { select: { id: true, name: true } },
        chain: { select: { id: true, name: true } },
      },
    })

    return res.json(invoices)
  } catch (error) {
    console.error('GET BILLING INVOICES ERROR:', error)
    return res.status(500).json({ error: 'Rechnungen konnten nicht geladen werden' })
  }
})

router.get('/invoices/:invoiceId/pdf', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const invoice = await prisma.invoice.findUnique({
      where: { id: paramString(req.params.invoiceId) },
    })
    if (!invoice) {
      return res.status(404).json({ error: 'Rechnung nicht gefunden' })
    }
    const items = await prisma.invoiceItem.findMany({
      where: { invoiceId: invoice.id },
      orderBy: { lineNo: 'asc' },
    })

    return res.json({
      invoiceId: invoice.id,
      invoiceNumber: invoice.invoiceNumber,
      status: invoice.status,
      message: 'PDF-Download ist als MVP vorbereitet. Finale PDF-Erzeugung folgt im nächsten Schritt.',
      items,
    })
  } catch (error) {
    console.error('GET BILLING INVOICE PDF ERROR:', error)
    return res.status(500).json({ error: 'PDF konnte nicht vorbereitet werden' })
  }
})

router.get('/mailbox', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    const tenantId =
      authUser.role === UserRole.SUPERADMIN
        ? typeof req.query.tenantId === 'string'
          ? req.query.tenantId
          : null
        : (await resolveTenantScope(req, queryString(req.query.tenantId))).tenantId

    const chainId =
      authUser.role === UserRole.CHAINADMIN
        ? authUser.chainId
        : typeof req.query.chainId === 'string'
          ? req.query.chainId
          : null

    const messages = await prisma.klarandoMailboxMessage.findMany({
      where: {
        ...(tenantId ? { tenantId } : {}),
        ...(chainId ? { chainId } : {}),
      },
      orderBy: { createdAt: 'desc' },
      take: 200,
    })

    return res.json(messages)
  } catch (error) {
    console.error('GET BILLING MAILBOX ERROR:', error)
    return res.status(500).json({ error: 'Postfach konnte nicht geladen werden' })
  }
})

router.post('/mailbox/:messageId/read', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const message = await prisma.klarandoMailboxMessage.update({
      where: { id: paramString(req.params.messageId) },
      data: { readAt: new Date() },
    })
    return res.json({ ok: true, messageId: message.id, readAt: message.readAt })
  } catch (error) {
    console.error('POST BILLING MAILBOX READ ERROR:', error)
    return res.status(500).json({ error: 'Nachricht konnte nicht aktualisiert werden' })
  }
})

export default router
