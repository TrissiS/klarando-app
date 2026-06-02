'use client'

import { useEffect, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import AppSettingsFields from '@/app/Components/admin/AppSettingsFields'
import {
  getBusinessSettings,
  getStoredTenantId,
  updateBusinessSettings,
  type BusinessSettings,
} from '@/lib/api'

function confirmDoubleSave() {
  const firstCheck = window.confirm('App-Einstellungen wirklich ändern?')
  if (!firstCheck) {
    return false
  }
  return window.confirm('Zweite Bestätigung: Änderungen jetzt speichern?')
}

function normalizePolygonPath(
  points:
    | Array<
        | {
            lat?: number | string
            lng?: number | string
            latitude?: number | string
            longitude?: number | string
            latlng?: { lat?: number | string; lng?: number | string }
            position?: { lat?: number | string; lng?: number | string }
          }
        | null
        | undefined
      >
    | undefined
) {
  const source = Array.isArray(points) ? points : []
  const normalized = source
    .map((point) => ({
      lat: Number(point?.lat ?? point?.latitude ?? point?.latlng?.lat ?? point?.position?.lat),
      lng: Number(point?.lng ?? point?.longitude ?? point?.latlng?.lng ?? point?.position?.lng),
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
  const [section, setSection] = useState('')
  const isDeliveryAreaSection = section === 'delivery-area'
  const isTourSection = section === 'delivery-priority'
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
  const [isSuperadminView, setIsSuperadminView] = useState(false)
  const [rehydrateMeta, setRehydrateMeta] = useState<{
    tenantId: string | null
    branchId: string | null
    loadedPolygonLength: number
    finalPolygonStateLength: number
  } | null>(null)

  useEffect(() => {
    try {
      const rawUser = typeof window !== 'undefined' ? localStorage.getItem('sessionUser') : null
      if (rawUser) {
        const parsed = JSON.parse(rawUser) as { role?: string }
        setIsSuperadminView((parsed.role || '').toLowerCase() === 'superadmin')
      }
    } catch {
      setIsSuperadminView(false)
    }
  }, [])

  useEffect(() => {
    if (typeof window === 'undefined') {
      return
    }
    const params = new URLSearchParams(window.location.search)
    setSection(params.get('section') || '')
  }, [])

  useEffect(() => {
    async function loadData() {
      try {
        setLoading(true)
        const loaded = await getBusinessSettings()
        const loadedPolygonPath = normalizePolygonPath(loaded?.deliveryArea?.polygonPath)
        const tenantId = getStoredTenantId()
        const branchId =
          typeof window !== 'undefined'
            ? (window.localStorage.getItem('branchId') || window.localStorage.getItem('activeBranchId'))
            : null
        console.log('BUSINESS_SETTINGS_LOADED_DELIVERY_AREA', loaded?.deliveryArea)
        console.log('LOADED_POLYGON_PATH', loadedPolygonPath)
        console.log('ADMIN_POLYGON_REHYDRATE_SOURCE', {
          tenantId: tenantId || null,
          branchId: branchId || null,
          loadedPolygonLength: loadedPolygonPath.length,
          finalPolygonStateLength: loadedPolygonPath.length,
        })
        setRehydrateMeta({
          tenantId: tenantId || null,
          branchId: branchId || null,
          loadedPolygonLength: loadedPolygonPath.length,
          finalPolygonStateLength: loadedPolygonPath.length,
        })
        setSettings({
          ...loaded,
          deliveryArea: {
            ...loaded.deliveryArea,
            polygonPath: loadedPolygonPath,
          },
        })
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

  useEffect(() => {
    if (!settings) {
      return
    }
    const points = normalizePolygonPath(settings.deliveryArea?.polygonPath)
    if (points.length >= 3) {
      console.log('LOADED_POLYGON_PATH', points)
      console.log('POLYGON_POINTS_STATE_AFTER_REHYDRATE', points)
      if (points.length !== settings.deliveryArea.polygonPath.length) {
        setSettings((previous) =>
          previous
            ? {
                ...previous,
                deliveryArea: {
                  ...previous.deliveryArea,
                  polygonPath: points,
                },
              }
            : previous
        )
      } else {
        setRehydrateMeta((previous) =>
          previous
            ? {
                ...previous,
                finalPolygonStateLength: points.length,
              }
            : previous
        )
      }
    }
  }, [settings])

  async function save() {
    if (!settings) {
      return
    }

    if (!confirmDoubleSave()) {
      return
    }

    const existingPolygonPath = normalizePolygonPath(settings.deliveryArea.polygonPath)
    const normalizedPolygonPath = normalizePolygonPath(settings.deliveryArea.polygonPath)
    const polygonToSave =
      normalizedPolygonPath.length >= 3 ? normalizedPolygonPath : existingPolygonPath
    console.log('POLYGON_RAW_POINTS', settings.deliveryArea.polygonPath)
    console.log('POLYGON_NORMALIZED_POINTS', normalizedPolygonPath)
    console.log('NORMALIZED_POLYGON', normalizedPolygonPath)
    console.log('POLYGON_TO_SAVE', polygonToSave)
    const settingsToSave: BusinessSettings = {
      ...settings,
      deliveryArea: {
        ...settings.deliveryArea,
        polygonPath: polygonToSave,
      },
    }
    const polygonPoints = polygonToSave.length
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
      const responsePolygon = normalizePolygonPath(saved?.deliveryArea?.polygonPath)
      console.log('POLYGON_AFTER_SAVE_RESPONSE', responsePolygon)
      const effectivePolygonAfterSave =
        responsePolygon.length >= 3 ? responsePolygon : polygonToSave
      setSettings({
        ...saved,
        deliveryArea: {
          ...saved.deliveryArea,
          polygonPath: effectivePolygonAfterSave,
        },
      })
      setSuccess('App-Einstellungen gespeichert.')
      setPolygonDebug({
        saved: true,
        points: effectivePolygonAfterSave.length,
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
      title={isDeliveryAreaSection ? 'Öffnungszeiten & Lieferzeiten' : 'App-Einstellungen'}
      subtitle={
        isDeliveryAreaSection
          ? 'Zentrale Master-Verwaltung für Lieferzonen, Öffnungszeiten, Lieferzeiten und Ausnahmen.'
          : 'Bestellmodus und gemeinsames Liefer-/Abholgebiet für diese Filiale verwalten'
      }
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
      {rehydrateMeta ? (
        <div className="mb-4 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 text-xs text-slate-700">
          Rehydrate Tenant: {rehydrateMeta.tenantId ?? '-'} · Branch: {rehydrateMeta.branchId ?? '-'} ·
          Loaded Punkte: {rehydrateMeta.loadedPolygonLength} · Final State Punkte:{' '}
          {rehydrateMeta.finalPolygonStateLength}
        </div>
      ) : null}

      {loading || !settings ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/75">Lade App-Einstellungen...</p>
        </section>
      ) : (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          {isTourSection ? (
            <div className="space-y-4">
              <div className="rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm text-rose-900">
                <p className="font-semibold">Tourenplanung</p>
                <p className="mt-1">
                  Hier werden später offene Lieferbestellungen zu Touren gebündelt und Fahrern zugewiesen.
                </p>
              </div>
              <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
                <TourCard title="Offene Lieferungen" value="-" />
                <TourCard title="Geplante Touren" value="-" />
                <TourCard title="Fahrer verfügbar" value="-" />
                <TourCard title="Tourstatus Live" value="Vorbereitung" />
              </div>
              <div className="rounded-2xl border border-dashed border-rose-300 bg-white px-4 py-4 text-sm text-rose-900/80">
                <p className="font-medium">Tourenmodul vorbereiten</p>
                <p className="mt-1 text-xs">
                  Nächster Schritt: DeliveryTour, DeliveryTourStop und Fahrerzuweisung anbinden.
                </p>
              </div>
            </div>
          ) : (
            <>
              <div className="mb-4 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-800">
                App-Freigaben werden zentral im Superadmin verwaltet.
              </div>
              {isSuperadminView ? (
                <div className="mb-4 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-800">
                Lieferzonen, Öffnungszeiten und Lieferzeiten werden zentral auf dieser Seite gepflegt.
              </div>
              ) : null}
              <AppSettingsFields
                settings={settings}
                onChange={setSettings}
                showAppReleaseControls={false}
                showServiceAreaEditor={!isSuperadminView}
                showDeliveryScheduling={!isDeliveryAreaSection}
              />
              <div className="mt-5 rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-xs text-slate-700">
                Änderungen werden erst nach dem Speichern übernommen. Diese Seite ist die zentrale Zeit- und Lieferzonenverwaltung.
              </div>
            </>
          )}
        </section>
      )}
      {!loading && settings && !isTourSection ? (
        <div className="sticky bottom-0 z-20 mt-4 border border-slate-200 bg-white/95 px-4 py-3 shadow-lg backdrop-blur">
          <div className="flex items-center justify-between gap-3">
            <p className="text-xs text-slate-700">Zentrale Zeit- und Lieferzonenverwaltung speichern</p>
            <button
              type="button"
              onClick={() => void save()}
              disabled={saving}
              className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
            >
              {saving ? 'Speichert...' : 'Jetzt speichern'}
            </button>
          </div>
        </div>
      ) : null}
    </AdminLayout>
  )
}

function TourCard({ title, value }: { title: string; value: string }) {
  return (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3">
      <p className="text-xs uppercase tracking-wide text-rose-900/70">{title}</p>
      <p className="mt-2 text-lg font-semibold text-[var(--brand-ink)]">{value}</p>
    </div>
  )
}

