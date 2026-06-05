import { BillingPeriodType, BillingPlanType, InvoiceRecipientType, InvoiceStatus, Prisma, type UserRole } from '@prisma/client'
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
  vatRatePercent: number | null
  vatCountry: string | null
  vatSource: 'BILLING_MASTER' | 'MISSING'
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
    vatRatePercent: number | null
    vatCountry: string | null
    vatSource: 'BILLING_MASTER' | 'MISSING'
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
  criticalWarnings: string[]
  hasCriticalWarnings: boolean
}

type InvoiceDraftLineItem = {
  title: string
  quantity: Prisma.Decimal
  unitPriceCents: number
  netAmountCents: number
  metadata?: Record<string, unknown>
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
  vatRatePercent: number | null
}

function parseBillingPricingNotes(notes: string | null | undefined): BillingPricingNotesMeta {
  if (!notes) {
      return {
        packageMonthlyFeeCents: 0,
        moduleFees: [],
        minimumMonthlyFeeCents: 0,
        vatRatePercent: null,
      }
  }

  try {
    const parsed = JSON.parse(notes) as {
      pricing?: {
        packageMonthlyFeeCents?: unknown
        minimumMonthlyFeeCents?: unknown
        moduleFees?: unknown
        vatRatePercent?: unknown
      }
      packageMonthlyFeeCents?: unknown
      minimumMonthlyFeeCents?: unknown
      moduleFees?: unknown
      vatRatePercent?: unknown
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
      vatRatePercent:
        rawPricing?.vatRatePercent === null || rawPricing?.vatRatePercent === undefined || rawPricing?.vatRatePercent === ''
          ? null
          : Number.isFinite(Number(rawPricing.vatRatePercent))
            ? Math.max(0, Number(rawPricing.vatRatePercent))
            : null,
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
      vatRatePercent: null,
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

function resolveTenantVatConfiguration(input: {
  billingProfile:
    | {
        countryCode?: string | null
      }
    | null
  pricingMeta: BillingPricingNotesMeta
}) {
  const vatCountry =
    typeof input.billingProfile?.countryCode === 'string' && input.billingProfile.countryCode.trim().length > 0
      ? input.billingProfile.countryCode.trim().toUpperCase()
      : null
  const vatRatePercent =
    typeof input.pricingMeta.vatRatePercent === 'number' && Number.isFinite(input.pricingMeta.vatRatePercent)
      ? Math.max(0, input.pricingMeta.vatRatePercent)
      : null

  return {
    vatRatePercent,
    vatCountry,
    vatSource: vatRatePercent === null ? ('MISSING' as const) : ('BILLING_MASTER' as const),
  }
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
  const vatConfiguration = resolveTenantVatConfiguration({
    billingProfile: tenant.billingProfile,
    pricingMeta,
  })
  const vatRatePercent = vatConfiguration.vatRatePercent
  const vatCents = vatRatePercent === null ? 0 : Math.round(totalFeeNetCents * (vatRatePercent / 100))
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
  if (vatRatePercent === null) {
    warnings.push('MwSt.-Satz fehlt in der serverseitigen Billing-Masterquelle.')
  }
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
    vatCountry: vatConfiguration.vatCountry,
    vatSource: vatConfiguration.vatSource,
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
  if (calculation.vatRatePercent === null) {
    warnings.push('MwSt.-Konfiguration fehlt oder ist unklar.')
  }

  const criticalWarnings = warnings.filter((warning) =>
    warning.includes('Rechnungsadresse fehlt') ||
    warning.includes('Rechnungsadresse ist unvollständig') ||
    warning.includes('Zahlungsart fehlt') ||
    warning.includes('Zahlungsziel fehlt') ||
    warning.includes('Keine abrechnungsrelevanten Bestellungen') ||
    warning.includes('MwSt.-')
  )

  const vatRatePercent = calculation.vatRatePercent
  const vatAmountCents =
    vatRatePercent === null ? 0 : Math.round(calculation.monthlyTotalRevenueCents * (vatRatePercent / 100))

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
      vatRatePercent,
      vatCountry: calculation.vatCountry,
      vatSource: calculation.vatSource,
      vatAmountCents,
      grossAmountCents: calculation.monthlyTotalRevenueCents + vatAmountCents,
    },
    usage: {
      billableOrders: calculation.billableOrders,
      includedOrders: calculation.includedOrders,
      includedOrdersUsed: calculation.includedOrdersUsed,
      additionalOrders: calculation.additionalOrders,
      effectiveRevenuePerOrderCents: calculation.effectiveRevenuePerOrderCents,
    },
    warnings: Array.from(new Set(warnings)),
    criticalWarnings: Array.from(new Set(criticalWarnings)),
    hasCriticalWarnings: criticalWarnings.length > 0,
  }
}

export async function getOrCreateInvoiceSequence(scopeKey: string, issueDate: Date) {
  const prefix = `KL-${issueDate.getUTCFullYear()}-${String(issueDate.getUTCMonth() + 1).padStart(2, '0')}`
  const sequence = await prisma.invoiceSequence.upsert({
    where: { scopeKey },
    update: { lastNumber: { increment: 1 } },
    create: {
      scopeKey,
      prefix,
      lastNumber: 1,
    },
  })
  return `${sequence.prefix}-${String(sequence.lastNumber).padStart(4, '0')}`
}

function createDraftInvoiceNumber() {
  return `DRAFT-${crypto.randomUUID()}`
}

function buildInvoiceDraftLineItems(
  tenantCalculation: TenantBillingCalculation
): InvoiceDraftLineItem[] {
  const items: InvoiceDraftLineItem[] = []

  if (tenantCalculation.monthlyFeeCents > 0) {
    items.push({
      title: 'Grundgebuehr Klarando',
      quantity: new Prisma.Decimal(1),
      unitPriceCents: tenantCalculation.monthlyFeeCents,
      netAmountCents: tenantCalculation.monthlyFeeCents,
    })
  }

  if (tenantCalculation.packageMonthlyFeeCents > 0) {
    items.push({
      title: 'Paketgebuehr',
      quantity: new Prisma.Decimal(1),
      unitPriceCents: tenantCalculation.packageMonthlyFeeCents,
      netAmountCents: tenantCalculation.packageMonthlyFeeCents,
    })
  }

  for (const moduleFee of tenantCalculation.moduleFees) {
    items.push({
      title: `Modulgebuehr ${moduleFee.label}`,
      quantity: new Prisma.Decimal(1),
      unitPriceCents: moduleFee.monthlyFeeCents,
      netAmountCents: moduleFee.monthlyFeeCents,
      metadata: { moduleKey: moduleFee.key },
    })
  }

  if (tenantCalculation.additionalOrders > 0 && tenantCalculation.fixedFeePerOrderCents > 0) {
    items.push({
      title: 'Fixbetrag Zusatzbestellungen',
      quantity: new Prisma.Decimal(tenantCalculation.additionalOrders),
      unitPriceCents: tenantCalculation.fixedFeePerOrderCents,
      netAmountCents: tenantCalculation.monthlyOrderRevenueCents,
      metadata: { additionalOrders: tenantCalculation.additionalOrders },
    })
  }

  if (tenantCalculation.monthlyCommissionRevenueCents > 0) {
    items.push({
      title: 'Provision auf Zusatzbestellungen',
      quantity: new Prisma.Decimal(1),
      unitPriceCents: tenantCalculation.monthlyCommissionRevenueCents,
      netAmountCents: tenantCalculation.monthlyCommissionRevenueCents,
      metadata: {
        additionalOrders: tenantCalculation.additionalOrders,
        commissionPercentApplied: tenantCalculation.commissionPercentApplied,
      },
    })
  }

  if (tenantCalculation.monthlyMinimumFeeAdjustmentCents > 0) {
    items.push({
      title: 'Mindestgebuehr-Korrektur',
      quantity: new Prisma.Decimal(1),
      unitPriceCents: tenantCalculation.monthlyMinimumFeeAdjustmentCents,
      netAmountCents: tenantCalculation.monthlyMinimumFeeAdjustmentCents,
      metadata: { minimumMonthlyFeeCents: tenantCalculation.minimumMonthlyFeeCents },
    })
  }

  return items
}

export async function createInvoiceDraftFromCalculation(input: {
  billingRunId?: string | null
  period: BillingMonthPeriod
  tenantCalculation: TenantBillingCalculation
  existingInvoiceId?: string | null
  finalizedByUserId?: string
}) {
  const { billingRunId, period, tenantCalculation, existingInvoiceId } = input
  const issueDate = new Date()
  const periodEndInclusive = new Date(period.periodEnd.getTime() - 1)
  const invoiceItems = buildInvoiceDraftLineItems(tenantCalculation)
  const subTotalCents = tenantCalculation.monthlyTotalRevenueCents
  const taxTotalCents =
    tenantCalculation.vatRatePercent === null
      ? 0
      : Math.round(subTotalCents * (tenantCalculation.vatRatePercent / 100))
  const totalGrossCents = subTotalCents + taxTotalCents
  const calcSnapshot = {
    periodKey: period.key,
    tenantId: tenantCalculation.tenantId,
    includedOrders: tenantCalculation.includedOrders,
    ordersCounted: tenantCalculation.ordersCounted,
    extraOrders: tenantCalculation.extraOrders,
    packageMonthlyFeeCents: tenantCalculation.packageMonthlyFeeCents,
    moduleFees: tenantCalculation.moduleFees,
    monthlyModuleRevenueCents: tenantCalculation.monthlyModuleRevenueCents,
    monthlyOrderRevenueCents: tenantCalculation.monthlyOrderRevenueCents,
    monthlyCommissionRevenueCents: tenantCalculation.monthlyCommissionRevenueCents,
    monthlyMinimumFeeAdjustmentCents: tenantCalculation.monthlyMinimumFeeAdjustmentCents,
    monthlyTotalRevenueCents: tenantCalculation.monthlyTotalRevenueCents,
    commissionPercentApplied: tenantCalculation.commissionPercentApplied,
    monthlyFeeCents: tenantCalculation.monthlyFeeCents,
    commissionCents: tenantCalculation.commissionCents,
    fixedFeePerOrderCents: tenantCalculation.fixedFeePerOrderCents,
    fixedFeesCents: tenantCalculation.fixedFeesCents,
    netTotalCents: subTotalCents,
    vatRatePercent: tenantCalculation.vatRatePercent,
    vatCountry: tenantCalculation.vatCountry,
    vatSource: tenantCalculation.vatSource,
    taxTotalCents,
    grossTotalCents: totalGrossCents,
    totalFeeNetCents: subTotalCents,
    vatCents: taxTotalCents,
    totalFeeGrossCents: totalGrossCents,
    warnings: tenantCalculation.warnings,
  }
  const calcHash = crypto.createHash('sha256').update(JSON.stringify(calcSnapshot)).digest('hex')
  return prisma.$transaction(async (tx) => {
    const lockedInvoiceForPeriod = await tx.invoice.findFirst({
      where: {
        tenantId: tenantCalculation.tenantId,
        periodStart: period.periodStart,
        periodEnd: periodEndInclusive,
        ...(existingInvoiceId ? { id: { not: existingInvoiceId } } : {}),
      },
      select: {
        id: true,
        invoiceNumber: true,
        status: true,
        metadata: true,
      },
      orderBy: { createdAt: 'desc' },
    })
    if (lockedInvoiceForPeriod) {
      assertInvoiceMutable(lockedInvoiceForPeriod)
    }

    const tenant = await tx.tenant.findUnique({
      where: { id: tenantCalculation.tenantId },
      select: {
        billingProfile: {
          select: {
            id: true,
            companyName: true,
            street: true,
            zipCode: true,
            city: true,
            countryCode: true,
            vatId: true,
            invoiceEmail: true,
            contactEmail: true,
            paymentMethod: true,
            paymentTermsDays: true,
          },
        },
      },
    })
    const paymentTermsDays = Math.max(1, tenant?.billingProfile?.paymentTermsDays ?? 14)
    const dueAt = new Date(issueDate.getTime() + paymentTermsDays * 24 * 60 * 60 * 1000)
    const billingProfileSnapshot = tenant?.billingProfile
      ? {
          companyName: tenant.billingProfile.companyName,
          street: tenant.billingProfile.street,
          zipCode: tenant.billingProfile.zipCode,
          city: tenant.billingProfile.city,
          countryCode: tenant.billingProfile.countryCode,
          vatId: tenant.billingProfile.vatId,
          invoiceEmail: tenant.billingProfile.invoiceEmail,
          contactEmail: tenant.billingProfile.contactEmail,
          paymentMethod: tenant.billingProfile.paymentMethod,
          paymentTermsDays: tenant.billingProfile.paymentTermsDays,
        }
      : null

    if (existingInvoiceId) {
      const existingInvoice = await tx.invoice.findUnique({
        where: { id: existingInvoiceId },
        select: {
          id: true,
          invoiceNumber: true,
          status: true,
          metadata: true,
        },
      })
      if (!existingInvoice) {
        throw new Error('Entwurfsrechnung konnte nicht gefunden werden.')
      }
      assertInvoiceMutable(existingInvoice)
    }

    const invoiceData = {
      tenantId: tenantCalculation.tenantId,
      chainId: tenantCalculation.chainId,
      billingProfileId: tenant?.billingProfile?.id ?? null,
      billingRunId: billingRunId ?? null,
      recipientType: InvoiceRecipientType.TENANT,
      status: InvoiceStatus.DRAFT,
      periodStart: period.periodStart,
      periodEnd: periodEndInclusive,
      dueAt,
      subTotalCents,
      taxTotalCents,
      totalGrossCents,
      openAmountCents: totalGrossCents,
      metadata: {
        calculationSnapshot: calcSnapshot,
        calculationHash: calcHash,
        billingProfileSnapshot,
        vatSnapshot: {
          vatRatePercent: tenantCalculation.vatRatePercent,
          vatCountry: tenantCalculation.vatCountry,
          vatSource: tenantCalculation.vatSource,
          taxTotalCents,
          netTotalCents: subTotalCents,
          grossTotalCents: totalGrossCents,
        },
        draftLocked: true,
        finalizationLocked: false,
        historyVersion: 1,
      },
    }

    const invoice = existingInvoiceId
      ? await tx.invoice.update({
          where: { id: existingInvoiceId },
          data: invoiceData,
        })
      : await tx.invoice.create({
          data: {
            invoiceNumber: createDraftInvoiceNumber(),
            tenantId: invoiceData.tenantId,
            chainId: invoiceData.chainId,
            billingProfileId: invoiceData.billingProfileId,
            billingRunId: invoiceData.billingRunId,
            recipientType: invoiceData.recipientType,
            status: invoiceData.status,
            periodStart: invoiceData.periodStart,
            periodEnd: invoiceData.periodEnd,
            dueAt: invoiceData.dueAt,
            subTotalCents: invoiceData.subTotalCents,
            taxTotalCents: invoiceData.taxTotalCents,
            totalGrossCents: invoiceData.totalGrossCents,
            openAmountCents: invoiceData.openAmountCents,
            metadata: invoiceData.metadata,
          },
        })

    await tx.invoiceItem.deleteMany({
      where: { invoiceId: invoice.id },
    })

    for (const [index, row] of invoiceItems.entries()) {
      const taxAmountCents =
        tenantCalculation.vatRatePercent === null
          ? 0
          : Math.round(row.netAmountCents * (tenantCalculation.vatRatePercent / 100))
      await tx.invoiceItem.create({
        data: {
          invoiceId: invoice.id,
          lineNo: index + 1,
          title: row.title,
          quantity: row.quantity,
          unitPriceCents: Math.max(0, row.unitPriceCents),
          taxRatePercent: new Prisma.Decimal(tenantCalculation.vatRatePercent ?? 0),
          netAmountCents: Math.max(0, row.netAmountCents),
          taxAmountCents: Math.max(0, taxAmountCents),
          grossAmountCents: Math.max(0, row.netAmountCents + taxAmountCents),
          ...(row.metadata ? { metadata: row.metadata as Prisma.InputJsonValue } : {}),
        },
      })
    }

    if (billingRunId) {
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
    }

    return invoice
  })
}

export function canFinalizeInvoice(status: InvoiceStatus) {
  return status === 'DRAFT'
}

type InvoiceMutabilityInput = {
  id: string
  status: InvoiceStatus
  invoiceNumber?: string | null
  metadata?: Prisma.JsonValue | null
}

function isInvoiceFinalizationLocked(invoice: Pick<InvoiceMutabilityInput, 'status' | 'metadata'>) {
  const metadata =
    invoice.metadata && typeof invoice.metadata === 'object' ? (invoice.metadata as Record<string, unknown>) : null
  return (
    metadata?.finalizationLocked === true ||
    invoice.status === InvoiceStatus.ISSUED ||
    invoice.status === InvoiceStatus.SENT ||
    invoice.status === InvoiceStatus.PAID ||
    invoice.status === InvoiceStatus.FAILED ||
    invoice.status === InvoiceStatus.CANCELLED
  )
}

export function assertInvoiceMutable(invoice: InvoiceMutabilityInput) {
  if (!isInvoiceFinalizationLocked(invoice)) {
    return
  }
  const error = new Error(
    'Finalisierte Rechnungen sind gesperrt. Bitte Korrektur- oder Stornorechnung verwenden.'
  )
  ;(error as Error & { code?: string; invoiceId?: string; invoiceNumber?: string }).code = 'FINALIZED_INVOICE_LOCKED'
  ;(error as Error & { code?: string; invoiceId?: string; invoiceNumber?: string }).invoiceId = invoice.id
  ;(error as Error & { code?: string; invoiceId?: string; invoiceNumber?: string }).invoiceNumber =
    invoice.invoiceNumber ?? undefined
  throw error
}

export async function finalizeInvoiceFromPreview(input: {
  tenantId: string
  period: BillingMonthPeriod
  finalizedByUserId?: string | null
}) {
  const { tenantId, period } = input
  const preview = await buildBillingInvoicePreview(tenantId, period)
  if (!preview) {
    return null
  }
  if (preview.hasCriticalWarnings) {
    const error = new Error('Rechnung kann wegen kritischer Warnungen nicht finalisiert werden.')
    ;(error as Error & { code?: string; warnings?: string[] }).code = 'CRITICAL_WARNINGS'
    ;(error as Error & { code?: string; warnings?: string[] }).warnings = preview.criticalWarnings
    throw error
  }
  const tenantCalculation = await calculateTenantBilling(tenantId, period)
  if (!tenantCalculation) {
    return null
  }

  const periodEndInclusive = new Date(period.periodEnd.getTime() - 1)
  const existingFinalInvoice = await prisma.invoice.findFirst({
    where: {
      tenantId,
      periodStart: period.periodStart,
      periodEnd: periodEndInclusive,
      status: { not: InvoiceStatus.DRAFT },
    },
    orderBy: { createdAt: 'desc' },
  })

  if (existingFinalInvoice) {
    const error = new Error('Für diesen Tenant und Monat existiert bereits eine finalisierte Rechnung.')
    ;(error as Error & { code?: string; invoiceId?: string; invoiceNumber?: string }).code = 'FINAL_INVOICE_EXISTS'
    ;(error as Error & { code?: string; invoiceId?: string; invoiceNumber?: string }).invoiceId = existingFinalInvoice.id
    ;(error as Error & { code?: string; invoiceId?: string; invoiceNumber?: string }).invoiceNumber =
      existingFinalInvoice.invoiceNumber
    throw error
  }

  const existingDraftInvoice = await prisma.invoice.findFirst({
    where: {
      tenantId,
      periodStart: period.periodStart,
      periodEnd: periodEndInclusive,
      status: InvoiceStatus.DRAFT,
    },
    orderBy: { createdAt: 'desc' },
  })

  const draft = await createInvoiceDraftFromCalculation({
    billingRunId: existingDraftInvoice?.billingRunId ?? null,
    existingInvoiceId: existingDraftInvoice?.id ?? null,
    period,
    tenantCalculation,
  })

  const finalizedAt = new Date()
  const finalizedInvoiceNumber = await getOrCreateInvoiceSequence(`GLOBAL:${period.key}`, finalizedAt)
  const updated = await prisma.invoice.update({
    where: { id: draft.id },
    data: {
      invoiceNumber: finalizedInvoiceNumber,
      status: InvoiceStatus.ISSUED,
      issuedAt: finalizedAt,
      metadata: {
        ...((draft.metadata as Record<string, unknown> | null) || {}),
        lifecycleStatus: 'OPEN',
        paymentStatus: 'OPEN',
        finalizationLocked: true,
        finalizationSource: 'PREVIEW',
        finalizedAt: finalizedAt.toISOString(),
        finalizedByUserId: input.finalizedByUserId ?? null,
        sourcePreviewHash:
          typeof ((draft.metadata as Record<string, unknown> | null) || {}).calculationHash === 'string'
            ? (((draft.metadata as Record<string, unknown> | null) || {}).calculationHash as string)
            : null,
        vatSnapshot: {
          vatRatePercent: tenantCalculation.vatRatePercent,
          vatCountry: tenantCalculation.vatCountry,
          vatSource: tenantCalculation.vatSource,
          taxTotalCents: draft.taxTotalCents,
          netTotalCents: draft.subTotalCents,
          grossTotalCents: draft.totalGrossCents,
        },
      },
    },
    include: {
      items: { orderBy: { lineNo: 'asc' } },
    },
  })

  return updated
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
