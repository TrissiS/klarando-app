import { useEffect, useMemo, useState } from 'react'
import type { Category, Product, UnitEanEntry } from '@/lib/api'

type Props = {
  products: Product[]
  categories: Category[]
  loading: boolean
  productNumber: string
  setProductNumber: (value: string) => void
  productName: string
  setProductName: (value: string) => void
  productImageUrl: string
  setProductImageUrl: (value: string) => void
  productEan: string
  setProductEan: (value: string) => void
  productUnitEans: UnitEanEntry[]
  setProductUnitEans: (value: UnitEanEntry[]) => void
  beverageContainerType: 'NONE' | 'EINWEG' | 'MEHRWEG'
  setBeverageContainerType: (value: 'NONE' | 'EINWEG' | 'MEHRWEG') => void
  productDeposit: string
  setProductDeposit: (value: string) => void
  articleInfo: string
  setArticleInfo: (value: string) => void
  foodBusinessOperator: string
  setFoodBusinessOperator: (value: string) => void
  nutritionInfo: string
  setNutritionInfo: (value: string) => void
  onProductImageFileChange: (file: File | null) => void
  price: string
  setPrice: (value: string) => void
  vatRate: string
  setVatRate: (value: string) => void
  categoryId: string
  setCategoryId: (value: string) => void
  available: string
  setAvailable: (value: string) => void
  savingProduct: boolean
  editingProductId: string | null
  deletingProductId: string | null
  creatingIngredientProductId: string | null
  copyingProductId: string | null
  onSubmit: (e: React.FormEvent) => void
  onEdit: (product: Product) => void
  onDelete: (product: Product) => void
  onCreateIngredientFromProduct: (product: Product) => void
  onCopy: (product: Product) => void
  onCancelEdit: () => void
  productNumberError?: string
  productNumberLocked?: boolean
  onOpenTemplateImportDialog: () => void
}

export default function AdminProductsSection({
  products,
  categories,
  loading,
  productNumber,
  setProductNumber,
  productName,
  setProductName,
  productImageUrl,
  setProductImageUrl,
  productEan,
  setProductEan,
  productUnitEans,
  setProductUnitEans,
  beverageContainerType,
  setBeverageContainerType,
  productDeposit,
  setProductDeposit,
  articleInfo,
  setArticleInfo,
  foodBusinessOperator,
  setFoodBusinessOperator,
  nutritionInfo,
  setNutritionInfo,
  onProductImageFileChange,
  price,
  setPrice,
  vatRate,
  setVatRate,
  categoryId,
  setCategoryId,
  available,
  setAvailable,
  savingProduct,
  editingProductId,
  deletingProductId,
  creatingIngredientProductId,
  copyingProductId,
  onSubmit,
  onEdit,
  onDelete,
  onCreateIngredientFromProduct,
  onCopy,
  onCancelEdit,
  productNumberError,
  productNumberLocked = false,
  onOpenTemplateImportDialog,
}: Props) {
  const [search, setSearch] = useState('')
  const [statusFilter, setStatusFilter] = useState<'ALL' | 'AVAILABLE' | 'UNAVAILABLE'>('ALL')
  const [categoryFilter, setCategoryFilter] = useState('ALL')
  const [showAdvanced, setShowAdvanced] = useState(false)
  const [showArticleDetails, setShowArticleDetails] = useState(false)

  useEffect(() => {
    if (editingProductId) {
      setShowAdvanced(true)
      if (articleInfo || foodBusinessOperator || nutritionInfo) {
        setShowArticleDetails(true)
      }
    } else {
      setShowArticleDetails(false)
    }
  }, [editingProductId, articleInfo, foodBusinessOperator, nutritionInfo])

  const filteredProducts = useMemo(() => {
    const query = search.trim().toLowerCase()

    return products.filter((product) => {
      if (query) {
        const matchesQuery =
          product.name.toLowerCase().includes(query) ||
          (product.productNumber || '').toLowerCase().includes(query)
        if (!matchesQuery) {
          return false
        }
      }

      if (statusFilter === 'AVAILABLE' && !product.available) {
        return false
      }

      if (statusFilter === 'UNAVAILABLE' && product.available) {
        return false
      }

      if (categoryFilter !== 'ALL' && product.categoryId !== categoryFilter) {
        return false
      }

      return true
    })
  }, [products, search, statusFilter, categoryFilter])

  function updateUnitEan(index: number, patch: Partial<UnitEanEntry>) {
    setProductUnitEans(
      productUnitEans.map((entry, itemIndex) =>
        itemIndex === index ? { ...entry, ...patch } : entry
      )
    )
  }

  function addUnitEanRow() {
    setProductUnitEans([
      ...productUnitEans,
      {
        label: '',
        ean: '',
        unitCount: 1,
        unitLabel: '',
      },
    ])
  }

  function removeUnitEanRow(index: number) {
    setProductUnitEans(productUnitEans.filter((_, itemIndex) => itemIndex !== index))
  }

  function formatBeverageContainerType(value: 'NONE' | 'EINWEG' | 'MEHRWEG') {
    if (value === 'EINWEG') {
      return '(EINWEG)'
    }
    if (value === 'MEHRWEG') {
      return '(MEHRWEG)'
    }
    return null
  }

  return (
    <div className="grid min-w-0 gap-6 xl:grid-cols-[minmax(300px,390px)_minmax(0,1fr)]">
      <section className="min-w-0 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="flex flex-wrap items-center justify-between gap-2">
          <h2 className="text-xl font-semibold">
            {editingProductId ? 'Produkt bearbeiten' : 'Neues Produkt'}
          </h2>
          <div className="flex flex-wrap gap-2">
            <button
              type="button"
              onClick={onOpenTemplateImportDialog}
              className="rounded-xl border border-emerald-300 bg-emerald-50 px-3 py-1.5 text-sm font-medium text-emerald-800 transition hover:bg-emerald-100"
            >
              Aus Business-Vorlage übernehmen
            </button>
            <button
              type="button"
              onClick={onCancelEdit}
              className="rounded-xl border border-[var(--brand-border)] px-3 py-1.5 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50"
            >
              Neues Produkt anlegen
            </button>
          </div>
        </div>
        <p className="mt-1 text-sm text-rose-900/70">
          Vereinfachte Anlage mit optionalen Detail-Einstellungen.
        </p>

        <form onSubmit={onSubmit} className="mt-4 space-y-3">
          <div className="rounded-xl border border-[var(--brand-border)] bg-amber-50/60 px-3 py-3">
            <p className="text-xs font-semibold uppercase tracking-wide text-amber-900/80">
              Produktnummer
            </p>
            <p className="mt-1 text-xs text-amber-900/75">
              {productNumberLocked
                ? 'Produktnummer wurde vergeben und kann nicht mehr geändert werden.'
                : 'Produktnummer kann nur einmal vergeben werden.'}
            </p>
            <input
              value={productNumber}
              onChange={(event) => setProductNumber(event.target.value)}
              placeholder="Optional"
              disabled={productNumberLocked}
              className={`mt-2 w-full rounded-xl border px-3 py-2 text-sm outline-none transition disabled:cursor-not-allowed disabled:bg-rose-50 ${
                productNumberError
                  ? 'border-red-300 bg-red-50 focus:border-red-400 focus:ring-2 focus:ring-red-200/60'
                  : 'border-[var(--brand-border)] focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60'
              }`}
            />
            <p className="mt-1 text-xs text-rose-900/70">
              Muss innerhalb der Filiale eindeutig sein.
            </p>
            {productNumberError ? (
              <p className="mt-1 text-xs font-semibold text-red-700">{productNumberError}</p>
            ) : null}
          </div>

          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Name *</span>
            <input
              value={productName}
              onChange={(event) => setProductName(event.target.value)}
              placeholder="z. B. Klassik Burger"
              required
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            />
          </label>

          <div className="grid grid-cols-1 gap-3 md:grid-cols-3">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">EAN</span>
              <input
                value={productEan}
                onChange={(event) => setProductEan(event.target.value)}
                placeholder="z. B. 4012345678901"
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">
                Verkaufspreis (Brutto)
              </span>
              <input
                type="number"
                step="0.01"
                value={price}
                onChange={(event) => setPrice(event.target.value)}
                required
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">
                Pfand (Brutto)
              </span>
              <input
                type="number"
                step="0.01"
                min={0}
                value={productDeposit}
                onChange={(event) => setProductDeposit(event.target.value)}
                className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>
          </div>

          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Kategorie</span>
            <select
              value={categoryId}
              onChange={(event) => setCategoryId(event.target.value)}
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            >
              <option value="">Keine Kategorie</option>
              {categories.map((category) => (
                <option key={category.id} value={category.id}>
                  {category.name}
                </option>
              ))}
            </select>
          </label>

          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">
              Getränke-Behältnis
            </span>
            <select
              value={beverageContainerType}
              onChange={(event) =>
                setBeverageContainerType(
                  event.target.value as 'NONE' | 'EINWEG' | 'MEHRWEG'
                )
              }
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            >
              <option value="NONE">Keine Angabe</option>
              <option value="EINWEG">Einweg</option>
              <option value="MEHRWEG">Mehrweg</option>
            </select>
            <p className="mt-1 text-xs text-rose-900/70">
              Nur für Getränke: wird auf der Verkaufsseite klein angezeigt.
            </p>
          </label>

          <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
            <button
              type="button"
              onClick={() => setShowAdvanced((current) => !current)}
              className="flex w-full items-center justify-between text-left text-sm font-medium text-rose-900/85"
            >
              <span>Weitere Einstellungen</span>
              <span>{showAdvanced ? 'Ausblenden' : 'Einblenden'}</span>
            </button>

            {showAdvanced ? (
              <div className="mt-3 space-y-3">
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">Produktbild</span>
                  <input
                    type="file"
                    accept="image/*"
                    onChange={(event) => onProductImageFileChange(event.target.files?.[0] || null)}
                    className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none transition file:mr-3 file:rounded-lg file:border-0 file:bg-slate-900 file:px-3 file:py-1.5 file:text-xs file:font-semibold file:text-white hover:file:bg-slate-800"
                  />
                  {productImageUrl ? (
                    <div className="mt-2 flex items-center gap-3 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 p-2">
                      <img
                        src={productImageUrl}
                        alt="Produktbild Vorschau"
                        className="h-16 w-16 rounded-lg border border-[var(--brand-border)] object-cover"
                      />
                      <button
                        type="button"
                        onClick={() => setProductImageUrl('')}
                        className="rounded-lg border border-red-300 bg-white px-2.5 py-1 text-xs font-medium text-red-700 transition hover:bg-red-50"
                      >
                        Bild entfernen
                      </button>
                    </div>
                  ) : (
                    <p className="mt-1 text-xs text-rose-900/70">
                      Optional fuer Bestellterminal und visuelle Produktkarte.
                    </p>
                  )}
                </label>

                <div className="rounded-xl border border-[var(--brand-border)] bg-white p-3">
                  <div className="flex items-center justify-between gap-2">
                    <p className="text-sm font-semibold text-slate-800">Einheiten-EANs</p>
                    <button
                      type="button"
                      onClick={addUnitEanRow}
                      className="rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-medium text-rose-900/85 transition hover:bg-rose-50/60"
                    >
                      Einheit hinzufuegen
                    </button>
                  </div>

                  {productUnitEans.length === 0 ? (
                    <p className="mt-2 text-xs text-rose-900/70">
                      Beispiel: Tray 24x mit eigener EAN.
                    </p>
                  ) : (
                    <div className="mt-3 space-y-2">
                      {productUnitEans.map((entry, index) => (
                        <div
                          key={`product-unit-ean-${index}`}
                          className="grid grid-cols-[1fr_1fr_120px_120px_90px] gap-2"
                        >
                          <input
                            value={entry.label}
                            onChange={(event) =>
                              updateUnitEan(index, { label: event.target.value })
                            }
                            placeholder="Bezeichnung"
                            className="rounded-lg border border-[var(--brand-border)] px-2.5 py-1.5 text-xs outline-none"
                          />
                          <input
                            value={entry.ean}
                            onChange={(event) =>
                              updateUnitEan(index, { ean: event.target.value })
                            }
                            placeholder="EAN"
                            className="rounded-lg border border-[var(--brand-border)] px-2.5 py-1.5 text-xs outline-none"
                          />
                          <input
                            type="number"
                            step="0.001"
                            min={0.001}
                            value={entry.unitCount}
                            onChange={(event) =>
                              updateUnitEan(index, {
                                unitCount: Number(event.target.value || 1),
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
                          <button
                            type="button"
                            onClick={() => removeUnitEanRow(index)}
                            className="rounded-lg border border-red-300 bg-white px-2 py-1 text-xs font-medium text-red-700 transition hover:bg-red-50"
                          >
                            Entfernen
                          </button>
                        </div>
                      ))}
                    </div>
                  )}
                </div>

                <div className="grid grid-cols-2 gap-3">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">MwSt *</span>
                    <select
                      value={vatRate}
                      onChange={(event) => setVatRate(event.target.value)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    >
                      <option value="19">19%</option>
                      <option value="7">7%</option>
                    </select>
                  </label>

                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Verfügbarkeit</span>
                    <select
                      value={available}
                      onChange={(event) => setAvailable(event.target.value)}
                      className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                    >
                      <option value="true">Verfügbar</option>
                      <option value="false">Nicht verfügbar</option>
                    </select>
                  </label>
                </div>
              </div>
            ) : null}
          </div>

          <div className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3">
            <button
              type="button"
              onClick={() => setShowArticleDetails((current) => !current)}
              className="flex w-full items-center justify-between text-left text-sm font-medium text-rose-900/85"
            >
              <span>Artikeldetails freischalten</span>
              <span>{showArticleDetails ? 'Ausblenden' : 'Einblenden'}</span>
            </button>
            {showArticleDetails ? (
              <div className="mt-3 space-y-3">
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">
                    Artikelinfo (Zusatztext)
                  </span>
                  <textarea
                    rows={3}
                    value={articleInfo}
                    onChange={(event) => setArticleInfo(event.target.value)}
                    placeholder="Kurze Zusatzinfo zum Artikel"
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">
                    Lebensmittelunternehmer (Anschrift / Adresse)
                  </span>
                  <textarea
                    rows={3}
                    value={foodBusinessOperator}
                    onChange={(event) => setFoodBusinessOperator(event.target.value)}
                    placeholder="Name, Straße, PLZ Ort"
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
                <label className="block">
                  <span className="mb-1 block text-sm font-medium text-rose-900/85">
                    Nährwertangaben
                  </span>
                  <textarea
                    rows={4}
                    value={nutritionInfo}
                    onChange={(event) => setNutritionInfo(event.target.value)}
                    placeholder="z. B. pro 100 g: Brennwert, Fett, KH, Zucker, Eiweiß, Salz"
                    className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
                  />
                </label>
              </div>
            ) : null}
          </div>

          <button
            type="submit"
            disabled={savingProduct}
            className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
          >
            {savingProduct
              ? 'Speichert...'
              : editingProductId
              ? 'Produkt aktualisieren'
              : 'Produkt speichern'}
          </button>

          {editingProductId ? (
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
        <div className="grid gap-3 md:grid-cols-3">
          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Suche</span>
            <input
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              placeholder="Name oder Nummer"
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            />
          </label>

          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Status</span>
            <select
              value={statusFilter}
              onChange={(event) =>
                setStatusFilter(event.target.value as 'ALL' | 'AVAILABLE' | 'UNAVAILABLE')
              }
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            >
              <option value="ALL">Alle</option>
              <option value="AVAILABLE">Verfügbar</option>
              <option value="UNAVAILABLE">Nicht verfügbar</option>
            </select>
          </label>

          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Kategorie</span>
            <select
              value={categoryFilter}
              onChange={(event) => setCategoryFilter(event.target.value)}
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            >
              <option value="ALL">Alle Kategorien</option>
              {categories.map((category) => (
                <option key={category.id} value={category.id}>
                  {category.name}
                </option>
              ))}
            </select>
          </label>
        </div>

        <div className="mt-4 max-w-full overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
          <table className="w-full min-w-[860px] border-collapse">
            <thead>
              <tr>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Bild
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Produkt
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Preis
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Kategorie
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Status
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Allergene
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Aktion
                </th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td colSpan={7} className="px-3 py-3 text-sm text-rose-900/70">
                    Lade Produkte...
                  </td>
                </tr>
              ) : filteredProducts.length === 0 ? (
                <tr>
                  <td colSpan={7} className="px-3 py-3 text-sm text-rose-900/70">
                    Keine Produkte gefunden.
                  </td>
                </tr>
              ) : (
                filteredProducts.map((product) => (
                  <tr key={product.id}>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {product.imageUrl ? (
                        <img
                          src={product.imageUrl}
                          alt={`${product.name} Bild`}
                          className="h-12 w-12 rounded-lg border border-[var(--brand-border)] object-cover"
                        />
                      ) : (
                        <span className="text-xs text-slate-400">-</span>
                      )}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <p className="font-medium text-[var(--brand-ink)]">{product.name}</p>
                      <p className="text-xs text-rose-900/70">
                        {product.productNumber ? `Nr. ${product.productNumber}` : 'Nr. fehlt'}
                      </p>
                      {formatBeverageContainerType(product.beverageContainerType) ? (
                        <p className="mt-1 text-xs text-rose-900/70">
                          {formatBeverageContainerType(product.beverageContainerType)}
                        </p>
                      ) : null}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                      <p>Brutto: {Number(product.price).toFixed(2)} EUR</p>
                      {Number(product.deposit || 0) > 0 ? (
                        <p className="text-xs text-rose-900/70">
                          inkl. {Number(product.deposit || 0).toFixed(2)} EUR Pfand
                        </p>
                      ) : null}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                      {product.category?.name || '-'}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <span
                        className={`rounded-lg px-2 py-1 text-xs font-semibold ${
                          product.available
                            ? 'bg-green-100 text-green-700'
                            : 'bg-slate-200 text-rose-900/85'
                        }`}
                      >
                        {product.available ? 'Verfügbar' : 'Nicht verfügbar'}
                      </span>
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                      {product.allergens?.join(', ') || '-'}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <div className="flex flex-wrap gap-1.5">
                        <button
                          type="button"
                          onClick={() => onEdit(product)}
                          className="rounded-lg bg-slate-900 px-2.5 py-1 text-xs font-medium text-white transition hover:bg-slate-800"
                        >
                          Bearbeiten
                        </button>
                        <button
                          type="button"
                          onClick={() => onCreateIngredientFromProduct(product)}
                          disabled={creatingIngredientProductId === product.id}
                          className="rounded-lg border border-emerald-300 bg-white px-2.5 py-1 text-xs font-medium text-emerald-700 transition hover:bg-emerald-50 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {creatingIngredientProductId === product.id ? 'Angelegt...' : 'Als Zutat'}
                        </button>
                        <button
                          type="button"
                          onClick={() => onCopy(product)}
                          disabled={copyingProductId === product.id}
                          className="rounded-lg border border-indigo-300 bg-white px-2.5 py-1 text-xs font-medium text-indigo-700 transition hover:bg-indigo-50 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {copyingProductId === product.id ? 'Kopiert...' : 'Kopieren'}
                        </button>
                        <button
                          type="button"
                          onClick={() => onDelete(product)}
                          disabled={deletingProductId === product.id}
                          className="rounded-lg border border-red-300 bg-white px-2.5 py-1 text-xs font-medium text-red-700 transition hover:bg-red-50 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {deletingProductId === product.id ? 'Loescht...' : 'Loeschen'}
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
  )
}

