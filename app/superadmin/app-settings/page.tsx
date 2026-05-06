'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import AppSettingsFields from '@/app/Components/admin/AppSettingsFields'
import {
  getAccessContext,
  getBusinessSettingsForTenant,
  updateBusinessSettingsForTenant,
  type BusinessSettings,
  type ManagedTenant,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function confirmDoubleSave(tenantName: string) {
  const firstCheck = window.confirm(`Einstellungen für "${tenantName}" wirklich ändern?`)
  if (!firstCheck) {
    return false
  }
  return window.confirm(`Zweite Bestätigung: Änderungen für "${tenantName}" jetzt speichern?`)
}

const navItems = [
  { href: '/superadmin', label: 'Dashboard' },
  { href: '/superadmin/orders', label: 'Bestellungen' },
  { href: '/superadmin/app-settings', label: 'App-Einstellungen' },
  { href: '/superadmin/misc-settings', label: 'Sonstige Einstellungen' },
  { href: '/superadmin/business-data', label: 'Stammdaten & Abrechnung' },
  { href: '/superadmin/customers', label: 'Kundenstamm' },
  { href: '/superadmin/drivers', label: 'Fahrer' },
  { href: '/superadmin/security', label: 'Admin Verwaltung' },
]

export default function SuperadminAppSettingsPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [tenants, setTenants] = useState<ManagedTenant[]>([])
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

    if (!parsed || parsed.role !== 'superadmin') {
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
        const context = await getAccessContext(token)
        setTenants(context.tenants)
        if (!tenantId && context.tenants[0]?.id) {
          setTenantId(context.tenants[0].id)
        }
      } catch (loadError) {
        setError(
          loadError instanceof Error ? loadError.message : 'Filialliste konnte nicht geladen werden'
        )
      } finally {
        setLoading(false)
      }
    }

    void loadBaseData()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [token])

  useEffect(() => {
    async function loadSettings() {
      if (!token || !tenantId) {
        setSettings(null)
        return
      }

      try {
        setLoadingSettings(true)
        setError('')
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

  function updateField<Key extends keyof BusinessSettings>(
    key: Key,
    value: BusinessSettings[Key]
  ) {
    setSettings((current) => {
      if (!current) return current
      return {
        ...current,
        [key]: value,
      }
    })
  }

  function updateCustomerAppField<Key extends keyof BusinessSettings['customerApp']>(
    key: Key,
    value: BusinessSettings['customerApp'][Key]
  ) {
    setSettings((current) => {
      if (!current) return current
      return {
        ...current,
        customerApp: {
          ...current.customerApp,
          [key]: value,
        },
      }
    })
  }

  async function handleTenantLogoFile(file: File | null) {
    if (!file) {
      return
    }

    if (!file.type.startsWith('image/')) {
      setError('Bitte ein gültiges Logo-Bild auswählen.')
      return
    }

    const maxBytes = 6 * 1024 * 1024
    if (file.size > maxBytes) {
      setError('Logo ist zu groß (max. 6 MB).')
      return
    }

    const fileReader = new FileReader()
    const dataUrl = await new Promise<string>((resolve, reject) => {
      fileReader.onload = () => resolve(String(fileReader.result || ''))
      fileReader.onerror = () => reject(new Error('Logo konnte nicht gelesen werden'))
      fileReader.readAsDataURL(file)
    })

    updateField('logoUrl', dataUrl)
    setError('')
  }

  async function handleTenantTitleImageFile(file: File | null) {
    if (!file) {
      return
    }

    if (!file.type.startsWith('image/')) {
      setError('Bitte ein gültiges Titelbild auswählen.')
      return
    }

    const maxBytes = 8 * 1024 * 1024
    if (file.size > maxBytes) {
      setError('Titelbild ist zu groß (max. 8 MB).')
      return
    }

    const fileReader = new FileReader()
    const dataUrl = await new Promise<string>((resolve, reject) => {
      fileReader.onload = () => resolve(String(fileReader.result || ''))
      fileReader.onerror = () => reject(new Error('Titelbild konnte nicht gelesen werden'))
      fileReader.readAsDataURL(file)
    })

    updateCustomerAppField('orderHeaderImageUrl', dataUrl)
    setError('')
  }

  async function save() {
    if (!token || !tenantId || !settings) {
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
      brand="Superadmin"
      title="App-Einstellungen"
      subtitle="Bestellmodus, Freigaben und Betreiber-Medien je Filiale zentral verwalten"
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
          <p className="text-sm text-rose-900/75">Lade Filialen...</p>
        </section>
      ) : (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <label className="block max-w-xl">
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

          {loadingSettings || !settings ? (
            <p className="mt-4 text-sm text-rose-900/70">Lade App-Einstellungen...</p>
          ) : (
            <>
              <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
                <p className="text-xs uppercase tracking-wide text-rose-900/70">App Baukasten</p>
                <p className="mt-1 text-sm text-rose-900/85">
                  Für globales Logo/Layout bitte in den Menüpunkt „Sonstige Einstellungen“ wechseln.
                </p>
              </div>
              <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
                <h3 className="text-sm font-semibold text-slate-800">Betreiber-Medien für die App</h3>
                <p className="mt-1 text-xs text-rose-900/70">
                  Logo und Titelbild werden direkt im Bestellmodus verwendet.
                </p>

                <div className="mt-3 grid gap-3 sm:grid-cols-2">
                  <div className="rounded-xl border border-[var(--brand-border)] bg-white p-3">
                    <p className="text-xs font-semibold uppercase tracking-wide text-slate-700">
                      Betreiberlogo
                    </p>
                    <input
                      type="file"
                      accept="image/*"
                      onChange={(event) => void handleTenantLogoFile(event.target.files?.[0] || null)}
                      className="mt-2 w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none file:mr-3 file:rounded-lg file:border-0 file:bg-slate-900 file:px-3 file:py-1.5 file:text-xs file:font-semibold file:text-white"
                    />
                    {settings.logoUrl ? (
                      <div className="mt-3 flex items-center gap-3">
                        <img
                          src={settings.logoUrl}
                          alt="Logo Vorschau"
                          className="h-16 w-16 rounded-xl border border-[var(--brand-border)] bg-white object-contain"
                        />
                        <button
                          type="button"
                          onClick={() => updateField('logoUrl', null)}
                          className="rounded-lg border border-red-300 bg-white px-3 py-1.5 text-xs font-medium text-red-700 hover:bg-red-50"
                        >
                          Entfernen
                        </button>
                      </div>
                    ) : (
                      <p className="mt-2 text-xs text-rose-900/70">Wird in Suche und Bestellmodus angezeigt.</p>
                    )}
                  </div>

                  <div className="rounded-xl border border-[var(--brand-border)] bg-white p-3">
                    <p className="text-xs font-semibold uppercase tracking-wide text-slate-700">
                      Titelbild (Bestellmodus)
                    </p>
                    <input
                      type="file"
                      accept="image/*"
                      onChange={(event) =>
                        void handleTenantTitleImageFile(event.target.files?.[0] || null)
                      }
                      className="mt-2 w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none file:mr-3 file:rounded-lg file:border-0 file:bg-slate-900 file:px-3 file:py-1.5 file:text-xs file:font-semibold file:text-white"
                    />
                    {settings.customerApp.orderHeaderImageUrl ? (
                      <div className="mt-3 space-y-2">
                        <img
                          src={settings.customerApp.orderHeaderImageUrl}
                          alt="Titelbild Vorschau"
                          className="h-20 w-full rounded-xl border border-[var(--brand-border)] bg-white object-cover"
                        />
                        <button
                          type="button"
                          onClick={() => updateCustomerAppField('orderHeaderImageUrl', null)}
                          className="rounded-lg border border-red-300 bg-white px-3 py-1.5 text-xs font-medium text-red-700 hover:bg-red-50"
                        >
                          Entfernen
                        </button>
                      </div>
                    ) : (
                      <p className="mt-2 text-xs text-rose-900/70">
                        Wird oben über die komplette Breite im Bestellmodus gezeigt.
                      </p>
                    )}
                  </div>
                </div>
              </div>

              <div className="mt-4">
                <AppSettingsFields settings={settings} onChange={setSettings} showComplianceControls />
              </div>
              <div className="mt-5 flex justify-end">
                <button
                  type="button"
                  onClick={() => void save()}
                  disabled={saving}
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
