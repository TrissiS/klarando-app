'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { CHAINADMIN_NAV_ITEMS } from '@/app/chainadmin/nav'
import {
  AdminButton,
  AdminEmptyState,
  AdminFormGrid,
  AdminPageShell,
  AdminSectionCard,
  AdminTable,
  AdminTextInput,
} from '@/app/Components/admin/ui/AdminUi'
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
      decision === 'APPROVED' ? 'Notiz zur Freigabe (optional):' : 'Grund für Rückgabe (optional):'
    )
    const confirm = window.confirm(
      decision === 'APPROVED'
        ? 'Tagesabschluss jetzt freigeben?'
        : 'Tagesabschluss jetzt zurückgeben?'
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
          : 'Tagesabschluss wurde zurückgegeben.'
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
        ? 'Notiz zur Wiedereröffnung (optional):'
        : 'Grund für Ablehnung (optional):'
    )
    const confirm = window.confirm(
      decision === 'APPROVED'
        ? 'Wiedereröffnung jetzt freigeben?'
        : 'Wiedereröffnung jetzt ablehnen?'
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
          ? 'Wiedereröffnung wurde freigegeben.'
          : 'Wiedereröffnung wurde abgelehnt.'
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
      decision === 'APPROVED' ? 'Notiz zur Freigabe (optional):' : 'Grund für Rückgabe (optional):'
    )
    const confirm = window.confirm(
      decision === 'APPROVED'
        ? 'Monatsabschluss jetzt freigeben?'
        : 'Monatsabschluss jetzt zurückgeben?'
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
          : 'Monatsabschluss wurde zurückgegeben.'
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
      subtitle="Tages-/Monatsabschlüsse prüfen und Wiedereröffnungen freigeben"
      navItems={CHAINADMIN_NAV_ITEMS}
    >
      <AdminPageShell>
        {error ? (
          <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
            {error}
          </div>
        ) : null}
        {success ? (
          <div className="rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
            {success}
          </div>
        ) : null}

        <AdminSectionCard title="Filter" description="Monat und Filiale für die Abschluss-Queue.">
          <AdminFormGrid>
            <AdminTextInput
              type="month"
              label="Monat"
              value={month}
              onChange={(event) => setMonth(event.target.value)}
            />
            <label className="block text-sm">
              <span className="mb-1 block text-rose-900/75">Filiale</span>
              <select
                value={tenantId}
                onChange={(event) => setTenantId(event.target.value)}
                className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm text-slate-900 outline-none transition focus:border-orange-400 focus:ring-2 focus:ring-orange-200"
              >
                <option value="">Alle freigegebenen Filialen</option>
                {tenants.map((entry) => (
                  <option key={entry.id} value={entry.id}>
                    {entry.name}
                  </option>
                ))}
              </select>
            </label>
            <div className="md:col-span-2">
              <AdminButton type="button" onClick={() => void loadQueue()} disabled={isLoading}>
                Aktualisieren
              </AdminButton>
            </div>
          </AdminFormGrid>
        </AdminSectionCard>

        {isLoading ? (
          <AdminSectionCard title="Abschluss-Queue">
            <p className="text-sm text-rose-900/70">Lade Abschluss-Queue...</p>
          </AdminSectionCard>
        ) : queue ? (
          <>
            <AdminSectionCard title="Offene Tagesabschlüsse">
              {queue.pendingDaily.length === 0 ? (
                <AdminEmptyState title="Keine offenen Tagesabschlüsse." />
              ) : (
                <AdminTable>
                  <thead>
                    <tr>
                      <th className="th-ui">Filiale</th>
                      <th className="th-ui">Tag</th>
                      <th className="th-ui">Einreichung</th>
                      <th className="th-ui">Bar gezählt</th>
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
                            <AdminButton
                              type="button"
                              onClick={() => void reviewDaily(entry.submissionId, 'APPROVED')}
                              disabled={isSaving}
                            >
                              Freigeben
                            </AdminButton>
                            <AdminButton
                              type="button"
                              variant="secondary"
                              onClick={() => void reviewDaily(entry.submissionId, 'RETURNED')}
                              disabled={isSaving}
                            >
                              Zurückgeben
                            </AdminButton>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </AdminTable>
              )}
            </AdminSectionCard>

            <AdminSectionCard title="Offene Wiedereröffnungen">
              {queue.pendingReopenRequests.length === 0 ? (
                <AdminEmptyState title="Keine offenen Wiedereröffnungen." />
              ) : (
                <div className="space-y-3">
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
                        <AdminButton
                          type="button"
                          onClick={() => void reviewReopen(entry.requestId, 'APPROVED')}
                          disabled={isSaving}
                        >
                          Freigeben
                        </AdminButton>
                        <AdminButton
                          type="button"
                          variant="secondary"
                          onClick={() => void reviewReopen(entry.requestId, 'REJECTED')}
                          disabled={isSaving}
                        >
                          Ablehnen
                        </AdminButton>
                      </div>
                    </article>
                  ))}
                </div>
              )}
            </AdminSectionCard>

            <AdminSectionCard title="Offene Monatsabschlüsse">
              {queue.pendingMonthly.length === 0 ? (
                <AdminEmptyState title="Keine offenen Monatsabschlüsse." />
              ) : (
                <AdminTable>
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
                            <AdminButton
                              type="button"
                              onClick={() => void reviewMonthly(entry.submissionId, 'APPROVED')}
                              disabled={isSaving}
                            >
                              Freigeben
                            </AdminButton>
                            <AdminButton
                              type="button"
                              variant="secondary"
                              onClick={() => void reviewMonthly(entry.submissionId, 'RETURNED')}
                              disabled={isSaving}
                            >
                              Zurückgeben
                            </AdminButton>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </AdminTable>
              )}
            </AdminSectionCard>
          </>
        ) : null}
      </AdminPageShell>
    </BackofficeLayout>
  )
}

