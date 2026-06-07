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
  showDeliveryCostControls?: boolean
  showServiceFeeControls?: boolean
  showServiceModeControls?: boolean
  showOrderingControls?: boolean
  showListingDisplayControls?: boolean
  showServiceAreaEditor?: boolean
  serviceAreaTitle?: string
  serviceAreaSubtitle?: string
  showOpeningHours?: boolean
  showDeliveryHours?: boolean
  showHolidayHours?: boolean
  showDeliveryScheduling?: boolean
}

type ServiceMode = 'DELIVERY' | 'PICKUP' | 'BOTH'
type DeliveryDay = BusinessSettings['timeManagement']['deliveryScheduling']['allowedDeliveryDays'][number]
type DeliverySlot = BusinessSettings['timeManagement']['deliveryScheduling']['timeSlots'][number]
type BusinessDayWindow = BusinessSettings['timeManagement']['openingHours'][number]
type BusinessHolidayWindow = BusinessSettings['timeManagement']['holidayHours'][number]
const WEEK_DAYS: Array<{
  key: DeliveryDay
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

const DAY_LABELS: Record<DeliveryDay, string> = {
  MONDAY: 'Montag',
  TUESDAY: 'Dienstag',
  WEDNESDAY: 'Mittwoch',
  THURSDAY: 'Donnerstag',
  FRIDAY: 'Freitag',
  SATURDAY: 'Samstag',
  SUNDAY: 'Sonntag',
}

const DEFAULT_SLOT_TEMPLATES: Array<{
  id: string
  label: string
  slot: Pick<DeliverySlot, 'start' | 'end'>
}> = [
  { id: 'morning', label: 'Vormittag 09:00-12:00', slot: { start: '09:00', end: '12:00' } },
  { id: 'midday', label: 'Mittag 12:00-15:00', slot: { start: '12:00', end: '15:00' } },
  { id: 'afternoon', label: 'Nachmittag 15:00-18:00', slot: { start: '15:00', end: '18:00' } },
  { id: 'full', label: 'Ganztägig 09:00-18:00', slot: { start: '09:00', end: '18:00' } },
]

export default function AppSettingsFields({
  settings,
  onChange,
  disableDelivery = false,
  disablePickup = false,
  disableCustomerApp = false,
  showAppReleaseControls = true,
  showComplianceControls = false,
  showDeliveryCostControls = true,
  showServiceFeeControls = true,
  showServiceModeControls = true,
  showOrderingControls = true,
  showListingDisplayControls = true,
  showServiceAreaEditor = true,
  serviceAreaTitle = 'Öffnungszeiten & Lieferzeiten',
  serviceAreaSubtitle = 'Zentrale Master-Verwaltung für Liefergebiet, Zeiten und Ausnahmen.',
  showOpeningHours = true,
  showDeliveryHours = true,
  showHolidayHours = true,
  showDeliveryScheduling = true,
}: Props) {
  function patchTimeManagement(next: Partial<BusinessSettings['timeManagement']>) {
    onChange({
      ...settings,
      timeManagement: {
        ...settings.timeManagement,
        ...next,
      },
    })
  }

  function patchTimeManagementOrdering(
    next: Partial<BusinessSettings['timeManagement']['ordering']>
  ) {
    patchTimeManagement({
      ordering: {
        ...settings.timeManagement.ordering,
        ...next,
      },
    })
  }

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
    next: Partial<BusinessSettings['timeManagement']['deliveryScheduling']>
  ) {
    patchTimeManagement({
      deliveryScheduling: {
        ...settings.timeManagement.deliveryScheduling,
        ...next,
      },
    })
  }

  function updateDailyWindow(
    listKey: 'openingHours' | 'deliveryHours',
    day: BusinessDayWindow['day'],
    patch: Partial<BusinessDayWindow>
  ) {
    patchTimeManagement({
      [listKey]: settings.timeManagement[listKey].map((entry) =>
        entry.day === day ? { ...entry, ...patch } : entry
      ),
    } as Pick<BusinessSettings['timeManagement'], typeof listKey>)
  }

  function updateHoliday(index: number, patch: Partial<BusinessHolidayWindow>) {
    const next = [...settings.timeManagement.holidayHours]
    const existing = next[index]
    if (!existing) {
      return
    }
    next[index] = { ...existing, ...patch }
    patchTimeManagement({ holidayHours: next })
  }

  function addHoliday() {
    patchTimeManagement({
      holidayHours: [
        ...settings.timeManagement.holidayHours,
        {
          date: '',
          label: '',
          isClosed: true,
          open: null,
          close: null,
        },
      ],
    })
  }

  function removeHoliday(index: number) {
    patchTimeManagement({
      holidayHours: settings.timeManagement.holidayHours.filter(
        (_, itemIndex) => itemIndex !== index
      ),
    })
  }

  function updateTimeSlot(
    index: number,
    next: Partial<BusinessSettings['deliveryScheduling']['timeSlots'][number]>
  ) {
    const current = settings.timeManagement.deliveryScheduling.timeSlots[index]
    if (!current) {
      return
    }
    const updated = settings.timeManagement.deliveryScheduling.timeSlots.map((slot, slotIndex) =>
      slotIndex === index ? { ...slot, ...next } : slot
    )
    patchDeliveryScheduling({ timeSlots: updated })
  }

  function addTimeSlot() {
    const next = [
      ...settings.timeManagement.deliveryScheduling.timeSlots,
      {
        day: 'MONDAY' as const,
        start: '11:00',
        end: '14:00',
        maxOrders: null,
      },
    ]
    patchDeliveryScheduling({ timeSlots: next })
  }

  function addTimeSlotForDay(day: DeliveryDay) {
    patchDeliveryScheduling({
      timeSlots: [
        ...settings.timeManagement.deliveryScheduling.timeSlots,
        {
          day,
          start: '09:00',
          end: '12:00',
          maxOrders: null,
        },
      ],
    })
  }

  function removeTimeSlot(index: number) {
    const next = settings.timeManagement.deliveryScheduling.timeSlots.filter((_, slotIndex) => slotIndex !== index)
    patchDeliveryScheduling({ timeSlots: next })
  }

  function copyDaySlotsToAllDays(sourceDay: DeliveryDay) {
    const source = settings.timeManagement.deliveryScheduling.timeSlots
      .filter((slot) => slot.day === sourceDay)
      .map((slot) => ({
        start: slot.start,
        end: slot.end,
        maxOrders: slot.maxOrders ?? null,
      }))

    if (source.length === 0) {
      return
    }

    patchDeliveryScheduling({
      timeSlots: WEEK_DAYS.flatMap((dayEntry) =>
        source.map((slot) => ({
          day: dayEntry.key,
          ...slot,
        }))
      ),
    })
  }

  function applyTemplateToDay(
    day: DeliveryDay,
    template: Pick<DeliverySlot, 'start' | 'end'> | null
  ) {
    const withoutDay = settings.timeManagement.deliveryScheduling.timeSlots.filter((slot) => slot.day !== day)
    patchDeliveryScheduling({
      timeSlots: template
        ? [...withoutDay, { day, start: template.start, end: template.end, maxOrders: null }]
        : withoutDay,
    })
  }

  const slotsByDay = WEEK_DAYS.map((dayEntry) => ({
    ...dayEntry,
    slots: settings.timeManagement.deliveryScheduling.timeSlots
      .map((slot, index) => ({ slot, index }))
      .filter((entry) => entry.slot.day === dayEntry.key)
      .sort((left, right) => left.slot.start.localeCompare(right.slot.start)),
  }))

  function validateDaySlots(day: DeliveryDay) {
    const daySlots = settings.timeManagement.deliveryScheduling.timeSlots
      .filter((slot) => slot.day === day)
      .map((slot) => ({
        start: slot.start?.trim() || '',
        end: slot.end?.trim() || '',
        maxOrders: slot.maxOrders,
      }))
      .sort((left, right) => left.start.localeCompare(right.start))

    const errors: string[] = []

    if (settings.timeManagement.deliveryScheduling.allowedDeliveryDays.includes(day) && daySlots.length === 0) {
      errors.push('Tag ist aktiv, aber es gibt kein Zeitfenster.')
    }

    for (const slot of daySlots) {
      if (!slot.start || !slot.end) {
        errors.push('Bitte Von- und Bis-Zeit ausfüllen.')
        continue
      }
      if (slot.end <= slot.start) {
        errors.push(`Zeitfenster ${slot.start}-${slot.end}: Bis muss später als Von sein.`)
      }
      if (slot.maxOrders !== null && slot.maxOrders < 0) {
        errors.push(`Zeitfenster ${slot.start}-${slot.end}: Max. Aufträge darf nicht negativ sein.`)
      }
    }

    for (let index = 1; index < daySlots.length; index += 1) {
      const previous = daySlots[index - 1]
      const current = daySlots[index]
      if (previous.end && current.start && previous.end > current.start) {
        errors.push(`Zeitfenster überlappen (${previous.start}-${previous.end} und ${current.start}-${current.end}).`)
      }
    }

    return Array.from(new Set(errors))
  }

  return (
    <>
      {showDeliveryCostControls ? (
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
      ) : null}
      {showServiceFeeControls ? (
      <section className="mt-4 rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
        <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
          Servicegebühr
        </h3>
        <div className="mt-3 grid gap-3 sm:grid-cols-2">
          <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
            <input
              type="checkbox"
              checked={settings.serviceFee.enabled}
              disabled={disableDelivery}
              onChange={(event) =>
                onChange({
                  ...settings,
                  serviceFee: {
                    ...settings.serviceFee,
                    enabled: event.target.checked,
                  },
                })
              }
            />
            Servicegebühr aktiv
          </label>
          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Bezeichnung</span>
            <input
              value={settings.serviceFee.label || 'Servicegebühr'}
              disabled={disableDelivery}
              onChange={(event) =>
                onChange({
                  ...settings,
                  serviceFee: {
                    ...settings.serviceFee,
                    label: event.target.value || null,
                  },
                })
              }
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
            />
          </label>
          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Typ</span>
            <select
              value={settings.serviceFee.mode}
              disabled={disableDelivery}
              onChange={(event) =>
                onChange({
                  ...settings,
                  serviceFee: {
                    ...settings.serviceFee,
                    mode: event.target.value === 'PERCENT' ? 'PERCENT' : 'FIXED',
                  },
                })
              }
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
            >
              <option value="FIXED">Fester Betrag (€)</option>
              <option value="PERCENT">Prozent (%)</option>
            </select>
          </label>
          {settings.serviceFee.mode === 'PERCENT' ? (
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Prozent</span>
              <input
                value={settings.serviceFee.percent ?? ''}
                disabled={disableDelivery}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    serviceFee: {
                      ...settings.serviceFee,
                      percent: event.target.value === '' ? null : Number(event.target.value),
                    },
                  })
                }
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
                type="number"
                min="0"
                step="0.1"
              />
            </label>
          ) : (
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Betrag</span>
              <input
                value={settings.serviceFee.fixedAmount || ''}
                disabled={disableDelivery}
                onChange={(event) =>
                  onChange({
                    ...settings,
                    serviceFee: {
                      ...settings.serviceFee,
                      fixedAmount: event.target.value || null,
                    },
                  })
                }
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
              />
            </label>
          )}
        </div>
      </section>
      ) : null}

      {showServiceModeControls ? (
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
      ) : null}

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

      {showOrderingControls ? (
      <section className="mt-4 rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
        <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
          Bestellfenster & Vorbestellung
        </h3>
        <div className="mt-3 grid gap-3 sm:grid-cols-2">
          <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
            <input
              type="checkbox"
              checked={settings.timeManagement.ordering.preorderEnabled}
              onChange={(event) =>
                patchTimeManagementOrdering({ preorderEnabled: event.target.checked })
              }
            />
            Vorbestellungen erlauben
          </label>
          <label className="inline-flex items-center gap-2 text-sm text-rose-900/85">
            <input
              type="checkbox"
              checked={!settings.timeManagement.ordering.deliveryPauseEnabled}
              onChange={(event) =>
                patchTimeManagementOrdering({ deliveryPauseEnabled: !event.target.checked })
              }
            />
            Sofortbestellungen aktiv
          </label>
          <label className="block">
            <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
              Lieferannahmeschluss vor Feierabend (Minuten)
            </span>
            <input
              type="number"
              min={0}
              max={240}
              value={settings.timeManagement.ordering.deliveryCutoffMinutesBeforeClose}
              onChange={(event) =>
                patchTimeManagementOrdering({
                  deliveryCutoffMinutesBeforeClose: Number(event.target.value || 0),
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
              value={settings.timeManagement.ordering.preorderMaxDays}
              onChange={(event) =>
                patchTimeManagementOrdering({
                  preorderMaxDays: Number(event.target.value || 1),
                })
              }
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
            />
          </label>
          <label className="block sm:col-span-2">
            <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
              Hinweistext für Kunden
            </span>
            <input
              value={settings.timeManagement.ordering.manualNoticeText || ''}
              onChange={(event) =>
                patchTimeManagementOrdering({ manualNoticeText: event.target.value || null })
              }
              placeholder="Optionaler Hinweis bei eingeschränkter Bestellannahme"
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
            />
          </label>
        </div>
      </section>
      ) : null}

      {showListingDisplayControls ? (
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
      ) : null}

      {showServiceAreaEditor ? (
        <div className="mt-4 grid gap-4">
          <ServiceAreaEditor
            title={serviceAreaTitle}
            subtitle={serviceAreaSubtitle}
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

      {showOpeningHours ? (
      <section className="mt-4 rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
        <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
          Öffnungszeiten
        </h3>
        <p className="mt-2 text-xs text-rose-900/70">
          Diese Zeiten sind jetzt die zentrale Quelle für Ladenstatus, Bestellannahme und Kundenanzeige.
        </p>
        <div className="mt-4 space-y-2">
          {settings.timeManagement.openingHours.map((entry) => (
            <div
              key={`opening-${entry.day}`}
              className="grid gap-2 rounded-2xl border border-[var(--brand-border)] bg-white p-3 sm:grid-cols-[140px_120px_1fr_1fr]"
            >
              <span className="text-sm font-medium text-rose-900/85">{DAY_LABELS[entry.day]}</span>
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
                onChange={(event) =>
                  updateDailyWindow('openingHours', entry.day, { open: event.target.value || null })
                }
                className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
              />
              <input
                type="time"
                disabled={entry.isClosed}
                value={entry.close || ''}
                onChange={(event) =>
                  updateDailyWindow('openingHours', entry.day, { close: event.target.value || null })
                }
                className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
              />
            </div>
          ))}
        </div>
      </section>
      ) : null}

      {showDeliveryHours ? (
      <section className="mt-4 rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
        <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
          Lieferdienstzeiten
        </h3>
        <p className="mt-2 text-xs text-rose-900/70">
          Diese Zeiten bestimmen, wann Lieferungen aktiv angenommen werden dürfen.
        </p>
        <div className="mt-4 space-y-2">
          {settings.timeManagement.deliveryHours.map((entry) => (
            <div
              key={`delivery-${entry.day}`}
              className="grid gap-2 rounded-2xl border border-[var(--brand-border)] bg-white p-3 sm:grid-cols-[140px_120px_1fr_1fr]"
            >
              <span className="text-sm font-medium text-rose-900/85">{DAY_LABELS[entry.day]}</span>
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
                onChange={(event) =>
                  updateDailyWindow('deliveryHours', entry.day, { open: event.target.value || null })
                }
                className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
              />
              <input
                type="time"
                disabled={entry.isClosed}
                value={entry.close || ''}
                onChange={(event) =>
                  updateDailyWindow('deliveryHours', entry.day, { close: event.target.value || null })
                }
                className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
              />
            </div>
          ))}
        </div>
      </section>
      ) : null}

      {showHolidayHours ? (
      <section className="mt-4 rounded-3xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
        <div className="flex items-center justify-between gap-2">
          <div>
            <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
              Feiertage & Ausnahmen
            </h3>
            <p className="mt-1 text-xs text-rose-900/70">
              Sonderöffnungen und geschlossene Feiertage überschreiben die normalen Tagesfenster.
            </p>
          </div>
          <button
            type="button"
            onClick={addHoliday}
            className="rounded-xl bg-slate-900 px-3 py-2 text-sm font-medium text-white hover:bg-slate-800"
          >
            Ausnahme hinzufügen
          </button>
        </div>
        <div className="mt-4 space-y-2">
          {settings.timeManagement.holidayHours.length === 0 ? (
            <p className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-white px-3 py-3 text-sm text-rose-900/75">
              Noch keine Feiertage oder Sonderöffnungen gepflegt.
            </p>
          ) : (
            settings.timeManagement.holidayHours.map((entry, index) => (
              <div
                key={`holiday-${index}`}
                className="grid gap-2 rounded-2xl border border-[var(--brand-border)] bg-white p-3 sm:grid-cols-[160px_1fr_120px_1fr_1fr_120px]"
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
                  placeholder="Kommentar"
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
                        close: event.target.checked ? null : entry.close || '14:00',
                      })
                    }
                  />
                  Geschlossen
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
                  className="rounded-xl border border-red-200 bg-white px-3 py-2 text-sm font-medium text-red-700 hover:bg-red-50"
                >
                  Entfernen
                </button>
              </div>
            ))
          )}
        </div>
      </section>
      ) : null}

      {showDeliveryScheduling ? (
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
              value={settings.timeManagement.deliveryScheduling.deliveryMode}
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
              value={settings.timeManagement.deliveryScheduling.orderCutoffTime || ''}
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
              value={settings.timeManagement.deliveryScheduling.minDaysAhead}
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
              value={settings.timeManagement.deliveryScheduling.maxPreorderDays}
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
          <div className="mt-2 flex flex-wrap gap-2">
            {WEEK_DAYS.map((entry) => {
              const checked = settings.timeManagement.deliveryScheduling.allowedDeliveryDays.includes(entry.key)
              return (
                <label
                  key={entry.key}
                  className={`inline-flex items-center gap-2 rounded-full border px-3 py-1 text-xs ${
                    checked
                      ? 'border-emerald-300 bg-emerald-50 text-emerald-800'
                      : 'border-rose-200 bg-white text-rose-900/80'
                  }`}
                >
                  <input
                    type="checkbox"
                    checked={checked}
                    onChange={(event) => {
                      const nextDays = event.target.checked
                        ? Array.from(
                            new Set([...settings.timeManagement.deliveryScheduling.allowedDeliveryDays, entry.key])
                          )
                        : settings.timeManagement.deliveryScheduling.allowedDeliveryDays.filter((day) => day !== entry.key)
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
          <div className="flex flex-wrap items-center justify-between gap-2">
            <h4 className="text-xs font-semibold uppercase tracking-wide text-rose-900/75">
              Wochenplanung Zeitfenster
            </h4>
            <button
              type="button"
              onClick={addTimeSlot}
              className="rounded-lg border border-rose-200 bg-white px-2.5 py-1 text-xs font-semibold text-rose-900"
            >
              + Schnelles Zeitfenster
            </button>
          </div>

          <div className="mt-3 rounded-xl border border-[var(--brand-border)] bg-white">
            <div className="hidden grid-cols-[72px_72px_1fr_120px_130px] gap-2 border-b border-rose-100 px-3 py-2 text-[11px] font-semibold uppercase tracking-wide text-rose-900/70 sm:grid">
              <span>Tag</span>
              <span>Aktiv</span>
              <span>Zeitfenster</span>
              <span>Max. Aufträge</span>
              <span>Aktionen</span>
            </div>

            <div className="divide-y divide-rose-100">
              {slotsByDay.map((dayRow) => {
                const dayErrors = validateDaySlots(dayRow.key)
                const isActiveDay = settings.timeManagement.deliveryScheduling.allowedDeliveryDays.includes(dayRow.key)

                return (
                  <div key={dayRow.key} className="p-3">
                    <div className="grid gap-2 sm:grid-cols-[72px_72px_1fr_120px_130px] sm:items-start">
                      <div className="text-sm font-semibold text-rose-950">{dayRow.label}</div>
                      <div>
                        <span
                          className={`inline-flex rounded-full px-2 py-0.5 text-[11px] font-semibold ${
                            isActiveDay
                              ? 'bg-emerald-100 text-emerald-700'
                              : 'bg-slate-100 text-slate-700'
                          }`}
                        >
                          {isActiveDay ? 'aktiv' : 'inaktiv'}
                        </span>
                      </div>
                      <div className="space-y-1">
                        {dayRow.slots.length === 0 ? (
                          <p className="text-xs text-rose-900/65">Keine Zeitfenster</p>
                        ) : (
                          dayRow.slots.map(({ slot, index }) => (
                            <div key={`${dayRow.key}-${index}`} className="grid grid-cols-[1fr_1fr_auto] gap-1">
                              <input
                                type="time"
                                value={slot.start}
                                onChange={(event) => updateTimeSlot(index, { start: event.target.value })}
                                className="rounded-md border border-[var(--brand-border)] px-2 py-1 text-xs outline-none"
                              />
                              <input
                                type="time"
                                value={slot.end}
                                onChange={(event) => updateTimeSlot(index, { end: event.target.value })}
                                className="rounded-md border border-[var(--brand-border)] px-2 py-1 text-xs outline-none"
                              />
                              <button
                                type="button"
                                onClick={() => removeTimeSlot(index)}
                                className="rounded-md border border-rose-200 px-2 py-1 text-xs text-rose-700 hover:bg-rose-50"
                                title="Zeitfenster entfernen"
                              >
                                ×
                              </button>
                            </div>
                          ))
                        )}
                      </div>
                      <div className="space-y-1">
                        {dayRow.slots.length === 0 ? (
                          <span className="text-xs text-rose-900/65">—</span>
                        ) : (
                          dayRow.slots.map(({ slot, index }) => (
                            <input
                              key={`max-${dayRow.key}-${index}`}
                              type="number"
                              min={0}
                              value={slot.maxOrders ?? ''}
                              placeholder="optional"
                              onChange={(event) =>
                                updateTimeSlot(index, {
                                  maxOrders: event.target.value === '' ? null : Number(event.target.value),
                                })
                              }
                              className="w-full rounded-md border border-[var(--brand-border)] px-2 py-1 text-xs outline-none"
                            />
                          ))
                        )}
                      </div>
                      <div className="flex flex-wrap gap-1.5">
                        <button
                          type="button"
                          onClick={() => addTimeSlotForDay(dayRow.key)}
                          className="rounded-md border border-rose-200 bg-white px-2 py-1 text-[11px] font-semibold text-rose-900"
                        >
                          + Zeitfenster
                        </button>
                        <button
                          type="button"
                          onClick={() => copyDaySlotsToAllDays(dayRow.key)}
                          className="rounded-md border border-rose-200 bg-white px-2 py-1 text-[11px] font-semibold text-rose-900"
                          disabled={dayRow.slots.length === 0}
                        >
                          Auf alle kopieren
                        </button>
                      </div>
                    </div>

                    <div className="mt-2 flex flex-wrap gap-1.5">
                      {DEFAULT_SLOT_TEMPLATES.map((template) => (
                        <button
                          key={`${dayRow.key}-${template.id}`}
                          type="button"
                          onClick={() => applyTemplateToDay(dayRow.key, template.slot)}
                          className="rounded-md border border-rose-200 bg-white px-2 py-1 text-[11px] text-rose-900/90"
                        >
                          {template.label}
                        </button>
                      ))}
                      <button
                        type="button"
                        onClick={() => applyTemplateToDay(dayRow.key, null)}
                        className="rounded-md border border-slate-300 bg-slate-50 px-2 py-1 text-[11px] text-slate-700"
                      >
                        Leer starten
                      </button>
                    </div>

                    {dayErrors.length > 0 ? (
                      <div className="mt-2 space-y-1">
                        {dayErrors.map((message) => (
                          <p key={`${dayRow.key}-${message}`} className="text-xs text-red-700">
                            {message}
                          </p>
                        ))}
                      </div>
                    ) : null}
                  </div>
                )
              })}
            </div>
          </div>

          {settings.timeManagement.deliveryScheduling.timeSlots.length === 0 ? (
            <p className="mt-3 text-xs text-rose-900/70">
              Ohne Zeitfenster gelten nur die aktiven Tage. Für klare Liefertermine bitte Zeitfenster setzen.
            </p>
          ) : null}

          <div className="mt-3 flex flex-wrap gap-2">
            {DEFAULT_SLOT_TEMPLATES.map((template) => (
              <button
                key={`global-${template.id}`}
                type="button"
                onClick={() =>
                  patchDeliveryScheduling({
                    timeSlots: WEEK_DAYS.map((dayEntry) => ({
                      day: dayEntry.key,
                      start: template.slot.start,
                      end: template.slot.end,
                      maxOrders: null,
                    })),
                  })
                }
                className="rounded-md border border-rose-200 bg-white px-2 py-1 text-xs text-rose-900/90"
              >
                Standard: {template.label}
              </button>
            ))}
            <button
              type="button"
              onClick={() => patchDeliveryScheduling({ timeSlots: [] })}
              className="rounded-md border border-slate-300 bg-slate-50 px-2 py-1 text-xs text-slate-700"
            >
              Alle Zeitfenster leeren
            </button>
          </div>
        </div>
      </section>
      ) : null}

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
