'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  deleteDisplayDevice,
  getDisplayDeviceOverview,
  getScreenProducts,
  updateDisplayDeviceActiveState,
  type DisplayDeviceOverviewRow,
  type ScreenProduct,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type StudioTab = 'OVERVIEW' | 'CONTENT' | 'DESIGN' | 'DEVICES' | 'PREVIEW'
type FontSizeMode = 'KLEIN' | 'MITTEL' | 'GROSS'
type CardDensity = 'KOMPAKT' | 'KOMFORT' | 'GROSS'

const STUDIO_TABS: Array<{ key: StudioTab; label: string }> = [
  { key: 'OVERVIEW', label: 'Übersicht' },
  { key: 'CONTENT', label: 'Inhalte' },
  { key: 'DESIGN', label: 'Design' },
  { key: 'DEVICES', label: 'Geräte' },
  { key: 'PREVIEW', label: 'Vorschau' },
]

const DESIGN_TEMPLATES = [
  'Klarando Modern',
  'Fastfood Board',
  'Premium Glas',
  'Klassische Preistafel',
  'Minimal Dunkel',
  'Tagesangebot',
  'Café/Bäckerei',
  'Döner/Imbiss',
  'Pizza',
  'Burger',
]

export default function AdminScreenStudioPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [activeTab, setActiveTab] = useState<StudioTab>('OVERVIEW')
  const [rows, setRows] = useState<DisplayDeviceOverviewRow[]>([])
  const [products, setProducts] = useState<ScreenProduct[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [deviceBusyId, setDeviceBusyId] = useState<string | null>(null)
  const [search, setSearch] = useState('')
  const [categoryFilter, setCategoryFilter] = useState('ALL')

  const [selectedTemplate, setSelectedTemplate] = useState('Klarando Modern')
  const [primaryColor, setPrimaryColor] = useState('#f97316')
  const [accentColor, setAccentColor] = useState('#ec4899')
  const [backgroundMode, setBackgroundMode] = useState<'HELL' | 'DUNKEL' | 'VERLAUF' | 'BILD'>('VERLAUF')
  const [fontSizeMode, setFontSizeMode] = useState<FontSizeMode>('MITTEL')
  const [cardDensity, setCardDensity] = useState<CardDensity>('KOMFORT')
  const [showLogo, setShowLogo] = useState(true)
  const [highlightPrice, setHighlightPrice] = useState(true)
  const [expertMode, setExpertMode] = useState(false)

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null
    if (!parsed || parsed.role !== 'admin') {
      window.location.href = '/'
      return
    }
    setSession(parsed)
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  async function loadStudioData(currentToken: string, tenantId: string) {
    const [overview, screenProducts] = await Promise.all([
      getDisplayDeviceOverview(currentToken, { tenantId }),
      getScreenProducts(),
    ])
    setRows(overview.rows)
    setProducts(screenProducts)
  }

  useEffect(() => {
    if (!token || !session?.tenantId) return
    void (async () => {
      try {
        setLoading(true)
        setError('')
        const tenantId = session.tenantId
        if (!tenantId) return
        await loadStudioData(token, tenantId)
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Screen Studio konnte nicht geladen werden.')
      } finally {
        setLoading(false)
      }
    })()
  }, [token, session?.tenantId])

  const stats = useMemo(() => {
    const active = rows.filter((row) => row.isActive).length
    const online = rows.filter((row) => row.status === 'online').length
    const visibleProducts = products.filter((product) => product.screen.showOnScreen).length
    const latestSync = rows
      .map((row) => row.lastSyncAt)
      .filter((value): value is string => Boolean(value))
      .sort()
      .at(-1)
    return { active, online, visibleProducts, latestSync }
  }, [rows, products])

  const categories = useMemo(
    () =>
      Array.from(
        new Set(products.map((entry) => entry.screen.displayCategory || entry.category?.name || 'Allgemein'))
      ).sort((a, b) => a.localeCompare(b, 'de-DE')),
    [products]
  )

  const filteredProducts = useMemo(() => {
    const query = search.trim().toLowerCase()
    return products.filter((product) => {
      const category = product.screen.displayCategory || product.category?.name || 'Allgemein'
      if (categoryFilter !== 'ALL' && category !== categoryFilter) return false
      if (!query) return true
      return (
        product.name.toLowerCase().includes(query) ||
        category.toLowerCase().includes(query) ||
        product.ingredients.some((ingredient) => ingredient.name.toLowerCase().includes(query))
      )
    })
  }, [products, search, categoryFilter])

  async function refreshAfterDeviceChange() {
    if (!token || !session?.tenantId) return
    await loadStudioData(token, session.tenantId)
  }

  async function handleToggleDevice(row: DisplayDeviceOverviewRow) {
    try {
      setDeviceBusyId(row.id)
      setError('')
      setSuccess('')
      await updateDisplayDeviceActiveState(token, row.id, !row.isActive)
      setSuccess(row.isActive ? 'Display wurde deaktiviert.' : 'Display wurde aktiviert.')
      await refreshAfterDeviceChange()
    } catch (toggleError) {
      setError(toggleError instanceof Error ? toggleError.message : 'Display konnte nicht geändert werden.')
    } finally {
      setDeviceBusyId(null)
    }
  }

  async function handleDeleteDevice(row: DisplayDeviceOverviewRow) {
    const firstConfirm = window.confirm('Möchtest du dieses Display wirklich löschen?')
    if (!firstConfirm) return
    const secondConfirm = window.confirm(
      'Bitte bestätige endgültig: Dieses Display wird dauerhaft gelöscht.\n\nWenn du dieses Display löschst:\n- wird die Verbindung zu diesem Bildschirm getrennt\n- das Display verschwindet aus der Display-Liste\n- zugewiesene Produkte/Designs werden entfernt oder entkoppelt\n- das Gerät muss später neu verbunden werden\n- diese Aktion kann nicht rückgängig gemacht werden'
    )
    if (!secondConfirm) return

    try {
      setDeviceBusyId(row.id)
      setError('')
      setSuccess('')
      await deleteDisplayDevice(token, row.entityId, row.tenantId)
      setSuccess('Display wurde gelöscht.')
      await refreshAfterDeviceChange()
    } catch (deleteError) {
      setError(deleteError instanceof Error ? deleteError.message : 'Display konnte nicht gelöscht werden.')
    } finally {
      setDeviceBusyId(null)
    }
  }

  if (!session || !token) return null

  return (
    <AdminLayout
      title="Screen Studio"
      subtitle="Zentrale Oberfläche für Inhalte, Design, Geräte und TV-taugliche Vorschau"
    >
      <div className="space-y-4">
        <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-2">
          <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-5">
            {STUDIO_TABS.map((tab) => (
              <button
                key={tab.key}
                type="button"
                onClick={() => setActiveTab(tab.key)}
                className={`rounded-xl px-3 py-2 text-sm font-medium transition ${
                  activeTab === tab.key ? 'bg-orange-600 text-white' : 'bg-rose-50 text-rose-900 hover:bg-rose-100'
                }`}
              >
                {tab.label}
              </button>
            ))}
          </div>
        </div>

        {error ? <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
        {success ? <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{success}</div> : null}

        {activeTab === 'OVERVIEW' ? (
          <section className="space-y-4">
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-4">
              <StatCard label="Aktive Displays" value={stats.active} />
              <StatCard label="Online / Offline" value={`${stats.online} / ${Math.max(0, rows.length - stats.online)}`} />
              <StatCard label="Produkte sichtbar" value={stats.visibleProducts} />
              <StatCard label="Letzte Synchronisierung" value={stats.latestSync ? new Date(stats.latestSync).toLocaleString('de-DE') : '-'} />
            </div>
            <div className="grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
              <ActionCard title="Display verbinden" text="QR-Code scannen und Gerät zuweisen." href="/admin/display-devices" />
              <ActionCard title="Design bearbeiten" text="Farben, Schriften und Vorlagen anpassen." onClick={() => setActiveTab('DESIGN')} />
              <ActionCard title="Vorschau öffnen" text="Mehrere Auflösungen direkt simulieren." onClick={() => setActiveTab('PREVIEW')} />
            </div>
          </section>
        ) : null}

        {activeTab === 'CONTENT' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Inhalte</h2>
            <div className="mt-3 grid gap-3 md:grid-cols-3">
              <input value={search} onChange={(event) => setSearch(event.target.value)} placeholder="Suche Produkt oder Kategorie…" className="input-ui" />
              <select value={categoryFilter} onChange={(event) => setCategoryFilter(event.target.value)} className="input-ui">
                <option value="ALL">Alle Kategorien</option>
                {categories.map((category) => (
                  <option key={category} value={category}>
                    {category}
                  </option>
                ))}
              </select>
              <a href="/admin/screen" className="rounded-xl bg-slate-900 px-4 py-2 text-center text-sm font-medium text-white hover:bg-slate-800">
                Detail-Editor öffnen
              </a>
            </div>
            <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
              <table className="w-full min-w-[980px] border-collapse">
                <thead>
                  <tr>
                    <Th>Produkt</Th>
                    <Th>Auf Bildschirm</Th>
                    <Th>Kategorie</Th>
                    <Th>Preis</Th>
                    <Th>Sortierung</Th>
                    <Th>Highlight</Th>
                  </tr>
                </thead>
                <tbody>
                  {filteredProducts.map((product) => (
                    <tr key={product.id}>
                      <Td>
                        <p className="font-medium text-[var(--brand-ink)]">{product.name}</p>
                      </Td>
                      <Td>{product.screen.showOnScreen ? 'Ja' : 'Nein'}</Td>
                      <Td>{product.screen.displayCategory || product.category?.name || 'Allgemein'}</Td>
                      <Td>{Number(product.price).toFixed(2)} €</Td>
                      <Td>{product.screen.sortOrder}</Td>
                      <Td>{product.screen.isFeatured ? 'Ja' : 'Nein'}</Td>
                    </tr>
                  ))}
                  {filteredProducts.length === 0 ? (
                    <tr>
                      <Td colSpan={6}>Keine Produkte gefunden.</Td>
                    </tr>
                  ) : null}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {activeTab === 'DESIGN' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Design</h2>
            <div className="mt-4 grid gap-4 xl:grid-cols-[1.25fr_1fr]">
              <div className="grid gap-3 sm:grid-cols-2">
                {DESIGN_TEMPLATES.map((template) => (
                  <button
                    key={template}
                    type="button"
                    onClick={() => setSelectedTemplate(template)}
                    className={`rounded-2xl border px-4 py-4 text-left text-sm font-medium ${
                      selectedTemplate === template ? 'border-orange-500 bg-orange-50 text-orange-800' : 'border-rose-200 bg-rose-50 text-rose-900'
                    }`}
                  >
                    {template}
                  </button>
                ))}
              </div>
              <div className="rounded-2xl border border-[var(--brand-border)] bg-slate-950 p-4 text-white">
                <p className="text-sm font-semibold">Live-Vorschau</p>
                <div
                  className="mt-3 rounded-xl p-4"
                  style={{
                    background:
                      backgroundMode === 'HELL'
                        ? '#f8fafc'
                        : backgroundMode === 'DUNKEL'
                          ? '#0f172a'
                          : backgroundMode === 'VERLAUF'
                            ? `linear-gradient(135deg, ${primaryColor}, ${accentColor})`
                            : '#111827',
                    color: backgroundMode === 'HELL' ? '#0f172a' : '#ffffff',
                  }}
                >
                  <p className="text-xs uppercase">{selectedTemplate}</p>
                  <p className="mt-1 text-lg font-bold">Menüvorschau</p>
                  <p className="mt-1 text-sm">Burger Classic</p>
                  <p className="text-sm">{highlightPrice ? '9,90 €' : 'Preis dezent'}</p>
                </div>
              </div>
            </div>
            <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
              <Field label="Hauptfarbe"><input type="color" value={primaryColor} onChange={(e) => setPrimaryColor(e.target.value)} className="input-ui h-10" /></Field>
              <Field label="Akzentfarbe"><input type="color" value={accentColor} onChange={(e) => setAccentColor(e.target.value)} className="input-ui h-10" /></Field>
              <Field label="Hintergrund">
                <select value={backgroundMode} onChange={(e) => setBackgroundMode(e.target.value as typeof backgroundMode)} className="input-ui">
                  <option value="HELL">Hell</option>
                  <option value="DUNKEL">Dunkel</option>
                  <option value="VERLAUF">Verlauf</option>
                  <option value="BILD">Bild</option>
                </select>
              </Field>
              <Field label="Schriftgröße">
                <select value={fontSizeMode} onChange={(e) => setFontSizeMode(e.target.value as FontSizeMode)} className="input-ui">
                  <option value="KLEIN">Klein</option>
                  <option value="MITTEL">Mittel</option>
                  <option value="GROSS">Groß</option>
                </select>
              </Field>
              <Field label="Produktkarten">
                <select value={cardDensity} onChange={(e) => setCardDensity(e.target.value as CardDensity)} className="input-ui">
                  <option value="KOMPAKT">Kompakt</option>
                  <option value="KOMFORT">Komfort</option>
                  <option value="GROSS">Groß</option>
                </select>
              </Field>
              <Field label="Logo anzeigen">
                <select value={showLogo ? 'JA' : 'NEIN'} onChange={(e) => setShowLogo(e.target.value === 'JA')} className="input-ui">
                  <option value="JA">Ja</option>
                  <option value="NEIN">Nein</option>
                </select>
              </Field>
              <Field label="Preis hervorheben">
                <select value={highlightPrice ? 'JA' : 'NEIN'} onChange={(e) => setHighlightPrice(e.target.value === 'JA')} className="input-ui">
                  <option value="JA">Ja</option>
                  <option value="NEIN">Nein</option>
                </select>
              </Field>
              <Field label="Expertenmodus">
                <select value={expertMode ? 'AKTIV' : 'INAKTIV'} onChange={(e) => setExpertMode(e.target.value === 'AKTIV')} className="input-ui">
                  <option value="INAKTIV">Inaktiv</option>
                  <option value="AKTIV">Aktiv</option>
                </select>
              </Field>
            </div>
            {expertMode ? (
              <div className="mt-4 rounded-xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900">
                Expertenmodus: Pixelwerte, einzelne Farbwerte, Font-Family und Skalierungswerte werden im Detail-Editor gepflegt.
              </div>
            ) : null}
          </section>
        ) : null}

        {activeTab === 'DEVICES' ? (
          <section className="space-y-4">
            <div className="grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
              {rows.map((row) => (
                <article key={row.id} className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
                  <div className="flex items-start justify-between gap-3">
                    <div>
                      <p className="text-sm font-semibold text-[var(--brand-ink)]">{row.name}</p>
                      <p className="text-xs text-rose-900/70">{row.status === 'online' ? 'Online' : row.status === 'offline' ? 'Offline' : 'Inaktiv'}</p>
                    </div>
                    <span className={`rounded-full px-2 py-1 text-[11px] font-semibold ${row.status === 'online' ? 'bg-emerald-100 text-emerald-800' : 'bg-rose-100 text-rose-800'}`}>
                      {row.status === 'online' ? 'Online' : 'Offline'}
                    </span>
                  </div>
                  <p className="mt-2 text-xs text-rose-900/75">Zuletzt gesehen: {row.lastSeenAt ? new Date(row.lastSeenAt).toLocaleString('de-DE') : '-'}</p>
                  <p className="text-xs text-rose-900/75">Erkannte Auflösung: {row.resolution || 'Wird erkannt'}</p>
                  <div className="mt-3 flex flex-wrap gap-2">
                    <a href="/admin/display-devices" className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-800">Gerät verbinden</a>
                    <button type="button" onClick={() => void handleToggleDevice(row)} disabled={deviceBusyId === row.id} className="rounded-lg bg-slate-200 px-3 py-1.5 text-xs font-medium text-slate-900 hover:bg-slate-300">
                      {row.isActive ? 'Deaktivieren' : 'Aktivieren'}
                    </button>
                    {row.sourceKind === 'DISPLAY_DEVICE' ? (
                      <button type="button" onClick={() => void handleDeleteDevice(row)} disabled={deviceBusyId === row.id} className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-700">
                        Löschen
                      </button>
                    ) : null}
                  </div>
                </article>
              ))}
            </div>
            {rows.length === 0 ? (
              <div className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-white px-4 py-4 text-sm text-rose-900/75">
                Noch keine Displays verbunden.
              </div>
            ) : null}
          </section>
        ) : null}

        {activeTab === 'PREVIEW' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Vorschau</h2>
            <div className="mt-4 grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
              {[
                { label: '1920×1080', cap: 24 },
                { label: '1080×1920', cap: 18 },
                { label: '1280×720', cap: 16 },
                { label: '4K (3840×2160)', cap: 34 },
              ].map((preset) => {
                const overflow = stats.visibleProducts > preset.cap
                return (
                  <div key={preset.label} className="rounded-xl border border-rose-200 bg-rose-50 px-3 py-4">
                    <p className="text-sm font-semibold text-[var(--brand-ink)]">{preset.label}</p>
                    <p className="mt-1 text-xs text-rose-900/75">Empfohlene Kapazität: bis {preset.cap} Produkte sichtbar</p>
                    {overflow ? (
                      <p className="mt-2 text-xs font-semibold text-amber-700">Warnung: Inhalte könnten nicht vollständig passen.</p>
                    ) : (
                      <p className="mt-2 text-xs font-semibold text-emerald-700">Layout passt voraussichtlich.</p>
                    )}
                  </div>
                )
              })}
            </div>
            <div className="mt-4">
              <a href="/admin/screen" className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-medium text-white hover:bg-slate-800">
                Detail-Vorschau öffnen
              </a>
            </div>
          </section>
        ) : null}

        {loading ? <p className="text-sm text-rose-900/70">Lade Screen Studio Daten …</p> : null}
      </div>
    </AdminLayout>
  )
}

function StatCard({ label, value }: { label: string; value: string | number }) {
  return (
    <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-4 shadow-sm">
      <p className="text-xs uppercase tracking-wide text-rose-900/70">{label}</p>
      <p className="mt-1 text-2xl font-bold text-[var(--brand-ink)]">{value}</p>
    </article>
  )
}

function ActionCard({
  title,
  text,
  href,
  onClick,
}: {
  title: string
  text: string
  href?: string
  onClick?: () => void
}) {
  const content = (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/70 px-4 py-4 text-left transition hover:bg-rose-100">
      <p className="text-sm font-semibold text-[var(--brand-ink)]">{title}</p>
      <p className="mt-1 text-xs text-rose-900/75">{text}</p>
    </div>
  )
  if (href) {
    return (
      <a href={href} className="block">
        {content}
      </a>
    )
  }
  return (
    <button type="button" onClick={onClick} className="block w-full text-left">
      {content}
    </button>
  )
}

function Field({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <label className="block">
      <span className="mb-1 block text-sm font-medium text-rose-900/85">{label}</span>
      {children}
    </label>
  )
}

function Th({ children }: { children: React.ReactNode }) {
  return <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">{children}</th>
}

function Td({ children, colSpan }: { children: React.ReactNode; colSpan?: number }) {
  return (
    <td colSpan={colSpan} className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
      {children}
    </td>
  )
}
