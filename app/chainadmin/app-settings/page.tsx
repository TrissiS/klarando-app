'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import AppSettingsFields from '@/app/Components/admin/AppSettingsFields'
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

const navItems = [
  { href: '/chainadmin', label: 'Benutzer & Pakete' },
  { href: '/chainadmin/app-settings', label: 'App-Einstellungen' },
  { href: '/chainadmin/closings', label: 'Abschlüsse' },
  { href: '/admin', label: 'Zum Adminbereich' },
]

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
      navItems={navItems}
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

      {loading ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/75">Lade Daten...</p>
        </section>
      ) : (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <div className="grid gap-3 sm:grid-cols-3">
            <label className="block sm:col-span-2">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Filiale</span>
              <select
                value={tenantId}
                onChange={(event) => setTenantId(event.target.value)}
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              >
                <option value="">Filiale wählen</option>
                {tenants.map((tenant) => (
                  <option key={tenant.id} value={tenant.id}>
                    {tenant.name}
                  </option>
                ))}
              </select>
            </label>
            <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm text-rose-900/85">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Freigabe</p>
              <p className="mt-1 font-semibold">
                {selectedRight?.superadminGranted ? 'Ja' : 'Nein'}
              </p>
            </div>
          </div>

          {selectedRight && !selectedRight.superadminGranted ? (
            <p className="mt-4 rounded-xl border border-amber-200 bg-amber-50 px-3 py-2 text-sm text-amber-800">
              Diese Filiale ist noch nicht für dich freigegeben.
            </p>
          ) : null}

          {loadingSettings || !settings ? (
            <p className="mt-4 text-sm text-rose-900/70">Lade App-Einstellungen...</p>
          ) : (
            <>
              <div className="mt-4">
                <AppSettingsFields
                  settings={settings}
                  onChange={setSettings}
                  disableDelivery={!canEditDelivery}
                  disablePickup={!canEditPickup}
                  disableCustomerApp={!canEditCustomerApp}
                  showAppReleaseControls={false}
                />
              </div>
              <div className="mt-5 rounded-2xl border border-[var(--brand-border)] bg-slate-50 px-4 py-4">
                <h3 className="text-sm font-semibold text-slate-900">Steuer & Abrechnung (nur Ansicht)</h3>
                <p className="mt-1 text-xs text-slate-600">
                  Diese Daten sind für Kettenadmin sichtbar, aber nur im Superadminbereich änderbar.
                </p>
                <div className="mt-3 grid gap-3 sm:grid-cols-2">
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
                    <p className="text-xs uppercase tracking-wide text-slate-500">Abrechnungs E-Mail</p>
                    <p className="mt-1 font-medium text-slate-800">{settings.payoutEmail || '-'}</p>
                  </div>
                </div>
              </div>
              <div className="mt-5 flex justify-end">
                <button
                  type="button"
                  onClick={() => void save()}
                  disabled={saving || (!canEditDelivery && !canEditPickup && !canEditCustomerApp)}
                  className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
                >
                  {saving ? 'Speichert...' : 'App-Einstellungen speichern'}
                </button>
              </div>
            </>
          )}
        </section>
      )}
    </BackofficeLayout>
  )
}

