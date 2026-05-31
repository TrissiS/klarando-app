'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  getAccessContext,
  getAccessUsers,
  getStoredAccessToken,
  type AccessContext,
  type AccessUser,
} from '@/lib/api'

function formatDate(value: string | null) {
  if (!value) return '-'
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) return value
  return parsed.toLocaleString('de-DE')
}

export default function SuperadminBusinessDataPage() {
  const [token, setToken] = useState('')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [copyInfo, setCopyInfo] = useState('')
  const [users, setUsers] = useState<AccessUser[]>([])
  const [searchTenantId, setSearchTenantId] = useState('')
  const [searchAdminEmail, setSearchAdminEmail] = useState('')
  const [searchBranchName, setSearchBranchName] = useState('')

  async function copyValue(value: string, label: string) {
    try {
      await navigator.clipboard.writeText(value)
      setCopyInfo(`${label} kopiert`)
      window.setTimeout(() => setCopyInfo(''), 1800)
    } catch {
      setCopyInfo(`Kopieren fehlgeschlagen (${label})`)
      window.setTimeout(() => setCopyInfo(''), 2200)
    }
  }

  useEffect(() => {
    setToken(getStoredAccessToken() || '')
  }, [])

  useEffect(() => {
    if (!token) {
      setError('Kein Backend-Token gefunden. Bitte neu einloggen.')
      setLoading(false)
      return
    }

    let active = true
    ;(async () => {
      try {
        setLoading(true)
        setError('')
        const [payload, loadedUsers] = await Promise.all([getAccessContext(token), getAccessUsers(token)])
        if (!active) return
        setContext(payload)
        setUsers(loadedUsers)
      } catch (loadError) {
        if (!active) return
        setError(loadError instanceof Error ? loadError.message : 'Unternehmensübersicht konnte nicht geladen werden.')
      } finally {
        if (active) setLoading(false)
      }
    })()

    return () => {
      active = false
    }
  }, [token])

  const chainNameById = useMemo(
    () => new Map((context?.chains || []).map((entry) => [entry.id, entry.name])),
    [context]
  )

  const primaryAdminByChainId = useMemo(() => {
    const map = new Map<string, AccessUser>()
    for (const user of users) {
      if (!user.chainId) continue
      if (user.role !== 'CHAINADMIN' && user.role !== 'ADMIN') continue
      const existing = map.get(user.chainId)
      if (!existing || new Date(user.createdAt).getTime() < new Date(existing.createdAt).getTime()) {
        map.set(user.chainId, user)
      }
    }
    return map
  }, [users])

  const adminByTenantId = useMemo(() => {
    const map = new Map<string, AccessUser>()
    for (const user of users) {
      if (!user.tenantId) continue
      if (user.role !== 'ADMIN' && user.role !== 'CHAINADMIN') continue
      const existing = map.get(user.tenantId)
      if (!existing || new Date(user.createdAt).getTime() < new Date(existing.createdAt).getTime()) {
        map.set(user.tenantId, user)
      }
    }
    return map
  }, [users])

  const filteredTenants = useMemo(() => {
    const byTenant = searchTenantId.trim().toLowerCase()
    const byEmail = searchAdminEmail.trim().toLowerCase()
    const byBranch = searchBranchName.trim().toLowerCase()
    return (context?.tenants || []).filter((tenant) => {
      const admin = adminByTenantId.get(tenant.id)
      const tenantMatch = byTenant.length === 0 || tenant.id.toLowerCase().includes(byTenant)
      const emailMatch =
        byEmail.length === 0 || (admin?.email || '').toLowerCase().includes(byEmail)
      const branchMatch = byBranch.length === 0 || tenant.name.toLowerCase().includes(byBranch)
      return tenantMatch && emailMatch && branchMatch
    })
  }, [context, adminByTenantId, searchTenantId, searchAdminEmail, searchBranchName])

  const activeTenants = useMemo(() => (context?.tenants || []).length, [context])

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Unternehmen & Filialen"
      subtitle="Zentrale Übersicht aller Unternehmen und Filialen"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-4">
        {error ? (
          <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div>
        ) : null}
        {copyInfo ? (
          <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{copyInfo}</div>
        ) : null}

        <section className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Unternehmen</p>
            <p className="mt-1 text-2xl font-bold text-[var(--brand-ink)]">{context?.chains.length || 0}</p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Filialen gesamt</p>
            <p className="mt-1 text-2xl font-bold text-[var(--brand-ink)]">{context?.tenants.length || 0}</p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Filialen aktiv</p>
            <p className="mt-1 text-2xl font-bold text-emerald-700">{activeTenants}</p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Status</p>
            <p className="mt-1 text-sm font-semibold text-[var(--brand-ink)]">
              {loading ? 'Lade Daten...' : 'Aktuell'}
            </p>
          </article>
        </section>

        <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
          <h2 className="mb-3 text-lg font-semibold text-[var(--brand-ink)]">Unternehmen</h2>
          <div className="overflow-x-auto">
            <table className="min-w-full text-left text-sm">
              <thead>
                <tr className="border-b border-slate-200 text-slate-500">
                  <th className="px-2 py-2">Name</th>
                  <th className="px-2 py-2">chainId</th>
                  <th className="px-2 py-2">tenantId (erste Filiale)</th>
                  <th className="px-2 py-2">Primäre Admin-E-Mail</th>
                  <th className="px-2 py-2">Status</th>
                </tr>
              </thead>
              <tbody>
                {(context?.chains || []).map((chain) => {
                  const firstTenant = (context?.tenants || []).find((tenant) => tenant.chainId === chain.id)
                  const primaryAdmin = primaryAdminByChainId.get(chain.id)
                  return (
                    <tr key={chain.id} className="border-b border-slate-100">
                      <td className="px-2 py-2">{chain.name}</td>
                      <td className="px-2 py-2 font-mono text-xs">{chain.id}</td>
                      <td className="px-2 py-2 font-mono text-xs">{firstTenant?.id || '-'}</td>
                      <td className="px-2 py-2">{primaryAdmin?.email || '-'}</td>
                      <td className="px-2 py-2">{(chain.status || 'ACTIVE') === 'ACTIVE' ? 'aktiv' : 'inaktiv'}</td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        </section>

        <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
          <h2 className="mb-3 text-lg font-semibold text-[var(--brand-ink)]">Filialen / Mandanten</h2>
          <div className="mb-3 grid gap-2 sm:grid-cols-3">
            <input
              value={searchTenantId}
              onChange={(event) => setSearchTenantId(event.target.value)}
              placeholder="Suche nach Tenant-ID"
              className="rounded-lg border border-slate-200 px-3 py-2 text-sm"
            />
            <input
              value={searchAdminEmail}
              onChange={(event) => setSearchAdminEmail(event.target.value)}
              placeholder="Suche nach Admin-E-Mail"
              className="rounded-lg border border-slate-200 px-3 py-2 text-sm"
            />
            <input
              value={searchBranchName}
              onChange={(event) => setSearchBranchName(event.target.value)}
              placeholder="Suche nach Filialname"
              className="rounded-lg border border-slate-200 px-3 py-2 text-sm"
            />
          </div>
          <div className="overflow-x-auto">
            <table className="min-w-full text-left text-sm">
              <thead>
                <tr className="border-b border-slate-200 text-slate-500">
                  <th className="px-2 py-2">Filialname</th>
                  <th className="px-2 py-2">tenantId</th>
                  <th className="px-2 py-2">branchId</th>
                  <th className="px-2 py-2">Adresse</th>
                  <th className="px-2 py-2">Admin-Benutzer</th>
                  <th className="px-2 py-2">DB/Schema</th>
                  <th className="px-2 py-2">createdAt</th>
                  <th className="px-2 py-2">updatedAt</th>
                  <th className="px-2 py-2">Aktionen</th>
                </tr>
              </thead>
              <tbody>
                {!loading && filteredTenants.length === 0 ? (
                  <tr>
                    <td colSpan={9} className="px-2 py-3 text-slate-500">
                      Keine Unternehmen/Filialen gefunden.
                    </td>
                  </tr>
                ) : null}
                {filteredTenants.map((tenant) => (
                  <tr key={tenant.id} className="border-b border-slate-100">
                    <td className="px-2 py-2">{tenant.name}</td>
                    <td className="px-2 py-2">
                      <div className="flex items-center gap-2">
                        <span className="font-mono text-xs">{tenant.id}</span>
                        <button
                          type="button"
                          onClick={() => void copyValue(tenant.id, 'tenantId')}
                          className="rounded border border-slate-200 px-2 py-0.5 text-[11px] font-semibold text-slate-700"
                        >
                          Copy
                        </button>
                      </div>
                    </td>
                    <td className="px-2 py-2">
                      <div className="flex items-center gap-2">
                        <span className="font-mono text-xs">{tenant.id}</span>
                        <button
                          type="button"
                          onClick={() => void copyValue(tenant.id, 'branchId')}
                          className="rounded border border-slate-200 px-2 py-0.5 text-[11px] font-semibold text-slate-700"
                        >
                          Copy
                        </button>
                      </div>
                    </td>
                    <td className="px-2 py-2">{tenant.addressLine || '-'}</td>
                    <td className="px-2 py-2">
                      {adminByTenantId.get(tenant.id)?.email || adminByTenantId.get(tenant.id)?.name || '-'}
                    </td>
                    <td className="px-2 py-2">
                      shared database
                    </td>
                    <td className="px-2 py-2">{formatDate(tenant.createdAt ?? null)}</td>
                    <td className="px-2 py-2">{formatDate(tenant.updatedAt ?? null)}</td>
                    <td className="px-2 py-2">
                      <div className="flex gap-2">
                        <Link
                          href={`/superadmin/app-settings?tab=stammdaten&tenantId=${tenant.id}`}
                          className="rounded-lg bg-slate-100 px-2 py-1 text-xs font-semibold text-slate-700"
                        >
                          Öffnen
                        </Link>
                        <Link
                          href={`/superadmin/app-settings?tab=stammdaten&tenantId=${tenant.id}`}
                          className="rounded-lg bg-orange-100 px-2 py-1 text-xs font-semibold text-orange-800"
                        >
                          Bearbeiten
                        </Link>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          <p className="mt-2 text-xs text-slate-500">
            Hinweis: Aktuell läuft Klarando im Shared-Database-Modell. branchId wird derzeit als tenantId geführt.
            Unternehmen: {chainNameById.size}, Filialen gefiltert: {filteredTenants.length}
          </p>
        </section>
      </div>
    </BackofficeLayout>
  )
}
