import { InvoiceStatus, PermissionKey, Prisma, UserRole } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requireAuth, requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { writeAuditLog } from '../lib/audit'
import { isMailConfigured, sendMail } from '../lib/mail'
import {
  calculateBillingSummary,
  calculateTenantBilling,
  canFinalizeInvoice,
  createInvoiceDraftFromCalculation,
  parseBillingMonthOrCurrent,
} from '../lib/billing-engine'

const router = Router()
const BILLING_EMAIL_MODE = (process.env.BILLING_EMAIL_MODE || 'TEST').trim().toUpperCase()
const AUTO_APPROVE_MONTHLY_BILLING = (process.env.AUTO_APPROVE_MONTHLY_BILLING || 'false').trim().toLowerCase() === 'true'

function logBillingApiError(route: string, error: unknown) {
  const message = error instanceof Error ? error.message : String(error)
  const stack = error instanceof Error ? error.stack : undefined
  console.error('BILLING_API_ERROR', { route, message, stack })
}

function asString(value: unknown) {
  return typeof value === 'string' ? value : undefined
}

function toCents(value: unknown) {
  const amount = Number(value || 0)
  return Number.isFinite(amount) ? Math.round(amount * 100) : 0
}

function parseOptionalString(value: unknown) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed.length ? trimmed : null
}

function parseOptionalInt(value: unknown, fallback: number | null = null) {
  if (value === null || value === undefined || value === '') return fallback
  const numberValue = Number(value)
  if (!Number.isFinite(numberValue)) return fallback
  return Math.round(numberValue)
}

function normalizeInvoiceLifecycleStatus(input: {
  invoiceStatus: InvoiceStatus
  dueAt?: Date | null
  hasPaymentCollection: boolean
  paymentCollectionStatus?: string | null
}) {
  const { invoiceStatus, dueAt, hasPaymentCollection, paymentCollectionStatus } = input
  if (invoiceStatus === InvoiceStatus.DRAFT) return 'DRAFT'
  if (invoiceStatus === InvoiceStatus.ISSUED) return 'APPROVED'
  if (invoiceStatus === InvoiceStatus.SENT && hasPaymentCollection) return 'PAYMENT_PLANNED'
  if (invoiceStatus === InvoiceStatus.SENT) {
    if (dueAt && dueAt.getTime() < Date.now()) return 'OVERDUE'
    return 'SENT'
  }
  if (invoiceStatus === InvoiceStatus.PAID) return 'PAID'
  if (invoiceStatus === InvoiceStatus.CANCELLED) return 'CANCELLED'
  if (invoiceStatus === InvoiceStatus.FAILED) {
    if (paymentCollectionStatus === 'FAILED') return 'PAYMENT_FAILED'
    if (paymentCollectionStatus === 'CANCELLED') return 'CANCELLED'
    return 'PAYMENT_FAILED'
  }
  return 'SENT'
}

function canCancelInvoice(status: InvoiceStatus) {
  return (
    status === InvoiceStatus.DRAFT ||
    status === InvoiceStatus.ISSUED ||
    status === InvoiceStatus.SENT ||
    status === InvoiceStatus.FAILED
  )
}

function buildInvoiceEmailBody(input: {
  invoiceNumber: string
  tenantName: string
  monthLabel: string
  grossCents: number
  dueAt: Date | null
}) {
  const amount = (Math.max(0, input.grossCents) / 100).toFixed(2).replace('.', ',')
  const due = input.dueAt ? input.dueAt.toLocaleDateString('de-DE') : 'gemäß Vereinbarung'
  return {
    subject: `Neue Klarando Monatsrechnung ${input.invoiceNumber} (${input.monthLabel})`,
    text: `Hallo,\n\nfür ${input.tenantName} wurde die Klarando-Monatsrechnung ${input.invoiceNumber} freigegeben.\nBetrag: ${amount} € brutto\nZahlungsziel: ${due}\n\nHinweis: E-Rechnung/ZUGFeRD ist vorbereitet, steuerliche Prüfung empfohlen.\n`,
    html: `<p>Hallo,</p><p>für <strong>${input.tenantName}</strong> wurde die Klarando-Monatsrechnung <strong>${input.invoiceNumber}</strong> freigegeben.</p><p>Betrag: <strong>${amount} € brutto</strong><br/>Zahlungsziel: ${due}</p><p><em>Hinweis: E-Rechnung/ZUGFeRD ist vorbereitet, steuerliche Prüfung empfohlen.</em></p>`,
  }
}

function monthPeriodFromReq(req: { query?: Record<string, unknown>; body?: Record<string, unknown> }) {
  return parseBillingMonthOrCurrent(req.query?.month || req.body?.month || req.query?.period || req.body?.period)
}

router.get('/summary', requireAuth, async (req, res) => {
  const period = monthPeriodFromReq(req)
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
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
    logBillingApiError('/api/billing/summary', error)
    return res.json({
      month: period.key,
      periodStart: period.periodStart.toISOString(),
      periodEnd: period.periodEnd.toISOString(),
      summary: {
        tenants: 0,
        platformRevenueNetCents: 0,
        chargeableTenants: 0,
        platformRevenueGrossCents: 0,
        estimatedMarginNetCents: 0,
        platformMonthlyRevenueCents: 0,
        platformMonthlyModuleRevenueCents: 0,
        platformMonthlyCommissionRevenueCents: 0,
        platformMonthlyOrderRevenueCents: 0,
        platformMonthlyMinimumFeeAdjustmentCents: 0,
        platformMonthlyTotalRevenueCents: 0,
        openInvoices: 0,
        paidInvoices: 0,
        includedTenants: 0,
      },
      warning: 'Noch keine Abrechnungsdaten vorhanden.',
    })
  }
})

router.get('/settings/platform', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const profile = await prisma.platformBillingSettings.findFirst({
      where: { scopeKey: 'global' },
    })
    return res.json({
      profile: profile ?? {
        scopeKey: 'global',
        countryCode: 'DE',
        standardPaymentTargetDays: 14,
      },
    })
  } catch (error) {
    logBillingApiError('/api/billing/settings/platform', error)
    return res.json({
      profile: {
        scopeKey: 'global',
        countryCode: 'DE',
        standardPaymentTargetDays: 14,
      },
      warning: 'Noch keine Abrechnungsdaten vorhanden.',
    })
  }
})

router.put('/settings/platform', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const body = (req.body ?? {}) as Record<string, unknown>
    const profile = await prisma.platformBillingSettings.upsert({
      where: { scopeKey: 'global' },
      create: {
        scopeKey: 'global',
        companyName: parseOptionalString(body.companyName),
        legalForm: parseOptionalString(body.legalForm),
        street: parseOptionalString(body.street),
        zipCode: parseOptionalString(body.zipCode),
        city: parseOptionalString(body.city),
        countryCode: parseOptionalString(body.countryCode) || 'DE',
        vatId: parseOptionalString(body.vatId),
        taxNumber: parseOptionalString(body.taxNumber),
        managingDirector: parseOptionalString(body.managingDirector),
        invoiceEmail: parseOptionalString(body.invoiceEmail),
        phone: parseOptionalString(body.phone),
        website: parseOptionalString(body.website),
        bankName: parseOptionalString(body.bankName),
        iban: parseOptionalString(body.iban),
        bic: parseOptionalString(body.bic),
        sepaCreditorId: parseOptionalString(body.sepaCreditorId),
        invoiceLogoUrl: parseOptionalString(body.invoiceLogoUrl),
        standardPaymentTargetDays: Math.max(1, parseOptionalInt(body.standardPaymentTargetDays, 14) ?? 14),
        invoicePrimaryColor: parseOptionalString(body.invoicePrimaryColor),
        invoiceAccentColor: parseOptionalString(body.invoiceAccentColor),
        invoiceFooter: parseOptionalString(body.invoiceFooter),
        invoicePaymentInfo: parseOptionalString(body.invoicePaymentInfo),
        invoiceTaxNotice: parseOptionalString(body.invoiceTaxNotice),
        invoiceEinvoiceNotice: parseOptionalString(body.invoiceEinvoiceNotice),
        invoiceReminderNotice: parseOptionalString(body.invoiceReminderNotice),
        einvoiceFormatHint: parseOptionalString(body.einvoiceFormatHint),
        paymentProviderStatus: parseOptionalString(body.paymentProviderStatus),
        plannedDebitAt: parseOptionalString(body.plannedDebitAt) ? new Date(String(body.plannedDebitAt)) : null,
        lastDebitAt: parseOptionalString(body.lastDebitAt) ? new Date(String(body.lastDebitAt)) : null,
        lastChargebackStatus: parseOptionalString(body.lastChargebackStatus),
        approvedBy: parseOptionalString(body.approvedBy),
        sentAt: parseOptionalString(body.sentAt) ? new Date(String(body.sentAt)) : null,
        paidAt: parseOptionalString(body.paidAt) ? new Date(String(body.paidAt)) : null,
        cancelledAt: parseOptionalString(body.cancelledAt) ? new Date(String(body.cancelledAt)) : null,
        createdBy: req.authUser?.email ?? 'superadmin',
        updatedBy: req.authUser?.email ?? 'superadmin',
      },
      update: {
        companyName: parseOptionalString(body.companyName),
        legalForm: parseOptionalString(body.legalForm),
        street: parseOptionalString(body.street),
        zipCode: parseOptionalString(body.zipCode),
        city: parseOptionalString(body.city),
        countryCode: parseOptionalString(body.countryCode) || 'DE',
        vatId: parseOptionalString(body.vatId),
        taxNumber: parseOptionalString(body.taxNumber),
        managingDirector: parseOptionalString(body.managingDirector),
        invoiceEmail: parseOptionalString(body.invoiceEmail),
        phone: parseOptionalString(body.phone),
        website: parseOptionalString(body.website),
        bankName: parseOptionalString(body.bankName),
        iban: parseOptionalString(body.iban),
        bic: parseOptionalString(body.bic),
        sepaCreditorId: parseOptionalString(body.sepaCreditorId),
        invoiceLogoUrl: parseOptionalString(body.invoiceLogoUrl),
        standardPaymentTargetDays: Math.max(1, parseOptionalInt(body.standardPaymentTargetDays, 14) ?? 14),
        invoicePrimaryColor: parseOptionalString(body.invoicePrimaryColor),
        invoiceAccentColor: parseOptionalString(body.invoiceAccentColor),
        invoiceFooter: parseOptionalString(body.invoiceFooter),
        invoicePaymentInfo: parseOptionalString(body.invoicePaymentInfo),
        invoiceTaxNotice: parseOptionalString(body.invoiceTaxNotice),
        invoiceEinvoiceNotice: parseOptionalString(body.invoiceEinvoiceNotice),
        invoiceReminderNotice: parseOptionalString(body.invoiceReminderNotice),
        einvoiceFormatHint: parseOptionalString(body.einvoiceFormatHint),
        paymentProviderStatus: parseOptionalString(body.paymentProviderStatus),
        plannedDebitAt: parseOptionalString(body.plannedDebitAt) ? new Date(String(body.plannedDebitAt)) : null,
        lastDebitAt: parseOptionalString(body.lastDebitAt) ? new Date(String(body.lastDebitAt)) : null,
        lastChargebackStatus: parseOptionalString(body.lastChargebackStatus),
        approvedBy: parseOptionalString(body.approvedBy),
        sentAt: parseOptionalString(body.sentAt) ? new Date(String(body.sentAt)) : null,
        paidAt: parseOptionalString(body.paidAt) ? new Date(String(body.paidAt)) : null,
        cancelledAt: parseOptionalString(body.cancelledAt) ? new Date(String(body.cancelledAt)) : null,
        updatedBy: req.authUser?.email ?? 'superadmin',
      },
    })

    await writeAuditLog({
      req,
      module: 'billing',
      action: 'BILLING_PLATFORM_SETTINGS_UPDATED',
      targetType: 'PlatformBillingSettings',
      targetId: profile.id,
      metadata: { scopeKey: profile.scopeKey },
    })

    return res.json({ ok: true, profile })
  } catch (error) {
    console.error('PUT BILLING PLATFORM SETTINGS ERROR:', error)
    return res.status(500).json({ error: 'Zentrale Abrechnungsdaten konnten nicht gespeichert werden' })
  }
})

router.get('/tenants', requireAuth, async (req, res) => {
  const period = monthPeriodFromReq(req)
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
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
    logBillingApiError('/api/billing/tenants', error)
    return res.json({
      month: period.key,
      rows: [],
      warning: 'Noch keine Abrechnungsdaten vorhanden.',
    })
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

    if (AUTO_APPROVE_MONTHLY_BILLING) {
      await prisma.invoice.updateMany({
        where: { id: { in: invoiceIds }, status: InvoiceStatus.DRAFT },
        data: { status: InvoiceStatus.ISSUED, issuedAt: new Date() },
      })
    }

    return res.status(201).json({
      billingRunId: billingRun.id,
      invoicesCreated: invoiceIds.length,
      invoiceIds,
      autoApproved: AUTO_APPROVE_MONTHLY_BILLING,
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
      include: {
        items: true,
        tenant: {
          select: {
            id: true,
            name: true,
            billingProfile: {
              select: {
                invoiceEmail: true,
                contactEmail: true,
              },
            },
          },
        },
      },
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
        metadata: {
          ...(invoice.metadata as Record<string, unknown> | null),
          lifecycleStatus: 'APPROVED',
          emailDeliveryStatus: 'pending',
          paymentStatus: 'PAYMENT_PLANNED',
          finalizationLocked: true,
        },
      },
    })

    const monthLabel = `${updated.periodStart.getUTCFullYear()}-${String(updated.periodStart.getUTCMonth() + 1).padStart(2, '0')}`
    const recipientEmail = invoice.tenant?.billingProfile?.invoiceEmail || invoice.tenant?.billingProfile?.contactEmail || null
    let emailDeliveryStatus: 'pending' | 'sent' | 'failed' = 'pending'
    let emailDeliveryError: string | null = null
    if (recipientEmail) {
      const emailBody = buildInvoiceEmailBody({
        invoiceNumber: updated.invoiceNumber,
        tenantName: invoice.tenant?.name || 'Filiale',
        monthLabel,
        grossCents: updated.totalGrossCents,
        dueAt: updated.dueAt,
      })
      if (BILLING_EMAIL_MODE === 'LIVE' && isMailConfigured()) {
        try {
          await sendMail({
            to: recipientEmail,
            subject: emailBody.subject,
            text: emailBody.text,
            html: emailBody.html,
          })
          emailDeliveryStatus = 'sent'
        } catch (mailError) {
          emailDeliveryStatus = 'failed'
          emailDeliveryError = mailError instanceof Error ? mailError.message : 'Unbekannter Mailfehler'
        }
      }
    } else {
      emailDeliveryStatus = 'failed'
      emailDeliveryError = 'Keine Rechnungs-E-Mail im Abrechnungsprofil hinterlegt.'
    }

    await prisma.invoice.update({
      where: { id: updated.id },
      data: {
        metadata: {
          ...(updated.metadata as Record<string, unknown> | null),
          lifecycleStatus: 'APPROVED',
          emailDeliveryStatus,
          emailDeliveryError,
          emailMode: BILLING_EMAIL_MODE,
          paymentStatus: 'PAYMENT_PLANNED',
        },
      },
    })

    await prisma.klarandoMailboxMessage.create({
      data: {
        tenantId: updated.tenantId,
        chainId: updated.chainId,
        invoiceId: updated.id,
        messageType: 'INVOICE_ISSUED',
        title: `Neue Klarando Monatsrechnung ${updated.invoiceNumber}`,
        body: `Betrag: ${(updated.totalGrossCents / 100).toFixed(2).replace('.', ',')} € · Zeitraum ${monthLabel} · Zahlungsziel ${updated.dueAt ? updated.dueAt.toLocaleDateString('de-DE') : 'gemäß Profil'}`,
        status: updated.status,
        actionUrl: `/admin/finanzen?invoice=${updated.id}`,
        metadata: {
          emailDeliveryStatus,
          emailMode: BILLING_EMAIL_MODE,
          simulation: BILLING_EMAIL_MODE !== 'LIVE',
        },
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

    return res.json({
      ok: true,
      invoiceId: updated.id,
      status: updated.status,
      lifecycleStatus: 'APPROVED',
      emailDeliveryStatus,
      simulationMode: BILLING_EMAIL_MODE !== 'LIVE',
    })
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
        paymentCollections: {
          orderBy: { createdAt: 'desc' },
          take: 1,
          select: { id: true, status: true, dueAt: true, failedAt: true, failureReason: true, createdAt: true },
        },
      },
    })
    return res.json(
      invoices.map((invoice) => {
        const latestCollection = invoice.paymentCollections[0] || null
        const lifecycleStatus = normalizeInvoiceLifecycleStatus({
          invoiceStatus: invoice.status,
          dueAt: invoice.dueAt,
          hasPaymentCollection: Boolean(latestCollection),
          paymentCollectionStatus: latestCollection?.status || null,
        })
        return {
          ...invoice,
          lifecycleStatus,
          latestCollection,
          paymentCollections: undefined,
        }
      })
    )
  } catch (error) {
    const scopedError = asTenantScopeError(error)
    if (scopedError) return res.status(scopedError.status).json({ error: scopedError.message })
    console.error('GET BILLING INVOICES ERROR:', error)
    return res.status(500).json({ error: 'Rechnungen konnten nicht geladen werden' })
  }
})

router.get('/profiles', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const chainId = asString(req.query.chainId)
    const tenantId = asString(req.query.tenantId)
    const tenants = await prisma.tenant.findMany({
      where: {
        ...(tenantId ? { id: tenantId } : {}),
        ...(chainId ? { chainId } : {}),
      },
      select: {
        id: true,
        name: true,
        chainId: true,
        tenantBillingPlan: true,
        billingProfile: true,
        sepaMandates: {
          orderBy: { createdAt: 'desc' },
          take: 1,
          select: { id: true, mandateReference: true, status: true, signedAt: true, ibanLast4: true, bic: true },
        },
      },
      orderBy: { name: 'asc' },
    })

    return res.json({
      rows: tenants.map((tenant) => ({
        tenantId: tenant.id,
        tenantName: tenant.name,
        chainId: tenant.chainId,
        plan: tenant.tenantBillingPlan,
        profile: tenant.billingProfile,
        latestSepaMandate: tenant.sepaMandates[0] || null,
      })),
    })
  } catch (error) {
    logBillingApiError('/api/billing/profiles', error)
    return res.json({
      rows: [],
      warning: 'Noch keine Abrechnungsdaten vorhanden.',
    })
  }
})

router.get('/payments', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const tenantId = asString(req.query.tenantId)
    const chainId = asString(req.query.chainId)
    const status = asString(req.query.status)
    const collections = await prisma.paymentCollection.findMany({
      where: {
        ...(tenantId ? { tenantId } : {}),
        ...(chainId ? { chainId } : {}),
        ...(status ? { status: status as any } : {}),
      },
      orderBy: { createdAt: 'desc' },
      take: 300,
      include: {
        tenant: { select: { id: true, name: true } },
        invoice: { select: { id: true, invoiceNumber: true, dueAt: true, totalGrossCents: true } },
        sepaMandate: { select: { id: true, mandateReference: true, status: true } },
      },
    })
    return res.json({ rows: collections })
  } catch (error) {
    console.error('GET BILLING PAYMENTS ERROR:', error)
    return res.status(500).json({ error: 'Zahlungen konnten nicht geladen werden' })
  }
})

router.get('/chargebacks', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const tenantId = asString(req.query.tenantId)
    const chainId = asString(req.query.chainId)
    const failedCollections = await prisma.paymentCollection.findMany({
      where: {
        ...(tenantId ? { tenantId } : {}),
        ...(chainId ? { chainId } : {}),
        status: 'FAILED',
      },
      orderBy: { failedAt: 'desc' },
      take: 200,
      include: {
        tenant: { select: { id: true, name: true } },
        invoice: { select: { id: true, invoiceNumber: true, dueAt: true } },
      },
    })
    return res.json({
      rows: failedCollections.map((entry) => ({
        id: entry.id,
        tenantId: entry.tenantId,
        tenantName: entry.tenant?.name || null,
        invoiceId: entry.invoiceId,
        invoiceNumber: entry.invoice?.invoiceNumber || null,
        amountCents: entry.amountCents,
        dueAt: entry.dueAt,
        failedAt: entry.failedAt,
        failureReason: entry.failureReason || 'Unbekannt',
        providerReference: (entry.metadata as Record<string, unknown> | null)?.providerReference || null,
        returnFeeCents: Number((entry.metadata as Record<string, unknown> | null)?.returnFeeCents || 0),
        retryEligible: true,
        reminderRequired: true,
      })),
    })
  } catch (error) {
    console.error('GET BILLING CHARGEBACKS ERROR:', error)
    return res.status(500).json({ error: 'Rücklastschriften konnten nicht geladen werden' })
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

router.post('/invoices/:invoiceId/cancel', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const invoiceId = String(req.params.invoiceId || '')
    const reason = parseOptionalString((req.body as Record<string, unknown> | undefined)?.reason) || 'Keine Begründung angegeben'
    const invoice = await prisma.invoice.findUnique({ where: { id: invoiceId } })
    if (!invoice) {
      return res.status(404).json({ error: 'Rechnung nicht gefunden' })
    }
    if (!canCancelInvoice(invoice.status)) {
      return res.status(409).json({ error: 'Rechnung kann in diesem Status nicht storniert werden' })
    }
    const updated = await prisma.invoice.update({
      where: { id: invoice.id },
      data: {
        status: InvoiceStatus.CANCELLED,
        cancelledAt: new Date(),
        metadata: {
          ...(invoice.metadata as Record<string, unknown> | null),
          cancellationReason: reason,
        },
      },
    })
    await writeAuditLog({
      req,
      module: 'billing',
      action: 'INVOICE_CANCELLED',
      targetType: 'Invoice',
      targetId: invoice.id,
      tenantId: invoice.tenantId || undefined,
      chainId: invoice.chainId || undefined,
      metadata: { invoiceNumber: invoice.invoiceNumber, reason },
    })
    return res.json({ ok: true, invoiceId: updated.id, status: updated.status })
  } catch (error) {
    console.error('POST BILLING CANCEL INVOICE ERROR:', error)
    return res.status(500).json({ error: 'Rechnung konnte nicht storniert werden' })
  }
})

router.post('/invoices/:invoiceId/correction', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const invoiceId = String(req.params.invoiceId || '')
    const reason = parseOptionalString((req.body as Record<string, unknown> | undefined)?.reason) || 'Korrekturrechnung erstellt'
    const source = await prisma.invoice.findUnique({
      where: { id: invoiceId },
      include: { items: true },
    })
    if (!source) {
      return res.status(404).json({ error: 'Rechnung nicht gefunden' })
    }
    if (source.status === InvoiceStatus.DRAFT || source.status === InvoiceStatus.CANCELLED) {
      return res.status(409).json({ error: 'Korrekturrechnung setzt eine freigegebene Rechnung voraus' })
    }
    const correctionNumber = `${source.invoiceNumber}-K${Date.now().toString().slice(-4)}`
    const correction = await prisma.$transaction(async (tx) => {
      const created = await tx.invoice.create({
        data: {
          invoiceNumber: correctionNumber,
          tenantId: source.tenantId,
          chainId: source.chainId,
          billingProfileId: source.billingProfileId,
          recipientType: source.recipientType,
          status: InvoiceStatus.DRAFT,
          periodStart: source.periodStart,
          periodEnd: source.periodEnd,
          dueAt: source.dueAt,
          subTotalCents: source.subTotalCents * -1,
          taxTotalCents: source.taxTotalCents * -1,
          totalGrossCents: source.totalGrossCents * -1,
          openAmountCents: source.totalGrossCents * -1,
          correctionOfInvoiceId: source.id,
          metadata: {
            ...(source.metadata as Record<string, unknown> | null),
            correctionReason: reason,
            correctionDraft: true,
          },
        },
      })
      for (const item of source.items) {
        await tx.invoiceItem.create({
          data: {
            invoiceId: created.id,
            lineNo: item.lineNo,
            title: `${item.title} (Korrektur)`,
            description: item.description,
            quantity: item.quantity,
            unitPriceCents: item.unitPriceCents * -1,
            taxRatePercent: item.taxRatePercent,
            netAmountCents: item.netAmountCents * -1,
            taxAmountCents: item.taxAmountCents * -1,
            grossAmountCents: item.grossAmountCents * -1,
            metadata: (item.metadata ?? undefined) as Prisma.InputJsonValue | undefined,
          },
        })
      }
      return created
    })
    await writeAuditLog({
      req,
      module: 'billing',
      action: 'INVOICE_CORRECTION_CREATED',
      targetType: 'Invoice',
      targetId: correction.id,
      tenantId: correction.tenantId || undefined,
      chainId: correction.chainId || undefined,
      metadata: { sourceInvoiceId: source.id, sourceInvoiceNumber: source.invoiceNumber, reason },
    })
    return res.status(201).json({ ok: true, invoiceId: correction.id, invoiceNumber: correction.invoiceNumber, status: correction.status })
  } catch (error) {
    console.error('POST BILLING CORRECTION INVOICE ERROR:', error)
    return res.status(500).json({ error: 'Korrekturrechnung konnte nicht erstellt werden' })
  }
})

router.get('/invoices/:invoiceId/history', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const invoiceId = String(req.params.invoiceId || '')
    const invoice = await prisma.invoice.findUnique({
      where: { id: invoiceId },
      include: {
        items: { orderBy: { lineNo: 'asc' } },
        paymentCollections: { orderBy: { createdAt: 'asc' } },
      },
    })
    if (!invoice) {
      return res.status(404).json({ error: 'Rechnung nicht gefunden' })
    }
    if (req.authUser?.role !== UserRole.SUPERADMIN && invoice.tenantId) {
      await resolveTenantScope(req, invoice.tenantId)
    }
    const auditTrail = await prisma.auditLog.findMany({
      where: {
        module: 'billing',
        targetType: 'Invoice',
        targetId: invoice.id,
      },
      orderBy: { createdAt: 'asc' },
    })
    return res.json({
      invoice,
      paymentTimeline: invoice.paymentCollections,
      auditTrail,
    })
  } catch (error) {
    const scopedError = asTenantScopeError(error)
    if (scopedError) return res.status(scopedError.status).json({ error: scopedError.message })
    console.error('GET BILLING INVOICE HISTORY ERROR:', error)
    return res.status(500).json({ error: 'Rechnungshistorie konnte nicht geladen werden' })
  }
})

export default router
