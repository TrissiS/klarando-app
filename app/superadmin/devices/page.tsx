'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  deleteOrderDeskDeviceBinding,
  deactivateOrderDeskDeviceBinding,
  getAccessContext,
  getDisplayDeviceOverview,
  getOrderDeskDeviceBindingsForScope,
  getSuperadminDriverOverview,
  resetOrderDeskDevicePairing,
  type AccessContext,
  type DisplayDeviceOverviewRow,
  type DisplayDeviceStatus,
  type OrderDeskDeviceBinding,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type DeviceTab = 'ALL' | 'DISPLAYS' | 'ORDERDESK' | 'DRIVER' | 'OFFLINE'

function normalizedStatus(lastSeenAt: string | null, isActive = true): 'online' | 'instabil' | 'offline' | 'inactive' {
  if (!isActive) return 'inactive'
  if (!lastSeenAt) return 'offline'
  const diffSec = Math.max(0, Math.floor((Date.now() - new Date(lastSeenAt).getTime()) / 1000))
  if (diffSec < 30) return 'online'
  if (diffSec <= 120) return 'instabil'
  return 'offline'
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
  const [driverRows, setDriverRows] = useState<Array<{ id: string; name: string; tenantName: string | null; lastSeenAt: string | null; isActive: boolean }>>([])
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    if (!token) return
    void (async () => {
      const ctx = await getAccessContext(token)
      setContext(ctx)
      setChainId(ctx.chains[0]?.id || '')
      setTenantId(ctx.tenants[0]?.id || '')
    })().catch((cause) => setError(cause instanceof Error ? cause.message : 'Kontext konnte nicht geladen werden'))
  }, [token])

  useEffect(() => {
    if (!token) return
    void loadData()
  }, [token, tenantId, chainId])

  async function loadData() {
    try {
      setLoading(true)
      setError('')
      const [displayOverview, orderdeskOverview, driverOverview] = await Promise.all([
        getDisplayDeviceOverview(token, { tenantId: tenantId || undefined, chainId: chainId || undefined, status: 'all' }),
        getOrderDeskDeviceBindingsForScope(token, { tenantId: tenantId || undefined, includeInactive: true }),
        getSuperadminDriverOverview(token, { tenantId: tenantId || undefined, chainId: chainId || undefined, includeInactive: true, limit: 500 }),
      ])
      setDisplayRows(displayOverview.rows)
      setOrderdeskRows(orderdeskOverview.bindings)
      setDriverRows(
        driverOverview.rows.map((row) => ({
          id: row.id,
          name: row.name,
          tenantName: row.tenant?.name || null,
          lastSeenAt: row.stats.lastAssignmentAt || null,
          isActive: row.isActive,
        }))
      )
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Geräte konnten nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  const displayFiltered = useMemo(() => {
    return displayRows.filter((row) => {
      const haystack = `${row.name} ${row.code} ${row.tenantName || ''} ${row.chainName || ''}`.toLowerCase()
      return haystack.includes(search.toLowerCase())
    })
  }, [displayRows, search])

  const orderdeskFiltered = useMemo(() => {
    return orderdeskRows.filter((row) => {
      const haystack = `${row.deviceAlias || ''} ${row.deviceSerial} ${row.displayCode}`.toLowerCase()
      return haystack.includes(search.toLowerCase())
    })
  }, [orderdeskRows, search])

  const driverFiltered = useMemo(() => {
    return driverRows.filter((row) => `${row.name} ${row.tenantName || ''}`.toLowerCase().includes(search.toLowerCase()))
  }, [driverRows, search])

  const summary = useMemo(() => {
    const merged = [
      ...displayRows.map((row) => normalizedStatus(row.lastSeenAt, row.isActive)),
      ...orderdeskRows.map((row) => normalizedStatus(row.lastSeenAt, row.isActive)),
      ...driverRows.map((row) => normalizedStatus(row.lastSeenAt, row.isActive)),
    ]
    return {
      total: merged.length,
      online: merged.filter((entry) => entry === 'online').length,
      unstable: merged.filter((entry) => entry === 'instabil').length,
      offline: merged.filter((entry) => entry === 'offline').length,
      inactive: merged.filter((entry) => entry === 'inactive').length,
    }
  }, [displayRows, orderdeskRows, driverRows])

  async function disconnectOrderdesk(bindingId: string, hardDelete: boolean) {
    if (!window.confirm('OrderDesk-Gerät wirklich entkoppeln? Dieses Gerät muss danach neu gekoppelt werden.')) return
    if (!window.confirm('Zweite Bestätigung: Aktion wirklich durchführen?')) return
    try {
      if (hardDelete) {
        await deleteOrderDeskDeviceBinding(token, bindingId)
      } else {
        await deactivateOrderDeskDeviceBinding(token, bindingId)
      }
      setInfo(hardDelete ? 'OrderDesk-Gerät wurde gelöscht.' : 'OrderDesk-Gerät wurde entkoppelt.')
      await loadData()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Aktion fehlgeschlagen')
    }
  }

  async function refreshOrderdeskPairing(bindingId: string) {
    try {
      const next = await resetOrderDeskDevicePairing(token, bindingId)
      setInfo(`Neuer Pairing-Code erstellt (gültig bis ${new Date(next.expiresAt).toLocaleTimeString('de-DE')}).`)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Pairing konnte nicht zurückgesetzt werden')
    }
  }

  return (
    <BackofficeLayout brand="Superadmin" title="Geräte" subtitle="Zentrale Übersicht für Displays, OrderDesk, Fahrergeräte und Status" navItems={SUPERADMIN_NAV_ITEMS}>
      <div className="space-y-4">
        {error ? <div className="rounded-xl border border-red-200 bg-red-50 px-3 py-2 text-sm text-red-700">{error}</div> : null}
        {info ? <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-3 py-2 text-sm text-emerald-800">{info}</div> : null}

        <div className="grid gap-3 md:grid-cols-5">
          <div className="rounded-xl border bg-white p-3"><div className="text-xs text-slate-500">Geräte gesamt</div><div className="text-2xl font-bold">{summary.total}</div></div>
          <div className="rounded-xl border bg-white p-3"><div className="text-xs text-slate-500">Online</div><div className="text-2xl font-bold text-emerald-600">{summary.online}</div></div>
          <div className="rounded-xl border bg-white p-3"><div className="text-xs text-slate-500">Instabil</div><div className="text-2xl font-bold text-amber-600">{summary.unstable}</div></div>
          <div className="rounded-xl border bg-white p-3"><div className="text-xs text-slate-500">Offline</div><div className="text-2xl font-bold text-rose-600">{summary.offline}</div></div>
          <div className="rounded-xl border bg-white p-3"><div className="text-xs text-slate-500">Inaktiv</div><div className="text-2xl font-bold text-slate-500">{summary.inactive}</div></div>
        </div>

        <div className="rounded-2xl border bg-white p-4">
          <div className="grid gap-3 md:grid-cols-4">
            <select className="rounded-xl border px-3 py-2" value={chainId} onChange={(event) => setChainId(event.target.value)}>
              <option value="">Alle Ketten</option>
              {(context?.chains || []).map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
            </select>
            <select className="rounded-xl border px-3 py-2" value={tenantId} onChange={(event) => setTenantId(event.target.value)}>
              <option value="">Alle Filialen</option>
              {(context?.tenants || []).filter((entry) => !chainId || entry.chainId === chainId).map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
            </select>
            <input className="rounded-xl border px-3 py-2" placeholder="Suchen (Name, Code, Plattform ...)" value={search} onChange={(event) => setSearch(event.target.value)} />
            <button type="button" className="rounded-xl border bg-slate-900 px-3 py-2 text-white" onClick={() => void loadData()} disabled={loading}>
              {loading ? 'Lädt...' : 'Aktualisieren'}
            </button>
          </div>
          <div className="mt-4 flex flex-wrap gap-2">
            {(['ALL', 'DISPLAYS', 'ORDERDESK', 'DRIVER', 'OFFLINE'] as DeviceTab[]).map((entry) => (
              <button key={entry} type="button" onClick={() => setTab(entry)} className={`rounded-xl px-3 py-1.5 text-sm ${tab === entry ? 'bg-slate-900 text-white' : 'border bg-white'}`}>
                {entry === 'ALL' ? 'Alle Geräte' : entry === 'DISPLAYS' ? 'Displays' : entry === 'ORDERDESK' ? 'OrderDesk' : entry === 'DRIVER' ? 'Fahrergeräte' : 'Offline Geräte'}
              </button>
            ))}
          </div>
        </div>

        {(tab === 'ALL' || tab === 'DISPLAYS' || tab === 'OFFLINE') ? (
          <div className="rounded-2xl border bg-white p-4">
            <h3 className="mb-2 text-sm font-semibold">Displays & Menübildschirme</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[980px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th>Name</th><th>Typ</th><th>Status</th><th>Filiale</th><th>Kette</th><th>Code</th><th>Plattform</th><th>App-Version</th><th>Zuletzt aktiv</th></tr></thead>
                <tbody>
                  {displayFiltered
                    .filter((row) => tab !== 'OFFLINE' || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online')
                    .map((row) => (
                      <tr key={row.id} className="border-t">
                        <td className="py-2">{row.name}</td>
                        <td>{row.displayType}</td>
                        <td>{normalizedStatus(row.lastSeenAt, row.isActive)}</td>
                        <td>{row.tenantName || '-'}</td>
                        <td>{row.chainName || '-'}</td>
                        <td>{row.code}</td>
                        <td>{row.deviceInfo?.platform || '-'}</td>
                        <td>{row.deviceInfo?.appVersion || '-'}</td>
                        <td>{row.lastSeenAt ? new Date(row.lastSeenAt).toLocaleString('de-DE') : '-'}</td>
                      </tr>
                    ))}
                </tbody>
              </table>
            </div>
          </div>
        ) : null}

        {(tab === 'ALL' || tab === 'ORDERDESK' || tab === 'OFFLINE') ? (
          <div className="rounded-2xl border bg-white p-4">
            <h3 className="mb-2 text-sm font-semibold">OrderDesk-Geräte</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[1160px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th>Label</th><th>Display</th><th>Status</th><th>Seriennummer</th><th>Plattform</th><th>App-Version</th><th>Zuletzt aktiv</th><th>Aktionen</th></tr></thead>
                <tbody>
                  {orderdeskFiltered
                    .filter((row) => tab !== 'OFFLINE' || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online')
                    .map((row) => (
                      <tr key={row.id} className="border-t">
                        <td className="py-2">{row.deviceAlias || 'OrderDesk'}</td>
                        <td>{row.displayCode}</td>
                        <td>{normalizedStatus(row.lastSeenAt, row.isActive)}</td>
                        <td>{row.deviceSerial}</td>
                        <td>{row.devicePlatform || '-'}</td>
                        <td>{row.appVersion || '-'}</td>
                        <td>{row.lastSeenAt ? new Date(row.lastSeenAt).toLocaleString('de-DE') : '-'}</td>
                        <td className="space-x-1">
                          <button className="rounded border px-2 py-1" onClick={() => void refreshOrderdeskPairing(row.id)}>Pairing neu</button>
                          <button className="rounded border px-2 py-1" onClick={() => void disconnectOrderdesk(row.id, false)}>Entkoppeln</button>
                          <button className="rounded border border-red-200 px-2 py-1 text-red-700" onClick={() => void disconnectOrderdesk(row.id, true)}>Löschen</button>
                        </td>
                      </tr>
                    ))}
                </tbody>
              </table>
            </div>
          </div>
        ) : null}

        {(tab === 'ALL' || tab === 'DRIVER' || tab === 'OFFLINE') ? (
          <div className="rounded-2xl border bg-white p-4">
            <h3 className="mb-2 text-sm font-semibold">Fahrergeräte</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[700px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th>Name</th><th>Filiale</th><th>Status</th><th>Zuletzt aktiv</th></tr></thead>
                <tbody>
                  {driverFiltered
                    .filter((row) => tab !== 'OFFLINE' || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online')
                    .map((row) => (
                      <tr key={row.id} className="border-t">
                        <td className="py-2">{row.name}</td>
                        <td>{row.tenantName || '-'}</td>
                        <td>{normalizedStatus(row.lastSeenAt, row.isActive)}</td>
                        <td>{row.lastSeenAt ? new Date(row.lastSeenAt).toLocaleString('de-DE') : '-'}</td>
                      </tr>
                    ))}
                </tbody>
              </table>
            </div>
          </div>
        ) : null}
      </div>
    </BackofficeLayout>
  )
}
