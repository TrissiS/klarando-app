'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  getBusinessTemplates,
  getAccessContext,
  onboardBusiness,
  type AccessContext,
  type BusinessTemplateOverview,
  type BusinessTemplateImportOptions,
  type OnboardingBusinessResponse,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

const steps = [
  'Unternehmen',
  'Admin-Benutzer',
  'Filiale',
  'Vorlage',
  'Prüfung',
] as const

const defaultImportOptions: BusinessTemplateImportOptions = {
  importCategories: true,
  importProducts: true,
  importIngredients: true,
  importProductIngredients: true,
  importAllergens: true,
  importPriceSuggestions: true,
  overwriteExisting: false,
}

function generatePassword() {
  return `Kl${Math.random().toString(36).slice(2, 6)}!${Math.random().toString(36).slice(2, 8)}9`
}

function isValidEmail(value: string) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value.trim())
}

function isStrongPassword(value: string) {
  const trimmed = value.trim()
  return (
    trimmed.length >= 10 &&
    /[A-Z]/.test(trimmed) &&
    /[a-z]/.test(trimmed) &&
    /[0-9]/.test(trimmed)
  )
}

type CheckState = 'ok' | 'warn' | 'error'

function checkPalette(state: CheckState) {
  if (state === 'ok') return 'border-emerald-200 bg-emerald-50 text-emerald-800'
  if (state === 'warn') return 'border-amber-200 bg-amber-50 text-amber-800'
  return 'border-red-200 bg-red-50 text-red-800'
}

export default function SuperadminOnboardingPage() {
  const [token, setToken] = useState('')
  const [currentStep, setCurrentStep] = useState(0)
  const [templates, setTemplates] = useState<BusinessTemplateOverview[]>([])
  const [loadingTemplates, setLoadingTemplates] = useState(false)
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState<OnboardingBusinessResponse | null>(null)
  const [companyName, setCompanyName] = useState('')
  const [companyType, setCompanyType] = useState<'INDEPENDENT' | 'CHAIN' | 'FRANCHISE'>('INDEPENDENT')
  const [contactName, setContactName] = useState('')
  const [companyEmail, setCompanyEmail] = useState('')
  const [companyPhone, setCompanyPhone] = useState('')
  const [adminName, setAdminName] = useState('')
  const [adminEmail, setAdminEmail] = useState('')
  const [adminPassword, setAdminPassword] = useState(generatePassword())
  const [adminRole, setAdminRole] = useState<'CHAINADMIN' | 'ADMIN'>('CHAINADMIN')
  const [branchName, setBranchName] = useState('')
  const [branchAddress, setBranchAddress] = useState('')
  const [branchEmail, setBranchEmail] = useState('')
  const [templateEnabled, setTemplateEnabled] = useState(true)
  const [templateId, setTemplateId] = useState('')
  const [importOptions, setImportOptions] = useState<BusinessTemplateImportOptions>(defaultImportOptions)
  const [passwordReveal, setPasswordReveal] = useState('')
  const [accessContext, setAccessContext] = useState<AccessContext | null>(null)
  const [selectedTenantId, setSelectedTenantId] = useState('')

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }
    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    if (!accessToken) {
      window.location.href = '/'
      return
    }
    setToken(accessToken)
  }, [])

  useEffect(() => {
    if (!token) return
    let cancelled = false
    ;(async () => {
      try {
        setLoadingTemplates(true)
        const rows = await getBusinessTemplates(token)
        if (cancelled) return
        setTemplates(rows)
        if (rows[0]?.id) setTemplateId(rows[0].id)
      } catch {
        if (!cancelled) setTemplates([])
      } finally {
        if (!cancelled) setLoadingTemplates(false)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [token])

  useEffect(() => {
    if (!token || accessContext) return
    let cancelled = false
    ;(async () => {
      try {
        const context = await getAccessContext(token)
        if (cancelled) return
        setAccessContext(context)
        if (context.tenants[0]?.id) {
          setSelectedTenantId(context.tenants[0].id)
        }
      } catch {
        if (!cancelled) setAccessContext(null)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [token, accessContext])

  const selectedTenant = useMemo(
    () => accessContext?.tenants.find((entry) => entry.id === selectedTenantId) || null,
    [accessContext, selectedTenantId]
  )

  useEffect(() => {
    if (companyType === 'INDEPENDENT') {
      setAdminRole('ADMIN')
    }
  }, [companyType])

  const canNext = useMemo(() => {
    if (currentStep === 0) {
      return companyName.trim() && contactName.trim() && isValidEmail(companyEmail)
    }
    if (currentStep === 1) {
      return adminName.trim() && isValidEmail(adminEmail) && isStrongPassword(adminPassword)
    }
    if (currentStep === 2) return branchName.trim().length > 0
    if (currentStep === 3) return !templateEnabled || Boolean(templateId)
    return true
  }, [currentStep, companyName, contactName, companyEmail, adminName, adminEmail, adminPassword, branchName, templateEnabled, templateId])
  const selectedTemplate = useMemo(
    () => templates.find((entry) => entry.id === templateId) || null,
    [templates, templateId]
  )
  const reviewChecks = useMemo(() => {
    const checks: Array<{ label: string; state: CheckState; details: string }> = []
    checks.push({
      label: 'Unternehmens-E-Mail',
      state: isValidEmail(companyEmail) ? 'ok' : 'error',
      details: isValidEmail(companyEmail) ? 'Gültig' : 'Ungültige E-Mail',
    })
    checks.push({
      label: 'Admin-E-Mail',
      state: isValidEmail(adminEmail) ? 'ok' : 'error',
      details: isValidEmail(adminEmail) ? 'Gültig' : 'Ungültige E-Mail',
    })
    checks.push({
      label: 'Passwortregel',
      state: isStrongPassword(adminPassword) ? 'ok' : 'error',
      details: isStrongPassword(adminPassword)
        ? 'Sicherheitsanforderung erfüllt'
        : 'Mindestens 10 Zeichen, Groß-/Kleinbuchstaben und Zahl erforderlich',
    })
    checks.push({
      label: 'Rollenlogik',
      state: companyType !== 'INDEPENDENT' || adminRole === 'ADMIN' ? 'ok' : 'error',
      details:
        companyType === 'INDEPENDENT' && adminRole !== 'ADMIN'
          ? 'Einzelunternehmen muss ADMIN nutzen'
          : 'Konsistent',
    })
    checks.push({
      label: 'Filialname',
      state: branchName.trim() ? 'ok' : 'error',
      details: branchName.trim() ? 'Gesetzt' : 'Fehlt',
    })
    checks.push({
      label: 'Template-Auswahl',
      state: !templateEnabled ? 'warn' : selectedTemplate ? 'ok' : 'error',
      details: !templateEnabled
        ? 'Bewusst übersprungen'
        : selectedTemplate
          ? selectedTemplate.name
          : 'Template fehlt',
    })
    const enabledImportFlags = Object.values(importOptions).filter(Boolean).length
    checks.push({
      label: 'Importoptionen',
      state: templateEnabled && enabledImportFlags === 0 ? 'warn' : 'ok',
      details:
        templateEnabled && enabledImportFlags === 0
          ? 'Keine Option aktiv'
          : `${enabledImportFlags} Optionen aktiv`,
    })
    checks.push({
      label: 'Sicherheitsstatus',
      state: importOptions.overwriteExisting ? 'warn' : 'ok',
      details: importOptions.overwriteExisting
        ? 'Überschreiben aktiv'
        : 'Keine Überschreibung',
    })
    return checks
  }, [
    companyEmail,
    adminEmail,
    adminPassword,
    companyType,
    adminRole,
    branchName,
    templateEnabled,
    selectedTemplate,
    importOptions,
  ])
  const hasBlockingReviewError = reviewChecks.some((entry) => entry.state === 'error')

  async function finishOnboarding() {
    if (!token) return
    try {
      setSubmitting(true)
      setError('')
      const response = await onboardBusiness(token, {
        company: {
          name: companyName,
          type: companyType,
          contactName,
          email: companyEmail,
          phone: companyPhone || null,
        },
        admin: {
          name: adminName,
          email: adminEmail,
          password: adminPassword,
          role: adminRole,
        },
        branch: {
          name: branchName,
          addressLine: branchAddress || null,
          email: branchEmail || null,
        },
        templateImport: {
          enabled: templateEnabled,
          templateId: templateEnabled ? templateId : null,
          options: importOptions,
        },
      })
      setSuccess(response)
      setPasswordReveal(adminPassword)
      setAdminPassword('')
      setCurrentStep(4)
    } catch (submitError) {
      setError(submitError instanceof Error ? submitError.message : 'Onboarding fehlgeschlagen')
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Onboarding-Assistent"
      subtitle="Unternehmen, Filiale und Admin strukturiert in fünf Schritten anlegen"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <h3 className="text-lg font-semibold text-[var(--brand-ink)]">Onboarding-Zentrale</h3>
        <p className="mt-1 text-sm text-rose-900/80">
          Filiale wählen und Premium-Onboarding-Schritte direkt starten.
        </p>
        <div className="mt-3 grid gap-3 md:grid-cols-2">
          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Kunde / Filiale</span>
            <select
              className="input-ui"
              value={selectedTenantId}
              onChange={(event) => setSelectedTenantId(event.target.value)}
            >
              <option value="">Filiale wählen</option>
              {(accessContext?.tenants || []).map((tenant) => (
                <option key={tenant.id} value={tenant.id}>
                  {tenant.name}
                </option>
              ))}
            </select>
          </label>
          <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm text-rose-900/85">
            <p className="font-semibold">Aktive Auswahl</p>
            <p>{selectedTenant?.name || 'Noch keine Filiale gewählt'}</p>
          </div>
        </div>
        <div className="mt-4 grid gap-2 sm:grid-cols-2 lg:grid-cols-4">
          <Link href={selectedTenantId ? `/superadmin/menu-import?tenantId=${selectedTenantId}` : '/superadmin/menu-import'} className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Menü-Import starten</Link>
          <Link href="/superadmin/business-templates" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Business-Vorlage wählen</Link>
          <Link href="/superadmin/app-settings" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Betreiberlogo / Titelbild</Link>
          <Link href="/admin/settings" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Öffnungszeiten prüfen</Link>
          <Link href="/admin/settings" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Liefergebiet prüfen</Link>
          <Link href="/superadmin/payments" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Zahlungsstatus prüfen</Link>
          <Link href="/superadmin/display-devices" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Display / OrderDesk verbinden</Link>
        </div>
      </section>

      {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="mb-4 grid gap-2 sm:grid-cols-5">
          {steps.map((label, index) => (
            <div
              key={label}
              className={`rounded-xl border px-3 py-2 text-center text-xs font-semibold ${
                index <= currentStep
                  ? 'border-[var(--brand-ink)] bg-[var(--brand-ink)] text-white'
                  : 'border-[var(--brand-border)] bg-rose-50/70 text-rose-900/75'
              }`}
            >
              {index + 1}. {label}
            </div>
          ))}
        </div>

        {currentStep === 0 ? (
          <div className="grid gap-3 md:grid-cols-2">
            <input className="input-ui" placeholder="Unternehmensname" value={companyName} onChange={(e) => setCompanyName(e.target.value)} />
            <select className="input-ui" value={companyType} onChange={(e) => setCompanyType(e.target.value as 'INDEPENDENT' | 'CHAIN' | 'FRANCHISE')}>
              <option value="INDEPENDENT">Einzelunternehmen</option>
              <option value="CHAIN">Kette</option>
              <option value="FRANCHISE">Franchise</option>
            </select>
            <input className="input-ui" placeholder="Ansprechpartner" value={contactName} onChange={(e) => setContactName(e.target.value)} />
            <input className="input-ui" placeholder="E-Mail" value={companyEmail} onChange={(e) => setCompanyEmail(e.target.value)} />
            {companyEmail && !isValidEmail(companyEmail) ? (
              <p className="text-xs text-red-700 md:col-span-2">Bitte eine gültige Unternehmens-E-Mail eintragen.</p>
            ) : null}
            <input className="input-ui md:col-span-2" placeholder="Telefon (optional)" value={companyPhone} onChange={(e) => setCompanyPhone(e.target.value)} />
          </div>
        ) : null}

        {currentStep === 1 ? (
          <div className="grid gap-3 md:grid-cols-2">
            <input className="input-ui" placeholder="Admin-Name" value={adminName} onChange={(e) => setAdminName(e.target.value)} />
            <input className="input-ui" placeholder="Admin-E-Mail" value={adminEmail} onChange={(e) => setAdminEmail(e.target.value)} />
            <div className="flex gap-2 md:col-span-2">
              <input className="input-ui flex-1" placeholder="Passwort" value={adminPassword} onChange={(e) => setAdminPassword(e.target.value)} />
              <button type="button" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 text-xs font-semibold" onClick={() => setAdminPassword(generatePassword())}>Neu generieren</button>
            </div>
            {adminEmail && !isValidEmail(adminEmail) ? (
              <p className="text-xs text-red-700 md:col-span-2">Bitte eine gültige Admin-E-Mail eintragen.</p>
            ) : null}
            {adminPassword && !isStrongPassword(adminPassword) ? (
              <p className="text-xs text-red-700 md:col-span-2">
                Passwort: mindestens 10 Zeichen, Groß-/Kleinbuchstaben und Zahl.
              </p>
            ) : null}
            <select
              className="input-ui md:col-span-2"
              value={adminRole}
              onChange={(e) => setAdminRole(e.target.value as 'CHAINADMIN' | 'ADMIN')}
              disabled={companyType === 'INDEPENDENT'}
            >
              <option value="CHAINADMIN">CHAINADMIN</option>
              <option value="ADMIN">ADMIN</option>
            </select>
          </div>
        ) : null}

        {currentStep === 2 ? (
          <div className="grid gap-3 md:grid-cols-2">
            <input className="input-ui" placeholder="Filialname" value={branchName} onChange={(e) => setBranchName(e.target.value)} />
            <input className="input-ui" placeholder="Filial-E-Mail (optional)" value={branchEmail} onChange={(e) => setBranchEmail(e.target.value)} />
            <textarea className="input-ui min-h-[110px] md:col-span-2" placeholder="Adresse (optional)" value={branchAddress} onChange={(e) => setBranchAddress(e.target.value)} />
          </div>
        ) : null}

        {currentStep === 3 ? (
          <div className="space-y-3">
            <label className="flex items-center gap-2 text-sm font-medium text-rose-900">
              <input type="checkbox" checked={templateEnabled} onChange={(e) => setTemplateEnabled(e.target.checked)} />
              Vorlage direkt importieren
            </label>
            {templateEnabled ? (
              <>
                <select className="input-ui" value={templateId} onChange={(e) => setTemplateId(e.target.value)} disabled={loadingTemplates}>
                  {templates.map((template) => (
                    <option key={template.id} value={template.id}>
                      {template.name}
                    </option>
                  ))}
                </select>
                <div className="grid gap-2 sm:grid-cols-2">
                  {(
                    [
                      ['importCategories', 'Kategorien'],
                      ['importProducts', 'Produkte'],
                      ['importIngredients', 'Zutaten'],
                      ['importProductIngredients', 'Produkt-Zutaten-Verknüpfungen'],
                      ['importAllergens', 'Allergene'],
                      ['importPriceSuggestions', 'Preisvorschläge'],
                      ['overwriteExisting', 'Bestehende Daten überschreiben'],
                    ] as Array<[keyof BusinessTemplateImportOptions, string]>
                  ).map(([key, label]) => (
                    <label key={key} className="flex items-center gap-2 text-sm text-rose-900/90">
                      <input
                        type="checkbox"
                        checked={importOptions[key]}
                        onChange={(e) =>
                          setImportOptions((current) => ({
                            ...current,
                            [key]: e.target.checked,
                          }))
                        }
                      />
                      {label}
                    </label>
                  ))}
                </div>
                <p className="text-xs text-rose-900/70">
                  Bestehende Produkte werden standardmäßig nicht überschrieben.
                </p>
              </>
            ) : null}
          </div>
        ) : null}

        {currentStep === 4 ? (
          <div className="space-y-4">
            {!success ? (
              <>
                <div className="grid gap-3 md:grid-cols-2">
                  <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3 text-sm">
                    <p className="text-xs uppercase tracking-wide text-rose-900/70">Unternehmen / Chain</p>
                    <p className="mt-1 font-semibold">{companyName || '-'}</p>
                    <p>Typ: {companyType === 'INDEPENDENT' ? 'Einzelunternehmen' : companyType === 'CHAIN' ? 'Kette' : 'Franchise'}</p>
                    <p>Kontakt: {contactName || '-'}</p>
                    <p>E-Mail: {companyEmail || '-'}</p>
                  </article>
                  <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3 text-sm">
                    <p className="text-xs uppercase tracking-wide text-rose-900/70">Admin-Benutzer</p>
                    <p className="mt-1 font-semibold">{adminName || '-'}</p>
                    <p>Rolle: {adminRole}</p>
                    <p>E-Mail: {adminEmail || '-'}</p>
                  </article>
                  <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3 text-sm">
                    <p className="text-xs uppercase tracking-wide text-rose-900/70">Filiale / Tenant</p>
                    <p className="mt-1 font-semibold">{branchName || '-'}</p>
                    <p>Adresse: {branchAddress || '-'}</p>
                    <p>Filial-E-Mail: {branchEmail || '-'}</p>
                  </article>
                  <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3 text-sm">
                    <p className="text-xs uppercase tracking-wide text-rose-900/70">Template & Import</p>
                    <p className="mt-1 font-semibold">
                      {templateEnabled ? selectedTemplate?.name || 'Nicht ausgewählt' : 'Übersprungen'}
                    </p>
                    <p className="mt-1">
                      Optionen: {Object.entries(importOptions).filter(([, enabled]) => enabled).map(([key]) => key).join(', ') || 'Keine'}
                    </p>
                  </article>
                </div>
                <div className="grid gap-2">
                  {reviewChecks.map((entry) => (
                    <div key={entry.label} className={`rounded-xl border px-3 py-2 text-sm ${checkPalette(entry.state)}`}>
                      <p className="font-semibold">{entry.label}</p>
                      <p className="text-xs">{entry.details}</p>
                    </div>
                  ))}
                </div>
              </>
            ) : null}
            {success ? (
              <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-800">
                <p className="font-semibold">Onboarding erfolgreich abgeschlossen.</p>
                <p>Chain: {success.chain.name} ({success.chain.code})</p>
                <p>Filiale: {success.tenant.name}</p>
                <p>Admin: {success.admin.name} ({success.admin.email})</p>
                <p>Template: {success.templateImport ? 'Importiert' : 'Übersprungen'}</p>
                {passwordReveal ? (
                  <p className="mt-2 rounded-lg border border-amber-200 bg-amber-50 px-2 py-1 text-amber-900">
                    Passwort (nur jetzt sichtbar): <span className="font-semibold">{passwordReveal}</span>
                  </p>
                ) : null}
                <p className="mt-2 font-semibold text-amber-900">Bitte Zugangsdaten jetzt sicher notieren.</p>
                <p className="mt-2">
                  <Link className="font-semibold underline" href="/superadmin/business-data">Zu Betriebe & Chains</Link>
                </p>
                <div className="mt-3 flex flex-wrap gap-2">
                  <Link href="/superadmin/business-data" className="rounded-lg border border-emerald-300 bg-white px-3 py-1.5 text-xs font-semibold text-emerald-800">Zur neuen Filiale</Link>
                  <Link href="/superadmin" className="rounded-lg border border-emerald-300 bg-white px-3 py-1.5 text-xs font-semibold text-emerald-800">Zum Superadmin-Dashboard</Link>
                  <Link href="/superadmin/onboarding" className="rounded-lg border border-emerald-300 bg-white px-3 py-1.5 text-xs font-semibold text-emerald-800">Weiteres Unternehmen anlegen</Link>
                </div>
              </div>
            ) : (
              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm text-rose-900/85">
                Bitte prüfen und mit „Unternehmen jetzt anlegen“ bestätigen.
              </div>
            )}
          </div>
        ) : null}

        <div className="mt-5 flex flex-wrap items-center justify-between gap-2">
          <button
            type="button"
            className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-4 py-2 text-sm font-semibold text-rose-900 disabled:opacity-50"
            disabled={currentStep === 0 || submitting}
            onClick={() => setCurrentStep((value) => Math.max(0, value - 1))}
          >
            Zurück
          </button>
          {currentStep < 4 ? (
            <button
              type="button"
              className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white disabled:opacity-50"
              disabled={!canNext || submitting}
              onClick={() => {
                setCurrentStep((value) => Math.min(4, value + 1))
              }}
            >
              Weiter
            </button>
          ) : !success ? (
            <button
              type="button"
              className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white disabled:opacity-50"
              disabled={hasBlockingReviewError || submitting}
              onClick={() => void finishOnboarding()}
            >
              {submitting ? 'Erstelle...' : 'Unternehmen jetzt anlegen'}
            </button>
          ) : (
            <Link href="/superadmin" className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white">
              Zum Dashboard
            </Link>
          )}
        </div>
      </section>

      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <h3 className="text-lg font-semibold text-[var(--brand-ink)]">Schnellaktionen</h3>
        <div className="mt-3 grid gap-2 sm:grid-cols-2 lg:grid-cols-4">
          <Link href="/superadmin/onboarding" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Neues Unternehmen anlegen</Link>
          <Link href="/superadmin/business-data" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Neue Filiale anlegen</Link>
          <Link href="/superadmin/business-templates" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Templates verwalten</Link>
          <Link href="/superadmin/security" className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-medium text-rose-900">Benutzer verwalten</Link>
        </div>
      </section>
    </BackofficeLayout>
  )
}
