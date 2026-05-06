'use client'

import { useEffect, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import AppSettingsFields from '@/app/Components/admin/AppSettingsFields'
import { getBusinessSettings, updateBusinessSettings, type BusinessSettings } from '@/lib/api'

function confirmDoubleSave() {
  const firstCheck = window.confirm('App-Einstellungen wirklich ändern?')
  if (!firstCheck) {
    return false
  }
  return window.confirm('Zweite Bestätigung: Änderungen jetzt speichern?')
}

export default function AdminAppSettingsPage() {
  const [settings, setSettings] = useState<BusinessSettings | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  useEffect(() => {
    async function loadData() {
      try {
        setLoading(true)
        const loaded = await getBusinessSettings()
        setSettings(loaded)
        setError('')
      } catch (loadError) {
        setError(
          loadError instanceof Error
            ? loadError.message
            : 'App-Einstellungen konnten nicht geladen werden'
        )
      } finally {
        setLoading(false)
      }
    }

    void loadData()
  }, [])

  async function save() {
    if (!settings) {
      return
    }

    if (!confirmDoubleSave()) {
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')
      const saved = await updateBusinessSettings(settings)
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

  return (
    <AdminLayout
      title="App-Einstellungen"
      subtitle="Bestellmodus und gemeinsames Liefer-/Abholgebiet für diese Filiale verwalten"
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

      {loading || !settings ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/75">Lade App-Einstellungen...</p>
        </section>
      ) : (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <div className="mb-4 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-800">
            App-Freigaben werden zentral im Superadmin verwaltet.
          </div>
          <AppSettingsFields
            settings={settings}
            onChange={setSettings}
            showAppReleaseControls={false}
          />
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
        </section>
      )}
    </AdminLayout>
  )
}

