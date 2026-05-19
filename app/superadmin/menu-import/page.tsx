'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  analyzeSuperadminMenuImport,
  getAccessContext,
  importSuperadminMenuImport,
  getSuperadminMenuImportStatus,
  type AccessContext,
  type MenuImportAnalysisResult,
  type SuperadminMenuImportStatus,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function formatPrice(value: number | null) {
  if (value === null || Number.isNaN(value)) return '—'
  return `${value.toFixed(2).replace('.', ',')} €`
}

export default function SuperadminMenuImportPage() {
  const [preferredTenantId, setPreferredTenantId] = useState('')
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [sessionLoading, setSessionLoading] = useState(true)
  const [sessionError, setSessionError] = useState('')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [contextLoading, setContextLoading] = useState(false)
  const [tenantId, setTenantId] = useState('')
  const [files, setFiles] = useState<File[]>([])
  const [result, setResult] = useState<MenuImportAnalysisResult | null>(null)
  const [isAnalyzing, setIsAnalyzing] = useState(false)
  const [isImporting, setIsImporting] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [status, setStatus] = useState<SuperadminMenuImportStatus | null>(null)
  const [editableResult, setEditableResult] = useState<MenuImportAnalysisResult | null>(null)
  const [categoryFilter, setCategoryFilter] = useState('')
  const [productSearch, setProductSearch] = useState('')
  const [expandedCategories, setExpandedCategories] = useState<Record<string, boolean>>({})
  const [selectedProducts, setSelectedProducts] = useState<Record<string, boolean>>({})
  const [bulkTargetCategory, setBulkTargetCategory] = useState('')
  const [useMenuNumbersAsSku, setUseMenuNumbersAsSku] = useState(true)
  const [importSummary, setImportSummary] = useState<{
    importedCategories: number
    importedProducts: number
    importedVariants: number
    createdIngredients: number
    reusedIngredients: number
    ingredientLinksCreated: number
    productsWithoutIngredients: number
    productsWithWarnings: number
  } | null>(null)

  const selectedTenant = useMemo(
    () => context?.tenants.find((entry) => entry.id === tenantId) || null,
    [context?.tenants, tenantId]
  )

  const resultCounters = useMemo(() => {
    if (!editableResult) {
      return {
        categories: 0,
        products: 0,
        variants: 0,
        ingredients: 0,
        warnings: 0,
      }
    }
    const ingredientSet = new Set<string>()
    let products = 0
    let variants = 0
    for (const category of editableResult.categories) {
      products += category.products.length
      for (const product of category.products) {
        variants += product.variants.length
        for (const ingredient of product.ingredients) {
          ingredientSet.add(ingredient.trim().toLocaleLowerCase('de-DE'))
        }
      }
    }
    return {
      categories: editableResult.categories.length,
      products,
      variants,
      ingredients: ingredientSet.size,
      warnings: editableResult.warnings.length,
    }
  }, [editableResult])

  const hasJsonFallbackWarning = useMemo(() => {
    if (!editableResult) return false
    return editableResult.warnings.some((warning) =>
      warning.toLocaleLowerCase('de-DE').includes('keine gültige json-struktur')
    )
  }, [editableResult])

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      setSessionError('Nur Superadmin hat Zugriff auf den Menü-Import.')
      window.location.href = '/'
      return
    }
    setSession(parsed)
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
    try {
      const parsedUrl = new URL(window.location.href)
      setPreferredTenantId(parsedUrl.searchParams.get('tenantId')?.trim() || '')
    } catch {
      setPreferredTenantId('')
    }
    setSessionLoading(false)
  }, [])

  useEffect(() => {
    async function loadContext() {
      if (!token || contextLoading || context) return
      try {
        setContextLoading(true)
        const loaded = await getAccessContext(token)
        setContext(loaded)
        if (preferredTenantId && loaded.tenants.some((entry) => entry.id === preferredTenantId)) {
          setTenantId(preferredTenantId)
        } else if (!tenantId && loaded.tenants[0]?.id) {
          setTenantId(loaded.tenants[0].id)
        }
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Filialliste konnte nicht geladen werden.')
      } finally {
        setContextLoading(false)
      }
    }
    void loadContext()
  }, [token, contextLoading, context, tenantId, preferredTenantId])

  useEffect(() => {
    if (!token) return
    void (async () => {
      try {
        const loadedStatus = await getSuperadminMenuImportStatus(token)
        setStatus(loadedStatus)
      } catch (statusError) {
        setError(statusError instanceof Error ? statusError.message : 'Status konnte nicht geladen werden.')
      }
    })()
  }, [token])

  function handleFiles(nextFiles: FileList | null) {
    if (!nextFiles) {
      setFiles([])
      return
    }
    const list = Array.from(nextFiles).slice(0, 10)
    setFiles(list)
  }

  async function runAnalysis() {
    if (!token) {
      setError('Nicht eingeloggt.')
      return
    }
    if (!tenantId) {
      setError('Bitte zuerst eine Filiale auswählen.')
      return
    }
    if (files.length < 1 || files.length > 10) {
      setError('Bitte 1 bis 10 Bilder auswählen.')
      return
    }

    try {
      setIsAnalyzing(true)
      setError('')
      setSuccess('')
      const analyzed = await analyzeSuperadminMenuImport(token, tenantId, files)
      setResult(analyzed)
      setEditableResult(analyzed)
      setImportSummary(null)
      const nextExpanded: Record<string, boolean> = {}
      for (const category of analyzed.categories) {
        nextExpanded[category.name] = true
      }
      setExpandedCategories(nextExpanded)
      setSelectedProducts({})
      setBulkTargetCategory('')
      setSuccess('Speisekarte wurde analysiert. Bitte Ergebnis prüfen.')
    } catch (analysisError) {
      setResult(null)
      const message =
        analysisError instanceof Error ? analysisError.message : 'Analyse fehlgeschlagen.'
      if (/json/i.test(message) || /struktur/i.test(message)) {
        setError('KI hat keine gültige JSON-Struktur geliefert. Bitte erneut analysieren oder anderes Bild verwenden.')
      } else {
        setError(message)
      }
    } finally {
      setIsAnalyzing(false)
    }
  }

  async function copyJson() {
    if (!editableResult) return
    try {
      await navigator.clipboard.writeText(JSON.stringify(editableResult, null, 2))
      setSuccess('JSON wurde in die Zwischenablage kopiert.')
    } catch {
      setError('JSON konnte nicht kopiert werden.')
    }
  }

  async function copyDebugRawResponse() {
    if (!editableResult?.debugRawResponsePreview) return
    try {
      await navigator.clipboard.writeText(editableResult.debugRawResponsePreview)
      setSuccess('Debug-Rohantwort wurde in die Zwischenablage kopiert.')
    } catch {
      setError('Debug-Rohantwort konnte nicht kopiert werden.')
    }
  }

  function updateProductField(
    categoryIndex: number,
    productIndex: number,
    field: 'name' | 'productNumber' | 'description' | 'price',
    value: string
  ) {
    setEditableResult((current) => {
      if (!current) return current
      const next = structuredClone(current)
      const target = next.categories[categoryIndex]?.products[productIndex]
      if (!target) return current
      if (field === 'price') {
        const normalized = value.replace(',', '.')
        const parsed = Number(normalized)
        target.price = Number.isFinite(parsed) ? parsed : null
      } else if (field === 'productNumber') {
        target.productNumber = value.trim() || null
      } else if (field === 'description') {
        target.description = value.trim() || null
      } else {
        target.name = value
      }
      return next
    })
  }

  function addProductIngredient(categoryIndex: number, productIndex: number, ingredientName: string) {
    const normalized = ingredientName.trim()
    if (!normalized) return
    setEditableResult((current) => {
      if (!current) return current
      const next = structuredClone(current)
      const target = next.categories[categoryIndex]?.products[productIndex]
      if (!target) return current
      const existing = new Set(target.ingredients.map((entry) => entry.trim().toLocaleLowerCase('de-DE')))
      if (!existing.has(normalized.toLocaleLowerCase('de-DE'))) {
        target.ingredients.push(normalized)
      }
      return next
    })
  }

  function removeProductIngredient(categoryIndex: number, productIndex: number, ingredientIndex: number) {
    setEditableResult((current) => {
      if (!current) return current
      const next = structuredClone(current)
      const target = next.categories[categoryIndex]?.products[productIndex]
      if (!target) return current
      target.ingredients.splice(ingredientIndex, 1)
      return next
    })
  }

  async function runImport() {
    if (!token || !tenantId || !editableResult) return
    const unsortedCategory = editableResult.categories.find(
      (category) => category.name.trim().toLocaleLowerCase('de-DE') === 'unsortiert'
    )
    if ((unsortedCategory?.products.length || 0) > 0) {
      const proceed = window.confirm(
        'Es gibt noch unsortierte Produkte. Trotzdem importieren?'
      )
      if (!proceed) return
    }
    try {
      setIsImporting(true)
      setError('')
      setSuccess('')
      const response = await importSuperadminMenuImport(token, {
        tenantId,
        analysisResult: editableResult,
        importOptions: {
          useMenuNumbersAsSku,
        },
      })
      setImportSummary({
        importedCategories: response.importedCategories,
        importedProducts: response.importedProducts,
        importedVariants: response.importedVariants,
        createdIngredients: response.createdIngredients,
        reusedIngredients: response.reusedIngredients,
        ingredientLinksCreated: response.ingredientLinksCreated,
        productsWithoutIngredients: response.productsWithoutIngredients,
        productsWithWarnings: response.productsWithWarnings,
      })
      setSuccess(response.message)
    } catch (importError) {
      setError(importError instanceof Error ? importError.message : 'Import fehlgeschlagen.')
    } finally {
      setIsImporting(false)
    }
  }

  function getProductSelectionKey(categoryIndex: number, productIndex: number) {
    return `${categoryIndex}:${productIndex}`
  }

  function moveProduct(categoryIndex: number, productIndex: number, targetCategoryName: string) {
    const normalizedTarget = targetCategoryName.trim()
    if (!normalizedTarget) return
    setEditableResult((current) => {
      if (!current) return current
      const next = structuredClone(current)
      const sourceCategory = next.categories[categoryIndex]
      if (!sourceCategory) return current
      const [product] = sourceCategory.products.splice(productIndex, 1)
      if (!product) return current
      let targetCategory = next.categories.find((entry) => entry.name === normalizedTarget)
      if (!targetCategory) {
        targetCategory = {
          name: normalizedTarget,
          sortOrder: next.categories.length + 1,
          confidence: 1,
          products: [],
        }
        next.categories.push(targetCategory)
      }
      targetCategory.products.push(product)
      return next
    })
    setSelectedProducts({})
  }

  function moveSelectedProducts(targetCategoryName: string) {
    const normalizedTarget = targetCategoryName.trim()
    if (!normalizedTarget) return
    setEditableResult((current) => {
      if (!current) return current
      const next = structuredClone(current)
      let targetCategory = next.categories.find((entry) => entry.name === normalizedTarget)
      if (!targetCategory) {
        targetCategory = {
          name: normalizedTarget,
          sortOrder: next.categories.length + 1,
          confidence: 1,
          products: [],
        }
        next.categories.push(targetCategory)
      }
      for (let categoryIndex = 0; categoryIndex < next.categories.length; categoryIndex += 1) {
        const sourceCategory = next.categories[categoryIndex]
        const remainingProducts: typeof sourceCategory.products = []
        for (let productIndex = 0; productIndex < sourceCategory.products.length; productIndex += 1) {
          const selectionKey = getProductSelectionKey(categoryIndex, productIndex)
          const product = sourceCategory.products[productIndex]
          if (selectedProducts[selectionKey] && sourceCategory.name !== normalizedTarget) {
            targetCategory.products.push(product)
          } else {
            remainingProducts.push(product)
          }
        }
        sourceCategory.products = remainingProducts
      }
      return next
    })
    setSelectedProducts({})
    setBulkTargetCategory('')
  }

  function renameCategory(categoryIndex: number, nextName: string) {
    const normalizedName = nextName.trim()
    if (!normalizedName) return
    setEditableResult((current) => {
      if (!current) return current
      const next = structuredClone(current)
      const category = next.categories[categoryIndex]
      if (!category) return current
      category.name = normalizedName
      return next
    })
  }

  function deleteCategoryIfEmpty(categoryIndex: number) {
    setEditableResult((current) => {
      if (!current) return current
      const next = structuredClone(current)
      const category = next.categories[categoryIndex]
      if (!category) return current
      if (category.products.length > 0) return current
      next.categories.splice(categoryIndex, 1)
      return next
    })
  }

  const hasUnsortedProducts = useMemo(() => {
    if (!editableResult) return false
    return editableResult.categories.some(
      (category) =>
        category.name.trim().toLocaleLowerCase('de-DE') === 'unsortiert' && category.products.length > 0
    )
  }, [editableResult])

  const allCategoryNames = useMemo(
    () => (editableResult?.categories || []).map((category) => category.name),
    [editableResult]
  )

  const duplicateMenuNumbers = useMemo(() => {
    if (!editableResult) return [] as string[]
    const counts = new Map<string, number>()
    for (const category of editableResult.categories) {
      for (const product of category.products) {
        const number = (product.productNumber || '').trim()
        if (!number) continue
        counts.set(number, (counts.get(number) || 0) + 1)
      }
    }
    return Array.from(counts.entries())
      .filter(([, count]) => count > 1)
      .map(([number]) => number)
  }, [editableResult])

  const filteredCategories = (editableResult?.categories || [])
    .map((category, sourceIndex) => ({
      ...category,
      sourceIndex,
      products: category.products
        .map((product, sourceProductIndex) => ({
          ...product,
          sourceProductIndex,
        }))
        .filter((product) => {
          const term = productSearch.trim().toLocaleLowerCase('de-DE')
          if (!term) return true
          return (
            product.name.toLocaleLowerCase('de-DE').includes(term) ||
            (product.description || '').toLocaleLowerCase('de-DE').includes(term)
          )
        }),
    }))
    .filter((category) => {
      const categoryTerm = categoryFilter.trim().toLocaleLowerCase('de-DE')
      if (!categoryTerm) return true
      return category.name.toLocaleLowerCase('de-DE').includes(categoryTerm)
    })

  if (sessionLoading || !session) return null

  function getProductReviewFlags(product: MenuImportAnalysisResult['categories'][number]['products'][number]) {
    const flags: Array<{ level: 'red' | 'yellow'; text: string }> = []
    if ((product.confidence || 0) < 0.85) flags.push({ level: 'red', text: 'Bitte prüfen: Erkennung unsicher' })
    if (product.price === null) flags.push({ level: 'red', text: 'Bitte prüfen: Preis fehlt' })
    if (typeof product.price === 'number' && (product.price < 1 || product.price > 80)) {
      flags.push({ level: 'yellow', text: 'Bitte prüfen: Preis wirkt ungewöhnlich' })
    }
    if (product.ingredients.length > 0) {
      flags.push({ level: 'yellow', text: 'Bitte prüfen: Zutaten wurden automatisch abgeleitet' })
    }
    if (product.allergens.length === 0) {
      flags.push({ level: 'yellow', text: 'Bitte prüfen: Allergene unklar' })
    }
    if (product.variants.length === 0) {
      flags.push({ level: 'yellow', text: 'Bitte prüfen: Varianten unklar/fehlen' })
    }
    if (product.productNumber) {
      flags.push({ level: 'yellow', text: 'Artikelnummer wird beim Import nicht übernommen' })
    }
    if ((product.notes || '').toLocaleLowerCase('de-DE').includes('fallback')) {
      flags.push({ level: 'red', text: 'Bitte prüfen: automatisch per Fallback erkannt' })
    }
    return flags
  }

  function getCategoryWarnings(categoryName: string) {
    if (!editableResult) return []
    const prefix = `${categoryName}:`
    return editableResult.warnings.filter((warning) => warning.startsWith(prefix))
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Menü-Import"
      subtitle="Interner Premium-Onboarding-Service: Speisekarte analysieren und Import-Vorschau erzeugen"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      {sessionError || error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {sessionError || error}
        </div>
      ) : null}
      {success ? (
        <div className="mb-4 rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
          {success}
        </div>
      ) : null}

      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="mb-4 grid grid-cols-2 gap-2 rounded-2xl border border-slate-200 bg-slate-50 p-3 text-xs text-slate-700 md:grid-cols-5">
          <p><span className="font-semibold">Kategorien:</span> {resultCounters.categories}</p>
          <p><span className="font-semibold">Produkte:</span> {resultCounters.products}</p>
          <p><span className="font-semibold">Varianten:</span> {resultCounters.variants}</p>
          <p><span className="font-semibold">Zutaten:</span> {resultCounters.ingredients}</p>
          <p><span className="font-semibold">Warnungen:</span> {resultCounters.warnings}</p>
        </div>
        <div className="mb-4 grid gap-2 rounded-2xl border border-slate-200 bg-slate-50 p-3 text-xs text-slate-700 md:grid-cols-3">
          <p>
            <span className="font-semibold">Aktives KI-Modell:</span>{' '}
            {status?.modelLabel || 'Standardmodell aktiv'}
          </p>
          <p>
            <span className="font-semibold">API verbunden:</span>{' '}
            {status?.apiConnected ? '✅' : '❌'}
          </p>
          <p>
            <span className="font-semibold">API-Key vorhanden:</span>{' '}
            {status?.apiKeyPresent ? '✅' : '❌'}
          </p>
        </div>
        <div className="grid gap-3 md:grid-cols-2">
          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Filiale</span>
            <select
              value={tenantId}
              onChange={(event) => setTenantId(event.target.value)}
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none"
            >
              <option value="">Filiale wählen</option>
              {(context?.tenants || []).map((tenant) => (
                <option key={tenant.id} value={tenant.id}>
                  {tenant.name}
                </option>
              ))}
            </select>
          </label>

          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Speisekartenbilder (1–10)</span>
            <input
              type="file"
              accept=".jpg,.jpeg,.png,.webp,image/jpeg,image/png,image/webp"
              multiple
              onChange={(event) => handleFiles(event.target.files)}
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
            />
          </label>
        </div>

        <div className="mt-3 text-xs text-rose-900/70">
          Ausgewählte Filiale: {selectedTenant?.name || '—'} · Dateien: {files.length}
        </div>

        <div className="mt-4 flex flex-wrap gap-2">
          <button
            type="button"
            onClick={() => void runAnalysis()}
            disabled={isAnalyzing || !tenantId || files.length === 0}
            className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
          >
            {isAnalyzing ? 'Analysiert…' : 'Speisekarte analysieren'}
          </button>
          <button
            type="button"
            onClick={() => void copyJson()}
            disabled={!result}
            className="rounded-xl border border-slate-200 px-4 py-2.5 text-sm font-medium text-slate-700 transition hover:bg-slate-50 disabled:cursor-not-allowed disabled:opacity-50"
          >
            JSON kopieren
          </button>
          <button
            type="button"
            onClick={() => void runImport()}
            disabled={!editableResult || isImporting}
            className="rounded-xl border border-slate-200 px-4 py-2.5 text-sm font-medium text-slate-700 transition hover:bg-slate-50 disabled:cursor-not-allowed disabled:opacity-50"
            title="Importiert Produkte in die gewählte Filiale."
          >
            {isImporting ? 'Import läuft…' : 'Import starten'}
          </button>
        </div>
        <label className="mt-3 inline-flex items-center gap-2 text-xs text-slate-700">
          <input
            type="checkbox"
            checked={useMenuNumbersAsSku}
            onChange={(event) => setUseMenuNumbersAsSku(event.target.checked)}
            className="h-4 w-4"
          />
          <span>Speisekarten-Nummern als Artikelnummer übernehmen</span>
        </label>
        <p className="mt-3 text-xs text-slate-500">
          Produkte werden mit Status „nicht aktiv“ importiert und können danach im Produktbereich freigegeben werden.
        </p>
      </section>

      {result && editableResult ? (
        <section className="mt-4 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <h2 className="text-lg font-semibold text-rose-950">Ergebnis-Vorschau</h2>
          <p className="mt-1 text-sm text-rose-900/75">
            Restaurant: {result.restaurantName || 'Nicht sicher erkannt'} · Sprache: {result.sourceLanguage}
          </p>

          {hasJsonFallbackWarning ? (
            <div className="mt-4 rounded-2xl border border-amber-300 bg-amber-50 p-3 text-sm text-amber-900">
              <p className="font-semibold">Hinweis zur KI-Antwort</p>
              <p>
                Die KI hat keine vollständig gültige JSON-Struktur geliefert. Bitte Analyse erneut starten oder ein
                anderes Bild verwenden.
              </p>
            </div>
          ) : null}

          {result.warnings.length > 0 ? (
            <div className="mt-4 rounded-2xl border border-amber-200 bg-amber-50 p-3">
              <h3 className="text-sm font-semibold text-amber-900">Warnungen</h3>
              <ul className="mt-2 list-disc space-y-1 pl-4 text-sm">
                {result.warnings.map((warning, index) => (
                  <li
                    key={`${warning}-${index}`}
                    className={
                      warning.toLocaleLowerCase('de-DE').includes('automatisch repariert')
                        ? 'text-emerald-700'
                        : 'text-amber-900/90'
                    }
                  >
                    {warning}
                  </li>
                ))}
              </ul>
            </div>
          ) : null}

          {editableResult.debugRawResponsePreview ? (
            <div className="mt-4 rounded-2xl border border-slate-300 bg-slate-50 p-3">
              <div className="mb-2 flex items-center justify-between gap-2">
                <h3 className="text-sm font-semibold text-slate-900">KI-Rohantwort Debug</h3>
                <button
                  type="button"
                  onClick={() => void copyDebugRawResponse()}
                  className="rounded-lg border border-slate-300 px-2 py-1 text-xs font-medium text-slate-700 hover:bg-slate-100"
                >
                  Debug kopieren
                </button>
              </div>
              <textarea
                readOnly
                value={editableResult.debugRawResponsePreview}
                className="h-44 w-full resize-y rounded-xl border border-slate-300 bg-white px-3 py-2 text-xs text-slate-800"
              />
            </div>
          ) : null}

          {importSummary ? (
            <div className="mt-4 rounded-2xl border border-emerald-200 bg-emerald-50 p-3 text-sm text-emerald-900">
              <p className="font-semibold">Import-Zusammenfassung</p>
              <p>
                {importSummary.importedCategories} Kategorien · {importSummary.importedProducts} Produkte ·{' '}
                {importSummary.importedVariants} Varianten
              </p>
              <p>
                {importSummary.createdIngredients} Zutaten erstellt · {importSummary.reusedIngredients} Zutaten wiederverwendet
              </p>
              <p>
                {importSummary.ingredientLinksCreated} Produkt-Zutaten-Zuordnungen erstellt ·{' '}
                {importSummary.productsWithoutIngredients} Produkte ohne Zutaten
              </p>
              <p>{importSummary.productsWithWarnings} Produkte mit Warnhinweisen</p>
            </div>
          ) : null}

          <div className="mt-4 grid gap-2 md:grid-cols-4">
            <input
              value={categoryFilter}
              onChange={(event) => setCategoryFilter(event.target.value)}
              placeholder="Kategorie filtern"
              className="rounded-xl border border-slate-200 px-3 py-2 text-sm"
            />
            <input
              value={productSearch}
              onChange={(event) => setProductSearch(event.target.value)}
              placeholder="Produkt suchen"
              className="rounded-xl border border-slate-200 px-3 py-2 text-sm"
            />
            <button
              type="button"
              onClick={() => {
                const next: Record<string, boolean> = {}
                for (const category of filteredCategories) next[category.name] = true
                setExpandedCategories(next)
              }}
              className="rounded-xl border border-slate-200 px-3 py-2 text-sm font-medium text-slate-700"
            >
              Alle aufklappen
            </button>
            <button
              type="button"
              onClick={() => setExpandedCategories({})}
              className="rounded-xl border border-slate-200 px-3 py-2 text-sm font-medium text-slate-700"
            >
              Alle zuklappen
            </button>
          </div>

          <div className="mt-3 rounded-2xl border border-slate-200 bg-slate-50 p-3">
            <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">Bulk-Aktion</p>
            <div className="mt-2 flex flex-wrap items-center gap-2">
              <select
                value={bulkTargetCategory}
                onChange={(event) => setBulkTargetCategory(event.target.value)}
                className="min-w-[220px] rounded-lg border border-slate-200 px-3 py-2 text-sm"
              >
                <option value="">Ausgewählte verschieben nach …</option>
                {allCategoryNames.map((name) => (
                  <option key={`bulk-${name}`} value={name}>
                    {name}
                  </option>
                ))}
              </select>
              <button
                type="button"
                disabled={!bulkTargetCategory || Object.values(selectedProducts).every((value) => !value)}
                onClick={() => moveSelectedProducts(bulkTargetCategory)}
                className="rounded-lg border border-slate-200 px-3 py-2 text-sm font-medium text-slate-700 disabled:cursor-not-allowed disabled:opacity-50"
              >
                Verschieben
              </button>
            </div>
          </div>

          {hasUnsortedProducts ? (
            <div className="mt-4 rounded-2xl border border-amber-300 bg-amber-50 p-3 text-sm text-amber-900">
              <p className="font-semibold">Unsortierte Produkte</p>
              <p>Diese Produkte bitte vor dem Import einer Kategorie zuordnen.</p>
            </div>
          ) : null}

          {duplicateMenuNumbers.length > 0 ? (
            <div className="mt-4 rounded-2xl border border-red-300 bg-red-50 p-3 text-sm text-red-800">
              <p className="font-semibold">Doppelte Produktnummern erkannt</p>
              <p>
                Doppelte Nummern: {duplicateMenuNumbers.join(', ')}. Beim Import werden diese
                Artikelnummern automatisch geleert.
              </p>
            </div>
          ) : null}

          <div className="mt-4 space-y-4">
            {filteredCategories.map((category) => (
              <div key={`${category.name}-${category.sortOrder}`} className="rounded-2xl border border-slate-200 p-3">
                <div className="flex flex-wrap items-center justify-between gap-2">
                  <div className="flex flex-wrap items-center gap-2">
                    <input
                      value={category.name}
                      onChange={(event) => renameCategory(category.sourceIndex, event.target.value)}
                      className="rounded-lg border border-slate-200 px-2 py-1 text-sm font-semibold text-slate-900"
                    />
                    <span className="text-xs text-slate-500">({category.products.length} Produkte)</span>
                    {category.name.trim().toLocaleLowerCase('de-DE') === 'unsortiert' ? (
                      <span className="rounded-full bg-amber-100 px-2 py-1 text-[11px] font-semibold text-amber-800">
                        Bitte zuordnen
                      </span>
                    ) : null}
                  </div>
                  <div className="flex items-center gap-2">
                    <span className="text-xs text-slate-500">
                      Confidence: {(category.confidence * 100).toFixed(0)}%
                    </span>
                    <button
                      type="button"
                      disabled={category.products.length > 0}
                      onClick={() => deleteCategoryIfEmpty(category.sourceIndex)}
                      className="rounded-lg border border-slate-200 px-2 py-1 text-xs font-medium text-slate-600 disabled:cursor-not-allowed disabled:opacity-40"
                    >
                      Kategorie löschen
                    </button>
                  </div>
                </div>
                {getCategoryWarnings(category.name).length > 0 ? (
                  <div className="mt-2 rounded-lg border border-amber-200 bg-amber-50 px-2 py-1 text-xs text-amber-900">
                    {getCategoryWarnings(category.name).join(' · ')}
                  </div>
                ) : null}
                <button
                  type="button"
                  onClick={() =>
                    setExpandedCategories((current) => ({
                      ...current,
                      [category.name]: !current[category.name],
                    }))
                  }
                  className="mt-2 text-xs font-medium text-slate-600 underline"
                >
                  {expandedCategories[category.name] ? 'Kategorie einklappen' : 'Kategorie ausklappen'}
                </button>
                {expandedCategories[category.name] ? (
                  <div className="mt-2 space-y-2">
                    {category.products.map((product, index) => (
                    <div key={`${product.name}-${index}`} className="rounded-xl bg-slate-50 p-2">
                      <div className="mb-2 flex flex-wrap items-center gap-2">
                        <input
                          type="checkbox"
                          checked={Boolean(
                            selectedProducts[getProductSelectionKey(category.sourceIndex, product.sourceProductIndex)]
                          )}
                          onChange={(event) => {
                            const key = getProductSelectionKey(category.sourceIndex, product.sourceProductIndex)
                            setSelectedProducts((current) => ({
                              ...current,
                              [key]: event.target.checked,
                            }))
                          }}
                          className="h-4 w-4"
                        />
                        <select
                          value={category.name}
                          onChange={(event) =>
                            moveProduct(category.sourceIndex, product.sourceProductIndex, event.target.value)
                          }
                          className="min-w-[220px] rounded-lg border border-slate-200 px-2 py-1.5 text-xs"
                        >
                          {allCategoryNames.map((name) => (
                            <option key={`${product.name}-${name}`} value={name}>
                              {name}
                            </option>
                          ))}
                        </select>
                        <button
                          type="button"
                          onClick={() => {
                            const nextName = window.prompt('Neue Kategorie', '')
                            if (!nextName) return
                            moveProduct(category.sourceIndex, product.sourceProductIndex, nextName)
                          }}
                          className="rounded-lg border border-slate-200 px-2 py-1 text-xs font-medium text-slate-700"
                        >
                          Neue Kategorie
                        </button>
                      </div>
                      {getProductReviewFlags(product).length > 0 ? (
                        <div className="mb-2 flex flex-wrap gap-1">
                          {getProductReviewFlags(product).map((flag, flagIndex) => (
                            <span
                              key={`${flag.text}-${flagIndex}`}
                              className={`rounded-full px-2 py-1 text-[11px] font-semibold ${
                                flag.level === 'red'
                                  ? 'bg-red-100 text-red-700'
                                  : 'bg-amber-100 text-amber-800'
                              }`}
                            >
                              {flag.text}
                            </span>
                          ))}
                        </div>
                      ) : null}
                      <div className="grid gap-2 md:grid-cols-4">
                        <label className="block md:col-span-2">
                          <span className="mb-1 block text-[11px] font-semibold uppercase tracking-wide text-slate-500">Produktname</span>
                          <input
                            value={product.name}
                            onChange={(event) =>
                              updateProductField(
                                category.sourceIndex,
                                product.sourceProductIndex,
                                'name',
                                event.target.value
                              )
                            }
                            className="w-full rounded-lg border border-slate-200 px-2 py-1.5 text-sm"
                          />
                        </label>
                        <label className="block">
                          <span className="mb-1 block text-[11px] font-semibold uppercase tracking-wide text-slate-500">Produktnummer</span>
                          <input
                            value={product.productNumber || ''}
                            onChange={(event) =>
                              updateProductField(
                                category.sourceIndex,
                                product.sourceProductIndex,
                                'productNumber',
                                event.target.value
                              )
                            }
                            placeholder="z. B. 101"
                            className="w-full rounded-lg border border-slate-200 px-2 py-1.5 text-sm"
                          />
                        </label>
                        <label className="block">
                          <span className="mb-1 block text-[11px] font-semibold uppercase tracking-wide text-slate-500">Preis (€)</span>
                          <input
                            value={product.price === null ? '' : String(product.price).replace('.', ',')}
                            onChange={(event) =>
                              updateProductField(
                                category.sourceIndex,
                                product.sourceProductIndex,
                                'price',
                                event.target.value
                              )
                            }
                            placeholder="0,00"
                            className="w-full rounded-lg border border-slate-200 px-2 py-1.5 text-sm"
                          />
                        </label>
                      </div>
                      <label className="mt-2 block">
                        <span className="mb-1 block text-[11px] font-semibold uppercase tracking-wide text-slate-500">Beschreibung</span>
                        <input
                          value={product.description || ''}
                          onChange={(event) =>
                            updateProductField(
                              category.sourceIndex,
                              product.sourceProductIndex,
                              'description',
                              event.target.value
                            )
                          }
                          className="w-full rounded-lg border border-slate-200 px-2 py-1.5 text-sm"
                        />
                      </label>
                      {product.variants.length > 0 ? (
                        <p className="mt-1 text-xs text-slate-600">
                          Varianten: {product.variants.map((variant) => `${variant.name} (${formatPrice(variant.price)})`).join(', ')}
                        </p>
                      ) : null}
                      {product.ingredients.length > 0 ? (
                        <div className="mt-1">
                          <p className="text-xs text-slate-600">Zutaten:</p>
                          <div className="mt-1 flex flex-wrap gap-1">
                            {product.ingredients.map((ingredient, ingredientIndex) => (
                              <span
                                key={`${ingredient}-${ingredientIndex}`}
                                className="inline-flex items-center gap-1 rounded-full bg-slate-200 px-2 py-1 text-xs text-slate-700"
                              >
                                {ingredient}
                                <button
                                  type="button"
                                  onClick={() =>
                                    removeProductIngredient(
                                      category.sourceIndex,
                                      product.sourceProductIndex,
                                      ingredientIndex
                                    )
                                  }
                                  className="font-semibold text-slate-600 hover:text-slate-900"
                                  title="Zutat entfernen"
                                >
                                  ×
                                </button>
                              </span>
                            ))}
                          </div>
                        </div>
                      ) : null}
                      <div className="mt-2 flex flex-wrap items-center gap-2">
                        <input
                          placeholder="Neue Zutat hinzufügen"
                          className="rounded-lg border border-slate-200 px-2 py-1.5 text-xs"
                          onKeyDown={(event) => {
                            if (event.key !== 'Enter') return
                            event.preventDefault()
                            const target = event.currentTarget
                            addProductIngredient(
                              category.sourceIndex,
                              product.sourceProductIndex,
                              target.value
                            )
                            target.value = ''
                          }}
                        />
                        <span className="text-[11px] text-slate-500">Enter zum Hinzufügen</span>
                      </div>
                      {product.allergens.length > 0 ? (
                        <p className="mt-1 text-xs text-slate-600">Allergene: {product.allergens.join(', ')}</p>
                      ) : null}
                      {product.additives.length > 0 ? (
                        <p className="mt-1 text-xs text-slate-600">Zusatzstoffe: {product.additives.join(', ')}</p>
                      ) : null}
                    </div>
                    ))}
                  </div>
                ) : null}
              </div>
            ))}
          </div>

          {editableResult.promotions.length > 0 ? (
            <div className="mt-5 rounded-2xl border border-slate-200 p-3">
              <h3 className="text-sm font-semibold text-slate-900">Promotions</h3>
              <div className="mt-2 space-y-2">
                {editableResult.promotions.map((promotion, index) => (
                  <div key={`${promotion.name}-${index}`} className="rounded-xl bg-slate-50 p-2 text-sm">
                    <p className="font-semibold">{promotion.name}</p>
                    <p className="text-slate-700">{promotion.description}</p>
                    <p className="text-xs text-slate-600">
                      Preis: {formatPrice(promotion.price)} · Wochentag: {promotion.weekday || '—'} · Confidence:{' '}
                      {(promotion.confidence * 100).toFixed(0)}%
                    </p>
                  </div>
                ))}
              </div>
            </div>
          ) : null}

          <details className="mt-5">
            <summary className="cursor-pointer text-sm font-semibold text-slate-800">Rohes JSON anzeigen</summary>
            <pre className="mt-2 max-h-[420px] overflow-auto rounded-xl bg-slate-950 p-3 text-xs text-slate-100">
              {JSON.stringify(editableResult, null, 2)}
            </pre>
          </details>
        </section>
      ) : null}
    </BackofficeLayout>
  )
}
