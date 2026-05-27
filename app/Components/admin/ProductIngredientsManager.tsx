'use client'

import { useEffect, useMemo, useState } from 'react'
import {
  createProductIngredient,
  createProductModifier,
  deleteProductIngredient,
  deleteProductModifier,
  getIngredients,
  getProductIngredients,
  getProductModifiers,
  updateProductIngredient,
  updateProductModifier,
  type Ingredient,
  type ProductIngredient,
  type ProductModifier,
} from '@/lib/api'
import Card from '@/app/Components/ui/Card'
import SectionTitle from '@/app/Components/ui/SectionTitle'
import SelectInput from '@/app/Components/ui/SelectInput'
import TextInput from '@/app/Components/ui/TextInput'
import PrimaryButton from '@/app/Components/ui/PrimaryButton'
import FieldLabel from '@/app/Components/ui/FieldLabel'

type Props = {
  productId: string | null
  productName: string
  products: Array<{
    id: string
    name: string
    productNumber: string | null
  }>
}

function formatDelta(value: string | number) {
  const numeric = Number(value)
  const sign = numeric >= 0 ? '+' : '-'
  return `${sign}${Math.abs(numeric).toFixed(2)} EUR`
}

function ingredientOptionLabel(ingredient: Ingredient) {
  return ingredient.category === 'PACKAGING'
    ? `${ingredient.name} [Verpackung]`
    : ingredient.name
}

const INTEGER_ONLY_RECIPE_UNITS = new Set(['Stueck', 'Dose'])

function isIntegerOnlyRecipeUnit(unit?: string | null) {
  return Boolean(unit && INTEGER_ONLY_RECIPE_UNITS.has(unit))
}

export default function ProductIngredientsManager({ productId, productName, products }: Props) {
  const [ingredients, setIngredients] = useState<Ingredient[]>([])
  const [productIngredients, setProductIngredients] = useState<ProductIngredient[]>([])
  const [modifiers, setModifiers] = useState<ProductModifier[]>([])
  const [selectedProductId, setSelectedProductId] = useState(productId ?? '')
  const [ingredientId, setIngredientId] = useState('')
  const [quantity, setQuantity] = useState('')
  const [displayNameOverride, setDisplayNameOverride] = useState('')
  const [quantityDrafts, setQuantityDrafts] = useState<Record<string, string>>({})
  const [displayNameOverrideDrafts, setDisplayNameOverrideDrafts] = useState<Record<string, string>>(
    {}
  )
  const [modifierName, setModifierName] = useState('')
  const [modifierKind, setModifierKind] = useState<'OPTION' | 'SIZE'>('OPTION')
  const [modifierIngredientId, setModifierIngredientId] = useState('')
  const [modifierPriceDelta, setModifierPriceDelta] = useState('0')
  const [modifierSortOrder, setModifierSortOrder] = useState('0')
  const [modifierDefaultSelected, setModifierDefaultSelected] = useState(false)
  const [modifierActive, setModifierActive] = useState(true)
  const [loading, setLoading] = useState(false)
  const [savingIngredient, setSavingIngredient] = useState(false)
  const [savingProductIngredientId, setSavingProductIngredientId] = useState<string | null>(null)
  const [deletingProductIngredientId, setDeletingProductIngredientId] = useState<string | null>(
    null
  )
  const [savingModifier, setSavingModifier] = useState(false)
  const [deletingModifierId, setDeletingModifierId] = useState<string | null>(null)
  const [error, setError] = useState('')

  useEffect(() => {
    if (products.length === 0) {
      setSelectedProductId('')
      return
    }

    if (productId && products.some((entry) => entry.id === productId)) {
      setSelectedProductId(productId)
      return
    }

    if (!selectedProductId || !products.some((entry) => entry.id === selectedProductId)) {
      setSelectedProductId(products[0].id)
    }
  }, [productId, products, selectedProductId])

  const resolvedProductId = selectedProductId || ''
  const selectedProduct = useMemo(
    () => products.find((entry) => entry.id === resolvedProductId) ?? null,
    [products, resolvedProductId]
  )
  const selectedProductName = selectedProduct?.name || productName
  const selectedIngredient = ingredients.find((entry) => entry.id === ingredientId) || null

  async function loadData() {
    try {
      setLoading(true)
      const ingredientData = await getIngredients()
      setIngredients(ingredientData)
      setIngredientId((current) =>
        ingredientData.some((entry) => entry.id === current) ? current : (ingredientData[0]?.id ?? '')
      )
      setModifierIngredientId((current) =>
        ingredientData.some((entry) => entry.id === current) ? current : (ingredientData[0]?.id ?? '')
      )

      if (!resolvedProductId) {
        setProductIngredients([])
        setModifiers([])
        setQuantityDrafts({})
        setDisplayNameOverrideDrafts({})
        setError('')
        return
      }

      const [productIngredientData, modifierData] = await Promise.all([
        getProductIngredients(resolvedProductId),
        getProductModifiers(resolvedProductId),
      ])

      setProductIngredients(productIngredientData)
      setModifiers(modifierData)
      setQuantityDrafts(
        Object.fromEntries(productIngredientData.map((entry) => [entry.id, String(entry.quantity)]))
      )
      setDisplayNameOverrideDrafts(
        Object.fromEntries(
          productIngredientData.map((entry) => [entry.id, entry.displayNameOverride || ''])
        )
      )
      setError('')
    } catch (loadError) {
      setError(
        loadError instanceof Error
          ? loadError.message
          : 'Zutaten- und Optionsdaten konnten nicht geladen werden'
      )
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadData()
  }, [resolvedProductId])

  async function handleAddIngredient(e: React.FormEvent) {
    e.preventDefault()

    if (!resolvedProductId) return

    try {
      setSavingIngredient(true)
      const parsedQuantity = Number(quantity.replace(',', '.'))
      if (!Number.isFinite(parsedQuantity) || parsedQuantity <= 0) {
        throw new Error('Bitte eine gueltige Menge groesser 0 eintragen.')
      }
      if (isIntegerOnlyRecipeUnit(selectedIngredient?.recipeUnit || selectedIngredient?.unit)) {
        if (!Number.isInteger(parsedQuantity)) {
          throw new Error('Bei Rezept-Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt.')
        }
      }

      await createProductIngredient({
        productId: resolvedProductId,
        ingredientId,
        quantity: parsedQuantity,
        displayNameOverride: displayNameOverride.trim() || null,
      })

      setQuantity('')
      setDisplayNameOverride('')
      await loadData()
    } catch (submitError) {
      setError(
        submitError instanceof Error
          ? submitError.message
          : 'Produkt-Zutat konnte nicht erstellt werden'
      )
    } finally {
      setSavingIngredient(false)
    }
  }

  async function handleSaveProductIngredientQuantity(productIngredient: ProductIngredient) {
    const draftValue = quantityDrafts[productIngredient.id] ?? String(productIngredient.quantity)
    const displayNameOverrideDraft =
      displayNameOverrideDrafts[productIngredient.id] ?? productIngredient.displayNameOverride ?? ''
    const parsedQuantity = Number(draftValue.replace(',', '.'))
    if (!Number.isFinite(parsedQuantity) || parsedQuantity <= 0) {
      setError('Bitte eine gueltige Menge groesser 0 eintragen.')
      return
    }
    if (
      isIntegerOnlyRecipeUnit(
        productIngredient.ingredient.recipeUnit || productIngredient.ingredient.unit
      ) &&
      !Number.isInteger(parsedQuantity)
    ) {
      setError('Bei Rezept-Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt.')
      return
    }

    try {
      setSavingProductIngredientId(productIngredient.id)
      await updateProductIngredient(productIngredient.id, {
        quantity: parsedQuantity,
        displayNameOverride: displayNameOverrideDraft.trim() || null,
      })
      await loadData()
    } catch (updateError) {
      setError(
        updateError instanceof Error
          ? updateError.message
          : 'Produkt-Zutat konnte nicht aktualisiert werden'
      )
    } finally {
      setSavingProductIngredientId(null)
    }
  }

  async function handleDeleteProductIngredient(productIngredient: ProductIngredient) {
    if (
      !window.confirm(
        `Zutat "${productIngredient.ingredient.name}" wirklich aus dem Produkt entfernen?`
      )
    ) {
      return
    }

    try {
      setDeletingProductIngredientId(productIngredient.id)
      await deleteProductIngredient(productIngredient.id)
      await loadData()
    } catch (deleteError) {
      setError(
        deleteError instanceof Error
          ? deleteError.message
          : 'Produkt-Zutat konnte nicht geloescht werden'
      )
    } finally {
      setDeletingProductIngredientId(null)
    }
  }

  async function handleAddModifier(e: React.FormEvent) {
    e.preventDefault()

    if (!resolvedProductId) {
      return
    }

    try {
      setSavingModifier(true)
      await createProductModifier({
        productId: resolvedProductId,
        ingredientId: modifierIngredientId || null,
        kind: modifierKind,
        name: modifierName.trim() || undefined,
        priceDelta: Number(modifierPriceDelta),
        isDefaultSelected: modifierDefaultSelected,
        isActive: modifierActive,
        sortOrder: Number(modifierSortOrder),
      })

      setModifierName('')
      setModifierKind('OPTION')
      setModifierPriceDelta('0')
      setModifierSortOrder('0')
      setModifierDefaultSelected(false)
      setModifierActive(true)
      await loadData()
    } catch (submitError) {
      setError(
        submitError instanceof Error
          ? submitError.message
          : 'Produktoption konnte nicht erstellt werden'
      )
    } finally {
      setSavingModifier(false)
    }
  }

  async function toggleModifier(modifier: ProductModifier, field: 'isActive' | 'isDefaultSelected') {
    try {
      await updateProductModifier(modifier.id, {
        [field]: !modifier[field],
      })
      await loadData()
    } catch (updateError) {
      setError(
        updateError instanceof Error
          ? updateError.message
          : 'Produktoption konnte nicht aktualisiert werden'
      )
    }
  }

  async function handleDeleteModifier(modifier: ProductModifier) {
    if (!window.confirm(`Option "${modifier.name}" wirklich loeschen?`)) {
      return
    }

    try {
      setDeletingModifierId(modifier.id)
      await deleteProductModifier(modifier.id)
      await loadData()
    } catch (deleteError) {
      setError(
        deleteError instanceof Error
          ? deleteError.message
          : 'Produktoption konnte nicht geloescht werden'
      )
    } finally {
      setDeletingModifierId(null)
    }
  }

  return (
    <Card>
      <SectionTitle
        title={`Zutaten und Optionen${resolvedProductId ? ` fuer: ${selectedProductName}` : ''}`}
        subtitle="Basis-Zutaten, Mengen und Zusatzoptionen direkt im Produktbereich verwalten."
      />

      {error ? (
        <div className="mt-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}

      <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
        <div className="grid gap-4 xl:grid-cols-[minmax(0,1.1fr)_minmax(0,1fr)]">
          <div className="space-y-4">
            <div>
              <FieldLabel>Produkt</FieldLabel>
              <p className="mb-2 text-xs text-rose-900/70">
                Zutaten sind direkt anpassbar. Produkt hier auswaehlen.
              </p>
              <SelectInput
                value={resolvedProductId}
                onChange={setSelectedProductId}
                options={
                  products.length > 0
                    ? products.map((product) => ({
                        label: `${product.productNumber || '-'} - ${product.name}`,
                        value: product.id,
                      }))
                    : [{ label: 'Keine Produkte vorhanden', value: '' }]
                }
              />
            </div>

            <form
              onSubmit={handleAddIngredient}
              className="space-y-3 rounded-xl border border-[var(--brand-border)] bg-white p-3"
            >
              <p className="text-sm font-semibold text-slate-800">Basis-Zutat hinzufuegen</p>
              <div>
                <FieldLabel>Zutat</FieldLabel>
                <SelectInput
                  value={ingredientId}
                  onChange={setIngredientId}
                  options={
                    ingredients.length > 0
                      ? ingredients.map((ingredient) => ({
                          label: ingredientOptionLabel(ingredient),
                          value: ingredient.id,
                        }))
                      : [{ label: 'Keine Zutaten vorhanden', value: '' }]
                  }
                />
              </div>
              <div>
                <FieldLabel>Menge</FieldLabel>
                <TextInput
                  type="number"
                  step={
                    isIntegerOnlyRecipeUnit(selectedIngredient?.recipeUnit || selectedIngredient?.unit)
                      ? '1'
                      : '0.01'
                  }
                  value={quantity}
                  onChange={setQuantity}
                  placeholder="z. B. 150"
                  required
                />
                <p className="mt-1 text-xs text-rose-900/70">
                  Rezept-Einheit: {selectedIngredient?.recipeUnit || selectedIngredient?.unit || '-'}
                </p>
                {selectedIngredient?.category === 'PACKAGING' ? (
                  <p className="mt-1 text-xs font-medium text-amber-700">
                    Hinweis: Verpackungen bleiben spaeter in den oeffentlichen Produktinfos
                    ausgeblendet.
                  </p>
                ) : null}
              </div>
              <div>
                <FieldLabel>Alternativer Anzeigetext (optional)</FieldLabel>
                <TextInput
                  value={displayNameOverride}
                  onChange={setDisplayNameOverride}
                  placeholder="leer = normaler Zutatenname"
                />
              </div>
              <PrimaryButton
                type="submit"
                disabled={savingIngredient || !ingredientId || !resolvedProductId}
                color="green"
              >
                {savingIngredient ? 'Speichert...' : 'Zutat hinzufuegen'}
              </PrimaryButton>
            </form>
          </div>

          <div className="rounded-xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold uppercase tracking-wide text-rose-900/75">
              Schnellueberblick
            </h3>
            <div className="mt-3 grid grid-cols-2 gap-3">
              <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-3 py-2">
                <p className="text-[11px] uppercase tracking-wide text-emerald-700">Basis-Zutaten</p>
                <p className="text-xl font-bold text-emerald-900">{productIngredients.length}</p>
              </div>
              <div className="rounded-xl border border-indigo-200 bg-indigo-50 px-3 py-2">
                <p className="text-[11px] uppercase tracking-wide text-indigo-700">Optionen</p>
                <p className="text-xl font-bold text-indigo-900">{modifiers.length}</p>
              </div>
            </div>
            <p className="mt-3 text-xs text-rose-900/75">
              Tipp: Mengen koennen in der Tabelle unten direkt geaendert und gespeichert werden.
            </p>
          </div>
        </div>
      </div>

      <div className="mt-6 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
        <table className="w-full min-w-[960px] border-collapse">
          <thead>
            <tr>
              <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                Zutat
              </th>
              <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                Kategorie
              </th>
              <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                Menge / Rezept
              </th>
              <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                Alternativer Anzeigetext
              </th>
              <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                Einkauf / Pfand
              </th>
              <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                Allergene
              </th>
              <th className="bg-rose-50/60 px-3 py-2 text-right text-xs uppercase tracking-wide text-rose-900/75">
                Aktion
              </th>
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr>
                <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={7}>
                  Lade Produkt-Zutaten...
                </td>
              </tr>
            ) : productIngredients.length === 0 ? (
              <tr>
                <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={7}>
                  Noch keine Zutaten zugeordnet.
                </td>
              </tr>
            ) : (
              productIngredients.map((item) => {
                const rowSaving = savingProductIngredientId === item.id
                const rowDeleting = deletingProductIngredientId === item.id

                return (
                  <tr key={item.id} className="border-t border-rose-100/70 align-top">
                    <td className="px-3 py-3">
                      <p className="font-semibold text-[var(--brand-ink)]">{item.ingredient.name}</p>
                      <p className="mt-1 text-xs text-rose-900/70">
                        Einheit: {item.ingredient.unit}
                        {item.ingredient.gramsPerPurchaseUnit
                          ? ` | ${item.ingredient.gramsPerPurchaseUnit} g je ${item.ingredient.unit}`
                          : ''}
                      </p>
                    </td>
                    <td className="px-3 py-3 text-sm text-rose-900/85">
                      {item.ingredient.category === 'PACKAGING' ? 'Verpackung' : 'Lebensmittel'}
                    </td>
                    <td className="px-3 py-3">
                      <div className="flex min-w-[180px] items-center gap-2">
                        <input
                          type="number"
                          step={
                            isIntegerOnlyRecipeUnit(
                              item.ingredient.recipeUnit || item.ingredient.unit
                            )
                              ? '1'
                              : '0.01'
                          }
                          value={quantityDrafts[item.id] ?? String(item.quantity)}
                          onChange={(event) =>
                            setQuantityDrafts((current) => ({
                              ...current,
                              [item.id]: event.target.value,
                            }))
                          }
                          className="brand-input w-[110px] rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm transition"
                        />
                        <span className="text-xs text-rose-900/70">
                          {item.ingredient.recipeUnit || item.ingredient.unit}
                        </span>
                      </div>
                    </td>
                    <td className="px-3 py-3">
                      <TextInput
                        value={
                          displayNameOverrideDrafts[item.id] ?? item.displayNameOverride ?? ''
                        }
                        onChange={(value) =>
                          setDisplayNameOverrideDrafts((current) => ({
                            ...current,
                            [item.id]: value,
                          }))
                        }
                        placeholder="leer = normaler Zutatenname"
                      />
                    </td>
                    <td className="px-3 py-3 text-sm text-rose-900/85">
                      <p>EK {item.ingredient.purchasePrice} EUR</p>
                      {Number(item.ingredient.deposit) > 0 ? (
                        <p className="text-xs text-rose-900/70">Pfand {item.ingredient.deposit} EUR</p>
                      ) : null}
                    </td>
                    <td className="px-3 py-3 text-sm text-rose-900/85">
                      {item.ingredient.allergens || '-'}
                    </td>
                    <td className="px-3 py-3 text-right">
                      <div className="flex justify-end gap-2">
                        <button
                          type="button"
                          disabled={rowSaving || rowDeleting}
                          onClick={() => void handleSaveProductIngredientQuantity(item)}
                          className="rounded-lg bg-indigo-600 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-indigo-700 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {rowSaving ? 'Speichert...' : 'Menge speichern'}
                        </button>
                        <button
                          type="button"
                          disabled={rowDeleting || rowSaving}
                          onClick={() => void handleDeleteProductIngredient(item)}
                          className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-red-700 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {rowDeleting ? 'Loescht...' : 'Entfernen'}
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

      <div className="mt-8 border-t border-[var(--brand-border)] pt-6">
        <h3 className="text-lg font-semibold text-[var(--brand-ink)]">Freigeschaltete Terminal-Optionen</h3>
        <p className="mt-1 text-sm text-rose-900/70">
          Optionen erscheinen im Bestellterminal als Zusatzwahl. Typ "Groesse" ist fuer S/M/L oder
          cm-Varianten.
        </p>

        <form
          onSubmit={handleAddModifier}
          className="mt-4 grid gap-3 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4 md:grid-cols-2"
        >
          <label className="block">
            <FieldLabel>Typ</FieldLabel>
            <SelectInput
              value={modifierKind}
              onChange={(value) => setModifierKind(value as 'OPTION' | 'SIZE')}
              options={[
                { label: 'Normale Option (Extra/Ohne)', value: 'OPTION' },
                { label: 'Groesse (S, M, L, 26 cm ...)', value: 'SIZE' },
              ]}
            />
          </label>

          <label className="block md:col-span-2">
            <FieldLabel>Option-Name (optional)</FieldLabel>
            <TextInput
              value={modifierName}
              onChange={setModifierName}
              placeholder={
                modifierKind === 'SIZE'
                  ? 'z. B. 26 cm, 30 cm oder Familienpizza'
                  : 'z. B. Extra Kaese oder Ohne Zwiebeln'
              }
            />
          </label>

          <label className="block">
            <FieldLabel>Zutat (optional)</FieldLabel>
            <SelectInput
              value={modifierIngredientId}
              onChange={setModifierIngredientId}
              options={[
                { label: 'Keine direkte Zutat', value: '' },
                ...ingredients.map((ingredient) => ({
                  label: ingredientOptionLabel(ingredient),
                  value: ingredient.id,
                })),
              ]}
            />
          </label>

          <label className="block">
            <FieldLabel>Preisdelta (+/- EUR)</FieldLabel>
            <TextInput
              type="number"
              step="0.01"
              value={modifierPriceDelta}
              onChange={setModifierPriceDelta}
              required
            />
          </label>

          <label className="block">
            <FieldLabel>Sortierung</FieldLabel>
            <TextInput type="number" value={modifierSortOrder} onChange={setModifierSortOrder} />
          </label>

          <div className="flex items-center gap-4">
            <label className="flex items-center gap-2 text-sm text-rose-900/85">
              <input
                type="checkbox"
                checked={modifierDefaultSelected}
                onChange={(event) => setModifierDefaultSelected(event.target.checked)}
              />
              Standardmaessig aktiv
            </label>
            <label className="flex items-center gap-2 text-sm text-rose-900/85">
              <input
                type="checkbox"
                checked={modifierActive}
                onChange={(event) => setModifierActive(event.target.checked)}
              />
              Option aktiv
            </label>
          </div>

          <div className="md:col-span-2">
            <PrimaryButton type="submit" disabled={savingModifier || !resolvedProductId} color="green">
              {savingModifier ? 'Speichert...' : 'Option freischalten'}
            </PrimaryButton>
          </div>
        </form>

        <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
          <table className="w-full min-w-[860px] border-collapse">
            <thead>
              <tr>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Option
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Typ / Delta
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Status
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-right text-xs uppercase tracking-wide text-rose-900/75">
                  Aktion
                </th>
              </tr>
            </thead>
            <tbody>
              {modifiers.length === 0 ? (
                <tr>
                  <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={4}>
                    Noch keine Optionen freigeschaltet.
                  </td>
                </tr>
              ) : (
                modifiers.map((modifier) => (
                  <tr key={modifier.id} className="border-t border-rose-100/70 align-top">
                    <td className="px-3 py-3">
                      <p className="font-semibold text-[var(--brand-ink)]">{modifier.name}</p>
                      <p className="mt-1 text-xs text-rose-900/75">
                        {modifier.ingredient?.name || 'Ohne direkte Zutatenbindung'} | Sortierung{' '}
                        {modifier.sortOrder}
                      </p>
                    </td>
                    <td className="px-3 py-3 text-sm text-rose-900/85">
                      {modifier.kind === 'SIZE' ? 'Groesse' : 'Option'} | {formatDelta(modifier.priceDelta)}
                    </td>
                    <td className="px-3 py-3 text-sm text-rose-900/85">
                      {modifier.isActive ? 'Aktiv' : 'Inaktiv'} |{' '}
                      {modifier.isDefaultSelected ? 'Standard aktiviert' : 'Standard aus'}
                    </td>
                    <td className="px-3 py-3 text-right">
                      <div className="flex justify-end gap-2">
                        <button
                          type="button"
                          onClick={() => void toggleModifier(modifier, 'isActive')}
                          className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-slate-800"
                        >
                          {modifier.isActive ? 'Deaktivieren' : 'Aktivieren'}
                        </button>
                        <button
                          type="button"
                          onClick={() => void toggleModifier(modifier, 'isDefaultSelected')}
                          className="rounded-lg bg-indigo-600 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-indigo-700"
                        >
                          {modifier.isDefaultSelected ? 'Standard aus' : 'Als Standard'}
                        </button>
                        <button
                          type="button"
                          disabled={deletingModifierId === modifier.id}
                          onClick={() => void handleDeleteModifier(modifier)}
                          className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-red-700 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {deletingModifierId === modifier.id ? 'Loescht...' : 'Loeschen'}
                        </button>
                      </div>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </Card>
  )
}
