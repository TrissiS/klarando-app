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
  showDeliveryScheduling?: boolean
}

type ServiceMode = 'DELIVERY' | 'PICKUP' | 'BOTH'
type DeliveryDay = BusinessSettings['deliveryScheduling']['allowedDeliveryDays'][number]
type DeliverySlot = BusinessSettings['deliveryScheduling']['timeSlots'][number]
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
  showServiceAreaEditor = true,
  showDeliveryScheduling = true,
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

  function addTimeSlotForDay(day: DeliveryDay) {
    patchDeliveryScheduling({
      timeSlots: [
        ...settings.deliveryScheduling.timeSlots,
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
    const next = settings.deliveryScheduling.timeSlots.filter((_, slotIndex) => slotIndex !== index)
    patchDeliveryScheduling({ timeSlots: next })
  }

  function copyDaySlotsToAllDays(sourceDay: DeliveryDay) {
    const source = settings.deliveryScheduling.timeSlots
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
    const withoutDay = settings.deliveryScheduling.timeSlots.filter((slot) => slot.day !== day)
    patchDeliveryScheduling({
      timeSlots: template
        ? [...withoutDay, { day, start: template.start, end: template.end, maxOrders: null }]
        : withoutDay,
    })
  }

  const slotsByDay = WEEK_DAYS.map((dayEntry) => ({
    ...dayEntry,
    slots: settings.deliveryScheduling.timeSlots
      .map((slot, index) => ({ slot, index }))
      .filter((entry) => entry.slot.day === dayEntry.key)
      .sort((left, right) => left.slot.start.localeCompare(right.slot.start)),
  }))

  function validateDaySlots(day: DeliveryDay) {
    const daySlots = settings.deliveryScheduling.timeSlots
      .filter((slot) => slot.day === day)
      .map((slot) => ({
        start: slot.start?.trim() || '',
        end: slot.end?.trim() || '',
        maxOrders: slot.maxOrders,
      }))
      .sort((left, right) => left.start.localeCompare(right.start))

    const errors: string[] = []

    if (settings.deliveryScheduling.allowedDeliveryDays.includes(day) && daySlots.length === 0) {
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

      {showDeliveryScheduling ? (
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
          <div className="mt-2 flex flex-wrap gap-2">
            {WEEK_DAYS.map((entry) => {
              const checked = settings.deliveryScheduling.allowedDeliveryDays.includes(entry.key)
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
                const isActiveDay = settings.deliveryScheduling.allowedDeliveryDays.includes(dayRow.key)

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

          {settings.deliveryScheduling.timeSlots.length === 0 ? (
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
