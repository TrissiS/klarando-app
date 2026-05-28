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

function normalizePolygonPath(
  points: Array<
    | { lat?: number | string; lng?: number | string; latitude?: number | string; longitude?: number | string }
    | null
    | undefined
  > | undefined
) {
  const source = Array.isArray(points) ? points : []
  const normalized = source
    .map((point) => ({
      lat: Number(point?.lat ?? point?.latitude),
      lng: Number(point?.lng ?? point?.longitude),
    }))
    .filter(
      (point) =>
        Number.isFinite(point.lat) &&
        Number.isFinite(point.lng) &&
        point.lat >= -90 &&
        point.lat <= 90 &&
        point.lng >= -180 &&
        point.lng <= 180
    )
    .map((point) => ({
      lat: Number(point.lat.toFixed(6)),
      lng: Number(point.lng.toFixed(6)),
    }))
    .filter((point, index, arr) => {
      if (index === 0) return true
      const prev = arr[index - 1]
      return prev.lat !== point.lat || prev.lng !== point.lng
    })

  if (normalized.length >= 2) {
    const first = normalized[0]
    const last = normalized[normalized.length - 1]
    if (first.lat === last.lat && first.lng === last.lng) {
      normalized.pop()
    }
  }

  return normalized.slice(0, 200)
}

export default function AdminAppSettingsPage() {
  const [settings, setSettings] = useState<BusinessSettings | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [polygonDebug, setPolygonDebug] = useState<{
    saved: boolean
    points: number
    responseStatus: number | null
    tenantId: string | null
    zoneId: string | null
  } | null>(null)

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

    const normalizedPolygonPath = normalizePolygonPath(settings.deliveryArea.polygonPath)
    console.log('NORMALIZED_POLYGON', normalizedPolygonPath)
    const settingsToSave: BusinessSettings = {
      ...settings,
      deliveryArea: {
        ...settings.deliveryArea,
        polygonPath: normalizedPolygonPath,
      },
    }
    const polygonPoints = normalizedPolygonPath.length
    if (
      settingsToSave.deliveryArea.enabled &&
      settingsToSave.deliveryArea.strategy === 'POLYGON' &&
      polygonPoints < 3
    ) {
      setError('Polygon ist ungültig: mindestens 3 Punkte erforderlich.')
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')
      const saved = await updateBusinessSettings(settingsToSave)
      setSettings(saved)
      setSuccess('App-Einstellungen gespeichert.')
      setPolygonDebug({
        saved: true,
        points: saved.deliveryArea.polygonPath.length,
        responseStatus: 200,
        tenantId: null,
        zoneId: 'deliveryArea',
      })
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'App-Einstellungen konnten nicht gespeichert werden'
      )
      setPolygonDebug({
        saved: false,
        points: polygonPoints,
        responseStatus: null,
        tenantId: null,
        zoneId: null,
      })
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
      {polygonDebug ? (
        <div className="mb-4 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 text-xs text-slate-700">
          Polygon gespeichert: {polygonDebug.saved ? 'ja' : 'nein'} · Punkte: {polygonDebug.points} ·
          API: {polygonDebug.responseStatus ?? '-'} · Zone-ID: {polygonDebug.zoneId ?? '-'} ·
          Tenant: {polygonDebug.tenantId ?? '-'}
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

