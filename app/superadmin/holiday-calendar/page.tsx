'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  getPlatformHolidayCalendar,
  type PlatformHoliday,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

export default function SuperadminHolidayCalendarPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [loading, setLoading] = useState(true)
  const [holidays, setHolidays] = useState<PlatformHoliday[]>([])
  const [error, setError] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null

    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }

    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    setSession(parsed)
    setToken(accessToken)
  }, [])

  useEffect(() => {
    async function loadData() {
      if (!token) {
        return
      }

      try {
        setLoading(true)
        setError('')
        const loaded = await getPlatformHolidayCalendar(token)
        setHolidays(loaded)
      } catch (loadError) {
        setError(
          loadError instanceof Error
            ? loadError.message
            : 'Feiertagskalender konnte nicht geladen werden'
        )
      } finally {
        setLoading(false)
      }
    }

    void loadData()
  }, [token])

  if (!session) {
    return null
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Feiertagskalender"
      subtitle="Technische Plattform-Grundlage für zentrale Feiertage je Land, Bundesland und Region"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      {error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}

      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
          <p className="text-xs uppercase tracking-wide text-rose-900/70">
            Foundation
          </p>
          <p className="mt-1 text-sm text-rose-900/85">
            Die zentrale Superadmin-API für Plattform-Feiertage ist vorbereitet. Die große Kalender-UI folgt später separat.
          </p>
        </div>

        {loading ? (
          <p className="mt-4 text-sm text-rose-900/75">Lade Feiertagskalender...</p>
        ) : (
          <>
            <div className="mt-4 grid gap-3 sm:grid-cols-3">
              <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <p className="text-xs uppercase tracking-wide text-slate-500">Einträge</p>
                <p className="mt-2 text-2xl font-semibold text-slate-900">{holidays.length}</p>
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <p className="text-xs uppercase tracking-wide text-slate-500">Aktiv</p>
                <p className="mt-2 text-2xl font-semibold text-slate-900">
                  {holidays.filter((entry) => entry.active).length}
                </p>
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <p className="text-xs uppercase tracking-wide text-slate-500">Wiederkehrend</p>
                <p className="mt-2 text-2xl font-semibold text-slate-900">
                  {holidays.filter((entry) => entry.repeatsYearly).length}
                </p>
              </div>
            </div>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-slate-950 p-4 text-xs text-slate-100">
              <p className="mb-2 font-semibold text-white">Aktueller JSON-Stand</p>
              <pre className="overflow-x-auto whitespace-pre-wrap">
                {JSON.stringify(holidays, null, 2)}
              </pre>
            </div>
          </>
        )}
      </section>
    </BackofficeLayout>
  )
}
