import { useMemo, useState } from 'react'
import type { Ingredient, Product, UnitEanEntry } from '@/lib/api'

type Props = {
  ingredients: Ingredient[]
  products: Product[]
  productTemplateId: string
  loading: boolean
  ingredientName: string
  setIngredientName: (value: string) => void
  ingredientCategory: 'FOOD' | 'PACKAGING'
  setIngredientCategory: (value: 'FOOD' | 'PACKAGING') => void
  ingredientUnit: string
  setIngredientUnit: (value: string) => void
  recipeUnit: string
  setRecipeUnit: (value: string) => void
  gramsPerPurchaseUnit: string
  setGramsPerPurchaseUnit: (value: string) => void
  purchasePrice: string
  setPurchasePrice: (value: string) => void
  minimumStock: string
  setMinimumStock: (value: string) => void
  consumptionFactorPercent: string
  setConsumptionFactorPercent: (value: string) => void
  deposit: string
  setDeposit: (value: string) => void
  ingredientEan: string
  setIngredientEan: (value: string) => void
  ingredientUnitEans: UnitEanEntry[]
  setIngredientUnitEans: (value: UnitEanEntry[]) => void
  allergens: string
  setAllergens: (value: string) => void
  supplier: string
  setSupplier: (value: string) => void
  articleNumber: string
  setArticleNumber: (value: string) => void
  savingIngredient: boolean
  editingIngredientId: string | null
  deletingIngredientId: string | null
  onSubmit: (e: React.FormEvent) => void
  onApplyProductTemplate: (templateId: string) => void
  setProductTemplateId: (value: string) => void
  onEdit: (ingredient: Ingredient) => void
  onDelete: (ingredient: Ingredient) => void
  onCancelEdit: () => void
}

const ALLERGEN_CODES = [
  { code: 'A', label: 'Gluten' },
  { code: 'B', label: 'Krebstiere' },
  { code: 'C', label: 'Ei' },
  { code: 'D', label: 'Fisch' },
  { code: 'E', label: 'Erdnuesse' },
  { code: 'F', label: 'Soja' },
  { code: 'G', label: 'Milch' },
  { code: 'H', label: 'Schalenfruechte' },
  { code: 'I', label: 'Sellerie' },
  { code: 'J', label: 'Senf' },
  { code: 'K', label: 'Sesam' },
  { code: 'L', label: 'Sulfite' },
  { code: 'M', label: 'Lupinen' },
  { code: 'N', label: 'Weichtiere' },
  { code: '1', label: 'Konservierung' },
  { code: '2', label: 'Farbstoff' },
  { code: '3', label: 'Antioxidation' },
  { code: '4', label: 'Geschmacksverstaerker' },
  { code: '5', label: 'Geschwefelt' },
  { code: '6', label: 'Geschwaerzt' },
  { code: '7', label: 'Gewachst' },
  { code: '8', label: 'Phosphat' },
]

const ALLERGEN_LABEL_BY_CODE: Record<string, string> = Object.fromEntries(
  ALLERGEN_CODES.map((entry) => [entry.code, entry.label])
)

type IngredientColumnKey =
  | 'category'
  | 'units'
  | 'purchase'
  | 'stock'
  | 'factor'
  | 'supplier'
  | 'articleNumber'
  | 'ean'
  | 'allergens'

const INGREDIENT_COLUMN_FILTERS: Array<{ key: IngredientColumnKey; label: string }> = [
  { key: 'category', label: 'Kategorie' },
  { key: 'units', label: 'Einheit / Rezept' },
  { key: 'purchase', label: 'Einkauf' },
  { key: 'stock', label: 'Min.-Bestand' },
  { key: 'factor', label: 'Verbrauchsfaktor' },
  { key: 'supplier', label: 'Lieferant' },
  { key: 'articleNumber', label: 'Art.-Nr.' },
  { key: 'ean', label: 'EAN' },
  { key: 'allergens', label: 'Allergene' },
]

function normalizeAllergenInput(value: string) {
  const unique = Array.from(
    new Set(
      value
        .split(',')
        .map((entry) => entry.trim().toUpperCase())
        .filter(Boolean)
    )
  )

  return unique.sort((left, right) => left.localeCompare(right)).join(',')
}

function parseAllergenCodes(value?: string | null) {
  if (!value) {
    return [] as string[]
  }

  return Array.from(
    new Set(
      value
        .split(',')
        .map((entry) => entry.trim().toUpperCase())
        .filter(Boolean)
    )
  ).sort((left, right) => left.localeCompare(right, 'de-DE', { numeric: true }))
}

const INTEGER_ONLY_UNITS = new Set(['Stueck', 'Dose'])

function isIntegerOnlyUnit(unit?: string | null) {
  return Boolean(unit && INTEGER_ONLY_UNITS.has(unit))
}

function formatQuantityByUnit(value: string | number | null | undefined, unit?: string | null) {
  const parsed = Number(value ?? 0)
  if (!Number.isFinite(parsed)) {
    return '-'
  }

  if (isIntegerOnlyUnit(unit)) {
    return String(Math.round(parsed))
  }

  return parsed.toFixed(3)
}

export default function AdminIngredientsSection({
  ingredients,
  products,
  productTemplateId,
  loading,
  ingredientName,
  setIngredientName,
  ingredientCategory,
  setIngredientCategory,
  ingredientUnit,
  setIngredientUnit,
  recipeUnit,
  setRecipeUnit,
  gramsPerPurchaseUnit,
  setGramsPerPurchaseUnit,
  purchasePrice,
  setPurchasePrice,
  minimumStock,
  setMinimumStock,
  consumptionFactorPercent,
  setConsumptionFactorPercent,
  deposit,
  setDeposit,
  ingredientEan,
  setIngredientEan,
  ingredientUnitEans,
  setIngredientUnitEans,
  allergens,
  setAllergens,
  supplier,
  setSupplier,
  articleNumber,
  setArticleNumber,
  savingIngredient,
  editingIngredientId,
  deletingIngredientId,
  onSubmit,
  onApplyProductTemplate,
  setProductTemplateId,
  onEdit,
  onDelete,
  onCancelEdit,
}: Props) {
  const [search, setSearch] = useState('')
  const [visibleColumns, setVisibleColumns] = useState<Record<IngredientColumnKey, boolean>>({
    category: true,
    units: true,
    purchase: true,
    stock: true,
    factor: true,
    supplier: true,
    articleNumber: false,
    ean: false,
    allergens: true,
  })

  const selectedAllergens = useMemo(
    () =>
      normalizeAllergenInput(allergens)
        .split(',')
        .filter(Boolean),
    [allergens]
  )

  const filteredIngredients = useMemo(() => {
    const query = search.trim().toLowerCase()
    if (!query) {
      return ingredients
    }

    return ingredients.filter((ingredient) => {
      const readableAllergens = parseAllergenCodes(ingredient.allergens)
        .map((code) => `${code} ${ALLERGEN_LABEL_BY_CODE[code] || ''}`.trim())
        .join(' ')

      const combined = [
        ingredient.name,
        ingredient.category === 'PACKAGING' ? 'verpackung packaging' : 'lebensmittel food',
        ingredient.ean || '',
        ingredient.recipeUnit || '',
        ingredient.supplier || '',
        ingredient.articleNumber || '',
        ingredient.allergens || '',
        readableAllergens,
      ]
        .join(' ')
        .toLowerCase()

      return combined.includes(query)
    })
  }, [ingredients, search])

  const visibleColumnCount = 2 + INGREDIENT_COLUMN_FILTERS.filter((entry) => visibleColumns[entry.key]).length
  const minimumStockStep = isIntegerOnlyUnit(ingredientUnit) ? '1' : '0.001'

  function toggleColumn(key: IngredientColumnKey) {
    setVisibleColumns((previous) => ({ ...previous, [key]: !previous[key] }))
  }

  function toggleAllergen(code: string) {
    const current = new Set(selectedAllergens)
    if (current.has(code)) {
      current.delete(code)
    } else {
      current.add(code)
    }

    setAllergens(Array.from(current).sort((a, b) => a.localeCompare(b)).join(','))
  }

  function updateUnitEan(index: number, patch: Partial<UnitEanEntry>) {
    setIngredientUnitEans(
      ingredientUnitEans.map((entry, itemIndex) =>
        itemIndex === index ? { ...entry, ...patch } : entry
      )
    )
  }

  function addUnitEanRow() {
    setIngredientUnitEans([
      ...ingredientUnitEans,
      {
        label: '',
        ean: '',
        unitCount: 1,
        unitLabel: '',
      },
    ])
  }

  function removeUnitEanRow(index: number) {
    setIngredientUnitEans(ingredientUnitEans.filter((_, itemIndex) => itemIndex !== index))
  }

  function applySaladPreset() {
    setIngredientUnit('Stueck')
    setRecipeUnit('g')
    if (!gramsPerPurchaseUnit) {
      setGramsPerPurchaseUnit('300')
    }
  }

  return (
    <div className="grid min-w-0 gap-6 xl:grid-cols-[minmax(300px,380px)_minmax(0,1fr)]">
      <section className="min-w-0 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <h2 className="text-xl font-semibold">
          {editingIngredientId ? 'Zutat bearbeiten' : 'Neue Zutat'}
        </h2>
        <p className="mt-1 text-sm text-rose-900/70">
          Einkauf, Lieferant und Allergene strukturiert pflegen.
        </p>

        <div className="mt-4 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
          <p className="text-sm font-semibold text-slate-800">Produkt als Zutat übernehmen</p>
          <p className="mt-1 text-xs text-rose-900/75">
            Damit kannst du einen Artikel direkt als neue Zutat vorbelegen.
          </p>
          <div className="mt-2 flex flex-wrap gap-2">
            <select
              value={productTemplateId}
              onChange={(event) => setProductTemplateId(event.target.value)}
              className="min-w-[240px] flex-1 rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            >
              <option value="">Produkt wählen</option>
              {products.map((product) => (
                <option key={product.id} value={product.id}>
                  {product.productNumber} - {product.name}
                </option>
              ))}
            </select>
            <button
              type="button"
              onClick={() => onApplyProductTemplate(productTemplateId)}
              disabled={!productTemplateId}
              className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs font-semibold text-rose-900/85 transition hover:bg-rose-50 disabled:cursor-not-allowed disabled:opacity-50"
            >
              Als Zutat übernehmen
            </button>
          </div>
        </div>

        <form onSubmit={onSubmit} className="mt-4 space-y-4">
          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Name</span>
            <input
              value={ingredientName}
              onChange={(event) => setIngredientName(event.target.value)}
              placeholder="z. B. Weizenbrot"
              required
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            />
          </label>

          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Kategorie</span>
            <select
              value={ingredientCategory}
              onChange={(event) =>
                setIngredientCategory(event.target.value === 'PACKAGING' ? 'PACKAGING' : 'FOOD')
              }
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            >
              <option value="FOOD">Lebensmittel / normal</option>
              <option value="PACKAGING">Verpackungen (nicht in Produktinfos sichtbar)</option>
            </select>
          </label>

          <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Einheit</span>
              <select
                value={ingredientUnit}
                onChange={(event) => setIngredientUnit(event.target.value)}
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              >
                <option value="g">g</option>
                <option value="kg">kg</option>
                <option value="ml">ml</option>
                <option value="l">l</option>
                <option value="Stueck">Stück</option>
                <option value="Dose">Dose</option>
              </select>
            </label>

            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Rezept-Einheit</span>
              <select
                value={recipeUnit}
                onChange={(event) => setRecipeUnit(event.target.value)}
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              >
                <option value="g">g</option>
                <option value="kg">kg</option>
                <option value="ml">ml</option>
                <option value="l">l</option>
                <option value="Stueck">Stück</option>
                <option value="Dose">Dose</option>
              </select>
            </label>
          </div>
          <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs text-rose-900/80">
            Für Salat sinnvoll: Einkauf als <strong>Stück</strong>, Rezept als <strong>g</strong>, danach
            ca. Gramm je Stück eintragen.
            <button
              type="button"
              onClick={applySaladPreset}
              className="ml-2 rounded-lg border border-[var(--brand-border)] bg-white px-2 py-1 text-[11px] font-semibold text-rose-900/85 transition hover:bg-rose-50"
            >
              Salat-Vorlage setzen
            </button>
          </div>

          <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Artikelnummer</span>
              <input
                value={articleNumber}
                onChange={(event) => setArticleNumber(event.target.value)}
                placeholder="z. B. BR-001"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">EAN</span>
              <input
                value={ingredientEan}
                onChange={(event) => setIngredientEan(event.target.value)}
                placeholder="z. B. 4012345678901"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>
          </div>

          <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">
                Einkaufspreis (Netto)
              </span>
              <input
                type="number"
                step="0.01"
                value={purchasePrice}
                onChange={(event) => setPurchasePrice(event.target.value)}
                placeholder="z. B. 0.45"
                required
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">
                Mindestbestand
              </span>
              <input
                type="number"
                step={minimumStockStep}
                min="0"
                value={minimumStock}
                onChange={(event) => setMinimumStock(event.target.value)}
                placeholder={isIntegerOnlyUnit(ingredientUnit) ? 'z. B. 3' : 'z. B. 2.500'}
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">
                Verbrauchsfaktor %
              </span>
              <input
                type="number"
                step="0.1"
                min="0"
                value={consumptionFactorPercent}
                onChange={(event) => setConsumptionFactorPercent(event.target.value)}
                placeholder="z. B. 8.0"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Pfand (Brutto)</span>
              <p className="mb-1 text-[11px] text-rose-900/65">
                Nur intern für Einkauf/Bestand. Wird dem Kunden nicht zusätzlich berechnet.
              </p>
              <input
                type="number"
                step="0.01"
                value={deposit}
                onChange={(event) => setDeposit(event.target.value)}
                placeholder="0.00"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>

            <label className="block sm:col-span-2">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">
                Gramm je Einkaufseinheit
              </span>
              <input
                type="number"
                step="0.001"
                min="0"
                value={gramsPerPurchaseUnit}
                onChange={(event) => setGramsPerPurchaseUnit(event.target.value)}
                placeholder="z. B. 450"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
              {ingredientUnit === 'Stueck' && recipeUnit === 'g' ? (
                <p className="mt-1 text-xs text-rose-900/70">
                  Beispiel: 1 Stück Salatkopf = ca. 300 g.
                </p>
              ) : null}
            </label>
          </div>

          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Lieferant</span>
            <input
              value={supplier}
              onChange={(event) => setSupplier(event.target.value)}
              placeholder="z. B. Metro"
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            />
          </label>

          <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
            <div className="flex items-center justify-between gap-2">
              <p className="text-sm font-semibold text-slate-800">Einheiten-EANs</p>
              <button
                type="button"
                onClick={addUnitEanRow}
                className="rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50/60"
              >
                Einheit hinzufügen
              </button>
            </div>

            {ingredientUnitEans.length === 0 ? (
              <p className="mt-2 text-xs text-rose-900/70">
                Beispiel: Tray 24x, Kiste 12x oder Beutel 2kg mit eigener EAN.
              </p>
            ) : (
              <div className="mt-3 space-y-2">
                {ingredientUnitEans.map((entry, index) => (
                  <div key={`ingredient-unit-ean-${index}`} className="rounded-xl border border-[var(--brand-border)] bg-white p-2.5">
                    <div className="grid grid-cols-1 gap-2 sm:grid-cols-2">
                      <input
                        value={entry.label}
                        onChange={(event) => updateUnitEan(index, { label: event.target.value })}
                        placeholder="Bezeichnung"
                        className="rounded-lg border border-[var(--brand-border)] px-2.5 py-1.5 text-xs outline-none"
                      />
                      <input
                        value={entry.ean}
                        onChange={(event) => updateUnitEan(index, { ean: event.target.value })}
                        placeholder="EAN"
                        className="rounded-lg border border-[var(--brand-border)] px-2.5 py-1.5 text-xs outline-none"
                      />
                      <input
                        type="number"
                        step={isIntegerOnlyUnit(ingredientUnit) ? '1' : '0.001'}
                        min={isIntegerOnlyUnit(ingredientUnit) ? 1 : 0.001}
                        value={entry.unitCount}
                        onChange={(event) =>
                          updateUnitEan(index, {
                            unitCount: (() => {
                              const parsed = Number(event.target.value || 1)
                              if (!Number.isFinite(parsed) || parsed <= 0) {
                                return 1
                              }

                              return isIntegerOnlyUnit(ingredientUnit)
                                ? Math.max(1, Math.round(parsed))
                                : parsed
                            })(),
                          })
                        }
                        placeholder="Anzahl"
                        className="rounded-lg border border-[var(--brand-border)] px-2.5 py-1.5 text-xs outline-none"
                      />
                      <input
                        value={entry.unitLabel || ''}
                        onChange={(event) =>
                          updateUnitEan(index, { unitLabel: event.target.value || null })
                        }
                        placeholder="Einheit"
                        className="rounded-lg border border-[var(--brand-border)] px-2.5 py-1.5 text-xs outline-none"
                      />
                    </div>
                    <div className="mt-2 flex justify-end">
                      <button
                        type="button"
                        onClick={() => removeUnitEanRow(index)}
                        className="rounded-lg border border-red-300 bg-white px-2 py-1 text-xs font-medium text-red-700 transition hover:bg-red-50"
                      >
                        Entfernen
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>

          <div>
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">
                Allergene (Komma getrennt)
              </span>
              <input
                value={allergens}
                onChange={(event) => setAllergens(normalizeAllergenInput(event.target.value))}
                placeholder="z. B. A,G oder 1,2"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>

            <div className="mt-2 flex flex-wrap gap-2">
              {ALLERGEN_CODES.map((entry) => {
                const active = selectedAllergens.includes(entry.code)
                return (
                  <button
                    key={entry.code}
                    type="button"
                    onClick={() => toggleAllergen(entry.code)}
                    className={`rounded-full border px-2.5 py-1 text-xs font-medium transition ${
                      active
                        ? 'border-orange-300 bg-orange-50 text-orange-700'
                        : 'border-[var(--brand-border)] bg-white text-rose-900/85 hover:bg-rose-50'
                    }`}
                    title={entry.label}
                  >
                    {entry.code}
                  </button>
                )
              })}
            </div>

            <details className="mt-3 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2">
              <summary className="cursor-pointer text-xs font-medium text-rose-900/85">
                Allergen-Legende aufklappen
              </summary>
              <div className="mt-2 grid gap-1 text-xs text-rose-900/85 sm:grid-cols-2">
                {ALLERGEN_CODES.map((entry) => (
                  <p key={`legend-${entry.code}`}>
                    <span className="font-semibold">{entry.code}</span> - {entry.label}
                  </p>
                ))}
              </div>
            </details>
          </div>

          <button
            type="submit"
            disabled={savingIngredient}
            className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
          >
            {savingIngredient
              ? 'Speichert...'
              : editingIngredientId
              ? 'Zutat aktualisieren'
              : 'Zutat speichern'}
          </button>

          {editingIngredientId ? (
            <button
              type="button"
              onClick={onCancelEdit}
              className="w-full rounded-xl border border-[var(--brand-border)] px-4 py-2.5 font-medium text-rose-900/85 transition hover:bg-rose-50"
            >
              Bearbeitung abbrechen
            </button>
          ) : null}
        </form>
      </section>

      <section className="min-w-0 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="flex flex-wrap items-end justify-between gap-3">
          <div>
            <h2 className="text-xl font-semibold">Zutatenliste</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              {ingredients.length} Zutaten insgesamt
            </p>
          </div>

          <label className="block w-full max-w-sm">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Suche</span>
            <input
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              placeholder="Name, EAN, Lieferant, Artikelnummer oder Allergen"
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            />
          </label>
        </div>

        <div className="mt-3 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2">
          <div className="flex flex-wrap items-center gap-2">
            <p className="text-xs font-semibold uppercase tracking-wide text-rose-900/70">
              Info-Filter
            </p>
            {INGREDIENT_COLUMN_FILTERS.map((column) => {
              const active = visibleColumns[column.key]
              return (
                <button
                  key={column.key}
                  type="button"
                  onClick={() => toggleColumn(column.key)}
                  className={`rounded-full border px-2.5 py-1 text-xs font-medium transition ${
                    active
                      ? 'border-orange-300 bg-orange-50 text-orange-700'
                      : 'border-[var(--brand-border)] bg-white text-rose-900/85 hover:bg-rose-100'
                  }`}
                >
                  {column.label}
                </button>
              )
            })}
          </div>
        </div>

        <div className="mt-4 max-w-full overflow-hidden rounded-2xl border border-[var(--brand-border)]">
          <table className="w-full table-fixed border-collapse">
            <thead>
              <tr>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Zutat
                </th>
                {visibleColumns.category ? (
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Kategorie
                  </th>
                ) : null}
                {visibleColumns.units ? (
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Einheit / Rezept
                  </th>
                ) : null}
                {visibleColumns.purchase ? (
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Einkauf
                  </th>
                ) : null}
                {visibleColumns.stock ? (
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Min.-Bestand
                  </th>
                ) : null}
                {visibleColumns.factor ? (
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Verbrauchsfaktor
                  </th>
                ) : null}
                {visibleColumns.supplier ? (
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Lieferant
                  </th>
                ) : null}
                {visibleColumns.articleNumber ? (
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Art.-Nr.
                  </th>
                ) : null}
                {visibleColumns.ean ? (
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    EAN
                  </th>
                ) : null}
                {visibleColumns.allergens ? (
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Allergene
                  </th>
                ) : null}
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Aktion
                </th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td colSpan={visibleColumnCount} className="px-3 py-3 text-sm text-rose-900/70">
                    Lade Zutaten...
                  </td>
                </tr>
              ) : filteredIngredients.length === 0 ? (
                <tr>
                  <td colSpan={visibleColumnCount} className="px-3 py-3 text-sm text-rose-900/70">
                    Keine Zutaten gefunden.
                  </td>
                </tr>
              ) : (
                filteredIngredients.map((ingredient) => {
                  const allergenCodes = parseAllergenCodes(ingredient.allergens)
                  return (
                  <tr key={ingredient.id}>
                    <td className="break-words border-t border-slate-100 px-3 py-2 align-top text-sm font-medium text-[var(--brand-ink)]">
                      {ingredient.name}
                    </td>
                    {visibleColumns.category ? (
                    <td className="border-t border-slate-100 px-3 py-2 align-top text-sm text-rose-900/85">
                      {ingredient.category === 'PACKAGING' ? (
                        <span className="rounded-full border border-amber-200 bg-amber-50 px-2 py-0.5 text-xs font-semibold text-amber-700">
                          Verpackung
                        </span>
                      ) : (
                        <span className="rounded-full border border-emerald-200 bg-emerald-50 px-2 py-0.5 text-xs font-semibold text-emerald-700">
                          Lebensmittel
                        </span>
                      )}
                    </td>
                    ) : null}
                    {visibleColumns.units ? (
                    <td className="break-words border-t border-slate-100 px-3 py-2 align-top text-sm text-rose-900/85">
                      <p>Einkauf: {ingredient.unit}</p>
                      <p className="text-xs text-rose-900/70">
                        Rezept: {ingredient.recipeUnit || ingredient.unit}
                        {ingredient.gramsPerPurchaseUnit
                          ? ` | ${ingredient.gramsPerPurchaseUnit} g je ${ingredient.unit}`
                          : ''}
                      </p>
                    </td>
                    ) : null}
                    {visibleColumns.purchase ? (
                    <td className="break-words border-t border-slate-100 px-3 py-2 align-top text-sm text-rose-900/85">
                      EK netto {Number(ingredient.purchasePrice).toFixed(2)} EUR
                      {Number(ingredient.deposit) > 0 ? (
                        <span className="mt-1 block text-xs text-rose-900/70">
                          (Pfand brutto {Number(ingredient.deposit).toFixed(2)} EUR)
                        </span>
                      ) : null}
                    </td>
                    ) : null}
                    {visibleColumns.stock ? (
                    <td className="break-words border-t border-slate-100 px-3 py-2 align-top text-sm text-rose-900/85">
                      {formatQuantityByUnit(ingredient.minimumStock || 0, ingredient.unit)} {ingredient.unit}
                    </td>
                    ) : null}
                    {visibleColumns.factor ? (
                    <td className="break-words border-t border-slate-100 px-3 py-2 align-top text-sm text-rose-900/85">
                      +{Number(ingredient.consumptionFactorPercent || 0).toFixed(1)} %
                    </td>
                    ) : null}
                    {visibleColumns.supplier ? (
                    <td className="break-words border-t border-slate-100 px-3 py-2 align-top text-sm text-rose-900/85">
                      <p>{ingredient.supplier || '-'}</p>
                      {ingredient.unitEans.length > 0 ? (
                        <p className="text-xs text-rose-900/70">
                          {ingredient.unitEans.length} Einheiten-EANs
                        </p>
                      ) : null}
                    </td>
                    ) : null}
                    {visibleColumns.articleNumber ? (
                    <td className="break-words border-t border-slate-100 px-3 py-2 align-top text-sm text-rose-900/85">
                      {ingredient.articleNumber || '-'}
                    </td>
                    ) : null}
                    {visibleColumns.ean ? (
                    <td className="break-words border-t border-slate-100 px-3 py-2 align-top text-sm text-rose-900/85">
                      {ingredient.ean || '-'}
                    </td>
                    ) : null}
                    {visibleColumns.allergens ? (
                    <td className="border-t border-slate-100 px-3 py-2 align-top text-sm text-rose-900/85">
                      {allergenCodes.length === 0 ? (
                        '-'
                      ) : (
                        <details>
                          <summary className="cursor-pointer text-xs text-rose-900/85">
                            <span className="inline-flex flex-wrap gap-1">
                              {allergenCodes.map((code) => (
                                <span
                                  key={`${ingredient.id}-${code}`}
                                  className="rounded-full border border-[var(--brand-border)] bg-rose-50/60 px-2 py-0.5 font-medium"
                                >
                                  {code}
                                </span>
                              ))}
                            </span>
                            <span className="ml-2 text-[11px] text-rose-900/70">
                              (aufklappen)
                            </span>
                          </summary>
                          <div className="mt-2 space-y-1 text-xs text-rose-900/85">
                            {allergenCodes.map((code) => (
                              <p key={`${ingredient.id}-${code}-desc`}>
                                <span className="font-semibold">{code}</span> -{' '}
                                {ALLERGEN_LABEL_BY_CODE[code] || 'Unbekanntes Allergen'}
                              </p>
                            ))}
                          </div>
                        </details>
                      )}
                    </td>
                    ) : null}
                    <td className="border-t border-slate-100 px-3 py-2 align-top text-sm">
                      <div className="flex min-w-[92px] flex-col gap-1.5 whitespace-nowrap">
                        <button
                          type="button"
                          onClick={() => onEdit(ingredient)}
                          className="rounded-lg bg-slate-900 px-2.5 py-1 text-xs font-medium text-white transition hover:bg-slate-800"
                        >
                          Bearbeiten
                        </button>
                        <button
                          type="button"
                          onClick={() => onDelete(ingredient)}
                          disabled={deletingIngredientId === ingredient.id}
                          className="rounded-lg border border-red-300 bg-white px-2.5 py-1 text-xs font-medium text-red-700 transition hover:bg-red-50 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {deletingIngredientId === ingredient.id ? 'Loescht...' : 'Loeschen'}
                        </button>
                      </div>
                    </td>
                  </tr>
                  )
                })
              )}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  )
}

