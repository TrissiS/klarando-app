import { API_BASE_URL } from './config'

const DEFAULT_TIMEOUT_MS = 20_000

type ApiJsonErrorPayload = {
  error?: string
  message?: string
  code?: string
  details?: string
}

export function normalizeApiPath(path: string): string {
  const trimmed = path.trim()
  if (!trimmed) {
    return '/api'
  }

  if (/^https?:\/\//i.test(trimmed)) {
    return trimmed
  }

  const withLeadingSlash = trimmed.startsWith('/') ? trimmed : `/${trimmed}`
  return withLeadingSlash.replace(/^\/api\/api(?=\/|$)/i, '/api')
}

function buildApiUrl(path: string): string {
  const normalizedPath = normalizeApiPath(path)
  if (/^https?:\/\//i.test(normalizedPath)) {
    return normalizedPath
  }
  return `${API_BASE_URL}${normalizedPath}`
}

async function safeParseJson(response: Response): Promise<ApiJsonErrorPayload | null> {
  const text = await response.text()
  if (!text) {
    return null
  }

  try {
    return JSON.parse(text) as ApiJsonErrorPayload
  } catch {
    return { message: text }
  }
}

function resolveErrorMessage(payload: ApiJsonErrorPayload | null, fallback: string): string {
  if (!payload) {
    return fallback
  }
  return payload.message || payload.error || payload.details || fallback
}

export async function apiFetch(path: string, options: RequestInit = {}): Promise<Response> {
  const timeoutController = new AbortController()
  const timeoutId = setTimeout(() => timeoutController.abort(), DEFAULT_TIMEOUT_MS)

  if (options.signal) {
    if (options.signal.aborted) {
      timeoutController.abort()
    } else {
      options.signal.addEventListener('abort', () => timeoutController.abort(), { once: true })
    }
  }

  const url = buildApiUrl(path)

  if (process.env.NODE_ENV !== 'production') {
    console.debug(`[apiFetch] ${options.method ?? 'GET'} ${url}`)
  }

  try {
    return await globalThis.fetch(url, {
      ...options,
      signal: timeoutController.signal,
    })
  } catch (error) {
    if (error instanceof Error && error.name === 'AbortError') {
      throw new Error('Der Server antwortet nicht. Bitte später erneut versuchen.')
    }

    if (process.env.NODE_ENV !== 'production') {
      console.debug('[apiFetch] Netzwerkfehler', { url, error })
    }

    throw new Error('Die Verbindung zum Server ist aktuell nicht verfügbar. Bitte später erneut versuchen.')
  } finally {
    clearTimeout(timeoutId)
  }
}

export async function apiJson<T>(path: string, options: RequestInit = {}, fallbackError?: string): Promise<T> {
  const response = await apiFetch(path, options)
  const payload = await safeParseJson(response)

  if (!response.ok) {
    throw new Error(resolveErrorMessage(payload, fallbackError || 'Die Anfrage konnte nicht verarbeitet werden.'))
  }

  return (payload ?? {}) as T
}

