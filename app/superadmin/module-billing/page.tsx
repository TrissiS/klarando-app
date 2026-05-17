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
  getTenantBillingConfig,
  getPermissionMatrix,
  updateTenantBillingConfig,
  updateAccessUserPermissions,
  type AccessContext,
  type AccessPermission,
  type AccessUser,
  type EffectiveFeatureModuleEntry,
  type FeaturePackageTemplate,
} from '@/lib/api'
import { ACCESS_PACKAGES, formatAccessPermission, permissionsFromPackageIds } from '@/lib/access-packages'
import type { SessionUser } from '@/lib/app-data'

type TabKey = 'PACKAGES' | 'MODULES' | 'PERMISSIONS' | 'DEVICES'

const tabs: Array<{ key: TabKey; label: string }> = [
  { key: 'PACKAGES', label: 'Pakete' },
  { key: 'MODULES', label: 'Module' },
  { key: 'PERMISSIONS', label: 'Einzelrechte' },
  { key: 'DEVICES', label: 'Geräte & Zugänge' },
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
  const [billingDraft, setBillingDraft] = useState<{
    planType: 'REVENUE_SHARE' | 'MONTHLY_FIXED' | 'ORDER_PACKAGE' | 'HYBRID' | 'CUSTOM'
    billingPeriod: 'MONTHLY' | 'WEEKLY'
    monthlyFeeCents: number
    includedOrders: number
    commissionPercent: number
    fixedFeePerOrderCents: number
  } | null>(null)
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
    if (!token || !tenantId) return
    void getTenantBillingConfig(token, tenantId)
      .then((config) =>
        setBillingDraft({
          planType: config.plan.planType,
          billingPeriod: config.plan.billingPeriod,
          monthlyFeeCents: config.plan.monthlyFeeCents,
          includedOrders: config.plan.includedOrders,
          commissionPercent: config.plan.commissionPercent,
          fixedFeePerOrderCents: config.plan.fixedFeePerOrderCents,
        })
      )
      .catch((cause) =>
        setError(cause instanceof Error ? cause.message : 'Abrechnungsprofil konnte nicht geladen werden')
      )
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

  async function saveBillingDraft() {
    if (!token || !tenantId || !billingDraft) return
    try {
      setLoading(true)
      setError('')
      await updateTenantBillingConfig(token, tenantId, {
        planType: billingDraft.planType,
        billingPeriod: billingDraft.billingPeriod,
        monthlyFeeCents: Math.max(0, Math.round(billingDraft.monthlyFeeCents)),
        includedOrders: Math.max(0, Math.round(billingDraft.includedOrders)),
        commissionPercent: Math.max(0, billingDraft.commissionPercent),
        fixedFeePerOrderCents: Math.max(0, Math.round(billingDraft.fixedFeePerOrderCents)),
      })
      setInfo('Modulabrechnung für die Filiale gespeichert.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Modulabrechnung konnte nicht gespeichert werden')
    } finally {
      setLoading(false)
    }
  }

  const activeModules = modules.filter((entry) => entry.enabled).length

  return (
    <BackofficeLayout brand="Superadmin" title="Modulfreigaben" subtitle="Pakete, Module, Einzelrechte und Gerätezugänge sauber verwalten" navItems={SUPERADMIN_NAV_ITEMS}>
      <div className="space-y-5">
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 shadow-sm">{error}</div> : null}
        {info ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-800 shadow-sm">{info}</div> : null}

        <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <div className="grid gap-3 md:grid-cols-4">
            <select className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2.5 text-sm" value={chainId} onChange={(event) => setChainId(event.target.value)}>
              <option value="">Alle Ketten</option>
              {(context?.chains || []).map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
            </select>
            <select className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2.5 text-sm" value={tenantId} onChange={(event) => setTenantId(event.target.value)}>
              <option value="">Filiale auswählen</option>
              {filteredTenants.map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
            </select>
            <select className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2.5 text-sm" value={userId} onChange={(event) => setUserId(event.target.value)}>
              <option value="">Benutzer auswählen</option>
              {filteredUsers.map((entry) => <option key={entry.id} value={entry.id}>{entry.name} ({entry.email})</option>)}
            </select>
            <input className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2.5 text-sm" placeholder="Suchen in Modulen/Rechten ..." value={query} onChange={(event) => setQuery(event.target.value)} />
          </div>
          <div className="mt-3 grid gap-3 md:grid-cols-4">
            <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 p-3"><div className="text-xs text-slate-500">Paketvorlagen</div><div className="text-xl font-bold text-[var(--brand-ink)]">{packages.length}</div></div>
            <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 p-3"><div className="text-xs text-slate-500">Aktive Module</div><div className="text-xl font-bold text-[var(--brand-ink)]">{activeModules}</div></div>
            <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 p-3"><div className="text-xs text-slate-500">Einzelrechte</div><div className="text-xl font-bold text-[var(--brand-ink)]">{permissions.length}</div></div>
            <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 p-3"><div className="text-xs text-slate-500">Gerätezugänge</div><div className="text-xl font-bold text-[var(--brand-ink)]">zentral</div></div>
          </div>
          <div className="mt-3 flex flex-wrap items-center gap-2">
            <a
              href={`/superadmin/fees${tenantId ? `?tenantId=${encodeURIComponent(tenantId)}` : ''}`}
              className="inline-flex items-center rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-medium text-slate-800 transition hover:bg-slate-50"
            >
              In Gebühren &amp; Provisionen öffnen
              {tenantId ? ' (mit Filiale)' : ''}
            </a>
            <span className="text-xs text-slate-500">
              Öffnet die Abrechnung direkt mit der aktuell ausgewählten Filiale.
            </span>
          </div>
          <div className="mt-4 flex flex-wrap gap-2">
            {tabs.map((entry) => (
              <button key={entry.key} type="button" className={`rounded-xl px-3 py-2 text-sm font-medium transition ${tab === entry.key ? 'bg-slate-900 text-white shadow-sm' : 'border border-[var(--brand-border)] bg-white text-slate-700 hover:bg-slate-50'}`} onClick={() => setTab(entry.key)}>
                {entry.label}
              </button>
            ))}
          </div>
        </div>

        {tab === 'PACKAGES' ? (
          <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Pakete</h3>
            <div className="mb-4 rounded-2xl border border-[var(--brand-border)] bg-slate-50 p-4">
              <p className="text-sm font-semibold text-slate-900">Modulabrechnung für ausgewählte Filiale</p>
              <p className="mt-1 text-xs text-slate-600">
                Preise und Provisionen direkt hier pflegen. Für volle Monatsauswertung nutze zusätzlich „Gebühren &amp; Provisionen“.
              </p>
              <div className="mt-3 grid gap-2 md:grid-cols-3">
                <input
                  type="number"
                  step="0.01"
                  value={billingDraft ? billingDraft.monthlyFeeCents / 100 : 0}
                  onChange={(event) =>
                    setBillingDraft((current) =>
                      current
                        ? { ...current, monthlyFeeCents: Math.round(Number(event.target.value || 0) * 100) }
                        : current
                    )
                  }
                  className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
                  placeholder="Monatsgebühr (€)"
                />
                <input
                  type="number"
                  value={billingDraft?.includedOrders || 0}
                  onChange={(event) =>
                    setBillingDraft((current) =>
                      current ? { ...current, includedOrders: Math.round(Number(event.target.value || 0)) } : current
                    )
                  }
                  className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
                  placeholder="Inklusivbestellungen"
                />
                <input
                  type="number"
                  step="0.01"
                  value={billingDraft?.commissionPercent || 0}
                  onChange={(event) =>
                    setBillingDraft((current) =>
                      current ? { ...current, commissionPercent: Number(event.target.value || 0) } : current
                    )
                  }
                  className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
                  placeholder="Provision (%)"
                />
                <input
                  type="number"
                  step="0.01"
                  value={billingDraft ? billingDraft.fixedFeePerOrderCents / 100 : 0}
                  onChange={(event) =>
                    setBillingDraft((current) =>
                      current
                        ? {
                            ...current,
                            fixedFeePerOrderCents: Math.round(Number(event.target.value || 0) * 100),
                          }
                        : current
                    )
                  }
                  className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
                  placeholder="Fixbetrag Zusatzorder (€)"
                />
                <select
                  value={billingDraft?.planType || 'REVENUE_SHARE'}
                  onChange={(event) =>
                    setBillingDraft((current) =>
                      current
                        ? {
                            ...current,
                            planType: event.target.value as
                              | 'REVENUE_SHARE'
                              | 'MONTHLY_FIXED'
                              | 'ORDER_PACKAGE'
                              | 'HYBRID'
                              | 'CUSTOM',
                          }
                        : current
                    )
                  }
                  className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
                >
                  <option value="REVENUE_SHARE">Provision</option>
                  <option value="MONTHLY_FIXED">Monatspauschale</option>
                  <option value="ORDER_PACKAGE">Bestellpaket</option>
                  <option value="HYBRID">Hybrid</option>
                  <option value="CUSTOM">Individuell</option>
                </select>
                <button
                  type="button"
                  className="rounded-xl bg-slate-900 px-3 py-2 text-sm font-semibold text-white hover:bg-slate-800 disabled:opacity-60"
                  onClick={() => void saveBillingDraft()}
                  disabled={loading || !tenantId || !billingDraft}
                >
                  Modulabrechnung speichern
                </button>
              </div>
            </div>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {packages.map((entry) => (
                <article key={entry.key} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/30 p-4">
                  <div className="flex items-center justify-between gap-2">
                    <p className="font-semibold text-[var(--brand-ink)]">{entry.name}</p>
                    <span className="rounded-full bg-emerald-100 px-2 py-1 text-[11px] font-semibold text-emerald-700">aktiv</span>
                  </div>
                  <p className="mt-1 text-xs text-slate-600">{entry.description}</p>
                  <div className="mt-3 flex flex-wrap gap-1.5">
                    {(entry.features || []).map((feature) => (
                      <span key={feature} className="rounded-full border border-rose-200 bg-white px-2 py-1 text-[11px] text-rose-900">
                        {feature.replaceAll('_', ' ')}
                      </span>
                    ))}
                  </div>
                  <div className="mt-3">
                    <button type="button" className="rounded-xl bg-slate-900 px-3 py-2 text-xs font-semibold text-white hover:bg-slate-800 disabled:opacity-60" onClick={() => void applyPackage(entry.key)} disabled={loading || !tenantId}>
                      Paket anwenden
                    </button>
                  </div>
                </article>
              ))}
            </div>
          </div>
        ) : null}

        {tab === 'MODULES' ? (
          <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Module</h3>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {filteredModules.map((entry) => (
                <div key={entry.key} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/30 p-3">
                  <div className="flex items-center justify-between">
                    <p className="font-semibold text-[var(--brand-ink)]">{entry.name}</p>
                    <span className={`rounded-full px-2 py-0.5 text-xs ${entry.enabled ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-100 text-slate-600'}`}>{entry.enabled ? 'aktiv' : 'inaktiv'}</span>
                  </div>
                  <p className="mt-1 text-xs text-slate-600">{entry.description}</p>
                  <div className="mt-2 flex flex-wrap gap-1">
                    {entry.requiredPermissions.length ? entry.requiredPermissions.map((permission) => (
                      <span key={permission} className="rounded-full border border-rose-200 bg-white px-2 py-1 text-[11px] text-rose-900">
                        {formatAccessPermission(permission)}
                      </span>
                    )) : <span className="text-xs text-slate-500">Keine Unterrechte</span>}
                  </div>
                </div>
              ))}
            </div>
          </div>
        ) : null}

        {tab === 'PERMISSIONS' ? (
          <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-[var(--brand-ink)]">Einzelrechte</h3>
            <div className="grid gap-2 md:grid-cols-2 xl:grid-cols-3">
              {ACCESS_PACKAGES.map((entry) => (
                <label key={entry.id} className="flex items-start gap-2 rounded-2xl border border-[var(--brand-border)] bg-rose-50/30 p-3 text-sm">
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
                <div key={group} className="rounded-2xl border border-[var(--brand-border)] p-3">
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
              <button type="button" className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800 disabled:opacity-60" onClick={() => void savePermissions()} disabled={loading || !userId}>
                Einzelrechte speichern
              </button>
            </div>
          </div>
        ) : null}

        {tab === 'DEVICES' ? (
          <div className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <h3 className="mb-2 text-sm font-semibold text-[var(--brand-ink)]">Geräte & Zugänge</h3>
            <p className="text-sm text-slate-600">Die zentrale Geräteübersicht findest du unter <strong>/superadmin/devices</strong> mit Tabs für Displays, OrderDesk, Fahrergeräte und Offline-Status.</p>
          </div>
        ) : null}

      </div>
    </BackofficeLayout>
  )
}
