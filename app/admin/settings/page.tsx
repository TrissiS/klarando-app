'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import AppSettingsFields from '@/app/Components/admin/AppSettingsFields'
import {
  getDeliveryAvailabilityPreview,
  getBusinessSettings,
  uploadBusinessSettingsImage,
  updateBusinessSettings,
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

export default function AdminSettingsPage() {
  const [section, setSection] = useState('')
  const [settings, setSettings] = useState<BusinessSettings | null>(null)
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

  async function loadData() {
    try {
      setLoading(true)
      const data = await getBusinessSettings()
      setSettings(data)
      setDeliveryPreviewZipCode(data.zipCode || '')
      setDeliveryPreviewStreet(data.street || '')
      await loadDeliveryPreview(data)
      setError('')
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Einstellungen konnten nicht geladen werden')
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

  async function handleSave(event: React.FormEvent) {
    event.preventDefault()
    if (!settings) return

    if (!confirmDoubleSave()) {
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')
      const saved = await updateBusinessSettings(settings)
      setSettings(saved)
      setDeliveryPreviewZipCode((current) => current || saved.zipCode || '')
      setDeliveryPreviewStreet((current) => current || saved.street || '')
      await loadDeliveryPreview(saved)
      setSuccess('Einstellungen gespeichert.')
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Einstellungen konnten nicht gespeichert werden')
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
    { id: 'rechtliches-compliance', label: 'Rechtliches & Compliance' },
    { id: 'app-darstellung', label: 'App & Darstellung' },
  ] as const

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
              <div className="mt-4">
                <AppSettingsFields
                  settings={settings}
                  onChange={setSettings}
                  showAppReleaseControls={false}
                  showComplianceControls={false}
                  showDeliveryCostControls
                  showServiceFeeControls={false}
                  showServiceModeControls={false}
                  showOrderingControls={false}
                  showListingDisplayControls={false}
                  showServiceAreaEditor
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

              <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
                <h3 className="text-xl font-semibold">Steuer, IDs & Abrechnung</h3>
                <p className="mt-1 text-sm text-rose-900/70">
                  Diese Daten sind sichtbar, aber nur durch Superadmin bearbeitbar.
                </p>
                <div className="mt-4 grid gap-3 sm:grid-cols-2">
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">USt-ID</span>
                    <input value={settings.vatId || ''} disabled className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none" />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Steuernummer</span>
                    <input value={settings.taxNumber || ''} disabled className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none" />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Umsatz-ID / GLN</span>
                    <input value={settings.revenueId || ''} disabled className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none" />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Finanzamt</span>
                    <input value={settings.taxOffice || ''} disabled className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none" />
                  </label>
                  <label className="block sm:col-span-2">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Kontoinhaber</span>
                    <input value={settings.payoutAccountHolder || ''} disabled className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none" />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">IBAN</span>
                    <input value={settings.payoutIban || ''} disabled className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none" />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">BIC</span>
                    <input value={settings.payoutBic || ''} disabled className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none" />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Bank</span>
                    <input value={settings.payoutBankName || ''} disabled className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none" />
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Abrechnungs E-Mail</span>
                    <input value={settings.payoutEmail || ''} disabled className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none" />
                  </label>
                  <label className="block sm:col-span-2">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Zahlungsreferenz</span>
                    <input value={settings.payoutReference || ''} disabled className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none" />
                  </label>
                </div>
              </article>
            </div>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h3 className="text-xl font-semibold">Checkout-Gebühren</h3>
              <p className="mt-1 text-sm text-rose-900/70">
                Bestehende Gebührenfelder bleiben erhalten, werden aber nicht mehr zusammen mit PayPal angezeigt.
              </p>
              <div className="mt-4">
                <AppSettingsFields
                  settings={settings}
                  onChange={setSettings}
                  showAppReleaseControls={false}
                  showComplianceControls={false}
                  showDeliveryCostControls={false}
                  showServiceFeeControls
                  showServiceModeControls={false}
                  showOrderingControls={false}
                  showListingDisplayControls={false}
                  showServiceAreaEditor={false}
                  showOpeningHours={false}
                  showDeliveryHours={false}
                  showHolidayHours={false}
                  showDeliveryScheduling={false}
                />
              </div>
            </article>
          </section>

          <section id="rechtliches-compliance" className="space-y-4">
            <div>
              <h2 className="text-2xl font-semibold text-slate-950">6. Rechtliches & Compliance</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Rechtliche Pflichttexte und Compliance-Hinweise bleiben fachlich getrennt vom Liefer- und Zahlungsbereich.
              </p>
            </div>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h3 className="text-xl font-semibold">Zentral verwaltete Rechtstexte</h3>
              <p className="mt-1 text-sm text-rose-900/70">
                Diese Einstellungen werden zentral im Superadminbereich von Klarando verwaltet.
              </p>
              <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4 text-sm text-rose-900/80">
                Für diese Filiale ist der Bereich aktuell nur als Hinweis sichtbar. PayPal-spezifische Hinweise werden hier nicht mehr angezeigt.
              </div>
            </article>
          </section>

          <section id="app-darstellung" className="space-y-4">
            <div>
              <h2 className="text-2xl font-semibold text-slate-950">7. App & Darstellung</h2>
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
              type="submit"
              disabled={saving}
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

