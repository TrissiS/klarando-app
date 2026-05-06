'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createGoodsReceipt,
  createInventoryCount,
  createWriteOff,
  getIngredients,
  getStockMovements,
  getStockOverview,
  updateIngredient,
  type Ingredient,
  type StockMovementRecord,
  type StockMovementType,
  type StockOverviewRow,
} from '@/lib/api'

type MovementTypeFilter = 'ALL' | StockMovementType

const INTEGER_ONLY_UNITS = new Set(['Stueck', 'Dose'])

function formatDate(value: string | null) {
  if (!value) {
    return '-'
  }

  return new Date(value).toLocaleString('de-DE')
}

function movementLabel(type: StockMovementType) {
  if (type === 'GOODS_RECEIPT') {
    return 'Wareneingang'
  }

  if (type === 'WRITE_OFF') {
    return 'Ausbuchung'
  }

  return 'Inventur'
}

function movementBadgeClass(type: StockMovementType) {
  if (type === 'GOODS_RECEIPT') {
    return 'bg-green-100 text-green-700'
  }

  if (type === 'WRITE_OFF') {
    return 'bg-red-100 text-red-700'
  }

  return 'bg-blue-100 text-blue-700'
}

function isSalesMovement(movement: Pick<StockMovementRecord, 'type' | 'reference' | 'note'>) {
  if (movement.type !== 'WRITE_OFF') {
    return false
  }

  const reference = (movement.reference || '').trim().toUpperCase()
  const note = (movement.note || '').trim().toLowerCase()

  return reference.startsWith('ORDER:') || note.includes('verkauf')
}

function movementLabelForRecord(movement: Pick<StockMovementRecord, 'type' | 'reference' | 'note'>) {
  if (isSalesMovement(movement)) {
    return 'Verkauf'
  }
  return movementLabel(movement.type)
}

function movementBadgeClassForRecord(
  movement: Pick<StockMovementRecord, 'type' | 'reference' | 'note'>
) {
  if (isSalesMovement(movement)) {
    return 'bg-violet-100 text-violet-700'
  }
  return movementBadgeClass(movement.type)
}

function isIntegerOnlyUnit(unit?: string | null) {
  return Boolean(unit && INTEGER_ONLY_UNITS.has(unit))
}

function quantityStepByUnit(unit?: string | null) {
  return isIntegerOnlyUnit(unit) ? '1' : '0.001'
}

function formatQuantityByUnit(value: number, unit?: string | null) {
  if (!Number.isFinite(value)) {
    return '-'
  }

  return isIntegerOnlyUnit(unit) ? String(Math.round(value)) : value.toFixed(3)
}

export default function AdminStockPage() {
  const [ingredients, setIngredients] = useState<Ingredient[]>([])
  const [overview, setOverview] = useState<StockOverviewRow[]>([])
  const [movements, setMovements] = useState<StockMovementRecord[]>([])
  const [loading, setLoading] = useState(true)
  const [submitting, setSubmitting] = useState(false)
  const [savingMinimumIngredientId, setSavingMinimumIngredientId] = useState<string | null>(null)
  const [minimumStockDrafts, setMinimumStockDrafts] = useState<Record<string, string>>({})
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const [receiptIngredientId, setReceiptIngredientId] = useState('')
  const [receiptQuantity, setReceiptQuantity] = useState('')
  const [receiptUnitCost, setReceiptUnitCost] = useState('')
  const [receiptReference, setReceiptReference] = useState('')
  const [receiptNote, setReceiptNote] = useState('')

  const [writeOffIngredientId, setWriteOffIngredientId] = useState('')
  const [writeOffQuantity, setWriteOffQuantity] = useState('')
  const [writeOffReference, setWriteOffReference] = useState('')
  const [writeOffNote, setWriteOffNote] = useState('')

  const [inventoryIngredientId, setInventoryIngredientId] = useState('')
  const [inventoryCountedQuantity, setInventoryCountedQuantity] = useState('')
  const [inventoryNote, setInventoryNote] = useState('')

  const [movementTypeFilter, setMovementTypeFilter] = useState<MovementTypeFilter>('ALL')
  const [movementIngredientFilter, setMovementIngredientFilter] = useState('ALL')
  const [showMovements, setShowMovements] = useState(true)

  const ingredientById = useMemo(
    () => new Map(ingredients.map((ingredient) => [ingredient.id, ingredient])),
    [ingredients]
  )

  const receiptIngredient = ingredientById.get(receiptIngredientId)
  const writeOffIngredient = ingredientById.get(writeOffIngredientId)
  const inventoryIngredient = ingredientById.get(inventoryIngredientId)

  async function loadOverviewAndIngredients() {
    const [ingredientData, overviewData] = await Promise.all([
      getIngredients(),
      getStockOverview(),
    ])

    setIngredients(ingredientData)
    setOverview(overviewData)
    setMinimumStockDrafts(
      Object.fromEntries(
        overviewData.map((row) => [row.ingredientId, formatQuantityByUnit(row.minimumStock, row.unit)])
      )
    )

    const defaultIngredientId = ingredientData[0]?.id || ''
    if (defaultIngredientId) {
      setReceiptIngredientId((current) => current || defaultIngredientId)
      setWriteOffIngredientId((current) => current || defaultIngredientId)
      setInventoryIngredientId((current) => current || defaultIngredientId)
    }
  }

  async function loadMovements() {
    const data = await getStockMovements({
      ingredientId: movementIngredientFilter === 'ALL' ? undefined : movementIngredientFilter,
      type: movementTypeFilter === 'ALL' ? undefined : movementTypeFilter,
      limit: 100,
    })
    setMovements(data)
  }

  async function loadData() {
    try {
      setLoading(true)
      setError('')
      await Promise.all([loadOverviewAndIngredients(), loadMovements()])
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Lagerdaten konnten nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadData()
  }, [])

  useEffect(() => {
    loadMovements().catch((loadError) => {
      setError(
        loadError instanceof Error
          ? loadError.message
          : 'Lagerbewegungen konnten nicht geladen werden'
      )
    })
  }, [movementTypeFilter, movementIngredientFilter])

  const totals = useMemo(() => {
    const totalStockValue = overview.reduce((sum, row) => sum + row.stockValue, 0)
    const positiveStockCount = overview.filter((row) => row.currentQuantity > 0).length
    const belowMinimumCount = overview.filter((row) => row.belowMinimum).length

    return {
      totalStockValue,
      positiveStockCount,
      belowMinimumCount,
    }
  }, [overview])

  const noIngredients = ingredients.length === 0

  async function handleGoodsReceipt(e: React.FormEvent) {
    e.preventDefault()

    if (!receiptIngredientId) {
      setError('Bitte zuerst eine Zutat auswaehlen.')
      return
    }

    try {
      setSubmitting(true)
      setError('')
      setSuccess('')

      await createGoodsReceipt({
        ingredientId: receiptIngredientId,
        quantity: Number(receiptQuantity),
        unitCost: receiptUnitCost ? Number(receiptUnitCost) : undefined,
        reference: receiptReference || undefined,
        note: receiptNote || undefined,
      })

      setReceiptQuantity('')
      setReceiptUnitCost('')
      setReceiptReference('')
      setReceiptNote('')
      setSuccess('Wareneingang erfolgreich gebucht.')
      await loadData()
    } catch (submitError) {
      setError(
        submitError instanceof Error
          ? submitError.message
          : 'Wareneingang konnte nicht gebucht werden'
      )
    } finally {
      setSubmitting(false)
    }
  }

  async function handleWriteOff(e: React.FormEvent) {
    e.preventDefault()

    if (!writeOffIngredientId) {
      setError('Bitte zuerst eine Zutat auswaehlen.')
      return
    }

    try {
      setSubmitting(true)
      setError('')
      setSuccess('')

      await createWriteOff({
        ingredientId: writeOffIngredientId,
        quantity: Number(writeOffQuantity),
        reference: writeOffReference || undefined,
        note: writeOffNote || undefined,
      })

      setWriteOffQuantity('')
      setWriteOffReference('')
      setWriteOffNote('')
      setSuccess('Ausbuchung erfolgreich gebucht.')
      await loadData()
    } catch (submitError) {
      setError(
        submitError instanceof Error
          ? submitError.message
          : 'Ausbuchung konnte nicht gebucht werden'
      )
    } finally {
      setSubmitting(false)
    }
  }

  async function handleInventoryCount(e: React.FormEvent) {
    e.preventDefault()

    if (!inventoryIngredientId) {
      setError('Bitte zuerst eine Zutat auswaehlen.')
      return
    }

    try {
      setSubmitting(true)
      setError('')
      setSuccess('')

      await createInventoryCount({
        ingredientId: inventoryIngredientId,
        countedQuantity: Number(inventoryCountedQuantity),
        note: inventoryNote || undefined,
      })

      setInventoryCountedQuantity('')
      setInventoryNote('')
      setSuccess('Inventur erfolgreich gebucht.')
      await loadData()
    } catch (submitError) {
      setError(
        submitError instanceof Error
          ? submitError.message
          : 'Inventur konnte nicht gebucht werden'
      )
    } finally {
      setSubmitting(false)
    }
  }

  async function handleSaveMinimumStock(ingredientId: string) {
    const rawValue = minimumStockDrafts[ingredientId] ?? '0'
    const parsedValue = Number(rawValue)
    const row = overview.find((entry) => entry.ingredientId === ingredientId)
    const integerOnlyUnit = isIntegerOnlyUnit(row?.unit)

    if (!Number.isFinite(parsedValue) || parsedValue < 0) {
      setError('Mindestbestand muss >= 0 sein.')
      return
    }
    if (integerOnlyUnit && !Number.isInteger(parsedValue)) {
      setError('Bei Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt.')
      return
    }

    try {
      setSavingMinimumIngredientId(ingredientId)
      setError('')
      setSuccess('')
      await updateIngredient(ingredientId, {
        minimumStock: parsedValue,
      })
      await loadData()
      setSuccess('Mindestbestand erfolgreich gespeichert.')
    } catch (saveError) {
      setError(
        saveError instanceof Error
          ? saveError.message
          : 'Mindestbestand konnte nicht gespeichert werden'
      )
    } finally {
      setSavingMinimumIngredientId(null)
    }
  }

  return (
    <AdminLayout
      title="Lager"
      subtitle="Wareneingang, Inventur und Ausbuchung fuer Zutaten"
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

      {noIngredients ? (
        <div className="mb-6 rounded-2xl border border-orange-200 bg-orange-50 px-4 py-3 text-sm text-orange-700">
          Keine Zutaten vorhanden. Bitte zuerst Zutaten anlegen, damit Lagerbuchungen moeglich sind.
        </div>
      ) : null}

      <section className="mb-6 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <h2 className="text-xl font-semibold">Lager-Module</h2>
        <p className="mt-1 text-sm text-rose-900/70">
          Lieferanten, Schnellbestellung und Bestellvorschlag sind als Unterbereiche zentral verlinkt.
        </p>
        <div className="mt-4 flex flex-wrap gap-2">
          <Link
            href="/admin/suppliers"
            className="rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50/60"
          >
            Lieferanten
          </Link>
          <Link
            href="/admin/suppliers?focus=quick-order"
            className="rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50/60"
          >
            Schnellbestellung
          </Link>
          <Link
            href="/admin/suppliers?focus=order-suggestion"
            className="rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50/60"
          >
            Bestellvorschlag
          </Link>
          <Link
            href="/admin/calculation"
            className="rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50/60"
          >
            Kalkulation
          </Link>
        </div>
      </section>

      <div className="mb-6 grid gap-4 md:grid-cols-3">
        <MetricCard
          label="Gesamtbestand Wert"
          value={`${totals.totalStockValue.toFixed(2)} EUR`}
        />
        <MetricCard
          label="Zutaten mit Bestand"
          value={String(totals.positiveStockCount)}
        />
        <MetricCard
          label="Unter Mindestbestand"
          value={String(totals.belowMinimumCount)}
        />
      </div>

      <div className="mb-6 grid gap-6 xl:grid-cols-3">
        <StockFormCard
          title="Wareneingang"
          subtitle="Bestand erhoehen"
          onSubmit={handleGoodsReceipt}
        >
          <IngredientSelect
            value={receiptIngredientId}
            onChange={setReceiptIngredientId}
            ingredients={ingredients}
            disabled={noIngredients || submitting}
          />
          <FormField
            label="Menge"
            type="number"
            step={quantityStepByUnit(receiptIngredient?.unit)}
            value={receiptQuantity}
            onChange={setReceiptQuantity}
            required
            disabled={noIngredients || submitting}
          />
          <FormField
            label="EK pro Einheit (optional)"
            type="number"
            step="0.01"
            value={receiptUnitCost}
            onChange={setReceiptUnitCost}
            disabled={noIngredients || submitting}
          />
          <FormField
            label="Beleg/Referenz (optional)"
            value={receiptReference}
            onChange={setReceiptReference}
            disabled={noIngredients || submitting}
          />
          <FormField
            label="Notiz (optional)"
            value={receiptNote}
            onChange={setReceiptNote}
            disabled={noIngredients || submitting}
          />
          <SubmitButton disabled={noIngredients || submitting}>
            Wareneingang buchen
          </SubmitButton>
        </StockFormCard>

        <StockFormCard
          title="Ausbuchung"
          subtitle="Bestand reduzieren"
          onSubmit={handleWriteOff}
        >
          <IngredientSelect
            value={writeOffIngredientId}
            onChange={setWriteOffIngredientId}
            ingredients={ingredients}
            disabled={noIngredients || submitting}
          />
          <FormField
            label="Menge"
            type="number"
            step={quantityStepByUnit(writeOffIngredient?.unit)}
            value={writeOffQuantity}
            onChange={setWriteOffQuantity}
            required
            disabled={noIngredients || submitting}
          />
          <FormField
            label="Referenz (optional)"
            value={writeOffReference}
            onChange={setWriteOffReference}
            disabled={noIngredients || submitting}
          />
          <FormField
            label="Grund/Notiz (optional)"
            value={writeOffNote}
            onChange={setWriteOffNote}
            disabled={noIngredients || submitting}
          />
          <SubmitButton disabled={noIngredients || submitting}>Ausbuchung buchen</SubmitButton>
        </StockFormCard>

        <StockFormCard
          title="Inventur"
          subtitle="Ist-Bestand setzen"
          onSubmit={handleInventoryCount}
        >
          <IngredientSelect
            value={inventoryIngredientId}
            onChange={setInventoryIngredientId}
            ingredients={ingredients}
            disabled={noIngredients || submitting}
          />
          <FormField
            label="Gezaehlter Bestand"
            type="number"
            step={quantityStepByUnit(inventoryIngredient?.unit)}
            value={inventoryCountedQuantity}
            onChange={setInventoryCountedQuantity}
            required
            disabled={noIngredients || submitting}
          />
          <FormField
            label="Notiz (optional)"
            value={inventoryNote}
            onChange={setInventoryNote}
            disabled={noIngredients || submitting}
          />
          <SubmitButton disabled={noIngredients || submitting}>Inventur buchen</SubmitButton>
        </StockFormCard>
      </div>

      <section className="mb-6 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="mb-4 flex items-center justify-between gap-4">
          <div>
            <h2 className="text-xl font-semibold">Lagerbestand pro Zutat</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Aktueller Bestand, EK und Lagerwert je Zutat
            </p>
          </div>
          <button
            onClick={() => loadData()}
            className="rounded-xl bg-slate-900 px-3 py-2 text-sm font-medium text-white transition hover:bg-slate-800"
          >
            Aktualisieren
          </button>
        </div>

        <div className="overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
          <table className="w-full min-w-[1320px] border-collapse">
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
                  Bestand
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Mindestbestand
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Verbrauchsfaktor
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Status
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  EK
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Lagerwert
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Letzte Bewegung
                </th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={10}>
                    Lade Bestandsdaten...
                  </td>
                </tr>
              ) : overview.length === 0 ? (
                <tr>
                  <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={10}>
                    Keine Bestandsdaten vorhanden.
                  </td>
                </tr>
              ) : (
                overview.map((row) => (
                  <tr key={row.ingredientId}>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {row.ingredientName} ({row.unit})
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {row.supplier || '-'}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {row.articleNumber || '-'}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm font-semibold">
                      {formatQuantityByUnit(row.currentQuantity, row.unit)}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <div className="flex items-center gap-2">
                        <input
                          type="number"
                          min="0"
                          step={quantityStepByUnit(row.unit)}
                          value={minimumStockDrafts[row.ingredientId] ?? String(row.minimumStock)}
                          onChange={(event) =>
                            setMinimumStockDrafts((current) => ({
                              ...current,
                              [row.ingredientId]: event.target.value,
                            }))
                          }
                          className="w-28 rounded-lg border border-[var(--brand-border)] px-2 py-1 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                        />
                        <button
                          type="button"
                          disabled={savingMinimumIngredientId === row.ingredientId}
                          onClick={() => void handleSaveMinimumStock(row.ingredientId)}
                          className="rounded-lg border border-[var(--brand-border)] bg-white px-2 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {savingMinimumIngredientId === row.ingredientId ? 'Speichert...' : 'OK'}
                        </button>
                      </div>
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      +{row.consumptionFactorPercent.toFixed(1)} %
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {row.belowMinimum ? (
                        <span className="rounded-full border border-amber-200 bg-amber-50 px-2 py-0.5 text-xs font-semibold text-amber-700">
                          Unter Minimum
                        </span>
                      ) : (
                        <span className="rounded-full border border-emerald-200 bg-emerald-50 px-2 py-0.5 text-xs font-semibold text-emerald-700">
                          OK
                        </span>
                      )}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {Number(row.purchasePrice).toFixed(2)} EUR
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {row.stockValue.toFixed(2)} EUR
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {formatDate(row.lastMovementAt)}
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </section>

      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="mb-4 flex flex-wrap items-end gap-3">
          <div>
            <h2 className="text-xl font-semibold">Lagerbewegungen</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Verlauf von Wareneingang, Inventur, Ausbuchung und Verkauf
            </p>
          </div>

          <div className="ml-auto flex flex-wrap gap-2">
            <button
              type="button"
              onClick={() => setShowMovements((current) => !current)}
              className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50/60"
            >
              {showMovements ? 'Liste minimieren' : 'Liste anzeigen'}
            </button>

            <select
              value={movementTypeFilter}
              onChange={(e) => setMovementTypeFilter(e.target.value as MovementTypeFilter)}
              className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            >
              <option value="ALL">Alle Typen</option>
              <option value="GOODS_RECEIPT">Wareneingang</option>
              <option value="WRITE_OFF">Ausbuchung</option>
              <option value="INVENTORY_COUNT">Inventur</option>
            </select>

            <select
              value={movementIngredientFilter}
              onChange={(e) => setMovementIngredientFilter(e.target.value)}
              className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            >
              <option value="ALL">Alle Zutaten</option>
              {ingredients.map((ingredient) => (
                <option key={ingredient.id} value={ingredient.id}>
                  {ingredient.name}
                </option>
              ))}
            </select>
          </div>
        </div>

        {!showMovements ? (
          <div className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/50 px-4 py-3 text-sm text-rose-900/70">
            Liste minimiert. Aktuell {movements.length} Bewegungen im Filter.
          </div>
        ) : (
          <div className="overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
            <table className="w-full min-w-[1080px] border-collapse">
              <thead>
                <tr>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Zeit
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Typ
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Zutat
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Delta
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Bestand neu
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Beleg
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Notiz
                  </th>
                </tr>
              </thead>
              <tbody>
                {movements.length === 0 ? (
                  <tr>
                    <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={7}>
                      Keine Bewegungen gefunden.
                    </td>
                  </tr>
                ) : (
                  movements.map((movement) => (
                    <tr key={movement.id}>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {formatDate(movement.createdAt)}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        <span
                          className={`rounded-lg px-2 py-1 text-xs font-semibold ${movementBadgeClassForRecord(movement)}`}
                        >
                          {movementLabelForRecord(movement)}
                        </span>
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {movement.ingredient.name} ({movement.ingredient.unit})
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {Number(movement.quantityDelta) > 0 ? '+' : ''}
                        {formatQuantityByUnit(
                          Number(movement.quantityDelta),
                          movement.ingredient.unit
                        )}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {formatQuantityByUnit(
                          Number(movement.resultingQuantity),
                          movement.ingredient.unit
                        )}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {movement.reference || '-'}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {movement.note || '-'}
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        )}
      </section>
    </AdminLayout>
  )
}

function MetricCard({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
      <p className="text-xs uppercase tracking-wide text-rose-900/70">{label}</p>
      <p className="mt-2 text-2xl font-bold text-[var(--brand-ink)]">{value}</p>
    </div>
  )
}

function StockFormCard({
  title,
  subtitle,
  onSubmit,
  children,
}: {
  title: string
  subtitle: string
  onSubmit: (e: React.FormEvent) => void
  children: React.ReactNode
}) {
  return (
    <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
      <h2 className="text-xl font-semibold">{title}</h2>
      <p className="mt-1 text-sm text-rose-900/70">{subtitle}</p>

      <form onSubmit={onSubmit} className="mt-4 space-y-3">
        {children}
      </form>
    </section>
  )
}

function IngredientSelect({
  value,
  onChange,
  ingredients,
  disabled,
}: {
  value: string
  onChange: (value: string) => void
  ingredients: Ingredient[]
  disabled: boolean
}) {
  return (
    <label className="block">
      <span className="mb-1 block text-sm font-medium text-rose-900/85">Zutat</span>
      <select
        value={value}
        onChange={(e) => onChange(e.target.value)}
        disabled={disabled}
        className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60 disabled:cursor-not-allowed disabled:bg-rose-50"
      >
        {ingredients.map((ingredient) => (
          <option key={ingredient.id} value={ingredient.id}>
            {ingredient.name} ({ingredient.unit})
          </option>
        ))}
      </select>
    </label>
  )
}

function FormField({
  label,
  value,
  onChange,
  disabled,
  type = 'text',
  step,
  required = false,
}: {
  label: string
  value: string
  onChange: (value: string) => void
  disabled: boolean
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
        value={value}
        onChange={(e) => onChange(e.target.value)}
        required={required}
        disabled={disabled}
        className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60 disabled:cursor-not-allowed disabled:bg-rose-50"
      />
    </label>
  )
}

function SubmitButton({
  children,
  disabled,
}: {
  children: React.ReactNode
  disabled: boolean
}) {
  return (
    <button
      type="submit"
      disabled={disabled}
      className="w-full rounded-xl bg-slate-900 px-4 py-2 font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
    >
      {children}
    </button>
  )
}

