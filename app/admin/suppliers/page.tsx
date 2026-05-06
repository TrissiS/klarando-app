'use client'

import { Suspense, useEffect, useRef, useState } from 'react'
import { useSearchParams } from 'next/navigation'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import AdminSuppliersSection from '@/app/Components/admin/AdminSuppliersSection'
import {
  createSupplier,
  deleteSupplier,
  getIngredients,
  getStockMovements,
  getStockOverview,
  getSuppliers,
  updateIngredient,
  updateSupplier,
  type Ingredient,
  type StockMovementRecord,
  type StockOverviewRow,
  type SupplierMaster,
} from '@/lib/api'

type IngredientDraft = {
  supplier: string
  articleNumber: string
  purchasePrice: string
}

type SupplierOrderRow = {
  ingredientId: string
  ingredientName: string
  unit: string
  articleNumber: string | null
  currentStock: number
  minimumStock: number
  consumptionFactorPercent: number
  consumedSinceLastOrder: number
  writeOffLast4Weeks: number
  lastOrderAt: string | null
  lastOrderQuantity: number | null
  recommendedQuantity: number
  purchasePrice: number
}

function formatDate(value: string | null) {
  if (!value) return '-'
  return new Date(value).toLocaleString('de-DE')
}

function round3(value: number) {
  return Number(value.toFixed(3))
}

const INTEGER_ONLY_UNITS = new Set(['Stueck', 'Dose'])

function isIntegerOnlyUnit(unit?: string | null) {
  return Boolean(unit && INTEGER_ONLY_UNITS.has(unit))
}

function formatQuantityByUnit(value: number, unit?: string | null) {
  if (!Number.isFinite(value)) return '-'
  return isIntegerOnlyUnit(unit) ? String(Math.round(value)) : value.toFixed(3)
}

function emptyForm(setters: {
  setName: (value: string) => void
  setContactName: (value: string) => void
  setPhone: (value: string) => void
  setEmail: (value: string) => void
  setNotes: (value: string) => void
  setEditingSupplierId: (value: string | null) => void
}) {
  setters.setName('')
  setters.setContactName('')
  setters.setPhone('')
  setters.setEmail('')
  setters.setNotes('')
  setters.setEditingSupplierId(null)
}

function AdminSuppliersPageContent() {
  const searchParams = useSearchParams()
  const [suppliers, setSuppliers] = useState<SupplierMaster[]>([])
  const [ingredients, setIngredients] = useState<Ingredient[]>([])
  const [overview, setOverview] = useState<StockOverviewRow[]>([])
  const [movements, setMovements] = useState<StockMovementRecord[]>([])
  const [ingredientDrafts, setIngredientDrafts] = useState<Record<string, IngredientDraft>>({})
  const [assignmentSupplierId, setAssignmentSupplierId] = useState<string | null>(null)
  const [orderSupplierId, setOrderSupplierId] = useState<string | null>(null)
  const [suggestionCoverageDays, setSuggestionCoverageDays] = useState('14')
  const [orderQuantities, setOrderQuantities] = useState<Record<string, string>>({})
  const [ingredientSearch, setIngredientSearch] = useState('')
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [savingIngredientId, setSavingIngredientId] = useState<string | null>(null)
  const [deletingSupplierId, setDeletingSupplierId] = useState<string | null>(null)
  const [editingSupplierId, setEditingSupplierId] = useState<string | null>(null)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const suggestionSectionRef = useRef<HTMLElement | null>(null)
  const quickOrderSectionRef = useRef<HTMLElement | null>(null)

  const [name, setName] = useState('')
  const [contactName, setContactName] = useState('')
  const [phone, setPhone] = useState('')
  const [email, setEmail] = useState('')
  const [notes, setNotes] = useState('')
  const focus = searchParams.get('focus')

  useEffect(() => {
    if (!focus) return

    const targetRef =
      focus === 'quick-order'
        ? quickOrderSectionRef
        : focus === 'order-suggestion'
          ? suggestionSectionRef
          : null

    if (!targetRef?.current) return

    const timer = window.setTimeout(() => {
      targetRef.current?.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }, 120)

    return () => window.clearTimeout(timer)
  }, [focus, loading])

  async function loadData() {
    try {
      setLoading(true)
      setError('')
      const [supplierData, ingredientData, overviewData, movementData] = await Promise.all([
        getSuppliers(),
        getIngredients(),
        getStockOverview(),
        getStockMovements({ limit: 1000 }),
      ])

      setSuppliers(supplierData)
      setIngredients(ingredientData)
      setOverview(overviewData)
      setMovements(movementData)

      if (!assignmentSupplierId && supplierData[0]?.id) {
        setAssignmentSupplierId(supplierData[0].id)
      } else if (
        assignmentSupplierId &&
        !supplierData.some((supplier) => supplier.id === assignmentSupplierId)
      ) {
        setAssignmentSupplierId(supplierData[0]?.id || null)
      }

      if (!orderSupplierId && supplierData[0]?.id) {
        setOrderSupplierId(supplierData[0].id)
      } else if (
        orderSupplierId &&
        !supplierData.some((supplier) => supplier.id === orderSupplierId)
      ) {
        setOrderSupplierId(supplierData[0]?.id || null)
      }

      setIngredientDrafts(
        Object.fromEntries(
          ingredientData.map((ingredient) => [
            ingredient.id,
            {
              supplier: ingredient.supplier || '',
              articleNumber: ingredient.articleNumber || '',
              purchasePrice: String(Number(ingredient.purchasePrice).toFixed(2)),
            },
          ])
        )
      )
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Fehler beim Laden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadData()
  }, [])

  const selectedAssignmentSupplier =
    suppliers.find((supplier) => supplier.id === assignmentSupplierId) || null
  const selectedOrderSupplier =
    suppliers.find((supplier) => supplier.id === orderSupplierId) || null

  const normalizedOrderSupplierName = (selectedOrderSupplier?.name || '').trim().toLowerCase()
  const ingredientsForSelectedSupplier = ingredients.filter((ingredient) => {
    if (!normalizedOrderSupplierName) return false
    return (ingredient.supplier || '').trim().toLowerCase() === normalizedOrderSupplierName
  })

  const filteredIngredients = ingredients.filter((ingredient) => {
    const query = ingredientSearch.trim().toLowerCase()
    if (!query) return true
    return (
      ingredient.name.toLowerCase().includes(query) ||
      (ingredient.supplier || '').toLowerCase().includes(query) ||
      (ingredient.articleNumber || '').toLowerCase().includes(query)
    )
  })

  const stockByIngredientId = new Map(
    overview.map((row) => [row.ingredientId, row.currentQuantity])
  )
  const minimumByIngredientId = new Map(
    overview.map((row) => [row.ingredientId, row.minimumStock])
  )

  const movementsByIngredientId = new Map<string, StockMovementRecord[]>()
  for (const movement of movements) {
    const current = movementsByIngredientId.get(movement.ingredientId) || []
    current.push(movement)
    movementsByIngredientId.set(movement.ingredientId, current)
  }

  const suggestionDays = Math.max(1, Number(suggestionCoverageDays) || 14)

  const orderRows: SupplierOrderRow[] = ingredientsForSelectedSupplier.map((ingredient) => {
    const ingredientMovements = (movementsByIngredientId.get(ingredient.id) || []).sort(
      (a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime()
    )

    const lastOrder = ingredientMovements.find((movement) => movement.type === 'GOODS_RECEIPT') || null
    const lastOrderAt = lastOrder?.createdAt || null
    const lastOrderQuantity = lastOrder ? Number(lastOrder.quantityDelta) : null
    const lastOrderTime = lastOrderAt ? new Date(lastOrderAt).getTime() : null
    const fourWeeksAgo = Date.now() - 28 * 24 * 60 * 60 * 1000

    const consumedSinceLastOrder = ingredientMovements.reduce((sum, movement) => {
      const delta = Number(movement.quantityDelta)
      const movementTime = new Date(movement.createdAt).getTime()
      if (delta >= 0) return sum
      if (lastOrderTime && movementTime <= lastOrderTime) return sum
      return sum + Math.abs(delta)
    }, 0)

    const writeOffLast4Weeks = ingredientMovements.reduce((sum, movement) => {
      const delta = Number(movement.quantityDelta)
      const movementTime = new Date(movement.createdAt).getTime()
      if (movement.type !== 'WRITE_OFF') return sum
      if (movementTime < fourWeeksAgo) return sum
      return sum + Math.abs(delta)
    }, 0)

    const consumedLast4Weeks = ingredientMovements.reduce((sum, movement) => {
      const delta = Number(movement.quantityDelta)
      const movementTime = new Date(movement.createdAt).getTime()
      if (delta >= 0) return sum
      if (movementTime < fourWeeksAgo) return sum
      return sum + Math.abs(delta)
    }, 0)

    const currentStock = stockByIngredientId.get(ingredient.id) || 0
    const minimumStock = minimumByIngredientId.get(ingredient.id) || 0
    const targetStock = (consumedLast4Weeks / 28) * suggestionDays + minimumStock
    const recommendedRaw = Math.max(0, targetStock - currentStock)
    const recommendedQuantity = isIntegerOnlyUnit(ingredient.unit)
      ? Math.ceil(recommendedRaw)
      : round3(recommendedRaw)

    return {
      ingredientId: ingredient.id,
      ingredientName: ingredient.name,
      unit: ingredient.unit,
      articleNumber: ingredient.articleNumber,
      currentStock,
      minimumStock: isIntegerOnlyUnit(ingredient.unit) ? Math.round(minimumStock) : round3(minimumStock),
      consumptionFactorPercent: round3(Number(ingredient.consumptionFactorPercent || 0)),
      consumedSinceLastOrder: round3(consumedSinceLastOrder),
      writeOffLast4Weeks: round3(writeOffLast4Weeks),
      lastOrderAt,
      lastOrderQuantity:
        lastOrderQuantity !== null
          ? isIntegerOnlyUnit(ingredient.unit)
            ? Math.round(lastOrderQuantity)
            : round3(lastOrderQuantity)
          : null,
      recommendedQuantity,
      purchasePrice: Number(ingredient.purchasePrice),
    }
  })

  useEffect(() => {
    if (!selectedOrderSupplier) {
      setOrderQuantities({})
      return
    }

    setOrderQuantities((current) => {
      const next = { ...current }
      for (const row of orderRows) {
        if (next[row.ingredientId] === undefined) {
          next[row.ingredientId] = String(row.recommendedQuantity)
        }
      }
      return next
    })
  }, [orderSupplierId, selectedOrderSupplier?.name, suggestionDays, orderRows.length])

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      if (editingSupplierId) {
        await updateSupplier(editingSupplierId, {
          name,
          contactName: contactName || null,
          phone: phone || null,
          email: email || null,
          notes: notes || null,
        })
        setSuccess('Lieferant wurde aktualisiert.')
      } else {
        await createSupplier({
          name,
          contactName,
          phone,
          email,
          notes,
        })
        setSuccess('Lieferant wurde erstellt.')
      }

      emptyForm({
        setName,
        setContactName,
        setPhone,
        setEmail,
        setNotes,
        setEditingSupplierId,
      })
      await loadData()
    } catch (submitError) {
      setError(submitError instanceof Error ? submitError.message : 'Speichern fehlgeschlagen')
    } finally {
      setSaving(false)
    }
  }

  async function onDelete(supplier: SupplierMaster) {
    if (supplier.ingredientCount > 0) {
      setError(
        'Lieferant kann nicht geloescht werden, solange Zutaten zugeordnet sind.'
      )
      return
    }

    if (!window.confirm(`Lieferant "${supplier.name}" wirklich loeschen?`)) {
      return
    }

    try {
      setDeletingSupplierId(supplier.id)
      setError('')
      setSuccess('')
      await deleteSupplier(supplier.id)

      if (editingSupplierId === supplier.id) {
        emptyForm({
          setName,
          setContactName,
          setPhone,
          setEmail,
          setNotes,
          setEditingSupplierId,
        })
      }

      await loadData()
      setSuccess('Lieferant wurde geloescht.')
    } catch (deleteError) {
      setError(deleteError instanceof Error ? deleteError.message : 'Loeschen fehlgeschlagen')
    } finally {
      setDeletingSupplierId(null)
    }
  }

  async function saveIngredientAssignment(ingredientId: string) {
    const draft = ingredientDrafts[ingredientId]
    if (!draft) return

    const parsedPrice = Number(draft.purchasePrice)
    if (!Number.isFinite(parsedPrice) || parsedPrice < 0) {
      setError('EK muss eine gueltige Zahl sein.')
      return
    }

    try {
      setSavingIngredientId(ingredientId)
      setError('')
      setSuccess('')

      await updateIngredient(ingredientId, {
        supplier: draft.supplier || null,
        articleNumber: draft.articleNumber || null,
        purchasePrice: parsedPrice,
      })

      setSuccess('Artikelzuweisung gespeichert.')
      await loadData()
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'Artikelzuweisung konnte nicht gespeichert werden'
      )
    } finally {
      setSavingIngredientId(null)
    }
  }

  function setSupplierForIngredient(ingredientId: string, supplierName: string) {
    setIngredientDrafts((current) => ({
      ...current,
      [ingredientId]: {
        ...(current[ingredientId] || {
          supplier: '',
          articleNumber: '',
          purchasePrice: '0',
        }),
        supplier: supplierName,
      },
    }))
  }

  function resetOrderQuantitiesToSuggestion() {
    setOrderQuantities(
      Object.fromEntries(orderRows.map((row) => [row.ingredientId, String(row.recommendedQuantity)]))
    )
  }

  function buildOrderRowsWithQuantity() {
    return orderRows
      .map((row) => ({
        ...row,
        orderQuantity: (() => {
          const parsed = Number(orderQuantities[row.ingredientId] || 0)
          if (!Number.isFinite(parsed) || parsed <= 0) {
            return 0
          }
          return isIntegerOnlyUnit(row.unit) ? Math.round(parsed) : parsed
        })(),
      }))
      .filter((row) => Number.isFinite(row.orderQuantity) && row.orderQuantity > 0)
  }

  function buildOrderText() {
    const selectedRows = buildOrderRowsWithQuantity()
    if (!selectedOrderSupplier) return ''
    if (selectedRows.length === 0) return ''

    const header = [
      `Bestellung fuer Lieferant: ${selectedOrderSupplier.name}`,
      `Datum: ${new Date().toLocaleDateString('de-DE')}`,
      '',
      'Positionen:',
    ]

    const lines = selectedRows.map((row, index) => {
      const line = [
        `${index + 1}. ${row.ingredientName}`,
        `Menge: ${formatQuantityByUnit(row.orderQuantity, row.unit)} ${row.unit}`,
        `Art.-Nr.: ${row.articleNumber || '-'}`,
        `EK: ${row.purchasePrice.toFixed(2)} EUR`,
        `Bestand aktuell: ${formatQuantityByUnit(row.currentStock, row.unit)} ${row.unit}`,
        `Verbrauch seit letzter Bestellung: ${formatQuantityByUnit(row.consumedSinceLastOrder, row.unit)} ${row.unit}`,
        `Letzte Bestellung: ${row.lastOrderAt ? formatDate(row.lastOrderAt) : '-'}`,
      ]
      return line.join(' | ')
    })

    return [...header, ...lines].join('\n')
  }

  async function copyOrderToClipboard() {
    const text = buildOrderText()
    if (!text) {
      setError('Keine Bestellpositionen mit Menge > 0 vorhanden.')
      return
    }

    try {
      await navigator.clipboard.writeText(text)
      setSuccess('Bestelltext wurde in die Zwischenablage kopiert.')
    } catch {
      setError('Kopieren fehlgeschlagen. Bitte Browserrechte pruefen.')
    }
  }

  function sendOrderEmail() {
    const text = buildOrderText()
    if (!selectedOrderSupplier) {
      setError('Bitte zuerst einen Lieferanten auswaehlen.')
      return
    }
    if (!text) {
      setError('Keine Bestellpositionen mit Menge > 0 vorhanden.')
      return
    }

    const subject = `Bestellung ${selectedOrderSupplier.name} ${new Date().toLocaleDateString('de-DE')}`
    const targetEmail = selectedOrderSupplier.email || ''
    const href = `mailto:${targetEmail}?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(text)}`
    window.location.href = href
  }

  return (
    <Suspense fallback={<div className="p-4 text-sm text-rose-900/75">Lade Ansicht...</div>}>
      <AdminLayout
        title="Lieferanten"
        subtitle="Lieferanten-Stamm, Artikelnummern und EK-Zuordnung der Zutaten verwalten"
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

      <AdminSuppliersSection
        suppliers={suppliers}
        loading={loading}
        name={name}
        setName={setName}
        contactName={contactName}
        setContactName={setContactName}
        phone={phone}
        setPhone={setPhone}
        email={email}
        setEmail={setEmail}
        notes={notes}
        setNotes={setNotes}
        saving={saving}
        deletingSupplierId={deletingSupplierId}
        editingSupplierId={editingSupplierId}
        onSubmit={onSubmit}
        onCancelEdit={() =>
          emptyForm({
            setName,
            setContactName,
            setPhone,
            setEmail,
            setNotes,
            setEditingSupplierId,
          })
        }
        onEdit={(supplier) => {
          setAssignmentSupplierId(supplier.id)
          setOrderSupplierId(supplier.id)
          setEditingSupplierId(supplier.id)
          setName(supplier.name)
          setContactName(supplier.contactName || '')
          setPhone(supplier.phone || '')
          setEmail(supplier.email || '')
          setNotes(supplier.notes || '')
          setError('')
          setSuccess('')
        }}
        onDelete={onDelete}
      />

      <section className="mt-6 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="mb-4 flex flex-wrap items-end gap-3">
          <div>
            <h2 className="text-xl font-semibold">Artikelzuweisung verbessern</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Zutaten schnell einem Lieferanten zuordnen, Art.-Nr. und EK direkt pflegen.
            </p>
          </div>
          <div className="ml-auto">
            <label className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
              Aktiver Lieferant
            </label>
            <select
              value={assignmentSupplierId || ''}
              onChange={(event) => setAssignmentSupplierId(event.target.value || null)}
              className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            >
              <option value="">Lieferant waehlen</option>
              {suppliers.map((supplier) => (
                <option key={supplier.id} value={supplier.id}>
                  {supplier.name}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="mb-3">
          <input
            value={ingredientSearch}
            onChange={(event) => setIngredientSearch(event.target.value)}
            placeholder="Zutat, Lieferant oder Artikelnummer suchen"
            className="w-full max-w-md rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
          />
        </div>

        <div className="overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
          <table className="w-full min-w-[980px] border-collapse">
            <thead>
              <tr>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Zutat
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Lieferant
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Art.-Nr.
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  EK
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Schnellzuweisung
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Speichern
                </th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={6}>
                    Lade Zutaten...
                  </td>
                </tr>
              ) : filteredIngredients.length === 0 ? (
                <tr>
                  <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={6}>
                    Keine Zutaten gefunden.
                  </td>
                </tr>
              ) : (
                filteredIngredients.map((ingredient) => {
                  const draft = ingredientDrafts[ingredient.id] || {
                    supplier: ingredient.supplier || '',
                    articleNumber: ingredient.articleNumber || '',
                    purchasePrice: String(Number(ingredient.purchasePrice).toFixed(2)),
                  }
                  const savingRow = savingIngredientId === ingredient.id

                  return (
                    <tr key={ingredient.id}>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {ingredient.name} ({ingredient.unit})
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        <input
                          value={draft.supplier}
                          onChange={(event) =>
                            setIngredientDrafts((current) => ({
                              ...current,
                              [ingredient.id]: { ...draft, supplier: event.target.value },
                            }))
                          }
                          className="w-44 rounded-lg border border-[var(--brand-border)] px-2.5 py-1.5 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                        />
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        <input
                          value={draft.articleNumber}
                          onChange={(event) =>
                            setIngredientDrafts((current) => ({
                              ...current,
                              [ingredient.id]: { ...draft, articleNumber: event.target.value },
                            }))
                          }
                          className="w-36 rounded-lg border border-[var(--brand-border)] px-2.5 py-1.5 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                        />
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        <input
                          type="number"
                          step="0.01"
                          value={draft.purchasePrice}
                          onChange={(event) =>
                            setIngredientDrafts((current) => ({
                              ...current,
                              [ingredient.id]: { ...draft, purchasePrice: event.target.value },
                            }))
                          }
                          className="w-28 rounded-lg border border-[var(--brand-border)] px-2.5 py-1.5 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                        />
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        <button
                          type="button"
                          disabled={!selectedAssignmentSupplier}
                          onClick={() =>
                            selectedAssignmentSupplier
                              ? setSupplierForIngredient(ingredient.id, selectedAssignmentSupplier.name)
                              : null
                          }
                          className="rounded-lg border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50/60 disabled:cursor-not-allowed disabled:opacity-50"
                        >
                          {selectedAssignmentSupplier ? `Auf ${selectedAssignmentSupplier.name}` : 'Lieferant waehlen'}
                        </button>
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        <button
                          type="button"
                          onClick={() => void saveIngredientAssignment(ingredient.id)}
                          disabled={savingRow}
                          className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {savingRow ? 'Speichert...' : 'Speichern'}
                        </button>
                      </td>
                    </tr>
                  )
                })
              )}
            </tbody>
          </table>
        </div>
      </section>

      <section
        id="bestellvorschlag"
        ref={suggestionSectionRef}
        className="mt-6 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]"
      >
        <div className="mb-4 flex flex-wrap items-end gap-3">
          <div>
            <h2 className="text-xl font-semibold">Bestellvorschlag</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Verbrauch seit letzter Bestellung, Ausbuchungen und aktueller Bestand als Bestellbasis.
              Die Schnellbestellung findest du direkt darunter.
            </p>
          </div>
          <div className="ml-auto flex flex-wrap items-end gap-2">
            <label className="block">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Haendler fuer Bestellung
              </span>
              <select
                value={orderSupplierId || ''}
                onChange={(event) => setOrderSupplierId(event.target.value || null)}
                className="w-60 rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              >
                <option value="">Lieferant waehlen</option>
                {suppliers.map((supplier) => (
                  <option key={supplier.id} value={supplier.id}>
                    {supplier.name}
                  </option>
                ))}
              </select>
            </label>
            <label className="block">
              <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-900/75">
                Reichweite (Tage)
              </span>
              <input
                type="number"
                min={1}
                value={suggestionCoverageDays}
                onChange={(event) => setSuggestionCoverageDays(event.target.value)}
                className="w-28 rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>
            <button
              type="button"
              onClick={resetOrderQuantitiesToSuggestion}
              className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50/60"
            >
              Vorschlag neu setzen
            </button>
          </div>
        </div>

        <section
          id="quick-order"
          ref={quickOrderSectionRef}
          aria-hidden="true"
          className="h-0 w-0 overflow-hidden"
        />

        {!selectedOrderSupplier ? (
          <p className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
            Bitte einen Haendler fuer die Bestellung auswaehlen.
          </p>
        ) : (
          <>
            <div className="mb-3 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
              Lieferant: <span className="font-semibold">{selectedOrderSupplier.name}</span>
              {selectedOrderSupplier.email ? ` | E-Mail: ${selectedOrderSupplier.email}` : ' | Keine E-Mail hinterlegt'}
            </div>

            <div className="overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
              <table className="w-full min-w-[1280px] border-collapse">
                <thead>
                  <tr>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Zutat
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Art.-Nr.
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Bestand aktuell
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Mindestbestand
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Verbrauchsfaktor
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Letzte Bestellung
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Verbrauch seit letzter Bestellung
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Ausgebucht letzte 4 Wochen
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Auto-Vorschlag
                    </th>
                    <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                      Bestellmenge
                    </th>
                  </tr>
                </thead>
                <tbody>
                  {orderRows.length === 0 ? (
                    <tr>
                      <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={10}>
                        Fuer diesen Lieferanten sind noch keine Zutaten zugeordnet.
                      </td>
                    </tr>
                  ) : (
                    orderRows.map((row) => (
                      <tr key={row.ingredientId}>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          {row.ingredientName} ({row.unit})
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">{row.articleNumber || '-'}</td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          {formatQuantityByUnit(row.currentStock, row.unit)} {row.unit}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          {formatQuantityByUnit(row.minimumStock, row.unit)} {row.unit}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          +{row.consumptionFactorPercent.toFixed(1)} %
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          {row.lastOrderAt
                            ? `${formatDate(row.lastOrderAt)} (${formatQuantityByUnit(
                                row.lastOrderQuantity ?? 0,
                                row.unit
                              )} ${row.unit})`
                            : '-'}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          {formatQuantityByUnit(row.consumedSinceLastOrder, row.unit)} {row.unit}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          {formatQuantityByUnit(row.writeOffLast4Weeks, row.unit)} {row.unit}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm font-semibold text-orange-700">
                          {formatQuantityByUnit(row.recommendedQuantity, row.unit)} {row.unit}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <input
                            type="number"
                            step={isIntegerOnlyUnit(row.unit) ? '1' : '0.001'}
                            min={0}
                            value={orderQuantities[row.ingredientId] ?? String(row.recommendedQuantity)}
                            onChange={(event) =>
                              setOrderQuantities((current) => ({
                                ...current,
                                [row.ingredientId]: event.target.value,
                              }))
                            }
                            className="w-28 rounded-lg border border-[var(--brand-border)] px-2.5 py-1.5 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                          />
                        </td>
                      </tr>
                    ))
                  )}
                </tbody>
              </table>
            </div>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 px-4 py-4">
              <h3 className="text-base font-semibold text-[var(--brand-ink)]">Schnellbestellung</h3>
              <p className="mt-1 text-sm text-rose-900/75">
                Uebernimm die Mengen aus dem Vorschlag oder passe sie manuell an und sende direkt.
              </p>
              <div className="mt-3 flex flex-wrap gap-2">
                <button
                  type="button"
                  onClick={() => void copyOrderToClipboard()}
                  className="rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2.5 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                >
                  Bestellungstext kopieren
                </button>
                <button
                  type="button"
                  onClick={sendOrderEmail}
                  className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-medium text-white transition hover:bg-slate-800"
                >
                  Bestellung per E-Mail vorbereiten
                </button>
              </div>
            </div>
          </>
        )}
      </section>
      </AdminLayout>
    </Suspense>
  )
}

export default function AdminSuppliersPage() {
  return (
    <Suspense fallback={<div className="p-4 text-sm text-rose-900/75">Lade Lieferanten...</div>}>
      <AdminSuppliersPageContent />
    </Suspense>
  )
}

