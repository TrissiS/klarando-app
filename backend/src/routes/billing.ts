import { InvoiceStatus, PermissionKey, Prisma, UserRole } from '@prisma/client'
import { Router } from 'express'
import { PDFDocument, StandardFonts, rgb } from 'pdf-lib'
import { prisma } from '../lib/prisma'
import { requireAuth, requirePermission } from '../middleware/auth'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { writeAuditLog } from '../lib/audit'
import {
  buildInvoiceIssuerSnapshot,
  evaluateInvoiceIssuerReadiness,
  resolveInvoiceIssuerProfile,
  type InvoiceIssuerProfile,
} from '../lib/invoice-issuer-profile'
import { isMailConfigured, sendMail } from '../lib/mail'
import {
  assertInvoiceMutable,
  buildBillingInvoicePreview,
  calculateBillingSummary,
  calculateTenantBilling,
  createInvoiceDraftFromCalculation,
  finalizeInvoiceFromPreview,
  parseBillingMonthOrCurrent,
} from '../lib/billing-engine'
import { ensureUpcomingHolidayReminderForTenant } from '../lib/holiday-reminders'

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

function getPublicAppUrl() {
  return (process.env.PUBLIC_APP_URL || 'http://localhost:3000').trim().replace(/\/+$/, '')
}

function parseHexColor(input: string | null | undefined, fallback: [number, number, number]): [number, number, number] {
  if (!input) return fallback
  const value = input.trim().replace('#', '')
  if (!/^[0-9a-fA-F]{6}$/.test(value)) return fallback
  return [
    parseInt(value.slice(0, 2), 16) / 255,
    parseInt(value.slice(2, 4), 16) / 255,
    parseInt(value.slice(4, 6), 16) / 255,
  ]
}

function normalizeInvoicePdfText(text: string) {
  return text
    .replace(/Modulgebuehr/g, 'Modulgebühr')
    .replace(/Grundgebuehr/g, 'Grundgebühr')
    .replace(/Paketgebuehr/g, 'Paketgebühr')
    .replace(/Zusatzbestellungsgebuehr/g, 'Zusatzbestellungsgebühr')
    .replace(/Mindestgebuehr/g, 'Mindestgebühr')
    .replace(/Zahlungsinformationen/g, 'Zahlungsinformationen')
    .replace(/Leistungszeitraum/g, 'Leistungszeitraum')
    .replace(/MwSt\./g, 'MwSt.')
}

async function tryEmbedIssuerLogo(doc: PDFDocument, logoUrl: string | null) {
  if (!logoUrl) return null
  try {
    if (logoUrl.startsWith('data:image/png;base64,')) {
      return doc.embedPng(logoUrl)
    }
    if (logoUrl.startsWith('data:image/jpeg;base64,') || logoUrl.startsWith('data:image/jpg;base64,')) {
      return doc.embedJpg(logoUrl)
    }
    const response = await fetch(logoUrl)
    if (!response.ok) return null
    const bytes = await response.arrayBuffer()
    const contentType = response.headers.get('content-type') || ''
    if (contentType.includes('png') || logoUrl.toLowerCase().endsWith('.png')) {
      return doc.embedPng(bytes)
    }
    if (contentType.includes('jpeg') || contentType.includes('jpg') || logoUrl.toLowerCase().match(/\.(jpg|jpeg)$/)) {
      return doc.embedJpg(bytes)
    }
    return null
  } catch {
    return null
  }
}

function resolveInvoiceLifecycleStatus(invoice: {
  status: InvoiceStatus
  metadata?: Record<string, unknown> | null
}) {
  const metadata = invoice.metadata || {}
  return metadata.finalizationLocked === true && invoice.status !== InvoiceStatus.DRAFT
}

async function ensureInvoiceMailboxDelivery(input: {
  invoiceId: string
  forceEmailResend?: boolean
}) {
  const invoice = await prisma.invoice.findUnique({
    where: { id: input.invoiceId },
    select: {
      id: true,
      invoiceNumber: true,
      status: true,
      tenantId: true,
      chainId: true,
      periodStart: true,
      periodEnd: true,
      metadata: true,
    },
  })
  if (!invoice) {
    const error = new Error('Rechnung nicht gefunden')
    ;(error as Error & { code?: string }).code = 'INVOICE_NOT_FOUND'
    throw error
  }
  if (!resolveInvoiceLifecycleStatus({
    status: invoice.status,
    metadata: (invoice.metadata as Record<string, unknown> | null) || null,
  })) {
    const error = new Error('Draft-Rechnungen dürfen nicht ins Postfach gelegt werden.')
    ;(error as Error & { code?: string }).code = 'INVOICE_NOT_FINALIZED'
    throw error
  }

  const metadata =
    invoice.metadata && typeof invoice.metadata === 'object' ? (invoice.metadata as Record<string, unknown>) : {}
  const recipient =
    metadata.billingProfileSnapshot && typeof metadata.billingProfileSnapshot === 'object'
      ? (metadata.billingProfileSnapshot as Record<string, unknown>)
      : null
  const recipientEmail =
    recipient && typeof recipient.invoiceEmail === 'string' && recipient.invoiceEmail.trim().length > 0
      ? recipient.invoiceEmail.trim()
      : null
  const appUrl = getPublicAppUrl()
  const actionUrl = `/admin/finanzen?invoice=${invoice.id}`
  const absoluteActionUrl = `${appUrl}${actionUrl}`
  const periodLabel = `${invoice.periodStart.toLocaleDateString('de-DE')} bis ${invoice.periodEnd.toLocaleDateString('de-DE')}`

  let mailboxMessage = await prisma.klarandoMailboxMessage.findFirst({
    where: {
      invoiceId: invoice.id,
      messageType: 'INVOICE_ISSUED',
    },
    orderBy: { createdAt: 'desc' },
  })

  if (!mailboxMessage) {
    mailboxMessage = await prisma.klarandoMailboxMessage.create({
      data: {
        tenantId: invoice.tenantId,
        chainId: invoice.chainId,
        invoiceId: invoice.id,
        messageType: 'INVOICE_ISSUED',
        title: `Neue Rechnung ${invoice.invoiceNumber}`,
        body: `Ihre Klarando-Rechnung für den Leistungszeitraum ${periodLabel} wurde erstellt.`,
        status: invoice.status,
        actionUrl,
        metadata: {
          category: 'BILLING',
          unread: true,
          postboxStatus: 'CREATED',
          emailStatus: 'PENDING',
        },
      },
    })
  }

  const existingMetadata =
    mailboxMessage.metadata && typeof mailboxMessage.metadata === 'object'
      ? (mailboxMessage.metadata as Record<string, unknown>)
      : {}

  let emailStatus =
    typeof existingMetadata.emailStatus === 'string' ? existingMetadata.emailStatus : 'PENDING'

  const shouldAttemptMail = input.forceEmailResend || emailStatus === 'PENDING'
  if (shouldAttemptMail) {
    if (!recipientEmail) {
      emailStatus = 'NO_RECIPIENT'
    } else if (!isMailConfigured()) {
      emailStatus = 'NOT_CONFIGURED'
    } else {
      try {
        await sendMail({
          to: recipientEmail,
          subject: `Neue Klarando-Rechnung ${invoice.invoiceNumber}`,
          text: `Ihre Klarando-Rechnung für den Leistungszeitraum ${periodLabel} wurde erstellt.\n\nBitte öffnen Sie die Rechnung im Klarando-Admin:\n${absoluteActionUrl}`,
          html: `<p>Ihre Klarando-Rechnung für den Leistungszeitraum <strong>${periodLabel}</strong> wurde erstellt.</p><p>Bitte öffnen Sie die Rechnung im Klarando-Admin:</p><p><a href="${absoluteActionUrl}">${absoluteActionUrl}</a></p>`,
        })
        emailStatus = 'SENT'
      } catch (mailError) {
        console.error('BILLING_INVOICE_MAIL_ERROR', mailError)
        emailStatus = 'FAILED'
      }
    }
  }

  mailboxMessage = await prisma.klarandoMailboxMessage.update({
    where: { id: mailboxMessage.id },
    data: {
      status: invoice.status,
      actionUrl,
      metadata: {
        ...existingMetadata,
        category: 'BILLING',
        unread: mailboxMessage.readAt ? false : true,
        postboxStatus: 'CREATED',
        emailStatus,
        invoiceNumber: invoice.invoiceNumber,
        actionUrl,
        recipientEmail,
      },
    },
  })

  return {
    message: mailboxMessage,
    emailStatus,
    emailConfigured: isMailConfigured(),
  }
}

function serializeBillingInvoice(invoice: {
  id: string
  invoiceNumber: string
  tenantId: string | null
  chainId: string | null
  recipientType: string
  status: InvoiceStatus
  totalGrossCents: number
  openAmountCents: number
  subTotalCents: number
  taxTotalCents: number
  currency?: string | null
  periodStart: Date
  periodEnd: Date
  dueAt?: Date | null
  issuedAt: Date | null
  createdAt: Date
  metadata?: Prisma.JsonValue | null
  tenant?: { id: string; name: string } | null
  chain?: { id: string; name: string } | null
  items?: Array<{
    id: string
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
  latestCollection?: {
    id: string
    status: string
    dueAt: Date | null
    failedAt: Date | null
    failureReason: string | null
    createdAt: Date
  } | null
}) {
  const metadata =
    invoice.metadata && typeof invoice.metadata === 'object' ? (invoice.metadata as Record<string, unknown>) : {}
  const latestCollection = invoice.latestCollection || null
  return {
    ...invoice,
    currency: invoice.currency || 'EUR',
    lifecycleStatus: normalizeInvoiceLifecycleStatus({
      invoiceStatus: invoice.status,
      dueAt: invoice.dueAt || null,
      hasPaymentCollection: Boolean(latestCollection),
      paymentCollectionStatus: latestCollection?.status || null,
    }),
    billingProfileSnapshot:
      metadata.billingProfileSnapshot && typeof metadata.billingProfileSnapshot === 'object'
        ? (metadata.billingProfileSnapshot as Record<string, unknown>)
        : null,
    vatSnapshot:
      metadata.vatSnapshot && typeof metadata.vatSnapshot === 'object'
        ? (metadata.vatSnapshot as Record<string, unknown>)
        : null,
    issuerSnapshot:
      metadata.issuerSnapshot && typeof metadata.issuerSnapshot === 'object'
        ? (metadata.issuerSnapshot as Record<string, unknown>)
        : null,
    audit:
      metadata.audit && typeof metadata.audit === 'object'
        ? (metadata.audit as Record<string, unknown>)
        : null,
    finalizedAt:
      typeof metadata.finalizedAt === 'string'
        ? (metadata.finalizedAt as string)
        : invoice.issuedAt?.toISOString() || null,
    latestCollection: latestCollection
      ? {
          ...latestCollection,
          dueAt: latestCollection.dueAt?.toISOString() || null,
          failedAt: latestCollection.failedAt?.toISOString() || null,
          createdAt: latestCollection.createdAt.toISOString(),
        }
      : null,
    items: (invoice.items || []).map((item) => ({
      ...item,
      quantity: typeof item.quantity === 'object' && item.quantity && 'toString' in item.quantity ? item.quantity.toString() : item.quantity,
      taxRatePercent:
        typeof item.taxRatePercent === 'object' && item.taxRatePercent && 'toString' in item.taxRatePercent
          ? item.taxRatePercent.toString()
          : item.taxRatePercent,
    })),
  }
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
  issuerProfile: InvoiceIssuerProfile
}) {
  const doc = await PDFDocument.create()
  const fontRegular = await doc.embedFont(StandardFonts.Helvetica)
  const fontBold = await doc.embedFont(StandardFonts.HelveticaBold)
  const pageSize: [number, number] = [595.28, 841.89]
  let page = doc.addPage(pageSize)
  const { width, height } = page.getSize()
  const margin = 48
  const rowHeight = 18
  const issuerProfile = input.issuerProfile
  const brandColor = rgb(...parseHexColor(issuerProfile.invoicePrimaryColor, [0.06, 0.09, 0.16]))
  const accentColor = rgb(...parseHexColor(issuerProfile.invoiceAccentColor, [0.89, 0.91, 0.94]))
  const bodyColor = rgb(0.1, 0.14, 0.22)
  const mutedColor = rgb(0.42, 0.46, 0.52)
  const lightBorderColor = rgb(0.86, 0.88, 0.91)
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

  const drawWrappedText = (
    text: string,
    options: {
      x?: number
      y?: number
      size?: number
      bold?: boolean
      color?: ReturnType<typeof rgb>
      maxWidth?: number
      lineGap?: number
    } = {}
  ) => {
    const size = options.size ?? 10
    const x = options.x ?? margin
    const yStart = options.y ?? y
    const font = options.bold ? fontBold : fontRegular
    const maxWidth = options.maxWidth ?? width - margin * 2
    const lineGap = options.lineGap ?? 4
    const sanitized = normalizeInvoicePdfText(text)
    const words = sanitized.split(/\s+/).filter(Boolean)
    const lines: string[] = []
    let currentLine = ''
    for (const word of words) {
      const candidate = currentLine ? `${currentLine} ${word}` : word
      if (font.widthOfTextAtSize(candidate, size) <= maxWidth || !currentLine) {
        currentLine = candidate
      } else {
        lines.push(currentLine)
        currentLine = word
      }
    }
    if (currentLine) lines.push(currentLine)
    let currentY = yStart
    for (const line of lines) {
      page.drawText(line, {
        x,
        y: currentY,
        size,
        font,
        color: options.color ?? bodyColor,
      })
      currentY -= size + lineGap
    }
    return currentY
  }

  const drawText = (
    text: string,
    options: { x?: number; size?: number; bold?: boolean; color?: ReturnType<typeof rgb> } = {}
  ) => {
    const size = options.size ?? 10
    page.drawText(normalizeInvoicePdfText(text), {
      x: options.x ?? margin,
      y,
      size,
      font: options.bold ? fontBold : fontRegular,
      color: options.color ?? bodyColor,
    })
    y -= size + 4
  }

  const invoiceDate = input.invoice.issuedAt || input.invoice.createdAt
  const vatRatePercent = toPlainNumber(vatSnapshot.vatRatePercent)
  const logo = await tryEmbedIssuerLogo(doc, issuerProfile.logoUrl)
  if (logo) {
    const desiredHeight = 46
    const scale = desiredHeight / logo.height
    page.drawImage(logo, {
      x: margin,
      y: height - margin - desiredHeight,
      width: logo.width * scale,
      height: desiredHeight,
    })
  }

  const issuerTopY = height - margin
  const issuerX = logo ? margin + 96 : margin
  const issuerTitle = issuerProfile.legalForm ? `${issuerProfile.name} ${issuerProfile.legalForm}` : issuerProfile.name
  let issuerY = issuerTopY
  issuerY = drawWrappedText(issuerTitle, { x: issuerX, y: issuerY, size: 17, bold: true, color: brandColor, maxWidth: 250 })
  if (issuerProfile.owner) issuerY = drawWrappedText(`Inhaber: ${issuerProfile.owner}`, { x: issuerX, y: issuerY, size: 10 })
  issuerY = drawWrappedText(issuerProfile.street, { x: issuerX, y: issuerY, size: 10 })
  issuerY = drawWrappedText(`${issuerProfile.zip} ${issuerProfile.city}`, { x: issuerX, y: issuerY, size: 10 })
  issuerY = drawWrappedText(issuerProfile.country, { x: issuerX, y: issuerY, size: 10 })
  issuerY = drawWrappedText(issuerProfile.email, { x: issuerX, y: issuerY, size: 10 })
  if (issuerProfile.website) issuerY = drawWrappedText(issuerProfile.website, { x: issuerX, y: issuerY, size: 10 })
  issuerY = drawWrappedText(`USt-IdNr.: ${issuerProfile.vatId}`, { x: issuerX, y: issuerY, size: 10 })
  if (issuerProfile.taxNumber) issuerY = drawWrappedText(`Steuernummer: ${issuerProfile.taxNumber}`, { x: issuerX, y: issuerY, size: 10 })

  const infoBoxX = width - margin - 180
  const infoBoxY = height - margin - 8
  const infoBoxHeight = 152
  page.drawRectangle({
    x: infoBoxX,
    y: infoBoxY - infoBoxHeight,
    width: 180,
    height: infoBoxHeight,
    color: rgb(0.98, 0.99, 1),
    borderColor: accentColor,
    borderWidth: 1,
  })
  let infoY = infoBoxY - 18
  const drawInfoRow = (label: string, value: string) => {
    page.drawText(label, { x: infoBoxX + 12, y: infoY, size: 8, font: fontBold, color: mutedColor })
    infoY -= 12
    page.drawText(normalizeInvoicePdfText(value), {
      x: infoBoxX + 12,
      y: infoY,
      size: 10,
      font: fontRegular,
      color: bodyColor,
    })
    infoY -= 16
  }
  drawInfoRow('Rechnungsnummer', input.invoice.invoiceNumber)
  drawInfoRow('Rechnungsdatum', invoiceDate.toLocaleDateString('de-DE'))
  drawInfoRow(
    'Leistungszeitraum',
    `${input.invoice.periodStart.toLocaleDateString('de-DE')} - ${input.invoice.periodEnd.toLocaleDateString('de-DE')}`
  )
  drawInfoRow('Zahlungsziel', input.invoice.dueAt ? input.invoice.dueAt.toLocaleDateString('de-DE') : `${paymentTermsDays} Tage`)
  drawInfoRow('Status', input.invoice.status)

  page.drawLine({
    start: { x: margin, y: Math.min(issuerY, infoBoxY - infoBoxHeight) - 14 },
    end: { x: width - margin, y: Math.min(issuerY, infoBoxY - infoBoxHeight) - 14 },
    thickness: 2,
    color: accentColor,
  })

  y = Math.min(issuerY, infoBoxY - infoBoxHeight) - 36
  drawText('Rechnungsempfänger', { size: 12, bold: true, color: brandColor })
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

  y -= 18
  const colX = [margin, 292, 372, 470]
  const drawTableHeader = () => {
    page.drawRectangle({
      x: margin,
      y: y - 2,
      width: width - margin * 2,
      height: rowHeight + 6,
      color: accentColor,
    })
    page.drawText('Position', { x: colX[0] + 6, y: y + 4, size: 10, font: fontBold, color: brandColor })
    page.drawText('Menge', { x: colX[1] + 6, y: y + 4, size: 10, font: fontBold, color: brandColor })
    page.drawText('Einzelpreis netto', { x: colX[2] + 6, y: y + 4, size: 10, font: fontBold, color: brandColor })
    page.drawText('Gesamt netto', { x: colX[3] + 6, y: y + 4, size: 10, font: fontBold, color: brandColor })
    y -= rowHeight + 12
  }

  const startNewPage = () => {
    page = doc.addPage(pageSize)
    y = height - margin
    drawTableHeader()
  }

  drawTableHeader()

  for (const item of input.invoice.items) {
    const descriptionLines =
      item.description && item.description.trim().length > 0 ? Math.max(1, Math.ceil(item.description.length / 80)) : 0
    const rowNeeded = 18 + descriptionLines * 12
    if (y < 180 + rowNeeded) {
      startNewPage()
    }
    page.drawLine({
      start: { x: margin, y: y + 2 },
      end: { x: width - margin, y: y + 2 },
      thickness: 1,
      color: lightBorderColor,
    })
    page.drawText(normalizeInvoicePdfText(item.title), {
      x: colX[0] + 6,
      y: y - 12,
      size: 10,
      font: fontRegular,
      color: bodyColor,
    })
    page.drawText(toPlainNumber(item.quantity).toFixed(2).replace('.', ','), {
      x: colX[1] + 6,
      y: y - 12,
      size: 10,
      font: fontRegular,
      color: bodyColor,
    })
    page.drawText(centsToEuroLabel(item.unitPriceCents), {
      x: colX[2] + 6,
      y: y - 12,
      size: 10,
      font: fontRegular,
      color: bodyColor,
    })
    page.drawText(centsToEuroLabel(item.netAmountCents), {
      x: colX[3] + 6,
      y: y - 12,
      size: 10,
      font: fontRegular,
      color: bodyColor,
    })
    y -= 22
    if (item.description) {
      y = drawWrappedText(item.description, {
        x: colX[0] + 6,
        y,
        size: 8,
        color: mutedColor,
        maxWidth: width - margin * 2 - 12,
        lineGap: 2,
      })
      y -= 4
    }
  }

  if (y < 220) {
    startNewPage()
  } else {
    y -= 8
  }

  page.drawLine({ start: { x: margin, y }, end: { x: width - margin, y }, thickness: 1, color: lightBorderColor })
  y -= 22

  const summaryX = width - margin - 185
  page.drawRectangle({
    x: summaryX,
    y: y - 54,
    width: 185,
    height: 72,
    color: rgb(0.99, 0.99, 1),
    borderColor: accentColor,
    borderWidth: 1,
  })
  let summaryY = y
  const drawSummaryLine = (label: string, value: string, bold = false) => {
    page.drawText(label, {
      x: summaryX + 12,
      y: summaryY,
      size: bold ? 11 : 10,
      font: bold ? fontBold : fontRegular,
      color: bodyColor,
    })
    const font = bold ? fontBold : fontRegular
    const textWidth = font.widthOfTextAtSize(value, bold ? 11 : 10)
    page.drawText(value, {
      x: summaryX + 173 - textWidth,
      y: summaryY,
      size: bold ? 11 : 10,
      font,
      color: bodyColor,
    })
    summaryY -= 18
  }
  drawSummaryLine('Netto', centsToEuroLabel(input.invoice.subTotalCents))
  drawSummaryLine(`MwSt. ${vatRatePercent.toFixed(2).replace('.', ',')} %`, centsToEuroLabel(input.invoice.taxTotalCents))
  drawSummaryLine('Brutto', centsToEuroLabel(input.invoice.totalGrossCents), true)
  y = summaryY - 18

  drawText('Zahlungsinformationen', { size: 12, bold: true, color: brandColor })
  drawText(
    typeof recipient.paymentMethod === 'string' && recipient.paymentMethod.trim().length > 0
      ? `Zahlungsart: ${recipient.paymentMethod}`
      : 'Zahlungsart: Nicht hinterlegt'
  )
  if (issuerProfile.bankName || issuerProfile.iban || issuerProfile.bic || issuerProfile.creditorId) {
    if (issuerProfile.bankName) drawText(`Bank: ${issuerProfile.bankName}`)
    if (issuerProfile.iban) drawText(`IBAN: ${issuerProfile.iban}`)
    if (issuerProfile.bic) drawText(`BIC: ${issuerProfile.bic}`)
    if (
      typeof recipient.paymentMethod === 'string' &&
      recipient.paymentMethod.toLowerCase().includes('lastschrift') &&
      issuerProfile.creditorId
    ) {
      drawText(`Gläubiger-ID: ${issuerProfile.creditorId}`)
    }
  } else {
    drawText('Bankdaten sind noch nicht im Rechnungssteller-Profil hinterlegt.', { color: mutedColor })
  }
  if (issuerProfile.paymentInfo) {
    y = drawWrappedText(issuerProfile.paymentInfo, { y, size: 9, color: mutedColor, maxWidth: width - margin * 2 })
  }

  if (issuerProfile.footer) {
    drawWrappedText(issuerProfile.footer, { x: margin, y: 36, size: 8, color: mutedColor, maxWidth: width - margin * 2 })
  } else {
    page.drawText(`Snapshot-PDF · Rechnung ${input.invoice.invoiceNumber}`, {
      x: margin,
      y: 24,
      size: 8,
      font: fontRegular,
      color: mutedColor,
    })
  }

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
    const normalizedProfile =
      profile ?? {
        scopeKey: 'global',
        countryCode: 'DE',
        standardPaymentTargetDays: 14,
      }
    const issuerProfile = resolveInvoiceIssuerProfile(normalizedProfile)
    return res.json({
      profile: normalizedProfile,
      readiness: evaluateInvoiceIssuerReadiness(issuerProfile),
      issuerSnapshotTemplate: buildInvoiceIssuerSnapshot(issuerProfile),
    })
  } catch (error) {
    logBillingApiError('/api/billing/settings/platform', error)
    const fallbackProfile = {
      scopeKey: 'global',
      countryCode: 'DE',
      standardPaymentTargetDays: 14,
    }
    const issuerProfile = resolveInvoiceIssuerProfile(fallbackProfile)
    return res.json({
      profile: fallbackProfile,
      readiness: evaluateInvoiceIssuerReadiness(issuerProfile),
      issuerSnapshotTemplate: buildInvoiceIssuerSnapshot(issuerProfile),
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

    let delivery: Awaited<ReturnType<typeof ensureInvoiceMailboxDelivery>> | null = null
    try {
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
    } catch (auditError) {
      console.error('POST FINALIZE INVOICE PREVIEW AUDIT ERROR:', auditError)
    }
    try {
      delivery = await ensureInvoiceMailboxDelivery({ invoiceId: invoice.id })
    } catch (deliveryError) {
      console.error('POST FINALIZE INVOICE PREVIEW MAILBOX ERROR:', deliveryError)
    }

    return res.status(201).json({
      ok: true,
      invoiceId: invoice.id,
      invoiceNumber: invoice.invoiceNumber,
      status: invoice.status,
      periodStart: invoice.periodStart.toISOString(),
      periodEnd: invoice.periodEnd.toISOString(),
      totalGrossCents: invoice.totalGrossCents,
      itemsCount: invoice.items.length,
      postboxStatus: delivery?.message ? 'CREATED' : 'PENDING',
      emailDeliveryStatus: delivery?.emailStatus || 'PENDING',
      invoice: serializeBillingInvoice({
        ...invoice,
        dueAt: invoice.dueAt,
        issuedAt: invoice.issuedAt,
        createdAt: invoice.createdAt,
        tenant: null,
        chain: null,
      }),
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
    const authUser = req.authUser
    if (!authUser) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
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
    if (authUser.role === UserRole.ADMIN || authUser.role === UserRole.CHAINADMIN) {
      const scope = await resolveTenantScope(req, invoice.tenantId || undefined)
      if (!invoice.tenantId || scope.tenantId !== invoice.tenantId) {
        return res.status(403).json({ error: 'Kein Zugriff auf diese Rechnung' })
      }
    } else if (authUser.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Kein Zugriff auf diese Rechnung' })
    }
    if (!resolveInvoiceLifecycleStatus({
      status: invoice.status,
      metadata: (invoice.metadata as Record<string, unknown> | null) || null,
    })) {
      return res.status(409).json({ error: 'Nur finalisierte Rechnungen koennen als PDF ausgegeben werden.' })
    }
    const platformProfile = await prisma.platformBillingSettings.findFirst({
      where: { scopeKey: 'global' },
    })
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
      issuerProfile: resolveInvoiceIssuerProfile(platformProfile),
    })

    res.setHeader('Content-Type', 'application/pdf')
    res.setHeader('Content-Disposition', `inline; filename=\"${invoice.invoiceNumber}.pdf\"`)
    return res.send(Buffer.from(pdfBytes))
  } catch (error) {
    const message = error instanceof Error ? error.message : 'PDF konnte nicht vorbereitet werden'
    if (
      message.includes('Nur finalisierte Rechnungen') ||
      message.includes('Snapshot fehlt') ||
      message.includes('vollstaendigen Rechnungsadress-Snapshot')
    ) {
      return res.status(409).json({ error: message })
    }
    console.error('GET BILLING INVOICE PDF ERROR:', error)
    return res.status(500).json({ error: 'PDF konnte nicht vorbereitet werden' })
  }
})

router.post('/invoices/:invoiceId/mailbox', requireAuth, async (req, res) => {
  try {
    if (req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur Superadmin erlaubt' })
    }
    const delivery = await ensureInvoiceMailboxDelivery({
      invoiceId: String(req.params.invoiceId || ''),
    })
    return res.json({
      ok: true,
      invoiceId: String(req.params.invoiceId || ''),
      messageId: delivery.message.id,
      postboxStatus: 'CREATED',
      emailDeliveryStatus: delivery.emailStatus,
      emailConfigured: delivery.emailConfigured,
    })
  } catch (error) {
    const typedError = error as Error & { code?: string }
    if (typedError.code === 'INVOICE_NOT_FOUND') {
      return res.status(404).json({ error: typedError.message })
    }
    if (typedError.code === 'INVOICE_NOT_FINALIZED') {
      return res.status(409).json({ error: typedError.message })
    }
    console.error('POST BILLING INVOICE MAILBOX ERROR:', error)
    return res.status(500).json({ error: 'Postfach-Eintrag konnte nicht erstellt werden' })
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
      invoices.map((invoice) =>
        serializeBillingInvoice({
          ...invoice,
          metadata: (invoice.metadata as Prisma.JsonValue | null) || null,
          latestCollection: invoice.paymentCollections[0] || null,
        })
      )
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

    if (tenantId) {
      try {
        await ensureUpcomingHolidayReminderForTenant(tenantId)
      } catch (reminderError) {
        console.error('GET BILLING MAILBOX HOLIDAY REMINDER ERROR:', reminderError)
      }
    }

    const messages = await prisma.klarandoMailboxMessage.findMany({
      where: {
        ...(tenantId ? { tenantId } : {}),
        ...(chainId ? { chainId } : {}),
        NOT: {
          status: InvoiceStatus.DRAFT,
        },
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

router.get('/mailbox/header', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) return res.status(401).json({ error: 'Nicht eingeloggt' })

    const tenantId =
      authUser.role === UserRole.SUPERADMIN
        ? asString(req.query.tenantId) || null
        : (await resolveTenantScope(req, asString(req.query.tenantId))).tenantId

    const chainId = authUser.role === UserRole.CHAINADMIN ? authUser.chainId : asString(req.query.chainId) || null

    if (tenantId) {
      try {
        await ensureUpcomingHolidayReminderForTenant(tenantId)
      } catch (reminderError) {
        console.error('GET BILLING MAILBOX HEADER HOLIDAY REMINDER ERROR:', reminderError)
      }
    }

    const messages = await prisma.klarandoMailboxMessage.findMany({
      where: {
        ...(tenantId ? { tenantId } : {}),
        ...(chainId ? { chainId } : {}),
        NOT: {
          status: InvoiceStatus.DRAFT,
        },
      },
      orderBy: { createdAt: 'desc' },
      take: 8,
    })

    const unreadCount = messages.filter((message) => !message.readAt).length
    return res.json({
      unreadCount,
      latestMessages: messages,
    })
  } catch (error) {
    const scopedError = asTenantScopeError(error)
    if (scopedError) return res.status(scopedError.status).json({ error: scopedError.message })
    console.error('GET BILLING MAILBOX HEADER ERROR:', error)
    return res.status(500).json({ error: 'Postfach-Status konnte nicht geladen werden' })
  }
})

router.post('/mailbox/:messageId/read', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) return res.status(401).json({ error: 'Nicht eingeloggt' })
    const existing = await prisma.klarandoMailboxMessage.findUnique({
      where: { id: String(req.params.messageId || '') },
    })
    if (!existing) {
      return res.status(404).json({ error: 'Nachricht nicht gefunden' })
    }
    if (authUser.role === UserRole.ADMIN || authUser.role === UserRole.CHAINADMIN) {
      const scope = await resolveTenantScope(req, existing.tenantId || undefined)
      if (!existing.tenantId || scope.tenantId !== existing.tenantId) {
        return res.status(403).json({ error: 'Kein Zugriff auf diese Nachricht' })
      }
    }
    const message = await prisma.klarandoMailboxMessage.update({
      where: { id: existing.id },
      data: { readAt: new Date() },
    })
    return res.json({ ok: true, messageId: message.id, readAt: message.readAt })
  } catch (error) {
    const scopedError = asTenantScopeError(error)
    if (scopedError) return res.status(scopedError.status).json({ error: scopedError.message })
    console.error('POST BILLING MAILBOX READ ERROR:', error)
    return res.status(500).json({ error: 'Nachricht konnte nicht aktualisiert werden' })
  }
})

router.post('/mailbox/read-all', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const authUser = req.authUser
    if (!authUser) return res.status(401).json({ error: 'Nicht eingeloggt' })
    const tenantId =
      authUser.role === UserRole.SUPERADMIN
        ? asString(req.body?.tenantId) || asString(req.query?.tenantId) || null
        : (await resolveTenantScope(req, asString(req.body?.tenantId) || asString(req.query?.tenantId))).tenantId
    const chainId = authUser.role === UserRole.CHAINADMIN ? authUser.chainId : asString(req.body?.chainId) || asString(req.query?.chainId) || null

    const result = await prisma.klarandoMailboxMessage.updateMany({
      where: {
        ...(tenantId ? { tenantId } : {}),
        ...(chainId ? { chainId } : {}),
        readAt: null,
        NOT: {
          status: InvoiceStatus.DRAFT,
        },
      },
      data: { readAt: new Date() },
    })
    return res.json({ ok: true, updated: result.count })
  } catch (error) {
    const scopedError = asTenantScopeError(error)
    if (scopedError) return res.status(scopedError.status).json({ error: scopedError.message })
    console.error('POST BILLING MAILBOX READ ALL ERROR:', error)
    return res.status(500).json({ error: 'Postfach konnte nicht als gelesen markiert werden' })
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
