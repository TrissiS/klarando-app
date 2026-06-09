import { useEffect, useMemo, useState } from 'react'
import {
  ActivityIndicator,
  Image,
  Modal,
  SafeAreaView,
  ScrollView,
  StyleSheet,
  Switch,
  Text,
  TextInput,
  TouchableOpacity,
  View,
} from 'react-native'
import * as Location from 'expo-location'
import {
  createCheckoutOrder,
  discoverTenants,
  fetchAppCustomerMe,
  fetchTenantCatalog,
  getLastCatalogRequestDiagnostics,
  loginAppCustomer,
  registerAppCustomer,
  requestAppCustomerDeletion,
} from './src/api'
import { DEFAULT_API_BASE_URL } from './src/config'
import {
  clearStoredAppAuthToken,
  readStoredApiBaseUrl,
  readStoredAppAuthToken,
  writeStoredApiBaseUrl,
  writeStoredAppAuthToken,
} from './src/storage'
import type {
  AppCustomerUser,
  CatalogRequestDiagnostics,
  CatalogProduct,
  CheckoutCreateOrderResponse,
  CheckoutPaymentMethod,
  DiscoveryTenant,
  TenantCatalogResponse,
} from './src/types'

type AppTab = 'START' | 'ORDER' | 'MY_ORDERS' | 'PROFILE' | 'INFO'
const INPUT_PLACEHOLDER_COLOR = '#64748b'
const KLARANDO_FAVICON = require('./src/assets/klarando_favicon_128.png')

type CartItem = {
  id: string
  productId: string
  productName: string
  quantity: number
  basePrice: number
  modifierIds: string[]
  modifierText: string
}

type LocalOrderHistoryEntry = {
  id: string
  tenantName: string
  mode: 'delivery' | 'pickup'
  paymentMethod: CheckoutPaymentMethod
  total: number
  createdAt: string
}

type ProductModifierGroup = {
  key: string
  label: string
  required: boolean
  selectionMode: 'single' | 'multi'
  modifiers: CatalogProduct['modifiers']
}

function parseEuroValue(value: string) {
  const parsed = Number(value.trim().replace(',', '.').replace(/[^\d.-]/g, ''))
  return Number.isFinite(parsed) ? parsed : 0
}

function formatEuro(value: number) {
  const normalized = Number.isFinite(value) ? value : 0
  try {
    return new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'EUR' }).format(normalized)
  } catch {
    return `${normalized.toFixed(2).replace('.', ',')} EUR`
  }
}

function formatDateTime(value: string) {
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) {
    return value
  }
  return parsed.toLocaleString('de-DE')
}

function formatAddress(parts: {
  street: string | null
  zipCode: string | null
  city: string | null
}) {
  const lineOne = parts.street?.trim() || ''
  const lineTwo = [parts.zipCode?.trim() || '', parts.city?.trim() || ''].filter(Boolean).join(' ')
  return [lineOne, lineTwo].filter(Boolean).join(', ')
}

function formatBeverageContainerType(value: CatalogProduct['beverageContainerType']) {
  if (value === 'EINWEG') {
    return 'Einweg'
  }
  if (value === 'MEHRWEG') {
    return 'Mehrweg'
  }
  return null
}

function isSizeModifier(modifier: CatalogProduct['modifiers'][number]) {
  if (modifier.kind === 'SIZE') {
    return true
  }

  const label = `${modifier.ingredientName || ''} ${modifier.name || ''}`.toLowerCase()
  return label.includes('groesse') || label.includes('größe') || label.includes('size')
}

function deriveModifierGroups(modifiers: CatalogProduct['modifiers']): ProductModifierGroup[] {
  const sizeModifiers = modifiers.filter(isSizeModifier)
  const nonSizeModifiers = modifiers.filter((modifier) => !isSizeModifier(modifier))
  const groupsByKey = new Map<
    string,
    {
      key: string
      label: string
      modifiers: CatalogProduct['modifiers']
    }
  >()

  nonSizeModifiers.forEach((modifier) => {
    const key = modifier.ingredientId?.trim() || 'extras'
    const label = modifier.ingredientName?.trim() || 'Extras'
    const existing = groupsByKey.get(key)
    if (existing) {
      existing.modifiers.push(modifier)
      return
    }

    groupsByKey.set(key, {
      key,
      label,
      modifiers: [modifier],
    })
  })

  const grouped = Array.from(groupsByKey.values()).map((group) => {
    const normalizedLabel = group.label.toLowerCase()
    const hasRequiredKeyword =
      normalizedLabel.includes('pflicht') ||
      normalizedLabel.includes('sauce') ||
      normalizedLabel.includes('brot') ||
      normalizedLabel.includes('basis') ||
      normalizedLabel.includes('groesse') ||
      normalizedLabel.includes('größe') ||
      normalizedLabel.includes('teig') ||
      normalizedLabel.includes('wahl')

    return {
      key: group.key,
      label: group.label,
      required: hasRequiredKeyword,
      selectionMode: 'single',
      modifiers: [...group.modifiers].sort((a, b) => a.sortOrder - b.sortOrder),
    }
  })

  if (sizeModifiers.length > 0) {
    grouped.unshift({
      key: 'size',
      label: 'Groesse',
      required: true,
      selectionMode: 'single',
      modifiers: [...sizeModifiers].sort((a, b) => a.sortOrder - b.sortOrder),
    })
  }

  return grouped
}

export default function App() {
  const [currentTab, setCurrentTab] = useState<AppTab>('START')
  const [apiBaseUrl, setApiBaseUrl] = useState(DEFAULT_API_BASE_URL)
  const [zipCode, setZipCode] = useState('')
  const [street, setStreet] = useState('')
  const [useLocation, setUseLocation] = useState(false)
  const [location, setLocation] = useState<{ latitude: number; longitude: number } | null>(null)
  const [loading, setLoading] = useState(false)
  const [loadingCatalog, setLoadingCatalog] = useState(false)
  const [error, setError] = useState('')
  const [notice, setNotice] = useState('')
  const [results, setResults] = useState<DiscoveryTenant[]>([])
  const [selectedTenant, setSelectedTenant] = useState<DiscoveryTenant | null>(null)
  const [catalog, setCatalog] = useState<TenantCatalogResponse | null>(null)
  const [catalogDiagnostics, setCatalogDiagnostics] = useState<CatalogRequestDiagnostics>({
    tenantId: null,
    tenantSlug: null,
    catalogUrl: null,
    catalogStatus: null,
    catalogError: null,
    responsePreview: null,
  })
  const [activeOrderMode, setActiveOrderMode] = useState<'delivery' | 'pickup' | null>(null)
  const [cartItems, setCartItems] = useState<CartItem[]>([])
  const [checkoutPaymentMethod, setCheckoutPaymentMethod] = useState<CheckoutPaymentMethod>('CARD')
  const [checkoutSubmitting, setCheckoutSubmitting] = useState(false)
  const [checkoutSuccess, setCheckoutSuccess] = useState<CheckoutCreateOrderResponse | null>(null)
  const [isSearchPanelCollapsed, setIsSearchPanelCollapsed] = useState(false)
  const [customizingProduct, setCustomizingProduct] = useState<CatalogProduct | null>(null)
  const [selectedModifierIds, setSelectedModifierIds] = useState<string[]>([])
  const [customizerError, setCustomizerError] = useState('')
  const [orderHistory, setOrderHistory] = useState<LocalOrderHistoryEntry[]>([])
  const [appAuthToken, setAppAuthToken] = useState('')
  const [appUser, setAppUser] = useState<AppCustomerUser | null>(null)
  const [authMode, setAuthMode] = useState<'login' | 'register'>('login')
  const [authSubmitting, setAuthSubmitting] = useState(false)
  const [deletionSubmitting, setDeletionSubmitting] = useState(false)
  const [authEmail, setAuthEmail] = useState('')
  const [authPassword, setAuthPassword] = useState('')
  const [authFullName, setAuthFullName] = useState('')
  const [authPhone, setAuthPhone] = useState('')
  const [authStreet, setAuthStreet] = useState('')
  const [authZipCode, setAuthZipCode] = useState('')
  const [authCity, setAuthCity] = useState('')
  const [authMarketingOptIn, setAuthMarketingOptIn] = useState(false)
  const showCatalogDebug = __DEV__

  useEffect(() => {
    async function initializeApp() {
      const storedBaseUrl = await readStoredApiBaseUrl()
      const resolvedBaseUrl = storedBaseUrl && storedBaseUrl.trim() ? storedBaseUrl : DEFAULT_API_BASE_URL
      setApiBaseUrl(resolvedBaseUrl)

      const storedToken = await readStoredAppAuthToken()
      if (!storedToken) {
        return
      }

      try {
        const me = await fetchAppCustomerMe(resolvedBaseUrl, storedToken)
        setAppAuthToken(storedToken)
        setAppUser(me.user)
      } catch {
        await clearStoredAppAuthToken()
        setAppAuthToken('')
        setAppUser(null)
      }
    }
    void initializeApp()
  }, [])

  const canSearch = useMemo(() => zipCode.replace(/[^\d]/g, '').length === 5, [zipCode])

  const cartTotal = useMemo(
    () => cartItems.reduce((sum, entry) => sum + entry.basePrice * entry.quantity, 0),
    [cartItems]
  )

  const customizerGroups = useMemo(
    () => (customizingProduct ? deriveModifierGroups(customizingProduct.modifiers) : []),
    [customizingProduct]
  )

  const missingRequiredCustomizerGroups = useMemo(
    () =>
      customizerGroups.filter(
        (group) =>
          group.required &&
          !group.modifiers.some((modifier) => selectedModifierIds.includes(modifier.id))
      ),
    [customizerGroups, selectedModifierIds]
  )

  async function saveApiBaseUrl() {
    const normalized = apiBaseUrl.trim().replace(/\/+$/, '')
    setApiBaseUrl(normalized)
    await writeStoredApiBaseUrl(normalized)
  }

  async function requestLocation() {
    setError('')
    const permission = await Location.requestForegroundPermissionsAsync()
    if (permission.status !== 'granted') {
      setError('Standortfreigabe wurde nicht erteilt.')
      setUseLocation(false)
      return
    }

    const current = await Location.getCurrentPositionAsync({
      accuracy: Location.Accuracy.Balanced,
    })
    setLocation({
      latitude: current.coords.latitude,
      longitude: current.coords.longitude,
    })
    setUseLocation(true)
  }

  async function searchTenants() {
    const normalizedZip = zipCode.replace(/[^\d]/g, '').slice(0, 5)
    if (normalizedZip.length !== 5) {
      setError('Bitte eine gueltige 5-stellige PLZ eingeben.')
      return
    }

    try {
      setLoading(true)
      setError('')
      const response = await discoverTenants(apiBaseUrl, {
        zipCode: normalizedZip,
        street: street.trim(),
        mode: 'all',
        latitude: useLocation ? location?.latitude ?? null : null,
        longitude: useLocation ? location?.longitude ?? null : null,
      })
      setResults(response.tenants)
      setIsSearchPanelCollapsed(response.tenants.length > 0)
      setSelectedTenant(null)
      setCatalog(null)
      setCheckoutSuccess(null)
      setCurrentTab('ORDER')
    } catch (searchError) {
      setResults([])
      setError(searchError instanceof Error ? searchError.message : 'Filialsuche fehlgeschlagen')
    } finally {
      setLoading(false)
    }
  }

  async function openTenantDetails(tenant: DiscoveryTenant) {
    try {
      setLoadingCatalog(true)
      setError('')
      setCatalogDiagnostics({
        tenantId: tenant.tenantId,
        tenantSlug: tenant.slug ?? null,
        catalogUrl: null,
        catalogStatus: null,
        catalogError: null,
        responsePreview: null,
      })
      const loadedCatalog = await fetchTenantCatalog(apiBaseUrl, tenant.tenantId, tenant.slug ?? null)
      setCatalogDiagnostics(getLastCatalogRequestDiagnostics())
      setSelectedTenant(tenant)
      setCatalog(loadedCatalog)
      setActiveOrderMode(null)
      setCartItems([])
      setCheckoutSuccess(null)
      setCustomizingProduct(null)
      setSelectedModifierIds([])
      setCustomizerError('')
      setCurrentTab('ORDER')
    } catch (catalogError) {
      setCatalogDiagnostics(getLastCatalogRequestDiagnostics())
      setError(
        catalogError instanceof Error
          ? catalogError.message
          : 'Detailseite konnte nicht geladen werden'
      )
    } finally {
      setLoadingCatalog(false)
    }
  }

  function closeTenantDetails() {
    setSelectedTenant(null)
    setCatalog(null)
    setActiveOrderMode(null)
    setCartItems([])
    setCheckoutSuccess(null)
    setCustomizingProduct(null)
    setSelectedModifierIds([])
    setCustomizerError('')
  }

  function openProductCustomizer(product: CatalogProduct) {
    const defaultModifierIds = deriveModifierGroups(product.modifiers).flatMap((group) => {
      const groupDefaults = group.modifiers
        .filter((entry) => entry.isDefaultSelected)
        .map((entry) => entry.id)
      if (group.selectionMode === 'single') {
        if (groupDefaults.length > 0) {
          return [groupDefaults[0]]
        }
        return group.modifiers.length > 0 ? [group.modifiers[0].id] : []
      }
      return groupDefaults
    })
    setSelectedModifierIds(defaultModifierIds)
    setCustomizerError('')
    setCustomizingProduct(product)
  }

  function toggleModifierSelection(group: ProductModifierGroup, modifierId: string) {
    setCustomizerError('')
    setSelectedModifierIds((current) => {
      if (group.selectionMode === 'single') {
        const idsInGroup = group.modifiers.map((entry) => entry.id)
        const currentWithoutGroup = current.filter((entry) => !idsInGroup.includes(entry))
        return [...currentWithoutGroup, modifierId]
      }

      return current.includes(modifierId)
        ? current.filter((entry) => entry !== modifierId)
        : [...current, modifierId]
    })
  }

  function confirmAddToCart() {
    if (!customizingProduct) {
      return
    }

    if (missingRequiredCustomizerGroups.length > 0) {
      const missingLabels = missingRequiredCustomizerGroups.map((group) => group.label).join(', ')
      setCustomizerError(`Bitte waehle zuerst: ${missingLabels}`)
      return
    }

    const selectedModifiers = customizingProduct.modifiers.filter((entry) =>
      selectedModifierIds.includes(entry.id)
    )
    const modifierPrice = selectedModifiers.reduce((sum, entry) => sum + parseEuroValue(entry.priceDelta), 0)
    const unitPrice = parseEuroValue(customizingProduct.price) + modifierPrice

    setCartItems((current) => [
      ...current,
      {
        id: `${Date.now()}-${customizingProduct.id}-${Math.random().toString(36).slice(2, 8)}`,
        productId: customizingProduct.id,
        productName: customizingProduct.name,
        quantity: 1,
        basePrice: unitPrice,
        modifierIds: selectedModifiers.map((entry) => entry.id),
        modifierText: selectedModifiers.map((entry) => entry.name).join(', '),
      },
    ])
    setCheckoutSuccess(null)
    setCustomizingProduct(null)
    setSelectedModifierIds([])
    setCustomizerError('')
  }

  function removeCartItem(itemId: string) {
    setCartItems((current) => current.filter((entry) => entry.id !== itemId))
    setCheckoutSuccess(null)
  }

  function increaseCartItemQuantity(itemId: string) {
    setCartItems((current) =>
      current.map((entry) =>
        entry.id === itemId
          ? {
              ...entry,
              quantity: entry.quantity + 1,
            }
          : entry
      )
    )
    setCheckoutSuccess(null)
  }

  function decreaseCartItemQuantity(itemId: string) {
    setCartItems((current) =>
      current.flatMap((entry) => {
        if (entry.id !== itemId) {
          return [entry]
        }

        if (entry.quantity <= 1) {
          return []
        }

        return [
          {
            ...entry,
            quantity: entry.quantity - 1,
          },
        ]
      })
    )
    setCheckoutSuccess(null)
  }

  async function submitCheckoutOrder() {
    if (!selectedTenant || !activeOrderMode || cartItems.length === 0) {
      return
    }

    try {
      setCheckoutSubmitting(true)
      setError('')
      const order = await createCheckoutOrder(apiBaseUrl, {
        tenantId: selectedTenant.tenantId,
        items: cartItems.map((entry) => ({
          productId: entry.productId,
          quantity: entry.quantity,
          modifierIds: entry.modifierIds,
        })),
        paymentMethod: checkoutPaymentMethod,
        sourceChannel: 'APP',
        markPaid: false,
        forwardToKitchen: true,
      })

      setCheckoutSuccess(order)
      setOrderHistory((current) => [
        {
          id: order.id,
          tenantName: catalog?.tenant.name || selectedTenant.tenantName,
          mode: activeOrderMode,
          paymentMethod: checkoutPaymentMethod,
          total: parseEuroValue(String(order.total)),
          createdAt: order.createdAt,
        },
        ...current,
      ])
      setCartItems([])
      setCurrentTab('MY_ORDERS')
    } catch (checkoutError) {
      setError(checkoutError instanceof Error ? checkoutError.message : 'Bestellung konnte nicht gesendet werden')
    } finally {
      setCheckoutSubmitting(false)
    }
  }

  async function submitAuth() {
    const email = authEmail.trim().toLowerCase()
    const password = authPassword.trim()

    if (!email || !password) {
      setError('Bitte E-Mail und Passwort eingeben.')
      return
    }

    try {
      setAuthSubmitting(true)
      setError('')
      setNotice('')
      if (authMode === 'register') {
        if (!authFullName.trim()) {
          setError('Bitte deinen Namen eingeben.')
          return
        }

        const response = await registerAppCustomer(apiBaseUrl, {
          email,
          password,
          fullName: authFullName.trim(),
          phone: authPhone.trim() || null,
          street: authStreet.trim() || null,
          zipCode: authZipCode.trim() || null,
          city: authCity.trim() || null,
          marketingOptIn: authMarketingOptIn,
        })
        await writeStoredAppAuthToken(response.token)
        setAppAuthToken(response.token)
        setAppUser(response.user)
      } else {
        const response = await loginAppCustomer(apiBaseUrl, {
          email,
          password,
        })
        await writeStoredAppAuthToken(response.token)
        setAppAuthToken(response.token)
        setAppUser(response.user)
      }

      setAuthPassword('')
      setNotice('Konto erfolgreich verbunden.')
    } catch (authError) {
      setError(authError instanceof Error ? authError.message : 'Kontoaktion fehlgeschlagen')
    } finally {
      setAuthSubmitting(false)
    }
  }

  async function logoutAppUser() {
    await clearStoredAppAuthToken()
    setAppAuthToken('')
    setAppUser(null)
    setAuthPassword('')
    setNotice('Du wurdest abgemeldet.')
  }

  async function requestDeletion() {
    if (!appAuthToken) {
      setError('Bitte zuerst einloggen.')
      return
    }

    try {
      setDeletionSubmitting(true)
      setError('')
      setNotice('')
      const response = await requestAppCustomerDeletion(apiBaseUrl, appAuthToken)
      setAppUser((current) =>
        current
          ? {
              ...current,
              deletionRequestedAt: response.deletionRequestedAt,
            }
          : current
      )
      setNotice('Kontoloeschung wurde angefragt. Unser Team meldet sich per E-Mail.')
    } catch (deletionError) {
      setError(
        deletionError instanceof Error
          ? deletionError.message
          : 'Kontoloeschung konnte nicht angefragt werden'
      )
    } finally {
      setDeletionSubmitting(false)
    }
  }

  function renderOrderTab() {
    if (selectedTenant) {
      const orderingEnabled = catalog?.customerApp.orderingEnabled ?? false
      const canAddToCart = orderingEnabled
      const canSubmitOrder = Boolean(activeOrderMode && orderingEnabled && cartItems.length > 0)
      const deliveryFeeAmount =
        activeOrderMode === 'delivery' ? parseEuroValue(selectedTenant.deliveryFeeNote || '0') : 0
      const checkoutGrandTotal = cartTotal + deliveryFeeAmount

      return (
        <View style={styles.block}>
          <View style={styles.rowBetween}>
            <TouchableOpacity style={styles.buttonSecondary} onPress={closeTenantDetails}>
              <Text style={styles.buttonSecondaryText}>Zurueck</Text>
            </TouchableOpacity>
            <View style={styles.row}>
              {catalog?.tenant.logoUrl ? (
                <Image source={{ uri: catalog.tenant.logoUrl }} style={styles.tenantLogo} resizeMode="contain" />
              ) : null}
              <Text style={styles.metaStrong}>Speisekarte</Text>
            </View>
          </View>

          {loadingCatalog ? (
            <View style={styles.panel}>
              <ActivityIndicator color="#0f172a" />
              <Text style={styles.meta}>Katalog wird geladen...</Text>
            </View>
          ) : catalog ? (
            <ScrollView contentContainerStyle={styles.scroll}>
              <View style={styles.panelMuted}>
                <Text style={styles.metaStrong}>Katalog-Debug</Text>
                <Text style={styles.meta}>tenantId: {catalogDiagnostics.tenantId || selectedTenant.tenantId}</Text>
                <Text style={styles.meta}>tenantSlug: {catalogDiagnostics.tenantSlug || selectedTenant.slug || '-'}</Text>
                <Text style={styles.meta}>catalogUrl: {catalogDiagnostics.catalogUrl || '-'}</Text>
                <Text style={styles.meta}>catalogStatus: {catalogDiagnostics.catalogStatus !== null ? String(catalogDiagnostics.catalogStatus) : '-'}</Text>
                <Text style={styles.meta}>catalogError: {catalogDiagnostics.catalogError || '-'}</Text>
              </View>
              <View style={styles.panel}>
                <Text style={styles.titleSmall}>{catalog.tenant.name}</Text>
                <Text style={styles.meta}>
                  Mindestbestellwert: {catalog.tenant.minOrderValue || '-'} | Liefergebuehr:{' '}
                  {catalog.tenant.deliveryFeeNote || '-'}
                </Text>
                <Text style={styles.meta}>
                  Bestellmodus:{' '}
                  {activeOrderMode === 'delivery'
                    ? 'Lieferung'
                    : activeOrderMode === 'pickup'
                      ? 'Abholung'
                      : 'Nicht verfuegbar'}
                </Text>
                {orderingEnabled ? (
                  <Text style={styles.meta}>Lieferart und Zahlungsart waehlst du unten im Warenkorb.</Text>
                ) : (
                  <Text style={styles.metaWarning}>Bestellungen sind fuer diese Filiale aktuell deaktiviert.</Text>
                )}
              </View>

              {catalog.products.map((product) => (
                <View key={product.id} style={styles.productCard}>
                  {product.imageUrl ? (
                    <Image source={{ uri: product.imageUrl }} style={styles.productImage} resizeMode="cover" />
                  ) : null}
                  <View style={styles.rowBetween}>
                    <Text style={styles.titleSmall}>{product.name}</Text>
                    <View style={styles.priceTag}>
                      <Text style={styles.priceTagText}>{formatEuro(parseEuroValue(product.price))}</Text>
                    </View>
                  </View>
                  {parseEuroValue(product.depositAmount || '0') > 0 ? (
                    <Text style={styles.meta}>
                      inkl. {formatEuro(parseEuroValue(product.depositAmount || '0'))} Pfand
                    </Text>
                  ) : null}
                  {formatBeverageContainerType(product.beverageContainerType) ? (
                    <Text style={styles.meta}>
                      Behältnis: {formatBeverageContainerType(product.beverageContainerType)}
                    </Text>
                  ) : null}
                  <Text style={styles.meta}>
                    Zutaten:{' '}
                    {product.ingredients.length > 0
                      ? product.ingredients.map((ingredient) => ingredient.name).join(', ')
                      : 'Keine Angabe'}
                  </Text>
                  <TouchableOpacity
                    style={[styles.buttonPrimary, !canAddToCart ? styles.disabled : null]}
                    disabled={!canAddToCart}
                    onPress={() => openProductCustomizer(product)}
                  >
                    <Text style={styles.buttonPrimaryText}>In den Warenkorb</Text>
                  </TouchableOpacity>
                </View>
              ))}

              {cartItems.length > 0 ? (
                <View style={styles.panel}>
                  <Text style={styles.titleSmall}>Warenkorb & Checkout ({cartItems.length})</Text>
                  <Text style={styles.label}>Lieferart</Text>
                  <View style={styles.rowWrap}>
                    {selectedTenant.services.delivery.available ? (
                      <TouchableOpacity
                        style={[styles.chip, activeOrderMode === 'delivery' ? styles.chipActive : null]}
                        onPress={() => setActiveOrderMode('delivery')}
                      >
                        <Text style={[styles.chipText, activeOrderMode === 'delivery' ? styles.chipTextActive : null]}>
                          Lieferung
                        </Text>
                      </TouchableOpacity>
                    ) : null}
                    {selectedTenant.services.pickup.available ? (
                      <TouchableOpacity
                        style={[styles.chip, activeOrderMode === 'pickup' ? styles.chipActive : null]}
                        onPress={() => setActiveOrderMode('pickup')}
                      >
                        <Text style={[styles.chipText, activeOrderMode === 'pickup' ? styles.chipTextActive : null]}>
                          Abholung
                        </Text>
                      </TouchableOpacity>
                    ) : null}
                  </View>
                  <Text style={styles.label}>Zahlungsart</Text>
                  <View style={styles.rowWrap}>
                    <TouchableOpacity
                      style={[styles.chip, checkoutPaymentMethod === 'CARD' ? styles.chipActive : null]}
                      onPress={() => setCheckoutPaymentMethod('CARD')}
                    >
                      <Text style={[styles.chipText, checkoutPaymentMethod === 'CARD' ? styles.chipTextActive : null]}>
                        Karte
                      </Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                      style={[styles.chip, checkoutPaymentMethod === 'CASH' ? styles.chipActive : null]}
                      onPress={() => setCheckoutPaymentMethod('CASH')}
                    >
                      <Text style={[styles.chipText, checkoutPaymentMethod === 'CASH' ? styles.chipTextActive : null]}>
                        Bar
                      </Text>
                    </TouchableOpacity>
                  </View>
                  {cartItems.map((item) => (
                    <View key={item.id} style={styles.rowBetween}>
                      <View style={{ flex: 1 }}>
                        <Text style={styles.meta}>
                          {item.productName}
                        </Text>
                        <View style={styles.quantityRow}>
                          <TouchableOpacity
                            style={styles.quantityButton}
                            onPress={() => decreaseCartItemQuantity(item.id)}
                          >
                            <Text style={styles.quantityButtonText}>-</Text>
                          </TouchableOpacity>
                          <Text style={styles.quantityValue}>{item.quantity}</Text>
                          <TouchableOpacity
                            style={styles.quantityButton}
                            onPress={() => increaseCartItemQuantity(item.id)}
                          >
                            <Text style={styles.quantityButtonText}>+</Text>
                          </TouchableOpacity>
                        </View>
                        {item.modifierText ? <Text style={styles.meta}>Optionen: {item.modifierText}</Text> : null}
                      </View>
                      <View style={styles.row}>
                        <Text style={styles.metaStrong}>{formatEuro(item.basePrice * item.quantity)}</Text>
                        <TouchableOpacity onPress={() => removeCartItem(item.id)}>
                          <Text style={styles.linkDanger}>Entfernen</Text>
                        </TouchableOpacity>
                      </View>
                    </View>
                  ))}
                  <View style={styles.panelMuted}>
                    <View style={styles.rowBetween}>
                      <Text style={styles.meta}>Zwischensumme</Text>
                      <Text style={styles.metaStrong}>{formatEuro(cartTotal)}</Text>
                    </View>
                    <View style={styles.rowBetween}>
                      <Text style={styles.meta}>Liefergebuehr</Text>
                      <Text style={styles.metaStrong}>{formatEuro(deliveryFeeAmount)}</Text>
                    </View>
                    <View style={styles.rowBetween}>
                      <Text style={styles.titleSmall}>Endsumme</Text>
                      <Text style={styles.titleSmall}>{formatEuro(checkoutGrandTotal)}</Text>
                    </View>
                  </View>
                  {!activeOrderMode ? (
                    <Text style={styles.metaWarning}>
                      Bitte waehle Lieferung oder Abholung aus, bevor du bestellst.
                    </Text>
                  ) : null}
                  <TouchableOpacity
                    style={[styles.buttonPrimary, (!canSubmitOrder || checkoutSubmitting) ? styles.disabled : null]}
                    disabled={!canSubmitOrder || checkoutSubmitting}
                    onPress={() => void submitCheckoutOrder()}
                  >
                    {checkoutSubmitting ? (
                      <ActivityIndicator color="#ffffff" />
                    ) : (
                      <Text style={styles.buttonPrimaryText}>Bestellung senden</Text>
                    )}
                  </TouchableOpacity>
                </View>
              ) : null}
            </ScrollView>
          ) : (
            <View style={styles.panel}>
              <Text style={styles.meta}>Katalog nicht verfuegbar.</Text>
              <View style={styles.panelMuted}>
                <Text style={styles.metaStrong}>Katalog-Debug</Text>
                <Text style={styles.meta}>tenantId: {catalogDiagnostics.tenantId || selectedTenant.tenantId}</Text>
                <Text style={styles.meta}>tenantSlug: {catalogDiagnostics.tenantSlug || selectedTenant.slug || '-'}</Text>
                <Text style={styles.meta}>catalogUrl: {catalogDiagnostics.catalogUrl || '-'}</Text>
                <Text style={styles.meta}>catalogStatus: {catalogDiagnostics.catalogStatus !== null ? String(catalogDiagnostics.catalogStatus) : '-'}</Text>
                <Text style={styles.meta}>catalogError: {catalogDiagnostics.catalogError || '-'}</Text>
              </View>
            </View>
          )}
        </View>
      )
    }

    return (
      <View style={styles.block}>
        <Text style={styles.brand}>Bestellen</Text>
        <Text style={styles.title}>Filialsuche fuer Lieferung und Abholung</Text>
        {catalogDiagnostics.tenantId ? (
          <View style={styles.panelMuted}>
            <Text style={styles.metaStrong}>Katalog-Debug</Text>
            <Text style={styles.meta}>tenantId: {catalogDiagnostics.tenantId}</Text>
            <Text style={styles.meta}>tenantSlug: {catalogDiagnostics.tenantSlug || '-'}</Text>
            <Text style={styles.meta}>catalogUrl: {catalogDiagnostics.catalogUrl || '-'}</Text>
            <Text style={styles.meta}>catalogStatus: {catalogDiagnostics.catalogStatus !== null ? String(catalogDiagnostics.catalogStatus) : '-'}</Text>
            <Text style={styles.meta}>catalogError: {catalogDiagnostics.catalogError || '-'}</Text>
          </View>
        ) : null}
        <View style={styles.panel}>
          {isSearchPanelCollapsed ? (
            <View style={styles.rowBetween}>
              <View style={styles.grow}>
                <Text style={styles.metaStrong}>Suche aktiv: {zipCode || 'PLZ fehlt'}</Text>
                <Text style={styles.meta}>{street ? street : 'Alle Strassen'}</Text>
              </View>
              <TouchableOpacity style={styles.buttonSecondary} onPress={() => setIsSearchPanelCollapsed(false)}>
                <Text style={styles.buttonSecondaryText}>Suche bearbeiten</Text>
              </TouchableOpacity>
            </View>
          ) : (
            <>
              <Text style={styles.label}>PLZ</Text>
              <TextInput
                value={zipCode}
                onChangeText={setZipCode}
                keyboardType="number-pad"
                style={styles.input}
                placeholder="z. B. 10115"
                placeholderTextColor={INPUT_PLACEHOLDER_COLOR}
              />
              <Text style={styles.label}>Strasse (optional)</Text>
              <TextInput
                value={street}
                onChangeText={setStreet}
                style={styles.input}
                placeholder="z. B. Hauptstrasse 8"
                placeholderTextColor={INPUT_PLACEHOLDER_COLOR}
              />
              <View style={styles.rowBetween}>
                <Text style={styles.meta}>Standort fuer Radius nutzen</Text>
                <Switch
                  value={useLocation}
                  onValueChange={(nextValue) => {
                    if (nextValue) {
                      void requestLocation()
                    } else {
                      setUseLocation(false)
                    }
                  }}
                />
              </View>
              <TouchableOpacity style={[styles.buttonPrimary, !canSearch ? styles.disabled : null]} disabled={!canSearch || loading} onPress={() => void searchTenants()}>
                {loading ? <ActivityIndicator color="#ffffff" /> : <Text style={styles.buttonPrimaryText}>Filialen suchen</Text>}
              </TouchableOpacity>
              <View style={styles.panelMuted}>
                <Text style={styles.label}>Technik (optional)</Text>
                <View style={styles.row}>
                  <TextInput value={apiBaseUrl} onChangeText={setApiBaseUrl} style={[styles.input, styles.grow]} />
                  <TouchableOpacity style={styles.buttonSecondary} onPress={() => void saveApiBaseUrl()}>
                    <Text style={styles.buttonSecondaryText}>Speichern</Text>
                  </TouchableOpacity>
                </View>
              </View>
            </>
          )}
        </View>
        <ScrollView contentContainerStyle={styles.scroll}>
          {results.length === 0 ? (
            <View style={styles.panelMuted}>
              <Text style={styles.meta}>Noch keine Treffer. Bitte zuerst nach Filialen suchen.</Text>
            </View>
          ) : null}
          {results.map((item) => {
            const distanceKm = item.services.delivery.distanceKm ?? item.services.pickup.distanceKm

            return (
              <View key={item.tenantId} style={styles.resultCard}>
                <View style={styles.row}>
                  {item.customerApp.listingDisplay.showLogo && item.logoUrl ? (
                    <Image source={{ uri: item.logoUrl }} style={styles.tenantLogo} resizeMode="contain" />
                  ) : null}
                  <View style={styles.grow}>
                    <Text style={styles.titleSmall}>{item.tenantName}</Text>
                    {item.customerApp.listingDisplay.showChainName && item.chain?.name ? (
                      <Text style={styles.meta}>Kette: {item.chain.name}</Text>
                    ) : null}
                    {item.customerApp.listingDisplay.showAddress ? (
                      <Text style={styles.meta}>{formatAddress(item.address) || 'Adresse wird nachgereicht'}</Text>
                    ) : null}
                  </View>
                </View>
                {item.customerApp.listingDisplay.showAvailabilityBadges ? (
                  <View style={styles.rowWrap}>
                    <View
                      style={[
                        styles.availabilityPill,
                        item.services.delivery.available ? styles.availabilityPillOn : styles.availabilityPillOff,
                      ]}
                    >
                      <Text style={styles.availabilityPillText}>
                        Lieferung {item.services.delivery.available ? 'verfuegbar' : 'aus'}
                      </Text>
                    </View>
                    <View
                      style={[
                        styles.availabilityPill,
                        item.services.pickup.available ? styles.availabilityPillOn : styles.availabilityPillOff,
                      ]}
                    >
                      <Text style={styles.availabilityPillText}>
                        Abholung {item.services.pickup.available ? 'verfuegbar' : 'aus'}
                      </Text>
                    </View>
                  </View>
                ) : null}
                {item.customerApp.listingDisplay.showMinOrderValue ? (
                  <Text style={styles.meta}>Mindestbestellwert: {item.minOrderValue || '-'}</Text>
                ) : null}
                {item.customerApp.listingDisplay.showDeliveryFeeNote ? (
                  <Text style={styles.meta}>Liefergebuehr: {item.deliveryFeeNote || '-'}</Text>
                ) : null}
                {item.customerApp.listingDisplay.showDistance ? (
                  <Text style={styles.meta}>Distanz: {distanceKm !== null ? `${distanceKm.toFixed(1)} km` : '-'}</Text>
                ) : null}
                <TouchableOpacity style={styles.buttonPrimary} onPress={() => void openTenantDetails(item)}>
                  <Text style={styles.buttonPrimaryText}>Speisekarte ansehen</Text>
                </TouchableOpacity>
              </View>
            )
          })}
        </ScrollView>
      </View>
    )
  }

  function renderCatalogErrorDiagnostics() {
    if (!showCatalogDebug) {
      return null
    }

    const hasCatalogDiagnostics =
      Boolean(catalogDiagnostics.catalogUrl) ||
      catalogDiagnostics.catalogStatus !== null ||
      Boolean(catalogDiagnostics.catalogError) ||
      Boolean(catalogDiagnostics.responsePreview)

    if (!hasCatalogDiagnostics) {
      return null
    }

    return (
      <View style={styles.panelMuted}>
        <Text style={styles.metaStrong}>Catalog Debug</Text>
        <Text style={styles.meta}>catalogUrl: {catalogDiagnostics.catalogUrl || '-'}</Text>
        <Text style={styles.meta}>
          HTTP status:{' '}
          {catalogDiagnostics.catalogStatus !== null ? String(catalogDiagnostics.catalogStatus) : '-'}
        </Text>
        <Text style={styles.meta}>exception message: {catalogDiagnostics.catalogError || error || '-'}</Text>
        <Text style={styles.meta}>
          response body first 500: {catalogDiagnostics.responsePreview || '-'}
        </Text>
      </View>
    )
  }

  function renderStartTab() {
    return (
      <ScrollView contentContainerStyle={styles.scroll}>
        <View style={styles.heroPanel}>
          <View style={styles.row}>
            <Image source={KLARANDO_FAVICON} style={styles.heroLogo} resizeMode="contain" />
            <View style={styles.grow}>
              <Text style={styles.heroBrand}>Klarando App</Text>
              <Text style={styles.heroTitle}>Hungrig? Wir liefern Genuss.</Text>
            </View>
          </View>
          <Text style={styles.heroText}>
            Entdecke Filialen in deiner Naehe, stelle dein Lieblingsessen zusammen und bestelle mit
            wenigen Klicks.
          </Text>
          <View style={styles.heroFeatureRow}>
            <View style={styles.heroFeatureChip}>
              <Text style={styles.heroFeatureText}>Schnell geliefert</Text>
            </View>
            <View style={styles.heroFeatureChip}>
              <Text style={styles.heroFeatureText}>Frische Zutaten</Text>
            </View>
            <View style={styles.heroFeatureChip}>
              <Text style={styles.heroFeatureText}>Sicher bezahlen</Text>
            </View>
          </View>
          <View style={styles.row}>
            <TouchableOpacity style={[styles.buttonPrimary, styles.grow]} onPress={() => setCurrentTab('ORDER')}>
              <Text style={styles.buttonPrimaryText}>Jetzt bestellen</Text>
            </TouchableOpacity>
            <TouchableOpacity style={[styles.buttonSecondary, styles.grow]} onPress={() => setCurrentTab('MY_ORDERS')}>
              <Text style={styles.buttonSecondaryText}>Bestellungen</Text>
            </TouchableOpacity>
          </View>
        </View>

        <View style={styles.panel}>
          <Text style={styles.titleSmall}>So einfach geht's</Text>
          <Text style={styles.meta}>1. Liefergebiet per PLZ suchen</Text>
          <Text style={styles.meta}>2. Filiale und Produkte auswaehlen</Text>
          <Text style={styles.meta}>3. Bestellung senden und direkt bestaetigt bekommen</Text>
        </View>
      </ScrollView>
    )
  }

  function renderMyOrdersTab() {
    return (
      <ScrollView contentContainerStyle={styles.scroll}>
        <View style={styles.panel}>
          <Text style={styles.titleSmall}>Meine Bestellungen</Text>
          {orderHistory.length === 0 ? (
            <Text style={styles.meta}>Noch keine Bestellung gesendet.</Text>
          ) : (
            orderHistory.map((entry) => (
              <View key={entry.id} style={styles.panelMuted}>
                <Text style={styles.meta}>
                  {entry.tenantName} - {entry.mode === 'delivery' ? 'Lieferung' : 'Abholung'}
                </Text>
                <Text style={styles.meta}>Bestellnummer: {entry.id.slice(0, 8).toUpperCase()}</Text>
                <Text style={styles.meta}>Zeit: {formatDateTime(entry.createdAt)}</Text>
                <Text style={styles.meta}>Zahlung: {entry.paymentMethod === 'CARD' ? 'Karte' : 'Bar'}</Text>
                <Text style={styles.meta}>Gesamt: {formatEuro(entry.total)}</Text>
              </View>
            ))
          )}
        </View>
      </ScrollView>
    )
  }

  function renderProfileTab() {
    if (appUser) {
      return (
        <ScrollView contentContainerStyle={styles.scroll}>
          <View style={styles.panel}>
            <Text style={styles.titleSmall}>Konto</Text>
            <Text style={styles.meta}>Name: {appUser.fullName}</Text>
            <Text style={styles.meta}>E-Mail: {appUser.email}</Text>
            <Text style={styles.meta}>Telefon: {appUser.phone || '-'}</Text>
            <Text style={styles.meta}>
              Adresse: {formatAddress({ street: appUser.street, zipCode: appUser.zipCode, city: appUser.city }) || '-'}
            </Text>
            <Text style={styles.meta}>
              Kontoloeschung angefragt:{' '}
              {appUser.deletionRequestedAt ? formatDateTime(appUser.deletionRequestedAt) : 'Nein'}
            </Text>
            <View style={styles.row}>
              <TouchableOpacity
                style={[styles.buttonSecondary, deletionSubmitting ? styles.disabled : null, styles.grow]}
                disabled={deletionSubmitting}
                onPress={() => void requestDeletion()}
              >
                {deletionSubmitting ? (
                  <ActivityIndicator color="#0f172a" />
                ) : (
                  <Text style={styles.buttonSecondaryText}>Kontoloeschung anfragen</Text>
                )}
              </TouchableOpacity>
              <TouchableOpacity style={[styles.buttonPrimary, styles.grow]} onPress={() => void logoutAppUser()}>
                <Text style={styles.buttonPrimaryText}>Abmelden</Text>
              </TouchableOpacity>
            </View>
          </View>
        </ScrollView>
      )
    }

    return (
      <ScrollView contentContainerStyle={styles.scroll}>
        <View style={styles.panel}>
          <Text style={styles.titleSmall}>Konto</Text>
          <View style={styles.row}>
            <TouchableOpacity
              style={[styles.chip, authMode === 'login' ? styles.chipActive : null]}
              onPress={() => setAuthMode('login')}
            >
              <Text style={[styles.chipText, authMode === 'login' ? styles.chipTextActive : null]}>Login</Text>
            </TouchableOpacity>
            <TouchableOpacity
              style={[styles.chip, authMode === 'register' ? styles.chipActive : null]}
              onPress={() => setAuthMode('register')}
            >
              <Text style={[styles.chipText, authMode === 'register' ? styles.chipTextActive : null]}>Registrieren</Text>
            </TouchableOpacity>
          </View>

          {authMode === 'register' ? (
            <>
              <TextInput
                placeholder="Name"
                placeholderTextColor={INPUT_PLACEHOLDER_COLOR}
                value={authFullName}
                onChangeText={setAuthFullName}
                style={styles.input}
              />
              <TextInput
                placeholder="Telefon"
                placeholderTextColor={INPUT_PLACEHOLDER_COLOR}
                keyboardType="phone-pad"
                value={authPhone}
                onChangeText={setAuthPhone}
                style={styles.input}
              />
              <TextInput
                placeholder="Strasse und Hausnummer"
                placeholderTextColor={INPUT_PLACEHOLDER_COLOR}
                value={authStreet}
                onChangeText={setAuthStreet}
                style={styles.input}
              />
              <View style={styles.row}>
                <TextInput
                  placeholder="PLZ"
                  placeholderTextColor={INPUT_PLACEHOLDER_COLOR}
                  keyboardType="number-pad"
                  value={authZipCode}
                  onChangeText={setAuthZipCode}
                  style={[styles.input, styles.grow]}
                />
                <TextInput
                  placeholder="Ort"
                  placeholderTextColor={INPUT_PLACEHOLDER_COLOR}
                  value={authCity}
                  onChangeText={setAuthCity}
                  style={[styles.input, styles.grow]}
                />
              </View>
              <View style={styles.rowBetween}>
                <Text style={styles.meta}>Newsletter/Marketing erlauben</Text>
                <Switch value={authMarketingOptIn} onValueChange={setAuthMarketingOptIn} />
              </View>
            </>
          ) : null}

          <TextInput
            placeholder="E-Mail"
            placeholderTextColor={INPUT_PLACEHOLDER_COLOR}
            autoCapitalize="none"
            value={authEmail}
            onChangeText={setAuthEmail}
            style={styles.input}
          />
          <TextInput
            placeholder="Passwort"
            placeholderTextColor={INPUT_PLACEHOLDER_COLOR}
            secureTextEntry
            value={authPassword}
            onChangeText={setAuthPassword}
            style={styles.input}
          />
          <TouchableOpacity
            style={[styles.buttonPrimary, authSubmitting ? styles.disabled : null]}
            disabled={authSubmitting}
            onPress={() => void submitAuth()}
          >
            {authSubmitting ? (
              <ActivityIndicator color="#ffffff" />
            ) : (
              <Text style={styles.buttonPrimaryText}>
                {authMode === 'register' ? 'Registrieren' : 'Einloggen'}
              </Text>
            )}
          </TouchableOpacity>
        </View>
      </ScrollView>
    )
  }

  function renderInfoTab() {
    const tenantName = catalog?.tenant.name || selectedTenant?.tenantName || 'Jede Filiale'
    const tenantAddress = selectedTenant ? formatAddress(selectedTenant.address) : ''
    const tenantEmail = selectedTenant?.contact.email || catalog?.tenant.contact.email || ''
    const tenantPhone = selectedTenant?.contact.phone || catalog?.tenant.contact.phone || ''
    const tenantWebsite = selectedTenant?.contact.website || catalog?.tenant.contact.website || ''
    const supportEmail =
      selectedTenant?.contact.supportEmail || catalog?.tenant.contact.supportEmail || tenantEmail
    const accountDeletionEmail =
      selectedTenant?.contact.accountDeletionEmail ||
      catalog?.tenant.contact.accountDeletionEmail ||
      supportEmail
    const imprintUrl = selectedTenant?.legal.imprintUrl || catalog?.tenant.legal.imprintUrl || ''
    const privacyPolicyUrl =
      selectedTenant?.legal.privacyPolicyUrl || catalog?.tenant.legal.privacyPolicyUrl || ''
    const termsUrl = selectedTenant?.legal.termsUrl || catalog?.tenant.legal.termsUrl || ''

    return (
      <ScrollView contentContainerStyle={styles.scroll}>
        <View style={styles.panel}>
          <Text style={styles.titleSmall}>Pflichtinfos fuer die oeffentliche App</Text>
          <Text style={styles.meta}>Betreiber: {tenantName}</Text>
          <Text style={styles.meta}>Adresse: {tenantAddress || 'im Impressum hinterlegen'}</Text>
          <Text style={styles.meta}>Kontakt E-Mail: {tenantEmail || 'hinterlegen'}</Text>
          <Text style={styles.meta}>Kontakt Telefon: {tenantPhone || 'hinterlegen'}</Text>
          <Text style={styles.meta}>Website: {tenantWebsite || 'hinterlegen'}</Text>
          <Text style={styles.meta}>Impressum URL: {imprintUrl || 'hinterlegen'}</Text>
          <Text style={styles.meta}>Datenschutz URL: {privacyPolicyUrl || 'hinterlegen'}</Text>
          <Text style={styles.meta}>AGB URL: {termsUrl || 'optional'}</Text>
          <Text style={styles.meta}>Support E-Mail: {supportEmail || 'hinterlegen'}</Text>
          <Text style={styles.meta}>Kontoloeschung E-Mail: {accountDeletionEmail || 'hinterlegen'}</Text>
        </View>
        <View style={styles.panel}>
          <Text style={styles.titleSmall}>Google Play Checkliste</Text>
          <Text style={styles.meta}>1. Impressum und Betreiberdaten verlinken.</Text>
          <Text style={styles.meta}>2. Datenschutzerklaerung sichtbar und erreichbar halten.</Text>
          <Text style={styles.meta}>3. Liefergebuehr, Mindestbestellwert und Preise transparent anzeigen.</Text>
          <Text style={styles.meta}>4. Allergene und Zutaten pro Produkt anzeigen.</Text>
          <Text style={styles.meta}>5. Kontaktweg fuer Kontoloeschung und Datenschutzanfragen anbieten.</Text>
          <Text style={styles.meta}>6. Zahlungsarten, Erstattung und Supportprozess dokumentieren.</Text>
        </View>
      </ScrollView>
    )
  }

  function renderActiveTab() {
    if (currentTab === 'START') {
      return renderStartTab()
    }
    if (currentTab === 'ORDER') {
      return renderOrderTab()
    }
    if (currentTab === 'MY_ORDERS') {
      return renderMyOrdersTab()
    }
    if (currentTab === 'PROFILE') {
      return renderProfileTab()
    }
    return renderInfoTab()
  }

  const tabs: Array<{ key: AppTab; label: string }> = [
    { key: 'START', label: 'Start' },
    { key: 'ORDER', label: 'Bestellen' },
    { key: 'MY_ORDERS', label: 'Orders' },
    { key: 'PROFILE', label: 'Profil' },
    { key: 'INFO', label: 'Info' },
  ]

  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.root}>
        <View style={styles.topBar}>
          <View style={styles.row}>
            <Image source={KLARANDO_FAVICON} style={styles.topBarLogo} resizeMode="contain" />
            <View>
              <Text style={styles.topBarTitle}>Klarando</Text>
              <Text style={styles.topBarSubtitle}>Lecker bestellen in deiner Naehe</Text>
            </View>
          </View>
        </View>
        <View style={styles.content}>
          {error ? (
            <View style={styles.errorBox}>
              <Text style={styles.errorText}>{error}</Text>
              {currentTab === 'ORDER' ? renderCatalogErrorDiagnostics() : null}
            </View>
          ) : null}
          {notice ? (
            <View style={styles.noticeBox}>
              <Text style={styles.noticeText}>{notice}</Text>
            </View>
          ) : null}
          {checkoutSuccess ? (
            <View style={styles.successBox}>
              <Text style={styles.successText}>
                Bestellung bestaetigt: {checkoutSuccess.id.slice(0, 8).toUpperCase()}
              </Text>
            </View>
          ) : null}
          {renderActiveTab()}
        </View>

        <Modal
          visible={Boolean(customizingProduct)}
          transparent
          animationType="slide"
          onRequestClose={() => {
            setCustomizingProduct(null)
            setSelectedModifierIds([])
            setCustomizerError('')
          }}
        >
          <View style={styles.modalBackdrop}>
            <View style={styles.modalCard}>
              <Text style={styles.titleSmall}>{customizingProduct?.name || 'Produkt'}</Text>
              <Text style={styles.meta}>Optionen auswaehlen</Text>
              {customizerError ? <Text style={styles.metaWarning}>{customizerError}</Text> : null}
              <ScrollView style={styles.modalOptionsScroll} contentContainerStyle={styles.modalOptionsContent}>
                {customizerGroups.length ? (
                  customizerGroups.map((group) => (
                    <View key={group.key} style={styles.groupBlock}>
                      <Text style={styles.groupTitle}>
                        {group.label}
                        {group.required ? ' *' : ''}
                      </Text>
                      {group.modifiers.map((modifier) => {
                        const selected = selectedModifierIds.includes(modifier.id)
                        const delta = parseEuroValue(modifier.priceDelta)
                        return (
                          <TouchableOpacity
                            key={modifier.id}
                            style={[styles.modifierRow, selected ? styles.modifierRowSelected : null]}
                            onPress={() => toggleModifierSelection(group, modifier.id)}
                          >
                            <Text style={styles.modifierName}>{modifier.name}</Text>
                            <Text style={styles.modifierPrice}>
                              {delta === 0 ? 'inklusive' : `${delta > 0 ? '+' : ''}${formatEuro(delta)}`}
                            </Text>
                          </TouchableOpacity>
                        )
                      })}
                    </View>
                  ))
                ) : (
                  <Text style={styles.meta}>Keine Zusatzoptionen verfuegbar.</Text>
                )}
              </ScrollView>
              <View style={styles.row}>
                <TouchableOpacity
                  style={[styles.buttonSecondary, styles.grow]}
                  onPress={() => {
                    setCustomizingProduct(null)
                    setSelectedModifierIds([])
                    setCustomizerError('')
                  }}
                >
                  <Text style={styles.buttonSecondaryText}>Abbrechen</Text>
                </TouchableOpacity>
                <TouchableOpacity style={[styles.buttonPrimary, styles.grow]} onPress={confirmAddToCart}>
                  <Text style={styles.buttonPrimaryText}>In den Warenkorb</Text>
                </TouchableOpacity>
              </View>
            </View>
          </View>
        </Modal>

        <View style={styles.bottomNav}>
          {tabs.map((tab) => (
            <TouchableOpacity
              key={tab.key}
              style={[styles.navItem, currentTab === tab.key ? styles.navItemActive : null]}
              onPress={() => setCurrentTab(tab.key)}
            >
              <Text style={[styles.navText, currentTab === tab.key ? styles.navTextActive : null]}>
                {tab.label}
              </Text>
            </TouchableOpacity>
          ))}
        </View>
      </View>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  safeArea: { flex: 1, backgroundColor: '#eaf1fb' },
  root: { flex: 1 },
  topBar: {
    marginHorizontal: 14,
    marginTop: 8,
    borderRadius: 20,
    backgroundColor: '#0f2f78',
    borderWidth: 1,
    borderColor: '#1d4ed8',
    paddingHorizontal: 14,
    paddingVertical: 10,
    shadowColor: '#0f172a',
    shadowOpacity: 0.25,
    shadowRadius: 16,
    shadowOffset: { width: 0, height: 10 },
    elevation: 6,
  },
  topBarLogo: {
    width: 34,
    height: 34,
    borderRadius: 10,
    backgroundColor: '#ffffff',
    marginRight: 8,
  },
  topBarTitle: { color: '#ffffff', fontSize: 17, fontWeight: '800' },
  topBarSubtitle: { color: '#dbeafe', fontSize: 12, marginTop: 2 },
  content: { flex: 1, paddingHorizontal: 16, paddingTop: 12 },
  block: { flex: 1 },
  scroll: { paddingBottom: 24, gap: 12 },
  panel: {
    backgroundColor: '#ffffff',
    borderRadius: 18,
    borderWidth: 1,
    borderColor: '#dbe5f5',
    padding: 14,
    gap: 8,
    shadowColor: '#0f172a',
    shadowOpacity: 0.08,
    shadowRadius: 14,
    shadowOffset: { width: 0, height: 8 },
    elevation: 3,
  },
  heroPanel: {
    backgroundColor: '#0f2f78',
    borderRadius: 20,
    borderWidth: 1,
    borderColor: '#1d4ed8',
    padding: 16,
    gap: 10,
    shadowColor: '#0f172a',
    shadowOpacity: 0.2,
    shadowRadius: 16,
    shadowOffset: { width: 0, height: 10 },
    elevation: 4,
  },
  heroLogo: {
    width: 48,
    height: 48,
    borderRadius: 12,
    backgroundColor: '#ffffff',
  },
  heroBrand: { color: '#93c5fd', fontSize: 12, fontWeight: '800', textTransform: 'uppercase', letterSpacing: 0.4 },
  heroTitle: { color: '#ffffff', fontSize: 24, fontWeight: '800', marginTop: 4, lineHeight: 28 },
  heroText: { color: '#e2e8f0', fontSize: 14, lineHeight: 20 },
  heroFeatureRow: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  heroFeatureChip: {
    borderRadius: 999,
    backgroundColor: 'rgba(255,255,255,0.16)',
    paddingHorizontal: 10,
    paddingVertical: 6,
  },
  heroFeatureText: { color: '#ffffff', fontSize: 12, fontWeight: '700' },
  panelMuted: {
    borderRadius: 14,
    borderWidth: 1,
    borderColor: '#dbe5f5',
    backgroundColor: '#f8fbff',
    padding: 10,
    gap: 6,
  },
  row: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  rowWrap: { flexDirection: 'row', alignItems: 'center', flexWrap: 'wrap', gap: 8 },
  rowBetween: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 8 },
  grow: { flex: 1 },
  brand: { color: '#2563eb', fontSize: 12, fontWeight: '800', textTransform: 'uppercase', letterSpacing: 0.4 },
  title: { color: '#0f172a', fontSize: 26, fontWeight: '800', marginBottom: 8, marginTop: 4, lineHeight: 31 },
  titleSmall: { color: '#0f172a', fontSize: 16, fontWeight: '700' },
  meta: { color: '#475569', fontSize: 13, lineHeight: 18 },
  metaStrong: { color: '#0f172a', fontSize: 13, fontWeight: '700' },
  metaWarning: { color: '#b45309', fontSize: 13, fontWeight: '700' },
  label: { color: '#1e293b', fontSize: 13, fontWeight: '700' },
  input: {
    borderWidth: 1,
    borderColor: '#bfdbfe',
    borderRadius: 12,
    backgroundColor: '#ffffff',
    color: '#0f172a',
    paddingHorizontal: 12,
    paddingVertical: 11,
    fontSize: 15,
  },
  chip: {
    borderRadius: 999,
    borderWidth: 1,
    borderColor: '#93c5fd',
    backgroundColor: '#f8fbff',
    paddingHorizontal: 13,
    paddingVertical: 8,
  },
  chipActive: { backgroundColor: '#1d4ed8', borderColor: '#1d4ed8' },
  chipText: { color: '#1e293b', fontSize: 12, fontWeight: '700' },
  chipTextActive: { color: '#fff' },
  buttonPrimary: {
    borderRadius: 13,
    backgroundColor: '#1d4ed8',
    paddingHorizontal: 14,
    paddingVertical: 12,
    alignItems: 'center',
    justifyContent: 'center',
  },
  buttonPrimaryText: { color: '#fff', fontSize: 14, fontWeight: '800' },
  buttonSecondary: {
    borderRadius: 13,
    borderWidth: 1,
    borderColor: '#93c5fd',
    backgroundColor: '#fff',
    paddingHorizontal: 14,
    paddingVertical: 12,
    alignItems: 'center',
    justifyContent: 'center',
  },
  buttonSecondaryText: { color: '#1e293b', fontSize: 13, fontWeight: '700' },
  disabled: { opacity: 0.6 },
  linkDanger: { color: '#b91c1c', fontSize: 12, fontWeight: '700' },
  quantityRow: { flexDirection: 'row', alignItems: 'center', gap: 8, marginTop: 4 },
  quantityButton: {
    width: 28,
    height: 28,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#93c5fd',
    backgroundColor: '#ffffff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  quantityButtonText: { color: '#1d4ed8', fontSize: 16, fontWeight: '800' },
  quantityValue: { color: '#0f172a', fontSize: 13, fontWeight: '700', minWidth: 18, textAlign: 'center' },
  errorBox: { borderRadius: 12, borderWidth: 1, borderColor: '#fecaca', backgroundColor: '#fef2f2', padding: 10, marginBottom: 8 },
  errorText: { color: '#b91c1c', fontSize: 13, fontWeight: '600' },
  noticeBox: { borderRadius: 12, borderWidth: 1, borderColor: '#bfdbfe', backgroundColor: '#eff6ff', padding: 10, marginBottom: 8 },
  noticeText: { color: '#1d4ed8', fontSize: 13, fontWeight: '600' },
  successBox: { borderRadius: 12, borderWidth: 1, borderColor: '#bbf7d0', backgroundColor: '#f0fdf4', padding: 10, marginBottom: 8 },
  successText: { color: '#166534', fontSize: 13, fontWeight: '700' },
  modalBackdrop: {
    flex: 1,
    backgroundColor: 'rgba(2, 6, 23, 0.45)',
    justifyContent: 'flex-end',
    padding: 14,
  },
  modalCard: {
    backgroundColor: '#ffffff',
    borderRadius: 18,
    borderWidth: 1,
    borderColor: '#dbe5f5',
    padding: 14,
    gap: 10,
    maxHeight: '78%',
  },
  modalOptionsScroll: {
    maxHeight: 320,
  },
  modalOptionsContent: {
    gap: 8,
    paddingVertical: 2,
  },
  groupBlock: {
    gap: 8,
    marginBottom: 6,
  },
  groupTitle: {
    color: '#1e293b',
    fontSize: 13,
    fontWeight: '800',
  },
  modifierRow: {
    borderRadius: 12,
    borderWidth: 1,
    borderColor: '#dbe5f5',
    backgroundColor: '#f8fbff',
    paddingHorizontal: 12,
    paddingVertical: 10,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    gap: 8,
  },
  modifierRowSelected: {
    borderColor: '#1d4ed8',
    backgroundColor: '#eff6ff',
  },
  modifierName: {
    color: '#0f172a',
    fontSize: 13,
    fontWeight: '700',
    flex: 1,
  },
  modifierPrice: {
    color: '#334155',
    fontSize: 12,
    fontWeight: '700',
  },
  bottomNav: {
    borderTopWidth: 1,
    borderTopColor: '#c7d7f3',
    backgroundColor: '#ffffff',
    paddingHorizontal: 10,
    paddingTop: 10,
    paddingBottom: 12,
    flexDirection: 'row',
    gap: 8,
  },
  navItem: { flex: 1, borderRadius: 12, paddingVertical: 10, alignItems: 'center' },
  navItemActive: { backgroundColor: '#1d4ed8' },
  navText: { color: '#475569', fontSize: 11, fontWeight: '800', textAlign: 'center' },
  navTextActive: { color: '#fff' },
  resultCard: {
    backgroundColor: '#ffffff',
    borderRadius: 18,
    borderWidth: 1,
    borderColor: '#dbe5f5',
    padding: 14,
    gap: 8,
    shadowColor: '#0f172a',
    shadowOpacity: 0.06,
    shadowRadius: 12,
    shadowOffset: { width: 0, height: 6 },
    elevation: 2,
  },
  availabilityPill: {
    borderRadius: 999,
    paddingHorizontal: 10,
    paddingVertical: 5,
    borderWidth: 1,
  },
  availabilityPillOn: {
    backgroundColor: '#ecfdf5',
    borderColor: '#86efac',
  },
  availabilityPillOff: {
    backgroundColor: '#fff1f2',
    borderColor: '#fda4af',
  },
  availabilityPillText: {
    color: '#0f172a',
    fontSize: 12,
    fontWeight: '700',
  },
  productCard: {
    backgroundColor: '#ffffff',
    borderRadius: 18,
    borderWidth: 1,
    borderColor: '#dbe5f5',
    padding: 14,
    gap: 8,
    shadowColor: '#0f172a',
    shadowOpacity: 0.07,
    shadowRadius: 13,
    shadowOffset: { width: 0, height: 7 },
    elevation: 3,
  },
  priceTag: {
    borderRadius: 10,
    backgroundColor: '#dbeafe',
    paddingHorizontal: 10,
    paddingVertical: 6,
  },
  priceTagText: {
    color: '#1e3a8a',
    fontSize: 12,
    fontWeight: '800',
  },
  tenantLogo: {
    width: 42,
    height: 42,
    borderRadius: 10,
    borderWidth: 1,
    borderColor: '#bfdbfe',
    backgroundColor: '#fff',
  },
  productImage: {
    width: '100%',
    height: 150,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: '#dbeafe',
    backgroundColor: '#eff6ff',
  },
})
