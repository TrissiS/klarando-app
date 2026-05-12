'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  getAccessContext,
  getBusinessSettingsForTenant,
  updateBusinessSettingsForTenant,
  type AccessContext,
  type BusinessSettings,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'
import { setSuperadminTenantContext } from '@/lib/superadmin-tenant-context'

type ScopeType = 'TENANT' | 'CHAIN'

type BusinessFinanceForm = {
  vatId: string
  taxNumber: string
  revenueId: string
  taxOffice: string
  payoutAccountHolder: string
  payoutBankName: string
  payoutIban: string
  payoutBic: string
  payoutEmail: string
  payoutReference: string
}

const emptyForm: BusinessFinanceForm = {
  vatId: '',
  taxNumber: '',
  revenueId: '',
  taxOffice: '',
  payoutAccountHolder: '',
  payoutBankName: '',
  payoutIban: '',
  payoutBic: '',
  payoutEmail: '',
  payoutReference: '',
}

function toForm(settings: BusinessSettings): BusinessFinanceForm {
  return {
    vatId: settings.vatId || '',
    taxNumber: settings.taxNumber || '',
    revenueId: settings.revenueId || '',
    taxOffice: settings.taxOffice || '',
    payoutAccountHolder: settings.payoutAccountHolder || '',
    payoutBankName: settings.payoutBankName || '',
    payoutIban: settings.payoutIban || '',
    payoutBic: settings.payoutBic || '',
    payoutEmail: settings.payoutEmail || '',
    payoutReference: settings.payoutReference || '',
  }
}

function applyForm(settings: BusinessSettings, form: BusinessFinanceForm): BusinessSettings {
  return {
    ...settings,
    vatId: form.vatId.trim() || null,
    taxNumber: form.taxNumber.trim() || null,
    revenueId: form.revenueId.trim() || null,
    taxOffice: form.taxOffice.trim() || null,
    payoutAccountHolder: form.payoutAccountHolder.trim() || null,
    payoutBankName: form.payoutBankName.trim() || null,
    payoutIban: form.payoutIban.trim() || null,
    payoutBic: form.payoutBic.trim() || null,
    payoutEmail: form.payoutEmail.trim() || null,
    payoutReference: form.payoutReference.trim() || null,
  }
}

function confirmDoubleSave(label: string) {
  const firstCheck = window.confirm(
    `Stammdaten fuer "${label}" wirklich aendern?`
  )
  if (!firstCheck) {
    return false
  }
  return window.confirm(
    `Zweite Bestaetigung: Stammdaten fuer "${label}" jetzt speichern?`
  )
}

export default function SuperadminBusinessDataPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [scopeType, setScopeType] = useState<ScopeType>('TENANT')
  const [tenantId, setTenantId] = useState('')
  const [chainId, setChainId] = useState('')
  const [sourceTenantId, setSourceTenantId] = useState('')
  const [baseSettings, setBaseSettings] = useState<BusinessSettings | null>(null)
  const [form, setForm] = useState<BusinessFinanceForm>(emptyForm)
  const [isLoading, setIsLoading] = useState(true)
  const [isLoadingSettings, setIsLoadingSettings] = useState(false)
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }

    setSession(parsed)
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    async function loadBaseData() {
      if (!token) {
        return
      }

      try {
        setIsLoading(true)
        setError('')
        const loaded = await getAccessContext(token)
        setContext(loaded)
        if (!tenantId && loaded.tenants[0]?.id) {
          setTenantId(loaded.tenants[0].id)
        }
        if (!chainId && loaded.chains[0]?.id) {
          setChainId(loaded.chains[0].id)
        }
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Kontext konnte nicht geladen werden')
      } finally {
        setIsLoading(false)
      }
    }

    void loadBaseData()
  }, [token])

  const tenants = context?.tenants || []
  const chainTenants = useMemo(
    () => tenants.filter((entry) => entry.chainId === chainId),
    [tenants, chainId]
  )
  const selectedTenant = useMemo(
    () => tenants.find((entry) => entry.id === tenantId) || null,
    [tenants, tenantId]
  )

  function openTenantAsAdmin(tenant: { id: string; name: string; chainId: string | null }) {
    try {
      setSuperadminTenantContext(tenant)
      window.location.href = '/admin'
    } catch {
      setError('Sitzung konnte nicht vorbereitet werden. Bitte erneut einloggen.')
    }
  }

  async function loadFromTenant(targetTenantId: string) {
    if (!token || !targetTenantId) {
      setBaseSettings(null)
      setForm(emptyForm)
      setSourceTenantId('')
      return
    }

    try {
      setIsLoadingSettings(true)
      setError('')
      const loaded = await getBusinessSettingsForTenant(token, targetTenantId)
      setBaseSettings(loaded)
      setForm(toForm(loaded))
      setSourceTenantId(targetTenantId)
    } catch (loadError) {
      setBaseSettings(null)
      setForm(emptyForm)
      setSourceTenantId('')
      setError(loadError instanceof Error ? loadError.message : 'Stammdaten konnten nicht geladen werden')
    } finally {
      setIsLoadingSettings(false)
    }
  }

  useEffect(() => {
    if (!token || !context) {
      return
    }

    if (scopeType === 'TENANT') {
      if (!tenantId) {
        setBaseSettings(null)
        setForm(emptyForm)
        setSourceTenantId('')
        return
      }
      void loadFromTenant(tenantId)
      return
    }

    const fallbackTenant = chainTenants[0]
    if (!fallbackTenant) {
      setBaseSettings(null)
      setForm(emptyForm)
      setSourceTenantId('')
      return
    }

    void loadFromTenant(fallbackTenant.id)
  }, [token, context, scopeType, tenantId, chainId, chainTenants.length])

  function updateFormField<Key extends keyof BusinessFinanceForm>(
    key: Key,
    value: BusinessFinanceForm[Key]
  ) {
    setForm((current) => ({
      ...current,
      [key]: value,
    }))
  }

  async function save() {
    if (!token || !context) {
      return
    }

    if (scopeType === 'TENANT') {
      if (!tenantId || !baseSettings) {
        setError('Bitte zuerst eine Filiale waehlen.')
        return
      }

      const tenantName = context.tenants.find((entry) => entry.id === tenantId)?.name || 'Filiale'
      if (!confirmDoubleSave(tenantName)) {
        return
      }

      try {
        setIsSaving(true)
        setError('')
        setSuccess('')
        const merged = applyForm(baseSettings, form)
        const saved = await updateBusinessSettingsForTenant(token, tenantId, merged)
        setBaseSettings(saved)
        setForm(toForm(saved))
        setSuccess(`Stammdaten fuer "${tenantName}" gespeichert.`)
      } catch (saveError) {
        setError(saveError instanceof Error ? saveError.message : 'Speichern fehlgeschlagen')
      } finally {
        setIsSaving(false)
      }
      return
    }

    if (!chainId) {
      setError('Bitte zuerst eine Kette waehlen.')
      return
    }

    const targetTenants = context.tenants.filter((entry) => entry.chainId === chainId)
    if (targetTenants.length === 0) {
      setError('Diese Kette hat keine Filialen.')
      return
    }

    const chainName = context.chains.find((entry) => entry.id === chainId)?.name || 'Kette'
    if (!confirmDoubleSave(`${chainName} (alle Filialen)`)) {
      return
    }

    try {
      setIsSaving(true)
      setError('')
      setSuccess('')

      for (const tenant of targetTenants) {
        const current =
          tenant.id === sourceTenantId && baseSettings
            ? baseSettings
            : await getBusinessSettingsForTenant(token, tenant.id)
        const merged = applyForm(current, form)
        await updateBusinessSettingsForTenant(token, tenant.id, merged)
      }

      if (sourceTenantId) {
        await loadFromTenant(sourceTenantId)
      }
      setSuccess(`Stammdaten fuer ${targetTenants.length} Filialen in "${chainName}" gespeichert.`)
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Speichern fehlgeschlagen')
    } finally {
      setIsSaving(false)
    }
  }

  if (!session) {
    return null
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Stammdaten & Abrechnung"
      subtitle="Steuer- und Auszahlungsdaten fuer Ketten und Filialen zentral pflegen"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      {error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}
      {success ? (
        <div className="mb-4 rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
          {success}
        </div>
      ) : null}

      {isLoading ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/75">Lade Stammdatenbereich...</p>
        </section>
      ) : (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <div className="grid gap-3 sm:grid-cols-3">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Zieltyp</span>
              <select
                value={scopeType}
                onChange={(event) => setScopeType(event.target.value as ScopeType)}
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              >
                <option value="TENANT">Filiale</option>
                <option value="CHAIN">Kette (alle Filialen)</option>
              </select>
            </label>

            {scopeType === 'TENANT' ? (
              <div className="block sm:col-span-2">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Filiale</span>
                <div className="flex flex-wrap items-center gap-2">
                  <select
                    value={tenantId}
                    onChange={(event) => setTenantId(event.target.value)}
                    className="min-w-0 flex-1 rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                  >
                    <option value="">Filiale waehlen</option>
                    {tenants.map((tenant) => (
                      <option key={tenant.id} value={tenant.id}>
                        {tenant.name}
                      </option>
                    ))}
                  </select>
                  <button
                    type="button"
                    disabled={!selectedTenant}
                    onClick={() => selectedTenant && openTenantAsAdmin(selectedTenant)}
                    className="rounded-xl bg-emerald-600 px-3 py-2 text-xs font-semibold text-white transition hover:bg-emerald-500 disabled:cursor-not-allowed disabled:opacity-60"
                  >
                    Als Filiale öffnen
                  </button>
                </div>
              </div>
            ) : (
              <label className="block sm:col-span-2">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Kette</span>
                <select
                  value={chainId}
                  onChange={(event) => setChainId(event.target.value)}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                >
                  <option value="">Kette waehlen</option>
                  {(context?.chains || []).map((chain) => (
                    <option key={chain.id} value={chain.id}>
                      {chain.name}
                    </option>
                  ))}
                </select>
              </label>
            )}
          </div>

          {scopeType === 'CHAIN' ? (
            <div className="mt-4 rounded-2xl border border-blue-200 bg-blue-50 px-4 py-3 text-sm text-blue-800">
              Speichern uebertraegt die Daten auf alle Filialen der ausgewaehlten Kette ({chainTenants.length}).
              Vorlage ist die aktuell geladene Filiale.
            </div>
          ) : null}

          {isLoadingSettings ? (
            <p className="mt-4 text-sm text-rose-900/70">Lade Stammdaten...</p>
          ) : (
            <div className="mt-4 grid gap-3 sm:grid-cols-2">
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">USt-ID</span>
                <input
                  value={form.vatId}
                  onChange={(event) => updateFormField('vatId', event.target.value)}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Steuernummer</span>
                <input
                  value={form.taxNumber}
                  onChange={(event) => updateFormField('taxNumber', event.target.value)}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Umsatz-ID / GLN</span>
                <input
                  value={form.revenueId}
                  onChange={(event) => updateFormField('revenueId', event.target.value)}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Finanzamt</span>
                <input
                  value={form.taxOffice}
                  onChange={(event) => updateFormField('taxOffice', event.target.value)}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                />
              </label>
              <label className="block sm:col-span-2">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Kontoinhaber</span>
                <input
                  value={form.payoutAccountHolder}
                  onChange={(event) => updateFormField('payoutAccountHolder', event.target.value)}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">IBAN</span>
                <input
                  value={form.payoutIban}
                  onChange={(event) => updateFormField('payoutIban', event.target.value.toUpperCase())}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm uppercase outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">BIC</span>
                <input
                  value={form.payoutBic}
                  onChange={(event) => updateFormField('payoutBic', event.target.value.toUpperCase())}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm uppercase outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Bankname</span>
                <input
                  value={form.payoutBankName}
                  onChange={(event) => updateFormField('payoutBankName', event.target.value)}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Abrechnungs E-Mail</span>
                <input
                  value={form.payoutEmail}
                  onChange={(event) => updateFormField('payoutEmail', event.target.value)}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                />
              </label>
              <label className="block sm:col-span-2">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Zahlungsreferenz</span>
                <input
                  value={form.payoutReference}
                  onChange={(event) => updateFormField('payoutReference', event.target.value)}
                  placeholder="z. B. Klarando App-Auszahlungen"
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                />
              </label>
            </div>
          )}

          <div className="mt-5 flex justify-end">
            <button
              type="button"
              onClick={() => void save()}
              disabled={isSaving || isLoadingSettings}
              className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
            >
              {isSaving ? 'Speichert...' : 'Stammdaten speichern'}
            </button>
          </div>
        </section>
      )}
    </BackofficeLayout>
  )
}


