'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import AppSettingsFields from '@/app/Components/admin/AppSettingsFields'
import {
  getTenantPaypalPaymentConfig,
  getBusinessSettings,
  uploadBusinessSettingsImage,
  updateTenantPaypalPaymentConfig,
  updateBusinessSettings,
  type BusinessSettings,
  type TenantPaypalPaymentConfig,
} from '@/lib/api'
import { resolveTenantId } from '@/lib/config'

function confirmDoubleSave() {
  const firstCheck = window.confirm('Einstellungen wirklich ändern?')
  if (!firstCheck) {
    return false
  }
  return window.confirm('Zweite Bestätigung: Änderungen jetzt speichern?')
}

export default function AdminSettingsPage() {
  const [section, setSection] = useState('')
  const [settings, setSettings] = useState<BusinessSettings | null>(null)
  const [paypalConfig, setPaypalConfig] = useState<TenantPaypalPaymentConfig | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [uploadingLogo, setUploadingLogo] = useState(false)
  const [uploadingCover, setUploadingCover] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  async function loadData() {
    try {
      setLoading(true)
      const data = await getBusinessSettings()
      setSettings(data)
      const tenantId = resolveTenantId()
      const token = window.localStorage.getItem('accessToken')
      if (token && tenantId) {
        const paymentData = await getTenantPaypalPaymentConfig(token, tenantId)
        setPaypalConfig(paymentData)
      }
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
      const token = window.localStorage.getItem('accessToken')
      const tenantId = resolveTenantId()
      if (token && tenantId && paypalConfig) {
        const updatedPayment = await updateTenantPaypalPaymentConfig(token, tenantId, {
          paypalMerchantId: paypalConfig.paypalMerchantId,
          paypalEmail: paypalConfig.paypalEmail,
          paypalOnboardingStatus: paypalConfig.paypalOnboardingStatus,
          paypalEnvironment: paypalConfig.paypalEnvironment,
          paypalPaymentsEnabled: paypalConfig.paypalPaymentsEnabled,
          klarandoPlatformFeePercent: paypalConfig.klarandoPlatformFeePercent,
          klarandoPlatformFeeFixed: paypalConfig.klarandoPlatformFeeFixed,
        })
        setPaypalConfig(updatedPayment)
      }
      setSuccess('Einstellungen gespeichert.')
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Einstellungen konnten nicht gespeichert werden')
    } finally {
      setSaving(false)
    }
  }

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
          <section id="business-settings" className="grid gap-6 xl:grid-cols-2">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-xl font-semibold">Geschäft & Betreiber</h2>
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
                <div className="sm:col-span-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/80">
                  Rechtliche App-Daten (Impressum, Datenschutz, AGB, Support und Kontolöschung)
                  werden zentral im Superadminbereich von Klarando verwaltet.
                </div>
              </div>
            </article>

            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-xl font-semibold">Steuer, IDs & Abrechnung</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Diese Daten sind sichtbar, aber nur durch Superadmin bearbeitbar.
              </p>
              <div className="mt-4 grid gap-3 sm:grid-cols-2">
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">USt-ID</span>
                  <input
                    value={settings.vatId || ''}
                    disabled
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Steuernummer</span>
                  <input
                    value={settings.taxNumber || ''}
                    disabled
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Umsatz-ID / GLN</span>
                  <input
                    value={settings.revenueId || ''}
                    disabled
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Finanzamt</span>
                  <input
                    value={settings.taxOffice || ''}
                    disabled
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none"
                  />
                </label>
                <label className="block sm:col-span-2">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Kontoinhaber</span>
                  <input
                    value={settings.payoutAccountHolder || ''}
                    disabled
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">IBAN</span>
                  <input
                    value={settings.payoutIban || ''}
                    disabled
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">BIC</span>
                  <input
                    value={settings.payoutBic || ''}
                    disabled
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Bank</span>
                  <input
                    value={settings.payoutBankName || ''}
                    disabled
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Abrechnungs E-Mail</span>
                  <input
                    value={settings.payoutEmail || ''}
                    disabled
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none"
                  />
                </label>
                <label className="block sm:col-span-2">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Zahlungsreferenz</span>
                  <input
                    value={settings.payoutReference || ''}
                    disabled
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-slate-100 px-3 py-2 text-sm text-slate-700 outline-none"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Liefergebühr</span>
                  <input
                    value={settings.deliveryFeeNote || ''}
                    onChange={(event) => updateField('deliveryFeeNote', event.target.value || null)}
                    placeholder="z. B. Liefergebühr ab 2,50 EUR"
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Mindestbestellwert</span>
                  <input
                    value={settings.minOrderValue || ''}
                    onChange={(event) => updateField('minOrderValue', event.target.value || null)}
                    placeholder="z. B. 15,00 EUR"
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
              </div>

              <div className="mt-5 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
                <h3 className="text-sm font-semibold text-slate-800">Betreiber-Medien für die App</h3>
                <p className="mt-1 text-xs text-rose-900/70">
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
              </div>
            </article>
          </section>

          <section id="delivery-area" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">App, Öffnungszeiten & Lieferzeiten</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Diese Bereiche lesen und schreiben ausschließlich die zentrale Quelle <span className="font-mono">businessSettings</span>.
            </p>
            <div className="mt-4 rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
              Die frühere Route <span className="font-mono">/admin/app-settings</span> ist jetzt Legacy.
              Öffnungszeiten, Lieferzeiten, Feiertage, App-Konfiguration, Mindestbestellwert und Lieferhinweise werden nur noch hier verwaltet.
            </div>
            <div className="mt-4">
              <AppSettingsFields
                settings={settings}
                onChange={setSettings}
                showAppReleaseControls={false}
                showComplianceControls={false}
                showServiceAreaEditor
                showDeliveryScheduling
              />
            </div>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Datenschutz & Compliance</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Diese Einstellungen werden zentral im Superadminbereich von Klarando verwaltet.
            </p>
            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4 text-sm text-rose-900/80">
              Für diese Filiale ist der Bereich hier nur als Hinweis sichtbar.
            </div>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Zahlungen · PayPal</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Hinterlege hier die Händlerdaten der Filiale für den Plattform-Checkout.
            </p>
            {paypalConfig ? (
              <div className="mt-4 grid gap-3 sm:grid-cols-2">
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">PayPal Merchant-ID</span>
                  <input
                    value={paypalConfig.paypalMerchantId || ''}
                    onChange={(event) =>
                      setPaypalConfig((current) =>
                        current
                          ? {
                              ...current,
                              paypalMerchantId: event.target.value || null,
                            }
                          : current
                      )
                    }
                    placeholder="z. B. ABCDEF123456"
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">PayPal Händler-E-Mail</span>
                  <input
                    value={paypalConfig.paypalEmail || ''}
                    onChange={(event) =>
                      setPaypalConfig((current) =>
                        current
                          ? {
                              ...current,
                              paypalEmail: event.target.value || null,
                            }
                          : current
                      )
                    }
                    placeholder="shop@beispiel.de"
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Onboarding-Status</span>
                  <select
                    value={paypalConfig.paypalOnboardingStatus}
                    onChange={(event) =>
                      setPaypalConfig((current) =>
                        current
                          ? {
                              ...current,
                              paypalOnboardingStatus:
                                event.target.value as TenantPaypalPaymentConfig['paypalOnboardingStatus'],
                            }
                          : current
                      )
                    }
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  >
                    <option value="NOT_STARTED">Nicht gestartet</option>
                    <option value="PENDING">Ausstehend</option>
                    <option value="VERIFIED">Verifiziert</option>
                    <option value="RESTRICTED">Eingeschränkt</option>
                    <option value="DISABLED">Deaktiviert</option>
                  </select>
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">PayPal Umgebung</span>
                  <select
                    value={paypalConfig.paypalEnvironment}
                    onChange={(event) =>
                      setPaypalConfig((current) =>
                        current
                          ? {
                              ...current,
                              paypalEnvironment:
                                event.target.value as TenantPaypalPaymentConfig['paypalEnvironment'],
                            }
                          : current
                      )
                    }
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  >
                    <option value="SANDBOX">Sandbox</option>
                    <option value="LIVE">Live</option>
                  </select>
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Plattformgebühr (%)</span>
                  <input
                    type="number"
                    step="0.01"
                    min="0"
                    value={paypalConfig.klarandoPlatformFeePercent ?? ''}
                    onChange={(event) =>
                      setPaypalConfig((current) =>
                        current
                          ? {
                              ...current,
                              klarandoPlatformFeePercent: event.target.value || null,
                            }
                          : current
                      )
                    }
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Plattformgebühr (fix, Cent)</span>
                  <input
                    type="number"
                    min="0"
                    step="1"
                    value={paypalConfig.klarandoPlatformFeeFixed ?? ''}
                    onChange={(event) =>
                      setPaypalConfig((current) =>
                        current
                          ? {
                              ...current,
                              klarandoPlatformFeeFixed: event.target.value
                                ? Number.parseInt(event.target.value, 10)
                                : null,
                            }
                          : current
                      )
                    }
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
                <label className="inline-flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm text-rose-900/85 sm:col-span-2">
                  <input
                    type="checkbox"
                    checked={paypalConfig.paypalPaymentsEnabled}
                    onChange={(event) =>
                      setPaypalConfig((current) =>
                        current
                          ? {
                              ...current,
                              paypalPaymentsEnabled: event.target.checked,
                            }
                          : current
                      )
                    }
                  />
                  PayPal-Zahlungen für diese Filiale aktivieren
                </label>
              </div>
            ) : (
              <p className="mt-3 text-sm text-rose-900/70">
                Keine Zahlungsdaten geladen. Bitte Seite neu laden.
              </p>
            )}
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Notizen</h2>
            <textarea
              value={settings.notes || ''}
              onChange={(event) => updateField('notes', event.target.value || null)}
              rows={4}
              placeholder="Weitere wichtige Betriebsinformationen..."
              className="mt-3 w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            />
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

