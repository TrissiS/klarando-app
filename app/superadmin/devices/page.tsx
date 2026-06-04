'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createPublicDriverDeviceSession,
  deactivateOrderDeskDeviceBinding,
  deleteDisplayDevice,
  deleteOrderDeskDeviceBinding,
  deleteOrderDisplayForScope,
  deleteScreenDeviceForScope,
  getAccessContext,
  getDisplayDeviceOverview,
  getDriverDeviceOverview,
  getOrderDeskDeviceBindingsForScope,
  getOrderTerminalsForTenant,
  regenerateDisplayPairingCode,
  resetOrderDeskDevicePairing,
  updateDisplayDeviceActiveState,
  type AccessContext,
  type DisplayDeviceOverviewRow,
  type DriverDeviceOverviewRow,
  type DriverDeviceSessionCreateResponse,
  type OrderDeskDeviceBinding,
  type OrderTerminal,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type DeviceTab = 'ALL' | 'DISPLAYS' | 'ORDERDESK' | 'DRIVERS' | 'TERMINALS' | 'OFFLINE'
type StatusKind = 'online' | 'instabil' | 'offline' | 'inactive' | 'unknown'

type TerminalOverviewRow = OrderTerminal & {
  tenantName: string | null
  chainId: string | null
  chainName: string | null
}

type EnrichedOrderDeskBinding = OrderDeskDeviceBinding & {
  tenantName: string | null
  chainName: string | null
}

type DetailState =
  | { kind: 'display'; row: DisplayDeviceOverviewRow }
  | { kind: 'orderdesk'; row: EnrichedOrderDeskBinding }
  | { kind: 'driver'; row: DriverDeviceOverviewRow }
  | { kind: 'terminal'; row: TerminalOverviewRow }
  | null

type PairingState = {
  title: string
  qrImageUrl: string
  expiresAt: string
  payload: string
  token?: string | null
} | null

function normalizedStatus(lastSeenAt: string | null, isActive = true): StatusKind {
  if (!isActive) return 'inactive'
  if (!lastSeenAt) return 'offline'
  const diffSec = Math.max(0, Math.floor((Date.now() - new Date(lastSeenAt).getTime()) / 1000))
  if (diffSec < 30) return 'online'
  if (diffSec <= 120) return 'instabil'
  return 'offline'
}

function statusLabel(status: StatusKind) {
  if (status === 'online') return 'Online'
  if (status === 'instabil') return 'Instabil'
  if (status === 'inactive') return 'Deaktiviert'
  if (status === 'unknown') return 'Keine Live-Quelle'
  return 'Offline'
}

function statusClass(status: StatusKind) {
  if (status === 'online') return 'border-emerald-200 bg-emerald-100 text-emerald-800'
  if (status === 'instabil') return 'border-amber-200 bg-amber-100 text-amber-800'
  if (status === 'inactive') return 'border-slate-200 bg-slate-100 text-slate-700'
  if (status === 'unknown') return 'border-sky-200 bg-sky-100 text-sky-800'
  return 'border-rose-200 bg-rose-100 text-rose-800'
}

function fmt(value: string | null) {
  if (!value) return '—'
  return new Date(value).toLocaleString('de-DE')
}

function isCanonicalScreenPreviewPath(path: string | null | undefined) {
  return typeof path === 'string' && path.startsWith('/screen/')
}

function isOperationalDisplay(row: DisplayDeviceOverviewRow) {
  return row.sourceKind === 'ORDER_DISPLAY' || row.displayType === 'KITCHEN' || row.displayType === 'PICKUP_NUMBERS'
}

function displayTypeLabel(row: DisplayDeviceOverviewRow) {
  if (row.sourceKind === 'ORDER_DISPLAY') {
    if (row.displayType === 'KITCHEN') return 'Kitchen Display'
    if (row.displayType === 'PICKUP_NUMBERS') return 'Pickup Display'
    return 'Cashier Display'
  }
  if (row.displayType === 'MENU') return 'Menübildschirm'
  if (row.displayType === 'OFFERS') return 'Aktionsbildschirm'
  if (row.displayType === 'ADVERTISING') return 'Werbebildschirm'
  return 'Display'
}

function sourceLabel(row: DisplayDeviceOverviewRow) {
  if (row.sourceKind === 'ORDER_DISPLAY') return 'Order Display'
  if (row.sourceKind === 'SCREEN_DEVICE') return 'Screen Device'
  return 'Display Device Legacy'
}

function matchesSearch(parts: Array<string | null | undefined>, search: string) {
  if (!search.trim()) return true
  return parts.filter(Boolean).join(' ').toLowerCase().includes(search.trim().toLowerCase())
}

export default function SuperadminDevicesPage() {
  const [token, setToken] = useState('')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [tab, setTab] = useState<DeviceTab>('ALL')
  const [tenantId, setTenantId] = useState('')
  const [chainId, setChainId] = useState('')
  const [search, setSearch] = useState('')
  const [displayRows, setDisplayRows] = useState<DisplayDeviceOverviewRow[]>([])
  const [orderdeskRows, setOrderdeskRows] = useState<OrderDeskDeviceBinding[]>([])
  const [driverRows, setDriverRows] = useState<DriverDeviceOverviewRow[]>([])
  const [terminalRows, setTerminalRows] = useState<TerminalOverviewRow[]>([])
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')
  const [copyInfo, setCopyInfo] = useState('')
  const [busyRef, setBusyRef] = useState<string | null>(null)
  const [detail, setDetail] = useState<DetailState>(null)
  const [pairing, setPairing] = useState<PairingState>(null)
  const [driverPairingDisplayCode, setDriverPairingDisplayCode] = useState('')

  async function copyValue(value: string, label: string) {
    try {
      await navigator.clipboard.writeText(value)
      setCopyInfo(`${label} kopiert`)
      window.setTimeout(() => setCopyInfo(''), 1800)
    } catch {
      setCopyInfo(`Kopieren fehlgeschlagen (${label})`)
      window.setTimeout(() => setCopyInfo(''), 1800)
    }
  }

  useEffect(() => {
    let parsed: SessionUser | null = null
    try {
      const raw = localStorage.getItem('sessionUser')
      parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    } catch {
      parsed = null
    }
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    if (!token) return
    void (async () => {
      try {
        setContext(await getAccessContext(token))
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Kontext konnte nicht geladen werden')
      }
    })()
  }, [token])

  const tenantNameById = useMemo(() => new Map((context?.tenants || []).map((entry) => [entry.id, entry.name])), [context])
  const tenantChainById = useMemo(() => new Map((context?.tenants || []).map((entry) => [entry.id, entry.chainId || null])), [context])
  const chainNameById = useMemo(() => new Map((context?.chains || []).map((entry) => [entry.id, entry.name])), [context])

  useEffect(() => {
    if (!token || !context) return
    void loadData()
  }, [token, context, tenantId, chainId])

  useEffect(() => {
    if (driverPairingDisplayCode) return
    const firstDisplayCode = displayRows.find((row) => isCanonicalScreenPreviewPath(row.previewPath))?.code || ''
    if (firstDisplayCode) setDriverPairingDisplayCode(firstDisplayCode)
  }, [displayRows, driverPairingDisplayCode])

  async function loadData() {
    if (!context) return
    try {
      setLoading(true)
      setError('')
      const visibleTenants = context.tenants.filter((entry) => (!chainId || entry.chainId === chainId) && (!tenantId || entry.id === tenantId))
      const visibleTenantIds = visibleTenants.map((entry) => entry.id)
      const [displayOverview, orderdeskOverview, driverOverview, terminalMatrix] = await Promise.all([
        getDisplayDeviceOverview(token, {
          tenantId: tenantId || undefined,
          chainId: tenantId ? undefined : chainId || undefined,
          status: 'all',
        }),
        getOrderDeskDeviceBindingsForScope(token, {
          tenantId: tenantId || undefined,
          includeInactive: true,
        }),
        getDriverDeviceOverview(token, {
          tenantId: tenantId || undefined,
          chainId: tenantId ? undefined : chainId || undefined,
        }),
        visibleTenantIds.length > 0
          ? Promise.all(
              visibleTenantIds.map(async (currentTenantId) => {
                const rows = await getOrderTerminalsForTenant(token, currentTenantId)
                return rows.map((row) => ({
                  ...row,
                  tenantName: tenantNameById.get(currentTenantId) || null,
                  chainId: tenantChainById.get(currentTenantId) || null,
                  chainName: chainNameById.get(tenantChainById.get(currentTenantId) || '') || null,
                }))
              })
            )
          : Promise.resolve([]),
      ])
      const allowedTenantIds = new Set(visibleTenantIds)
      setDisplayRows(displayOverview.rows)
      setOrderdeskRows(orderdeskOverview.bindings.filter((row) => allowedTenantIds.has(row.tenantId)))
      setDriverRows(driverOverview.rows.filter((row) => allowedTenantIds.has(row.tenantId)))
      setTerminalRows(terminalMatrix.flat())
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Geräte konnten nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  const orderdesk = useMemo<EnrichedOrderDeskBinding[]>(() => orderdeskRows.map((row) => ({
    ...row,
    tenantName: tenantNameById.get(row.tenantId) || null,
    chainName: chainNameById.get(tenantChainById.get(row.tenantId) || '') || null,
  })), [orderdeskRows, tenantNameById, chainNameById, tenantChainById])

  const displayFiltered = useMemo(() => displayRows.filter((row) => matchesSearch([
    row.name, row.code, row.tenantName, row.chainName, row.displayType, displayTypeLabel(row), sourceLabel(row),
  ], search)), [displayRows, search])

  const orderdeskFiltered = useMemo(() => orderdesk.filter((row) => matchesSearch([
    row.deviceAlias, row.deviceSerial, row.displayCode, row.tenantName, row.chainName, row.devicePlatform,
  ], search)), [orderdesk, search])

  const driverFiltered = useMemo(() => driverRows.filter((row) => matchesSearch([
    row.deviceLabel, row.displayCode, row.driverName, row.tenantName, row.chainName,
  ], search)), [driverRows, search])

  const terminalFiltered = useMemo(() => terminalRows.filter((row) => matchesSearch([
    row.name, row.terminalCode, row.location, row.tenantName, row.chainName,
    row.cashDisplay?.displayCode || null, row.kitchenDisplay?.displayCode || null, row.pickupDisplay?.displayCode || null,
  ], search)), [terminalRows, search])

  const summary = useMemo(() => {
    const statuses = [
      ...displayRows.map((row) => normalizedStatus(row.lastSeenAt, row.isActive)),
      ...orderdesk.map((row) => normalizedStatus(row.lastSeenAt, row.isActive)),
      ...driverRows.map((row) => normalizedStatus(row.lastHeartbeatAt, row.isActive)),
    ]
    return {
      total: statuses.length + terminalRows.length,
      online: statuses.filter((entry) => entry === 'online').length,
      unstable: statuses.filter((entry) => entry === 'instabil').length,
      offline: statuses.filter((entry) => entry === 'offline').length,
      inactive: statuses.filter((entry) => entry === 'inactive').length,
      terminals: terminalRows.length,
    }
  }, [displayRows, orderdesk, driverRows, terminalRows])

  const offlineOnly = tab === 'OFFLINE'
  const menuDisplays = displayFiltered.filter((row) => !isOperationalDisplay(row) && (!offlineOnly || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online'))
  const operationalDisplays = displayFiltered.filter((row) => isOperationalDisplay(row) && (!offlineOnly || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online'))
  const visibleOrderdesk = orderdeskFiltered.filter((row) => !offlineOnly || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online')
  const visibleDrivers = driverFiltered.filter((row) => !offlineOnly || normalizedStatus(row.lastHeartbeatAt, row.isActive) !== 'online')

  async function handleDisplayPreview(row: DisplayDeviceOverviewRow) {
    if (!isCanonicalScreenPreviewPath(row.previewPath)) {
      setError('Für dieses Display ist nur eine Legacy-Vorschau vorhanden. Moderne Menübildschirme laufen ausschließlich über /screen/[deviceCode].')
      return
    }
    const origin = typeof window !== 'undefined' ? window.location.origin : ''
    window.open(`${origin}${row.previewPath}`, '_blank', 'noopener,noreferrer')
  }

  async function handleDisplayToggle(row: DisplayDeviceOverviewRow) {
    if (row.sourceKind === 'DISPLAY_DEVICE') {
      setInfo('Legacy-Display-Geräte können hier nicht zentral aktiviert oder deaktiviert werden.')
      return
    }
    try {
      setBusyRef(row.id)
      setError('')
      await updateDisplayDeviceActiveState(token, row.id, !row.isActive)
      await loadData()
      setInfo(row.isActive ? 'Display wurde deaktiviert.' : 'Display wurde aktiviert.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Display-Status konnte nicht geändert werden')
    } finally {
      setBusyRef(null)
    }
  }

  async function handleDisplayPairing(row: DisplayDeviceOverviewRow) {
    if (!row.pairingSupported) {
      setInfo('Für dieses Display ist kein Pairing-Code verfügbar.')
      return
    }
    try {
      setBusyRef(row.id)
      const result = await regenerateDisplayPairingCode(token, row.id)
      setPairing({ title: `Pairing-Code für ${row.name}`, qrImageUrl: result.qrImageUrl, expiresAt: result.expiresAt, payload: result.pairingPayload })
      setInfo('Neuer Pairing-Code wurde erzeugt.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Pairing-Code konnte nicht erzeugt werden')
    } finally {
      setBusyRef(null)
    }
  }

  async function handleDisplayDelete(row: DisplayDeviceOverviewRow) {
    if (!window.confirm(`Gerät "${row.name}" wirklich löschen?`)) return
    if (!window.confirm('Diese Aktion ist endgültig. Das Gerät muss danach neu gekoppelt oder neu angelegt werden.')) return
    try {
      setBusyRef(row.id)
      setError('')
      if (row.sourceKind === 'ORDER_DISPLAY') {
        await deleteOrderDisplayForScope(token, row.entityId, row.tenantId)
      } else if (row.sourceKind === 'SCREEN_DEVICE') {
        await deleteScreenDeviceForScope(token, row.entityId, row.tenantId)
      } else {
        await deleteDisplayDevice(token, row.entityId, row.tenantId)
      }
      await loadData()
      setInfo('Gerät wurde gelöscht.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Gerät konnte nicht gelöscht werden')
    } finally {
      setBusyRef(null)
    }
  }

  async function handleOrderdeskDeactivate(row: EnrichedOrderDeskBinding) {
    if (!window.confirm('Dieses OrderDesk-Gerät deaktivieren?')) return
    try {
      setBusyRef(row.id)
      await deactivateOrderDeskDeviceBinding(token, row.id)
      await loadData()
      setInfo('OrderDesk-Gerät wurde deaktiviert.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'OrderDesk-Gerät konnte nicht deaktiviert werden')
    } finally {
      setBusyRef(null)
    }
  }

  async function handleOrderdeskUnpair(row: EnrichedOrderDeskBinding) {
    if (!window.confirm('Dieses OrderDesk-Gerät entkoppeln?')) return
    if (!window.confirm('Dieses OrderDesk-Gerät muss danach neu gekoppelt werden.')) return
    try {
      setBusyRef(row.id)
      await deleteOrderDeskDeviceBinding(token, row.id)
      await loadData()
      setInfo('OrderDesk-Gerät wurde entkoppelt.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'OrderDesk-Gerät konnte nicht entkoppelt werden')
    } finally {
      setBusyRef(null)
    }
  }

  async function handleOrderdeskPairingReset(row: EnrichedOrderDeskBinding) {
    if (!window.confirm('Pairing für dieses OrderDesk-Gerät neu starten?')) return
    if (!window.confirm('Dieses OrderDesk-Gerät muss danach neu gekoppelt werden.')) return
    try {
      setBusyRef(row.id)
      const result = await resetOrderDeskDevicePairing(token, row.id)
      setPairing({
        title: `OrderDesk Pairing für ${row.deviceAlias || row.deviceSerial}`,
        qrImageUrl: result.qrImageUrl,
        expiresAt: result.expiresAt,
        payload: result.pairingPayload,
      })
      await loadData()
      setInfo('OrderDesk-Pairing wurde neu gestartet.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Pairing konnte nicht neu gestartet werden')
    } finally {
      setBusyRef(null)
    }
  }

  async function createDriverPairingCode() {
    if (!driverPairingDisplayCode) {
      setError('Bitte zuerst einen Menübildschirm für das Fahrer-Pairing auswählen.')
      return
    }
    try {
      setBusyRef('driver-pairing')
      const result: DriverDeviceSessionCreateResponse = await createPublicDriverDeviceSession(driverPairingDisplayCode, {
        deviceLabel: 'Superadmin Pairing',
      })
      setPairing({
        title: `Fahrergeräte-Pairing für ${driverPairingDisplayCode}`,
        qrImageUrl: result.qrImageUrl,
        expiresAt: result.expiresAt,
        payload: result.pairingPayload,
        token: result.pairingToken,
      })
      setInfo('Fahrergeräte-Pairing wurde erzeugt.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Fahrergeräte-Pairing konnte nicht erzeugt werden')
    } finally {
      setBusyRef(null)
    }
  }

  function renderStatus(status: StatusKind) {
    return <span className={`inline-flex rounded-full border px-2.5 py-1 text-xs font-semibold ${statusClass(status)}`}>{statusLabel(status)}</span>
  }

  function renderDetailRows() {
    if (!detail) return null
    if (detail.kind === 'display') {
      const row = detail.row
      return [
        ['Typ', displayTypeLabel(row)], ['Quelle', sourceLabel(row)], ['Tenant', row.tenantName || '—'], ['Chain', row.chainName || '—'],
        ['DeviceCode', row.code], ['Status', statusLabel(normalizedStatus(row.lastSeenAt, row.isActive))], ['Letzte Verbindung', fmt(row.lastSeenAt)],
        ['Letzter Sync', fmt(row.lastSyncAt)], ['App-Version', row.deviceInfo?.appVersion || '—'], ['Plattform', row.deviceInfo?.platform || '—'], ['IP / User-Agent', 'Noch nicht verfügbar'],
      ]
    }
    if (detail.kind === 'orderdesk') {
      const row = detail.row
      return [
        ['Gerät', row.deviceAlias || row.deviceSerial], ['Serial', row.deviceSerial], ['Tenant', row.tenantName || '—'], ['Chain', row.chainName || '—'],
        ['DisplayCode', row.displayCode], ['Status', statusLabel(normalizedStatus(row.lastSeenAt, row.isActive))], ['Letzte Verbindung', fmt(row.lastSeenAt)],
        ['Gebunden seit', fmt(row.boundAt)], ['App-Version', row.appVersion || '—'], ['Plattform', row.devicePlatform || '—'], ['Modell', row.deviceModel || '—'], ['IP / User-Agent', 'Noch nicht verfügbar'],
      ]
    }
    if (detail.kind === 'driver') {
      const row = detail.row
      return [
        ['Gerät', row.deviceLabel], ['Tenant', row.tenantName], ['Chain', row.chainName || '—'], ['DisplayCode', row.displayCode], ['Fahrer', row.driverName || 'Nicht zugewiesen'],
        ['Status', statusLabel(normalizedStatus(row.lastHeartbeatAt, row.isActive))], ['Letzter Heartbeat', fmt(row.lastHeartbeatAt)], ['Issued At', fmt(row.issuedAt)], ['Expires At', fmt(row.expiresAt)], ['Revoked At', fmt(row.revokedAt)], ['Session ID', row.sessionId], ['IP / User-Agent', 'Noch nicht verfügbar'],
      ]
    }
    const row = detail.row
    return [
      ['Terminal', row.name], ['Tenant', row.tenantName || '—'], ['Chain', row.chainName || '—'], ['TerminalCode', row.terminalCode], ['Standort', row.location || '—'],
      ['Status', row.isActive ? 'Aktive Konfiguration' : 'Deaktivierte Konfiguration'], ['Cash Display', row.cashDisplay?.displayCode || '—'], ['Kitchen Display', row.kitchenDisplay?.displayCode || '—'], ['Pickup Display', row.pickupDisplay?.displayCode || '—'], ['Kartenzahlung', row.allowCardPayment ? 'Ja' : 'Nein'], ['Barzahlung', row.allowCashPayment ? 'Ja' : 'Nein'], ['Live-Gerätestatus', 'Noch keine Gerätequelle angebunden'],
    ]
  }

  if (!token) return null

  const showDisplays = tab === 'ALL' || tab === 'DISPLAYS' || tab === 'OFFLINE'
  const showOrderdesk = tab === 'ALL' || tab === 'ORDERDESK' || tab === 'OFFLINE'
  const showDrivers = tab === 'ALL' || tab === 'DRIVERS' || tab === 'OFFLINE'
  const showTerminals = tab === 'ALL' || tab === 'TERMINALS'

  return (
    <BackofficeLayout brand="Superadmin" title="Zentrale Geräteverwaltung" subtitle="Master-Übersicht für Displays, OrderDesk, Fahrergeräte und Terminal-Konfigurationen." navItems={SUPERADMIN_NAV_ITEMS}>
      <div className="space-y-6">
        <div className="grid gap-3 md:grid-cols-3 xl:grid-cols-6">
          {[
            ['Alle Quellen', summary.total], ['Online', summary.online], ['Instabil', summary.unstable], ['Offline', summary.offline], ['Deaktiviert', summary.inactive], ['Terminale', summary.terminals],
          ].map(([label, value]) => (
            <div key={String(label)} className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
              <div className="text-sm text-slate-500">{label}</div>
              <div className="mt-2 text-2xl font-semibold text-slate-900">{value}</div>
            </div>
          ))}
        </div>

        <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
          <div className="grid gap-3 xl:grid-cols-4">
            <input value={search} onChange={(event) => setSearch(event.target.value)} placeholder="Gerätename, Tenant, Code ..." className="rounded-xl border border-slate-200 px-3 py-2 outline-none focus:border-slate-400" />
            <select value={chainId} onChange={(event) => { setChainId(event.target.value); setTenantId('') }} className="rounded-xl border border-slate-200 px-3 py-2 outline-none focus:border-slate-400">
              <option value="">Alle Chains</option>
              {(context?.chains || []).map((chain) => <option key={chain.id} value={chain.id}>{chain.name}</option>)}
            </select>
            <select value={tenantId} onChange={(event) => setTenantId(event.target.value)} className="rounded-xl border border-slate-200 px-3 py-2 outline-none focus:border-slate-400">
              <option value="">Alle Tenants</option>
              {(context?.tenants || []).filter((tenant) => !chainId || tenant.chainId === chainId).map((tenant) => <option key={tenant.id} value={tenant.id}>{tenant.name}</option>)}
            </select>
            <button type="button" onClick={() => void loadData()} disabled={loading} className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white hover:bg-slate-800 disabled:cursor-not-allowed disabled:bg-slate-400">{loading ? 'Lädt ...' : 'Neu laden'}</button>
          </div>
          <div className="mt-4 flex flex-wrap gap-2">
            {[
              ['ALL', 'Alle Geräte'], ['DISPLAYS', 'Displays'], ['ORDERDESK', 'OrderDesk'], ['DRIVERS', 'Fahrergeräte'], ['TERMINALS', 'Terminals / Kasse'], ['OFFLINE', 'Offline Geräte'],
            ].map(([value, label]) => (
              <button key={value} type="button" onClick={() => setTab(value as DeviceTab)} className={`rounded-full border px-4 py-2 text-sm font-semibold ${tab === value ? 'border-slate-900 bg-slate-900 text-white' : 'border-slate-200 bg-slate-50 text-slate-700 hover:border-slate-300'}`}>
                {label}
              </button>
            ))}
          </div>
          {error ? <div className="mt-4 rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm text-rose-700">{error}</div> : null}
          {info ? <div className="mt-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-800">{info}</div> : null}
          {copyInfo ? <div className="mt-4 rounded-2xl border border-sky-200 bg-sky-50 px-4 py-3 text-sm text-sky-800">{copyInfo}</div> : null}
        </div>

        {pairing ? (
          <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <div className="flex flex-wrap items-start justify-between gap-3">
              <div>
                <h2 className="text-lg font-semibold text-slate-900">{pairing.title}</h2>
                <p className="mt-1 text-sm text-slate-600">Gültig bis {fmt(pairing.expiresAt)}</p>
              </div>
              <button type="button" onClick={() => setPairing(null)} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300">Schließen</button>
            </div>
            <div className="mt-4 flex flex-wrap items-start gap-4">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src={pairing.qrImageUrl} alt={pairing.title} className="h-56 w-56 rounded-2xl border border-slate-200 bg-white p-3" />
              <div className="min-w-0 flex-1 space-y-3">
                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-3 text-xs text-slate-700 break-all">{pairing.payload}</div>
                <div className="flex flex-wrap gap-2">
                  <button type="button" onClick={() => void copyValue(pairing.payload, 'Pairing-Payload')} className="rounded-xl border border-slate-200 bg-white px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300">Payload kopieren</button>
                  {pairing.token ? <button type="button" onClick={() => void copyValue(pairing.token || '', 'Pairing-Token')} className="rounded-xl border border-slate-200 bg-white px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300">Token kopieren</button> : null}
                </div>
              </div>
            </div>
          </div>
        ) : null}

        {detail ? (
          <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <div className="flex flex-wrap items-start justify-between gap-3">
              <div>
                <h2 className="text-lg font-semibold text-slate-900">Gerätedetails</h2>
                <p className="mt-1 text-sm text-slate-600">Technische Detailansicht ohne zusätzlichen Tenant-Wechsel.</p>
              </div>
              <button type="button" onClick={() => setDetail(null)} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300">Schließen</button>
            </div>
            <div className="mt-4 grid gap-3 md:grid-cols-2">
              {renderDetailRows()?.map(([label, value]) => (
                <div key={label} className="rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3">
                  <div className="text-xs font-semibold uppercase tracking-[0.12em] text-slate-500">{label}</div>
                  <div className="mt-1 break-all text-sm text-slate-800">{value}</div>
                </div>
              ))}
            </div>
          </div>
        ) : null}

        {showDisplays ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <h2 className="text-lg font-semibold text-slate-900">Displays</h2>
            <p className="mt-1 text-sm text-slate-600">Menübildschirme und operative Bestellanzeigen in einer zentralen Quelle.</p>
            <div className="mt-4 overflow-x-auto">
              <table className="min-w-full text-left text-sm">
                <thead><tr className="border-b border-slate-200 text-slate-500"><th className="px-3 py-3">Gerät</th><th className="px-3 py-3">Typ</th><th className="px-3 py-3">Tenant / Chain</th><th className="px-3 py-3">Code</th><th className="px-3 py-3">Status</th><th className="px-3 py-3">Letzte Verbindung</th><th className="px-3 py-3">Aktionen</th></tr></thead>
                <tbody>
                  {[...menuDisplays, ...operationalDisplays].map((row) => (
                    <tr key={row.id} className="border-b border-slate-100 align-top last:border-b-0">
                      <td className="px-3 py-3 font-medium text-slate-900">{row.name}</td>
                      <td className="px-3 py-3 text-slate-700">{displayTypeLabel(row)} / {sourceLabel(row)}</td>
                      <td className="px-3 py-3 text-slate-700">{row.tenantName || '—'}{row.chainName ? ` / ${row.chainName}` : ''}</td>
                      <td className="px-3 py-3 text-slate-700">{row.code}</td>
                      <td className="px-3 py-3">{renderStatus(normalizedStatus(row.lastSeenAt, row.isActive))}</td>
                      <td className="px-3 py-3 text-slate-700">{fmt(row.lastSeenAt)}</td>
                      <td className="px-3 py-3"><div className="flex flex-wrap gap-2">
                        <button type="button" onClick={() => setDetail({ kind: 'display', row })} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300">Details</button>
                        {isCanonicalScreenPreviewPath(row.previewPath) ? <button type="button" onClick={() => void handleDisplayPreview(row)} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300">Vorschau</button> : null}
                        {row.pairingSupported ? <button type="button" onClick={() => void handleDisplayPairing(row)} disabled={busyRef === row.id} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300 disabled:opacity-50">Pairing neu</button> : null}
                        {row.sourceKind !== 'DISPLAY_DEVICE' ? <button type="button" onClick={() => void handleDisplayToggle(row)} disabled={busyRef === row.id} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300 disabled:opacity-50">{row.isActive ? 'Deaktivieren' : 'Aktivieren'}</button> : null}
                        <button type="button" onClick={() => void handleDisplayDelete(row)} disabled={busyRef === row.id} className="rounded-xl border border-rose-200 bg-rose-50 px-3 py-1.5 text-sm text-rose-700 hover:border-rose-300 disabled:opacity-50">Löschen</button>
                      </div></td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {showOrderdesk ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <h2 className="text-lg font-semibold text-slate-900">OrderDesk-Geräte</h2>
            <p className="mt-1 text-sm text-slate-600">Gebundene Geräte mit echten Aktionen für Deaktivieren, Entkoppeln und Pairing-Neustart.</p>
            <div className="mt-4 overflow-x-auto">
              <table className="min-w-full text-left text-sm">
                <thead><tr className="border-b border-slate-200 text-slate-500"><th className="px-3 py-3">Gerät</th><th className="px-3 py-3">Tenant / Chain</th><th className="px-3 py-3">Display</th><th className="px-3 py-3">Plattform</th><th className="px-3 py-3">Status</th><th className="px-3 py-3">Letzte Verbindung</th><th className="px-3 py-3">Aktionen</th></tr></thead>
                <tbody>
                  {visibleOrderdesk.map((row) => (
                    <tr key={row.id} className="border-b border-slate-100 align-top last:border-b-0">
                      <td className="px-3 py-3 font-medium text-slate-900">{row.deviceAlias || row.deviceSerial}</td>
                      <td className="px-3 py-3 text-slate-700">{row.tenantName || '—'}{row.chainName ? ` / ${row.chainName}` : ''}</td>
                      <td className="px-3 py-3 text-slate-700">{row.displayCode}</td>
                      <td className="px-3 py-3 text-slate-700">{row.devicePlatform || '—'}{row.appVersion ? ` / ${row.appVersion}` : ''}</td>
                      <td className="px-3 py-3">{renderStatus(normalizedStatus(row.lastSeenAt, row.isActive))}</td>
                      <td className="px-3 py-3 text-slate-700">{fmt(row.lastSeenAt)}</td>
                      <td className="px-3 py-3"><div className="flex flex-wrap gap-2">
                        <button type="button" onClick={() => setDetail({ kind: 'orderdesk', row })} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300">Details</button>
                        <button type="button" onClick={() => void handleOrderdeskPairingReset(row)} disabled={busyRef === row.id} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300 disabled:opacity-50">Pairing neu starten</button>
                        <button type="button" onClick={() => void handleOrderdeskDeactivate(row)} disabled={busyRef === row.id} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300 disabled:opacity-50">Deaktivieren</button>
                        <button type="button" onClick={() => void handleOrderdeskUnpair(row)} disabled={busyRef === row.id} className="rounded-xl border border-rose-200 bg-rose-50 px-3 py-1.5 text-sm text-rose-700 hover:border-rose-300 disabled:opacity-50">Entkoppeln</button>
                      </div></td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {showDrivers ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <h2 className="text-lg font-semibold text-slate-900">Fahrergeräte</h2>
            <p className="mt-1 text-sm text-slate-600">Heartbeat-basierte Übersicht über aktive Fahrergeräte-Sessions.</p>
            <div className="mt-4 grid gap-3 rounded-2xl border border-slate-200 bg-slate-50 p-4 lg:grid-cols-[minmax(0,1fr)_auto]">
              <select value={driverPairingDisplayCode} onChange={(event) => setDriverPairingDisplayCode(event.target.value)} className="rounded-xl border border-slate-200 bg-white px-3 py-2 outline-none focus:border-slate-400">
                <option value="">Menübildschirm für neues Fahrer-Pairing wählen</option>
                {displayRows.filter((row) => isCanonicalScreenPreviewPath(row.previewPath)).map((row) => <option key={row.id} value={row.code}>{row.name} ({row.code})</option>)}
              </select>
              <button type="button" onClick={() => void createDriverPairingCode()} disabled={busyRef === 'driver-pairing'} className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white hover:bg-slate-800 disabled:cursor-not-allowed disabled:bg-slate-400">Fahrer-Pairing erzeugen</button>
            </div>
            <div className="mt-4 overflow-x-auto">
              <table className="min-w-full text-left text-sm">
                <thead><tr className="border-b border-slate-200 text-slate-500"><th className="px-3 py-3">Gerät</th><th className="px-3 py-3">Tenant / Chain</th><th className="px-3 py-3">Display</th><th className="px-3 py-3">Fahrer</th><th className="px-3 py-3">Status</th><th className="px-3 py-3">Letzter Heartbeat</th><th className="px-3 py-3">Aktionen</th></tr></thead>
                <tbody>
                  {visibleDrivers.map((row) => (
                    <tr key={row.sessionId} className="border-b border-slate-100 align-top last:border-b-0">
                      <td className="px-3 py-3 font-medium text-slate-900">{row.deviceLabel}</td>
                      <td className="px-3 py-3 text-slate-700">{row.tenantName}{row.chainName ? ` / ${row.chainName}` : ''}</td>
                      <td className="px-3 py-3 text-slate-700">{row.displayCode}</td>
                      <td className="px-3 py-3 text-slate-700">{row.driverName || 'Nicht zugewiesen'}</td>
                      <td className="px-3 py-3">{renderStatus(normalizedStatus(row.lastHeartbeatAt, row.isActive))}</td>
                      <td className="px-3 py-3 text-slate-700">{fmt(row.lastHeartbeatAt)}</td>
                      <td className="px-3 py-3"><button type="button" onClick={() => setDetail({ kind: 'driver', row })} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300">Details</button></td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {showTerminals ? (
          <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <h2 className="text-lg font-semibold text-slate-900">Terminals / POS</h2>
            <p className="mt-1 text-sm text-slate-600">Terminal-Konfigurationen mit klarer Kennzeichnung, dass noch keine Live-Gerätequelle angebunden ist.</p>
            <div className="mt-4 overflow-x-auto">
              <table className="min-w-full text-left text-sm">
                <thead><tr className="border-b border-slate-200 text-slate-500"><th className="px-3 py-3">Terminal</th><th className="px-3 py-3">Tenant / Chain</th><th className="px-3 py-3">Code</th><th className="px-3 py-3">Zugeordnete Displays</th><th className="px-3 py-3">Status</th><th className="px-3 py-3">Aktionen</th></tr></thead>
                <tbody>
                  {terminalFiltered.map((row) => (
                    <tr key={row.id} className="border-b border-slate-100 align-top last:border-b-0">
                      <td className="px-3 py-3 font-medium text-slate-900">{row.name}</td>
                      <td className="px-3 py-3 text-slate-700">{row.tenantName || '—'}{row.chainName ? ` / ${row.chainName}` : ''}</td>
                      <td className="px-3 py-3 text-slate-700">{row.terminalCode}</td>
                      <td className="px-3 py-3 text-slate-700">{[row.cashDisplay ? `Cash: ${row.cashDisplay.displayCode}` : null, row.kitchenDisplay ? `Kitchen: ${row.kitchenDisplay.displayCode}` : null, row.pickupDisplay ? `Pickup: ${row.pickupDisplay.displayCode}` : null].filter(Boolean).join(' | ') || 'Keine Display-Zuordnung'}</td>
                      <td className="px-3 py-3">{renderStatus('unknown')}</td>
                      <td className="px-3 py-3"><button type="button" onClick={() => setDetail({ kind: 'terminal', row })} className="rounded-xl border border-slate-200 px-3 py-1.5 text-sm text-slate-700 hover:border-slate-300">Details</button></td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        <div className="grid gap-4 lg:grid-cols-3">
          <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm"><h3 className="text-sm font-semibold uppercase tracking-[0.18em] text-slate-500">Display-Quellen</h3><ul className="mt-3 space-y-2 text-sm text-slate-700"><li>Display-Übersicht aus /api/access/displays/overview</li><li>Vorschau nur kanonisch über /screen/[deviceCode]</li><li>Legacy-Display-Quellen bleiben sichtbar, aber nicht als moderner Menüpfad</li></ul></div>
          <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm"><h3 className="text-sm font-semibold uppercase tracking-[0.18em] text-slate-500">OrderDesk & Fahrergeräte</h3><ul className="mt-3 space-y-2 text-sm text-slate-700"><li>OrderDesk-Bindings aus /api/orderdesk-devices/bindings</li><li>Fahrergeräte aus /api/access/driver-devices/overview</li><li>Status basiert auf lastSeenAt bzw. lastHeartbeatAt</li></ul></div>
          <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm"><h3 className="text-sm font-semibold uppercase tracking-[0.18em] text-slate-500">Terminale / POS</h3><ul className="mt-3 space-y-2 text-sm text-slate-700"><li>Terminal-Konfigurationen pro Tenant aus /api/order-terminals</li><li>Noch keine eigene Heartbeat-, IP- oder User-Agent-Quelle</li><li>Darum klare Kennzeichnung statt künstlicher Online-Anzeige</li></ul></div>
        </div>
      </div>
    </BackofficeLayout>
  )
}
