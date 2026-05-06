'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import {
  DEFAULT_PLATFORM_BRANDING_SETTINGS,
  getPlatformBrandingSettings,
  updatePlatformBrandingSettings,
  type PlatformBrandingSettings,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

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

function confirmBrandingSave() {
  const firstCheck = window.confirm('Logo-Einstellungen wirklich global ändern?')
  if (!firstCheck) {
    return false
  }
  return window.confirm('Zweite Bestätigung: Logo-Einstellungen jetzt speichern?')
}

export default function SuperadminMiscSettingsPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [settings, setSettings] = useState<PlatformBrandingSettings>(
    DEFAULT_PLATFORM_BRANDING_SETTINGS
  )
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
    async function loadData() {
      if (!token) {
        return
      }

      try {
        setLoading(true)
        setError('')
        const loaded = await getPlatformBrandingSettings(token)
        setSettings({
          ...loaded,
          iconUrl: null,
          sidebarMode: 'WORDMARK_ONLY',
          headerMode: 'WORDMARK_ONLY',
        })
      } catch (loadError) {
        setError(
          loadError instanceof Error
            ? loadError.message
            : 'Sonstige Einstellungen konnten nicht geladen werden'
        )
      } finally {
        setLoading(false)
      }
    }

    void loadData()
  }, [token])

  function updateField<Key extends keyof PlatformBrandingSettings>(
    key: Key,
    value: PlatformBrandingSettings[Key]
  ) {
    setSettings((current) => ({
      ...current,
      [key]: value,
    }))
  }

  async function handleLogoFile(file: File | null) {
    if (!file) {
      return
    }

    if (!file.type.startsWith('image/')) {
      setError('Bitte eine gültige Logo-Datei auswählen.')
      return
    }

    const maxBytes = 5 * 1024 * 1024
    if (file.size > maxBytes) {
      setError('Logo ist zu groß (max. 5 MB).')
      return
    }

    const fileReader = new FileReader()
    const dataUrl = await new Promise<string>((resolve, reject) => {
      fileReader.onload = () => resolve(String(fileReader.result || ''))
      fileReader.onerror = () => reject(new Error('Logo konnte nicht gelesen werden'))
      fileReader.readAsDataURL(file)
    })

    updateField('wordmarkUrl', dataUrl)
    setError('')
  }

  async function handleSave() {
    if (!token) {
      return
    }

    if (!confirmBrandingSave()) {
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')
      const saved = await updatePlatformBrandingSettings(
        {
          ...settings,
          iconUrl: null,
          sidebarMode: 'WORDMARK_ONLY',
          headerMode: 'WORDMARK_ONLY',
        },
        token
      )
      setSettings({
        ...saved,
        iconUrl: null,
        sidebarMode: 'WORDMARK_ONLY',
        headerMode: 'WORDMARK_ONLY',
      })
      setSuccess('Sonstige Einstellungen gespeichert.')
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'Sonstige Einstellungen konnten nicht gespeichert werden'
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
      title="Sonstige Einstellungen"
      subtitle="Globales Logo für Sidebar und Header verwalten (ohne Icon)"
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
          <p className="text-sm text-rose-900/75">Lade sonstige Einstellungen...</p>
        </section>
      ) : (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Globales Branding</p>
            <p className="mt-1 text-sm text-rose-900/85">
              Icons sind deaktiviert. Es wird nur noch das Logo mit Schriftzug verwendet.
            </p>
          </div>

          <div className="mt-4 grid gap-4 lg:grid-cols-2">
            <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
              <p className="text-sm font-semibold text-rose-900">Logo mit Schriftzug</p>
              <input
                type="file"
                accept="image/*"
                onChange={(event) => void handleLogoFile(event.target.files?.[0] || null)}
                className="mt-2 w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none file:mr-3 file:rounded-lg file:border-0 file:bg-slate-900 file:px-3 file:py-1.5 file:text-xs file:font-semibold file:text-white"
              />
              {settings.wordmarkUrl ? (
                <div className="mt-3 flex items-center gap-3">
                  <img
                    src={settings.wordmarkUrl}
                    alt="Logo Vorschau"
                    className="h-12 w-full max-w-[260px] rounded-xl border border-[var(--brand-border)] bg-white object-contain"
                  />
                  <button
                    type="button"
                    onClick={() => updateField('wordmarkUrl', null)}
                    className="rounded-lg border border-red-300 bg-white px-3 py-1.5 text-xs font-medium text-red-700 hover:bg-red-50"
                  >
                    Entfernen
                  </button>
                </div>
              ) : null}
            </div>

            <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
              <p className="text-sm font-semibold text-rose-900">Logo-Größen</p>
              <div className="mt-3 grid gap-2 sm:grid-cols-2">
                <label className="block">
                  <span className="mb-1 block text-xs font-medium text-rose-900/80">
                    Sidebar Logo-Höhe
                  </span>
                  <input
                    type="number"
                    min={16}
                    max={140}
                    value={settings.sidebarWordmarkHeight}
                    onChange={(event) =>
                      updateField('sidebarWordmarkHeight', Number(event.target.value) || 44)
                    }
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-xs font-medium text-rose-900/80">
                    Header Logo-Höhe
                  </span>
                  <input
                    type="number"
                    min={16}
                    max={120}
                    value={settings.headerWordmarkHeight}
                    onChange={(event) =>
                      updateField('headerWordmarkHeight', Number(event.target.value) || 36)
                    }
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                  />
                </label>
              </div>
            </div>
          </div>

          <div className="mt-5 flex justify-end">
            <button
              type="button"
              onClick={() => void handleSave()}
              disabled={saving}
              className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
            >
              {saving ? 'Speichert...' : 'Sonstige Einstellungen speichern'}
            </button>
          </div>
        </section>
      )}
    </BackofficeLayout>
  )
}
