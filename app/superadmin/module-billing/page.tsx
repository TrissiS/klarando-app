'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  applyTenantFeaturePackage,
  getDisplayDeviceOverview,
  getAccessContext,
  getAccessUserPermissions,
  getAccessUsers,
  getEffectiveFeatureModules,
  getFeatureModuleCatalog,
  getOrderDeskDeviceBindingsForScope,
  getTenantBillingConfig,
  getSuperadminDriverOverview,
  getPermissionMatrix,
  updateTenantFeatureModules,
  updateTenantBillingConfig,
  updateAccessUserPermissions,
  type AccessContext,
  type AccessPermission,
  type AccessUser,
  type DisplayDeviceOverviewRow,
  type EffectiveFeatureModuleEntry,
  type FeatureModuleDefinition,
  type FeatureModuleKey,
  type FeaturePackageTemplate,
  type OrderDeskDeviceBinding,
  type SuperadminDriverOverviewRow,
} from '@/lib/api'
import { ACCESS_PACKAGES, formatAccessPermission, permissionsFromPackageIds } from '@/lib/access-packages'
import type { SessionUser } from '@/lib/app-data'

type TabKey = 'MODULES' | 'PACKAGES' | 'PERMISSIONS' | 'DEVICES'

const tabs: Array<{ key: TabKey; label: string }> = [
  { key: 'MODULES', label: 'Modulfreigaben' },
  { key: 'PACKAGES', label: 'Paketvorlagen' },
  { key: 'PERMISSIONS', label: 'Einzelrechte' },
  { key: 'DEVICES', label: 'Geräte & Zugänge' },
]

const MODULE_GROUPS: Array<{ label: string; keys: FeatureModuleKey[] }> = [
  { label: 'Produkte & Menü', keys: ['PRODUCTS', 'CATEGORIES', 'INGREDIENTS', 'ALLERGENS'] },
  { label: 'Bestellungen & Kasse', keys: ['ORDERS', 'POS', 'TERMINALS', 'CASH_CLOSING', 'PAYMENT'] },
  { label: 'Lieferung & Fahrer', keys: ['DRIVERS', 'DELIVERY_ZONES', 'RATINGS', 'TIPS', 'LOYALTY'] },
  { label: 'Displays & OrderDesk', keys: ['DISPLAYS', 'DISPLAY_DESIGN', 'ORDERDESK'] },
  { label: 'Lager & Einkauf', keys: ['STOCK', 'SUPPLIERS'] },
  { label: 'Auswertung & Abrechnung', keys: ['ANALYTICS'] },
  { label: 'Plattform & Branding', keys: ['PLATFORM_BRANDING', 'STAFF'] },
]

const ROLE_PRESETS: Record<string, FeatureModuleKey[]> = {
  ADMIN: ['ORDERS', 'PRODUCTS', 'CATEGORIES', 'INGREDIENTS', 'ALLERGENS', 'ANALYTICS', 'PAYMENT', 'STAFF'],
  FILIALLEITER: ['ORDERS', 'PRODUCTS', 'CATEGORIES', 'INGREDIENTS', 'PAYMENT', 'ANALYTICS'],
  MITARBEITER: ['ORDERS', 'PRODUCTS', 'CATEGORIES'],
  FAHRER: ['DRIVERS', 'DELIVERY_ZONES'],
  KUECHE: ['ORDERS', 'DISPLAYS'],
}

const MODULE_PRICE_STORAGE_KEY = 'superadmin.module-prices.v1'

function formatEuroFromCents(cents: number) {
  return `${(cents / 100).toFixed(2).replace('.', ',')} €`
}

function normalizeMoneyInputToCents(input: string): number {
  const normalized = input.replace(/\./g, '').replace(',', '.').replace(/[^0-9.\-]/g, '')
  const parsed = Number(normalized)
  if (!Number.isFinite(parsed)) return 0
  return Math.max(0, Math.round(parsed * 100))
}

function buildPermissionGroupLabel(permission: AccessPermission) {
  const prefix = permission.split('_')[0]
  const map: Record<string, string> = {
    ORDER: 'Bestellungen',
    PRODUCT: 'Produkte',
    CATEGORY: 'Produkte',
    DRIVER: 'Fahrer',
    SCREEN: 'Displays',
    FINANCE: 'Finanzen',
    SETTINGS: 'Einstellungen',
    STAFF: 'Mitarbeiter',
    ACCESS: 'System',
  }
  return map[prefix] || 'System'
}

export default function SuperadminModuleBillingPage() {
  const [token, setToken] = useState('')
  const [tab, setTab] = useState<TabKey>('MODULES')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [users, setUsers] = useState<AccessUser[]>([])
  const [moduleCatalog, setModuleCatalog] = useState<FeatureModuleDefinition[]>([])
  const [packages, setPackages] = useState<FeaturePackageTemplate[]>([])
  const [tenantId, setTenantId] = useState('')
  const [chainId, setChainId] = useState('')
  const [userId, setUserId] = useState('')
  const [rolePreset, setRolePreset] = useState<keyof typeof ROLE_PRESETS>('ADMIN')
  const [query, setQuery] = useState('')
  const [modules, setModules] = useState<EffectiveFeatureModuleEntry[]>([])
  const [permissions, setPermissions] = useState<AccessPermission[]>([])
  const [matrixPermissions, setMatrixPermissions] = useState<AccessPermission[]>([])
  const [selectedPackageIds, setSelectedPackageIds] = useState<string[]>([])
  const [modulePricesByTenant, setModulePricesByTenant] = useState<Record<string, Record<string, number>>>({})
  const [billingDraft, setBillingDraft] = useState<{
    planType: 'REVENUE_SHARE' | 'MONTHLY_FIXED' | 'ORDER_PACKAGE' | 'HYBRID' | 'CUSTOM'
    billingPeriod: 'MONTHLY' | 'WEEKLY'
    monthlyFeeCents: number
    includedOrders: number
    commissionPercent: number
    fixedFeePerOrderCents: number
  } | null>(null)
  const [displayRows, setDisplayRows] = useState<DisplayDeviceOverviewRow[]>([])
  const [orderDeskRows, setOrderDeskRows] = useState<OrderDeskDeviceBinding[]>([])
  const [driverRows, setDriverRows] = useState<SuperadminDriverOverviewRow[]>([])
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
    try {
      const fromStorage = localStorage.getItem(MODULE_PRICE_STORAGE_KEY)
      if (fromStorage) setModulePricesByTenant(JSON.parse(fromStorage) as Record<string, Record<string, number>>)
    } catch {
      setModulePricesByTenant({})
    }
  }, [])

  useEffect(() => {
    localStorage.setItem(MODULE_PRICE_STORAGE_KEY, JSON.stringify(modulePricesByTenant))
  }, [modulePricesByTenant])

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
      setModuleCatalog(catalog.modules)
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

  useEffect(() => {
    if (!token || !tenantId) return
    void Promise.all([
      getDisplayDeviceOverview(token, { tenantId }),
      getOrderDeskDeviceBindingsForScope(token, { tenantId, includeInactive: true }),
      getSuperadminDriverOverview(token, { tenantId, includeInactive: true, limit: 300 }),
    ])
      .then(([displays, orderdesk, drivers]) => {
        setDisplayRows(displays.rows)
        setOrderDeskRows(orderdesk.bindings)
        setDriverRows(drivers.rows)
      })
      .catch((cause) => setError(cause instanceof Error ? cause.message : 'Geräte konnten nicht geladen werden'))
  }, [token, tenantId])

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
  const tenantNameById = useMemo(() => {
    const map = new Map<string, string>()
    for (const entry of context?.tenants || []) map.set(entry.id, entry.name)
    return map
  }, [context?.tenants])
  const filteredModules = useMemo(() => {
    const q = query.trim().toLowerCase()
    if (!q) return modules
    return modules.filter((entry) => `${entry.name} ${entry.description}`.toLowerCase().includes(q))
  }, [modules, query])
  const modulesByKey = useMemo(() => {
    const map = new Map<FeatureModuleKey, EffectiveFeatureModuleEntry>()
    for (const entry of modules) map.set(entry.key, entry)
    return map
  }, [modules])
  const moduleDefinitionByKey = useMemo(() => {
    const map = new Map<FeatureModuleKey, FeatureModuleDefinition>()
    for (const entry of moduleCatalog) map.set(entry.key, entry)
    return map
  }, [moduleCatalog])
  const visiblePermissionMatrix = useMemo(() => {
    const allowed = new Set<AccessPermission>()
    for (const module of modules.filter((entry) => entry.enabled)) {
      for (const permission of module.requiredPermissions) allowed.add(permission)
    }
    const q = query.trim().toLowerCase()
    return matrixPermissions.filter((permission) => {
      if (!allowed.has(permission)) return false
      return !q || formatAccessPermission(permission).toLowerCase().includes(q)
    })
  }, [matrixPermissions, modules, query])
  const groupedPermissions = useMemo(() => {
    const groups = new Map<string, AccessPermission[]>()
    for (const permission of visiblePermissionMatrix) {
      const group = buildPermissionGroupLabel(permission)
      const current = groups.get(group) || []
      current.push(permission)
      groups.set(group, current)
    }
    return Array.from(groups.entries()).sort(([left], [right]) => left.localeCompare(right, 'de'))
  }, [visiblePermissionMatrix])
  const groupedModuleRows = useMemo(() => {
    const q = query.trim().toLowerCase()
    return MODULE_GROUPS.map((group) => {
      const rows = group.keys
        .map((key) => modulesByKey.get(key) || null)
        .filter((entry): entry is EffectiveFeatureModuleEntry => Boolean(entry))
        .filter((entry) => !q || `${entry.name} ${entry.description}`.toLowerCase().includes(q))
      return { ...group, rows }
    }).filter((group) => group.rows.length > 0)
  }, [modulesByKey, query])
  const modulePriceDraft = useMemo(() => modulePricesByTenant[tenantId] || {}, [modulePricesByTenant, tenantId])
  const modulePriceTotals = useMemo(() => {
    let monthlyNetCents = 0
    for (const module of modules) {
      if (!module.enabled) continue
      monthlyNetCents += modulePriceDraft[module.key] || 0
    }
    const vatCents = Math.round(monthlyNetCents * 0.19)
    return { monthlyNetCents, vatCents, monthlyGrossCents: monthlyNetCents + vatCents }
  }, [modulePriceDraft, modules])
  const deviceRows = useMemo(() => {
    const displayDevices = displayRows.map((entry) => ({
      id: `display-${entry.id}`,
      name: entry.name,
      type: `Display (${entry.displayType})`,
      branch: entry.tenantName || '—',
      status: entry.status,
      lastSeenAt: entry.lastSeenAt,
      pairedAt: entry.lastSyncAt,
    }))
    const orderDeskDevices = orderDeskRows.map((entry) => ({
      id: `orderdesk-${entry.id}`,
      name: entry.deviceAlias || entry.deviceSerial,
      type: 'OrderDesk',
      branch: tenantNameById.get(entry.tenantId) || '—',
      status: entry.isActive ? (entry.lastSeenAt ? 'online' : 'offline') : 'inactive',
      lastSeenAt: entry.lastSeenAt,
      pairedAt: entry.boundAt || entry.createdAt,
    }))
    const driverDevices = driverRows.map((entry) => ({
      id: `driver-${entry.id}`,
      name: entry.name,
      type: 'Fahrergerät',
      branch: entry.tenant?.name || '—',
      status: entry.isActive ? (entry.stats.activeDeliveries > 0 ? 'online' : 'offline') : 'inactive',
      lastSeenAt: entry.stats.lastAssignmentAt,
      pairedAt: entry.createdAt,
    }))
    return [...displayDevices, ...orderDeskDevices, ...driverDevices]
  }, [displayRows, orderDeskRows, driverRows, tenantNameById])

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

  async function refreshModules() {
    if (!tenantId) return
    const updated = await getEffectiveFeatureModules(token, tenantId)
    setModules(updated.modules)
  }

  async function toggleModule(featureKey: FeatureModuleKey, enabled: boolean) {
    if (!tenantId) return
    try {
      setLoading(true)
      await updateTenantFeatureModules(token, tenantId, { featureKey, enabled, enabledBySuperadmin: true })
      await refreshModules()
      setInfo(`Modul ${featureKey} wurde ${enabled ? 'aktiviert' : 'deaktiviert'}.`)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Modul konnte nicht aktualisiert werden')
    } finally {
      setLoading(false)
    }
  }

  function setModulePrice(moduleKey: FeatureModuleKey, value: string) {
    const cents = normalizeMoneyInputToCents(value)
    setModulePricesByTenant((current) => ({
      ...current,
      [tenantId]: { ...(current[tenantId] || {}), [moduleKey]: cents },
    }))
  }

  async function applyPackage(packageKey: string) {
    if (!tenantId) return
    try {
      setLoading(true)
      await applyTenantFeaturePackage(token, tenantId, packageKey)
      await refreshModules()
      setInfo('Paket wurde als Vorlage angewendet. Module und Preise können jetzt einzeln angepasst werden.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Paket konnte nicht angewendet werden')
    } finally {
      setLoading(false)
    }
  }

  function applyRolePreset(role: keyof typeof ROLE_PRESETS) {
    const allowedKeys = new Set(ROLE_PRESETS[role])
    const allowedPermissions = modules
      .filter((entry) => allowedKeys.has(entry.key))
      .flatMap((entry) => entry.requiredPermissions)
    setPermissions(Array.from(new Set(allowedPermissions)) as AccessPermission[])
    setRolePreset(role)
    setInfo(`Rollen-Vorlage ${role} angewendet (innerhalb aktiver Module).`)
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

        <div className="rounded-3xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="grid gap-3 md:grid-cols-4">
            <select className="rounded-xl border border-slate-200 bg-white px-3 py-2.5 text-sm" value={chainId} onChange={(event) => setChainId(event.target.value)}>
              <option value="">Alle Ketten</option>
              {(context?.chains || []).map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
            </select>
            <select className="rounded-xl border border-slate-200 bg-white px-3 py-2.5 text-sm" value={tenantId} onChange={(event) => setTenantId(event.target.value)}>
              <option value="">Filiale auswählen</option>
              {filteredTenants.map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
            </select>
            <select className="rounded-xl border border-slate-200 bg-white px-3 py-2.5 text-sm" value={userId} onChange={(event) => setUserId(event.target.value)}>
              <option value="">Benutzer auswählen</option>
              {filteredUsers.map((entry) => <option key={entry.id} value={entry.id}>{entry.name} ({entry.email})</option>)}
            </select>
            <input className="rounded-xl border border-slate-200 bg-white px-3 py-2.5 text-sm" placeholder="Suchen in Modulen/Rechten ..." value={query} onChange={(event) => setQuery(event.target.value)} />
          </div>
          <div className="mt-3 grid gap-3 md:grid-cols-4">
            <div className="rounded-2xl border border-slate-200 bg-slate-50 p-3"><div className="text-xs text-slate-500">Paketvorlagen</div><div className="text-xl font-bold text-slate-900">{packages.length}</div></div>
            <div className="rounded-2xl border border-slate-200 bg-slate-50 p-3"><div className="text-xs text-slate-500">Aktive Module</div><div className="text-xl font-bold text-slate-900">{activeModules}</div></div>
            <div className="rounded-2xl border border-slate-200 bg-slate-50 p-3"><div className="text-xs text-slate-500">Einzelrechte</div><div className="text-xl font-bold text-slate-900">{permissions.length}</div></div>
            <div className="rounded-2xl border border-slate-200 bg-slate-50 p-3"><div className="text-xs text-slate-500">Geräte gesamt</div><div className="text-xl font-bold text-slate-900">{deviceRows.length}</div></div>
          </div>
          <div className="mt-3 flex flex-wrap items-center gap-2">
            <a
              href={`/superadmin/fees${tenantId ? `?tenantId=${encodeURIComponent(tenantId)}` : ''}`}
              className="inline-flex items-center rounded-xl border border-slate-200 bg-white px-3 py-2 text-sm font-medium text-slate-800 transition hover:bg-slate-50"
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
              <button key={entry.key} type="button" className={`rounded-xl px-3 py-2 text-sm font-medium transition ${tab === entry.key ? 'bg-slate-900 text-white shadow-sm' : 'border border-slate-200 bg-white text-slate-700 hover:bg-slate-50'}`} onClick={() => setTab(entry.key)}>
                {entry.label}
              </button>
            ))}
          </div>
        </div>

        {tab === 'PACKAGES' ? (
          <div className="rounded-3xl border border-slate-200 bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-slate-900">Paketvorlagen</h3>
            <p className="mb-4 text-sm text-slate-600">Pakete sind Schnellvorlagen. Danach werden Module und Preise einzeln angepasst.</p>
            <div className="mb-4 rounded-2xl border border-slate-200 bg-slate-50 p-4">
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
                  className="rounded-xl border border-slate-200 px-3 py-2 text-sm"
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
                  className="rounded-xl border border-slate-200 px-3 py-2 text-sm"
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
                  className="rounded-xl border border-slate-200 px-3 py-2 text-sm"
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
                  className="rounded-xl border border-slate-200 px-3 py-2 text-sm"
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
                  className="rounded-xl border border-slate-200 px-3 py-2 text-sm"
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
                  Abrechnung speichern
                </button>
              </div>
            </div>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {packages.map((entry) => (
                <article key={entry.key} className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                  <div className="flex items-center justify-between gap-2">
                    <p className="font-semibold text-[var(--brand-ink)]">{entry.name}</p>
                    <span className="rounded-full bg-slate-200 px-2 py-1 text-[11px] font-semibold text-slate-700">Vorlage</span>
                  </div>
                  <p className="mt-1 text-xs text-slate-600">{entry.description}</p>
                  <div className="mt-3 flex flex-wrap gap-1.5">
                    {(entry.features || []).map((feature) => (
                      <span key={feature} className="rounded-full border border-slate-200 bg-white px-2 py-1 text-[11px] text-slate-700">
                        {moduleDefinitionByKey.get(feature)?.name || feature.replaceAll('_', ' ')}
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
          <div className="rounded-3xl border border-slate-200 bg-white p-5 shadow-sm">
            <h3 className="mb-3 text-sm font-semibold text-slate-900">Module einzeln steuern</h3>
            <div className="space-y-4">
              {groupedModuleRows.map((group) => (
                <div key={group.label} className="rounded-2xl border border-slate-200 p-4">
                  <p className="mb-3 text-sm font-semibold text-slate-900">{group.label}</p>
                  <div className="grid gap-3 lg:grid-cols-2">
                    {group.rows.map((entry) => (
                      <div key={entry.key} className="rounded-xl border border-slate-200 bg-slate-50 p-3">
                        <div className="flex flex-wrap items-center justify-between gap-2">
                          <label className="inline-flex items-center gap-2">
                            <input type="checkbox" checked={entry.enabled} onChange={(event) => void toggleModule(entry.key, event.target.checked)} disabled={loading || !tenantId} />
                            <span className="font-semibold text-slate-900">{entry.name}</span>
                          </label>
                          <span className={`rounded-full px-2 py-0.5 text-xs ${entry.enabled ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-200 text-slate-600'}`}>{entry.enabled ? 'aktiv' : 'inaktiv'}</span>
                        </div>
                        <p className="mt-1 text-xs text-slate-600">{entry.description}</p>
                        <div className="mt-2 grid gap-2 sm:grid-cols-2">
                          <label className="text-xs text-slate-600">Monatlicher Preis netto
                            <input type="text" inputMode="decimal" value={((modulePriceDraft[entry.key] || 0) / 100).toFixed(2).replace('.', ',')} onChange={(event) => setModulePrice(entry.key, event.target.value)} className="mt-1 w-full rounded-lg border border-slate-200 px-2 py-1.5 text-sm" />
                          </label>
                          <div className="text-xs text-slate-600">Statuspreis
                            <div className="mt-1 rounded-lg border border-slate-200 bg-white px-2 py-1.5 text-sm text-slate-800">{entry.enabled ? formatEuroFromCents(modulePriceDraft[entry.key] || 0) : '0,00 €'}</div>
                          </div>
                        </div>
                        {entry.requiredPermissions.length > 0 ? (
                          <div className="mt-2 flex flex-wrap gap-1">
                            {entry.requiredPermissions.map((permission) => (
                              <span key={permission} className="rounded-full bg-white px-2 py-0.5 text-[11px] text-slate-700 ring-1 ring-slate-200">{formatAccessPermission(permission)}</span>
                            ))}
                          </div>
                        ) : null}
                      </div>
                    ))}
                  </div>
                </div>
              ))}
            </div>
            <div className="mt-4 rounded-2xl border border-slate-200 bg-slate-50 p-4">
              <p className="text-sm font-semibold text-slate-900">Monatliche Modulsumme</p>
              <div className="mt-2 grid gap-2 text-sm md:grid-cols-3">
                <p><span className="text-slate-500">Netto:</span> <strong>{formatEuroFromCents(modulePriceTotals.monthlyNetCents)}</strong></p>
                <p><span className="text-slate-500">MwSt. 19 %:</span> <strong>{formatEuroFromCents(modulePriceTotals.vatCents)}</strong></p>
                <p><span className="text-slate-500">Brutto:</span> <strong>{formatEuroFromCents(modulePriceTotals.monthlyGrossCents)}</strong></p>
              </div>
              <p className="mt-2 text-xs text-slate-500">Deaktivierte Module werden nicht in die Summe einbezogen. Preise aktuell lokal gespeichert (TODO: persistente Modulpreis-API).</p>
            </div>
          </div>
        ) : null}

        {tab === 'PERMISSIONS' ? (
          <div className="rounded-3xl border border-slate-200 bg-white p-5 shadow-sm">
            <h3 className="mb-2 text-sm font-semibold text-slate-900">Einzelrechte innerhalb aktiver Module</h3>
            <p className="text-xs text-slate-600">Module und Abrechnung sind getrennt. Hier verwaltest du nur Benutzerrechte.</p>
            <div className="mt-4 rounded-2xl border border-slate-200 bg-slate-50 p-3">
              <div className="flex flex-wrap items-center gap-2">
                <span className="text-xs text-slate-500">Rollen-Vorlage:</span>
                {(Object.keys(ROLE_PRESETS) as Array<keyof typeof ROLE_PRESETS>).map((role) => (
                  <button key={role} type="button" onClick={() => applyRolePreset(role)} className={`rounded-lg px-2.5 py-1 text-xs ${rolePreset === role ? 'bg-slate-900 text-white' : 'border border-slate-200 bg-white text-slate-700'}`}>
                    {role === 'FILIALLEITER' ? 'Filialleiter' : role === 'MITARBEITER' ? 'Mitarbeiter' : role === 'FAHRER' ? 'Fahrer' : role === 'KUECHE' ? 'Küche' : 'Admin'}
                  </button>
                ))}
              </div>
            </div>
            <div className="grid gap-2 md:grid-cols-2 xl:grid-cols-3">
              {ACCESS_PACKAGES.map((entry) => (
                <label key={entry.id} className="flex items-start gap-2 rounded-2xl border border-slate-200 bg-slate-50 p-3 text-sm">
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
                <div key={group} className="rounded-2xl border border-slate-200 p-3">
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
          <div className="rounded-3xl border border-slate-200 bg-white p-5 shadow-sm">
            <h3 className="mb-2 text-sm font-semibold text-slate-900">Geräte & Zugänge</h3>
            <p className="mb-3 text-xs text-slate-600">Kombinierte Übersicht aus Displays, OrderDesk und Fahrergeräten. TODO: POS/Kassen als eigene API-Quelle anbinden.</p>
            <div className="overflow-x-auto rounded-2xl border border-slate-200">
              <table className="min-w-full text-sm">
                <thead className="bg-slate-50 text-left text-xs uppercase tracking-wide text-slate-500">
                  <tr>
                    <th className="px-3 py-2">Gerätename</th>
                    <th className="px-3 py-2">Gerätetyp</th>
                    <th className="px-3 py-2">Filiale</th>
                    <th className="px-3 py-2">Status</th>
                    <th className="px-3 py-2">Zuletzt verbunden</th>
                    <th className="px-3 py-2">Gekoppelt seit</th>
                    <th className="px-3 py-2">Aktionen</th>
                  </tr>
                </thead>
                <tbody>
                  {deviceRows.map((row) => (
                    <tr key={row.id} className="border-t border-slate-100">
                      <td className="px-3 py-2 font-medium text-slate-900">{row.name}</td>
                      <td className="px-3 py-2 text-slate-700">{row.type}</td>
                      <td className="px-3 py-2 text-slate-700">{row.branch}</td>
                      <td className="px-3 py-2">
                        <span className={`rounded-full px-2 py-0.5 text-xs ${row.status === 'online' ? 'bg-emerald-100 text-emerald-700' : row.status === 'offline' ? 'bg-amber-100 text-amber-700' : 'bg-slate-200 text-slate-700'}`}>
                          {row.status}
                        </span>
                      </td>
                      <td className="px-3 py-2 text-slate-700">{row.lastSeenAt ? new Date(row.lastSeenAt).toLocaleString('de-DE') : '—'}</td>
                      <td className="px-3 py-2 text-slate-700">{row.pairedAt ? new Date(row.pairedAt).toLocaleDateString('de-DE') : '—'}</td>
                      <td className="px-3 py-2">
                        <div className="flex flex-wrap gap-1">
                          <button type="button" className="rounded-lg border border-slate-200 px-2 py-1 text-xs text-slate-700">Gerät sperren</button>
                          <button type="button" className="rounded-lg border border-slate-200 px-2 py-1 text-xs text-slate-700">Gerät löschen</button>
                          <button type="button" className="rounded-lg border border-slate-200 px-2 py-1 text-xs text-slate-700">Neu koppeln</button>
                          <button type="button" className="rounded-lg border border-slate-200 px-2 py-1 text-xs text-slate-700">QR-Code</button>
                        </div>
                      </td>
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
