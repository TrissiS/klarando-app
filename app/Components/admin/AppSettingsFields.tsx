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
}

type ServiceMode = 'DELIVERY' | 'PICKUP' | 'BOTH'

export default function AppSettingsFields({
  settings,
  onChange,
  disableDelivery = false,
  disablePickup = false,
  disableCustomerApp = false,
  showAppReleaseControls = true,
  showComplianceControls = false,
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
