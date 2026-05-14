'use client'

import { useEffect, useMemo, useState } from 'react'
import {
  type BusinessTemplateImportOptions,
  getBusinessTemplateDetail,
  getBusinessTemplates,
  getManagedTenants,
  importBusinessTemplate,
  type BusinessTemplateDetail,
  type BusinessTemplateOverview,
  type BusinessTemplateType,
  type ManagedTenant,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type Props = {
  roleHint: 'superadmin' | 'chainadmin' | 'admin'
}

const TEMPLATE_ICONS: Record<BusinessTemplateType, string> = {
  DONER_KEBAP: '🥙',
  PIZZERIA: '🍕',
  BURGER_SMASHBURGER: '🍔',
  GRILL_IMBISS: '🍟',
  ASIAN: '🥢',
  CAFE_BAKERY: '☕',
  BEVERAGE_DELIVERY: '🥤',
  KIOSK_SPATI: '🏪',
  RESTAURANT_GENERAL: '🍽️',
  STEAKHOUSE_GRILLHOUSE: '🥩',
  SUSHI: '🍣',
  VEGAN_HEALTHY: '🥗',
  FOODTRUCK: '🚚',
  ICECREAM_DESSERT: '🍨',
  BAR_LOUNGE: '🍸',
}

const DEFAULT_IMPORT_OPTIONS: BusinessTemplateImportOptions = {
  importCategories: true,
  importProducts: true,
  importIngredients: true,
  importProductIngredients: true,
  importAllergens: true,
  importPriceSuggestions: true,
  overwriteExisting: false,
}

function toUserMessage(error: unknown, fallback: string) {
  return error instanceof Error ? error.message : fallback
}

function uniqueAllergens(detail: BusinessTemplateDetail | null) {
  if (!detail) {
    return [] as string[]
  }

  const set = new Set<string>()
  for (const ingredient of detail.ingredients) {
    for (const allergen of ingredient.allergens) {
      set.add(allergen)
    }
  }
  return Array.from(set).sort()
}

export default function BusinessTemplateManager({ roleHint }: Props) {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [templates, setTemplates] = useState<BusinessTemplateOverview[]>([])
  const [tenants, setTenants] = useState<ManagedTenant[]>([])
  const [selectedTemplateId, setSelectedTemplateId] = useState('')
  const [selectedTenantId, setSelectedTenantId] = useState('')
  const [selectedTypeFilter, setSelectedTypeFilter] = useState<'ALL' | BusinessTemplateType>('ALL')
  const [searchText, setSearchText] = useState('')
  const [detail, setDetail] = useState<BusinessTemplateDetail | null>(null)
  const [isLoadingList, setIsLoadingList] = useState(true)
  const [isLoadingDetail, setIsLoadingDetail] = useState(false)
  const [isImportDialogOpen, setIsImportDialogOpen] = useState(false)
  const [isImporting, setIsImporting] = useState(false)
  const [importOptions, setImportOptions] =
    useState<BusinessTemplateImportOptions>(DEFAULT_IMPORT_OPTIONS)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null
    if (!parsed) {
      window.location.href = '/'
      return
    }

    const role = (parsed.role || '').toLowerCase()
    const allowed = role === 'superadmin' || role === 'chainadmin' || role === 'admin'
    if (!allowed) {
      window.location.href = '/'
      return
    }

    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    if (!accessToken) {
      window.location.href = '/'
      return
    }

    setSession(parsed)
    setToken(accessToken)
  }, [])

  useEffect(() => {
    if (!token) {
      return
    }

    let cancelled = false
    ;(async () => {
      try {
        setIsLoadingList(true)
        setError('')
        const [templateRows, tenantRows] = await Promise.all([
          getBusinessTemplates(token),
          getManagedTenants(token),
        ])
        if (cancelled) return

        setTemplates(templateRows)
        setTenants(tenantRows)
        if (templateRows[0]?.id) {
          setSelectedTemplateId((current) => current || templateRows[0].id)
        }

        const sessionTenantId = session?.tenantId || null
        if (sessionTenantId && tenantRows.some((tenant) => tenant.id === sessionTenantId)) {
          setSelectedTenantId(sessionTenantId)
        } else if (tenantRows[0]?.id) {
          setSelectedTenantId((current) => current || tenantRows[0].id)
        }
      } catch (loadError) {
        if (cancelled) return
        setError(toUserMessage(loadError, 'Vorlagen konnten nicht geladen werden'))
      } finally {
        if (!cancelled) {
          setIsLoadingList(false)
        }
      }
    })()

    return () => {
      cancelled = true
    }
  }, [token, session?.tenantId])

  useEffect(() => {
    if (!token || !selectedTemplateId) {
      setDetail(null)
      return
    }

    let cancelled = false
    ;(async () => {
      try {
        setIsLoadingDetail(true)
        setError('')
        const row = await getBusinessTemplateDetail(token, selectedTemplateId)
        if (!cancelled) {
          setDetail(row)
        }
      } catch (loadError) {
        if (!cancelled) {
          setError(toUserMessage(loadError, 'Details konnten nicht geladen werden'))
          setDetail(null)
        }
      } finally {
        if (!cancelled) {
          setIsLoadingDetail(false)
        }
      }
    })()

    return () => {
      cancelled = true
    }
  }, [token, selectedTemplateId])

  const visibleTemplates = useMemo(() => {
    const normalizedSearch = searchText.trim().toLowerCase()
    return templates.filter((entry) => {
      if (selectedTypeFilter !== 'ALL' && entry.type !== selectedTypeFilter) {
        return false
      }
      if (!normalizedSearch) {
        return true
      }
      return (
        entry.name.toLowerCase().includes(normalizedSearch) ||
        entry.key.toLowerCase().includes(normalizedSearch) ||
        (entry.description || '').toLowerCase().includes(normalizedSearch)
      )
    })
  }, [templates, searchText, selectedTypeFilter])

  const selectedTemplateSummary = templates.find((entry) => entry.id === selectedTemplateId) || null
  const templateAllergens = uniqueAllergens(detail)
  const isTenantSelectorLocked = (session?.role || '').toLowerCase() === 'admin' && Boolean(session?.tenantId)
  const headingByRole = {
    superadmin: 'Business-Vorlagen',
    chainadmin: 'Business-Vorlagen',
    admin: 'Business-Vorlagen',
  }[roleHint]

  return (
    <div className="space-y-5">
      {error ? (
        <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}
      {success ? (
        <div className="rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
          {success}
        </div>
      ) : null}

      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="flex flex-wrap items-end justify-between gap-3">
          <div>
            <h2 className="text-xl font-semibold text-[var(--brand-ink)]">{headingByRole}</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Betriebsarten laden, prüfen und in eine Filiale importieren.
            </p>
          </div>
          <div className="flex w-full flex-wrap gap-2 md:w-auto">
            <input
              value={searchText}
              onChange={(event) => setSearchText(event.target.value)}
              placeholder="Suche nach Name..."
              className="input-ui min-w-0 flex-1 md:w-52 md:flex-none"
            />
            <select
              value={selectedTypeFilter}
              onChange={(event) =>
                setSelectedTypeFilter(event.target.value as 'ALL' | BusinessTemplateType)
              }
              className="input-ui min-w-0 flex-1 md:w-56 md:flex-none"
            >
              <option value="ALL">Alle Betriebsarten</option>
              {Array.from(new Set(templates.map((entry) => entry.type))).map((type) => (
                <option key={type} value={type}>
                  {type}
                </option>
              ))}
            </select>
          </div>
        </div>
      </section>

      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        {isLoadingList ? (
          <p className="text-sm text-rose-900/75">Lade Vorlagen...</p>
        ) : visibleTemplates.length === 0 ? (
          <p className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/70 px-4 py-4 text-sm text-rose-900/75">
            Keine Vorlagen gefunden.
          </p>
        ) : (
          <div className="grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
            {visibleTemplates.map((template) => {
              const isSelected = template.id === selectedTemplateId
              return (
                <button
                  key={template.id}
                  type="button"
                  onClick={() => setSelectedTemplateId(template.id)}
                  className={`rounded-2xl border px-4 py-4 text-left transition ${
                    isSelected
                      ? 'border-[var(--brand-orange)] bg-orange-50 ring-2 ring-orange-200/60'
                      : 'border-[var(--brand-border)] bg-white hover:bg-rose-50/60'
                  }`}
                >
                  <div className="flex items-center gap-2">
                    <span className="text-2xl">{TEMPLATE_ICONS[template.type] || '📦'}</span>
                    <p className="text-base font-semibold text-[var(--brand-ink)]">{template.name}</p>
                  </div>
                  <p className="mt-2 text-sm text-rose-900/75">{template.description || 'Keine Beschreibung'}</p>
                  <div className="mt-3 grid grid-cols-3 gap-2 text-xs text-rose-900/80">
                    <span>Kategorien: {template._count.categories}</span>
                    <span>Produkte: {template._count.products}</span>
                    <span>Zutaten: {template._count.ingredients}</span>
                  </div>
                </button>
              )
            })}
          </div>
        )}
      </section>

      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div>
            <h3 className="text-lg font-semibold text-[var(--brand-ink)]">
              {selectedTemplateSummary?.name || 'Vorlage wählen'}
            </h3>
            <p className="mt-1 text-sm text-rose-900/70">Detailansicht mit Kategorien, Produkten, Zutaten und Allergenen.</p>
          </div>
          <button
            type="button"
            onClick={() => {
              setImportOptions(DEFAULT_IMPORT_OPTIONS)
              setIsImportDialogOpen(true)
            }}
            disabled={!selectedTemplateId || isLoadingDetail}
            className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
          >
            Vorlage importieren
          </button>
        </div>

        {isLoadingDetail ? (
          <p className="mt-4 text-sm text-rose-900/75">Lade Details...</p>
        ) : !detail ? (
          <p className="mt-4 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/70 px-4 py-4 text-sm text-rose-900/75">
            Keine Detaildaten vorhanden.
          </p>
        ) : (
          <div className="mt-4 grid gap-4 lg:grid-cols-2">
            <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
              <h4 className="text-sm font-semibold text-[var(--brand-ink)]">Kategorien</h4>
              <ul className="mt-2 space-y-1 text-sm text-rose-900/85">
                {detail.categories.slice(0, 12).map((category) => (
                  <li key={category.id} className="break-words">
                    {category.sortOrder}. {category.name}
                  </li>
                ))}
              </ul>
            </article>

            <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
              <h4 className="text-sm font-semibold text-[var(--brand-ink)]">Beispielprodukte</h4>
              <ul className="mt-2 space-y-2 text-sm text-rose-900/85">
                {detail.products.slice(0, 8).map((product) => (
                  <li key={product.id} className="break-words">
                    <span className="font-semibold">{product.name}</span> ({product.price} EUR)
                    {(product.productNumber || product.ean) ? (
                      <span className="ml-1 text-xs text-rose-900/70">
                        [{product.productNumber ? `Art.-Nr.: ${product.productNumber}` : ''}
                        {product.productNumber && product.ean ? ' · ' : ''}
                        {product.ean ? `EAN: ${product.ean}` : ''}]
                      </span>
                    ) : null}
                  </li>
                ))}
              </ul>
            </article>

            <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
              <h4 className="text-sm font-semibold text-[var(--brand-ink)]">Zutaten</h4>
              <ul className="mt-2 space-y-1 text-sm text-rose-900/85">
                {detail.ingredients.slice(0, 16).map((ingredient) => (
                  <li key={ingredient.id} className="break-words">
                    {ingredient.name} ({ingredient.unit})
                  </li>
                ))}
              </ul>
            </article>

            <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
              <h4 className="text-sm font-semibold text-[var(--brand-ink)]">Allergene</h4>
              {templateAllergens.length === 0 ? (
                <p className="mt-2 text-sm text-rose-900/75">Keine Allergene in der Vorlage hinterlegt.</p>
              ) : (
                <div className="mt-2 flex flex-wrap gap-2">
                  {templateAllergens.map((allergen) => (
                    <span
                      key={allergen}
                      className="rounded-lg border border-[var(--brand-border)] bg-white px-2 py-1 text-xs font-semibold text-rose-900/85"
                    >
                      {allergen}
                    </span>
                  ))}
                </div>
              )}
            </article>
          </div>
        )}
      </section>

      {isImportDialogOpen ? (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-slate-950/55 p-3">
          <div className="max-h-[90vh] w-full max-w-xl overflow-y-auto rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-xl">
            <h4 className="text-lg font-semibold text-[var(--brand-ink)]">Vorlage importieren</h4>
            <p className="mt-1 text-sm text-rose-900/75">
              Wähle den Ziel-Tenant für die Vorlage "{selectedTemplateSummary?.name || '-'}".
            </p>

            <label className="mt-4 block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Tenant / Filiale</span>
              <select
                value={selectedTenantId}
                onChange={(event) => setSelectedTenantId(event.target.value)}
                disabled={isTenantSelectorLocked}
                className="input-ui w-full disabled:cursor-not-allowed disabled:opacity-70"
              >
                <option value="">Filiale wählen</option>
                {tenants.map((tenant) => (
                  <option key={tenant.id} value={tenant.id}>
                    {tenant.name}
                  </option>
                ))}
              </select>
            </label>

            <div className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
              <p className="text-sm font-semibold text-[var(--brand-ink)]">Import-Optionen</p>
              <p className="mt-1 text-xs text-rose-900/75">
                Bestehende Produkte werden standardmäßig nicht überschrieben.
              </p>
              <div className="mt-3 grid gap-2 sm:grid-cols-2">
                {(
                  [
                    ['importCategories', 'Kategorien importieren'],
                    ['importProducts', 'Produkte importieren'],
                    ['importIngredients', 'Zutaten importieren'],
                    ['importProductIngredients', 'Produkt-Zutaten-Verknüpfungen importieren'],
                    ['importAllergens', 'Allergene übernehmen'],
                    ['importPriceSuggestions', 'Preisvorschläge übernehmen'],
                    ['overwriteExisting', 'Bestehende Daten überschreiben'],
                  ] as Array<[keyof BusinessTemplateImportOptions, string]>
                ).map(([key, label]) => (
                  <label key={key} className="flex items-center gap-2 text-sm text-rose-900/90">
                    <input
                      type="checkbox"
                      checked={importOptions[key]}
                      onChange={(event) =>
                        setImportOptions((current) => ({
                          ...current,
                          [key]: event.target.checked,
                        }))
                      }
                    />
                    <span>{label}</span>
                  </label>
                ))}
              </div>
            </div>

            <div className="mt-5 flex justify-end gap-2">
              <button
                type="button"
                onClick={() => setIsImportDialogOpen(false)}
                disabled={isImporting}
                className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-4 py-2 text-sm font-semibold text-rose-900 transition hover:bg-rose-100 disabled:cursor-not-allowed disabled:opacity-60"
              >
                Abbrechen
              </button>
              <button
                type="button"
                onClick={async () => {
                  if (!token) {
                    return
                  }
                  if (!selectedTemplateId) {
                    setError('Bitte zuerst eine Vorlage auswählen.')
                    return
                  }
                  if (!selectedTenantId) {
                    setError('Bitte zuerst einen Tenant/eine Filiale auswählen.')
                    return
                  }
                  try {
                    setIsImporting(true)
                    setError('')
                    setSuccess('')
                    const result = await importBusinessTemplate(
                      token,
                      selectedTemplateId,
                      selectedTenantId,
                      importOptions
                    )
                    const importSummary = [
                      `${result.categoriesCreated} Kategorien`,
                      `${result.productsCreated} Produkte`,
                      `${result.ingredientsCreated} Zutaten`,
                    ].join(', ')
                    setSuccess(
                      `Import erfolgreich: ${importSummary}. ${result.productIngredientsCreated} Verknüpfungen, ${result.productsUpdated} aktualisiert, ${result.skippedExisting} übersprungen.`
                    )
                    setIsImportDialogOpen(false)
                  } catch (importError) {
                    setError(toUserMessage(importError, 'Import konnte nicht gestartet werden'))
                  } finally {
                    setIsImporting(false)
                  }
                }}
                disabled={isImporting}
                className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
              >
                {isImporting ? 'Import läuft...' : 'Import starten'}
              </button>
            </div>
          </div>
        </div>
      ) : null}
    </div>
  )
}
