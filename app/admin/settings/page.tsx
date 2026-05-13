'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  getTenantPaypalPaymentConfig,
  getBusinessSettings,
  updateTenantPaypalPaymentConfig,
  updateBusinessSettings,
  type BusinessDailyWindow,
  type BusinessHolidayWindow,
  type BusinessSettings,
  type TenantPaypalPaymentConfig,
} from '@/lib/api'
import { resolveTenantId } from '@/lib/config'

const DAY_LABELS: Record<BusinessDailyWindow['day'], string> = {
  MONDAY: 'Montag',
  TUESDAY: 'Dienstag',
  WEDNESDAY: 'Mittwoch',
  THURSDAY: 'Donnerstag',
  FRIDAY: 'Freitag',
  SATURDAY: 'Samstag',
  SUNDAY: 'Sonntag',
}

function emptyHoliday(): BusinessHolidayWindow {
  return {
    date: '',
    label: '',
    isClosed: true,
    open: null,
    close: null,
  }
}

function confirmDoubleSave() {
  const firstCheck = window.confirm('Einstellungen wirklich ändern?')
  if (!firstCheck) {
    return false
  }
  return window.confirm('Zweite Bestätigung: Änderungen jetzt speichern?')
}

export default function AdminSettingsPage() {
  const [settings, setSettings] = useState<BusinessSettings | null>(null)
  const [paypalConfig, setPaypalConfig] = useState<TenantPaypalPaymentConfig | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
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

  function updateDailyWindow(
    listKey: 'openingHours' | 'deliveryHours',
    day: BusinessDailyWindow['day'],
    patch: Partial<BusinessDailyWindow>
  ) {
    setSettings((current) => {
      if (!current) return current
      return {
        ...current,
        [listKey]: current[listKey].map((entry) =>
          entry.day === day ? { ...entry, ...patch } : entry
        ),
      }
    })
  }

  function updateHoliday(index: number, patch: Partial<BusinessHolidayWindow>) {
    setSettings((current) => {
      if (!current) return current
      const next = [...current.holidayHours]
      const existing = next[index]
      if (!existing) {
        return current
      }
      next[index] = { ...existing, ...patch }
      return {
        ...current,
        holidayHours: next,
      }
    })
  }

  function addHoliday() {
    setSettings((current) => {
      if (!current) return current
      return {
        ...current,
        holidayHours: [...current.holidayHours, emptyHoliday()],
      }
    })
  }

  function removeHoliday(index: number) {
    setSettings((current) => {
      if (!current) return current
      return {
        ...current,
        holidayHours: current.holidayHours.filter((_, itemIndex) => itemIndex !== index),
      }
    })
  }

  async function handleLogoFile(file: File | null) {
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

  async function handleTitleImageFile(file: File | null) {
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
      title="Einstellungen"
      subtitle="Geschäftsdaten, Steuer-IDs, Öffnungszeiten und Lieferdienst zentral verwalten"
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
          <section className="grid gap-6 xl:grid-cols-2">
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
                      accept="image/*"
                      onChange={(event) => void handleLogoFile(event.target.files?.[0] || null)}
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
                      <p className="mt-2 text-xs text-rose-900/70">Wird in App und Suche angezeigt.</p>
                    )}
                  </div>

                  <div className="rounded-xl border border-[var(--brand-border)] bg-white p-3">
                    <p className="text-xs font-semibold uppercase tracking-wide text-slate-700">
                      Titelbild (Bestellmodus)
                    </p>
                    <input
                      type="file"
                      accept="image/*"
                      onChange={(event) => void handleTitleImageFile(event.target.files?.[0] || null)}
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

          <section className="grid gap-6 xl:grid-cols-2">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-xl font-semibold">Öffnungszeiten</h2>
              <div className="mt-4 space-y-2">
                {settings.openingHours.map((entry) => (
                  <div key={`opening-${entry.day}`} className="grid grid-cols-[140px_120px_1fr_1fr] items-center gap-2">
                    <span className="text-sm text-rose-900/85">{DAY_LABELS[entry.day]}</span>
                    <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
                      <input
                        type="checkbox"
                        checked={entry.isClosed}
                        onChange={(event) =>
                          updateDailyWindow('openingHours', entry.day, {
                            isClosed: event.target.checked,
                            open: event.target.checked ? null : entry.open || '10:00',
                            close: event.target.checked ? null : entry.close || '22:00',
                          })
                        }
                      />
                      Geschlossen
                    </label>
                    <input
                      type="time"
                      disabled={entry.isClosed}
                      value={entry.open || ''}
                      onChange={(event) => updateDailyWindow('openingHours', entry.day, { open: event.target.value || null })}
                      className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
                    />
                    <input
                      type="time"
                      disabled={entry.isClosed}
                      value={entry.close || ''}
                      onChange={(event) => updateDailyWindow('openingHours', entry.day, { close: event.target.value || null })}
                      className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
                    />
                  </div>
                ))}
              </div>
            </article>

            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-xl font-semibold">Lieferdienstzeiten</h2>
              <div className="mt-4 space-y-2">
                {settings.deliveryHours.map((entry) => (
                  <div key={`delivery-${entry.day}`} className="grid grid-cols-[140px_120px_1fr_1fr] items-center gap-2">
                    <span className="text-sm text-rose-900/85">{DAY_LABELS[entry.day]}</span>
                    <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
                      <input
                        type="checkbox"
                        checked={entry.isClosed}
                        onChange={(event) =>
                          updateDailyWindow('deliveryHours', entry.day, {
                            isClosed: event.target.checked,
                            open: event.target.checked ? null : entry.open || '10:00',
                            close: event.target.checked ? null : entry.close || '22:00',
                          })
                        }
                      />
                      Geschlossen
                    </label>
                    <input
                      type="time"
                      disabled={entry.isClosed}
                      value={entry.open || ''}
                      onChange={(event) => updateDailyWindow('deliveryHours', entry.day, { open: event.target.value || null })}
                      className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
                    />
                    <input
                      type="time"
                      disabled={entry.isClosed}
                      value={entry.close || ''}
                      onChange={(event) => updateDailyWindow('deliveryHours', entry.day, { close: event.target.value || null })}
                      className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
                    />
                  </div>
                ))}
              </div>
            </article>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <div className="flex items-center justify-between gap-2">
              <h2 className="text-xl font-semibold">Feiertage / Sonderöffnungen</h2>
              <button
                type="button"
                onClick={addHoliday}
                className="rounded-xl bg-slate-900 px-3 py-2 text-sm font-medium text-white hover:bg-slate-800"
              >
                Feiertag hinzufügen
              </button>
            </div>
            <div className="mt-4 space-y-2">
              {settings.holidayHours.length === 0 ? (
                <p className="rounded-xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/75">
                  Noch keine Feiertagseinträge vorhanden.
                </p>
              ) : (
                settings.holidayHours.map((entry, index) => (
                  <div
                    key={`holiday-${index}`}
                    className="grid grid-cols-[160px_1fr_120px_1fr_1fr_120px] items-center gap-2"
                  >
                    <input
                      type="date"
                      value={entry.date}
                      onChange={(event) => updateHoliday(index, { date: event.target.value })}
                      className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                    />
                    <input
                      value={entry.label || ''}
                      onChange={(event) => updateHoliday(index, { label: event.target.value || null })}
                      placeholder="z. B. Weihnachten"
                      className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                    />
                    <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
                      <input
                        type="checkbox"
                        checked={entry.isClosed}
                        onChange={(event) =>
                          updateHoliday(index, {
                            isClosed: event.target.checked,
                            open: event.target.checked ? null : entry.open || '10:00',
                            close: event.target.checked ? null : entry.close || '22:00',
                          })
                        }
                      />
                      Zu
                    </label>
                    <input
                      type="time"
                      disabled={entry.isClosed}
                      value={entry.open || ''}
                      onChange={(event) => updateHoliday(index, { open: event.target.value || null })}
                      className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
                    />
                    <input
                      type="time"
                      disabled={entry.isClosed}
                      value={entry.close || ''}
                      onChange={(event) => updateHoliday(index, { close: event.target.value || null })}
                      className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
                    />
                    <button
                      type="button"
                      onClick={() => removeHoliday(index)}
                      className="rounded-xl border border-red-300 bg-white px-3 py-2 text-xs font-medium text-red-700 hover:bg-red-50"
                    >
                      Entfernen
                    </button>
                  </div>
                ))
              )}
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

