import { BillingPeriodType, BillingPlanType, InvoiceRecipientType, Prisma, type InvoiceStatus, type UserRole } from '@prisma/client'
import crypto from 'node:crypto'
import { prisma } from './prisma'
import { calculateBillingUsageSnapshot } from './feature-modules'

export type BillingMonthPeriod = {
  key: string
  periodStart: Date
  periodEnd: Date
}

export type TenantBillingCalculation = {
  month: string
  tenantId: string
  tenantName: string
  chainId: string | null
  chainName: string | null
  planType: BillingPlanType
  monthlyFeeCents: number
  includedOrders: number
  totalOrders: number
  billableOrders: number
  includedOrdersUsed: number
  additionalOrders: number
  canceledOrders: number
  testOrders: number
  refundedOrders: number
  openOrders: number
  nonBillableOrders: number
  grossOrderValueCents: number
  billableOrderValueCents: number
  netOrderValueCents: number | null
  countingMode: {
    countOnlyPaidOrders: boolean
    countOnlyCompletedOrders: boolean
    excludeCanceledOrders: boolean
  }
  countingNotes: string[]
  monthlyRevenueCents: number
  packageMonthlyFeeCents: number
  minimumMonthlyFeeCents: number
  moduleFees: Array<{ key: string; label: string; monthlyFeeCents: number; enabled: boolean }>
  monthlyModuleRevenueCents: number
  monthlyCommissionRevenueCents: number
  monthlyOrderRevenueCents: number
  monthlyMinimumFeeAdjustmentCents: number
  monthlyTotalRevenueCents: number
  effectiveRevenuePerOrderCents: number
  ordersCounted: number
  extraOrders: number
  includedUsagePercent: number
  countedRevenueCents: number
  commissionPercentApplied: number
  commissionCents: number
  fixedFeePerOrderCents: number
  fixedFeesCents: number
  totalFeeNetCents: number
  vatRatePercent: number
  vatCents: number
  totalFeeGrossCents: number
  marginNetCents: number
  status:
    | 'WITHIN_INCLUDED'
    | 'NEAR_INCLUDED_LIMIT'
    | 'CHARGEABLE'
    | 'INVOICE_OPEN'
    | 'INVOICE_PAID'
  warnings: string[]
}

export type BillingInvoicePreviewLineItem = {
  key:
    | 'BASE_FEE'
    | 'PACKAGE_FEE'
    | 'MODULE_FEE'
    | 'ADDITIONAL_ORDER_FEE'
    | 'COMMISSION_FEE'
    | 'MINIMUM_FEE_ADJUSTMENT'
  title: string
  quantity: number
  unitPriceCents: number
  netAmountCents: number
  metadata?: Record<string, unknown>
}

export type BillingInvoicePreview = {
  tenant: {
    id: string
    name: string
    chainId: string | null
    chainName: string | null
  }
  period: {
    month: string
    periodStart: string
    periodEnd: string
  }
  positions: BillingInvoicePreviewLineItem[]
  totals: {
    netAmountCents: number
    vatRatePercent: number
    vatAmountCents: number
    grossAmountCents: number
  }
  usage: {
    billableOrders: number
    includedOrders: number
    includedOrdersUsed: number
    additionalOrders: number
    effectiveRevenuePerOrderCents: number
  }
  warnings: string[]
}

function toCents(value: unknown) {
  const amount = Number(value || 0)
  if (!Number.isFinite(amount)) return 0
  return Math.round(amount * 100)
}

function normalizePercent(value: Prisma.Decimal | number | null | undefined) {
  const numeric = Number(value || 0)
  return Number.isFinite(numeric) ? Math.max(0, numeric) : 0
}

type BillingPricingNotesMeta = {
  packageMonthlyFeeCents: number
  moduleFees: Array<{ key: string; label: string; monthlyFeeCents: number; enabled: boolean }>
  minimumMonthlyFeeCents: number
}

function parseBillingPricingNotes(notes: string | null | undefined): BillingPricingNotesMeta {
  if (!notes) {
    return {
      packageMonthlyFeeCents: 0,
      moduleFees: [],
      minimumMonthlyFeeCents: 0,
    }
  }

  try {
    const parsed = JSON.parse(notes) as {
      pricing?: {
        packageMonthlyFeeCents?: unknown
        minimumMonthlyFeeCents?: unknown
        moduleFees?: unknown
      }
      packageMonthlyFeeCents?: unknown
      minimumMonthlyFeeCents?: unknown
      moduleFees?: unknown
    }

    const rawPricing =
      parsed?.pricing && typeof parsed.pricing === 'object'
        ? parsed.pricing
        : parsed && typeof parsed === 'object'
          ? parsed
          : null
    const rawModuleFees = Array.isArray(rawPricing?.moduleFees) ? rawPricing.moduleFees : []
    return {
      packageMonthlyFeeCents: Math.max(0, Number(rawPricing?.packageMonthlyFeeCents || 0) || 0),
      minimumMonthlyFeeCents: Math.max(0, Number(rawPricing?.minimumMonthlyFeeCents || 0) || 0),
      moduleFees: rawModuleFees
        .map((entry) => {
          if (!entry || typeof entry !== 'object') return null
          const candidate = entry as Record<string, unknown>
          const monthlyFeeCents = Math.max(0, Number(candidate.monthlyFeeCents || 0) || 0)
          const enabled =
            typeof candidate.enabled === 'boolean' ? candidate.enabled : monthlyFeeCents > 0
          return {
            key: typeof candidate.key === 'string' ? candidate.key : '',
            label: typeof candidate.label === 'string' ? candidate.label : '',
            monthlyFeeCents,
            enabled,
          }
        })
        .filter(
          (
            entry
          ): entry is { key: string; label: string; monthlyFeeCents: number; enabled: boolean } =>
            Boolean(entry && entry.enabled && entry.monthlyFeeCents > 0)
        ),
    }
  } catch {
    return {
      packageMonthlyFeeCents: 0,
      moduleFees: [],
      minimumMonthlyFeeCents: 0,
    }
  }
}

function monthPeriod(monthKey: string): BillingMonthPeriod | null {
  const match = /^(\d{4})-(\d{2})$/.exec(monthKey.trim())
  if (!match) return null
  const year = Number(match[1])
  const month = Number(match[2])
  if (month < 1 || month > 12) return null
  const periodStart = new Date(Date.UTC(year, month - 1, 1, 0, 0, 0, 0))
  const periodEnd = new Date(Date.UTC(year, month, 1, 0, 0, 0, 0))
  return { key: monthKey, periodStart, periodEnd }
}

export function parseBillingMonthOrCurrent(input: unknown): BillingMonthPeriod {
  if (typeof input === 'string') {
    const parsed = monthPeriod(input)
    if (parsed) return parsed
  }
  const now = new Date()
  const key = `${now.getUTCFullYear()}-${String(now.getUTCMonth() + 1).padStart(2, '0')}`
  return monthPeriod(key)!
}

function invoiceStatusToBillingStatus(status: InvoiceStatus | null): TenantBillingCalculation['status'] | null {
  if (!status) return null
  const upper = String(status).toUpperCase()
  if (upper === 'PAID') return 'INVOICE_PAID'
  if (upper === 'ISSUED' || upper === 'SENT' || upper === 'OVERDUE') return 'INVOICE_OPEN'
  return null
}

export async function calculateTenantBilling(tenantId: string, period: BillingMonthPeriod): Promise<TenantBillingCalculation | null> {
  const tenant = await prisma.tenant.findUnique({
    where: { id: tenantId },
    include: {
      chain: { select: { id: true, name: true } },
      tenantBillingPlan: true,
      tenantBillingSettings: true,
      billingProfile: true,
    },
  })
  if (!tenant) return null

  const plan = tenant.tenantBillingPlan
  const settings = tenant.tenantBillingSettings
  const pricingMeta = parseBillingPricingNotes(plan?.notes)
  const usage = await calculateBillingUsageSnapshot({
    tenantId: tenant.id,
    periodStart: period.periodStart,
    periodEnd: period.periodEnd,
    countOnlyPaidOrders: settings?.countOnlyPaidOrders ?? true,
    countOnlyCompletedOrders: settings?.countOnlyCompletedOrders ?? true,
    excludeCanceledOrders: settings?.excludeCanceledOrders ?? true,
  })

  const includedOrders = Math.max(0, plan?.includedOrders ?? 0)
  const totalOrders = Math.max(0, usage.ordersTotal)
  const billableOrders = Math.max(0, usage.ordersBillable)
  const includedOrdersUsed = Math.min(includedOrders, billableOrders)
  const additionalOrders = Math.max(0, billableOrders - includedOrders)
  const ordersCounted = billableOrders
  const extraOrders = additionalOrders
  const includedUsagePercent =
    includedOrders > 0 ? Math.min(100, (billableOrders / includedOrders) * 100) : billableOrders > 0 ? 100 : 0
  const monthlyFeeCents = Math.max(0, plan?.monthlyFeeCents ?? 0)
  const commissionPercentApplied = normalizePercent(plan?.commissionAfterIncludedOrdersPercent ?? plan?.commissionPercent ?? 0)
  const countedRevenueCents = Math.max(0, usage.revenueCountedCents)
  const avgOrderValueCents = billableOrders > 0 ? Math.round(countedRevenueCents / billableOrders) : 0
  const extraRevenueCents = avgOrderValueCents * extraOrders
  const commissionCents = Math.max(0, Math.round(extraRevenueCents * (commissionPercentApplied / 100)))
  const fixedFeePerOrderCents = Math.max(0, plan?.fixedFeePerOrderCents ?? 0)
  const fixedFeesCents = fixedFeePerOrderCents * extraOrders
  const monthlyRevenueCents = monthlyFeeCents + pricingMeta.packageMonthlyFeeCents
  const monthlyModuleRevenueCents = pricingMeta.moduleFees.reduce((sum, entry) => sum + Math.max(0, entry.monthlyFeeCents), 0)
  const monthlyCommissionRevenueCents = commissionCents
  const monthlyOrderRevenueCents = fixedFeesCents
  const monthlyRevenueBeforeMinimumCents =
    monthlyRevenueCents + monthlyModuleRevenueCents + monthlyCommissionRevenueCents + monthlyOrderRevenueCents
  const monthlyMinimumFeeAdjustmentCents = Math.max(
    0,
    pricingMeta.minimumMonthlyFeeCents - monthlyRevenueBeforeMinimumCents
  )
  const monthlyTotalRevenueCents = monthlyRevenueBeforeMinimumCents + monthlyMinimumFeeAdjustmentCents
  const effectiveRevenuePerOrderCents =
    billableOrders > 0 ? Math.round(monthlyTotalRevenueCents / billableOrders) : monthlyTotalRevenueCents
  const totalFeeNetCents = monthlyFeeCents + commissionCents + fixedFeesCents
  const vatRatePercent = 19
  const vatCents = Math.round(totalFeeNetCents * (vatRatePercent / 100))
  const totalFeeGrossCents = totalFeeNetCents + vatCents

  const latestInvoice = await prisma.invoice.findFirst({
    where: { tenantId: tenant.id, periodStart: period.periodStart, periodEnd: new Date(period.periodEnd.getTime() - 1) },
    orderBy: { createdAt: 'desc' },
    select: { status: true },
  })

  const warnings: string[] = []
  if (!tenant.billingProfile?.companyName) warnings.push('Rechnungsadresse: Firmenname fehlt.')
  if (!tenant.billingProfile?.street || !tenant.billingProfile?.zipCode || !tenant.billingProfile?.city) {
    warnings.push('Rechnungsadresse ist unvollständig.')
  }
  if (!tenant.billingProfile?.invoiceEmail) warnings.push('Rechnungs-E-Mail fehlt.')
  if (!tenant.billingProfile?.vatId) warnings.push('USt-IdNr. fehlt (optional, aber empfohlen).')
  if (!plan?.isActive) warnings.push('Kein aktiver Billing-Plan hinterlegt.')
  for (const note of usage.countingNotes) {
    warnings.push(`Nutzungszaehlung: ${note}`)
  }

  const invoiceStatus = invoiceStatusToBillingStatus(latestInvoice?.status ?? null)
  const usageStatus: TenantBillingCalculation['status'] =
    extraOrders > 0 ? 'CHARGEABLE' : includedUsagePercent >= 85 ? 'NEAR_INCLUDED_LIMIT' : 'WITHIN_INCLUDED'

  return {
    month: period.key,
    tenantId: tenant.id,
    tenantName: tenant.name,
    chainId: tenant.chainId ?? null,
    chainName: tenant.chain?.name ?? null,
    planType: plan?.planType ?? BillingPlanType.REVENUE_SHARE,
    monthlyFeeCents,
    includedOrders,
    totalOrders,
    billableOrders,
    includedOrdersUsed,
    additionalOrders,
    canceledOrders: Math.max(0, usage.ordersCanceled),
    testOrders: Math.max(0, usage.ordersTest),
    refundedOrders: Math.max(0, usage.ordersRefunded),
    openOrders: Math.max(0, usage.ordersOpen),
    nonBillableOrders: Math.max(0, usage.ordersNonBillable),
    grossOrderValueCents: Math.max(0, usage.grossOrderValueCents),
    billableOrderValueCents: Math.max(0, usage.billableOrderValueCents),
    netOrderValueCents: usage.netOrderValueCents,
    countingMode: usage.countingMode,
    countingNotes: usage.countingNotes,
    monthlyRevenueCents,
    packageMonthlyFeeCents: pricingMeta.packageMonthlyFeeCents,
    minimumMonthlyFeeCents: pricingMeta.minimumMonthlyFeeCents,
    moduleFees: pricingMeta.moduleFees,
    monthlyModuleRevenueCents,
    monthlyCommissionRevenueCents,
    monthlyOrderRevenueCents,
    monthlyMinimumFeeAdjustmentCents,
    monthlyTotalRevenueCents,
    effectiveRevenuePerOrderCents,
    ordersCounted,
    extraOrders,
    includedUsagePercent,
    countedRevenueCents,
    commissionPercentApplied,
    commissionCents,
    fixedFeePerOrderCents,
    fixedFeesCents,
    totalFeeNetCents,
    vatRatePercent,
    vatCents,
    totalFeeGrossCents,
    marginNetCents: totalFeeNetCents,
    status: invoiceStatus ?? usageStatus,
    warnings,
  }
}

export async function calculateBillingSummary(period: BillingMonthPeriod, tenantIds?: string[]) {
  const tenants = await prisma.tenant.findMany({
    where: tenantIds?.length ? { id: { in: tenantIds } } : undefined,
    select: { id: true },
    orderBy: { name: 'asc' },
  })

  const rows = (
    await Promise.all(tenants.map((tenant) => calculateTenantBilling(tenant.id, period)))
  ).filter((entry): entry is TenantBillingCalculation => Boolean(entry))

  const summary = rows.reduce(
    (acc, entry) => {
      acc.platformRevenueNetCents += entry.totalFeeNetCents
      acc.platformRevenueGrossCents += entry.totalFeeGrossCents
      acc.estimatedMarginNetCents += entry.marginNetCents
      acc.platformMonthlyRevenueCents += entry.monthlyRevenueCents
      acc.platformMonthlyModuleRevenueCents += entry.monthlyModuleRevenueCents
      acc.platformMonthlyCommissionRevenueCents += entry.monthlyCommissionRevenueCents
      acc.platformMonthlyOrderRevenueCents += entry.monthlyOrderRevenueCents
      acc.platformMonthlyMinimumFeeAdjustmentCents += entry.monthlyMinimumFeeAdjustmentCents
      acc.platformMonthlyTotalRevenueCents += entry.monthlyTotalRevenueCents
      acc.openInvoices += entry.status === 'INVOICE_OPEN' ? 1 : 0
      acc.paidInvoices += entry.status === 'INVOICE_PAID' ? 1 : 0
      acc.includedTenants += entry.status === 'WITHIN_INCLUDED' || entry.status === 'NEAR_INCLUDED_LIMIT' ? 1 : 0
      acc.chargeableTenants += entry.status === 'CHARGEABLE' ? 1 : 0
      return acc
    },
    {
      tenants: rows.length,
      platformRevenueNetCents: 0,
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
      chargeableTenants: 0,
    }
  )

  return { rows, summary }
}

export async function buildBillingInvoicePreview(
  tenantId: string,
  period: BillingMonthPeriod
): Promise<BillingInvoicePreview | null> {
  const calculation = await calculateTenantBilling(tenantId, period)
  if (!calculation) return null

  const tenant = await prisma.tenant.findUnique({
    where: { id: tenantId },
    include: {
      chain: { select: { id: true, name: true } },
      billingProfile: true,
    },
  })
  if (!tenant) return null

  const positions: BillingInvoicePreviewLineItem[] = []
  if (calculation.monthlyFeeCents > 0) {
    positions.push({
      key: 'BASE_FEE',
      title: 'Grundgebuehr',
      quantity: 1,
      unitPriceCents: calculation.monthlyFeeCents,
      netAmountCents: calculation.monthlyFeeCents,
    })
  }
  if (calculation.packageMonthlyFeeCents > 0) {
    positions.push({
      key: 'PACKAGE_FEE',
      title: 'Paketgebuehr',
      quantity: 1,
      unitPriceCents: calculation.packageMonthlyFeeCents,
      netAmountCents: calculation.packageMonthlyFeeCents,
    })
  }
  for (const moduleFee of calculation.moduleFees) {
    positions.push({
      key: 'MODULE_FEE',
      title: `Modulgebuehr ${moduleFee.label}`,
      quantity: 1,
      unitPriceCents: moduleFee.monthlyFeeCents,
      netAmountCents: moduleFee.monthlyFeeCents,
      metadata: { moduleKey: moduleFee.key },
    })
  }
  if (calculation.additionalOrders > 0 && calculation.fixedFeePerOrderCents > 0) {
    positions.push({
      key: 'ADDITIONAL_ORDER_FEE',
      title: 'Fixbetrag Zusatzbestellungen',
      quantity: calculation.additionalOrders,
      unitPriceCents: calculation.fixedFeePerOrderCents,
      netAmountCents: calculation.monthlyOrderRevenueCents,
      metadata: { additionalOrders: calculation.additionalOrders },
    })
  }
  if (calculation.monthlyCommissionRevenueCents > 0) {
    positions.push({
      key: 'COMMISSION_FEE',
      title: 'Provision auf Zusatzbestellungen',
      quantity: 1,
      unitPriceCents: calculation.monthlyCommissionRevenueCents,
      netAmountCents: calculation.monthlyCommissionRevenueCents,
      metadata: {
        additionalOrders: calculation.additionalOrders,
        commissionPercentApplied: calculation.commissionPercentApplied,
      },
    })
  }
  if (calculation.monthlyMinimumFeeAdjustmentCents > 0) {
    positions.push({
      key: 'MINIMUM_FEE_ADJUSTMENT',
      title: 'Mindestgebuehr-Korrektur',
      quantity: 1,
      unitPriceCents: calculation.monthlyMinimumFeeAdjustmentCents,
      netAmountCents: calculation.monthlyMinimumFeeAdjustmentCents,
      metadata: { minimumMonthlyFeeCents: calculation.minimumMonthlyFeeCents },
    })
  }

  const warnings = [...calculation.warnings]
  if (!tenant.billingProfile?.companyName || !tenant.billingProfile?.street || !tenant.billingProfile?.zipCode || !tenant.billingProfile?.city) {
    warnings.push('Rechnungsadresse fehlt oder ist unvollstaendig.')
  }
  if ((tenant.billingProfile?.countryCode || 'DE').toUpperCase() === 'DE' && !tenant.billingProfile?.vatId) {
    warnings.push('USt-ID fehlt oder ist noch nicht gepflegt.')
  }
  if (!tenant.billingProfile?.paymentMethod) {
    warnings.push('Zahlungsart fehlt im Billing-Profil.')
  }
  if (!tenant.billingProfile?.paymentTermsDays || tenant.billingProfile.paymentTermsDays <= 0) {
    warnings.push('Zahlungsziel fehlt im Billing-Profil.')
  }
  if (calculation.countingNotes.length > 0) {
    warnings.push('Order-Zaehllogik enthaelt defensive Ausschluesse oder unklare Status.')
  }
  if (calculation.billableOrders === 0) {
    warnings.push('Keine abrechnungsrelevanten Bestellungen im gewaelten Zeitraum.')
  }
  if (calculation.netOrderValueCents === null) {
    warnings.push('Netto aus Orderdaten ist derzeit nicht sicher berechenbar.')
  }

  return {
    tenant: {
      id: tenant.id,
      name: tenant.name,
      chainId: tenant.chainId ?? null,
      chainName: tenant.chain?.name ?? null,
    },
    period: {
      month: period.key,
      periodStart: period.periodStart.toISOString(),
      periodEnd: new Date(period.periodEnd.getTime() - 1).toISOString(),
    },
    positions,
    totals: {
      netAmountCents: calculation.monthlyTotalRevenueCents,
      vatRatePercent: calculation.vatRatePercent,
      vatAmountCents: Math.round(calculation.monthlyTotalRevenueCents * (calculation.vatRatePercent / 100)),
      grossAmountCents:
        calculation.monthlyTotalRevenueCents +
        Math.round(calculation.monthlyTotalRevenueCents * (calculation.vatRatePercent / 100)),
    },
    usage: {
      billableOrders: calculation.billableOrders,
      includedOrders: calculation.includedOrders,
      includedOrdersUsed: calculation.includedOrdersUsed,
      additionalOrders: calculation.additionalOrders,
      effectiveRevenuePerOrderCents: calculation.effectiveRevenuePerOrderCents,
    },
    warnings: Array.from(new Set(warnings)),
  }
}

export async function getOrCreateInvoiceSequence(scopeKey: string, issueDate: Date) {
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

export async function createInvoiceDraftFromCalculation(input: {
  billingRunId: string
  period: BillingMonthPeriod
  tenantCalculation: TenantBillingCalculation
  finalizedByUserId?: string
}) {
  const { billingRunId, period, tenantCalculation } = input
  const issueDate = new Date()
  const invoiceNumber = await getOrCreateInvoiceSequence('GLOBAL', issueDate)
  const dueAt = new Date(issueDate.getTime() + 14 * 24 * 60 * 60 * 1000)
  const periodEndInclusive = new Date(period.periodEnd.getTime() - 1)
  const calcSnapshot = {
    periodKey: period.key,
    tenantId: tenantCalculation.tenantId,
    includedOrders: tenantCalculation.includedOrders,
    ordersCounted: tenantCalculation.ordersCounted,
    extraOrders: tenantCalculation.extraOrders,
    commissionPercentApplied: tenantCalculation.commissionPercentApplied,
    monthlyFeeCents: tenantCalculation.monthlyFeeCents,
    commissionCents: tenantCalculation.commissionCents,
    fixedFeePerOrderCents: tenantCalculation.fixedFeePerOrderCents,
    fixedFeesCents: tenantCalculation.fixedFeesCents,
    totalFeeNetCents: tenantCalculation.totalFeeNetCents,
    vatRatePercent: tenantCalculation.vatRatePercent,
    vatCents: tenantCalculation.vatCents,
    totalFeeGrossCents: tenantCalculation.totalFeeGrossCents,
  }
  const calcHash = crypto.createHash('sha256').update(JSON.stringify(calcSnapshot)).digest('hex')
  return prisma.$transaction(async (tx) => {
    const invoice = await tx.invoice.create({
      data: {
        invoiceNumber,
        tenantId: tenantCalculation.tenantId,
        chainId: tenantCalculation.chainId,
        billingRunId,
        recipientType: InvoiceRecipientType.TENANT,
        status: 'DRAFT',
        periodStart: period.periodStart,
        periodEnd: periodEndInclusive,
        dueAt,
        subTotalCents: tenantCalculation.totalFeeNetCents,
        taxTotalCents: tenantCalculation.vatCents,
        totalGrossCents: tenantCalculation.totalFeeGrossCents,
        openAmountCents: tenantCalculation.totalFeeGrossCents,
        metadata: {
          calculationSnapshot: calcSnapshot,
          calculationHash: calcHash,
          draftLocked: true,
          historyVersion: 1,
        },
      },
    })

    const invoiceItems = [
      {
        lineNo: 1,
        title: 'Monatsgebühr Klarando',
        quantity: new Prisma.Decimal(1),
        unitPriceCents: tenantCalculation.monthlyFeeCents,
        netAmountCents: tenantCalculation.monthlyFeeCents,
      },
      {
        lineNo: 2,
        title: `Provision auf Zusatzbestellungen (${tenantCalculation.extraOrders} Bestellungen)`,
        quantity: new Prisma.Decimal(1),
        unitPriceCents: tenantCalculation.commissionCents,
        netAmountCents: tenantCalculation.commissionCents,
      },
      {
        lineNo: 3,
        title: `Fixbetrag pro Zusatzbestellung (${tenantCalculation.fixedFeePerOrderCents} Cent x ${tenantCalculation.extraOrders})`,
        quantity: new Prisma.Decimal(1),
        unitPriceCents: tenantCalculation.fixedFeesCents,
        netAmountCents: tenantCalculation.fixedFeesCents,
      },
    ]

    for (const row of invoiceItems) {
      const taxAmountCents = Math.round(row.netAmountCents * (tenantCalculation.vatRatePercent / 100))
      await tx.invoiceItem.create({
        data: {
          invoiceId: invoice.id,
          lineNo: row.lineNo,
          title: row.title,
          quantity: row.quantity,
          unitPriceCents: Math.max(0, row.unitPriceCents),
          taxRatePercent: new Prisma.Decimal(tenantCalculation.vatRatePercent),
          netAmountCents: Math.max(0, row.netAmountCents),
          taxAmountCents: Math.max(0, taxAmountCents),
          grossAmountCents: Math.max(0, row.netAmountCents + taxAmountCents),
        },
      })
    }

    await tx.klarandoMailboxMessage.create({
      data: {
        tenantId: tenantCalculation.tenantId,
        chainId: tenantCalculation.chainId,
        invoiceId: invoice.id,
        messageType: 'INVOICE_ISSUED',
        title: `Neue Rechnung ${invoice.invoiceNumber}`,
        body: `Für den Zeitraum ${period.key} wurde eine Rechnung als Entwurf erstellt.`,
        status: 'DRAFT',
        actionUrl: `/admin/finanzen?invoice=${invoice.id}`,
      },
    })

    return invoice
  })
}

export function canFinalizeInvoice(status: InvoiceStatus) {
  return status === 'DRAFT'
}

export function recipientTypeForRole(role: UserRole) {
  if (role === 'CHAINADMIN') return InvoiceRecipientType.CHAIN
  return InvoiceRecipientType.TENANT
}

export function billingSettingsDefaults() {
  return {
    planType: BillingPlanType.REVENUE_SHARE,
    billingPeriod: BillingPeriodType.MONTHLY,
  }
}
