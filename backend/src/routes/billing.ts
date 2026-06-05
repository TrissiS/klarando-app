import { InvoiceStatus, PermissionKey, Prisma, UserRole } from '@prisma/client'
import { Router } from 'express'
import { PDFDocument, StandardFonts, rgb } from 'pdf-lib'
import { prisma } from '../lib/prisma'
import { requireAuth, requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { writeAuditLog } from '../lib/audit'
import {
  assertInvoiceMutable,
  buildBillingInvoicePreview,
  calculateBillingSummary,
  calculateTenantBilling,
  createInvoiceDraftFromCalculation,
  finalizeInvoiceFromPreview,
  parseBillingMonthOrCurrent,
} from '../lib/billing-engine'

const router = Router()
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

function monthPeriodFromReq(req: { query?: Record<string, unknown>; body?: Record<string, unknown> }) {
  return parseBillingMonthOrCurrent(req.query?.month || req.body?.month || req.query?.period || req.body?.period)
}

function toPlainNumber(value: unknown) {
  if (typeof value === 'number') return value
  if (typeof value === 'string') {
    const parsed = Number(value)
    return Number.isFinite(parsed) ? parsed : 0
  }
  if (value && typeof value === 'object' && 'toString' in value && typeof value.toString === 'function') {
    const parsed = Number(value.toString())
    return Number.isFinite(parsed) ? parsed : 0
  }
  return 0
}

function centsToEuroLabel(cents: number) {
  return `${(Math.max(0, cents) / 100).toFixed(2).replace('.', ',')} €`
}

function resolveInvoiceLifecycleStatus(invoice: {
  status: InvoiceStatus
  metadata?: Record<string, unknown> | null
}) {
  const metadata = invoice.metadata || {}
  return metadata.finalizationLocked === true && invoice.status !== InvoiceStatus.DRAFT
}

async function buildBillingInvoicePdf(input: {
  invoice: {
    id: string
    invoiceNumber: string
    status: InvoiceStatus
    subTotalCents: number
    taxTotalCents: number
    totalGrossCents: number
    dueAt: Date | null
    issuedAt: Date | null
    createdAt: Date
    periodStart: Date
    periodEnd: Date
    metadata: Record<string, unknown> | null
    items: Array<{
      lineNo: number
      title: string
      description: string | null
      quantity: Prisma.Decimal | number | string
      unitPriceCents: number
      taxRatePercent: Prisma.Decimal | number | string
      netAmountCents: number
      taxAmountCents: number
      grossAmountCents: number
    }>
  }
}) {
  const doc = await PDFDocument.create()
  const page = doc.addPage([595.28, 841.89])
  const fontRegular = await doc.embedFont(StandardFonts.Helvetica)
  const fontBold = await doc.embedFont(StandardFonts.HelveticaBold)
  const { width, height } = page.getSize()
  const margin = 48
  let y = height - margin

  const metadata = input.invoice.metadata || {}
  const recipient =
    metadata.billingProfileSnapshot && typeof metadata.billingProfileSnapshot === 'object'
      ? (metadata.billingProfileSnapshot as Record<string, unknown>)
      : null
  const vatSnapshot =
    metadata.vatSnapshot && typeof metadata.vatSnapshot === 'object'
      ? (metadata.vatSnapshot as Record<string, unknown>)
      : null

  if (!resolveInvoiceLifecycleStatus(input.invoice)) {
    throw new Error('Nur finalisierte Rechnungen koennen als PDF erzeugt werden.')
  }
  if (!recipient) {
    throw new Error('Billing-Address-Snapshot fehlt auf der finalisierten Rechnung.')
  }
  if (!vatSnapshot) {
    throw new Error('MwSt.-Snapshot fehlt auf der finalisierten Rechnung.')
  }

  const recipientName = typeof recipient.recipientName === 'string' ? recipient.recipientName : null
  const street = typeof recipient.street === 'string' ? recipient.street : null
  const zipCode = typeof recipient.zipCode === 'string' ? recipient.zipCode : null
  const city = typeof recipient.city === 'string' ? recipient.city : null
  const countryCode = typeof recipient.countryCode === 'string' ? recipient.countryCode : null
  const invoiceEmail = typeof recipient.invoiceEmail === 'string' ? recipient.invoiceEmail : null
  const paymentTermsDays =
    typeof recipient.paymentTermsDays === 'number' && Number.isFinite(recipient.paymentTermsDays)
      ? recipient.paymentTermsDays
      : null

  if (!recipientName || !street || !zipCode || !city || !countryCode || !invoiceEmail || !paymentTermsDays) {
    throw new Error('Finalisierte Rechnung enthaelt keinen vollstaendigen Rechnungsadress-Snapshot.')
  }

  const drawText = (
    text: string,
    options: { x?: number; size?: number; bold?: boolean; color?: ReturnType<typeof rgb> } = {}
  ) => {
    const size = options.size ?? 10
    page.drawText(text, {
      x: options.x ?? margin,
      y,
      size,
      font: options.bold ? fontBold : fontRegular,
      color: options.color ?? rgb(0.1, 0.14, 0.22),
    })
    y -= size + 4
  }

  drawText('Klarando Einzelunternehmen', { size: 18, bold: true })
  drawText('Inhaber Tristan Stenger')
  drawText('Untere Wiesenstr. 6')
  drawText('57271 Hilchenbach')
  drawText('info@klarando.com')
  drawText('USt-IdNr.: DE314972366')

  y -= 12
  drawText('Rechnungsempfänger', { size: 12, bold: true })
  drawText(recipientName)
  if (typeof recipient.contactPerson === 'string' && recipient.contactPerson.trim().length > 0) {
    drawText(recipient.contactPerson)
  }
  drawText(street)
  drawText(`${zipCode} ${city}`)
  drawText(countryCode)
  drawText(`E-Mail: ${invoiceEmail}`)
  if (typeof recipient.vatId === 'string' && recipient.vatId.trim().length > 0) {
    drawText(`USt-IdNr.: ${recipient.vatId}`)
  }
  if (typeof recipient.taxNumber === 'string' && recipient.taxNumber.trim().length > 0) {
    drawText(`Steuernummer: ${recipient.taxNumber}`)
  }

  y -= 12
  const invoiceDate = input.invoice.issuedAt || input.invoice.createdAt
  const vatRatePercent = toPlainNumber(vatSnapshot.vatRatePercent)
  drawText(`Rechnungsnummer: ${input.invoice.invoiceNumber}`, { bold: true })
  drawText(`Rechnungsdatum: ${invoiceDate.toLocaleDateString('de-DE')}`)
  drawText(
    `Leistungszeitraum: ${input.invoice.periodStart.toLocaleDateString('de-DE')} bis ${input.invoice.periodEnd.toLocaleDateString('de-DE')}`
  )
  drawText(`Zahlungsziel: ${input.invoice.dueAt ? input.invoice.dueAt.toLocaleDateString('de-DE') : `${paymentTermsDays} Tage`}`)
  drawText(`Status: ${input.invoice.status}`)
  drawText(`MwSt.-Satz: ${vatRatePercent.toFixed(2).replace('.', ',')} %`)

  y -= 16
  const tableTop = y
  const colX = [margin, 280, 355, 450, 520]
  page.drawText('Position', { x: colX[0], y, size: 10, font: fontBold, color: rgb(0.3, 0.34, 0.4) })
  page.drawText('Menge', { x: colX[1], y, size: 10, font: fontBold, color: rgb(0.3, 0.34, 0.4) })
  page.drawText('Einzelpreis', { x: colX[2], y, size: 10, font: fontBold, color: rgb(0.3, 0.34, 0.4) })
  page.drawText('Netto', { x: colX[3], y, size: 10, font: fontBold, color: rgb(0.3, 0.34, 0.4) })
  y -= 14
  page.drawLine({ start: { x: margin, y }, end: { x: width - margin, y }, thickness: 1, color: rgb(0.86, 0.88, 0.91) })
  y -= 14

  for (const item of input.invoice.items) {
    if (y < 150) {
      throw new Error('PDF-MVP unterstuetzt aktuell nur Rechnungen, die auf eine Seite passen.')
    }
    page.drawText(item.title, { x: colX[0], y, size: 10, font: fontRegular, color: rgb(0.1, 0.14, 0.22) })
    page.drawText(toPlainNumber(item.quantity).toFixed(2).replace('.', ','), {
      x: colX[1],
      y,
      size: 10,
      font: fontRegular,
      color: rgb(0.1, 0.14, 0.22),
    })
    page.drawText(centsToEuroLabel(item.unitPriceCents), {
      x: colX[2],
      y,
      size: 10,
      font: fontRegular,
      color: rgb(0.1, 0.14, 0.22),
    })
    page.drawText(centsToEuroLabel(item.netAmountCents), {
      x: colX[3],
      y,
      size: 10,
      font: fontRegular,
      color: rgb(0.1, 0.14, 0.22),
    })
    y -= 16
    if (item.description) {
      page.drawText(item.description, { x: colX[0], y, size: 8, font: fontRegular, color: rgb(0.45, 0.49, 0.55) })
      y -= 12
    }
  }

  y -= 10
  page.drawLine({ start: { x: margin, y }, end: { x: width - margin, y }, thickness: 1, color: rgb(0.86, 0.88, 0.91) })
  y -= 18
  drawText(`Netto: ${centsToEuroLabel(input.invoice.subTotalCents)}`, { x: 360, bold: false })
  drawText(`MwSt. (${vatRatePercent.toFixed(2).replace('.', ',')} %): ${centsToEuroLabel(input.invoice.taxTotalCents)}`, {
    x: 360,
  })
  drawText(`Brutto: ${centsToEuroLabel(input.invoice.totalGrossCents)}`, { x: 360, bold: true, size: 12 })

  y -= 18
  drawText('Zahlungsinformationen', { size: 12, bold: true })
  drawText(
    typeof recipient.paymentMethod === 'string' && recipient.paymentMethod.trim().length > 0
      ? `Zahlungsart: ${recipient.paymentMethod}`
      : 'Zahlungsart: Nach Vereinbarung'
  )
  drawText('Bankdaten / Einziehungsinformationen folgen separat, falls noch nicht im Profil hinterlegt.', {
    color: rgb(0.35, 0.39, 0.45),
  })

  page.drawText(`Snapshot-PDF · Rechnung ${input.invoice.invoiceNumber}`, {
    x: margin,
    y: 24,
    size: 8,
    font: fontRegular,
    color: rgb(0.45, 0.49, 0.55),
  })

  return doc.save()
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

router.get('/invoice-preview', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const tenantId = asString(req.query?.tenantId)
    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const period = monthPeriodFromReq(req)
    const preview = await buildBillingInvoicePreview(tenantId, period)
    if (!preview) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    return res.json(preview)
  } catch (error) {
    logBillingApiError('/api/billing/invoice-preview', error)
    return res.status(500).json({ error: 'Rechnungsvorschau konnte nicht geladen werden' })
  }
})

router.post('/invoices/finalize', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }

    const tenantId = asString(req.body?.tenantId)
    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const period = monthPeriodFromReq(req)
    const invoice = await finalizeInvoiceFromPreview({
      tenantId,
      period,
      finalizedByUserId: req.authUser?.id ?? null,
    })

    if (!invoice) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    await writeAuditLog({
      req,
      module: 'billing',
      action: 'INVOICE_PREVIEW_FINALIZED',
      targetType: 'Invoice',
      targetId: invoice.id,
      tenantId: invoice.tenantId || undefined,
      chainId: invoice.chainId || undefined,
      metadata: {
        invoiceNumber: invoice.invoiceNumber,
        month: period.key,
      },
    })

    return res.status(201).json({
      ok: true,
      invoiceId: invoice.id,
      invoiceNumber: invoice.invoiceNumber,
      status: invoice.status,
      periodStart: invoice.periodStart.toISOString(),
      periodEnd: invoice.periodEnd.toISOString(),
      totalGrossCents: invoice.totalGrossCents,
      itemsCount: invoice.items.length,
    })
  } catch (error) {
    const typedError = error as Error & { code?: string; invoiceId?: string; invoiceNumber?: string; warnings?: string[] }
    if (typedError?.code === 'FINAL_INVOICE_EXISTS') {
      return res.status(409).json({
        error: typedError.message,
        invoiceId: typedError.invoiceId,
        invoiceNumber: typedError.invoiceNumber,
      })
    }
    if (typedError?.code === 'CRITICAL_WARNINGS') {
      return res.status(409).json({
        error: typedError.message,
        warnings: typedError.warnings || [],
      })
    }
    console.error('POST FINALIZE INVOICE PREVIEW ERROR:', error)
    return res.status(500).json({ error: 'Rechnungsvorschau konnte nicht finalisiert werden' })
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
      autoApproved: false,
      warning: AUTO_APPROVE_MONTHLY_BILLING
        ? 'AUTO_APPROVE_MONTHLY_BILLING ist deaktiviert, weil Finalisierung nur noch über /api/billing/invoices/finalize erlaubt ist.'
        : undefined,
    })
  } catch (error) {
    const typedError = error as Error & { code?: string }
    if (typedError?.code === 'FINALIZED_INVOICE_LOCKED') {
      return res.status(409).json({ error: typedError.message })
    }
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
      select: {
        id: true,
        tenantId: true,
        chainId: true,
        periodStart: true,
        periodEnd: true,
        invoiceNumber: true,
        status: true,
      },
    })
    if (!invoice) {
      return res.status(404).json({ error: 'Rechnung nicht gefunden' })
    }
    if (!invoice.tenantId) {
      return res.status(409).json({ error: 'Legacy-Finalisierung benötigt eine Tenant-Rechnung mit Leistungszeitraum.' })
    }
    if (invoice.status !== InvoiceStatus.DRAFT) {
      return res.status(409).json({ error: 'Finalisierte Rechnung darf nicht überschrieben werden' })
    }

    const derivedMonth = `${invoice.periodStart.getUTCFullYear()}-${String(invoice.periodStart.getUTCMonth() + 1).padStart(2, '0')}`
    const period = parseBillingMonthOrCurrent(derivedMonth)
    const updated = await finalizeInvoiceFromPreview({
      tenantId: invoice.tenantId,
      period,
      finalizedByUserId: req.authUser?.id ?? null,
    })
    if (!updated) {
      return res.status(404).json({ error: 'Rechnung konnte über den kanonischen Finalisierungspfad nicht erzeugt werden.' })
    }

    await writeAuditLog({
      req,
      module: 'billing',
      action: 'INVOICE_FINALIZE_LEGACY_REDIRECT',
      targetType: 'Invoice',
      targetId: invoice.id,
      tenantId: invoice.tenantId || undefined,
      chainId: invoice.chainId || undefined,
      metadata: {
        legacyRoute: `/api/billing/invoices/${invoice.id}/finalize`,
        canonicalRoute: '/api/billing/invoices/finalize',
        invoiceNumber: updated?.invoiceNumber ?? invoice.invoiceNumber,
        month: derivedMonth,
      },
    })

    return res.json({
      ok: true,
      invoiceId: updated.id,
      invoiceNumber: updated.invoiceNumber,
      status: updated.status,
      deprecated: true,
      canonicalRoute: '/api/billing/invoices/finalize',
    })
  } catch (error) {
    const typedError = error as Error & { code?: string; invoiceId?: string; invoiceNumber?: string; warnings?: string[] }
    if (typedError?.code === 'FINALIZED_INVOICE_LOCKED') {
      return res.status(409).json({ error: typedError.message })
    }
    if (typedError?.code === 'FINAL_INVOICE_EXISTS') {
      return res.status(409).json({
        error: typedError.message,
        invoiceId: typedError.invoiceId,
        invoiceNumber: typedError.invoiceNumber,
      })
    }
    if (typedError?.code === 'CRITICAL_WARNINGS') {
      return res.status(409).json({
        error: typedError.message,
        warnings: typedError.warnings || [],
      })
    }
    console.error('POST FINALIZE INVOICE ERROR:', error)
    return res.status(500).json({ error: 'Rechnung konnte nicht finalisiert werden' })
  }
})

router.get('/invoices/:invoiceId/pdf', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
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
    if (!resolveInvoiceLifecycleStatus({
      status: invoice.status,
      metadata: (invoice.metadata as Record<string, unknown> | null) || null,
    })) {
      return res.status(409).json({ error: 'Nur finalisierte Rechnungen koennen als PDF ausgegeben werden.' })
    }
    const pdfBytes = await buildBillingInvoicePdf({
      invoice: {
        id: invoice.id,
        invoiceNumber: invoice.invoiceNumber,
        status: invoice.status,
        subTotalCents: invoice.subTotalCents,
        taxTotalCents: invoice.taxTotalCents,
        totalGrossCents: invoice.totalGrossCents,
        dueAt: invoice.dueAt,
        issuedAt: invoice.issuedAt,
        createdAt: invoice.createdAt,
        periodStart: invoice.periodStart,
        periodEnd: invoice.periodEnd,
        metadata: (invoice.metadata as Record<string, unknown> | null) || null,
        items: invoice.items.map((item) => ({
          lineNo: item.lineNo,
          title: item.title,
          description: item.description,
          quantity: item.quantity,
          unitPriceCents: item.unitPriceCents,
          taxRatePercent: item.taxRatePercent,
          netAmountCents: item.netAmountCents,
          taxAmountCents: item.taxAmountCents,
          grossAmountCents: item.grossAmountCents,
        })),
      },
    })

    res.setHeader('Content-Type', 'application/pdf')
    res.setHeader('Content-Disposition', `inline; filename=\"${invoice.invoiceNumber}.pdf\"`)
    return res.send(Buffer.from(pdfBytes))
  } catch (error) {
    const message = error instanceof Error ? error.message : 'PDF konnte nicht vorbereitet werden'
    if (
      message.includes('Nur finalisierte Rechnungen') ||
      message.includes('Snapshot fehlt') ||
      message.includes('vollstaendigen Rechnungsadress-Snapshot') ||
      message.includes('eine Seite passen')
    ) {
      return res.status(409).json({ error: message })
    }
    console.error('GET BILLING INVOICE PDF ERROR:', error)
    return res.status(500).json({ error: 'PDF konnte nicht vorbereitet werden' })
  }
})

router.get('/invoices', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) return res.status(401).json({ error: 'Nicht eingeloggt' })
    const period = asString(req.query.month) ? monthPeriodFromReq(req) : null

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
        ...(period
          ? {
              periodStart: period.periodStart,
              periodEnd: new Date(period.periodEnd.getTime() - 1),
            }
          : {}),
      },
      orderBy: { createdAt: 'desc' },
      take: 200,
      include: {
        tenant: { select: { id: true, name: true } },
        chain: { select: { id: true, name: true } },
        items: {
          orderBy: { lineNo: 'asc' },
          select: {
            id: true,
            lineNo: true,
            title: true,
            description: true,
            quantity: true,
            unitPriceCents: true,
            taxRatePercent: true,
            netAmountCents: true,
            taxAmountCents: true,
            grossAmountCents: true,
          },
        },
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
          billingProfileSnapshot:
            (invoice.metadata as Record<string, unknown> | null)?.billingProfileSnapshot &&
            typeof (invoice.metadata as Record<string, unknown>).billingProfileSnapshot === 'object'
              ? ((invoice.metadata as Record<string, unknown>).billingProfileSnapshot as Record<string, unknown>)
              : null,
          vatSnapshot:
            (invoice.metadata as Record<string, unknown> | null)?.vatSnapshot &&
            typeof (invoice.metadata as Record<string, unknown>).vatSnapshot === 'object'
              ? ((invoice.metadata as Record<string, unknown>).vatSnapshot as Record<string, unknown>)
              : null,
          finalizedAt:
            typeof (invoice.metadata as Record<string, unknown> | null)?.finalizedAt === 'string'
              ? ((invoice.metadata as Record<string, unknown>).finalizedAt as string)
              : invoice.issuedAt?.toISOString() || null,
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
  try {
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
  } catch (error) {
    const typedError = error as Error & { code?: string }
    if (typedError?.code === 'FINALIZED_INVOICE_LOCKED') {
      return res.status(409).json({ error: typedError.message })
    }
    console.error('POST BILLING SUPERADMIN FINALIZE ERROR:', error)
    return res.status(500).json({ error: 'Rechnungsentwürfe konnten nicht erstellt werden' })
  }
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
    assertInvoiceMutable(invoice)
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
    const typedError = error as Error & { code?: string }
    if (typedError?.code === 'FINALIZED_INVOICE_LOCKED') {
      return res.status(409).json({ error: typedError.message })
    }
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
