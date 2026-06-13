'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createOrderDeskPairingSession,
  deleteOwnOrderDeskDeviceBinding,
  getOrderDisplays,
  getOrderDeskDeviceBindings,
  recreateOrderDeskDevicePairing,
  createOrderTerminal,
  deleteOrderTerminal,
  getOrderTerminals,
  resetOrderDeskDeviceBinding,
  updateOrderDeskDeviceBinding,
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

const ORDERDESK_ONLINE_THRESHOLD_MINUTES = 5
const ORDERDESK_STALE_THRESHOLD_DAYS = 14

function getBindingReferenceDate(binding: OrderDeskDeviceBinding) {
  return binding.lastSeenAt || binding.boundAt || binding.firstBoundAt || binding.createdAt
}

function getOrderDeskBindingStatus(binding: OrderDeskDeviceBinding) {
  const now = Date.now()
  const lastSeenMs = binding.lastSeenAt ? new Date(binding.lastSeenAt).getTime() : null
  const referenceMs = getBindingReferenceDate(binding) ? new Date(getBindingReferenceDate(binding)).getTime() : null
  const onlineThresholdMs = ORDERDESK_ONLINE_THRESHOLD_MINUTES * 60 * 1000
  const staleThresholdMs = ORDERDESK_STALE_THRESHOLD_DAYS * 24 * 60 * 60 * 1000

  if (lastSeenMs && now - lastSeenMs <= onlineThresholdMs && binding.isActive) {
    return {
      key: 'online',
      label: 'Online',
      detail: 'Aktiv verbunden',
      badgeClass: 'bg-emerald-100 text-emerald-700',
      canCleanup: false,
    } as const
  }

  if (!binding.lastSeenAt) {
    return {
      key: 'never',
      label: 'Noch nie verbunden',
      detail: 'Kein Heartbeat empfangen',
      badgeClass: 'bg-amber-100 text-amber-700',
      canCleanup:
        !!referenceMs && now - referenceMs >= staleThresholdMs,
    } as const
  }

  if (lastSeenMs && now - lastSeenMs >= staleThresholdMs) {
    return {
      key: 'stale',
      label: 'Veraltet',
      detail: 'Laenger als 14 Tage offline',
      badgeClass: 'bg-rose-100 text-rose-700',
      canCleanup: true,
    } as const
  }

  return {
    key: 'offline',
    label: 'Offline',
    detail: binding.isActive ? 'Zuletzt verbunden, aktuell nicht aktiv' : 'Getrennt oder inaktiv',
    badgeClass: 'bg-slate-200 text-slate-700',
    canCleanup: false,
  } as const
}

type OrderDeskManualPairingData = {
  apiBaseUrl: string
  tenantId: string
  adminCode: string
  displayCode: string
  pairingToken: string
}

function decodeOrderDeskPairingPayload(rawPayload: string): Partial<OrderDeskManualPairingData> | null {
  const raw = rawPayload.trim()
  if (!raw) return null
  const tryParseJson = (jsonText: string): Partial<OrderDeskManualPairingData> | null => {
    try {
      const parsed = JSON.parse(jsonText) as Record<string, unknown>
      const token =
        typeof parsed.pairingToken === 'string'
          ? parsed.pairingToken.trim()
          : typeof parsed.token === 'string'
            ? parsed.token.trim()
            : ''
      const apiBaseUrl =
        typeof parsed.apiBaseUrl === 'string'
          ? parsed.apiBaseUrl.trim()
          : typeof parsed.apiUrl === 'string'
            ? parsed.apiUrl.trim()
            : typeof parsed.baseUrl === 'string'
              ? parsed.baseUrl.trim()
              : ''
      const tenantId = typeof parsed.tenantId === 'string' ? parsed.tenantId.trim() : ''
      const displayCode =
        typeof parsed.displayCode === 'string'
          ? parsed.displayCode.trim()
          : typeof parsed.deviceCode === 'string'
            ? parsed.deviceCode.trim()
            : ''
      return {
        apiBaseUrl,
        tenantId,
        adminCode: '',
        displayCode,
        pairingToken: token,
      }
    } catch {
      return null
    }
  }

  if (raw.startsWith('{')) {
    return tryParseJson(raw)
  }
  if (raw.toUpperCase().startsWith('KOD')) {
    const hex = raw.slice(3).trim().toUpperCase()
    if (!hex || hex.length % 2 !== 0 || !/^[0-9A-F]+$/.test(hex)) return null
    try {
      return tryParseJson(Buffer.from(hex, 'hex').toString('utf8'))
    } catch {
      return null
    }
  }
  if (raw.startsWith('KLARANDO_ORDERDESK_PAIRING:')) {
    const base64 = raw.slice('KLARANDO_ORDERDESK_PAIRING:'.length).replace(/-/g, '+').replace(/_/g, '/')
    const padded = base64.padEnd(Math.ceil(base64.length / 4) * 4, '=')
    try {
      return tryParseJson(Buffer.from(padded, 'base64').toString('utf8'))
    } catch {
      return null
    }
  }
  if (raw.startsWith('klarando-orderdesk-pair:')) {
    const parts = raw.split(':')
    return {
      apiBaseUrl: 'https://api.klarando.com',
      tenantId: '',
      adminCode: '',
      displayCode: parts[1] ?? '',
      pairingToken: parts.slice(2).join(':'),
    }
  }
  return {
    apiBaseUrl: 'https://api.klarando.com',
    tenantId: '',
    adminCode: '',
    displayCode: '',
    pairingToken: raw,
  }
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
  const [savingOrderDeskAliasId, setSavingOrderDeskAliasId] = useState<string | null>(null)
  const [deletingOrderDeskBindingId, setDeletingOrderDeskBindingId] = useState<string | null>(null)
  const [editingOrderDeskBindingId, setEditingOrderDeskBindingId] = useState<string | null>(null)
  const [editingOrderDeskAlias, setEditingOrderDeskAlias] = useState('')
  const [cleaningOrderDeskBindings, setCleaningOrderDeskBindings] = useState(false)
  const [orderDeskQrExpired, setOrderDeskQrExpired] = useState(false)
  const [copyState, setCopyState] = useState('')

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
  const canManageOrderDeskDevices = ['ADMIN', 'CHAINADMIN', 'SUPERADMIN'].includes(
    sessionRole.trim().toUpperCase()
  )
  const sortedOrderDeskBindings = useMemo(
    () =>
      [...orderDeskBindings].sort((left, right) => {
        const leftStatus = getOrderDeskBindingStatus(left)
        const rightStatus = getOrderDeskBindingStatus(right)
        const statusRank = { online: 0, offline: 1, never: 2, stale: 3 } as const
        const statusDelta = statusRank[leftStatus.key] - statusRank[rightStatus.key]
        if (statusDelta !== 0) return statusDelta
        const leftDate = new Date(getBindingReferenceDate(left) || 0).getTime()
        const rightDate = new Date(getBindingReferenceDate(right) || 0).getTime()
        return rightDate - leftDate
      }),
    [orderDeskBindings]
  )
  const cleanupEligibleOrderDeskBindings = useMemo(
    () => sortedOrderDeskBindings.filter((binding) => getOrderDeskBindingStatus(binding).canCleanup),
    [sortedOrderDeskBindings]
  )
  const orderDeskManualData = useMemo(() => {
    if (!orderDeskQr) return null
    const fromPayload = decodeOrderDeskPairingPayload(orderDeskQr.pairingPayload) || {}
    const apiBaseUrl = (fromPayload.apiBaseUrl || 'https://api.klarando.com').replace(/\/api\/?$/i, '')
    return {
      apiBaseUrl,
      tenantId: fromPayload.tenantId || orderDeskQr.tenantId,
      adminCode: fromPayload.adminCode || '',
      displayCode: fromPayload.displayCode || orderDeskQr.displayCode,
      pairingToken: fromPayload.pairingToken || orderDeskQr.pairingToken,
    }
  }, [orderDeskQr])

  async function copyManualValue(value: string, label: string) {
    if (!value.trim()) return
    try {
      await navigator.clipboard.writeText(value)
      setCopyState(`${label} kopiert`)
      window.setTimeout(() => setCopyState(''), 1800)
    } catch {
      setCopyState(`Kopieren fehlgeschlagen (${label})`)
      window.setTimeout(() => setCopyState(''), 2200)
    }
  }

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
      const response = await recreateOrderDeskDevicePairing(binding.id)
      setOrderDeskQr({
        ok: true,
        sessionId: response.sessionId,
        tenantId: binding.tenantId,
        displayId: binding.displayId,
        displayCode: binding.displayCode,
        deviceAlias: binding.deviceAlias || '',
        expiresAt: response.expiresAt,
        pairingToken: response.pairingToken,
        pairingPayload: response.pairingPayload,
        qrImageUrl: response.qrImageUrl,
      })
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

  function startEditingOrderDeskBinding(binding: OrderDeskDeviceBinding) {
    setEditingOrderDeskBindingId(binding.id)
    setEditingOrderDeskAlias(binding.deviceAlias || '')
    setError('')
    setSuccess('')
  }

  function cancelEditingOrderDeskBinding() {
    setEditingOrderDeskBindingId(null)
    setEditingOrderDeskAlias('')
  }

  async function handleSaveOrderDeskBindingAlias(binding: OrderDeskDeviceBinding) {
    try {
      setSavingOrderDeskAliasId(binding.id)
      setError('')
      setSuccess('')
      await updateOrderDeskDeviceBinding(binding.id, {
        deviceAlias: normalizeText(editingOrderDeskAlias),
      })
      await loadOrderDeskBindings()
      cancelEditingOrderDeskBinding()
      setSuccess('Geraetename gespeichert.')
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'Der Geraetename konnte nicht gespeichert werden.'
      )
    } finally {
      setSavingOrderDeskAliasId(null)
    }
  }

  async function handleResetOrderDeskBinding(binding: OrderDeskDeviceBinding) {
    if (
      !window.confirm(
        `Geraet ${binding.deviceAlias || binding.deviceSerial} wirklich trennen?`
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

  async function handleDeleteOrderDeskBinding(binding: OrderDeskDeviceBinding) {
    if (
      !window.confirm(
        `Geraet ${binding.deviceAlias || binding.deviceSerial} wirklich loeschen? Das Geraet muss danach neu gekoppelt werden.`
      )
    ) {
      return
    }

    try {
      setDeletingOrderDeskBindingId(binding.id)
      setError('')
      setSuccess('')
      await deleteOwnOrderDeskDeviceBinding(binding.id)
      await loadOrderDeskBindings()
      if (editingOrderDeskBindingId === binding.id) {
        cancelEditingOrderDeskBinding()
      }
      setSuccess('OrderDesk-Geraet wurde entfernt.')
    } catch (deleteError) {
      setError(
        deleteError instanceof Error
          ? deleteError.message
          : 'OrderDesk-Geraet konnte nicht geloescht werden'
      )
    } finally {
      setDeletingOrderDeskBindingId(null)
    }
  }

  async function handleCleanupOfflineOrderDeskBindings() {
    if (cleanupEligibleOrderDeskBindings.length === 0) {
      setSuccess('Keine veralteten Offline-Geraete zum Aufraeumen gefunden.')
      return
    }

    if (
      !window.confirm(
        `${cleanupEligibleOrderDeskBindings.length} veraltete Offline-Geraete wirklich loeschen?`
      )
    ) {
      return
    }

    try {
      setCleaningOrderDeskBindings(true)
      setError('')
      setSuccess('')
      for (const binding of cleanupEligibleOrderDeskBindings) {
        await deleteOwnOrderDeskDeviceBinding(binding.id)
      }
      await loadOrderDeskBindings()
      setSuccess(`${cleanupEligibleOrderDeskBindings.length} Offline-Geraete wurden entfernt.`)
    } catch (cleanupError) {
      setError(
        cleanupError instanceof Error
          ? cleanupError.message
          : 'Offline-Geraete konnten nicht geloescht werden'
      )
    } finally {
      setCleaningOrderDeskBindings(false)
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
              QR erzeugen, Geraete-Serien verwalten und eigene OrderDesk-Geraete pro Filiale sauber pflegen.
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
                  {orderDeskManualData ? (
                    <div className="mt-3 rounded-xl border border-slate-200 bg-slate-50 p-3 text-left">
                      <p className="text-xs font-semibold text-slate-900">Manuelle OrderDesk-Verbindung</p>
                      <p className="mt-1 text-[11px] text-slate-600">Diese Werte in der OrderDesk-App unter „Manuell verbinden“ eintragen.</p>
                      <div className="mt-2 space-y-2 text-xs">
                        {[
                          { label: 'API-URL', value: orderDeskManualData.apiBaseUrl },
                          { label: 'Tenant-ID', value: orderDeskManualData.tenantId },
                          { label: 'Admin-ID / Betriebscode', value: orderDeskManualData.adminCode },
                          { label: 'DisplayCode / Gerätename', value: orderDeskManualData.displayCode },
                          { label: 'PairingToken / manueller Gerätecode', value: orderDeskManualData.pairingToken },
                        ].map((entry) => (
                          <div key={entry.label} className="rounded-lg border border-slate-200 bg-white px-2 py-1.5">
                            <div className="flex items-center justify-between gap-2">
                              <p className="text-[11px] font-semibold text-slate-700">{entry.label}</p>
                              <button
                                type="button"
                                onClick={() => void copyManualValue(entry.value, entry.label)}
                                className="rounded border border-slate-300 px-1.5 py-0.5 text-[10px] text-slate-700 hover:bg-slate-100"
                              >
                                Kopieren
                              </button>
                            </div>
                            <p className="mt-1 break-all font-mono text-[11px] text-slate-900">{entry.value || '-'}</p>
                          </div>
                        ))}
                        {copyState ? <p className="text-[11px] text-emerald-700">{copyState}</p> : null}
                      </div>
                    </div>
                  ) : null}
                </div>
              ) : (
                <p className="text-xs text-rose-900/70">Noch kein QR erzeugt.</p>
              )}
            </div>
          </article>

          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
              <div>
                <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
                  Verbundene OrderDesk Geraete
                </h3>
                <p className="mt-1 text-xs text-rose-900/70">
                  Alias, verknuepftes Display, Status und Aufraeumaktionen pro Geraet.
                </p>
              </div>
              {canManageOrderDeskDevices ? (
                <button
                  type="button"
                  onClick={() => void handleCleanupOfflineOrderDeskBindings()}
                  disabled={
                    cleaningOrderDeskBindings || cleanupEligibleOrderDeskBindings.length === 0
                  }
                  className="rounded-lg border border-slate-300 px-3 py-2 text-xs font-semibold text-slate-700 transition hover:bg-slate-50 disabled:cursor-not-allowed disabled:opacity-60"
                >
                  {cleaningOrderDeskBindings
                    ? 'Raeumt auf...'
                    : `Offline-Geraete loeschen${
                        cleanupEligibleOrderDeskBindings.length > 0
                          ? ` (${cleanupEligibleOrderDeskBindings.length})`
                          : ''
                      }`}
                </button>
              ) : null}
            </div>
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
                      <th className="th-ui">Geraetename / Alias</th>
                      <th className="th-ui">Seriennummer</th>
                      <th className="th-ui">Verknuepftes Display</th>
                      <th className="th-ui">Status</th>
                      <th className="th-ui">Zuletzt online</th>
                      <th className="th-ui">Verbunden seit</th>
                      <th className="th-ui">Aktionen</th>
                    </tr>
                  </thead>
                  <tbody>
                    {sortedOrderDeskBindings.map((binding) => {
                      const status = getOrderDeskBindingStatus(binding)
                      const isEditing = editingOrderDeskBindingId === binding.id
                      return (
                      <tr key={binding.id}>
                        <td className="td-ui">
                          <div className="space-y-2 text-xs">
                            {isEditing ? (
                              <div className="space-y-2">
                                <input
                                  value={editingOrderDeskAlias}
                                  onChange={(event) => setEditingOrderDeskAlias(event.target.value)}
                                  placeholder="Geraetename / Alias"
                                  className="input-ui h-9"
                                />
                                <div className="flex flex-wrap gap-2">
                                  <button
                                    type="button"
                                    onClick={() => void handleSaveOrderDeskBindingAlias(binding)}
                                    disabled={savingOrderDeskAliasId === binding.id}
                                    className="rounded-lg border border-emerald-300 px-2 py-1 text-xs font-medium text-emerald-700 transition hover:bg-emerald-50 disabled:cursor-not-allowed disabled:opacity-60"
                                  >
                                    {savingOrderDeskAliasId === binding.id ? 'Speichert...' : 'Speichern'}
                                  </button>
                                  <button
                                    type="button"
                                    onClick={cancelEditingOrderDeskBinding}
                                    className="rounded-lg border border-slate-300 px-2 py-1 text-xs font-medium text-slate-700 transition hover:bg-slate-50"
                                  >
                                    Abbrechen
                                  </button>
                                </div>
                              </div>
                            ) : (
                              <p className="font-semibold text-slate-900">
                                {binding.deviceAlias || binding.deviceSerial || 'Ohne Alias'}
                              </p>
                            )}
                            <p className="text-rose-900/70">
                              {(binding.deviceModel || 'Unbekanntes Geraet')}
                              {' | '}
                              {(binding.devicePlatform || 'Plattform unbekannt')}
                              {' | '}
                              v{binding.appVersion || '-'}
                            </p>
                            <p className="text-[11px] text-rose-900/60">Binding-ID: {binding.id}</p>
                          </div>
                        </td>
                        <td className="td-ui font-mono text-xs">{binding.deviceSerial}</td>
                        <td className="td-ui text-xs">
                          <p className="font-medium text-slate-900">
                            {binding.display?.name || 'Kein Display verknuepft'}
                          </p>
                          <p className="text-rose-900/70">{binding.displayCode || '-'}</p>
                        </td>
                        <td className="td-ui">
                          <span
                            className={`rounded-lg px-2 py-1 text-xs font-semibold ${status.badgeClass}`}
                          >
                            {status.label}
                          </span>
                          <p className="mt-1 text-[11px] text-rose-900/70">{status.detail}</p>
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
                            {canManageOrderDeskDevices && !isEditing ? (
                              <button
                                type="button"
                                onClick={() => startEditingOrderDeskBinding(binding)}
                                className="rounded-lg border border-slate-300 px-2 py-1 text-xs font-medium text-slate-700 transition hover:bg-slate-50"
                              >
                                Alias bearbeiten
                              </button>
                            ) : null}
                            <button
                              type="button"
                              disabled={
                                !canManageOrderDeskDevices ||
                                recreatingOrderDeskBindingId === binding.id
                              }
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
                                !canManageOrderDeskDevices ||
                                resettingOrderDeskBindingId === binding.id
                              }
                              onClick={() => void handleResetOrderDeskBinding(binding)}
                              className="rounded-lg border border-red-300 px-2 py-1 text-xs font-medium text-red-700 transition hover:bg-red-50 disabled:cursor-not-allowed disabled:opacity-60"
                            >
                              {resettingOrderDeskBindingId === binding.id
                                ? 'Trennt...'
                                : 'Geraet trennen'}
                            </button>
                            <button
                              type="button"
                              disabled={
                                !canManageOrderDeskDevices || deletingOrderDeskBindingId === binding.id
                              }
                              onClick={() => void handleDeleteOrderDeskBinding(binding)}
                              className="rounded-lg border border-rose-300 px-2 py-1 text-xs font-medium text-rose-700 transition hover:bg-rose-50 disabled:cursor-not-allowed disabled:opacity-60"
                            >
                              {deletingOrderDeskBindingId === binding.id
                                ? 'Loescht...'
                                : 'Geraet loeschen'}
                            </button>
                          </div>
                        </td>
                      </tr>
                    )})}
                  </tbody>
                </table>
              )}
            </div>
            <p className="mt-2 text-xs text-rose-900/70">
              Statuslogik: Online innerhalb von {ORDERDESK_ONLINE_THRESHOLD_MINUTES} Minuten, veraltet nach {ORDERDESK_STALE_THRESHOLD_DAYS} Tagen ohne Verbindung.
            </p>
          </article>
        </div>
      </section>

      <div className="grid gap-6 xl:grid-cols-[430px_1fr]">
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <h2 className="text-xl font-semibold">
            {editingId ? 'Terminal bearbeiten' : 'Neues Terminal'}
          </h2>
          <p className="mt-1 text-sm text-rose-900/70">
            Terminal-Zuordnungen werden hier verwaltet. Die alte öffentliche Terminal-Route ist deaktiviert.
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
                Terminals und ihr Routing zu Kasse, Küche und Abholung.
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
                        <p className="mt-1 text-xs font-medium text-amber-700">
                          Öffentliche Terminal-Route deaktiviert. Bitte das zugeordnete Display-Routing verwenden.
                        </p>
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

