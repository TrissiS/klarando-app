'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { CHAINADMIN_NAV_ITEMS } from '@/app/chainadmin/nav'
import {
  getAccessContext,
  getChainadminCashClosingQueue,
  reviewChainadminDailyClosing,
  reviewChainadminMonthlyClosing,
  reviewChainadminReopenRequest,
  type ChainadminCashClosingQueue,
  type ManagedTenant,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function currentMonthIso() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

export default function ChainadminClosingsPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [month, setMonth] = useState(currentMonthIso())
  const [tenantId, setTenantId] = useState('')
  const [tenants, setTenants] = useState<ManagedTenant[]>([])
  const [queue, setQueue] = useState<ChainadminCashClosingQueue | null>(null)
  const [isLoading, setIsLoading] = useState(true)
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || (parsed.role !== 'chainadmin' && parsed.role !== 'superadmin')) {
      window.location.href = '/'
      return
    }
    setSession(parsed)
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    async function loadContext() {
      if (!token) return
      try {
        const context = await getAccessContext(token)
        setTenants(context.tenants)
      } catch {
        // optional
      }
    }
    void loadContext()
  }, [token])

  async function loadQueue() {
    if (!token || !month) return
    try {
      setIsLoading(true)
      setError('')
      const loaded = await getChainadminCashClosingQueue(token, {
        month,
        tenantId: tenantId || undefined,
      })
      setQueue(loaded)
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Queue konnte nicht geladen werden')
      setQueue(null)
    } finally {
      setIsLoading(false)
    }
  }

  useEffect(() => {
    void loadQueue()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [token, month, tenantId])

  async function reviewDaily(submissionId: string, decision: 'APPROVED' | 'RETURNED') {
    const note = window.prompt(
      decision === 'APPROVED' ? 'Notiz zur Freigabe (optional):' : 'Grund fuer Rueckgabe (optional):'
    )
    const confirm = window.confirm(
      decision === 'APPROVED'
        ? 'Tagesabschluss jetzt freigeben?'
        : 'Tagesabschluss jetzt zurueckgeben?'
    )
    if (!confirm) return

    try {
      setIsSaving(true)
      setError('')
      setSuccess('')
      await reviewChainadminDailyClosing(token, {
        submissionId,
        decision,
        note: note || null,
      })
      setSuccess(
        decision === 'APPROVED'
          ? 'Tagesabschluss wurde freigegeben.'
          : 'Tagesabschluss wurde zurueckgegeben.'
      )
      await loadQueue()
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Bewertung fehlgeschlagen')
    } finally {
      setIsSaving(false)
    }
  }

  async function reviewReopen(requestId: string, decision: 'APPROVED' | 'REJECTED') {
    const note = window.prompt(
      decision === 'APPROVED'
        ? 'Notiz zur Wiedereroeffnung (optional):'
        : 'Grund fuer Ablehnung (optional):'
    )
    const confirm = window.confirm(
      decision === 'APPROVED'
        ? 'Wiedereroeffnung jetzt freigeben?'
        : 'Wiedereroeffnung jetzt ablehnen?'
    )
    if (!confirm) return

    try {
      setIsSaving(true)
      setError('')
      setSuccess('')
      await reviewChainadminReopenRequest(token, {
        requestId,
        decision,
        note: note || null,
      })
      setSuccess(
        decision === 'APPROVED'
          ? 'Wiedereroeffnung wurde freigegeben.'
          : 'Wiedereroeffnung wurde abgelehnt.'
      )
      await loadQueue()
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Bewertung fehlgeschlagen')
    } finally {
      setIsSaving(false)
    }
  }

  async function reviewMonthly(submissionId: string, decision: 'APPROVED' | 'RETURNED') {
    const note = window.prompt(
      decision === 'APPROVED' ? 'Notiz zur Freigabe (optional):' : 'Grund fuer Rueckgabe (optional):'
    )
    const confirm = window.confirm(
      decision === 'APPROVED'
        ? 'Monatsabschluss jetzt freigeben?'
        : 'Monatsabschluss jetzt zurueckgeben?'
    )
    if (!confirm) return

    try {
      setIsSaving(true)
      setError('')
      setSuccess('')
      await reviewChainadminMonthlyClosing(token, {
        submissionId,
        decision,
        note: note || null,
      })
      setSuccess(
        decision === 'APPROVED'
          ? 'Monatsabschluss wurde freigegeben.'
          : 'Monatsabschluss wurde zurueckgegeben.'
      )
      await loadQueue()
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Bewertung fehlgeschlagen')
    } finally {
      setIsSaving(false)
    }
  }

  if (!session) return null

  return (
    <BackofficeLayout
      brand="Kettenadmin"
      title="Abschluss-Queue"
      subtitle="Tages-/Monatsabschluesse pruefen und Wiedereroeffnungen freigeben"
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

      <section className="mb-5 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="grid gap-3 md:grid-cols-3">
          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Monat</span>
            <input type="month" value={month} onChange={(event) => setMonth(event.target.value)} className="input-ui" />
          </label>
          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Filiale</span>
            <select value={tenantId} onChange={(event) => setTenantId(event.target.value)} className="input-ui">
              <option value="">Alle freigegebenen Filialen</option>
              {tenants.map((entry) => (
                <option key={entry.id} value={entry.id}>
                  {entry.name}
                </option>
              ))}
            </select>
          </label>
          <div className="flex items-end">
            <button
              type="button"
              onClick={() => void loadQueue()}
              disabled={isLoading}
              className="w-full rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:opacity-60"
            >
              Aktualisieren
            </button>
          </div>
        </div>
      </section>

      {isLoading ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-sm text-rose-900/70">Lade Abschluss-Queue...</p>
        </section>
      ) : queue ? (
        <div className="grid gap-5">
          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold text-[var(--brand-ink)]">Offene Tagesabschluesse</h2>
            {queue.pendingDaily.length === 0 ? (
              <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                Keine offenen Tagesabschluesse.
              </p>
            ) : (
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[980px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Filiale</th>
                      <th className="th-ui">Tag</th>
                      <th className="th-ui">Einreichung</th>
                      <th className="th-ui">Bar gezaehlt</th>
                      <th className="th-ui">Aktion</th>
                    </tr>
                  </thead>
                  <tbody>
                    {queue.pendingDaily.map((entry) => (
                      <tr key={entry.submissionId}>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.tenantName}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.closingDate}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{new Date(entry.submittedAt).toLocaleString('de-DE')}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.payload ? `${entry.payload.countedCash.toFixed(2)} EUR` : '-'}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <div className="flex gap-2">
                            <button
                              type="button"
                              onClick={() => void reviewDaily(entry.submissionId, 'APPROVED')}
                              disabled={isSaving}
                              className="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-emerald-500 disabled:opacity-60"
                            >
                              Freigeben
                            </button>
                            <button
                              type="button"
                              onClick={() => void reviewDaily(entry.submissionId, 'RETURNED')}
                              disabled={isSaving}
                              className="rounded-lg bg-amber-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-amber-500 disabled:opacity-60"
                            >
                              Zurueckgeben
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

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold text-[var(--brand-ink)]">Offene Wiedereroeffnungen</h2>
            {queue.pendingReopenRequests.length === 0 ? (
              <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                Keine offenen Wiedereroeffnungen.
              </p>
            ) : (
              <div className="mt-3 space-y-3">
                {queue.pendingReopenRequests.map((entry) => (
                  <article key={entry.requestId} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
                    <p className="text-sm font-semibold text-[var(--brand-ink)]">
                      {entry.tenantName || '-'} | {entry.closingDate || '-'}
                    </p>
                    <p className="mt-1 text-xs text-rose-900/75">
                      Angefragt am {new Date(entry.requestedAt).toLocaleString('de-DE')}
                    </p>
                    <p className="mt-2 text-sm text-rose-900/85">{entry.reason || 'Kein Grund angegeben.'}</p>
                    <div className="mt-3 flex gap-2">
                      <button
                        type="button"
                        onClick={() => void reviewReopen(entry.requestId, 'APPROVED')}
                        disabled={isSaving}
                        className="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-emerald-500 disabled:opacity-60"
                      >
                        Freigeben
                      </button>
                      <button
                        type="button"
                        onClick={() => void reviewReopen(entry.requestId, 'REJECTED')}
                        disabled={isSaving}
                        className="rounded-lg bg-amber-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-amber-500 disabled:opacity-60"
                      >
                        Ablehnen
                      </button>
                    </div>
                  </article>
                ))}
              </div>
            )}
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold text-[var(--brand-ink)]">Offene Monatsabschluesse</h2>
            {queue.pendingMonthly.length === 0 ? (
              <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
                Keine offenen Monatsabschluesse.
              </p>
            ) : (
              <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[920px] border-collapse">
                  <thead>
                    <tr>
                      <th className="th-ui">Filiale</th>
                      <th className="th-ui">Monat</th>
                      <th className="th-ui">Einreichung</th>
                      <th className="th-ui">Abschlusstage</th>
                      <th className="th-ui">Aktion</th>
                    </tr>
                  </thead>
                  <tbody>
                    {queue.pendingMonthly.map((entry) => (
                      <tr key={entry.submissionId}>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.tenantName}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.month}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{new Date(entry.submittedAt).toLocaleString('de-DE')}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{entry.dayCount}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <div className="flex gap-2">
                            <button
                              type="button"
                              onClick={() => void reviewMonthly(entry.submissionId, 'APPROVED')}
                              disabled={isSaving}
                              className="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-emerald-500 disabled:opacity-60"
                            >
                              Freigeben
                            </button>
                            <button
                              type="button"
                              onClick={() => void reviewMonthly(entry.submissionId, 'RETURNED')}
                              disabled={isSaving}
                              className="rounded-lg bg-amber-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-amber-500 disabled:opacity-60"
                            >
                              Zurueckgeben
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
    </BackofficeLayout>
  )
}

