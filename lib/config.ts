function resolveBrowserApiBaseUrl() {
  if (typeof window === 'undefined') {
    return process.env.NODE_ENV === 'production' ? 'https://api.klarando.com' : 'http://localhost:4000'
  }

  const hostname = window.location.hostname.toLowerCase()
  const isLocalHost = hostname === 'localhost' || hostname === '127.0.0.1' || hostname === '[::1]'

  if (isLocalHost) {
    return 'http://localhost:4000'
  }
  return 'https://api.klarando.com'
}

const envApiBaseUrl =
  process.env.NEXT_PUBLIC_API_BASE_URL?.trim() ||
  process.env.NEXT_PUBLIC_API_URL?.trim() ||
  ''

export const API_BASE_URL = (
  process.env.NODE_ENV === 'production'
    ? 'https://api.klarando.com'
    : envApiBaseUrl || resolveBrowserApiBaseUrl()
).replace(/\/+$/, '')
export const TENANT_ID = (
  process.env.NEXT_PUBLIC_DEFAULT_TENANT_ID ||
  process.env.NEXT_PUBLIC_TENANT_ID ||
  ''
).trim()

export function resolveTenantId(explicitTenantId?: string | null) {
  if (typeof explicitTenantId === 'string' && explicitTenantId.trim().length > 0) {
    return explicitTenantId.trim()
  }

  if (typeof window !== 'undefined') {
    try {
      const sessionRaw = window.localStorage.getItem('sessionUser')
      if (sessionRaw) {
        const parsed = JSON.parse(sessionRaw) as {
          tenantId?: string | null
          activeTenantId?: string | null
        }
        if (typeof parsed.activeTenantId === 'string' && parsed.activeTenantId.trim().length > 0) {
          return parsed.activeTenantId.trim()
        }
        if (typeof parsed.tenantId === 'string' && parsed.tenantId.trim().length > 0) {
          return parsed.tenantId.trim()
        }
      }
    } catch {
      // ignore malformed session payload
    }

    try {
      const token = window.localStorage.getItem('accessToken')
      if (token && token.includes('.')) {
        const [, payload] = token.split('.')
        if (payload) {
          const normalized = payload.replace(/-/g, '+').replace(/_/g, '/')
          const json = atob(normalized)
          const decoded = JSON.parse(json) as {
            tenantId?: string | null
            activeTenantId?: string | null
          }
          if (
            typeof decoded.activeTenantId === 'string' &&
            decoded.activeTenantId.trim().length > 0
          ) {
            return decoded.activeTenantId.trim()
          }
          if (typeof decoded.tenantId === 'string' && decoded.tenantId.trim().length > 0) {
            return decoded.tenantId.trim()
          }
        }
      }
    } catch {
      // ignore invalid token payload
    }

    const localTenantId = window.localStorage.getItem('tenantId')
    if (typeof localTenantId === 'string' && localTenantId.trim().length > 0) {
      return localTenantId.trim()
    }

    const fallbackTenantId = window.localStorage.getItem('klarando.defaultTenantId')
    if (typeof fallbackTenantId === 'string' && fallbackTenantId.trim().length > 0) {
      return fallbackTenantId.trim()
    }
  }

  return TENANT_ID
}
