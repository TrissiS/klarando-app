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

  const selectedTenant = useMemo(
    () => context?.tenants.find((entry) => entry.id === tenantId) || null,
    [context?.tenants, tenantId]
  )

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
      setSuccess('Speisekarte wurde analysiert. Bitte Ergebnis prüfen.')
    } catch (analysisError) {
      setResult(null)
      setError(analysisError instanceof Error ? analysisError.message : 'Analyse fehlgeschlagen.')
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

  async function runImport() {
    if (!token || !tenantId || !editableResult) return
    try {
      setIsImporting(true)
      setError('')
      setSuccess('')
      const response = await importSuperadminMenuImport(token, {
        tenantId,
        categories: editableResult.categories,
      })
      setSuccess(response.message)
    } catch (importError) {
      setError(importError instanceof Error ? importError.message : 'Import fehlgeschlagen.')
    } finally {
      setIsImporting(false)
    }
  }

  if (sessionLoading || !session) return null

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

          {result.warnings.length > 0 ? (
            <div className="mt-4 rounded-2xl border border-amber-200 bg-amber-50 p-3">
              <h3 className="text-sm font-semibold text-amber-900">Warnungen</h3>
              <ul className="mt-2 list-disc space-y-1 pl-4 text-sm text-amber-900/90">
                {result.warnings.map((warning, index) => (
                  <li key={`${warning}-${index}`}>{warning}</li>
                ))}
              </ul>
            </div>
          ) : null}

          <div className="mt-4 space-y-4">
            {editableResult.categories.map((category, categoryIndex) => (
              <div key={`${category.name}-${category.sortOrder}`} className="rounded-2xl border border-slate-200 p-3">
                <div className="flex flex-wrap items-center justify-between gap-2">
                  <h3 className="text-sm font-semibold text-slate-900">{category.name}</h3>
                  <span className="text-xs text-slate-500">
                    Confidence: {(category.confidence * 100).toFixed(0)}%
                  </span>
                </div>
                <div className="mt-2 space-y-2">
                  {category.products.map((product, index) => (
                    <div key={`${product.name}-${index}`} className="rounded-xl bg-slate-50 p-2">
                      <div className="grid gap-2 md:grid-cols-4">
                        <label className="block md:col-span-2">
                          <span className="mb-1 block text-[11px] font-semibold uppercase tracking-wide text-slate-500">Produktname</span>
                          <input
                            value={product.name}
                            onChange={(event) => updateProductField(categoryIndex, index, 'name', event.target.value)}
                            className="w-full rounded-lg border border-slate-200 px-2 py-1.5 text-sm"
                          />
                        </label>
                        <label className="block">
                          <span className="mb-1 block text-[11px] font-semibold uppercase tracking-wide text-slate-500">Produktnummer</span>
                          <input
                            value={product.productNumber || ''}
                            onChange={(event) => updateProductField(categoryIndex, index, 'productNumber', event.target.value)}
                            placeholder="z. B. 101"
                            className="w-full rounded-lg border border-slate-200 px-2 py-1.5 text-sm"
                          />
                        </label>
                        <label className="block">
                          <span className="mb-1 block text-[11px] font-semibold uppercase tracking-wide text-slate-500">Preis (€)</span>
                          <input
                            value={product.price === null ? '' : String(product.price).replace('.', ',')}
                            onChange={(event) => updateProductField(categoryIndex, index, 'price', event.target.value)}
                            placeholder="0,00"
                            className="w-full rounded-lg border border-slate-200 px-2 py-1.5 text-sm"
                          />
                        </label>
                      </div>
                      <label className="mt-2 block">
                        <span className="mb-1 block text-[11px] font-semibold uppercase tracking-wide text-slate-500">Beschreibung</span>
                        <input
                          value={product.description || ''}
                          onChange={(event) => updateProductField(categoryIndex, index, 'description', event.target.value)}
                          className="w-full rounded-lg border border-slate-200 px-2 py-1.5 text-sm"
                        />
                      </label>
                      {product.variants.length > 0 ? (
                        <p className="mt-1 text-xs text-slate-600">
                          Varianten: {product.variants.map((variant) => `${variant.name} (${formatPrice(variant.price)})`).join(', ')}
                        </p>
                      ) : null}
                      {product.ingredients.length > 0 ? (
                        <p className="mt-1 text-xs text-slate-600">Zutaten: {product.ingredients.join(', ')}</p>
                      ) : null}
                      {product.allergens.length > 0 ? (
                        <p className="mt-1 text-xs text-slate-600">Allergene: {product.allergens.join(', ')}</p>
                      ) : null}
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>

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
