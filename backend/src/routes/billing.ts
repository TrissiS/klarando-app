import { InvoiceStatus, PermissionKey, UserRole } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requireAuth, requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { writeAuditLog } from '../lib/audit'
import {
  calculateBillingSummary,
  calculateTenantBilling,
  canFinalizeInvoice,
  createInvoiceDraftFromCalculation,
  parseBillingMonthOrCurrent,
} from '../lib/billing-engine'

const router = Router()

function asString(value: unknown) {
  return typeof value === 'string' ? value : undefined
}

function toCents(value: unknown) {
  const amount = Number(value || 0)
  return Number.isFinite(amount) ? Math.round(amount * 100) : 0
}

function monthPeriodFromReq(req: { query?: Record<string, unknown>; body?: Record<string, unknown> }) {
  return parseBillingMonthOrCurrent(req.query?.month || req.body?.month || req.query?.period || req.body?.period)
}

router.get('/summary', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const period = monthPeriodFromReq(req)
    const chainId = asString(req.query?.chainId)
    const tenantId = asString(req.query?.tenantId)

    const tenantFilter = await prisma.tenant.findMany({
      where: {
        ...(tenantId ? { id: tenantId } : {}),
        ...(chainId ? { chainId } : {}),
      },
      select: { id: true },
    })

    const result = await calculateBillingSummary(
      period,
      tenantFilter.map((row) => row.id)
    )

    return res.json({
      month: period.key,
      periodStart: period.periodStart.toISOString(),
      periodEnd: period.periodEnd.toISOString(),
      summary: result.summary,
    })
  } catch (error) {
    console.error('GET BILLING SUMMARY ERROR:', error)
    return res.status(500).json({ error: 'Abrechnungsübersicht konnte nicht geladen werden' })
  }
})

router.get('/tenants', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const period = monthPeriodFromReq(req)
    const chainId = asString(req.query?.chainId)
    const tenantId = asString(req.query?.tenantId)
    const status = asString(req.query?.status)

    const tenants = await prisma.tenant.findMany({
      where: {
        ...(tenantId ? { id: tenantId } : {}),
        ...(chainId ? { chainId } : {}),
      },
      select: { id: true },
      orderBy: { id: 'asc' },
    })

    const rows = (
      await Promise.all(tenants.map((entry) => calculateTenantBilling(entry.id, period)))
    ).filter((row) => Boolean(row))

    const filteredRows = status ? rows.filter((row) => row!.status === status) : rows

    return res.json({
      month: period.key,
      rows: filteredRows,
    })
  } catch (error) {
    console.error('GET BILLING TENANTS ERROR:', error)
    return res.status(500).json({ error: 'Tenant-Abrechnung konnte nicht geladen werden' })
  }
})

router.post('/runs/preview', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const period = monthPeriodFromReq(req)
    const chainId = asString(req.body?.chainId)
    const tenantId = asString(req.body?.tenantId)

    const tenantRows = await prisma.tenant.findMany({
      where: {
        ...(tenantId ? { id: tenantId } : {}),
        ...(chainId ? { chainId } : {}),
      },
      select: { id: true },
    })

    const rows = (
      await Promise.all(tenantRows.map((entry) => calculateTenantBilling(entry.id, period)))
    ).filter((row): row is NonNullable<typeof row> => Boolean(row))

    const warnings = rows.flatMap((row) => row.warnings.map((message) => ({ tenantId: row.tenantId, message })))

    return res.json({
      month: period.key,
      periodStart: period.periodStart.toISOString(),
      periodEnd: period.periodEnd.toISOString(),
      rows,
      warnings,
    })
  } catch (error) {
    console.error('POST BILLING RUN PREVIEW ERROR:', error)
    return res.status(500).json({ error: 'Abrechnungsvorschau konnte nicht erzeugt werden' })
  }
})

router.post('/runs', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const period = monthPeriodFromReq(req)
    const previewRows = (
      await Promise.all(
        (
          await prisma.tenant.findMany({ select: { id: true } })
        ).map((tenant) => calculateTenantBilling(tenant.id, period))
      )
    ).filter((row): row is NonNullable<typeof row> => Boolean(row))

    const billingRun = await prisma.billingRun.create({
      data: {
        periodStart: period.periodStart,
        periodEnd: new Date(period.periodEnd.getTime() - 1),
        status: InvoiceStatus.DRAFT,
        warningsJson: previewRows.flatMap((row) => row.warnings),
        warningCount: previewRows.reduce((acc, row) => acc + row.warnings.length, 0),
      },
    })

    const invoiceIds: string[] = []
    for (const row of previewRows) {
      const invoice = await createInvoiceDraftFromCalculation({
        billingRunId: billingRun.id,
        period,
        tenantCalculation: row,
      })
      invoiceIds.push(invoice.id)
    }

    await writeAuditLog({
      req,
      module: 'billing',
      action: 'BILLING_RUN_CREATED',
      targetType: 'BillingRun',
      targetId: billingRun.id,
      metadata: {
        month: period.key,
        invoices: invoiceIds.length,
      },
    })

    return res.status(201).json({
      billingRunId: billingRun.id,
      invoicesCreated: invoiceIds.length,
      invoiceIds,
    })
  } catch (error) {
    console.error('POST BILLING RUN CREATE ERROR:', error)
    return res.status(500).json({ error: 'Monatsabrechnung konnte nicht erstellt werden' })
  }
})

router.post('/invoices/:invoiceId/finalize', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const invoice = await prisma.invoice.findUnique({
      where: { id: String(req.params.invoiceId || '') },
      include: { items: true },
    })
    if (!invoice) {
      return res.status(404).json({ error: 'Rechnung nicht gefunden' })
    }
    if (!canFinalizeInvoice(invoice.status)) {
      return res.status(409).json({ error: 'Finalisierte Rechnung darf nicht überschrieben werden' })
    }

    const updated = await prisma.invoice.update({
      where: { id: invoice.id },
      data: {
        status: InvoiceStatus.ISSUED,
        issuedAt: new Date(),
      },
    })

    await writeAuditLog({
      req,
      module: 'billing',
      action: 'INVOICE_FINALIZED',
      targetType: 'Invoice',
      targetId: invoice.id,
      tenantId: invoice.tenantId || undefined,
      chainId: invoice.chainId || undefined,
      metadata: {
        invoiceNumber: invoice.invoiceNumber,
      },
    })

    return res.json({ ok: true, invoiceId: updated.id, status: updated.status })
  } catch (error) {
    console.error('POST FINALIZE INVOICE ERROR:', error)
    return res.status(500).json({ error: 'Rechnung konnte nicht finalisiert werden' })
  }
})

router.get('/invoices/:invoiceId/pdf', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const invoice = await prisma.invoice.findUnique({
      where: { id: String(req.params.invoiceId || '') },
      include: {
        items: { orderBy: { lineNo: 'asc' } },
        tenant: { select: { id: true, name: true } },
        chain: { select: { id: true, name: true } },
      },
    })
    if (!invoice) {
      return res.status(404).json({ error: 'Rechnung nicht gefunden' })
    }

    return res.json({
      invoiceId: invoice.id,
      invoiceNumber: invoice.invoiceNumber,
      status: invoice.status,
      issuer: {
        companyName: 'Klarando Einzelunternehmen',
        owner: 'Tristan Stenger',
        street: 'Untere Wiesenstr. 6',
        zipCode: '57271',
        city: 'Hilchenbach',
        email: 'info@klarando.com',
        vatId: 'DE314972366',
      },
      recipient: {
        tenantName: invoice.tenant?.name || null,
        chainName: invoice.chain?.name || null,
      },
      taxModelHint: 'E-Rechnung (ZUGFeRD/XRechnung) ist vorbereitet und folgt in einer späteren Ausbaustufe.',
      items: invoice.items,
      totals: {
        netCents: invoice.subTotalCents,
        vatCents: invoice.taxTotalCents,
        grossCents: invoice.totalGrossCents,
      },
      message: 'PDF-Rechnung MVP: strukturierte Daten sind bereit, Render-Pipeline folgt als nächster Schritt.',
    })
  } catch (error) {
    console.error('GET BILLING INVOICE PDF ERROR:', error)
    return res.status(500).json({ error: 'PDF konnte nicht vorbereitet werden' })
  }
})

router.get('/invoices', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) return res.status(401).json({ error: 'Nicht eingeloggt' })

    let tenantId: string | null = null
    if (authUser.role === UserRole.ADMIN || authUser.role === UserRole.CHAINADMIN) {
      const scope = await resolveTenantScope(req, asString(req.query.tenantId))
      tenantId = scope.tenantId
    } else {
      tenantId = asString(req.query.tenantId) || null
    }

    const chainId =
      authUser.role === UserRole.CHAINADMIN ? authUser.chainId : asString(req.query.chainId) || null

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
    const scopedError = asTenantScopeError(error)
    if (scopedError) return res.status(scopedError.status).json({ error: scopedError.message })
    console.error('GET BILLING INVOICES ERROR:', error)
    return res.status(500).json({ error: 'Rechnungen konnten nicht geladen werden' })
  }
})

router.get('/mailbox', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) return res.status(401).json({ error: 'Nicht eingeloggt' })

    const tenantId =
      authUser.role === UserRole.SUPERADMIN
        ? asString(req.query.tenantId) || null
        : (await resolveTenantScope(req, asString(req.query.tenantId))).tenantId

    const chainId = authUser.role === UserRole.CHAINADMIN ? authUser.chainId : asString(req.query.chainId) || null

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
    const scopedError = asTenantScopeError(error)
    if (scopedError) return res.status(scopedError.status).json({ error: scopedError.message })
    console.error('GET BILLING MAILBOX ERROR:', error)
    return res.status(500).json({ error: 'Postfach konnte nicht geladen werden' })
  }
})

router.post('/mailbox/:messageId/read', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const message = await prisma.klarandoMailboxMessage.update({
      where: { id: String(req.params.messageId || '') },
      data: { readAt: new Date() },
    })
    return res.json({ ok: true, messageId: message.id, readAt: message.readAt })
  } catch (error) {
    console.error('POST BILLING MAILBOX READ ERROR:', error)
    return res.status(500).json({ error: 'Nachricht konnte nicht aktualisiert werden' })
  }
})

router.get('/superadmin/preview', requireAuth, async (req, res) => {
  if (req.authUser?.role !== UserRole.SUPERADMIN) {
    return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
  }
  const period = parseBillingMonthOrCurrent(req.query.period)
  const tenants = await prisma.tenant.findMany({ select: { id: true } })
  const rows = (
    await Promise.all(tenants.map((tenant) => calculateTenantBilling(tenant.id, period)))
  ).filter((row): row is NonNullable<typeof row> => Boolean(row))
  return res.json({
    period: {
      key: period.key,
      start: period.periodStart.toISOString(),
      end: new Date(period.periodEnd.getTime() - 1).toISOString(),
    },
    invoicesPreview: rows.map((row) => ({
      tenantId: row.tenantId,
      tenantName: row.tenantName,
      chainId: row.chainId,
      planType: row.planType,
      monthlyFeeCents: row.monthlyFeeCents,
      commissionPercent: row.commissionPercentApplied,
      estimatedTotalCents: row.totalFeeGrossCents,
      invoiceStatus: InvoiceStatus.DRAFT,
    })),
  })
})

router.post('/superadmin/finalize', requireAuth, async (req, res) => {
  if (req.authUser?.role !== UserRole.SUPERADMIN) {
    return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
  }
  const period = parseBillingMonthOrCurrent(req.body?.period)
  const tenants = await prisma.tenant.findMany({ select: { id: true } })
  const rows = (
    await Promise.all(tenants.map((tenant) => calculateTenantBilling(tenant.id, period)))
  ).filter((row): row is NonNullable<typeof row> => Boolean(row))

  const billingRun = await prisma.billingRun.create({
    data: {
      periodStart: period.periodStart,
      periodEnd: new Date(period.periodEnd.getTime() - 1),
      status: InvoiceStatus.DRAFT,
    },
  })
  const created: string[] = []
  for (const row of rows) {
    const invoice = await createInvoiceDraftFromCalculation({
      billingRunId: billingRun.id,
      period,
      tenantCalculation: row,
    })
    created.push(invoice.id)
  }
  return res.status(201).json({ billingRunId: billingRun.id, invoicesCreated: created.length })
})

export default router
