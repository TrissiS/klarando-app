'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import ImplementationNotice from '@/app/Components/admin/ImplementationNotice'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  downloadBillingInvoicePdf,
  finalizeBillingInvoicePreview,
  getAccessContext,
  getBillingInvoicePreview,
  getBillingInvoices,
  getBillingSummary,
  getBillingTenants,
  getFeatureModuleCatalog,
  getTenantBillingConfig,
  updateTenantBillingConfig,
  type BillingInvoicePreview,
  type BillingInvoice,
  type BillingModuleFeeConfig,
  type BillingSummaryResponse,
  type BillingTenantRow,
  type FeatureModuleDefinition,
  type TenantBillingPricingSource,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function currentMonth() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

function centsToEuro(value: number) {
  return `${(Math.max(0, value) / 100).toFixed(2)} €`
}

function centsToInput(value: number | null | undefined) {
  return ((value ?? 0) / 100).toFixed(2)
}

function euroToCents(value: string) {
  const parsed = Number(value.replace(',', '.'))
  return Number.isFinite(parsed) ? Math.max(0, Math.round(parsed * 100)) : 0
}

function toInt(value: string, fallback = 0) {
  const parsed = Number.parseInt(value, 10)
  return Number.isFinite(parsed) ? Math.max(0, parsed) : fallback
}

function toNumber(value: string, fallback = 0) {
  const parsed = Number(value.replace(',', '.'))
  return Number.isFinite(parsed) ? Math.max(0, parsed) : fallback
}

function toOptionalNumber(value: string) {
  const trimmed = value.trim()
  if (!trimmed.length) return null
  const parsed = Number(trimmed.replace(',', '.'))
  return Number.isFinite(parsed) ? Math.max(0, parsed) : null
}

type PricingFormState = {
  monthlyBaseFeeEuro: string
  includedOrders: string
  commissionPercent: string
  commissionAfterIncludedOrdersPercent: string
  fixedFeePerAdditionalOrderEuro: string
  minimumMonthlyFeeEuro: string
  vatRatePercent: string
  paymentTermsDays: string
  packageKey: string
  packageLabel: string
  packageMonthlyFeeEuro: string
  activeFrom: string
  activeUntil: string
  legacyPlanNotesText: string
  moduleFees: BillingModuleFeeConfig[]
}

type BillingProfileFormState = {
  companyName: string
  contactPerson: string
  street: string
  zipCode: string
  city: string
  countryCode: string
  invoiceEmail: string
  vatId: string
  taxNumber: string
  paymentTermsDays: string
  paymentMethod: string
}

type TenantBillingConfig = Awaited<ReturnType<typeof getTenantBillingConfig>>

function usageCounterLabel(row: BillingTenantRow) {
  const modeParts = [
    row.countingMode.excludeCanceledOrders ? 'ohne Stornos' : 'mit Stornos',
    row.countingMode.countOnlyCompletedOrders ? 'nur abgeschlossen' : 'auch offene Status',
    row.countingMode.countOnlyPaidOrders ? 'nur bezahlt' : 'auch unbezahlt',
  ]

  return modeParts.join(' • ')
}

function buildFormState(pricingSource: TenantBillingPricingSource): PricingFormState {
  return {
    monthlyBaseFeeEuro: centsToInput(pricingSource.monthlyBaseFeeCents),
    includedOrders: String(pricingSource.includedOrders ?? 0),
    commissionPercent: String(pricingSource.commissionPercent ?? 0),
    commissionAfterIncludedOrdersPercent:
      pricingSource.commissionAfterIncludedOrdersPercent === null
        ? ''
        : String(pricingSource.commissionAfterIncludedOrdersPercent),
    fixedFeePerAdditionalOrderEuro: centsToInput(
      pricingSource.fixedFeePerAdditionalOrderCents ?? 0
    ),
    minimumMonthlyFeeEuro: centsToInput(pricingSource.minimumMonthlyFeeCents ?? 0),
    vatRatePercent: pricingSource.vatRatePercent === null ? '' : String(pricingSource.vatRatePercent),
    paymentTermsDays: String(pricingSource.paymentTermsDays ?? 14),
    packageKey: pricingSource.packageKey || '',
    packageLabel: pricingSource.packageLabel || '',
    packageMonthlyFeeEuro: centsToInput(pricingSource.packageMonthlyFeeCents ?? 0),
    activeFrom: pricingSource.activeFrom.slice(0, 10),
    activeUntil: pricingSource.activeUntil ? pricingSource.activeUntil.slice(0, 10) : '',
    legacyPlanNotesText: pricingSource.legacyNotesText || '',
    moduleFees: pricingSource.moduleFees || [],
  }
}

function normalizePricingFormState(state: PricingFormState | null) {
  if (!state) return null
  return JSON.stringify({
    monthlyBaseFeeEuro: state.monthlyBaseFeeEuro,
    includedOrders: state.includedOrders,
    commissionPercent: state.commissionPercent,
    commissionAfterIncludedOrdersPercent: state.commissionAfterIncludedOrdersPercent,
    fixedFeePerAdditionalOrderEuro: state.fixedFeePerAdditionalOrderEuro,
    minimumMonthlyFeeEuro: state.minimumMonthlyFeeEuro,
    vatRatePercent: state.vatRatePercent,
    paymentTermsDays: state.paymentTermsDays,
    packageKey: state.packageKey,
    packageLabel: state.packageLabel,
    packageMonthlyFeeEuro: state.packageMonthlyFeeEuro,
    activeFrom: state.activeFrom,
    activeUntil: state.activeUntil,
    legacyPlanNotesText: state.legacyPlanNotesText,
    moduleFees: [...state.moduleFees]
      .map((entry) => ({
        key: entry.key,
        label: entry.label,
        monthlyFeeCents: Math.max(0, entry.monthlyFeeCents || 0),
        enabled: Boolean(entry.enabled),
      }))
      .sort((left, right) => left.key.localeCompare(right.key)),
  })
}

function buildBillingProfileFormState(config: TenantBillingConfig): BillingProfileFormState {
  return {
    companyName: config.billingProfile.companyName || '',
    contactPerson: config.billingProfile.contactPerson || '',
    street: config.billingProfile.street || '',
    zipCode: config.billingProfile.zipCode || '',
    city: config.billingProfile.city || '',
    countryCode: config.billingProfile.countryCode || 'DE',
    invoiceEmail: config.billingProfile.invoiceEmail || '',
    vatId: config.billingProfile.vatId || '',
    taxNumber: config.billingProfile.taxNumber || '',
    paymentTermsDays: String(
      config.billingProfile.paymentTermsDays || config.pricingSource.paymentTermsDays || 14
    ),
    paymentMethod: config.billingProfile.paymentMethod || '',
  }
}

function normalizeBillingProfileFormState(state: BillingProfileFormState | null) {
  if (!state) return null
  return JSON.stringify({
    companyName: state.companyName.trim(),
    contactPerson: state.contactPerson.trim(),
    street: state.street.trim(),
    zipCode: state.zipCode.trim(),
    city: state.city.trim(),
    countryCode: state.countryCode.trim().toUpperCase(),
    invoiceEmail: state.invoiceEmail.trim(),
    vatId: state.vatId.trim(),
    taxNumber: state.taxNumber.trim(),
    paymentTermsDays: state.paymentTermsDays.trim(),
    paymentMethod: state.paymentMethod.trim(),
  })
}

function upsertModuleFee(
  state: PricingFormState,
  input: {
    key: string
    label: string
    monthlyFeeCents?: number
    enabled?: boolean
  }
) {
  const existing = state.moduleFees.find((entry) => entry.key === input.key)
  const monthlyFeeCents = Math.max(
    0,
    input.monthlyFeeCents ?? existing?.monthlyFeeCents ?? 0
  )
  const enabled =
    typeof input.enabled === 'boolean'
      ? input.enabled
      : typeof existing?.enabled === 'boolean'
        ? existing.enabled
        : monthlyFeeCents > 0

  return {
    ...state,
    moduleFees: [
      ...state.moduleFees.filter((entry) => entry.key !== input.key),
      {
        key: input.key,
        label: input.label,
        monthlyFeeCents,
        enabled,
      },
    ],
  }
}

export default function SuperadminBillingPage() {
  const [token, setToken] = useState('')
  const [month, setMonth] = useState(currentMonth())
  const [summary, setSummary] = useState<BillingSummaryResponse | null>(null)
  const [tenantRows, setTenantRows] = useState<BillingTenantRow[]>([])
  const [tenantOptions, setTenantOptions] = useState<Array<{ id: string; name: string }>>([])
  const [moduleCatalog, setModuleCatalog] = useState<FeatureModuleDefinition[]>([])
  const [selectedTenantId, setSelectedTenantId] = useState('')
  const [previewTenantId, setPreviewTenantId] = useState('')
  const [previewMonth, setPreviewMonth] = useState(currentMonth())
  const [invoicePreview, setInvoicePreview] = useState<BillingInvoicePreview | null>(null)
  const [tenantConfig, setTenantConfig] = useState<TenantBillingConfig | null>(null)
  const [pricingForm, setPricingForm] = useState<PricingFormState | null>(null)
  const [billingProfileForm, setBillingProfileForm] = useState<BillingProfileFormState | null>(null)
  const [finalizedInvoices, setFinalizedInvoices] = useState<BillingInvoice[]>([])
  const [loading, setLoading] = useState(false)
  const [previewLoading, setPreviewLoading] = useState(false)
  const [previewFinalizing, setPreviewFinalizing] = useState(false)
  const [pdfLoadingInvoiceId, setPdfLoadingInvoiceId] = useState('')
  const [previewError, setPreviewError] = useState('')
  const [saving, setSaving] = useState(false)
  const [profileSaving, setProfileSaving] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/superadmin'
      return
    }
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    if (!token) return
    void (async () => {
      try {
        setLoading(true)
        setError('')
        const [summaryResult, tenantsResult, contextResult, catalogResult, invoiceResult] =
          await Promise.all([
            getBillingSummary(token, { month }),
            getBillingTenants(token, { month }),
            getAccessContext(token),
            getFeatureModuleCatalog(token),
            getBillingInvoices(token, { month }),
          ])
        setSummary(summaryResult)
        setTenantRows(tenantsResult.rows)
        setTenantOptions(contextResult.tenants.map((tenant) => ({ id: tenant.id, name: tenant.name })))
        setModuleCatalog(catalogResult.modules)
        setFinalizedInvoices(invoiceResult.filter((invoice) => invoice.status !== 'DRAFT'))
        if (!selectedTenantId) {
          setSelectedTenantId(tenantsResult.rows[0]?.tenantId || contextResult.tenants[0]?.id || '')
        }
        if (!previewTenantId) {
          setPreviewTenantId(tenantsResult.rows[0]?.tenantId || contextResult.tenants[0]?.id || '')
        }
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Billing-Daten konnten nicht geladen werden')
      } finally {
        setLoading(false)
      }
    })()
  }, [token, month])

  useEffect(() => {
    setPreviewMonth(month)
  }, [month])

  useEffect(() => {
    setInvoicePreview(null)
    setPreviewError('')
  }, [previewTenantId, previewMonth])

  useEffect(() => {
    if (!token || !selectedTenantId) return
    void (async () => {
      try {
        const result = await getTenantBillingConfig(token, selectedTenantId)
        setTenantConfig(result)
        setPricingForm(buildFormState(result.pricingSource))
        setBillingProfileForm(buildBillingProfileFormState(result))
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Gebuehrenquelle konnte nicht geladen werden')
      }
    })()
  }, [token, selectedTenantId])

  function buildBillingConfigPayload() {
    if (!tenantConfig || !pricingForm || !billingProfileForm) return null
    const paymentTermsDays = toInt(
      billingProfileForm.paymentTermsDays || pricingForm.paymentTermsDays,
      tenantConfig.billingProfile.paymentTermsDays || tenantConfig.pricingSource.paymentTermsDays || 14
    )
    const moduleFees = pricingForm.moduleFees
      .map((entry) => ({
        ...entry,
        monthlyFeeCents: Math.max(0, entry.monthlyFeeCents || 0),
        enabled: Boolean(entry.enabled),
      }))
      .filter((entry) => entry.enabled || entry.monthlyFeeCents > 0)
    return {
        planType: tenantConfig.plan.planType,
        monthlyFeeCents: euroToCents(pricingForm.monthlyBaseFeeEuro),
        includedOrders: toInt(pricingForm.includedOrders, tenantConfig.pricingSource.includedOrders),
        commissionPercent: toNumber(pricingForm.commissionPercent, tenantConfig.pricingSource.commissionPercent),
        commissionAfterIncludedOrdersPercent: pricingForm.commissionAfterIncludedOrdersPercent.trim()
          ? toNumber(pricingForm.commissionAfterIncludedOrdersPercent)
          : null,
        fixedFeePerOrderCents: euroToCents(pricingForm.fixedFeePerAdditionalOrderEuro),
        billingPeriod: tenantConfig.plan.billingPeriod,
        activeFrom: pricingForm.activeFrom || tenantConfig.plan.activeFrom,
        activeUntil: pricingForm.activeUntil || null,
        isActive: tenantConfig.plan.isActive,
        notes: pricingForm.legacyPlanNotesText || null,
        paymentFeeBearer: tenantConfig.settings.paymentFeeBearer,
        countOnlyPaidOrders: tenantConfig.settings.countOnlyPaidOrders,
        countOnlyCompletedOrders: tenantConfig.settings.countOnlyCompletedOrders,
        excludeCanceledOrders: tenantConfig.settings.excludeCanceledOrders,
        revenueMode: tenantConfig.settings.revenueMode,
        currency: tenantConfig.settings.currency,
        timezone: tenantConfig.settings.timezone,
        settingsNotes: tenantConfig.settings.notes,
        paymentTermsDays,
        paymentMethod: billingProfileForm.paymentMethod.trim() || null,
        invoiceEmail: billingProfileForm.invoiceEmail.trim() || null,
        billingEmail: tenantConfig.billingProfile.contactEmail,
        profileCompanyName: billingProfileForm.companyName.trim() || null,
        profileStreet: billingProfileForm.street.trim() || null,
        profileZipCode: billingProfileForm.zipCode.trim() || null,
        profileCity: billingProfileForm.city.trim() || null,
        profileCountryCode: billingProfileForm.countryCode.trim().toUpperCase() || 'DE',
        profileVatId: billingProfileForm.vatId.trim() || null,
        profileContactEmail: tenantConfig.billingProfile.contactEmail,
        profileLegalForm: tenantConfig.billingProfile.legalForm || null,
        profileTaxNumber: billingProfileForm.taxNumber.trim() || null,
        profileManagingDirector: tenantConfig.billingProfile.managingDirector || null,
        profilePhone: tenantConfig.billingProfile.phone || null,
        profileWebsite: tenantConfig.billingProfile.website || null,
        profileContactPerson: billingProfileForm.contactPerson.trim() || null,
        profilePaymentMethod: billingProfileForm.paymentMethod.trim() || null,
        profilePaymentTermsDays: paymentTermsDays,
        profilePaymentStatus: tenantConfig.billingProfile.paymentStatus || null,
        profileSepaActive: tenantConfig.billingProfile.sepaActive || false,
        profileSepaCreditorId: tenantConfig.billingProfile.sepaCreditorId || null,
        profileBankName: tenantConfig.billingProfile.bankName || null,
        profileIban: tenantConfig.billingProfile.iban || null,
        profileBic: tenantConfig.billingProfile.bic || null,
        profileInvoiceLogoUrl: tenantConfig.billingProfile.invoiceLogoUrl || null,
        profileStripeCustomerId: tenantConfig.billingProfile.stripeCustomerId || null,
        profilePaymentProviderStatus: tenantConfig.billingProfile.paymentProviderStatus || null,
        sepaMandateReference: tenantConfig.billingProfile.sepaMandateReference || null,
        minimumMonthlyFeeCents: euroToCents(pricingForm.minimumMonthlyFeeEuro),
        vatRatePercent: toOptionalNumber(pricingForm.vatRatePercent),
        packageKey: pricingForm.packageKey || null,
        packageLabel: pricingForm.packageLabel || null,
        packageMonthlyFeeCents: euroToCents(pricingForm.packageMonthlyFeeEuro),
        moduleFees,
        legacyPlanNotesText: pricingForm.legacyPlanNotesText || null,
      }
  }

  async function refreshTenantBillingConfig() {
    if (!token || !tenantConfig) return
    const refreshed = await getTenantBillingConfig(token, tenantConfig.tenant.id)
    setTenantConfig(refreshed)
    setPricingForm(buildFormState(refreshed.pricingSource))
    setBillingProfileForm(buildBillingProfileFormState(refreshed))
  }

  async function handleSave() {
    if (!token || !tenantConfig || !pricingForm || !billingProfileForm) return
    try {
      setSaving(true)
      setError('')
      const payload = buildBillingConfigPayload()
      if (!payload) return
      await updateTenantBillingConfig(token, tenantConfig.tenant.id, payload)
      await refreshTenantBillingConfig()
      setInfo('Gebühren gespeichert.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Gebuehrenquelle konnte nicht gespeichert werden')
    } finally {
      setSaving(false)
    }
  }

  async function handleSaveBillingProfile() {
    if (!token || !tenantConfig || !pricingForm || !billingProfileForm) return
    try {
      setProfileSaving(true)
      setError('')
      const payload = buildBillingConfigPayload()
      if (!payload) return
      await updateTenantBillingConfig(token, tenantConfig.tenant.id, payload)
      await refreshTenantBillingConfig()
      setInfo('Rechnungsdaten gespeichert. Bitte Vorschau neu laden.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rechnungsdaten konnten nicht gespeichert werden')
    } finally {
      setProfileSaving(false)
    }
  }

  async function handleLoadInvoicePreview() {
    if (!token || !previewTenantId) return
    try {
      setPreviewLoading(true)
      setError('')
      setPreviewError('')
      const preview = await getBillingInvoicePreview(token, {
        tenantId: previewTenantId,
        month: previewMonth,
      })
      setInvoicePreview(preview)
    } catch (cause) {
      const message = cause instanceof Error ? cause.message : 'Rechnungsvorschau konnte nicht geladen werden'
      setError(message)
      setPreviewError(message)
    } finally {
      setPreviewLoading(false)
    }
  }

  async function handleFinalizeInvoicePreview() {
    if (!token || !previewTenantId || !invoicePreview) return
    try {
      setPreviewFinalizing(true)
      setError('')
      setInfo('')
      const result = await finalizeBillingInvoicePreview(token, {
        tenantId: previewTenantId,
        month: previewMonth,
      })
      const [summaryResult, tenantsResult, invoiceResult] = await Promise.all([
        getBillingSummary(token, { month }),
        getBillingTenants(token, { month }),
        getBillingInvoices(token, { month }),
      ])
      setSummary(summaryResult)
      setTenantRows(tenantsResult.rows)
      setFinalizedInvoices(invoiceResult.filter((invoice) => invoice.status !== 'DRAFT'))
      setInfo(`Rechnung finalisiert: ${result.invoiceNumber}`)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rechnung konnte nicht finalisiert werden')
    } finally {
      setPreviewFinalizing(false)
    }
  }

  async function handleOpenInvoicePdf(invoice: BillingInvoice) {
    if (!token) return
    try {
      setPdfLoadingInvoiceId(invoice.id)
      setError('')
      setInfo('')
      const { blob, fileName } = await downloadBillingInvoicePdf(token, invoice.id)
      const objectUrl = window.URL.createObjectURL(blob)
      const popup = window.open(objectUrl, '_blank', 'noopener,noreferrer')
      if (!popup) {
        const anchor = document.createElement('a')
        anchor.href = objectUrl
        anchor.download = fileName
        anchor.rel = 'noopener'
        anchor.click()
      }
      window.setTimeout(() => window.URL.revokeObjectURL(objectUrl), 60_000)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rechnungs-PDF konnte nicht geoeffnet werden')
    } finally {
      setPdfLoadingInvoiceId('')
    }
  }

  const summaryCards = useMemo(() => summary?.summary || null, [summary])
  const pricingBaseline = useMemo(
    () => normalizePricingFormState(tenantConfig ? buildFormState(tenantConfig.pricingSource) : null),
    [tenantConfig]
  )
  const pricingCurrent = useMemo(() => normalizePricingFormState(pricingForm), [pricingForm])
  const billingProfileBaseline = useMemo(
    () => normalizeBillingProfileFormState(tenantConfig ? buildBillingProfileFormState(tenantConfig) : null),
    [tenantConfig]
  )
  const billingProfileCurrent = useMemo(
    () => normalizeBillingProfileFormState(billingProfileForm),
    [billingProfileForm]
  )
  const hasPricingChanges = Boolean(selectedTenantId && pricingCurrent && pricingBaseline && pricingCurrent !== pricingBaseline)
  const hasBillingProfileChanges = Boolean(
    selectedTenantId &&
      billingProfileCurrent &&
      billingProfileBaseline &&
      billingProfileCurrent !== billingProfileBaseline
  )
  const canSavePricing = Boolean(selectedTenantId && pricingForm) && !saving
  const canSaveBillingProfile = Boolean(selectedTenantId && billingProfileForm) && !profileSaving
  const canLoadPreview = Boolean(token && previewTenantId) && !previewLoading
  const currentFinalizedInvoice = useMemo(
    () =>
      finalizedInvoices.find(
        (invoice) =>
          invoice.tenantId === previewTenantId &&
          invoice.periodStart.slice(0, 7) === previewMonth &&
          invoice.status !== 'DRAFT'
      ) || null,
    [finalizedInvoices, previewMonth, previewTenantId]
  )
  const canFinalizePreview =
    Boolean(token && previewTenantId && invoicePreview) &&
    !previewFinalizing &&
    !invoicePreview?.hasCriticalWarnings &&
    !currentFinalizedInvoice
  const loadPreviewHint = !token
    ? 'Bitte einloggen / Token fehlt.'
    : !previewTenantId
      ? 'Bitte Tenant wählen.'
      : previewLoading
        ? 'Vorschau wird geladen…'
        : 'Lädt die unverbindliche Monatsvorschau für Tenant und Monat.'
  const finalizePreviewHint = !token
    ? 'Bitte einloggen / Token fehlt.'
    : !previewTenantId
      ? 'Bitte zuerst einen Tenant wählen.'
      : !invoicePreview
        ? 'Bitte zuerst Vorschau laden.'
        : currentFinalizedInvoice
          ? 'Für diesen Monat wurde bereits eine Rechnung finalisiert.'
          : invoicePreview.hasCriticalWarnings
            ? 'Kritische Warnungen müssen behoben werden.'
            : previewFinalizing
              ? 'Rechnung wird finalisiert…'
              : 'Die geprüfte Vorschau kann jetzt in eine finale Rechnung überführt werden.'
  const finalizationRequirementDetails =
    !invoicePreview
      ? ['Bitte zuerst Vorschau laden.']
      : invoicePreview.hasCriticalWarnings
        ? invoicePreview.criticalWarnings
        : []
  const previewInfoMessages = useMemo(
    () =>
      (invoicePreview?.warnings || []).filter(
        (warning) =>
          warning.startsWith('Info: ') ||
          warning.includes('Test') ||
          warning.includes('Demo') ||
          warning.includes('offene') ||
          warning.includes('unvollständige') ||
          warning.includes('unvollstaendige') ||
          warning.includes('Nutzungszaehlung:')
      ),
    [invoicePreview]
  )
  const previewWarningMessages = useMemo(
    () =>
      (invoicePreview?.warnings || []).filter(
        (warning) => !previewInfoMessages.includes(warning)
      ),
    [invoicePreview, previewInfoMessages]
  )
  const usageRows = useMemo(() => tenantRows, [tenantRows])
  const topRevenueRows = useMemo(
    () => [...tenantRows].sort((left, right) => right.monthlyTotalRevenueCents - left.monthlyTotalRevenueCents).slice(0, 10),
    [tenantRows]
  )
  const usageSummary = useMemo(() => {
    return usageRows.reduce(
      (acc, row) => {
        acc.totalOrders += row.totalOrders
        acc.billableOrders += row.billableOrders
        acc.includedOrders += row.includedOrders
        acc.includedOrdersUsed += row.includedOrdersUsed
        acc.additionalOrders += row.additionalOrders
        acc.nonBillableOrders += row.nonBillableOrders
        acc.canceledOrders += row.canceledOrders
        acc.testOrders += row.testOrders
        acc.refundedOrders += row.refundedOrders
        acc.grossOrderValueCents += row.grossOrderValueCents
        acc.billableOrderValueCents += row.billableOrderValueCents
        return acc
      },
      {
        totalOrders: 0,
        billableOrders: 0,
        includedOrders: 0,
        includedOrdersUsed: 0,
        additionalOrders: 0,
        nonBillableOrders: 0,
        canceledOrders: 0,
        testOrders: 0,
        refundedOrders: 0,
        grossOrderValueCents: 0,
        billableOrderValueCents: 0,
      }
    )
  }, [usageRows])

  return (
    <BackofficeLayout brand="Superadmin" title="Billing & Finanzen" subtitle="Kanonische Masterseite fuer Gebuehrenquellen im Superadmin" navItems={SUPERADMIN_NAV_ITEMS}>
      <div className="space-y-5">
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
        {info ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{info}</div> : null}
        <ImplementationNotice title="Serverseitige Gebuehrenquelle" message="Grundgebuehr, Modulgebuehren, Paketpreis, Inklusivbestellungen, Provision, Fixbetrag, Mindestgebuehr, MwSt. und Zahlungsziel werden hier zentral serverseitig gepflegt. Rechnungslogik, PDF und DATEV bleiben bewusst unveraendert." tone="info" />
        <div className="grid gap-3 md:grid-cols-4">
          <div className="rounded-2xl border border-slate-200 bg-white p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Monat</p><input type="month" value={month} onChange={(event) => setMonth(event.target.value)} className="mt-2 rounded-xl border border-slate-300 px-3 py-2 text-sm" /></div>
          <div className="rounded-2xl border border-slate-200 bg-white p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Tenant-Zaehlung</p><p className="mt-2 text-xl font-semibold text-slate-900">{tenantRows.length}</p></div>
          <div className="rounded-2xl border border-slate-200 bg-white p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Plattformumsatz netto</p><p className="mt-2 text-xl font-semibold text-slate-900">{summaryCards ? centsToEuro(summaryCards.platformRevenueNetCents) : '-'}</p></div>
          <div className="rounded-2xl border border-slate-200 bg-white p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Offene Rechnungen</p><p className="mt-2 text-xl font-semibold text-slate-900">{summaryCards?.openInvoices ?? 0}</p></div>
        </div>
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Tarife & Module</h3>
          <p className="mt-1 text-sm text-slate-600">Master-Quelle: `TenantBillingPlan` + `BillingProfile.paymentTermsDays` + strukturierte `pricingSource`-Metadaten im Plan-Notes-Feld. Alte Browser-only Preisquellen werden hier nicht weiter gepflegt.</p>
          <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Tenant</span><select value={selectedTenantId} onChange={(event) => setSelectedTenantId(event.target.value)} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"><option value="">Bitte waehlen</option>{tenantOptions.map((tenant) => <option key={tenant.id} value={tenant.id}>{tenant.name}</option>)}</select></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Grundgebuehr (EUR)</span><input value={pricingForm?.monthlyBaseFeeEuro || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, monthlyBaseFeeEuro: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Inklusivbestellungen</span><input value={pricingForm?.includedOrders || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, includedOrders: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Provision (%)</span><input value={pricingForm?.commissionPercent || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, commissionPercent: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Provision nach Kontingent (%)</span><input value={pricingForm?.commissionAfterIncludedOrdersPercent || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, commissionAfterIncludedOrdersPercent: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Fixbetrag je Zusatzbestellung (EUR)</span><input value={pricingForm?.fixedFeePerAdditionalOrderEuro || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, fixedFeePerAdditionalOrderEuro: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Mindestgebuehr (EUR)</span><input value={pricingForm?.minimumMonthlyFeeEuro || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, minimumMonthlyFeeEuro: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">MwSt. (%)</span><input value={pricingForm?.vatRatePercent || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, vatRatePercent: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Zahlungsziel (Tage)</span><input value={pricingForm?.paymentTermsDays || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, paymentTermsDays: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Paket-Key</span><input value={pricingForm?.packageKey || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, packageKey: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Paket-Name</span><input value={pricingForm?.packageLabel || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, packageLabel: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
            <label className="text-sm text-slate-700"><span className="mb-1 block font-medium">Paketpreis (EUR)</span><input value={pricingForm?.packageMonthlyFeeEuro || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, packageMonthlyFeeEuro: event.target.value })} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
          </div>
          <div className="mt-4 rounded-2xl border border-slate-200 bg-slate-50 p-4">
            <p className="text-sm font-semibold text-slate-900">Modulgebuehren</p>
            <div className="mt-3 space-y-3">
              {moduleCatalog.map((module) => {
                const fee = pricingForm?.moduleFees.find((entry) => entry.key === module.key)
                return (
                  <div key={module.key} className="grid gap-3 md:grid-cols-[minmax(0,2fr)_120px_100px]">
                    <div><p className="text-sm font-medium text-slate-900">{module.name}</p><p className="text-xs text-slate-500">{module.description}</p></div>
                    <input value={fee ? centsToInput(fee.monthlyFeeCents) : '0.00'} onChange={(event) => pricingForm && setPricingForm(upsertModuleFee(pricingForm, { key: module.key, label: module.name, monthlyFeeCents: euroToCents(event.target.value) }))} className="rounded-xl border border-slate-300 bg-white px-3 py-2 text-sm" />
                    <label className="flex items-center gap-2 rounded-xl border border-slate-300 bg-white px-3 py-2 text-sm"><input type="checkbox" checked={fee?.enabled || false} onChange={(event) => pricingForm && setPricingForm(upsertModuleFee(pricingForm, { key: module.key, label: module.name, enabled: event.target.checked }))} />Aktiv</label>
                  </div>
                )
              })}
            </div>
          </div>
          <label className="mt-4 block text-sm text-slate-700"><span className="mb-1 block font-medium">Legacy-Notizen</span><textarea value={pricingForm?.legacyPlanNotesText || ''} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, legacyPlanNotesText: event.target.value })} rows={3} className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm" /></label>
          <div className="mt-6 rounded-2xl border border-[var(--brand-border)] bg-slate-50 p-4">
            <div className="flex flex-col gap-3 md:flex-row md:items-center md:justify-between">
              <div className="text-sm text-slate-700">
                <p className="font-semibold text-slate-900">Gebührenformular speichern</p>
                <p className="mt-1">
                  Diese Aktion speichert die bearbeiteten Werte fuer Grundgebuehr, Module, Paket,
                  Provisionen und Zahlungsziel serverseitig.
                </p>
                <p className={`mt-2 text-xs ${hasPricingChanges ? 'font-semibold text-emerald-700' : 'text-slate-500'}`}>
                  {hasPricingChanges
                    ? 'Ungespeicherte Änderungen erkannt.'
                    : selectedTenantId
                      ? 'Keine ungespeicherten Änderungen.'
                      : 'Bitte zuerst einen Tenant auswählen.'}
                </p>
              </div>
              <button
                type="button"
                onClick={() => void handleSave()}
                disabled={!canSavePricing}
                className={`w-full rounded-xl px-5 py-3 text-sm font-semibold text-white transition disabled:cursor-not-allowed disabled:opacity-50 md:w-auto ${
                  hasPricingChanges
                    ? 'bg-emerald-600 shadow-lg shadow-emerald-200'
                    : 'bg-[var(--brand-strong)]'
                }`}
              >
                {saving ? 'Speichert…' : 'Gebühren speichern'}
              </button>
            </div>
            <div className="mt-3 flex flex-wrap gap-3">
              <div className="rounded-xl border border-slate-200 bg-white px-3 py-2 text-xs text-slate-600">
                {selectedTenantId
                  ? 'Bestehende API-Funktion aktiv: updateTenantBillingConfig'
                  : 'Bitte zuerst einen Tenant auswaehlen, um Gebuehren zu speichern.'}
              </div>
              <div className="rounded-xl border border-slate-200 bg-white px-3 py-2 text-xs text-slate-600">
                Keine Rechnungslogik geaendert. Keine Datenmigration ausgefuehrt.
              </div>
            </div>
          </div>
        </section>
        <section
          id="billing-profile-section"
          className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm scroll-mt-24"
        >
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Rechnungsdaten / Billing-Profil</h3>
          <p className="mt-1 text-sm text-slate-600">
            Diese Stammdaten werden serverseitig im Billing-Profil gepflegt und in zukünftige
            Vorschauen und Finalisierungen übernommen. Bereits finalisierte Rechnungen bleiben unverändert.
          </p>
          <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Tenant</span>
              <select
                value={selectedTenantId}
                onChange={(event) => setSelectedTenantId(event.target.value)}
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              >
                <option value="">Bitte waehlen</option>
                {tenantOptions.map((tenant) => (
                  <option key={`billing-profile-${tenant.id}`} value={tenant.id}>
                    {tenant.name}
                  </option>
                ))}
              </select>
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Rechnungsempfänger / Firmenname</span>
              <input
                value={billingProfileForm?.companyName || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, companyName: event.target.value })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Ansprechpartner</span>
              <input
                value={billingProfileForm?.contactPerson || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, contactPerson: event.target.value })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Straße</span>
              <input
                value={billingProfileForm?.street || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, street: event.target.value })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">PLZ</span>
              <input
                value={billingProfileForm?.zipCode || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, zipCode: event.target.value })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Ort</span>
              <input
                value={billingProfileForm?.city || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, city: event.target.value })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Land</span>
              <input
                value={billingProfileForm?.countryCode || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, countryCode: event.target.value.toUpperCase() })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Rechnungs-E-Mail</span>
              <input
                type="email"
                value={billingProfileForm?.invoiceEmail || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, invoiceEmail: event.target.value })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">USt-ID</span>
              <input
                value={billingProfileForm?.vatId || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, vatId: event.target.value })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Steuernummer</span>
              <input
                value={billingProfileForm?.taxNumber || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, taxNumber: event.target.value })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Zahlungsziel Tage</span>
              <input
                value={billingProfileForm?.paymentTermsDays || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, paymentTermsDays: event.target.value })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Zahlungsart</span>
              <input
                value={billingProfileForm?.paymentMethod || ''}
                onChange={(event) =>
                  billingProfileForm &&
                  setBillingProfileForm({ ...billingProfileForm, paymentMethod: event.target.value })
                }
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
          </div>
          <div className="mt-6 rounded-2xl border border-[var(--brand-border)] bg-slate-50 p-4">
            <div className="flex flex-col gap-3 md:flex-row md:items-center md:justify-between">
              <div className="text-sm text-slate-700">
                <p className="font-semibold text-slate-900">Rechnungsdaten speichern</p>
                <p className="mt-1">
                  Speichert die Rechnungsadresse und Billing-Stammdaten serverseitig in der bestehenden
                  Billing-Masterquelle. Bereits finalisierte Rechnungen werden nicht verändert.
                </p>
                <p className={`mt-2 text-xs ${hasBillingProfileChanges ? 'font-semibold text-emerald-700' : 'text-slate-500'}`}>
                  {hasBillingProfileChanges
                    ? 'Ungespeicherte Änderungen an den Rechnungsdaten erkannt.'
                    : selectedTenantId
                      ? 'Keine ungespeicherten Änderungen an den Rechnungsdaten.'
                      : 'Bitte zuerst einen Tenant auswählen.'}
                </p>
              </div>
              <button
                type="button"
                onClick={() => void handleSaveBillingProfile()}
                disabled={!canSaveBillingProfile}
                className={`w-full rounded-xl px-5 py-3 text-sm font-semibold text-white transition disabled:cursor-not-allowed disabled:opacity-50 md:w-auto ${
                  hasBillingProfileChanges
                    ? 'bg-emerald-600 shadow-lg shadow-emerald-200'
                    : 'bg-[var(--brand-strong)]'
                }`}
              >
                {profileSaving ? 'Speichert…' : 'Rechnungsdaten speichern'}
              </button>
            </div>
          </div>
        </section>
        <div className="sticky bottom-4 z-20">
          <div className="mx-auto max-w-3xl rounded-2xl border border-[var(--brand-border)] bg-white/95 p-3 shadow-lg backdrop-blur">
            <button
              type="button"
              onClick={() => void handleSave()}
              disabled={!canSavePricing}
              className={`w-full rounded-xl px-4 py-3 text-sm font-semibold text-white transition disabled:cursor-not-allowed disabled:opacity-50 ${
                hasPricingChanges
                  ? 'bg-emerald-600 shadow-lg shadow-emerald-200'
                  : 'bg-[var(--brand-strong)]'
              }`}
            >
              {saving ? 'Speichert…' : 'Gebühren speichern'}
            </button>
            <p className="mt-2 text-center text-xs text-slate-600">
              {selectedTenantId
                ? hasPricingChanges
                  ? 'Änderungen können jetzt gespeichert werden.'
                  : 'Gebührenwerte sind aktuell gespeichert.'
                : 'Bitte zuerst einen Tenant auswählen.'}
            </p>
          </div>
        </div>
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Nutzung im Monat</h3>
          <p className="mt-1 text-sm text-slate-600">
            Live-Auswertung fuer Inklusivbestellungen, Zusatzbestellungen und spaetere Rechnungsvorschau.
            Es wird bewusst noch keine Rechnung erzeugt oder finalisiert.
          </p>
          {loading ? (
            <p className="mt-4 text-sm text-slate-600">Lade Nutzungszaehlung...</p>
          ) : (
            <>
              <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-5">
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Bestellungen gesamt</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{usageSummary.totalOrders}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Abrechnungsrelevant</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{usageSummary.billableOrders}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Inklusiv verbraucht</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{usageSummary.includedOrdersUsed}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Zusatzbestellungen</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{usageSummary.additionalOrders}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Nicht abrechenbar</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{usageSummary.nonBillableOrders}</p>
                </div>
              </div>
              <div className="mt-4 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
                Statuslogik: Es werden nur echte Bestellungen zaehlbar gemacht. Stornierte, erkannte Test-/Demo-
                Bestellungen und erstattete Bestellungen werden defensiv ausgeschlossen. Offene oder unklare Status
                werden nur dann mitgezaehlt, wenn der Tenant dies ueber seine Billing-Einstellungen ausdruecklich
                erlaubt.
              </div>
              <div className="mt-4 overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead>
                    <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                      <th className="px-2 py-2">Tenant</th>
                      <th className="px-2 py-2">Monat</th>
                      <th className="px-2 py-2">Gesamt</th>
                      <th className="px-2 py-2">Abrechenbar</th>
                      <th className="px-2 py-2">Inklusiv</th>
                      <th className="px-2 py-2">Verbraucht</th>
                      <th className="px-2 py-2">Zusatz</th>
                      <th className="px-2 py-2">Storniert</th>
                      <th className="px-2 py-2">Test</th>
                      <th className="px-2 py-2">Nicht abrechenbar</th>
                      <th className="px-2 py-2">Brutto</th>
                      <th className="px-2 py-2">Zaehllogik</th>
                    </tr>
                  </thead>
                  <tbody>
                    {usageRows.map((row) => (
                      <tr key={row.tenantId} className="border-b border-slate-100 align-top">
                        <td className="px-2 py-2">
                          <div className="font-medium text-slate-900">{row.tenantName}</div>
                          <div className="text-xs text-slate-500">{row.chainName || 'Ohne Chain'}</div>
                        </td>
                        <td className="px-2 py-2 text-slate-700">{row.month}</td>
                        <td className="px-2 py-2 text-slate-700">{row.totalOrders}</td>
                        <td className="px-2 py-2 font-medium text-slate-900">{row.billableOrders}</td>
                        <td className="px-2 py-2 text-slate-700">{row.includedOrders}</td>
                        <td className="px-2 py-2 text-slate-700">{row.includedOrdersUsed}</td>
                        <td className="px-2 py-2 text-slate-700">{row.additionalOrders}</td>
                        <td className="px-2 py-2 text-slate-700">{row.canceledOrders}</td>
                        <td className="px-2 py-2 text-slate-700">{row.testOrders}</td>
                        <td className="px-2 py-2 text-slate-700">
                          <div>{row.nonBillableOrders}</div>
                          <div className="text-xs text-slate-500">
                            Offen {row.openOrders} • Refunds {row.refundedOrders}
                          </div>
                        </td>
                        <td className="px-2 py-2 text-slate-700">{centsToEuro(row.grossOrderValueCents)}</td>
                        <td className="px-2 py-2 text-xs text-slate-600">
                          <div>{usageCounterLabel(row)}</div>
                          {row.countingNotes.length ? (
                            <div className="mt-1 space-y-1">
                              {row.countingNotes.map((note, index) => (
                                <p key={`${row.tenantId}-note-${index}`}>{note}</p>
                              ))}
                            </div>
                          ) : (
                            <div className="mt-1 text-slate-500">Keine zusaetzlichen Hinweise.</div>
                          )}
                        </td>
                      </tr>
                    ))}
                    {usageRows.length === 0 ? (
                      <tr>
                        <td colSpan={12} className="px-2 py-6 text-center text-slate-500">
                          Noch keine Tenant-Nutzungsdaten fuer diesen Monat vorhanden.
                        </td>
                      </tr>
                    ) : null}
                  </tbody>
                </table>
              </div>
            </>
          )}
        </section>
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Klarando-Marge</h3>
          <p className="mt-1 text-sm text-slate-600">
            Live-Berechnung auf Basis der serverseitigen Gebuehrenquelle und der monatlichen Nutzungszaehlung.
            PDFs, DATEV und Mahnungen bleiben bewusst ausserhalb dieses Tickets.
          </p>
          <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-6">
            <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <p className="text-xs uppercase tracking-wide text-slate-500">Gesamtumsatz Plattform</p>
              <p className="mt-1 text-lg font-semibold text-slate-900">
                {summaryCards ? centsToEuro(summaryCards.platformMonthlyTotalRevenueCents) : '-'}
              </p>
            </div>
            <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <p className="text-xs uppercase tracking-wide text-slate-500">Grundgebuehren</p>
              <p className="mt-1 text-lg font-semibold text-slate-900">
                {summaryCards ? centsToEuro(summaryCards.platformMonthlyRevenueCents) : '-'}
              </p>
            </div>
            <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <p className="text-xs uppercase tracking-wide text-slate-500">Modulgebuehren</p>
              <p className="mt-1 text-lg font-semibold text-slate-900">
                {summaryCards ? centsToEuro(summaryCards.platformMonthlyModuleRevenueCents) : '-'}
              </p>
            </div>
            <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <p className="text-xs uppercase tracking-wide text-slate-500">Provisionen</p>
              <p className="mt-1 text-lg font-semibold text-slate-900">
                {summaryCards ? centsToEuro(summaryCards.platformMonthlyCommissionRevenueCents) : '-'}
              </p>
            </div>
            <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <p className="text-xs uppercase tracking-wide text-slate-500">Zusatzbestellungen</p>
              <p className="mt-1 text-lg font-semibold text-slate-900">
                {summaryCards ? centsToEuro(summaryCards.platformMonthlyOrderRevenueCents) : '-'}
              </p>
            </div>
            <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <p className="text-xs uppercase tracking-wide text-slate-500">Mindestgebuehr-Korrektur</p>
              <p className="mt-1 text-lg font-semibold text-slate-900">
                {summaryCards ? centsToEuro(summaryCards.platformMonthlyMinimumFeeAdjustmentCents) : '-'}
              </p>
            </div>
          </div>
          <div className="mt-4 rounded-2xl border border-slate-200 bg-slate-50 p-4 text-sm text-slate-700">
            Grundgebuehr enthält hier die monatliche Basisgebuehr sowie gepflegte Paketpreise. Die Mindestgebuehr-
            Korrektur greift nur dann, wenn Grundgebuehr, Module, Provisionen und Zusatzbestellungsgebuehren die
            hinterlegte Monatsuntergrenze noch nicht erreichen.
          </div>
          <div className="mt-4 overflow-x-auto">
            <table className="min-w-full text-sm">
              <thead>
                <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                  <th className="px-2 py-2">Tenant</th>
                  <th className="px-2 py-2">Monat</th>
                  <th className="px-2 py-2">Grundgebuehr</th>
                  <th className="px-2 py-2">Modulgebuehren</th>
                  <th className="px-2 py-2">Provisionen</th>
                  <th className="px-2 py-2">Zusatzbestellungen</th>
                  <th className="px-2 py-2">Mindestgebuehr-Korrektur</th>
                  <th className="px-2 py-2">Gesamtumsatz</th>
                  <th className="px-2 py-2">Abrechenbare Bestellungen</th>
                  <th className="px-2 py-2">Inklusiv / Zusatz</th>
                  <th className="px-2 py-2">Effektiv pro Bestellung</th>
                </tr>
              </thead>
              <tbody>
                {tenantRows.map((row) => (
                  <tr key={`${row.tenantId}-revenue`} className="border-b border-slate-100">
                    <td className="px-2 py-2">
                      <div className="font-medium text-slate-900">{row.tenantName}</div>
                      <div className="text-xs text-slate-500">{row.chainName || 'Ohne Chain'}</div>
                    </td>
                    <td className="px-2 py-2 text-slate-700">{row.month}</td>
                    <td className="px-2 py-2 text-slate-700">{centsToEuro(row.monthlyRevenueCents)}</td>
                    <td className="px-2 py-2 text-slate-700">{centsToEuro(row.monthlyModuleRevenueCents)}</td>
                    <td className="px-2 py-2 text-slate-700">{centsToEuro(row.monthlyCommissionRevenueCents)}</td>
                    <td className="px-2 py-2 text-slate-700">{centsToEuro(row.monthlyOrderRevenueCents)}</td>
                    <td className="px-2 py-2 text-slate-700">{centsToEuro(row.monthlyMinimumFeeAdjustmentCents)}</td>
                    <td className="px-2 py-2 font-medium text-slate-900">{centsToEuro(row.monthlyTotalRevenueCents)}</td>
                    <td className="px-2 py-2 text-slate-700">{row.billableOrders}</td>
                    <td className="px-2 py-2 text-slate-700">
                      {row.includedOrdersUsed} / {row.additionalOrders}
                    </td>
                    <td className="px-2 py-2 text-slate-700">{centsToEuro(row.effectiveRevenuePerOrderCents)}</td>
                  </tr>
                ))}
                {tenantRows.length === 0 ? (
                  <tr>
                    <td colSpan={11} className="px-2 py-6 text-center text-slate-500">
                      Noch keine Margendaten fuer diesen Monat vorhanden.
                    </td>
                  </tr>
                ) : null}
              </tbody>
            </table>
          </div>
          <div className="mt-5 grid gap-4 xl:grid-cols-2">
            <div className="rounded-2xl border border-slate-200 bg-white p-4">
              <h4 className="text-sm font-semibold text-slate-900">Top 10 Umsatz-Tenants</h4>
              <div className="mt-3 space-y-3">
                {topRevenueRows.map((row, index) => (
                  <div key={`${row.tenantId}-top-${index}`} className="flex items-center justify-between gap-3 rounded-xl border border-slate-100 bg-slate-50 px-3 py-3">
                    <div>
                      <p className="text-sm font-medium text-slate-900">
                        {index + 1}. {row.tenantName}
                      </p>
                      <p className="text-xs text-slate-500">
                        {row.billableOrders} abrechenbare Bestellungen • {row.additionalOrders} Zusatzbestellungen
                      </p>
                    </div>
                    <p className="text-sm font-semibold text-slate-900">{centsToEuro(row.monthlyTotalRevenueCents)}</p>
                  </div>
                ))}
                {topRevenueRows.length === 0 ? (
                  <p className="text-sm text-slate-500">Noch keine Umsatz-Tenants vorhanden.</p>
                ) : null}
              </div>
            </div>
            <div className="rounded-2xl border border-slate-200 bg-white p-4">
              <h4 className="text-sm font-semibold text-slate-900">Umsatz nach Gebuehrenart</h4>
              <div className="mt-3 space-y-3 text-sm text-slate-700">
                <div className="flex items-center justify-between rounded-xl border border-slate-100 bg-slate-50 px-3 py-3">
                  <span>Grundgebuehr</span>
                  <span className="font-semibold text-slate-900">
                    {summaryCards ? centsToEuro(summaryCards.platformMonthlyRevenueCents) : '-'}
                  </span>
                </div>
                <div className="flex items-center justify-between rounded-xl border border-slate-100 bg-slate-50 px-3 py-3">
                  <span>Module</span>
                  <span className="font-semibold text-slate-900">
                    {summaryCards ? centsToEuro(summaryCards.platformMonthlyModuleRevenueCents) : '-'}
                  </span>
                </div>
                <div className="flex items-center justify-between rounded-xl border border-slate-100 bg-slate-50 px-3 py-3">
                  <span>Provisionen</span>
                  <span className="font-semibold text-slate-900">
                    {summaryCards ? centsToEuro(summaryCards.platformMonthlyCommissionRevenueCents) : '-'}
                  </span>
                </div>
                <div className="flex items-center justify-between rounded-xl border border-slate-100 bg-slate-50 px-3 py-3">
                  <span>Zusatzbestellungen</span>
                  <span className="font-semibold text-slate-900">
                    {summaryCards ? centsToEuro(summaryCards.platformMonthlyOrderRevenueCents) : '-'}
                  </span>
                </div>
                <div className="flex items-center justify-between rounded-xl border border-slate-100 bg-slate-50 px-3 py-3">
                  <span>Mindestgebuehr-Korrektur</span>
                  <span className="font-semibold text-slate-900">
                    {summaryCards ? centsToEuro(summaryCards.platformMonthlyMinimumFeeAdjustmentCents) : '-'}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </section>
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Rechnungsvorschau</h3>
          <p className="mt-1 text-sm text-slate-600">
            Unverbindliche Monatsvorschau pro Tenant. Es wird nichts gespeichert, keine Rechnungsnummer vergeben und
            erst beim Finalisieren eine echte Rechnung erzeugt.
          </p>
          <div className="mt-4 grid gap-3 md:grid-cols-2">
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Tenant</span>
              <select
                value={previewTenantId}
                onChange={(event) => setPreviewTenantId(event.target.value)}
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              >
                <option value="">Bitte waehlen</option>
                {tenantOptions.map((tenant) => (
                  <option key={`preview-${tenant.id}`} value={tenant.id}>
                    {tenant.name}
                  </option>
                ))}
              </select>
            </label>
            <label className="text-sm text-slate-700">
              <span className="mb-1 block font-medium">Monat</span>
              <input
                type="month"
                value={previewMonth}
                onChange={(event) => setPreviewMonth(event.target.value)}
                className="w-full rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
          </div>
          <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-slate-50 p-4 shadow-sm">
            <p className="text-sm font-semibold text-slate-900">Rechnungsvorschau Aktionen</p>
            <p className="mt-1 text-sm text-slate-600">
              1. Tenant wählen 2. Monat wählen 3. Vorschau laden 4. Vorschau prüfen 5. Rechnung finalisieren
            </p>
            <div className="mt-4 grid gap-3 lg:grid-cols-2">
              <div className="rounded-2xl border border-slate-200 bg-white p-4">
                <p className="text-sm font-semibold text-slate-900">Vorschau laden</p>
                <p className="mt-1 text-sm text-slate-600">
                  Lädt die unverbindliche Monatsvorschau für den ausgewählten Tenant.
                </p>
                <button
                  type="button"
                  onClick={() => void handleLoadInvoicePreview()}
                  disabled={!canLoadPreview}
                  className={`mt-4 w-full rounded-xl border px-4 py-3 text-sm font-semibold text-white shadow-sm transition disabled:cursor-not-allowed disabled:opacity-50 ${
                    canLoadPreview
                      ? 'border-slate-950 bg-slate-950 hover:bg-slate-800'
                      : 'border-slate-400 bg-slate-500'
                  }`}
                >
                  {previewLoading ? 'Vorschau wird geladen…' : 'Vorschau laden'}
                </button>
                <p className="mt-2 text-xs text-slate-500">{loadPreviewHint}</p>
              </div>
              <div className="rounded-2xl border border-slate-200 bg-white p-4">
                <p className="text-sm font-semibold text-slate-900">Rechnung finalisieren</p>
                <p className="mt-1 text-sm text-slate-600">
                  Erst nach geladener und geprüfter Vorschau wird eine echte Rechnung erzeugt.
                </p>
                <button
                  type="button"
                  onClick={() => void handleFinalizeInvoicePreview()}
                  disabled={!canFinalizePreview}
                  className={`mt-4 w-full rounded-xl border px-4 py-3 text-sm font-semibold shadow-sm transition disabled:cursor-not-allowed ${
                    canFinalizePreview
                      ? 'border-slate-950 bg-slate-950 text-white hover:bg-slate-800 hover:border-slate-800'
                      : 'border-slate-300 bg-slate-200 text-slate-700'
                  }`}
                >
                  {previewFinalizing ? 'Finalisiert…' : 'Rechnung finalisieren'}
                </button>
                <p className="mt-2 text-xs text-slate-500">{finalizePreviewHint}</p>
                <p className="mt-2 text-xs text-slate-500">
                  PDF ist erst nach Finalisierung im Bereich Finalisierte Rechnungen verfügbar.
                </p>
                {!canFinalizePreview && finalizationRequirementDetails.length ? (
                  <div className="mt-3 rounded-xl border border-slate-200 bg-slate-50 px-3 py-3 text-xs text-slate-700">
                    <p className="font-semibold text-slate-900">Noch fehlend für die Finalisierung:</p>
                    <ul className="mt-2 list-disc pl-5">
                      {finalizationRequirementDetails.map((detail, index) => (
                        <li key={`finalize-detail-${index}`}>{detail}</li>
                      ))}
                    </ul>
                  </div>
                ) : null}
              </div>
            </div>
          </div>
          {previewError ? (
            <div className="mt-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
              {previewError}
            </div>
          ) : null}
          {invoicePreview ? (
            <>
              <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Tenant</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{invoicePreview.tenant.name}</p>
                  <p className="text-xs text-slate-500">{invoicePreview.tenant.chainName || 'Ohne Chain'}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Leistungszeitraum</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{invoicePreview.period.month}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Netto-Summe</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{centsToEuro(invoicePreview.totals.netAmountCents)}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Brutto-Summe</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{centsToEuro(invoicePreview.totals.grossAmountCents)}</p>
                </div>
              </div>
              <div className="mt-4 overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead>
                    <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                      <th className="px-2 py-2">Position</th>
                      <th className="px-2 py-2">Menge</th>
                      <th className="px-2 py-2">Einzelpreis</th>
                      <th className="px-2 py-2">Netto</th>
                    </tr>
                  </thead>
                  <tbody>
                    {invoicePreview.positions.map((position, index) => (
                      <tr key={`${position.key}-${index}`} className="border-b border-slate-100">
                        <td className="px-2 py-2 text-slate-900">{position.title}</td>
                        <td className="px-2 py-2 text-slate-700">{position.quantity}</td>
                        <td className="px-2 py-2 text-slate-700">{centsToEuro(position.unitPriceCents)}</td>
                        <td className="px-2 py-2 text-slate-700">{centsToEuro(position.netAmountCents)}</td>
                      </tr>
                    ))}
                    {invoicePreview.positions.length === 0 ? (
                      <tr>
                        <td colSpan={4} className="px-2 py-6 text-center text-slate-500">
                          Keine abrechenbaren Vorschaupositionen vorhanden.
                        </td>
                      </tr>
                    ) : null}
                  </tbody>
                  <tfoot>
                    <tr className="border-t border-slate-200 bg-slate-50">
                      <td className="px-2 py-2 font-medium text-slate-900">Netto-Summe</td>
                      <td className="px-2 py-2" />
                      <td className="px-2 py-2" />
                      <td className="px-2 py-2 font-medium text-slate-900">{centsToEuro(invoicePreview.totals.netAmountCents)}</td>
                    </tr>
                    <tr className="bg-slate-50">
                      <td className="px-2 py-2 text-slate-700">
                        MwSt. ({invoicePreview.totals.vatRatePercent === null ? 'fehlt' : `${invoicePreview.totals.vatRatePercent.toFixed(2)}%`})
                      </td>
                      <td className="px-2 py-2" />
                      <td className="px-2 py-2" />
                      <td className="px-2 py-2 text-slate-700">{centsToEuro(invoicePreview.totals.vatAmountCents)}</td>
                    </tr>
                    <tr className="bg-slate-50">
                      <td className="px-2 py-2 font-semibold text-slate-900">Brutto-Summe</td>
                      <td className="px-2 py-2" />
                      <td className="px-2 py-2" />
                      <td className="px-2 py-2 font-semibold text-slate-900">{centsToEuro(invoicePreview.totals.grossAmountCents)}</td>
                    </tr>
                  </tfoot>
                </table>
              </div>
              <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-5">
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Inklusivbestellungen</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{invoicePreview.usage.includedOrders}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Verbrauchte Inklusivbestellungen</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{invoicePreview.usage.includedOrdersUsed}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Zusatzbestellungen</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{invoicePreview.usage.additionalOrders}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Abrechnungsrelevante Bestellungen</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">{invoicePreview.usage.billableOrders}</p>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Effektiv pro Bestellung</p>
                  <p className="mt-1 text-lg font-semibold text-slate-900">
                    {centsToEuro(invoicePreview.usage.effectiveRevenuePerOrderCents)}
                  </p>
                </div>
              </div>
              <div className="mt-4 rounded-2xl border border-slate-200 bg-slate-50 p-4 text-sm text-slate-700">
                <p className="font-semibold text-slate-900">Rechnungsdaten-Snapshot</p>
                <div className="mt-3 grid gap-3 md:grid-cols-2 xl:grid-cols-3">
                  <div>
                    <p className="text-xs uppercase tracking-wide text-slate-500">Empfänger</p>
                    <p className="mt-1 font-medium text-slate-900">
                      {invoicePreview.recipient.recipientName || 'Fehlt'}
                    </p>
                    <p className="mt-1 text-slate-700">
                      {invoicePreview.recipient.contactPerson || 'Kein Ansprechpartner gepflegt'}
                    </p>
                  </div>
                  <div>
                    <p className="text-xs uppercase tracking-wide text-slate-500">Adresse</p>
                    <p className="mt-1 text-slate-900">{invoicePreview.recipient.street || 'Straße fehlt'}</p>
                    <p className="text-slate-700">
                      {invoicePreview.recipient.zipCode || 'PLZ fehlt'} {invoicePreview.recipient.city || 'Ort fehlt'}
                    </p>
                    <p className="text-slate-700">{invoicePreview.recipient.countryCode || 'Land fehlt'}</p>
                  </div>
                  <div>
                    <p className="text-xs uppercase tracking-wide text-slate-500">Abrechnung</p>
                    <p className="mt-1 text-slate-900">{invoicePreview.recipient.invoiceEmail || 'E-Mail fehlt'}</p>
                    <p className="text-slate-700">
                      Zahlungsziel:{' '}
                      {invoicePreview.recipient.paymentTermsDays
                        ? `${invoicePreview.recipient.paymentTermsDays} Tage`
                        : 'fehlt'}
                    </p>
                    <p className="text-slate-700">
                      Zahlungsart: {invoicePreview.recipient.paymentMethod || 'nicht gepflegt'}
                    </p>
                  </div>
                  <div>
                    <p className="text-xs uppercase tracking-wide text-slate-500">Steuerdaten</p>
                    <p className="mt-1 text-slate-900">USt-ID: {invoicePreview.recipient.vatId || 'nicht gepflegt'}</p>
                    <p className="text-slate-700">
                      Steuernummer: {invoicePreview.recipient.taxNumber || 'nicht gepflegt'}
                    </p>
                  </div>
                  <div>
                    <p className="text-xs uppercase tracking-wide text-slate-500">Tenant</p>
                    <p className="mt-1 text-slate-900">{invoicePreview.recipient.tenantId}</p>
                  </div>
                  <div>
                    <p className="text-xs uppercase tracking-wide text-slate-500">Leistungszeitraum</p>
                    <p className="mt-1 text-slate-900">
                      {new Date(invoicePreview.recipient.periodStart).toLocaleDateString('de-DE')} bis{' '}
                      {new Date(invoicePreview.recipient.periodEnd).toLocaleDateString('de-DE')}
                    </p>
                  </div>
                </div>
              </div>
              <div className="mt-4 rounded-2xl border border-slate-200 bg-slate-50 p-4 text-sm text-slate-700">
                <p className="font-semibold text-slate-900">MwSt.-Quelle</p>
                <p className="mt-2">
                  Verwendeter Satz:{' '}
                  <span className="font-medium text-slate-900">
                    {invoicePreview.totals.vatRatePercent === null
                      ? 'nicht konfiguriert'
                      : `${invoicePreview.totals.vatRatePercent.toFixed(2)} %`}
                  </span>
                </p>
                <p className="mt-1">
                  Quelle:{' '}
                  <span className="font-medium text-slate-900">
                    {invoicePreview.totals.vatSource === 'BILLING_MASTER'
                      ? 'Billing-Masterquelle (Tarife & Module)'
                      : 'keine belastbare MwSt.-Konfiguration'}
                  </span>
                </p>
                <p className="mt-1">
                  Land:{' '}
                  <span className="font-medium text-slate-900">
                    {invoicePreview.totals.vatCountry || 'nicht hinterlegt'}
                  </span>
                </p>
              </div>
              {previewWarningMessages.length ? (
                <div className="mt-4 rounded-2xl border border-amber-200 bg-amber-50 p-4">
                  <p className="text-sm font-semibold text-amber-900">Warnungen</p>
                  <div className="mt-2 space-y-2 text-sm text-amber-900">
                    {previewWarningMessages.map((warning, index) => (
                      <p key={`warning-${index}`}>{warning}</p>
                    ))}
                  </div>
                  {invoicePreview.hasCriticalWarnings ? (
                    <button
                      type="button"
                      onClick={() => {
                        if (previewTenantId) setSelectedTenantId(previewTenantId)
                        document.getElementById('billing-profile-section')?.scrollIntoView({
                          behavior: 'smooth',
                          block: 'start',
                        })
                      }}
                      className="mt-3 rounded-xl border border-amber-300 bg-white px-3 py-2 text-sm font-semibold text-amber-900 transition hover:bg-amber-100"
                    >
                      Rechnungsdaten bearbeiten
                    </button>
                  ) : null}
                </div>
              ) : null}
              {previewInfoMessages.length ? (
                <div className="mt-4 rounded-2xl border border-sky-200 bg-sky-50 p-4">
                  <p className="text-sm font-semibold text-sky-900">Hinweise</p>
                  <div className="mt-2 space-y-2 text-sm text-sky-900">
                    {previewInfoMessages.map((message, index) => (
                      <p key={`info-${index}`}>{message.replace(/^Info:\s*/, '')}</p>
                    ))}
                  </div>
                </div>
              ) : null}
              {invoicePreview.warnings.length === 0 ? (
                <div className="mt-4 rounded-2xl border border-emerald-200 bg-emerald-50 p-4 text-sm text-emerald-800">
                  Keine Warnungen oder Hinweise für diese Vorschau erkannt.
                </div>
              ) : null}
              {currentFinalizedInvoice ? (
                <div className="mt-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-800">
                  Für diesen Tenant und Monat wurde bereits eine Rechnung finalisiert: {currentFinalizedInvoice.invoiceNumber}
                </div>
              ) : null}
              {invoicePreview.hasCriticalWarnings ? (
                <div className="mt-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
                  Kritische Warnungen blockieren die Finalisierung: {invoicePreview.criticalWarnings.join(' • ')}
                </div>
              ) : null}
            </>
          ) : (
            <div className="mt-4 rounded-2xl border border-dashed border-slate-300 bg-slate-50 px-4 py-6 text-sm text-slate-500">
              Vorschau noch nicht geladen. Wähle Tenant und Monat und klicke anschließend auf Vorschau laden.
            </div>
          )}
        </section>
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Rechnungen</h3>
          <p className="mt-1 text-sm text-slate-600">Finalisierte Monatsrechnungen als Snapshot. PDF, Versand, DATEV und Mahnungen bleiben Folgethemen.</p>
          {loading ? <p className="mt-4 text-sm text-slate-600">Lade Billing-Uebersicht...</p> : <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4"><div className="rounded-2xl border border-slate-200 bg-slate-50 p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Marge (MVP)</p><p className="mt-1 text-lg font-semibold text-slate-900">{summaryCards ? centsToEuro(summaryCards.estimatedMarginNetCents) : '-'}</p></div><div className="rounded-2xl border border-slate-200 bg-slate-50 p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Im Kontingent</p><p className="mt-1 text-lg font-semibold text-slate-900">{summaryCards?.includedTenants ?? 0}</p></div><div className="rounded-2xl border border-slate-200 bg-slate-50 p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Kostenpflichtig</p><p className="mt-1 text-lg font-semibold text-slate-900">{summaryCards?.chargeableTenants ?? 0}</p></div><div className="rounded-2xl border border-slate-200 bg-slate-50 p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Finalisierte Rechnungen</p><p className="mt-1 text-lg font-semibold text-slate-900">{finalizedInvoices.length}</p></div></div>}
          <div className="mt-4 overflow-x-auto"><table className="min-w-full text-sm"><thead><tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500"><th className="px-2 py-2">Rechnungsnummer</th><th className="px-2 py-2">Tenant</th><th className="px-2 py-2">Monat</th><th className="px-2 py-2">Netto</th><th className="px-2 py-2">MwSt.</th><th className="px-2 py-2">Brutto</th><th className="px-2 py-2">Status</th><th className="px-2 py-2">Erstellt am</th><th className="px-2 py-2">Positionen</th><th className="px-2 py-2">PDF</th></tr></thead><tbody>{finalizedInvoices.map((invoice) => <tr key={invoice.id} className="border-b border-slate-100 align-top"><td className="px-2 py-2 font-medium text-slate-900">{invoice.invoiceNumber}</td><td className="px-2 py-2">{invoice.tenant?.name || '-'}</td><td className="px-2 py-2">{invoice.periodStart.slice(0, 7)}</td><td className="px-2 py-2">{centsToEuro(invoice.subTotalCents)}</td><td className="px-2 py-2">{centsToEuro(invoice.taxTotalCents)}</td><td className="px-2 py-2">{centsToEuro(invoice.totalGrossCents)}</td><td className="px-2 py-2">{invoice.lifecycleStatus || invoice.status}</td><td className="px-2 py-2">{new Date(invoice.finalizedAt || invoice.issuedAt || invoice.createdAt).toLocaleDateString('de-DE')}</td><td className="px-2 py-2 text-xs text-slate-600">{invoice.items?.length ? invoice.items.map((item) => `${item.title}: ${centsToEuro(item.netAmountCents)}`).join(' • ') : 'Keine Positionen'}</td><td className="px-2 py-2">{(invoice.lifecycleStatus || invoice.status) !== 'DRAFT' ? <button type="button" onClick={() => void handleOpenInvoicePdf(invoice)} disabled={pdfLoadingInvoiceId === invoice.id} className="rounded-lg border border-slate-300 px-3 py-2 text-xs font-semibold text-slate-700 transition hover:border-[var(--brand-strong)] hover:text-[var(--brand-strong)] disabled:cursor-not-allowed disabled:opacity-50">{pdfLoadingInvoiceId === invoice.id ? 'Öffnet…' : 'PDF öffnen'}</button> : <span className="text-xs text-slate-400">Nur finalisiert</span>}</td></tr>)}{finalizedInvoices.length === 0 ? <tr><td colSpan={10} className="px-2 py-6 text-center text-slate-500">Noch keine finalisierten Rechnungen fuer diesen Monat vorhanden.</td></tr> : null}</tbody></table></div>
          </section>
        </div>
      </BackofficeLayout>
  )
}
