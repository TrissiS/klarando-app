'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createOrderDeskPairingSession,
  getOrderDisplays,
  getOrderDeskDeviceBindings,
  createOrderTerminal,
  deleteOrderTerminal,
  getOrderTerminals,
  resetOrderDeskDeviceBinding,
  updateOrderTerminal,
  type OrderDisplay,
  type OrderDeskDeviceBinding,
  type OrderDeskPairingSessionCreateResponse,
  type OrderTerminal,
} from '@/lib/api'

function normalizeText(input: string) {
  const trimmed = input.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeHexColorInput(input: string) {
  const value = input.trim().toLowerCase()
  return /^#[0-9a-f]{6}$/.test(value) ? value : null
}

export default function AdminTerminalsPage() {
  const [terminals, setTerminals] = useState<OrderTerminal[]>([])
  const [displays, setDisplays] = useState<OrderDisplay[]>([])
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [deletingId, setDeletingId] = useState<string | null>(null)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const [editingId, setEditingId] = useState<string | null>(null)
  const [name, setName] = useState('')
  const [terminalCode, setTerminalCode] = useState('')
  const [location, setLocation] = useState('')
  const [customerLogoUrl, setCustomerLogoUrl] = useState('')
  const [customerAccentColor, setCustomerAccentColor] = useState('#ea580c')
  const [customerBgFromColor, setCustomerBgFromColor] = useState('#ffedd5')
  const [customerBgToColor, setCustomerBgToColor] = useState('#f8fafc')
  const [customerCardColor, setCustomerCardColor] = useState('#ffffff')
  const [autoScaleLayout, setAutoScaleLayout] = useState(true)
  const [isActive, setIsActive] = useState(true)
  const [allowCashPayment, setAllowCashPayment] = useState(true)
  const [allowCardPayment, setAllowCardPayment] = useState(true)
  const [autoForwardToKitchen, setAutoForwardToKitchen] = useState(true)
  const [cashDisplayId, setCashDisplayId] = useState('')
  const [kitchenDisplayId, setKitchenDisplayId] = useState('')
  const [pickupDisplayId, setPickupDisplayId] = useState('')
  const [notes, setNotes] = useState('')
  const [sessionRole, setSessionRole] = useState('')
  const [orderDeskDisplayId, setOrderDeskDisplayId] = useState('')
  const [orderDeskDeviceAlias, setOrderDeskDeviceAlias] = useState('')
  const [orderDeskQr, setOrderDeskQr] = useState<OrderDeskPairingSessionCreateResponse | null>(null)
  const [orderDeskBindings, setOrderDeskBindings] = useState<OrderDeskDeviceBinding[]>([])
  const [loadingOrderDeskBindings, setLoadingOrderDeskBindings] = useState(false)
  const [creatingOrderDeskQr, setCreatingOrderDeskQr] = useState(false)
  const [resettingOrderDeskBindingId, setResettingOrderDeskBindingId] = useState<string | null>(null)
  const [recreatingOrderDeskBindingId, setRecreatingOrderDeskBindingId] = useState<string | null>(null)
  const [orderDeskQrExpired, setOrderDeskQrExpired] = useState(false)

  const browserOrigin =
    typeof window !== 'undefined' ? window.location.origin : 'http://localhost:3000'

  const activeCount = useMemo(
    () => terminals.filter((entry) => entry.isActive).length,
    [terminals]
  )

  const autoForwardCount = useMemo(
    () =>
      terminals.filter((entry) => entry.isActive && entry.autoForwardToKitchen).length,
    [terminals]
  )
  const displayNameById = useMemo(
    () =>
      new Map(
        displays.map((display) => [
          display.id,
          `${display.name}${display.isActive ? '' : ' (inaktiv)'}`,
        ])
      ),
    [displays]
  )
  const cashDisplays = useMemo(
    () => displays.filter((display) => display.displayRole === 'CASH'),
    [displays]
  )
  const kitchenDisplays = useMemo(
    () => displays.filter((display) => display.displayRole === 'KITCHEN'),
    [displays]
  )
  const pickupDisplays = useMemo(
    () => displays.filter((display) => display.displayRole === 'PICKUP'),
    [displays]
  )
  const isSuperadmin = sessionRole.trim().toUpperCase() === 'SUPERADMIN'

  async function loadData() {
    try {
      setLoading(true)
      setError('')
      const [terminalData, displayData] = await Promise.all([
        getOrderTerminals(),
        getOrderDisplays(),
      ])
      setTerminals(terminalData)
      setDisplays(displayData)
      const firstCashDisplay = displayData.find((entry) => entry.displayRole === 'CASH')
      setOrderDeskDisplayId((current) => current || firstCashDisplay?.id || '')
    } catch (loadError) {
      setError(
        loadError instanceof Error
          ? loadError.message
          : 'Bestellterminals konnten nicht geladen werden'
      )
    } finally {
      setLoading(false)
    }
  }

  async function loadOrderDeskBindings() {
    try {
      setLoadingOrderDeskBindings(true)
      const response = await getOrderDeskDeviceBindings({
        includeInactive: true,
      })
      setOrderDeskBindings(response.bindings)
    } catch (loadError) {
      setError(
        loadError instanceof Error
          ? loadError.message
          : 'OrderDesk-Bindings konnten nicht geladen werden'
      )
    } finally {
      setLoadingOrderDeskBindings(false)
    }
  }

  useEffect(() => {
    loadData()
    void loadOrderDeskBindings()
  }, [])

  useEffect(() => {
    if (!orderDeskQr?.expiresAt) {
      setOrderDeskQrExpired(false)
      return
    }
    const expiresAtMs = new Date(orderDeskQr.expiresAt).getTime()
    const now = Date.now()
    if (!Number.isFinite(expiresAtMs) || expiresAtMs <= now) {
      setOrderDeskQrExpired(true)
      return
    }
    setOrderDeskQrExpired(false)
    const timeout = window.setTimeout(() => {
      setOrderDeskQrExpired(true)
    }, Math.max(0, expiresAtMs - now))
    return () => window.clearTimeout(timeout)
  }, [orderDeskQr])

  useEffect(() => {
    if (typeof window === 'undefined') {
      return
    }

    try {
      const rawSession = window.localStorage.getItem('sessionUser')
      if (!rawSession) {
        setSessionRole('')
        return
      }
      const parsed = JSON.parse(rawSession) as { role?: unknown }
      setSessionRole(typeof parsed.role === 'string' ? parsed.role : '')
    } catch {
      setSessionRole('')
    }
  }, [])

  function resetForm() {
    setEditingId(null)
    setName('')
    setTerminalCode('')
    setLocation('')
    setCustomerLogoUrl('')
    setCustomerAccentColor('#ea580c')
    setCustomerBgFromColor('#ffedd5')
    setCustomerBgToColor('#f8fafc')
    setCustomerCardColor('#ffffff')
    setAutoScaleLayout(true)
    setIsActive(true)
    setAllowCashPayment(true)
    setAllowCardPayment(true)
    setAutoForwardToKitchen(true)
    setCashDisplayId('')
    setKitchenDisplayId('')
    setPickupDisplayId('')
    setNotes('')
  }

  function startEdit(terminal: OrderTerminal) {
    setEditingId(terminal.id)
    setName(terminal.name)
    setTerminalCode(terminal.terminalCode)
    setLocation(terminal.location || '')
    setCustomerLogoUrl(terminal.customerLogoUrl || '')
    setCustomerAccentColor(terminal.customerAccentColor || '#ea580c')
    setCustomerBgFromColor(terminal.customerBgFromColor || '#ffedd5')
    setCustomerBgToColor(terminal.customerBgToColor || '#f8fafc')
    setCustomerCardColor(terminal.customerCardColor || '#ffffff')
    setAutoScaleLayout(terminal.autoScaleLayout ?? true)
    setIsActive(terminal.isActive)
    setAllowCashPayment(terminal.allowCashPayment)
    setAllowCardPayment(terminal.allowCardPayment)
    setAutoForwardToKitchen(terminal.autoForwardToKitchen)
    setCashDisplayId(terminal.cashDisplayId || '')
    setKitchenDisplayId(terminal.kitchenDisplayId || '')
    setPickupDisplayId(terminal.pickupDisplayId || '')
    setNotes(terminal.notes || '')
    setError('')
    setSuccess('')
  }

  async function handleSubmit(event: React.FormEvent) {
    event.preventDefault()

    if (!allowCashPayment && !allowCardPayment) {
      setError('Mindestens eine Zahlungsart muss aktiv sein.')
      return
    }

    const normalizedAccentColor = normalizeHexColorInput(customerAccentColor)
    const normalizedBgFromColor = normalizeHexColorInput(customerBgFromColor)
    const normalizedBgToColor = normalizeHexColorInput(customerBgToColor)
    const normalizedCardColor = normalizeHexColorInput(customerCardColor)
    if (
      !normalizedAccentColor ||
      !normalizedBgFromColor ||
      !normalizedBgToColor ||
      !normalizedCardColor
    ) {
      setError('Bitte gueltige Farben im Format #RRGGBB angeben.')
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      if (editingId) {
        const updated = await updateOrderTerminal(editingId, {
          name,
          location: normalizeText(location),
          customerLogoUrl: normalizeText(customerLogoUrl),
          customerAccentColor: normalizedAccentColor,
          customerBgFromColor: normalizedBgFromColor,
          customerBgToColor: normalizedBgToColor,
          customerCardColor: normalizedCardColor,
          autoScaleLayout,
          isActive,
          allowCashPayment,
          allowCardPayment,
          autoForwardToKitchen,
          cashDisplayId: normalizeText(cashDisplayId),
          kitchenDisplayId: normalizeText(kitchenDisplayId),
          pickupDisplayId: normalizeText(pickupDisplayId),
          notes: normalizeText(notes),
        })

        setTerminals((current) =>
          current
            .map((entry) => (entry.id === updated.id ? updated : entry))
            .sort((left, right) => left.name.localeCompare(right.name, 'de-DE'))
        )
        setSuccess(`Bestellterminal "${updated.name}" aktualisiert.`)
      } else {
        const created = await createOrderTerminal({
          name,
          terminalCode: normalizeText(terminalCode) ?? undefined,
          location: normalizeText(location),
          customerLogoUrl: normalizeText(customerLogoUrl),
          customerAccentColor: normalizedAccentColor,
          customerBgFromColor: normalizedBgFromColor,
          customerBgToColor: normalizedBgToColor,
          customerCardColor: normalizedCardColor,
          autoScaleLayout,
          isActive,
          allowCashPayment,
          allowCardPayment,
          autoForwardToKitchen,
          cashDisplayId: normalizeText(cashDisplayId),
          kitchenDisplayId: normalizeText(kitchenDisplayId),
          pickupDisplayId: normalizeText(pickupDisplayId),
          notes: normalizeText(notes),
        })

        setTerminals((current) =>
          [...current, created].sort((left, right) =>
            left.name.localeCompare(right.name, 'de-DE')
          )
        )
        setSuccess(`Bestellterminal "${created.name}" erstellt.`)
      }

      resetForm()
    } catch (submitError) {
      setError(
        submitError instanceof Error
          ? submitError.message
          : 'Bestellterminal konnte nicht gespeichert werden'
      )
    } finally {
      setSaving(false)
    }
  }

  async function handleDelete(terminal: OrderTerminal) {
    if (!window.confirm(`Bestellterminal "${terminal.name}" wirklich loeschen?`)) {
      return
    }

    try {
      setDeletingId(terminal.id)
      setError('')
      setSuccess('')
      await deleteOrderTerminal(terminal.id)

      setTerminals((current) => current.filter((entry) => entry.id !== terminal.id))
      if (editingId === terminal.id) {
        resetForm()
      }
      setSuccess(`Bestellterminal "${terminal.name}" geloescht.`)
    } catch (deleteError) {
      setError(
        deleteError instanceof Error
          ? deleteError.message
          : 'Bestellterminal konnte nicht geloescht werden'
      )
    } finally {
      setDeletingId(null)
    }
  }

  async function handleCreateOrderDeskQr() {
    if (!orderDeskDisplayId) {
      setError('Bitte zuerst ein aktives Kassendisplay auswaehlen.')
      return
    }

    try {
      setCreatingOrderDeskQr(true)
      setError('')
      setSuccess('')
      const response = await createOrderDeskPairingSession({
        displayId: orderDeskDisplayId,
        deviceAlias: normalizeText(orderDeskDeviceAlias),
      })
      setOrderDeskQr(response)
      setOrderDeskQrExpired(false)
      setSuccess('OrderDesk-QR wurde erstellt.')
      await loadOrderDeskBindings()
    } catch (createError) {
      setError(
        createError instanceof Error
          ? createError.message
          : 'OrderDesk-QR konnte nicht erstellt werden'
      )
    } finally {
      setCreatingOrderDeskQr(false)
    }
  }

  async function handleRecreateBindingPairing(binding: OrderDeskDeviceBinding) {
    try {
      setRecreatingOrderDeskBindingId(binding.id)
      setError('')
      setSuccess('')
      const response = await createOrderDeskPairingSession({
        displayId: binding.displayId,
        deviceAlias: normalizeText(binding.deviceAlias ?? ''),
      })
      setOrderDeskQr(response)
      setOrderDeskQrExpired(false)
      setOrderDeskDisplayId(binding.displayId)
      setOrderDeskDeviceAlias(binding.deviceAlias || '')
      setSuccess(`Neuer Pairing-Code für ${binding.deviceAlias || binding.deviceSerial} erstellt.`)
    } catch (createError) {
      setError(
        createError instanceof Error
          ? createError.message
          : 'Neuer Pairing-Code konnte nicht erstellt werden'
      )
    } finally {
      setRecreatingOrderDeskBindingId(null)
    }
  }

  async function handleResetOrderDeskBinding(binding: OrderDeskDeviceBinding) {
    if (
      !window.confirm(
        `Binding fuer ${binding.deviceAlias || binding.deviceSerial} wirklich trennen?\nNur Superadmin kann das rueckgaengig machen.`
      )
    ) {
      return
    }

    try {
      setResettingOrderDeskBindingId(binding.id)
      setError('')
      setSuccess('')
      await resetOrderDeskDeviceBinding(binding.id)
      setSuccess('OrderDesk-Binding wurde zurueckgesetzt.')
      await loadOrderDeskBindings()
    } catch (resetError) {
      setError(
        resetError instanceof Error
          ? resetError.message
          : 'OrderDesk-Binding konnte nicht zurueckgesetzt werden'
      )
    } finally {
      setResettingOrderDeskBindingId(null)
    }
  }

  return (
    <AdminLayout
      title="Bestellterminals"
      subtitle="Terminals fuer Self-Order, Bezahlung und Weiterleitung an die Kueche"
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

      <div className="mb-6 grid gap-4 md:grid-cols-3">
        <MetricCard label="Terminals gesamt" value={String(terminals.length)} />
        <MetricCard label="Aktive Terminals" value={String(activeCount)} />
        <MetricCard label="Auto-Weiterleitung" value={String(autoForwardCount)} />
      </div>

      <div className="mb-6 flex justify-end">
        <Link
          href="/admin/order-displays"
          className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-medium text-white transition hover:bg-slate-800"
        >
          Zu Bestell-Displays
        </Link>
      </div>

      <section className="mb-6 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="flex flex-wrap items-start justify-between gap-3">
          <div>
            <h2 className="text-xl font-semibold">OrderDesk Geraete verbinden</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              QR erzeugen, Geraete-Serien verwalten und Bindungen nur per Superadmin resetten.
            </p>
          </div>
          <button
            type="button"
            onClick={() => void loadOrderDeskBindings()}
            className="rounded-xl bg-slate-900 px-3 py-2 text-sm font-medium text-white transition hover:bg-slate-800"
          >
            Geraeteliste aktualisieren
          </button>
        </div>

        <div className="mt-4 grid gap-6 xl:grid-cols-[360px_1fr]">
          <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
            <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
              QR Erstellung
            </h3>
            <div className="mt-3 space-y-3">
              <Field label="Kassendisplay">
                <select
                  value={orderDeskDisplayId}
                  onChange={(event) => setOrderDeskDisplayId(event.target.value)}
                  className="input-ui"
                >
                  <option value="">Bitte waehlen</option>
                  {cashDisplays.map((display) => (
                    <option key={display.id} value={display.id}>
                      {display.name} ({display.displayCode})
                    </option>
                  ))}
                </select>
              </Field>
              <Field label="Geraete-Alias (optional)">
                <input
                  value={orderDeskDeviceAlias}
                  onChange={(event) => setOrderDeskDeviceAlias(event.target.value)}
                  placeholder="z.B. Kasse vorne 8 Zoll"
                  className="input-ui"
                />
              </Field>
              <button
                type="button"
                onClick={() => void handleCreateOrderDeskQr()}
                disabled={creatingOrderDeskQr || !orderDeskDisplayId}
                className="w-full rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
              >
                {creatingOrderDeskQr ? 'Erstellt...' : 'OrderDesk-QR erstellen'}
              </button>
            </div>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-white p-3">
              {orderDeskQr?.qrImageUrl ? (
                <div className="text-center">
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img
                    src={orderDeskQr.qrImageUrl}
                    alt="OrderDesk QR"
                    className="mx-auto h-56 w-56 rounded-xl border border-[var(--brand-border)] bg-white p-2"
                  />
                  <p className="mt-2 text-xs font-semibold text-slate-900">
                    {orderDeskQr.displayCode} | {orderDeskQr.deviceAlias}
                  </p>
                  {orderDeskQrExpired ? (
                    <div className="mt-2 rounded-lg border border-amber-200 bg-amber-50 px-2 py-1 text-xs text-amber-800">
                      Code abgelaufen – neuen Code erstellen.
                    </div>
                  ) : (
                    <div className="mt-2 rounded-lg border border-emerald-200 bg-emerald-50 px-2 py-1 text-xs text-emerald-800">
                      Code ist aktiv.
                    </div>
                  )}
                  {orderDeskQrExpired ? (
                    <button
                      type="button"
                      onClick={() => void handleCreateOrderDeskQr()}
                      disabled={creatingOrderDeskQr || !orderDeskDisplayId}
                      className="mt-2 w-full rounded-lg bg-slate-900 px-3 py-2 text-xs font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
                    >
                      Neuen QR-Code generieren
                    </button>
                  ) : null}
                </div>
              ) : (
                <p className="text-xs text-rose-900/70">Noch kein QR erzeugt.</p>
              )}
            </div>
          </article>

          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
              Verbundene OrderDesk Geraete
            </h3>
            <div className="mt-3 max-h-[360px] overflow-auto rounded-2xl border border-[var(--brand-border)]">
              {loadingOrderDeskBindings ? (
                <p className="px-4 py-4 text-sm text-rose-900/70">Lade Bindings...</p>
              ) : orderDeskBindings.length === 0 ? (
                <p className="px-4 py-4 text-sm text-rose-900/70">
                  Keine OrderDesk-Geraete verbunden.
                </p>
              ) : (
                <table className="w-full min-w-[760px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Geraet</th>
                      <th className="th-ui">Seriennummer</th>
                      <th className="th-ui">Display</th>
                      <th className="th-ui">Status</th>
                      <th className="th-ui">Zuletzt online</th>
                      <th className="th-ui">Verbunden seit</th>
                      <th className="th-ui">Aktion</th>
                    </tr>
                  </thead>
                  <tbody>
                    {orderDeskBindings.map((binding) => (
                      <tr key={binding.id}>
                        <td className="td-ui">
                          <div className="text-xs">
                            <p className="font-semibold text-slate-900">
                              {binding.deviceAlias || 'Ohne Alias'}
                            </p>
                            <p className="text-rose-900/70">
                              {binding.devicePlatform || '-'} | {binding.deviceModel || '-'} | v
                              {binding.appVersion || '-'}
                            </p>
                          </div>
                        </td>
                        <td className="td-ui font-mono text-xs">{binding.deviceSerial}</td>
                        <td className="td-ui">
                          {binding.display?.name || binding.displayCode} ({binding.displayCode})
                        </td>
                        <td className="td-ui">
                          <span
                            className={`rounded-lg px-2 py-1 text-xs font-semibold ${
                              binding.isActive
                                ? 'bg-emerald-100 text-emerald-700'
                                : 'bg-slate-200 text-slate-700'
                            }`}
                          >
                            {binding.isActive ? 'Aktiv gebunden' : 'Getrennt'}
                          </span>
                        </td>
                        <td className="td-ui text-xs">
                          {binding.lastSeenAt
                            ? new Date(binding.lastSeenAt).toLocaleString('de-DE')
                            : '-'}
                        </td>
                        <td className="td-ui text-xs">
                          {binding.boundAt
                            ? new Date(binding.boundAt).toLocaleString('de-DE')
                            : '-'}
                        </td>
                        <td className="td-ui">
                          <div className="flex flex-wrap gap-2">
                            <button
                              type="button"
                              disabled={recreatingOrderDeskBindingId === binding.id}
                              onClick={() => void handleRecreateBindingPairing(binding)}
                              className="rounded-lg border border-blue-300 px-2 py-1 text-xs font-medium text-blue-700 transition hover:bg-blue-50 disabled:cursor-not-allowed disabled:opacity-60"
                            >
                              {recreatingOrderDeskBindingId === binding.id
                                ? 'Erstellt...'
                                : 'Neuen Pairing-Code'}
                            </button>
                            <button
                              type="button"
                              disabled={
                                !binding.isActive ||
                                !isSuperadmin ||
                                resettingOrderDeskBindingId === binding.id
                              }
                              onClick={() => void handleResetOrderDeskBinding(binding)}
                              className="rounded-lg border border-red-300 px-2 py-1 text-xs font-medium text-red-700 transition hover:bg-red-50 disabled:cursor-not-allowed disabled:opacity-60"
                            >
                              {resettingOrderDeskBindingId === binding.id
                                ? 'Trennt...'
                                : 'Geraet trennen'}
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              )}
            </div>
            {!isSuperadmin ? (
              <p className="mt-2 text-xs text-rose-900/70">
                Hinweis: Nur Superadmin darf eine bestehende OrderDesk-Bindung zuruecksetzen.
              </p>
            ) : null}
          </article>
        </div>
      </section>

      <div className="grid gap-6 xl:grid-cols-[430px_1fr]">
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <h2 className="text-xl font-semibold">
            {editingId ? 'Terminal bearbeiten' : 'Neues Terminal'}
          </h2>
          <p className="mt-1 text-sm text-rose-900/70">
            Ein Terminal bekommt einen eigenen Link fuer die Bestellansicht.
          </p>

          <form onSubmit={handleSubmit} className="mt-4 space-y-3">
            <Field label="Name">
              <input
                value={name}
                onChange={(event) => setName(event.target.value)}
                required
                className="input-ui"
              />
            </Field>

            <Field label="Terminal-Code (optional bei Neuanlage)">
              <input
                value={terminalCode}
                onChange={(event) => setTerminalCode(event.target.value)}
                disabled={Boolean(editingId)}
                className="input-ui disabled:cursor-not-allowed disabled:bg-rose-50"
              />
            </Field>

            <Field label="Standort">
              <input
                value={location}
                onChange={(event) => setLocation(event.target.value)}
                className="input-ui"
              />
            </Field>

            <Field label="Kundenansicht Logo-URL (optional)">
              <input
                value={customerLogoUrl}
                onChange={(event) => setCustomerLogoUrl(event.target.value)}
                placeholder="https://.../logo.png"
                className="input-ui"
              />
            </Field>

            <fieldset className="space-y-3 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <legend className="px-1 text-sm font-semibold text-rose-900/85">
                Kundenansicht Design
              </legend>
              <ColorField
                label="Akzentfarbe"
                value={customerAccentColor}
                onChange={setCustomerAccentColor}
              />
              <ColorField
                label="Hintergrund Start"
                value={customerBgFromColor}
                onChange={setCustomerBgFromColor}
              />
              <ColorField
                label="Hintergrund Ende"
                value={customerBgToColor}
                onChange={setCustomerBgToColor}
              />
              <ColorField
                label="Kartenfarbe"
                value={customerCardColor}
                onChange={setCustomerCardColor}
              />
              <CheckField
                checked={autoScaleLayout}
                onChange={setAutoScaleLayout}
                label="Auto-Scale fuer verschiedene Bildschirmgroessen"
              />
            </fieldset>

            <div className="space-y-2 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <CheckField
                checked={isActive}
                onChange={setIsActive}
                label="Terminal aktiv"
              />
              <CheckField
                checked={allowCashPayment}
                onChange={setAllowCashPayment}
                label="Barzahlung erlauben"
              />
              <CheckField
                checked={allowCardPayment}
                onChange={setAllowCardPayment}
                label="Kartenzahlung erlauben"
              />
              <CheckField
                checked={autoForwardToKitchen}
                onChange={setAutoForwardToKitchen}
                label="Neue Bestellungen direkt an Kueche weiterleiten"
              />
            </div>

            <Field label="Kassen-Display">
              <select
                value={cashDisplayId}
                onChange={(event) => setCashDisplayId(event.target.value)}
                className="input-ui"
              >
                <option value="">Nicht zugewiesen</option>
                {cashDisplays.map((display) => (
                  <option key={display.id} value={display.id}>
                    {display.name}
                    {display.isActive ? '' : ' (inaktiv)'}
                  </option>
                ))}
              </select>
            </Field>

            <Field label="Kuechen-Display">
              <select
                value={kitchenDisplayId}
                onChange={(event) => setKitchenDisplayId(event.target.value)}
                className="input-ui"
              >
                <option value="">Nicht zugewiesen</option>
                {kitchenDisplays.map((display) => (
                  <option key={display.id} value={display.id}>
                    {display.name}
                    {display.isActive ? '' : ' (inaktiv)'}
                  </option>
                ))}
              </select>
            </Field>

            <Field label="Abhol-Display">
              <select
                value={pickupDisplayId}
                onChange={(event) => setPickupDisplayId(event.target.value)}
                className="input-ui"
              >
                <option value="">Nicht zugewiesen</option>
                {pickupDisplays.map((display) => (
                  <option key={display.id} value={display.id}>
                    {display.name}
                    {display.isActive ? '' : ' (inaktiv)'}
                  </option>
                ))}
              </select>
            </Field>

            <Field label="Notizen">
              <textarea
                value={notes}
                onChange={(event) => setNotes(event.target.value)}
                className="input-ui min-h-[80px]"
              />
            </Field>

            <button
              type="submit"
              disabled={saving}
              className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
            >
              {saving
                ? 'Speichert...'
                : editingId
                ? 'Terminal aktualisieren'
                : 'Terminal speichern'}
            </button>

            {editingId ? (
              <button
                type="button"
                onClick={resetForm}
                className="w-full rounded-xl border border-[var(--brand-border)] px-4 py-2.5 font-medium text-rose-900/85 transition hover:bg-rose-50"
              >
                Bearbeitung abbrechen
              </button>
            ) : null}
          </form>
        </section>

        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <div className="flex flex-wrap items-end justify-between gap-3">
            <div>
              <h2 className="text-xl font-semibold">Terminal-Liste</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Direkter Zugriff auf jeden Terminal-Link.
              </p>
            </div>
            <button
              type="button"
              onClick={() => void loadData()}
              className="rounded-xl bg-slate-900 px-3 py-2 text-sm font-medium text-white transition hover:bg-slate-800"
            >
              Aktualisieren
            </button>
          </div>

          <div className="mt-4 space-y-3">
            {loading ? (
              <p className="text-sm text-rose-900/70">Lade Terminals...</p>
            ) : terminals.length === 0 ? (
              <p className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                Noch keine Bestellterminals vorhanden.
              </p>
            ) : (
              terminals.map((terminal) => {
                const terminalUrl = `${browserOrigin}/terminal/${terminal.terminalCode}`
                return (
                  <article
                    key={terminal.id}
                    className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-4"
                  >
                    <div className="flex flex-wrap items-start justify-between gap-3">
                      <div>
                        <p className="text-base font-semibold text-[var(--brand-ink)]">{terminal.name}</p>
                        <p className="text-xs text-rose-900/75">
                          Code: {terminal.terminalCode} | Standort: {terminal.location || '-'}
                        </p>
                        {terminal.customerLogoUrl ? (
                          <p className="mt-1 text-xs text-rose-900/75">
                            Kunden-Logo: {terminal.customerLogoUrl}
                          </p>
                        ) : null}
                        <p className="mt-1 text-xs text-rose-900/75">
                          {terminal.isActive ? 'Aktiv' : 'Inaktiv'} | Zahlung:{' '}
                          {terminal.allowCashPayment ? 'Cash' : '-'}{' '}
                          {terminal.allowCardPayment ? '/ Card' : ''}
                          {' | '}
                          {terminal.autoForwardToKitchen
                            ? 'Direkt an Kueche'
                            : 'Manuelle Weiterleitung'}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Auto-Scale: {terminal.autoScaleLayout ? 'Aktiv' : 'Inaktiv'} | Accent{' '}
                          {terminal.customerAccentColor}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Routing:
                          {' '}
                          Kasse{' '}
                          {terminal.cashDisplay?.name ||
                            (terminal.cashDisplayId
                              ? displayNameById.get(terminal.cashDisplayId) || '-'
                              : '-')}
                          {' | '}
                          Kueche{' '}
                          {terminal.kitchenDisplay?.name ||
                            (terminal.kitchenDisplayId
                              ? displayNameById.get(terminal.kitchenDisplayId) || '-'
                              : '-')}
                          {' | '}
                          Abholung{' '}
                          {terminal.pickupDisplay?.name ||
                            (terminal.pickupDisplayId
                              ? displayNameById.get(terminal.pickupDisplayId) || '-'
                              : '-')}
                        </p>
                        <a
                          href={terminalUrl}
                          target="_blank"
                          rel="noreferrer"
                          className="mt-1 inline-block text-xs font-medium text-orange-600 underline"
                        >
                          {terminalUrl}
                        </a>
                      </div>

                      <div className="flex gap-2">
                        <button
                          type="button"
                          onClick={() => startEdit(terminal)}
                          className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-slate-800"
                        >
                          Bearbeiten
                        </button>
                        <button
                          type="button"
                          disabled={deletingId === terminal.id}
                          onClick={() => handleDelete(terminal)}
                          className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-red-700 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {deletingId === terminal.id ? 'Loescht...' : 'Loeschen'}
                        </button>
                      </div>
                    </div>
                  </article>
                )
              })
            )}
          </div>
        </section>
      </div>

    </AdminLayout>
  )
}

function Field({
  label,
  children,
}: {
  label: string
  children: React.ReactNode
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-sm font-medium text-rose-900/85">{label}</span>
      {children}
    </label>
  )
}

function CheckField({
  checked,
  onChange,
  label,
}: {
  checked: boolean
  onChange: (checked: boolean) => void
  label: string
}) {
  return (
    <label className="flex items-center gap-2 text-sm text-rose-900/85">
      <input
        type="checkbox"
        checked={checked}
        onChange={(event) => onChange(event.target.checked)}
      />
      <span>{label}</span>
    </label>
  )
}

function ColorField({
  label,
  value,
  onChange,
}: {
  label: string
  value: string
  onChange: (value: string) => void
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
        {label}
      </span>
      <div className="flex items-center gap-2">
        <input
          type="color"
          value={value}
          onChange={(event) => onChange(event.target.value)}
          className="h-10 w-12 cursor-pointer rounded-lg border border-[var(--brand-border)] bg-white p-1"
        />
        <input
          type="text"
          value={value}
          onChange={(event) => onChange(event.target.value)}
          className="input-ui"
        />
      </div>
    </label>
  )
}

function MetricCard({ label, value }: { label: string; value: string }) {
  return (
    <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
      <p className="text-xs uppercase tracking-wide text-rose-900/70">{label}</p>
      <p className="mt-2 text-2xl font-bold text-[var(--brand-ink)]">{value}</p>
    </article>
  )
}

