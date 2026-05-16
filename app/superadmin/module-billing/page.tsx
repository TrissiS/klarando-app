'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  applyTenantFeaturePackage,
  getAccessContext,
  getAccessUserPermissions,
  getAccessUsers,
  getEffectiveFeatureModules,
  getFeatureModuleCatalog,
  getPermissionMatrix,
  updateAccessUserPermissions,
  type AccessContext,
  type AccessPermission,
  type AccessUser,
  type EffectiveFeatureModuleEntry,
  type FeaturePackageTemplate,
} from '@/lib/api'
import { ACCESS_PACKAGES, formatAccessPermission, permissionsFromPackageIds } from '@/lib/access-packages'
import type { SessionUser } from '@/lib/app-data'

type TabKey = 'PACKAGES' | 'MODULES' | 'PERMISSIONS' | 'DEVICES' | 'FEES'

const tabs: Array<{ key: TabKey; label: string }> = [
  { key: 'PACKAGES', label: 'Pakete' },
  { key: 'MODULES', label: 'Modulfreigaben' },
  { key: 'PERMISSIONS', label: 'Einzelrechte' },
  { key: 'DEVICES', label: 'Geräte & Zugänge' },
  { key: 'FEES', label: 'Gebühren' },
]

export default function SuperadminModuleBillingPage() {
  const [token, setToken] = useState('')
  const [tab, setTab] = useState<TabKey>('PACKAGES')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [users, setUsers] = useState<AccessUser[]>([])
  const [packages, setPackages] = useState<FeaturePackageTemplate[]>([])
  const [tenantId, setTenantId] = useState('')
  const [chainId, setChainId] = useState('')
  const [userId, setUserId] = useState('')
  const [query, setQuery] = useState('')
  const [modules, setModules] = useState<EffectiveFeatureModuleEntry[]>([])
  const [permissions, setPermissions] = useState<AccessPermission[]>([])
  const [matrixPermissions, setMatrixPermissions] = useState<AccessPermission[]>([])
  const [selectedPackageIds, setSelectedPackageIds] = useState<string[]>([])
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
      const [ctx, userRows, catalog, matrix] = await Promise.all([
        getAccessContext(token),
        getAccessUsers(token),
        getFeatureModuleCatalog(token),
        getPermissionMatrix(token),
      ])
      setContext(ctx)
      setUsers(userRows)
      setPackages(catalog.packages)
      setMatrixPermissions(Array.from(new Set(matrix.map((entry) => entry.permission))).sort() as AccessPermission[])
      setChainId(ctx.chains[0]?.id || '')
      setTenantId(ctx.tenants[0]?.id || '')
      setUserId(userRows[0]?.id || '')
    })().catch((cause) => setError(cause instanceof Error ? cause.message : 'Daten konnten nicht geladen werden'))
  }, [token])

  useEffect(() => {
    if (!token || !tenantId) return
    void getEffectiveFeatureModules(token, tenantId)
      .then((response) => setModules(response.modules))
      .catch((cause) => setError(cause instanceof Error ? cause.message : 'Module konnten nicht geladen werden'))
  }, [token, tenantId])

  useEffect(() => {
    if (!token || !userId) return
    void getAccessUserPermissions(token, userId)
      .then((response) => {
        setPermissions(response.permissions)
        setSelectedPackageIds(
          ACCESS_PACKAGES.filter((entry) => entry.permissions.every((permission) => response.permissions.includes(permission))).map((entry) => entry.id)
        )
      })
      .catch((cause) => setError(cause instanceof Error ? cause.message : 'Benutzerrechte konnten nicht geladen werden'))
  }, [token, userId])

  const filteredTenants = useMemo(
    () => (context?.tenants || []).filter((entry) => !chainId || entry.chainId === chainId),
    [context, chainId]
  )
  const filteredUsers = useMemo(() => {
    const currentTenant = tenantId
    return users
      .filter((entry) => !chainId || entry.chainId === chainId)
      .filter((entry) => !currentTenant || !entry.tenantId || entry.tenantId === currentTenant)
  }, [users, chainId, tenantId])
  const filteredModules = useMemo(() => {
    const q = query.trim().toLowerCase()
    if (!q) return modules
    return modules.filter((entry) => `${entry.name} ${entry.description}`.toLowerCase().includes(q))
  }, [modules, query])
  const groupedPermissions = useMemo(() => {
    const q = query.trim().toLowerCase()
    const source = matrixPermissions.filter((permission) =>
      !q || formatAccessPermission(permission).toLowerCase().includes(q)
    )
    const groups = new Map<string, AccessPermission[]>()
    for (const permission of source) {
      const group = permission.split('_')[0]
      const current = groups.get(group) || []
      current.push(permission)
      groups.set(group, current)
    }
    return Array.from(groups.entries()).sort(([left], [right]) => left.localeCompare(right, 'de'))
  }, [matrixPermissions, query])

  async function savePermissions() {
    if (!userId) return
    try {
      setLoading(true)
      const packagePermissions = permissionsFromPackageIds(selectedPackageIds)
      const selectedSet = new Set([...permissions, ...packagePermissions])
      const payload = Array.from(selectedSet) as AccessPermission[]
      const result = await updateAccessUserPermissions(token, userId, payload)
      setPermissions(result.permissions)
      setInfo('Einzelrechte wurden gespeichert.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rechte konnten nicht gespeichert werden')
    } finally {
      setLoading(false)
    }
  }

  async function applyPackage(packageKey: string) {
    if (!tenantId) return
    try {
      setLoading(true)
      await applyTenantFeaturePackage(token, tenantId, packageKey)
      const updated = await getEffectiveFeatureModules(token, tenantId)
      setModules(updated.modules)
      setInfo('Paket wurde auf die Filiale angewendet.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Paket konnte nicht angewendet werden')
    } finally {
      setLoading(false)
    }
  }

  const activeModules = modules.filter((entry) => entry.enabled).length

  return (
    <BackofficeLayout brand="Superadmin" title="Modulfreigaben & Pakete" subtitle="Zentrale Verwaltung für Pakete, Rechte, Geräte und Gebühren" navItems={SUPERADMIN_NAV_ITEMS}>
      <div className="space-y-4">
        {error ? <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-2 text-sm text-red-700">{error}</div> : null}
        {info ? <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-2 text-sm text-emerald-800">{info}</div> : null}

        <div className="rounded-2xl border bg-white p-4">
          <div className="grid gap-3 md:grid-cols-4">
            <select className="rounded-xl border px-3 py-2" value={chainId} onChange={(event) => setChainId(event.target.value)}>
              <option value="">Alle Ketten</option>
              {(context?.chains || []).map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
            </select>
            <select className="rounded-xl border px-3 py-2" value={tenantId} onChange={(event) => setTenantId(event.target.value)}>
              <option value="">Filiale auswählen</option>
              {filteredTenants.map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
            </select>
            <select className="rounded-xl border px-3 py-2" value={userId} onChange={(event) => setUserId(event.target.value)}>
              <option value="">Benutzer auswählen</option>
              {filteredUsers.map((entry) => <option key={entry.id} value={entry.id}>{entry.name} ({entry.email})</option>)}
            </select>
            <input className="rounded-xl border px-3 py-2" placeholder="Suchen in Modulen/Rechten ..." value={query} onChange={(event) => setQuery(event.target.value)} />
          </div>
          <div className="mt-3 grid gap-3 md:grid-cols-4">
            <div className="rounded-xl border p-3"><div className="text-xs text-slate-500">Paketvorlagen</div><div className="text-xl font-bold">{packages.length}</div></div>
            <div className="rounded-xl border p-3"><div className="text-xs text-slate-500">Aktive Module</div><div className="text-xl font-bold">{activeModules}</div></div>
            <div className="rounded-xl border p-3"><div className="text-xs text-slate-500">Einzelrechte</div><div className="text-xl font-bold">{permissions.length}</div></div>
            <div className="rounded-xl border p-3"><div className="text-xs text-slate-500">Zusatzkosten</div><div className="text-xl font-bold">individuell</div></div>
          </div>
          <div className="mt-3 flex flex-wrap gap-2">
            {tabs.map((entry) => (
              <button key={entry.key} type="button" className={`rounded-xl px-3 py-1.5 text-sm ${tab === entry.key ? 'bg-slate-900 text-white' : 'border bg-white'}`} onClick={() => setTab(entry.key)}>
                {entry.label}
              </button>
            ))}
          </div>
        </div>

        {tab === 'PACKAGES' ? (
          <div className="rounded-2xl border bg-white p-4">
            <h3 className="mb-3 text-sm font-semibold">Pakete</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[980px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th>Paket</th><th>Beschreibung</th><th>enthaltene Module</th><th>Status</th><th>Aktion</th></tr></thead>
                <tbody>
                  {packages.map((entry) => (
                    <tr key={entry.key} className="border-t">
                      <td className="py-2 font-medium">{entry.name}</td>
                      <td>{entry.description}</td>
                      <td>{entry.features.join(', ') || '-'}</td>
                      <td>aktiv</td>
                      <td><button type="button" className="rounded border px-2 py-1" onClick={() => void applyPackage(entry.key)} disabled={loading || !tenantId}>Auf Filiale anwenden</button></td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        ) : null}

        {tab === 'MODULES' ? (
          <div className="rounded-2xl border bg-white p-4">
            <h3 className="mb-3 text-sm font-semibold">Modulfreigaben</h3>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {filteredModules.map((entry) => (
                <div key={entry.key} className="rounded-xl border p-3">
                  <div className="flex items-center justify-between">
                    <p className="font-semibold">{entry.name}</p>
                    <span className={`rounded-full px-2 py-0.5 text-xs ${entry.enabled ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-100 text-slate-600'}`}>{entry.enabled ? 'aktiv' : 'inaktiv'}</span>
                  </div>
                  <p className="mt-1 text-xs text-slate-600">{entry.description}</p>
                  <p className="mt-2 text-xs text-slate-500">Unterrechte: {entry.requiredPermissions.map(formatAccessPermission).join(', ') || '-'}</p>
                </div>
              ))}
            </div>
          </div>
        ) : null}

        {tab === 'PERMISSIONS' ? (
          <div className="rounded-2xl border bg-white p-4">
            <h3 className="mb-3 text-sm font-semibold">Einzelrechte</h3>
            <div className="grid gap-2 md:grid-cols-2 xl:grid-cols-3">
              {ACCESS_PACKAGES.map((entry) => (
                <label key={entry.id} className="flex items-start gap-2 rounded-xl border p-3 text-sm">
                  <input
                    type="checkbox"
                    checked={selectedPackageIds.includes(entry.id)}
                    onChange={(event) => {
                      setSelectedPackageIds((current) =>
                        event.target.checked ? [...current, entry.id] : current.filter((id) => id !== entry.id)
                      )
                    }}
                  />
                  <span>
                    <strong>{entry.name}</strong>
                    <br />
                    <span className="text-xs text-slate-600">{entry.description}</span>
                  </span>
                </label>
              ))}
            </div>

            <div className="mt-4 grid gap-3 lg:grid-cols-2">
              {groupedPermissions.map(([group, entries]) => (
                <div key={group} className="rounded-xl border p-3">
                  <p className="mb-2 text-sm font-semibold">{group}</p>
                  <div className="grid gap-1 sm:grid-cols-2">
                    {entries.map((permission) => {
                      const checked = permissions.includes(permission)
                      return (
                        <label key={permission} className="flex items-center gap-2 text-xs">
                          <input
                            type="checkbox"
                            checked={checked}
                            onChange={(event) => {
                              setPermissions((current) =>
                                event.target.checked
                                  ? [...current, permission]
                                  : current.filter((entry) => entry !== permission)
                              )
                            }}
                          />
                          {formatAccessPermission(permission)}
                        </label>
                      )
                    })}
                  </div>
                </div>
              ))}
            </div>

            <div className="mt-4">
              <button type="button" className="rounded-xl bg-slate-900 px-4 py-2 text-sm text-white" onClick={() => void savePermissions()} disabled={loading || !userId}>
                Einzelrechte speichern
              </button>
            </div>
          </div>
        ) : null}

        {tab === 'DEVICES' ? (
          <div className="rounded-2xl border bg-white p-4">
            <h3 className="mb-2 text-sm font-semibold">Geräte & Zugänge</h3>
            <p className="text-sm text-slate-600">Die zentrale Geräteübersicht findest du unter <strong>/superadmin/devices</strong> mit Tabs für Displays, OrderDesk, Fahrergeräte und Offline-Status.</p>
          </div>
        ) : null}

        {tab === 'FEES' ? (
          <div className="rounded-2xl border bg-white p-4">
            <h3 className="mb-2 text-sm font-semibold">Gebühren / Paketpreise</h3>
            <div className="overflow-auto">
              <table className="w-full min-w-[980px] text-sm">
                <thead><tr className="text-left text-xs text-slate-500"><th>Paket</th><th>Einrichtungsgebühr</th><th>monatlich</th><th>jährlich</th><th>enthaltene Module</th><th>Status</th><th>Aktionen</th></tr></thead>
                <tbody>
                  {ACCESS_PACKAGES.map((entry) => (
                    <tr key={entry.id} className="border-t">
                      <td className="py-2">{entry.name}</td>
                      <td>—</td>
                      <td>—</td>
                      <td>—</td>
                      <td>{entry.permissions.length}</td>
                      <td>aktiv</td>
                      <td className="space-x-1">
                        <button type="button" className="rounded border px-2 py-1">Bearbeiten</button>
                        <button type="button" className="rounded border px-2 py-1">Duplizieren</button>
                        <button type="button" className="rounded border px-2 py-1">Deaktivieren</button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            <button type="button" className="mt-3 rounded-xl border px-3 py-2 text-sm">Neues Paket anlegen</button>
          </div>
        ) : null}
      </div>
    </BackofficeLayout>
  )
}
