'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  getCalculationList,
  getProducts,
  updateProduct,
  type Product,
  type ProductCalculation,
} from '@/lib/api'

type AvailabilityFilter = 'ALL' | 'AVAILABLE' | 'UNAVAILABLE'
type SortMode =
  | 'NAME_ASC'
  | 'MARGIN_PERCENT_DESC'
  | 'MARGIN_EUR_DESC'
  | 'COST_PERCENT_ASC'
  | 'COST_PERCENT_DESC'

export default function AdminCalculationPage() {
  const defaultMarginPercent = 50
  const [rows, setRows] = useState<ProductCalculation[]>([])
  const [productsById, setProductsById] = useState<Record<string, Product>>({})
  const [selectedProductId, setSelectedProductId] = useState('')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [isSavingPrice, setIsSavingPrice] = useState(false)

  const [search, setSearch] = useState('')
  const [availabilityFilter, setAvailabilityFilter] = useState<AvailabilityFilter>('ALL')
  const [sortMode, setSortMode] = useState<SortMode>('MARGIN_PERCENT_DESC')
  const [targetSellingPrice, setTargetSellingPrice] = useState(0)
  const [targetMarginEuro, setTargetMarginEuro] = useState(0)
  const [targetMarginPercent, setTargetMarginPercent] = useState(defaultMarginPercent)

  async function loadData() {
    try {
      setLoading(true)
      setError('')
      setSuccess('')

      const [calculationResult, productsResult] = await Promise.allSettled([
        getCalculationList(),
        getProducts(),
      ])

      if (calculationResult.status === 'fulfilled') {
        setRows(calculationResult.value)
      } else {
        setRows([])
        setError(
          calculationResult.reason instanceof Error
            ? calculationResult.reason.message
            : 'Kalkulation konnte nicht geladen werden'
        )
      }

      if (productsResult.status === 'fulfilled') {
        setProductsById(Object.fromEntries(productsResult.value.map((entry) => [entry.id, entry])))
      } else {
        setProductsById({})
      }

      if (
        !selectedProductId &&
        calculationResult.status === 'fulfilled' &&
        calculationResult.value[0]?.productId
      ) {
        setSelectedProductId(calculationResult.value[0].productId)
      }
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Kalkulation konnte nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadData()
  }, [])

  const filteredRows = useMemo(() => {
    const query = search.trim().toLowerCase()

    const filtered = rows.filter((row) => {
      const matchesSearch =
        !query ||
        row.productName.toLowerCase().includes(query) ||
        row.allergens.some((entry) => entry.toLowerCase().includes(query))

      const matchesAvailability =
        availabilityFilter === 'ALL' ||
        (availabilityFilter === 'AVAILABLE' && row.available) ||
        (availabilityFilter === 'UNAVAILABLE' && !row.available)

      return matchesSearch && matchesAvailability
    })

    return filtered.sort((left, right) => {
      if (sortMode === 'NAME_ASC') {
        return left.productName.localeCompare(right.productName, 'de', { sensitivity: 'base' })
      }
      if (sortMode === 'MARGIN_EUR_DESC') {
        return right.margin - left.margin
      }
      if (sortMode === 'COST_PERCENT_ASC') {
        return left.costPercent - right.costPercent
      }
      if (sortMode === 'COST_PERCENT_DESC') {
        return right.costPercent - left.costPercent
      }
      return right.marginPercent - left.marginPercent
    })
  }, [availabilityFilter, rows, search, sortMode])

  useEffect(() => {
    if (filteredRows.length === 0) {
      if (selectedProductId) {
        setSelectedProductId('')
      }
      return
    }

    const isSelectedAvailable = filteredRows.some((entry) => entry.productId === selectedProductId)
    if (!isSelectedAvailable) {
      setSelectedProductId(filteredRows[0].productId)
    }
  }, [filteredRows, selectedProductId])

  const selected = useMemo(
    () => filteredRows.find((row) => row.productId === selectedProductId) || null,
    [filteredRows, selectedProductId]
  )
  const selectedProduct = useMemo(
    () => (selected ? productsById[selected.productId] || null : null),
    [productsById, selected]
  )
  const selectedVatRate = useMemo(() => {
    if (selected && typeof selected.vatRate === 'number' && Number.isFinite(selected.vatRate)) {
      return Math.max(0, selected.vatRate)
    }
    if (!selectedProduct) {
      return 0
    }
    const fromProduct = Number(selectedProduct.vatRate)
    return Number.isFinite(fromProduct) ? Math.max(0, fromProduct) : 0
  }, [selected, selectedProduct])
  const selectedVatFactor = 1 + selectedVatRate / 100
  const selectedSellingPriceNet = useMemo(() => {
    if (!selected) {
      return 0
    }
    if (typeof selected.sellingPriceNet === 'number' && Number.isFinite(selected.sellingPriceNet)) {
      return selected.sellingPriceNet
    }
    return selectedVatFactor > 0 ? selected.sellingPrice / selectedVatFactor : selected.sellingPrice
  }, [selected, selectedVatFactor])
  const selectedTotalCostNet = useMemo(() => {
    if (!selected) {
      return 0
    }
    if (typeof selected.totalCostNet === 'number' && Number.isFinite(selected.totalCostNet)) {
      return selected.totalCostNet
    }
    return selectedVatFactor > 0 ? selected.totalCost / selectedVatFactor : selected.totalCost
  }, [selected, selectedVatFactor])
  const selectedMarginNet = useMemo(() => {
    if (!selected) {
      return 0
    }
    if (typeof selected.marginNet === 'number' && Number.isFinite(selected.marginNet)) {
      return selected.marginNet
    }
    return selectedSellingPriceNet - selectedTotalCostNet
  }, [selected, selectedSellingPriceNet, selectedTotalCostNet])

  useEffect(() => {
    if (!selected) {
      setTargetSellingPrice(0)
      setTargetMarginEuro(0)
      setTargetMarginPercent(defaultMarginPercent)
      return
    }

    const next = calculateFromMarginPercent(selected.totalCost, defaultMarginPercent)
    setTargetSellingPrice(next.sellingPrice)
    setTargetMarginEuro(next.marginEuro)
    setTargetMarginPercent(next.marginPercent)
  }, [defaultMarginPercent, selected])

  async function saveTargetPrice() {
    if (!selected || !selectedProduct) {
      return
    }

    setIsSavingPrice(true)
    setError('')
    setSuccess('')
    try {
      const safePrice = Number(Math.max(0, targetSellingPrice).toFixed(2))
      await updateProduct(selectedProduct.id, {
        name: selectedProduct.name,
        imageUrl: selectedProduct.imageUrl,
        ean: selectedProduct.ean,
        unitEans: selectedProduct.unitEans,
        price: safePrice,
        vatRate: Number(selectedProduct.vatRate),
        categoryId: selectedProduct.categoryId,
        available: selectedProduct.available,
      })
      setSuccess(`Neuer Brutto-Verkaufspreis gespeichert: ${safePrice.toFixed(2)} EUR`)
      await loadData()
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Preis konnte nicht gespeichert werden')
    } finally {
      setIsSavingPrice(false)
    }
  }

  const metrics = useMemo(() => {
    const total = rows.length
    const available = rows.filter((entry) => entry.available).length
    const avgMarginPercent =
      total > 0 ? rows.reduce((sum, entry) => sum + entry.marginPercent, 0) / total : 0
    const avgCostPercent =
      total > 0 ? rows.reduce((sum, entry) => sum + entry.costPercent, 0) / total : 0
    const critical = rows.filter((entry) => entry.costPercent >= 60).length
    const negative = rows.filter((entry) => entry.margin < 0).length

    return {
      total,
      available,
      unavailable: total - available,
      avgMarginPercent,
      avgCostPercent,
      critical,
      negative,
    }
  }, [rows])

  function handleTargetMarginPercentChange(nextValue: number) {
    if (!selected) {
      return
    }
    const next = calculateFromMarginPercent(selected.totalCost, nextValue)
    setTargetSellingPrice(next.sellingPrice)
    setTargetMarginEuro(next.marginEuro)
    setTargetMarginPercent(next.marginPercent)
  }

  function handleTargetMarginEuroChange(nextValue: number) {
    if (!selected) {
      return
    }
    const next = calculateFromMarginEuro(selected.totalCost, nextValue)
    setTargetSellingPrice(next.sellingPrice)
    setTargetMarginEuro(next.marginEuro)
    setTargetMarginPercent(next.marginPercent)
  }

  function handleTargetSellingPriceChange(nextValue: number) {
    if (!selected) {
      return
    }
    const next = calculateFromSellingPrice(selected.totalCost, nextValue)
    setTargetSellingPrice(next.sellingPrice)
    setTargetMarginEuro(next.marginEuro)
    setTargetMarginPercent(next.marginPercent)
  }

  return (
    <AdminLayout
      title="Kalkulation"
      subtitle="Professionelle Kosten-, Marge- und Risikoanalyse je Produkt"
    >
      {error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}
      {success ? (
        <div className="mb-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">
          {success}
        </div>
      ) : null}

      <section className="mb-6 grid gap-3 sm:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-6">
        <TopMetric label="Produkte gesamt" value={String(metrics.total)} tone="slate" />
        <TopMetric label="Verfuegbar" value={String(metrics.available)} tone="emerald" />
        <TopMetric label="Nicht verfuegbar" value={String(metrics.unavailable)} tone="rose" />
        <TopMetric label="Durchschnitt Marge %" value={`${metrics.avgMarginPercent.toFixed(1)} %`} tone="indigo" />
        <TopMetric label="Durchschnitt Kostenquote" value={`${metrics.avgCostPercent.toFixed(1)} %`} tone="amber" />
        <TopMetric label="Kritisch (>=60%)" value={String(metrics.critical)} tone="red" />
      </section>

      <div className="grid min-w-0 gap-6 xl:grid-cols-[minmax(320px,420px)_minmax(0,1fr)]">
        <section className="min-w-0 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <div className="flex items-start justify-between gap-3">
            <div>
              <h2 className="text-xl font-semibold">Produktauswahl</h2>
              <p className="mt-1 text-sm text-rose-900/70">
                Suche, filtere und priorisiere nach Marge oder Kostenquote.
              </p>
            </div>
            <button
              type="button"
              onClick={() => void loadData()}
              disabled={loading}
              className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs font-medium text-rose-900/85 hover:bg-rose-50/60 disabled:opacity-60"
            >
              Aktualisieren
            </button>
          </div>

          <div className="mt-4 grid gap-2">
            <input
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              placeholder="Produkt oder Allergen suchen"
              className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm text-[var(--brand-ink)] outline-none ring-cyan-200 placeholder:text-slate-400 focus:border-cyan-500 focus:ring"
            />
            <select
              value={availabilityFilter}
              onChange={(event) => setAvailabilityFilter(event.target.value as AvailabilityFilter)}
              className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm text-[var(--brand-ink)] outline-none ring-cyan-200 focus:border-cyan-500 focus:ring"
            >
              <option value="ALL">Alle Status</option>
              <option value="AVAILABLE">Nur verfuegbar</option>
              <option value="UNAVAILABLE">Nur nicht verfuegbar</option>
            </select>
            <select
              value={sortMode}
              onChange={(event) => setSortMode(event.target.value as SortMode)}
              className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm text-[var(--brand-ink)] outline-none ring-cyan-200 focus:border-cyan-500 focus:ring"
            >
              <option value="MARGIN_PERCENT_DESC">Sortierung: Marge % (hoch)</option>
              <option value="MARGIN_EUR_DESC">Sortierung: Marge EUR (hoch)</option>
              <option value="COST_PERCENT_ASC">Sortierung: Kostenquote (niedrig)</option>
              <option value="COST_PERCENT_DESC">Sortierung: Kostenquote (hoch)</option>
              <option value="NAME_ASC">Sortierung: Name A-Z</option>
            </select>
          </div>

          <div className="mt-4 max-h-[52vh] space-y-3 overflow-auto pr-1">
            {loading ? (
              <p className="text-sm text-rose-900/70">Lade Kalkulationsdaten...</p>
            ) : filteredRows.length === 0 ? (
              <p className="text-sm text-rose-900/70">Keine Produkte passend zur aktuellen Auswahl.</p>
            ) : (
              filteredRows.map((row) => {
                const selectedRow = row.productId === selectedProductId
                const costWidth = `${Math.max(4, Math.min(100, row.costPercent))}%`

                return (
                  <button
                    key={row.productId}
                    type="button"
                    onClick={() => setSelectedProductId(row.productId)}
                    className={`w-full rounded-2xl border p-4 text-left transition ${
                      selectedRow
                        ? 'border-cyan-300 bg-cyan-50'
                        : 'border-[var(--brand-border)] bg-rose-50/60 hover:bg-rose-50'
                    }`}
                  >
                    <div className="flex items-center justify-between gap-2">
                      <p className="font-semibold text-[var(--brand-ink)]">{row.productName}</p>
                      <span
                        className={`rounded-lg px-2 py-1 text-[11px] font-semibold ${
                          row.available ? 'bg-emerald-100 text-emerald-700' : 'bg-rose-100 text-rose-700'
                        }`}
                      >
                        {row.available ? 'Verfuegbar' : 'Inaktiv'}
                      </span>
                    </div>

                    <div className="mt-2 grid grid-cols-2 gap-2 text-xs text-rose-900/75">
                      <span>VK brutto: {formatEur(row.sellingPrice)}</span>
                      <span>EK brutto: {formatEur(row.totalCost)}</span>
                      <span>Marge: {formatEur(row.margin)}</span>
                      <span>Marge %: {formatPercent(row.marginPercent)}</span>
                    </div>

                    <div className="mt-3">
                      <div className="mb-1 flex items-center justify-between text-[11px] text-rose-900/70">
                        <span>Kostenquote</span>
                        <span>{formatPercent(row.costPercent)}</span>
                      </div>
                      <div className="h-2 rounded-full bg-slate-200">
                        <div
                          className={`h-2 rounded-full ${
                            row.costPercent < 40
                              ? 'bg-emerald-500'
                              : row.costPercent < 60
                                ? 'bg-amber-500'
                                : 'bg-rose-500'
                          }`}
                          style={{ width: costWidth }}
                        />
                      </div>
                    </div>
                  </button>
                )
              })
            )}
          </div>
        </section>

        <section className="min-w-0 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          {!selected ? (
            <p className="text-sm text-rose-900/70">Bitte ein Produkt auswaehlen.</p>
          ) : (
            <>
              <div className="mb-5 flex flex-wrap items-start justify-between gap-3">
                <div>
                  <h2 className="text-2xl font-bold text-[var(--brand-ink)]">{selected.productName}</h2>
                  <p className="mt-1 text-sm text-rose-900/70">
                    Risikoanalyse fuer Wareneinsatz, Deckungsbeitrag und Allergene.
                  </p>
                </div>
                <div className="flex flex-wrap items-center gap-2">
                  <span
                    className={`rounded-xl px-3 py-1 text-xs font-semibold ${
                      selected.available ? 'bg-emerald-100 text-emerald-700' : 'bg-rose-100 text-rose-700'
                    }`}
                  >
                    {selected.available ? 'Verfuegbar' : 'Nicht verfuegbar'}
                  </span>
                  <span className={`rounded-xl px-3 py-1 text-xs font-semibold ${toneForCost(selected.costPercent)}`}>
                    {labelForCost(selected.costPercent)}
                  </span>
                </div>
              </div>

              <div className="mb-6 grid gap-3 md:grid-cols-2 xl:grid-cols-3">
                <MetricCard label="Verkaufspreis Brutto" value={formatEur(selected.sellingPrice)} />
                <MetricCard label="Verkaufspreis Netto" value={formatEur(selectedSellingPriceNet)} />
                <MetricCard label="Wareneinsatz Brutto" value={formatEur(selected.totalCost)} />
                <MetricCard label="Wareneinsatz Netto" value={formatEur(selectedTotalCostNet)} />
                <MetricCard label="Deckungsbeitrag Brutto" value={formatEur(selected.margin)} />
                <MetricCard label="Deckungsbeitrag Netto" value={formatEur(selectedMarginNet)} />
                <MetricCard label="Marge %" value={formatPercent(selected.marginPercent)} />
                <MetricCard label="Kostenquote" value={formatPercent(selected.costPercent)} />
                <MetricCard label="Zutatenanzahl" value={String(selected.ingredients.length)} />
              </div>

              <div className="mb-6 rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <div className="flex flex-wrap items-start justify-between gap-3">
                  <div>
                    <h3 className="text-base font-semibold text-[var(--brand-ink)]">
                      Preis- und Margensteuerung
                    </h3>
                    <p className="mt-1 text-sm text-rose-900/70">
                      Vorbelegung je Produkt: {defaultMarginPercent}% Marge.
                      <br />
                      EK wird netto gerechnet, Brutto-Werte werden automatisch per MwSt ({selectedVatRate.toFixed(2)}%) berechnet.
                    </p>
                  </div>
                  <button
                    type="button"
                    onClick={() => handleTargetMarginPercentChange(defaultMarginPercent)}
                    className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-xs font-medium text-rose-900/85 hover:bg-rose-50"
                  >
                    Auf {defaultMarginPercent}% zuruecksetzen
                  </button>
                </div>

                <div className="mt-4 grid gap-3 md:grid-cols-3">
                  <label className="text-sm text-rose-900/80">
                    Ziel-Marge %
                    <input
                      className="input-ui mt-1"
                      type="number"
                      min={-200}
                      max={95}
                      step={0.1}
                      value={Number(targetMarginPercent.toFixed(2))}
                      onChange={(event) =>
                        handleTargetMarginPercentChange(Number(event.target.value))
                      }
                    />
                  </label>
                  <label className="text-sm text-rose-900/80">
                    Ziel-Marge EUR
                    <input
                      className="input-ui mt-1"
                      type="number"
                      step={0.01}
                      value={Number(targetMarginEuro.toFixed(2))}
                      onChange={(event) =>
                        handleTargetMarginEuroChange(Number(event.target.value))
                      }
                    />
                  </label>
                  <label className="text-sm text-rose-900/80">
                    Neuer VK Brutto EUR
                    <input
                      className="input-ui mt-1"
                      type="number"
                      min={0}
                      step={0.01}
                      value={Number(targetSellingPrice.toFixed(2))}
                      onChange={(event) =>
                        handleTargetSellingPriceChange(Number(event.target.value))
                      }
                    />
                  </label>
                </div>

                <div className="mt-3 flex flex-wrap items-center justify-between gap-3 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm">
                  <p className="text-rose-900/80">
                    Aktueller VK brutto: <strong>{formatEur(selected.sellingPrice)}</strong> | Neuer VK brutto:{' '}
                    <strong>{formatEur(targetSellingPrice)}</strong>
                  </p>
                  <button
                    type="button"
                    className="btn-ui"
                    disabled={isSavingPrice || !selectedProduct}
                    onClick={() => void saveTargetPrice()}
                  >
                    {isSavingPrice ? 'Speichert...' : 'Neuen VK speichern'}
                  </button>
                </div>
              </div>

              <div className="mb-6 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
                <h3 className="text-sm font-semibold text-slate-800">Management-Hinweis</h3>
                <p className="mt-1 text-sm text-rose-900/75">{messageForCost(selected.costPercent, selected.margin)}</p>
                <div className="mt-3 flex flex-wrap gap-2">
                  {selected.allergens.length === 0 ? (
                    <span className="rounded-lg bg-white px-2 py-1 text-xs text-rose-900/70">Keine Allergene</span>
                  ) : (
                    selected.allergens.map((entry) => (
                      <span
                        key={entry}
                        className="rounded-lg border border-amber-200 bg-amber-50 px-2 py-1 text-xs font-medium text-amber-800"
                      >
                        {entry}
                      </span>
                    ))
                  )}
                </div>
              </div>

              <h3 className="mb-3 text-lg font-semibold">Zutatenpositionen</h3>
              <div className="overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[760px] border-collapse">
                  <thead>
                    <tr>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Zutat
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Rezeptmenge
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Einkaufsmenge
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        EK je Einheit (Netto)
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        EK je Einheit (Brutto)
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Kosten Netto
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Kosten Brutto
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Anteil
                      </th>
                      <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                        Allergene
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    {selected.ingredients.map((ingredient, index) => {
                      const sharePercent =
                        selected.totalCost > 0 ? (ingredient.cost / selected.totalCost) * 100 : 0
                      const purchaseQuantityText =
                        typeof ingredient.purchaseQuantity === 'number'
                          ? `${ingredient.purchaseQuantity.toFixed(3)} ${ingredient.purchaseUnit || ingredient.unit}`
                          : '-'
                      const priceNet = resolveNumberValue(ingredient.priceNet, ingredient.price)
                      const priceGross = resolveNumberValue(ingredient.priceGross, priceNet * selectedVatFactor)
                      const costNet = resolveNumberValue(
                        ingredient.costNet,
                        typeof ingredient.purchaseQuantity === 'number'
                          ? priceNet * ingredient.purchaseQuantity
                          : 0
                      )
                      const costGross = resolveNumberValue(ingredient.costGross, ingredient.cost)

                      return (
                        <tr key={`${ingredient.name}-${index}`}>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm font-medium text-[var(--brand-ink)]">
                            {ingredient.name}
                          </td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                            {ingredient.quantity} {ingredient.unit}
                          </td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                            {purchaseQuantityText}
                            {ingredient.conversionApplied ? (
                              <span className="ml-2 rounded bg-cyan-100 px-1.5 py-0.5 text-[10px] font-semibold text-cyan-800">
                                Konvertiert
                              </span>
                            ) : null}
                          </td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                            {formatEur(priceNet)}
                          </td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                            {formatEur(priceGross)}
                          </td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                            {formatEur(costNet)}
                          </td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                            {formatEur(costGross)}
                          </td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                            {formatPercent(sharePercent)}
                          </td>
                          <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                            {ingredient.allergens.join(', ') || '-'}
                          </td>
                        </tr>
                      )
                    })}
                  </tbody>
                </table>
              </div>
            </>
          )}
        </section>
      </div>
    </AdminLayout>
  )
}

function formatEur(value: number) {
  return `${value.toFixed(2)} EUR`
}

function formatPercent(value: number) {
  return `${value.toFixed(1)} %`
}

function labelForCost(costPercent: number) {
  if (costPercent < 35) {
    return 'Sehr gute Kalkulation'
  }
  if (costPercent < 50) {
    return 'Stabil'
  }
  if (costPercent < 60) {
    return 'Beobachten'
  }
  return 'Kritisch'
}

function toneForCost(costPercent: number) {
  if (costPercent < 35) {
    return 'bg-emerald-100 text-emerald-700'
  }
  if (costPercent < 50) {
    return 'bg-cyan-100 text-rose-700'
  }
  if (costPercent < 60) {
    return 'bg-amber-100 text-amber-700'
  }
  return 'bg-rose-100 text-rose-700'
}

function messageForCost(costPercent: number, margin: number) {
  if (margin < 0) {
    return 'Dieses Produkt ist aktuell negativ. Bitte Preis, Portionsgroesse oder Einkaufskonditionen direkt pruefen.'
  }
  if (costPercent >= 60) {
    return 'Die Kostenquote ist kritisch hoch. Empfohlen: Rezeptur optimieren oder Verkaufspreis anpassen.'
  }
  if (costPercent >= 50) {
    return 'Die Kostenquote ist erhoeht. Beobachte Einkaufs- und Portionswerte engmaschig.'
  }
  if (costPercent >= 35) {
    return 'Die Kalkulation ist stabil. Dieses Produkt kann im Sortiment so gefuehrt werden.'
  }
  return 'Sehr gute Kalkulation mit starkem Deckungsbeitrag.'
}

function calculateFromMarginPercent(totalCost: number, marginPercent: number) {
  const safePercent = Math.max(-200, Math.min(95, Number.isFinite(marginPercent) ? marginPercent : 50))
  const denominator = 1 - safePercent / 100
  const sellingPrice = denominator > 0 ? totalCost / denominator : totalCost
  const marginEuro = sellingPrice - totalCost

  return {
    sellingPrice: roundTwo(sellingPrice),
    marginEuro: roundTwo(marginEuro),
    marginPercent: roundTwo(safePercent),
  }
}

function calculateFromMarginEuro(totalCost: number, marginEuro: number) {
  const safeMargin = Number.isFinite(marginEuro) ? marginEuro : 0
  const sellingPrice = Math.max(0, totalCost + safeMargin)
  const marginPercent = sellingPrice > 0 ? (safeMargin / sellingPrice) * 100 : 0

  return {
    sellingPrice: roundTwo(sellingPrice),
    marginEuro: roundTwo(safeMargin),
    marginPercent: roundTwo(marginPercent),
  }
}

function calculateFromSellingPrice(totalCost: number, sellingPrice: number) {
  const safeSellingPrice = Math.max(0, Number.isFinite(sellingPrice) ? sellingPrice : 0)
  const marginEuro = safeSellingPrice - totalCost
  const marginPercent = safeSellingPrice > 0 ? (marginEuro / safeSellingPrice) * 100 : 0

  return {
    sellingPrice: roundTwo(safeSellingPrice),
    marginEuro: roundTwo(marginEuro),
    marginPercent: roundTwo(marginPercent),
  }
}

function roundTwo(value: number) {
  return Number(value.toFixed(2))
}

function resolveNumberValue(primary: number | undefined, fallback: number) {
  if (typeof primary === 'number' && Number.isFinite(primary)) {
    return primary
  }
  return Number.isFinite(fallback) ? fallback : 0
}

function MetricCard({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
      <p className="text-xs uppercase tracking-wide text-rose-900/70">{label}</p>
      <p className="mt-2 text-lg font-bold text-[var(--brand-ink)]">{value}</p>
    </div>
  )
}

function TopMetric({
  label,
  value,
  tone,
}: {
  label: string
  value: string
  tone: 'slate' | 'emerald' | 'rose' | 'indigo' | 'amber' | 'red'
}) {
  const toneClass =
    tone === 'emerald'
      ? 'border-emerald-200 bg-emerald-50 text-emerald-700'
      : tone === 'rose'
        ? 'border-rose-200 bg-rose-50 text-rose-700'
        : tone === 'indigo'
          ? 'border-indigo-200 bg-indigo-50 text-indigo-700'
          : tone === 'amber'
            ? 'border-amber-200 bg-amber-50 text-amber-700'
            : tone === 'red'
              ? 'border-red-200 bg-red-50 text-red-700'
              : 'border-[var(--brand-border)] bg-white text-rose-900/85'

  return (
    <div className={`rounded-2xl border px-4 py-3 ${toneClass}`}>
      <p className="text-[11px] uppercase tracking-wide">{label}</p>
      <p className="mt-2 text-xl font-semibold">{value}</p>
    </div>
  )
}

