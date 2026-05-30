'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import ImplementationNotice from '@/app/Components/admin/ImplementationNotice'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  applyTenantFeaturePackage,
  deactivateOrderDeskDeviceBinding,
  deleteOrderDeskDeviceBinding,
  getDisplayDeviceOverview,
  getAccessContext,
  getAccessUserPermissions,
  getAccessUsers,
  getEffectiveFeatureModules,
  getFeatureModuleCatalog,
  getOrderDeskDeviceBindingsForScope,
  regenerateDisplayPairingCode,
  resetOrderDeskDevicePairing,
  getTenantBillingConfig,
  getSuperadminDriverOverview,
  getPermissionMatrix,
  updateDisplayDeviceActiveState,
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

const ROLE_PRESETS: Record<string, AccessPermission[]> = {
  ADMIN: ['TENANTS_READ', 'TENANTS_WRITE', 'USERS_READ', 'USERS_WRITE', 'PRODUCTS_READ', 'PRODUCTS_WRITE', 'INVENTORY_READ', 'INVENTORY_WRITE', 'ORDERS_READ', 'ORDERS_WRITE', 'SETTINGS_READ', 'SETTINGS_WRITE', 'AUDIT_READ'],
  FILIALLEITER: ['USERS_READ', 'PRODUCTS_READ', 'PRODUCTS_WRITE', 'INVENTORY_READ', 'INVENTORY_WRITE', 'ORDERS_READ', 'ORDERS_WRITE', 'SETTINGS_READ'],
  MITARBEITER: ['PRODUCTS_READ', 'PRODUCTS_WRITE', 'ORDERS_READ', 'ORDERS_WRITE', 'INVENTORY_READ'],
  FAHRER: ['ORDERS_READ'],
  KUECHE: ['ORDERS_READ', 'ORDERS_WRITE', 'PRODUCTS_READ'],
}

type UiRightDefinition = {
  id: string
  group: string
  label: string
  permission: AccessPermission
  moduleKeys: FeatureModuleKey[]
}

const UI_RIGHTS: UiRightDefinition[] = [
  { id: 'products-read', group: 'Produkte & Menü', label: 'Produkte lesen', permission: 'PRODUCTS_READ', moduleKeys: ['PRODUCTS'] },
  { id: 'products-create', group: 'Produkte & Menü', label: 'Produkte erstellen', permission: 'PRODUCTS_WRITE', moduleKeys: ['PRODUCTS'] },
  { id: 'products-edit', group: 'Produkte & Menü', label: 'Produkte bearbeiten', permission: 'PRODUCTS_WRITE', moduleKeys: ['PRODUCTS'] },
  { id: 'products-delete', group: 'Produkte & Menü', label: 'Produkte löschen', permission: 'PRODUCTS_WRITE', moduleKeys: ['PRODUCTS'] },
  { id: 'prices-edit', group: 'Produkte & Menü', label: 'Preise bearbeiten', permission: 'PRODUCTS_WRITE', moduleKeys: ['PRODUCTS'] },
  { id: 'categories-manage', group: 'Produkte & Menü', label: 'Kategorien verwalten', permission: 'PRODUCTS_WRITE', moduleKeys: ['CATEGORIES'] },
  { id: 'ingredients-manage', group: 'Produkte & Menü', label: 'Zutaten verwalten', permission: 'PRODUCTS_WRITE', moduleKeys: ['INGREDIENTS'] },
  { id: 'allergens-manage', group: 'Produkte & Menü', label: 'Allergene verwalten', permission: 'PRODUCTS_WRITE', moduleKeys: ['ALLERGENS'] },
  { id: 'menu-import-use', group: 'Produkte & Menü', label: 'Menü-Import nutzen', permission: 'PRODUCTS_WRITE', moduleKeys: ['PRODUCTS'] },
  { id: 'orders-read', group: 'Bestellungen & Kasse', label: 'Bestellungen lesen', permission: 'ORDERS_READ', moduleKeys: ['ORDERS'] },
  { id: 'orders-edit', group: 'Bestellungen & Kasse', label: 'Bestellungen bearbeiten', permission: 'ORDERS_WRITE', moduleKeys: ['ORDERS'] },
  { id: 'orders-cancel', group: 'Bestellungen & Kasse', label: 'Bestellungen stornieren', permission: 'ORDERS_WRITE', moduleKeys: ['ORDERS'] },
  { id: 'pos-use', group: 'Bestellungen & Kasse', label: 'Kasse/POS nutzen', permission: 'ORDERS_WRITE', moduleKeys: ['POS'] },
  { id: 'cashread', group: 'Bestellungen & Kasse', label: 'Tagesabschluss sehen', permission: 'SETTINGS_READ', moduleKeys: ['CASH_CLOSING'] },
  { id: 'cashcreate', group: 'Bestellungen & Kasse', label: 'Tagesabschluss erstellen', permission: 'SETTINGS_WRITE', moduleKeys: ['CASH_CLOSING'] },
  { id: 'display-control', group: 'Bestellungen & Kasse', label: 'Displays steuern', permission: 'SETTINGS_WRITE', moduleKeys: ['DISPLAYS'] },
  { id: 'orderdesk-use', group: 'Bestellungen & Kasse', label: 'OrderDesk nutzen', permission: 'ORDERS_WRITE', moduleKeys: ['ORDERDESK'] },
  { id: 'inventory-read', group: 'Lager & Einkauf', label: 'Lager lesen', permission: 'INVENTORY_READ', moduleKeys: ['STOCK'] },
  { id: 'inventory-write', group: 'Lager & Einkauf', label: 'Bestand ändern', permission: 'INVENTORY_WRITE', moduleKeys: ['STOCK'] },
  { id: 'goods-receipt', group: 'Lager & Einkauf', label: 'Wareneingang buchen', permission: 'INVENTORY_WRITE', moduleKeys: ['STOCK'] },
  { id: 'suppliers-manage', group: 'Lager & Einkauf', label: 'Lieferanten verwalten', permission: 'INVENTORY_WRITE', moduleKeys: ['SUPPLIERS'] },
  { id: 'inventory-count', group: 'Lager & Einkauf', label: 'Inventur durchführen', permission: 'INVENTORY_WRITE', moduleKeys: ['STOCK'] },
  { id: 'users-read', group: 'Benutzer & Team', label: 'Benutzer lesen', permission: 'USERS_READ', moduleKeys: ['STAFF'] },
  { id: 'users-invite', group: 'Benutzer & Team', label: 'Benutzer einladen', permission: 'USERS_WRITE', moduleKeys: ['STAFF'] },
  { id: 'users-edit', group: 'Benutzer & Team', label: 'Benutzer bearbeiten', permission: 'USERS_WRITE', moduleKeys: ['STAFF'] },
  { id: 'users-delete', group: 'Benutzer & Team', label: 'Benutzer löschen', permission: 'USERS_WRITE', moduleKeys: ['STAFF'] },
  { id: 'roles-assign', group: 'Benutzer & Team', label: 'Rollen/Rechte vergeben', permission: 'USERS_WRITE', moduleKeys: ['STAFF'] },
  { id: 'drivers-read', group: 'Lieferung & Fahrer', label: 'Fahrer lesen', permission: 'ORDERS_READ', moduleKeys: ['DRIVERS'] },
  { id: 'drivers-manage', group: 'Lieferung & Fahrer', label: 'Fahrer verwalten', permission: 'ORDERS_WRITE', moduleKeys: ['DRIVERS'] },
  { id: 'zones-edit', group: 'Lieferung & Fahrer', label: 'Lieferzonen bearbeiten', permission: 'SETTINGS_WRITE', moduleKeys: ['DELIVERY_ZONES'] },
  { id: 'tours-view', group: 'Lieferung & Fahrer', label: 'Touren sehen', permission: 'ORDERS_READ', moduleKeys: ['DRIVERS'] },
  { id: 'driver-app-use', group: 'Lieferung & Fahrer', label: 'Fahrer-App nutzen', permission: 'ORDERS_READ', moduleKeys: ['DRIVERS'] },
  { id: 'settings-read', group: 'System', label: 'Einstellungen lesen', permission: 'SETTINGS_READ', moduleKeys: ['PLATFORM_BRANDING'] },
  { id: 'settings-write', group: 'System', label: 'Einstellungen bearbeiten', permission: 'SETTINGS_WRITE', moduleKeys: ['PLATFORM_BRANDING'] },
  { id: 'branch-edit', group: 'System', label: 'Filialdaten bearbeiten', permission: 'TENANTS_WRITE', moduleKeys: ['PLATFORM_BRANDING'] },
  { id: 'device-pair', group: 'System', label: 'Geräte koppeln', permission: 'SETTINGS_WRITE', moduleKeys: ['DISPLAYS', 'ORDERDESK'] },
  { id: 'device-remove', group: 'System', label: 'Geräte entfernen', permission: 'SETTINGS_WRITE', moduleKeys: ['DISPLAYS', 'ORDERDESK'] },
  { id: 'audit-read', group: 'Audit', label: 'Protokolle lesen', permission: 'AUDIT_READ', moduleKeys: ['ANALYTICS'] },
  { id: 'billing-read', group: 'Audit', label: 'Abrechnungen einsehen', permission: 'SETTINGS_READ', moduleKeys: ['ANALYTICS'] },
  { id: 'changes-track', group: 'Audit', label: 'Änderungen nachvollziehen', permission: 'AUDIT_READ', moduleKeys: ['ANALYTICS'] },
]

const MODULE_PRICE_STORAGE_KEY = 'superadmin.module-prices.v1'

function formatEuroFromCents(cents: number) {
  return `${(cents / 100).toFixed(2).replace('.', ',')} €`
}

function normalizeMoneyInputToCents(input: string): number {
  const cleaned = input.trim().replace(/\s+/g, '').replace(/[^0-9,.-]/g, '')
  if (!cleaned) return 0
  const normalized = cleaned.replace(',', '.')
  const parsed = Number(normalized)
  if (!Number.isFinite(parsed)) return 0
  return Math.max(0, Math.round(parsed * 100))
}

function formatMoneyInput(cents: number) {
  return (cents / 100).toFixed(2).replace('.', ',')
}

type ModuleDeviceSourceType = 'display' | 'orderdesk' | 'driver' | 'pos'

type ModuleDeviceRow = {
  id: string
  sourceType: ModuleDeviceSourceType
  sourceId: string | null
  displaySourceKind: DisplayDeviceOverviewRow['sourceKind'] | null
  displayRef: string | null
  displayId: string | null
  orderDeskId: string | null
  driverId: string | null
  deviceName: string
  deviceType: string
  branchName: string
  branchId: string | null
  tenantId: string | null
  status: 'online' | 'offline' | 'inactive'
  lastSeenAt: string | null
  pairedAt: string | null
  pairingSupported: boolean
}

function formatDateTime(date: string | null) {
  if (!date) return '—'
  const parsed = new Date(date)
  if (Number.isNaN(parsed.getTime())) return '—'
  return parsed.toLocaleString('de-DE', { timeZone: 'Europe/Berlin' })
}

type ManualOrderDeskData = {
  apiBaseUrl: string
  tenantId: string
  adminCode: string
  displayCode: string
  pairingToken: string
}

function decodeManualOrderDeskData(rawPayload: string): ManualOrderDeskData | null {
  const raw = rawPayload.trim()
  if (!raw) return null
  const parseFromJson = (jsonText: string): ManualOrderDeskData | null => {
    try {
      const parsed = JSON.parse(jsonText) as Record<string, unknown>
      const apiBaseUrlRaw =
        typeof parsed.apiBaseUrl === 'string'
          ? parsed.apiBaseUrl
          : typeof parsed.apiUrl === 'string'
            ? parsed.apiUrl
            : typeof parsed.baseUrl === 'string'
              ? parsed.baseUrl
              : 'https://api.klarando.com'
      return {
        apiBaseUrl: apiBaseUrlRaw.replace(/\/api\/?$/i, ''),
        tenantId: typeof parsed.tenantId === 'string' ? parsed.tenantId : '',
        adminCode: '',
        displayCode:
          typeof parsed.displayCode === 'string'
            ? parsed.displayCode
            : typeof parsed.deviceCode === 'string'
              ? parsed.deviceCode
              : '',
        pairingToken:
          typeof parsed.pairingToken === 'string'
            ? parsed.pairingToken
            : typeof parsed.token === 'string'
              ? parsed.token
              : '',
      }
    } catch {
      return null
    }
  }
  if (raw.startsWith('{')) return parseFromJson(raw)
  if (raw.toUpperCase().startsWith('KOD')) {
    const hex = raw.slice(3).trim().toUpperCase()
    if (!hex || hex.length % 2 !== 0 || !/^[0-9A-F]+$/.test(hex)) return null
    try {
      return parseFromJson(Buffer.from(hex, 'hex').toString('utf8'))
    } catch {
      return null
    }
  }
  return null
}

function formatDateOnly(date: string | null) {
  if (!date) return '—'
  const parsed = new Date(date)
  if (Number.isNaN(parsed.getTime())) return '—'
  return parsed.toLocaleDateString('de-DE', { timeZone: 'Europe/Berlin' })
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
  const [modulePriceInputByTenant, setModulePriceInputByTenant] = useState<Record<string, Record<string, string>>>({})
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
  const [pairingModal, setPairingModal] = useState<{ title: string; payload: string; qrImageUrl?: string | null } | null>(null)
  const [pairingCopyInfo, setPairingCopyInfo] = useState('')
  const [deviceActionLoadingByKey, setDeviceActionLoadingByKey] = useState<Record<string, boolean>>({})
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')
  const pairingManualData = useMemo(() => {
    if (!pairingModal) return null
    return decodeManualOrderDeskData(pairingModal.payload)
  }, [pairingModal])

  async function copyPairingField(value: string, label: string) {
    if (!value.trim()) return
    try {
      await navigator.clipboard.writeText(value)
      setPairingCopyInfo(`${label} kopiert`)
      window.setTimeout(() => setPairingCopyInfo(''), 1800)
    } catch {
      setPairingCopyInfo(`Kopieren fehlgeschlagen (${label})`)
      window.setTimeout(() => setPairingCopyInfo(''), 2200)
    }
  }

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
    if (!tenantId) return
    setModulePriceInputByTenant((current) => {
      const tenantDraft = { ...(current[tenantId] || {}) }
      const tenantPrices = modulePricesByTenant[tenantId] || {}
      for (const module of modules) {
        if (tenantDraft[module.key] === undefined) {
          tenantDraft[module.key] = formatMoneyInput(tenantPrices[module.key] || 0)
        }
      }
      return {
        ...current,
        [tenantId]: tenantDraft,
      }
    })
  }, [tenantId, modules, modulePricesByTenant])

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
  const groupedPermissions = useMemo(() => {
    const activeModuleKeys = new Set(
      modules.filter((entry) => entry.enabled).map((entry) => entry.key)
    )
    const availablePermissions = new Set(matrixPermissions)
    const q = query.trim().toLowerCase()
    const groups = new Map<string, UiRightDefinition[]>()
    for (const right of UI_RIGHTS) {
      if (!availablePermissions.has(right.permission)) continue
      if (!right.moduleKeys.some((key) => activeModuleKeys.has(key))) continue
      if (
        q &&
        !`${right.label} ${right.group} ${formatAccessPermission(right.permission)}`
          .toLowerCase()
          .includes(q)
      ) {
        continue
      }
      const current = groups.get(right.group) || []
      current.push(right)
      groups.set(right.group, current)
    }
    return Array.from(groups.entries())
      .map(([group, rights]) => [group, rights.sort((left, right) => left.label.localeCompare(right.label, 'de'))] as const)
      .sort(([left], [right]) => left.localeCompare(right, 'de'))
  }, [matrixPermissions, modules, query])
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
  const modulePriceInputDraft = useMemo(
    () => modulePriceInputByTenant[tenantId] || {},
    [modulePriceInputByTenant, tenantId]
  )
  const moduleTrafficRows = useMemo(() => {
    return modules.map((entry) => {
      const configuredPrice = modulePriceDraft[entry.key] || 0
      const status: 'READY' | 'LIMITED' | 'IN_PREPARATION' = !entry.enabled
        ? 'IN_PREPARATION'
        : configuredPrice > 0
          ? 'READY'
          : 'LIMITED'
      return {
        key: entry.key,
        name: entry.name,
        status,
      }
    })
  }, [modulePriceDraft, modules])
  const moduleTrafficTotals = useMemo(() => {
    return moduleTrafficRows.reduce(
      (acc, row) => {
        acc[row.status] += 1
        return acc
      },
      { READY: 0, LIMITED: 0, IN_PREPARATION: 0 } as Record<'READY' | 'LIMITED' | 'IN_PREPARATION', number>
    )
  }, [moduleTrafficRows])
  const modulePriceTotals = useMemo(() => {
    let monthlyNetCents = 0
    for (const module of modules) {
      if (!module.enabled) continue
      monthlyNetCents += modulePriceDraft[module.key] || 0
    }
    const vatCents = Math.round(monthlyNetCents * 0.19)
    return { monthlyNetCents, vatCents, monthlyGrossCents: monthlyNetCents + vatCents }
  }, [modulePriceDraft, modules])
  const deviceRows = useMemo<ModuleDeviceRow[]>(() => {
    const displayDevices = displayRows.map<ModuleDeviceRow>((entry) => ({
      id: `display-${entry.id}`,
      sourceType: 'display',
      sourceId: entry.entityId || null,
      displaySourceKind: entry.sourceKind,
      displayRef: entry.id || null,
      displayId: entry.sourceKind === 'ORDER_DISPLAY' ? entry.entityId : null,
      orderDeskId: null,
      driverId: null,
      deviceName: entry.name,
      deviceType: `Display (${entry.displayType})`,
      branchName: entry.tenantName || '—',
      branchId: null,
      tenantId: entry.tenantId,
      status: entry.status,
      lastSeenAt: entry.lastSeenAt,
      pairedAt: entry.lastSyncAt,
      pairingSupported: Boolean(entry.pairingSupported),
    }))
    const orderDeskDevices = orderDeskRows.map<ModuleDeviceRow>((entry) => ({
      id: `orderdesk-${entry.id}`,
      sourceType: 'orderdesk',
      sourceId: entry.id,
      displaySourceKind: null,
      displayRef: null,
      displayId: null,
      orderDeskId: entry.id,
      driverId: null,
      deviceName: entry.deviceAlias || entry.deviceSerial,
      deviceType: 'OrderDesk',
      branchName: tenantNameById.get(entry.tenantId) || '—',
      branchId: null,
      tenantId: entry.tenantId,
      status: entry.isActive ? (entry.lastSeenAt ? 'online' : 'offline') : 'inactive',
      lastSeenAt: entry.lastSeenAt,
      pairedAt: entry.boundAt || entry.createdAt,
      pairingSupported: true,
    }))
    const driverDevices = driverRows.map<ModuleDeviceRow>((entry) => ({
      id: `driver-${entry.id}`,
      sourceType: 'driver',
      sourceId: entry.id,
      displaySourceKind: null,
      displayRef: null,
      displayId: null,
      orderDeskId: null,
      driverId: entry.id,
      deviceName: entry.name,
      deviceType: 'Fahrergerät',
      branchName: entry.tenant?.name || '—',
      branchId: null,
      tenantId: entry.tenantId || null,
      status: entry.isActive ? (entry.stats.activeDeliveries > 0 ? 'online' : 'offline') : 'inactive',
      lastSeenAt: entry.stats.lastAssignmentAt,
      pairedAt: entry.createdAt,
      pairingSupported: false,
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

  async function refreshDevices() {
    if (!token || !tenantId) return
    const [displays, orderdesk, drivers] = await Promise.all([
      getDisplayDeviceOverview(token, { tenantId }),
      getOrderDeskDeviceBindingsForScope(token, { tenantId, includeInactive: true }),
      getSuperadminDriverOverview(token, { tenantId, includeInactive: true, limit: 300 }),
    ])
    setDisplayRows(displays.rows)
    setOrderDeskRows(orderdesk.bindings)
    setDriverRows(drivers.rows)
  }

  function setDeviceActionLoading(row: ModuleDeviceRow, active: boolean) {
    setDeviceActionLoadingByKey((current) => ({ ...current, [row.id]: active }))
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
    setModulePriceInputByTenant((current) => ({
      ...current,
      [tenantId]: { ...(current[tenantId] || {}), [moduleKey]: value },
    }))
  }

  function commitModulePrice(moduleKey: FeatureModuleKey) {
    const cents = normalizeMoneyInputToCents(modulePriceInputDraft[moduleKey] ?? '')
    setModulePricesByTenant((current) => ({
      ...current,
      [tenantId]: { ...(current[tenantId] || {}), [moduleKey]: cents },
    }))
    setModulePriceInputByTenant((current) => ({
      ...current,
      [tenantId]: { ...(current[tenantId] || {}), [moduleKey]: formatMoneyInput(cents) },
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
    const availablePermissions = new Set(matrixPermissions)
    const nextPermissions = ROLE_PRESETS[role].filter((permission) => availablePermissions.has(permission))
    setPermissions(Array.from(new Set(nextPermissions)) as AccessPermission[])
    setRolePreset(role)
    setInfo(`Rollen-Vorlage ${role} angewendet.`)
  }

  async function handleDeviceLock(row: ModuleDeviceRow) {
    try {
      setDeviceActionLoading(row, true)
      setError('')
      if (row.sourceType === 'display') {
        if (!row.displayRef) {
          setError('Für dieses Gerät fehlt die gültige Backend-ID.')
          return
        }
        await updateDisplayDeviceActiveState(token, row.displayRef, false)
        await refreshDevices()
        setInfo('Display wurde gesperrt (inactive).')
      } else if (row.sourceType === 'orderdesk') {
        if (!row.orderDeskId) {
          setError('Für dieses Gerät fehlt die gültige Backend-ID.')
          return
        }
        await deactivateOrderDeskDeviceBinding(token, row.orderDeskId)
        await refreshDevices()
        setInfo('OrderDesk-Gerät wurde gesperrt.')
      } else {
        setPairingModal({
          title: `${row.deviceType}: ${row.deviceName}`,
          payload: `Funktion noch nicht angebunden.\nGerätetyp: ${row.deviceType}\nGeräte-ID: ${row.sourceId || row.id}\nFiliale: ${row.branchName}`,
        })
      }
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Gerät konnte nicht gesperrt werden')
    } finally {
      setDeviceActionLoading(row, false)
    }
  }

  async function handleDeviceDelete(row: ModuleDeviceRow) {
    if (!window.confirm('Gerät wirklich löschen/entkoppeln?')) return
    try {
      setDeviceActionLoading(row, true)
      setError('')
      if (row.sourceType === 'orderdesk') {
        if (!row.orderDeskId) {
          setError('Für dieses Gerät fehlt die gültige Backend-ID.')
          return
        }
        await deleteOrderDeskDeviceBinding(token, row.orderDeskId)
        await refreshDevices()
        setInfo('OrderDesk-Gerät wurde gelöscht.')
      } else if (row.sourceType === 'display') {
        setPairingModal({
          title: `Display löschen: ${row.deviceName}`,
          payload: `Display-Löschen ist hier noch nicht angebunden.\nDisplay-ID: ${row.displayId || row.sourceId || '-'}\nDisplay-Ref: ${row.displayRef || '-'}\nBitte aktuell in der Display-Geräteverwaltung ausführen.`,
        })
      } else {
        setPairingModal({
          title: `${row.deviceType}: ${row.deviceName}`,
          payload: `Funktion noch nicht angebunden.\nGerätetyp: ${row.deviceType}\nGeräte-ID: ${row.sourceId || row.id}\nFiliale: ${row.branchName}`,
        })
      }
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Gerät konnte nicht gelöscht werden')
    } finally {
      setDeviceActionLoading(row, false)
    }
  }

  async function handleDeviceRePair(row: ModuleDeviceRow) {
    try {
      setDeviceActionLoading(row, true)
      setError('')
      if (row.sourceType === 'orderdesk') {
        if (!row.orderDeskId) {
          setError('Für dieses Gerät fehlt die gültige Backend-ID.')
          return
        }
        const next = await resetOrderDeskDevicePairing(token, row.orderDeskId)
        setPairingModal({
          title: `OrderDesk neu koppeln: ${row.deviceName}`,
          payload: next.pairingPayload,
          qrImageUrl: next.qrImageUrl,
        })
        await refreshDevices()
        setInfo('OrderDesk Pairing-Code wurde neu erzeugt.')
      } else if (row.sourceType === 'display') {
        if (!row.displayRef) {
          setError('Für dieses Gerät fehlt die gültige Backend-ID.')
          return
        }
        if (!row.pairingSupported || row.displaySourceKind !== 'ORDER_DISPLAY') {
          setPairingModal({
            title: `Display neu koppeln: ${row.deviceName}`,
            payload: `Für diesen Display-Typ ist die Pairing-Code-API hier noch nicht angebunden.\nQuelle: ${row.displaySourceKind || 'unbekannt'}\nDisplay-Ref: ${row.displayRef}`,
          })
          return
        }
        const next = await regenerateDisplayPairingCode(token, row.displayRef)
        setPairingModal({
          title: `Display neu koppeln: ${row.deviceName}`,
          payload: next.pairingPayload,
          qrImageUrl: next.qrImageUrl,
        })
        await refreshDevices()
        setInfo('Display Pairing-Code wurde neu erzeugt.')
      } else {
        setPairingModal({
          title: `${row.deviceType}: ${row.deviceName}`,
          payload: `Pairing-API fehlt noch.\nGeräte-ID: ${row.sourceId || row.id}\nGerätetyp: ${row.deviceType}\nFiliale: ${row.branchName}`,
        })
      }
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Neu koppeln fehlgeschlagen')
    } finally {
      setDeviceActionLoading(row, false)
    }
  }

  async function handleDeviceQr(row: ModuleDeviceRow) {
    if (row.sourceType === 'display' && row.pairingSupported && row.displaySourceKind === 'ORDER_DISPLAY') {
      if (!row.displayRef) {
        setError('Für dieses Gerät fehlt die gültige Backend-ID.')
        return
      }
      try {
        setDeviceActionLoading(row, true)
        const next = await regenerateDisplayPairingCode(token, row.displayRef)
        setPairingModal({
          title: `QR-Code: ${row.deviceName}`,
          payload: next.pairingPayload,
          qrImageUrl: next.qrImageUrl,
        })
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'QR-Code konnte nicht geladen werden')
      } finally {
        setDeviceActionLoading(row, false)
      }
      return
    }
    if (row.sourceType === 'orderdesk') {
      setPairingModal({
        title: `OrderDesk QR: ${row.deviceName}`,
        payload: `OrderDesk-Binding: ${row.orderDeskId || row.id}\nStatus: ${row.status}\nFiliale: ${row.branchName}\nHinweis: QR-API ist für diesen Typ noch in Vorbereitung.`,
      })
      return
    }
    setPairingModal({
      title: `${row.deviceType}: ${row.deviceName}`,
      payload: `QR-/Pairing-Funktion noch nicht angebunden.\nGeräte-ID: ${row.sourceId || row.id}\nGerätetyp: ${row.deviceType}\nFiliale: ${row.branchName}`,
    })
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
              href={`/superadmin/fees${tenantId ? `?tenantId=${encodeURIComponent(tenantId)}&branchId=${encodeURIComponent(tenantId)}` : ''}`}
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
                Monatswerte für die Filiale pflegen. Diese Daten bleiben netto und werden später für Abrechnungspositionen genutzt.
              </p>
              <div className="mt-3 grid gap-3 md:grid-cols-2 xl:grid-cols-3">
                <label className="rounded-xl border border-slate-200 bg-white p-3 text-xs text-slate-600">
                  Monatliche Grundgebühr netto
                  <input
                    type="number"
                    step="0.01"
                    value={billingDraft ? billingDraft.monthlyFeeCents / 100 : 0}
                    onChange={(event) =>
                      setBillingDraft((current) =>
                        current ? { ...current, monthlyFeeCents: Math.round(Number(event.target.value || 0) * 100) } : current
                      )
                    }
                    className="mt-1 w-full rounded-lg border border-slate-200 px-3 py-2 text-sm"
                  />
                </label>
                <label className="rounded-xl border border-slate-200 bg-white p-3 text-xs text-slate-600">
                  Inklusive Bestellungen pro Monat
                  <input
                    type="number"
                    value={billingDraft?.includedOrders || 0}
                    onChange={(event) =>
                      setBillingDraft((current) =>
                        current ? { ...current, includedOrders: Math.round(Number(event.target.value || 0)) } : current
                      )
                    }
                    className="mt-1 w-full rounded-lg border border-slate-200 px-3 py-2 text-sm"
                  />
                </label>
                <label className="rounded-xl border border-slate-200 bg-white p-3 text-xs text-slate-600">
                  Preis je zusätzlicher Bestellung netto
                  <input
                    type="number"
                    step="0.01"
                    value={billingDraft ? billingDraft.fixedFeePerOrderCents / 100 : 0}
                    onChange={(event) =>
                      setBillingDraft((current) =>
                        current ? { ...current, fixedFeePerOrderCents: Math.round(Number(event.target.value || 0) * 100) } : current
                      )
                    }
                    className="mt-1 w-full rounded-lg border border-slate-200 px-3 py-2 text-sm"
                  />
                </label>
                <label className="rounded-xl border border-slate-200 bg-white p-3 text-xs text-slate-600">
                  Mindestvertragslaufzeit / Abrechnungsmodell
                  <select
                    value={billingDraft?.planType || 'REVENUE_SHARE'}
                    onChange={(event) =>
                      setBillingDraft((current) =>
                        current
                          ? {
                              ...current,
                              planType: event.target.value as 'REVENUE_SHARE' | 'MONTHLY_FIXED' | 'ORDER_PACKAGE' | 'HYBRID' | 'CUSTOM',
                            }
                          : current
                      )
                    }
                    className="mt-1 w-full rounded-lg border border-slate-200 px-3 py-2 text-sm"
                  >
                    <option value="REVENUE_SHARE">Provision</option>
                    <option value="MONTHLY_FIXED">Monatspauschale</option>
                    <option value="ORDER_PACKAGE">Bestellpaket</option>
                    <option value="HYBRID">Hybrid</option>
                    <option value="CUSTOM">Individuell</option>
                  </select>
                </label>
                <label className="rounded-xl border border-slate-200 bg-white p-3 text-xs text-slate-600">
                  Abrechnungsart
                  <select
                    value={billingDraft?.billingPeriod || 'MONTHLY'}
                    onChange={(event) =>
                      setBillingDraft((current) =>
                        current
                          ? { ...current, billingPeriod: event.target.value as 'MONTHLY' | 'WEEKLY' }
                          : current
                      )
                    }
                    className="mt-1 w-full rounded-lg border border-slate-200 px-3 py-2 text-sm"
                  >
                    <option value="MONTHLY">Monatlich</option>
                    <option value="WEEKLY">Wöchentlich</option>
                  </select>
                </label>
                <label className="rounded-xl border border-slate-200 bg-white p-3 text-xs text-slate-600">
                  Provision in %
                  <input
                    type="number"
                    step="0.01"
                    value={billingDraft?.commissionPercent || 0}
                    onChange={(event) =>
                      setBillingDraft((current) =>
                        current ? { ...current, commissionPercent: Number(event.target.value || 0) } : current
                      )
                    }
                    className="mt-1 w-full rounded-lg border border-slate-200 px-3 py-2 text-sm"
                  />
                </label>
              </div>
              <div className="mt-3">
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
            <p className="mb-3 rounded-xl border border-slate-200 bg-white px-3 py-2 text-xs text-slate-600">
              Paketvorlagen setzen Module und Beispielpreise, danach können alle Werte einzeln angepasst werden.
            </p>
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
            <div className="mb-4 rounded-2xl border border-slate-200 bg-slate-50 p-3">
              <div className="flex flex-wrap items-center gap-2 text-xs">
                <span className="rounded-full bg-emerald-100 px-2 py-1 font-semibold text-emerald-700">Gruen: {moduleTrafficTotals.READY}</span>
                <span className="rounded-full bg-amber-100 px-2 py-1 font-semibold text-amber-700">Gelb: {moduleTrafficTotals.LIMITED}</span>
                <span className="rounded-full bg-slate-200 px-2 py-1 font-semibold text-slate-700">Grau: {moduleTrafficTotals.IN_PREPARATION}</span>
              </div>
              <p className="mt-2 text-xs text-slate-600">
                Ampelstatus je Modul: Gruen = aktiv mit Preis, Gelb = aktiv ohne Preis, Grau = nicht freigeschaltet.
              </p>
            </div>
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
                          <span className={`rounded-full px-2 py-0.5 text-xs ${
                            !entry.enabled
                              ? 'bg-slate-200 text-slate-600'
                              : (modulePriceDraft[entry.key] || 0) > 0
                                ? 'bg-emerald-100 text-emerald-700'
                                : 'bg-amber-100 text-amber-700'
                          }`}>
                            {!entry.enabled ? 'inaktiv' : (modulePriceDraft[entry.key] || 0) > 0 ? 'ready' : 'limited'}
                          </span>
                        </div>
                        <p className="mt-1 text-xs text-slate-600">{entry.description}</p>
                        <div className="mt-2 grid gap-2 sm:grid-cols-2">
                          <label className="text-xs text-slate-600">Monatlicher Preis netto
                            <input
                              type="text"
                              inputMode="decimal"
                              value={modulePriceInputDraft[entry.key] ?? formatMoneyInput(modulePriceDraft[entry.key] || 0)}
                              onChange={(event) => setModulePrice(entry.key, event.target.value)}
                              onBlur={() => commitModulePrice(entry.key)}
                              className="mt-1 w-full rounded-lg border border-slate-200 px-2 py-1.5 text-sm"
                              placeholder="0,00"
                            />
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
            <p className="text-xs text-slate-600">Module und Abrechnung sind getrennt. Hier verwaltest du nur Benutzerrechte. Mehrere Detailrechte können auf dasselbe technische Basisrecht zeigen.</p>
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
                    {entries.map((right) => {
                      const checked = permissions.includes(right.permission)
                      return (
                        <label key={right.id} className="flex items-center gap-2 text-xs">
                          <input
                            type="checkbox"
                            checked={checked}
                            onChange={(event) => {
                              setPermissions((current) =>
                                event.target.checked
                                  ? [...current, right.permission]
                                  : current.filter((entry) => entry !== right.permission)
                              )
                            }}
                          />
                          {right.label}
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
            <div className="mb-3">
              <ImplementationNotice
                title="Einheitlicher Hinweis"
                message="Nicht angebundene Aktionen werden klar markiert und lösen keinen stillen API-Fehler mehr aus."
                tone="preparation"
              />
            </div>
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
                  {deviceRows.map((row) => {
                    const rowLoading = Boolean(deviceActionLoadingByKey[row.id])
                    const actionNotConnected = row.sourceType === 'driver' || row.sourceType === 'pos'
                    return (
                    <tr key={row.id} className="border-t border-slate-100">
                      <td className="px-3 py-2 font-medium text-slate-900">{row.deviceName}</td>
                      <td className="px-3 py-2 text-slate-700">{row.deviceType}</td>
                      <td className="px-3 py-2 text-slate-700">{row.branchName}</td>
                      <td className="px-3 py-2">
                        <span className={`rounded-full px-2 py-0.5 text-xs ${row.status === 'online' ? 'bg-emerald-100 text-emerald-700' : row.status === 'offline' ? 'bg-amber-100 text-amber-700' : 'bg-slate-200 text-slate-700'}`}>
                          {row.status}
                        </span>
                      </td>
                      <td className="px-3 py-2 text-slate-700">{formatDateTime(row.lastSeenAt)}</td>
                      <td className="px-3 py-2 text-slate-700">{formatDateOnly(row.pairedAt)}</td>
                      <td className="px-3 py-2">
                        <div className="flex flex-wrap gap-1">
                          <button type="button" className="rounded-lg border border-slate-200 px-2 py-1 text-xs text-slate-700 disabled:opacity-60" onClick={() => void handleDeviceLock(row)} disabled={loading || rowLoading || actionNotConnected} title={actionNotConnected ? 'Funktion noch nicht angebunden' : undefined}>
                            {rowLoading ? 'Lädt...' : 'Gerät sperren'}
                          </button>
                          <button type="button" className="rounded-lg border border-slate-200 px-2 py-1 text-xs text-slate-700 disabled:opacity-60" onClick={() => void handleDeviceDelete(row)} disabled={loading || rowLoading || actionNotConnected} title={actionNotConnected ? 'Funktion noch nicht angebunden' : undefined}>
                            {rowLoading ? 'Lädt...' : 'Gerät löschen'}
                          </button>
                          <button type="button" className="rounded-lg border border-slate-200 px-2 py-1 text-xs text-slate-700 disabled:opacity-60" onClick={() => void handleDeviceRePair(row)} disabled={loading || rowLoading}>
                            {rowLoading ? 'Lädt...' : 'Neu koppeln'}
                          </button>
                          <button type="button" className="rounded-lg border border-slate-200 px-2 py-1 text-xs text-slate-700 disabled:opacity-60" onClick={() => handleDeviceQr(row)} disabled={loading || rowLoading}>
                            QR-Code
                          </button>
                        </div>
                      </td>
                    </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          </div>
        ) : null}

        {pairingModal ? (
          <div className="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/40 p-4">
            <div className="w-full max-w-lg rounded-2xl border border-slate-200 bg-white p-4 shadow-xl">
              <div className="flex items-center justify-between gap-3">
                <h4 className="text-sm font-semibold text-slate-900">{pairingModal.title}</h4>
                <button type="button" className="rounded-lg border border-slate-200 px-2 py-1 text-xs text-slate-700" onClick={() => setPairingModal(null)}>Schließen</button>
              </div>
              {pairingModal.qrImageUrl ? (
                <img src={pairingModal.qrImageUrl} alt="Pairing QR-Code" className="mx-auto mt-3 h-52 w-52 rounded-lg border border-slate-200 object-contain" />
              ) : null}
              <textarea readOnly value={pairingModal.payload} className="mt-3 h-32 w-full rounded-xl border border-slate-200 px-3 py-2 text-xs text-slate-700" />
              {pairingManualData ? (
                <div className="mt-3 rounded-xl border border-slate-200 bg-slate-50 p-3">
                  <p className="text-xs font-semibold text-slate-900">Manuelle OrderDesk-Verbindung</p>
                  <p className="mt-1 text-[11px] text-slate-600">Diese Werte in der OrderDesk-App unter „Manuell verbinden“ eintragen.</p>
                  <div className="mt-2 space-y-2">
                    {[
                      { label: 'API-URL', value: pairingManualData.apiBaseUrl },
                      { label: 'Tenant-ID', value: pairingManualData.tenantId },
                      { label: 'Admin-ID / Betriebscode', value: pairingManualData.adminCode },
                      { label: 'DisplayCode / Gerätename', value: pairingManualData.displayCode },
                      { label: 'PairingToken / manueller Gerätecode', value: pairingManualData.pairingToken },
                    ].map((entry) => (
                      <div key={entry.label} className="rounded-lg border border-slate-200 bg-white px-2 py-1.5">
                        <div className="flex items-center justify-between gap-2">
                          <p className="text-[11px] font-semibold text-slate-700">{entry.label}</p>
                          <button
                            type="button"
                            className="rounded border border-slate-300 px-1.5 py-0.5 text-[10px] text-slate-700 hover:bg-slate-100"
                            onClick={() => void copyPairingField(entry.value, entry.label)}
                          >
                            Kopieren
                          </button>
                        </div>
                        <p className="mt-1 break-all font-mono text-[11px] text-slate-900">{entry.value || '-'}</p>
                      </div>
                    ))}
                    {pairingCopyInfo ? <p className="text-[11px] text-emerald-700">{pairingCopyInfo}</p> : null}
                  </div>
                </div>
              ) : null}
            </div>
          </div>
        ) : null}

      </div>
    </BackofficeLayout>
  )
}
