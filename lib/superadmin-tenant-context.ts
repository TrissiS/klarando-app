import type { SessionUser } from './app-data'

const PREVIEW_FLAG_KEY = 'klarando.adminTenantPreview'
const TENANT_ID_KEY = 'tenantId'
const DEFAULT_TENANT_ID_KEY = 'klarando.defaultTenantId'
const ACCESS_TOKEN_KEY = 'accessToken'
const SESSION_USER_KEY = 'sessionUser'

type TenantScopeInput = {
  id: string
  name: string
  chainId: string | null
}

export function setSuperadminTenantContext(tenant: TenantScopeInput) {
  const raw = window.localStorage.getItem(SESSION_USER_KEY)
  if (!raw) {
    throw new Error('Keine aktive Sitzung gefunden.')
  }

  const parsed = JSON.parse(raw) as SessionUser
  const nextSession: SessionUser = {
    ...parsed,
    tenantId: tenant.id,
    activeTenantId: tenant.id,
    activeTenantName: tenant.name,
    chainId: tenant.chainId || null,
  }

  window.localStorage.setItem(SESSION_USER_KEY, JSON.stringify(nextSession))
  if (typeof nextSession.accessToken === 'string' && nextSession.accessToken.trim().length > 0) {
    window.localStorage.setItem(ACCESS_TOKEN_KEY, nextSession.accessToken)
  }
  window.localStorage.setItem(TENANT_ID_KEY, tenant.id)
  window.localStorage.setItem(DEFAULT_TENANT_ID_KEY, tenant.id)
  window.localStorage.setItem(PREVIEW_FLAG_KEY, '1')
}

export function clearSuperadminTenantContext() {
  const raw = window.localStorage.getItem(SESSION_USER_KEY)
  if (raw) {
    try {
      const parsed = JSON.parse(raw) as SessionUser
      const nextSession: SessionUser = {
        ...parsed,
        tenantId: null,
        activeTenantId: null,
        activeTenantName: null,
      }
      window.localStorage.setItem(SESSION_USER_KEY, JSON.stringify(nextSession))
    } catch {
      // ignore malformed session payload
    }
  }

  window.localStorage.removeItem(TENANT_ID_KEY)
  window.localStorage.removeItem(DEFAULT_TENANT_ID_KEY)
  window.localStorage.removeItem(PREVIEW_FLAG_KEY)
}

export function isSuperadminTenantPreviewEnabled() {
  return window.localStorage.getItem(PREVIEW_FLAG_KEY) === '1'
}
