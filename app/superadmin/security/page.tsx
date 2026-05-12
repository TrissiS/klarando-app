'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  assignManagedDatabase,
  createEmptyManagedDatabase,
  createAccessUser,
  createChain,
  deleteManagedChain,
  deleteManagedDatabase,
  deleteManagedTenant,
  deleteAccessUser,
  createManagedTenant,
  getDatabaseManagementAdminOverview,
  getDatabaseManagementOverview,
  getAccessContext,
  getChainadminAccessRights,
  getPermissionMatrix,
  getAccessUserPermissions,
  getAccessUsers,
  updateChainadminAccessRight,
  updateAccessUser,
  updateAccessUserPermissions,
  updateManagedChain,
  updateManagedTenant,
  type AccessContext,
  type AccessPermission,
  type AccessRole,
  type AccessUser,
  type ChainadminTenantRight,
  type DatabaseAssignmentType,
  type DatabaseManagementAdminOverview,
  type DatabaseManagementOverview,
} from '@/lib/api'
import {
  ACCESS_PACKAGES,
  formatAccessPermission,
  packageIdsFromPermissions,
  permissionsFromPackageIds,
} from '@/lib/access-packages'
import type { SessionUser } from '@/lib/app-data'
import { safeParse } from '@/lib/storage'
import { setSuperadminTenantContext } from '@/lib/superadmin-tenant-context'

type NewUserForm = {
  name: string
  email: string
  password: string
  role: AccessRole
  chainId: string
  tenantId: string
}

type EditUserForm = {
  id: string
  name: string
  role: AccessRole
  chainId: string
  tenantId: string
  isActive: boolean
  password: string
}

type BillingPackage = {
  id: string
  name: string
  description: string
  price: number
  monthlyFee: number
  yearlyFee: number
  setupFeePerCompany: number
  isActive: boolean
}

type DatabaseCreateForm = {
  label: string
  databaseName: string
  assignType: DatabaseAssignmentType
  chainId: string
  tenantId: string
  templateDatabase: string
}

type DatabaseAssignForm = {
  databaseName: string
  assignType: Exclude<DatabaseAssignmentType, 'UNASSIGNED'>
  chainId: string
  tenantId: string
}

type DatabaseListRow = {
  key: string
  databaseName: string
  assignmentType: DatabaseAssignmentType
  assignmentLabel: string
  chainId: string | null
  tenantId: string | null
  updatedAt: string | null
  note: string | null
}

const BILLING_PACKAGES_STORAGE_KEY = 'klarando.billingPackages.v1'
const MODULE_PRICE_STORAGE_KEY = 'klarando.modulePrices.v1'
const SUBMODULE_PRICE_STORAGE_KEY = 'klarando.submodulePrices.v1'

const ALL_PACKAGE_PERMISSIONS = Array.from(
  new Set(ACCESS_PACKAGES.flatMap((entry) => entry.permissions))
).sort() as AccessPermission[]

const defaultBillingPackages: BillingPackage[] = [
  {
    id: 'basic',
    name: 'Basic',
    description: 'Einsteigerpaket fuer kleine Standorte',
    price: 99,
    monthlyFee: 49,
    yearlyFee: 499,
    setupFeePerCompany: 149,
    isActive: true,
  },
  {
    id: 'business',
    name: 'Business',
    description: 'Mehr Module und erweiterte Verwaltung',
    price: 199,
    monthlyFee: 89,
    yearlyFee: 899,
    setupFeePerCompany: 199,
    isActive: true,
  },
  {
    id: 'enterprise',
    name: 'Enterprise',
    description: 'Volle Klarando Suite fuer Kettenbetrieb',
    price: 349,
    monthlyFee: 149,
    yearlyFee: 1490,
    setupFeePerCompany: 249,
    isActive: true,
  },
]

const emptyUserForm: NewUserForm = {
  name: '',
  email: '',
  password: '',
  role: 'ADMIN',
  chainId: '',
  tenantId: '',
}

const initialDatabaseCreateForm: DatabaseCreateForm = {
  label: '',
  databaseName: '',
  assignType: 'UNASSIGNED',
  chainId: '',
  tenantId: '',
  templateDatabase: '',
}

const initialDatabaseAssignForm: DatabaseAssignForm = {
  databaseName: '',
  assignType: 'TENANT',
  chainId: '',
  tenantId: '',
}

function toEditForm(user: AccessUser): EditUserForm {
  return {
    id: user.id,
    name: user.name,
    role: user.role,
    chainId: user.chainId || '',
    tenantId: user.tenantId || '',
    isActive: user.isActive,
    password: '',
  }
}

function formatDateTime(value: string | null) {
  if (!value) {
    return '-'
  }
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) {
    return value
  }
  return parsed.toLocaleString('de-DE')
}

function confirmSecondStepSettingsChange(entityLabel: string) {
  const firstCheck = window.confirm(
    `Einstellung fuer "${entityLabel}" wirklich aendern?`
  )
  if (!firstCheck) {
    return false
  }

  return window.confirm(
    `Zweite Bestaetigung: Soll die Aenderung fuer "${entityLabel}" jetzt gespeichert werden?`
  )
}

function permissionGroupLabel(permission: AccessPermission) {
  if (permission.startsWith('TENANTS_')) return 'Ketten & Filialen'
  if (permission.startsWith('USERS_')) return 'Benutzer & Team'
  if (permission.startsWith('PRODUCTS_')) return 'Produkte'
  if (permission.startsWith('INVENTORY_')) return 'Lager & Einkauf'
  if (permission.startsWith('ORDERS_')) return 'Bestellungen'
  if (permission.startsWith('SETTINGS_')) return 'App & System'
  if (permission.startsWith('AUDIT_')) return 'Audit & Compliance'
  return 'Weitere Rechte'
}

export default function SuperadminSecurityPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [users, setUsers] = useState<AccessUser[]>([])
  const [databaseOverview, setDatabaseOverview] = useState<DatabaseManagementOverview | null>(null)
  const [adminOverview, setAdminOverview] = useState<DatabaseManagementAdminOverview | null>(null)
  const [billingPackages, setBillingPackages] = useState<BillingPackage[]>(defaultBillingPackages)
  const [selectedBillingPackageId, setSelectedBillingPackageId] = useState('')

  const [newChainName, setNewChainName] = useState('')
  const [newChainCode, setNewChainCode] = useState('')
  const [newTenantName, setNewTenantName] = useState('')
  const [newTenantEmail, setNewTenantEmail] = useState('')
  const [newTenantChainId, setNewTenantChainId] = useState('')
  const [newTenantCopyFromId, setNewTenantCopyFromId] = useState('')
  const [databaseCreateForm, setDatabaseCreateForm] = useState<DatabaseCreateForm>(
    initialDatabaseCreateForm
  )
  const [databaseAssignForm, setDatabaseAssignForm] = useState<DatabaseAssignForm>(
    initialDatabaseAssignForm
  )
  const [userForm, setUserForm] = useState<NewUserForm>(emptyUserForm)
  const [editForm, setEditForm] = useState<EditUserForm | null>(null)

  const [selectedUserId, setSelectedUserId] = useState('')
  const [selectedPermissions, setSelectedPermissions] = useState<AccessPermission[]>([])
  const [selectedPackageIds, setSelectedPackageIds] = useState<string[]>([])
  const [selectedSubPermissions, setSelectedSubPermissions] = useState<AccessPermission[]>([])
  const [permissionUniverse, setPermissionUniverse] = useState<AccessPermission[]>(
    ALL_PACKAGE_PERMISSIONS
  )
  const [permissionFilter, setPermissionFilter] = useState('')
  const [modulePrices, setModulePrices] = useState<Record<string, number>>({})
  const [submodulePrices, setSubmodulePrices] = useState<Record<string, number>>({})
  const [selectedChainadminId, setSelectedChainadminId] = useState('')
  const [selectedChainadminRights, setSelectedChainadminRights] = useState<ChainadminTenantRight[]>([])
  const [isLoadingChainadminRights, setIsLoadingChainadminRights] = useState(false)
  const [savingChainadminTenantId, setSavingChainadminTenantId] = useState<string | null>(null)

  const [isLoading, setIsLoading] = useState(true)
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const selectedUser = useMemo(
    () => users.find((entry) => entry.id === selectedUserId) || null,
    [users, selectedUserId]
  )

  const editableUser = useMemo(
    () => users.find((entry) => entry.id === editForm?.id) || null,
    [users, editForm?.id]
  )

  const selectedBillingPackage = useMemo(
    () => billingPackages.find((entry) => entry.id === selectedBillingPackageId) || null,
    [billingPackages, selectedBillingPackageId]
  )
  const packageDerivedPermissions = useMemo(
    () => permissionsFromPackageIds(selectedPackageIds),
    [selectedPackageIds]
  )
  const previewPermissions = useMemo(() => {
    return Array.from(
      new Set([
        ...packageDerivedPermissions,
        ...selectedSubPermissions,
      ])
    ).sort() as AccessPermission[]
  }, [packageDerivedPermissions, selectedSubPermissions])
  const previewPermissionSet = useMemo(
    () => new Set(previewPermissions),
    [previewPermissions]
  )
  const filteredPackageTemplates = useMemo(() => {
    const query = permissionFilter.trim().toLowerCase()
    if (!query) {
      return ACCESS_PACKAGES
    }

    return ACCESS_PACKAGES.filter((entry) => {
      const haystack = [
        entry.name,
        entry.description,
        ...entry.permissions.map((permission) => formatAccessPermission(permission)),
      ]
        .join(' ')
        .toLowerCase()
      return haystack.includes(query)
    })
  }, [permissionFilter])
  const filteredSubPermissions = useMemo(() => {
    const query = permissionFilter.trim().toLowerCase()
    if (!query) {
      return permissionUniverse
    }

    return permissionUniverse.filter((permission) =>
      formatAccessPermission(permission).toLowerCase().includes(query)
    )
  }, [permissionFilter, permissionUniverse])
  const subPermissionsByGroup = useMemo(() => {
    const grouped = new Map<string, AccessPermission[]>()
    for (const permission of filteredSubPermissions) {
      const group = permissionGroupLabel(permission)
      const current = grouped.get(group) || []
      current.push(permission)
      grouped.set(group, current)
    }

    return Array.from(grouped.entries())
      .map(([label, permissions]) => ({
        label,
        permissions: [...permissions].sort((left, right) =>
          formatAccessPermission(left).localeCompare(formatAccessPermission(right), 'de-DE')
        ),
      }))
      .sort((left, right) => left.label.localeCompare(right.label, 'de-DE'))
  }, [filteredSubPermissions])
  const selectedSubPermissionSet = useMemo(
    () => new Set(selectedSubPermissions),
    [selectedSubPermissions]
  )
  const packageDerivedPermissionSet = useMemo(
    () => new Set(packageDerivedPermissions),
    [packageDerivedPermissions]
  )
  const permissionsNotCoveredByPackages = useMemo(() => {
    const packagePermissionSet = new Set(ALL_PACKAGE_PERMISSIONS)
    return permissionUniverse.filter((permission) => !packagePermissionSet.has(permission))
  }, [permissionUniverse])

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
    if (!session) return
    if (!token) {
      setError('Kein Backend-Token gefunden. Bitte neu einloggen.')
      setIsLoading(false)
      return
    }
    void loadData(token)
  }, [session, token])

  useEffect(() => {
    const stored = safeParse<BillingPackage[]>(
      localStorage.getItem(BILLING_PACKAGES_STORAGE_KEY),
      defaultBillingPackages
    )
    const normalized = stored.length > 0 ? stored : defaultBillingPackages
    setBillingPackages(normalized)
    setSelectedBillingPackageId(normalized[0]?.id || '')
  }, [])

  useEffect(() => {
    if (billingPackages.length === 0) {
      return
    }
    localStorage.setItem(BILLING_PACKAGES_STORAGE_KEY, JSON.stringify(billingPackages))
    if (!selectedBillingPackageId) {
      setSelectedBillingPackageId(billingPackages[0]?.id || '')
    }
  }, [billingPackages, selectedBillingPackageId])

  useEffect(() => {
    const storedModules = safeParse<Record<string, number>>(
      localStorage.getItem(MODULE_PRICE_STORAGE_KEY),
      {}
    )
    const storedSubmodules = safeParse<Record<string, number>>(
      localStorage.getItem(SUBMODULE_PRICE_STORAGE_KEY),
      {}
    )
    setModulePrices(storedModules)
    setSubmodulePrices(storedSubmodules)
  }, [])

  useEffect(() => {
    localStorage.setItem(MODULE_PRICE_STORAGE_KEY, JSON.stringify(modulePrices))
  }, [modulePrices])

  useEffect(() => {
    localStorage.setItem(SUBMODULE_PRICE_STORAGE_KEY, JSON.stringify(submodulePrices))
  }, [submodulePrices])

  const chainNameById = useMemo(
    () => new Map((context?.chains || []).map((entry) => [entry.id, entry.name])),
    [context]
  )

  const tenantNameById = useMemo(
    () => new Map((context?.tenants || []).map((entry) => [entry.id, entry.name])),
    [context]
  )

  const tenantEmailById = useMemo(
    () => new Map((context?.tenants || []).map((entry) => [entry.id, entry.email || ''])),
    [context]
  )

  const tenantsForNewUser = useMemo(() => {
    if (!context) return []
    if (!userForm.chainId) return context.tenants
    return context.tenants.filter((entry) => entry.chainId === userForm.chainId)
  }, [context, userForm.chainId])

  const templateTenantsForCopy = useMemo(() => {
    if (!context || !newTenantChainId) {
      return []
    }
    return context.tenants.filter((entry) => entry.chainId === newTenantChainId)
  }, [context, newTenantChainId])

  const tenantsForDatabaseCreate = useMemo(() => {
    if (!context) {
      return []
    }
    if (!databaseCreateForm.chainId) {
      return context.tenants
    }
    return context.tenants.filter((entry) => entry.chainId === databaseCreateForm.chainId)
  }, [context, databaseCreateForm.chainId])

  const tenantsForDatabaseAssign = useMemo(() => {
    if (!context) {
      return []
    }
    if (!databaseAssignForm.chainId) {
      return context.tenants
    }
    return context.tenants.filter((entry) => entry.chainId === databaseAssignForm.chainId)
  }, [context, databaseAssignForm.chainId])

  const unassignedDatabases = useMemo(() => databaseOverview?.unassigned || [], [databaseOverview])

  const treeChains = useMemo(() => {
    const chains = adminOverview?.chains || []
    const tenants = adminOverview?.tenants || []
    const tenantsByChainId = new Map<string, typeof tenants>()
    const withoutChain: typeof tenants = []

    for (const tenant of tenants) {
      if (!tenant.chainId) {
        withoutChain.push(tenant)
        continue
      }
      const group = tenantsByChainId.get(tenant.chainId) || []
      group.push(tenant)
      tenantsByChainId.set(tenant.chainId, group)
    }

    return {
      chains: chains.map((chain) => ({
        ...chain,
        tenants: (tenantsByChainId.get(chain.id) || []).sort((left, right) =>
          left.name.localeCompare(right.name, 'de', { sensitivity: 'base' })
        ),
      })),
      withoutChain: withoutChain.sort((left, right) =>
        left.name.localeCompare(right.name, 'de', { sensitivity: 'base' })
      ),
    }
  }, [adminOverview])

  const databaseListRows = useMemo<DatabaseListRow[]>(() => {
    if (!adminOverview) {
      return []
    }

    const chainRows: DatabaseListRow[] = adminOverview.chains
      .filter((entry) => Boolean(entry.databaseName))
      .map((entry) => ({
        key: `chain-${entry.id}`,
        databaseName: entry.databaseName || '',
        assignmentType: 'CHAIN',
        assignmentLabel: entry.name,
        chainId: entry.id,
        tenantId: null,
        updatedAt: entry.databaseUpdatedAt,
        note: entry.code,
      }))

    const tenantRows: DatabaseListRow[] = adminOverview.tenants
      .filter((entry) => Boolean(entry.databaseName))
      .map((entry) => ({
        key: `tenant-${entry.id}`,
        databaseName: entry.databaseName || '',
        assignmentType: 'TENANT',
        assignmentLabel: entry.name,
        chainId: entry.chainId,
        tenantId: entry.id,
        updatedAt: entry.databaseUpdatedAt,
        note: entry.chainName,
      }))

    const unassignedRows: DatabaseListRow[] = adminOverview.unassignedDatabases.map((entry) => ({
      key: `unassigned-${entry.id}`,
      databaseName: entry.databaseName,
      assignmentType: 'UNASSIGNED',
      assignmentLabel: 'Nicht zugewiesen',
      chainId: null,
      tenantId: null,
      updatedAt: entry.updatedAt,
      note: entry.label,
    }))

    return [...chainRows, ...tenantRows, ...unassignedRows].sort((left, right) =>
      left.databaseName.localeCompare(right.databaseName, 'de', { sensitivity: 'base' })
    )
  }, [adminOverview])

  useEffect(() => {
    if (!newTenantCopyFromId) {
      return
    }

    if (!templateTenantsForCopy.some((entry) => entry.id === newTenantCopyFromId)) {
      setNewTenantCopyFromId('')
    }
  }, [templateTenantsForCopy, newTenantCopyFromId])

  useEffect(() => {
    if (!databaseCreateForm.tenantId) {
      return
    }

    if (!tenantsForDatabaseCreate.some((entry) => entry.id === databaseCreateForm.tenantId)) {
      setDatabaseCreateForm((current) => ({ ...current, tenantId: '' }))
    }
  }, [databaseCreateForm.tenantId, tenantsForDatabaseCreate])

  useEffect(() => {
    if (!databaseAssignForm.tenantId) {
      return
    }

    if (!tenantsForDatabaseAssign.some((entry) => entry.id === databaseAssignForm.tenantId)) {
      setDatabaseAssignForm((current) => ({ ...current, tenantId: '' }))
    }
  }, [databaseAssignForm.tenantId, tenantsForDatabaseAssign])

  const tenantsForEdit = useMemo(() => {
    if (!context || !editForm) return []
    if (!editForm.chainId) return context.tenants
    return context.tenants.filter((entry) => entry.chainId === editForm.chainId)
  }, [context, editForm?.chainId, editForm])

  const chainadminUsers = useMemo(
    () => users.filter((entry) => entry.role === 'CHAINADMIN'),
    [users]
  )

  async function loadData(accessToken: string) {
    try {
      setIsLoading(true)
      setError('')
      const [
        loadedUsers,
        loadedContext,
        loadedDatabaseOverview,
        loadedAdminOverview,
        permissionMatrix,
      ] = await Promise.all([
        getAccessUsers(accessToken),
        getAccessContext(accessToken),
        getDatabaseManagementOverview(accessToken),
        getDatabaseManagementAdminOverview(accessToken),
        getPermissionMatrix(accessToken),
      ])

      setUsers(loadedUsers)
      setContext(loadedContext)
      setDatabaseOverview(loadedDatabaseOverview)
      setAdminOverview(loadedAdminOverview)
      const matrixPermissions = Array.from(
        new Set(permissionMatrix.map((entry) => entry.permission))
      ).sort() as AccessPermission[]
      setPermissionUniverse(
        matrixPermissions.length > 0 ? matrixPermissions : ALL_PACKAGE_PERMISSIONS
      )

      if (!newTenantChainId && loadedContext.chains[0]?.id) {
        setNewTenantChainId(loadedContext.chains[0].id)
      }

      if (!databaseCreateForm.chainId && loadedContext.chains[0]?.id) {
        setDatabaseCreateForm((current) => ({ ...current, chainId: loadedContext.chains[0].id }))
      }
      if (!databaseAssignForm.chainId && loadedContext.chains[0]?.id) {
        setDatabaseAssignForm((current) => ({ ...current, chainId: loadedContext.chains[0].id }))
      }

      if (editForm) {
        const refreshed = loadedUsers.find((entry) => entry.id === editForm.id)
        setEditForm(refreshed ? toEditForm(refreshed) : null)
      }

      const eligible = loadedUsers.filter(
        (entry) => entry.role === 'ADMIN' || entry.role === 'STAFF' || entry.role === 'DRIVER'
      )
      const defaultPackageUser = eligible.find((entry) => entry.id === selectedUserId) || eligible[0]
      if (defaultPackageUser) {
        setSelectedUserId(defaultPackageUser.id)
        await loadPermissions(accessToken, defaultPackageUser.id)
      } else {
        setSelectedUserId('')
        setSelectedPermissions([])
        setSelectedPackageIds([])
        setSelectedSubPermissions([])
      }

      const availableChainadmins = loadedUsers.filter((entry) => entry.role === 'CHAINADMIN')
      const defaultChainadmin =
        availableChainadmins.find((entry) => entry.id === selectedChainadminId) ||
        availableChainadmins[0] ||
        null
      if (defaultChainadmin) {
        setSelectedChainadminId(defaultChainadmin.id)
        await loadChainadminRights(accessToken, defaultChainadmin.id)
      } else {
        setSelectedChainadminId('')
        setSelectedChainadminRights([])
      }
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Daten konnten nicht geladen werden')
    } finally {
      setIsLoading(false)
    }
  }

  async function loadPermissions(accessToken: string, userId: string) {
    const response = await getAccessUserPermissions(accessToken, userId)
    const packageIds = packageIdsFromPermissions(response.permissions)
    const packagePermissions = new Set(permissionsFromPackageIds(packageIds))
    const extraPermissions = response.permissions.filter(
      (permission) => !packagePermissions.has(permission)
    )

    setSelectedPermissions(response.permissions)
    setSelectedPackageIds(packageIds)
    setSelectedSubPermissions(extraPermissions.sort())
  }

  async function loadChainadminRights(accessToken: string, chainadminUserId: string) {
    setIsLoadingChainadminRights(true)
    try {
      const response = await getChainadminAccessRights(accessToken, chainadminUserId)
      setSelectedChainadminRights(response.rights)
    } finally {
      setIsLoadingChainadminRights(false)
    }
  }

  async function withSaving(task: () => Promise<void>) {
    try {
      setIsSaving(true)
      setError('')
      setSuccess('')
      await task()
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Speichern fehlgeschlagen')
    } finally {
      setIsSaving(false)
    }
  }

  async function handleDeleteUser(user: AccessUser) {
    const shouldDelete = window.confirm(
      `Benutzer "${user.name}" wirklich loeschen? Diese Aktion kann nicht rueckgaengig gemacht werden.`
    )
    if (!shouldDelete) {
      return
    }

    await withSaving(async () => {
      await deleteAccessUser(token, user.id)
      setEditForm((current) => (current?.id === user.id ? null : current))
      if (selectedUserId === user.id) {
        setSelectedUserId('')
        setSelectedPermissions([])
        setSelectedPackageIds([])
        setSelectedSubPermissions([])
      }
      setSuccess('Benutzer wurde geloescht.')
      await loadData(token)
    })
  }

  async function handleCreateEmptyDatabase() {
    await withSaving(async () => {
      if (databaseCreateForm.assignType === 'CHAIN' && !databaseCreateForm.chainId) {
        throw new Error('Bitte eine Kette fuer die Zuordnung waehlen.')
      }
      if (databaseCreateForm.assignType === 'TENANT' && !databaseCreateForm.tenantId) {
        throw new Error('Bitte eine Filiale fuer die Zuordnung waehlen.')
      }

      const response = await createEmptyManagedDatabase(token, {
        label: databaseCreateForm.label.trim() || undefined,
        databaseName: databaseCreateForm.databaseName.trim() || undefined,
        assignType: databaseCreateForm.assignType,
        chainId:
          databaseCreateForm.assignType === 'CHAIN' ? databaseCreateForm.chainId || undefined : undefined,
        tenantId:
          databaseCreateForm.assignType === 'TENANT'
            ? databaseCreateForm.tenantId || undefined
            : undefined,
        templateDatabase: databaseCreateForm.templateDatabase.trim() || undefined,
      })

      const previousChainId = databaseCreateForm.chainId
      setDatabaseCreateForm({
        ...initialDatabaseCreateForm,
        chainId: previousChainId,
      })
      setSuccess(`Leere Datenbank erstellt: ${response.database.databaseName}`)
      await loadData(token)
    })
  }

  async function handleAssignExistingDatabase() {
    await withSaving(async () => {
      if (!databaseAssignForm.databaseName) {
        throw new Error('Bitte zuerst eine unzugeordnete Datenbank waehlen.')
      }
      if (databaseAssignForm.assignType === 'CHAIN' && !databaseAssignForm.chainId) {
        throw new Error('Bitte eine Kette waehlen.')
      }
      if (databaseAssignForm.assignType === 'TENANT' && !databaseAssignForm.tenantId) {
        throw new Error('Bitte eine Filiale waehlen.')
      }

      const response = await assignManagedDatabase(token, {
        databaseName: databaseAssignForm.databaseName,
        assignType: databaseAssignForm.assignType,
        chainId:
          databaseAssignForm.assignType === 'CHAIN' ? databaseAssignForm.chainId || undefined : undefined,
        tenantId:
          databaseAssignForm.assignType === 'TENANT'
            ? databaseAssignForm.tenantId || undefined
            : undefined,
      })

      setDatabaseAssignForm((current) => ({ ...current, databaseName: '' }))
      setSuccess(`Datenbank zugewiesen: ${response.database.databaseName}`)
      await loadData(token)
    })
  }

  async function handleDeleteChain(chainId: string, chainName: string) {
    const shouldDelete = window.confirm(
      `Kette "${chainName}" wirklich loeschen?\nHinweis: Ketten mit Filialen koennen nicht geloescht werden.`
    )
    if (!shouldDelete) {
      return
    }

    await withSaving(async () => {
      await deleteManagedChain(token, chainId)
      setSuccess(`Kette wurde geloescht: ${chainName}`)
      await loadData(token)
    })
  }

  async function handleDeleteTenant(tenantId: string, tenantName: string) {
    const shouldDelete = window.confirm(
      `Filiale "${tenantName}" wirklich loeschen?\nAlle Filialdaten werden entfernt.`
    )
    if (!shouldDelete) {
      return
    }

    await withSaving(async () => {
      await deleteManagedTenant(token, tenantId)
      setSuccess(`Filiale wurde geloescht: ${tenantName}`)
      await loadData(token)
    })
  }

  async function handleDeleteDatabase(databaseName: string) {
    const shouldDelete = window.confirm(
      `Datenbank "${databaseName}" wirklich dauerhaft loeschen?\nDiese Aktion kann nicht rueckgaengig gemacht werden.`
    )
    if (!shouldDelete) {
      return
    }

    await withSaving(async () => {
      await deleteManagedDatabase(token, databaseName)
      setSuccess(`Datenbank wurde geloescht: ${databaseName}`)
      await loadData(token)
    })
  }

  function scrollToCard(elementId: string) {
    const element = document.getElementById(elementId)
    if (!element) {
      return
    }
    element.scrollIntoView({ behavior: 'smooth', block: 'start' })
  }

  function prepareDatabaseAssignForChain(chainId: string) {
    setDatabaseAssignForm((current) => ({
      ...current,
      assignType: 'CHAIN',
      chainId,
      tenantId: '',
    }))
    scrollToCard('database-assign-card')
  }

  function prepareDatabaseAssignForTenant(tenantId: string, chainId: string | null) {
    setDatabaseAssignForm((current) => ({
      ...current,
      assignType: 'TENANT',
      chainId: chainId || current.chainId,
      tenantId,
    }))
    scrollToCard('database-assign-card')
  }

  function prepareDatabaseAssignForDatabase(databaseName: string) {
    setDatabaseAssignForm((current) => ({
      ...current,
      databaseName,
    }))
    scrollToCard('database-assign-card')
  }

  function prepareTenantCreateForChain(chainId: string) {
    setNewTenantChainId(chainId)
    scrollToCard('tenant-create-card')
  }

  function openTenantAsAdmin(tenantId: string, tenantName: string, chainId: string | null) {
    try {
      setSuperadminTenantContext({ id: tenantId, name: tenantName, chainId })
      window.location.href = '/admin'
    } catch {
      setError('Sitzung konnte nicht vorbereitet werden. Bitte erneut einloggen.')
    }
  }

  async function handleEditChainSettings(chainId: string, currentName: string, currentCode: string) {
    const enteredName = window.prompt('Kettenname anpassen', currentName)
    if (enteredName === null) {
      return
    }

    const enteredCode = window.prompt('Kettencode anpassen', currentCode)
    if (enteredCode === null) {
      return
    }

    const nextName = enteredName.trim()
    const nextCode = enteredCode.trim().toUpperCase()

    if (!nextName || !nextCode) {
      setError('Name und Code duerfen nicht leer sein.')
      return
    }

    if (nextName === currentName && nextCode === currentCode) {
      setSuccess('Keine Aenderung erkannt.')
      return
    }

    if (!confirmSecondStepSettingsChange(`Kette ${currentName}`)) {
      return
    }

    await withSaving(async () => {
      await updateManagedChain(token, chainId, {
        name: nextName,
        code: nextCode,
      })
      setSuccess(`Kette aktualisiert: ${nextName}`)
      await loadData(token)
    })
  }

  async function handleEditTenantSettings(
    tenantId: string,
    currentName: string,
    currentEmail: string | null
  ) {
    const enteredName = window.prompt('Filialname anpassen', currentName)
    if (enteredName === null) {
      return
    }

    const enteredEmail = window.prompt(
      'Filial-E-Mail anpassen (leer lassen = entfernen)',
      currentEmail || ''
    )
    if (enteredEmail === null) {
      return
    }

    const nextName = enteredName.trim()
    const nextEmailTrimmed = enteredEmail.trim()
    const nextEmail = nextEmailTrimmed ? nextEmailTrimmed.toLowerCase() : null

    if (!nextName) {
      setError('Filialname darf nicht leer sein.')
      return
    }

    if (nextName === currentName && nextEmail === (currentEmail || null)) {
      setSuccess('Keine Aenderung erkannt.')
      return
    }

    if (!confirmSecondStepSettingsChange(`Filiale ${currentName}`)) {
      return
    }

    await withSaving(async () => {
      await updateManagedTenant(token, tenantId, {
        name: nextName,
        email: nextEmail,
      })
      setSuccess(`Filiale aktualisiert: ${nextName}`)
      await loadData(token)
    })
  }

function validateEditForm(current: EditUserForm) {
  if (!current.name.trim()) return 'Name ist erforderlich.'
  if (current.role === 'CHAINADMIN' && !current.chainId) return 'Fuer CHAINADMIN ist eine Kette erforderlich.'
  if (
    (current.role === 'ADMIN' || current.role === 'STAFF' || current.role === 'DRIVER') &&
    !current.tenantId
  ) {
    return 'Fuer ADMIN/STAFF/DRIVER ist eine Filiale erforderlich.'
  }
  return ''
}

  function addBillingPackage() {
    const nextId = `pkg-${Date.now()}`
    const nextPackage: BillingPackage = {
      id: nextId,
      name: `Neues Paket ${billingPackages.length + 1}`,
      description: '',
      price: 0,
      monthlyFee: 0,
      yearlyFee: 0,
      setupFeePerCompany: 0,
      isActive: true,
    }

    setBillingPackages((current) => [nextPackage, ...current])
    setSelectedBillingPackageId(nextId)
  }

  function updateSelectedBillingPackage(patch: Partial<BillingPackage>) {
    if (!selectedBillingPackage) return
    setBillingPackages((current) =>
      current.map((entry) => (entry.id === selectedBillingPackage.id ? { ...entry, ...patch } : entry))
    )
  }

  function updateChainadminRight(tenantId: string, patch: Partial<ChainadminTenantRight>) {
    setSelectedChainadminRights((current) =>
      current.map((entry) => (entry.tenantId === tenantId ? { ...entry, ...patch } : entry))
    )
  }

  function togglePackage(packageId: string, enabled: boolean) {
    setSelectedPackageIds((current) => {
      if (enabled) {
        return Array.from(new Set([...current, packageId]))
      }
      return current.filter((entry) => entry !== packageId)
    })
  }

  function enableAllPackages() {
    setSelectedPackageIds(ACCESS_PACKAGES.map((entry) => entry.id))
  }

  function disableAllPackages() {
    setSelectedPackageIds([])
    setSelectedSubPermissions([])
  }

  function enableAllPermissionsDirectly() {
    setSelectedSubPermissions(permissionUniverse)
  }

  function clearDirectPermissions() {
    setSelectedSubPermissions([])
  }

  function toggleSubPermission(permission: AccessPermission, enabled: boolean) {
    setSelectedSubPermissions((current) => {
      if (enabled) {
        return Array.from(new Set([...current, permission])).sort() as AccessPermission[]
      }
      return current.filter((entry) => entry !== permission)
    })
  }

  function enablePermissionGroup(permissions: AccessPermission[]) {
    setSelectedSubPermissions((current) =>
      Array.from(new Set([...current, ...permissions])).sort() as AccessPermission[]
    )
  }

  function disablePermissionGroup(permissions: AccessPermission[]) {
    const groupSet = new Set(permissions)
    setSelectedSubPermissions((current) =>
      current.filter((entry) => !groupSet.has(entry)).sort() as AccessPermission[]
    )
  }

  function updateModulePrice(packageId: string, value: number) {
    setModulePrices((current) => ({
      ...current,
      [packageId]: Number.isFinite(value) ? Math.max(0, value) : 0,
    }))
  }

  function updateSubmodulePrice(permission: AccessPermission, value: number) {
    setSubmodulePrices((current) => ({
      ...current,
      [permission]: Number.isFinite(value) ? Math.max(0, value) : 0,
    }))
  }

  async function saveChainadminRight(tenantId: string) {
    if (!selectedChainadminId) {
      return
    }

    const right = selectedChainadminRights.find((entry) => entry.tenantId === tenantId)
    if (!right) {
      return
    }

    await withSaving(async () => {
      setSavingChainadminTenantId(tenantId)
      try {
        await updateChainadminAccessRight(token, {
          chainAdminUserId: selectedChainadminId,
          tenantId,
          superadminGranted: right.superadminGranted,
          canViewRevenue: right.canViewRevenue,
          canManageAppOrders: right.canManageAppOrders,
          canManageDelivery: right.canManageDelivery,
          canManagePickup: right.canManagePickup,
          canViewPurchasing: right.canViewPurchasing,
          canViewStaffPlanning: right.canViewStaffPlanning,
          canOverrideSettings: right.canOverrideSettings,
          notes: right.notes,
        })
        await loadChainadminRights(token, selectedChainadminId)
        setSuccess(`Freigaben fuer ${right.tenantName} gespeichert.`)
      } finally {
        setSavingChainadminTenantId(null)
      }
    })
  }

  function deleteSelectedBillingPackage() {
    if (!selectedBillingPackage) return
    setBillingPackages((current) => {
      const remaining = current.filter((entry) => entry.id !== selectedBillingPackage.id)
      if (remaining.length === 0) {
        setError('Mindestens ein Paket muss bestehen bleiben.')
        return current
      }
      setSelectedBillingPackageId(remaining[0].id)
      return remaining
    })
  }

  if (!session) return null

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Admin Verwaltung"
      subtitle="Benutzer, Rechte, Ketten und Filialen steuern"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      {error ? (
        <div className="mb-4 rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}
      {success ? (
        <div className="mb-4 rounded-xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
          {success}
        </div>
      ) : null}

      {isLoading ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/75">Lade Daten...</p>
        </section>
      ) : (
        <div className="grid gap-6">
          <section className="grid gap-4 xl:grid-cols-3">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-lg font-semibold">Kette anlegen</h2>
              <div className="mt-3 space-y-3">
                <input
                  className="input-ui"
                  value={newChainName}
                  onChange={(event) => setNewChainName(event.target.value)}
                  placeholder="Kettenname"
                />
                <input
                  className="input-ui"
                  value={newChainCode}
                  onChange={(event) => setNewChainCode(event.target.value.toUpperCase())}
                  placeholder="Code"
                />
                <button
                  type="button"
                  className="btn-ui"
                  disabled={isSaving}
                  onClick={() =>
                    void withSaving(async () => {
                      if (!newChainName || !newChainCode) throw new Error('Name und Code erforderlich.')
                      await createChain(token, { name: newChainName, code: newChainCode })
                      setNewChainName('')
                      setNewChainCode('')
                      setSuccess('Kette wurde erstellt.')
                      await loadData(token)
                    })
                  }
                >
                  Kette speichern
                </button>
              </div>
            </article>

            <article
              id="tenant-create-card"
              className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]"
            >
              <h2 className="text-lg font-semibold">Filiale anlegen</h2>
              <div className="mt-3 space-y-3">
                <input
                  className="input-ui"
                  value={newTenantName}
                  onChange={(event) => setNewTenantName(event.target.value)}
                  placeholder="Filialname"
                />
                <input
                  className="input-ui"
                  value={newTenantEmail}
                  onChange={(event) => setNewTenantEmail(event.target.value)}
                  placeholder="Filial-E-Mail (optional)"
                />
                <select
                  className="input-ui"
                  value={newTenantChainId}
                  onChange={(event) => setNewTenantChainId(event.target.value)}
                >
                  <option value="">Kette waehlen</option>
                  {context?.chains.map((entry) => (
                    <option key={entry.id} value={entry.id}>
                      {entry.name}
                    </option>
                  ))}
                </select>
                <select
                  className="input-ui"
                  value={newTenantCopyFromId}
                  onChange={(event) => setNewTenantCopyFromId(event.target.value)}
                  disabled={!newTenantChainId}
                >
                  <option value="">Keine Kopiervorlage</option>
                  {templateTenantsForCopy.map((entry) => (
                    <option key={entry.id} value={entry.id}>
                      Vorlage: {entry.name}
                    </option>
                  ))}
                </select>
                <p className="text-xs text-rose-900/70">
                  Optional: Stammdaten (Kategorien, Produkte, Zutaten, Modifier, App-Einstellungen)
                  kettenintern kopieren.
                </p>
                <button
                  type="button"
                  className="btn-ui"
                  disabled={isSaving}
                  onClick={() =>
                    void withSaving(async () => {
                      if (!newTenantName || !newTenantChainId) throw new Error('Name und Kette erforderlich.')
                      const createdTenant = await createManagedTenant(token, {
                        name: newTenantName,
                        email: newTenantEmail || undefined,
                        chainId: newTenantChainId,
                        copyFromTenantId: newTenantCopyFromId || undefined,
                      })
                      setNewTenantName('')
                      setNewTenantEmail('')
                      setNewTenantCopyFromId('')
                      const dbName = createdTenant.separateDatabase?.databaseName
                      if (dbName) {
                        setSuccess(`Filiale wurde erstellt. Datenbank: ${dbName}`)
                      } else {
                        setSuccess('Filiale wurde erstellt.')
                      }
                      await loadData(token)
                    })
                  }
                >
                  Filiale speichern
                </button>
              </div>
            </article>

            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-lg font-semibold">Benutzer anlegen</h2>
              <div className="mt-3 space-y-3">
                <input
                  className="input-ui"
                  value={userForm.name}
                  onChange={(event) => setUserForm((current) => ({ ...current, name: event.target.value }))}
                  placeholder="Name"
                />
                <input
                  className="input-ui"
                  value={userForm.email}
                  onChange={(event) => setUserForm((current) => ({ ...current, email: event.target.value }))}
                  placeholder="E-Mail"
                />
                <input
                  className="input-ui"
                  type="password"
                  value={userForm.password}
                  onChange={(event) => setUserForm((current) => ({ ...current, password: event.target.value }))}
                  placeholder="Passwort"
                />
                <select
                  className="input-ui"
                  value={userForm.role}
                  onChange={(event) =>
                    setUserForm((current) => ({ ...current, role: event.target.value as AccessRole }))
                  }
                >
                  <option value="SUPERADMIN">SUPERADMIN</option>
                  <option value="CHAINADMIN">CHAINADMIN</option>
                  <option value="ADMIN">ADMIN</option>
                  <option value="STAFF">STAFF</option>
                  <option value="DRIVER">DRIVER</option>
                </select>
                <select
                  className="input-ui"
                  value={userForm.chainId}
                  onChange={(event) => setUserForm((current) => ({ ...current, chainId: event.target.value }))}
                >
                  <option value="">Kette (optional)</option>
                  {context?.chains.map((entry) => (
                    <option key={entry.id} value={entry.id}>
                      {entry.name}
                    </option>
                  ))}
                </select>
                <select
                  className="input-ui"
                  value={userForm.tenantId}
                  onChange={(event) => setUserForm((current) => ({ ...current, tenantId: event.target.value }))}
                >
                  <option value="">Filiale (optional)</option>
                  {tenantsForNewUser.map((entry) => (
                    <option key={entry.id} value={entry.id}>
                      {entry.name}
                    </option>
                  ))}
                </select>
                <button
                  type="button"
                  className="btn-ui"
                  disabled={isSaving}
                  onClick={() =>
                    void withSaving(async () => {
                      if (!userForm.name || !userForm.email || !userForm.password) {
                        throw new Error('Name, E-Mail und Passwort sind erforderlich.')
                      }
                      if (userForm.role === 'CHAINADMIN' && !userForm.chainId) {
                        throw new Error('Fuer CHAINADMIN ist eine Kette erforderlich.')
                      }
                      if (
                        (userForm.role === 'ADMIN' ||
                          userForm.role === 'STAFF' ||
                          userForm.role === 'DRIVER') &&
                        !userForm.tenantId
                      ) {
                        throw new Error('Fuer ADMIN/STAFF/DRIVER ist eine Filiale erforderlich.')
                      }
                      await createAccessUser(token, {
                        name: userForm.name,
                        email: userForm.email,
                        password: userForm.password,
                        role: userForm.role,
                        chainId: userForm.chainId || null,
                        tenantId: userForm.tenantId || null,
                      })
                      setUserForm(emptyUserForm)
                      setSuccess('Benutzer wurde erstellt.')
                      await loadData(token)
                    })
                  }
                >
                  Benutzer speichern
                </button>
              </div>
            </article>
          </section>

          <section className="grid gap-4 xl:grid-cols-2">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-lg font-semibold">Neue Datenbank erstellen</h2>
              <p className="mt-1 text-xs text-rose-900/70">
                Erstellt eine neue leere DB und ordnet sie optional direkt zu.
              </p>
              <div className="mt-4 grid gap-3">
                <input
                  className="input-ui"
                  value={databaseCreateForm.databaseName}
                  onChange={(event) =>
                    setDatabaseCreateForm((current) => ({
                      ...current,
                      databaseName: event.target.value,
                    }))
                  }
                  placeholder="DB-Name (optional, z. B. klarando_filiale_essen)"
                />
                <select
                  className="input-ui"
                  value={databaseCreateForm.assignType}
                  onChange={(event) =>
                    setDatabaseCreateForm((current) => ({
                      ...current,
                      assignType: event.target.value as DatabaseAssignmentType,
                    }))
                  }
                >
                  <option value="UNASSIGNED">Unzugeordnet</option>
                  <option value="CHAIN">Direkt an Kette</option>
                  <option value="TENANT">Direkt an Filiale</option>
                </select>
                <select
                  className="input-ui"
                  value={databaseCreateForm.chainId}
                  onChange={(event) =>
                    setDatabaseCreateForm((current) => ({
                      ...current,
                      chainId: event.target.value,
                    }))
                  }
                  disabled={databaseCreateForm.assignType === 'UNASSIGNED'}
                >
                  <option value="">Kette waehlen</option>
                  {context?.chains.map((entry) => (
                    <option key={entry.id} value={entry.id}>
                      {entry.name}
                    </option>
                  ))}
                </select>
                <select
                  className="input-ui"
                  value={databaseCreateForm.tenantId}
                  onChange={(event) => {
                    const selectedTenantId = event.target.value
                    const tenant = context?.tenants.find((entry) => entry.id === selectedTenantId)
                    setDatabaseCreateForm((current) => ({
                      ...current,
                      tenantId: selectedTenantId,
                      chainId: tenant?.chainId || current.chainId,
                    }))
                  }}
                  disabled={databaseCreateForm.assignType !== 'TENANT'}
                >
                  <option value="">Filiale waehlen</option>
                  {tenantsForDatabaseCreate.map((entry) => (
                    <option key={entry.id} value={entry.id}>
                      {entry.name}
                    </option>
                  ))}
                </select>
                <input
                  className="input-ui"
                  value={databaseCreateForm.label}
                  onChange={(event) =>
                    setDatabaseCreateForm((current) => ({ ...current, label: event.target.value }))
                  }
                  placeholder="Interne Bezeichnung (optional)"
                />
                <input
                  className="input-ui"
                  value={databaseCreateForm.templateDatabase}
                  onChange={(event) =>
                    setDatabaseCreateForm((current) => ({
                      ...current,
                      templateDatabase: event.target.value,
                    }))
                  }
                  placeholder="Template-DB (optional, leer = komplett leer)"
                />
                <button
                  type="button"
                  className="btn-ui mt-1"
                  disabled={isSaving}
                  onClick={() => void handleCreateEmptyDatabase()}
                >
                  Neue Datenbank erstellen
                </button>
              </div>
            </article>

            <article
              id="database-assign-card"
              className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]"
            >
              <h2 className="text-lg font-semibold">Bestehende Datenbank zuweisen</h2>
              <p className="mt-1 text-xs text-rose-900/70">
                Verknuepft eine bereits vorhandene, unzugeordnete DB mit Kette oder Filiale.
              </p>
              <div className="mt-4 grid gap-3">
                <select
                  className="input-ui"
                  value={databaseAssignForm.databaseName}
                  onChange={(event) =>
                    setDatabaseAssignForm((current) => ({
                      ...current,
                      databaseName: event.target.value,
                    }))
                  }
                >
                  <option value="">Unzugeordnete DB waehlen</option>
                  {unassignedDatabases.map((entry) => (
                    <option key={entry.id} value={entry.databaseName}>
                      {entry.databaseName}
                    </option>
                  ))}
                </select>
                <select
                  className="input-ui"
                  value={databaseAssignForm.assignType}
                  onChange={(event) =>
                    setDatabaseAssignForm((current) => ({
                      ...current,
                      assignType: event.target.value as Exclude<DatabaseAssignmentType, 'UNASSIGNED'>,
                    }))
                  }
                >
                  <option value="TENANT">An Filiale zuweisen</option>
                  <option value="CHAIN">An Kette zuweisen</option>
                </select>
                <select
                  className="input-ui"
                  value={databaseAssignForm.chainId}
                  onChange={(event) =>
                    setDatabaseAssignForm((current) => ({
                      ...current,
                      chainId: event.target.value,
                    }))
                  }
                >
                  <option value="">Kette waehlen</option>
                  {context?.chains.map((entry) => (
                    <option key={entry.id} value={entry.id}>
                      {entry.name}
                    </option>
                  ))}
                </select>
                <select
                  className="input-ui"
                  value={databaseAssignForm.tenantId}
                  onChange={(event) => {
                    const selectedTenantId = event.target.value
                    const tenant = context?.tenants.find((entry) => entry.id === selectedTenantId)
                    setDatabaseAssignForm((current) => ({
                      ...current,
                      tenantId: selectedTenantId,
                      chainId: tenant?.chainId || current.chainId,
                    }))
                  }}
                  disabled={databaseAssignForm.assignType !== 'TENANT'}
                >
                  <option value="">Filiale waehlen</option>
                  {tenantsForDatabaseAssign.map((entry) => (
                    <option key={entry.id} value={entry.id}>
                      {entry.name}
                    </option>
                  ))}
                </select>
                <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs text-rose-900/75">
                  Verfuegbare unzugeordnete Datenbanken: {unassignedDatabases.length}
                </div>
                <button
                  type="button"
                  className="btn-ui mt-1"
                  disabled={isSaving || unassignedDatabases.length === 0}
                  onClick={() => void handleAssignExistingDatabase()}
                >
                  Bestehende Datenbank zuweisen
                </button>
              </div>
            </article>
          </section>

          <section className="grid gap-4">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-lg font-semibold">Datenbank Uebersicht</h2>
              <div className="mt-3 grid gap-3 md:grid-cols-3">
                <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                  <p className="text-[11px] uppercase tracking-wide text-rose-900/70">Ketten mit DB</p>
                  <p className="mt-1 text-2xl font-semibold text-[var(--brand-ink)]">
                    {(databaseOverview?.chains || []).filter((entry) => entry.database).length}
                  </p>
                </div>
                <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                  <p className="text-[11px] uppercase tracking-wide text-rose-900/70">Filialen mit DB</p>
                  <p className="mt-1 text-2xl font-semibold text-[var(--brand-ink)]">
                    {(databaseOverview?.tenants || []).filter((entry) => entry.database).length}
                  </p>
                </div>
                <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                  <p className="text-[11px] uppercase tracking-wide text-rose-900/70">Unzugeordnet</p>
                  <p className="mt-1 text-2xl font-semibold text-[var(--brand-ink)]">{unassignedDatabases.length}</p>
                </div>
              </div>

              <div className="mt-3 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                <p className="text-xs uppercase tracking-wide text-rose-900/70">Unzugeordnete Datenbanken</p>
                {unassignedDatabases.length === 0 ? (
                  <p className="mt-2 text-sm text-rose-900/70">Keine unzugeordneten Datenbanken vorhanden.</p>
                ) : (
                  <div className="mt-2 space-y-1">
                    {unassignedDatabases.slice(0, 8).map((entry) => (
                      <p key={entry.id} className="text-xs text-rose-900/85">
                        {entry.databaseName}
                        {entry.label ? ` (${entry.label})` : ''}
                      </p>
                    ))}
                  </div>
                )}
              </div>
            </article>
          </section>

          <section className="grid gap-4">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <div className="flex flex-wrap items-center justify-between gap-3">
                <div>
                  <h2 className="text-lg font-semibold">Baummenue: Ketten & Filialen</h2>
                  <p className="mt-1 text-xs text-rose-900/70">
                    Hier kannst du Ketten und Filialen als Baumstruktur kontrollieren und loeschen.
                  </p>
                </div>
                <span className="rounded-full border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1 text-xs text-rose-900/75">
                  Ketten: {treeChains.chains.length} | Filialen: {(adminOverview?.tenants || []).length}
                </span>
              </div>

              <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <div className="space-y-3">
                  {treeChains.chains.map((chain) => (
                    <div key={chain.id} className="rounded-xl border border-[var(--brand-border)] bg-white p-3">
                      <div className="flex flex-wrap items-center justify-between gap-3">
                        <div>
                          <p className="text-sm font-semibold text-[var(--brand-ink)]">|- {chain.name}</p>
                          <p className="text-xs text-rose-900/70">
                            Code: {chain.code} | Filialen: {chain.tenantCount} | Benutzer: {chain.userCount}
                          </p>
                          <p className="text-xs text-rose-900/70">
                            DB:{' '}
                            <code className="rounded bg-rose-50 px-1.5 py-0.5 text-[11px]">
                              {chain.databaseName || '-'}
                            </code>
                          </p>
                        </div>
                        <div className="flex flex-wrap gap-2">
                          <button
                            type="button"
                            className="rounded-lg border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 hover:bg-rose-50/60"
                            onClick={() => void handleEditChainSettings(chain.id, chain.name, chain.code)}
                          >
                            Kette bearbeiten
                          </button>
                          <button
                            type="button"
                            className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-800"
                            onClick={() => prepareDatabaseAssignForChain(chain.id)}
                          >
                            DB-Ziel setzen
                          </button>
                          <button
                            type="button"
                            className="rounded-lg border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 hover:bg-rose-50/60"
                            onClick={() => prepareTenantCreateForChain(chain.id)}
                          >
                            Filiale anlegen
                          </button>
                          <button
                            type="button"
                            className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-60"
                            disabled={isSaving || chain.tenantCount > 0}
                            onClick={() => void handleDeleteChain(chain.id, chain.name)}
                          >
                            Kette loeschen
                          </button>
                        </div>
                      </div>

                      <div className="mt-3 space-y-2 border-l border-dashed border-[var(--brand-border)] pl-4">
                        {chain.tenants.length === 0 ? (
                          <p className="text-xs text-rose-900/70">Keine Filialen in dieser Kette.</p>
                        ) : (
                          chain.tenants.map((tenant) => (
                            <div
                              key={tenant.id}
                              className="flex flex-wrap items-center justify-between gap-3 rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2"
                            >
                              <div>
                                <p className="text-sm font-medium text-slate-800">|- {tenant.name}</p>
                                <p className="text-xs text-rose-900/70">
                                  Produkte: {tenant.productCount} | Kategorien: {tenant.categoryCount} |
                                  Zutaten: {tenant.ingredientCount} | Benutzer: {tenant.userCount}
                                </p>
                                <p className="text-xs text-rose-900/70">
                                  DB:{' '}
                                  <code className="rounded bg-slate-200 px-1.5 py-0.5 text-[11px]">
                                    {tenant.databaseName || '-'}
                                  </code>
                                </p>
                              </div>
                              <div className="flex flex-wrap gap-2">
                                <button
                                  type="button"
                                  className="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-emerald-500"
                                  onClick={() => openTenantAsAdmin(tenant.id, tenant.name, tenant.chainId)}
                                >
                                  Als Filiale öffnen
                                </button>
                                <button
                                  type="button"
                                  className="rounded-lg border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 hover:bg-rose-50/60"
                                  onClick={() =>
                                    void handleEditTenantSettings(
                                      tenant.id,
                                      tenant.name,
                                      tenantEmailById.get(tenant.id) || null
                                    )
                                  }
                                >
                                  Filiale bearbeiten
                                </button>
                                <button
                                  type="button"
                                  className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-800"
                                  onClick={() => prepareDatabaseAssignForTenant(tenant.id, tenant.chainId)}
                                >
                                  DB-Ziel setzen
                                </button>
                                <button
                                  type="button"
                                  className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-60"
                                  disabled={isSaving}
                                  onClick={() => void handleDeleteTenant(tenant.id, tenant.name)}
                                >
                                  Filiale loeschen
                                </button>
                              </div>
                            </div>
                          ))
                        )}
                      </div>
                    </div>
                  ))}

                  {treeChains.withoutChain.length > 0 ? (
                    <div className="rounded-xl border border-amber-200 bg-amber-50 p-3">
                      <p className="text-sm font-semibold text-amber-900">Filialen ohne Kette</p>
                      <div className="mt-2 space-y-2">
                        {treeChains.withoutChain.map((tenant) => (
                          <div
                            key={tenant.id}
                            className="flex flex-wrap items-center justify-between gap-3 rounded-lg border border-amber-200 bg-white px-3 py-2"
                          >
                            <div>
                              <p className="text-sm font-medium text-slate-800">{tenant.name}</p>
                              <p className="text-xs text-rose-900/70">
                                Produkte: {tenant.productCount} | Kategorien: {tenant.categoryCount} |
                                Zutaten: {tenant.ingredientCount} | Benutzer: {tenant.userCount}
                              </p>
                            </div>
                            <div className="flex flex-wrap gap-2">
                              <button
                                type="button"
                                className="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-emerald-500"
                                onClick={() => openTenantAsAdmin(tenant.id, tenant.name, tenant.chainId)}
                              >
                                Als Filiale öffnen
                              </button>
                              <button
                                type="button"
                                className="rounded-lg border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 hover:bg-rose-50/60"
                                onClick={() =>
                                  void handleEditTenantSettings(
                                    tenant.id,
                                    tenant.name,
                                    tenantEmailById.get(tenant.id) || null
                                  )
                                }
                              >
                                Filiale bearbeiten
                              </button>
                              <button
                                type="button"
                                className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-800"
                                onClick={() => prepareDatabaseAssignForTenant(tenant.id, tenant.chainId)}
                              >
                                DB-Ziel setzen
                              </button>
                              <button
                                type="button"
                                className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-60"
                                disabled={isSaving}
                                onClick={() => void handleDeleteTenant(tenant.id, tenant.name)}
                              >
                                Filiale loeschen
                              </button>
                            </div>
                          </div>
                        ))}
                      </div>
                    </div>
                  ) : null}

                  {treeChains.chains.length === 0 && treeChains.withoutChain.length === 0 ? (
                    <p className="text-sm text-rose-900/70">Keine Ketten oder Filialen vorhanden.</p>
                  ) : null}
                </div>
              </div>
            </article>
          </section>

          <section className="grid gap-6">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <div className="flex flex-wrap items-center justify-between gap-3">
                <div>
                  <h2 className="text-lg font-semibold">Admin Uebersicht: Benutzer & Zuordnung</h2>
                  <p className="mt-1 text-xs text-rose-900/70">
                    Zeigt pro Benutzer die Kette, Filiale und die angeschlossene Datenbank.
                  </p>
                </div>
                <span className="rounded-full border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1 text-xs text-rose-900/75">
                  Datensatz: {adminOverview?.users.length || 0}
                </span>
              </div>
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[1200px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Benutzer</th>
                      <th className="th-ui">Rolle</th>
                      <th className="th-ui">Kette</th>
                      <th className="th-ui">Filiale</th>
                      <th className="th-ui">Ziel-Datenbank</th>
                      <th className="th-ui">Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    {(adminOverview?.users || []).map((entry) => (
                      <tr key={entry.id}>
                        <td className="td-ui">
                          <p className="font-medium text-[var(--brand-ink)]">{entry.name}</p>
                          <p className="text-xs text-rose-900/70">{entry.email}</p>
                        </td>
                        <td className="td-ui">{entry.role}</td>
                        <td className="td-ui">
                          {entry.chain ? (
                            <div>
                              <p>{entry.chain.name}</p>
                              <p className="text-xs text-rose-900/70">{entry.chain.code}</p>
                            </div>
                          ) : (
                            '-'
                          )}
                        </td>
                        <td className="td-ui">{entry.tenant?.name || '-'}</td>
                        <td className="td-ui">
                          <code className="rounded bg-rose-50 px-2 py-1 text-xs">
                            {entry.effectiveDatabaseName || '-'}
                          </code>
                        </td>
                        <td className="td-ui">
                          {entry.isActive ? (
                            <span className="rounded-full bg-emerald-50 px-2 py-1 text-xs font-medium text-emerald-700">
                              aktiv
                            </span>
                          ) : (
                            <span className="rounded-full bg-rose-50 px-2 py-1 text-xs font-medium text-rose-900/75">
                              inaktiv
                            </span>
                          )}
                        </td>
                      </tr>
                    ))}
                    {(adminOverview?.users || []).length === 0 ? (
                      <tr>
                        <td className="td-ui text-rose-900/70" colSpan={6}>
                          Keine Benutzerdaten vorhanden.
                        </td>
                      </tr>
                    ) : null}
                  </tbody>
                </table>
              </div>
            </article>

            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <div className="flex flex-wrap items-center justify-between gap-3">
                <div>
                  <h2 className="text-lg font-semibold">Filialliste: Produkte & Datenbank</h2>
                  <p className="mt-1 text-xs text-rose-900/70">
                    Zeigt Produkte, Kategorien, Zutaten, Benutzer und Datenbank je Filiale.
                  </p>
                </div>
                <span className="rounded-full border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1 text-xs text-rose-900/75">
                  Filialen: {adminOverview?.tenants.length || 0}
                </span>
              </div>
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[1320px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Filiale</th>
                      <th className="th-ui">Kette</th>
                      <th className="th-ui">Produkte</th>
                      <th className="th-ui">Kategorien</th>
                      <th className="th-ui">Zutaten</th>
                      <th className="th-ui">Benutzer</th>
                      <th className="th-ui">Datenbank</th>
                      <th className="th-ui">Aktionen</th>
                    </tr>
                  </thead>
                  <tbody>
                    {(adminOverview?.tenants || []).map((entry) => (
                      <tr key={entry.id}>
                        <td className="td-ui">{entry.name}</td>
                        <td className="td-ui">{entry.chainName || '-'}</td>
                        <td className="td-ui">{entry.productCount}</td>
                        <td className="td-ui">{entry.categoryCount}</td>
                        <td className="td-ui">{entry.ingredientCount}</td>
                        <td className="td-ui">{entry.userCount}</td>
                        <td className="td-ui">
                          <code className="rounded bg-rose-50 px-2 py-1 text-xs">
                            {entry.databaseName || '-'}
                          </code>
                        </td>
                        <td className="td-ui">
                            <div className="flex flex-wrap gap-2">
                              <button
                                type="button"
                                className="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-emerald-500"
                                onClick={() => openTenantAsAdmin(entry.id, entry.name, entry.chainId)}
                              >
                                Als Filiale öffnen
                              </button>
                              <button
                                type="button"
                                className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-800"
                              onClick={() => prepareDatabaseAssignForTenant(entry.id, entry.chainId)}
                            >
                              DB-Ziel setzen
                            </button>
                            <button
                              type="button"
                              className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-60"
                              disabled={isSaving}
                              onClick={() => void handleDeleteTenant(entry.id, entry.name)}
                            >
                              Loeschen
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))}
                    {(adminOverview?.tenants || []).length === 0 ? (
                      <tr>
                        <td className="td-ui text-rose-900/70" colSpan={8}>
                          Keine Filialdaten vorhanden.
                        </td>
                      </tr>
                    ) : null}
                  </tbody>
                </table>
              </div>
            </article>
          </section>

          <section className="grid gap-6">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <div className="flex flex-wrap items-center justify-between gap-3">
                <div>
                  <h2 className="text-lg font-semibold">Kettenliste</h2>
                  <p className="mt-1 text-xs text-rose-900/70">
                    Kontrolliert Kettenzuordnung, Filialanzahl, Benutzer und Datenbank-Verknuepfung.
                  </p>
                </div>
                <span className="rounded-full border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1 text-xs text-rose-900/75">
                  Ketten: {adminOverview?.chains.length || 0}
                </span>
              </div>
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[1120px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Kette</th>
                      <th className="th-ui">Code</th>
                      <th className="th-ui">Filialen</th>
                      <th className="th-ui">Benutzer</th>
                      <th className="th-ui">Datenbank</th>
                      <th className="th-ui">Letzte Aenderung</th>
                      <th className="th-ui">Aktionen</th>
                    </tr>
                  </thead>
                  <tbody>
                    {(adminOverview?.chains || []).map((entry) => (
                      <tr key={entry.id}>
                        <td className="td-ui">{entry.name}</td>
                        <td className="td-ui">{entry.code}</td>
                        <td className="td-ui">{entry.tenantCount}</td>
                        <td className="td-ui">{entry.userCount}</td>
                        <td className="td-ui">
                          <code className="rounded bg-rose-50 px-2 py-1 text-xs">
                            {entry.databaseName || '-'}
                          </code>
                        </td>
                        <td className="td-ui">{formatDateTime(entry.databaseUpdatedAt)}</td>
                        <td className="td-ui">
                          <div className="flex flex-wrap gap-2">
                            <button
                              type="button"
                              className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-800"
                              onClick={() => prepareDatabaseAssignForChain(entry.id)}
                            >
                              DB-Ziel setzen
                            </button>
                            <button
                              type="button"
                              className="rounded-lg border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 hover:bg-rose-50/60"
                              onClick={() => prepareTenantCreateForChain(entry.id)}
                            >
                              Filiale anlegen
                            </button>
                            <button
                              type="button"
                              className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-60"
                              disabled={isSaving || entry.tenantCount > 0}
                              onClick={() => void handleDeleteChain(entry.id, entry.name)}
                            >
                              Loeschen
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))}
                    {(adminOverview?.chains || []).length === 0 ? (
                      <tr>
                        <td className="td-ui text-rose-900/70" colSpan={7}>
                          Keine Kettendaten vorhanden.
                        </td>
                      </tr>
                    ) : null}
                  </tbody>
                </table>
              </div>
            </article>

            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <div className="flex flex-wrap items-center justify-between gap-3">
                <div>
                  <h2 className="text-lg font-semibold">Datenbankliste</h2>
                  <p className="mt-1 text-xs text-rose-900/70">
                    Zeigt alle bekannten Datenbanken mit Zuordnung zu Kette, Filiale oder unzugeordnet.
                  </p>
                </div>
                <span className="rounded-full border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1 text-xs text-rose-900/75">
                  Datenbanken: {databaseListRows.length}
                </span>
              </div>
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[1200px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Datenbank</th>
                      <th className="th-ui">Typ</th>
                      <th className="th-ui">Zuordnung</th>
                      <th className="th-ui">Hinweis</th>
                      <th className="th-ui">Letzte Aenderung</th>
                      <th className="th-ui">Aktionen</th>
                    </tr>
                  </thead>
                  <tbody>
                    {databaseListRows.map((entry) => (
                      <tr key={entry.key}>
                        <td className="td-ui">
                          <code className="rounded bg-rose-50 px-2 py-1 text-xs">{entry.databaseName}</code>
                        </td>
                        <td className="td-ui">{entry.assignmentType}</td>
                        <td className="td-ui">{entry.assignmentLabel}</td>
                        <td className="td-ui">{entry.note || '-'}</td>
                        <td className="td-ui">{formatDateTime(entry.updatedAt)}</td>
                        <td className="td-ui">
                          <div className="flex flex-wrap gap-2">
                            {entry.assignmentType === 'UNASSIGNED' ? (
                              <button
                                type="button"
                                className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-800"
                                onClick={() => prepareDatabaseAssignForDatabase(entry.databaseName)}
                              >
                                Jetzt zuweisen
                              </button>
                            ) : entry.assignmentType === 'CHAIN' && entry.chainId ? (
                              <button
                                type="button"
                                className="rounded-lg border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 hover:bg-rose-50/60"
                                onClick={() => prepareDatabaseAssignForChain(entry.chainId!)}
                              >
                                Kettenziel oeffnen
                              </button>
                            ) : entry.assignmentType === 'TENANT' && entry.tenantId ? (
                              <button
                                type="button"
                                className="rounded-lg border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 hover:bg-rose-50/60"
                                onClick={() =>
                                  prepareDatabaseAssignForTenant(entry.tenantId!, entry.chainId)
                                }
                              >
                                Filialziel oeffnen
                              </button>
                            ) : (
                              <span className="text-xs text-rose-900/70">-</span>
                            )}
                            <button
                              type="button"
                              className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-60"
                              disabled={isSaving}
                              onClick={() => void handleDeleteDatabase(entry.databaseName)}
                            >
                              Loeschen
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))}
                    {databaseListRows.length === 0 ? (
                      <tr>
                        <td className="td-ui text-rose-900/70" colSpan={6}>
                          Keine Datenbanken vorhanden.
                        </td>
                      </tr>
                    ) : null}
                  </tbody>
                </table>
              </div>
            </article>
          </section>

          <section className="grid gap-6 xl:grid-cols-[1.3fr_1fr]">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-xl font-semibold">Benutzerliste</h2>
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[920px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Name</th>
                      <th className="th-ui">Rolle</th>
                      <th className="th-ui">Zuordnung</th>
                      <th className="th-ui">E-Mail</th>
                      <th className="th-ui">Status</th>
                      <th className="th-ui">Aktionen</th>
                    </tr>
                  </thead>
                  <tbody>
                    {users.map((entry) => {
                      const canPackage =
                        entry.role === 'ADMIN' || entry.role === 'STAFF' || entry.role === 'DRIVER'
                      const scope = entry.tenantId
                        ? tenantNameById.get(entry.tenantId) || entry.tenantId
                        : entry.chainId
                          ? chainNameById.get(entry.chainId) || entry.chainId
                          : '-'

                      return (
                        <tr key={entry.id} className={editForm?.id === entry.id ? 'bg-amber-50' : undefined}>
                          <td className="td-ui">{entry.name}</td>
                          <td className="td-ui">{entry.role}</td>
                          <td className="td-ui">{scope}</td>
                          <td className="td-ui">{entry.email}</td>
                          <td className="td-ui">{entry.isActive ? 'aktiv' : 'inaktiv'}</td>
                          <td className="td-ui">
                            <div className="flex flex-wrap gap-2">
                              <button
                                type="button"
                                className="rounded-lg bg-slate-700 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-600"
                                onClick={() => setEditForm(toEditForm(entry))}
                              >
                                Bearbeiten
                              </button>
                              {canPackage ? (
                                <button
                                  type="button"
                                  className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-800"
                                  onClick={() => {
                                    setSelectedUserId(entry.id)
                                    void loadPermissions(token, entry.id)
                                  }}
                                >
                                  Pakete
                                </button>
                              ) : null}
                              <button
                                type="button"
                                className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-60"
                                disabled={isSaving || session?.userId === entry.id}
                                onClick={() => void handleDeleteUser(entry)}
                              >
                                Loeschen
                              </button>
                            </div>
                          </td>
                        </tr>
                      )
                    })}
                  </tbody>
                </table>
              </div>
            </article>

            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-lg font-semibold">Benutzer bearbeiten</h2>
              {!editForm ? (
                <p className="mt-3 rounded-xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm text-rose-900/75">
                  Waehle in der Tabelle einen Benutzer auf Bearbeiten.
                </p>
              ) : (
                <div className="mt-3 space-y-3">
                  <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-xs text-rose-900/75">
                    {editableUser?.email || '-'}
                  </div>
                  <input
                    className="input-ui"
                    value={editForm.name}
                    onChange={(event) => setEditForm((current) => (current ? { ...current, name: event.target.value } : current))}
                    placeholder="Name"
                  />
                  <select
                    className="input-ui"
                    value={editForm.role}
                    onChange={(event) =>
                      setEditForm((current) => {
                        if (!current) return current
                        const role = event.target.value as AccessRole
                        if (role === 'SUPERADMIN') return { ...current, role, chainId: '', tenantId: '' }
                        if (role === 'CHAINADMIN') return { ...current, role, tenantId: '' }
                        return { ...current, role }
                      })
                    }
                  >
                    <option value="SUPERADMIN">SUPERADMIN</option>
                    <option value="CHAINADMIN">CHAINADMIN</option>
                    <option value="ADMIN">ADMIN</option>
                    <option value="STAFF">STAFF</option>
                    <option value="DRIVER">DRIVER</option>
                  </select>
                  <select
                    className="input-ui"
                    disabled={editForm.role === 'SUPERADMIN'}
                    value={editForm.chainId}
                    onChange={(event) => setEditForm((current) => (current ? { ...current, chainId: event.target.value } : current))}
                  >
                    <option value="">Kette (optional)</option>
                    {context?.chains.map((entry) => (
                      <option key={entry.id} value={entry.id}>
                        {entry.name}
                      </option>
                    ))}
                  </select>
                  <select
                    className="input-ui"
                    disabled={editForm.role === 'SUPERADMIN' || editForm.role === 'CHAINADMIN'}
                    value={editForm.tenantId}
                    onChange={(event) => {
                      const tenantId = event.target.value
                      const tenant = context?.tenants.find((entry) => entry.id === tenantId)
                      setEditForm((current) =>
                        current ? { ...current, tenantId, chainId: tenant?.chainId || current.chainId } : current
                      )
                    }}
                  >
                    <option value="">Filiale (optional)</option>
                    {tenantsForEdit.map((entry) => (
                      <option key={entry.id} value={entry.id}>
                        {entry.name}
                      </option>
                    ))}
                  </select>
                  <label className="flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
                    <input
                      type="checkbox"
                      checked={editForm.isActive}
                      onChange={(event) =>
                        setEditForm((current) => (current ? { ...current, isActive: event.target.checked } : current))
                      }
                    />
                    Benutzer ist aktiv
                  </label>
                  <input
                    className="input-ui"
                    type="password"
                    value={editForm.password}
                    onChange={(event) =>
                      setEditForm((current) => (current ? { ...current, password: event.target.value } : current))
                    }
                    placeholder="Neues Passwort (optional)"
                  />
                  <div className="flex gap-2">
                    <button
                      type="button"
                      className="btn-ui flex-1"
                      disabled={isSaving}
                      onClick={() =>
                        void withSaving(async () => {
                          if (!editForm) return
                          const validationError = validateEditForm(editForm)
                          if (validationError) throw new Error(validationError)
                          await updateAccessUser(token, editForm.id, {
                            name: editForm.name.trim(),
                            role: editForm.role,
                            chainId: editForm.role === 'SUPERADMIN' ? null : editForm.chainId || null,
                            tenantId:
                              editForm.role === 'ADMIN' ||
                              editForm.role === 'STAFF' ||
                              editForm.role === 'DRIVER'
                                ? editForm.tenantId || null
                                : null,
                            isActive: editForm.isActive,
                            password: editForm.password.trim() || undefined,
                          })
                          setSuccess('Benutzer wurde aktualisiert.')
                          await loadData(token)
                          setEditForm((current) => (current ? { ...current, password: '' } : current))
                        })
                      }
                    >
                      Speichern
                    </button>
                    <button
                      type="button"
                      className="rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2.5 text-sm font-medium text-rose-900/85 hover:bg-rose-50/60"
                      onClick={() => setEditForm(null)}
                    >
                      Abbrechen
                    </button>
                  </div>
                </div>
              )}
            </article>
          </section>

          <section className="grid gap-6 xl:grid-cols-[1.3fr_1fr]">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-lg font-semibold">Modulfreigabe pro Benutzer</h2>
              {!selectedUser ? (
                <p className="mt-3 rounded-xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm text-rose-900/75">
                  Waehle einen ADMIN/STAFF/DRIVER auf Pakete.
                </p>
              ) : (
                <div className="mt-3 space-y-3">
                  <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
                    {selectedUser.name} ({selectedUser.role})
                  </div>
                  <div className="grid gap-2 sm:grid-cols-4">
                    <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs text-rose-900/80">
                      Ausgewaehlte Pakete: <span className="font-semibold">{selectedPackageIds.length}</span>
                    </div>
                    <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs text-rose-900/80">
                      Einzelrechte: <span className="font-semibold">{selectedSubPermissions.length}</span>
                    </div>
                    <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs text-rose-900/80">
                      Effektive Rechte: <span className="font-semibold">{previewPermissions.length}</span>
                    </div>
                    <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs text-rose-900/80">
                      Treffer: <span className="font-semibold">{filteredPackageTemplates.length}</span>
                    </div>
                  </div>
                  <input
                    value={permissionFilter}
                    onChange={(event) => setPermissionFilter(event.target.value)}
                    placeholder="Pakete oder Rechte suchen..."
                    className="input-ui"
                  />
                  <div className="flex flex-wrap gap-2">
                    <button
                      type="button"
                      className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                      onClick={enableAllPackages}
                    >
                      Alle Module freigeben
                    </button>
                    <button
                      type="button"
                      className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                      onClick={disableAllPackages}
                    >
                      Alle Module entziehen
                    </button>
                    <button
                      type="button"
                      className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                      onClick={enableAllPermissionsDirectly}
                    >
                      Alle Untermodule freigeben
                    </button>
                    <button
                      type="button"
                      className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                      onClick={clearDirectPermissions}
                    >
                      Untermodule zuruecksetzen
                    </button>
                  </div>

                  <div className="grid gap-4 xl:grid-cols-[1fr_1.2fr]">
                    <div className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-3">
                      <p className="text-xs font-semibold uppercase tracking-wide text-rose-900/70">
                        Module (Paketvorlagen)
                      </p>
                      <p className="mt-1 text-xs text-rose-900/70">
                        Pakete steuern den Hauptumfang. Untermodule koennen danach feinjustiert werden.
                      </p>
                      <div className="mt-3 grid gap-2">
                        {filteredPackageTemplates.map((entry) => (
                          <label
                            key={entry.id}
                            className={`block rounded-xl border px-3 py-2 transition ${
                              selectedPackageIds.includes(entry.id)
                                ? 'border-emerald-300 bg-emerald-50'
                                : 'border-[var(--brand-border)] bg-rose-50 text-rose-900/70'
                            }`}
                          >
                            <div className="flex items-start gap-3">
                              <input
                                type="checkbox"
                                checked={selectedPackageIds.includes(entry.id)}
                                onChange={(event) => togglePackage(entry.id, event.target.checked)}
                                className="mt-1"
                              />
                              <div className="w-full">
                                <p
                                  className={`text-sm font-semibold ${
                                    selectedPackageIds.includes(entry.id)
                                      ? 'text-[var(--brand-ink)]'
                                      : 'text-rose-900/70'
                                  }`}
                                >
                                  {entry.name}
                                </p>
                                <p
                                  className={`text-xs ${
                                    selectedPackageIds.includes(entry.id)
                                      ? 'text-rose-900/75'
                                      : 'text-rose-900/70'
                                  }`}
                                >
                                  {entry.description}
                                </p>
                                <div className="mt-2 grid gap-2 sm:grid-cols-[1fr_180px] sm:items-end">
                                  <div className="text-[11px] text-rose-900/70">
                                    Modulpreis (EUR, netto)
                                  </div>
                                  <input
                                    type="number"
                                    step="0.01"
                                    min={0}
                                    value={modulePrices[entry.id] ?? 0}
                                    onChange={(event) =>
                                      updateModulePrice(
                                        entry.id,
                                        Number(event.target.value.replace(',', '.')) || 0
                                      )
                                    }
                                    className="input-ui h-8 text-xs"
                                  />
                                </div>
                              </div>
                            </div>
                          </label>
                        ))}
                        {filteredPackageTemplates.length === 0 ? (
                          <p className="rounded-xl border border-dashed border-[var(--brand-border)] bg-white px-3 py-3 text-xs text-rose-900/70">
                            Kein Paket passt zur Suche.
                          </p>
                        ) : null}
                      </div>
                    </div>

                    <div className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-3">
                      <div className="flex flex-wrap items-center justify-between gap-2">
                        <div>
                          <p className="text-xs font-semibold uppercase tracking-wide text-rose-900/70">
                            Untermodule (Einzelrechte)
                          </p>
                          <p className="mt-1 text-xs text-rose-900/70">
                            Jede Funktion kann einzeln ein- oder ausgeschaltet werden.
                          </p>
                        </div>
                        <span className="rounded-lg border border-[var(--brand-border)] bg-rose-50/60 px-2 py-1 text-[11px] text-rose-900/75">
                          Rechte ohne Paketabdeckung: {permissionsNotCoveredByPackages.length}
                        </span>
                      </div>

                      <div className="mt-3 max-h-[620px] space-y-3 overflow-y-auto pr-1">
                        {subPermissionsByGroup.map((group) => {
                          const selectedCount = group.permissions.filter((permission) =>
                            selectedSubPermissionSet.has(permission)
                          ).length
                          const activeCount = group.permissions.filter((permission) =>
                            previewPermissionSet.has(permission)
                          ).length

                          return (
                            <div
                              key={group.label}
                              className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3"
                            >
                              <div className="flex flex-wrap items-center justify-between gap-2">
                                <div>
                                  <p className="text-sm font-semibold text-[var(--brand-ink)]">
                                    {group.label}
                                  </p>
                                  <p className="text-[11px] text-rose-900/70">
                                    Aktiv: {activeCount}/{group.permissions.length} | Direkt gesetzt:{' '}
                                    {selectedCount}
                                  </p>
                                </div>
                                <div className="flex gap-2">
                                  <button
                                    type="button"
                                    className="rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-[11px] font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                                    onClick={() => enablePermissionGroup(group.permissions)}
                                  >
                                    Gruppe an
                                  </button>
                                  <button
                                    type="button"
                                    className="rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-[11px] font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                                    onClick={() => disablePermissionGroup(group.permissions)}
                                  >
                                    Gruppe aus
                                  </button>
                                </div>
                              </div>

                              <div className="mt-2 grid gap-2 md:grid-cols-2">
                                {group.permissions.map((permission) => (
                                  <label
                                    key={permission}
                                    className={`grid gap-2 rounded-xl border px-3 py-2 text-xs sm:grid-cols-[1fr_120px] sm:items-end ${
                                      previewPermissionSet.has(permission)
                                        ? 'border-emerald-300 bg-emerald-50'
                                        : 'border-[var(--brand-border)] bg-slate-50 text-rose-900/75'
                                    }`}
                                  >
                                    <div className="flex items-start gap-2">
                                      <input
                                        type="checkbox"
                                        checked={selectedSubPermissionSet.has(permission)}
                                        onChange={(event) =>
                                          toggleSubPermission(permission, event.target.checked)
                                        }
                                        className="mt-0.5"
                                      />
                                      <span>
                                        {formatAccessPermission(permission)}
                                        {!selectedSubPermissionSet.has(permission) &&
                                        packageDerivedPermissionSet.has(permission)
                                          ? ' (via Paket)'
                                          : ''}
                                      </span>
                                    </div>
                                    <input
                                      type="number"
                                      step="0.01"
                                      min={0}
                                      value={submodulePrices[permission] ?? 0}
                                      onChange={(event) =>
                                        updateSubmodulePrice(
                                          permission,
                                          Number(event.target.value.replace(',', '.')) || 0
                                        )
                                      }
                                      className="input-ui h-8 text-xs"
                                    />
                                  </label>
                                ))}
                              </div>
                            </div>
                          )
                        })}
                        {subPermissionsByGroup.length === 0 ? (
                          <p className="rounded-xl border border-dashed border-[var(--brand-border)] bg-white px-3 py-3 text-xs text-rose-900/70">
                            Kein Einzelrecht passt zur Suche.
                          </p>
                        ) : null}
                      </div>
                    </div>
                  </div>
                  <p className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-xs text-rose-900/85">
                    Rechte-Vorschau:{' '}
                    {previewPermissions.length
                      ? previewPermissions.map((permission) => formatAccessPermission(permission)).join(', ')
                      : 'Keine'}
                    <br />
                    <span className="text-[11px] text-rose-900/70">
                      Gespeichert: {selectedPermissions.length} | Pakete: {selectedPackageIds.length} |
                      Untermodule: {selectedSubPermissions.length}
                    </span>
                  </p>
                  <button
                    type="button"
                    className="btn-ui"
                    disabled={isSaving}
                    onClick={() =>
                      void withSaving(async () => {
                        if (!selectedUser) return
                        const response = await updateAccessUserPermissions(
                          token,
                          selectedUser.id,
                          previewPermissions
                        )
                        setSelectedPermissions(response.permissions)
                        setSuccess(`Module fuer ${selectedUser.name} gespeichert.`)
                      })
                    }
                  >
                    Pakete speichern
                  </button>
                </div>
              )}
            </article>

            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-lg font-semibold">Preise & Gebuehren (Pakete)</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Preis, monatliche und jaehrliche Gebuehr sowie Einrichtungsgebuehr je Unternehmen.
              </p>
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[760px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Paket</th>
                      <th className="th-ui">Preis</th>
                      <th className="th-ui">Monatlich</th>
                      <th className="th-ui">Jaehrlich</th>
                      <th className="th-ui">Einrichtung / Unternehmen</th>
                      <th className="th-ui">Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    {billingPackages.map((entry) => (
                      <tr
                        key={entry.id}
                        className={[
                          selectedBillingPackageId === entry.id ? 'bg-amber-50' : '',
                          !entry.isActive ? 'opacity-60 grayscale' : '',
                        ]
                          .join(' ')
                          .trim()}
                        onClick={() => setSelectedBillingPackageId(entry.id)}
                      >
                        <td className="td-ui">{entry.name}</td>
                        <td className="td-ui">{entry.price.toFixed(2)} EUR</td>
                        <td className="td-ui">{entry.monthlyFee.toFixed(2)} EUR</td>
                        <td className="td-ui">{entry.yearlyFee.toFixed(2)} EUR</td>
                        <td className="td-ui">{entry.setupFeePerCompany.toFixed(2)} EUR</td>
                        <td className="td-ui">{entry.isActive ? 'aktiv' : 'inaktiv'}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              <button
                type="button"
                className="mt-3 w-full rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2.5 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                onClick={addBillingPackage}
              >
                Neues Paket anlegen
              </button>
            </article>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-lg font-semibold">Kettenadmin: Filialfreigaben & Oberhand</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Superadmin legt hier fest, welche Filialen ein Kettenadmin steuern darf und ob er
              Oberhand bei Einstellungen erhaelt.
            </p>

            <div className="mt-4 grid gap-3 md:grid-cols-[320px_1fr]">
              <div>
                <label className="text-xs uppercase tracking-wide text-rose-900/70">
                  Kettenadmin waehlen
                </label>
                <select
                  className="input-ui mt-1"
                  value={selectedChainadminId}
                  onChange={(event) => {
                    const userId = event.target.value
                    setSelectedChainadminId(userId)
                    if (userId) {
                      void loadChainadminRights(token, userId)
                    } else {
                      setSelectedChainadminRights([])
                    }
                  }}
                >
                  <option value="">Bitte waehlen</option>
                  {chainadminUsers.map((entry) => (
                    <option key={entry.id} value={entry.id}>
                      {entry.name} ({entry.email})
                    </option>
                  ))}
                </select>
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm text-rose-900/85">
                {selectedChainadminId
                  ? 'Freigaben koennen je Filiale angepasst und gespeichert werden.'
                  : 'Waehle zuerst einen Kettenadmin aus.'}
              </div>
            </div>

            {selectedChainadminId ? (
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[1240px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Filiale</th>
                      <th className="th-ui">Freigabe aktiv</th>
                      <th className="th-ui">Umsatz sichtbar</th>
                      <th className="th-ui">App-Bestellungen</th>
                      <th className="th-ui">Lieferung</th>
                      <th className="th-ui">Abholung</th>
                      <th className="th-ui">Einkauf sichtbar</th>
                      <th className="th-ui">Personalplanung sichtbar</th>
                      <th className="th-ui">Oberhand Einstellungen</th>
                      <th className="th-ui">Notiz</th>
                      <th className="th-ui">Aktion</th>
                    </tr>
                  </thead>
                  <tbody>
                    {isLoadingChainadminRights ? (
                      <tr>
                        <td className="td-ui text-rose-900/70" colSpan={11}>
                          Lade Filialfreigaben...
                        </td>
                      </tr>
                    ) : selectedChainadminRights.length === 0 ? (
                      <tr>
                        <td className="td-ui text-rose-900/70" colSpan={11}>
                          Keine Filialen fuer diesen Kettenadmin gefunden.
                        </td>
                      </tr>
                    ) : (
                      selectedChainadminRights.map((entry) => (
                        <tr key={entry.tenantId}>
                          <td className="td-ui">{entry.tenantName}</td>
                          <td className="td-ui">
                            <input
                              type="checkbox"
                              checked={entry.superadminGranted}
                              onChange={(event) =>
                                updateChainadminRight(entry.tenantId, {
                                  superadminGranted: event.target.checked,
                                })
                              }
                            />
                          </td>
                          <td className="td-ui">
                            <input
                              type="checkbox"
                              checked={entry.canViewRevenue}
                              onChange={(event) =>
                                updateChainadminRight(entry.tenantId, {
                                  canViewRevenue: event.target.checked,
                                })
                              }
                            />
                          </td>
                          <td className="td-ui">
                            <input
                              type="checkbox"
                              checked={entry.canManageAppOrders}
                              onChange={(event) =>
                                updateChainadminRight(entry.tenantId, {
                                  canManageAppOrders: event.target.checked,
                                })
                              }
                            />
                          </td>
                          <td className="td-ui">
                            <input
                              type="checkbox"
                              checked={entry.canManageDelivery}
                              onChange={(event) =>
                                updateChainadminRight(entry.tenantId, {
                                  canManageDelivery: event.target.checked,
                                })
                              }
                            />
                          </td>
                          <td className="td-ui">
                            <input
                              type="checkbox"
                              checked={entry.canManagePickup}
                              onChange={(event) =>
                                updateChainadminRight(entry.tenantId, {
                                  canManagePickup: event.target.checked,
                                })
                              }
                            />
                          </td>
                          <td className="td-ui">
                            <input
                              type="checkbox"
                              checked={entry.canViewPurchasing}
                              onChange={(event) =>
                                updateChainadminRight(entry.tenantId, {
                                  canViewPurchasing: event.target.checked,
                                })
                              }
                            />
                          </td>
                          <td className="td-ui">
                            <input
                              type="checkbox"
                              checked={entry.canViewStaffPlanning}
                              onChange={(event) =>
                                updateChainadminRight(entry.tenantId, {
                                  canViewStaffPlanning: event.target.checked,
                                })
                              }
                            />
                          </td>
                          <td className="td-ui">
                            <input
                              type="checkbox"
                              checked={entry.canOverrideSettings}
                              onChange={(event) =>
                                updateChainadminRight(entry.tenantId, {
                                  canOverrideSettings: event.target.checked,
                                })
                              }
                            />
                          </td>
                          <td className="td-ui">
                            <input
                              className="input-ui min-w-[180px]"
                              value={entry.notes || ''}
                              onChange={(event) =>
                                updateChainadminRight(entry.tenantId, { notes: event.target.value })
                              }
                            />
                          </td>
                          <td className="td-ui">
                            <button
                              type="button"
                              className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
                              disabled={isSaving || savingChainadminTenantId === entry.tenantId}
                              onClick={() => void saveChainadminRight(entry.tenantId)}
                            >
                              {savingChainadminTenantId === entry.tenantId ? 'Speichert...' : 'Speichern'}
                            </button>
                          </td>
                        </tr>
                      ))
                    )}
                  </tbody>
                </table>
              </div>
            ) : null}
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <div className="flex flex-wrap items-center justify-between gap-3">
              <h2 className="text-lg font-semibold">Paket bearbeiten</h2>
              <div className="flex gap-2">
                <button
                  type="button"
                  className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-medium text-white transition hover:bg-slate-800"
                  onClick={() => {
                    localStorage.setItem(BILLING_PACKAGES_STORAGE_KEY, JSON.stringify(billingPackages))
                    setSuccess('Paketdaten wurden gespeichert.')
                  }}
                >
                  Paketdaten speichern
                </button>
                <button
                  type="button"
                  className="rounded-xl border border-red-200 bg-red-50 px-4 py-2.5 text-sm font-medium text-red-700 transition hover:bg-red-100"
                  onClick={deleteSelectedBillingPackage}
                  disabled={!selectedBillingPackage}
                >
                  Paket loeschen
                </button>
              </div>
            </div>

            {!selectedBillingPackage ? (
              <p className="mt-3 rounded-xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-3 text-sm text-rose-900/75">
                Bitte links ein Paket auswaehlen.
              </p>
            ) : (
              <div className="mt-4 grid gap-3 md:grid-cols-2">
                <input
                  className="input-ui"
                  value={selectedBillingPackage.name}
                  onChange={(event) => updateSelectedBillingPackage({ name: event.target.value })}
                  placeholder="Paketname"
                />
                <input
                  className="input-ui"
                  value={selectedBillingPackage.description}
                  onChange={(event) => updateSelectedBillingPackage({ description: event.target.value })}
                  placeholder="Beschreibung"
                />
                <input
                  className="input-ui"
                  type="number"
                  step="0.01"
                  value={selectedBillingPackage.price}
                  onChange={(event) =>
                    updateSelectedBillingPackage({ price: Number(event.target.value) || 0 })
                  }
                  placeholder="Preis"
                />
                <input
                  className="input-ui"
                  type="number"
                  step="0.01"
                  value={selectedBillingPackage.monthlyFee}
                  onChange={(event) =>
                    updateSelectedBillingPackage({ monthlyFee: Number(event.target.value) || 0 })
                  }
                  placeholder="Monatliche Gebuehr"
                />
                <input
                  className="input-ui"
                  type="number"
                  step="0.01"
                  value={selectedBillingPackage.yearlyFee}
                  onChange={(event) =>
                    updateSelectedBillingPackage({ yearlyFee: Number(event.target.value) || 0 })
                  }
                  placeholder="Jaehrliche Gebuehr"
                />
                <input
                  className="input-ui"
                  type="number"
                  step="0.01"
                  value={selectedBillingPackage.setupFeePerCompany}
                  onChange={(event) =>
                    updateSelectedBillingPackage({ setupFeePerCompany: Number(event.target.value) || 0 })
                  }
                  placeholder="Einrichtungsgebuehr je Unternehmen"
                />
                <label className="flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
                  <input
                    type="checkbox"
                    checked={selectedBillingPackage.isActive}
                    onChange={(event) =>
                      updateSelectedBillingPackage({ isActive: event.target.checked })
                    }
                  />
                  Paket aktiv
                </label>
              </div>
            )}
          </section>
        </div>
      )}

    </BackofficeLayout>
  )
}



