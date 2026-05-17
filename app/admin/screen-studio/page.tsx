'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import DisplayDeviceManagementPanel from '@/app/Components/admin/DisplayDeviceManagementPanel'
import {
  getAdminDisplayScreens,
  deleteDisplayDevice,
  getDisplayDeviceOverview,
  getScreenConfig,
  getScreenProducts,
  updateAdminDisplayScreen,
  updateScreenProduct,
  updateScreenConfig,
  updateDisplayDeviceActiveState,
  type AdminDisplayScreen,
  type DisplayDeviceOverviewRow,
  type ScreenConfig,
  type ScreenProduct,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type StudioTab = 'OVERVIEW' | 'CONTENT' | 'DESIGN' | 'DEVICES' | 'PREVIEW'
type FontSizeMode = 'KLEIN' | 'MITTEL' | 'GROSS'
type CardDensity = 'KOMPAKT' | 'KOMFORT' | 'GROSS'
type DesignAssistantStatus = 'IDLE' | 'MENU_UPLOADED' | 'LOGO_UPLOADED' | 'READY_FOR_SUGGESTION'

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

const TEMPLATE_STYLES: Record<
  string,
  { primary: string; accent: string; backgroundMode: 'HELL' | 'DUNKEL' | 'VERLAUF' | 'BILD'; font: FontSizeMode; density: CardDensity; anim: boolean }
> = {
  'Klarando Modern': { primary: '#f97316', accent: '#ec4899', backgroundMode: 'VERLAUF', font: 'MITTEL', density: 'KOMFORT', anim: true },
  'Fastfood Board': { primary: '#ef4444', accent: '#f59e0b', backgroundMode: 'DUNKEL', font: 'GROSS', density: 'KOMPAKT', anim: false },
  'Premium Glas': { primary: '#0ea5e9', accent: '#8b5cf6', backgroundMode: 'DUNKEL', font: 'MITTEL', density: 'KOMFORT', anim: true },
  'Klassische Preistafel': { primary: '#1f2937', accent: '#facc15', backgroundMode: 'HELL', font: 'MITTEL', density: 'KOMPAKT', anim: false },
  'Minimal Dunkel': { primary: '#111827', accent: '#4f46e5', backgroundMode: 'DUNKEL', font: 'KLEIN', density: 'KOMPAKT', anim: false },
  'Tagesangebot': { primary: '#f97316', accent: '#dc2626', backgroundMode: 'VERLAUF', font: 'GROSS', density: 'GROSS', anim: true },
  'Café/Bäckerei': { primary: '#a16207', accent: '#f59e0b', backgroundMode: 'HELL', font: 'MITTEL', density: 'KOMFORT', anim: false },
  'Döner/Imbiss': { primary: '#ea580c', accent: '#b91c1c', backgroundMode: 'DUNKEL', font: 'GROSS', density: 'KOMFORT', anim: true },
  'Pizza': { primary: '#dc2626', accent: '#16a34a', backgroundMode: 'VERLAUF', font: 'MITTEL', density: 'KOMFORT', anim: true },
  'Burger': { primary: '#d97706', accent: '#ef4444', backgroundMode: 'DUNKEL', font: 'GROSS', density: 'GROSS', anim: false },
}

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
  const [updatingProductId, setUpdatingProductId] = useState<string | null>(null)

  const [selectedTemplate, setSelectedTemplate] = useState('Klarando Modern')
  const [primaryColor, setPrimaryColor] = useState('#f97316')
  const [accentColor, setAccentColor] = useState('#ec4899')
  const [backgroundMode, setBackgroundMode] = useState<'HELL' | 'DUNKEL' | 'VERLAUF' | 'BILD'>('VERLAUF')
  const [fontSizeMode, setFontSizeMode] = useState<FontSizeMode>('MITTEL')
  const [cardDensity, setCardDensity] = useState<CardDensity>('KOMFORT')
  const [showLogo, setShowLogo] = useState(true)
  const [highlightPrice, setHighlightPrice] = useState(true)
  const [enableAnimations, setEnableAnimations] = useState(true)
  const [expertMode, setExpertMode] = useState(false)
  const [fontFamily, setFontFamily] = useState('Poppins, sans-serif')
  const [scalePercent, setScalePercent] = useState(100)
  const [pixelPadding, setPixelPadding] = useState(16)
  const [savingDesign, setSavingDesign] = useState(false)
  const [screenSettingsById, setScreenSettingsById] = useState<Record<string, AdminDisplayScreen>>({})
  const [selectedDeviceIdForSettings, setSelectedDeviceIdForSettings] = useState('')
  const [editingScreen, setEditingScreen] = useState<AdminDisplayScreen | null>(null)
  const [savingScreenSettings, setSavingScreenSettings] = useState(false)
  const [configId, setConfigId] = useState<string>('')
  const [designAssistant, setDesignAssistant] = useState<{
    designAssistantStatus: DesignAssistantStatus
    uploadedMenuFileUrl?: string
    detectedBrandColors?: string[]
    suggestedTemplate?: string
    logoFileName?: string
    menuFileName?: string
  }>({
    designAssistantStatus: 'IDLE',
    uploadedMenuFileUrl: undefined,
    detectedBrandColors: undefined,
    suggestedTemplate: undefined,
    logoFileName: undefined,
    menuFileName: undefined,
  })
  const [assistantNotice, setAssistantNotice] = useState('')

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
        const screens = await getAdminDisplayScreens(token, tenantId)
        setScreenSettingsById(Object.fromEntries(screens.map((entry) => [entry.id, entry])))
        const config = await getScreenConfig()
        setConfigId(config.id)
        setPrimaryColor(config.productNameColor || config.textColor || '#f97316')
        setAccentColor(config.accentColor || '#ec4899')
        setBackgroundMode(
          config.backgroundMode === 'IMAGE' ? 'BILD' : config.backgroundMode === 'COLOR' ? 'DUNKEL' : 'VERLAUF'
        )
        setShowLogo(Boolean(config.logoUrl))
        setHighlightPrice(config.showPrices)
        setEnableAnimations(config.overlayAnimation !== 'NONE')
        setFontFamily(config.fontFamily || 'Poppins, sans-serif')
        setPixelPadding(config.cardPadding || 16)
        setFontSizeMode(config.productFontSize >= 32 ? 'GROSS' : config.productFontSize <= 22 ? 'KLEIN' : 'MITTEL')
        setCardDensity(config.cardPadding <= 12 ? 'KOMPAKT' : config.cardPadding >= 22 ? 'GROSS' : 'KOMFORT')
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Screen Studio konnte nicht geladen werden.')
      } finally {
        setLoading(false)
      }
    })()
  }, [token, session?.tenantId])

  useEffect(() => {
    if (typeof window === 'undefined') return
    const params = new URLSearchParams(window.location.search)
    const deviceId = params.get('deviceId')?.trim()
    const tab = params.get('tab')?.trim().toLowerCase()
    if (tab === 'devices') {
      setActiveTab('DEVICES')
    }
    if (deviceId) {
      setSelectedDeviceIdForSettings(deviceId)
    }
  }, [])

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

  const selectedDisplayForSettings = useMemo(() => {
    if (!selectedDeviceIdForSettings) return null
    return rows.find((row) => row.entityId === selectedDeviceIdForSettings && row.sourceKind === 'DISPLAY_DEVICE') ?? null
  }, [rows, selectedDeviceIdForSettings])

  useEffect(() => {
    if (!selectedDisplayForSettings?.screenId) {
      setEditingScreen(null)
      return
    }
    const screen = screenSettingsById[selectedDisplayForSettings.screenId]
    if (screen) {
      setEditingScreen({ ...screen })
    }
  }, [selectedDisplayForSettings, screenSettingsById])

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

  async function handleToggleProductVisibility(product: ScreenProduct, next: boolean) {
    try {
      setUpdatingProductId(product.id)
      setError('')
      const updated = await updateScreenProduct(product.id, {
        showOnScreen: next,
      })
      setProducts((current) =>
        current.map((entry) => (entry.id === product.id ? updated : entry))
      )
    } catch (toggleError) {
      setError(toggleError instanceof Error ? toggleError.message : 'Produkt konnte nicht aktualisiert werden.')
    } finally {
      setUpdatingProductId(null)
    }
  }

  async function handleSaveScreenSettings() {
    if (!editingScreen || !token || !session?.tenantId) return
    try {
      setSavingScreenSettings(true)
      setError('')
      const updated = await updateAdminDisplayScreen(token, editingScreen.id, {
        tenantId: session.tenantId,
        name: editingScreen.name,
        orientation: editingScreen.orientation,
        resolutionPreset: editingScreen.resolutionPreset,
        layoutType: editingScreen.layoutType,
        backgroundColor: editingScreen.backgroundColor,
        accentColor: editingScreen.accentColor,
        isActive: editingScreen.isActive,
      })
      setScreenSettingsById((current) => ({ ...current, [updated.id]: updated }))
      setSuccess('Bildschirm-Einstellungen wurden gespeichert.')
      await refreshAfterDeviceChange()
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Bildschirm konnte nicht gespeichert werden.')
    } finally {
      setSavingScreenSettings(false)
    }
  }

  if (!session || !token) return null

  async function handleSaveDesign() {
    try {
      setSavingDesign(true)
      setError('')
      const payload: Partial<ScreenConfig> = {
        id: configId || undefined,
        accentColor,
        productNameColor: primaryColor,
        textColor: primaryColor,
        backgroundMode: backgroundMode === 'BILD' ? 'IMAGE' : 'COLOR',
        backgroundValue: backgroundMode === 'HELL' ? '#f8fafc' : backgroundMode === 'DUNKEL' ? '#0f172a' : `linear-gradient(135deg, ${primaryColor}, ${accentColor})`,
        showPrices: highlightPrice,
        logoUrl: showLogo ? '/klarando_logo.png' : null,
        overlayAnimation: enableAnimations ? 'FLOAT' : 'NONE',
        fontFamily,
        cardPadding: pixelPadding,
        productFontSize: fontSizeMode === 'KLEIN' ? 20 : fontSizeMode === 'GROSS' ? 34 : 28,
      }
      await updateScreenConfig(payload)
      setSuccess('Design wurde gespeichert.')
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Design konnte nicht gespeichert werden.')
    } finally {
      setSavingDesign(false)
    }
  }

  function handlePreparedLogoUpload(file: File | null) {
    if (!file) return
    setDesignAssistant((current) => ({
      ...current,
      logoFileName: file.name,
      detectedBrandColors: current.detectedBrandColors && current.detectedBrandColors.length
        ? current.detectedBrandColors
        : ['#f97316', '#ec4899'],
      designAssistantStatus: current.menuFileName ? 'READY_FOR_SUGGESTION' : 'LOGO_UPLOADED',
    }))
    setAssistantNotice('Upload-Assistent ist vorbereitet und wird im nächsten Schritt aktiviert.')
  }

  function handlePreparedMenuUpload(file: File | null) {
    if (!file) return
    const localMenuUrl = `local://${file.name}`
    setDesignAssistant((current) => {
      const autoTemplate =
        current.suggestedTemplate ||
        (current.detectedBrandColors?.some((entry) => entry.toLowerCase().includes('ec4899'))
          ? 'Klarando Modern'
          : 'Fastfood Board')
      return {
        ...current,
        menuFileName: file.name,
        uploadedMenuFileUrl: localMenuUrl,
        suggestedTemplate: autoTemplate,
        designAssistantStatus: current.logoFileName ? 'READY_FOR_SUGGESTION' : 'MENU_UPLOADED',
      }
    })
    setAssistantNotice('Upload-Assistent ist vorbereitet und wird im nächsten Schritt aktiviert.')
  }

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
              <div className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm text-slate-700">
                Produkte werden direkt hier gepflegt.
              </div>
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
                      <Td>
                        <button
                          type="button"
                          onClick={() => void handleToggleProductVisibility(product, !product.screen.showOnScreen)}
                          disabled={updatingProductId === product.id}
                          className={`rounded-full px-2.5 py-1 text-xs font-semibold ${
                            product.screen.showOnScreen ? 'bg-emerald-100 text-emerald-800' : 'bg-slate-200 text-slate-700'
                          }`}
                        >
                          {product.screen.showOnScreen ? 'Sichtbar' : 'Ausgeblendet'}
                        </button>
                      </Td>
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
            <div className="mt-4 rounded-2xl border border-blue-200 bg-blue-50 p-4">
              <div className="flex flex-wrap items-start justify-between gap-3">
                <div>
                  <p className="text-sm font-semibold text-blue-900">Design-Assistent</p>
                  <p className="mt-1 text-xs text-blue-800/90">
                    Klarando kann später aus Logo, Farben und Speisekarte automatisch ein Bildschirmdesign vorschlagen.
                  </p>
                </div>
                <span className="rounded-full bg-white px-3 py-1 text-xs font-semibold text-blue-800 ring-1 ring-blue-200">
                  Status: {designAssistant.designAssistantStatus}
                </span>
              </div>
              <div className="mt-3 grid gap-3 sm:grid-cols-3">
                <label className="cursor-pointer rounded-xl border border-blue-200 bg-white px-3 py-3 text-left text-xs font-medium text-blue-900 shadow-sm transition hover:bg-blue-100">
                  <span className="text-sm font-semibold">Logo & Farben</span>
                  <p className="mt-1 text-[11px] text-blue-700/90">Logo-Datei auswählen (MVP vorbereitet)</p>
                  <p className="mt-2 text-[11px] text-blue-800">
                    {designAssistant.logoFileName ? `Ausgewählt: ${designAssistant.logoFileName}` : 'Noch kein Logo ausgewählt'}
                  </p>
                  <input
                    type="file"
                    accept="image/png,image/jpeg,image/webp,image/svg+xml"
                    className="hidden"
                    onChange={(event) => handlePreparedLogoUpload(event.target.files?.[0] || null)}
                  />
                </label>
                <label className="cursor-pointer rounded-xl border border-blue-200 bg-white px-3 py-3 text-left text-xs font-medium text-blue-900 shadow-sm transition hover:bg-blue-100">
                  <span className="text-sm font-semibold">Speisekarte importieren</span>
                  <p className="mt-1 text-[11px] text-blue-700/90">Datei auswählen (Bild/PDF, MVP vorbereitet)</p>
                  <p className="mt-2 text-[11px] text-blue-800">
                    {designAssistant.menuFileName ? `Ausgewählt: ${designAssistant.menuFileName}` : 'Noch keine Speisekarte ausgewählt'}
                  </p>
                  <input
                    type="file"
                    accept="image/png,image/jpeg,image/webp,application/pdf"
                    className="hidden"
                    onChange={(event) => handlePreparedMenuUpload(event.target.files?.[0] || null)}
                  />
                </label>
                <button
                  type="button"
                  onClick={() => {
                    setAssistantNotice('Upload-Assistent ist vorbereitet und wird im nächsten Schritt aktiviert.')
                    if (designAssistant.suggestedTemplate) {
                      setSelectedTemplate(designAssistant.suggestedTemplate)
                    }
                  }}
                  className="rounded-xl border border-blue-200 bg-white px-3 py-3 text-left text-xs font-medium text-blue-900 shadow-sm transition hover:bg-blue-100"
                >
                  <span className="text-sm font-semibold">Designvorschlag</span>
                  <p className="mt-1 text-[11px] text-blue-700/90">Template-Vorschlag wird als nächstes automatisch generiert.</p>
                  <p className="mt-2 text-[11px] text-blue-800">
                    Vorgeschlagen: {designAssistant.suggestedTemplate || 'Noch kein Vorschlag'}
                  </p>
                </button>
              </div>
              <div className="mt-3 grid gap-2 rounded-xl bg-white/80 px-3 py-3 text-xs text-blue-900 ring-1 ring-blue-100 sm:grid-cols-3">
                <p><span className="font-semibold">Logo:</span> {designAssistant.logoFileName || 'Noch nicht gewählt'}</p>
                <p><span className="font-semibold">Speisekarte:</span> {designAssistant.menuFileName || 'Noch nicht gewählt'}</p>
                <p><span className="font-semibold">Vorschlag:</span> {designAssistant.suggestedTemplate || 'Noch offen'}</p>
              </div>
              <div className="mt-2 rounded-xl border border-dashed border-blue-200 bg-white/60 px-3 py-2 text-xs text-blue-900">
                {assistantNotice || 'Upload-Assistent ist vorbereitet und wird im nächsten Schritt aktiviert.'}
              </div>
            </div>
            <div className="mt-4 grid gap-4 xl:grid-cols-[1.3fr_1fr]">
              <div className="grid gap-3 sm:grid-cols-2">
                {DESIGN_TEMPLATES.map((template) => (
                  <button
                    key={template}
                    type="button"
                    onClick={() => {
                      setSelectedTemplate(template)
                      const preset = TEMPLATE_STYLES[template]
                      if (preset) {
                        setPrimaryColor(preset.primary)
                        setAccentColor(preset.accent)
                        setBackgroundMode(preset.backgroundMode)
                        setFontSizeMode(preset.font)
                        setCardDensity(preset.density)
                        setEnableAnimations(preset.anim)
                      }
                    }}
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
                    padding: `${pixelPadding}px`,
                    fontFamily,
                    transform: `scale(${scalePercent / 100})`,
                    transformOrigin: 'top left',
                  }}
                >
                  <p className="text-xs uppercase">{selectedTemplate}</p>
                  <p className="mt-1 text-lg font-bold">Menüvorschau</p>
                  <p className="mt-1 text-sm">Burger Classic</p>
                  <p className="text-sm">{highlightPrice ? '9,90 €' : 'Preis dezent'}</p>
                </div>
                <div className="mt-3 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
                  Warnung: Wenn viele Produkte aktiv sind, kann der Inhalt je nach Auflösung nicht komplett passen.
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
              <Field label="Animationen">
                <select value={enableAnimations ? 'JA' : 'NEIN'} onChange={(e) => setEnableAnimations(e.target.value === 'JA')} className="input-ui">
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
              <div className="mt-4 grid gap-3 rounded-xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-900 md:grid-cols-3">
                <Field label="Font Family">
                  <input value={fontFamily} onChange={(e) => setFontFamily(e.target.value)} className="input-ui" />
                </Field>
                <Field label="Skalierung (%)">
                  <input type="number" value={scalePercent} onChange={(e) => setScalePercent(Math.max(70, Math.min(130, Number(e.target.value) || 100)))} className="input-ui" />
                </Field>
                <Field label="Pixel-Padding">
                  <input type="number" value={pixelPadding} onChange={(e) => setPixelPadding(Math.max(8, Math.min(40, Number(e.target.value) || 16)))} className="input-ui" />
                </Field>
              </div>
            ) : null}
            <div className="mt-4 flex justify-end">
              <button
                type="button"
                onClick={() => void handleSaveDesign()}
                disabled={savingDesign}
                className="rounded-xl bg-orange-600 px-5 py-2 text-sm font-semibold text-white hover:bg-orange-700 disabled:opacity-60"
              >
                {savingDesign ? 'Speichert…' : 'Design speichern'}
              </button>
            </div>
          </section>
        ) : null}

        {activeTab === 'DEVICES' ? (
          <section className="space-y-4">
            <DisplayDeviceManagementPanel
              token={token}
              roleScope="admin"
              fixedTenantId={session.tenantId}
              studioMode
            />
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
                    <button
                      type="button"
                      onClick={() => setSelectedDeviceIdForSettings(row.entityId)}
                      className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white hover:bg-slate-800"
                    >
                      Einstellungen
                    </button>
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
            {selectedDisplayForSettings ? (
              <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
                <h3 className="text-base font-semibold text-[var(--brand-ink)]">
                  Ausgewählt: {selectedDisplayForSettings.name}
                </h3>
                {!selectedDisplayForSettings.screenId ? (
                  <p className="mt-2 text-sm text-amber-700">
                    Dieser Bildschirm ist noch keinem Screen-Profil zugeordnet. Bitte Gerät neu verbinden.
                  </p>
                ) : editingScreen ? (
                  <>
                    <div className="mt-3 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
                      <Field label="Name">
                        <input value={editingScreen.name} onChange={(e) => setEditingScreen((c) => (c ? { ...c, name: e.target.value } : c))} className="input-ui" />
                      </Field>
                      <Field label="Ausrichtung">
                        <select value={editingScreen.orientation} onChange={(e) => setEditingScreen((c) => (c ? { ...c, orientation: e.target.value as AdminDisplayScreen['orientation'] } : c))} className="input-ui">
                          <option value="LANDSCAPE">Querformat</option>
                          <option value="PORTRAIT">Hochformat</option>
                        </select>
                      </Field>
                      <Field label="Auflösung">
                        <select value={editingScreen.resolutionPreset} onChange={(e) => setEditingScreen((c) => (c ? { ...c, resolutionPreset: e.target.value as AdminDisplayScreen['resolutionPreset'] } : c))} className="input-ui">
                          <option value="HD">HD</option>
                          <option value="FULL_HD">Full HD</option>
                          <option value="FOUR_K">4K</option>
                          <option value="CUSTOM">Custom</option>
                        </select>
                      </Field>
                      <Field label="Layout">
                        <select value={editingScreen.layoutType} onChange={(e) => setEditingScreen((c) => (c ? { ...c, layoutType: e.target.value as AdminDisplayScreen['layoutType'] } : c))} className="input-ui">
                          <option value="MENU_BOARD">Menüboard</option>
                          <option value="SLIDESHOW">Slideshow</option>
                          <option value="PROMO_SPLIT">Promo Split</option>
                          <option value="ORDER_STATUS">Bestellstatus</option>
                        </select>
                      </Field>
                      <Field label="Hintergrundfarbe">
                        <input type="color" value={editingScreen.backgroundColor} onChange={(e) => setEditingScreen((c) => (c ? { ...c, backgroundColor: e.target.value } : c))} className="input-ui h-10" />
                      </Field>
                      <Field label="Akzentfarbe">
                        <input type="color" value={editingScreen.accentColor} onChange={(e) => setEditingScreen((c) => (c ? { ...c, accentColor: e.target.value } : c))} className="input-ui h-10" />
                      </Field>
                    </div>
                    <div className="mt-4 flex justify-end">
                      <button type="button" onClick={() => void handleSaveScreenSettings()} disabled={savingScreenSettings} className="rounded-xl bg-orange-600 px-4 py-2 text-sm font-semibold text-white hover:bg-orange-700 disabled:opacity-60">
                        {savingScreenSettings ? 'Speichert…' : 'Einstellungen speichern'}
                      </button>
                    </div>
                  </>
                ) : (
                  <p className="mt-2 text-sm text-slate-600">Screen-Profil wird geladen …</p>
                )}
              </section>
            ) : null}
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
              <a href="/admin/screen-studio?tab=preview" className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-medium text-white hover:bg-slate-800">
                Vorschau aktualisieren
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
