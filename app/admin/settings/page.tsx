'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import AppSettingsFields from '@/app/Components/admin/AppSettingsFields'
import ServiceAreaEditor from '@/app/Components/admin/ServiceAreaEditor'
import {
  getDeliveryAvailabilityPreview,
  getBusinessSettings,
  uploadBusinessSettingsImage,
  updateBusinessSettings,
  type BusinessDeliveryZone,
  type BusinessDeliveryZonePricingRule,
  type BusinessServiceArea,
  type BusinessSettings,
  type DeliveryAvailabilityPreview,
} from '@/lib/api'

function confirmDoubleSave() {
  const firstCheck = window.confirm('Einstellungen wirklich ändern?')
  if (!firstCheck) {
    return false
  }
  return window.confirm('Zweite Bestätigung: Änderungen jetzt speichern?')
}

function formatPreviewDateTime(value: string | null) {
  if (!value) {
    return 'Keine nächste Lieferung berechnet.'
  }

  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) {
    return value
  }

  return parsed.toLocaleString('de-DE', {
    day: '2-digit',
    month: '2-digit',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  })
}

function formatWindowLabel(start: string, end: string) {
  return `${start} - ${end} Uhr`
}

function deriveDebugCheckState(
  preview: DeliveryAvailabilityPreview | null,
  keywords: string[]
): 'ok' | 'blocked' | 'unknown' {
  if (!preview) {
    return 'unknown'
  }

  const reasonText = [
    ...preview.deliveryAvailability.blockingReasons,
    ...preview.deliveryAvailability.debugReasons,
  ]
    .join(' ')
    .toLowerCase()

  if (!reasonText) {
    return 'unknown'
  }

  return keywords.some((keyword) => reasonText.includes(keyword.toLowerCase())) ? 'blocked' : 'ok'
}

function createDeliveryZoneId() {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') {
    return crypto.randomUUID()
  }
  return `zone-${Date.now()}-${Math.random().toString(16).slice(2, 10)}`
}

function createDeliveryZonePricingRuleId() {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') {
    return crypto.randomUUID()
  }
  return `pricing-rule-${Date.now()}-${Math.random().toString(16).slice(2, 10)}`
}

function parseNullableNumber(value: string) {
  const normalized = value.replace(',', '.').trim()
  if (!normalized) {
    return null
  }

  const parsed = Number(normalized)
  return Number.isFinite(parsed) ? parsed : null
}

function parseNullableInteger(value: string) {
  const parsed = parseNullableNumber(value)
  if (parsed === null) {
    return null
  }

  return Math.max(0, Math.round(parsed))
}

function createDefaultDeliveryZonePricingRule(
  priority: number
): BusinessDeliveryZonePricingRule {
  return {
    id: createDeliveryZonePricingRuleId(),
    label: 'Neue Preisregel',
    active: true,
    daysOfWeek: [],
    startTime: null,
    endTime: null,
    priceMode: 'SURCHARGE',
    surchargeAmount: null,
    deliveryFee: null,
    holidayMode: 'NONE',
    manualOverrideToday: null,
    priority: Math.max(1, priority),
  }
}

const weekdayOptions = [
  { value: 1, label: 'Mo' },
  { value: 2, label: 'Di' },
  { value: 3, label: 'Mi' },
  { value: 4, label: 'Do' },
  { value: 5, label: 'Fr' },
  { value: 6, label: 'Sa' },
  { value: 0, label: 'So' },
] as const

function createDefaultDeliveryZone(priority: number): BusinessDeliveryZone {
  return {
    id: createDeliveryZoneId(),
    name: 'Neue Lieferzone',
    enabled: true,
    color: '#22c55e',
    strategy: 'POLYGON',
    polygonPath: [],
    zipCodes: [],
    excludedZipCodes: [],
    excludedStreets: [],
    centerLatitude: null,
    centerLongitude: null,
    centerZipCode: null,
    centerCity: null,
    centerStreet: null,
    radiusKm: null,
    minOrderValue: null,
    deliveryFee: null,
    freeDeliveryFrom: null,
    estimatedDeliveryMinutes: null,
    priority: Math.max(1, priority),
    notes: null,
  }
}

function zoneToServiceArea(zone: BusinessDeliveryZone): BusinessServiceArea {
  return {
    enabled: zone.enabled,
    strategy: zone.strategy,
    zipCodes: zone.zipCodes,
    excludedZipCodes: zone.excludedZipCodes,
    excludedStreets: zone.excludedStreets,
    radiusKm: zone.radiusKm,
    polygonPath: zone.polygonPath,
    centerLatitude: zone.centerLatitude,
    centerLongitude: zone.centerLongitude,
    centerZipCode: zone.centerZipCode,
    centerCity: zone.centerCity,
    centerStreet: zone.centerStreet,
    notes: zone.notes,
  }
}

function mergeServiceAreaIntoZone(
  zone: BusinessDeliveryZone,
  nextArea: BusinessServiceArea
): BusinessDeliveryZone {
  return {
    ...zone,
    enabled: nextArea.enabled,
    strategy: nextArea.strategy,
    polygonPath: nextArea.polygonPath,
    zipCodes: nextArea.zipCodes,
    excludedZipCodes: nextArea.excludedZipCodes,
    excludedStreets: nextArea.excludedStreets,
    centerLatitude: nextArea.centerLatitude,
    centerLongitude: nextArea.centerLongitude,
    centerZipCode: nextArea.centerZipCode,
    centerCity: nextArea.centerCity,
    centerStreet: nextArea.centerStreet,
    radiusKm: nextArea.radiusKm,
    notes: nextArea.notes,
  }
}

function validateDeliveryZone(zone: BusinessDeliveryZone) {
  const errors: string[] = []

  if (!zone.name.trim()) {
    errors.push('Name darf nicht leer sein.')
  }
  if (zone.priority < 1) {
    errors.push('Priorität muss mindestens 1 sein.')
  }
  if (zone.minOrderValue !== null && zone.minOrderValue < 0) {
    errors.push('Mindestbestellwert darf nicht negativ sein.')
  }
  if (zone.deliveryFee !== null && zone.deliveryFee < 0) {
    errors.push('Lieferkosten dürfen nicht negativ sein.')
  }
  if (zone.freeDeliveryFrom !== null && zone.freeDeliveryFrom < 0) {
    errors.push('Kostenlos ab darf nicht negativ sein.')
  }
  if (zone.estimatedDeliveryMinutes !== null && zone.estimatedDeliveryMinutes < 0) {
    errors.push('Lieferzeit darf nicht negativ sein.')
  }

  return errors
}

export default function AdminSettingsPage() {
  const [section, setSection] = useState('')
  const [settings, setSettings] = useState<BusinessSettings | null>(null)
  const [selectedDeliveryZoneId, setSelectedDeliveryZoneId] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [uploadingLogo, setUploadingLogo] = useState(false)
  const [uploadingCover, setUploadingCover] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [deliveryPreview, setDeliveryPreview] = useState<DeliveryAvailabilityPreview | null>(null)
  const [deliveryPreviewLoading, setDeliveryPreviewLoading] = useState(false)
  const [deliveryPreviewError, setDeliveryPreviewError] = useState('')
  const [deliveryPreviewZipCode, setDeliveryPreviewZipCode] = useState('')
  const [deliveryPreviewStreet, setDeliveryPreviewStreet] = useState('')

  async function loadDeliveryPreview(sourceSettings?: BusinessSettings | null) {
    const nextSettings = sourceSettings ?? settings
    if (!nextSettings) {
      setDeliveryPreview(null)
      return
    }

    try {
      setDeliveryPreviewLoading(true)
      setDeliveryPreviewError('')
      const preview = await getDeliveryAvailabilityPreview({
        zipCode: (deliveryPreviewZipCode || nextSettings.zipCode || '').trim() || null,
        street: (deliveryPreviewStreet || nextSettings.street || '').trim() || null,
      })
      setDeliveryPreview(preview)
    } catch (previewError) {
      setDeliveryPreview(null)
      setDeliveryPreviewError(
        previewError instanceof Error
          ? previewError.message
          : 'Delivery-Availability konnte nicht geladen werden.'
      )
    } finally {
      setDeliveryPreviewLoading(false)
    }
  }

  function applySettingsSnapshot(data: BusinessSettings) {
    setSettings(data)
    setDeliveryPreviewZipCode(data.zipCode || '')
    setDeliveryPreviewStreet(data.street || '')
  }

  async function loadData() {
    try {
      setLoading(true)
      const data = await getBusinessSettings()
      applySettingsSnapshot(data)
      await loadDeliveryPreview(data)
      setError('')
      return data
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Einstellungen konnten nicht geladen werden')
      return null
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    if (typeof window === 'undefined') {
      return
    }
    const params = new URLSearchParams(window.location.search)
    setSection(params.get('section') || '')
  }, [])

  useEffect(() => {
    void loadData()
  }, [])

  useEffect(() => {
    if (!settings) {
      setSelectedDeliveryZoneId(null)
      return
    }

    const zones = settings.deliveryZones ?? []
    if (zones.length === 0) {
      setSelectedDeliveryZoneId(null)
      return
    }

    const stillExists = selectedDeliveryZoneId
      ? zones.some((zone) => zone.id === selectedDeliveryZoneId)
      : false

    if (!stillExists) {
      setSelectedDeliveryZoneId(zones[0].id)
    }
  }, [settings, selectedDeliveryZoneId])

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

  function updateDeliveryZones(
    updater: (zones: BusinessDeliveryZone[]) => BusinessDeliveryZone[]
  ) {
    setSettings((current) => {
      if (!current) {
        return current
      }

      const currentZones = current.deliveryZones ?? []
      return {
        ...current,
        deliveryZones: updater(currentZones),
      }
    })
  }

  function updateDeliveryZone(
    zoneId: string,
    updater: (zone: BusinessDeliveryZone) => BusinessDeliveryZone
  ) {
    updateDeliveryZones((zones) =>
      zones.map((zone) => (zone.id === zoneId ? updater(zone) : zone))
    )
  }

  function handleAddDeliveryZone() {
    const nextPriority =
      (settings?.deliveryZones ?? []).reduce(
        (maxPriority, zone) => Math.max(maxPriority, zone.priority),
        0
      ) + 1
    const nextZone = createDefaultDeliveryZone(nextPriority)
    updateDeliveryZones((zones) => [...zones, nextZone])
    setSelectedDeliveryZoneId(nextZone.id)
  }

  function handleDeleteDeliveryZone(zoneId: string) {
    if (!window.confirm('Lieferzone wirklich löschen?')) {
      return
    }

    const currentZones = settings?.deliveryZones ?? []
    const sortedZones = [...currentZones].sort((left, right) => {
      if (left.priority !== right.priority) {
        return left.priority - right.priority
      }
      return left.name.localeCompare(right.name, 'de-DE')
    })
    const currentIndex = sortedZones.findIndex((zone) => zone.id === zoneId)
    const fallbackZone =
      sortedZones[currentIndex + 1] ??
      sortedZones[currentIndex - 1] ??
      null

    updateDeliveryZones((zones) => zones.filter((zone) => zone.id !== zoneId))
    setSelectedDeliveryZoneId(fallbackZone?.id ?? null)
  }

  function updateDeliveryZonePricingRule(
    zoneId: string,
    ruleId: string,
    updater: (rule: BusinessDeliveryZonePricingRule) => BusinessDeliveryZonePricingRule
  ) {
    updateDeliveryZone(zoneId, (zone) => ({
      ...zone,
      pricingRules: (zone.pricingRules ?? []).map((rule) =>
        rule.id === ruleId ? updater(rule) : rule
      ),
    }))
  }

  function handleAddDeliveryZonePricingRule(zoneId: string) {
    updateDeliveryZone(zoneId, (zone) => {
      const nextPriority =
        (zone.pricingRules ?? []).reduce(
          (maxPriority, rule) => Math.max(maxPriority, rule.priority),
          0
        ) + 1

      return {
        ...zone,
        pricingRules: [
          ...(zone.pricingRules ?? []),
          createDefaultDeliveryZonePricingRule(nextPriority),
        ],
      }
    })
  }

  function handleDeleteDeliveryZonePricingRule(zoneId: string, ruleId: string) {
    if (!window.confirm('Preisregel wirklich löschen?')) {
      return
    }

    updateDeliveryZone(zoneId, (zone) => ({
      ...zone,
      pricingRules: (zone.pricingRules ?? []).filter((rule) => rule.id !== ruleId),
    }))
  }

  async function handleLogoFile(file: File | null) {
    if (!file) {
      return
    }

    if (!['image/jpeg', 'image/png', 'image/webp'].includes(file.type)) {
      setError('Bitte ein gültiges Logo-Bild (JPG, PNG oder WEBP) auswählen.')
      return
    }

    const maxBytes = 10 * 1024 * 1024
    if (file.size > maxBytes) {
      setError('Logo ist zu groß (max. 10 MB).')
      return
    }

    try {
      setUploadingLogo(true)
      setError('')
      setSuccess('Bild wird automatisch optimiert.')
      const uploaded = await uploadBusinessSettingsImage('logo', file)
      updateField('logoUrl', uploaded.url)
      updateField('thumbnailUrl', uploaded.url)
      updateField('originalFileName', uploaded.originalFileName)
      setSuccess('Logo hochgeladen und optimiert.')
    } catch (uploadError) {
      setError(uploadError instanceof Error ? uploadError.message : 'Logo-Upload fehlgeschlagen.')
    } finally {
      setUploadingLogo(false)
    }
  }

  async function handleTitleImageFile(file: File | null) {
    if (!file) {
      return
    }

    if (!['image/jpeg', 'image/png', 'image/webp'].includes(file.type)) {
      setError('Bitte ein gültiges Titelbild (JPG, PNG oder WEBP) auswählen.')
      return
    }

    const maxBytes = 10 * 1024 * 1024
    if (file.size > maxBytes) {
      setError('Titelbild ist zu groß (max. 10 MB).')
      return
    }

    try {
      setUploadingCover(true)
      setError('')
      setSuccess('Bild wird automatisch optimiert.')
      const cover = await uploadBusinessSettingsImage('cover', file)
      updateField('coverImageUrl', cover.url)
      updateField('thumbnailUrl', cover.thumbnailUrl || null)
      updateField('originalFileName', cover.originalFileName)
      updateCustomerAppField('orderHeaderImageUrl', cover.url)
      setSuccess('Titelbild hochgeladen und optimiert.')
    } catch (uploadError) {
      setError(uploadError instanceof Error ? uploadError.message : 'Titelbild-Upload fehlgeschlagen.')
    } finally {
      setUploadingCover(false)
    }
  }

  async function handleSave(event?: React.FormEvent) {
    event?.preventDefault()
    if (!settings) return
    const invalidZone = (settings.deliveryZones ?? []).find(
      (zone) => validateDeliveryZone(zone).length > 0
    )
    if (invalidZone) {
      setError(
        `Lieferzone „${invalidZone.name.trim() || 'Ohne Namen'}“ ist ungültig: ${validateDeliveryZone(invalidZone).join(' ')}`
      )
      setSelectedDeliveryZoneId(invalidZone.id)
      return
    }
    const requestUrl = '/api/business-settings'
    const requestMethod = 'PUT'

    console.log('ADMIN_SETTINGS_SAVE_CLICKED', {
      method: requestMethod,
      url: requestUrl,
      strategy: settings.deliveryArea?.strategy ?? null,
      zipCodesCount: settings.deliveryArea?.zipCodes?.length ?? 0,
      polygonPathLength: settings.deliveryArea?.polygonPath?.length ?? 0,
    })

    if (!confirmDoubleSave()) {
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')
      console.log('BUSINESS_SETTINGS_SAVE_REQUEST_START', {
        method: requestMethod,
        url: requestUrl,
        strategy: settings.deliveryArea?.strategy ?? null,
        zipCodesCount: settings.deliveryArea?.zipCodes?.length ?? 0,
        polygonPathLength: settings.deliveryArea?.polygonPath?.length ?? 0,
      })
      const saved = await updateBusinessSettings(settings)
      applySettingsSnapshot(saved)
      await loadDeliveryPreview(saved)

      const reloaded = await getBusinessSettings()
      applySettingsSnapshot(reloaded)
      await loadDeliveryPreview(reloaded)

      console.log('BUSINESS_SETTINGS_SAVE_SUCCESS', {
        strategy: reloaded.deliveryArea?.strategy ?? null,
        zipCodes: reloaded.deliveryArea?.zipCodes ?? [],
        zipCodesCount: reloaded.deliveryArea?.zipCodes?.length ?? 0,
        polygonPathLength: reloaded.deliveryArea?.polygonPath?.length ?? 0,
      })
      setSuccess('Einstellungen gespeichert.')
    } catch (saveError) {
      const message =
        saveError instanceof Error ? saveError.message : 'Einstellungen konnten nicht gespeichert werden'
      console.error('BUSINESS_SETTINGS_SAVE_ERROR', {
        message,
        strategy: settings.deliveryArea?.strategy ?? null,
        zipCodesCount: settings.deliveryArea?.zipCodes?.length ?? 0,
        polygonPathLength: settings.deliveryArea?.polygonPath?.length ?? 0,
      })
      setError(message)
    } finally {
      setSaving(false)
    }
  }

  const debugChecks = [
    {
      label: 'Öffnungszeiten / Lieferzeiten',
      state: deriveDebugCheckState(deliveryPreview, ['no_delivery_windows_available', 'outside_delivery_windows']),
    },
    {
      label: 'Bestellannahme',
      state: deriveDebugCheckState(deliveryPreview, ['order_intake_paused', 'order_intake_delivery_disabled', 'delivery_mode_disabled']),
    },
    {
      label: 'Feiertage / Ausnahmen',
      state: deriveDebugCheckState(deliveryPreview, ['holiday', 'feiertag']),
    },
    {
      label: 'Liefergebiet',
      state: deriveDebugCheckState(deliveryPreview, ['delivery_area']),
    },
    {
      label: 'Mindestvorlauf',
      state: deriveDebugCheckState(deliveryPreview, ['minimum_lead_time_active', 'mindestvorlauf']),
    },
    {
      label: 'Vorbestellung / Slots',
      state: deriveDebugCheckState(deliveryPreview, ['slot', 'preorder', 'vorbestell']),
    },
  ]

  const settingsSections = [
    { id: 'betrieb-oeffnungszeiten', label: 'Betrieb & Öffnungszeiten' },
    { id: 'lieferdienst', label: 'Lieferdienst' },
    { id: 'liefergebiete-kosten', label: 'Liefergebiete & Kosten' },
    { id: 'feiertage-ausnahmen', label: 'Feiertage & Ausnahmen' },
    { id: 'zahlungen', label: 'Zahlungen' },
    { id: 'app-darstellung', label: 'App & Darstellung' },
  ] as const

  const deliveryZones = settings?.deliveryZones ?? []
  const hasDeliveryZones = deliveryZones.length > 0
  const sortedDeliveryZones = [...deliveryZones].sort((left, right) => {
    if (left.priority !== right.priority) {
      return left.priority - right.priority
    }
    return left.name.localeCompare(right.name, 'de-DE')
  })
  const selectedDeliveryZone =
    deliveryZones.find((zone) => zone.id === selectedDeliveryZoneId) ?? null
  const deliveryZonePolygonOverlays = sortedDeliveryZones.map((zone) => ({
    id: zone.id,
    name: zone.name,
    enabled: zone.enabled,
    color: zone.color,
    polygonPath: zone.polygonPath,
  }))
  const selectedDeliveryZoneErrors = selectedDeliveryZone
    ? validateDeliveryZone(selectedDeliveryZone)
    : []
  const selectedDeliveryZonePricingRules = selectedDeliveryZone?.pricingRules ?? []

  return (
    <AdminLayout
      title="Zentrale Einstellungen"
      subtitle="Kanonische Master-Verwaltung für Filialdaten, App-Konfiguration, Zeiten und Betriebsparameter"
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
      <div className="mb-4 rounded-2xl border border-blue-200 bg-blue-50 px-4 py-3 text-sm text-blue-800">
        Impressum, Datenschutz, Support- und Kontolöschungs-Mail werden zentral von Klarando verwaltet.
      </div>
      {section ? (
        <div className="mb-4 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
          Diese Ansicht wurde aus der Legacy-Route <span className="font-mono">/admin/app-settings</span> geöffnet.
          Änderungen werden nur noch hier auf <span className="font-mono">/admin/settings</span> gepflegt.
        </div>
      ) : null}
      <div className="mb-4 rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-4 shadow-sm">
        <p className="text-sm font-semibold text-slate-900">Delivery App Einstellungen</p>
        <p className="mt-1 text-sm text-rose-900/75">
          Fahrerzugänge, QR-Geräteanmeldung, Gerätebindung und Fahrer-Logik findest du im eigenen Bereich.
        </p>
        <div className="mt-3">
          <Link
            href="/admin/drivers"
            className="inline-flex items-center rounded-xl bg-slate-900 px-4 py-2 text-sm font-medium text-white transition hover:bg-slate-800"
          >
            Delivery App öffnen
          </Link>
        </div>
      </div>

      {loading || !settings ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/75">Lade Einstellungen...</p>
        </section>
      ) : (
        <form onSubmit={handleSave} className="space-y-6">
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <div className="flex flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
              <div>
                <h2 className="text-xl font-semibold">Einstellungsbereiche</h2>
                <p className="mt-1 text-sm text-rose-900/70">
                  Die Oberfläche ist fachlich neu gegliedert. Bestehende Felder bleiben erhalten und speichern weiterhin über <span className="font-mono">businessSettings</span>.
                </p>
              </div>
              <div className="rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
                Die frühere Route <span className="font-mono">/admin/app-settings</span> ist Legacy. Änderungen werden nur noch hier gepflegt.
              </div>
            </div>
            <div className="mt-4 flex flex-wrap gap-2">
              {settingsSections.map((entry) => (
                <a
                  key={entry.id}
                  href={`#${entry.id}`}
                  className="inline-flex items-center rounded-full border border-[var(--brand-border)] bg-slate-50 px-3 py-1.5 text-sm font-medium text-slate-800 transition hover:border-slate-400 hover:bg-slate-100"
                >
                  {entry.label}
                </a>
              ))}
            </div>
          </section>

          <section id="betrieb-oeffnungszeiten" className="space-y-4">
            <div>
              <h2 className="text-2xl font-semibold text-slate-950">1. Betrieb & Öffnungszeiten</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Filialgrunddaten, allgemeiner Betriebsstatus und Ladenöffnungszeiten.
              </p>
            </div>
            <div className="grid gap-6 xl:grid-cols-2">
              <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
                <h3 className="text-xl font-semibold">Geschäft & Betreiber</h3>
                <div className="mt-4 grid gap-3 sm:grid-cols-2">
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Geschäftsname</span>
                    <input
                      value={settings.businessName || ''}
                      onChange={(event) => updateField('businessName', event.target.value || null)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Rechtlicher Name</span>
                    <input
                      value={settings.legalName || ''}
                      onChange={(event) => updateField('legalName', event.target.value || null)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Betreiber</span>
                    <input
                      value={settings.operatorName || ''}
                      onChange={(event) => updateField('operatorName', event.target.value || null)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Telefon</span>
                    <input
                      value={settings.phone || ''}
                      onChange={(event) => updateField('phone', event.target.value || null)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                  <label className="block sm:col-span-2">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Straße</span>
                    <input
                      value={settings.street || ''}
                      onChange={(event) => updateField('street', event.target.value || null)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">PLZ</span>
                    <input
                      value={settings.zipCode || ''}
                      onChange={(event) => updateField('zipCode', event.target.value || null)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Ort</span>
                    <input
                      value={settings.city || ''}
                      onChange={(event) => updateField('city', event.target.value || null)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Land</span>
                    <input
                      value={settings.country || ''}
                      onChange={(event) => updateField('country', event.target.value || null)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">E-Mail</span>
                    <input
                      value={settings.email || ''}
                      onChange={(event) => updateField('email', event.target.value || null)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                  <label className="block sm:col-span-2">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Website</span>
                    <input
                      value={settings.website || ''}
                      onChange={(event) => updateField('website', event.target.value || null)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                </div>
              </article>

              <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
                <h3 className="text-xl font-semibold">Ladenöffnungszeiten</h3>
                <p className="mt-1 text-sm text-rose-900/70">
                  Dieser Bereich steuert den allgemeinen Filialbetrieb und die Grundverfügbarkeit.
                </p>
                <div className="mt-3 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
                  Feiertage, Urlaub, Sonderöffnungen und sonstige Ausnahmen werden nicht hier gepflegt, sondern zentral im Bereich{' '}
                  <a href="#feiertage-ausnahmen" className="font-semibold underline underline-offset-2">
                    Feiertage & Ausnahmen
                  </a>
                  .
                </div>
                <div className="mt-4">
                  <AppSettingsFields
                    settings={settings}
                    onChange={setSettings}
                    showAppReleaseControls={false}
                    showComplianceControls={false}
                    showDeliveryCostControls={false}
                    showServiceFeeControls={false}
                    showServiceModeControls={false}
                    showOrderingControls={false}
                    showListingDisplayControls={false}
                    showServiceAreaEditor={false}
                    showOpeningHours
                    showDeliveryHours={false}
                    showHolidayHours={false}
                    showDeliveryScheduling={false}
                  />
                </div>
              </article>
            </div>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h3 className="text-xl font-semibold">Interne Notizen</h3>
              <textarea
                value={settings.notes || ''}
                onChange={(event) => updateField('notes', event.target.value || null)}
                rows={4}
                placeholder="Weitere wichtige Betriebsinformationen..."
                className="mt-3 w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </article>
          </section>

          <section id="lieferdienst" className="space-y-4">
            <div>
              <h2 className="text-2xl font-semibold text-slate-950">2. Lieferdienst</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Lieferzeiten, Mindestvorlauf, Vorbestellung, Bestellannahme und die technische Kundensicht auf die Lieferverfügbarkeit.
              </p>
            </div>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h3 className="text-xl font-semibold">Lieferbetrieb</h3>
              <p className="mt-1 text-sm text-rose-900/70">
                Diese Zeiten und Regeln gelten zentral für App und Checkout. Liefergebiete, PLZ, Radius und Polygon werden bewusst separat im nächsten Bereich verwaltet.
              </p>
              <div className="mt-3 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
                Sonderlieferzeiten, Feiertage und geschlossene Ausnahmetage werden nicht hier gepflegt, sondern zentral im Bereich{' '}
                <a href="#feiertage-ausnahmen" className="font-semibold underline underline-offset-2">
                  Feiertage & Ausnahmen
                </a>
                .
              </div>
              <div className="mt-4">
                <AppSettingsFields
                  settings={settings}
                  onChange={setSettings}
                  showAppReleaseControls={false}
                  showComplianceControls={false}
                  showDeliveryCostControls={false}
                  showServiceFeeControls={false}
                  showServiceModeControls
                  showOrderingControls
                  showListingDisplayControls={false}
                  showServiceAreaEditor={false}
                  showOpeningHours={false}
                  showDeliveryHours
                  showHolidayHours={false}
                  showDeliveryScheduling
                />
              </div>
            </article>

            <div className="rounded-3xl border border-[var(--brand-border)] bg-slate-50/80 p-4 shadow-sm">
              <div className="flex flex-col gap-3 lg:flex-row lg:items-start lg:justify-between">
                <div>
                  <h3 className="text-lg font-semibold text-slate-900">Kundensicht & Debug</h3>
                  <p className="mt-1 text-sm text-rose-900/70">
                    Diese Vorschau liest die zentrale Delivery-Availability-API und zeigt, was Kunden aktuell im Checkout sehen würden.
                  </p>
                </div>
                <button
                  type="button"
                  onClick={() => void loadDeliveryPreview()}
                  disabled={deliveryPreviewLoading}
                  className="inline-flex items-center justify-center rounded-xl bg-slate-900 px-4 py-2 text-sm font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:bg-slate-300"
                >
                  {deliveryPreviewLoading ? 'Vorschau wird geladen…' : 'Vorschau aktualisieren'}
                </button>
              </div>

              <div className="mt-4 grid gap-3 sm:grid-cols-2">
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Test-PLZ</span>
                  <input
                    value={deliveryPreviewZipCode}
                    onChange={(event) => setDeliveryPreviewZipCode(event.target.value)}
                    placeholder={settings.zipCode || 'z. B. 57072'}
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Test-Straße</span>
                  <input
                    value={deliveryPreviewStreet}
                    onChange={(event) => setDeliveryPreviewStreet(event.target.value)}
                    placeholder={settings.street || 'z. B. Musterstraße 1'}
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
              </div>

              {deliveryPreviewError ? (
                <div className="mt-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
                  {deliveryPreviewError}
                </div>
              ) : null}

              <div className="mt-4 grid gap-3 xl:grid-cols-3">
                <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                  <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">Aktuell für Kunden lieferbar</p>
                  <p className={`mt-2 text-2xl font-semibold ${deliveryPreview?.deliveryAvailability.isDeliveryAvailable ? 'text-green-700' : 'text-red-700'}`}>
                    {deliveryPreview?.deliveryAvailability.isDeliveryAvailable ? 'Ja' : 'Nein'}
                  </p>
                  <p className="mt-2 text-xs text-rose-900/65">
                    Bewertet am {formatPreviewDateTime(deliveryPreview?.evaluatedAt ?? null)}
                  </p>
                </div>
                <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                  <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">Nächste mögliche Lieferung</p>
                  <p className="mt-2 text-sm font-medium text-slate-900">
                    {formatPreviewDateTime(deliveryPreview?.deliveryAvailability.nextDeliveryAt ?? null)}
                  </p>
                </div>
                <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                  <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">Kundentext</p>
                  <p className="mt-2 text-sm text-slate-900">
                    {deliveryPreview?.deliveryAvailability.customerMessage || 'Noch keine Vorschau geladen.'}
                  </p>
                </div>
              </div>

              <div className="mt-4 grid gap-4 xl:grid-cols-3">
                <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 xl:col-span-1">
                  <h4 className="text-sm font-semibold text-slate-900">Lieferfenster heute</h4>
                  {deliveryPreview?.deliveryAvailability.todayDeliveryWindows.length ? (
                    <ul className="mt-3 space-y-2 text-sm text-slate-800">
                      {deliveryPreview.deliveryAvailability.todayDeliveryWindows.map((window, index) => (
                        <li key={`${window.start}-${window.end}-${index}`} className="rounded-xl border border-[var(--brand-border)] bg-slate-50 px-3 py-2">
                          <div className="font-medium">{formatWindowLabel(window.start, window.end)}</div>
                          <div className="mt-1 text-xs uppercase tracking-wide text-slate-500">
                            Quelle: {window.source === 'SLOT' ? 'Slot' : 'Basisfenster'}
                          </div>
                        </li>
                      ))}
                    </ul>
                  ) : (
                    <p className="mt-3 text-sm text-rose-900/70">Heute sind aktuell keine gültigen Lieferfenster vorhanden.</p>
                  )}
                </div>

                <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                  <h4 className="text-sm font-semibold text-slate-900">Blockierende Gründe</h4>
                  {deliveryPreview?.deliveryAvailability.blockingReasons.length ? (
                    <ul className="mt-3 space-y-2 text-sm text-red-700">
                      {deliveryPreview.deliveryAvailability.blockingReasons.map((reason) => (
                        <li key={reason} className="rounded-xl border border-red-200 bg-red-50 px-3 py-2 font-mono text-xs">
                          {reason}
                        </li>
                      ))}
                    </ul>
                  ) : (
                    <p className="mt-3 text-sm text-green-700">Aktuell keine blockierenden Gründe.</p>
                  )}
                </div>

                <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                  <h4 className="text-sm font-semibold text-slate-900">Debug-Prüfung</h4>
                  <ul className="mt-3 space-y-2 text-sm text-slate-800">
                    {debugChecks.map((check) => (
                      <li key={check.label} className="flex items-center justify-between rounded-xl border border-[var(--brand-border)] bg-slate-50 px-3 py-2">
                        <span>{check.label}</span>
                        <span
                          className={`rounded-full px-2 py-1 text-xs font-semibold ${
                            check.state === 'blocked'
                              ? 'bg-red-100 text-red-700'
                              : check.state === 'ok'
                                ? 'bg-green-100 text-green-700'
                                : 'bg-slate-200 text-slate-700'
                          }`}
                        >
                          {check.state === 'blocked' ? 'Blockiert' : check.state === 'ok' ? 'OK' : 'Unklar'}
                        </span>
                      </li>
                    ))}
                  </ul>
                  <h5 className="mt-4 text-xs font-semibold uppercase tracking-wide text-slate-500">Debug-Gründe</h5>
                  {deliveryPreview?.deliveryAvailability.debugReasons.length ? (
                    <ul className="mt-2 space-y-2 text-sm text-slate-700">
                      {deliveryPreview.deliveryAvailability.debugReasons.map((reason) => (
                        <li key={reason} className="rounded-xl border border-[var(--brand-border)] bg-slate-50 px-3 py-2">
                          {reason}
                        </li>
                      ))}
                    </ul>
                  ) : (
                    <p className="mt-2 text-sm text-rose-900/70">Noch keine Debug-Gründe vorhanden.</p>
                  )}
                </div>
              </div>
            </div>
          </section>

          <section id="liefergebiete-kosten" className="space-y-4">
            <div>
              <h2 className="text-2xl font-semibold text-slate-950">3. Liefergebiete & Kosten</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Wo geliefert wird und welche Konditionen dafür gelten — ohne Tageszeiten, Lieferfenster oder Vorbestell-Slots.
              </p>
            </div>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h3 className="text-xl font-semibold">Liefergebiet, Kosten & Mindestbestellwert</h3>
              <p className="mt-1 text-sm text-rose-900/70">
                Dieser Bereich enthält nur Gebiet und Kosten: PLZ, Radius, Polygon, Ausschlüsse, Liefergebühr und Mindestbestellwert.
              </p>
              <div className="mt-3 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
                Zeitfenster, Sonderöffnungszeiten und Feiertagsregeln werden hier bewusst nicht gepflegt. Ausnahmen liegen zentral im Bereich{' '}
                <a href="#feiertage-ausnahmen" className="font-semibold underline underline-offset-2">
                  Feiertage & Ausnahmen
                </a>
                .
              </div>
              <div className="mt-3 rounded-2xl border border-sky-200 bg-sky-50 px-4 py-3 text-sm text-sky-900">
                Polygon benötigt mindestens 3 Punkte. Für schnelle Tests bitte PLZ-Liste verwenden.
              </div>
              <div className="mt-4 space-y-4">
                <div className="rounded-2xl border border-[var(--brand-border)] bg-slate-50/80 p-4">
                  <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                    <div>
                      <h4 className="text-lg font-semibold text-slate-900">Lieferzonen V2</h4>
                      <p className="mt-1 text-sm text-rose-900/70">
                        Mehrere farbige Lieferzonen werden hier vorbereitet. Die bestehende deliveryArea bleibt parallel als Legacy-Fallback erhalten.
                      </p>
                    </div>
                    <button
                      type="button"
                      onClick={handleAddDeliveryZone}
                      className="inline-flex items-center justify-center rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white transition hover:bg-slate-800"
                    >
                      + Lieferzone hinzufügen
                    </button>
                  </div>

                  {sortedDeliveryZones.length > 0 ? (
                    <div className="mt-4 grid gap-3 lg:grid-cols-[280px_minmax(0,1fr)]">
                      <div className="space-y-2">
                        {sortedDeliveryZones.map((zone) => {
                          const isSelected = zone.id === selectedDeliveryZoneId
                          const zoneErrors = validateDeliveryZone(zone)
                          return (
                            <button
                              key={zone.id}
                              type="button"
                              onClick={() => setSelectedDeliveryZoneId(zone.id)}
                              className={`w-full rounded-2xl border px-4 py-3 text-left transition ${
                                isSelected
                                  ? 'border-slate-900 bg-white shadow-sm'
                                  : 'border-[var(--brand-border)] bg-white hover:bg-rose-50'
                              }`}
                            >
                              <div className="flex items-start justify-between gap-3">
                                <div className="min-w-0">
                                  <div className="flex items-center gap-2">
                                    <span
                                      className="h-3 w-3 shrink-0 rounded-full border border-white shadow-sm"
                                      style={{ backgroundColor: zone.color }}
                                    />
                                    <span className="truncate font-semibold text-slate-900">
                                      {zone.name || 'Unbenannte Lieferzone'}
                                    </span>
                                  </div>
                                  <div className="mt-2 flex flex-wrap gap-1.5 text-[11px]">
                                    <span className="rounded-full bg-slate-100 px-2 py-1 text-slate-700">
                                      Priorität {zone.priority}
                                    </span>
                                    <span className="rounded-full bg-sky-100 px-2 py-1 text-sky-700">
                                      {zone.strategy}
                                    </span>
                                    <span className="rounded-full bg-amber-100 px-2 py-1 text-amber-800">
                                      Mindestwert {zone.minOrderValue !== null ? `${zone.minOrderValue.toFixed(2)} €` : '—'}
                                    </span>
                                    <span className="rounded-full bg-emerald-100 px-2 py-1 text-emerald-800">
                                      Lieferkosten {zone.deliveryFee !== null ? `${zone.deliveryFee.toFixed(2)} €` : '—'}
                                    </span>
                                  </div>
                                  {zoneErrors.length > 0 ? (
                                    <p className="mt-2 text-xs text-red-700">
                                      {zoneErrors[0]}
                                    </p>
                                  ) : null}
                                </div>
                                <span
                                  className={`rounded-full px-2 py-1 text-[11px] font-semibold ${
                                    zone.enabled
                                      ? 'bg-emerald-100 text-emerald-700'
                                      : 'bg-slate-200 text-slate-700'
                                  }`}
                                >
                                  {zone.enabled ? 'Aktiv' : 'Inaktiv'}
                                </span>
                              </div>
                            </button>
                          )
                        })}
                      </div>

                      {selectedDeliveryZone ? (
                        <div className="space-y-4">
                          {selectedDeliveryZoneErrors.length > 0 ? (
                            <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
                              <p className="font-semibold">Bitte Lieferzone prüfen</p>
                              <ul className="mt-2 list-disc pl-5">
                                {selectedDeliveryZoneErrors.map((entry) => (
                                  <li key={entry}>{entry}</li>
                                ))}
                              </ul>
                            </div>
                          ) : null}
                          <div className="grid gap-3 rounded-2xl border border-[var(--brand-border)] bg-white p-4 md:grid-cols-2 xl:grid-cols-3">
                            <label className="block">
                              <span className="mb-1 block text-sm font-medium text-rose-900/85">Name</span>
                              <input
                                value={selectedDeliveryZone.name}
                                onChange={(event) =>
                                  updateDeliveryZone(selectedDeliveryZone.id, (zone) => ({
                                    ...zone,
                                    name: event.target.value,
                                  }))
                                }
                                className={`w-full rounded-xl px-3 py-2 text-sm outline-none ${
                                  !selectedDeliveryZone.name.trim()
                                    ? 'border border-red-300 bg-red-50'
                                    : 'border border-[var(--brand-border)]'
                                }`}
                              />
                            </label>
                            <label className="block">
                              <span className="mb-1 block text-sm font-medium text-rose-900/85">Farbe</span>
                              <div className="flex gap-2">
                                <input
                                  type="color"
                                  value={selectedDeliveryZone.color}
                                  onChange={(event) =>
                                    updateDeliveryZone(selectedDeliveryZone.id, (zone) => ({
                                      ...zone,
                                      color: event.target.value,
                                    }))
                                  }
                                  className="h-11 w-14 rounded-xl border border-[var(--brand-border)] bg-white p-1"
                                />
                                <input
                                  value={selectedDeliveryZone.color}
                                  onChange={(event) =>
                                    updateDeliveryZone(selectedDeliveryZone.id, (zone) => ({
                                      ...zone,
                                      color: event.target.value || '#22c55e',
                                    }))
                                  }
                                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                                />
                              </div>
                            </label>
                            <label className="inline-flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm text-rose-900/85">
                              <input
                                type="checkbox"
                                checked={selectedDeliveryZone.enabled}
                                onChange={(event) =>
                                  updateDeliveryZone(selectedDeliveryZone.id, (zone) => ({
                                    ...zone,
                                    enabled: event.target.checked,
                                  }))
                                }
                              />
                              Zone aktiv
                            </label>
                            <label className="block">
                              <span className="mb-1 block text-sm font-medium text-rose-900/85">Priorität</span>
                              <input
                                type="number"
                                min={1}
                                step={1}
                                value={selectedDeliveryZone.priority}
                                onChange={(event) =>
                                  updateDeliveryZone(selectedDeliveryZone.id, (zone) => ({
                                    ...zone,
                                    priority: parseNullableInteger(event.target.value) ?? 1,
                                  }))
                                }
                                className={`w-full rounded-xl px-3 py-2 text-sm outline-none ${
                                  selectedDeliveryZone.priority < 1
                                    ? 'border border-red-300 bg-red-50'
                                    : 'border border-[var(--brand-border)]'
                                }`}
                              />
                            </label>
                            <label className="block">
                              <span className="mb-1 block text-sm font-medium text-rose-900/85">Mindestbestellwert</span>
                              <input
                                type="number"
                                min={0}
                                step={0.01}
                                value={selectedDeliveryZone.minOrderValue ?? ''}
                                onChange={(event) =>
                                  updateDeliveryZone(selectedDeliveryZone.id, (zone) => ({
                                    ...zone,
                                    minOrderValue: parseNullableNumber(event.target.value),
                                  }))
                                }
                                className={`w-full rounded-xl px-3 py-2 text-sm outline-none ${
                                  selectedDeliveryZone.minOrderValue !== null && selectedDeliveryZone.minOrderValue < 0
                                    ? 'border border-red-300 bg-red-50'
                                    : 'border border-[var(--brand-border)]'
                                }`}
                              />
                            </label>
                            <label className="block">
                              <span className="mb-1 block text-sm font-medium text-rose-900/85">Lieferkosten</span>
                              <input
                                type="number"
                                min={0}
                                step={0.01}
                                value={selectedDeliveryZone.deliveryFee ?? ''}
                                onChange={(event) =>
                                  updateDeliveryZone(selectedDeliveryZone.id, (zone) => ({
                                    ...zone,
                                    deliveryFee: parseNullableNumber(event.target.value),
                                  }))
                                }
                                className={`w-full rounded-xl px-3 py-2 text-sm outline-none ${
                                  selectedDeliveryZone.deliveryFee !== null && selectedDeliveryZone.deliveryFee < 0
                                    ? 'border border-red-300 bg-red-50'
                                    : 'border border-[var(--brand-border)]'
                                }`}
                              />
                            </label>
                            <label className="block">
                              <span className="mb-1 block text-sm font-medium text-rose-900/85">Kostenlos ab</span>
                              <input
                                type="number"
                                min={0}
                                step={0.01}
                                value={selectedDeliveryZone.freeDeliveryFrom ?? ''}
                                onChange={(event) =>
                                  updateDeliveryZone(selectedDeliveryZone.id, (zone) => ({
                                    ...zone,
                                    freeDeliveryFrom: parseNullableNumber(event.target.value),
                                  }))
                                }
                                className={`w-full rounded-xl px-3 py-2 text-sm outline-none ${
                                  selectedDeliveryZone.freeDeliveryFrom !== null && selectedDeliveryZone.freeDeliveryFrom < 0
                                    ? 'border border-red-300 bg-red-50'
                                    : 'border border-[var(--brand-border)]'
                                }`}
                              />
                            </label>
                            <label className="block">
                              <span className="mb-1 block text-sm font-medium text-rose-900/85">Lieferzeit (Minuten)</span>
                              <input
                                type="number"
                                min={0}
                                step={1}
                                value={selectedDeliveryZone.estimatedDeliveryMinutes ?? ''}
                                onChange={(event) =>
                                  updateDeliveryZone(selectedDeliveryZone.id, (zone) => ({
                                    ...zone,
                                    estimatedDeliveryMinutes: parseNullableInteger(event.target.value),
                                  }))
                                }
                                className={`w-full rounded-xl px-3 py-2 text-sm outline-none ${
                                  selectedDeliveryZone.estimatedDeliveryMinutes !== null &&
                                  selectedDeliveryZone.estimatedDeliveryMinutes < 0
                                    ? 'border border-red-300 bg-red-50'
                                    : 'border border-[var(--brand-border)]'
                                }`}
                              />
                            </label>
                            <div className="flex items-end">
                              <button
                                type="button"
                                onClick={() => handleDeleteDeliveryZone(selectedDeliveryZone.id)}
                                className="w-full rounded-xl border border-red-300 bg-white px-4 py-2.5 text-sm font-semibold text-red-700 transition hover:bg-red-50"
                              >
                                Zone löschen
                              </button>
                            </div>
                          </div>

                          <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                            <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
                              <div>
                                <h3 className="text-base font-semibold text-slate-900">
                                  Zeitabhängige Lieferkosten
                                </h3>
                                <p className="mt-1 text-sm text-rose-900/70">
                                  Optionale Preisregeln ergänzen die Basis-Liefergebühr dieser Zone, ohne Checkout oder Discovery bereits umzubauen.
                                </p>
                              </div>
                              <button
                                type="button"
                                onClick={() =>
                                  handleAddDeliveryZonePricingRule(selectedDeliveryZone.id)
                                }
                                className="inline-flex items-center justify-center rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white transition hover:bg-slate-800"
                              >
                                + Preisregel hinzufügen
                              </button>
                            </div>

                            {selectedDeliveryZonePricingRules.length === 0 ? (
                              <div className="mt-4 rounded-2xl border border-dashed border-[var(--brand-border)] bg-slate-50 px-4 py-4 text-sm text-rose-900/70">
                                Für diese Lieferzone sind noch keine zeitabhängigen Preisregeln hinterlegt. Die Basis-Liefergebühr bleibt der Fallback.
                              </div>
                            ) : (
                              <div className="mt-4 space-y-4">
                                {selectedDeliveryZonePricingRules
                                  .slice()
                                  .sort((left, right) => {
                                    if (left.priority !== right.priority) {
                                      return left.priority - right.priority
                                    }
                                    return left.label.localeCompare(right.label, 'de-DE')
                                  })
                                  .map((rule) => (
                                    <div
                                      key={rule.id}
                                      className="rounded-2xl border border-slate-200 bg-slate-50/60 p-4"
                                    >
                                      <div className="flex flex-col gap-3 lg:flex-row lg:items-start lg:justify-between">
                                        <div className="min-w-0">
                                          <div className="flex flex-wrap items-center gap-2">
                                            <span className="rounded-full bg-slate-900 px-2.5 py-1 text-[11px] font-semibold text-white">
                                              Priorität {rule.priority}
                                            </span>
                                            <span
                                              className={`rounded-full px-2.5 py-1 text-[11px] font-semibold ${
                                                rule.active
                                                  ? 'bg-emerald-100 text-emerald-700'
                                                  : 'bg-slate-200 text-slate-700'
                                              }`}
                                            >
                                              {rule.active ? 'Aktiv' : 'Inaktiv'}
                                            </span>
                                            <span className="rounded-full bg-amber-100 px-2.5 py-1 text-[11px] font-semibold text-amber-800">
                                              {rule.priceMode === 'SURCHARGE'
                                                ? 'Zuschlag'
                                                : 'Fester Lieferpreis'}
                                            </span>
                                          </div>
                                          <p className="mt-2 text-sm font-semibold text-slate-900">
                                            {rule.label || 'Unbenannte Preisregel'}
                                          </p>
                                        </div>
                                        <button
                                          type="button"
                                          onClick={() =>
                                            handleDeleteDeliveryZonePricingRule(
                                              selectedDeliveryZone.id,
                                              rule.id
                                            )
                                          }
                                          className="inline-flex items-center justify-center rounded-xl border border-red-300 bg-white px-3 py-2 text-sm font-semibold text-red-700 transition hover:bg-red-50"
                                        >
                                          Regel löschen
                                        </button>
                                      </div>

                                      <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-3">
                                        <label className="block">
                                          <span className="mb-1 block text-sm font-medium text-rose-900/85">
                                            Name
                                          </span>
                                          <input
                                            value={rule.label}
                                            onChange={(event) =>
                                              updateDeliveryZonePricingRule(
                                                selectedDeliveryZone.id,
                                                rule.id,
                                                (currentRule) => ({
                                                  ...currentRule,
                                                  label: event.target.value,
                                                })
                                              )
                                            }
                                            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                                          />
                                        </label>
                                        <label className="inline-flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm text-rose-900/85">
                                          <input
                                            type="checkbox"
                                            checked={rule.active}
                                            onChange={(event) =>
                                              updateDeliveryZonePricingRule(
                                                selectedDeliveryZone.id,
                                                rule.id,
                                                (currentRule) => ({
                                                  ...currentRule,
                                                  active: event.target.checked,
                                                })
                                              )
                                            }
                                          />
                                          Regel aktiv
                                        </label>
                                        <label className="block">
                                          <span className="mb-1 block text-sm font-medium text-rose-900/85">
                                            Priorität
                                          </span>
                                          <input
                                            type="number"
                                            min={1}
                                            step={1}
                                            value={rule.priority}
                                            onChange={(event) =>
                                              updateDeliveryZonePricingRule(
                                                selectedDeliveryZone.id,
                                                rule.id,
                                                (currentRule) => ({
                                                  ...currentRule,
                                                  priority:
                                                    parseNullableInteger(event.target.value) ??
                                                    1,
                                                })
                                              )
                                            }
                                            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                                          />
                                        </label>
                                        <label className="block">
                                          <span className="mb-1 block text-sm font-medium text-rose-900/85">
                                            Von
                                          </span>
                                          <input
                                            type="time"
                                            value={rule.startTime ?? ''}
                                            onChange={(event) =>
                                              updateDeliveryZonePricingRule(
                                                selectedDeliveryZone.id,
                                                rule.id,
                                                (currentRule) => ({
                                                  ...currentRule,
                                                  startTime: event.target.value || null,
                                                })
                                              )
                                            }
                                            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                                          />
                                        </label>
                                        <label className="block">
                                          <span className="mb-1 block text-sm font-medium text-rose-900/85">
                                            Bis
                                          </span>
                                          <input
                                            type="time"
                                            value={rule.endTime ?? ''}
                                            onChange={(event) =>
                                              updateDeliveryZonePricingRule(
                                                selectedDeliveryZone.id,
                                                rule.id,
                                                (currentRule) => ({
                                                  ...currentRule,
                                                  endTime: event.target.value || null,
                                                })
                                              )
                                            }
                                            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                                          />
                                        </label>
                                        <label className="block">
                                          <span className="mb-1 block text-sm font-medium text-rose-900/85">
                                            Modus
                                          </span>
                                          <select
                                            value={rule.priceMode}
                                            onChange={(event) =>
                                              updateDeliveryZonePricingRule(
                                                selectedDeliveryZone.id,
                                                rule.id,
                                                (currentRule) => ({
                                                  ...currentRule,
                                                  priceMode:
                                                    event.target
                                                      .value as BusinessDeliveryZonePricingRule['priceMode'],
                                                })
                                              )
                                            }
                                            className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none"
                                          >
                                            <option value="SURCHARGE">Zuschlag</option>
                                            <option value="FIXED_FEE">
                                              Fester Lieferpreis
                                            </option>
                                          </select>
                                        </label>
                                        <label className="block">
                                          <span className="mb-1 block text-sm font-medium text-rose-900/85">
                                            Zuschlag in EUR
                                          </span>
                                          <input
                                            type="number"
                                            min={0}
                                            step={0.01}
                                            value={rule.surchargeAmount ?? ''}
                                            onChange={(event) =>
                                              updateDeliveryZonePricingRule(
                                                selectedDeliveryZone.id,
                                                rule.id,
                                                (currentRule) => ({
                                                  ...currentRule,
                                                  surchargeAmount: parseNullableNumber(
                                                    event.target.value
                                                  ),
                                                })
                                              )
                                            }
                                            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                                          />
                                        </label>
                                        <label className="block">
                                          <span className="mb-1 block text-sm font-medium text-rose-900/85">
                                            Lieferpreis in EUR
                                          </span>
                                          <input
                                            type="number"
                                            min={0}
                                            step={0.01}
                                            value={rule.deliveryFee ?? ''}
                                            onChange={(event) =>
                                              updateDeliveryZonePricingRule(
                                                selectedDeliveryZone.id,
                                                rule.id,
                                                (currentRule) => ({
                                                  ...currentRule,
                                                  deliveryFee: parseNullableNumber(
                                                    event.target.value
                                                  ),
                                                })
                                              )
                                            }
                                            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                                          />
                                        </label>
                                        <label className="block">
                                          <span className="mb-1 block text-sm font-medium text-rose-900/85">
                                            Feiertagsmodus
                                          </span>
                                          <select
                                            value={rule.holidayMode}
                                            onChange={(event) =>
                                              updateDeliveryZonePricingRule(
                                                selectedDeliveryZone.id,
                                                rule.id,
                                                (currentRule) => ({
                                                  ...currentRule,
                                                  holidayMode:
                                                    event.target
                                                      .value as BusinessDeliveryZonePricingRule['holidayMode'],
                                                })
                                              )
                                            }
                                            className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none"
                                          >
                                            <option value="NONE">Keine Feiertagsregel</option>
                                            <option value="HOLIDAY_ONLY">
                                              Nur an Feiertagen
                                            </option>
                                            <option value="EXCLUDE_HOLIDAYS">
                                              An Feiertagen ausschließen
                                            </option>
                                          </select>
                                        </label>
                                      </div>

                                      <div className="mt-4">
                                        <span className="mb-2 block text-sm font-medium text-rose-900/85">
                                          Wochentage
                                        </span>
                                        <div className="flex flex-wrap gap-2">
                                          {weekdayOptions.map((day) => {
                                            const isActive = rule.daysOfWeek.includes(day.value)
                                            return (
                                              <button
                                                key={day.value}
                                                type="button"
                                                onClick={() =>
                                                  updateDeliveryZonePricingRule(
                                                    selectedDeliveryZone.id,
                                                    rule.id,
                                                    (currentRule) => ({
                                                      ...currentRule,
                                                      daysOfWeek: isActive
                                                        ? currentRule.daysOfWeek.filter(
                                                            (entry) => entry !== day.value
                                                          )
                                                        : [
                                                            ...currentRule.daysOfWeek,
                                                            day.value,
                                                          ].sort((left, right) => left - right),
                                                    })
                                                  )
                                                }
                                                className={`rounded-full border px-3 py-1.5 text-sm font-medium transition ${
                                                  isActive
                                                    ? 'border-slate-900 bg-slate-900 text-white'
                                                    : 'border-[var(--brand-border)] bg-white text-slate-700 hover:bg-slate-100'
                                                }`}
                                              >
                                                {day.label}
                                              </button>
                                            )
                                          })}
                                        </div>
                                      </div>
                                    </div>
                                  ))}
                              </div>
                            )}
                          </div>

                          <ServiceAreaEditor
                            title={`Zonen-Editor: ${selectedDeliveryZone.name || 'Neue Lieferzone'}`}
                            subtitle="Bearbeitet Strategie, Polygon, PLZ und Radius der ausgewählten Lieferzone."
                            value={zoneToServiceArea(selectedDeliveryZone)}
                            strategyOptions={[
                              { value: 'POLYGON', label: 'OpenStreetMap Polygon' },
                              { value: 'ZIP_LIST', label: 'Nur PLZ-Liste' },
                              { value: 'RADIUS', label: 'Nur Radius' },
                            ]}
                            polygonOverlayZones={deliveryZonePolygonOverlays}
                            selectedOverlayZoneId={selectedDeliveryZone.id}
                            activePolygonColor={selectedDeliveryZone.color}
                            onChange={(nextArea) =>
                              updateDeliveryZone(selectedDeliveryZone.id, (zone) =>
                                mergeServiceAreaIntoZone(zone, nextArea)
                              )
                            }
                          />
                        </div>
                      ) : null}
                    </div>
                  ) : (
                    <div className="mt-4 rounded-2xl border border-dashed border-[var(--brand-border)] bg-white px-4 py-4 text-sm text-rose-900/75">
                      Noch keine Lieferzonen angelegt. Über „+ Lieferzone hinzufügen“ kannst du die erste Zone anlegen.
                    </div>
                  )}
                </div>

                <div className="rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
                  <p className="font-semibold">Legacy / Fallback</p>
                  <p className="mt-1">
                    Die bestehende <code>deliveryArea</code> bleibt unverändert gespeichert und dient weiterhin als Fallback, bis Discovery und Checkout später auf <code>deliveryZones[]</code> umgestellt werden.
                  </p>
                  <p className="mt-2 text-xs">
                    Aktuell: Strategie {settings.deliveryArea.strategy}, PLZ {settings.deliveryArea.zipCodes.length}, Polygonpunkte {settings.deliveryArea.polygonPath.length}, Radius {settings.deliveryArea.radiusKm ?? '—'} km
                  </p>
                  {hasDeliveryZones ? (
                    <p className="mt-2 text-xs font-medium">
                      Liefergebühr, Mindestbestellwert, Kostenlos-ab und Lieferzeit werden bei aktiven Lieferzonen ausschließlich pro Zone gepflegt und deshalb im Legacy-Bereich ausgeblendet.
                    </p>
                  ) : null}
                </div>

                <AppSettingsFields
                  settings={settings}
                  onChange={setSettings}
                  showAppReleaseControls={false}
                  showComplianceControls={false}
                  showDeliveryCostControls={!hasDeliveryZones}
                  showServiceFeeControls={false}
                  showServiceModeControls={false}
                  showOrderingControls={false}
                  showListingDisplayControls={false}
                  showServiceAreaEditor={false}
                  serviceAreaTitle="Liefergebiete & Kosten"
                  serviceAreaSubtitle="PLZ, Radius, Polygon, ausgeschlossene Bereiche sowie Lieferkonditionen zentral verwalten."
                  showOpeningHours={false}
                  showDeliveryHours={false}
                  showHolidayHours={false}
                  showDeliveryScheduling={false}
                />
              </div>
            </article>
          </section>

          <section id="feiertage-ausnahmen" className="space-y-4">
            <div>
              <h2 className="text-2xl font-semibold text-slate-950">4. Feiertage & Ausnahmen</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Feiertage, Urlaub, Sonderöffnungen und abweichende Zeiten überschreiben die normalen Tagesfenster.
              </p>
            </div>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h3 className="text-xl font-semibold">Ausnahmen verwalten</h3>
              <p className="mt-1 text-sm text-rose-900/70">
                Hier werden Feiertage, Urlaub, geschlossene Tage, Sonderöffnungszeiten, Sonderlieferzeiten und sonstige Abweichungen von den normalen Öffnungs- und Lieferzeiten gebündelt gepflegt.
              </p>
              <div className="mt-4">
                <AppSettingsFields
                  settings={settings}
                  onChange={setSettings}
                  showAppReleaseControls={false}
                  showComplianceControls={false}
                  showDeliveryCostControls={false}
                  showServiceFeeControls={false}
                  showServiceModeControls={false}
                  showOrderingControls={false}
                  showListingDisplayControls={false}
                  showServiceAreaEditor={false}
                  showOpeningHours={false}
                  showDeliveryHours={false}
                  showHolidayHours
                  showDeliveryScheduling={false}
                />
              </div>
            </article>
          </section>

          <section id="zahlungen" className="space-y-4">
            <div>
              <h2 className="text-2xl font-semibold text-slate-950">5. Zahlungen</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Aktive Zahlungsanbindung und abrechnungsnahe Stammdaten. Klarando nutzt aktiv ausschließlich Stripe.
              </p>
            </div>
            <div className="grid gap-6 xl:grid-cols-2">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h3 className="text-xl font-semibold">Stripe als aktive Zahlungsart</h3>
              <p className="mt-2 text-sm text-rose-900/70">
                Stripe Connect ist die einzige aktive Zahlungsoption in Klarando. Konfiguration, Status und Gebühren werden zentral im Finanzbereich gepflegt.
              </p>
              <div className="mt-3 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
                Plattformweite Checkout-, Compliance- und Rechtstexte werden zentral durch Klarando im Superadmin gepflegt und sind im normalen Adminbereich ausgeblendet.
              </div>
              <div className="mt-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-800">
                PayPal bleibt nur als Legacy-Kompatibilität im Code bestehen und wird hier nicht mehr als aktive Oberfläche angezeigt.
              </div>
                <div className="mt-4 flex flex-wrap gap-3">
                  <Link
                    href="/admin/finanzen"
                    className="inline-flex items-center rounded-xl bg-slate-900 px-4 py-2 text-sm font-medium text-white transition hover:bg-slate-800"
                  >
                    Stripe & Abrechnung öffnen
                  </Link>
                  <Link
                    href="/admin/payments"
                    className="inline-flex items-center rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2 text-sm font-medium text-slate-800 transition hover:bg-slate-50"
                  >
                    Legacy-Zahlungen anzeigen
                  </Link>
                </div>
              </article>
            </div>
          </section>

          <section id="app-darstellung" className="space-y-4">
            <div>
              <h2 className="text-2xl font-semibold text-slate-950">6. App & Darstellung</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Branding, Titelbild, Betreibertexte und sichtbare Elemente der Kundendarstellung.
              </p>
            </div>
            <div className="grid gap-6 xl:grid-cols-2">
              <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
                <h3 className="text-xl font-semibold">Betreiber-Medien für die App</h3>
                <p className="mt-1 text-sm text-rose-900/70">
                  Hier pflegst du Betreiberlogo und Titelbild zentral an einer Stelle.
                </p>
                <div className="mt-3 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
                  Rechtstexte, Compliance-Felder und Checkout-Gebühren werden zentral im Superadmin gepflegt und sind im normalen Adminbereich nicht sichtbar.
                </div>

                <div className="mt-3 grid gap-3 sm:grid-cols-2">
                  <div className="rounded-xl border border-[var(--brand-border)] bg-white p-3">
                    <p className="text-xs font-semibold uppercase tracking-wide text-slate-700">
                      Betreiberlogo
                    </p>
                    <input
                      type="file"
                      accept="image/jpeg,image/png,image/webp"
                      disabled={uploadingLogo}
                      onChange={(event) => void handleLogoFile(event.target.files?.[0] || null)}
                      className="mt-2 w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none file:mr-3 file:rounded-lg file:border-0 file:bg-slate-900 file:px-3 file:py-1.5 file:text-xs file:font-semibold file:text-white"
                    />
                    <p className="mt-2 text-xs text-slate-600">
                      Bild wird automatisch optimiert (max. 10 MB, Ausgabe als WebP).
                    </p>
                    {uploadingLogo ? (
                      <p className="mt-2 text-xs font-medium text-[var(--brand-orange)]">Logo wird hochgeladen ...</p>
                    ) : null}
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
                      <p className="mt-2 text-xs text-rose-900/70">Wird in App und Suche angezeigt.</p>
                    )}
                  </div>

                  <div className="rounded-xl border border-[var(--brand-border)] bg-white p-3">
                    <p className="text-xs font-semibold uppercase tracking-wide text-slate-700">
                      Titelbild (Bestellmodus)
                    </p>
                    <input
                      type="file"
                      accept="image/jpeg,image/png,image/webp"
                      disabled={uploadingCover}
                      onChange={(event) => void handleTitleImageFile(event.target.files?.[0] || null)}
                      className="mt-2 w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none file:mr-3 file:rounded-lg file:border-0 file:bg-slate-900 file:px-3 file:py-1.5 file:text-xs file:font-semibold file:text-white"
                    />
                    <p className="mt-2 text-xs text-slate-600">
                      Bild wird automatisch optimiert (max. 10 MB, Ausgabe als WebP).
                    </p>
                    {uploadingCover ? (
                      <p className="mt-2 text-xs font-medium text-[var(--brand-orange)]">Titelbild wird hochgeladen ...</p>
                    ) : null}
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
                        Wird oben über die gesamte Breite im Bestellmodus angezeigt.
                      </p>
                    )}
                  </div>

                  <label className="block sm:col-span-2">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">
                      Info-Titel zum Betreiber
                    </span>
                    <input
                      value={settings.customerApp.localInfoTitle || ''}
                      onChange={(event) =>
                        updateCustomerAppField('localInfoTitle', event.target.value || null)
                      }
                      placeholder="z. B. Über unser Lokal"
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>

                  <label className="block sm:col-span-2">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">
                      Info-Text zum Betreiber
                    </span>
                    <textarea
                      rows={4}
                      value={settings.customerApp.localInfoText || ''}
                      onChange={(event) =>
                        updateCustomerAppField('localInfoText', event.target.value || null)
                      }
                      placeholder="Hier stehen die Infos, die beim Tippen auf das Titelbild gezeigt werden."
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    />
                  </label>
                </div>
              </article>

              <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
                <h3 className="text-xl font-semibold">Darstellung in der Customer-App</h3>
                <div className="mt-4">
                  <AppSettingsFields
                    settings={settings}
                    onChange={setSettings}
                    showAppReleaseControls={false}
                    showComplianceControls={false}
                    showDeliveryCostControls={false}
                    showServiceFeeControls={false}
                    showServiceModeControls={false}
                    showOrderingControls={false}
                    showListingDisplayControls
                    showServiceAreaEditor={false}
                    showOpeningHours={false}
                    showDeliveryHours={false}
                    showHolidayHours={false}
                    showDeliveryScheduling={false}
                  />
                </div>
              </article>
            </div>
          </section>

          <div className="flex justify-end">
            <button
              type="button"
              disabled={saving}
              onClick={() => void handleSave()}
              className="rounded-xl bg-orange-600 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-orange-700 disabled:cursor-not-allowed disabled:opacity-60"
            >
              {saving ? 'Speichert...' : 'Einstellungen speichern'}
            </button>
          </div>
        </form>
      )}
    </AdminLayout>
  )
}

