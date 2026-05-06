'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  downloadCashClosingDailyPdf,
  getCashClosingMonthly,
  getManagedTenants,
  type CashClosingMonthlyResponse,
  type ManagedTenant,
} from '@/lib/api'

type SessionShape = {
  role?: string
  tenantId?: string | null
  accessToken?: string
}

function currentMonthIso() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

function money(value: number) {
  return `${value.toFixed(2)} EUR`
}

export default function AdminClosingsArchivePage() {
  const [role, setRole] = useState('admin')
  const [token, setToken] = useState('')
  const [sessionReady, setSessionReady] = useState(false)
  const [month, setMonth] = useState(currentMonthIso())
  const [tenantId, setTenantId] = useState('')
  const [tenants, setTenants] = useState<ManagedTenant[]>([])
  const [data, setData] = useState<CashClosingMonthlyResponse | null>(null)
  const [search, setSearch] = useState('')
  const [statusFilter, setStatusFilter] = useState<'ALL' | 'SUBMITTED' | 'APPROVED' | 'RETURNED'>('ALL')
  const [isLoading, setIsLoading] = useState(true)
  const [downloadingDate, setDownloadingDate] = useState<string | null>(null)
  const [error, setError] = useState('')

  const showTenantSelect = role === 'superadmin' || role === 'chainadmin'
  const selectedTenantId = showTenantSelect
    ? (tenantId || data?.tenantId || tenants[0]?.id || '')
    : undefined

  useEffect(() => {
    try {
      const raw = localStorage.getItem('sessionUser')
      const parsed = raw ? (JSON.parse(raw) as SessionShape) : null
      setRole((parsed?.role || 'admin').toLowerCase())
      setTenantId(parsed?.tenantId || '')
      setToken(parsed?.accessToken || localStorage.getItem('accessToken') || '')
    } catch {
      setToken(localStorage.getItem('accessToken') || '')
    } finally {
      setSessionReady(true)
    }
  }, [])

  useEffect(() => {
    async function loadTenants() {
      if (!token) return
      try {
        const loaded = await getManagedTenants(token)
        setTenants(loaded)
      } catch {
        // optional
      }
    }
    void loadTenants()
  }, [token])

  useEffect(() => {
    if (!showTenantSelect) {
      return
    }
    if (!tenantId && tenants[0]?.id) {
      setTenantId(tenants[0].id)
    }
  }, [showTenantSelect, tenantId, tenants])

  useEffect(() => {
    async function loadData() {
      if (!sessionReady) return
      if (!month) return
      if (showTenantSelect && !selectedTenantId) {
        setIsLoading(false)
        setData(null)
        setError('')
        return
      }
      try {
        setIsLoading(true)
        setError('')
        const loaded = await getCashClosingMonthly({
          month,
          tenantId: selectedTenantId,
        })
        setData(loaded)
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Abschlussarchiv konnte nicht geladen werden')
        setData(null)
      } finally {
        setIsLoading(false)
      }
    }
    void loadData()
  }, [month, selectedTenantId, showTenantSelect, sessionReady])

  const filteredDays = useMemo(() => {
    if (!data) return []
    const normalizedSearch = search.trim().toLowerCase()
    return data.days.filter((entry) => {
      if (statusFilter !== 'ALL' && entry.status !== statusFilter) return false
      if (!normalizedSearch) return true
      const submitted = new Date(entry.submittedAt).toLocaleString('de-DE').toLowerCase()
      return (
        entry.closingDate.toLowerCase().includes(normalizedSearch) ||
        entry.status.toLowerCase().includes(normalizedSearch) ||
        submitted.includes(normalizedSearch)
      )
    })
  }, [data, search, statusFilter])

  async function handleDownloadDailyPdf(closingDate: string) {
    try {
      setDownloadingDate(closingDate)
      setError('')
      const response = await downloadCashClosingDailyPdf({
        date: closingDate,
        tenantId: selectedTenantId,
      })
      const blobUrl = URL.createObjectURL(response.blob)
      const link = document.createElement('a')
      link.href = blobUrl
      link.download = response.fileName
      document.body.appendChild(link)
      link.click()
      link.remove()
      URL.revokeObjectURL(blobUrl)
    } catch (downloadError) {
      setError(downloadError instanceof Error ? downloadError.message : 'PDF konnte nicht geladen werden')
    } finally {
      setDownloadingDate(null)
    }
  }

  return (
    <AdminLayout
      title="Abschlussarchiv"
      subtitle="Historische Abschluesse suchen, filtern und schnell zur Tagesansicht springen"
    >
      {error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}

      <section className="mb-5 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="grid gap-3 md:grid-cols-4">
          {showTenantSelect ? (
            <label className="block">
              <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Filiale</span>
              <select value={tenantId} onChange={(event) => setTenantId(event.target.value)} className="input-ui">
                <option value="">Filiale waehlen</option>
                {tenants.map((entry) => (
                  <option key={entry.id} value={entry.id}>
                    {entry.name}
                  </option>
                ))}
              </select>
            </label>
          ) : null}
          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Monat</span>
            <input type="month" value={month} onChange={(event) => setMonth(event.target.value)} className="input-ui" />
          </label>
          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Suche</span>
            <input
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              className="input-ui"
              placeholder="Datum oder Status"
            />
          </label>
          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Status</span>
            <select
              value={statusFilter}
              onChange={(event) =>
                setStatusFilter(event.target.value as 'ALL' | 'SUBMITTED' | 'APPROVED' | 'RETURNED')
              }
              className="input-ui"
            >
              <option value="ALL">Alle</option>
              <option value="SUBMITTED">Eingereicht</option>
              <option value="APPROVED">Freigegeben</option>
              <option value="RETURNED">Zurueckgewiesen</option>
            </select>
          </label>
        </div>
      </section>

      {isLoading ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/70">Lade Abschlussarchiv...</p>
        </section>
      ) : data ? (
        <div className="grid gap-5">
          <section className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Treffer</p>
              <p className="mt-2 text-2xl font-bold text-[var(--brand-ink)]">{filteredDays.length}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Bestellungen (Monat)</p>
              <p className="mt-2 text-2xl font-bold text-[var(--brand-ink)]">{data.totals.orderCount}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Umsatz gesamt (Monat)</p>
              <p className="mt-2 text-2xl font-bold text-emerald-700">{money(data.totals.grossTotal)}</p>
            </article>
            <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Bar bezahlt (Monat)</p>
              <p className="mt-2 text-2xl font-bold text-sky-700">{money(data.totals.paidCashTotal)}</p>
            </article>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold text-[var(--brand-ink)]">Tagesabschluesse</h2>
            {filteredDays.length === 0 ? (
              <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                Keine passenden Abschluesse gefunden.
              </p>
            ) : (
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[760px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Tag</th>
                      <th className="th-ui">Einreichung</th>
                      <th className="th-ui">Status</th>
                      <th className="th-ui">Review</th>
                      <th className="th-ui">Aktion</th>
                    </tr>
                  </thead>
                  <tbody>
                    {filteredDays.map((entry) => (
                      <tr key={entry.submissionId}>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.closingDate}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          {new Date(entry.submittedAt).toLocaleString('de-DE')}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.status}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          {entry.review
                            ? `${entry.review.decision || '-'} (${new Date(entry.review.createdAt).toLocaleString('de-DE')})`
                            : '-'}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <div className="flex flex-wrap items-center gap-2">
                            <Link
                              href={`/admin/closings/daily?date=${entry.closingDate}`}
                              className="rounded-lg border border-[var(--brand-border)] px-2 py-1 text-xs font-semibold text-rose-900/85 hover:bg-rose-50"
                            >
                              Tag oeffnen
                            </Link>
                            <button
                              type="button"
                              onClick={() => void handleDownloadDailyPdf(entry.closingDate)}
                              disabled={downloadingDate === entry.closingDate}
                              className="rounded-lg bg-slate-900 px-2 py-1 text-xs font-semibold text-white hover:bg-slate-800 disabled:opacity-60"
                            >
                              {downloadingDate === entry.closingDate ? 'PDF...' : 'PDF laden'}
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </section>
        </div>
      ) : null}
    </AdminLayout>
  )
}
