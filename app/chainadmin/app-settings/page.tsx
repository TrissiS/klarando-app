'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { CHAINADMIN_NAV_ITEMS } from '@/app/chainadmin/nav'
import AppSettingsFields from '@/app/Components/admin/AppSettingsFields'
import {
  AdminActionBar,
  AdminButton,
  AdminFormGrid,
  AdminPageShell,
  AdminSectionCard,
  AdminSelect,
} from '@/app/Components/admin/ui/AdminUi'
import {
  getAccessContext,
  getBusinessSettingsForTenant,
  getChainadminAccessRights,
  updateBusinessSettingsForTenant,
  type BusinessSettings,
  type ChainadminTenantRight,
  type ManagedTenant,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function confirmDoubleSave(tenantName: string) {
  const firstCheck = window.confirm(
    `Einstellungen für "${tenantName}" wirklich ändern?`
  )
  if (!firstCheck) {
    return false
  }
  return window.confirm(
    `Zweite Bestätigung: Änderungen für "${tenantName}" jetzt speichern?`
  )
}

export default function ChainadminAppSettingsPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [tenants, setTenants] = useState<ManagedTenant[]>([])
  const [rights, setRights] = useState<ChainadminTenantRight[]>([])
  const [tenantId, setTenantId] = useState('')
  const [settings, setSettings] = useState<BusinessSettings | null>(null)
  const [loading, setLoading] = useState(true)
  const [loadingSettings, setLoadingSettings] = useState(false)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null

    if (!parsed || parsed.role !== 'chainadmin') {
      window.location.href = '/'
      return
    }

    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    setSession(parsed)
    setToken(accessToken)
  }, [])

  useEffect(() => {
    async function loadBaseData() {
      if (!token) {
        return
      }

      try {
        setLoading(true)
        setError('')
        const [context, rightsResponse] = await Promise.all([
          getAccessContext(token),
          getChainadminAccessRights(token),
        ])
        setTenants(context.tenants)
        setRights(rightsResponse.rights)
        if (!tenantId && context.tenants[0]?.id) {
          setTenantId(context.tenants[0].id)
        }
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Daten konnten nicht geladen werden')
      } finally {
        setLoading(false)
      }
    }

    void loadBaseData()
  }, [token])

  useEffect(() => {
    async function loadSettings() {
      if (!token || !tenantId) {
        setSettings(null)
        return
      }

      try {
        setLoadingSettings(true)
        const loaded = await getBusinessSettingsForTenant(token, tenantId)
        setSettings(loaded)
      } catch (loadError) {
        setError(
          loadError instanceof Error
            ? loadError.message
            : 'App-Einstellungen konnten nicht geladen werden'
        )
      } finally {
        setLoadingSettings(false)
      }
    }

    void loadSettings()
  }, [token, tenantId])

  const selectedRight = useMemo(
    () => rights.find((entry) => entry.tenantId === tenantId) || null,
    [rights, tenantId]
  )

  const canEditDelivery = Boolean(
    selectedRight?.superadminGranted &&
      (selectedRight.canOverrideSettings || selectedRight.canManageDelivery)
  )
  const canEditPickup = Boolean(
    selectedRight?.superadminGranted &&
      (selectedRight.canOverrideSettings || selectedRight.canManagePickup)
  )
  const canEditCustomerApp = Boolean(
    selectedRight?.superadminGranted &&
      (selectedRight.canOverrideSettings || selectedRight.canManageAppOrders)
  )

  async function save() {
    if (!token || !tenantId || !settings) {
      return
    }

    if (!selectedRight?.superadminGranted) {
      setError('Diese Filiale wurde noch nicht durch den Superadmin freigegeben.')
      return
    }

    if (!canEditDelivery && !canEditPickup && !canEditCustomerApp) {
      setError('Keine Berechtigung für App-Einstellungen in dieser Filiale.')
      return
    }

    const tenantName =
      tenants.find((entry) => entry.id === tenantId)?.name || 'ausgewählte Filiale'
    if (!confirmDoubleSave(tenantName)) {
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')
      const saved = await updateBusinessSettingsForTenant(token, tenantId, settings)
      setSettings(saved)
      setSuccess('App-Einstellungen gespeichert.')
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'App-Einstellungen konnten nicht gespeichert werden'
      )
    } finally {
      setSaving(false)
    }
  }

  if (!session) {
    return null
  }

  return (
    <BackofficeLayout
      brand="Kettenadmin"
      title="App-Einstellungen"
      subtitle="Filialen mit Bestellmodus und gemeinsamem Liefer-/Abholgebiet steuern"
      navItems={CHAINADMIN_NAV_ITEMS}
    >
      <AdminPageShell>
        {error ? (
          <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
            {error}
          </div>
        ) : null}
        {success ? (
          <div className="rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
            {success}
          </div>
        ) : null}

        <AdminSectionCard title="Filiale wählen" description="App-Einstellungen pro Filiale bearbeiten.">
          {loading ? (
            <p className="text-sm text-rose-900/75">Lade Daten...</p>
          ) : (
            <>
              <AdminFormGrid>
                <div className="md:col-span-2">
                  <AdminSelect
                    label="Filiale"
                    value={tenantId}
                    onChange={(event) => setTenantId(event.target.value)}
                  >
                    <option value="">Filiale wählen</option>
                    {tenants.map((tenant) => (
                      <option key={tenant.id} value={tenant.id}>
                        {tenant.name}
                      </option>
                    ))}
                  </AdminSelect>
                </div>
                <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm text-rose-900/85">
                  <p className="text-xs uppercase tracking-wide text-rose-900/70">Freigabe</p>
                  <p className="mt-1 font-semibold">
                    {selectedRight?.superadminGranted ? 'Ja' : 'Nein'}
                  </p>
                </div>
              </AdminFormGrid>

              {selectedRight && !selectedRight.superadminGranted ? (
                <p className="mt-4 rounded-xl border border-amber-200 bg-amber-50 px-3 py-2 text-sm text-amber-800">
                  Diese Filiale ist noch nicht für dich freigegeben.
                </p>
              ) : null}
            </>
          )}
        </AdminSectionCard>

        {!loading ? (
          loadingSettings || !settings ? (
            <AdminSectionCard title="App-Einstellungen">
              <p className="text-sm text-rose-900/70">Lade App-Einstellungen...</p>
            </AdminSectionCard>
          ) : (
            <>
              <AdminSectionCard title="App-Einstellungen">
                <AppSettingsFields
                  settings={settings}
                  onChange={setSettings}
                  disableDelivery={!canEditDelivery}
                  disablePickup={!canEditPickup}
                  disableCustomerApp={!canEditCustomerApp}
                  showAppReleaseControls={false}
                />
              </AdminSectionCard>

              <AdminSectionCard
                title="Steuer & Abrechnung (nur Ansicht)"
                description="Diese Daten sind sichtbar, aber nur im Superadminbereich änderbar."
              >
                <div className="grid gap-3 sm:grid-cols-2">
                  <div className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm">
                    <p className="text-xs uppercase tracking-wide text-slate-500">USt-ID</p>
                    <p className="mt-1 font-medium text-slate-800">{settings.vatId || '-'}</p>
                  </div>
                  <div className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm">
                    <p className="text-xs uppercase tracking-wide text-slate-500">Steuernummer</p>
                    <p className="mt-1 font-medium text-slate-800">{settings.taxNumber || '-'}</p>
                  </div>
                  <div className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm">
                    <p className="text-xs uppercase tracking-wide text-slate-500">IBAN</p>
                    <p className="mt-1 font-medium text-slate-800">{settings.payoutIban || '-'}</p>
                  </div>
                  <div className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm">
                    <p className="text-xs uppercase tracking-wide text-slate-500">BIC</p>
                    <p className="mt-1 font-medium text-slate-800">{settings.payoutBic || '-'}</p>
                  </div>
                  <div className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm">
                    <p className="text-xs uppercase tracking-wide text-slate-500">Kontoinhaber</p>
                    <p className="mt-1 font-medium text-slate-800">{settings.payoutAccountHolder || '-'}</p>
                  </div>
                  <div className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm">
                    <p className="text-xs uppercase tracking-wide text-slate-500">Abrechnungs-E-Mail</p>
                    <p className="mt-1 font-medium text-slate-800">{settings.payoutEmail || '-'}</p>
                  </div>
                </div>
                <AdminActionBar>
                  <div />
                  <AdminButton
                    type="button"
                    onClick={() => void save()}
                    disabled={saving || (!canEditDelivery && !canEditPickup && !canEditCustomerApp)}
                  >
                    {saving ? 'Speichert...' : 'App-Einstellungen speichern'}
                  </AdminButton>
                </AdminActionBar>
              </AdminSectionCard>
            </>
          )
        ) : null}
      </AdminPageShell>
    </BackofficeLayout>
  )
}


