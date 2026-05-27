'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import DisplayDeviceManagementPanel from '@/app/Components/admin/DisplayDeviceManagementPanel'
import {
  createAdminDisplayPlaylist,
  createAdminDisplayPlaylistItem,
  createAdminDisplayScreen,
  getAdminDisplayPlaylists,
  getAdminDisplayScreens,
  deleteDisplayDevice,
  getDisplayDeviceOverview,
  getMyEffectiveFeatureModules,
  getScreenDevices,
  getScreenConfig,
  getScreenProducts,
  updateAdminDisplayScreen,
  updateScreenDevice,
  updateScreenProduct,
  updateScreenConfig,
  updateDisplayDeviceActiveState,
  type AdminDisplayScreen,
  type DisplayDeviceOverviewRow,
  type ScreenConfig,
  type ScreenProduct,
  type FeatureModuleKey,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type StudioTab =
  | 'OVERVIEW'
  | 'DEVICES'
  | 'CONTENT'
  | 'LAYOUT'
  | 'BRANDING'
  | 'OFFLINE_SYNC'
  | 'SIGNAGE'
  | 'EASY_ORDER'
  | 'PREVIEW'
  | 'PUBLISH'
type FontSizeMode = 'KLEIN' | 'MITTEL' | 'GROSS'
type CardDensity = 'KOMPAKT' | 'KOMFORT' | 'GROSS'
type DesignAssistantStatus = 'IDLE' | 'MENU_UPLOADED' | 'LOGO_UPLOADED' | 'READY_FOR_SUGGESTION'
type DisplayMode = 'MENU_DISPLAY' | 'EASY_ORDER' | 'PICKUP_MONITOR' | 'PROMOTION_SCREEN'
type DisplayTemplate = 'MODERN_GRID' | 'CLASSIC_MENU' | 'PROMOTION_HIGHLIGHT' | 'TOUCH_KIOSK_PREVIEW'
type BackgroundModeUi = 'HELL' | 'DUNKEL' | 'VERLAUF' | 'BILD' | 'VIDEO'

const STUDIO_TABS: Array<{ key: StudioTab; label: string }> = [
  { key: 'OVERVIEW', label: 'Übersicht' },
  { key: 'DEVICES', label: 'Geräte' },
  { key: 'CONTENT', label: 'Inhalte' },
  { key: 'LAYOUT', label: 'Layout' },
  { key: 'BRANDING', label: 'Branding' },
  { key: 'OFFLINE_SYNC', label: 'Offline & Sync' },
  { key: 'SIGNAGE', label: 'Slides & Werbung' },
  { key: 'EASY_ORDER', label: 'Easy Order' },
  { key: 'PREVIEW', label: 'Vorschau' },
  { key: 'PUBLISH', label: 'Veröffentlichung' },
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
  { primary: string; accent: string; backgroundMode: 'HELL' | 'DUNKEL' | 'VERLAUF' | 'BILD' | 'VIDEO'; font: FontSizeMode; density: CardDensity; anim: boolean }
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

const DISPLAY_MODES: Array<{ id: DisplayMode; label: string; help: string }> = [
  { id: 'MENU_DISPLAY', label: 'MENU_DISPLAY', help: 'Klassische Speisekarte für Gastraum-Bildschirme.' },
  { id: 'EASY_ORDER', label: 'EASY_ORDER', help: 'Vorbereiteter Touch-Modus (Preview), noch ohne Checkout.' },
  { id: 'PICKUP_MONITOR', label: 'PICKUP_MONITOR', help: 'Abholstatus und Nummern für Theke/Abholung.' },
  { id: 'PROMOTION_SCREEN', label: 'PROMOTION_SCREEN', help: 'Promo-/Highlight-Screen mit Fokus auf Aktionen.' },
]

const DISPLAY_TEMPLATES: Array<{ id: DisplayTemplate; label: string; help: string }> = [
  { id: 'MODERN_GRID', label: 'MODERN_GRID', help: 'Moderne Rasteransicht mit klarer Kartenstruktur.' },
  { id: 'CLASSIC_MENU', label: 'CLASSIC_MENU', help: 'Klassische Speisekartenoptik mit hoher Dichte.' },
  { id: 'PROMOTION_HIGHLIGHT', label: 'PROMOTION_HIGHLIGHT', help: 'Große Headlines für Promos und Angebote.' },
  { id: 'TOUCH_KIOSK_PREVIEW', label: 'TOUCH_KIOSK_PREVIEW', help: 'Vorschau für zukünftigen Kiosk-/Touch-Flow.' },
]

const DISPLAY_META_PREFIX = '@@klarando-display-meta:'

function applyDistributionMetaToNotes(
  notes: string | null | undefined,
  distribution: {
    displayCount: number
    strategy: 'split-products' | 'duplicate-all' | 'category-based'
    displayGroupId?: string | null
  },
  settings?: {
    rotationEnabled?: boolean
    targetProductsPerScreen?: number | null
    layoutMode?: 'AUTO' | 'STANDARD' | 'COMPACT' | 'ULTRA_COMPACT'
    depositDisplayMode?: 'INCLUDED' | 'EXTRA'
  }
) {
  const raw = notes || ''
  const firstLine = raw.split('\n')[0]?.trim() || ''
  let currentMeta: Record<string, unknown> = {}
  if (firstLine.startsWith(DISPLAY_META_PREFIX)) {
    try {
      currentMeta = JSON.parse(firstLine.slice(DISPLAY_META_PREFIX.length).trim()) as Record<string, unknown>
    } catch {
      currentMeta = {}
    }
  }

  const nextMeta = {
    ...currentMeta,
    distribution: {
      ...(typeof currentMeta.distribution === 'object' && currentMeta.distribution
        ? (currentMeta.distribution as Record<string, unknown>)
        : {}),
      displayCount: Math.max(1, Math.min(8, Math.trunc(distribution.displayCount))),
      strategy: distribution.strategy,
      displayGroupId: distribution.displayGroupId || null,
    },
    settings: {
      ...(typeof currentMeta.settings === 'object' && currentMeta.settings
        ? (currentMeta.settings as Record<string, unknown>)
        : {}),
      rotationEnabled: settings?.rotationEnabled ?? true,
      targetProductsPerScreen:
        typeof settings?.targetProductsPerScreen === 'number' && settings.targetProductsPerScreen > 0
          ? Math.max(10, Math.min(60, Math.trunc(settings.targetProductsPerScreen)))
          : null,
      layoutMode: settings?.layoutMode || 'AUTO',
      depositDisplayMode: settings?.depositDisplayMode || 'INCLUDED',
    },
  }

  const metaLine = `${DISPLAY_META_PREFIX}${JSON.stringify(nextMeta)}`
  if (firstLine.startsWith(DISPLAY_META_PREFIX)) {
    const lines = raw.split('\n')
    lines[0] = metaLine
    return lines.join('\n')
  }
  if (!raw.trim()) {
    return metaLine
  }
  return `${metaLine}\n${raw}`
}

function parseDisplayMetaFromNotes(notes: string | null | undefined) {
  const raw = notes || ''
  const firstLine = raw.split('\n')[0]?.trim() || ''
  if (!firstLine.startsWith(DISPLAY_META_PREFIX)) return null
  try {
    return JSON.parse(firstLine.slice(DISPLAY_META_PREFIX.length).trim()) as Record<string, unknown>
  } catch {
    return null
  }
}

function inferTemplateFromConfig(config: ScreenConfig): DisplayTemplate {
  if (config.overlayAnimation !== 'NONE' && config.showCategoryOnCard && config.cardStyle === 'SOFT') {
    return 'MODERN_GRID'
  }
  if (config.cardStyle === 'OUTLINE' || config.cardStyle === 'BOLD') {
    return 'CLASSIC_MENU'
  }
  if (config.overlayAnimation !== 'NONE' && config.showPrices && config.cardStyle === 'GLASS') {
    return 'PROMOTION_HIGHLIGHT'
  }
  return 'TOUCH_KIOSK_PREVIEW'
}

function mapConfigCardStyleToUi(cardStyle: ScreenConfig['cardStyle']): 'SOFT' | 'GLASS' | 'BORDER' | 'NONE' {
  if (cardStyle === 'GLASS') return 'GLASS'
  if (cardStyle === 'OUTLINE' || cardStyle === 'BOLD' || cardStyle === 'SHARP') return 'BORDER'
  if (cardStyle === 'MINIMAL' || cardStyle === 'LIST') return 'NONE'
  return 'SOFT'
}

function inferBackgroundMode(config: ScreenConfig): 'HELL' | 'DUNKEL' | 'VERLAUF' | 'BILD' | 'VIDEO' {
  if (config.backgroundMode === 'VIDEO') return 'VIDEO'
  if (config.backgroundMode === 'IMAGE') return 'BILD'
  const value = (config.backgroundValue || '').toLowerCase()
  if (value.includes('linear-gradient')) return 'VERLAUF'
  if (value.includes('#f8fafc') || value.includes('#ffffff')) return 'HELL'
  return 'DUNKEL'
}

function derivePaddingFromDensity(density: CardDensity): number {
  if (density === 'KOMPAKT') return 12
  if (density === 'GROSS') return 22
  return 16
}

function deriveCardPadding(cardPadding: number): string {
  if (cardPadding <= 12) return '0.5rem'
  if (cardPadding >= 22) return '1rem'
  return '0.75rem'
}

function buildPreviewBackground(
  mode: BackgroundModeUi,
  primaryColor: string,
  accentColor: string,
  mediaUrl: string
): React.CSSProperties {
  const cleanUrl = mediaUrl.trim()
  if (mode === 'HELL') return { background: '#f8fafc', color: '#0f172a' }
  if (mode === 'DUNKEL') return { background: '#0f172a', color: '#ffffff' }
  if (mode === 'VERLAUF') return { background: `linear-gradient(135deg, ${primaryColor}, ${accentColor})`, color: '#ffffff' }
  if ((mode === 'BILD' || mode === 'VIDEO') && cleanUrl) {
    return {
      backgroundImage: `linear-gradient(rgba(15,23,42,0.45), rgba(15,23,42,0.45)), url(${cleanUrl})`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      color: '#ffffff',
    }
  }
  return { background: '#111827', color: '#ffffff' }
}

function mapScreenLayoutToMode(layoutType: AdminDisplayScreen['layoutType']): DisplayMode {
  if (layoutType === 'PROMO_SPLIT') return 'PROMOTION_SCREEN'
  if (layoutType === 'ORDER_STATUS') return 'PICKUP_MONITOR'
  if (layoutType === 'SLIDESHOW') return 'EASY_ORDER'
  return 'MENU_DISPLAY'
}

function mapModeToScreenLayout(mode: DisplayMode): AdminDisplayScreen['layoutType'] {
  if (mode === 'PROMOTION_SCREEN') return 'PROMO_SPLIT'
  if (mode === 'PICKUP_MONITOR') return 'ORDER_STATUS'
  if (mode === 'EASY_ORDER') return 'SLIDESHOW'
  return 'MENU_BOARD'
}

async function fileToDataUrl(file: File): Promise<string> {
  return await new Promise((resolve, reject) => {
    const reader = new FileReader()
    reader.onload = () => resolve(String(reader.result || ''))
    reader.onerror = () => reject(new Error('Datei konnte nicht gelesen werden.'))
    reader.readAsDataURL(file)
  })
}

async function extractBrandColorsFromImage(file: File): Promise<string[]> {
  const src = await fileToDataUrl(file)
  return await new Promise((resolve) => {
    const image = new Image()
    image.onload = () => {
      const canvas = document.createElement('canvas')
      canvas.width = 64
      canvas.height = 64
      const context = canvas.getContext('2d')
      if (!context) {
        resolve(['#f97316', '#ec4899'])
        return
      }
      context.drawImage(image, 0, 0, 64, 64)
      const data = context.getImageData(0, 0, 64, 64).data
      let bestPrimary = '#f97316'
      let bestAccent = '#ec4899'
      let primaryScore = -1
      let accentScore = -1
      for (let i = 0; i < data.length; i += 16) {
        const r = data[i]
        const g = data[i + 1]
        const b = data[i + 2]
        const brightness = r + g + b
        if (brightness < 80 || brightness > 730) continue
        const warm = r * 2 + g - b
        const cool = b * 2 + r - g
        const hex = `#${[r, g, b].map((entry) => entry.toString(16).padStart(2, '0')).join('')}`
        if (warm > primaryScore) {
          primaryScore = warm
          bestPrimary = hex
        }
        if (cool > accentScore) {
          accentScore = cool
          bestAccent = hex
        }
      }
      resolve([bestPrimary, bestAccent])
    }
    image.onerror = () => resolve(['#f97316', '#ec4899'])
    image.src = src
  })
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
  const [backgroundMode, setBackgroundMode] = useState<'HELL' | 'DUNKEL' | 'VERLAUF' | 'BILD' | 'VIDEO'>('VERLAUF')
  const [backgroundMediaUrl, setBackgroundMediaUrl] = useState('')
  const [fontSizeMode, setFontSizeMode] = useState<FontSizeMode>('MITTEL')
  const [cardDensity, setCardDensity] = useState<CardDensity>('KOMFORT')
  const [ingredientFontSize, setIngredientFontSize] = useState(16)
  const [categoryFontSize, setCategoryFontSize] = useState(16)
  const [priceFontSize, setPriceFontSize] = useState(28)
  const [defaultColumnCount, setDefaultColumnCount] = useState(2)
  const [targetWallDisplays, setTargetWallDisplays] = useState(1)
  const [showCategoryOnCard, setShowCategoryOnCard] = useState(true)
  const [showCategoryHeaders, setShowCategoryHeaders] = useState(true)
  const [showIngredients, setShowIngredients] = useState(true)
  const [showLogo, setShowLogo] = useState(true)
  const [logoUrl, setLogoUrl] = useState('')
  const [highlightPrice, setHighlightPrice] = useState(true)
  const [enableAnimations, setEnableAnimations] = useState(true)
  const [cardStyle, setCardStyle] = useState<'SOFT' | 'GLASS' | 'BORDER' | 'NONE'>('SOFT')
  const [productNameFontSize, setProductNameFontSize] = useState(28)
  const [expertMode, setExpertMode] = useState(false)
  const [fontFamily, setFontFamily] = useState('Poppins, sans-serif')
  const [scalePercent, setScalePercent] = useState(100)
  const [pixelPadding, setPixelPadding] = useState(16)
  const [savingDesign, setSavingDesign] = useState(false)
  const [screenSettingsById, setScreenSettingsById] = useState<Record<string, AdminDisplayScreen>>({})
  const [selectedDesignScreenId, setSelectedDesignScreenId] = useState('')
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
  const [creatingLayout, setCreatingLayout] = useState(false)
  const [menuRotationSeconds, setMenuRotationSeconds] = useState(50)
  const [promoRotationSeconds, setPromoRotationSeconds] = useState(10)
  const [rotationEnabled, setRotationEnabled] = useState(true)
  const [targetProductsPerScreen, setTargetProductsPerScreen] = useState<number | 'AUTO'>('AUTO')
  const [layoutMode, setLayoutMode] = useState<'AUTO' | 'STANDARD' | 'COMPACT' | 'ULTRA_COMPACT'>('AUTO')
  const [depositDisplayMode, setDepositDisplayMode] = useState<'INCLUDED' | 'EXTRA'>('INCLUDED')
  const [previewDisplayIndex, setPreviewDisplayIndex] = useState(1)
  const [manifestDebugOpen, setManifestDebugOpen] = useState(false)

  const [savingRotation, setSavingRotation] = useState(false)
  const [selectedDisplayMode, setSelectedDisplayMode] = useState<DisplayMode>('MENU_DISPLAY')
  const [selectedDisplayTemplate, setSelectedDisplayTemplate] = useState<DisplayTemplate>('MODERN_GRID')
  const [designCategoryFocus, setDesignCategoryFocus] = useState('ALL')
  const [designProductSearch, setDesignProductSearch] = useState('')
  const [enabledFeatureKeys, setEnabledFeatureKeys] = useState<Set<FeatureModuleKey>>(new Set())

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
        const effectiveModules = await getMyEffectiveFeatureModules(tenantId, token)
        const enabledSet = new Set<FeatureModuleKey>(
          effectiveModules.modules.filter((entry) => entry.enabled).map((entry) => entry.key)
        )
        setEnabledFeatureKeys(enabledSet)
        const screens = await getAdminDisplayScreens(token, tenantId)
        setScreenSettingsById(Object.fromEntries(screens.map((entry) => [entry.id, entry])))
        if (!selectedDesignScreenId && screens[0]?.id) {
          setSelectedDesignScreenId(screens[0].id)
        }
        const config = await getScreenConfig()
        setConfigId(config.id)
        setPrimaryColor(config.productNameColor || config.textColor || '#f97316')
        setAccentColor(config.accentColor || '#ec4899')
        setBackgroundMode(inferBackgroundMode(config))
        setBackgroundMediaUrl(config.backgroundMediaUrl || '')
        setShowLogo(Boolean(config.logoUrl))
        setLogoUrl(config.logoUrl || '')
        setHighlightPrice(config.showPrices)
        setShowCategoryOnCard(config.showCategoryOnCard)
        setShowCategoryHeaders(config.showCategoryHeaders)
        setShowIngredients(config.showAllergens)
        setEnableAnimations(config.overlayAnimation !== 'NONE')
        setCardStyle(mapConfigCardStyleToUi(config.cardStyle))
        setFontFamily(config.fontFamily || 'Poppins, sans-serif')
        setPixelPadding(config.cardPadding || 16)
        setDefaultColumnCount(Math.max(1, Math.min(8, config.defaultColumnCount || 2)))
        setTargetWallDisplays(1)
        setIngredientFontSize(Math.max(12, Math.min(32, config.ingredientFontSize || 16)))
        setCategoryFontSize(Math.max(12, Math.min(32, config.categoryFontSize || 16)))
        setPriceFontSize(Math.max(14, Math.min(54, config.priceFontSize || 28)))
        setProductNameFontSize(Math.max(16, Math.min(54, config.productFontSize || 28)))
        setFontSizeMode(config.productFontSize >= 32 ? 'GROSS' : config.productFontSize <= 22 ? 'KLEIN' : 'MITTEL')
        setCardDensity(config.cardPadding <= 12 ? 'KOMPAKT' : config.cardPadding >= 22 ? 'GROSS' : 'KOMFORT')
        setSelectedDisplayTemplate(inferTemplateFromConfig(config))
        const displayDevices = await getScreenDevices()
        const firstDeviceMeta = parseDisplayMetaFromNotes(displayDevices[0]?.notes)
        if (firstDeviceMeta && typeof firstDeviceMeta === 'object') {
          const settings = (firstDeviceMeta.settings ?? {}) as Record<string, unknown>
          if (typeof settings.rotationEnabled === 'boolean') setRotationEnabled(settings.rotationEnabled)
          if (
            typeof settings.targetProductsPerScreen === 'number' &&
            settings.targetProductsPerScreen >= 10 &&
            settings.targetProductsPerScreen <= 60
          ) {
            setTargetProductsPerScreen(Math.trunc(settings.targetProductsPerScreen))
          }
          if (
            settings.layoutMode === 'AUTO' ||
            settings.layoutMode === 'STANDARD' ||
            settings.layoutMode === 'COMPACT' ||
            settings.layoutMode === 'ULTRA_COMPACT'
          ) {
            setLayoutMode(settings.layoutMode)
          }
          if (settings.depositDisplayMode === 'INCLUDED' || settings.depositDisplayMode === 'EXTRA') {
            setDepositDisplayMode(settings.depositDisplayMode)
          }
        }
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
    if (tab === 'devices' || tab === 'geraete') {
      setActiveTab('DEVICES')
    } else if (tab === 'inhalte' || tab === 'content') {
      setActiveTab('CONTENT')
    } else if (tab === 'layout' || tab === 'design') {
      setActiveTab('LAYOUT')
    } else if (tab === 'branding') {
      setActiveTab('BRANDING')
    } else if (tab === 'offline' || tab === 'offline-sync') {
      setActiveTab('OFFLINE_SYNC')
    } else if (tab === 'signage' || tab === 'slides' || tab === 'werbung') {
      setActiveTab('SIGNAGE')
    } else if (tab === 'easy-order') {
      setActiveTab('EASY_ORDER')
    } else if (tab === 'vorschau' || tab === 'preview') {
      setActiveTab('PREVIEW')
    } else if (tab === 'publish' || tab === 'veroeffentlichung') {
      setActiveTab('PUBLISH')
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
  const signageStudioEnabled = enabledFeatureKeys.has('SIGNAGE_STUDIO')

  const selectedScreen = selectedDesignScreenId ? screenSettingsById[selectedDesignScreenId] : null
  const visibleDesignProducts = useMemo(
    () => products.filter((product) => product.screen.showOnScreen),
    [products]
  )
  const filteredDesignProducts = useMemo(() => {
    const searchTerm = designProductSearch.trim().toLowerCase()
    return visibleDesignProducts.filter((product) => {
      const categoryName = product.screen.displayCategory || product.category?.name || 'Allgemein'
      if (designCategoryFocus !== 'ALL' && categoryName !== designCategoryFocus) return false
      if (!searchTerm) return true
      return (
        product.name.toLowerCase().includes(searchTerm) ||
        categoryName.toLowerCase().includes(searchTerm)
      )
    })
  }, [visibleDesignProducts, designCategoryFocus, designProductSearch])

  const workspaceSettings = useMemo(
    () => ({
      layout: {
        selectedDisplayMode,
        selectedDisplayTemplate,
        orientation: selectedScreen?.orientation || 'LANDSCAPE',
        resolutionPreset: selectedScreen?.resolutionPreset || 'FULL_HD',
        defaultColumnCount,
        cardStyle,
        cardDensity,
        productNameFontSize,
        ingredientFontSize,
        categoryFontSize,
        priceFontSize,
        pixelPadding,
        enableAnimations,
        rotationEnabled,
        showCategoryOnCard,
        showCategoryHeaders,
        showIngredients,
        highlightPrice,
        targetWallDisplays,
        targetProductsPerScreen,
        layoutMode,
        depositDisplayMode,
        expertMode,
      },
      branding: {
        primaryColor,
        accentColor,
        backgroundMode,
        backgroundMediaUrl,
        showLogo,
        logoUrl,
        selectedTemplate,
        fontFamily,
        scalePercent,
      },
      content: {
        categoryFocus: designCategoryFocus,
        productSearch: designProductSearch,
        visibleProductCount: visibleDesignProducts.length,
      },
      publish: {
        selectedDesignScreenId,
        selectedDisplayIdForSettings: selectedDeviceIdForSettings,
        manifestDebugOpen,
      },
      sync: {
        menuRotationSeconds,
        promoRotationSeconds,
        rotationEnabled,
      },
      devices: {
        selectedScreenId: selectedDesignScreenId,
      },
    }),
    [
      selectedDisplayMode,
      selectedDisplayTemplate,
      selectedScreen?.orientation,
      selectedScreen?.resolutionPreset,
      defaultColumnCount,
      cardStyle,
      cardDensity,
      productNameFontSize,
      ingredientFontSize,
      categoryFontSize,
      priceFontSize,
      pixelPadding,
      enableAnimations,
      rotationEnabled,
      showCategoryOnCard,
      showCategoryHeaders,
      showIngredients,
      highlightPrice,
      targetWallDisplays,
      targetProductsPerScreen,
      layoutMode,
      depositDisplayMode,
      expertMode,
      primaryColor,
      accentColor,
      backgroundMode,
      backgroundMediaUrl,
      showLogo,
      logoUrl,
      selectedTemplate,
      fontFamily,
      scalePercent,
      designCategoryFocus,
      designProductSearch,
      visibleDesignProducts.length,
      selectedDesignScreenId,
      selectedDeviceIdForSettings,
      manifestDebugOpen,
      menuRotationSeconds,
      promoRotationSeconds,
      rotationEnabled,
    ]
  )

  const previewDistribution = useMemo(() => {
    const totalProducts = visibleDesignProducts.length
    const displayCount = Math.max(1, targetWallDisplays)
    const pageSize = Math.max(1, Math.ceil(totalProducts / displayCount))
    const pageIndex = Math.min(Math.max(1, previewDisplayIndex), displayCount)
    const start = (pageIndex - 1) * pageSize
    const end = Math.min(totalProducts, start + pageSize)
    const products = visibleDesignProducts.slice(start, end)
    return {
      displayCount,
      pageIndex,
      start: start + 1,
      end,
      totalProducts,
      products,
    }
  }, [previewDisplayIndex, targetWallDisplays, visibleDesignProducts])

  const previewProducts = useMemo(() => {
    const pool = filteredDesignProducts.length > 0 ? filteredDesignProducts : visibleDesignProducts
    const maxPerDisplay = Math.max(2, defaultColumnCount * 2)
    const maxVisible = Math.max(2, Math.floor(maxPerDisplay / Math.max(1, targetWallDisplays)))
    return pool.slice(0, maxVisible)
  }, [filteredDesignProducts, visibleDesignProducts, defaultColumnCount, targetWallDisplays])

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
    if (!session?.tenantId) return
    const key = `screen-studio-ui:${session.tenantId}`
    const raw = window.localStorage.getItem(key)
    if (!raw) return
    try {
      const saved = JSON.parse(raw) as {
        targetWallDisplays?: number
        expertMode?: boolean
      }
      if (typeof saved.targetWallDisplays === 'number') {
        setTargetWallDisplays(Math.max(1, Math.min(8, saved.targetWallDisplays)))
      }
      if (typeof saved.expertMode === 'boolean') {
        setExpertMode(saved.expertMode)
      }
    } catch {
      // ignore broken local UI cache
    }
  }, [session?.tenantId])

  useEffect(() => {
    if (!session?.tenantId) return
    const key = `screen-studio-ui:${session.tenantId}`
    window.localStorage.setItem(
      key,
      JSON.stringify({
        targetWallDisplays,
        expertMode,
      })
    )
  }, [session?.tenantId, targetWallDisplays, expertMode])

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

  useEffect(() => {
    if (!selectedDesignScreenId) return
    const screen = screenSettingsById[selectedDesignScreenId]
    if (!screen) return
    setSelectedDisplayMode(mapScreenLayoutToMode(screen.layoutType))
  }, [selectedDesignScreenId, screenSettingsById])

  useEffect(() => {
    if (cardDensity === 'KOMPAKT') {
      setPixelPadding(10)
      return
    }
    if (cardDensity === 'GROSS') {
      setPixelPadding(24)
      return
    }
    setPixelPadding(16)
  }, [cardDensity])

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

  async function handleUpdateProductSettings(
    product: ScreenProduct,
    patch: Partial<{
      displayCategory: string | null
      sortOrder: number
      showOnScreen: boolean
      isFeatured: boolean
      badgeText: string | null
      highlightColor: string | null
    }>
  ) {
    try {
      setUpdatingProductId(product.id)
      setError('')
      const updated = await updateScreenProduct(product.id, patch)
      setProducts((current) => current.map((entry) => (entry.id === product.id ? updated : entry)))
    } catch (updateError) {
      setError(updateError instanceof Error ? updateError.message : 'Produkt konnte nicht gespeichert werden.')
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

  async function handleCreateLayout() {
    if (!session?.tenantId) return
    const name = window.prompt('Name für neues Layout / Bildschirmprofil')
    if (!name || !name.trim()) return
    try {
      setCreatingLayout(true)
      setError('')
      const created = await createAdminDisplayScreen(token, {
        tenantId: session.tenantId,
        name: name.trim(),
        orientation: 'LANDSCAPE',
        resolutionPreset: 'FULL_HD',
        layoutType: 'MENU_BOARD',
        backgroundColor: '#111827',
        accentColor: '#ff6b35',
      })
      setScreenSettingsById((current) => ({ ...current, [created.id]: created }))
      setSelectedDesignScreenId(created.id)
      setSuccess(`Layout "${created.name}" wurde angelegt.`)
    } catch (createError) {
      setError(createError instanceof Error ? createError.message : 'Layout konnte nicht erstellt werden.')
    } finally {
      setCreatingLayout(false)
    }
  }

  async function handleEnableAutoRotation() {
    if (!session?.tenantId || !selectedDesignScreenId) {
      setError('Bitte zuerst einen Bildschirm auswählen.')
      return
    }
    try {
      setSavingRotation(true)
      setError('')
      const tenantId = session.tenantId
      const existingPlaylists = await getAdminDisplayPlaylists(token, tenantId)
      const existingForScreen = existingPlaylists.filter(
        (entry) => entry.screenId === selectedDesignScreenId && entry.isActive
      )
      const playlist =
        existingForScreen[0] ??
        (await createAdminDisplayPlaylist(token, {
          tenantId,
          screenId: selectedDesignScreenId,
          name: `Auto Rotation ${new Date().toLocaleDateString('de-DE')}`,
          isActive: true,
        }))

      await createAdminDisplayPlaylistItem(token, playlist.id, {
        tenantId,
        type: 'PRODUCT_GRID',
        sortOrder: 1,
        durationSeconds: Math.max(8, Math.min(120, menuRotationSeconds)),
        config: {
          title: 'Speisekarte',
          mode: 'MENU',
          wallDisplayCount: Math.max(1, Math.min(8, targetWallDisplays)),
        },
      })
      if (rotationEnabled) {
        await createAdminDisplayPlaylistItem(token, playlist.id, {
          tenantId,
          type: 'PROMOTION',
          sortOrder: 2,
          durationSeconds: Math.max(5, Math.min(60, promoRotationSeconds)),
          config: {
            title: 'Angebote',
            text: 'Unsere Highlights & Aktionen',
          },
        })
      }
      setSuccess(
        rotationEnabled
          ? `Rotation aktiv: ${menuRotationSeconds}s Speisekarte + ${promoRotationSeconds}s Promo · Verteilung auf ${targetWallDisplays} Display(s).`
          : `Rotation deaktiviert: Es wird nur das Menüboard angezeigt · Verteilung auf ${targetWallDisplays} Display(s).`
      )
    } catch (rotationError) {
      setError(
        rotationError instanceof Error
          ? rotationError.message
          : 'Auto-Rotation konnte nicht aktiviert werden.'
      )
    } finally {
      setSavingRotation(false)
    }
  }

  function applyDisplayTemplate(template: DisplayTemplate) {
    setSelectedDisplayTemplate(template)
    if (template === 'MODERN_GRID') {
      setCardStyle('SOFT')
      setCardDensity('KOMFORT')
      setPixelPadding(derivePaddingFromDensity('KOMFORT'))
      setBackgroundMode('VERLAUF')
      setFontSizeMode('MITTEL')
      setProductNameFontSize(28)
      setEnableAnimations(true)
      return
    }
    if (template === 'CLASSIC_MENU') {
      setCardStyle('NONE')
      setCardDensity('KOMPAKT')
      setPixelPadding(derivePaddingFromDensity('KOMPAKT'))
      setBackgroundMode('DUNKEL')
      setFontSizeMode('KLEIN')
      setProductNameFontSize(22)
      setDefaultColumnCount((current) => Math.max(3, current))
      setEnableAnimations(false)
      return
    }
    if (template === 'PROMOTION_HIGHLIGHT') {
      setCardStyle('GLASS')
      setCardDensity('GROSS')
      setPixelPadding(derivePaddingFromDensity('GROSS'))
      setBackgroundMode('VIDEO')
      setFontSizeMode('GROSS')
      setProductNameFontSize(36)
      setHighlightPrice(true)
      setEnableAnimations(true)
      return
    }
    setCardStyle('SOFT')
    setCardDensity('KOMFORT')
    setPixelPadding(derivePaddingFromDensity('KOMFORT'))
    setBackgroundMode('HELL')
    setFontSizeMode('MITTEL')
    setProductNameFontSize(30)
    setShowCategoryOnCard(true)
    setEnableAnimations(true)
  }

  function handleAutoLayoutRecommendation() {
    const screen = selectedScreen
    const orientation = screen?.orientation || 'LANDSCAPE'
    const productCount = Math.max(1, visibleDesignProducts.length)
    const hasManyIngredients = visibleDesignProducts.filter((entry) => entry.ingredients.length > 0).length > productCount * 0.55
    const baseColumns = orientation === 'PORTRAIT' ? 2 : 3
    const densityBoost = productCount > 42 ? 2 : productCount > 24 ? 1 : 0
    const detailPenalty = hasManyIngredients ? -1 : 0
    const recommendedColumns = Math.max(1, Math.min(8, baseColumns + densityBoost + detailPenalty))
    const recommendedNameSize = Math.max(
      18,
      Math.min(40, Math.round((orientation === 'PORTRAIT' ? 28 : 32) - recommendedColumns * 2))
    )
    const recommendedPriceSize = Math.max(16, Math.min(42, recommendedNameSize + 4))
    const recommendedIngredient = Math.max(12, Math.min(26, Math.round(recommendedNameSize * 0.56)))
    const recommendedCategory = Math.max(12, Math.min(24, Math.round(recommendedNameSize * 0.62)))

    setDefaultColumnCount(recommendedColumns)
    setProductNameFontSize(recommendedNameSize)
    setPriceFontSize(recommendedPriceSize)
    setIngredientFontSize(recommendedIngredient)
    setCategoryFontSize(recommendedCategory)
    setCardDensity(recommendedColumns >= 5 ? 'KOMPAKT' : recommendedColumns <= 2 ? 'GROSS' : 'KOMFORT')
    setPixelPadding(recommendedColumns >= 5 ? 12 : recommendedColumns <= 2 ? 20 : 16)
    setSuccess(
      `Auto-Layout gesetzt: ${recommendedColumns} Spalten, Produktgröße ${recommendedNameSize}px, passend für ${productCount} Produkte (${orientation}).`
    )
  }

  async function handleSaveDesign() {
    try {
      setSavingDesign(true)
      setError('')
      const payload: Partial<ScreenConfig> = {
        id: configId || undefined,
        accentColor,
        productNameColor: primaryColor,
        textColor: primaryColor,
        backgroundMode: backgroundMode === 'VIDEO' ? 'VIDEO' : backgroundMode === 'BILD' ? 'IMAGE' : 'COLOR',
        backgroundValue: backgroundMode === 'HELL' ? '#f8fafc' : backgroundMode === 'DUNKEL' ? '#0f172a' : `linear-gradient(135deg, ${primaryColor}, ${accentColor})`,
        backgroundMediaUrl: backgroundMode === 'BILD' || backgroundMode === 'VIDEO' ? backgroundMediaUrl.trim() || null : null,
        showPrices: highlightPrice,
        showAllergens: showIngredients,
        showCategoryHeaders,
        showCategoryOnCard,
        logoUrl: showLogo ? logoUrl.trim() || null : null,
        overlayAnimation: enableAnimations ? 'FLOAT' : 'NONE',
        cardStyle: cardStyle === 'NONE' ? 'MINIMAL' : cardStyle === 'BORDER' ? 'OUTLINE' : cardStyle,
        fontFamily,
        cardPadding: pixelPadding,
        productFontSize: Math.max(16, Math.min(54, productNameFontSize)),
        ingredientFontSize,
        categoryFontSize,
        priceFontSize,
        defaultColumnCount: Math.max(1, Math.min(8, defaultColumnCount)),
      }
      await updateScreenConfig(payload)
      const allScreenDevices = await getScreenDevices()
      await Promise.all(
        allScreenDevices.map((device) =>
          updateScreenDevice(device.id, {
            notes: applyDistributionMetaToNotes(device.notes, {
              displayCount: targetWallDisplays,
              strategy: 'split-products',
              displayGroupId: `tenant-${session?.tenantId || 'default'}`,
            }, {
              rotationEnabled,
              targetProductsPerScreen:
                typeof targetProductsPerScreen === 'number' ? targetProductsPerScreen : null,
              layoutMode,
              depositDisplayMode,
            }),
          })
        )
      )
      if (selectedDesignScreenId && session?.tenantId) {
        const currentScreen = screenSettingsById[selectedDesignScreenId]
        if (currentScreen) {
          const savedScreen = await updateAdminDisplayScreen(token, selectedDesignScreenId, {
            tenantId: session.tenantId,
            name: currentScreen.name,
            orientation: currentScreen.orientation,
            resolutionPreset: currentScreen.resolutionPreset,
            layoutType: mapModeToScreenLayout(selectedDisplayMode),
            isActive: currentScreen.isActive,
            backgroundColor: primaryColor,
            accentColor,
          })
          setScreenSettingsById((current) => ({ ...current, [savedScreen.id]: savedScreen }))
        }
      }
      setSuccess('Design wurde gespeichert.')
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Design konnte nicht gespeichert werden.')
    } finally {
      setSavingDesign(false)
    }
  }

  async function handlePreparedLogoUpload(file: File | null) {
    if (!file) return
    if (!['image/png', 'image/jpeg', 'image/webp'].includes(file.type)) {
      setError('Logo muss als PNG, JPG oder WEBP hochgeladen werden.')
      return
    }
    try {
      const brandColors = await extractBrandColorsFromImage(file)
      setPrimaryColor(brandColors[0] || '#f97316')
      setAccentColor(brandColors[1] || '#ec4899')
      setShowLogo(true)
      setDesignAssistant((current) => ({
        ...current,
        logoFileName: file.name,
        detectedBrandColors: brandColors,
        designAssistantStatus: current.menuFileName ? 'READY_FOR_SUGGESTION' : 'LOGO_UPLOADED',
      }))
      setAssistantNotice('Logo hochgeladen. Markenfarben wurden erkannt und übernommen.')
    } catch {
      setDesignAssistant((current) => ({
        ...current,
        logoFileName: file.name,
        designAssistantStatus: current.menuFileName ? 'READY_FOR_SUGGESTION' : 'LOGO_UPLOADED',
      }))
      setAssistantNotice('Logo hochgeladen. Farben konnten noch nicht automatisch erkannt werden.')
    }
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
    setAssistantNotice('Speisekarte hochgeladen. Designvorschlag ist vorbereitet.')
  }

  return (
    <AdminLayout
      title="Screen Studio"
      subtitle="Zentrale Oberfläche für Inhalte, Design, Geräte und TV-taugliche Vorschau"
    >
      <div className="space-y-4">
        <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-2">
          <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-5">
            {STUDIO_TABS.map((tab) => {
              const isSignageLocked = tab.key === 'SIGNAGE' && !signageStudioEnabled
              return (
              <button
                key={tab.key}
                type="button"
                onClick={() => setActiveTab(tab.key)}
                className={`rounded-xl px-3 py-2 text-sm font-medium transition ${
                  activeTab === tab.key ? 'bg-orange-600 text-white' : 'bg-rose-50 text-rose-900 hover:bg-rose-100'
                }`}
              >
                {tab.label}
                {isSignageLocked ? ' (gesperrt)' : ''}
              </button>
            )})}
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
              <ActionCard title="Display verbinden" text="QR-Code scannen und Gerät zuweisen." href="/admin/screen-studio?tab=devices" />
              <ActionCard title="Design bearbeiten" text="Farben, Schriften und Vorlagen anpassen." onClick={() => setActiveTab('LAYOUT')} />
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
                    <Th>Zutaten</Th>
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
                      <Td>
                        <input
                          value={product.screen.displayCategory || product.category?.name || 'Allgemein'}
                          onChange={(event) =>
                            setProducts((current) =>
                              current.map((entry) =>
                                entry.id === product.id
                                  ? {
                                      ...entry,
                                      screen: {
                                        ...entry.screen,
                                        displayCategory: event.target.value,
                                      },
                                    }
                                  : entry
                              )
                            )
                          }
                          onBlur={(event) =>
                            void handleUpdateProductSettings(product, {
                              displayCategory: event.target.value.trim() || null,
                            })
                          }
                          className="input-ui h-9 min-w-[140px]"
                        />
                      </Td>
                      <Td>
                        <span className="text-xs text-rose-900/75">
                          {product.ingredients.length > 0
                            ? product.ingredients.map((entry) => entry.name).slice(0, 3).join(', ')
                            : '-'}
                        </span>
                      </Td>
                      <Td>{Number(product.price).toFixed(2)} €</Td>
                      <Td>
                        <div className="flex items-center gap-2">
                          <input
                            type="number"
                            value={product.screen.sortOrder}
                            onChange={(event) => {
                              const next = Number(event.target.value) || 0
                              setProducts((current) =>
                                current.map((entry) =>
                                  entry.id === product.id
                                    ? { ...entry, screen: { ...entry.screen, sortOrder: next } }
                                    : entry
                                )
                              )
                            }}
                            onBlur={(event) =>
                              void handleUpdateProductSettings(product, {
                                sortOrder: Math.max(0, Number(event.target.value) || 0),
                              })
                            }
                            className="input-ui h-9 w-24"
                          />
                        </div>
                      </Td>
                      <Td>
                        <button
                          type="button"
                          onClick={() =>
                            void handleUpdateProductSettings(product, {
                              isFeatured: !product.screen.isFeatured,
                            })
                          }
                          disabled={updatingProductId === product.id}
                          className={`rounded-full px-2.5 py-1 text-xs font-semibold ${
                            product.screen.isFeatured ? 'bg-orange-100 text-orange-800' : 'bg-slate-200 text-slate-700'
                          }`}
                        >
                          {product.screen.isFeatured ? 'Ja' : 'Nein'}
                        </button>
                      </Td>
                    </tr>
                  ))}
                  {filteredProducts.length === 0 ? (
                    <tr>
                      <Td colSpan={7}>Keine Produkte gefunden.</Td>
                    </tr>
                  ) : null}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {activeTab === 'LAYOUT' || activeTab === 'BRANDING' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">
              {activeTab === 'BRANDING' ? 'Branding' : 'Layout'}
            </h2>
            <div className="mt-3 max-w-lg">
              <Field label="Bildschirm auswählen">
                <div className="flex gap-2">
                  <select
                    value={selectedDesignScreenId}
                    onChange={(event) => setSelectedDesignScreenId(event.target.value)}
                    className="input-ui"
                  >
                    <option value="">Bitte Bildschirm wählen</option>
                    {Object.values(screenSettingsById).map((screen) => (
                      <option key={screen.id} value={screen.id}>
                        {screen.name}
                      </option>
                    ))}
                  </select>
                  <button
                    type="button"
                    onClick={() => void handleCreateLayout()}
                    disabled={creatingLayout}
                    className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-medium text-slate-800 hover:bg-slate-50 disabled:opacity-60"
                  >
                    {creatingLayout ? 'Erstellt…' : 'Layout anlegen'}
                  </button>
                </div>
              </Field>
            </div>
            {activeTab === 'LAYOUT' ? (
            <div className="mt-3 grid gap-3 rounded-2xl border border-slate-200 bg-slate-50 p-3 lg:grid-cols-2">
              <Field label="Display-Modus">
                <select
                  value={selectedDisplayMode}
                  onChange={(event) => setSelectedDisplayMode(event.target.value as DisplayMode)}
                  className="input-ui"
                >
                  {DISPLAY_MODES.map((mode) => (
                    <option key={mode.id} value={mode.id}>
                      {mode.label}
                    </option>
                  ))}
                </select>
                <p className="mt-1 text-xs text-slate-600">
                  {DISPLAY_MODES.find((entry) => entry.id === selectedDisplayMode)?.help}
                </p>
              </Field>
              <Field label="Display-Vorlage">
                <select
                  value={selectedDisplayTemplate}
                  onChange={(event) => applyDisplayTemplate(event.target.value as DisplayTemplate)}
                  className="input-ui"
                >
                  {DISPLAY_TEMPLATES.map((template) => (
                    <option key={template.id} value={template.id}>
                      {template.label}
                    </option>
                  ))}
                </select>
                <p className="mt-1 text-xs text-slate-600">
                  {DISPLAY_TEMPLATES.find((entry) => entry.id === selectedDisplayTemplate)?.help}
                </p>
              </Field>
              <div className="lg:col-span-2 grid gap-2 sm:grid-cols-3">
                <Field label="Orientation / Ausrichtung">
                  <select
                    value={selectedScreen?.orientation || 'LANDSCAPE'}
                    onChange={(event) => {
                      if (!selectedDesignScreenId) return
                      setScreenSettingsById((current) => {
                        const screen = current[selectedDesignScreenId]
                        if (!screen) return current
                        return {
                          ...current,
                          [selectedDesignScreenId]: { ...screen, orientation: event.target.value as AdminDisplayScreen['orientation'] },
                        }
                      })
                    }}
                    disabled={!selectedDesignScreenId || !selectedScreen}
                    className="input-ui"
                  >
                    <option value="LANDSCAPE">Querformat</option>
                    <option value="PORTRAIT">Hochformat</option>
                  </select>
                </Field>
                <Field label="Auflösung">
                  <select
                    value={selectedScreen?.resolutionPreset || 'FULL_HD'}
                    onChange={(event) => {
                      if (!selectedDesignScreenId) return
                      setScreenSettingsById((current) => {
                        const screen = current[selectedDesignScreenId]
                        if (!screen) return current
                        return {
                          ...current,
                          [selectedDesignScreenId]: { ...screen, resolutionPreset: event.target.value as AdminDisplayScreen['resolutionPreset'] },
                        }
                      })
                    }}
                    disabled={!selectedDesignScreenId || !selectedScreen}
                    className="input-ui"
                  >
                    <option value="HD">HD</option>
                    <option value="FULL_HD">Full HD</option>
                    <option value="FOUR_K">4K</option>
                    <option value="CUSTOM">Custom</option>
                  </select>
                </Field>
                <button
                  type="button"
                  onClick={handleAutoLayoutRecommendation}
                  className="rounded-xl bg-slate-900 px-3 py-2 text-xs font-semibold text-white hover:bg-slate-800"
                >
                  Auto-Layout empfehlen
                </button>
              </div>
            </div>
            ) : null}
            {activeTab === 'LAYOUT' ? (
            <div className="mt-3 rounded-2xl border border-emerald-200 bg-emerald-50 p-3">
              <p className="text-sm font-semibold text-emerald-900">Auto-Rotation wie Menüboard-Ketten</p>
              <p className="mt-1 text-xs text-emerald-800">
                Hier stellst du die Rotation ein: Speisekarte ↔ Promo (z. B. alle 60 Sekunden).
              </p>
              <div className="mt-3 grid gap-2 sm:grid-cols-3">
                <Field label="Rotation aktiv">
                  <select
                    value={rotationEnabled ? 'JA' : 'NEIN'}
                    onChange={(e) => setRotationEnabled(e.target.value === 'JA')}
                    className="input-ui"
                  >
                    <option value="JA">Ja</option>
                    <option value="NEIN">Nein (nur Menüboard)</option>
                  </select>
                </Field>
                <Field label="Speisekarte (Sek.)">
                  <input
                    type="number"
                    value={menuRotationSeconds}
                    onChange={(e) => setMenuRotationSeconds(Number(e.target.value) || 50)}
                    className="input-ui"
                  />
                </Field>
                <Field label="Promo (Sek.)">
                  <input
                    type="number"
                    value={promoRotationSeconds}
                    onChange={(e) => setPromoRotationSeconds(Number(e.target.value) || 10)}
                    disabled={!rotationEnabled}
                    className="input-ui"
                  />
                </Field>
                <div className="flex items-end">
                  <button
                    type="button"
                    onClick={() => void handleEnableAutoRotation()}
                    disabled={savingRotation || !selectedDesignScreenId}
                    className="w-full rounded-xl bg-emerald-700 px-3 py-2 text-sm font-semibold text-white hover:bg-emerald-800 disabled:opacity-60"
                  >
                    {savingRotation ? 'Speichert…' : rotationEnabled ? 'Rotation aktivieren' : 'Nur Menü speichern'}
                  </button>
                </div>
              </div>
              <p className="mt-2 text-xs font-semibold text-emerald-900">
                {rotationEnabled ? 'Status: Rotation aktiv' : 'Status: Rotation deaktiviert (keine Promo-Rotation)'}
              </p>
            </div>
            ) : null}
            {activeTab === 'BRANDING' ? (
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
                    if (designAssistant.suggestedTemplate) {
                      setSelectedTemplate(designAssistant.suggestedTemplate)
                      const preset = TEMPLATE_STYLES[designAssistant.suggestedTemplate]
                      if (preset) {
                        setPrimaryColor(preset.primary)
                        setAccentColor(preset.accent)
                        setBackgroundMode(preset.backgroundMode)
                        setFontSizeMode(preset.font)
                        setCardDensity(preset.density)
                        setEnableAnimations(preset.anim)
                      }
                      setAssistantNotice(`Designvorschlag "${designAssistant.suggestedTemplate}" wurde übernommen.`)
                    } else {
                      setAssistantNotice('Bitte zuerst Logo und Speisekarte hochladen.')
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
                {assistantNotice ||
                  'Design-Assistent aktiv: 1) Logo hochladen 2) Speisekarte hochladen 3) Vorschlag übernehmen und speichern.'}
              </div>
            </div>
            ) : null}
            {activeTab === 'LAYOUT' ? (
            <div className="mt-4 rounded-2xl border border-slate-200 bg-white p-4">
              <div className="flex flex-wrap items-center justify-between gap-2">
                <p className="text-sm font-semibold text-slate-900">Kategorien & Produkte für diesen Bildschirm</p>
                <p className="text-xs text-slate-600">
                  Sichtbar: {visibleDesignProducts.length} · Gefiltert: {filteredDesignProducts.length}
                </p>
              </div>
              <div className="mt-3 grid gap-2 md:grid-cols-3">
                <select value={designCategoryFocus} onChange={(event) => setDesignCategoryFocus(event.target.value)} className="input-ui">
                  <option value="ALL">Alle Kategorien</option>
                  {categories.map((category) => (
                    <option key={category} value={category}>
                      {category}
                    </option>
                  ))}
                </select>
                <input
                  value={designProductSearch}
                  onChange={(event) => setDesignProductSearch(event.target.value)}
                  placeholder="Produkt suchen..."
                  className="input-ui"
                />
                <button
                  type="button"
                  onClick={() => setActiveTab('CONTENT')}
                  className="rounded-xl border border-slate-300 bg-slate-50 px-3 py-2 text-sm font-medium text-slate-800 hover:bg-slate-100"
                >
                  Im Tab „Inhalte“ vollständig bearbeiten
                </button>
              </div>
              <div className="mt-3 max-h-56 overflow-auto rounded-xl border border-slate-200">
                {filteredDesignProducts.slice(0, 30).map((product) => (
                  <div key={product.id} className="flex items-center justify-between border-b border-slate-100 px-3 py-2 text-sm last:border-b-0">
                    <div className="min-w-0">
                      <p className="truncate font-medium text-slate-900">{product.name}</p>
                      <p className="truncate text-xs text-slate-600">{product.screen.displayCategory || product.category?.name || 'Allgemein'}</p>
                    </div>
                    <button
                      type="button"
                      onClick={() => void handleToggleProductVisibility(product, !product.screen.showOnScreen)}
                      className={`rounded-full px-2.5 py-1 text-xs font-semibold ${
                        product.screen.showOnScreen ? 'bg-emerald-100 text-emerald-800' : 'bg-slate-200 text-slate-700'
                      }`}
                    >
                      {product.screen.showOnScreen ? 'Sichtbar' : 'Aus'}
                    </button>
                  </div>
                ))}
                {filteredDesignProducts.length === 0 ? (
                  <p className="px-3 py-4 text-sm text-slate-600">Keine Produkte für den Filter gefunden.</p>
                ) : null}
              </div>
            </div>
            ) : null}
            {activeTab === 'LAYOUT' ? (
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
                        setProductNameFontSize(preset.font === 'KLEIN' ? 20 : preset.font === 'GROSS' ? 34 : 28)
                        setCardDensity(preset.density)
                        setPixelPadding(derivePaddingFromDensity(preset.density))
                        setCardStyle(preset.density === 'KOMPAKT' ? 'NONE' : 'SOFT')
                        setEnableAnimations(preset.anim)
                        if (template === 'Klarando Modern') setSelectedDisplayTemplate('MODERN_GRID')
                        if (template === 'Klassische Preistafel') setSelectedDisplayTemplate('CLASSIC_MENU')
                        if (template === 'Tagesangebot') setSelectedDisplayTemplate('PROMOTION_HIGHLIGHT')
                        if (template === 'Burger') setSelectedDisplayTemplate('TOUCH_KIOSK_PREVIEW')
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
                    ...buildPreviewBackground(backgroundMode, primaryColor, accentColor, backgroundMediaUrl),
                    padding: `${pixelPadding}px`,
                    fontFamily,
                    transform: `scale(${scalePercent / 100})`,
                    transformOrigin: 'top left',
                  }}
                >
                  <p className="text-xs uppercase">{selectedTemplate}</p>
                  <p className="mt-1 text-lg font-bold">Menüvorschau · {defaultColumnCount} Spalten</p>
                  {showLogo ? (
                    <div className="mt-2 inline-flex items-center rounded-md bg-white/20 px-2 py-1 text-[10px] font-semibold uppercase tracking-wide">
                      KLARANDO LOGO
                    </div>
                  ) : null}
                  {showCategoryHeaders ? (
                    <p
                      className="mt-3 font-semibold uppercase tracking-wide opacity-85"
                      style={{ fontSize: `${Math.max(10, Math.min(28, categoryFontSize * 0.72))}px` }}
                    >
                      Empfohlene Kategorie
                    </p>
                  ) : null}
                  <div
                    className="mt-3 grid gap-2"
                    style={{
                      gridTemplateColumns: `repeat(${Math.max(1, Math.min(8, defaultColumnCount))}, minmax(0, 1fr))`,
                    }}
                  >
                    {previewProducts.map((product, index) => (
                      <div
                        key={product.id}
                        className={`${cardStyle === 'NONE' ? '' : 'rounded-lg'} p-2`}
                        style={{
                          background: cardStyle === 'NONE' ? 'transparent' : 'rgba(0,0,0,0.25)',
                          border: cardStyle === 'BORDER' ? `1px solid ${accentColor}` : undefined,
                          backdropFilter: cardStyle === 'GLASS' ? 'blur(4px)' : undefined,
                          padding: deriveCardPadding(pixelPadding),
                        }}
                      >
                        <p style={{ fontSize: `${Math.max(12, Math.min(34, productNameFontSize * 0.55))}px` }}>
                          {product.name}
                        </p>
                        {showCategoryOnCard ? (
                          <p style={{ fontSize: `${Math.max(10, Math.min(24, categoryFontSize * 0.6))}px` }} className="opacity-80">
                            {product.screen.displayCategory || product.category?.name || 'Kategorie'}
                          </p>
                        ) : null}
                        {highlightPrice ? (
                          <p style={{ fontSize: `${Math.max(11, Math.min(28, priceFontSize * 0.6))}px` }} className="font-semibold">
                            {`${product.price} €`}
                          </p>
                        ) : null}
                        {showIngredients ? (
                          <p style={{ fontSize: `${Math.max(10, Math.min(20, ingredientFontSize * 0.6))}px` }} className="opacity-75">
                            {product.ingredients.slice(0, 4).map((entry) => entry.name).join(', ') || 'Zutaten'}
                          </p>
                        ) : null}
                      </div>
                    ))}
                  </div>
                  {(backgroundMode === 'BILD' || backgroundMode === 'VIDEO') && !backgroundMediaUrl.trim() ? (
                    <p className="mt-3 rounded-md border border-amber-200 bg-amber-50 px-2 py-1 text-xs text-amber-900">
                      Hintergrund ist auf {backgroundMode === 'VIDEO' ? 'Video' : 'Bild'} gestellt, aber es fehlt eine URL.
                    </p>
                  ) : null}
                </div>
                <div className="mt-3 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
                  Vorschau zeigt Farben, Kartenstil, Spalten, Zutaten/Kategorien und Produktzahl pro Display live.
                </div>
              </div>
            </div>
            ) : null}
            {activeTab === 'BRANDING' ? (
            <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
              <div className="md:col-span-2 xl:col-span-4">
                <p className="text-xs font-semibold uppercase tracking-wide text-slate-600">Farben & Branding</p>
              </div>
              <Field label="Hauptfarbe"><input type="color" value={primaryColor} onChange={(e) => setPrimaryColor(e.target.value)} className="input-ui h-10" /></Field>
              <Field label="Akzentfarbe"><input type="color" value={accentColor} onChange={(e) => setAccentColor(e.target.value)} className="input-ui h-10" /></Field>
              <Field label="Hintergrund">
                <select value={backgroundMode} onChange={(e) => setBackgroundMode(e.target.value as typeof backgroundMode)} className="input-ui">
                  <option value="HELL">Hell</option>
                  <option value="DUNKEL">Dunkel</option>
                  <option value="VERLAUF">Verlauf</option>
                  <option value="BILD">Bild</option>
                  <option value="VIDEO">Video</option>
                </select>
              </Field>
              <Field label="Video-/Bild-URL (Hintergrund)">
                <input
                  value={backgroundMediaUrl}
                  onChange={(e) => setBackgroundMediaUrl(e.target.value)}
                  placeholder="https://.../background.mp4"
                  className="input-ui"
                />
              </Field>
              <div className="md:col-span-2 xl:col-span-4 mt-2">
                <p className="text-xs font-semibold uppercase tracking-wide text-slate-600">Produktdarstellung</p>
              </div>
              <Field label="Schriftgröße">
                <select
                  value={fontSizeMode}
                  onChange={(e) => {
                    const mode = e.target.value as FontSizeMode
                    setFontSizeMode(mode)
                    setProductNameFontSize(mode === 'KLEIN' ? 20 : mode === 'GROSS' ? 34 : 28)
                  }}
                  className="input-ui"
                >
                  <option value="KLEIN">Klein</option>
                  <option value="MITTEL">Mittel</option>
                  <option value="GROSS">Groß</option>
                </select>
              </Field>
              <Field label="Produktname Schriftgröße (px)">
                <input
                  type="number"
                  value={productNameFontSize}
                  onChange={(e) => setProductNameFontSize(Math.max(16, Math.min(54, Number(e.target.value) || 28)))}
                  className="input-ui"
                />
              </Field>
              <Field label="Produktkarten">
                <select
                  value={cardDensity}
                  onChange={(e) => {
                    const density = e.target.value as CardDensity
                    setCardDensity(density)
                    setPixelPadding(derivePaddingFromDensity(density))
                  }}
                  className="input-ui"
                >
                  <option value="KOMPAKT">Kompakt</option>
                  <option value="KOMFORT">Komfort</option>
                  <option value="GROSS">Groß</option>
                </select>
              </Field>
              <Field label="Rahmenstil Produkte">
                <select value={cardStyle} onChange={(e) => setCardStyle(e.target.value as typeof cardStyle)} className="input-ui">
                  <option value="SOFT">Soft (mit Rahmen)</option>
                  <option value="GLASS">Glas</option>
                  <option value="BORDER">Rahmen deutlich</option>
                  <option value="NONE">Ohne Rahmen</option>
                </select>
              </Field>
              <Field label="Logo anzeigen">
                <select value={showLogo ? 'JA' : 'NEIN'} onChange={(e) => setShowLogo(e.target.value === 'JA')} className="input-ui">
                  <option value="JA">Ja</option>
                  <option value="NEIN">Nein</option>
                </select>
              </Field>
              <Field label="Logo-URL">
                <input
                  value={logoUrl}
                  onChange={(e) => setLogoUrl(e.target.value)}
                  placeholder="https://.../logo.png"
                  className="input-ui"
                />
              </Field>
              <Field label="Preis hervorheben">
                <select value={highlightPrice ? 'JA' : 'NEIN'} onChange={(e) => setHighlightPrice(e.target.value === 'JA')} className="input-ui">
                  <option value="JA">Ja</option>
                  <option value="NEIN">Nein</option>
                </select>
              </Field>
              <Field label="Kategorie auf Produktkarte">
                <select value={showCategoryOnCard ? 'JA' : 'NEIN'} onChange={(e) => setShowCategoryOnCard(e.target.value === 'JA')} className="input-ui">
                  <option value="JA">Ja</option>
                  <option value="NEIN">Nein</option>
                </select>
              </Field>
              <Field label="Kategorien als Überschrift">
                <select value={showCategoryHeaders ? 'JA' : 'NEIN'} onChange={(e) => setShowCategoryHeaders(e.target.value === 'JA')} className="input-ui">
                  <option value="JA">Ja</option>
                  <option value="NEIN">Nein</option>
                </select>
              </Field>
              <Field label="Zutaten anzeigen">
                <select value={showIngredients ? 'JA' : 'NEIN'} onChange={(e) => setShowIngredients(e.target.value === 'JA')} className="input-ui">
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
            </div>
            ) : null}
            {activeTab === 'LAYOUT' ? (
            <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
              <div className="md:col-span-2 xl:col-span-4 mt-2">
                <p className="text-xs font-semibold uppercase tracking-wide text-slate-600">Layout & Timing</p>
              </div>
              <Field label="Spalten pro Bildschirm">
                <select
                  value={String(defaultColumnCount)}
                  onChange={(e) => setDefaultColumnCount(Number(e.target.value))}
                  className="input-ui"
                >
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                </select>
              </Field>
              <Field label="Ziel: Produktmenge auf Displays">
                <select value={String(targetWallDisplays)} onChange={(e) => setTargetWallDisplays(Number(e.target.value))} className="input-ui">
                  <option value="1">1 Display</option>
                  <option value="2">2 Displays</option>
                  <option value="3">3 Displays</option>
                  <option value="4">4 Displays</option>
                  <option value="5">5 Displays</option>
                  <option value="6">6 Displays</option>
                  <option value="7">7 Displays</option>
                  <option value="8">8 Displays</option>
                </select>
                <p className="mt-1 text-xs text-slate-500">Wird in der Auto-Rotation für Wand-Setups genutzt.</p>
              </Field>
              <Field label="Ziel: Anzahl Produkte pro Bildschirm">
                <select
                  value={String(targetProductsPerScreen)}
                  onChange={(e) =>
                    setTargetProductsPerScreen(e.target.value === 'AUTO' ? 'AUTO' : Number(e.target.value))
                  }
                  className="input-ui"
                >
                  <option value="AUTO">Auto</option>
                  <option value="10">10</option>
                  <option value="20">20</option>
                  <option value="30">30</option>
                  <option value="40">40</option>
                  <option value="50">50</option>
                  <option value="60">60</option>
                </select>
              </Field>
              <Field label="Layout-Modus">
                <select value={layoutMode} onChange={(e) => setLayoutMode(e.target.value as typeof layoutMode)} className="input-ui">
                  <option value="AUTO">Automatisch</option>
                  <option value="STANDARD">Standard</option>
                  <option value="COMPACT">Kompakt</option>
                  <option value="ULTRA_COMPACT">Ultra-Kompakt (bis 60)</option>
                </select>
              </Field>
              <Field label="Pfandanzeige">
                <select
                  value={depositDisplayMode}
                  onChange={(e) => setDepositDisplayMode(e.target.value as typeof depositDisplayMode)}
                  className="input-ui"
                >
                  <option value="INCLUDED">Preis inkl. Pfand</option>
                  <option value="EXTRA">Preis zzgl. Pfand</option>
                </select>
              </Field>
              <Field label="Expertenmodus">
                <select value={expertMode ? 'AKTIV' : 'INAKTIV'} onChange={(e) => setExpertMode(e.target.value === 'AKTIV')} className="input-ui">
                  <option value="INAKTIV">Inaktiv</option>
                  <option value="AKTIV">Aktiv</option>
                </select>
                <p className="mt-1 text-xs text-slate-500">Schaltet erweiterte Felder frei. Kein eigener Runtime-Schalter.</p>
              </Field>
            </div>
            ) : null}
            {activeTab === 'LAYOUT' && expertMode ? (
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
                <Field label="Zutaten Schriftgröße">
                  <input type="number" value={ingredientFontSize} onChange={(e) => setIngredientFontSize(Math.max(12, Math.min(32, Number(e.target.value) || 16)))} className="input-ui" />
                </Field>
                <Field label="Kategorie Schriftgröße">
                  <input type="number" value={categoryFontSize} onChange={(e) => setCategoryFontSize(Math.max(12, Math.min(32, Number(e.target.value) || 16)))} className="input-ui" />
                </Field>
                <Field label="Preis Schriftgröße">
                  <input type="number" value={priceFontSize} onChange={(e) => setPriceFontSize(Math.max(14, Math.min(54, Number(e.target.value) || 28)))} className="input-ui" />
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
                {savingDesign ? 'Speichert…' : activeTab === 'BRANDING' ? 'Branding speichern' : 'Layout speichern'}
              </button>
            </div>
          </section>
        ) : null}

        {activeTab === 'PUBLISH' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Veröffentlichung</h2>
            <p className="mt-2 text-sm text-rose-900/80">
              Dieser Bereich steuert ausschließlich Manifest-Generierung, Versionierung und Rollout.
            </p>
            <div className="mt-4 grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
              <StatCard label="Aktive Version" value={rows[0]?.lastSyncAt ? new Date(rows[0].lastSyncAt).toISOString() : '-'} />
              <StatCard label="Letzter Publish" value={success ? 'Gerade aktualisiert' : 'Noch offen'} />
              <StatCard label="Geräte mit Sync" value={`${rows.filter((row) => row.status === 'online').length}/${rows.length}`} />
              <StatCard label="Manifest-Zustand" value={selectedDesignScreenId ? 'Bereit' : 'Bildschirm wählen'} />
            </div>
            <div className="mt-4 rounded-xl border border-slate-200 bg-slate-50 p-3">
              <p className="text-xs font-semibold uppercase tracking-wide text-slate-600">Manifest-Vorschau (Struktur vorbereitet)</p>
              <button
                type="button"
                onClick={() => setManifestDebugOpen((current) => !current)}
                className="mt-2 rounded-lg border border-slate-300 bg-white px-3 py-1.5 text-xs font-semibold text-slate-700 hover:bg-slate-100"
              >
                {manifestDebugOpen ? 'Manifest ausblenden' : 'Manifest anzeigen'}
              </button>
              {manifestDebugOpen ? (
                <pre className="mt-2 max-h-64 overflow-auto rounded-lg bg-slate-950 p-3 text-[11px] text-emerald-200">
{JSON.stringify({
  showCategories: showCategoryHeaders || showCategoryOnCard,
  showIngredients,
  displayCount: targetWallDisplays,
  currentDisplayIndex: previewDistribution.pageIndex,
  productsInThisDisplay: previewDistribution.products.length,
  totalProducts: previewDistribution.totalProducts,
  settings: workspaceSettings,
}, null, 2)}
                </pre>
              ) : null}
            </div>
            <div className="mt-4 flex flex-wrap gap-2">
              <button
                type="button"
                onClick={() => void handleSaveDesign()}
                disabled={savingDesign}
                className="rounded-xl bg-orange-600 px-5 py-2 text-sm font-semibold text-white hover:bg-orange-700 disabled:opacity-60"
              >
                {savingDesign ? 'Veröffentlicht…' : 'Manifest generieren & veröffentlichen'}
              </button>
              <button
                type="button"
                disabled
                className="rounded-xl border border-slate-300 bg-slate-100 px-5 py-2 text-sm font-semibold text-slate-500"
                title="Rollback wird in einem nächsten Schritt angebunden."
              >
                Rollback (in Vorbereitung)
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
                  <p className="text-xs text-rose-900/75">Letzter Sync: {row.lastSyncAt ? new Date(row.lastSyncAt).toLocaleString('de-DE') : '-'}</p>
                  <p className="text-xs text-rose-900/75">Veröffentlichte Version: {row.lastSyncAt ? new Date(row.lastSyncAt).toISOString() : '-'}</p>
                  <p className="text-xs text-rose-900/75">Gecachte Version: {row.lastSyncAt ? new Date(row.lastSyncAt).toISOString() : '-'}</p>
                  <p className="text-xs text-rose-900/75">Erkannte Auflösung: {row.resolution || 'Wird erkannt'}</p>
                  <p className="text-xs text-rose-900/75">App-Version: {row.deviceInfo?.appVersion || '-'}</p>
                  <p className="text-xs text-rose-900/75">
                    Empfohlene Datei: {row.deviceInfo?.diagnostics?.recommendedResolution || '1920x1080 (16:9)'}
                  </p>
                  <p className="text-xs text-rose-900/75">
                    Geschätzte Wiedergabeleistung: {row.deviceInfo?.diagnostics?.estimatedPerformanceClass || 'MEDIUM'}
                  </p>
                  <p className="text-xs text-rose-900/75">
                    Touch: {row.deviceInfo?.diagnostics?.touchSupported === null || row.deviceInfo?.diagnostics?.touchSupported === undefined ? '-' : row.deviceInfo?.diagnostics?.touchSupported ? 'Ja' : 'Nein'} ·
                    Fullscreen: {row.deviceInfo?.diagnostics?.fullscreenSupported === null || row.deviceInfo?.diagnostics?.fullscreenSupported === undefined ? '-' : row.deviceInfo?.diagnostics?.fullscreenSupported ? 'Ja' : 'Nein'}
                  </p>
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

        {activeTab === 'OFFLINE_SYNC' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Offline & Sync</h2>
            <p className="mt-2 text-sm text-slate-700">
              Offline-First ist aktiv: Displays nutzen den letzten gültigen Snapshot und synchronisieren nach Wiederverbindung.
            </p>
            <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
              <StatCard label="Verbundene Geräte" value={rows.length} />
              <StatCard label="Online" value={stats.online} />
              <StatCard label="Letzter Sync" value={stats.latestSync ? new Date(stats.latestSync).toLocaleString('de-DE') : '-'} />
              <StatCard label="Offline Queue" value="Vorbereitet" />
            </div>
            <div className="mt-4 grid gap-3 rounded-xl border border-slate-200 bg-slate-50 p-3 md:grid-cols-2">
              <Field label="Sync-Intervall (Sekunden)">
                <input
                  value="Automatisch pro Gerät"
                  disabled
                  className="input-ui bg-slate-100 text-slate-500"
                />
              </Field>
              <Field label="Offline Ordering Enabled">
                <select disabled className="input-ui bg-slate-100 text-slate-500" value="IN_VORBEREITUNG" onChange={() => undefined}>
                  <option value="IN_VORBEREITUNG">In Vorbereitung</option>
                </select>
              </Field>
              <Field label="Queue-Sync bei Wiederverbindung">
                <select disabled className="input-ui bg-slate-100 text-slate-500" value="IN_VORBEREITUNG" onChange={() => undefined}>
                  <option value="IN_VORBEREITUNG">In Vorbereitung</option>
                </select>
              </Field>
              <Field label="Fallback-Screen bei leerem Cache">
                <select disabled className="input-ui bg-slate-100 text-slate-500" value="IN_VORBEREITUNG" onChange={() => undefined}>
                  <option value="IN_VORBEREITUNG">In Vorbereitung</option>
                </select>
              </Field>
            </div>
            <div className="mt-4 rounded-xl border border-amber-200 bg-amber-50 px-3 py-3 text-sm text-amber-900">
              Easy-Order Offline Queue, Bestell-Sync und Konfliktauflösung sind vorbereitet und werden im nächsten Schritt erweitert.
            </div>
          </section>
        ) : null}

        {activeTab === 'SIGNAGE' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Slides & Werbung</h2>
            {!signageStudioEnabled ? (
              <div className="mt-3 rounded-xl border border-amber-200 bg-amber-50 px-3 py-3 text-sm text-amber-900">
                Dieses Modul ist nicht freigeschaltet. Bitte im Superadmin unter Modulfreigabe/Billing
                das Modul <strong>Klarando Signage Studio</strong> aktivieren.
              </div>
            ) : (
              <>
                <p className="mt-2 text-sm text-slate-700">
                  Signage Studio ist vorbereitet: Playlists, Slide-Typen und Runtime-Anbindung laufen über das bestehende Display-System.
                </p>
                <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-3">
                  <StatCard label="Playlists" value="Vorbereitet" />
                  <StatCard label="Slide-Typen" value="Bild, Video, Produkt, Promo, QR, Text" />
                  <StatCard label="Offline Cache" value="Aktivierbar" />
                </div>
                <div className="mt-4 grid gap-3 rounded-xl border border-slate-200 bg-slate-50 p-3 md:grid-cols-2">
                  <Field label="Rotation">
                    <select className="input-ui" disabled value="SEQUENTIAL" onChange={() => undefined}>
                      <option value="SEQUENTIAL">Sequenziell (in Vorbereitung)</option>
                    </select>
                  </Field>
                  <Field label="Übergang">
                    <select className="input-ui" disabled value="FADE" onChange={() => undefined}>
                      <option value="FADE">Fade (in Vorbereitung)</option>
                    </select>
                  </Field>
                  <Field label="Standarddauer je Slide">
                    <input className="input-ui bg-slate-100 text-slate-500" value="12 Sekunden (in Vorbereitung)" disabled />
                  </Field>
                  <Field label="Offline-Mediencache">
                    <select className="input-ui bg-slate-100 text-slate-500" value="AKTIVIERBAR" disabled onChange={() => undefined}>
                      <option value="AKTIVIERBAR">Aktivierbar</option>
                    </select>
                  </Field>
                </div>
              </>
            )}
          </section>
        ) : null}

        {activeTab === 'EASY_ORDER' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Easy Order Vorbereitung</h2>
            <p className="mt-2 text-sm text-slate-700">
              Dieser Bereich ist für den späteren Touch-Checkout vorbereitet. Aktuell bleiben die Optionen bewusst deaktiviert.
            </p>
            <div className="mt-4 grid gap-3 md:grid-cols-2">
              <Field label="Touch-Modus">
                <select disabled className="input-ui bg-slate-100 text-slate-500" value="IN_VORBEREITUNG" onChange={() => undefined}>
                  <option value="IN_VORBEREITUNG">In Vorbereitung</option>
                </select>
              </Field>
              <Field label="Warenkorb-Modus">
                <select disabled className="input-ui bg-slate-100 text-slate-500" value="IN_VORBEREITUNG" onChange={() => undefined}>
                  <option value="IN_VORBEREITUNG">In Vorbereitung</option>
                </select>
              </Field>
              <Field label="Offline-Bestellungen erlauben">
                <select disabled className="input-ui bg-slate-100 text-slate-500" value="IN_VORBEREITUNG" onChange={() => undefined}>
                  <option value="IN_VORBEREITUNG">In Vorbereitung</option>
                </select>
              </Field>
              <Field label="Tischmodus / Bestellnummernmodus">
                <select disabled className="input-ui bg-slate-100 text-slate-500" value="IN_VORBEREITUNG" onChange={() => undefined}>
                  <option value="IN_VORBEREITUNG">In Vorbereitung</option>
                </select>
              </Field>
            </div>
            <div className="mt-4 rounded-xl border border-amber-200 bg-amber-50 px-3 py-3 text-sm text-amber-900">
              In Vorbereitung: Runtime-Anbindung für Checkout, lokale Queue-Synchronisierung und Kassen-Übergabe.
            </div>
          </section>
        ) : null}

        {activeTab === 'PREVIEW' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Vorschau</h2>
            <div className="mt-3 grid gap-3 md:grid-cols-3">
              <Field label="Display-Ansicht">
                <select
                  value={String(previewDisplayIndex)}
                  onChange={(event) => setPreviewDisplayIndex(Number(event.target.value))}
                  className="input-ui"
                >
                  {Array.from({ length: Math.max(1, targetWallDisplays) }).map((_, index) => (
                    <option key={`preview-display-${index + 1}`} value={index + 1}>
                      Display {index + 1} von {Math.max(1, targetWallDisplays)}
                    </option>
                  ))}
                </select>
              </Field>
              <div className="md:col-span-2 rounded-xl border border-slate-200 bg-slate-50 px-3 py-3 text-sm text-slate-700">
                Display {previewDistribution.pageIndex} von {previewDistribution.displayCount} · Produkte{' '}
                {previewDistribution.totalProducts === 0 ? 0 : previewDistribution.start}–{previewDistribution.end} von{' '}
                {previewDistribution.totalProducts}
              </div>
            </div>
            <div className="mt-3 rounded-xl border border-slate-200 bg-slate-50 px-3 py-3 text-sm text-slate-700">
              Aktive Vorschau: {selectedDisplayTemplate} · {defaultColumnCount} Spalten · {previewProducts.length} Produkte je Display ·
              {showIngredients ? ' Zutaten an' : ' Zutaten aus'} · {showCategoryHeaders ? ' Kategorien als Überschrift' : ' Keine Kategorieüberschrift'}
            </div>
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
            <div className="mt-4 rounded-xl border border-slate-200 bg-white p-3">
              <p className="text-xs font-semibold uppercase tracking-wide text-slate-600">Produkte dieser Display-Ansicht</p>
              <ul className="mt-2 max-h-40 space-y-1 overflow-auto text-sm text-slate-800">
                {previewDistribution.products.map((product) => (
                  <li key={`preview-product-${product.id}`} className="rounded-md bg-slate-50 px-2 py-1">
                    {product.name} · {product.screen.displayCategory || product.category?.name || 'Allgemein'}
                  </li>
                ))}
                {previewDistribution.products.length === 0 ? (
                  <li className="text-slate-500">Keine Produkte in dieser Verteilung.</li>
                ) : null}
              </ul>
            </div>
            <p className="mt-4 text-xs text-slate-500">Die Live-Vorschau im Layout-Tab verwendet dieselbe State-Konfiguration wie diese Kapazitätsvorschau.</p>
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
