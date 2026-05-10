'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { CHAINADMIN_NAV_ITEMS } from '@/app/chainadmin/nav'
import {
  createAccessUser,
  deleteAccessUser,
  getAccessContext,
  getChainadminAccessRights,
  getChainadminDashboard,
  getAccessUserPermissions,
  getAccessUsers,
  updateChainadminAccessRight,
  updateAccessUser,
  updateAccessUserPermissions,
  type AccessPermission,
  type AccessRole,
  type AccessUser,
  type ChainadminDashboard,
  type ChainadminTenantRight,
  type ManagedTenant,
} from '@/lib/api'
import {
  ACCESS_PACKAGES,
  formatAccessPermission,
  packageIdsFromPermissions,
  permissionsFromPackageIds,
} from '@/lib/access-packages'
import type { SessionUser } from '@/lib/app-data'

type NewUserForm = {
  name: string
  email: string
  password: string
  role: Extract<AccessRole, 'ADMIN' | 'STAFF'>
  tenantId: string
}

type EditUserForm = {
  id: string
  name: string
  role: Extract<AccessRole, 'ADMIN' | 'STAFF'>
  isActive: boolean
  password: string
}

const initialForm: NewUserForm = {
  name: '',
  email: '',
  password: '',
  role: 'ADMIN',
  tenantId: '',
}

export default function ChainadminPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [users, setUsers] = useState<AccessUser[]>([])
  const [tenants, setTenants] = useState<ManagedTenant[]>([])
  const [form, setForm] = useState<NewUserForm>(initialForm)
  const [editForm, setEditForm] = useState<EditUserForm | null>(null)
  const [selectedUserId, setSelectedUserId] = useState('')
  const [selectedUserPermissions, setSelectedUserPermissions] = useState<AccessPermission[]>([])
  const [selectedPackageIds, setSelectedPackageIds] = useState<string[]>([])
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [isLoading, setIsLoading] = useState(true)
  const [isRefreshing, setIsRefreshing] = useState(false)
  const [autoRefreshEnabled, setAutoRefreshEnabled] = useState(true)
  const [lastUpdatedAt, setLastUpdatedAt] = useState<Date | null>(null)
  const [isSaving, setIsSaving] = useState(false)
  const [isLoadingPackages, setIsLoadingPackages] = useState(false)
  const [isSavingPackages, setIsSavingPackages] = useState(false)
  const [packageFilter, setPackageFilter] = useState('')
  const [dashboardDays, setDashboardDays] = useState(30)
  const [dashboard, setDashboard] = useState<ChainadminDashboard | null>(null)
  const [tenantRights, setTenantRights] = useState<ChainadminTenantRight[]>([])
  const [savingTenantRightId, setSavingTenantRightId] = useState<string | null>(null)
  const [dashboardStorageScope, setDashboardStorageScope] = useState('default')
  const [visibleSectionIds, setVisibleSectionIds] = useState<string[]>([
    'kpi',
    'tenant-dashboard',
    'rights',
    'create-user',
    'users-and-packages',
  ])
  const sectionMeta = [
    { id: 'kpi', label: 'Kennzahlen' },
    { id: 'tenant-dashboard', label: 'Filial-Dashboard' },
    { id: 'rights', label: 'Filialrechte & Oberhand' },
    { id: 'create-user', label: 'Benutzer anlegen' },
    { id: 'users-and-packages', label: 'Benutzer & Pakete' },
  ] as const

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null

    if (!parsed || parsed.role !== 'chainadmin') {
      window.location.href = '/'
      return
    }

    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    setSession(parsed)
    setToken(accessToken)
    const userPart = parsed.userId || parsed.email || parsed.role || 'default'
    setDashboardStorageScope(String(userPart).toLowerCase())
  }, [])

  useEffect(() => {
    if (!session || !token) return
    void loadData(token)
  }, [session, token, dashboardDays])

  useEffect(() => {
    if (!session || !token || !autoRefreshEnabled) {
      return
    }

    const intervalId = window.setInterval(() => {
      void loadData(token, { silent: true })
    }, 45000)

    return () => {
      window.clearInterval(intervalId)
    }
  }, [session, token, dashboardDays, autoRefreshEnabled])

  useEffect(() => {
    try {
      const raw = window.localStorage.getItem(
        `klarando.chainadmin.dashboard.visible.v1:${dashboardStorageScope}`
      )
      if (!raw) return
      const parsed = JSON.parse(raw) as string[]
      if (!Array.isArray(parsed)) return
      const allowed = new Set([
        'kpi',
        'tenant-dashboard',
        'rights',
        'create-user',
        'users-and-packages',
      ])
      const filtered = parsed.filter((entry) => allowed.has(entry))
      if (filtered.length > 0) {
        setVisibleSectionIds(filtered)
      }
    } catch {
      // ignore malformed local storage
    }
  }, [dashboardStorageScope])

  useEffect(() => {
    window.localStorage.setItem(
      `klarando.chainadmin.dashboard.visible.v1:${dashboardStorageScope}`,
      JSON.stringify(visibleSectionIds)
    )
  }, [visibleSectionIds, dashboardStorageScope])

  const selectedUser = useMemo(
    () => users.find((entry) => entry.id === selectedUserId) || null,
    [users, selectedUserId]
  )

  const editableUser = useMemo(
    () => users.find((entry) => entry.id === editForm?.id) || null,
    [users, editForm?.id]
  )

  const manageableUsers = useMemo(
    () => users.filter((entry) => entry.role === 'ADMIN' || entry.role === 'STAFF'),
    [users]
  )
  const totalRevenue = dashboard?.totals.revenue ?? 0
  const totalPurchasing = dashboard?.totals.purchasingVolume ?? 0
  const totalPaidOrders = dashboard?.totals.paidOrders ?? 0
  const totalPlannedShifts = dashboard?.totals.plannedShifts ?? 0
  const totalActiveTenants = dashboard?.totals.tenants ?? 0
  const totalActiveStaff = dashboard?.totals.activeStaff ?? 0
  const previewPermissions = useMemo(
    () => permissionsFromPackageIds(selectedPackageIds),
    [selectedPackageIds]
  )
  const filteredPackages = useMemo(() => {
    const query = packageFilter.trim().toLowerCase()
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
  }, [packageFilter])

  async function loadData(accessToken: string, options: { silent?: boolean } = {}) {
    try {
      if (!options.silent) {
        setIsLoading(true)
      }
      setError('')

      const [loadedUsers, context, loadedDashboard, rightsResponse] = await Promise.all([
        getAccessUsers(accessToken),
        getAccessContext(accessToken),
        getChainadminDashboard(accessToken, dashboardDays),
        getChainadminAccessRights(accessToken),
      ])

      setUsers(loadedUsers)
      setTenants(context.tenants)
      setDashboard(loadedDashboard)
      setTenantRights(rightsResponse.rights)
      setLastUpdatedAt(new Date())

      if (editForm) {
        const refreshed = loadedUsers.find((entry) => entry.id === editForm.id)
        setEditForm(
          refreshed && (refreshed.role === 'ADMIN' || refreshed.role === 'STAFF')
            ? {
                id: refreshed.id,
                name: refreshed.name,
                role: refreshed.role,
                isActive: refreshed.isActive,
                password: '',
              }
            : null
        )
      }

      if (!form.tenantId && context.tenants[0]?.id) {
        setForm((prev) => ({ ...prev, tenantId: context.tenants[0].id }))
      }

      const eligibleUsers = loadedUsers.filter(
        (entry) => entry.role === 'ADMIN' || entry.role === 'STAFF'
      )
      const defaultPackageTarget =
        eligibleUsers.find((entry) => entry.id === selectedUserId) || eligibleUsers[0]

      if (defaultPackageTarget) {
        setSelectedUserId(defaultPackageTarget.id)
        await loadUserPermissions(accessToken, defaultPackageTarget.id)
      } else {
        setSelectedUserId('')
        setSelectedPackageIds([])
        setSelectedUserPermissions([])
      }
    } catch (loadError) {
      const message = loadError instanceof Error ? loadError.message : 'Daten konnten nicht geladen werden'
      setError(message)
    } finally {
      if (!options.silent) {
        setIsLoading(false)
      }
      setIsRefreshing(false)
    }
  }

  function triggerRefresh() {
    if (!token) return
    setIsRefreshing(true)
    void loadData(token, { silent: true })
  }

  function toggleSectionVisibility(sectionId: string, enabled: boolean) {
    setVisibleSectionIds((current) => {
      if (enabled) {
        return Array.from(new Set([...current, sectionId]))
      }
      return current.filter((entry) => entry !== sectionId)
    })
  }

  async function loadUserPermissions(accessToken: string, userId: string) {
    try {
      setIsLoadingPackages(true)
      const response = await getAccessUserPermissions(accessToken, userId)
      setSelectedUserPermissions(response.permissions)
      setSelectedPackageIds(packageIdsFromPermissions(response.permissions))
    } catch (permissionError) {
      const message =
        permissionError instanceof Error
          ? permissionError.message
          : 'Pakete konnten nicht geladen werden'
      setError(message)
    } finally {
      setIsLoadingPackages(false)
    }
  }

  async function handleCreateUser() {
    if (!token) return

    if (!form.name || !form.email || !form.password || !form.tenantId) {
      setError('Name, E-Mail, Passwort und Filiale sind erforderlich.')
      return
    }

    try {
      setIsSaving(true)
      setError('')
      setSuccess('')

      await createAccessUser(token, {
        name: form.name,
        email: form.email,
        password: form.password,
        role: form.role,
        tenantId: form.tenantId,
      })

      setForm((prev) => ({ ...initialForm, tenantId: prev.tenantId }))
      setSuccess('Benutzer wurde erstellt.')
      await loadData(token)
    } catch (saveError) {
      const message = saveError instanceof Error ? saveError.message : 'Benutzer konnte nicht erstellt werden'
      setError(message)
    } finally {
      setIsSaving(false)
    }
  }

  async function handleSaveEditedUser() {
    if (!token || !editForm) return

    if (!editForm.name.trim()) {
      setError('Name ist erforderlich.')
      return
    }

    try {
      setIsSaving(true)
      setError('')
      setSuccess('')

      await updateAccessUser(token, editForm.id, {
        name: editForm.name.trim(),
        role: editForm.role,
        isActive: editForm.isActive,
        password: editForm.password.trim() || undefined,
      })

      setSuccess('Benutzer wurde bearbeitet.')
      await loadData(token)
      setEditForm((current) => (current ? { ...current, password: '' } : current))
    } catch (saveError) {
      const message = saveError instanceof Error ? saveError.message : 'Benutzer konnte nicht bearbeitet werden'
      setError(message)
    } finally {
      setIsSaving(false)
    }
  }

  async function handleDeleteUser(user: AccessUser) {
    if (!token) return

    const shouldDelete = window.confirm(
      `Benutzer "${user.name}" wirklich loeschen? Diese Aktion kann nicht rueckgaengig gemacht werden.`
    )
    if (!shouldDelete) {
      return
    }

    try {
      setIsSaving(true)
      setError('')
      setSuccess('')

      await deleteAccessUser(token, user.id)
      setEditForm((current) => (current?.id === user.id ? null : current))
      if (selectedUserId === user.id) {
        setSelectedUserId('')
        setSelectedPackageIds([])
        setSelectedUserPermissions([])
      }
      setSuccess('Benutzer wurde geloescht.')
      await loadData(token)
    } catch (saveError) {
      const message = saveError instanceof Error ? saveError.message : 'Benutzer konnte nicht geloescht werden'
      setError(message)
    } finally {
      setIsSaving(false)
    }
  }

  async function handleSavePackages() {
    if (!token || !selectedUser) {
      return
    }

    const nextPermissions = permissionsFromPackageIds(selectedPackageIds)

    try {
      setIsSavingPackages(true)
      setError('')
      setSuccess('')

      const response = await updateAccessUserPermissions(token, selectedUser.id, nextPermissions)
      setSelectedUserPermissions(response.permissions)
      setSuccess(`Pakete fuer ${selectedUser.name} wurden gespeichert.`)

      if (session?.userId === selectedUser.id) {
        const nextSession: SessionUser = {
          ...session,
          permissions: response.permissions,
        }
        setSession(nextSession)
        localStorage.setItem('sessionUser', JSON.stringify(nextSession))
      }
    } catch (saveError) {
      const message =
        saveError instanceof Error
          ? saveError.message
          : 'Pakete konnten nicht gespeichert werden'
      setError(message)
    } finally {
      setIsSavingPackages(false)
    }
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
  }

  function updateTenantRight(tenantId: string, patch: Partial<ChainadminTenantRight>) {
    setTenantRights((current) =>
      current.map((entry) => (entry.tenantId === tenantId ? { ...entry, ...patch } : entry))
    )
  }

  async function saveTenantRight(tenantId: string) {
    if (!token) {
      return
    }

    const right = tenantRights.find((entry) => entry.tenantId === tenantId)
    if (!right) {
      return
    }

    if (!right.superadminGranted) {
      setError('Diese Filiale ist fuer dich noch nicht durch den Superadmin freigegeben.')
      return
    }

    try {
      setSavingTenantRightId(tenantId)
      setError('')
      setSuccess('')
      await updateChainadminAccessRight(token, {
        tenantId,
        canViewRevenue: right.canViewRevenue,
        canManageAppOrders: right.canManageAppOrders,
        canManageDelivery: right.canManageDelivery,
        canManagePickup: right.canManagePickup,
        canViewPurchasing: right.canViewPurchasing,
        canViewStaffPlanning: right.canViewStaffPlanning,
        notes: right.notes,
      })
      setSuccess(`Filialrechte fuer ${right.tenantName} gespeichert.`)
      const refreshedRights = await getChainadminAccessRights(token)
      setTenantRights(refreshedRights.rights)
    } catch (saveError) {
      const message =
        saveError instanceof Error ? saveError.message : 'Filialrechte konnten nicht gespeichert werden'
      setError(message)
    } finally {
      setSavingTenantRightId(null)
    }
  }

  if (!session) return null

  return (
    <BackofficeLayout
      brand="Kettenadmin"
      title="Benutzerverwaltung"
      subtitle="Admins und Staff pro Filiale verwalten und Pakete freischalten"
      navItems={CHAINADMIN_NAV_ITEMS}
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

      <section className="mb-4 rounded-3xl bg-white p-4 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div className="text-sm text-rose-900/80">
            Letztes Update:{' '}
            <span className="font-semibold text-[var(--brand-ink)]">
              {lastUpdatedAt ? lastUpdatedAt.toLocaleString('de-DE') : '-'}
            </span>
          </div>
          <div className="flex flex-wrap items-center gap-2">
            <label className="flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs font-medium text-rose-900/85">
              <input
                type="checkbox"
                checked={autoRefreshEnabled}
                onChange={(event) => setAutoRefreshEnabled(event.target.checked)}
              />
              Auto-Refresh (45s)
            </label>
            <button
              type="button"
              className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
              onClick={triggerRefresh}
              disabled={isRefreshing}
            >
              {isRefreshing ? 'Aktualisiere...' : 'Jetzt aktualisieren'}
            </button>
          </div>
        </div>
      </section>
      <section className="mb-4 rounded-3xl bg-white p-4 shadow-sm ring-1 ring-[var(--brand-border)]">
        <p className="text-xs uppercase tracking-wide text-rose-900/70">Dashboard anpassen (pro Benutzer)</p>
        <div className="mt-2 flex flex-wrap gap-2">
          {sectionMeta.map((section) => {
            const checked = visibleSectionIds.includes(section.id)
            return (
              <label
                key={section.id}
                className={`flex items-center gap-2 rounded-xl border px-3 py-1.5 text-xs transition ${
                  checked
                    ? 'border-emerald-300 bg-emerald-50 text-emerald-800'
                    : 'border-[var(--brand-border)] bg-rose-50/60 text-rose-900/80'
                }`}
              >
                <input
                  type="checkbox"
                  checked={checked}
                  onChange={(event) => toggleSectionVisibility(section.id, event.target.checked)}
                />
                {section.label}
              </label>
            )
          })}
        </div>
        <div className="mt-3 flex flex-wrap gap-2">
          <Link
            href="/admin/orders"
            className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1.5 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-100"
          >
            Quelle Bestellungen
          </Link>
          <Link
            href="/admin/stock"
            className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1.5 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-100"
          >
            Quelle Einkauf/Lager
          </Link>
          <Link
            href="/chainadmin/app-settings"
            className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1.5 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-100"
          >
            Quelle App-Einstellungen
          </Link>
        </div>
      </section>

      {isLoading ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/75">Lade Daten...</p>
        </section>
      ) : (
        <div className="grid gap-6">
          {visibleSectionIds.includes('kpi') ? (
          <section className="grid gap-4 md:grid-cols-6">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Zeitraum</p>
              <div className="mt-2">
                <select
                  value={dashboardDays}
                  onChange={(event) => setDashboardDays(Number(event.target.value))}
                  className="input-ui"
                >
                  <option value={7}>7 Tage</option>
                  <option value={14}>14 Tage</option>
                  <option value={30}>30 Tage</option>
                  <option value={90}>90 Tage</option>
                </select>
              </div>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Umsatz</p>
              <p className="mt-2 text-2xl font-bold text-emerald-700">{totalRevenue.toFixed(2)} EUR</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Einkauf</p>
              <p className="mt-2 text-2xl font-bold text-sky-700">{totalPurchasing.toFixed(2)} EUR</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Bezahlte Bestellungen</p>
              <p className="mt-2 text-2xl font-bold text-[var(--brand-ink)]">{totalPaidOrders}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Geplante Schichten</p>
              <p className="mt-2 text-2xl font-bold text-[var(--brand-ink)]">{totalPlannedShifts}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Aktive Filialen</p>
              <p className="mt-2 text-2xl font-bold text-[var(--brand-ink)]">{totalActiveTenants}</p>
              <p className="mt-1 text-xs text-rose-900/75">Aktive Mitarbeitende: {totalActiveStaff}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)] md:col-span-6">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Quellen der Kennzahlen</p>
              <div className="mt-3 flex flex-wrap gap-2">
                <Link
                  href="/admin/orders"
                  className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1.5 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-100"
                >
                  Quelle Bestellungen
                </Link>
                <Link
                  href="/admin/stock"
                  className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1.5 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-100"
                >
                  Quelle Einkauf/Lager
                </Link>
                <Link
                  href="/chainadmin/closings"
                  className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1.5 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-100"
                >
                  Quelle Abschluesse
                </Link>
                <Link
                  href="/chainadmin/app-settings"
                  className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-1.5 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-100"
                >
                  Quelle App-Einstellungen
                </Link>
              </div>
            </article>
          </section>
          ) : null}

          {visibleSectionIds.includes('tenant-dashboard') ? (
          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Filial-Dashboard</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Verkauf, Einkauf und Personalplanung je Filiale im gewaehlten Zeitraum.
            </p>
            <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
              <table className="w-full min-w-[940px] border-collapse">
                <thead>
                  <tr>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Filiale
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Umsatz
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Einkauf
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Bezahlte Bestellungen
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Geplante Schichten
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Aktive Mitarbeitende
                    </th>
                  </tr>
                </thead>
                <tbody>
                  {(dashboard?.tenants || []).map((entry) => (
                    <tr key={entry.tenantId}>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.tenantName}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {entry.revenue.toFixed(2)} EUR
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {entry.purchasingVolume.toFixed(2)} EUR
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.paidOrders}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.plannedShifts}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.activeStaff}</td>
                    </tr>
                  ))}
                  {(dashboard?.tenants || []).length === 0 ? (
                    <tr>
                      <td className="border-t border-slate-100 px-3 py-4 text-sm text-rose-900/70" colSpan={6}>
                        Keine Daten verfuegbar.
                      </td>
                    </tr>
                  ) : null}
                </tbody>
              </table>
            </div>
          </section>
          ) : null}

          {visibleSectionIds.includes('rights') ? (
          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Filialrechte & Oberhand</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Rechte pro Filiale. Nicht freigegebene Filialen koennen erst nach Superadmin-Freigabe bearbeitet werden.
            </p>
            <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
              <table className="w-full min-w-[1180px] border-collapse">
                <thead>
                  <tr>
                    <th className="th-ui">Filiale</th>
                    <th className="th-ui">Superadmin Freigabe</th>
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
                  {tenantRights.map((entry) => {
                    const disabled = !entry.superadminGranted
                    return (
                      <tr key={entry.tenantId} className={disabled ? 'bg-rose-50/60' : undefined}>
                        <td className="td-ui">{entry.tenantName}</td>
                        <td className="td-ui">{entry.superadminGranted ? 'Ja' : 'Nein'}</td>
                        <td className="td-ui">
                          <input
                            type="checkbox"
                            checked={entry.canViewRevenue}
                            disabled={disabled}
                            onChange={(event) =>
                              updateTenantRight(entry.tenantId, { canViewRevenue: event.target.checked })
                            }
                          />
                        </td>
                        <td className="td-ui">
                          <input
                            type="checkbox"
                            checked={entry.canManageAppOrders}
                            disabled={disabled}
                            onChange={(event) =>
                              updateTenantRight(entry.tenantId, {
                                canManageAppOrders: event.target.checked,
                              })
                            }
                          />
                        </td>
                        <td className="td-ui">
                          <input
                            type="checkbox"
                            checked={entry.canManageDelivery}
                            disabled={disabled}
                            onChange={(event) =>
                              updateTenantRight(entry.tenantId, { canManageDelivery: event.target.checked })
                            }
                          />
                        </td>
                        <td className="td-ui">
                          <input
                            type="checkbox"
                            checked={entry.canManagePickup}
                            disabled={disabled}
                            onChange={(event) =>
                              updateTenantRight(entry.tenantId, { canManagePickup: event.target.checked })
                            }
                          />
                        </td>
                        <td className="td-ui">
                          <input
                            type="checkbox"
                            checked={entry.canViewPurchasing}
                            disabled={disabled}
                            onChange={(event) =>
                              updateTenantRight(entry.tenantId, { canViewPurchasing: event.target.checked })
                            }
                          />
                        </td>
                        <td className="td-ui">
                          <input
                            type="checkbox"
                            checked={entry.canViewStaffPlanning}
                            disabled={disabled}
                            onChange={(event) =>
                              updateTenantRight(entry.tenantId, {
                                canViewStaffPlanning: event.target.checked,
                              })
                            }
                          />
                        </td>
                        <td className="td-ui">{entry.canOverrideSettings ? 'Aktiv' : 'Nein'}</td>
                        <td className="td-ui">
                          <input
                            value={entry.notes || ''}
                            disabled={disabled}
                            onChange={(event) =>
                              updateTenantRight(entry.tenantId, { notes: event.target.value })
                            }
                            className="input-ui min-w-[180px]"
                          />
                        </td>
                        <td className="td-ui">
                          <button
                            type="button"
                            disabled={disabled || savingTenantRightId === entry.tenantId}
                            onClick={() => void saveTenantRight(entry.tenantId)}
                            className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
                          >
                            {savingTenantRightId === entry.tenantId ? 'Speichert...' : 'Speichern'}
                          </button>
                        </td>
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          </section>
          ) : null}

          {visibleSectionIds.includes('create-user') ? (
          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Admin oder Staff anlegen</h2>
            <div className="mt-4 grid gap-3 lg:grid-cols-5">
              <input
                value={form.name}
                onChange={(event) => setForm((prev) => ({ ...prev, name: event.target.value }))}
                placeholder="Name"
                className="input-ui"
              />
              <input
                value={form.email}
                onChange={(event) => setForm((prev) => ({ ...prev, email: event.target.value }))}
                placeholder="E-Mail"
                className="input-ui"
              />
              <input
                value={form.password}
                type="password"
                onChange={(event) => setForm((prev) => ({ ...prev, password: event.target.value }))}
                placeholder="Passwort"
                className="input-ui"
              />
              <select
                value={form.role}
                onChange={(event) =>
                  setForm((prev) => ({
                    ...prev,
                    role: event.target.value as Extract<AccessRole, 'ADMIN' | 'STAFF'>,
                  }))
                }
                className="input-ui"
              >
                <option value="ADMIN">ADMIN</option>
                <option value="STAFF">STAFF</option>
              </select>
              <select
                value={form.tenantId}
                onChange={(event) => setForm((prev) => ({ ...prev, tenantId: event.target.value }))}
                className="input-ui"
              >
                <option value="">Filiale waehlen</option>
                {tenants.map((tenant) => (
                  <option key={tenant.id} value={tenant.id}>
                    {tenant.name}
                  </option>
                ))}
              </select>
            </div>
            <button
              type="button"
              className="mt-4 rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
              onClick={handleCreateUser}
              disabled={isSaving}
            >
              {isSaving ? 'Speichere...' : 'Benutzer erstellen'}
            </button>
          </section>
          ) : null}

          {visibleSectionIds.includes('users-and-packages') ? (
          <section className="grid gap-6 xl:grid-cols-[1.2fr_1fr]">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <h2 className="text-xl font-semibold">Benutzer in deiner Kette</h2>
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[760px] border-collapse">
                  <thead>
                    <tr>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Name
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Rolle
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        E-Mail
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Filiale
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Aktionen
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    {users.map((user) => {
                      const selected = selectedUserId === user.id
                      const selectedForEdit = editForm?.id === user.id
                      const tenantName = tenants.find((entry) => entry.id === user.tenantId)?.name || '-'
                      const selectable = manageableUsers.some((entry) => entry.id === user.id)

                      return (
                        <tr
                          key={user.id}
                          className={selectedForEdit ? 'bg-amber-50' : selected ? 'bg-orange-50' : undefined}
                        >
                          <td className="border-t border-slate-100 px-3 py-2 text-sm">{user.name}</td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm">{user.role}</td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm">{user.email}</td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm">{tenantName}</td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm">
                            <div className="flex flex-wrap gap-2">
                              {selectable ? (
                                <>
                                  <button
                                    type="button"
                                    className="rounded-lg bg-slate-700 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-600"
                                    onClick={() =>
                                      setEditForm({
                                        id: user.id,
                                        name: user.name,
                                        role: user.role as Extract<AccessRole, 'ADMIN' | 'STAFF'>,
                                        isActive: user.isActive,
                                        password: '',
                                      })
                                    }
                                  >
                                    Bearbeiten
                                  </button>
                                  <button
                                    type="button"
                                    className={`rounded-lg px-3 py-1.5 text-xs font-medium text-white ${
                                      selected ? 'bg-orange-600' : 'bg-slate-900 hover:bg-slate-800'
                                    }`}
                                    onClick={() => {
                                      setSelectedUserId(user.id)
                                      void loadUserPermissions(token, user.id)
                                    }}
                                  >
                                    {selected ? 'Ausgewaehlt' : 'Pakete'}
                                  </button>
                                  <button
                                    type="button"
                                    className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-60"
                                    disabled={isSaving || session?.userId === user.id}
                                    onClick={() => void handleDeleteUser(user)}
                                  >
                                    Loeschen
                                  </button>
                                </>
                              ) : (
                                <span className="text-xs text-slate-400">Nicht paketbasiert</span>
                              )}
                            </div>
                          </td>
                        </tr>
                      )
                    })}
                  </tbody>
                </table>
              </div>
            </article>

            <div className="grid gap-6">
              <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
                <h2 className="text-xl font-semibold">Benutzer bearbeiten</h2>
                {!editForm ? (
                  <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                    Waehle links einen Admin/Staff auf Bearbeiten.
                  </p>
                ) : (
                  <div className="mt-3 space-y-3">
                    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
                      <p className="text-sm font-semibold text-[var(--brand-ink)]">{editableUser?.email || '-'}</p>
                    </div>
                    <input
                      value={editForm.name}
                      onChange={(event) => setEditForm((current) => (current ? { ...current, name: event.target.value } : current))}
                      placeholder="Name"
                      className="input-ui"
                    />
                    <select
                      value={editForm.role}
                      onChange={(event) =>
                        setEditForm((current) =>
                          current
                            ? {
                                ...current,
                                role: event.target.value as Extract<AccessRole, 'ADMIN' | 'STAFF'>,
                              }
                            : current
                        )
                      }
                      className="input-ui"
                    >
                      <option value="ADMIN">ADMIN</option>
                      <option value="STAFF">STAFF</option>
                    </select>
                    <label className="flex items-center gap-2 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
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
                      value={editForm.password}
                      type="password"
                      onChange={(event) => setEditForm((current) => (current ? { ...current, password: event.target.value } : current))}
                      placeholder="Neues Passwort (optional)"
                      className="input-ui"
                    />
                    <div className="flex gap-2">
                      <button
                        type="button"
                        className="flex-1 rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
                        onClick={handleSaveEditedUser}
                        disabled={isSaving}
                      >
                        {isSaving ? 'Speichere...' : 'Aenderungen speichern'}
                      </button>
                      <button
                        type="button"
                        className="rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2.5 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                        onClick={() => setEditForm(null)}
                      >
                        Abbrechen
                      </button>
                    </div>
                  </div>
                )}
              </article>

              <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
                <h2 className="text-xl font-semibold">Paketfreigabe</h2>
                {!selectedUser ? (
                  <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                    Waehle links einen Benutzer aus.
                  </p>
                ) : (
                  <div className="mt-3 space-y-3">
                    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
                      <p className="text-sm font-semibold text-[var(--brand-ink)]">{selectedUser.name}</p>
                      <p className="text-xs text-rose-900/75">
                        {selectedUser.role} | {selectedUser.email}
                      </p>
                    </div>

                    {isLoadingPackages ? (
                      <p className="text-sm text-rose-900/70">Lade Pakete...</p>
                    ) : (
                      <div className="space-y-2">
                        <div className="grid gap-2 sm:grid-cols-3">
                          <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs text-rose-900/80">
                            Ausgewaehlte Pakete: <span className="font-semibold">{selectedPackageIds.length}</span>
                          </div>
                          <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs text-rose-900/80">
                            Effektive Rechte: <span className="font-semibold">{previewPermissions.length}</span>
                          </div>
                          <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs text-rose-900/80">
                            Sichtbare Pakete: <span className="font-semibold">{filteredPackages.length}</span>
                          </div>
                        </div>
                        <div className="flex flex-wrap gap-2">
                          <button
                            type="button"
                            className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                            onClick={enableAllPackages}
                          >
                            Alle freigeben
                          </button>
                          <button
                            type="button"
                            className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                            onClick={disableAllPackages}
                          >
                            Alle entziehen
                          </button>
                        </div>
                        <input
                          value={packageFilter}
                          onChange={(event) => setPackageFilter(event.target.value)}
                          placeholder="Pakete oder Rechte suchen..."
                          className="input-ui"
                        />
                        {filteredPackages.map((entry) => {
                          const checked = selectedPackageIds.includes(entry.id)
                          return (
                            <label
                              key={entry.id}
                              className={`block rounded-2xl border px-3 py-3 transition ${
                                checked
                                  ? 'border-emerald-300 bg-emerald-50'
                                  : 'border-[var(--brand-border)] bg-rose-50 text-rose-900/70'
                              }`}
                            >
                              <div className="flex items-start gap-3">
                                <input
                                  type="checkbox"
                                  checked={checked}
                                  onChange={(event) => togglePackage(entry.id, event.target.checked)}
                                  className="mt-1"
                                />
                                <div className="w-full">
                                  <p className={`text-sm font-semibold ${checked ? 'text-[var(--brand-ink)]' : 'text-rose-900/70'}`}>
                                    {entry.name}
                                  </p>
                                  <p className={`text-xs ${checked ? 'text-rose-900/75' : 'text-rose-900/70'}`}>
                                    {entry.description}
                                  </p>
                                  <div className="mt-2 flex flex-wrap gap-1.5">
                                    {entry.permissions.map((permission) => (
                                      <span
                                        key={`${entry.id}-${permission}`}
                                        className={`rounded-full border px-2 py-0.5 text-[11px] ${
                                          checked
                                            ? 'border-emerald-200 bg-white text-emerald-800'
                                            : 'border-[var(--brand-border)] bg-slate-200 text-rose-900/70'
                                        }`}
                                      >
                                        {formatAccessPermission(permission)}
                                      </span>
                                    ))}
                                  </div>
                                </div>
                              </div>
                            </label>
                          )
                        })}
                        {filteredPackages.length === 0 ? (
                          <p className="rounded-xl border border-dashed border-[var(--brand-border)] bg-white px-3 py-3 text-xs text-rose-900/70">
                            Kein Paket passt zur Suche.
                          </p>
                        ) : null}
                      </div>
                    )}

                    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
                      <p className="text-xs uppercase tracking-wide text-rose-900/70">
                        Rechte-Vorschau
                      </p>
                      <p className="mt-1 text-xs text-rose-900/85">
                        {previewPermissions.length > 0
                          ? previewPermissions.map((permission) => formatAccessPermission(permission)).join(', ')
                          : 'Keine Rechte aktiv'}
                      </p>
                      <p className="mt-1 text-[11px] text-rose-900/70">
                        Gespeichert: {selectedUserPermissions.length} | Ausgewaehlt: {selectedPackageIds.length}
                      </p>
                    </div>

                    <button
                      type="button"
                      className="w-full rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
                      disabled={isSavingPackages || isLoadingPackages}
                      onClick={handleSavePackages}
                    >
                      {isSavingPackages ? 'Speichere Pakete...' : 'Pakete speichern'}
                    </button>
                  </div>
                )}
              </article>
            </div>
          </section>
          ) : null}
        </div>
      )}

    </BackofficeLayout>
  )
}


