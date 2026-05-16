'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  getAccessContext,
  getAccessUserPermissions,
  getAccessUsers,
  updateAccessUser,
  updateAccessUserPermissions,
  type AccessContext,
  type AccessPermission,
  type AccessRole,
  type AccessUser,
} from '@/lib/api'
import { formatAccessPermission } from '@/lib/access-packages'
import type { SessionUser } from '@/lib/app-data'

type SecurityTab = 'USERS' | 'DETAILS' | 'RIGHTS' | 'INVITES'

const TABS: Array<{ key: SecurityTab; label: string }> = [
  { key: 'USERS', label: 'Benutzer' },
  { key: 'DETAILS', label: 'Benutzer-Detail' },
  { key: 'RIGHTS', label: 'Rechte' },
  { key: 'INVITES', label: 'Einladungen' },
]

function formatDateTime(value: string | null) {
  if (!value) return '-'
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) return '-'
  return parsed.toLocaleString('de-DE')
}

function permissionGroupLabel(permission: AccessPermission) {
  if (permission.startsWith('ORDERS_')) return 'Bestellungen'
  if (permission.startsWith('PRODUCTS_')) return 'Produkte'
  if (permission.startsWith('DRIVERS_') || permission.startsWith('DELIVERY_')) return 'Fahrer'
  if (permission.startsWith('DISPLAYS_') || permission.startsWith('SCREEN_')) return 'Displays'
  if (permission.startsWith('FINANCE_') || permission.startsWith('BILLING_')) return 'Finanzen'
  if (permission.startsWith('SETTINGS_')) return 'Einstellungen'
  return 'Weitere'
}

export default function SuperadminSecurityPage() {
  const [token, setToken] = useState('')
  const [tab, setTab] = useState<SecurityTab>('USERS')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [users, setUsers] = useState<AccessUser[]>([])
  const [query, setQuery] = useState('')
  const [chainId, setChainId] = useState('')
  const [tenantId, setTenantId] = useState('')
  const [roleFilter, setRoleFilter] = useState<'ALL' | AccessRole>('ALL')
  const [statusFilter, setStatusFilter] = useState<'ALL' | 'ACTIVE' | 'INACTIVE'>('ALL')
  const [selectedUserId, setSelectedUserId] = useState('')
  const [selectedPermissions, setSelectedPermissions] = useState<AccessPermission[]>([])
  const [saving, setSaving] = useState(false)
  const [loading, setLoading] = useState(true)
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
      try {
        setLoading(true)
        const [loadedContext, loadedUsers] = await Promise.all([
          getAccessContext(token),
          getAccessUsers(token),
        ])
        setContext(loadedContext)
        setUsers(loadedUsers)
        setChainId(loadedContext.chains[0]?.id || '')
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Benutzerdaten konnten nicht geladen werden.')
      } finally {
        setLoading(false)
      }
    })()
  }, [token])

  const filteredTenants = useMemo(() => {
    if (!context) return []
    if (!chainId) return context.tenants
    return context.tenants.filter((entry) => entry.chainId === chainId)
  }, [context, chainId])

  const filteredUsers = useMemo(() => {
    const q = query.trim().toLowerCase()
    return users
      .filter((entry) => (chainId ? entry.chainId === chainId : true))
      .filter((entry) => (tenantId ? entry.tenantId === tenantId : true))
      .filter((entry) => (roleFilter === 'ALL' ? true : entry.role === roleFilter))
      .filter((entry) => (statusFilter === 'ALL' ? true : statusFilter === 'ACTIVE' ? entry.isActive : !entry.isActive))
      .filter((entry) => !q || `${entry.name} ${entry.email}`.toLowerCase().includes(q))
  }, [users, query, chainId, tenantId, roleFilter, statusFilter])

  const selectedUser = useMemo(
    () => users.find((entry) => entry.id === selectedUserId) || null,
    [users, selectedUserId]
  )

  const stats = useMemo(() => {
    const active = filteredUsers.filter((entry) => entry.isActive).length
    const inactive = filteredUsers.length - active
    const roles = new Set(filteredUsers.map((entry) => entry.role))
    return {
      total: filteredUsers.length,
      active,
      inactive,
      roleCount: roles.size,
    }
  }, [filteredUsers])

  const groupedPermissions = useMemo(() => {
    const map = new Map<string, AccessPermission[]>()
    for (const permission of selectedPermissions) {
      const key = permissionGroupLabel(permission)
      const list = map.get(key) || []
      list.push(permission)
      map.set(key, list)
    }
    return Array.from(map.entries()).map(([label, permissions]) => ({
      label,
      permissions: permissions.sort((a, b) =>
        formatAccessPermission(a).localeCompare(formatAccessPermission(b), 'de-DE')
      ),
    }))
  }, [selectedPermissions])

  async function loadUserPermissions(userId: string) {
    if (!token || !userId) return
    try {
      const response = await getAccessUserPermissions(token, userId)
      setSelectedPermissions(response.permissions)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rechte konnten nicht geladen werden.')
    }
  }

  async function handleToggleUserActive(active: boolean) {
    if (!token || !selectedUser) return
    try {
      setSaving(true)
      await updateAccessUser(token, selectedUser.id, { isActive: active })
      const refreshed = await getAccessUsers(token)
      setUsers(refreshed)
      setInfo(active ? 'Benutzer wurde aktiviert.' : 'Benutzer wurde deaktiviert.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Benutzerstatus konnte nicht geändert werden.')
    } finally {
      setSaving(false)
    }
  }

  async function handleRoleChange(role: AccessRole) {
    if (!token || !selectedUser) return
    try {
      setSaving(true)
      await updateAccessUser(token, selectedUser.id, { role })
      const refreshed = await getAccessUsers(token)
      setUsers(refreshed)
      setInfo('Rolle wurde aktualisiert.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rolle konnte nicht geändert werden.')
    } finally {
      setSaving(false)
    }
  }

  async function savePermissions() {
    if (!token || !selectedUser) return
    try {
      setSaving(true)
      await updateAccessUserPermissions(token, selectedUser.id, selectedPermissions)
      setInfo('Individuelle Rechte wurden gespeichert.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Rechte konnten nicht gespeichert werden.')
    } finally {
      setSaving(false)
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Benutzer & Rechte"
      subtitle="Benutzer, Rollen und individuelle Rechte – ohne Paket-/Gebührenverwaltung"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="mx-auto w-full max-w-[1700px] space-y-5">
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
        {info ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{info}</div> : null}

        <section className="grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
          <StatCard label="Benutzer gesamt" value={stats.total.toString()} />
          <StatCard label="Aktiv" value={stats.active.toString()} tone="emerald" />
          <StatCard label="Inaktiv" value={stats.inactive.toString()} tone="slate" />
          <StatCard label="Rollen im Filter" value={stats.roleCount.toString()} tone="amber" />
        </section>

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <div className="grid gap-3 lg:grid-cols-5">
            <input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Benutzer suchen…" className="rounded-xl border border-[var(--brand-border)] px-3 py-2.5 text-sm outline-none transition focus:border-slate-400" />
            <select value={chainId} onChange={(event) => setChainId(event.target.value)} className="rounded-xl border border-[var(--brand-border)] px-3 py-2.5 text-sm">
              <option value="">Alle Unternehmen</option>
              {(context?.chains || []).map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
            </select>
            <select value={tenantId} onChange={(event) => setTenantId(event.target.value)} className="rounded-xl border border-[var(--brand-border)] px-3 py-2.5 text-sm">
              <option value="">Alle Filialen</option>
              {filteredTenants.map((entry) => <option key={entry.id} value={entry.id}>{entry.name}</option>)}
            </select>
            <select value={roleFilter} onChange={(event) => setRoleFilter(event.target.value as 'ALL' | AccessRole)} className="rounded-xl border border-[var(--brand-border)] px-3 py-2.5 text-sm">
              <option value="ALL">Alle Rollen</option>
              <option value="ADMIN">Admin</option>
              <option value="CHAINADMIN">Chainadmin</option>
              <option value="SUPERADMIN">Superadmin</option>
              <option value="STAFF">Mitarbeiter</option>
            </select>
            <select value={statusFilter} onChange={(event) => setStatusFilter(event.target.value as 'ALL' | 'ACTIVE' | 'INACTIVE')} className="rounded-xl border border-[var(--brand-border)] px-3 py-2.5 text-sm">
              <option value="ALL">Alle Status</option>
              <option value="ACTIVE">Aktiv</option>
              <option value="INACTIVE">Inaktiv</option>
            </select>
          </div>
          <div className="mt-4 flex flex-wrap gap-2">
            {TABS.map((entry) => (
              <button key={entry.key} type="button" onClick={() => setTab(entry.key)} className={`rounded-xl px-3 py-2 text-sm font-medium transition ${tab === entry.key ? 'bg-slate-900 text-white shadow-sm' : 'border border-[var(--brand-border)] bg-white text-slate-700 hover:bg-slate-50'}`}>
                {entry.label}
              </button>
            ))}
          </div>
          <div className="mt-3 rounded-2xl border border-blue-200 bg-blue-50 px-3 py-2 text-xs text-blue-900">
            Module und Pakete werden unter <strong>Modulfreigaben</strong> verwaltet. Gebühren und Provisionen liegen unter <strong>Gebühren & Provisionen</strong>.
          </div>
        </section>

        <section className="grid gap-4 xl:grid-cols-[minmax(460px,1fr)_minmax(560px,1.35fr)]">
          <article className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            <div className="flex items-center justify-between gap-2">
              <h2 className="text-base font-semibold text-[var(--brand-ink)]">Benutzerliste</h2>
              <span className="rounded-full bg-slate-100 px-2.5 py-1 text-xs font-medium text-slate-700">{filteredUsers.length} Treffer</span>
            </div>
            <div className="mt-3 overflow-hidden rounded-2xl border border-[var(--brand-border)]">
              <div className="grid grid-cols-[2fr_2fr_1fr_1fr] bg-slate-50 px-3 py-2 text-[11px] font-semibold uppercase tracking-wide text-slate-500">
                <span>Name</span>
                <span>E-Mail</span>
                <span>Rolle</span>
                <span>Status</span>
              </div>
              <div className="max-h-[620px] overflow-auto">
                {filteredUsers.map((entry) => (
                  <button
                    key={entry.id}
                    type="button"
                    onClick={() => {
                      setSelectedUserId(entry.id)
                      void loadUserPermissions(entry.id)
                    }}
                    className={`grid w-full grid-cols-[2fr_2fr_1fr_1fr] items-center gap-2 border-t border-[var(--brand-border)] px-3 py-2.5 text-left text-sm transition first:border-t-0 ${selectedUserId === entry.id ? 'bg-orange-50' : 'bg-white hover:bg-slate-50'}`}
                  >
                    <span className="font-medium text-[var(--brand-ink)]">{entry.name}</span>
                    <span className="truncate text-slate-600">{entry.email}</span>
                    <span className="text-xs font-semibold text-slate-700">{entry.role}</span>
                    <span className={`inline-flex w-fit rounded-full px-2 py-0.5 text-[11px] font-semibold ${entry.isActive ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-200 text-slate-700'}`}>
                      {entry.isActive ? 'Aktiv' : 'Inaktiv'}
                    </span>
                  </button>
                ))}
              </div>
              {!loading && filteredUsers.length === 0 ? <p className="px-3 py-4 text-sm text-slate-600">Keine Benutzer gefunden.</p> : null}
            </div>
          </article>

          <article className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
            {!selectedUser ? (
              <p className="text-sm text-slate-600">Bitte links einen Benutzer auswählen.</p>
            ) : (
              <div className="space-y-4">
                {tab === 'DETAILS' || tab === 'USERS' ? (
                  <div className="space-y-3">
                    <h2 className="text-sm font-semibold text-[var(--brand-ink)]">Benutzer-Detail</h2>
                    <div className="grid gap-2 text-sm">
                      <InfoRow label="Name" value={selectedUser.name} />
                      <InfoRow label="E-Mail" value={selectedUser.email} />
                      <InfoRow label="Unternehmen" value={context?.chains.find((entry) => entry.id === selectedUser.chainId)?.name || '-'} />
                      <InfoRow label="Filiale" value={context?.tenants.find((entry) => entry.id === selectedUser.tenantId)?.name || '-'} />
                      <InfoRow label="Letzter Login" value={formatDateTime(((selectedUser as unknown as { lastLoginAt?: string | null }).lastLoginAt) ?? null)} />
                    </div>
                    <div className="grid gap-2 md:grid-cols-2">
                      <select
                        value={selectedUser.role}
                        onChange={(event) => void handleRoleChange(event.target.value as AccessRole)}
                        className="rounded-xl border border-[var(--brand-border)] px-3 py-2.5 text-sm"
                        disabled={saving}
                      >
                        <option value="ADMIN">Admin</option>
                        <option value="CHAINADMIN">Chainadmin</option>
                        <option value="SUPERADMIN">Superadmin</option>
                        <option value="STAFF">Mitarbeiter</option>
                      </select>
                      <button
                        type="button"
                        onClick={() => void handleToggleUserActive(!selectedUser.isActive)}
                        className="rounded-xl bg-slate-900 px-3 py-2.5 text-sm font-semibold text-white hover:bg-slate-800 disabled:opacity-60"
                        disabled={saving}
                      >
                        {selectedUser.isActive ? 'Benutzer deaktivieren' : 'Benutzer aktivieren'}
                      </button>
                    </div>
                    <div className="flex flex-wrap gap-2">
                      <button type="button" disabled className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-xs text-slate-500">
                        Passwort/Einladung erneut senden (folgt)
                      </button>
                      <button type="button" onClick={() => setTab('RIGHTS')} className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-xs text-slate-700">
                        Rechte anzeigen
                      </button>
                    </div>
                  </div>
                ) : null}

                {tab === 'RIGHTS' ? (
                  <div className="space-y-3">
                    <h2 className="text-sm font-semibold text-[var(--brand-ink)]">Individuelle Rechte</h2>
                    <div className="space-y-3">
                      {groupedPermissions.map((group) => (
                        <div key={group.label} className="rounded-2xl border border-[var(--brand-border)] p-3">
                          <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">{group.label}</p>
                          <div className="mt-2 flex flex-wrap gap-1.5">
                            {group.permissions.map((permission) => (
                              <span key={permission} className="rounded-full border border-rose-200 bg-rose-50 px-2 py-1 text-[11px] text-rose-900">
                                {formatAccessPermission(permission)}
                              </span>
                            ))}
                          </div>
                        </div>
                      ))}
                      {groupedPermissions.length === 0 ? (
                        <p className="text-sm text-slate-600">Keine individuellen Rechte gesetzt.</p>
                      ) : null}
                    </div>
                    <button
                      type="button"
                      onClick={() => void savePermissions()}
                      className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white hover:bg-slate-800 disabled:opacity-60"
                      disabled={saving}
                    >
                      Rechte speichern
                    </button>
                  </div>
                ) : null}

                {tab === 'INVITES' ? (
                  <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 px-3 py-3 text-sm text-slate-700">
                    Einladungsmanagement ist vorbereitet. Diese Seite fokussiert bewusst nur Benutzer, Rollen und individuelle Rechte.
                  </div>
                ) : null}
              </div>
            )}
          </article>
        </section>
      </div>
    </BackofficeLayout>
  )
}

function InfoRow({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/30 px-3 py-2">
      <p className="text-[11px] uppercase tracking-wide text-slate-500">{label}</p>
      <p className="text-sm font-medium text-slate-900 break-words">{value}</p>
    </div>
  )
}

function StatCard({
  label,
  value,
  tone = 'rose',
}: {
  label: string
  value: string
  tone?: 'rose' | 'emerald' | 'slate' | 'amber'
}) {
  const toneClass =
    tone === 'emerald'
      ? 'bg-emerald-50 border-emerald-200 text-emerald-900'
      : tone === 'slate'
        ? 'bg-slate-100 border-slate-200 text-slate-800'
        : tone === 'amber'
          ? 'bg-amber-50 border-amber-200 text-amber-900'
          : 'bg-rose-50 border-rose-200 text-rose-900'
  return (
    <div className={`rounded-2xl border px-4 py-3 shadow-sm ${toneClass}`}>
      <p className="text-xs font-semibold uppercase tracking-wide opacity-80">{label}</p>
      <p className="mt-1 text-2xl font-semibold leading-none">{value}</p>
    </div>
  )
}
