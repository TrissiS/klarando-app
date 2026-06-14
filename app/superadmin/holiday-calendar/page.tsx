'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  getGermanHolidayImportOptions,
  getPlatformHolidayCalendar,
  importGermanPlatformHolidays,
  updatePlatformHolidayCalendar,
  type GermanHolidayImportStateCode,
  type GermanHolidayImportStateOption,
  type PlatformHoliday,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type ImportSource = 'GENERATE' | 'JSON' | 'CSV' | 'ICS'

function formatHolidayDate(value: string) {
  const parsed = new Date(`${value}T00:00:00`)
  if (Number.isNaN(parsed.getTime())) {
    return value
  }
  return parsed.toLocaleDateString('de-DE')
}

function getHolidayRegionLabel(entry: PlatformHoliday) {
  if (entry.isNationwide) {
    return 'Bundesweit'
  }
  return entry.regionName || entry.stateCode || '—'
}

function normalizeSearchValue(value: string) {
  return value.trim().toLowerCase()
}

export default function SuperadminHolidayCalendarPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [loading, setLoading] = useState(true)
  const [importing, setImporting] = useState(false)
  const [saving, setSaving] = useState(false)
  const [holidays, setHolidays] = useState<PlatformHoliday[]>([])
  const [supportedStates, setSupportedStates] = useState<GermanHolidayImportStateOption[]>([])
  const [importYear, setImportYear] = useState(new Date().getFullYear())
  const [importTargetYear, setImportTargetYear] = useState('')
  const [importStateCode, setImportStateCode] = useState<GermanHolidayImportStateCode | ''>('')
  const [includeNationwide, setIncludeNationwide] = useState(true)
  const [importSource, setImportSource] = useState<ImportSource>('GENERATE')
  const [importPayload, setImportPayload] = useState('')
  const [filterYear, setFilterYear] = useState('')
  const [filterRegion, setFilterRegion] = useState('')
  const [filterSource, setFilterSource] = useState('')
  const [searchQuery, setSearchQuery] = useState('')
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

  const regionOptions = useMemo(() => {
    return Array.from(
      new Set(
        holidays
          .map((entry) => getHolidayRegionLabel(entry))
          .filter((value) => value && value !== '—')
      )
    ).sort((a, b) => a.localeCompare(b, 'de'))
  }, [holidays])

  const sourceOptions = useMemo(() => {
    return Array.from(
      new Set(
        holidays
          .map((entry) => entry.source?.trim())
          .filter((value): value is string => Boolean(value))
      )
    ).sort((a, b) => a.localeCompare(b, 'de'))
  }, [holidays])

  const yearOptions = useMemo(() => {
    return Array.from(
      new Set(
        holidays
          .map((entry) => entry.date.slice(0, 4))
          .filter((value) => /^\d{4}$/.test(value))
      )
    ).sort((a, b) => b.localeCompare(a))
  }, [holidays])

  const filteredHolidays = useMemo(() => {
    const search = normalizeSearchValue(searchQuery)
    return [...holidays]
      .filter((entry) => (filterYear ? entry.date.startsWith(`${filterYear}-`) : true))
      .filter((entry) => (filterRegion ? getHolidayRegionLabel(entry) === filterRegion : true))
      .filter((entry) => (filterSource ? (entry.source || '') === filterSource : true))
      .filter((entry) =>
        search
          ? normalizeSearchValue(entry.name).includes(search) ||
            normalizeSearchValue(entry.source || '').includes(search) ||
            normalizeSearchValue(getHolidayRegionLabel(entry)).includes(search)
          : true
      )
      .sort((left, right) => {
        if (left.date !== right.date) {
          return left.date.localeCompare(right.date)
        }
        return left.name.localeCompare(right.name, 'de')
      })
  }, [filterRegion, filterSource, filterYear, holidays, searchQuery])

  const filteredIds = useMemo(
    () => new Set(filteredHolidays.map((entry) => entry.id)),
    [filteredHolidays]
  )

  if (!session) {
    return null
  }

  async function persistHolidays(nextHolidays: PlatformHoliday[], successMessage: string) {
    if (!token) {
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')
      const saved = await updatePlatformHolidayCalendar(nextHolidays, token)
      setHolidays(saved)
      setSuccess(successMessage)
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'Feiertagskalender konnte nicht gespeichert werden'
      )
    } finally {
      setSaving(false)
    }
  }

  async function handleImportFileSelected(file: File | null) {
    if (!file) {
      return
    }

    try {
      const text = await file.text()
      setImportPayload(text)
      setError('')
      setSuccess('')
    } catch {
      setError('ICS-Datei konnte nicht gelesen werden')
    }
  }

  async function handleImport() {
    if (!token) {
      return
    }

    try {
      setImporting(true)
      setError('')
      setSuccess('')

      const targetYear =
        importSource === 'GENERATE'
          ? undefined
          : Number.isInteger(Number(importTargetYear))
            ? Number(importTargetYear)
            : undefined

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
                  targetYear,
                },
                token
              )
            : importSource === 'CSV'
              ? await importGermanPlatformHolidays(
                  {
                    mode: 'CSV',
                    csv: importPayload,
                    targetYear,
                  },
                  token
                )
              : await importGermanPlatformHolidays(
                  {
                    mode: 'ICS',
                    ics: importPayload,
                    stateCode: importStateCode || null,
                    isNationwide: importStateCode ? false : includeNationwide,
                    countryCode: 'DE',
                    targetYear,
                  },
                  token
                )

      setHolidays(result.holidays)
      setSuccess(
        `Import abgeschlossen. ${result.summary.addedCount} hinzugefügt, ${result.summary.skippedDuplicates} übersprungen, ${result.summary.importedCount} verarbeitet.`
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

  function handleToggleActive(entry: PlatformHoliday) {
    const nextHolidays = holidays.map((holiday) =>
      holiday.id === entry.id ? { ...holiday, active: !holiday.active } : holiday
    )
    void persistHolidays(
      nextHolidays,
      `${entry.name} wurde ${entry.active ? 'deaktiviert' : 'aktiviert'}.`
    )
  }

  function handleDeleteEntry(entry: PlatformHoliday) {
    if (!window.confirm(`Soll "${entry.name}" am ${formatHolidayDate(entry.date)} wirklich gelöscht werden?`)) {
      return
    }

    const nextHolidays = holidays.filter((holiday) => holiday.id !== entry.id)
    void persistHolidays(nextHolidays, `${entry.name} wurde gelöscht.`)
  }

  function handleDeactivateFiltered() {
    if (filteredHolidays.length === 0) {
      return
    }

    const nextHolidays = holidays.map((holiday) =>
      filteredIds.has(holiday.id) ? { ...holiday, active: false } : holiday
    )
    void persistHolidays(nextHolidays, `${filteredHolidays.length} gefilterte Feiertage wurden deaktiviert.`)
  }

  function handleDeleteFiltered() {
    if (filteredHolidays.length === 0) {
      return
    }

    if (!window.confirm(`Sollten wirklich ${filteredHolidays.length} gefilterte Feiertage gelöscht werden?`)) {
      return
    }

    const nextHolidays = holidays.filter((holiday) => !filteredIds.has(holiday.id))
    void persistHolidays(nextHolidays, `${filteredHolidays.length} gefilterte Feiertage wurden gelöscht.`)
  }

  function handleDeleteIcsImports() {
    const icsEntries = holidays.filter((entry) => entry.source === 'ICS_IMPORT')
    if (icsEntries.length === 0) {
      return
    }

    if (!window.confirm(`Sollten wirklich alle ${icsEntries.length} ICS_IMPORT-Einträge gelöscht werden?`)) {
      return
    }

    const nextHolidays = holidays.filter((entry) => entry.source !== 'ICS_IMPORT')
    void persistHolidays(nextHolidays, `${icsEntries.length} ICS-Importeinträge wurden gelöscht.`)
  }

  function handleDeleteSelectedYear() {
    if (!filterYear) {
      setError('Bitte zuerst ein Jahr im Filter auswählen.')
      return
    }

    const yearEntries = holidays.filter((entry) => entry.date.startsWith(`${filterYear}-`))
    if (yearEntries.length === 0) {
      return
    }

    if (!window.confirm(`Sollten wirklich alle ${yearEntries.length} Feiertage aus ${filterYear} gelöscht werden?`)) {
      return
    }

    const nextHolidays = holidays.filter((entry) => !entry.date.startsWith(`${filterYear}-`))
    void persistHolidays(nextHolidays, `${yearEntries.length} Feiertage aus ${filterYear} wurden gelöscht.`)
  }

  const activeCount = holidays.filter((entry) => entry.active).length
  const recurringCount = holidays.filter((entry) => entry.repeatsYearly).length
  const filteredCount = filteredHolidays.length

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Feiertagskalender"
      subtitle="Zentrale Verwaltung für Feiertage je Jahr, Quelle und Bundesland"
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
          <p className="text-xs uppercase tracking-wide text-rose-900/70">Plattformweit</p>
          <p className="mt-1 text-sm text-rose-900/85">
            Feiertage werden zentral gepflegt und können nach Quelle, Jahr und Region verwaltet werden.
          </p>
        </div>

        <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-white p-4">
          <div className="flex flex-col gap-3 lg:flex-row lg:items-end lg:justify-between">
            <div>
              <h2 className="text-base font-semibold text-slate-900">Feiertagsimport</h2>
              <p className="mt-1 text-sm text-rose-900/75">
                Unterstützt automatische Generierung sowie Import aus JSON, CSV und ICS. Duplikate werden beim Einspielen übersprungen.
              </p>
            </div>
          </div>

          <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Importmodus</span>
              <select
                value={importSource}
                onChange={(event) => setImportSource(event.target.value as ImportSource)}
                className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none"
              >
                <option value="GENERATE">Automatisch generieren</option>
                <option value="JSON">JSON importieren</option>
                <option value="CSV">CSV importieren</option>
                <option value="ICS">ICS importieren</option>
              </select>
            </label>

            {importSource === 'GENERATE' ? (
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Zieljahr</span>
                <input
                  type="number"
                  min={2000}
                  max={2100}
                  value={importYear}
                  onChange={(event) => setImportYear(Number(event.target.value) || new Date().getFullYear())}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                />
              </label>
            ) : (
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Optional nur Jahr importieren</span>
                <input
                  type="number"
                  min={2000}
                  max={2100}
                  value={importTargetYear}
                  onChange={(event) => setImportTargetYear(event.target.value)}
                  placeholder="z. B. 2026"
                  className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                />
              </label>
            )}

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
                disabled={importSource === 'ICS' && Boolean(importStateCode)}
              />
              {importSource === 'GENERATE'
                ? 'Bundesweite Feiertage einschließen'
                : 'Als bundesweite Feiertage importieren'}
            </label>
          </div>

          {importSource !== 'GENERATE' ? (
            <div className="mt-4 space-y-3">
              {importSource === 'ICS' ? (
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">ICS-Datei</span>
                  <input
                    type="file"
                    accept=".ics,text/calendar"
                    onChange={(event) => void handleImportFileSelected(event.target.files?.[0] || null)}
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none"
                  />
                </label>
              ) : null}

              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">
                  {importSource === 'JSON'
                    ? 'JSON-Payload'
                    : importSource === 'CSV'
                      ? 'CSV-Payload'
                      : 'ICS-Inhalt'}
                </span>
                <textarea
                  value={importPayload}
                  onChange={(event) => setImportPayload(event.target.value)}
                  rows={10}
                  className="w-full rounded-2xl border border-[var(--brand-border)] px-3 py-2 text-sm font-mono outline-none"
                  placeholder={
                    importSource === 'JSON'
                      ? '[{"id":"de-2026-nw-corpus-christi","name":"Fronleichnam","date":"2026-06-04","countryCode":"DE","stateCode":"NW","regionName":"Nordrhein-Westfalen","isNationwide":false,"active":true,"repeatsYearly":true,"source":"MANUAL_IMPORT","createdAt":"2026-01-01T00:00:00.000Z","updatedAt":"2026-01-01T00:00:00.000Z"}]'
                      : importSource === 'CSV'
                        ? 'id,name,date,countryCode,stateCode,regionName,isNationwide,active,repeatsYearly,source'
                        : 'BEGIN:VCALENDAR\nBEGIN:VEVENT\nSUMMARY:Fronleichnam\nDTSTART;VALUE=DATE:20260604\nEND:VEVENT\nEND:VCALENDAR'
                  }
                />
              </label>
            </div>
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
            <div className="mt-4 grid gap-3 sm:grid-cols-4">
              <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <p className="text-xs uppercase tracking-wide text-slate-500">Einträge gesamt</p>
                <p className="mt-2 text-2xl font-semibold text-slate-900">{holidays.length}</p>
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <p className="text-xs uppercase tracking-wide text-slate-500">Aktiv</p>
                <p className="mt-2 text-2xl font-semibold text-slate-900">{activeCount}</p>
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <p className="text-xs uppercase tracking-wide text-slate-500">Wiederkehrend</p>
                <p className="mt-2 text-2xl font-semibold text-slate-900">{recurringCount}</p>
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <p className="text-xs uppercase tracking-wide text-slate-500">Gefiltert</p>
                <p className="mt-2 text-2xl font-semibold text-slate-900">{filteredCount}</p>
              </div>
            </div>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-white p-4">
              <h2 className="text-base font-semibold text-slate-900">Filter</h2>
              <div className="mt-3 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Jahr</span>
                  <select
                    value={filterYear}
                    onChange={(event) => setFilterYear(event.target.value)}
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none"
                  >
                    <option value="">Alle Jahre</option>
                    {yearOptions.map((year) => (
                      <option key={year} value={year}>
                        {year}
                      </option>
                    ))}
                  </select>
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Bundesland / Region</span>
                  <select
                    value={filterRegion}
                    onChange={(event) => setFilterRegion(event.target.value)}
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none"
                  >
                    <option value="">Alle Regionen</option>
                    {regionOptions.map((region) => (
                      <option key={region} value={region}>
                        {region}
                      </option>
                    ))}
                  </select>
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Quelle</span>
                  <select
                    value={filterSource}
                    onChange={(event) => setFilterSource(event.target.value)}
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none"
                  >
                    <option value="">Alle Quellen</option>
                    {sourceOptions.map((source) => (
                      <option key={source} value={source}>
                        {source}
                      </option>
                    ))}
                  </select>
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Suche nach Name</span>
                  <input
                    value={searchQuery}
                    onChange={(event) => setSearchQuery(event.target.value)}
                    placeholder="z. B. Fronleichnam"
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
                  />
                </label>
              </div>
            </div>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-white p-4">
              <div className="flex flex-wrap gap-2">
                <button
                  type="button"
                  onClick={handleDeactivateFiltered}
                  disabled={saving || filteredHolidays.length === 0}
                  className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm font-semibold text-slate-700 disabled:cursor-not-allowed disabled:opacity-50"
                >
                  Alle gefilterten deaktivieren
                </button>
                <button
                  type="button"
                  onClick={handleDeleteFiltered}
                  disabled={saving || filteredHolidays.length === 0}
                  className="rounded-xl border border-red-200 px-3 py-2 text-sm font-semibold text-red-700 disabled:cursor-not-allowed disabled:opacity-50"
                >
                  Alle gefilterten löschen
                </button>
                <button
                  type="button"
                  onClick={handleDeleteIcsImports}
                  disabled={saving || holidays.every((entry) => entry.source !== 'ICS_IMPORT')}
                  className="rounded-xl border border-red-200 px-3 py-2 text-sm font-semibold text-red-700 disabled:cursor-not-allowed disabled:opacity-50"
                >
                  Alle ICS_IMPORT-Einträge löschen
                </button>
                <button
                  type="button"
                  onClick={handleDeleteSelectedYear}
                  disabled={saving || !filterYear}
                  className="rounded-xl border border-red-200 px-3 py-2 text-sm font-semibold text-red-700 disabled:cursor-not-allowed disabled:opacity-50"
                >
                  Alle Einträge für ausgewähltes Jahr löschen
                </button>
              </div>
            </div>

            <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)] bg-white">
              <table className="min-w-full text-sm">
                <thead className="bg-slate-50 text-left text-xs uppercase tracking-wide text-slate-500">
                  <tr>
                    <th className="px-3 py-3">Datum</th>
                    <th className="px-3 py-3">Name</th>
                    <th className="px-3 py-3">Land</th>
                    <th className="px-3 py-3">Bundesland / Region</th>
                    <th className="px-3 py-3">Bundesweit</th>
                    <th className="px-3 py-3">Aktiv</th>
                    <th className="px-3 py-3">Wiederkehrend</th>
                    <th className="px-3 py-3">Quelle</th>
                    <th className="px-3 py-3">Aktionen</th>
                  </tr>
                </thead>
                <tbody>
                  {filteredHolidays.map((entry) => (
                    <tr key={entry.id} className="border-t border-slate-100 align-top">
                      <td className="px-3 py-3 whitespace-nowrap text-slate-700">{formatHolidayDate(entry.date)}</td>
                      <td className="px-3 py-3 font-medium text-slate-900">{entry.name}</td>
                      <td className="px-3 py-3 text-slate-700">{entry.countryCode || '—'}</td>
                      <td className="px-3 py-3 text-slate-700">{getHolidayRegionLabel(entry)}</td>
                      <td className="px-3 py-3 text-slate-700">{entry.isNationwide ? 'Ja' : 'Nein'}</td>
                      <td className="px-3 py-3 text-slate-700">{entry.active ? 'Ja' : 'Nein'}</td>
                      <td className="px-3 py-3 text-slate-700">{entry.repeatsYearly ? 'Ja' : 'Nein'}</td>
                      <td className="px-3 py-3 text-slate-700">{entry.source || '—'}</td>
                      <td className="px-3 py-3">
                        <div className="flex flex-wrap gap-2">
                          <button
                            type="button"
                            onClick={() => handleToggleActive(entry)}
                            disabled={saving}
                            className="rounded-lg border border-[var(--brand-border)] px-3 py-1.5 text-xs font-semibold text-slate-700 disabled:cursor-not-allowed disabled:opacity-50"
                          >
                            {entry.active ? 'Deaktivieren' : 'Aktivieren'}
                          </button>
                          <button
                            type="button"
                            onClick={() => handleDeleteEntry(entry)}
                            disabled={saving}
                            className="rounded-lg border border-red-200 px-3 py-1.5 text-xs font-semibold text-red-700 disabled:cursor-not-allowed disabled:opacity-50"
                          >
                            Löschen
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))}
                  {filteredHolidays.length === 0 ? (
                    <tr>
                      <td className="px-3 py-6 text-center text-sm text-slate-500" colSpan={9}>
                        Keine Feiertage für die aktuellen Filter gefunden.
                      </td>
                    </tr>
                  ) : null}
                </tbody>
              </table>
            </div>

            <details className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-slate-950 p-4 text-xs text-slate-100">
              <summary className="cursor-pointer font-semibold text-white">
                Technische JSON-Ansicht
              </summary>
              <pre className="mt-3 overflow-x-auto whitespace-pre-wrap">
                {JSON.stringify(holidays, null, 2)}
              </pre>
            </details>
          </>
        )}
      </section>
    </BackofficeLayout>
  )
}
