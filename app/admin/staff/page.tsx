'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createStaffMember,
  createStaffShift,
  deleteStaffShift,
  getStaffEvaluation,
  getStaffMembers,
  getStaffSettings,
  getStaffShifts,
  updateStaffMember,
  updateStaffSettings,
  updateStaffShift,
  type StaffEvaluationResult,
  type StaffMember,
  type StaffSetting,
  type StaffShift,
  type StaffShiftStatus,
} from '@/lib/api'

type TabKey = 'planning' | 'evaluation' | 'settings'

function todayDate() {
  return new Date().toISOString().slice(0, 10)
}

function plusDays(baseIso: string, days: number) {
  const base = new Date(baseIso)
  base.setDate(base.getDate() + days)
  return base.toISOString().slice(0, 10)
}

function shiftStatusLabel(status: StaffShiftStatus) {
  if (status === 'PLANNED') {
    return 'Geplant'
  }

  if (status === 'COMPLETED') {
    return 'Abgeschlossen'
  }

  return 'Storniert'
}

function shiftStatusBadge(status: StaffShiftStatus) {
  if (status === 'PLANNED') {
    return 'bg-blue-100 text-blue-700'
  }

  if (status === 'COMPLETED') {
    return 'bg-green-100 text-green-700'
  }

  return 'bg-slate-200 text-rose-900/85'
}

function toDateInput(value: string) {
  return value.slice(0, 10)
}

export default function AdminStaffPage() {
  const [tab, setTab] = useState<TabKey>('planning')

  const [members, setMembers] = useState<StaffMember[]>([])
  const [shifts, setShifts] = useState<StaffShift[]>([])
  const [settings, setSettings] = useState<StaffSetting | null>(null)
  const [evaluation, setEvaluation] = useState<StaffEvaluationResult | null>(null)

  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const [employeeEditId, setEmployeeEditId] = useState<string | null>(null)
  const [employeeName, setEmployeeName] = useState('')
  const [employeePosition, setEmployeePosition] = useState('')
  const [employeePhone, setEmployeePhone] = useState('')
  const [employeeEmail, setEmployeeEmail] = useState('')
  const [employeeRate, setEmployeeRate] = useState('')
  const [employeeTargetHours, setEmployeeTargetHours] = useState('')
  const [employeeActive, setEmployeeActive] = useState(true)

  const [shiftEditId, setShiftEditId] = useState<string | null>(null)
  const [shiftMemberId, setShiftMemberId] = useState('')
  const [shiftDate, setShiftDate] = useState(todayDate())
  const [shiftStart, setShiftStart] = useState('10:00')
  const [shiftEnd, setShiftEnd] = useState('18:00')
  const [shiftBreak, setShiftBreak] = useState('30')
  const [shiftStatus, setShiftStatus] = useState<StaffShiftStatus>('PLANNED')
  const [shiftNote, setShiftNote] = useState('')

  const defaultEvalFrom = todayDate()
  const defaultEvalTo = plusDays(defaultEvalFrom, 14)
  const [evalFrom, setEvalFrom] = useState(defaultEvalFrom)
  const [evalTo, setEvalTo] = useState(defaultEvalTo)

  const [planningDays, setPlanningDays] = useState('14')
  const [defaultShiftStart, setDefaultShiftStart] = useState('10:00')
  const [defaultShiftEnd, setDefaultShiftEnd] = useState('18:00')
  const [defaultBreakMinutes, setDefaultBreakMinutes] = useState('30')
  const [overtimeThresholdHours, setOvertimeThresholdHours] = useState('')

  const activeMembers = useMemo(
    () => members.filter((member) => member.isActive),
    [members]
  )

  async function loadCoreData() {
    const [memberData, settingData] = await Promise.all([
      getStaffMembers(),
      getStaffSettings(),
    ])

    setMembers(memberData)
    setSettings(settingData)

    setPlanningDays(String(settingData.planningDays))
    setDefaultShiftStart(settingData.defaultShiftStart)
    setDefaultShiftEnd(settingData.defaultShiftEnd)
    setDefaultBreakMinutes(String(settingData.defaultBreakMinutes))
    setOvertimeThresholdHours(settingData.overtimeThresholdHours || '')

    if (!shiftMemberId && memberData[0]?.id) {
      setShiftMemberId(memberData[0].id)
    }
  }

  async function loadShiftsData() {
    const data = await getStaffShifts({
      from: evalFrom,
      to: evalTo,
    })
    setShifts(data)
  }

  async function loadEvaluationData() {
    const data = await getStaffEvaluation({
      from: evalFrom,
      to: evalTo,
    })
    setEvaluation(data)
  }

  async function loadData() {
    try {
      setLoading(true)
      setError('')
      await Promise.all([loadCoreData(), loadShiftsData(), loadEvaluationData()])
    } catch (loadError) {
      setError(
        loadError instanceof Error
          ? loadError.message
          : 'Mitarbeiterdaten konnten nicht geladen werden'
      )
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadData()
  }, [])

  async function refreshRangeBasedData() {
    try {
      await Promise.all([loadShiftsData(), loadEvaluationData()])
    } catch (loadError) {
      setError(
        loadError instanceof Error
          ? loadError.message
          : 'Daten konnten nicht aktualisiert werden'
      )
    }
  }

  useEffect(() => {
    if (!loading) {
      refreshRangeBasedData()
    }
  }, [evalFrom, evalTo])

  function resetEmployeeForm() {
    setEmployeeEditId(null)
    setEmployeeName('')
    setEmployeePosition('')
    setEmployeePhone('')
    setEmployeeEmail('')
    setEmployeeRate('')
    setEmployeeTargetHours('')
    setEmployeeActive(true)
  }

  function resetShiftForm() {
    setShiftEditId(null)
    setShiftDate(todayDate())
    setShiftStart(settings?.defaultShiftStart || '10:00')
    setShiftEnd(settings?.defaultShiftEnd || '18:00')
    setShiftBreak(String(settings?.defaultBreakMinutes ?? 30))
    setShiftStatus('PLANNED')
    setShiftNote('')
  }

  async function submitEmployee(event: React.FormEvent) {
    event.preventDefault()

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      const payload = {
        name: employeeName,
        position: employeePosition || undefined,
        phone: employeePhone || undefined,
        email: employeeEmail || undefined,
        hourlyRate: employeeRate ? Number(employeeRate) : null,
        weeklyTargetHours: employeeTargetHours ? Number(employeeTargetHours) : null,
        isActive: employeeActive,
      }

      if (employeeEditId) {
        await updateStaffMember(employeeEditId, payload)
        setSuccess('Mitarbeiter aktualisiert.')
      } else {
        await createStaffMember(payload)
        setSuccess('Mitarbeiter erstellt.')
      }

      resetEmployeeForm()
      await loadCoreData()
      await loadEvaluationData()
    } catch (submitError) {
      setError(
        submitError instanceof Error
          ? submitError.message
          : 'Mitarbeiter konnte nicht gespeichert werden'
      )
    } finally {
      setSaving(false)
    }
  }

  async function submitShift(event: React.FormEvent) {
    event.preventDefault()

    if (!shiftMemberId) {
      setError('Bitte Mitarbeiter fuer die Schicht auswaehlen.')
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      const payload = {
        staffMemberId: shiftMemberId,
        shiftDate,
        startTime: shiftStart,
        endTime: shiftEnd,
        breakMinutes: Number(shiftBreak),
        status: shiftStatus,
        note: shiftNote || undefined,
      }

      if (shiftEditId) {
        await updateStaffShift(shiftEditId, payload)
        setSuccess('Schicht aktualisiert.')
      } else {
        await createStaffShift(payload)
        setSuccess('Schicht erstellt.')
      }

      resetShiftForm()
      await refreshRangeBasedData()
    } catch (submitError) {
      setError(
        submitError instanceof Error ? submitError.message : 'Schicht konnte nicht gespeichert werden'
      )
    } finally {
      setSaving(false)
    }
  }

  async function removeShift(shiftId: string) {
    if (!window.confirm('Schicht wirklich loeschen?')) {
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')
      await deleteStaffShift(shiftId)
      setSuccess('Schicht geloescht.')
      if (shiftEditId === shiftId) {
        resetShiftForm()
      }
      await refreshRangeBasedData()
    } catch (deleteError) {
      setError(
        deleteError instanceof Error ? deleteError.message : 'Schicht konnte nicht geloescht werden'
      )
    } finally {
      setSaving(false)
    }
  }

  async function submitSettings(event: React.FormEvent) {
    event.preventDefault()

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      const updated = await updateStaffSettings({
        planningDays: Number(planningDays),
        defaultShiftStart,
        defaultShiftEnd,
        defaultBreakMinutes: Number(defaultBreakMinutes),
        overtimeThresholdHours: overtimeThresholdHours ? Number(overtimeThresholdHours) : null,
      })

      setSettings(updated)
      setSuccess('Einstellungen gespeichert.')
    } catch (submitError) {
      setError(
        submitError instanceof Error
          ? submitError.message
          : 'Einstellungen konnten nicht gespeichert werden'
      )
    } finally {
      setSaving(false)
    }
  }

  return (
    <AdminLayout
      title="Mitarbeiterverwaltung"
      subtitle="Planung, Auswertung und Einstellungen fuer dein Team"
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

      <div className="mb-6 flex flex-wrap gap-2">
        <TabButton active={tab === 'planning'} onClick={() => setTab('planning')}>
          Planung
        </TabButton>
        <TabButton active={tab === 'evaluation'} onClick={() => setTab('evaluation')}>
          Auswertung
        </TabButton>
        <TabButton active={tab === 'settings'} onClick={() => setTab('settings')}>
          Einstellungen
        </TabButton>
      </div>

      {tab === 'planning' ? (
        <div className="grid gap-6 xl:grid-cols-[430px_1fr]">
          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">
              {employeeEditId ? 'Mitarbeiter bearbeiten' : 'Neuer Mitarbeiter'}
            </h2>
            <p className="mt-1 text-sm text-rose-900/70">Team-Stammdaten und Konditionen.</p>

            <form onSubmit={submitEmployee} className="mt-4 space-y-3">
              <InputField label="Name" value={employeeName} setValue={setEmployeeName} required />
              <InputField label="Position" value={employeePosition} setValue={setEmployeePosition} />
              <InputField label="Telefon" value={employeePhone} setValue={setEmployeePhone} />
              <InputField label="E-Mail" value={employeeEmail} setValue={setEmployeeEmail} />
              <InputField
                label="Stundenlohn (EUR)"
                type="number"
                step="0.01"
                value={employeeRate}
                setValue={setEmployeeRate}
              />
              <InputField
                label="Zielstunden / Woche"
                type="number"
                step="0.01"
                value={employeeTargetHours}
                setValue={setEmployeeTargetHours}
              />

              <label className="flex items-center gap-2 text-sm font-medium text-rose-900/85">
                <input
                  type="checkbox"
                  checked={employeeActive}
                  onChange={(event) => setEmployeeActive(event.target.checked)}
                />
                Aktiv
              </label>

              <button
                type="submit"
                disabled={saving}
                className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
              >
                {saving
                  ? 'Speichert...'
                  : employeeEditId
                  ? 'Mitarbeiter aktualisieren'
                  : 'Mitarbeiter speichern'}
              </button>

              {employeeEditId ? (
                <button
                  type="button"
                  onClick={resetEmployeeForm}
                  className="w-full rounded-xl border border-[var(--brand-border)] px-4 py-2.5 font-medium text-rose-900/85 transition hover:bg-rose-50"
                >
                  Bearbeitung abbrechen
                </button>
              ) : null}
            </form>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Schichtplanung</h2>
            <p className="mt-1 text-sm text-rose-900/70">Schichten fuer den gewaehlten Zeitraum erfassen.</p>

            <div className="mt-4 grid gap-3 md:grid-cols-2">
              <InputField label="Von" type="date" value={evalFrom} setValue={setEvalFrom} />
              <InputField label="Bis" type="date" value={evalTo} setValue={setEvalTo} />
            </div>

            <form onSubmit={submitShift} className="mt-4 grid gap-3 md:grid-cols-2">
              <label className="block md:col-span-2">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Mitarbeiter</span>
                <select
                  value={shiftMemberId}
                  onChange={(event) => setShiftMemberId(event.target.value)}
                  className="input-ui"
                  required
                >
                  <option value="" disabled>
                    Bitte waehlen
                  </option>
                  {activeMembers.map((member) => (
                    <option key={member.id} value={member.id}>
                      {member.name} {member.position ? `(${member.position})` : ''}
                    </option>
                  ))}
                </select>
              </label>

              <InputField label="Datum" type="date" value={shiftDate} setValue={setShiftDate} required />
              <InputField label="Pause (Min)" type="number" value={shiftBreak} setValue={setShiftBreak} />
              <InputField label="Start" type="time" value={shiftStart} setValue={setShiftStart} required />
              <InputField label="Ende" type="time" value={shiftEnd} setValue={setShiftEnd} required />

              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Status</span>
                <select
                  value={shiftStatus}
                  onChange={(event) => setShiftStatus(event.target.value as StaffShiftStatus)}
                  className="input-ui"
                >
                  <option value="PLANNED">Geplant</option>
                  <option value="COMPLETED">Abgeschlossen</option>
                  <option value="CANCELED">Storniert</option>
                </select>
              </label>

              <label className="block">
                <span className="mb-1 block text-sm font-medium text-rose-900/85">Notiz</span>
                <input
                  value={shiftNote}
                  onChange={(event) => setShiftNote(event.target.value)}
                  className="input-ui"
                />
              </label>

              <div className="md:col-span-2">
                <button
                  type="submit"
                  disabled={saving}
                  className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
                >
                  {saving
                    ? 'Speichert...'
                    : shiftEditId
                    ? 'Schicht aktualisieren'
                    : 'Schicht speichern'}
                </button>
              </div>
            </form>

            <div className="mt-5 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
              <table className="w-full min-w-[900px] border-collapse">
                <thead>
                  <tr>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Datum</th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Mitarbeiter</th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Zeit</th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Pause</th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Status</th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Aktion</th>
                  </tr>
                </thead>
                <tbody>
                  {loading ? (
                    <tr>
                      <td colSpan={6} className="px-3 py-3 text-sm text-rose-900/70">
                        Lade Schichten...
                      </td>
                    </tr>
                  ) : shifts.length === 0 ? (
                    <tr>
                      <td colSpan={6} className="px-3 py-3 text-sm text-rose-900/70">
                        Keine Schichten im Zeitraum.
                      </td>
                    </tr>
                  ) : (
                    shifts.map((shift) => (
                      <tr key={shift.id}>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{toDateInput(shift.shiftDate)}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{shift.staffMember.name}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{shift.startTime} - {shift.endTime}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{shift.breakMinutes} Min</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <span className={`rounded-lg px-2 py-1 text-xs font-semibold ${shiftStatusBadge(shift.status)}`}>
                            {shiftStatusLabel(shift.status)}
                          </span>
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <div className="flex gap-2">
                            <button
                              type="button"
                              onClick={() => {
                                setShiftEditId(shift.id)
                                setShiftMemberId(shift.staffMemberId)
                                setShiftDate(toDateInput(shift.shiftDate))
                                setShiftStart(shift.startTime)
                                setShiftEnd(shift.endTime)
                                setShiftBreak(String(shift.breakMinutes))
                                setShiftStatus(shift.status)
                                setShiftNote(shift.note || '')
                                setError('')
                                setSuccess('')
                              }}
                              className="rounded-lg bg-slate-900 px-2 py-1 text-xs font-medium text-white transition hover:bg-slate-800"
                            >
                              Bearbeiten
                            </button>
                            <button
                              type="button"
                              onClick={() => removeShift(shift.id)}
                              className="rounded-lg bg-red-600 px-2 py-1 text-xs font-medium text-white transition hover:bg-red-700"
                            >
                              Loeschen
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))
                  )}
                </tbody>
              </table>
            </div>
          </section>
        </div>
      ) : null}

      {tab === 'evaluation' ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <h2 className="text-xl font-semibold">Auswertung</h2>
          <p className="mt-1 text-sm text-rose-900/70">Stunden, Schichten und Kosten je Mitarbeiter.</p>

          <div className="mt-4 grid gap-3 md:grid-cols-3">
            <InputField label="Von" type="date" value={evalFrom} setValue={setEvalFrom} />
            <InputField label="Bis" type="date" value={evalTo} setValue={setEvalTo} />
            <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm text-rose-900/85">
              <p>Mitarbeiter: {evaluation?.totals.employeeCount ?? 0}</p>
              <p>Geplante Stunden: {evaluation?.totals.plannedHours.toFixed(2) ?? '0.00'}</p>
              <p>Abgeschlossene Stunden: {evaluation?.totals.completedHours.toFixed(2) ?? '0.00'}</p>
            </div>
          </div>

          <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
            <table className="w-full min-w-[1080px] border-collapse">
              <thead>
                <tr>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Mitarbeiter</th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Position</th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Geplant (h)</th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Abgeschlossen (h)</th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Storniert (h)</th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Schichten</th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Stundenlohn</th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">Schaetzung Kosten</th>
                </tr>
              </thead>
              <tbody>
                {loading ? (
                  <tr>
                    <td colSpan={8} className="px-3 py-3 text-sm text-rose-900/70">
                      Lade Auswertung...
                    </td>
                  </tr>
                ) : (evaluation?.rows.length || 0) === 0 ? (
                  <tr>
                    <td colSpan={8} className="px-3 py-3 text-sm text-rose-900/70">
                      Keine Daten im Zeitraum.
                    </td>
                  </tr>
                ) : (
                  evaluation?.rows.map((row) => (
                    <tr key={row.employeeId}>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{row.name}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{row.position || '-'}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{row.plannedHours.toFixed(2)}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{row.completedHours.toFixed(2)}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{row.canceledHours.toFixed(2)}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        G:{row.plannedShifts} A:{row.completedShifts} S:{row.canceledShifts}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {row.hourlyRate === null ? '-' : `${row.hourlyRate.toFixed(2)} EUR`}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {row.estimatedLaborCost === null ? '-' : `${row.estimatedLaborCost.toFixed(2)} EUR`}
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </section>
      ) : null}

      {tab === 'settings' ? (
        <section className="max-w-2xl rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <h2 className="text-xl font-semibold">Einstellungen</h2>
          <p className="mt-1 text-sm text-rose-900/70">Vorgaben fuer Planung und Auswertung.</p>

          <form onSubmit={submitSettings} className="mt-4 space-y-3">
            <InputField
              label="Planungstage Voraus"
              type="number"
              value={planningDays}
              setValue={setPlanningDays}
              required
            />
            <InputField
              label="Standard Startzeit"
              type="time"
              value={defaultShiftStart}
              setValue={setDefaultShiftStart}
              required
            />
            <InputField
              label="Standard Endzeit"
              type="time"
              value={defaultShiftEnd}
              setValue={setDefaultShiftEnd}
              required
            />
            <InputField
              label="Standard Pause (Min)"
              type="number"
              value={defaultBreakMinutes}
              setValue={setDefaultBreakMinutes}
              required
            />
            <InputField
              label="Ueberstunden-Schwelle (Std, optional)"
              type="number"
              step="0.01"
              value={overtimeThresholdHours}
              setValue={setOvertimeThresholdHours}
            />

            <button
              type="submit"
              disabled={saving}
              className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:opacity-60"
            >
              {saving ? 'Speichert...' : 'Einstellungen speichern'}
            </button>
          </form>
        </section>
      ) : null}

    </AdminLayout>
  )
}

function TabButton({
  active,
  onClick,
  children,
}: {
  active: boolean
  onClick: () => void
  children: React.ReactNode
}) {
  return (
    <button
      onClick={onClick}
      className={`rounded-xl px-4 py-2 text-sm font-medium transition ${
        active ? 'bg-slate-900 text-white' : 'bg-white text-rose-900/85 ring-1 ring-[var(--brand-border)] hover:bg-rose-50'
      }`}
    >
      {children}
    </button>
  )
}

function InputField({
  label,
  value,
  setValue,
  type = 'text',
  step,
  required = false,
}: {
  label: string
  value: string
  setValue: (value: string) => void
  type?: string
  step?: string
  required?: boolean
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-sm font-medium text-rose-900/85">{label}</span>
      <input
        type={type}
        step={step}
        required={required}
        value={value}
        onChange={(event) => setValue(event.target.value)}
        className="input-ui"
      />
    </label>
  )
}

