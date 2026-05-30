'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createPublicDriverDeviceSession,
  createAccessUser,
  deleteAccessUser,
  getAccessUsers,
  getBusinessSettings,
  getOrderDisplays,
  getPublicActiveDriverDevices,
  revokePublicDriverDeviceSession,
  updateAccessUser,
  updateBusinessSettings,
  type AccessUser,
  type BusinessSettings,
  type DriverDeviceSession,
  type DriverDeviceSessionCreateResponse,
  type OrderDisplay,
} from '@/lib/api'

function readAccessToken() {
  if (typeof window === 'undefined') {
    return ''
  }
  return window.localStorage.getItem('accessToken') || ''
}

function readTenantId() {
  if (typeof window === 'undefined') {
    return ''
  }
  return window.localStorage.getItem('tenantId') || ''
}

export default function AdminDriversPage() {
  const [drivers, setDrivers] = useState<AccessUser[]>([])
  const [settings, setSettings] = useState<BusinessSettings | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [displays, setDisplays] = useState<OrderDisplay[]>([])
  const [selectedDisplayCode, setSelectedDisplayCode] = useState('')
  const [driverDeviceLabel, setDriverDeviceLabel] = useState('')
  const [driverDeviceHours, setDriverDeviceHours] = useState('12')
  const [driverDeviceQr, setDriverDeviceQr] = useState<DriverDeviceSessionCreateResponse | null>(null)
  const [activeDeviceSessions, setActiveDeviceSessions] = useState<DriverDeviceSession[]>([])
  const [loadingDeviceSessions, setLoadingDeviceSessions] = useState(false)
  const [creatingDeviceSession, setCreatingDeviceSession] = useState(false)
  const [revokingDeviceSessionId, setRevokingDeviceSessionId] = useState<string | null>(null)
  const [copyInfo, setCopyInfo] = useState('')

  const [newName, setNewName] = useState('')
  const [newEmail, setNewEmail] = useState('')
  const [newPassword, setNewPassword] = useState('')

  const driverCountActive = useMemo(
    () => drivers.filter((entry) => entry.isActive).length,
    [drivers]
  )
  const driverDevicesByUserId = useMemo(() => {
    const grouped = new Map<string, DriverDeviceSession[]>()
    for (const session of activeDeviceSessions) {
      if (!session.isActive || !session.driverUserId) {
        continue
      }
      const existing = grouped.get(session.driverUserId) || []
      existing.push(session)
      grouped.set(session.driverUserId, existing)
    }
    return grouped
  }, [activeDeviceSessions])

  async function copyManualValue(value: string, label: string) {
    if (!value.trim()) return
    try {
      await navigator.clipboard.writeText(value)
      setCopyInfo(`${label} kopiert`)
      window.setTimeout(() => setCopyInfo(''), 1800)
    } catch {
      setCopyInfo(`Kopieren fehlgeschlagen (${label})`)
      window.setTimeout(() => setCopyInfo(''), 2200)
    }
  }

  async function loadData() {
    try {
      setLoading(true)
      setError('')

      const token = readAccessToken()
      if (!token) {
        throw new Error('Session abgelaufen. Bitte neu einloggen.')
      }

      const [users, businessSettings, displayList] = await Promise.all([
        getAccessUsers(token),
        getBusinessSettings(),
        getOrderDisplays().catch(() => [] as OrderDisplay[]),
      ])

      const resolvedDisplays = displayList
        .filter((entry) => entry.displayRole === 'CASH')
        .sort((left, right) => left.name.localeCompare(right.name))

      setDrivers(
        users
          .filter((entry) => entry.role === 'DRIVER')
          .sort((left, right) => left.name.localeCompare(right.name))
      )
      setSettings(businessSettings)
      setDisplays(resolvedDisplays)
      setSelectedDisplayCode((current) => {
        if (current && resolvedDisplays.some((entry) => entry.displayCode === current)) {
          return current
        }
        return resolvedDisplays[0]?.displayCode || ''
      })
    } catch (loadError) {
      setError(
        loadError instanceof Error ? loadError.message : 'Fahrerdaten konnten nicht geladen werden'
      )
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadData()
  }, [])

  async function loadActiveDeviceSessions(displayCode: string) {
    if (!displayCode) {
      setActiveDeviceSessions([])
      return
    }

    try {
      setLoadingDeviceSessions(true)
      const response = await getPublicActiveDriverDevices(displayCode)
      setActiveDeviceSessions(response.sessions)
    } catch (sessionError) {
      setError(
        sessionError instanceof Error
          ? sessionError.message
          : 'Fahrgeräte konnten nicht geladen werden'
      )
    } finally {
      setLoadingDeviceSessions(false)
    }
  }

  useEffect(() => {
    if (!selectedDisplayCode) {
      setActiveDeviceSessions([])
      return
    }
    void loadActiveDeviceSessions(selectedDisplayCode)
  }, [selectedDisplayCode])

  async function saveDriverSettings(event: React.FormEvent) {
    event.preventDefault()
    if (!settings) {
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      const saved = await updateBusinessSettings(settings)
      setSettings(saved)
      setSuccess('Fahrer-Einstellungen gespeichert.')
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'Fahrer-Einstellungen konnten nicht gespeichert werden'
      )
    } finally {
      setSaving(false)
    }
  }

  async function createDriver(event: React.FormEvent) {
    event.preventDefault()

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      const token = readAccessToken()
      if (!token) {
        throw new Error('Session abgelaufen. Bitte neu einloggen.')
      }

      const tenantId = readTenantId() || null
      await createAccessUser(token, {
        email: newEmail,
        name: newName,
        password: newPassword,
        role: 'DRIVER',
        tenantId,
      })

      setNewName('')
      setNewEmail('')
      setNewPassword('')
      setSuccess('Fahrer wurde angelegt.')
      await loadData()
    } catch (createError) {
      setError(
        createError instanceof Error ? createError.message : 'Fahrer konnte nicht angelegt werden'
      )
    } finally {
      setSaving(false)
    }
  }

  async function toggleDriverActive(driver: AccessUser) {
    try {
      setSaving(true)
      setError('')
      setSuccess('')

      const token = readAccessToken()
      if (!token) {
        throw new Error('Session abgelaufen. Bitte neu einloggen.')
      }

      await updateAccessUser(token, driver.id, {
        isActive: !driver.isActive,
      })

      setSuccess(`Fahrerstatus aktualisiert: ${driver.name}`)
      await loadData()
    } catch (toggleError) {
      setError(
        toggleError instanceof Error ? toggleError.message : 'Fahrerstatus konnte nicht geändert werden'
      )
    } finally {
      setSaving(false)
    }
  }

  async function removeDriver(driver: AccessUser) {
    if (!window.confirm(`Fahrer "${driver.name}" wirklich löschen?`)) {
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      const token = readAccessToken()
      if (!token) {
        throw new Error('Session abgelaufen. Bitte neu einloggen.')
      }

      await deleteAccessUser(token, driver.id)
      setSuccess(`Fahrer gelöscht: ${driver.name}`)
      await loadData()
    } catch (deleteError) {
      setError(
        deleteError instanceof Error ? deleteError.message : 'Fahrer konnte nicht gelöscht werden'
      )
    } finally {
      setSaving(false)
    }
  }

  async function createDriverDeviceQr() {
    if (!selectedDisplayCode) {
      setError('Bitte zuerst ein Kassendisplay auswählen.')
      return
    }
    const parsedHours = Number(driverDeviceHours)
    if (!Number.isFinite(parsedHours) || parsedHours < 1 || parsedHours > 168) {
      setError('Zugangszeit muss zwischen 1 und 168 Stunden liegen.')
      return
    }

    try {
      setCreatingDeviceSession(true)
      setError('')
      setSuccess('')
      const response = await createPublicDriverDeviceSession(selectedDisplayCode, {
        accessHours: Math.round(parsedHours),
        deviceLabel: driverDeviceLabel.trim() || undefined,
      })
      setDriverDeviceQr(response)
      setDriverDeviceLabel(response.deviceLabel)
      setSuccess('Fahrgerät-QR wurde erstellt.')
      await loadActiveDeviceSessions(selectedDisplayCode)
    } catch (createError) {
      setError(
        createError instanceof Error
          ? createError.message
          : 'Fahrgerät-QR konnte nicht erstellt werden'
      )
    } finally {
      setCreatingDeviceSession(false)
    }
  }

  async function revokeDriverDevice(sessionId: string) {
    if (!selectedDisplayCode) {
      return
    }

    try {
      setRevokingDeviceSessionId(sessionId)
      setError('')
      setSuccess('')
      await revokePublicDriverDeviceSession(selectedDisplayCode, sessionId)
      if (driverDeviceQr?.sessionId === sessionId) {
        setDriverDeviceQr(null)
      }
      setSuccess('Fahrgerät wurde getrennt.')
      await loadActiveDeviceSessions(selectedDisplayCode)
    } catch (revokeError) {
      setError(
        revokeError instanceof Error
          ? revokeError.message
          : 'Fahrgerät konnte nicht getrennt werden'
      )
    } finally {
      setRevokingDeviceSessionId(null)
    }
  }

  return (
    <AdminLayout
      title="Fahrer Einstellungen"
      subtitle="Fahrer-Zugänge verwalten und Lieferfahrer-Logik je Filiale konfigurieren"
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
      {copyInfo ? (
        <div className="mb-4 rounded-2xl border border-blue-200 bg-blue-50 px-4 py-3 text-sm text-blue-700">
          {copyInfo}
        </div>
      ) : null}

      <div className="mb-6 grid gap-3 sm:grid-cols-3">
        <div className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3">
          <p className="text-xs uppercase tracking-wide text-rose-900/70">Fahrer gesamt</p>
          <p className="mt-1 text-2xl font-bold text-slate-900">{drivers.length}</p>
        </div>
        <div className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3">
          <p className="text-xs uppercase tracking-wide text-rose-900/70">Aktiv</p>
          <p className="mt-1 text-2xl font-bold text-emerald-700">{driverCountActive}</p>
        </div>
        <div className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3">
          <p className="text-xs uppercase tracking-wide text-rose-900/70">Inaktiv</p>
          <p className="mt-1 text-2xl font-bold text-rose-700">{Math.max(0, drivers.length - driverCountActive)}</p>
        </div>
      </div>

      <div className="grid gap-6 xl:grid-cols-[420px_1fr]">
        <section className="space-y-6">
          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Neuer Fahrer</h2>
            <p className="mt-1 text-sm text-rose-900/70">Fahrerzugang für diese Filiale anlegen.</p>

            <form onSubmit={createDriver} className="mt-4 space-y-3">
              <InputField label="Name" value={newName} setValue={setNewName} required />
              <InputField label="E-Mail" type="email" value={newEmail} setValue={setNewEmail} required />
              <InputField
                label="Passwort"
                type="password"
                value={newPassword}
                setValue={setNewPassword}
                required
              />
              <button
                type="submit"
                disabled={saving}
                className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
              >
                {saving ? 'Speichert...' : 'Fahrer anlegen'}
              </button>
            </form>
          </article>

          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Fahrer-Logik</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Regeln für Fahrer-App, Tracking und Auftragsgrenzen.
            </p>

            {settings ? (
              <form onSubmit={saveDriverSettings} className="mt-4 space-y-3">
                <label className="flex items-center gap-2 text-sm font-medium text-rose-900/85">
                  <input
                    type="checkbox"
                    checked={settings.driver.enabled}
                    onChange={(event) =>
                      setSettings((current) =>
                        current
                          ? {
                              ...current,
                              driver: {
                                ...current.driver,
                                enabled: event.target.checked,
                              },
                            }
                          : current
                      )
                    }
                  />
                  Fahrerfunktion aktiv
                </label>

                <label className="flex items-center gap-2 text-sm font-medium text-rose-900/85">
                  <input
                    type="checkbox"
                    checked={settings.driver.allowOwnDevice}
                    onChange={(event) =>
                      setSettings((current) =>
                        current
                          ? {
                              ...current,
                              driver: {
                                ...current.driver,
                                allowOwnDevice: event.target.checked,
                              },
                            }
                          : current
                      )
                    }
                  />
                  Eigene Handys der Fahrer erlauben
                </label>

                <InputField
                  label="Standard-Zugangszeit (Stunden)"
                  type="number"
                  value={String(settings.driver.defaultAccessHours)}
                  setValue={(value) =>
                    setSettings((current) =>
                      current
                        ? {
                            ...current,
                            driver: {
                              ...current.driver,
                              defaultAccessHours: Number(value || 0),
                            },
                          }
                        : current
                    )
                  }
                  required
                />

                <InputField
                  label="Max. gleichzeitige Lieferungen je Fahrer"
                  type="number"
                  value={String(settings.driver.maxActiveOrders)}
                  setValue={(value) =>
                    setSettings((current) =>
                      current
                        ? {
                            ...current,
                            driver: {
                              ...current.driver,
                              maxActiveOrders: Number(value || 0),
                            },
                          }
                        : current
                    )
                  }
                  required
                />

                <label className="flex items-center gap-2 text-sm font-medium text-rose-900/85">
                  <input
                    type="checkbox"
                    checked={settings.driver.locationTrackingEnabled}
                    onChange={(event) =>
                      setSettings((current) =>
                        current
                          ? {
                              ...current,
                              driver: {
                                ...current.driver,
                                locationTrackingEnabled: event.target.checked,
                              },
                            }
                          : current
                      )
                    }
                  />
                  Standorttracking für Fahrer aktiv
                </label>

                <InputField
                  label="Tracking-Intervall (Sekunden)"
                  type="number"
                  value={String(settings.driver.locationUpdateSeconds)}
                  setValue={(value) =>
                    setSettings((current) =>
                      current
                        ? {
                            ...current,
                            driver: {
                              ...current.driver,
                              locationUpdateSeconds: Number(value || 0),
                            },
                          }
                        : current
                    )
                  }
                  required
                />

                <label className="flex items-center gap-2 text-sm font-medium text-rose-900/85">
                  <input
                    type="checkbox"
                    checked={settings.driver.customerLiveTrackingEnabled}
                    onChange={(event) =>
                      setSettings((current) =>
                        current
                          ? {
                              ...current,
                              driver: {
                                ...current.driver,
                                customerLiveTrackingEnabled: event.target.checked,
                              },
                            }
                          : current
                      )
                    }
                  />
                  Live-Tracking in der Kunden-App anzeigen
                </label>

                <button
                  type="submit"
                  disabled={saving}
                  className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
                >
                  {saving ? 'Speichert...' : 'Fahrer-Einstellungen speichern'}
                </button>
              </form>
            ) : (
              <p className="mt-4 text-sm text-rose-900/70">
                {loading ? 'Lade Einstellungen...' : 'Keine Einstellungen geladen.'}
              </p>
            )}
          </article>

          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Fahrgerät per QR</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Kassendisplay wählen, QR erstellen und verbundene Fahrgeräte verwalten.
            </p>

            <div className="mt-4 space-y-3">
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Kassendisplay</span>
                <select
                  value={selectedDisplayCode}
                  onChange={(event) => setSelectedDisplayCode(event.target.value)}
                  className="input-ui"
                >
                  <option value="">Bitte wählen</option>
                  {displays.map((display) => (
                    <option key={display.id} value={display.displayCode}>
                      {display.name} ({display.displayCode})
                    </option>
                  ))}
                </select>
              </label>

              <InputField
                label="Gerätename"
                value={driverDeviceLabel}
                setValue={setDriverDeviceLabel}
              />
              <InputField
                label="Zugangszeit (Stunden)"
                type="number"
                value={driverDeviceHours}
                setValue={setDriverDeviceHours}
              />

              <button
                type="button"
                onClick={() => void createDriverDeviceQr()}
                disabled={creatingDeviceSession || !selectedDisplayCode}
                className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
              >
                {creatingDeviceSession ? 'QR wird erstellt...' : 'Fahrgerät-QR erstellen'}
              </button>
            </div>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] p-3">
              {driverDeviceQr?.qrImageUrl ? (
                <div className="space-y-3 text-center">
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img
                    src={driverDeviceQr.qrImageUrl}
                    alt="Fahrgerät QR"
                    className="mx-auto h-56 w-56 rounded-2xl border border-[var(--brand-border)] bg-white p-2"
                  />
                  <p className="mt-2 text-sm font-semibold text-slate-900">{driverDeviceQr.deviceLabel}</p>
                  <p className="text-xs text-rose-900/70">
                    Gültig bis {new Date(driverDeviceQr.expiresAt).toLocaleString('de-DE')}
                  </p>
                  <div className="space-y-2 text-left">
                    {[
                      { label: 'API-URL', value: 'https://api.klarando.com' },
                      { label: 'Tenant-ID', value: driverDeviceQr.tenantId },
                      { label: 'Driver-Gerätecode', value: driverDeviceQr.displayCode },
                      { label: 'PairingToken', value: driverDeviceQr.pairingToken },
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
                            onClick={() => void copyManualValue(entry.value, entry.label)}
                          >
                            Copy
                          </button>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              ) : (
                <p className="text-sm text-rose-900/70">Noch kein QR erstellt.</p>
              )}
            </div>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)]">
              <div className="border-b border-[var(--brand-border)] px-3 py-2 text-sm font-semibold text-rose-900/85">
                Verbundene Geräte
              </div>
              <div className="max-h-56 overflow-auto">
                {loadingDeviceSessions ? (
                  <p className="px-3 py-3 text-sm text-rose-900/70">Lade Fahrgeräte...</p>
                ) : activeDeviceSessions.length === 0 ? (
                  <p className="px-3 py-3 text-sm text-rose-900/70">Keine Daten vorhanden.</p>
                ) : (
                  <ul className="divide-y divide-[var(--brand-border)]">
                    {activeDeviceSessions.map((session) => (
                      <li key={session.sessionId} className="flex items-center justify-between gap-3 px-3 py-2.5">
                        <div>
                          <p className="text-sm font-semibold text-slate-900">
                            {session.driverName || session.deviceLabel}
                          </p>
                          <p className="text-xs text-rose-900/70">
                            {session.isOnline ? 'Online' : 'Offline'} | Ablauf{' '}
                            {new Date(session.expiresAt).toLocaleString('de-DE')}
                          </p>
                        </div>
                        <button
                          type="button"
                          onClick={() => void revokeDriverDevice(session.sessionId)}
                          disabled={revokingDeviceSessionId === session.sessionId}
                          className="rounded-lg border border-red-300 px-2 py-1 text-xs font-medium text-red-700 transition hover:bg-red-50 disabled:opacity-60"
                        >
                          {revokingDeviceSessionId === session.sessionId ? 'Trennt...' : 'Trennen'}
                        </button>
                      </li>
                    ))}
                  </ul>
                )}
              </div>
            </div>
          </article>
        </section>

        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <h2 className="text-xl font-semibold">Fahrer Konten</h2>
          <p className="mt-1 text-sm text-rose-900/70">Aktive und inaktive Fahrer der Filiale.</p>

          <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
            <table className="w-full min-w-[760px] border-collapse">
              <thead>
                <tr>
                  <th className="th-ui">Name</th>
                  <th className="th-ui">E-Mail</th>
                  <th className="th-ui">Status</th>
                  <th className="th-ui">Erstellt</th>
                  <th className="th-ui">Fahrgeräte</th>
                  <th className="th-ui">Aktion</th>
                </tr>
              </thead>
              <tbody>
                {loading ? (
                  <tr>
                    <td colSpan={6} className="td-ui">
                      Lade Fahrer...
                    </td>
                  </tr>
                ) : drivers.length === 0 ? (
                  <tr>
                    <td colSpan={6} className="td-ui">
                      Keine Daten vorhanden.
                    </td>
                  </tr>
                ) : (
                  drivers.map((driver) => (
                    <tr key={driver.id}>
                      <td className="td-ui">{driver.name}</td>
                      <td className="td-ui">{driver.email}</td>
                      <td className="td-ui">
                        <span
                          className={`rounded-lg px-2 py-1 text-xs font-semibold ${
                            driver.isActive ? 'bg-green-100 text-green-700' : 'bg-slate-200 text-slate-700'
                          }`}
                        >
                          {driver.isActive ? 'aktiv' : 'inaktiv'}
                        </span>
                      </td>
                      <td className="td-ui">{new Date(driver.createdAt).toLocaleString('de-DE')}</td>
                      <td className="td-ui">
                        {(() => {
                          const sessions = driverDevicesByUserId.get(driver.id) || []
                          if (sessions.length === 0) {
                            return <span className="text-xs text-rose-900/70">Keine Geräte</span>
                          }
                          const onlineCount = sessions.filter((entry) => entry.isOnline).length
                          return (
                            <div className="space-y-1">
                              <p className="text-xs font-semibold text-slate-900">
                                {sessions.length} Gerät(e), {onlineCount} online
                              </p>
                              <div className="flex flex-wrap gap-1.5">
                                {sessions.slice(0, 3).map((session) => (
                                  <span
                                    key={session.sessionId}
                                    className={`rounded-md px-2 py-1 text-[11px] font-semibold ${
                                      session.isOnline
                                        ? 'bg-emerald-100 text-emerald-700'
                                        : 'bg-slate-200 text-slate-700'
                                    }`}
                                  >
                                    {session.deviceLabel}
                                  </span>
                                ))}
                                {sessions.length > 3 ? (
                                  <span className="rounded-md bg-slate-100 px-2 py-1 text-[11px] font-semibold text-slate-700">
                                    +{sessions.length - 3}
                                  </span>
                                ) : null}
                              </div>
                            </div>
                          )
                        })()}
                      </td>
                      <td className="td-ui">
                        <div className="flex flex-wrap gap-2">
                          <button
                            type="button"
                            onClick={() => void toggleDriverActive(driver)}
                            className="rounded-lg bg-slate-900 px-2 py-1 text-xs font-medium text-white transition hover:bg-slate-800"
                            disabled={saving}
                          >
                            {driver.isActive ? 'Deaktivieren' : 'Aktivieren'}
                          </button>
                          <button
                            type="button"
                            onClick={() => void removeDriver(driver)}
                            className="rounded-lg bg-red-600 px-2 py-1 text-xs font-medium text-white transition hover:bg-red-700"
                            disabled={saving}
                          >
                            Löschen
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </AdminLayout>
  )
}

function InputField({
  label,
  value,
  setValue,
  type = 'text',
  required = false,
}: {
  label: string
  value: string
  setValue: (value: string) => void
  type?: string
  required?: boolean
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-sm font-medium text-rose-900/85">{label}</span>
      <input
        type={type}
        value={value}
        required={required}
        onChange={(event) => setValue(event.target.value)}
        className="input-ui"
      />
    </label>
  )
}
