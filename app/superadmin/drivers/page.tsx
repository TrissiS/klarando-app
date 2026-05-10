'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createAccessUser,
  deleteAccessUser,
  getAccessContext,
  getSuperadminDriverDetail,
  getSuperadminDriverOverview,
  updateAccessUser,
  type AccessContext,
  type SuperadminDriverDetailResponse,
  type SuperadminDriverOverviewRow,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type NewDriverForm = {
  name: string
  email: string
  password: string
  tenantId: string
}

const emptyDriverForm: NewDriverForm = {
  name: '',
  email: '',
  password: '',
  tenantId: '',
}

function formatDateTime(value: string | null) {
  if (!value) return '-'
  const parsed = new Date(value)
  return Number.isNaN(parsed.getTime()) ? value : parsed.toLocaleString('de-DE')
}

function formatMoney(value: string | number) {
  const numberValue = Number(value || 0)
  return numberValue.toLocaleString('de-DE', { style: 'currency', currency: 'EUR' })
}

export default function SuperadminDriversPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [drivers, setDrivers] = useState<SuperadminDriverOverviewRow[]>([])
  const [driverDetail, setDriverDetail] = useState<SuperadminDriverDetailResponse | null>(null)

  const [q, setQ] = useState('')
  const [chainIdFilter, setChainIdFilter] = useState('')
  const [tenantIdFilter, setTenantIdFilter] = useState('')
  const [includeInactive, setIncludeInactive] = useState(false)
  const [selectedDriverId, setSelectedDriverId] = useState('')
  const [newDriverForm, setNewDriverForm] = useState<NewDriverForm>(emptyDriverForm)

  const [isLoadingBase, setIsLoadingBase] = useState(true)
  const [isLoadingDrivers, setIsLoadingDrivers] = useState(false)
  const [isLoadingDetail, setIsLoadingDetail] = useState(false)
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }
    setSession(parsed)
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    async function loadBase() {
      if (!token) return
      try {
        setIsLoadingBase(true)
        setError('')
        const accessContext = await getAccessContext(token)
        setContext(accessContext)
        if (!newDriverForm.tenantId && accessContext.tenants[0]?.id) {
          setNewDriverForm((current) => ({ ...current, tenantId: accessContext.tenants[0].id }))
        }
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Kontext konnte nicht geladen werden')
      } finally {
        setIsLoadingBase(false)
      }
    }
    void loadBase()
  }, [token])

  useEffect(() => {
    async function loadDrivers() {
      if (!token) return
      try {
        setIsLoadingDrivers(true)
        setError('')
        const response = await getSuperadminDriverOverview(token, {
          q: q || undefined,
          chainId: chainIdFilter || undefined,
          tenantId: tenantIdFilter || undefined,
          includeInactive,
          limit: 400,
        })
        setDrivers(response.rows)
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Fahrer konnten nicht geladen werden')
      } finally {
        setIsLoadingDrivers(false)
      }
    }
    void loadDrivers()
  }, [token, q, chainIdFilter, tenantIdFilter, includeInactive])

  useEffect(() => {
    async function loadDriverDetail() {
      if (!token || !selectedDriverId) {
        setDriverDetail(null)
        return
      }

      try {
        setIsLoadingDetail(true)
        setError('')
        const detail = await getSuperadminDriverDetail(token, selectedDriverId)
        setDriverDetail(detail)
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Fahrer-Detail konnte nicht geladen werden')
      } finally {
        setIsLoadingDetail(false)
      }
    }

    void loadDriverDetail()
  }, [token, selectedDriverId])

  const tenantOptions = useMemo(() => {
    if (!context) return []
    if (!chainIdFilter) return context.tenants
    return context.tenants.filter((tenant) => tenant.chainId === chainIdFilter)
  }, [context, chainIdFilter])

  useEffect(() => {
    if (tenantIdFilter && !tenantOptions.some((entry) => entry.id === tenantIdFilter)) {
      setTenantIdFilter('')
    }
  }, [tenantIdFilter, tenantOptions])

  const totals = useMemo(() => {
    return drivers.reduce(
      (acc, entry) => {
        acc.total += 1
        if (entry.isActive) acc.active += 1
        acc.openDeliveries += entry.stats.activeDeliveries
        acc.today += entry.stats.todayAssignedOrders
        return acc
      },
      { total: 0, active: 0, openDeliveries: 0, today: 0 }
    )
  }, [drivers])

  async function handleCreateDriver() {
    if (!token) return
    if (!newDriverForm.name.trim() || !newDriverForm.email.trim() || !newDriverForm.password.trim()) {
      setError('Name, E-Mail und Passwort sind erforderlich.')
      return
    }
    if (!newDriverForm.tenantId) {
      setError('Bitte eine Filiale auswaehlen.')
      return
    }

    try {
      setIsSaving(true)
      setError('')
      await createAccessUser(token, {
        name: newDriverForm.name.trim(),
        email: newDriverForm.email.trim(),
        password: newDriverForm.password.trim(),
        role: 'DRIVER',
        tenantId: newDriverForm.tenantId,
      })
      setSuccess('Fahrer wurde angelegt.')
      setNewDriverForm((current) => ({ ...emptyDriverForm, tenantId: current.tenantId }))
      const response = await getSuperadminDriverOverview(token, {
        q: q || undefined,
        chainId: chainIdFilter || undefined,
        tenantId: tenantIdFilter || undefined,
        includeInactive,
        limit: 400,
      })
      setDrivers(response.rows)
    } catch (createError) {
      setError(createError instanceof Error ? createError.message : 'Fahrer konnte nicht angelegt werden')
    } finally {
      setIsSaving(false)
    }
  }

  async function handleToggleDriverActive(driver: SuperadminDriverOverviewRow) {
    if (!token) return
    try {
      setIsSaving(true)
      setError('')
      await updateAccessUser(token, driver.id, { isActive: !driver.isActive })
      setDrivers((current) =>
        current.map((entry) =>
          entry.id === driver.id ? { ...entry, isActive: !driver.isActive } : entry
        )
      )
      if (driverDetail?.driver.id === driver.id) {
        setDriverDetail({
          ...driverDetail,
          driver: {
            ...driverDetail.driver,
            isActive: !driver.isActive,
          },
        })
      }
      setSuccess(driver.isActive ? 'Fahrer wurde deaktiviert.' : 'Fahrer wurde aktiviert.')
    } catch (toggleError) {
      setError(toggleError instanceof Error ? toggleError.message : 'Status konnte nicht geaendert werden')
    } finally {
      setIsSaving(false)
    }
  }

  async function handleDeleteDriver(driver: SuperadminDriverOverviewRow) {
    if (!token) return
    if (!window.confirm(`Fahrer "${driver.name}" wirklich loeschen?`)) {
      return
    }
    try {
      setIsSaving(true)
      setError('')
      await deleteAccessUser(token, driver.id)
      setDrivers((current) => current.filter((entry) => entry.id !== driver.id))
      if (selectedDriverId === driver.id) {
        setSelectedDriverId('')
      }
      setSuccess('Fahrer wurde geloescht.')
    } catch (deleteError) {
      setError(deleteError instanceof Error ? deleteError.message : 'Fahrer konnte nicht geloescht werden')
    } finally {
      setIsSaving(false)
    }
  }

  if (!session) return null

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Fahrer-Zentrale"
      subtitle="Alle angemeldeten Fahrer zentral ueberwachen, bearbeiten und auswerten"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      {error ? <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
      {success ? <div className="mb-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{success}</div> : null}

      {isLoadingBase ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">Lade Kontext...</section>
      ) : (
        <div className="grid gap-6">
          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Filter</h2>
            <div className="mt-4 grid gap-3 md:grid-cols-5">
              <input value={q} onChange={(event) => setQ(event.target.value)} placeholder="Suche Name oder E-Mail" className="input-ui md:col-span-2" />
              <select value={chainIdFilter} onChange={(event) => setChainIdFilter(event.target.value)} className="input-ui">
                <option value="">Alle Ketten</option>
                {context?.chains.map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
              </select>
              <select value={tenantIdFilter} onChange={(event) => setTenantIdFilter(event.target.value)} className="input-ui">
                <option value="">Alle Filialen</option>
                {tenantOptions.map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
              </select>
              <label className="flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm">
                <input type="checkbox" checked={includeInactive} onChange={(event) => setIncludeInactive(event.target.checked)} /> Inaktive Fahrer anzeigen
              </label>
            </div>
          </section>

          <section className="grid gap-3 md:grid-cols-4">
            <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3"><p className="text-xs uppercase tracking-wide text-rose-900/70">Fahrer gesamt</p><p className="mt-1 text-2xl font-semibold">{totals.total}</p></article>
            <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3"><p className="text-xs uppercase tracking-wide text-rose-900/70">Aktiv</p><p className="mt-1 text-2xl font-semibold text-emerald-700">{totals.active}</p></article>
            <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3"><p className="text-xs uppercase tracking-wide text-rose-900/70">Aktive Lieferungen</p><p className="mt-1 text-2xl font-semibold text-orange-700">{totals.openDeliveries}</p></article>
            <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3"><p className="text-xs uppercase tracking-wide text-rose-900/70">Heute zugewiesen</p><p className="mt-1 text-2xl font-semibold text-fuchsia-700">{totals.today}</p></article>
          </section>

          <section className="grid gap-4 xl:grid-cols-[1fr_420px]">
            <div className="overflow-x-auto rounded-2xl border border-[var(--brand-border)] bg-white">
              <table className="w-full min-w-[1050px] border-collapse">
                <thead><tr><th className="th-ui">Fahrer</th><th className="th-ui">Zuweisung</th><th className="th-ui">Leistung</th><th className="th-ui">Letzte Aktivitaet</th><th className="th-ui">Aktionen</th></tr></thead>
                <tbody>
                  {isLoadingDrivers ? <tr><td className="td-ui" colSpan={5}>Lade Fahrer...</td></tr> : drivers.length === 0 ? <tr><td className="td-ui" colSpan={5}>Keine Fahrer gefunden.</td></tr> : drivers.map((driver) => (
                    <tr key={driver.id} className={selectedDriverId === driver.id ? 'bg-amber-50/60' : undefined}>
                      <td className="td-ui"><p className="font-semibold">{driver.name}</p><p className="text-sm text-rose-900/75">{driver.email}</p><p className="text-xs text-rose-900/60">{driver.isActive ? 'Aktiv' : 'Inaktiv'}</p></td>
                      <td className="td-ui"><p>{driver.chain?.name || '-'}</p><p className="text-sm text-rose-900/75">{driver.tenant?.name || '-'}</p></td>
                      <td className="td-ui"><p>Gesamt: {driver.stats.totalAssignedOrders}</p><p className="text-sm text-rose-900/75">Aktiv: {driver.stats.activeDeliveries}</p><p className="text-sm text-rose-900/75">Heute: {driver.stats.todayAssignedOrders}</p></td>
                      <td className="td-ui">{formatDateTime(driver.stats.lastAssignmentAt)}</td>
                      <td className="td-ui"><div className="flex flex-wrap gap-2"><button type="button" className="btn-mini" onClick={() => setSelectedDriverId(driver.id)}>Details</button><button type="button" className="btn-mini-outline" onClick={() => void handleToggleDriverActive(driver)}>{driver.isActive ? 'Deaktivieren' : 'Aktivieren'}</button><button type="button" className="btn-mini-danger" onClick={() => void handleDeleteDriver(driver)}>Loeschen</button></div></td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            <aside className="space-y-4">
              <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <h3 className="text-lg font-semibold">Neuen Fahrer anlegen</h3>
                <div className="mt-3 space-y-3">
                  <input className="input-ui" value={newDriverForm.name} onChange={(event) => setNewDriverForm((current) => ({ ...current, name: event.target.value }))} placeholder="Name" />
                  <input className="input-ui" value={newDriverForm.email} onChange={(event) => setNewDriverForm((current) => ({ ...current, email: event.target.value }))} placeholder="E-Mail" />
                  <input className="input-ui" type="password" value={newDriverForm.password} onChange={(event) => setNewDriverForm((current) => ({ ...current, password: event.target.value }))} placeholder="Passwort" />
                  <select className="input-ui" value={newDriverForm.tenantId} onChange={(event) => setNewDriverForm((current) => ({ ...current, tenantId: event.target.value }))}>
                    <option value="">Filiale waehlen</option>
                    {context?.tenants.map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
                  </select>
                  <button type="button" onClick={() => void handleCreateDriver()} disabled={isSaving} className="w-full rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white disabled:opacity-60">{isSaving ? 'Speichert...' : 'Fahrer anlegen'}</button>
                </div>
              </article>

              <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <h3 className="text-lg font-semibold">Fahrer-Detail</h3>
                {!selectedDriverId ? <p className="mt-2 text-sm text-rose-900/70">Bitte einen Fahrer aus der Liste auswaehlen.</p> : isLoadingDetail ? <p className="mt-2 text-sm text-rose-900/70">Lade Details...</p> : !driverDetail ? <p className="mt-2 text-sm text-rose-900/70">Keine Details verfuegbar.</p> : (
                  <div className="mt-2 space-y-2 text-sm">
                    <p className="font-semibold">{driverDetail.driver.name}</p>
                    <p>{driverDetail.driver.email}</p>
                    <p>Filiale: {driverDetail.driver.tenant?.name || '-'}</p>
                    <p>Kette: {driverDetail.driver.chain?.name || '-'}</p>
                    <p>Gesamt zugewiesen: {driverDetail.summary.totalAssignedOrders}</p>
                    <p>Aktive Lieferungen: {driverDetail.summary.activeDeliveries}</p>
                    <p>Abgeschlossen: {driverDetail.summary.completedDeliveries}</p>
                    <p>Letzte Zuweisung: {formatDateTime(driverDetail.summary.lastAssignmentAt)}</p>
                    <div className="mt-3 rounded-xl border border-rose-200 bg-rose-50/40 p-3">
                      <p className="text-xs uppercase tracking-wide text-rose-900/70">Letzte Auftraege</p>
                      <div className="mt-2 max-h-52 space-y-2 overflow-y-auto">
                        {driverDetail.recentOrders.length === 0 ? <p className="text-xs text-rose-900/70">Keine Auftraege vorhanden.</p> : driverDetail.recentOrders.slice(0, 12).map((order) => (
                          <div key={order.id} className="rounded-lg border border-rose-200 bg-white px-2 py-2 text-xs">
                            <p className="font-semibold">#{order.id.slice(0, 8)} | {order.status}</p>
                            <p>{order.tenant?.name || '-'} | {order.customerZipCode || '-'} {order.customerCity || ''}</p>
                            <p>{formatMoney(order.total)} | {formatDateTime(order.createdAt)}</p>
                          </div>
                        ))}
                      </div>
                    </div>
                  </div>
                )}
              </article>
            </aside>
          </section>
        </div>
      )}
    </BackofficeLayout>
  )
}


