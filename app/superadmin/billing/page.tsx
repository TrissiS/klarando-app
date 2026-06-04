'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import ImplementationNotice from '@/app/Components/admin/ImplementationNotice'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  getAccessContext,
  getBillingInvoicePreview,
  getBillingInvoices,
  getBillingSummary,
  getBillingTenants,
  getFeatureModuleCatalog,
  getTenantBillingConfig,
  updateTenantBillingConfig,
  type BillingInvoicePreview,
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
    vatRatePercent: String(pricingSource.vatRatePercent ?? 19),
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
  const [recentInvoices, setRecentInvoices] = useState<Array<{ id: string; invoiceNumber: string; totalGrossCents: number; status: string; tenant?: { name: string } | null }>>([])
  const [loading, setLoading] = useState(false)
  const [previewLoading, setPreviewLoading] = useState(false)
  const [saving, setSaving] = useState(false)
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
            getBillingInvoices(token, {}),
          ])
        setSummary(summaryResult)
        setTenantRows(tenantsResult.rows)
        setTenantOptions(contextResult.tenants.map((tenant) => ({ id: tenant.id, name: tenant.name })))
        setModuleCatalog(catalogResult.modules)
        setRecentInvoices(invoiceResult.slice(0, 8))
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
    if (!token || !selectedTenantId) return
    void (async () => {
      try {
        const result = await getTenantBillingConfig(token, selectedTenantId)
        setTenantConfig(result)
        setPricingForm(buildFormState(result.pricingSource))
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Gebuehrenquelle konnte nicht geladen werden')
      }
    })()
  }, [token, selectedTenantId])

  async function handleSave() {
    if (!token || !tenantConfig || !pricingForm) return
    try {
      setSaving(true)
      setError('')
      const paymentTermsDays = toInt(
        pricingForm.paymentTermsDays,
        tenantConfig.billingProfile.paymentTermsDays || tenantConfig.pricingSource.paymentTermsDays || 14
      )
      const moduleFees = pricingForm.moduleFees
        .map((entry) => ({
          ...entry,
          monthlyFeeCents: Math.max(0, entry.monthlyFeeCents || 0),
          enabled: entry.enabled || (entry.monthlyFeeCents || 0) > 0,
        }))
        .filter((entry) => entry.enabled || entry.monthlyFeeCents > 0)
      await updateTenantBillingConfig(token, tenantConfig.tenant.id, {
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
        invoiceEmail: tenantConfig.billingProfile.invoiceEmail,
        billingEmail: tenantConfig.billingProfile.contactEmail,
        profileCompanyName: tenantConfig.billingProfile.companyName,
        profileStreet: tenantConfig.billingProfile.street,
        profileZipCode: tenantConfig.billingProfile.zipCode,
        profileCity: tenantConfig.billingProfile.city,
        profileCountryCode: tenantConfig.billingProfile.countryCode,
        profileVatId: tenantConfig.billingProfile.vatId,
        profileContactEmail: tenantConfig.billingProfile.contactEmail,
        profileLegalForm: tenantConfig.billingProfile.legalForm || null,
        profileTaxNumber: tenantConfig.billingProfile.taxNumber || null,
        profileManagingDirector: tenantConfig.billingProfile.managingDirector || null,
        profilePhone: tenantConfig.billingProfile.phone || null,
        profileWebsite: tenantConfig.billingProfile.website || null,
        profileContactPerson: tenantConfig.billingProfile.contactPerson || null,
        profilePaymentMethod: tenantConfig.billingProfile.paymentMethod || null,
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
        vatRatePercent: toNumber(pricingForm.vatRatePercent, tenantConfig.pricingSource.vatRatePercent),
        packageKey: pricingForm.packageKey || null,
        packageLabel: pricingForm.packageLabel || null,
        packageMonthlyFeeCents: euroToCents(pricingForm.packageMonthlyFeeEuro),
        moduleFees,
        legacyPlanNotesText: pricingForm.legacyPlanNotesText || null,
      })
      const refreshed = await getTenantBillingConfig(token, tenantConfig.tenant.id)
      setTenantConfig(refreshed)
      setPricingForm(buildFormState(refreshed.pricingSource))
      setInfo('Gebühren gespeichert.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Gebuehrenquelle konnte nicht gespeichert werden')
    } finally {
      setSaving(false)
    }
  }

  async function handleLoadInvoicePreview() {
    if (!token || !previewTenantId) return
    try {
      setPreviewLoading(true)
      setError('')
      const preview = await getBillingInvoicePreview(token, {
        tenantId: previewTenantId,
        month: previewMonth,
      })
      setInvoicePreview(preview)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rechnungsvorschau konnte nicht geladen werden')
    } finally {
      setPreviewLoading(false)
    }
  }

  const summaryCards = useMemo(() => summary?.summary || null, [summary])
  const pricingBaseline = useMemo(
    () => normalizePricingFormState(tenantConfig ? buildFormState(tenantConfig.pricingSource) : null),
    [tenantConfig]
  )
  const pricingCurrent = useMemo(() => normalizePricingFormState(pricingForm), [pricingForm])
  const hasPricingChanges = Boolean(selectedTenantId && pricingCurrent && pricingBaseline && pricingCurrent !== pricingBaseline)
  const canSavePricing = Boolean(selectedTenantId && pricingForm) && !saving
  const canLoadPreview = Boolean(token && previewTenantId) && !previewLoading
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
                    <input value={fee ? centsToInput(fee.monthlyFeeCents) : '0.00'} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, moduleFees: [...pricingForm.moduleFees.filter((entry) => entry.key !== module.key), { key: module.key, label: module.name, monthlyFeeCents: euroToCents(event.target.value), enabled: fee?.enabled || euroToCents(event.target.value) > 0 }] })} className="rounded-xl border border-slate-300 bg-white px-3 py-2 text-sm" />
                    <label className="flex items-center gap-2 rounded-xl border border-slate-300 bg-white px-3 py-2 text-sm"><input type="checkbox" checked={fee?.enabled || false} onChange={(event) => pricingForm && setPricingForm({ ...pricingForm, moduleFees: [...pricingForm.moduleFees.filter((entry) => entry.key !== module.key), { key: module.key, label: module.name, monthlyFeeCents: fee?.monthlyFeeCents || 0, enabled: event.target.checked }] })} />Aktiv</label>
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
            Rechnungen, PDFs und Finalisierung bleiben bewusst ausserhalb dieses Tickets.
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
            keine finale Rechnung erzeugt.
          </p>
          <div className="mt-4 grid gap-3 md:grid-cols-3">
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
            <div className="flex items-end">
              <button
                type="button"
                onClick={() => void handleLoadInvoicePreview()}
                disabled={!canLoadPreview}
                className="w-full rounded-xl bg-[var(--brand-strong)] px-4 py-3 text-sm font-semibold text-white disabled:cursor-not-allowed disabled:opacity-50"
              >
                {previewLoading ? 'Laedt Vorschau...' : 'Vorschau laden'}
              </button>
            </div>
          </div>
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
                      <td className="px-2 py-2 text-slate-700">MwSt. ({invoicePreview.totals.vatRatePercent.toFixed(2)}%)</td>
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
              <div className="mt-4 rounded-2xl border border-amber-200 bg-amber-50 p-4">
                <p className="text-sm font-semibold text-amber-900">Hinweise & Warnungen</p>
                <div className="mt-2 space-y-2 text-sm text-amber-900">
                  {invoicePreview.warnings.map((warning, index) => (
                    <p key={`warning-${index}`}>{warning}</p>
                  ))}
                  {invoicePreview.warnings.length === 0 ? (
                    <p>Keine Warnungen fuer diese Vorschau erkannt.</p>
                  ) : null}
                </div>
              </div>
            </>
          ) : (
            <div className="mt-4 rounded-2xl border border-dashed border-slate-300 bg-slate-50 px-4 py-6 text-sm text-slate-500">
              Vorschau noch nicht geladen.
            </div>
          )}
        </section>
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Rechnungen</h3>
          <p className="mt-1 text-sm text-slate-600">Read-only Uebersicht. Finalisierung, PDF, DATEV und Mahnungen bleiben Folgethemen.</p>
          {loading ? <p className="mt-4 text-sm text-slate-600">Lade Billing-Uebersicht...</p> : <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4"><div className="rounded-2xl border border-slate-200 bg-slate-50 p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Marge (MVP)</p><p className="mt-1 text-lg font-semibold text-slate-900">{summaryCards ? centsToEuro(summaryCards.estimatedMarginNetCents) : '-'}</p></div><div className="rounded-2xl border border-slate-200 bg-slate-50 p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Im Kontingent</p><p className="mt-1 text-lg font-semibold text-slate-900">{summaryCards?.includedTenants ?? 0}</p></div><div className="rounded-2xl border border-slate-200 bg-slate-50 p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Kostenpflichtig</p><p className="mt-1 text-lg font-semibold text-slate-900">{summaryCards?.chargeableTenants ?? 0}</p></div><div className="rounded-2xl border border-slate-200 bg-slate-50 p-4"><p className="text-xs uppercase tracking-wide text-slate-500">Letzte Rechnungen</p><p className="mt-1 text-lg font-semibold text-slate-900">{recentInvoices.length}</p></div></div>}
          <div className="mt-4 overflow-x-auto"><table className="min-w-full text-sm"><thead><tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500"><th className="px-2 py-2">Rechnung</th><th className="px-2 py-2">Tenant</th><th className="px-2 py-2">Betrag</th><th className="px-2 py-2">Status</th></tr></thead><tbody>{recentInvoices.map((invoice) => <tr key={invoice.id} className="border-b border-slate-100"><td className="px-2 py-2">{invoice.invoiceNumber}</td><td className="px-2 py-2">{invoice.tenant?.name || '-'}</td><td className="px-2 py-2">{centsToEuro(invoice.totalGrossCents)}</td><td className="px-2 py-2">{invoice.status}</td></tr>)}</tbody></table></div>
        </section>
      </div>
    </BackofficeLayout>
  )
}
