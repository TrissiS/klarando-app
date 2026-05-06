'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import { CheckField, ColorField, Field, MetricCard } from './fields'
import {
  STANDARD_ORDER_DISPLAY_PRESETS,
  normalizeHexColorInput,
  normalizeIdList,
  normalizeText,
  roleLabel,
  sortDisplays,
  sortModeLabel,
  type OrderDisplaySortMode,
} from './helpers'
import {
  createOrderDisplay,
  deleteOrderDisplay,
  getOrderDisplays,
  getOrderTerminals,
  updateOrderDisplay,
  type OrderDisplay,
  type OrderDisplayRole,
  type OrderTerminal,
} from '@/lib/api'

const DISPLAY_META_PREFIX = '@@klarando-display-meta:'

function parseDisplayNotes(raw: string | null | undefined) {
  if (!raw) {
    return {
      plainNotes: '',
      showDeliveryMapCard: true,
    }
  }

  const lines = raw.split('\n')
  const firstLine = lines[0]?.trim() || ''
  if (!firstLine.startsWith(DISPLAY_META_PREFIX)) {
    return {
      plainNotes: raw,
      showDeliveryMapCard: true,
    }
  }

  const encoded = firstLine.slice(DISPLAY_META_PREFIX.length).trim()
  try {
    const parsed = JSON.parse(encoded) as { showDeliveryMapCard?: boolean }
    return {
      plainNotes: lines.slice(1).join('\n').trim(),
      showDeliveryMapCard: parsed.showDeliveryMapCard !== false,
    }
  } catch {
    return {
      plainNotes: raw,
      showDeliveryMapCard: true,
    }
  }
}

function composeDisplayNotes(plainNotes: string, showDeliveryMapCard: boolean) {
  const normalized = normalizeText(plainNotes)
  if (showDeliveryMapCard) {
    return normalized
  }

  const metaLine = `${DISPLAY_META_PREFIX}${JSON.stringify({
    showDeliveryMapCard: false,
  })}`
  return normalized ? `${metaLine}\n${normalized}` : metaLine
}

export default function AdminOrderDisplaysPage() {
  const [displays, setDisplays] = useState<OrderDisplay[]>([])
  const [terminals, setTerminals] = useState<OrderTerminal[]>([])
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [presetting, setPresetting] = useState(false)
  const [deletingId, setDeletingId] = useState<string | null>(null)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const [editingId, setEditingId] = useState<string | null>(null)
  const [name, setName] = useState('')
  const [displayCode, setDisplayCode] = useState('')
  const [displayRole, setDisplayRole] = useState<OrderDisplayRole>('KITCHEN')
  const [location, setLocation] = useState('')
  const [isActive, setIsActive] = useState(true)
  const [refreshIntervalSec, setRefreshIntervalSec] = useState('10')
  const [sortMode, setSortMode] = useState<OrderDisplaySortMode>('PRIORITY_OLDEST')
  const [doneAutoHideSec, setDoneAutoHideSec] = useState('0')
  const [sourceTerminalIds, setSourceTerminalIds] = useState<string[]>([])
  const [announceOnMenuScreens, setAnnounceOnMenuScreens] = useState(true)
  const [menuAnnouncementDurationSec, setMenuAnnouncementDurationSec] = useState('45')
  const [displayBackgroundColor, setDisplayBackgroundColor] = useState('#020617')
  const [orderCardBackgroundColor, setOrderCardBackgroundColor] = useState('#0f172a')
  const [statusColorPendingPayment, setStatusColorPendingPayment] = useState('#ef4444')
  const [statusColorOpen, setStatusColorOpen] = useState('#f97316')
  const [statusColorPreparing, setStatusColorPreparing] = useState('#3b82f6')
  const [statusColorDone, setStatusColorDone] = useState('#16a34a')
  const [showOrderAge, setShowOrderAge] = useState(true)
  const [showTerminalInfo, setShowTerminalInfo] = useState(true)
  const [showPaymentInfo, setShowPaymentInfo] = useState(true)
  const [showTotal, setShowTotal] = useState(true)
  const [showItems, setShowItems] = useState(true)
  const [showStatusBadge, setShowStatusBadge] = useState(true)
  const [showPickupNumber, setShowPickupNumber] = useState(true)
  const [showOrderNumber, setShowOrderNumber] = useState(true)
  const [showDeliveryMapCard, setShowDeliveryMapCard] = useState(true)
  const [autoScaleLayout, setAutoScaleLayout] = useState(true)
  const [pickupShowOnlyNumber, setPickupShowOnlyNumber] = useState(false)
  const [pickupShowOpen, setPickupShowOpen] = useState(true)
  const [pickupShowPreparing, setPickupShowPreparing] = useState(true)
  const [pickupShowDone, setPickupShowDone] = useState(true)
  const [statusAnimationMode, setStatusAnimationMode] = useState<'NONE' | 'BLINK' | 'PULSE' | 'GLOW'>(
    'NONE'
  )
  const [statusAnimationDurationMs, setStatusAnimationDurationMs] = useState('2200')
  const [orderAgeFontSize, setOrderAgeFontSize] = useState('22')
  const [orderAgeAlertThresholdSec, setOrderAgeAlertThresholdSec] = useState('900')
  const [orderAgeAlertAnimationMode, setOrderAgeAlertAnimationMode] = useState<'NONE' | 'BLINK' | 'PULSE'>(
    'BLINK'
  )
  const [backgroundMediaMode, setBackgroundMediaMode] = useState<'NONE' | 'IMAGE' | 'VIDEO'>(
    'NONE'
  )
  const [backgroundMediaUrl, setBackgroundMediaUrl] = useState('')
  const [notes, setNotes] = useState('')

  const browserOrigin =
    typeof window !== 'undefined' ? window.location.origin : 'http://localhost:3000'

  const terminalNameById = useMemo(
    () => new Map(terminals.map((terminal) => [terminal.id, terminal.name])),
    [terminals]
  )
  const activeCount = useMemo(
    () => displays.filter((entry) => entry.isActive).length,
    [displays]
  )
  const cashCount = useMemo(
    () => displays.filter((entry) => entry.displayRole === 'CASH').length,
    [displays]
  )
  const kitchenCount = useMemo(
    () => displays.filter((entry) => entry.displayRole === 'KITCHEN').length,
    [displays]
  )
  const pickupCount = useMemo(
    () => displays.filter((entry) => entry.displayRole === 'PICKUP').length,
    [displays]
  )

  async function loadData() {
    try {
      setLoading(true)
      setError('')
      const [displayData, terminalData] = await Promise.all([
        getOrderDisplays(),
        getOrderTerminals(),
      ])
      setDisplays(sortDisplays(displayData))
      setTerminals(terminalData)
    } catch (loadError) {
      setError(
        loadError instanceof Error
          ? loadError.message
          : 'Bestell-Displays konnten nicht geladen werden'
      )
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadData()
  }, [])

  function resetForm() {
    setEditingId(null)
    setName('')
    setDisplayCode('')
    setDisplayRole('KITCHEN')
    setLocation('')
    setIsActive(true)
    setRefreshIntervalSec('10')
    setSortMode('PRIORITY_OLDEST')
    setDoneAutoHideSec('0')
    setSourceTerminalIds([])
    setAnnounceOnMenuScreens(true)
    setMenuAnnouncementDurationSec('45')
    setDisplayBackgroundColor('#020617')
    setOrderCardBackgroundColor('#0f172a')
    setStatusColorPendingPayment('#ef4444')
    setStatusColorOpen('#f97316')
    setStatusColorPreparing('#3b82f6')
    setStatusColorDone('#16a34a')
    setShowOrderAge(true)
    setShowTerminalInfo(true)
    setShowPaymentInfo(true)
    setShowTotal(true)
    setShowItems(true)
    setShowStatusBadge(true)
    setShowPickupNumber(true)
    setShowOrderNumber(true)
    setShowDeliveryMapCard(true)
    setAutoScaleLayout(true)
    setPickupShowOnlyNumber(false)
    setPickupShowOpen(true)
    setPickupShowPreparing(true)
    setPickupShowDone(true)
    setStatusAnimationMode('NONE')
    setStatusAnimationDurationMs('2200')
    setOrderAgeFontSize('22')
    setOrderAgeAlertThresholdSec('900')
    setOrderAgeAlertAnimationMode('BLINK')
    setBackgroundMediaMode('NONE')
    setBackgroundMediaUrl('')
    setNotes('')
  }

  function startEdit(display: OrderDisplay) {
    const parsedNotes = parseDisplayNotes(display.notes)
    setEditingId(display.id)
    setName(display.name)
    setDisplayCode(display.displayCode)
    setDisplayRole(display.displayRole)
    setLocation(display.location || '')
    setIsActive(display.isActive)
    setRefreshIntervalSec(String(display.refreshIntervalSec))
    setSortMode(
      (display.sortMode as OrderDisplaySortMode) ?? 'PRIORITY_OLDEST'
    )
    setDoneAutoHideSec(String(display.doneAutoHideSec ?? 0))
    setSourceTerminalIds(display.sourceTerminalIds || [])
    setAnnounceOnMenuScreens(display.announceOnMenuScreens)
    setMenuAnnouncementDurationSec(String(display.menuAnnouncementDurationSec))
    setDisplayBackgroundColor(display.displayBackgroundColor || '#020617')
    setOrderCardBackgroundColor(display.orderCardBackgroundColor || '#0f172a')
    setStatusColorPendingPayment(display.statusColorPendingPayment || '#ef4444')
    setStatusColorOpen(display.statusColorOpen || '#f97316')
    setStatusColorPreparing(display.statusColorPreparing || '#3b82f6')
    setStatusColorDone(display.statusColorDone || '#16a34a')
    setShowOrderAge(display.showOrderAge)
    setShowTerminalInfo(display.showTerminalInfo)
    setShowPaymentInfo(display.showPaymentInfo)
    setShowTotal(display.showTotal)
    setShowItems(display.showItems)
    setShowStatusBadge(display.showStatusBadge)
    setShowPickupNumber(display.showPickupNumber)
    setShowOrderNumber(display.showOrderNumber ?? true)
    setShowDeliveryMapCard(parsedNotes.showDeliveryMapCard)
    setAutoScaleLayout(display.autoScaleLayout ?? true)
    setPickupShowOnlyNumber(display.pickupShowOnlyNumber ?? false)
    setPickupShowOpen(display.pickupShowOpen)
    setPickupShowPreparing(display.pickupShowPreparing)
    setPickupShowDone(display.pickupShowDone)
    setStatusAnimationMode(
      (display.statusAnimationMode as 'NONE' | 'BLINK' | 'PULSE' | 'GLOW') ?? 'NONE'
    )
    setStatusAnimationDurationMs(String(display.statusAnimationDurationMs ?? 2200))
    setOrderAgeFontSize(String(display.orderAgeFontSize ?? 22))
    setOrderAgeAlertThresholdSec(String(display.orderAgeAlertThresholdSec ?? 900))
    setOrderAgeAlertAnimationMode(
      (display.orderAgeAlertAnimationMode as 'NONE' | 'BLINK' | 'PULSE') ?? 'BLINK'
    )
    setBackgroundMediaMode(
      (display.backgroundMediaMode as 'NONE' | 'IMAGE' | 'VIDEO') ?? 'NONE'
    )
    setBackgroundMediaUrl(display.backgroundMediaUrl || '')
    setNotes(parsedNotes.plainNotes)
    setError('')
    setSuccess('')
  }

  function toggleSourceTerminal(terminalId: string) {
    setSourceTerminalIds((current) =>
      current.includes(terminalId)
        ? current.filter((id) => id !== terminalId)
        : [...current, terminalId]
    )
  }

  async function handleSubmit(event: React.FormEvent) {
    event.preventDefault()

    const parsedRefresh = Number(refreshIntervalSec)
    if (!Number.isFinite(parsedRefresh) || parsedRefresh < 3 || parsedRefresh > 120) {
      setError('Aktualisierungsintervall muss zwischen 3 und 120 Sekunden liegen.')
      return
    }

    const parsedDuration = Number(menuAnnouncementDurationSec)
    if (!Number.isFinite(parsedDuration) || parsedDuration < 10 || parsedDuration > 600) {
      setError('Popup-Anzeigedauer muss zwischen 10 und 600 Sekunden liegen.')
      return
    }

    const parsedDoneHide = Number(doneAutoHideSec)
    if (!Number.isFinite(parsedDoneHide) || parsedDoneHide < 0 || parsedDoneHide > 3600) {
      setError('Auto-Ausblenden fuer fertige Bestellungen muss zwischen 0 und 3600 Sekunden liegen.')
      return
    }

    const parsedAnimationDuration = Number(statusAnimationDurationMs)
    if (
      !Number.isFinite(parsedAnimationDuration) ||
      parsedAnimationDuration < 500 ||
      parsedAnimationDuration > 12000
    ) {
      setError('Status-Animationsdauer muss zwischen 500 und 12000 ms liegen.')
      return
    }

    const parsedOrderAgeFontSize = Number(orderAgeFontSize)
    if (!Number.isFinite(parsedOrderAgeFontSize) || parsedOrderAgeFontSize < 12 || parsedOrderAgeFontSize > 72) {
      setError('Schriftgroesse fuer Laufzeit muss zwischen 12 und 72 liegen.')
      return
    }

    const parsedOrderAgeAlertThreshold = Number(orderAgeAlertThresholdSec)
    if (
      !Number.isFinite(parsedOrderAgeAlertThreshold) ||
      parsedOrderAgeAlertThreshold < 0 ||
      parsedOrderAgeAlertThreshold > 7200
    ) {
      setError('Laufzeit-Alarm muss zwischen 0 und 7200 Sekunden liegen.')
      return
    }

    if (backgroundMediaMode !== 'NONE' && !normalizeText(backgroundMediaUrl)) {
      setError('Bitte eine gueltige URL fuer Bild/Video angeben, wenn ein Medienhintergrund aktiv ist.')
      return
    }

    const normalizedDisplayBgColor = normalizeHexColorInput(displayBackgroundColor)
    const normalizedOrderCardBgColor = normalizeHexColorInput(orderCardBackgroundColor)
    const normalizedPendingColor = normalizeHexColorInput(statusColorPendingPayment)
    const normalizedOpenColor = normalizeHexColorInput(statusColorOpen)
    const normalizedPreparingColor = normalizeHexColorInput(statusColorPreparing)
    const normalizedDoneColor = normalizeHexColorInput(statusColorDone)
    if (
      !normalizedDisplayBgColor ||
      !normalizedOrderCardBgColor ||
      !normalizedPendingColor ||
      !normalizedOpenColor ||
      !normalizedPreparingColor ||
      !normalizedDoneColor
    ) {
      setError('Bitte nur gueltige Farben im Format #RRGGBB verwenden.')
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      if (editingId) {
        const updated = await updateOrderDisplay(editingId, {
          name,
          displayRole,
          location: normalizeText(location),
          isActive,
          refreshIntervalSec: parsedRefresh,
          sortMode,
          doneAutoHideSec: parsedDoneHide,
          sourceTerminalIds: normalizeIdList(sourceTerminalIds),
          announceOnMenuScreens,
          menuAnnouncementDurationSec: parsedDuration,
          displayBackgroundColor: normalizedDisplayBgColor,
          orderCardBackgroundColor: normalizedOrderCardBgColor,
          statusColorPendingPayment: normalizedPendingColor,
          statusColorOpen: normalizedOpenColor,
          statusColorPreparing: normalizedPreparingColor,
          statusColorDone: normalizedDoneColor,
          showOrderAge,
          showTerminalInfo,
          showPaymentInfo,
          showTotal,
          showItems,
          showStatusBadge,
          showPickupNumber,
          showOrderNumber,
          // Persisted via notes metadata to avoid schema migration in live setup.
          notes: composeDisplayNotes(notes, showDeliveryMapCard),
          autoScaleLayout,
          pickupShowOnlyNumber,
          pickupShowOpen,
          pickupShowPreparing,
          pickupShowDone,
          statusAnimationMode,
          statusAnimationDurationMs: parsedAnimationDuration,
          orderAgeFontSize: parsedOrderAgeFontSize,
          orderAgeAlertThresholdSec: parsedOrderAgeAlertThreshold,
          orderAgeAlertAnimationMode,
          backgroundMediaMode,
          backgroundMediaUrl: normalizeText(backgroundMediaUrl),
        })

        setDisplays((current) =>
          sortDisplays(current.map((entry) => (entry.id === updated.id ? updated : entry)))
        )
        setSuccess(`Bestell-Display "${updated.name}" aktualisiert.`)
      } else {
        const created = await createOrderDisplay({
          name,
          displayCode: normalizeText(displayCode) ?? undefined,
          displayRole,
          location: normalizeText(location),
          isActive,
          refreshIntervalSec: parsedRefresh,
          sortMode,
          doneAutoHideSec: parsedDoneHide,
          sourceTerminalIds: normalizeIdList(sourceTerminalIds),
          announceOnMenuScreens,
          menuAnnouncementDurationSec: parsedDuration,
          displayBackgroundColor: normalizedDisplayBgColor,
          orderCardBackgroundColor: normalizedOrderCardBgColor,
          statusColorPendingPayment: normalizedPendingColor,
          statusColorOpen: normalizedOpenColor,
          statusColorPreparing: normalizedPreparingColor,
          statusColorDone: normalizedDoneColor,
          showOrderAge,
          showTerminalInfo,
          showPaymentInfo,
          showTotal,
          showItems,
          showStatusBadge,
          showPickupNumber,
          showOrderNumber,
          notes: composeDisplayNotes(notes, showDeliveryMapCard),
          autoScaleLayout,
          pickupShowOnlyNumber,
          pickupShowOpen,
          pickupShowPreparing,
          pickupShowDone,
          statusAnimationMode,
          statusAnimationDurationMs: parsedAnimationDuration,
          orderAgeFontSize: parsedOrderAgeFontSize,
          orderAgeAlertThresholdSec: parsedOrderAgeAlertThreshold,
          orderAgeAlertAnimationMode,
          backgroundMediaMode,
          backgroundMediaUrl: normalizeText(backgroundMediaUrl),
        })

        setDisplays((current) => sortDisplays([...current, created]))
        setSuccess(`Bestell-Display "${created.name}" erstellt.`)
      }

      resetForm()
    } catch (submitError) {
      setError(
        submitError instanceof Error
          ? submitError.message
          : 'Bestell-Display konnte nicht gespeichert werden'
      )
    } finally {
      setSaving(false)
    }
  }

  async function createStandardDisplays() {
    const existingRoles = new Set(displays.map((display) => display.displayRole))
    const missing = STANDARD_ORDER_DISPLAY_PRESETS.filter(
      (preset) => !existingRoles.has(preset.displayRole)
    )
    if (missing.length === 0) {
      setSuccess('Standard-Setup ist bereits vorhanden (Kasse/Kueche/Abholung).')
      return
    }

    try {
      setPresetting(true)
      setError('')
      setSuccess('')
      const created = await Promise.all(
        missing.map((preset) =>
          createOrderDisplay({
            name: preset.name,
            displayRole: preset.displayRole,
            location: preset.location,
            refreshIntervalSec: preset.refreshIntervalSec,
            sortMode: preset.sortMode,
            doneAutoHideSec: preset.doneAutoHideSec,
            announceOnMenuScreens: preset.announceOnMenuScreens,
            menuAnnouncementDurationSec: preset.menuAnnouncementDurationSec,
            displayBackgroundColor: preset.displayBackgroundColor,
            orderCardBackgroundColor: preset.orderCardBackgroundColor,
            statusColorPendingPayment: preset.statusColorPendingPayment,
            statusColorOpen: preset.statusColorOpen,
            statusColorPreparing: preset.statusColorPreparing,
            statusColorDone: preset.statusColorDone,
            showOrderAge: preset.showOrderAge,
            showTerminalInfo: preset.showTerminalInfo,
            showPaymentInfo: preset.showPaymentInfo,
            showTotal: preset.showTotal,
            showItems: preset.showItems,
            showStatusBadge: preset.showStatusBadge,
            showPickupNumber: preset.showPickupNumber,
            showOrderNumber: preset.showOrderNumber,
            autoScaleLayout: preset.autoScaleLayout,
            pickupShowOnlyNumber: preset.pickupShowOnlyNumber,
            pickupShowOpen: preset.pickupShowOpen,
            pickupShowPreparing: preset.pickupShowPreparing,
            pickupShowDone: preset.pickupShowDone,
            statusAnimationMode: preset.statusAnimationMode,
            statusAnimationDurationMs: preset.statusAnimationDurationMs,
            orderAgeFontSize: preset.orderAgeFontSize,
            orderAgeAlertThresholdSec: preset.orderAgeAlertThresholdSec,
            orderAgeAlertAnimationMode: preset.orderAgeAlertAnimationMode,
            backgroundMediaMode: preset.backgroundMediaMode,
            backgroundMediaUrl: preset.backgroundMediaUrl,
            notes: preset.notes,
          })
        )
      )

      setDisplays((current) => sortDisplays([...current, ...created]))
      setSuccess(
        `Standard-Displays erstellt: ${created
          .map((display) => roleLabel(display.displayRole))
          .join(', ')}`
      )
    } catch (presetError) {
      setError(
        presetError instanceof Error
          ? presetError.message
          : 'Standard-Displays konnten nicht erstellt werden'
      )
    } finally {
      setPresetting(false)
    }
  }

  async function handleDelete(display: OrderDisplay) {
    if (!window.confirm(`Bestell-Display "${display.name}" wirklich loeschen?`)) {
      return
    }

    try {
      setDeletingId(display.id)
      setError('')
      setSuccess('')
      await deleteOrderDisplay(display.id)

      setDisplays((current) => current.filter((entry) => entry.id !== display.id))
      if (editingId === display.id) {
        resetForm()
      }
      setSuccess(`Bestell-Display "${display.name}" geloescht.`)
    } catch (deleteError) {
      setError(
        deleteError instanceof Error
          ? deleteError.message
          : 'Bestell-Display konnte nicht geloescht werden'
      )
    } finally {
      setDeletingId(null)
    }
  }

  return (
    <AdminLayout
      title="Bestell-Displays"
      subtitle="Rollenbasierte Displays fuer Kasse, Kueche und Abholung inkl. Popup-Ansage auf Produktbildschirmen"
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

      <div className="mb-6 grid gap-4 md:grid-cols-5">
        <MetricCard label="Displays gesamt" value={String(displays.length)} />
        <MetricCard label="Aktive Displays" value={String(activeCount)} />
        <MetricCard label="Kasse" value={String(cashCount)} />
        <MetricCard label="Kueche" value={String(kitchenCount)} />
        <MetricCard label="Abholung" value={String(pickupCount)} />
      </div>

      <div className="mb-6 flex flex-wrap justify-end gap-2">
        <button
          type="button"
          onClick={() => void createStandardDisplays()}
          disabled={presetting || saving}
          className="rounded-xl bg-orange-600 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-orange-700 disabled:cursor-not-allowed disabled:opacity-60"
        >
          {presetting ? 'Erstellt Standard-Setup...' : 'Standard-Setup erstellen'}
        </button>
      </div>

      <div className="grid gap-6 xl:grid-cols-[450px_1fr]">
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <h2 className="text-xl font-semibold">
            {editingId ? 'Display bearbeiten' : 'Neues Display'}
          </h2>
          <p className="mt-1 text-sm text-rose-900/70">
            Je Display kann eine Rolle, ein Terminal-Filter und eine Popup-Logik gesetzt werden.
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

            <Field label="Display-Code (optional bei Neuanlage)">
              <input
                value={displayCode}
                onChange={(event) => setDisplayCode(event.target.value)}
                disabled={Boolean(editingId)}
                className="input-ui disabled:cursor-not-allowed disabled:bg-rose-50"
              />
            </Field>

            <Field label="Display-Rolle">
              <select
                value={displayRole}
                onChange={(event) => setDisplayRole(event.target.value as OrderDisplayRole)}
                className="input-ui"
              >
                <option value="CASH">Kassen-Display</option>
                <option value="KITCHEN">Kuechen-Display</option>
                <option value="PICKUP">Abhol-Display</option>
              </select>
            </Field>

            <Field label="Standort">
              <input
                value={location}
                onChange={(event) => setLocation(event.target.value)}
                className="input-ui"
              />
            </Field>

            <Field label="Sortierung im Display">
              <select
                value={sortMode}
                onChange={(event) =>
                  setSortMode(
                    event.target.value as
                      | 'PRIORITY_OLDEST'
                      | 'PRIORITY_NEWEST'
                      | 'DONE_FIRST_OPEN_LAST'
                  )
                }
                className="input-ui"
              >
                <option value="PRIORITY_OLDEST">Status-Prioritaet + aelteste zuerst</option>
                <option value="PRIORITY_NEWEST">Status-Prioritaet + neueste zuerst</option>
                <option value="DONE_FIRST_OPEN_LAST">Fertige oben, offene unten</option>
              </select>
            </Field>

            <Field label="Fertige Bestellungen automatisch ausblenden (Sekunden, 0 = nie)">
              <input
                type="number"
                min={0}
                max={3600}
                value={doneAutoHideSec}
                onChange={(event) => setDoneAutoHideSec(event.target.value)}
                className="input-ui"
              />
            </Field>

            <div className="space-y-2 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <CheckField checked={isActive} onChange={setIsActive} label="Display aktiv" />
            </div>

            <fieldset className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <legend className="px-1 text-sm font-semibold text-rose-900/85">
                Quell-Terminals (optional)
              </legend>
              <p className="mb-2 text-xs text-rose-900/70">
                Wenn nichts markiert ist, sieht das Display Bestellungen von allen Terminals.
              </p>
              <div className="max-h-36 space-y-1 overflow-auto pr-1">
                {terminals.length === 0 ? (
                  <p className="text-xs text-rose-900/70">Keine Terminals vorhanden.</p>
                ) : (
                  terminals.map((terminal) => (
                    <label
                      key={terminal.id}
                      className="flex items-center gap-2 text-sm text-rose-900/85"
                    >
                      <input
                        type="checkbox"
                        checked={sourceTerminalIds.includes(terminal.id)}
                        onChange={() => toggleSourceTerminal(terminal.id)}
                      />
                      <span>
                        {terminal.name} ({terminal.terminalCode})
                      </span>
                    </label>
                  ))
                )}
              </div>
            </fieldset>

            <fieldset className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <legend className="px-1 text-sm font-semibold text-rose-900/85">
                Abhol-Popup auf Produktbildschirm
              </legend>
              <p className="mb-2 text-xs text-rose-900/70">
                Relevant fuer Abhol-Displays. Bei anderen Rollen wird diese Einstellung ignoriert.
              </p>
              <CheckField
                checked={announceOnMenuScreens}
                onChange={setAnnounceOnMenuScreens}
                label="Abholnummer als Popup auf Produktbildschirmen anzeigen"
              />
              <Field label="Anzeigedauer (Sekunden)">
                <input
                  type="number"
                  min={10}
                  max={600}
                  value={menuAnnouncementDurationSec}
                  onChange={(event) => setMenuAnnouncementDurationSec(event.target.value)}
                  className="input-ui"
                />
              </Field>
            </fieldset>

            <fieldset className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <legend className="px-1 text-sm font-semibold text-rose-900/85">
                Sichtbare Informationen im Display
              </legend>
              <div className="grid gap-2 md:grid-cols-2">
                <CheckField
                  checked={showOrderAge}
                  onChange={setShowOrderAge}
                  label="Laufzeit/Restlaufzeit (Countdown) anzeigen"
                />
                <CheckField
                  checked={showTerminalInfo}
                  onChange={setShowTerminalInfo}
                  label="Terminal-Info anzeigen"
                />
                <CheckField
                  checked={showPaymentInfo}
                  onChange={setShowPaymentInfo}
                  label="Zahlungsart anzeigen"
                />
                <CheckField checked={showTotal} onChange={setShowTotal} label="Gesamtpreis anzeigen" />
                <CheckField checked={showItems} onChange={setShowItems} label="Positionen anzeigen" />
                <CheckField
                  checked={showStatusBadge}
                  onChange={setShowStatusBadge}
                  label="Status-Badge anzeigen"
                />
                <CheckField
                  checked={showPickupNumber}
                  onChange={setShowPickupNumber}
                  label="Abholnummer anzeigen"
                />
                <CheckField
                  checked={showOrderNumber}
                  onChange={setShowOrderNumber}
                  label="Bestellnummer anzeigen"
                />
                <CheckField
                  checked={showDeliveryMapCard}
                  onChange={setShowDeliveryMapCard}
                  label="Lieferkarte im Annahme-Popup anzeigen (nur Kasse)"
                />
                <CheckField
                  checked={autoScaleLayout}
                  onChange={setAutoScaleLayout}
                  label="Auto-Scale fuer verschiedene Bildschirmgroessen"
                />
                <CheckField
                  checked={pickupShowOnlyNumber}
                  onChange={setPickupShowOnlyNumber}
                  label="Abhol-Display: nur Abholnummer gross anzeigen"
                />
              </div>
            </fieldset>

            <fieldset className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <legend className="px-1 text-sm font-semibold text-rose-900/85">
                Animationen & Laufzeit-Alarm
              </legend>
              <div className="grid gap-3 md:grid-cols-2">
                <Field label="Status-Animation">
                  <select
                    value={statusAnimationMode}
                    onChange={(event) =>
                      setStatusAnimationMode(
                        event.target.value as 'NONE' | 'BLINK' | 'PULSE' | 'GLOW'
                      )
                    }
                    className="input-ui"
                  >
                    <option value="NONE">Keine</option>
                    <option value="BLINK">Blinken</option>
                    <option value="PULSE">Pulsieren</option>
                    <option value="GLOW">Leuchteffekt</option>
                  </select>
                </Field>
                <Field label="Animationsdauer (ms)">
                  <input
                    type="number"
                    min={500}
                    max={12000}
                    value={statusAnimationDurationMs}
                    onChange={(event) => setStatusAnimationDurationMs(event.target.value)}
                    className="input-ui"
                  />
                </Field>
                <Field label="Laufzeit Schriftgroesse (px)">
                  <input
                    type="number"
                    min={12}
                    max={72}
                    value={orderAgeFontSize}
                    onChange={(event) => setOrderAgeFontSize(event.target.value)}
                    className="input-ui"
                  />
                </Field>
                <Field label="Alarm ab Laufzeit (Sek.)">
                  <input
                    type="number"
                    min={0}
                    max={7200}
                    value={orderAgeAlertThresholdSec}
                    onChange={(event) => setOrderAgeAlertThresholdSec(event.target.value)}
                    className="input-ui"
                  />
                </Field>
                <Field label="Alarm-Animation">
                  <select
                    value={orderAgeAlertAnimationMode}
                    onChange={(event) =>
                      setOrderAgeAlertAnimationMode(
                        event.target.value as 'NONE' | 'BLINK' | 'PULSE'
                      )
                    }
                    className="input-ui"
                  >
                    <option value="NONE">Keine</option>
                    <option value="BLINK">Blinken</option>
                    <option value="PULSE">Pulsieren</option>
                  </select>
                </Field>
              </div>
            </fieldset>

            <fieldset className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <legend className="px-1 text-sm font-semibold text-rose-900/85">
                Farben fuer Darstellung
              </legend>
              <p className="mb-2 text-xs text-rose-900/70">
                Hintergrundfarbe und Statusfarben fuer die Bestellkarten im Display.
              </p>
              <div className="grid gap-3 md:grid-cols-2">
                <ColorField
                  label="Display-Hintergrund"
                  value={displayBackgroundColor}
                  onChange={setDisplayBackgroundColor}
                />
                <ColorField
                  label="Bestellkarten-Hintergrund"
                  value={orderCardBackgroundColor}
                  onChange={setOrderCardBackgroundColor}
                />
                <ColorField
                  label="Status: Neu (unbezahlt)"
                  value={statusColorPendingPayment}
                  onChange={setStatusColorPendingPayment}
                />
                <ColorField
                  label="Status: Offen"
                  value={statusColorOpen}
                  onChange={setStatusColorOpen}
                />
                <ColorField
                  label="Status: In Arbeit"
                  value={statusColorPreparing}
                  onChange={setStatusColorPreparing}
                />
                <ColorField
                  label="Status: Fertig"
                  value={statusColorDone}
                  onChange={setStatusColorDone}
                />
              </div>
            </fieldset>

            <fieldset className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <legend className="px-1 text-sm font-semibold text-rose-900/85">
                Hintergrund-Medien
              </legend>
              <p className="mb-2 text-xs text-rose-900/70">
                Optional Bild oder Video als Hintergrund fuer das jeweilige Bestell-Display.
              </p>
              <div className="grid gap-3 md:grid-cols-2">
                <Field label="Hintergrundmodus">
                  <select
                    value={backgroundMediaMode}
                    onChange={(event) =>
                      setBackgroundMediaMode(event.target.value as 'NONE' | 'IMAGE' | 'VIDEO')
                    }
                    className="input-ui"
                  >
                    <option value="NONE">Nur Farbe</option>
                    <option value="IMAGE">Bild</option>
                    <option value="VIDEO">Video</option>
                  </select>
                </Field>
                <Field label="Medien-URL (bei Bild/Video)">
                  <input
                    value={backgroundMediaUrl}
                    onChange={(event) => setBackgroundMediaUrl(event.target.value)}
                    placeholder="https://.../media.mp4"
                    className="input-ui"
                  />
                </Field>
              </div>
            </fieldset>

            <fieldset className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <legend className="px-1 text-sm font-semibold text-rose-900/85">
                Abhol-Display: welche Status sollen erscheinen
              </legend>
              <p className="mb-2 text-xs text-rose-900/70">
                Damit kannst du steuern, ob offene Bestellungen direkt auf dem Abhol-Display sichtbar sind.
              </p>
              <div className="grid gap-2 md:grid-cols-2">
                <CheckField
                  checked={pickupShowOpen}
                  onChange={setPickupShowOpen}
                  label="Status Offen anzeigen"
                />
                <CheckField
                  checked={pickupShowPreparing}
                  onChange={setPickupShowPreparing}
                  label="Status In Arbeit anzeigen"
                />
                <CheckField
                  checked={pickupShowDone}
                  onChange={setPickupShowDone}
                  label="Status Fertig anzeigen"
                />
              </div>
            </fieldset>

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
                ? 'Display aktualisieren'
                : 'Display speichern'}
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
              <h2 className="text-xl font-semibold">Display-Liste</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Jedes Display hat einen eigenen Link und eine klar definierte Rolle.
              </p>
            </div>
          </div>

          <div className="mt-4 space-y-3">
            {loading ? (
              <p className="text-sm text-rose-900/70">Lade Displays...</p>
            ) : displays.length === 0 ? (
              <p className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                Noch keine Bestell-Displays vorhanden.
              </p>
            ) : (
              displays.map((display) => {
                const displayUrl = `${browserOrigin}/order-display/${display.displayCode}`
                const parsedNotes = parseDisplayNotes(display.notes)
                const sourceTerminalNames = display.sourceTerminalIds
                  .map((id) => terminalNameById.get(id))
                  .filter((value): value is string => Boolean(value))

                return (
                  <article
                    key={display.id}
                    className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-4"
                  >
                    <div className="flex flex-wrap items-start justify-between gap-3">
                      <div>
                        <p className="text-base font-semibold text-[var(--brand-ink)]">{display.name}</p>
                        <p className="text-xs text-rose-900/75">
                          Rolle: {roleLabel(display.displayRole)} | Code: {display.displayCode}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          {display.isActive ? 'Aktiv' : 'Inaktiv'} | Standort:{' '}
                          {display.location || '-'}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Quelle:{' '}
                          {sourceTerminalNames.length > 0
                            ? sourceTerminalNames.join(', ')
                            : 'Alle Terminals'}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Popup auf Produktbildschirm:{' '}
                          {display.announceOnMenuScreens ? 'Aktiv' : 'Inaktiv'} (
                          {display.menuAnnouncementDurationSec}s)
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Anzeige: {display.showOrderAge ? 'Laufzeit/Countdown' : '-'}, {' '}
                          {display.showTerminalInfo ? 'Terminal' : '-'}, {' '}
                          {display.showPaymentInfo ? 'Zahlung' : '-'}, {' '}
                          {display.showTotal ? 'Gesamt' : '-'}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Lieferkarte im Annahme-Popup:{' '}
                          {parsedNotes.showDeliveryMapCard ? 'Aktiv' : 'Inaktiv'}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Nummern: {display.showOrderNumber ? 'Bestellnr' : '-'} /{' '}
                          {display.showPickupNumber ? 'Abholnr' : '-'}{' '}
                          {display.pickupShowOnlyNumber ? '(nur Abholnummer-Modus aktiv)' : ''}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Sortierung: {sortModeLabel(display.sortMode)} | Fertig ausblenden nach:{' '}
                          {display.doneAutoHideSec > 0 ? `${display.doneAutoHideSec}s` : 'deaktiviert'}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Layout: {display.autoScaleLayout ? 'Auto-Scale aktiv' : 'Auto-Scale inaktiv'}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Animation: {display.statusAnimationMode} ({display.statusAnimationDurationMs}ms) | Laufzeit
                          {` ${display.orderAgeFontSize}px`} | Alarm ab {display.orderAgeAlertThresholdSec}s (
                          {display.orderAgeAlertAnimationMode})
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Medienhintergrund: {display.backgroundMediaMode}{' '}
                          {display.backgroundMediaUrl ? `| ${display.backgroundMediaUrl}` : ''}
                        </p>
                        <p className="mt-1 text-xs text-rose-900/75">
                          Farben: BG {display.displayBackgroundColor}, Karte{' '}
                          {display.orderCardBackgroundColor}, Offen {display.statusColorOpen}, Fertig{' '}
                          {display.statusColorDone}
                        </p>
                        {display.displayRole === 'PICKUP' ? (
                          <p className="mt-1 text-xs text-rose-900/75">
                            Pickup-Status: {display.pickupShowOpen ? 'Offen ' : ''}
                            {display.pickupShowPreparing ? 'In Arbeit ' : ''}
                            {display.pickupShowDone ? 'Fertig' : ''}
                          </p>
                        ) : null}
                        <a
                          href={displayUrl}
                          target="_blank"
                          rel="noreferrer"
                          className="mt-1 inline-block text-xs font-medium text-orange-600 underline"
                        >
                          {displayUrl}
                        </a>
                      </div>

                      <div className="flex gap-2">
                        <button
                          type="button"
                          onClick={() => startEdit(display)}
                          className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-slate-800"
                        >
                          Bearbeiten
                        </button>
                        <button
                          type="button"
                          disabled={deletingId === display.id}
                          onClick={() => void handleDelete(display)}
                          className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-red-700 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {deletingId === display.id ? 'Loescht...' : 'Loeschen'}
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

