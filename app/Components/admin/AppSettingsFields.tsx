'use client'

import ServiceAreaEditor from '@/app/Components/admin/ServiceAreaEditor'
import type { BusinessSettings } from '@/lib/api'

type Props = {
  settings: BusinessSettings
  onChange: (next: BusinessSettings) => void
  disableDelivery?: boolean
  disablePickup?: boolean
  disableCustomerApp?: boolean
  showAppReleaseControls?: boolean
  showComplianceControls?: boolean
  showServiceAreaEditor?: boolean
}

type ServiceMode = 'DELIVERY' | 'PICKUP' | 'BOTH'
const WEEK_DAYS: Array<{
  key: BusinessSettings['deliveryScheduling']['allowedDeliveryDays'][number]
  label: string
}> = [
  { key: 'MONDAY', label: 'Mo' },
  { key: 'TUESDAY', label: 'Di' },
  { key: 'WEDNESDAY', label: 'Mi' },
  { key: 'THURSDAY', label: 'Do' },
  { key: 'FRIDAY', label: 'Fr' },
  { key: 'SATURDAY', label: 'Sa' },
  { key: 'SUNDAY', label: 'So' },
]

export default function AppSettingsFields({
  settings,
  onChange,
  disableDelivery = false,
  disablePickup = false,
  disableCustomerApp = false,
  showAppReleaseControls = true,
  showComplianceControls = false,
  showServiceAreaEditor = true,
}: Props) {
  function patchCustomerApp(next: Partial<BusinessSettings['customerApp']>) {
    onChange({
      ...settings,
      customerApp: {
        ...settings.customerApp,
        ...next,
      },
    })
  }

  function deriveServiceMode(): ServiceMode {
    const deliveryEnabled = settings.deliveryArea.enabled
    const pickupEnabled = settings.pickupArea.enabled

    if (deliveryEnabled && pickupEnabled) {
      return 'BOTH'
    }
    if (deliveryEnabled) {
      return 'DELIVERY'
    }
    if (pickupEnabled) {
      return 'PICKUP'
    }
    return 'BOTH'
  }

  function applyServiceMode(mode: ServiceMode) {
    const wantsDelivery = mode === 'DELIVERY' || mode === 'BOTH'
    const wantsPickup = mode === 'PICKUP' || mode === 'BOTH'

    onChange({
      ...settings,
      deliveryArea: {
        ...settings.deliveryArea,
        enabled: disableDelivery ? settings.deliveryArea.enabled : wantsDelivery,
      },
      pickupArea: {
        ...settings.pickupArea,
        enabled: disablePickup ? settings.pickupArea.enabled : wantsPickup,
      },
    })
  }

  const serviceMode = deriveServiceMode()

  function patchListingDisplay(
    next: Partial<BusinessSettings['customerApp']['listingDisplay']>
  ) {
    patchCustomerApp({
      listingDisplay: {
        ...settings.customerApp.listingDisplay,
        ...next,
      },
    })
  }

  function patchDeliveryScheduling(
    next: Partial<BusinessSettings['deliveryScheduling']>
  ) {
    onChange({
      ...settings,
      deliveryScheduling: {
        ...settings.deliveryScheduling,
        ...next,
      },
    })
  }

  function updateTimeSlot(
    index: number,
    next: Partial<BusinessSettings['deliveryScheduling']['timeSlots'][number]>
  ) {
    const current = settings.deliveryScheduling.timeSlots[index]
    if (!current) {
      return
    }
    const updated = settings.deliveryScheduling.timeSlots.map((slot, slotIndex) =>
      slotIndex === index ? { ...slot, ...next } : slot
    )
    patchDeliveryScheduling({ timeSlots: updated })
  }

  function addTimeSlot() {
    const next = [
      ...settings.deliveryScheduling.timeSlots,
      {
        day: 'MONDAY' as const,
        start: '11:00',
        end: '14:00',
        maxOrders: null,
      },
    ]
    patchDeliveryScheduling({ timeSlots: next })
  }

  function removeTimeSlot(index: number) {
    const next = settings.deliveryScheduling.timeSlots.filter((_, slotIndex) => slotIndex !== index)
    patchDeliveryScheduling({ timeSlots: next })
  }

  return (
    <>
      <div className="grid gap-3 sm:grid-cols-2">
        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Liefergebühr</span>
          <input
            value={settings.deliveryFeeNote || ''}
            disabled={disableDelivery}
            onChange={(event) =>
              onChange({
                ...settings,
                deliveryFeeNote: event.target.value || null,
              })
            }
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>
        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Mindestbestellwert</span>
          <input
            value={settings.minOrderValue || ''}
            disabled={disableDelivery}
            onChange={(event) =>
              onChange({
                ...settings,
                minOrderValue: event.target.value || null,
              })
            }
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>
      </div>

      <section className="mt-4 rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
        <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
          Bestellmodus
        </h3>
        <p className="mt-2 text-xs text-rose-900/70">
          Abholgebiet entspricht immer dem Liefergebiet. Hier steuerst du nur, welche Option aktiv ist.
        </p>
        <div className="mt-3 max-w-sm">
          <select
            value={serviceMode}
            disabled={disableDelivery && disablePickup}
            onChange={(event) => applyServiceMode(event.target.value as ServiceMode)}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          >
            <option value="DELIVERY">Nur Lieferung</option>
            <option value="PICKUP">Nur Abholung</option>
            <option value="BOTH">Lieferung und Abholung</option>
          </select>
        </div>
      </section>

      {showAppReleaseControls ? (
        <section className="mt-4 rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
          <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
            App-Freigaben
          </h3>
          <div className="mt-3 grid gap-2 sm:grid-cols-2">
            <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
              <input
                type="checkbox"
                checked={settings.customerApp.listingEnabled}
                disabled={disableCustomerApp}
                onChange={(event) => patchCustomerApp({ listingEnabled: event.target.checked })}
              />
              Filiale in App anzeigen
            </label>
            <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
              <input
                type="checkbox"
                checked={settings.customerApp.orderingEnabled}
                disabled={disableCustomerApp}
                onChange={(event) => patchCustomerApp({ orderingEnabled: event.target.checked })}
              />
              App-Bestellungen erlauben
            </label>
            <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
              <input
                type="checkbox"
                checked={settings.customerApp.guestRegistrationEnabled}
                disabled={disableCustomerApp}
                onChange={(event) =>
                  patchCustomerApp({ guestRegistrationEnabled: event.target.checked })
                }
              />
              Gastkonto-Registrierung erlauben
            </label>
            <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
              <input
                type="checkbox"
                checked={settings.customerApp.guestCheckoutEnabled}
                disabled={disableCustomerApp}
                onChange={(event) => patchCustomerApp({ guestCheckoutEnabled: event.target.checked })}
              />
              Gast-Checkout ohne Konto erlauben
            </label>
          </div>
        </section>
      ) : null}

      <section className="mt-4 rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
        <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
          Suchübersicht in App
        </h3>
        <p className="mt-2 text-xs text-rose-900/70">
          Diese Optionen steuern, welche Infos in der Filialsuche der Mobile-App sichtbar sind.
        </p>
        <div className="mt-3 grid gap-2 sm:grid-cols-2">
          <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
            <input
              type="checkbox"
              checked={settings.customerApp.listingDisplay.showLogo}
              disabled={disableCustomerApp}
              onChange={(event) => patchListingDisplay({ showLogo: event.target.checked })}
            />
            Filial-Logo anzeigen
          </label>
          <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
            <input
              type="checkbox"
              checked={settings.customerApp.listingDisplay.showChainName}
              disabled={disableCustomerApp}
              onChange={(event) => patchListingDisplay({ showChainName: event.target.checked })}
            />
            Kettenname anzeigen
          </label>
          <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
            <input
              type="checkbox"
              checked={settings.customerApp.listingDisplay.showAddress}
              disabled={disableCustomerApp}
              onChange={(event) => patchListingDisplay({ showAddress: event.target.checked })}
            />
            Adresse anzeigen
          </label>
          <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
            <input
              type="checkbox"
              checked={settings.customerApp.listingDisplay.showAvailabilityBadges}
              disabled={disableCustomerApp}
              onChange={(event) =>
                patchListingDisplay({ showAvailabilityBadges: event.target.checked })
              }
            />
            Liefer-/Abholstatus anzeigen
          </label>
          <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
            <input
              type="checkbox"
              checked={settings.customerApp.listingDisplay.showMinOrderValue}
              disabled={disableCustomerApp}
              onChange={(event) =>
                patchListingDisplay({ showMinOrderValue: event.target.checked })
              }
            />
            Mindestbestellwert anzeigen
          </label>
          <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
            <input
              type="checkbox"
              checked={settings.customerApp.listingDisplay.showDeliveryFeeNote}
              disabled={disableCustomerApp}
              onChange={(event) =>
                patchListingDisplay({ showDeliveryFeeNote: event.target.checked })
              }
            />
            Liefergebühr anzeigen
          </label>
          <label className="inline-flex items-center gap-2 text-sm text-rose-900/85 sm:col-span-2">
            <input
              type="checkbox"
              checked={settings.customerApp.listingDisplay.showDistance}
              disabled={disableCustomerApp}
              onChange={(event) => patchListingDisplay({ showDistance: event.target.checked })}
            />
            Distanzanzeige aktivieren
          </label>
        </div>
      </section>

      {showServiceAreaEditor ? (
        <div className="mt-4 grid gap-4">
          <ServiceAreaEditor
            title="Liefer- und Abholgebiet"
            subtitle="PLZ, Radius und Straßen-Ausschlüsse (gilt für beide Modi)"
            value={settings.deliveryArea}
            disabled={disableDelivery}
            onChange={(next) =>
              onChange({
                ...settings,
                deliveryArea: next,
              })
            }
          />
        </div>
      ) : null}

      <section className="mt-4 rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
        <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
          Lieferzeiten je Tag
        </h3>
        <p className="mt-2 text-xs text-rose-900/70">
          Steuere Lieferfenster, erlaubte Tage und Vorbestellungen pro Wochentag.
        </p>

        <div className="mt-3 grid gap-3 sm:grid-cols-2">
          <label className="block">
            <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
              Liefermodus
            </span>
            <select
              value={settings.deliveryScheduling.deliveryMode}
              onChange={(event) =>
                patchDeliveryScheduling({
                  deliveryMode: event.target.value as BusinessSettings['deliveryScheduling']['deliveryMode'],
                })
              }
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
            >
              <option value="IMMEDIATE">Sofort</option>
              <option value="NEXT_DAY">Ab morgen</option>
              <option value="AFTER_DAYS">Nach Mindestvorlauf</option>
              <option value="SLOT_ONLY">Nur Zeitfenster</option>
            </select>
          </label>
          <label className="block">
            <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
              Bestellannahmeschluss
            </span>
            <input
              type="time"
              value={settings.deliveryScheduling.orderCutoffTime || ''}
              onChange={(event) =>
                patchDeliveryScheduling({
                  orderCutoffTime: event.target.value || null,
                })
              }
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
            />
          </label>
          <label className="block">
            <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
              Mindestvorlauf (Tage)
            </span>
            <input
              type="number"
              min={0}
              max={30}
              value={settings.deliveryScheduling.minDaysAhead}
              onChange={(event) =>
                patchDeliveryScheduling({
                  minDaysAhead: Number(event.target.value || 0),
                })
              }
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
            />
          </label>
          <label className="block">
            <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
              Max. Vorbestelltage
            </span>
            <input
              type="number"
              min={1}
              max={90}
              value={settings.deliveryScheduling.maxPreorderDays}
              onChange={(event) =>
                patchDeliveryScheduling({
                  maxPreorderDays: Number(event.target.value || 1),
                })
              }
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
            />
          </label>
        </div>

        <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-white/70 p-3">
          <h4 className="text-xs font-semibold uppercase tracking-wide text-rose-900/75">
            Aktive Liefertage
          </h4>
          <div className="mt-2 flex flex-wrap gap-3">
            {WEEK_DAYS.map((entry) => {
              const checked = settings.deliveryScheduling.allowedDeliveryDays.includes(entry.key)
              return (
                <label key={entry.key} className="inline-flex items-center gap-2 text-sm text-rose-900/85">
                  <input
                    type="checkbox"
                    checked={checked}
                    onChange={(event) => {
                      const nextDays = event.target.checked
                        ? Array.from(
                            new Set([...settings.deliveryScheduling.allowedDeliveryDays, entry.key])
                          )
                        : settings.deliveryScheduling.allowedDeliveryDays.filter((day) => day !== entry.key)
                      patchDeliveryScheduling({ allowedDeliveryDays: nextDays })
                    }}
                  />
                  {entry.label}
                </label>
              )
            })}
          </div>
        </div>

        <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-white/70 p-3">
          <div className="flex items-center justify-between gap-2">
            <h4 className="text-xs font-semibold uppercase tracking-wide text-rose-900/75">
              Zeitfenster
            </h4>
            <button
              type="button"
              onClick={addTimeSlot}
              className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-semibold text-white"
            >
              Zeitfenster hinzufügen
            </button>
          </div>
          <div className="mt-3 space-y-2">
            {settings.deliveryScheduling.timeSlots.map((slot, index) => (
              <div
                key={`${slot.day}-${slot.start}-${slot.end}-${index}`}
                className="grid gap-2 rounded-xl border border-[var(--brand-border)] bg-white p-2 sm:grid-cols-[1fr,1fr,1fr,1fr,auto]"
              >
                <select
                  value={slot.day}
                  onChange={(event) =>
                    updateTimeSlot(index, { day: event.target.value as typeof slot.day })
                  }
                  className="rounded-lg border border-[var(--brand-border)] px-2 py-1.5 text-xs outline-none"
                >
                  {WEEK_DAYS.map((entry) => (
                    <option key={entry.key} value={entry.key}>
                      {entry.label}
                    </option>
                  ))}
                </select>
                <input
                  type="time"
                  value={slot.start}
                  onChange={(event) => updateTimeSlot(index, { start: event.target.value })}
                  className="rounded-lg border border-[var(--brand-border)] px-2 py-1.5 text-xs outline-none"
                />
                <input
                  type="time"
                  value={slot.end}
                  onChange={(event) => updateTimeSlot(index, { end: event.target.value })}
                  className="rounded-lg border border-[var(--brand-border)] px-2 py-1.5 text-xs outline-none"
                />
                <input
                  type="number"
                  min={0}
                  value={slot.maxOrders ?? ''}
                  placeholder="max. Aufträge"
                  onChange={(event) =>
                    updateTimeSlot(index, {
                      maxOrders: event.target.value === '' ? null : Number(event.target.value),
                    })
                  }
                  className="rounded-lg border border-[var(--brand-border)] px-2 py-1.5 text-xs outline-none"
                />
                <button
                  type="button"
                  onClick={() => removeTimeSlot(index)}
                  className="rounded-lg bg-rose-600 px-2 py-1.5 text-xs font-semibold text-white"
                >
                  Entfernen
                </button>
              </div>
            ))}
            {settings.deliveryScheduling.timeSlots.length === 0 ? (
              <p className="text-xs text-rose-900/70">
                Noch keine Zeitfenster gepflegt. Ohne Zeitfenster gelten die erlaubten Liefertage
                ganztägig.
              </p>
            ) : null}
          </div>
        </div>
      </section>

      {showComplianceControls ? (
        <section className="mt-4 rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
          <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
            Datenschutz & Compliance (Deutschland)
          </h3>
          <p className="mt-2 text-xs text-rose-900/70">
            Gemäß DSGVO, TDDDG und DDG: rechtliche Links, Kontaktdaten, Einwilligungen und
            Aufbewahrungsfristen zentral pflegen.
          </p>

          <div className="mt-3 grid gap-3 sm:grid-cols-2">
            <label className="block sm:col-span-2">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Impressum URL
              </span>
              <input
                value={settings.imprintUrl || ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    imprintUrl: event.target.value || null,
                  })
                }
                placeholder="https://www.klarando.com/impressum"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>

            <label className="block sm:col-span-2">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Datenschutz URL
              </span>
              <input
                value={settings.privacyPolicyUrl || ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    privacyPolicyUrl: event.target.value || null,
                  })
                }
                placeholder="https://www.klarando.com/datenschutz"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>

            <label className="block sm:col-span-2">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                AGB URL
              </span>
              <input
                value={settings.termsUrl || ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    termsUrl: event.target.value || null,
                  })
                }
                placeholder="https://www.klarando.com/agb"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Support E-Mail
              </span>
              <input
                value={settings.supportEmail || ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    supportEmail: event.target.value || null,
                  })
                }
                placeholder="support@klarando.com"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Kontolöschung E-Mail
              </span>
              <input
                value={settings.accountDeletionEmail || ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    accountDeletionEmail: event.target.value || null,
                  })
                }
                placeholder="konto-loeschen@klarando.com"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>

            <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
              <input
                type="checkbox"
                checked={settings.compliance.cookieConsentRequired}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    compliance: {
                      ...settings.compliance,
                      cookieConsentRequired: event.target.checked,
                    },
                  })
                }
              />
              Cookie-Einwilligung erforderlich
            </label>

            <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
              <input
                type="checkbox"
                checked={settings.compliance.requirePrivacyConsentAtSignup}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    compliance: {
                      ...settings.compliance,
                      requirePrivacyConsentAtSignup: event.target.checked,
                    },
                  })
                }
              />
              Datenschutzzustimmung bei Kontoerstellung
            </label>

            <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
              <input
                type="checkbox"
                checked={settings.compliance.requireTermsConsentAtCheckout}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    compliance: {
                      ...settings.compliance,
                      requireTermsConsentAtCheckout: event.target.checked,
                    },
                  })
                }
              />
              AGB-Zustimmung vor Checkout
            </label>

            <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
              <input
                type="checkbox"
                checked={settings.compliance.enablePseudonymizedAnalytics}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    compliance: {
                      ...settings.compliance,
                      enablePseudonymizedAnalytics: event.target.checked,
                    },
                  })
                }
              />
              Pseudonymisierte Analytics erlauben
            </label>

            <label className="block sm:col-span-2">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Checkout-Button Text (BGB §312j)
              </span>
              <input
                value={settings.compliance.orderButtonLabel || ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    compliance: {
                      ...settings.compliance,
                      orderButtonLabel: event.target.value || 'zahlungspflichtig bestellen',
                    },
                  })
                }
                placeholder="zahlungspflichtig bestellen"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                DSB E-Mail
              </span>
              <input
                value={settings.compliance.dpoEmail || ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    compliance: {
                      ...settings.compliance,
                      dpoEmail: event.target.value || null,
                    },
                  })
                }
                placeholder="datenschutz@klarando.com"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Security-Kontakt
              </span>
              <input
                value={settings.compliance.securityContactEmail || ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    compliance: {
                      ...settings.compliance,
                      securityContactEmail: event.target.value || null,
                    },
                  })
                }
                placeholder="security@klarando.com"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Aufbewahrung Bestellungen (Tage)
              </span>
              <input
                type="number"
                min={1}
                max={3650}
                value={settings.compliance.retentionDaysOrders ?? ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    compliance: {
                      ...settings.compliance,
                      retentionDaysOrders:
                        event.target.value === '' ? null : Number(event.target.value),
                    },
                  })
                }
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Aufbewahrung Kundendaten (Tage)
              </span>
              <input
                type="number"
                min={1}
                max={3650}
                value={settings.compliance.retentionDaysCustomerData ?? ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    compliance: {
                      ...settings.compliance,
                      retentionDaysCustomerData:
                        event.target.value === '' ? null : Number(event.target.value),
                    },
                  })
                }
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Aufbewahrung Logs (Tage)
              </span>
              <input
                type="number"
                min={1}
                max={3650}
                value={settings.compliance.retentionDaysLogs ?? ''}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    compliance: {
                      ...settings.compliance,
                      retentionDaysLogs:
                        event.target.value === '' ? null : Number(event.target.value),
                    },
                  })
                }
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
              />
            </label>
          </div>
        </section>
      ) : null}
    </>
  )
}
