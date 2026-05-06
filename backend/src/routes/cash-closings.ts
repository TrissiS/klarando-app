import { PermissionKey, Prisma, UserRole } from '@prisma/client'
import { Router } from 'express'
import type { Request } from 'express'
import { createHash } from 'node:crypto'
import { PDFDocument, PDFFont, PDFPage, StandardFonts, rgb } from 'pdf-lib'
import { prisma } from '../lib/prisma'

const router = Router()

const MODULE = 'cash_closing'
const A_DRAFT = 'daily_draft_saved'
const A_SUBMIT = 'daily_submitted'
const A_DAILY_REVIEW = 'daily_reviewed'
const A_REOPEN_REQUEST = 'daily_reopen_requested'
const A_REOPEN_REVIEW = 'daily_reopen_reviewed'
const A_DAILY_PDF = 'daily_pdf_generated'
const A_MONTHLY_SUBMIT = 'monthly_submitted'
const A_MONTHLY_REVIEW = 'monthly_reviewed'

class HttpError extends Error {
  status: number
  constructor(status: number, message: string) {
    super(message)
    this.status = status
  }
}

function isObj(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function text(value: unknown) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function money(value: unknown, fallback = 0) {
  if (value === null || value === undefined || value === '') return fallback
  if (typeof value === 'number' && Number.isFinite(value)) return Number(value.toFixed(2))
  if (typeof value === 'string') {
    const parsed = Number(value.replace(',', '.'))
    if (Number.isFinite(parsed)) return Number(parsed.toFixed(2))
  }
  return null
}

function round2(value: number) {
  return Number(value.toFixed(2))
}

function num(value: unknown, fallback = 0) {
  if (typeof value === 'number' && Number.isFinite(value)) return Number(value)
  if (typeof value === 'string') {
    const parsed = Number(value.replace(',', '.'))
    if (Number.isFinite(parsed)) return parsed
  }
  return fallback
}

function moneyDe(value: unknown) {
  return `${round2(num(value)).toFixed(2).replace('.', ',')} EUR`
}

function formatDateDe(dateIso: string) {
  const parts = dateIso.split('-')
  if (parts.length !== 3) return dateIso
  return `${parts[2]}.${parts[1]}.${parts[0]}`
}

function formatDateTimeDe(value: Date) {
  return `${String(value.getDate()).padStart(2, '0')}.${String(value.getMonth() + 1).padStart(2, '0')}.${value.getFullYear()} ${String(value.getHours()).padStart(2, '0')}:${String(value.getMinutes()).padStart(2, '0')}`
}

function sanitizeFileName(value: string) {
  return value
    .trim()
    .replace(/[\\/:*?"<>|]+/g, '_')
    .replace(/\s+/g, '_')
    .slice(0, 80)
}

function decodeBase64(value: string) {
  try {
    return Buffer.from(value, 'base64')
  } catch {
    return null
  }
}

const COUNT_SHEET_DENOMINATIONS = [
  0.01,
  0.02,
  0.05,
  0.1,
  0.2,
  0.5,
  1,
  2,
  5,
  10,
  20,
  50,
  100,
  200,
] as const

function roundDownToStep(value: number, step: number) {
  if (!Number.isFinite(value) || value <= 0) return 0
  if (!Number.isFinite(step) || step <= 0) return round2(value)
  const rounded = Math.floor(value / step) * step
  return round2(rounded)
}

function parseCountSheet(value: unknown) {
  if (!isObj(value)) return null
  const parsed: Record<string, number> = {}
  for (const denomination of COUNT_SHEET_DENOMINATIONS) {
    const key = denomination.toFixed(2)
    const raw = value[key]
    if (raw === undefined || raw === null || raw === '') {
      parsed[key] = 0
      continue
    }
    const quantity = Number(raw)
    if (!Number.isInteger(quantity) || quantity < 0 || quantity > 100000) return null
    parsed[key] = quantity
  }
  return parsed
}

function isoDate(value: unknown) {
  return typeof value === 'string' && /^\d{4}-\d{2}-\d{2}$/.test(value.trim()) ? value.trim() : null
}

function isoMonth(value: unknown) {
  return typeof value === 'string' && /^\d{4}-\d{2}$/.test(value.trim()) ? value.trim() : null
}

function extractDate(metadata: unknown) {
  return isObj(metadata) ? isoDate(metadata.closingDate) : null
}

function extractMonth(metadata: unknown) {
  return isObj(metadata) ? isoMonth(metadata.month) : null
}

function extractSubmissionId(metadata: unknown) {
  return isObj(metadata) ? text(metadata.submissionId) : null
}

function extractDecision(metadata: unknown) {
  if (!isObj(metadata) || typeof metadata.decision !== 'string') return null
  if (metadata.decision === 'APPROVED' || metadata.decision === 'RETURNED') return metadata.decision
  return null
}

function extractReopenDecision(metadata: unknown) {
  if (!isObj(metadata) || typeof metadata.decision !== 'string') return null
  if (metadata.decision === 'APPROVED' || metadata.decision === 'REJECTED') return metadata.decision
  return null
}

async function ensureRead(req: Request) {
  if (!req.authUser) throw new HttpError(401, 'Nicht eingeloggt')
  if (req.authUser.role === UserRole.SUPERADMIN) return
  if (!req.authUser.permissions.has(PermissionKey.ORDERS_READ)) {
    throw new HttpError(403, `Keine Berechtigung: ${PermissionKey.ORDERS_READ}`)
  }
}

async function ensureWrite(req: Request) {
  if (!req.authUser) throw new HttpError(401, 'Nicht eingeloggt')
  if (req.authUser.role === UserRole.SUPERADMIN) return
  if (!req.authUser.permissions.has(PermissionKey.ORDERS_WRITE)) {
    throw new HttpError(403, `Keine Berechtigung: ${PermissionKey.ORDERS_WRITE}`)
  }
}

async function resolveTenant(req: Request, tenantIdInput: string | null, chainadminGrantedOnly = true) {
  const actor = req.authUser
  if (!actor) throw new HttpError(401, 'Nicht eingeloggt')

  if (actor.role === UserRole.SUPERADMIN) {
    if (!tenantIdInput) throw new HttpError(400, 'tenantId fehlt')
    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantIdInput },
      select: { id: true, name: true, chainId: true },
    })
    if (!tenant) throw new HttpError(404, 'Filiale nicht gefunden')
    return tenant
  }

  if (actor.role === UserRole.CHAINADMIN) {
    if (!actor.chainId) throw new HttpError(403, 'Kette fuer CHAINADMIN nicht gesetzt')
    if (!tenantIdInput) throw new HttpError(400, 'tenantId fehlt')
    const tenant = await prisma.tenant.findFirst({
      where: { id: tenantIdInput, chainId: actor.chainId },
      select: { id: true, name: true, chainId: true },
    })
    if (!tenant) throw new HttpError(403, 'Filiale gehoert nicht zu deiner Kette')
    if (chainadminGrantedOnly) {
      const grant = await prisma.chainAdminTenantAccess.findFirst({
        where: { chainAdminUserId: actor.id, tenantId: tenant.id, superadminGranted: true },
        select: { id: true },
      })
      if (!grant) throw new HttpError(403, 'Filiale ist fuer dich nicht freigegeben')
    }
    return tenant
  }

  if ((actor.role === UserRole.ADMIN || actor.role === UserRole.STAFF) && actor.tenantId) {
    if (tenantIdInput && tenantIdInput !== actor.tenantId) {
      throw new HttpError(403, 'Keine Berechtigung fuer diese Filiale')
    }
    const tenant = await prisma.tenant.findUnique({
      where: { id: actor.tenantId },
      select: { id: true, name: true, chainId: true },
    })
    if (!tenant) throw new HttpError(404, 'Filiale nicht gefunden')
    return tenant
  }

  throw new HttpError(403, 'Keine Berechtigung')
}

async function createAudit(params: {
  req: Request
  action: string
  tenantId: string
  chainId: string | null
  targetType: string
  targetId: string
  metadata: Record<string, unknown>
}) {
  const actor = params.req.authUser
  const headerEmail = params.req.header('x-user-email') || null
  return prisma.auditLog.create({
    data: {
      actorUserId: actor?.id || null,
      actorEmail: actor?.email || headerEmail,
      actorRole: actor?.role || null,
      chainId: params.chainId,
      tenantId: params.tenantId,
      module: MODULE,
      action: params.action,
      targetType: params.targetType,
      targetId: params.targetId,
      metadata: params.metadata as Prisma.InputJsonObject,
    },
  })
}

function dayRange(date: string) {
  return { from: new Date(`${date}T00:00:00.000`), to: new Date(`${date}T23:59:59.999`) }
}

function monthRange(month: string) {
  const [yearRaw, monthRaw] = month.split('-')
  const year = Number(yearRaw)
  const monthNum = Number(monthRaw)
  return {
    from: new Date(year, monthNum - 1, 1, 0, 0, 0, 0),
    to: new Date(year, monthNum, 0, 23, 59, 59, 999),
  }
}

async function dailyComputed(tenantId: string, date: string) {
  const { from, to } = dayRange(date)
  const [orders, stock] = await Promise.all([
    prisma.order.findMany({
      where: { tenantId, createdAt: { gte: from, lte: to } },
      select: {
        total: true,
        subtotal: true,
        deliveryFee: true,
        paymentStatus: true,
        paymentMethod: true,
        sourceChannel: true,
        serviceType: true,
      },
    }),
    prisma.stockMovement.findMany({
      where: { tenantId, createdAt: { gte: from, lte: to } },
      select: { type: true, quantityDelta: true, unitCost: true },
    }),
  ])

  let grossTotal = 0
  let subtotalTotal = 0
  let deliveryFeeTotal = 0
  let paidCashTotal = 0
  let paidCardTotal = 0
  let paidPaypalTotal = 0
  let paidKlarnaTotal = 0
  let paidOrderCount = 0
  let unpaidOrderCount = 0
  let appOrderCount = 0
  let appPickupOrderCount = 0
  let appDeliveryOrderCount = 0
  let terminalOrderCount = 0
  let posOrderCount = 0
  let appPickupTotal = 0
  let appDeliveryTotal = 0
  let takeawayOrderCount = 0
  let onSiteOrderCount = 0
  let takeawayTotal = 0
  let onSiteTotal = 0

  for (const order of orders) {
    const total = Number(order.total || 0)
    grossTotal += total
    subtotalTotal += Number(order.subtotal || 0)
    deliveryFeeTotal += Number(order.deliveryFee || 0)

    const sourceChannel = (order.sourceChannel || '').toUpperCase()
    const serviceType = (order.serviceType || '').toUpperCase()
    const isAppOrder = sourceChannel === 'APP' || sourceChannel === 'DELIVERY'
    const isDelivery = sourceChannel === 'DELIVERY' || serviceType === 'DELIVERY'
    const isPickup = serviceType === 'PICKUP'
    const isOnSiteExplicit =
      serviceType === 'DINE_IN' ||
      serviceType === 'ON_SITE' ||
      serviceType === 'ONSITE' ||
      serviceType === 'VOR_ORT' ||
      serviceType === 'VORORT'
    const isTakeaway = isDelivery || isPickup || sourceChannel === 'APP' || sourceChannel === 'DELIVERY'
    const isOnSite = isOnSiteExplicit || (!isTakeaway && (sourceChannel === 'POS' || sourceChannel === 'TERMINAL'))

    if (isTakeaway) {
      takeawayOrderCount += 1
      takeawayTotal += total
    } else if (isOnSite) {
      onSiteOrderCount += 1
      onSiteTotal += total
    }

    if (isAppOrder) {
      appOrderCount += 1
      if (isDelivery) {
        appDeliveryOrderCount += 1
        appDeliveryTotal += total
      } else {
        appPickupOrderCount += 1
        appPickupTotal += total
      }
    } else if (sourceChannel === 'TERMINAL') terminalOrderCount += 1
    else posOrderCount += 1

    if (order.paymentStatus === 'PAID') {
      paidOrderCount += 1
      const method = (order.paymentMethod || '').toUpperCase()
      if (method === 'CASH') paidCashTotal += total
      if (method === 'CARD') paidCardTotal += total
      if (method === 'PAYPAL') paidPaypalTotal += total
      if (method === 'KLARNA') paidKlarnaTotal += total
    } else {
      unpaidOrderCount += 1
    }
  }

  let goodsReceiptValue = 0
  let writeOffValue = 0
  let inventoryCorrections = 0
  for (const move of stock) {
    const value = Math.abs(Number(move.quantityDelta || 0)) * Number(move.unitCost || 0)
    if (move.type === 'GOODS_RECEIPT') goodsReceiptValue += value
    else if (move.type === 'WRITE_OFF') writeOffValue += value
    else inventoryCorrections += value
  }

  return {
    orderCount: orders.length,
    paidOrderCount,
    unpaidOrderCount,
    appOrderCount,
    appPickupOrderCount,
    appDeliveryOrderCount,
    takeawayOrderCount,
    onSiteOrderCount,
    terminalOrderCount,
    posOrderCount,
    appPickupTotal: round2(appPickupTotal),
    appDeliveryTotal: round2(appDeliveryTotal),
    takeawayTotal: round2(takeawayTotal),
    onSiteTotal: round2(onSiteTotal),
    grossTotal: round2(grossTotal),
    subtotalTotal: round2(subtotalTotal),
    deliveryFeeTotal: round2(deliveryFeeTotal),
    paidCashTotal: round2(paidCashTotal),
    paidCardTotal: round2(paidCardTotal),
    paidPaypalTotal: round2(paidPaypalTotal),
    paidKlarnaTotal: round2(paidKlarnaTotal),
    goodsReceiptValue: round2(goodsReceiptValue),
    writeOffValue: round2(writeOffValue),
    inventoryCorrections: round2(inventoryCorrections),
  }
}

function extractPayload(metadata: unknown) {
  if (!isObj(metadata) || !isObj(metadata.payload)) return null
  const payload = metadata.payload
  const countedCash = money(payload.countedCash)
  const cashExpenses = money(payload.cashExpenses)
  const tipsCash = money(payload.tipsCash)
  const tipsCard = money(payload.tipsCard)
  const keepInRegisterTargetRaw = payload.keepInRegisterTarget
  const keepInRegisterTarget =
    keepInRegisterTargetRaw === null || keepInRegisterTargetRaw === undefined || keepInRegisterTargetRaw === ''
      ? null
      : money(keepInRegisterTargetRaw, 0)
  const countSheet = parseCountSheet(payload.countSheet)
  if (countedCash === null || cashExpenses === null || tipsCash === null || tipsCard === null) return null
  if (keepInRegisterTarget === null && keepInRegisterTargetRaw !== null && keepInRegisterTargetRaw !== undefined && keepInRegisterTargetRaw !== '') {
    return null
  }
  if (countSheet === null && payload.countSheet !== undefined && payload.countSheet !== null) return null
  return {
    countedCash,
    cashExpenses,
    tipsCash,
    tipsCard,
    keepInRegisterTarget,
    countSheet,
    note: text(payload.note),
  }
}

function settlement(
  payload: {
    countedCash: number
    cashExpenses: number
    tipsCash: number
    keepInRegisterTarget: number | null
  },
  computed: { paidCashTotal: number }
) {
  const expectedCash = round2(computed.paidCashTotal - payload.cashExpenses - payload.tipsCash)
  const cashDifference = round2(payload.countedCash - expectedCash)
  const keepInRegisterTarget = round2(Math.max(0, payload.keepInRegisterTarget || 0))
  const bankDepositRaw = round2(Math.max(0, payload.countedCash - keepInRegisterTarget))
  const bankDepositRounded = roundDownToStep(bankDepositRaw, 5)
  const cashAfterDeposit = round2(payload.countedCash - bankDepositRounded)
  return {
    expectedCash,
    cashDifference,
    keepInRegisterTarget,
    bankDepositRaw,
    bankDepositRounded,
    cashAfterDeposit,
  }
}

function extractComputed(metadata: unknown) {
  if (!isObj(metadata) || !isObj(metadata.computed)) return null
  const computed = metadata.computed
  return {
    orderCount: num(computed.orderCount),
    paidOrderCount: num(computed.paidOrderCount),
    unpaidOrderCount: num(computed.unpaidOrderCount),
    appOrderCount: num(computed.appOrderCount),
    appPickupOrderCount: num(computed.appPickupOrderCount),
    appDeliveryOrderCount: num(computed.appDeliveryOrderCount),
    takeawayOrderCount: num(computed.takeawayOrderCount),
    onSiteOrderCount: num(computed.onSiteOrderCount),
    terminalOrderCount: num(computed.terminalOrderCount),
    posOrderCount: num(computed.posOrderCount),
    appPickupTotal: round2(num(computed.appPickupTotal)),
    appDeliveryTotal: round2(num(computed.appDeliveryTotal)),
    takeawayTotal: round2(num(computed.takeawayTotal)),
    onSiteTotal: round2(num(computed.onSiteTotal)),
    grossTotal: round2(num(computed.grossTotal)),
    subtotalTotal: round2(num(computed.subtotalTotal)),
    deliveryFeeTotal: round2(num(computed.deliveryFeeTotal)),
    paidCashTotal: round2(num(computed.paidCashTotal)),
    paidCardTotal: round2(num(computed.paidCardTotal)),
    paidPaypalTotal: round2(num(computed.paidPaypalTotal)),
    paidKlarnaTotal: round2(num(computed.paidKlarnaTotal)),
    goodsReceiptValue: round2(num(computed.goodsReceiptValue)),
    writeOffValue: round2(num(computed.writeOffValue)),
    inventoryCorrections: round2(num(computed.inventoryCorrections)),
  }
}

function extractSettlement(metadata: unknown) {
  if (!isObj(metadata) || !isObj(metadata.settlement)) return null
  const value = metadata.settlement
  return {
    expectedCash: round2(num(value.expectedCash)),
    cashDifference: round2(num(value.cashDifference)),
    keepInRegisterTarget: round2(num(value.keepInRegisterTarget)),
    bankDepositRaw: round2(num(value.bankDepositRaw)),
    bankDepositRounded: round2(num(value.bankDepositRounded)),
    cashAfterDeposit: round2(num(value.cashAfterDeposit)),
  }
}

function extractPdfMeta(metadata: unknown) {
  if (!isObj(metadata)) return null
  const base64 = text(metadata.pdfBase64)
  if (!base64) return null
  const sha256 = text(metadata.sha256)
  const fileName = text(metadata.fileName) || 'tagesabschluss.pdf'
  const generatedAt = isObj(metadata) ? text(metadata.generatedAt) : null
  const byteLengthRaw = metadata.byteLength
  const byteLength =
    typeof byteLengthRaw === 'number' && Number.isFinite(byteLengthRaw) ? Number(byteLengthRaw) : null
  return {
    fileName,
    sha256,
    generatedAt,
    byteLength,
    pdfBase64: base64,
  }
}

type PdfSectionRow = {
  label: string
  value: string
}

function drawPdfRow(
  page: PDFPage,
  fontLabel: PDFFont,
  fontValue: PDFFont,
  y: number,
  row: PdfSectionRow
) {
  page.drawText(row.label, {
    x: 48,
    y,
    size: 10,
    font: fontLabel,
    color: rgb(0.2, 0.2, 0.24),
  })
  page.drawText(row.value, {
    x: 315,
    y,
    size: 10,
    font: fontValue,
    color: rgb(0.05, 0.05, 0.08),
  })
}

async function buildDailyClosingPdf(params: {
  tenantName: string
  closingDate: string
  payload: NonNullable<ReturnType<typeof extractPayload>>
  computed: NonNullable<ReturnType<typeof extractComputed>>
  settlementData: ReturnType<typeof settlement>
  generatedAt: Date
}) {
  const pdfDoc = await PDFDocument.create()
  const page = pdfDoc.addPage([595.28, 841.89])
  const fontRegular = await pdfDoc.embedFont(StandardFonts.Helvetica)
  const fontBold = await pdfDoc.embedFont(StandardFonts.HelveticaBold)

  let y = 802
  page.drawText('Klarando - Tagesabschluss', {
    x: 48,
    y,
    size: 19,
    font: fontBold,
    color: rgb(0.08, 0.08, 0.12),
  })
  y -= 26
  page.drawText(`Filiale: ${params.tenantName}`, {
    x: 48,
    y,
    size: 11,
    font: fontRegular,
    color: rgb(0.16, 0.16, 0.2),
  })
  y -= 15
  page.drawText(`Abschlusstag: ${formatDateDe(params.closingDate)}`, {
    x: 48,
    y,
    size: 11,
    font: fontRegular,
    color: rgb(0.16, 0.16, 0.2),
  })
  y -= 15
  page.drawText(`Erstellt am: ${formatDateTimeDe(params.generatedAt)}`, {
    x: 48,
    y,
    size: 11,
    font: fontRegular,
    color: rgb(0.16, 0.16, 0.2),
  })

  y -= 22
  page.drawLine({
    start: { x: 48, y },
    end: { x: 548, y },
    color: rgb(0.82, 0.84, 0.88),
    thickness: 1,
  })

  y -= 24
  page.drawText('Umsatz / Serviceart', {
    x: 48,
    y,
    size: 12,
    font: fontBold,
    color: rgb(0.08, 0.08, 0.12),
  })
  y -= 16
  const sectionOne: PdfSectionRow[] = [
    { label: 'Umsatz gesamt', value: moneyDe(params.computed.grossTotal) },
    { label: 'Mitnahme (Lieferung + Abholung)', value: `${moneyDe(params.computed.takeawayTotal)} (${params.computed.takeawayOrderCount} Best.)` },
    { label: 'Vor Ort', value: `${moneyDe(params.computed.onSiteTotal)} (${params.computed.onSiteOrderCount} Best.)` },
    { label: 'App Abholung', value: `${moneyDe(params.computed.appPickupTotal)} (${params.computed.appPickupOrderCount} Best.)` },
    { label: 'App Lieferung', value: `${moneyDe(params.computed.appDeliveryTotal)} (${params.computed.appDeliveryOrderCount} Best.)` },
  ]
  for (const row of sectionOne) {
    drawPdfRow(page, fontRegular, fontBold, y, row)
    y -= 14
  }

  y -= 8
  page.drawText('Zahlarten', {
    x: 48,
    y,
    size: 12,
    font: fontBold,
    color: rgb(0.08, 0.08, 0.12),
  })
  y -= 16
  const sectionTwo: PdfSectionRow[] = [
    { label: 'Bar bezahlt', value: moneyDe(params.computed.paidCashTotal) },
    { label: 'EC / Karte', value: moneyDe(params.computed.paidCardTotal) },
    { label: 'PayPal', value: moneyDe(params.computed.paidPaypalTotal) },
    { label: 'Klarna', value: moneyDe(params.computed.paidKlarnaTotal) },
    { label: 'Unbezahlt', value: String(params.computed.unpaidOrderCount) },
  ]
  for (const row of sectionTwo) {
    drawPdfRow(page, fontRegular, fontBold, y, row)
    y -= 14
  }

  y -= 8
  page.drawText('Kassenabschluss', {
    x: 48,
    y,
    size: 12,
    font: fontBold,
    color: rgb(0.08, 0.08, 0.12),
  })
  y -= 16
  const sectionThree: PdfSectionRow[] = [
    { label: 'Gezaehlter Kassenbestand', value: moneyDe(params.payload.countedCash) },
    { label: 'Barausgaben', value: moneyDe(params.payload.cashExpenses) },
    { label: 'Trinkgeld bar', value: moneyDe(params.payload.tipsCash) },
    { label: 'Trinkgeld Karte', value: moneyDe(params.payload.tipsCard) },
    { label: 'Erwarteter Kassenbestand', value: moneyDe(params.settlementData.expectedCash) },
    { label: 'Kassendifferenz', value: moneyDe(params.settlementData.cashDifference) },
    { label: 'Kassenrest (Soll)', value: moneyDe(params.settlementData.keepInRegisterTarget) },
    { label: 'Bankeinzahlung (5 EUR gerundet)', value: moneyDe(params.settlementData.bankDepositRounded) },
    { label: 'Kasse nach Einzahlung', value: moneyDe(params.settlementData.cashAfterDeposit) },
  ]
  for (const row of sectionThree) {
    drawPdfRow(page, fontRegular, fontBold, y, row)
    y -= 14
  }

  y -= 8
  page.drawText('Zaehlhilfe', {
    x: 48,
    y,
    size: 12,
    font: fontBold,
    color: rgb(0.08, 0.08, 0.12),
  })
  y -= 16

  const countSheet = params.payload.countSheet || {}
  for (const denomination of COUNT_SHEET_DENOMINATIONS) {
    const key = denomination.toFixed(2)
    const quantity = num(countSheet[key], 0)
    const amount = round2(quantity * denomination)
    drawPdfRow(page, fontRegular, fontBold, y, {
      label: `${key.replace('.', ',')} EUR x ${quantity}`,
      value: moneyDe(amount),
    })
    y -= 13
    if (y <= 80) break
  }

  y = Math.max(y - 8, 64)
  page.drawLine({
    start: { x: 48, y },
    end: { x: 548, y },
    color: rgb(0.82, 0.84, 0.88),
    thickness: 1,
  })
  y -= 14
  page.drawText('Dieser Tagesabschluss wurde final eingereicht und ist unveraenderbar gespeichert.', {
    x: 48,
    y,
    size: 9,
    font: fontRegular,
    color: rgb(0.34, 0.34, 0.4),
  })
  y -= 12
  page.drawText(`Notiz: ${params.payload.note || '-'}`, {
    x: 48,
    y,
    size: 9,
    font: fontRegular,
    color: rgb(0.34, 0.34, 0.4),
  })

  const bytes = await pdfDoc.save()
  const sha256 = createHash('sha256').update(bytes).digest('hex')
  const fileName = `Tagesabschluss_${sanitizeFileName(params.tenantName)}_${params.closingDate}.pdf`
  return {
    fileName,
    sha256,
    bytes: Buffer.from(bytes),
    byteLength: bytes.length,
  }
}

async function loadDailyPdfAudit(tenantId: string, submissionId: string) {
  const logs = await prisma.auditLog.findMany({
    where: { module: MODULE, tenantId, action: A_DAILY_PDF },
    select: { id: true, metadata: true, createdAt: true },
    orderBy: [{ createdAt: 'asc' }],
  })
  const matches = logs.filter((entry) => extractSubmissionId(entry.metadata) === submissionId)
  return matches[matches.length - 1] || null
}

async function loadDailyState(tenantId: string, closingDate: string) {
  const logs = await prisma.auditLog.findMany({
    where: { module: MODULE, tenantId, action: { in: [A_DRAFT, A_SUBMIT, A_DAILY_REVIEW, A_REOPEN_REQUEST, A_REOPEN_REVIEW] } },
    select: { id: true, action: true, metadata: true, createdAt: true },
    orderBy: [{ createdAt: 'asc' }],
  })

  const drafts = logs.filter((log) => log.action === A_DRAFT && extractDate(log.metadata) === closingDate)
  const submits = logs.filter((log) => log.action === A_SUBMIT && extractDate(log.metadata) === closingDate)
  const draft = drafts[drafts.length - 1] || null
  const submission = submits[submits.length - 1] || null

  const reviews = submission
    ? logs.filter((log) => log.action === A_DAILY_REVIEW && extractSubmissionId(log.metadata) === submission.id)
    : []
  const reopenRequests = submission
    ? logs.filter((log) => log.action === A_REOPEN_REQUEST && extractSubmissionId(log.metadata) === submission.id)
    : []
  const reopenReviews = submission
    ? logs.filter((log) => log.action === A_REOPEN_REVIEW && extractSubmissionId(log.metadata) === submission.id)
    : []

  const review = reviews[reviews.length - 1] || null
  const reopenRequest = reopenRequests[reopenRequests.length - 1] || null
  const reopenReview = reopenReviews[reopenReviews.length - 1] || null

  let status: 'OPEN' | 'SUBMITTED' | 'APPROVED' | 'RETURNED' | 'REOPEN_REQUESTED' | 'REOPENED' = draft ? 'OPEN' : 'OPEN'
  if (submission) {
    status = 'SUBMITTED'
    const decision = review ? extractDecision(review.metadata) : null
    if (decision === 'RETURNED') status = 'RETURNED'
    if (decision === 'APPROVED') {
      status = 'APPROVED'
      if (reopenRequest && (!reopenReview || reopenReview.createdAt.getTime() < reopenRequest.createdAt.getTime())) {
        status = 'REOPEN_REQUESTED'
      } else if (reopenReview && extractReopenDecision(reopenReview.metadata) === 'APPROVED' && review && reopenReview.createdAt.getTime() > review.createdAt.getTime()) {
        status = 'REOPENED'
      }
    }
  }

  const canSubmit = !submission || status === 'RETURNED' || status === 'REOPENED'

  return {
    draft,
    submission,
    review,
    reopenRequest,
    reopenReview,
    status,
    canSubmit,
    canRequestReopen: status === 'APPROVED',
  }
}

router.get('/admin/daily', async (req, res) => {
  try {
    await ensureRead(req)
    const date = isoDate(req.query.date)
    if (!date) return res.status(400).json({ error: 'Gueltiges Datum (YYYY-MM-DD) fehlt' })

    const tenant = await resolveTenant(req, text(req.query.tenantId), true)
    const computed = await dailyComputed(tenant.id, date)
    const state = await loadDailyState(tenant.id, date)
    const payload = extractPayload(state.draft?.metadata || state.submission?.metadata || null)
    const pdfEntry = state.submission ? await loadDailyPdfAudit(tenant.id, state.submission.id) : null
    const pdfMeta = pdfEntry ? extractPdfMeta(pdfEntry.metadata) : null

    return res.json({
      tenantId: tenant.id,
      tenantName: tenant.name,
      chainId: tenant.chainId,
      closingDate: date,
      computed,
      payload,
      settlement: payload ? settlement(payload, computed) : null,
      status: state.status,
      canSubmit: state.canSubmit,
      canRequestReopen: state.canRequestReopen,
      draft: state.draft
        ? { id: state.draft.id, createdAt: state.draft.createdAt.toISOString() }
        : null,
      submission: state.submission
        ? { id: state.submission.id, createdAt: state.submission.createdAt.toISOString() }
        : null,
      review: state.review
        ? {
            id: state.review.id,
            createdAt: state.review.createdAt.toISOString(),
            decision: extractDecision(state.review.metadata),
            note: isObj(state.review.metadata) ? text(state.review.metadata.note) : null,
          }
        : null,
      reopenRequest: state.reopenRequest
        ? {
            id: state.reopenRequest.id,
            createdAt: state.reopenRequest.createdAt.toISOString(),
            reason: isObj(state.reopenRequest.metadata) ? text(state.reopenRequest.metadata.reason) : null,
          }
        : null,
      reopenReview: state.reopenReview
        ? {
            id: state.reopenReview.id,
            createdAt: state.reopenReview.createdAt.toISOString(),
            decision: extractReopenDecision(state.reopenReview.metadata),
            note: isObj(state.reopenReview.metadata) ? text(state.reopenReview.metadata.note) : null,
          }
        : null,
      dailyPdf:
        pdfEntry && pdfMeta
          ? {
              id: pdfEntry.id,
              createdAt: pdfEntry.createdAt.toISOString(),
              generatedAt: pdfMeta.generatedAt,
              fileName: pdfMeta.fileName,
              sha256: pdfMeta.sha256,
              byteLength: pdfMeta.byteLength,
            }
          : null,
    })
  } catch (error) {
    if (error instanceof HttpError) return res.status(error.status).json({ error: error.message })
    console.error('GET CASH CLOSING DAILY ERROR:', error)
    return res.status(500).json({ error: 'Tagesabschluss konnte nicht geladen werden' })
  }
})

router.put('/admin/daily', async (req, res) => {
  try {
    await ensureWrite(req)
    const body = req.body as {
      tenantId?: string
      date?: string
      countedCash?: number | string
      cashExpenses?: number | string
      tipsCash?: number | string
      tipsCard?: number | string
      keepInRegisterTarget?: number | string | null
      countSheet?: Record<string, unknown> | null
      note?: string | null
      submit?: boolean
    }

    const date = isoDate(body.date)
    if (!date) return res.status(400).json({ error: 'Gueltiges Datum (YYYY-MM-DD) fehlt' })
    const tenant = await resolveTenant(req, text(body.tenantId), true)
    const countedCash = money(body.countedCash)
    const cashExpenses = money(body.cashExpenses, 0)
    const tipsCash = money(body.tipsCash, 0)
    const tipsCard = money(body.tipsCard, 0)
    const keepInRegisterTargetRaw =
      body.keepInRegisterTarget === null || body.keepInRegisterTarget === undefined || body.keepInRegisterTarget === ''
        ? null
        : money(body.keepInRegisterTarget, 0)
    const countSheetRaw = body.countSheet === null || body.countSheet === undefined ? null : parseCountSheet(body.countSheet)
    if (countedCash === null || cashExpenses === null || tipsCash === null || tipsCard === null) {
      return res.status(400).json({ error: 'Betragsfelder sind ungueltig' })
    }
    if (keepInRegisterTargetRaw === null && body.keepInRegisterTarget !== null && body.keepInRegisterTarget !== undefined && body.keepInRegisterTarget !== '') {
      return res.status(400).json({ error: 'Kassenrest-Soll ist ungueltig' })
    }
    if (countSheetRaw === null && body.countSheet !== null && body.countSheet !== undefined) {
      return res.status(400).json({ error: 'Zaehlhilfe ist ungueltig' })
    }

    const computed = await dailyComputed(tenant.id, date)
    const payload = {
      countedCash,
      cashExpenses,
      tipsCash,
      tipsCard,
      keepInRegisterTarget: keepInRegisterTargetRaw,
      countSheet: countSheetRaw,
      note: text(body.note),
    }
    const current = await loadDailyState(tenant.id, date)
    const submit = Boolean(body.submit)
    if (!submit && current.submission && !current.canSubmit) {
      return res.status(409).json({
        error: 'Tagesabschluss wurde bereits eingereicht und ist bis zur Freigabe gesperrt',
      })
    }
    if (submit && !current.canSubmit) {
      return res.status(409).json({
        error:
          current.status === 'REOPEN_REQUESTED'
            ? 'Wiedereroeffnung ist bereits angefragt'
            : 'Tagesabschluss ist final freigegeben',
      })
    }

    const settlementData = settlement(payload, computed)
    const actor = req.authUser
    const actorEmail = actor?.email || req.header('x-user-email') || null

    let saved: { id: string; action: string }
    if (submit) {
      const generatedAt = new Date()
      const pdf = await buildDailyClosingPdf({
        tenantName: tenant.name,
        closingDate: date,
        payload,
        computed,
        settlementData,
        generatedAt,
      })

      const submission = await prisma.$transaction(async (tx) => {
        const submissionEntry = await tx.auditLog.create({
          data: {
            actorUserId: actor?.id || null,
            actorEmail,
            actorRole: actor?.role || null,
            chainId: tenant.chainId,
            tenantId: tenant.id,
            module: MODULE,
            action: A_SUBMIT,
            targetType: 'daily_closing',
            targetId: `${tenant.id}:${date}`,
            metadata: {
              closingDate: date,
              payload,
              computed,
              settlement: settlementData,
              tenantName: tenant.name,
            } as Prisma.InputJsonObject,
          },
          select: { id: true },
        })

        await tx.auditLog.create({
          data: {
            actorUserId: actor?.id || null,
            actorEmail,
            actorRole: actor?.role || null,
            chainId: tenant.chainId,
            tenantId: tenant.id,
            module: MODULE,
            action: A_DAILY_PDF,
            targetType: 'daily_closing_pdf',
            targetId: submissionEntry.id,
            metadata: {
              submissionId: submissionEntry.id,
              closingDate: date,
              tenantName: tenant.name,
              generatedAt: generatedAt.toISOString(),
              fileName: pdf.fileName,
              sha256: pdf.sha256,
              byteLength: pdf.byteLength,
              immutable: true,
              pdfBase64: pdf.bytes.toString('base64'),
            } as Prisma.InputJsonObject,
          },
        })

        return submissionEntry
      })
      saved = { id: submission.id, action: A_SUBMIT }
    } else {
      const draft = await createAudit({
        req,
        action: A_DRAFT,
        tenantId: tenant.id,
        chainId: tenant.chainId,
        targetType: 'daily_closing',
        targetId: `${tenant.id}:${date}`,
        metadata: {
          closingDate: date,
          payload,
          computed,
          settlement: settlementData,
          tenantName: tenant.name,
        },
      })
      saved = { id: draft.id, action: A_DRAFT }
    }

    return res.status(submit ? 201 : 200).json({
      ok: true,
      entryId: saved.id,
      action: saved.action,
    })
  } catch (error) {
    if (error instanceof HttpError) return res.status(error.status).json({ error: error.message })
    console.error('PUT CASH CLOSING DAILY ERROR:', error)
    return res.status(500).json({ error: 'Tagesabschluss konnte nicht gespeichert werden' })
  }
})

router.get('/admin/daily/pdf', async (req, res) => {
  try {
    await ensureRead(req)
    const date = isoDate(req.query.date)
    if (!date) return res.status(400).json({ error: 'Gueltiges Datum (YYYY-MM-DD) fehlt' })

    const tenant = await resolveTenant(req, text(req.query.tenantId), true)
    const state = await loadDailyState(tenant.id, date)
    if (!state.submission) {
      return res.status(404).json({ error: 'Kein eingereichter Tagesabschluss gefunden' })
    }

    const existingPdf = await loadDailyPdfAudit(tenant.id, state.submission.id)
    const existingMeta = existingPdf ? extractPdfMeta(existingPdf.metadata) : null
    if (existingMeta) {
      const binary = decodeBase64(existingMeta.pdfBase64)
      if (binary) {
        res.setHeader('Content-Type', 'application/pdf')
        res.setHeader('Content-Disposition', `attachment; filename="${existingMeta.fileName}"`)
        res.setHeader('Cache-Control', 'no-store')
        return res.send(binary)
      }
    }

    const payload = extractPayload(state.submission.metadata)
    const computed = extractComputed(state.submission.metadata)
    if (!payload || !computed) {
      return res.status(409).json({ error: 'Abschlussdaten sind unvollstaendig und koennen nicht als PDF erzeugt werden' })
    }
    const settlementData = extractSettlement(state.submission.metadata) || settlement(payload, computed)
    const generatedAt = new Date()
    const pdf = await buildDailyClosingPdf({
      tenantName: tenant.name,
      closingDate: date,
      payload,
      computed,
      settlementData,
      generatedAt,
    })

    await createAudit({
      req,
      action: A_DAILY_PDF,
      tenantId: tenant.id,
      chainId: tenant.chainId,
      targetType: 'daily_closing_pdf',
      targetId: state.submission.id,
      metadata: {
        submissionId: state.submission.id,
        closingDate: date,
        tenantName: tenant.name,
        generatedAt: generatedAt.toISOString(),
        fileName: pdf.fileName,
        sha256: pdf.sha256,
        byteLength: pdf.byteLength,
        immutable: true,
        pdfBase64: pdf.bytes.toString('base64'),
      },
    })

    res.setHeader('Content-Type', 'application/pdf')
    res.setHeader('Content-Disposition', `attachment; filename="${pdf.fileName}"`)
    res.setHeader('Cache-Control', 'no-store')
    return res.send(pdf.bytes)
  } catch (error) {
    if (error instanceof HttpError) return res.status(error.status).json({ error: error.message })
    console.error('GET CASH CLOSING DAILY PDF ERROR:', error)
    return res.status(500).json({ error: 'Tagesabschluss-PDF konnte nicht erstellt werden' })
  }
})

router.post('/admin/daily/reopen-request', async (req, res) => {
  try {
    await ensureWrite(req)
    const body = req.body as { tenantId?: string; date?: string; reason?: string | null }
    const date = isoDate(body.date)
    if (!date) return res.status(400).json({ error: 'Gueltiges Datum (YYYY-MM-DD) fehlt' })
    const tenant = await resolveTenant(req, text(body.tenantId), true)
    const current = await loadDailyState(tenant.id, date)
    if (!current.submission?.id) return res.status(409).json({ error: 'Keine Einreichung gefunden' })
    if (!current.canRequestReopen) {
      return res.status(409).json({ error: 'Wiedereroeffnung ist aktuell nicht moeglich' })
    }

    const entry = await createAudit({
      req,
      action: A_REOPEN_REQUEST,
      tenantId: tenant.id,
      chainId: tenant.chainId,
      targetType: 'daily_closing_submission',
      targetId: current.submission.id,
      metadata: {
        submissionId: current.submission.id,
        closingDate: date,
        reason: text(body.reason),
        tenantName: tenant.name,
      },
    })

    return res.status(201).json({ ok: true, requestId: entry.id, submissionId: current.submission.id })
  } catch (error) {
    if (error instanceof HttpError) return res.status(error.status).json({ error: error.message })
    console.error('POST CASH CLOSING REOPEN REQUEST ERROR:', error)
    return res.status(500).json({ error: 'Wiedereroeffnung konnte nicht angefragt werden' })
  }
})

router.get('/admin/monthly', async (req, res) => {
  try {
    await ensureRead(req)
    const month = isoMonth(req.query.month)
    if (!month) return res.status(400).json({ error: 'Gueltiger Monat (YYYY-MM) fehlt' })
    const tenant = await resolveTenant(req, text(req.query.tenantId), true)
    const { from, to } = monthRange(month)

    const [orders, logs] = await Promise.all([
      prisma.order.findMany({
        where: { tenantId: tenant.id, createdAt: { gte: from, lte: to } },
        select: { total: true, subtotal: true, deliveryFee: true, paymentStatus: true, paymentMethod: true, sourceChannel: true },
      }),
      prisma.auditLog.findMany({
        where: { module: MODULE, tenantId: tenant.id, action: { in: [A_SUBMIT, A_DAILY_REVIEW, A_MONTHLY_SUBMIT, A_MONTHLY_REVIEW] } },
        select: { id: true, action: true, metadata: true, createdAt: true },
        orderBy: [{ createdAt: 'asc' }],
      }),
    ])

    const grossTotal = round2(orders.reduce((sum, row) => sum + Number(row.total || 0), 0))
    const subtotalTotal = round2(orders.reduce((sum, row) => sum + Number(row.subtotal || 0), 0))
    const deliveryFeeTotal = round2(orders.reduce((sum, row) => sum + Number(row.deliveryFee || 0), 0))
    const paidCashTotal = round2(
      orders
        .filter((row) => row.paymentStatus === 'PAID' && (row.paymentMethod || '').toUpperCase() === 'CASH')
        .reduce((sum, row) => sum + Number(row.total || 0), 0)
    )

    const dailySubmissions = logs.filter((entry) => entry.action === A_SUBMIT && extractDate(entry.metadata)?.startsWith(`${month}-`))
    const byDate = new Map<string, { id: string; createdAt: Date }>()
    for (const entry of dailySubmissions) {
      const date = extractDate(entry.metadata)
      if (!date) continue
      const existing = byDate.get(date)
      if (!existing || existing.createdAt.getTime() <= entry.createdAt.getTime()) {
        byDate.set(date, { id: entry.id, createdAt: entry.createdAt })
      }
    }

    const dailyReviews = logs.filter((entry) => entry.action === A_DAILY_REVIEW)
    const reviewBySubmission = new Map<string, { id: string; decision: string | null; createdAt: Date }>()
    for (const entry of dailyReviews) {
      const submissionId = extractSubmissionId(entry.metadata)
      if (!submissionId) continue
      const existing = reviewBySubmission.get(submissionId)
      if (!existing || existing.createdAt.getTime() <= entry.createdAt.getTime()) {
        reviewBySubmission.set(submissionId, {
          id: entry.id,
          decision: extractDecision(entry.metadata),
          createdAt: entry.createdAt,
        })
      }
    }

    const days = Array.from(byDate.entries())
      .map(([closingDate, submission]) => {
        const review = reviewBySubmission.get(submission.id)
        return {
          closingDate,
          submissionId: submission.id,
          submittedAt: submission.createdAt.toISOString(),
          status: review?.decision === 'APPROVED' ? 'APPROVED' : review?.decision === 'RETURNED' ? 'RETURNED' : 'SUBMITTED',
          review: review ? { id: review.id, decision: review.decision, createdAt: review.createdAt.toISOString() } : null,
        }
      })
      .sort((a, b) => a.closingDate.localeCompare(b.closingDate))

    const monthlySubmissions = logs.filter((entry) => entry.action === A_MONTHLY_SUBMIT && extractMonth(entry.metadata) === month)
    const monthlySubmission = monthlySubmissions[monthlySubmissions.length - 1] || null
    const monthlyReviews = monthlySubmission
      ? logs.filter((entry) => entry.action === A_MONTHLY_REVIEW && extractSubmissionId(entry.metadata) === monthlySubmission.id)
      : []
    const monthlyReview = monthlyReviews[monthlyReviews.length - 1] || null
    const status = monthlySubmission
      ? monthlyReview
        ? extractDecision(monthlyReview.metadata) === 'APPROVED'
          ? 'APPROVED'
          : 'RETURNED'
        : 'SUBMITTED'
      : 'OPEN'

    return res.json({
      tenantId: tenant.id,
      tenantName: tenant.name,
      chainId: tenant.chainId,
      month,
      totals: {
        orderCount: orders.length,
        grossTotal,
        subtotalTotal,
        deliveryFeeTotal,
        paidCashTotal,
      },
      days,
      monthlySubmission: monthlySubmission
        ? { id: monthlySubmission.id, createdAt: monthlySubmission.createdAt.toISOString() }
        : null,
      monthlyReview: monthlyReview
        ? {
            id: monthlyReview.id,
            createdAt: monthlyReview.createdAt.toISOString(),
            decision: extractDecision(monthlyReview.metadata),
            note: isObj(monthlyReview.metadata) ? text(monthlyReview.metadata.note) : null,
          }
        : null,
      status,
      canSubmit: status !== 'APPROVED',
    })
  } catch (error) {
    if (error instanceof HttpError) return res.status(error.status).json({ error: error.message })
    console.error('GET CASH CLOSING MONTHLY ERROR:', error)
    return res.status(500).json({ error: 'Monatsabschluss konnte nicht geladen werden' })
  }
})

router.post('/admin/monthly/submit', async (req, res) => {
  try {
    await ensureWrite(req)
    const body = req.body as { tenantId?: string; month?: string; note?: string | null; totals?: Record<string, unknown>; dayCount?: number }
    const month = isoMonth(body.month)
    if (!month) return res.status(400).json({ error: 'Gueltiger Monat (YYYY-MM) fehlt' })
    const tenant = await resolveTenant(req, text(body.tenantId), true)

    const entry = await createAudit({
      req,
      action: A_MONTHLY_SUBMIT,
      tenantId: tenant.id,
      chainId: tenant.chainId,
      targetType: 'monthly_closing',
      targetId: `${tenant.id}:${month}`,
      metadata: {
        month,
        note: text(body.note),
        dayCount: Number.isFinite(Number(body.dayCount)) ? Number(body.dayCount) : 0,
        totals: isObj(body.totals) ? body.totals : {},
        tenantName: tenant.name,
      },
    })

    return res.status(201).json({ ok: true, submissionId: entry.id, month, tenantId: tenant.id })
  } catch (error) {
    if (error instanceof HttpError) return res.status(error.status).json({ error: error.message })
    console.error('POST CASH CLOSING MONTHLY SUBMIT ERROR:', error)
    return res.status(500).json({ error: 'Monatsabschluss konnte nicht eingereicht werden' })
  }
})

async function resolveChainVisibleTenantIds(req: Request, requestedTenantId: string | null, requestedChainId: string | null) {
  const actor = req.authUser
  if (!actor) throw new HttpError(401, 'Nicht eingeloggt')
  if (actor.role !== UserRole.CHAINADMIN && actor.role !== UserRole.SUPERADMIN) {
    throw new HttpError(403, 'Nur CHAINADMIN oder SUPERADMIN erlaubt')
  }

  if (actor.role === UserRole.SUPERADMIN) {
    const where: Record<string, unknown> = {}
    if (requestedChainId) where.chainId = requestedChainId
    if (requestedTenantId) where.id = requestedTenantId
    const tenants = await prisma.tenant.findMany({ where, select: { id: true } })
    return tenants.map((entry) => entry.id)
  }

  if (!actor.chainId) return [] as string[]
  if (requestedChainId && requestedChainId !== actor.chainId) return [] as string[]
  const grants = await prisma.chainAdminTenantAccess.findMany({
    where: { chainAdminUserId: actor.id, superadminGranted: true, tenant: { chainId: actor.chainId } },
    select: { tenantId: true },
  })
  const tenantIds = grants.map((entry) => entry.tenantId)
  if (requestedTenantId && !tenantIds.includes(requestedTenantId)) return [] as string[]
  return requestedTenantId ? [requestedTenantId] : tenantIds
}

router.get('/chainadmin/queue', async (req, res) => {
  try {
    await ensureRead(req)
    const month = isoMonth(req.query.month)
    if (!month) return res.status(400).json({ error: 'Gueltiger Monat (YYYY-MM) fehlt' })
    const tenantIds = await resolveChainVisibleTenantIds(req, text(req.query.tenantId), text(req.query.chainId))
    if (tenantIds.length === 0) {
      return res.json({ month, pendingDaily: [], pendingReopenRequests: [], pendingMonthly: [] })
    }

    const [tenants, logs] = await Promise.all([
      prisma.tenant.findMany({ where: { id: { in: tenantIds } }, select: { id: true, name: true } }),
      prisma.auditLog.findMany({
        where: {
          module: MODULE,
          tenantId: { in: tenantIds },
          action: { in: [A_SUBMIT, A_DAILY_REVIEW, A_REOPEN_REQUEST, A_REOPEN_REVIEW, A_MONTHLY_SUBMIT, A_MONTHLY_REVIEW] },
        },
        select: { id: true, tenantId: true, action: true, metadata: true, createdAt: true },
        orderBy: [{ createdAt: 'asc' }],
      }),
    ])

    const tenantNameById = new Map(tenants.map((entry) => [entry.id, entry.name]))
    const latestDailyByKey = new Map<string, { id: string; tenantId: string; date: string; createdAt: Date; metadata: unknown }>()
    const reviewBySubmission = new Map<string, { id: string; createdAt: Date; decision: string | null }>()
    const reopenRequestBySubmission = new Map<string, { id: string; createdAt: Date; reason: string | null; date: string | null }>()
    const reopenReviewBySubmission = new Map<string, { id: string; createdAt: Date; decision: string | null }>()
    const latestMonthlyByKey = new Map<string, { id: string; tenantId: string; month: string; createdAt: Date; metadata: unknown }>()
    const monthlyReviewBySubmission = new Map<string, { id: string; createdAt: Date; decision: string | null }>()

    for (const log of logs) {
      if (log.action === A_SUBMIT) {
        const date = extractDate(log.metadata)
        if (!date || !date.startsWith(`${month}-`) || !log.tenantId) continue
        const key = `${log.tenantId}:${date}`
        const existing = latestDailyByKey.get(key)
        if (!existing || existing.createdAt.getTime() <= log.createdAt.getTime()) {
          latestDailyByKey.set(key, { id: log.id, tenantId: log.tenantId, date, createdAt: log.createdAt, metadata: log.metadata })
        }
        continue
      }
      if (log.action === A_DAILY_REVIEW) {
        const submissionId = extractSubmissionId(log.metadata)
        if (!submissionId) continue
        const existing = reviewBySubmission.get(submissionId)
        if (!existing || existing.createdAt.getTime() <= log.createdAt.getTime()) {
          reviewBySubmission.set(submissionId, { id: log.id, createdAt: log.createdAt, decision: extractDecision(log.metadata) })
        }
        continue
      }
      if (log.action === A_REOPEN_REQUEST) {
        const submissionId = extractSubmissionId(log.metadata)
        if (!submissionId) continue
        const requestDate = extractDate(log.metadata)
        if (!requestDate || !requestDate.startsWith(`${month}-`)) continue
        const existing = reopenRequestBySubmission.get(submissionId)
        if (!existing || existing.createdAt.getTime() <= log.createdAt.getTime()) {
          reopenRequestBySubmission.set(submissionId, {
            id: log.id,
            createdAt: log.createdAt,
            reason: isObj(log.metadata) ? text(log.metadata.reason) : null,
            date: requestDate,
          })
        }
        continue
      }
      if (log.action === A_REOPEN_REVIEW) {
        const submissionId = extractSubmissionId(log.metadata)
        if (!submissionId) continue
        const existing = reopenReviewBySubmission.get(submissionId)
        if (!existing || existing.createdAt.getTime() <= log.createdAt.getTime()) {
          reopenReviewBySubmission.set(submissionId, {
            id: log.id,
            createdAt: log.createdAt,
            decision: extractReopenDecision(log.metadata),
          })
        }
        continue
      }
      if (log.action === A_MONTHLY_SUBMIT) {
        const currentMonth = extractMonth(log.metadata)
        if (!currentMonth || currentMonth !== month || !log.tenantId) continue
        const key = `${log.tenantId}:${currentMonth}`
        const existing = latestMonthlyByKey.get(key)
        if (!existing || existing.createdAt.getTime() <= log.createdAt.getTime()) {
          latestMonthlyByKey.set(key, { id: log.id, tenantId: log.tenantId, month: currentMonth, createdAt: log.createdAt, metadata: log.metadata })
        }
        continue
      }
      if (log.action === A_MONTHLY_REVIEW) {
        const submissionId = extractSubmissionId(log.metadata)
        if (!submissionId) continue
        const existing = monthlyReviewBySubmission.get(submissionId)
        if (!existing || existing.createdAt.getTime() <= log.createdAt.getTime()) {
          monthlyReviewBySubmission.set(submissionId, { id: log.id, createdAt: log.createdAt, decision: extractDecision(log.metadata) })
        }
      }
    }

    const pendingDaily = Array.from(latestDailyByKey.values())
      .filter((submission) => !reviewBySubmission.has(submission.id))
      .map((submission) => {
        const payload = extractPayload(submission.metadata)
        const computed = isObj(submission.metadata) && isObj(submission.metadata.computed) ? submission.metadata.computed : null
        return {
          submissionId: submission.id,
          tenantId: submission.tenantId,
          tenantName: tenantNameById.get(submission.tenantId) || submission.tenantId,
          closingDate: submission.date,
          submittedAt: submission.createdAt.toISOString(),
          payload,
          computed,
        }
      })
      .sort((a, b) => b.submittedAt.localeCompare(a.submittedAt))

    const pendingReopenRequests = Array.from(reopenRequestBySubmission.entries())
      .filter(([submissionId, request]) => {
        const review = reopenReviewBySubmission.get(submissionId)
        return !review || review.createdAt.getTime() < request.createdAt.getTime()
      })
      .map(([submissionId, request]) => {
        const submission = Array.from(latestDailyByKey.values()).find((entry) => entry.id === submissionId)
        return {
          requestId: request.id,
          submissionId,
          tenantId: submission?.tenantId || null,
          tenantName: submission ? tenantNameById.get(submission.tenantId) || submission.tenantId : null,
          closingDate: request.date || submission?.date || null,
          reason: request.reason,
          requestedAt: request.createdAt.toISOString(),
        }
      })
      .sort((a, b) => b.requestedAt.localeCompare(a.requestedAt))

    const pendingMonthly = Array.from(latestMonthlyByKey.values())
      .filter((submission) => !monthlyReviewBySubmission.has(submission.id))
      .map((submission) => ({
        submissionId: submission.id,
        tenantId: submission.tenantId,
        tenantName: tenantNameById.get(submission.tenantId) || submission.tenantId,
        month: submission.month,
        submittedAt: submission.createdAt.toISOString(),
        note: isObj(submission.metadata) ? text(submission.metadata.note) : null,
        dayCount: isObj(submission.metadata) && Number.isFinite(Number(submission.metadata.dayCount)) ? Number(submission.metadata.dayCount) : 0,
        totals: isObj(submission.metadata) && isObj(submission.metadata.totals) ? submission.metadata.totals : null,
      }))
      .sort((a, b) => b.submittedAt.localeCompare(a.submittedAt))

    return res.json({ month, pendingDaily, pendingReopenRequests, pendingMonthly })
  } catch (error) {
    if (error instanceof HttpError) return res.status(error.status).json({ error: error.message })
    console.error('GET CHAINADMIN CASH CLOSING QUEUE ERROR:', error)
    return res.status(500).json({ error: 'Abschluss-Queue konnte nicht geladen werden' })
  }
})

router.post('/chainadmin/review/daily', async (req, res) => {
  try {
    await ensureWrite(req)
    const actor = req.authUser
    if (!actor || (actor.role !== UserRole.CHAINADMIN && actor.role !== UserRole.SUPERADMIN)) {
      return res.status(403).json({ error: 'Nur CHAINADMIN oder SUPERADMIN erlaubt' })
    }
    const body = req.body as { submissionId?: string; decision?: 'APPROVED' | 'RETURNED'; note?: string | null }
    const submissionId = text(body.submissionId)
    if (!submissionId) return res.status(400).json({ error: 'submissionId fehlt' })
    if (body.decision !== 'APPROVED' && body.decision !== 'RETURNED') {
      return res.status(400).json({ error: 'decision muss APPROVED oder RETURNED sein' })
    }

    const submission = await prisma.auditLog.findFirst({
      where: { id: submissionId, module: MODULE, action: A_SUBMIT },
      select: { id: true, tenantId: true, chainId: true, metadata: true },
    })
    if (!submission || !submission.tenantId) return res.status(404).json({ error: 'Einreichung nicht gefunden' })

    const visible = await resolveChainVisibleTenantIds(req, submission.tenantId, actor.role === UserRole.CHAINADMIN ? actor.chainId : null)
    if (!visible.includes(submission.tenantId)) return res.status(403).json({ error: 'Keine Berechtigung fuer diese Filiale' })

    const review = await createAudit({
      req,
      action: A_DAILY_REVIEW,
      tenantId: submission.tenantId,
      chainId: submission.chainId,
      targetType: 'daily_closing_submission',
      targetId: submission.id,
      metadata: { submissionId: submission.id, closingDate: extractDate(submission.metadata), decision: body.decision, note: text(body.note) },
    })
    return res.status(201).json({ ok: true, reviewId: review.id, submissionId: submission.id, decision: body.decision })
  } catch (error) {
    if (error instanceof HttpError) return res.status(error.status).json({ error: error.message })
    console.error('POST CHAINADMIN DAILY REVIEW ERROR:', error)
    return res.status(500).json({ error: 'Tagesabschluss konnte nicht bewertet werden' })
  }
})

router.post('/chainadmin/review/reopen', async (req, res) => {
  try {
    await ensureWrite(req)
    const actor = req.authUser
    if (!actor || (actor.role !== UserRole.CHAINADMIN && actor.role !== UserRole.SUPERADMIN)) {
      return res.status(403).json({ error: 'Nur CHAINADMIN oder SUPERADMIN erlaubt' })
    }
    const body = req.body as { requestId?: string; decision?: 'APPROVED' | 'REJECTED'; note?: string | null }
    const requestId = text(body.requestId)
    if (!requestId) return res.status(400).json({ error: 'requestId fehlt' })
    if (body.decision !== 'APPROVED' && body.decision !== 'REJECTED') {
      return res.status(400).json({ error: 'decision muss APPROVED oder REJECTED sein' })
    }

    const requestEntry = await prisma.auditLog.findFirst({
      where: { id: requestId, module: MODULE, action: A_REOPEN_REQUEST },
      select: { id: true, tenantId: true, chainId: true, metadata: true },
    })
    if (!requestEntry || !requestEntry.tenantId) return res.status(404).json({ error: 'Anfrage nicht gefunden' })
    const submissionId = extractSubmissionId(requestEntry.metadata)
    if (!submissionId) return res.status(400).json({ error: 'Anfrage ist unvollstaendig' })

    const visible = await resolveChainVisibleTenantIds(req, requestEntry.tenantId, actor.role === UserRole.CHAINADMIN ? actor.chainId : null)
    if (!visible.includes(requestEntry.tenantId)) return res.status(403).json({ error: 'Keine Berechtigung fuer diese Filiale' })

    const review = await createAudit({
      req,
      action: A_REOPEN_REVIEW,
      tenantId: requestEntry.tenantId,
      chainId: requestEntry.chainId,
      targetType: 'daily_closing_reopen_request',
      targetId: requestEntry.id,
      metadata: { requestId: requestEntry.id, submissionId, closingDate: extractDate(requestEntry.metadata), decision: body.decision, note: text(body.note) },
    })
    return res.status(201).json({ ok: true, reviewId: review.id, requestId: requestEntry.id, submissionId, decision: body.decision })
  } catch (error) {
    if (error instanceof HttpError) return res.status(error.status).json({ error: error.message })
    console.error('POST CHAINADMIN REOPEN REVIEW ERROR:', error)
    return res.status(500).json({ error: 'Wiedereroeffnung konnte nicht bewertet werden' })
  }
})

router.post('/chainadmin/review/monthly', async (req, res) => {
  try {
    await ensureWrite(req)
    const actor = req.authUser
    if (!actor || (actor.role !== UserRole.CHAINADMIN && actor.role !== UserRole.SUPERADMIN)) {
      return res.status(403).json({ error: 'Nur CHAINADMIN oder SUPERADMIN erlaubt' })
    }
    const body = req.body as { submissionId?: string; decision?: 'APPROVED' | 'RETURNED'; note?: string | null }
    const submissionId = text(body.submissionId)
    if (!submissionId) return res.status(400).json({ error: 'submissionId fehlt' })
    if (body.decision !== 'APPROVED' && body.decision !== 'RETURNED') {
      return res.status(400).json({ error: 'decision muss APPROVED oder RETURNED sein' })
    }

    const submission = await prisma.auditLog.findFirst({
      where: { id: submissionId, module: MODULE, action: A_MONTHLY_SUBMIT },
      select: { id: true, tenantId: true, chainId: true, metadata: true },
    })
    if (!submission || !submission.tenantId) return res.status(404).json({ error: 'Monatsabschluss nicht gefunden' })

    const visible = await resolveChainVisibleTenantIds(req, submission.tenantId, actor.role === UserRole.CHAINADMIN ? actor.chainId : null)
    if (!visible.includes(submission.tenantId)) return res.status(403).json({ error: 'Keine Berechtigung fuer diese Filiale' })

    const review = await createAudit({
      req,
      action: A_MONTHLY_REVIEW,
      tenantId: submission.tenantId,
      chainId: submission.chainId,
      targetType: 'monthly_closing_submission',
      targetId: submission.id,
      metadata: { submissionId: submission.id, month: extractMonth(submission.metadata), decision: body.decision, note: text(body.note) },
    })
    return res.status(201).json({ ok: true, reviewId: review.id, submissionId: submission.id, decision: body.decision })
  } catch (error) {
    if (error instanceof HttpError) return res.status(error.status).json({ error: error.message })
    console.error('POST CHAINADMIN MONTHLY REVIEW ERROR:', error)
    return res.status(500).json({ error: 'Monatsabschluss konnte nicht bewertet werden' })
  }
})

export default router
