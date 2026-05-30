'use client'

import { type ReactNode, useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createPublicDriverDeviceSession,
  deleteOrderDeskDeviceBinding,
  deactivateOrderDeskDeviceBinding,
  getAccessContext,
  getDisplayDeviceOverview,
  getOrderDeskDeviceBindingsForScope,
  getSuperadminDriverOverview,
  resetOrderDeskDevicePairing,
  type AccessContext,
  type DriverDeviceSessionCreateResponse,
  type DisplayDeviceOverviewRow,
  type OrderDeskDeviceBinding,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type DeviceTab = 'ALL' | 'DISPLAYS' | 'ORDERDESK' | 'DRIVER' | 'OFFLINE'
type StatusKind = 'online' | 'instabil' | 'offline' | 'inactive'

function normalizedStatus(lastSeenAt: string | null, isActive = true): StatusKind {
  if (!isActive) return 'inactive'
  if (!lastSeenAt) return 'offline'
  const diffSec = Math.max(0, Math.floor((Date.now() - new Date(lastSeenAt).getTime()) / 1000))
  if (diffSec < 30) return 'online'
  if (diffSec <= 120) return 'instabil'
  return 'offline'
}

function statusStyle(status: StatusKind) {
  if (status === 'online') return 'bg-emerald-100 text-emerald-800 border-emerald-200'
  if (status === 'instabil') return 'bg-amber-100 text-amber-800 border-amber-200'
  if (status === 'inactive') return 'bg-slate-100 text-slate-700 border-slate-200'
  return 'bg-rose-100 text-rose-800 border-rose-200'
}

function statusLabel(status: StatusKind) {
  if (status === 'online') return 'Online'
  if (status === 'instabil') return 'Instabil'
  if (status === 'inactive') return 'Inaktiv'
  return 'Offline'
}

function toDeDate(value: string | null) {
  if (!value) return '—'
  return new Date(value).toLocaleString('de-DE')
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
  const [showInactiveSection, setShowInactiveSection] = useState(false)
  const [copyInfo, setCopyInfo] = useState('')
  const [driverPairingDisplayCode, setDriverPairingDisplayCode] = useState('')
  const [driverPairing, setDriverPairing] = useState<DriverDeviceSessionCreateResponse | null>(null)

  async function copyValue(value: string, label: string) {
    try {
      await navigator.clipboard.writeText(value)
      setCopyInfo(`${label} kopiert`)
      window.setTimeout(() => setCopyInfo(''), 1800)
    } catch {
      setCopyInfo(`Kopieren fehlgeschlagen (${label})`)
      window.setTimeout(() => setCopyInfo(''), 2200)
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

  useEffect(() => {
    if (driverPairingDisplayCode) return
    const firstDisplayCode = displayRows[0]?.code || ''
    if (firstDisplayCode) {
      setDriverPairingDisplayCode(firstDisplayCode)
    }
  }, [displayRows, driverPairingDisplayCode])

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

  const inactiveCount = useMemo(() => {
    return (
      displayRows.filter((row) => normalizedStatus(row.lastSeenAt, row.isActive) === 'inactive').length +
      orderdeskRows.filter((row) => normalizedStatus(row.lastSeenAt, row.isActive) === 'inactive').length +
      driverRows.filter((row) => normalizedStatus(row.lastSeenAt, row.isActive) === 'inactive').length
    )
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

  async function createDriverPairingCode() {
    const displayCode = driverPairingDisplayCode.trim()
    if (!displayCode) {
      setError('Bitte zuerst ein Display für Driver-Pairing auswählen.')
      return
    }
    try {
      setLoading(true)
      setError('')
      const response = await createPublicDriverDeviceSession(displayCode, {
        accessHours: 24,
        deviceLabel: 'Driver-App',
      })
      setDriverPairing(response)
      setInfo(`Driver-Kopplungscode für ${displayCode} wurde erstellt.`)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Driver-Pairing konnte nicht erstellt werden')
    } finally {
      setLoading(false)
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Geräte"
      subtitle="Displays, OrderDesk, Fahrergeräte und Status zentral verwalten"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-5">
        {error ? (
          <div className="rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm text-rose-800">
            <div className="font-semibold">Geräte konnten nicht geladen werden</div>
            <div className="mt-1">{error}</div>
            <button type="button" onClick={() => void loadData()} className="mt-3 rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-semibold text-white">
              Erneut laden
            </button>
          </div>
        ) : null}
        {info ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-800">{info}</div> : null}
        {copyInfo ? <div className="rounded-2xl border border-blue-200 bg-blue-50 px-4 py-3 text-sm text-blue-800">{copyInfo}</div> : null}

        <section className="grid gap-3 md:grid-cols-5">
          <StatCard title="Geräte gesamt" value={summary.total} hint="Alle verbundenen und inaktiven Geräte" tone="slate" />
          <StatCard title="Online" value={summary.online} hint="Stabil verbunden" tone="emerald" />
          <StatCard title="Instabil" value={summary.unstable} hint="Heartbeat unregelmäßig" tone="amber" />
          <StatCard title="Offline" value={summary.offline} hint="Nicht erreichbar" tone="rose" />
          <StatCard title="Inaktiv" value={summary.inactive} hint="Entkoppelt oder deaktiviert" tone="zinc" />
        </section>

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
          <div className="grid gap-3 md:grid-cols-4">
            <select className="rounded-xl border border-[var(--brand-border)] px-3 py-2.5" value={chainId} onChange={(event) => setChainId(event.target.value)}>
              <option value="">Alle Unternehmen</option>
              {(context?.chains || []).map((entry) => (
                <option key={entry.id} value={entry.id}>{entry.name}</option>
              ))}
            </select>
            <select className="rounded-xl border border-[var(--brand-border)] px-3 py-2.5" value={tenantId} onChange={(event) => setTenantId(event.target.value)}>
              <option value="">Alle Filialen</option>
              {(context?.tenants || []).filter((entry) => !chainId || entry.chainId === chainId).map((entry) => (
                <option key={entry.id} value={entry.id}>{entry.name}</option>
              ))}
            </select>
            <input className="rounded-xl border border-[var(--brand-border)] px-3 py-2.5" placeholder="Suche nach Name, Code, Plattform ..." value={search} onChange={(event) => setSearch(event.target.value)} />
            <button type="button" className="rounded-xl bg-slate-900 px-3 py-2.5 text-sm font-semibold text-white hover:bg-slate-800 disabled:opacity-60" onClick={() => void loadData()} disabled={loading}>
              {loading ? 'Geräte werden geladen …' : 'Aktualisieren'}
            </button>
          </div>
          <div className="mt-4 flex flex-wrap gap-2">
            {(['ALL', 'DISPLAYS', 'ORDERDESK', 'DRIVER', 'OFFLINE'] as DeviceTab[]).map((entry) => (
              <button
                key={entry}
                type="button"
                onClick={() => setTab(entry)}
                className={`rounded-xl px-3 py-1.5 text-sm font-medium transition ${tab === entry ? 'bg-slate-900 text-white' : 'border border-[var(--brand-border)] bg-white text-slate-700 hover:bg-slate-50'}`}
              >
                {entry === 'ALL' ? 'Alle Geräte' : entry === 'DISPLAYS' ? 'Displays' : entry === 'ORDERDESK' ? 'OrderDesk' : entry === 'DRIVER' ? 'Fahrergeräte' : 'Offline Geräte'}
              </button>
            ))}
          </div>
        </section>

        <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
          <h3 className="text-sm font-semibold text-slate-800">Driver-App koppeln</h3>
          <p className="mt-1 text-xs text-slate-600">
            Kopplungscode für Driver-App erzeugen (QR + manuelle Daten).
          </p>
          <div className="mt-3 grid gap-2 md:grid-cols-[1fr_auto]">
            <select
              className="rounded-xl border border-[var(--brand-border)] px-3 py-2.5 text-sm"
              value={driverPairingDisplayCode}
              onChange={(event) => setDriverPairingDisplayCode(event.target.value)}
            >
              <option value="">Display auswählen</option>
              {displayRows.map((row) => (
                <option key={row.id} value={row.code}>
                  {row.name} ({row.code})
                </option>
              ))}
            </select>
            <button
              type="button"
              onClick={() => void createDriverPairingCode()}
              disabled={loading || !driverPairingDisplayCode.trim()}
              className="rounded-xl bg-slate-900 px-3 py-2.5 text-sm font-semibold text-white hover:bg-slate-800 disabled:opacity-60"
            >
              Driver-App koppeln
            </button>
          </div>
        </section>

        {loading ? (
          <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 text-sm text-slate-600">Geräte werden geladen …</div>
        ) : null}

        {(tab === 'ALL' || tab === 'DISPLAYS' || tab === 'OFFLINE') ? (
          <DeviceSection title="Displays & Menübildschirme">
            <DesktopTable headers={['Name', 'Typ', 'Status', 'Filiale', 'Kette', 'Code', 'Plattform', 'App-Version', 'Zuletzt aktiv']}>
              {displayFiltered
                .filter((row) => tab !== 'OFFLINE' || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online')
                .map((row) => {
                  const status = normalizedStatus(row.lastSeenAt, row.isActive)
                  return (
                    <tr key={row.id} className="border-t border-slate-100 hover:bg-slate-50/70">
                      <td className="py-2.5 font-medium text-slate-800">{row.name}</td>
                      <td>{row.displayType}</td>
                      <td><StatusBadge status={status} /></td>
                      <td>{row.tenantName || '—'}</td>
                      <td>{row.chainName || '—'}</td>
                      <td className="font-mono text-xs">{row.code}</td>
                      <td>{row.deviceInfo?.platform || '—'}</td>
                      <td>{row.deviceInfo?.appVersion || '—'}</td>
                      <td>{toDeDate(row.lastSeenAt)}</td>
                    </tr>
                  )
                })}
            </DesktopTable>
            <MobileCards>
              {displayFiltered
                .filter((row) => tab !== 'OFFLINE' || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online')
                .map((row) => {
                  const status = normalizedStatus(row.lastSeenAt, row.isActive)
                  return (
                    <DeviceCard
                      key={row.id}
                      title={row.name}
                      subtitle={`${row.displayType} • ${row.code}`}
                      status={status}
                      details={[
                        `Filiale: ${row.tenantName || '—'}`,
                        `Unternehmen: ${row.chainName || '—'}`,
                        `Plattform: ${row.deviceInfo?.platform || '—'}`,
                        `App-Version: ${row.deviceInfo?.appVersion || '—'}`,
                        `Zuletzt aktiv: ${toDeDate(row.lastSeenAt)}`,
                      ]}
                    />
                  )
                })}
            </MobileCards>
          </DeviceSection>
        ) : null}

        {(tab === 'ALL' || tab === 'ORDERDESK' || tab === 'OFFLINE') ? (
          <DeviceSection title="OrderDesk-Geräte">
            <DesktopTable headers={['Label', 'Gerätetyp', 'Geräte-ID', 'Tenant-ID', 'DisplayCode', 'PairingToken', 'Status', 'Seriennummer', 'Plattform', 'App-Version', 'Zuletzt aktiv', 'Aktionen']}>
              {orderdeskFiltered
                .filter((row) => tab !== 'OFFLINE' || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online')
                .map((row) => {
                  const status = normalizedStatus(row.lastSeenAt, row.isActive)
                  const pairingToken = ((row as unknown as { pairingToken?: string | null }).pairingToken || '').trim()
                  return (
                    <tr key={row.id} className="border-t border-slate-100 hover:bg-slate-50/70">
                      <td className="py-2.5 font-medium text-slate-800">{row.deviceAlias || 'OrderDesk'}</td>
                      <td>OrderDesk</td>
                      <td className="font-mono text-xs">
                        <div className="flex items-center gap-1.5">
                          <span>{row.id}</span>
                          <button type="button" onClick={() => void copyValue(row.id, 'Geräte-ID')} className="rounded border border-slate-200 px-1.5 py-0.5 text-[10px] font-semibold text-slate-700">Copy</button>
                        </div>
                      </td>
                      <td className="font-mono text-xs">
                        <div className="flex items-center gap-1.5">
                          <span>{row.tenantId}</span>
                          <button type="button" onClick={() => void copyValue(row.tenantId, 'Tenant-ID')} className="rounded border border-slate-200 px-1.5 py-0.5 text-[10px] font-semibold text-slate-700">Copy</button>
                        </div>
                      </td>
                      <td className="font-mono text-xs">{row.displayCode}</td>
                      <td className="font-mono text-xs">
                        <div className="flex items-center gap-1.5">
                          <span>{pairingToken || '—'}</span>
                          {pairingToken ? (
                            <button type="button" onClick={() => void copyValue(pairingToken, 'PairingToken')} className="rounded border border-slate-200 px-1.5 py-0.5 text-[10px] font-semibold text-slate-700">Copy</button>
                          ) : null}
                        </div>
                      </td>
                      <td><StatusBadge status={status} /></td>
                      <td className="font-mono text-xs">{row.deviceSerial}</td>
                      <td>{row.devicePlatform || '—'}</td>
                      <td>{row.appVersion || '—'}</td>
                      <td>{toDeDate(row.lastSeenAt)}</td>
                      <td>
                        <div className="flex flex-wrap gap-1.5">
                          <ActionButton label="Pairing neu" tone="primary" onClick={() => void refreshOrderdeskPairing(row.id)} />
                          <ActionButton label="Gerät zurücksetzen" tone="secondary" onClick={() => void disconnectOrderdesk(row.id, false)} />
                          <ActionButton label="Löschen" tone="danger" onClick={() => void disconnectOrderdesk(row.id, true)} />
                        </div>
                      </td>
                    </tr>
                  )
                })}
            </DesktopTable>
            <MobileCards>
              {orderdeskFiltered
                .filter((row) => tab !== 'OFFLINE' || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online')
                .map((row) => {
                  const status = normalizedStatus(row.lastSeenAt, row.isActive)
                  return (
                    <DeviceCard
                      key={row.id}
                      title={row.deviceAlias || 'OrderDesk'}
                      subtitle={`Display: ${row.displayCode}`}
                      status={status}
                      details={[
                        `Gerätetyp: OrderDesk`,
                        `Geräte-ID: ${row.id}`,
                        `Tenant-ID: ${row.tenantId}`,
                        `Seriennummer: ${row.deviceSerial}`,
                        `Plattform: ${row.devicePlatform || '—'}`,
                        `App-Version: ${row.appVersion || '—'}`,
                        `PairingToken: ${((row as unknown as { pairingToken?: string | null }).pairingToken || '—')}`,
                        `API-URL: https://api.klarando.com`,
                        `Zuletzt aktiv: ${toDeDate(row.lastSeenAt)}`,
                      ]}
                      actions={
                        <div className="mt-3 flex flex-wrap gap-2">
                          <ActionButton label="Pairing neu" tone="primary" onClick={() => void refreshOrderdeskPairing(row.id)} />
                          <ActionButton label="Gerät zurücksetzen" tone="secondary" onClick={() => void disconnectOrderdesk(row.id, false)} />
                          <ActionButton label="Löschen" tone="danger" onClick={() => void disconnectOrderdesk(row.id, true)} />
                        </div>
                      }
                    />
                  )
                })}
            </MobileCards>
          </DeviceSection>
        ) : null}

        {(tab === 'ALL' || tab === 'DRIVER' || tab === 'OFFLINE') ? (
          <DeviceSection title="Fahrergeräte">
            <DesktopTable headers={['Name', 'Filiale', 'Status', 'Zuletzt aktiv']}>
              {driverFiltered
                .filter((row) => tab !== 'OFFLINE' || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online')
                .map((row) => {
                  const status = normalizedStatus(row.lastSeenAt, row.isActive)
                  return (
                    <tr key={row.id} className="border-t border-slate-100 hover:bg-slate-50/70">
                      <td className="py-2.5 font-medium text-slate-800">{row.name}</td>
                      <td>{row.tenantName || '—'}</td>
                      <td><StatusBadge status={status} /></td>
                      <td>{toDeDate(row.lastSeenAt)}</td>
                    </tr>
                  )
                })}
            </DesktopTable>
            <MobileCards>
              {driverFiltered
                .filter((row) => tab !== 'OFFLINE' || normalizedStatus(row.lastSeenAt, row.isActive) !== 'online')
                .map((row) => {
                  const status = normalizedStatus(row.lastSeenAt, row.isActive)
                  return (
                    <DeviceCard
                      key={row.id}
                      title={row.name}
                      subtitle={row.tenantName || 'Filiale unbekannt'}
                      status={status}
                      details={[`Zuletzt aktiv: ${toDeDate(row.lastSeenAt)}`]}
                    />
                  )
                })}
            </MobileCards>
          </DeviceSection>
        ) : null}

        {inactiveCount > 0 ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <button type="button" onClick={() => setShowInactiveSection((current) => !current)} className="flex w-full items-center justify-between text-left">
              <span className="text-sm font-semibold text-slate-800">Inaktive Geräte ({inactiveCount})</span>
              <span className="text-xs text-slate-500">{showInactiveSection ? 'Ausblenden' : 'Einblenden'}</span>
            </button>
            {showInactiveSection ? (
              <p className="mt-3 rounded-xl border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
                Alte oder nicht mehr verbundene Geräte können gelöscht werden.
              </p>
            ) : null}
          </section>
        ) : null}

        {driverPairing ? (
          <div className="fixed inset-0 z-[180] flex items-center justify-center bg-black/45 p-4">
            <div className="w-full max-w-xl rounded-2xl border border-slate-200 bg-white p-4 shadow-2xl">
              <div className="mb-3 flex items-center justify-between">
                <h4 className="text-sm font-semibold text-slate-900">Driver-Kopplungscode</h4>
                <button
                  type="button"
                  className="rounded-lg border border-slate-200 px-2 py-1 text-xs text-slate-700"
                  onClick={() => setDriverPairing(null)}
                >
                  Schließen
                </button>
              </div>
              <img
                src={driverPairing.qrImageUrl}
                alt="Driver Pairing QR-Code"
                className="mx-auto h-52 w-52 rounded-lg border border-slate-200 object-contain"
              />
              <div className="mt-3 space-y-2">
                {[
                  { label: 'API-URL', value: 'https://api.klarando.com' },
                  { label: 'Tenant-ID', value: driverPairing.tenantId },
                  { label: 'Driver-Gerätecode', value: driverPairing.displayCode },
                  { label: 'PairingToken', value: driverPairing.pairingToken },
                ].map((entry) => (
                  <div
                    key={entry.label}
                    className="rounded-lg border border-slate-200 bg-slate-50 px-3 py-2"
                  >
                    <p className="text-[11px] font-semibold uppercase tracking-wide text-slate-500">
                      {entry.label}
                    </p>
                    <div className="mt-1 flex items-center justify-between gap-3">
                      <p className="truncate font-mono text-xs text-slate-800">{entry.value}</p>
                      <button
                        type="button"
                        className="rounded-md border border-slate-300 px-2 py-1 text-[11px] font-semibold text-slate-700"
                        onClick={() => void copyValue(entry.value, entry.label)}
                      >
                        Copy
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        ) : null}
      </div>
    </BackofficeLayout>
  )
}

function StatCard({
  title,
  value,
  hint,
  tone,
}: {
  title: string
  value: number
  hint: string
  tone: 'slate' | 'emerald' | 'amber' | 'rose' | 'zinc'
}) {
  const toneClasses =
    tone === 'emerald'
      ? 'border-emerald-200 bg-emerald-50 text-emerald-700'
      : tone === 'amber'
        ? 'border-amber-200 bg-amber-50 text-amber-700'
        : tone === 'rose'
          ? 'border-rose-200 bg-rose-50 text-rose-700'
          : tone === 'zinc'
            ? 'border-zinc-200 bg-zinc-50 text-zinc-700'
            : 'border-slate-200 bg-slate-50 text-slate-700'
  return (
    <article className={`rounded-2xl border p-3 shadow-sm ${toneClasses}`}>
      <p className="text-xs font-medium">{title}</p>
      <p className="mt-1 text-2xl font-semibold">{value}</p>
      <p className="text-xs opacity-80">{hint}</p>
    </article>
  )
}

function StatusBadge({ status }: { status: StatusKind }) {
  return <span className={`inline-flex rounded-full border px-2 py-0.5 text-xs font-medium ${statusStyle(status)}`}>{statusLabel(status)}</span>
}

function DeviceSection({ title, children }: { title: string; children: ReactNode }) {
  return (
    <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
      <h3 className="mb-3 text-sm font-semibold text-slate-800">{title}</h3>
      {children}
    </section>
  )
}

function DesktopTable({ headers, children }: { headers: string[]; children: ReactNode }) {
  return (
    <div className="hidden overflow-auto lg:block">
      <table className="w-full min-w-[940px] text-sm text-slate-700">
        <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-500">
          <tr>
            {headers.map((header) => (
              <th key={header} className="sticky top-0 px-2 py-2 text-left">{header}</th>
            ))}
          </tr>
        </thead>
        <tbody>{children}</tbody>
      </table>
    </div>
  )
}

function MobileCards({ children }: { children: ReactNode }) {
  return <div className="grid gap-3 lg:hidden">{children}</div>
}

function DeviceCard({
  title,
  subtitle,
  status,
  details,
  actions,
}: {
  title: string
  subtitle: string
  status: StatusKind
  details: string[]
  actions?: ReactNode
}) {
  return (
    <article className="rounded-2xl border border-slate-200 bg-slate-50/70 p-3">
      <div className="flex items-start justify-between gap-3">
        <div>
          <p className="text-sm font-semibold text-slate-800">{title}</p>
          <p className="text-xs text-slate-500">{subtitle}</p>
        </div>
        <StatusBadge status={status} />
      </div>
      <div className="mt-2 space-y-1">
        {details.map((entry) => (
          <p key={entry} className="text-xs text-slate-600">{entry}</p>
        ))}
      </div>
      {actions}
    </article>
  )
}

function ActionButton({
  label,
  tone,
  onClick,
}: {
  label: string
  tone: 'primary' | 'secondary' | 'danger'
  onClick: () => void
}) {
  const classes =
    tone === 'primary'
      ? 'bg-slate-900 text-white hover:bg-slate-800'
      : tone === 'danger'
        ? 'bg-rose-600 text-white hover:bg-rose-500'
        : 'border border-slate-300 bg-white text-slate-700 hover:bg-slate-50'
  return (
    <button type="button" onClick={onClick} className={`rounded-lg px-2.5 py-1.5 text-xs font-semibold transition ${classes}`}>
      {label}
    </button>
  )
}
