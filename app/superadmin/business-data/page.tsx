'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import { getAccessContext, getStoredAccessToken, type AccessContext } from '@/lib/api'

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
        const payload = await getAccessContext(token)
        if (!active) return
        setContext(payload)
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
          <h2 className="mb-3 text-lg font-semibold text-[var(--brand-ink)]">Filialübersicht</h2>
          <div className="overflow-x-auto">
            <table className="min-w-full text-left text-sm">
              <thead>
                <tr className="border-b border-slate-200 text-slate-500">
                  <th className="px-2 py-2">Unternehmen</th>
                  <th className="px-2 py-2">Unternehmens-ID</th>
                  <th className="px-2 py-2">Filiale</th>
                  <th className="px-2 py-2">Tenant-ID / Filial-ID</th>
                  <th className="px-2 py-2">Status</th>
                  <th className="px-2 py-2">Erstellt</th>
                  <th className="px-2 py-2">Aktionen</th>
                </tr>
              </thead>
              <tbody>
                {!loading && (context?.tenants.length || 0) === 0 ? (
                  <tr>
                    <td colSpan={7} className="px-2 py-3 text-slate-500">
                      Keine Unternehmen/Filialen gefunden.
                    </td>
                  </tr>
                ) : null}
                {(context?.tenants || []).map((tenant) => (
                  <tr key={tenant.id} className="border-b border-slate-100">
                    <td className="px-2 py-2">{chainNameById.get(tenant.chainId || '') || '-'}</td>
                    <td className="px-2 py-2">
                      <div className="flex items-center gap-2">
                        <span className="font-mono text-xs">{tenant.chainId || '-'}</span>
                        {tenant.chainId ? (
                          <button
                            type="button"
                            onClick={() => void copyValue(tenant.chainId || '', 'Unternehmens-ID')}
                            className="rounded border border-slate-200 px-2 py-0.5 text-[11px] font-semibold text-slate-700"
                          >
                            Copy
                          </button>
                        ) : null}
                      </div>
                    </td>
                    <td className="px-2 py-2">{tenant.name}</td>
                    <td className="px-2 py-2">
                      <div className="flex items-center gap-2">
                        <span className="font-mono text-xs">{tenant.id}</span>
                        <button
                          type="button"
                          onClick={() => void copyValue(tenant.id, 'Tenant-ID')}
                          className="rounded border border-slate-200 px-2 py-0.5 text-[11px] font-semibold text-slate-700"
                        >
                          Copy
                        </button>
                      </div>
                    </td>
                    <td className="px-2 py-2">
                      {tenant.separateDatabase?.enabled ? 'AKTIV' : 'STANDARD'}
                    </td>
                    <td className="px-2 py-2">{formatDate(tenant.createdAt ?? null)}</td>
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
        </section>
      </div>
    </BackofficeLayout>
  )
}
