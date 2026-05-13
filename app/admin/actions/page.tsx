'use client'

import { Suspense, useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createAction,
  deleteAction,
  getActions,
  getActiveActions,
  getProducts,
  updateAction,
  type ActionCampaign,
  type ActionKind,
  type ActionValueType,
  type Product,
} from '@/lib/api'

const WEEKDAY_OPTIONS = [
  { value: 1, label: 'Mo' },
  { value: 2, label: 'Di' },
  { value: 3, label: 'Mi' },
  { value: 4, label: 'Do' },
  { value: 5, label: 'Fr' },
  { value: 6, label: 'Sa' },
  { value: 7, label: 'So' },
]

function toDateTimeLocal(value: string | null) {
  if (!value) {
    return ''
  }

  const date = new Date(value)
  if (Number.isNaN(date.getTime())) {
    return ''
  }

  const offsetMs = date.getTimezoneOffset() * 60000
  return new Date(date.getTime() - offsetMs).toISOString().slice(0, 16)
}

function kindLabel(kind: ActionKind) {
  if (kind === 'DAILY') {
    return 'Taeglich'
  }

  if (kind === 'WEEKLY') {
    return 'Woechentlich'
  }

  return 'Einmalig'
}

function valueTypeLabel(valueType: ActionValueType) {
  return valueType === 'PERCENT' ? 'Prozent' : 'Fixpreis'
}

function formatValue(action: ActionCampaign) {
  const numeric = Number(action.value)
  if (action.valueType === 'PERCENT') {
    return `${numeric.toFixed(2)} %`
  }

  return `${numeric.toFixed(2)} EUR`
}

export default function AdminActionsPage() {
  const [actions, setActions] = useState<ActionCampaign[]>([])
  const [products, setProducts] = useState<Product[]>([])
  const [activeActionIds, setActiveActionIds] = useState<Set<string>>(new Set())
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [deletingId, setDeletingId] = useState<string | null>(null)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const [editingActionId, setEditingActionId] = useState<string | null>(null)
  const [name, setName] = useState('')
  const [description, setDescription] = useState('')
  const [imageUrl, setImageUrl] = useState('')
  const [displayAsMenu, setDisplayAsMenu] = useState(false)
  const [hidePriceOnScreen, setHidePriceOnScreen] = useState(false)
  const [kind, setKind] = useState<ActionKind>('DAILY')
  const [valueType, setValueType] = useState<ActionValueType>('PERCENT')
  const [value, setValue] = useState('')
  const [isActive, setIsActive] = useState(true)
  const [startAt, setStartAt] = useState('')
  const [endAt, setEndAt] = useState('')
  const [dailyStartTime, setDailyStartTime] = useState('')
  const [dailyEndTime, setDailyEndTime] = useState('')
  const [weeklyDays, setWeeklyDays] = useState<number[]>([])
  const [selectedProductIds, setSelectedProductIds] = useState<string[]>([])

  function resetForm() {
    setEditingActionId(null)
    setName('')
    setDescription('')
    setImageUrl('')
    setDisplayAsMenu(false)
    setHidePriceOnScreen(false)
    setKind('DAILY')
    setValueType('PERCENT')
    setValue('')
    setIsActive(true)
    setStartAt('')
    setEndAt('')
    setDailyStartTime('')
    setDailyEndTime('')
    setWeeklyDays([])
    setSelectedProductIds([])
  }

  async function loadData() {
    try {
      setLoading(true)
      setError('')

      const [productsData, actionsData, activeActionsData] = await Promise.all([
        getProducts(),
        getActions(),
        getActiveActions(),
      ])

      setProducts(productsData)
      setActions(actionsData)
      setActiveActionIds(new Set(activeActionsData.map((action) => action.id)))
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Aktionen konnten nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadData()
  }, [])

  async function handleImageUpload(fileList: FileList | null) {
    if (!fileList || fileList.length === 0) {
      return
    }

    const file = fileList[0]
    if (!file.type.startsWith('image/')) {
      setError('Bitte eine gueltige Bilddatei waehlen.')
      return
    }

    const maxBytes = 4 * 1024 * 1024
    if (file.size > maxBytes) {
      setError('Bild ist zu gross (max. 4 MB).')
      return
    }

    const fileReader = new FileReader()
    const dataUrl = await new Promise<string>((resolve, reject) => {
      fileReader.onload = () => resolve(String(fileReader.result || ''))
      fileReader.onerror = () => reject(new Error('Bild konnte nicht gelesen werden'))
      fileReader.readAsDataURL(file)
    })

    setImageUrl(dataUrl)
    setError('')
  }

  const selectedProductsPreview = useMemo(
    () =>
      products
        .filter((product) => selectedProductIds.includes(product.id))
        .map((product) => product.name),
    [products, selectedProductIds]
  )

  async function handleSubmit(event: React.FormEvent) {
    event.preventDefault()

    if (kind === 'WEEKLY' && weeklyDays.length === 0) {
      setError('Bitte mindestens einen Wochentag auswaehlen.')
      return
    }

    if (kind === 'ONE_TIME' && (!startAt || !endAt)) {
      setError('Einmalige Aktionen brauchen Start und Ende.')
      return
    }
    if (displayAsMenu && selectedProductIds.length < 2) {
      setError('Ein Menue braucht mindestens zwei Artikel.')
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      const payload = {
        name,
        description: description || undefined,
        imageUrl: imageUrl || null,
        displayAsMenu,
        hidePriceOnScreen,
        kind,
        valueType,
        value: Number(value),
        isActive,
        startAt: startAt || null,
        endAt: endAt || null,
        weeklyDays: kind === 'WEEKLY' ? weeklyDays : [],
        dailyStartTime: dailyStartTime || null,
        dailyEndTime: dailyEndTime || null,
        productIds: selectedProductIds,
      }

      if (editingActionId) {
        await updateAction(editingActionId, payload)
        setSuccess('Aktion erfolgreich aktualisiert.')
      } else {
        await createAction(payload)
        setSuccess('Aktion erfolgreich erstellt.')
      }

      resetForm()
      await loadData()
    } catch (submitError) {
      setError(submitError instanceof Error ? submitError.message : 'Aktion konnte nicht gespeichert werden')
    } finally {
      setSaving(false)
    }
  }

  async function handleDelete(action: ActionCampaign) {
    if (!window.confirm(`Aktion "${action.name}" wirklich loeschen?`)) {
      return
    }

    try {
      setDeletingId(action.id)
      setError('')
      setSuccess('')
      await deleteAction(action.id)

      if (editingActionId === action.id) {
        resetForm()
      }

      setSuccess('Aktion erfolgreich geloescht.')
      await loadData()
    } catch (deleteError) {
      setError(deleteError instanceof Error ? deleteError.message : 'Aktion konnte nicht geloescht werden')
    } finally {
      setDeletingId(null)
    }
  }

  return (
    <Suspense fallback={<div className="p-4 text-sm text-rose-900/75">Lade Ansicht...</div>}>
      <AdminLayout
        title="Aktionen"
        subtitle="Taegliche, woechentliche und einmalige Aktionen verwalten"
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

      <div className="grid gap-6 xl:grid-cols-[440px_1fr]">
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <h2 className="text-xl font-semibold">
            {editingActionId ? 'Aktion bearbeiten' : 'Neue Aktion'}
          </h2>
                  <p className="mt-1 text-sm text-rose-900/70">
            Typ, Zeitraum, Rabatt, Menue-Zusammenstellung und Bildschirm-Anzeige.
          </p>

          <form onSubmit={handleSubmit} className="mt-4 space-y-3">
            <Field label="Name">
              <input
                value={name}
                onChange={(event) => setName(event.target.value)}
                required
                className="input-ui"
              />
            </Field>

            <Field label="Beschreibung">
              <textarea
                value={description}
                onChange={(event) => setDescription(event.target.value)}
                className="input-ui min-h-[88px]"
              />
            </Field>

            <Field label="Bild fuer Aktion/Menue (optional)">
              <div className="space-y-2">
                <input
                  value={imageUrl}
                  onChange={(event) => setImageUrl(event.target.value)}
                  placeholder="https://... oder Data-URL"
                  className="input-ui"
                />
                <input
                  type="file"
                  accept="image/*"
                  onChange={(event) => {
                    void handleImageUpload(event.target.files)
                    event.currentTarget.value = ''
                  }}
                  className="text-xs text-rose-900/70"
                />
              </div>
            </Field>

            <div className="grid grid-cols-2 gap-3">
              <Field label="Typ">
                <select
                  value={kind}
                  onChange={(event) => setKind(event.target.value as ActionKind)}
                  className="input-ui"
                >
                  <option value="DAILY">Taeglich</option>
                  <option value="WEEKLY">Woechentlich</option>
                  <option value="ONE_TIME">Einmalig</option>
                </select>
              </Field>

              <Field label="Wertart">
                <select
                  value={valueType}
                  onChange={(event) => setValueType(event.target.value as ActionValueType)}
                  className="input-ui"
                >
                  <option value="PERCENT">Prozent</option>
                  <option value="FIXED_PRICE">Fixpreis</option>
                </select>
              </Field>
            </div>

            <div className="grid grid-cols-2 gap-3">
              <Field label={valueType === 'PERCENT' ? 'Rabatt in %' : 'Fixpreis in EUR'}>
                <input
                  type="number"
                  step="0.01"
                  min="0"
                  value={value}
                  onChange={(event) => setValue(event.target.value)}
                  required
                  className="input-ui"
                />
              </Field>

              <label className="mt-6 flex items-center gap-2 text-sm font-medium text-rose-900/85">
                <input
                  type="checkbox"
                  checked={isActive}
                  onChange={(event) => setIsActive(event.target.checked)}
                />
                Aktiv
              </label>
            </div>

            <div className="grid grid-cols-1 gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/45 p-3">
              <label className="flex items-center gap-2 text-sm font-medium text-rose-900/85">
                <input
                  type="checkbox"
                  checked={displayAsMenu}
                  onChange={(event) => setDisplayAsMenu(event.target.checked)}
                />
                Als Menue im Aktionsfenster anzeigen
              </label>
              <label className="flex items-center gap-2 text-sm font-medium text-rose-900/85">
                <input
                  type="checkbox"
                  checked={hidePriceOnScreen}
                  onChange={(event) => setHidePriceOnScreen(event.target.checked)}
                />
                Preis im Aktionsfenster ausblenden
              </label>
            </div>

            <div className="grid grid-cols-2 gap-3">
              <Field label="Start (optional)">
                <input
                  type="datetime-local"
                  value={startAt}
                  onChange={(event) => setStartAt(event.target.value)}
                  className="input-ui"
                />
              </Field>

              <Field label="Ende (optional)">
                <input
                  type="datetime-local"
                  value={endAt}
                  onChange={(event) => setEndAt(event.target.value)}
                  className="input-ui"
                />
              </Field>
            </div>

            <div className="grid grid-cols-2 gap-3">
              <Field label="Taeglich von (optional)">
                <input
                  type="time"
                  value={dailyStartTime}
                  onChange={(event) => setDailyStartTime(event.target.value)}
                  className="input-ui"
                />
              </Field>

              <Field label="Taeglich bis (optional)">
                <input
                  type="time"
                  value={dailyEndTime}
                  onChange={(event) => setDailyEndTime(event.target.value)}
                  className="input-ui"
                />
              </Field>
            </div>

            {kind === 'WEEKLY' ? (
              <div>
                <p className="mb-1 text-sm font-medium text-rose-900/85">Wochentage</p>
                <div className="flex flex-wrap gap-2">
                  {WEEKDAY_OPTIONS.map((day) => {
                    const checked = weeklyDays.includes(day.value)
                    return (
                      <label
                        key={day.value}
                        className={`rounded-xl border px-3 py-2 text-sm ${
                          checked
                            ? 'border-orange-300 bg-orange-50 text-orange-700'
                            : 'border-[var(--brand-border)] bg-white text-rose-900/85'
                        }`}
                      >
                        <input
                          type="checkbox"
                          className="mr-2"
                          checked={checked}
                          onChange={(event) => {
                            setWeeklyDays((current) => {
                              if (event.target.checked) {
                                return [...current, day.value].sort((a, b) => a - b)
                              }

                              return current.filter((valueEntry) => valueEntry !== day.value)
                            })
                          }}
                        />
                        {day.label}
                      </label>
                    )
                  })}
                </div>
              </div>
            ) : null}

            <div>
              <p className="mb-1 text-sm font-medium text-rose-900/85">Produkte</p>
              <div className="max-h-44 space-y-2 overflow-auto rounded-xl border border-[var(--brand-border)] bg-white p-3">
                {products.length === 0 ? (
                  <p className="text-sm text-rose-900/70">Keine Produkte vorhanden.</p>
                ) : (
                  products.map((product) => {
                    const checked = selectedProductIds.includes(product.id)
                    return (
                      <label key={product.id} className="flex items-center gap-2 text-sm text-rose-900/85">
                        <input
                          type="checkbox"
                          checked={checked}
                          onChange={(event) => {
                            setSelectedProductIds((current) => {
                              if (event.target.checked) {
                                return [...current, product.id]
                              }

                              return current.filter((entry) => entry !== product.id)
                            })
                          }}
                        />
                        <span>
                          {product.name} (Nr. {product.productNumber || "-"})
                        </span>
                      </label>
                    )
                  })
                )}
              </div>
              <p className="mt-2 text-xs text-rose-900/70">
                Auswahl: {selectedProductsPreview.length > 0 ? selectedProductsPreview.join(', ') : '-'}
              </p>
            </div>

            <button
              type="submit"
              disabled={saving}
              className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
            >
              {saving
                ? 'Speichert...'
                : editingActionId
                ? 'Aktion aktualisieren'
                : 'Aktion speichern'}
            </button>

            {editingActionId ? (
              <button
                type="button"
                onClick={() => resetForm()}
                className="w-full rounded-xl border border-[var(--brand-border)] px-4 py-2.5 font-medium text-rose-900/85 transition hover:bg-rose-50"
              >
                Bearbeitung abbrechen
              </button>
            ) : null}
          </form>
        </section>

        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <h2 className="text-xl font-semibold">Aktionsliste</h2>
          <p className="mt-1 text-sm text-rose-900/70">Alle angelegten Aktionen je Tenant.</p>

          <div className="mt-4 space-y-3">
            {loading ? (
              <p className="text-sm text-rose-900/70">Lade Aktionen...</p>
            ) : actions.length === 0 ? (
              <p className="text-sm text-rose-900/70">Noch keine Aktionen vorhanden.</p>
            ) : (
              actions.map((action) => (
                <div key={action.id} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
                  <div className="flex flex-wrap items-center gap-2">
                    <h3 className="text-lg font-semibold text-[var(--brand-ink)]">{action.name}</h3>
                    <span className="rounded-lg bg-slate-200 px-2 py-1 text-xs font-semibold text-rose-900/85">
                      {kindLabel(action.kind)}
                    </span>
                    <span className="rounded-lg bg-blue-100 px-2 py-1 text-xs font-semibold text-blue-700">
                      {valueTypeLabel(action.valueType)}
                    </span>
                    <span className="rounded-lg bg-emerald-100 px-2 py-1 text-xs font-semibold text-emerald-700">
                      {formatValue(action)}
                    </span>
                    <span
                      className={`rounded-lg px-2 py-1 text-xs font-semibold ${
                        activeActionIds.has(action.id)
                          ? 'bg-green-100 text-green-700'
                          : 'bg-slate-200 text-rose-900/75'
                      }`}
                    >
                      {activeActionIds.has(action.id) ? 'Aktiv jetzt' : 'Nicht aktiv jetzt'}
                    </span>
                  </div>

                  {action.imageUrl ? (
                    <div className="mt-3">
                      <img
                        src={action.imageUrl}
                        alt={`${action.name} Bild`}
                        className="h-28 w-full rounded-xl border border-[var(--brand-border)] object-cover"
                      />
                    </div>
                  ) : null}

                  <p className="mt-2 text-sm text-rose-900/75">{action.description || '-'}</p>

                  <div className="mt-3 grid gap-2 text-sm text-rose-900/75 md:grid-cols-2">
                    <p>Gueltig von: {action.startAt ? new Date(action.startAt).toLocaleString('de-DE') : '-'}</p>
                    <p>Gueltig bis: {action.endAt ? new Date(action.endAt).toLocaleString('de-DE') : '-'}</p>
                    <p>
                      Zeitfenster: {action.dailyStartTime || '-'} bis {action.dailyEndTime || '-'}
                    </p>
                    <p>
                      Wochentage:{' '}
                      {action.weeklyDays.length > 0 ? action.weeklyDays.join(', ') : '-'}
                    </p>
                  </div>

                  <p className="mt-2 text-sm text-rose-900/75">
                    Produkte:{' '}
                    {action.products.length > 0
                      ? action.products.map((entry) => entry.product.name).join(', ')
                      : 'Keine Produktzuordnung'}
                  </p>
                  <p className="mt-1 text-sm text-rose-900/75">
                    Darstellung: {action.displayAsMenu ? 'Menue' : 'Standard'} | Preisanzeige:{' '}
                    {action.hidePriceOnScreen ? 'ausgeblendet' : 'sichtbar'}
                  </p>

                  <div className="mt-4 flex gap-2">
                    <button
                      type="button"
                      onClick={() => {
                        setEditingActionId(action.id)
                        setName(action.name)
                        setDescription(action.description || '')
                        setImageUrl(action.imageUrl || '')
                        setDisplayAsMenu(Boolean(action.displayAsMenu))
                        setHidePriceOnScreen(Boolean(action.hidePriceOnScreen))
                        setKind(action.kind)
                        setValueType(action.valueType)
                        setValue(String(action.value))
                        setIsActive(action.isActive)
                        setStartAt(toDateTimeLocal(action.startAt))
                        setEndAt(toDateTimeLocal(action.endAt))
                        setDailyStartTime(action.dailyStartTime || '')
                        setDailyEndTime(action.dailyEndTime || '')
                        setWeeklyDays(action.weeklyDays)
                        setSelectedProductIds(action.products.map((entry) => entry.productId))
                        setSuccess('')
                        setError('')
                      }}
                      className="rounded-xl bg-slate-900 px-3 py-1.5 text-sm font-medium text-white transition hover:bg-slate-800"
                    >
                      Bearbeiten
                    </button>
                    <button
                      type="button"
                      disabled={deletingId === action.id}
                      onClick={() => handleDelete(action)}
                      className="rounded-xl bg-red-600 px-3 py-1.5 text-sm font-medium text-white transition hover:bg-red-700 disabled:cursor-not-allowed disabled:opacity-60"
                    >
                      {deletingId === action.id ? 'Loescht...' : 'Loeschen'}
                    </button>
                  </div>
                </div>
              ))
            )}
          </div>
        </section>
      </div>
      </AdminLayout>
    </Suspense>
  )
}

function Field({
  label,
  children,
}: {
  label: string
  children: React.ReactNode
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-sm font-medium text-rose-900/85">{label}</span>
      {children}
    </label>
  )
}

