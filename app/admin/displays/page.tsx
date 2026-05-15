'use client'

import { FormEvent, useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import { API_BASE_URL } from '@/lib/config'

type SessionUser = {
  role?: string
  tenantId?: string | null
  accessToken?: string | null
}

type DisplayDeviceRow = {
  id: string
  name: string
  status: 'ONLINE' | 'OFFLINE' | 'REVOKED' | 'INSTABLE'
  lastSeenAt: string | null
  screenName?: string | null
  screenId?: string | null
}

type DisplayScreenRow = {
  id: string
  name: string
  layoutType: string
  orientation: string
  resolutionPreset: string
  backgroundColor: string
  accentColor: string
}

type DisplayPlaylistRow = {
  id: string
  name: string
  screenId: string
  isActive: boolean
}

const tabs = [
  { id: 'devices', label: 'Geräte' },
  { id: 'screens', label: 'Bildschirme' },
  { id: 'playlists', label: 'Inhalte / Playlist' },
  { id: 'preview', label: 'Vorschau' },
] as const

type TabId = (typeof tabs)[number]['id']

async function apiRequest<T>(url: string, token: string, init?: RequestInit): Promise<T> {
  const response = await fetch(`${API_BASE_URL}${url}`, {
    ...init,
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`,
      ...(init?.headers || {}),
    },
  })
  const data = await response.json().catch(() => ({}))
  if (!response.ok) {
    throw new Error(data?.message || data?.error || 'Anfrage fehlgeschlagen.')
  }
  return data as T
}

export default function AdminDisplaysPage() {
  const [tab, setTab] = useState<TabId>('devices')
  const [token, setToken] = useState('')
  const [tenantId, setTenantId] = useState('')
  const [tenantLocked, setTenantLocked] = useState(true)

  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const [devices, setDevices] = useState<DisplayDeviceRow[]>([])
  const [screens, setScreens] = useState<DisplayScreenRow[]>([])
  const [playlists, setPlaylists] = useState<DisplayPlaylistRow[]>([])

  const [pairingToken, setPairingToken] = useState('')
  const [pairingCode, setPairingCode] = useState('')
  const [displayName, setDisplayName] = useState('')
  const [claimScreenId, setClaimScreenId] = useState('')
  const [claimDisplayId, setClaimDisplayId] = useState('')
  const [createNewScreenOnClaim, setCreateNewScreenOnClaim] = useState(false)

  const [screenName, setScreenName] = useState('')
  const [screenLayoutType, setScreenLayoutType] = useState('MENU_BOARD')
  const [screenOrientation, setScreenOrientation] = useState('LANDSCAPE')

  const [playlistName, setPlaylistName] = useState('')
  const [playlistScreenId, setPlaylistScreenId] = useState('')
  const [selectedPlaylistId, setSelectedPlaylistId] = useState('')
  const [itemType, setItemType] = useState('CUSTOM_TEXT')
  const [itemDuration, setItemDuration] = useState(10)
  const [itemConfig, setItemConfig] = useState('{"text":"Willkommen bei Klarando"}')

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null
    const accessToken = parsed?.accessToken || localStorage.getItem('accessToken') || ''
    if (!accessToken) {
      window.location.href = '/'
      return
    }
    setToken(accessToken)

    const role = `${parsed?.role || ''}`.toLowerCase()
    if (role === 'superadmin') {
      setTenantLocked(false)
      setTenantId(parsed?.tenantId || '')
    } else {
      setTenantLocked(true)
      setTenantId(parsed?.tenantId || '')
    }
  }, [])

  const previewUrl = useMemo(() => {
    if (!token) return ''
    return `${window.location.origin}/display-client?kiosk=1&displayApp=1&preview=1`
  }, [token])

  function openScreenPreview(screenId: string) {
    const boundDevice = devices.find((device) => device.screenId === screenId)
    if (!boundDevice?.id) {
      setError('Bildschirm wurde nicht gefunden. Bitte zuerst ein Gerät zuordnen.')
      return
    }
    window.open(`/screen/${boundDevice.id}?kiosk=1&preview=1`, '_blank', 'noopener,noreferrer')
  }

  async function loadAll() {
    if (!token || !tenantId) return
    try {
      setLoading(true)
      setError('')
      const list = await apiRequest<{ devices: DisplayDeviceRow[] }>(
        `/api/admin/displays?tenantId=${encodeURIComponent(tenantId)}`,
        token
      )
      setDevices(list.devices || [])

      const screenResponse = await fetch(`${API_BASE_URL}/api/admin/displays/screens?tenantId=${encodeURIComponent(tenantId)}`, {
        headers: { Authorization: `Bearer ${token}` },
      })
      const parsedScreens = await screenResponse.json().catch(() => ({ screens: [] }))
      setScreens(Array.isArray(parsedScreens.screens) ? parsedScreens.screens : [])

      const playlistResponse = await fetch(`${API_BASE_URL}/api/admin/displays/playlists?tenantId=${encodeURIComponent(tenantId)}`, {
        headers: { Authorization: `Bearer ${token}` },
      })
      const parsedPlaylists = await playlistResponse.json().catch(() => ({ playlists: [] }))
      setPlaylists(Array.isArray(parsedPlaylists.playlists) ? parsedPlaylists.playlists : [])
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Daten konnten nicht geladen werden.')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadAll()
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [token, tenantId])

  useEffect(() => {
    if (!token || !tenantId) return
    const interval = window.setInterval(() => {
      void loadAll()
    }, 15000)
    return () => window.clearInterval(interval)
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [token, tenantId])

  async function claimPairing(event: FormEvent) {
    event.preventDefault()
    if (!tenantId) {
      setError('Bitte Tenant auswählen.')
      return
    }
    try {
      setLoading(true)
      setError('')
      setSuccess('')
      await apiRequest('/api/admin/displays/pairing/claim', token, {
        method: 'POST',
        body: JSON.stringify({
          tenantId,
          screenId: createNewScreenOnClaim ? null : claimScreenId || null,
          displayId: createNewScreenOnClaim ? null : claimDisplayId || null,
          pairingToken: pairingToken || null,
          pairingCode: pairingCode || null,
          displayName: displayName || null,
        }),
      })
      setSuccess('Display erfolgreich verbunden.')
      setPairingToken('')
      setPairingCode('')
      setDisplayName('')
      setClaimDisplayId('')
      setClaimScreenId('')
      setCreateNewScreenOnClaim(false)
      await loadAll()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Display konnte nicht verbunden werden.')
    } finally {
      setLoading(false)
    }
  }

  async function createScreen(event: FormEvent) {
    event.preventDefault()
    if (!tenantId) return
    try {
      setLoading(true)
      setError('')
      await apiRequest('/api/admin/displays/screens', token, {
        method: 'POST',
        body: JSON.stringify({
          tenantId,
          name: screenName,
          layoutType: screenLayoutType,
          orientation: screenOrientation,
        }),
      })
      setSuccess('Screen erstellt.')
      setScreenName('')
      await loadAll()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Screen konnte nicht erstellt werden.')
    } finally {
      setLoading(false)
    }
  }

  async function createPlaylist(event: FormEvent) {
    event.preventDefault()
    if (!tenantId) return
    try {
      setLoading(true)
      setError('')
      await apiRequest('/api/admin/displays/playlists', token, {
        method: 'POST',
        body: JSON.stringify({
          tenantId,
          screenId: playlistScreenId,
          name: playlistName,
          isActive: true,
        }),
      })
      setSuccess('Playlist erstellt.')
      setPlaylistName('')
      await loadAll()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Playlist konnte nicht erstellt werden.')
    } finally {
      setLoading(false)
    }
  }

  async function addPlaylistItem(event: FormEvent) {
    event.preventDefault()
    if (!tenantId || !selectedPlaylistId) return
    try {
      setLoading(true)
      setError('')
      await apiRequest(`/api/admin/displays/playlists/${selectedPlaylistId}/items`, token, {
        method: 'POST',
        body: JSON.stringify({
          tenantId,
          type: itemType,
          durationSeconds: itemDuration,
          config: JSON.parse(itemConfig),
        }),
      })
      setSuccess('Playlist-Element hinzugefügt.')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Playlist-Element konnte nicht erstellt werden.')
    } finally {
      setLoading(false)
    }
  }

  async function revokeDevice(deviceId: string) {
    if (!tenantId) return
    try {
      setLoading(true)
      setError('')
      await apiRequest(`/api/admin/displays/${deviceId}/revoke`, token, {
        method: 'POST',
        body: JSON.stringify({ tenantId }),
      })
      setSuccess('Gerät wurde getrennt.')
      await loadAll()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Gerät konnte nicht getrennt werden.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <AdminLayout title="Displays" subtitle="Neues Klarando Display-System (Pairing, Screens, Playlist)">
      <div className="mb-4 flex flex-wrap gap-2">
        {tabs.map((entry) => (
          <button
            key={entry.id}
            type="button"
            onClick={() => setTab(entry.id)}
            className={`rounded-xl px-4 py-2 text-sm font-semibold ${tab === entry.id ? 'bg-slate-900 text-white' : 'bg-white text-slate-700 ring-1 ring-slate-200'}`}
          >
            {entry.label}
          </button>
        ))}
      </div>

      {!tenantLocked ? (
        <div className="mb-4 rounded-2xl bg-white p-4 ring-1 ring-slate-200">
          <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-slate-500">Tenant-ID</label>
          <input
            className="w-full rounded-xl border border-slate-200 px-3 py-2 text-sm"
            value={tenantId}
            onChange={(event) => setTenantId(event.target.value)}
            placeholder="Tenant-ID eingeben"
          />
        </div>
      ) : null}

      {error ? <div className="mb-3 rounded-xl border border-red-200 bg-red-50 px-3 py-2 text-sm text-red-700">{error}</div> : null}
      {success ? <div className="mb-3 rounded-xl border border-emerald-200 bg-emerald-50 px-3 py-2 text-sm text-emerald-700">{success}</div> : null}

      {tab === 'devices' ? (
        <div className="space-y-4">
          <form onSubmit={claimPairing} className="rounded-2xl bg-white p-4 ring-1 ring-slate-200">
            <h2 className="mb-3 text-lg font-semibold">Display verbinden</h2>
            <p className="mb-3 text-sm text-slate-600">1) Pairing-Code/Token eingeben, 2) vorhandenes Display wählen, 3) verbinden.</p>
            <div className="grid gap-3 md:grid-cols-2">
              <input className="rounded-xl border border-slate-200 px-3 py-2 text-sm" placeholder="Pairing-Token" value={pairingToken} onChange={(event) => setPairingToken(event.target.value)} />
              <input className="rounded-xl border border-slate-200 px-3 py-2 text-sm" placeholder="Pairing-Code" value={pairingCode} onChange={(event) => setPairingCode(event.target.value)} />
              <input className="rounded-xl border border-slate-200 px-3 py-2 text-sm" placeholder="Displayname" value={displayName} onChange={(event) => setDisplayName(event.target.value)} />
              <div className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm text-slate-700">
                {createNewScreenOnClaim
                  ? 'Neuer Bildschirm wird beim Verbinden automatisch erstellt'
                  : claimDisplayId
                  ? `Ausgewähltes Display: ${devices.find((device) => device.id === claimDisplayId)?.name || '-'}`
                  : 'Noch kein bestehendes Display ausgewählt'}
              </div>
            </div>
            <div className="mt-3 flex flex-wrap gap-2">
              <button disabled={loading || (!createNewScreenOnClaim && !claimDisplayId)} className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white disabled:cursor-not-allowed disabled:opacity-60">Display verbinden</button>
              <button
                type="button"
                onClick={() => {
                  setCreateNewScreenOnClaim(true)
                  setClaimDisplayId('')
                  setClaimScreenId('')
                }}
                className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-semibold text-slate-800 hover:bg-slate-100"
              >
                Neuen Bildschirm erstellen und verbinden
              </button>
            </div>
          </form>

          <div className="rounded-2xl bg-white p-4 ring-1 ring-slate-200">
            <h2 className="mb-3 text-lg font-semibold">Vorhandene Bildschirme</h2>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {devices.map((device) => {
                const isOnline = device.status === 'ONLINE'
                const selected = claimDisplayId === device.id
                const inferredType =
                  (screens.find((screen) => screen.id === device.screenId)?.layoutType ?? 'MENU_BOARD')
                const typeLabel =
                  inferredType === 'ORDER_STATUS'
                    ? 'Abholmonitor'
                    : inferredType === 'PROMO_SPLIT'
                    ? 'TV-Menüboard'
                    : inferredType === 'SLIDESHOW'
                    ? 'Bestell-Display'
                    : 'Küchenmonitor'
                return (
                  <div
                    key={`select-device-${device.id}`}
                    className={`rounded-2xl border p-3 ${selected ? 'border-slate-900 bg-slate-50' : 'border-slate-200'}`}
                  >
                    <div className="mb-2 flex items-center justify-between gap-2">
                      <p className="font-semibold text-slate-900">{device.name}</p>
                      <span className={`h-2.5 w-2.5 rounded-full ${isOnline ? 'bg-emerald-500' : 'bg-rose-500'}`} />
                    </div>
                    <p className="text-xs text-slate-600">Typ: {typeLabel}</p>
                    <p className="text-xs text-slate-600">Status: {isOnline ? 'Online' : 'Offline'}</p>
                    <p className="text-xs text-slate-600">
                      Zuletzt online: {device.lastSeenAt ? new Date(device.lastSeenAt).toLocaleString('de-DE') : '-'}
                    </p>
                    <button
                      type="button"
                      onClick={() => {
                        setCreateNewScreenOnClaim(false)
                        setClaimDisplayId(device.id)
                        if (device.screenId) setClaimScreenId(device.screenId)
                        setDisplayName(device.name)
                        setSuccess('')
                      }}
                      className="mt-3 w-full rounded-lg border border-slate-300 px-3 py-2 text-xs font-semibold text-slate-800 hover:bg-slate-100"
                    >
                      Dieses Gerät verbinden
                    </button>
                  </div>
                )
              })}
              {devices.length === 0 ? <p className="text-sm text-slate-500">Noch keine Bildschirme vorhanden. Dann bitte zuerst „Neuen Bildschirm erstellen“ unter Tab „Bildschirme“ nutzen.</p> : null}
            </div>
          </div>

          <div className="rounded-2xl bg-white p-4 ring-1 ring-slate-200">
            <h2 className="mb-3 text-lg font-semibold">Geräte</h2>
            <div className="space-y-2">
              {devices.map((device) => (
                <div key={device.id} className="flex flex-wrap items-center justify-between gap-2 rounded-xl border border-slate-200 px-3 py-2">
                  <div>
                    <p className="font-semibold">{device.name}</p>
                    <p className="text-xs text-slate-500">{device.status} · Letzter Kontakt: {device.lastSeenAt ? new Date(device.lastSeenAt).toLocaleString('de-DE') : '-'}</p>
                    <p className="text-xs text-slate-500">Screen: {device.screenName || '-'}</p>
                  </div>
                  <button type="button" onClick={() => void revokeDevice(device.id)} className="rounded-lg border border-red-200 px-3 py-1.5 text-xs font-semibold text-red-700">Trennen</button>
                </div>
              ))}
              {devices.length === 0 ? <p className="text-sm text-slate-500">Noch keine Geräte verbunden.</p> : null}
            </div>
          </div>
        </div>
      ) : null}

      {tab === 'screens' ? (
        <div className="space-y-4">
          <form onSubmit={createScreen} className="rounded-2xl bg-white p-4 ring-1 ring-slate-200">
            <h2 className="mb-3 text-lg font-semibold">Screen erstellen</h2>
            <div className="grid gap-3 md:grid-cols-3">
              <input className="rounded-xl border border-slate-200 px-3 py-2 text-sm" placeholder="Name" value={screenName} onChange={(event) => setScreenName(event.target.value)} />
              <select className="rounded-xl border border-slate-200 px-3 py-2 text-sm" value={screenLayoutType} onChange={(event) => setScreenLayoutType(event.target.value)}>
                <option value="MENU_BOARD">Menu Board</option>
                <option value="SLIDESHOW">Slideshow</option>
                <option value="PROMO_SPLIT">Promo Split</option>
                <option value="ORDER_STATUS">Order Status</option>
              </select>
              <select className="rounded-xl border border-slate-200 px-3 py-2 text-sm" value={screenOrientation} onChange={(event) => setScreenOrientation(event.target.value)}>
                <option value="LANDSCAPE">Querformat</option>
                <option value="PORTRAIT">Hochformat</option>
              </select>
            </div>
            <button disabled={loading} className="mt-3 rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white">Screen speichern</button>
          </form>

          <div className="rounded-2xl bg-white p-4 ring-1 ring-slate-200">
            <h2 className="mb-3 text-lg font-semibold">Bildschirme</h2>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {screens.map((screen) => (
                <div key={screen.id} className="rounded-2xl border border-slate-200 p-3">
                  <p className="font-semibold text-slate-900">{screen.name}</p>
                  <p className="text-xs text-slate-500">{screen.layoutType} · {screen.orientation} · {screen.resolutionPreset}</p>
                  <p className="mt-1 text-xs text-slate-500">
                    Status: {devices.some((device) => device.screenId === screen.id && device.status === 'ONLINE') ? 'Online' : 'Offline'}
                  </p>
                  <p className="text-xs text-slate-500">Design: {screen.layoutType}</p>
                  <div className="mt-3 flex flex-wrap gap-2">
                    <button
                      type="button"
                      onClick={() => openScreenPreview(screen.id)}
                      className="rounded-lg border border-slate-300 px-2.5 py-1.5 text-xs font-semibold text-slate-700 hover:bg-slate-100"
                    >
                      Vorschau öffnen
                    </button>
                    <button
                      type="button"
                      onClick={() => {
                        setTab('devices')
                        setCreateNewScreenOnClaim(false)
                        setClaimScreenId(screen.id)
                        const existingDevice = devices.find((device) => device.screenId === screen.id)
                        if (existingDevice) {
                          setClaimDisplayId(existingDevice.id)
                          setDisplayName(existingDevice.name)
                        } else {
                          setClaimDisplayId('')
                          setDisplayName(screen.name)
                        }
                      }}
                      className="rounded-lg border border-slate-300 px-2.5 py-1.5 text-xs font-semibold text-slate-700 hover:bg-slate-100"
                    >
                      Gerät verbinden
                    </button>
                    {devices
                      .filter((device) => device.screenId === screen.id)
                      .slice(0, 1)
                      .map((device) => (
                        <button
                          key={`deactivate-${screen.id}-${device.id}`}
                          type="button"
                          onClick={() => void revokeDevice(device.id)}
                          className="rounded-lg border border-rose-300 px-2.5 py-1.5 text-xs font-semibold text-rose-700 hover:bg-rose-50"
                        >
                          Deaktivieren
                        </button>
                      ))}
                  </div>
                </div>
              ))}
              {screens.length === 0 ? <p className="text-sm text-slate-500">Noch keine Bildschirme vorhanden.</p> : null}
            </div>
          </div>
        </div>
      ) : null}

      {tab === 'playlists' ? (
        <div className="space-y-4">
          <form onSubmit={createPlaylist} className="rounded-2xl bg-white p-4 ring-1 ring-slate-200">
            <h2 className="mb-3 text-lg font-semibold">Playlist erstellen</h2>
            <div className="grid gap-3 md:grid-cols-2">
              <input className="rounded-xl border border-slate-200 px-3 py-2 text-sm" placeholder="Playlist-Name" value={playlistName} onChange={(event) => setPlaylistName(event.target.value)} />
              <select className="rounded-xl border border-slate-200 px-3 py-2 text-sm" value={playlistScreenId} onChange={(event) => setPlaylistScreenId(event.target.value)}>
                <option value="">Screen wählen</option>
                {screens.map((screen) => <option key={screen.id} value={screen.id}>{screen.name}</option>)}
              </select>
            </div>
            <button disabled={loading} className="mt-3 rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white">Playlist speichern</button>
          </form>

          <form onSubmit={addPlaylistItem} className="rounded-2xl bg-white p-4 ring-1 ring-slate-200">
            <h2 className="mb-3 text-lg font-semibold">Playlist-Element hinzufügen</h2>
            <div className="grid gap-3 md:grid-cols-3">
              <select className="rounded-xl border border-slate-200 px-3 py-2 text-sm" value={selectedPlaylistId} onChange={(event) => setSelectedPlaylistId(event.target.value)}>
                <option value="">Playlist wählen</option>
                {playlists.map((playlist) => <option key={playlist.id} value={playlist.id}>{playlist.name}</option>)}
              </select>
              <select className="rounded-xl border border-slate-200 px-3 py-2 text-sm" value={itemType} onChange={(event) => setItemType(event.target.value)}>
                <option value="PRODUCT_GRID">Produkt Grid</option>
                <option value="CATEGORY_MENU">Kategorie Menü</option>
                <option value="IMAGE">Bild</option>
                <option value="VIDEO">Video</option>
                <option value="PROMOTION">Promotion</option>
                <option value="URL">URL</option>
                <option value="CUSTOM_TEXT">Text</option>
              </select>
              <input type="number" min={1} className="rounded-xl border border-slate-200 px-3 py-2 text-sm" value={itemDuration} onChange={(event) => setItemDuration(Number(event.target.value))} />
            </div>
            <textarea className="mt-3 min-h-[120px] w-full rounded-xl border border-slate-200 px-3 py-2 text-sm font-mono" value={itemConfig} onChange={(event) => setItemConfig(event.target.value)} />
            <button disabled={loading} className="mt-3 rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white">Element speichern</button>
          </form>
        </div>
      ) : null}

      {tab === 'preview' ? (
        <div className="space-y-3 rounded-2xl bg-white p-4 ring-1 ring-slate-200">
          <h2 className="text-lg font-semibold">Vorschau</h2>
          <p className="text-sm text-slate-600">Kiosk-Vorschau ohne Cookie-Banner.</p>
          <button type="button" onClick={() => window.open(previewUrl, '_blank', 'noopener,noreferrer')} className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white">
            Vorschau öffnen
          </button>
        </div>
      ) : null}
    </AdminLayout>
  )
}
