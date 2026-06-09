import type {
  AppAuthMeResponse,
  AppAuthResponse,
  AppDeletionRequestResponse,
  CatalogRequestDiagnostics,
  CheckoutCreateOrderRequest,
  CheckoutCreateOrderResponse,
  DiscoveryMode,
  DiscoveryResponse,
  TenantCatalogResponse,
} from './types'

let lastCatalogRequestDiagnostics: CatalogRequestDiagnostics = {
  tenantId: null,
  tenantSlug: null,
  catalogUrl: null,
  catalogStatus: null,
  catalogError: null,
  responsePreview: null,
}

export function getLastCatalogRequestDiagnostics() {
  return lastCatalogRequestDiagnostics
}

function normalizeApiBaseUrl(value: string) {
  return value.trim().replace(/\/+$/, '')
}

function buildApiBaseUrlCandidates(apiBaseUrl: string) {
  const normalized = normalizeApiBaseUrl(apiBaseUrl)
  const candidates = [
    normalized,
    'http://10.0.2.2:4000',
    'http://127.0.0.1:4000',
    'http://localhost:4000',
    'http://192.168.178.71:4000',
  ]
    .map((entry) => normalizeApiBaseUrl(entry))
    .filter(Boolean)

  return Array.from(new Set(candidates))
}

type DiscoveryParams = {
  zipCode: string
  street?: string
  mode: DiscoveryMode
  latitude: number | null
  longitude: number | null
}

export async function discoverTenants(
  apiBaseUrl: string,
  params: DiscoveryParams
): Promise<DiscoveryResponse> {
  const baseUrlCandidates = buildApiBaseUrlCandidates(apiBaseUrl)
  if (baseUrlCandidates.length === 0) {
    throw new Error('API Base URL fehlt')
  }

  const zipCode = params.zipCode.replace(/[^\d]/g, '').slice(0, 5)
  const query = new URLSearchParams({
    zipCode,
    includeOutOfArea: 'true',
  })

  if (params.mode !== 'all') {
    query.set('mode', params.mode)
  }

  if (params.street && params.street.trim()) {
    query.set('street', params.street.trim())
  }

  if (typeof params.latitude === 'number') {
    query.set('latitude', String(params.latitude))
  }
  if (typeof params.longitude === 'number') {
    query.set('longitude', String(params.longitude))
  }

  let lastError: string | null = null

  for (const candidateBaseUrl of baseUrlCandidates) {
    try {
      const response = await fetch(
        `${candidateBaseUrl}/api/tenants/public/discovery?${query.toString()}`
      )

      if (!response.ok) {
        const errorData = await response.json().catch(() => null)
        lastError = errorData?.error || `Filialsuche fehlgeschlagen (${response.status})`
        continue
      }

      return response.json()
    } catch (error) {
      lastError = error instanceof Error ? error.message : 'Filialsuche fehlgeschlagen'
    }
  }

  throw new Error(lastError || 'Filialsuche fehlgeschlagen')
}

export async function fetchTenantCatalog(
  apiBaseUrl: string,
  tenantId: string,
  tenantSlug?: string | null
): Promise<TenantCatalogResponse> {
  const baseUrlCandidates = buildApiBaseUrlCandidates(apiBaseUrl)
  if (baseUrlCandidates.length === 0) {
    throw new Error('API Base URL fehlt')
  }

  lastCatalogRequestDiagnostics = {
    tenantId,
    tenantSlug: tenantSlug ?? null,
    catalogUrl: null,
    catalogStatus: null,
    catalogError: null,
    responsePreview: null,
  }

  let lastError: string | null = null

  for (const candidateBaseUrl of baseUrlCandidates) {
    const catalogUrl = `${candidateBaseUrl}/api/tenants/public/${tenantId}/catalog`
    lastCatalogRequestDiagnostics = {
      ...lastCatalogRequestDiagnostics,
      catalogUrl,
      catalogStatus: null,
      catalogError: null,
      responsePreview: null,
    }
    console.log('[catalog] fetchTenantCatalog request', {
      tenantId,
      tenantSlug: tenantSlug ?? null,
      catalogUrl,
    })

    try {
      const response = await fetch(catalogUrl)
      const responseText = await response.text()
      const responsePreview = responseText.slice(0, 500)
      let parsedJson: TenantCatalogResponse | null = null

      lastCatalogRequestDiagnostics = {
        ...lastCatalogRequestDiagnostics,
        catalogStatus: response.status,
        responsePreview,
      }

      console.log('[catalog] fetchTenantCatalog response', {
        tenantId,
        tenantSlug: tenantSlug ?? null,
        catalogUrl,
        status: response.status,
        responsePreview,
      })

      if (!response.ok) {
        const errorData = responseText
          ? (JSON.parse(responseText) as { error?: string })
          : null
        lastError = errorData?.error || `Filialkatalog konnte nicht geladen werden (${response.status})`
        lastCatalogRequestDiagnostics = {
          ...lastCatalogRequestDiagnostics,
          catalogError: lastError,
        }
        console.error('[catalog] fetchTenantCatalog error response', {
          tenantId,
          tenantSlug: tenantSlug ?? null,
          catalogUrl,
          status: response.status,
          responsePreview,
          error: lastError,
        })
        continue
      }

      parsedJson = responseText ? (JSON.parse(responseText) as TenantCatalogResponse) : null
      if (!parsedJson) {
        lastError = 'Leere Katalogantwort'
        lastCatalogRequestDiagnostics = {
          ...lastCatalogRequestDiagnostics,
          catalogError: lastError,
        }
        console.error('[catalog] fetchTenantCatalog empty response', {
          tenantId,
          tenantSlug: tenantSlug ?? null,
          catalogUrl,
          status: response.status,
        })
        continue
      }

      return parsedJson
    } catch (error) {
      lastError = error instanceof Error ? error.message : 'Filialkatalog konnte nicht geladen werden'
      lastCatalogRequestDiagnostics = {
        ...lastCatalogRequestDiagnostics,
        catalogError: lastError,
      }
      console.error('[catalog] fetchTenantCatalog exception', {
        tenantId,
        tenantSlug: tenantSlug ?? null,
        catalogUrl,
        error: lastError,
      })
    }
  }

  throw new Error(lastError || 'Filialkatalog konnte nicht geladen werden')
}

export async function createCheckoutOrder(
  apiBaseUrl: string,
  payload: CheckoutCreateOrderRequest
): Promise<CheckoutCreateOrderResponse> {
  const normalizedApiBaseUrl = normalizeApiBaseUrl(apiBaseUrl)
  if (!normalizedApiBaseUrl) {
    throw new Error('API Base URL fehlt')
  }

  const response = await fetch(`${normalizedApiBaseUrl}/api/orders`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      tenantId: payload.tenantId,
      items: payload.items,
      sourceChannel: payload.sourceChannel ?? 'APP',
      paymentMethod: payload.paymentMethod,
      markPaid: payload.markPaid ?? false,
      forwardToKitchen: payload.forwardToKitchen ?? true,
    }),
  })

  if (!response.ok) {
    const errorData = await response.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestellung konnte nicht gesendet werden')
  }

  return response.json()
}

export async function registerAppCustomer(
  apiBaseUrl: string,
  payload: {
    email: string
    fullName: string
    password: string
    phone?: string | null
    street?: string | null
    zipCode?: string | null
    city?: string | null
    marketingOptIn?: boolean
  }
): Promise<AppAuthResponse> {
  const normalizedApiBaseUrl = normalizeApiBaseUrl(apiBaseUrl)
  if (!normalizedApiBaseUrl) {
    throw new Error('API Base URL fehlt')
  }

  const response = await fetch(`${normalizedApiBaseUrl}/api/app-auth/register`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(payload),
  })

  if (!response.ok) {
    const errorData = await response.json().catch(() => null)
    throw new Error(errorData?.error || 'Registrierung fehlgeschlagen')
  }

  return response.json()
}

export async function loginAppCustomer(
  apiBaseUrl: string,
  payload: {
    email: string
    password: string
  }
): Promise<AppAuthResponse> {
  const normalizedApiBaseUrl = normalizeApiBaseUrl(apiBaseUrl)
  if (!normalizedApiBaseUrl) {
    throw new Error('API Base URL fehlt')
  }

  const response = await fetch(`${normalizedApiBaseUrl}/api/app-auth/login`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(payload),
  })

  if (!response.ok) {
    const errorData = await response.json().catch(() => null)
    throw new Error(errorData?.error || 'Login fehlgeschlagen')
  }

  return response.json()
}

export async function fetchAppCustomerMe(
  apiBaseUrl: string,
  token: string
): Promise<AppAuthMeResponse> {
  const normalizedApiBaseUrl = normalizeApiBaseUrl(apiBaseUrl)
  if (!normalizedApiBaseUrl) {
    throw new Error('API Base URL fehlt')
  }

  const response = await fetch(`${normalizedApiBaseUrl}/api/app-auth/me`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  })

  if (!response.ok) {
    const errorData = await response.json().catch(() => null)
    throw new Error(errorData?.error || 'Konto konnte nicht geladen werden')
  }

  return response.json()
}

export async function requestAppCustomerDeletion(
  apiBaseUrl: string,
  token: string,
  note?: string
): Promise<AppDeletionRequestResponse> {
  const normalizedApiBaseUrl = normalizeApiBaseUrl(apiBaseUrl)
  if (!normalizedApiBaseUrl) {
    throw new Error('API Base URL fehlt')
  }

  const response = await fetch(`${normalizedApiBaseUrl}/api/app-auth/request-deletion`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`,
    },
    body: JSON.stringify({
      note: note || null,
    }),
  })

  if (!response.ok) {
    const errorData = await response.json().catch(() => null)
    throw new Error(errorData?.error || 'Kontoloeschung konnte nicht angefragt werden')
  }

  return response.json()
}
