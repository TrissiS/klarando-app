'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  getGermanHolidayImportOptions,
  getPlatformHolidayCalendar,
  importGermanPlatformHolidays,
  type GermanHolidayImportStateCode,
  type GermanHolidayImportStateOption,
  type PlatformHoliday,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

export default function SuperadminHolidayCalendarPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [loading, setLoading] = useState(true)
  const [importing, setImporting] = useState(false)
  const [holidays, setHolidays] = useState<PlatformHoliday[]>([])
  const [supportedStates, setSupportedStates] = useState<GermanHolidayImportStateOption[]>([])
  const [importYear, setImportYear] = useState(new Date().getFullYear())
  const [importStateCode, setImportStateCode] = useState<GermanHolidayImportStateCode | ''>('')
  const [includeNationwide, setIncludeNationwide] = useState(true)
  const [importSource, setImportSource] = useState<'GENERATE' | 'JSON' | 'CSV'>('GENERATE')
  const [importPayload, setImportPayload] = useState('')
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

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
        const [loaded, options] = await Promise.all([
          getPlatformHolidayCalendar(token),
          getGermanHolidayImportOptions(token),
        ])
        setHolidays(loaded)
        setSupportedStates(options.states)
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

  async function handleImport() {
    if (!token) {
      return
    }

    try {
      setImporting(true)
      setError('')
      setSuccess('')
      const result =
        importSource === 'GENERATE'
          ? await importGermanPlatformHolidays(
              {
                mode: 'GENERATE',
                year: importYear,
                stateCode: importStateCode || null,
                includeNationwide,
              },
              token
            )
          : importSource === 'JSON'
            ? await importGermanPlatformHolidays(
                {
                  mode: 'JSON',
                  holidays: JSON.parse(importPayload || '[]') as PlatformHoliday[],
                },
                token
              )
            : await importGermanPlatformHolidays(
                {
                  mode: 'CSV',
                  csv: importPayload,
                },
                token
              )

      setHolidays(result.holidays)
      setSuccess(
        `Import abgeschlossen. ${result.summary.addedCount} neue Feiertage hinzugefügt, ${result.summary.skippedDuplicates} Duplikate übersprungen.`
      )
    } catch (importError) {
      setError(
        importError instanceof Error
          ? importError.message
          : 'Feiertagsimport konnte nicht ausgeführt werden'
      )
    } finally {
      setImporting(false)
    }
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
      {success ? (
        <div className="mb-4 rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
          {success}
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

        <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-white p-4">
          <div className="flex flex-col gap-3 lg:flex-row lg:items-end lg:justify-between">
            <div>
              <h2 className="text-base font-semibold text-slate-900">Feiertagsimport Deutschland</h2>
              <p className="mt-1 text-sm text-rose-900/75">
                Unterstützt automatische Generierung je Jahr/Bundesland sowie Import aus JSON oder CSV. Duplikate werden beim Einspielen übersprungen.
              </p>
            </div>
          </div>

          <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Importmodus</span>
              <select
                value={importSource}
                onChange={(event) => setImportSource(event.target.value as 'GENERATE' | 'JSON' | 'CSV')}
                className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none"
              >
                <option value="GENERATE">Automatisch generieren</option>
                <option value="JSON">JSON importieren</option>
                <option value="CSV">CSV importieren</option>
              </select>
            </label>

            {importSource === 'GENERATE' ? (
              <>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Jahr</span>
                  <input
                    type="number"
                    min={2000}
                    max={2100}
                    value={importYear}
                    onChange={(event) => setImportYear(Number(event.target.value) || new Date().getFullYear())}
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Bundesland</span>
                  <select
                    value={importStateCode}
                    onChange={(event) =>
                      setImportStateCode((event.target.value as GermanHolidayImportStateCode | '') || '')
                    }
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none"
                  >
                    <option value="">Nur bundesweit</option>
                    {supportedStates.map((state) => (
                      <option key={state.code} value={state.code}>
                        {state.label}
                      </option>
                    ))}
                  </select>
                </label>
                <label className="inline-flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm text-rose-900/85">
                  <input
                    type="checkbox"
                    checked={includeNationwide}
                    onChange={(event) => setIncludeNationwide(event.target.checked)}
                  />
                  Bundesweite Feiertage einschließen
                </label>
              </>
            ) : null}
          </div>

          {importSource !== 'GENERATE' ? (
            <label className="mt-4 block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">
                {importSource === 'JSON' ? 'JSON-Payload' : 'CSV-Payload'}
              </span>
              <textarea
                value={importPayload}
                onChange={(event) => setImportPayload(event.target.value)}
                rows={10}
                className="w-full rounded-2xl border border-[var(--brand-border)] px-3 py-2 text-sm font-mono outline-none"
                placeholder={
                  importSource === 'JSON'
                    ? '[{"id":"de-2026-nw-corpus-christi","name":"Fronleichnam","date":"2026-06-04","countryCode":"DE","stateCode":"NW","regionName":"Nordrhein-Westfalen","isNationwide":false,"active":true,"repeatsYearly":true,"source":"MANUAL_IMPORT","createdAt":"2026-01-01T00:00:00.000Z","updatedAt":"2026-01-01T00:00:00.000Z"}]'
                    : 'id,name,date,countryCode,stateCode,regionName,isNationwide,active,repeatsYearly,source'
                }
              />
            </label>
          ) : null}

          <div className="mt-4 flex justify-end">
            <button
              type="button"
              onClick={() => void handleImport()}
              disabled={importing}
              className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
            >
              {importing ? 'Importiert...' : 'Feiertage importieren'}
            </button>
          </div>
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
