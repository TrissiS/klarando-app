'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createBusinessTemplateCategory,
  createBusinessTemplateIngredient,
  createBusinessTemplateProduct,
  createBusinessTemplateProductIngredient,
  getBusinessTemplateFull,
  getBusinessTemplates,
  type BusinessTemplateFull,
  type BusinessTemplateOverview,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

export default function TemplateEditorPage() {
  const [token, setToken] = useState('')
  const [templates, setTemplates] = useState<BusinessTemplateOverview[]>([])
  const [selectedTemplateId, setSelectedTemplateId] = useState('')
  const [selectedTemplate, setSelectedTemplate] = useState<BusinessTemplateFull | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [categoryName, setCategoryName] = useState('')
  const [categorySortOrder, setCategorySortOrder] = useState('0')
  const [ingredientName, setIngredientName] = useState('')
  const [ingredientUnit, setIngredientUnit] = useState('Stück')
  const [ingredientCategory, setIngredientCategory] = useState<'FOOD' | 'PACKAGING'>('FOOD')
  const [ingredientAllergens, setIngredientAllergens] = useState('')
  const [productNumber, setProductNumber] = useState('')
  const [productName, setProductName] = useState('')
  const [productCategoryId, setProductCategoryId] = useState('')
  const [productPrice, setProductPrice] = useState('0')
  const [linkProductId, setLinkProductId] = useState('')
  const [linkIngredientId, setLinkIngredientId] = useState('')
  const [linkQuantity, setLinkQuantity] = useState('1')

  async function loadTemplates(currentToken: string) {
    const rows = await getBusinessTemplates(currentToken)
    setTemplates(rows)
    if (!selectedTemplateId && rows[0]?.id) {
      setSelectedTemplateId(rows[0].id)
    }
    return rows
  }

  async function loadTemplateDetail(currentToken: string, templateId: string) {
    if (!templateId) {
      setSelectedTemplate(null)
      return
    }
    const full = await getBusinessTemplateFull(currentToken, templateId)
    setSelectedTemplate(full)
  }

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }
    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    if (!accessToken) {
      window.location.href = '/'
      return
    }
    setToken(accessToken)
  }, [])

  useEffect(() => {
    if (!token) return
    let cancelled = false
    ;(async () => {
      try {
        setLoading(true)
        setError('')
        const rows = await loadTemplates(token)
        if (cancelled) return
        const targetId = selectedTemplateId || rows[0]?.id || ''
        if (targetId) {
          await loadTemplateDetail(token, targetId)
        }
      } catch (loadError) {
        if (!cancelled) {
          setError(loadError instanceof Error ? loadError.message : 'Templates konnten nicht geladen werden')
        }
      } finally {
        if (!cancelled) setLoading(false)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [token])

  useEffect(() => {
    if (!token || !selectedTemplateId) return
    void loadTemplateDetail(token, selectedTemplateId).catch((err) => {
      setError(err instanceof Error ? err.message : 'Template konnte nicht geladen werden')
    })
  }, [token, selectedTemplateId])

  const selectedTemplateCard = useMemo(
    () => templates.find((entry) => entry.id === selectedTemplateId) || null,
    [templates, selectedTemplateId]
  )

  async function refreshAfterChange(message: string) {
    if (!token || !selectedTemplateId) return
    setSuccess(message)
    await loadTemplateDetail(token, selectedTemplateId)
    await loadTemplates(token)
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Template-Editor"
      subtitle="Business-Templates zentral pflegen"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
      {success ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{success}</div> : null}

      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Templates</h2>
        {loading ? (
          <p className="mt-3 text-sm text-rose-900/70">Lade Templates...</p>
        ) : (
          <div className="mt-3 grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
            {templates.map((template) => (
              <button
                key={template.id}
                type="button"
                onClick={() => setSelectedTemplateId(template.id)}
                className={`rounded-2xl border p-4 text-left transition ${
                  selectedTemplateId === template.id
                    ? 'border-[var(--brand-ink)] bg-rose-50/70'
                    : 'border-[var(--brand-border)] bg-white hover:bg-rose-50/50'
                }`}
              >
                <p className="text-sm font-semibold text-[var(--brand-ink)]">{template.name}</p>
                <p className="mt-1 text-xs text-rose-900/70">{template.type}</p>
                <p className="mt-2 text-xs text-rose-900/75">
                  Kategorien: {template._count.categories} | Produkte: {template._count.products} | Zutaten: {template._count.ingredients}
                </p>
                <p className="mt-1 text-xs text-rose-900/60">Geändert: {new Date(template.updatedAt).toLocaleString('de-DE')}</p>
              </button>
            ))}
          </div>
        )}
      </section>

      {selectedTemplate ? (
        <section className="grid gap-4 lg:grid-cols-2">
          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h3 className="text-lg font-semibold text-[var(--brand-ink)]">Template-Details</h3>
            <p className="mt-1 text-sm text-rose-900/70">{selectedTemplate.name} ({selectedTemplate.type})</p>
            <div className="mt-4 grid gap-3 sm:grid-cols-2">
              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <p className="text-xs uppercase tracking-wide text-rose-900/70">Kategorien</p>
                <ul className="mt-2 space-y-1 text-sm text-rose-900/85">
                  {selectedTemplate.categories.slice(0, 12).map((entry) => (
                    <li key={entry.id}>{entry.sortOrder}. {entry.name}</li>
                  ))}
                </ul>
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <p className="text-xs uppercase tracking-wide text-rose-900/70">Produkte</p>
                <ul className="mt-2 space-y-1 text-sm text-rose-900/85">
                  {selectedTemplate.products.slice(0, 12).map((entry) => (
                    <li key={entry.id}>{entry.productNumber} · {entry.name}</li>
                  ))}
                </ul>
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3 sm:col-span-2">
                <p className="text-xs uppercase tracking-wide text-rose-900/70">Zutaten / Allergene</p>
                <ul className="mt-2 grid gap-1 text-sm text-rose-900/85 sm:grid-cols-2">
                  {selectedTemplate.ingredients.slice(0, 16).map((entry) => (
                    <li key={entry.id}>
                      {entry.name} ({entry.unit}) {entry.allergens.length > 0 ? `· ${entry.allergens.join(', ')}` : ''}
                    </li>
                  ))}
                </ul>
              </div>
            </div>
          </article>

          <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h3 className="text-lg font-semibold text-[var(--brand-ink)]">MVP-Bearbeitung</h3>
            <div className="mt-4 space-y-4">
              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <p className="text-sm font-semibold">Kategorie hinzufügen</p>
                <div className="mt-2 grid gap-2 sm:grid-cols-2">
                  <input className="input-ui" value={categoryName} onChange={(e) => setCategoryName(e.target.value)} placeholder="Name" />
                  <input className="input-ui" value={categorySortOrder} onChange={(e) => setCategorySortOrder(e.target.value)} placeholder="Sortierung" type="number" />
                </div>
                <button
                  type="button"
                  className="mt-2 rounded-xl bg-slate-900 px-3 py-2 text-sm font-semibold text-white"
                  onClick={async () => {
                    if (!token || !selectedTemplateId) return
                    await createBusinessTemplateCategory(token, selectedTemplateId, {
                      name: categoryName,
                      sortOrder: Number(categorySortOrder || 0),
                    })
                    setCategoryName('')
                    setCategorySortOrder('0')
                    await refreshAfterChange('Kategorie gespeichert.')
                  }}
                >
                  Speichern
                </button>
              </div>

              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <p className="text-sm font-semibold">Zutat hinzufügen</p>
                <div className="mt-2 grid gap-2 sm:grid-cols-2">
                  <input className="input-ui" value={ingredientName} onChange={(e) => setIngredientName(e.target.value)} placeholder="Name" />
                  <input className="input-ui" value={ingredientUnit} onChange={(e) => setIngredientUnit(e.target.value)} placeholder="Einheit" />
                  <select className="input-ui" value={ingredientCategory} onChange={(e) => setIngredientCategory(e.target.value as 'FOOD' | 'PACKAGING')}>
                    <option value="FOOD">FOOD</option>
                    <option value="PACKAGING">PACKAGING</option>
                  </select>
                  <input className="input-ui" value={ingredientAllergens} onChange={(e) => setIngredientAllergens(e.target.value)} placeholder="Allergene (A,G,J)" />
                </div>
                <button
                  type="button"
                  className="mt-2 rounded-xl bg-slate-900 px-3 py-2 text-sm font-semibold text-white"
                  onClick={async () => {
                    if (!token || !selectedTemplateId) return
                    await createBusinessTemplateIngredient(token, selectedTemplateId, {
                      name: ingredientName,
                      unit: ingredientUnit,
                      category: ingredientCategory,
                      allergens: ingredientAllergens
                        .split(',')
                        .map((entry) => entry.trim())
                        .filter(Boolean),
                    })
                    setIngredientName('')
                    setIngredientAllergens('')
                    await refreshAfterChange('Zutat gespeichert.')
                  }}
                >
                  Speichern
                </button>
              </div>

              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <p className="text-sm font-semibold">Produkt hinzufügen</p>
                <div className="mt-2 grid gap-2 sm:grid-cols-2">
                  <input className="input-ui" value={productNumber} onChange={(e) => setProductNumber(e.target.value)} placeholder="Produktnummer" />
                  <input className="input-ui" value={productName} onChange={(e) => setProductName(e.target.value)} placeholder="Produktname" />
                  <select className="input-ui" value={productCategoryId} onChange={(e) => setProductCategoryId(e.target.value)}>
                    <option value="">Kategorie wählen</option>
                    {selectedTemplate.categories.map((entry) => (
                      <option key={entry.id} value={entry.id}>{entry.name}</option>
                    ))}
                  </select>
                  <input className="input-ui" value={productPrice} onChange={(e) => setProductPrice(e.target.value)} placeholder="Preis" type="number" step="0.01" />
                </div>
                <button
                  type="button"
                  className="mt-2 rounded-xl bg-slate-900 px-3 py-2 text-sm font-semibold text-white"
                  onClick={async () => {
                    if (!token || !selectedTemplateId) return
                    await createBusinessTemplateProduct(token, selectedTemplateId, {
                      productNumber,
                      name: productName,
                      categoryId: productCategoryId || null,
                      price: Number(productPrice || 0),
                    })
                    setProductNumber('')
                    setProductName('')
                    setProductPrice('0')
                    setProductCategoryId('')
                    await refreshAfterChange('Produkt gespeichert.')
                  }}
                >
                  Speichern
                </button>
              </div>

              <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <p className="text-sm font-semibold">Produkt-Zutat zuweisen</p>
                <div className="mt-2 grid gap-2 sm:grid-cols-3">
                  <select className="input-ui" value={linkProductId} onChange={(e) => setLinkProductId(e.target.value)}>
                    <option value="">Produkt wählen</option>
                    {selectedTemplate.products.map((entry) => (
                      <option key={entry.id} value={entry.id}>{entry.name}</option>
                    ))}
                  </select>
                  <select className="input-ui" value={linkIngredientId} onChange={(e) => setLinkIngredientId(e.target.value)}>
                    <option value="">Zutat wählen</option>
                    {selectedTemplate.ingredients.map((entry) => (
                      <option key={entry.id} value={entry.id}>{entry.name}</option>
                    ))}
                  </select>
                  <input className="input-ui" value={linkQuantity} onChange={(e) => setLinkQuantity(e.target.value)} placeholder="Menge" type="number" step="0.001" />
                </div>
                <button
                  type="button"
                  className="mt-2 rounded-xl bg-slate-900 px-3 py-2 text-sm font-semibold text-white"
                  onClick={async () => {
                    if (!token || !selectedTemplateId || !linkProductId || !linkIngredientId) return
                    await createBusinessTemplateProductIngredient(token, selectedTemplateId, {
                      templateProductId: linkProductId,
                      templateIngredientId: linkIngredientId,
                      quantity: Number(linkQuantity || 1),
                    })
                    setLinkProductId('')
                    setLinkIngredientId('')
                    setLinkQuantity('1')
                    await refreshAfterChange('Verknüpfung gespeichert.')
                  }}
                >
                  Speichern
                </button>
              </div>
            </div>
          </article>
        </section>
      ) : null}

      {selectedTemplateCard ? (
        <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)] text-sm text-rose-900/75">
          Bearbeite aktuell: <span className="font-semibold text-[var(--brand-ink)]">{selectedTemplateCard.name}</span>
        </section>
      ) : null}
    </BackofficeLayout>
  )
}

