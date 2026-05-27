'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createBillingRun,
  finalizeBillingInvoice,
  getBillingChargebacks,
  getBillingPayments,
  getBillingProfiles,
  getAccessContext,
  getBillingInvoices,
  getPlatformBillingSettings,
  getBillingSummary,
  getBillingTenants,
  getTenantBillingConfig,
  updatePlatformBillingSettings,
  updateTenantBillingConfig,
  type AccessContext,
  type BillingChargebackRow,
  type BillingInvoice,
  type BillingPaymentCollectionRow,
  type BillingProfileOverviewRow,
  type BillingTenantRow,
  type PlatformBillingSettings,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type FeesTab =
  | 'OVERVIEW'
  | 'PROFILES'
  | 'MODELS'
  | 'COMMISSIONS'
  | 'INCLUDED'
  | 'CLOSING'
  | 'INVOICES'
  | 'PAYMENTS'
  | 'CHARGEBACKS'
  | 'SETTINGS'

const TABS: Array<{ key: FeesTab; label: string }> = [
  { key: 'OVERVIEW', label: 'Übersicht' },
  { key: 'PROFILES', label: 'Abrechnungsprofile' },
  { key: 'MODELS', label: 'Gebührenmodelle' },
  { key: 'COMMISSIONS', label: 'Provisionen' },
  { key: 'INCLUDED', label: 'Inklusivkontingente' },
  { key: 'CLOSING', label: 'Monatsabrechnungen' },
  { key: 'INVOICES', label: 'Rechnungen' },
  { key: 'PAYMENTS', label: 'Zahlungen & Einzüge' },
  { key: 'CHARGEBACKS', label: 'Rücklastschriften' },
  { key: 'SETTINGS', label: 'Einstellungen' },
]

function currentMonth() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

function centsToEuro(value: number) {
  return `${(Math.max(0, value) / 100).toFixed(2)} €`
}

export default function SuperadminFeesPage() {
  const [token, setToken] = useState('')
  const [tab, setTab] = useState<FeesTab>('OVERVIEW')
  const [month, setMonth] = useState('2026-01')
  const [tenantRows, setTenantRows] = useState<BillingTenantRow[]>([])
  const [invoices, setInvoices] = useState<BillingInvoice[]>([])
  const [summary, setSummary] = useState<Awaited<ReturnType<typeof getBillingSummary>> | null>(null)
  const [context, setContext] = useState<AccessContext | null>(null)
  const [selectedTenantId, setSelectedTenantId] = useState('')
  const [billingForm, setBillingForm] = useState<{
    planType: 'REVENUE_SHARE' | 'MONTHLY_FIXED' | 'ORDER_PACKAGE' | 'HYBRID' | 'CUSTOM'
    billingPeriod: 'MONTHLY' | 'WEEKLY'
    monthlyFeeCents: number
    includedOrders: number
    commissionPercent: number
    fixedFeePerOrderCents: number
  } | null>(null)
  const [profileRows, setProfileRows] = useState<BillingProfileOverviewRow[]>([])
  const [paymentRows, setPaymentRows] = useState<BillingPaymentCollectionRow[]>([])
  const [chargebackRows, setChargebackRows] = useState<BillingChargebackRow[]>([])
  const [billingMetaForm, setBillingMetaForm] = useState({
    billingModel: 'HYBRID',
    paymentMethod: 'BANK_TRANSFER',
    paymentTermsDays: 14,
    invoiceEmail: '',
    adminRecipients: '',
    companyName: '',
    street: '',
    zipCode: '',
    city: '',
    countryCode: 'DE',
    vatId: '',
    contactEmail: '',
    contactPerson: '',
    legalForm: '',
    taxNumber: '',
    managingDirector: '',
    phone: '',
    website: '',
    paymentStatus: '',
    profilePaymentMethod: 'BANK_TRANSFER',
    profilePaymentTermsDays: 14,
    sepaActive: false,
    sepaCreditorId: '',
    bankName: '',
    iban: '',
    bic: '',
    invoiceLogoUrl: '',
    stripeCustomerId: '',
    paymentProviderStatus: '',
    mandateReference: '',
    mandateSignedAt: '',
  })
  const [loading, setLoading] = useState(false)
  const [savingPlatform, setSavingPlatform] = useState(false)
  const [savingTenant, setSavingTenant] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')
  const [platformBillingForm, setPlatformBillingForm] = useState<PlatformBillingSettings>({
    scopeKey: 'global',
    countryCode: 'DE',
    standardPaymentTargetDays: 14,
    companyName: '',
    legalForm: '',
    street: '',
    zipCode: '',
    city: '',
    vatId: '',
    taxNumber: '',
    managingDirector: '',
    invoiceEmail: '',
    phone: '',
    website: '',
    bankName: '',
    iban: '',
    bic: '',
    sepaCreditorId: '',
    invoiceLogoUrl: '',
    invoicePrimaryColor: '',
    invoiceAccentColor: '',
    invoiceFooter: '',
    invoicePaymentInfo: '',
    invoiceTaxNotice: '',
    invoiceEinvoiceNotice: '',
    invoiceReminderNotice: '',
    einvoiceFormatHint: '',
    paymentProviderStatus: '',
    lastChargebackStatus: '',
    approvedBy: '',
  })

  useEffect(() => {
    let parsed: SessionUser | null = null
    try {
      const raw = localStorage.getItem('sessionUser')
      parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    } catch {
      parsed = null
    }
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    setMonth(currentMonth())
  }, [])

  useEffect(() => {
    const params = new URL(window.location.href).searchParams
    const requestedTenantId = params.get('tenantId')?.trim()
    if (requestedTenantId) {
      setSelectedTenantId(requestedTenantId)
    }
  }, [])

  useEffect(() => {
    if (!token) return
    void (async () => {
      try {
        setLoading(true)
        const [summaryResult, rowsResult, invoiceRows, loadedContext, profilesResult, paymentsResult, chargebacksResult] = await Promise.all([
          getBillingSummary(token, { month }),
          getBillingTenants(token, { month }),
          getBillingInvoices(token),
          getAccessContext(token),
          getBillingProfiles(token),
          getBillingPayments(token),
          getBillingChargebacks(token),
        ])
        setSummary(summaryResult)
        setTenantRows(rowsResult.rows)
        setInvoices(invoiceRows)
        setContext(loadedContext)
        setProfileRows(profilesResult.rows)
        setPaymentRows(paymentsResult.rows)
        setChargebackRows(chargebacksResult.rows)
        if (!selectedTenantId && loadedContext.tenants[0]?.id) {
          setSelectedTenantId(loadedContext.tenants[0].id)
        }
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Gebühren konnten nicht geladen werden')
      } finally {
        setLoading(false)
      }
    })()
  }, [token, month, selectedTenantId])

  useEffect(() => {
    if (!token || !selectedTenantId) return
    void (async () => {
      try {
        const config = await getTenantBillingConfig(token, selectedTenantId)
        if (config.message) {
          setInfo('Für diesen Betrieb ist noch keine Abrechnung eingerichtet.')
        }
        setBillingForm({
          planType: config.plan.planType,
          billingPeriod: config.plan.billingPeriod,
          monthlyFeeCents: config.plan.monthlyFeeCents,
          includedOrders: config.plan.includedOrders,
          commissionPercent: config.plan.commissionPercent,
          fixedFeePerOrderCents: config.plan.fixedFeePerOrderCents,
        })
        let parsedNotes: Record<string, unknown> = {}
        if (config.billingProfile?.notes) {
          try {
            parsedNotes = JSON.parse(config.billingProfile.notes) as Record<string, unknown>
          } catch {
            parsedNotes = {}
          }
        }
        setBillingMetaForm({
          billingModel: String(parsedNotes.billingModel || config.plan.planType || 'HYBRID'),
          paymentMethod: String(parsedNotes.paymentMethod || 'BANK_TRANSFER'),
          paymentTermsDays: Number(parsedNotes.paymentTermsDays || 14),
          invoiceEmail: config.billingProfile?.invoiceEmail || '',
          adminRecipients: String(parsedNotes.adminRecipients || ''),
          companyName: config.billingProfile?.companyName || '',
          street: config.billingProfile?.street || '',
          zipCode: config.billingProfile?.zipCode || '',
          city: config.billingProfile?.city || '',
          countryCode: config.billingProfile?.countryCode || 'DE',
          vatId: config.billingProfile?.vatId || '',
          contactEmail: config.billingProfile?.contactEmail || '',
          contactPerson: config.billingProfile?.contactPerson || '',
          legalForm: config.billingProfile?.legalForm || '',
          taxNumber: config.billingProfile?.taxNumber || '',
          managingDirector: config.billingProfile?.managingDirector || '',
          phone: config.billingProfile?.phone || '',
          website: config.billingProfile?.website || '',
          paymentStatus: config.billingProfile?.paymentStatus || '',
          profilePaymentMethod: config.billingProfile?.paymentMethod || String(parsedNotes.paymentMethod || 'BANK_TRANSFER'),
          profilePaymentTermsDays: config.billingProfile?.paymentTermsDays || Number(parsedNotes.paymentTermsDays || 14),
          sepaActive: Boolean(config.billingProfile?.sepaActive),
          sepaCreditorId: config.billingProfile?.sepaCreditorId || '',
          bankName: config.billingProfile?.bankName || '',
          iban: config.billingProfile?.iban || '',
          bic: config.billingProfile?.bic || '',
          invoiceLogoUrl: config.billingProfile?.invoiceLogoUrl || '',
          stripeCustomerId: config.billingProfile?.stripeCustomerId || '',
          paymentProviderStatus: config.billingProfile?.paymentProviderStatus || '',
          mandateReference: String(parsedNotes.sepaMandateReference || ''),
          mandateSignedAt: String(parsedNotes.sepaMandateSignedAt || ''),
        })
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Filialprofil konnte nicht geladen werden')
      }
    })()
  }, [token, selectedTenantId])

  useEffect(() => {
    if (!token) return
    void (async () => {
      try {
        const result = await getPlatformBillingSettings(token)
        setPlatformBillingForm((previous) => ({ ...previous, ...result.profile }))
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Zentrale Abrechnungsdaten konnten nicht geladen werden')
      }
    })()
  }, [token])

  const chargeableRows = useMemo(() => tenantRows.filter((row) => row.extraOrders > 0), [tenantRows])

  async function reloadBillingExtras() {
    if (!token) return
    const [profilesResult, paymentsResult, chargebacksResult, invoiceRows] = await Promise.all([
      getBillingProfiles(token),
      getBillingPayments(token),
      getBillingChargebacks(token),
      getBillingInvoices(token),
    ])
    setProfileRows(profilesResult.rows)
    setPaymentRows(paymentsResult.rows)
    setChargebackRows(chargebacksResult.rows)
    setInvoices(invoiceRows)
  }

  async function handleCreateClosing() {
    if (!token) return
    try {
      setLoading(true)
      setError('')
      const result = await createBillingRun(token, { month })
      setInfo(`Monatsabrechnung erstellt: ${result.invoicesCreated} Rechnungsentwürfe.`)
      await reloadBillingExtras()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Monatsabrechnung konnte nicht erstellt werden')
    } finally {
      setLoading(false)
    }
  }

  async function handleApproveInvoice(invoiceId: string) {
    if (!token) return
    try {
      setLoading(true)
      setError('')
      const result = await finalizeBillingInvoice(token, invoiceId)
      setInfo(
        result.simulationMode
          ? 'Rechnung freigegeben. E-Mail im Test-/Vorbereitungsmodus markiert.'
          : 'Rechnung freigegeben und Zustellung gestartet.'
      )
      await reloadBillingExtras()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rechnung konnte nicht freigegeben werden')
    } finally {
      setLoading(false)
    }
  }

  async function handleSaveTenantProfile() {
    if (!token || !selectedTenantId || !billingForm) return
    try {
      setSavingTenant(true)
      setError('')
      const result = await updateTenantBillingConfig(token, selectedTenantId, {
        planType: billingForm.planType,
        billingPeriod: billingForm.billingPeriod,
        monthlyFeeCents: Math.max(0, Math.round(billingForm.monthlyFeeCents)),
        includedOrders: Math.max(0, Math.round(billingForm.includedOrders)),
        commissionPercent: Math.max(0, billingForm.commissionPercent),
        fixedFeePerOrderCents: Math.max(0, Math.round(billingForm.fixedFeePerOrderCents)),
        billingModel: billingMetaForm.billingModel,
        paymentMethod: billingMetaForm.paymentMethod,
        paymentTermsDays: Number.isFinite(billingMetaForm.paymentTermsDays) ? Math.max(1, Math.round(billingMetaForm.paymentTermsDays)) : 14,
        invoiceEmail: billingMetaForm.invoiceEmail || null,
        adminRecipients: billingMetaForm.adminRecipients || null,
        profileCompanyName: billingMetaForm.companyName || null,
        profileStreet: billingMetaForm.street || null,
        profileZipCode: billingMetaForm.zipCode || null,
        profileCity: billingMetaForm.city || null,
        profileCountryCode: billingMetaForm.countryCode || 'DE',
        profileVatId: billingMetaForm.vatId || null,
        profileContactEmail: billingMetaForm.contactEmail || null,
        profileContactPerson: billingMetaForm.contactPerson || null,
        profileLegalForm: billingMetaForm.legalForm || null,
        profileTaxNumber: billingMetaForm.taxNumber || null,
        profileManagingDirector: billingMetaForm.managingDirector || null,
        profilePhone: billingMetaForm.phone || null,
        profileWebsite: billingMetaForm.website || null,
        profilePaymentMethod: billingMetaForm.profilePaymentMethod || null,
        profilePaymentTermsDays: Number.isFinite(billingMetaForm.profilePaymentTermsDays) ? Math.max(1, Math.round(billingMetaForm.profilePaymentTermsDays)) : null,
        profilePaymentStatus: billingMetaForm.paymentStatus || null,
        profileSepaActive: Boolean(billingMetaForm.sepaActive),
        profileSepaCreditorId: billingMetaForm.sepaCreditorId || null,
        profileBankName: billingMetaForm.bankName || null,
        profileIban: billingMetaForm.iban || null,
        profileBic: billingMetaForm.bic || null,
        profileInvoiceLogoUrl: billingMetaForm.invoiceLogoUrl || null,
        profileStripeCustomerId: billingMetaForm.stripeCustomerId || null,
        profilePaymentProviderStatus: billingMetaForm.paymentProviderStatus || null,
        sepaMandateReference: billingMetaForm.mandateReference || null,
        sepaMandateSignedAt: billingMetaForm.mandateSignedAt || null,
      })
      setInfo(`Abrechnungsprofil für ${context?.tenants.find((t) => t.id === selectedTenantId)?.name || 'Filiale'} gespeichert.`)
      setBillingForm({
        planType: result.plan.planType,
        billingPeriod: result.plan.billingPeriod,
        monthlyFeeCents: result.plan.monthlyFeeCents,
        includedOrders: result.plan.includedOrders,
        commissionPercent: result.plan.commissionPercent,
        fixedFeePerOrderCents: result.plan.fixedFeePerOrderCents,
      })
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Abrechnungsprofil konnte nicht gespeichert werden')
    } finally {
      setSavingTenant(false)
    }
  }

  async function handleSavePlatformBilling() {
    if (!token) return
    try {
      setSavingPlatform(true)
      setError('')
      await updatePlatformBillingSettings(token, platformBillingForm)
      setInfo('Zentrale Rechnungs-/Unternehmens-/Zahlungsdaten wurden gespeichert.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Zentrale Abrechnungsdaten konnten nicht gespeichert werden')
    } finally {
      setSavingPlatform(false)
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Gebühren & Provisionen"
      subtitle="Abrechnung, Provisionen, Zusatzkosten und Marge klar getrennt von Modulfreigaben"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-5">
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 shadow-sm">{error}</div> : null}
        {info ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700 shadow-sm">{info}</div> : null}

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <div className="flex flex-wrap items-end gap-3">
            <label className="text-sm">
              Monat
              <input type="month" value={month} onChange={(event) => setMonth(event.target.value)} className="ml-2 rounded-xl border border-[var(--brand-border)] px-3 py-2.5" />
            </label>
            <button type="button" onClick={() => void handleCreateClosing()} className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white hover:bg-slate-800">
              Monatsabrechnung erstellen
            </button>
          </div>
          <div className="mt-3 grid gap-3 md:grid-cols-4">
            <Kpi label="Plattformumsatz Monat" value={centsToEuro(summary?.summary.platformRevenueGrossCents || 0)} />
            <Kpi label="Erwartete Klarando-Marge" value={centsToEuro(summary?.summary.estimatedMarginNetCents || 0)} />
            <Kpi label="Offene Rechnungen" value={summary?.summary.openInvoices || 0} />
            <Kpi label="Kostenpflichtige Betriebe" value={summary?.summary.chargeableTenants || 0} />
          </div>
          <div className="mt-4 flex flex-wrap gap-2">
            {TABS.map((entry) => (
              <button key={entry.key} type="button" onClick={() => setTab(entry.key)} className={`rounded-xl px-3 py-2 text-sm font-medium transition ${tab === entry.key ? 'bg-slate-900 text-white shadow-sm' : 'border border-[var(--brand-border)] bg-white text-slate-700 hover:bg-slate-50'}`}>
                {entry.label}
              </button>
            ))}
          </div>
        </section>

        {tab === 'PROFILES' ? (
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Zentrales Abrechnungsprofil je Filiale</h3>
          <p className="mt-1 text-xs text-slate-600">Hier legst du für jeden Betrieb explizit Gebühren, Provision, Inklusivbestellungen und Zahlungsziel fest.</p>
          <div className="mt-3 grid gap-3 md:grid-cols-3">
            <label className="block md:col-span-3">
              <span className="mb-1 block text-sm text-slate-700">Filiale</span>
              <select value={selectedTenantId} onChange={(e) => setSelectedTenantId(e.target.value)} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm">
                <option value="">Filiale wählen</option>
                {(context?.tenants || []).map((tenant) => <option key={tenant.id} value={tenant.id}>{tenant.name}</option>)}
              </select>
            </label>
            <label className="block">
              <span className="mb-1 block text-sm text-slate-700">Abrechnungsmodell</span>
              <select
                value={billingForm?.planType || 'REVENUE_SHARE'}
                onChange={(e) =>
                  setBillingForm((c) =>
                    c
                      ? {
                          ...c,
                          planType: e.target.value as
                            | 'REVENUE_SHARE'
                            | 'MONTHLY_FIXED'
                            | 'ORDER_PACKAGE'
                            | 'HYBRID'
                            | 'CUSTOM',
                        }
                      : c
                  )
                }
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
              >
                <option value="REVENUE_SHARE">Provision</option>
                <option value="MONTHLY_FIXED">Monatspauschale</option>
                <option value="ORDER_PACKAGE">Bestellpaket</option>
                <option value="HYBRID">Hybrid</option>
                <option value="CUSTOM">Individuell</option>
              </select>
            </label>
            <label className="block">
              <span className="mb-1 block text-sm text-slate-700">Abrechnungsintervall</span>
              <select
                value={billingForm?.billingPeriod || 'MONTHLY'}
                onChange={(e) =>
                  setBillingForm((c) =>
                    c ? { ...c, billingPeriod: e.target.value as 'MONTHLY' | 'WEEKLY' } : c
                  )
                }
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
              >
                <option value="MONTHLY">Monatlich</option>
                <option value="WEEKLY">Wöchentlich</option>
              </select>
            </label>
            <BillingField label="Monatsgebühr (€)" value={billingForm ? billingForm.monthlyFeeCents / 100 : 0} onChange={(value) => setBillingForm((c) => (c ? { ...c, monthlyFeeCents: Math.round(value * 100) } : c))} />
            <BillingField label="Inklusivbestellungen" value={billingForm?.includedOrders || 0} onChange={(value) => setBillingForm((c) => (c ? { ...c, includedOrders: Math.round(value) } : c))} />
            <BillingField label="Provision (%)" value={billingForm?.commissionPercent || 0} onChange={(value) => setBillingForm((c) => (c ? { ...c, commissionPercent: value } : c))} />
            <BillingField label="Fixbetrag pro Zusatzorder (€)" value={billingForm ? billingForm.fixedFeePerOrderCents / 100 : 0} onChange={(value) => setBillingForm((c) => (c ? { ...c, fixedFeePerOrderCents: Math.round(value * 100) } : c))} />
            <label className="block">
              <span className="mb-1 block text-sm text-slate-700">Modell (Grundgebühr / Provision / Hybrid)</span>
              <select value={billingMetaForm.billingModel} onChange={(e) => setBillingMetaForm((c) => ({ ...c, billingModel: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm">
                <option value="MONTHLY_FIXED">Grundgebühr</option>
                <option value="REVENUE_SHARE">Provision</option>
                <option value="HYBRID">Hybrid</option>
              </select>
            </label>
            <label className="block">
              <span className="mb-1 block text-sm text-slate-700">Zahlungsart</span>
              <select value={billingMetaForm.paymentMethod} onChange={(e) => setBillingMetaForm((c) => ({ ...c, paymentMethod: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm">
                <option value="BANK_TRANSFER">Überweisung</option>
                <option value="SEPA_DEBIT">SEPA-Lastschrift</option>
                <option value="STRIPE">Stripe</option>
                <option value="MANUAL">Manuell</option>
              </select>
            </label>
            <BillingField label="Zahlungsziel (Tage)" value={billingMetaForm.paymentTermsDays} onChange={(value) => setBillingMetaForm((c) => ({ ...c, paymentTermsDays: Math.round(value) }))} />
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Rechnungs-E-Mail</span><input value={billingMetaForm.invoiceEmail} onChange={(e) => setBillingMetaForm((c) => ({ ...c, invoiceEmail: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Interne Admin-Empfänger (CSV)</span><input value={billingMetaForm.adminRecipients} onChange={(e) => setBillingMetaForm((c) => ({ ...c, adminRecipients: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">SEPA-Mandatsreferenz</span><input value={billingMetaForm.mandateReference} onChange={(e) => setBillingMetaForm((c) => ({ ...c, mandateReference: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">SEPA-Mandatsdatum</span><input type="date" value={billingMetaForm.mandateSignedAt} onChange={(e) => setBillingMetaForm((c) => ({ ...c, mandateSignedAt: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Firmenname</span><input value={billingMetaForm.companyName} onChange={(e) => setBillingMetaForm((c) => ({ ...c, companyName: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Straße</span><input value={billingMetaForm.street} onChange={(e) => setBillingMetaForm((c) => ({ ...c, street: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">PLZ</span><input value={billingMetaForm.zipCode} onChange={(e) => setBillingMetaForm((c) => ({ ...c, zipCode: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Stadt</span><input value={billingMetaForm.city} onChange={(e) => setBillingMetaForm((c) => ({ ...c, city: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Land</span><input value={billingMetaForm.countryCode} onChange={(e) => setBillingMetaForm((c) => ({ ...c, countryCode: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">USt-ID</span><input value={billingMetaForm.vatId} onChange={(e) => setBillingMetaForm((c) => ({ ...c, vatId: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Ansprechpartner E-Mail</span><input value={billingMetaForm.contactEmail} onChange={(e) => setBillingMetaForm((c) => ({ ...c, contactEmail: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Ansprechpartner Name</span><input value={billingMetaForm.contactPerson} onChange={(e) => setBillingMetaForm((c) => ({ ...c, contactPerson: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Rechtsform</span><input value={billingMetaForm.legalForm} onChange={(e) => setBillingMetaForm((c) => ({ ...c, legalForm: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Steuernummer</span><input value={billingMetaForm.taxNumber} onChange={(e) => setBillingMetaForm((c) => ({ ...c, taxNumber: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Geschäftsführer</span><input value={billingMetaForm.managingDirector} onChange={(e) => setBillingMetaForm((c) => ({ ...c, managingDirector: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Telefon</span><input value={billingMetaForm.phone} onChange={(e) => setBillingMetaForm((c) => ({ ...c, phone: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Website</span><input value={billingMetaForm.website} onChange={(e) => setBillingMetaForm((c) => ({ ...c, website: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Kunden-Zahlungsart</span><select value={billingMetaForm.profilePaymentMethod} onChange={(e) => setBillingMetaForm((c) => ({ ...c, profilePaymentMethod: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"><option value="BANK_TRANSFER">Überweisung</option><option value="SEPA_DEBIT">SEPA-Lastschrift</option><option value="STRIPE">Stripe</option><option value="MANUAL">Manuell</option></select></label>
            <BillingField label="Kunden-Zahlungsziel (Tage)" value={billingMetaForm.profilePaymentTermsDays} onChange={(value) => setBillingMetaForm((c) => ({ ...c, profilePaymentTermsDays: Math.round(value) }))} />
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Kunden-Zahlungsstatus</span><input value={billingMetaForm.paymentStatus} onChange={(e) => setBillingMetaForm((c) => ({ ...c, paymentStatus: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">SEPA-Gläubiger-ID</span><input value={billingMetaForm.sepaCreditorId} onChange={(e) => setBillingMetaForm((c) => ({ ...c, sepaCreditorId: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Bankname</span><input value={billingMetaForm.bankName} onChange={(e) => setBillingMetaForm((c) => ({ ...c, bankName: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">IBAN</span><input value={billingMetaForm.iban} onChange={(e) => setBillingMetaForm((c) => ({ ...c, iban: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">BIC</span><input value={billingMetaForm.bic} onChange={(e) => setBillingMetaForm((c) => ({ ...c, bic: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Stripe Customer ID</span><input value={billingMetaForm.stripeCustomerId} onChange={(e) => setBillingMetaForm((c) => ({ ...c, stripeCustomerId: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Payment Provider Status</span><input value={billingMetaForm.paymentProviderStatus} onChange={(e) => setBillingMetaForm((c) => ({ ...c, paymentProviderStatus: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="block"><span className="mb-1 block text-sm text-slate-700">Rechnungslogo (URL)</span><input value={billingMetaForm.invoiceLogoUrl} onChange={(e) => setBillingMetaForm((c) => ({ ...c, invoiceLogoUrl: e.target.value }))} className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" /></label>
            <label className="flex items-center gap-2 rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm text-slate-700"><input type="checkbox" checked={billingMetaForm.sepaActive} onChange={(e) => setBillingMetaForm((c) => ({ ...c, sepaActive: e.target.checked }))} /> SEPA aktiv</label>
          </div>
          <div className="mt-4 flex justify-end">
            <button type="button" onClick={() => void handleSaveTenantProfile()} disabled={!selectedTenantId || !billingForm || savingTenant} className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white hover:bg-slate-800 disabled:opacity-60">
              {savingTenant ? 'Speichert…' : 'Profil speichern'}
            </button>
          </div>
        </section>
        ) : null}

        {tab === 'OVERVIEW' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Übersicht</h3>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-4">
              <Kpi label="Filialen mit Profil" value={profileRows.length} />
              <Kpi label="Offene Rechnungen" value={summary?.summary.openInvoices || 0} />
              <Kpi label="Geplante Einzüge" value={paymentRows.filter((row) => row.status === 'PENDING' || row.status === 'READY').length} />
              <Kpi label="Fehlgeschlagene Einzüge" value={chargebackRows.length} />
            </div>
            <div className="mt-4 rounded-xl border border-amber-200 bg-amber-50 p-3 text-xs text-amber-900">
              Zahlungsautomatik bleibt im Vorbereitungsmodus. Einzüge/Provider werden nur vorbereitet und nicht ungeprüft live ausgelöst.
            </div>
          </section>
        ) : null}

        {tab === 'PROFILES' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Abrechnungsprofile</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[980px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th className="py-2">Filiale</th><th>Modell</th><th>Monatsgebühr</th><th>Inklusiv</th><th>Provision</th><th>Fixbetrag</th><th>Zahlungsart</th><th>SEPA</th><th>Rechnungs-E-Mail</th></tr></thead>
                <tbody>
                  {profileRows.map((row) => {
                    let notes: Record<string, unknown> = {}
                    if (row.profile?.notes) {
                      try { notes = JSON.parse(row.profile.notes) as Record<string, unknown> } catch { notes = {} }
                    }
                    return (
                      <tr key={row.tenantId} className="border-t">
                        <td className="py-2">{row.tenantName}</td>
                        <td>{String(notes.billingModel || row.plan?.planType || '-')}</td>
                        <td>{centsToEuro(row.plan?.monthlyFeeCents || 0)}</td>
                        <td>{row.plan?.includedOrders || 0}</td>
                        <td>{Number(row.plan?.commissionPercent || 0).toFixed(2)} %</td>
                        <td>{centsToEuro(row.plan?.fixedFeePerOrderCents || 0)}</td>
                        <td>{String(notes.paymentMethod || 'BANK_TRANSFER')}</td>
                        <td>{row.latestSepaMandate ? `${row.latestSepaMandate.status} (${row.latestSepaMandate.ibanLast4})` : 'nicht aktiv'}</td>
                        <td>{row.profile?.invoiceEmail || '-'}</td>
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {tab === 'MODELS' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Gebührenmodelle</h3>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {tenantRows.map((row) => (
                <article key={row.tenantId} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/30 p-4">
                  <p className="font-semibold text-[var(--brand-ink)]">{row.tenantName}</p>
                  <p className="mt-1 text-xs text-slate-600">Monatsgebühr: {centsToEuro(row.monthlyFeeCents)}</p>
                  <p className="text-xs text-slate-600">Preis pro weiterer Bestellung: {centsToEuro(row.fixedFeePerOrderCents)}</p>
                  <p className="text-xs text-slate-600">Zusatzkosten Display/OrderDesk/Fahrer-App: vorbereitet</p>
                  <div className="mt-2">
                    <button type="button" className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-semibold text-white hover:bg-slate-800">Gebühren speichern</button>
                  </div>
                </article>
              ))}
            </div>
          </section>
        ) : null}

        {tab === 'COMMISSIONS' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Provisionen</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[760px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th className="py-2">Filiale</th><th className="py-2">Provision</th><th className="py-2">Zusatzbestellungen</th><th className="py-2">Provisionsbetrag</th></tr></thead>
                <tbody>
                  {tenantRows.map((row) => (
                    <tr key={row.tenantId} className="border-t">
                      <td className="py-2">{row.tenantName}</td>
                      <td>{row.commissionPercentApplied.toFixed(2)} %</td>
                      <td>{row.extraOrders}</td>
                      <td>{centsToEuro(row.commissionCents)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {tab === 'INCLUDED' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Inklusivkontingente</h3>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {tenantRows.map((row) => (
                <article key={row.tenantId} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/30 p-4">
                  <p className="font-semibold text-[var(--brand-ink)]">{row.tenantName}</p>
                  <p className="mt-1 text-sm text-slate-700">{row.ordersCounted} von {row.includedOrders} verbraucht</p>
                  <div className="mt-2 h-2 w-full rounded-full bg-slate-200">
                    <div className="h-2 rounded-full bg-orange-500" style={{ width: `${Math.min(100, row.includedUsagePercent)}%` }} />
                  </div>
                  <p className="mt-1 text-xs text-slate-600">Zusatzbestellungen: {row.extraOrders}</p>
                </article>
              ))}
            </div>
          </section>
        ) : null}

        {tab === 'CLOSING' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Monatsabrechnung</h3>
            <p className="text-sm text-slate-700">
              Monat {month}: {chargeableRows.length} Filialen haben kostenpflichtige Zusatzbestellungen.
            </p>
            <button type="button" onClick={() => void handleCreateClosing()} className="mt-3 rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white hover:bg-slate-800">
              Monatsabrechnung erstellen
            </button>
          </section>
        ) : null}

        {tab === 'INVOICES' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Rechnungen</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[820px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th className="py-2">Rechnung</th><th className="py-2">Filiale</th><th className="py-2">Status</th><th className="py-2">Lifecycle</th><th className="py-2">Betrag</th><th className="py-2">Zeitraum</th><th className="py-2">Aktion</th></tr></thead>
                <tbody>
                  {invoices.slice(0, 100).map((invoice) => (
                    <tr key={invoice.id} className="border-t">
                      <td className="py-2">{invoice.invoiceNumber}</td>
                      <td>{invoice.tenant?.name || '-'}</td>
                      <td>{invoice.status}</td>
                      <td>{invoice.lifecycleStatus || '-'}</td>
                      <td>{centsToEuro(invoice.totalGrossCents)}</td>
                      <td>{new Date(invoice.periodStart).toLocaleDateString('de-DE')} – {new Date(invoice.periodEnd).toLocaleDateString('de-DE')}</td>
                      <td>
                        <button
                          type="button"
                          onClick={() => void handleApproveInvoice(invoice.id)}
                          disabled={loading || invoice.status !== 'DRAFT'}
                          className="rounded-lg border border-slate-300 px-2 py-1 text-xs disabled:opacity-60"
                        >
                          Freigeben
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {tab === 'PAYMENTS' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Zahlungen & Einzüge</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[980px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th className="py-2">Filiale</th><th>Status</th><th>Betrag</th><th>Fällig</th><th>Geplant/Erstellt</th><th>Invoice</th><th>Provider</th></tr></thead>
                <tbody>
                  {paymentRows.map((row) => (
                    <tr key={row.id} className="border-t">
                      <td className="py-2">{row.tenant?.name || '-'}</td>
                      <td>{row.status}</td>
                      <td>{centsToEuro(row.amountCents)}</td>
                      <td>{row.dueAt ? new Date(row.dueAt).toLocaleDateString('de-DE') : '-'}</td>
                      <td>{new Date(row.createdAt).toLocaleDateString('de-DE')}</td>
                      <td>{row.invoice?.invoiceNumber || '-'}</td>
                      <td>{String(row.metadata?.providerStatus || 'prepared')}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            <p className="mt-3 text-xs text-slate-600">Einzüge laufen aktuell im Vorbereitungs-/Testmodus, bis Mandate und Provider final freigegeben sind.</p>
          </section>
        ) : null}

        {tab === 'CHARGEBACKS' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Rücklastschriften</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[980px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th className="py-2">Filiale</th><th>Rechnung</th><th>Betrag</th><th>Fehlerdatum</th><th>Fehlergrund</th><th>Rücklastschriftkosten</th><th>Wiederholung</th><th>Mahnung</th></tr></thead>
                <tbody>
                  {chargebackRows.map((row) => (
                    <tr key={row.id} className="border-t">
                      <td className="py-2">{row.tenantName || '-'}</td>
                      <td>{row.invoiceNumber || '-'}</td>
                      <td>{centsToEuro(row.amountCents)}</td>
                      <td>{row.failedAt ? new Date(row.failedAt).toLocaleDateString('de-DE') : '-'}</td>
                      <td>{row.failureReason}</td>
                      <td>{centsToEuro(row.returnFeeCents || 0)}</td>
                      <td>{row.retryEligible ? 'Ja' : 'Nein'}</td>
                      <td>{row.reminderRequired ? 'Ja' : 'Nein'}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {tab === 'SETTINGS' ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Zentraler Rechnungs- & Zahlungsbereich</h3>
            <p className="mb-4 text-xs text-slate-600">
              Alle Felder dienen der Vorbereitung für Rechnungen, E-Rechnungen, Zahlungsabwicklung und Betriebsprüfungen. Kein automatischer Live-Einzug ohne explizite Provider-Freigabe.
            </p>

            <div className="grid gap-5">
              <article className="rounded-2xl border border-slate-200 p-4">
                <h4 className="mb-3 text-sm font-semibold text-slate-800">Klarando Unternehmensdaten</h4>
                <div className="grid gap-3 md:grid-cols-2">
                  <TextField label="Firmenname" value={platformBillingForm.companyName || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, companyName: value }))} />
                  <TextField label="Rechtsform" value={platformBillingForm.legalForm || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, legalForm: value }))} />
                  <TextField label="Straße" value={platformBillingForm.street || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, street: value }))} />
                  <TextField label="PLZ" value={platformBillingForm.zipCode || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, zipCode: value }))} />
                  <TextField label="Ort" value={platformBillingForm.city || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, city: value }))} />
                  <TextField label="Land" value={platformBillingForm.countryCode || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, countryCode: value }))} />
                  <TextField label="USt-ID" value={platformBillingForm.vatId || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, vatId: value }))} />
                  <TextField label="Steuernummer" value={platformBillingForm.taxNumber || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, taxNumber: value }))} />
                  <TextField label="Geschäftsführer" value={platformBillingForm.managingDirector || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, managingDirector: value }))} />
                  <TextField label="Rechnungs-E-Mail" value={platformBillingForm.invoiceEmail || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, invoiceEmail: value }))} />
                  <TextField label="Telefon" value={platformBillingForm.phone || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, phone: value }))} />
                  <TextField label="Website" value={platformBillingForm.website || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, website: value }))} />
                  <TextField label="Bankname" value={platformBillingForm.bankName || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, bankName: value }))} />
                  <TextField label="IBAN" value={platformBillingForm.iban || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, iban: value }))} />
                  <TextField label="BIC" value={platformBillingForm.bic || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, bic: value }))} />
                  <TextField label="SEPA-Gläubiger-ID" value={platformBillingForm.sepaCreditorId || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, sepaCreditorId: value }))} />
                  <TextField label="Rechnungslogo (URL)" value={platformBillingForm.invoiceLogoUrl || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, invoiceLogoUrl: value }))} />
                  <TextField label="Standard-Zahlungsziel (Tage)" value={String(platformBillingForm.standardPaymentTargetDays || 14)} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, standardPaymentTargetDays: Number(value || 14) }))} />
                </div>
              </article>

              <article className="rounded-2xl border border-slate-200 p-4">
                <h4 className="mb-3 text-sm font-semibold text-slate-800">Rechnungslayout & E-Rechnung Hinweise</h4>
                <div className="grid gap-3 md:grid-cols-2">
                  <TextField label="Primärfarbe" value={platformBillingForm.invoicePrimaryColor || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, invoicePrimaryColor: value }))} />
                  <TextField label="Akzentfarbe" value={platformBillingForm.invoiceAccentColor || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, invoiceAccentColor: value }))} />
                  <TextAreaField label="Footer" value={platformBillingForm.invoiceFooter || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, invoiceFooter: value }))} />
                  <TextAreaField label="Zahlungsinformationen" value={platformBillingForm.invoicePaymentInfo || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, invoicePaymentInfo: value }))} />
                  <TextAreaField label="Steuerhinweise" value={platformBillingForm.invoiceTaxNotice || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, invoiceTaxNotice: value }))} />
                  <TextAreaField label="E-Rechnung-Hinweis" value={platformBillingForm.invoiceEinvoiceNotice || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, invoiceEinvoiceNotice: value }))} />
                  <TextAreaField label="Mahnungshinweise" value={platformBillingForm.invoiceReminderNotice || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, invoiceReminderNotice: value }))} />
                  <TextField label="E-Rechnungsformat Hinweis (z. B. ZUGFeRD vorbereitet)" value={platformBillingForm.einvoiceFormatHint || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, einvoiceFormatHint: value }))} />
                </div>
              </article>

              <article className="rounded-2xl border border-slate-200 p-4">
                <h4 className="mb-3 text-sm font-semibold text-slate-800">Zahlungsprovider & Audit-Felder</h4>
                <div className="grid gap-3 md:grid-cols-2">
                  <TextField label="Payment Provider Status" value={platformBillingForm.paymentProviderStatus || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, paymentProviderStatus: value }))} />
                  <TextField label="Rücklastschriftstatus" value={platformBillingForm.lastChargebackStatus || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, lastChargebackStatus: value }))} />
                  <TextField label="Freigegeben von" value={platformBillingForm.approvedBy || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, approvedBy: value }))} />
                  <TextField label="Geplante Lastschrift (ISO-Datum)" value={platformBillingForm.plannedDebitAt || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, plannedDebitAt: value }))} />
                  <TextField label="Letzte Lastschrift (ISO-Datum)" value={platformBillingForm.lastDebitAt || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, lastDebitAt: value }))} />
                  <TextField label="Versendet am (ISO-Datum)" value={platformBillingForm.sentAt || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, sentAt: value }))} />
                  <TextField label="Bezahlt am (ISO-Datum)" value={platformBillingForm.paidAt || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, paidAt: value }))} />
                  <TextField label="Storniert am (ISO-Datum)" value={platformBillingForm.cancelledAt || ''} onChange={(value) => setPlatformBillingForm((p) => ({ ...p, cancelledAt: value }))} />
                </div>
              </article>

              <div className="flex items-center gap-3">
                <button
                  type="button"
                  onClick={() => void handleSavePlatformBilling()}
                  disabled={savingPlatform}
                  className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white disabled:opacity-60"
                >
                  {savingPlatform ? 'Speichert…' : 'Zentrale Daten speichern'}
                </button>
                <span className="text-xs text-slate-500">Strukturierte Vorbereitung ohne finale Rechtszertifizierung.</span>
              </div>
            </div>
          </section>
        ) : null}

        {loading ? <p className="text-sm text-slate-600">Lade Daten…</p> : null}
      </div>
    </BackofficeLayout>
  )
}

function BillingField({
  label,
  value,
  onChange,
}: {
  label: string
  value: number
  onChange: (value: number) => void
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-sm text-slate-700">{label}</span>
      <input
        type="number"
        step="0.01"
        value={Number.isFinite(value) ? value : 0}
        onChange={(event) => onChange(Number(event.target.value))}
        className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
      />
    </label>
  )
}

function TextField({
  label,
  value,
  onChange,
}: {
  label: string
  value: string
  onChange: (value: string) => void
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-slate-500">{label}</span>
      <input
        type="text"
        value={value}
        onChange={(event) => onChange(event.target.value)}
        className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
      />
    </label>
  )
}

function TextAreaField({
  label,
  value,
  onChange,
}: {
  label: string
  value: string
  onChange: (value: string) => void
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-slate-500">{label}</span>
      <textarea
        value={value}
        onChange={(event) => onChange(event.target.value)}
        rows={3}
        className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
      />
    </label>
  )
}

function Kpi({ label, value }: { label: string; value: string | number }) {
  return (
    <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 p-3">
      <p className="text-xs text-slate-500">{label}</p>
      <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">{value}</p>
    </article>
  )
}

function InfoRow({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-3">
      <p className="text-xs uppercase tracking-wide text-slate-500">{label}</p>
      <p className="mt-1 text-sm font-medium text-slate-800">{value}</p>
    </div>
  )
}
