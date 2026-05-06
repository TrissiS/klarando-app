import crypto from 'crypto'

type EntryStatus = 'in_progress' | 'completed'
type EntrySource = 'explicit' | 'derived'

type IdempotencyEntry = {
  key: string
  fingerprint: string
  status: EntryStatus
  source: EntrySource
  orderId: string | null
  expiresAt: number
  updatedAt: number
}

export type BeginOrderCreateResult =
  | {
      status: 'proceed'
      reservation: {
        key: string
        fingerprint: string
      }
    }
  | {
      status: 'in_progress'
    }
  | {
      status: 'replay'
      orderId: string | null
    }
  | {
      status: 'conflict'
      reason: 'payload_mismatch'
    }

const DEFAULT_DERIVED_TTL_MS = 45_000
const DEFAULT_EXPLICIT_TTL_MS = 10 * 60 * 1000
const CLEANUP_INTERVAL_MS = 30_000

const idempotencyStore = new Map<string, IdempotencyEntry>()
let lastCleanupAt = 0

function normalizeIdempotencyKey(input: unknown) {
  if (typeof input !== 'string') {
    return null
  }
  const trimmed = input.trim()
  if (!trimmed) {
    return null
  }
  if (trimmed.length > 150) {
    return null
  }
  if (!/^[A-Za-z0-9._:-]+$/.test(trimmed)) {
    return null
  }
  return trimmed
}

function stableSerialize(value: unknown): string {
  if (value === null || value === undefined) {
    return 'null'
  }
  if (typeof value !== 'object') {
    return JSON.stringify(value)
  }
  if (Array.isArray(value)) {
    return `[${value.map((entry) => stableSerialize(entry)).join(',')}]`
  }
  const source = value as Record<string, unknown>
  const sortedKeys = Object.keys(source).sort((left, right) => left.localeCompare(right))
  return `{${sortedKeys
    .map((key) => `${JSON.stringify(key)}:${stableSerialize(source[key])}`)
    .join(',')}}`
}

function toFingerprint(value: unknown) {
  const serialized = stableSerialize(value)
  return crypto.createHash('sha256').update(serialized).digest('hex')
}

function cleanupExpiredEntries(now: number) {
  if (now - lastCleanupAt < CLEANUP_INTERVAL_MS) {
    return
  }
  lastCleanupAt = now
  for (const [key, entry] of idempotencyStore.entries()) {
    if (entry.expiresAt <= now) {
      idempotencyStore.delete(key)
    }
  }
}

export function extractOrderIdempotencyKey(
  headerValue: string | string[] | undefined,
  bodyValue: unknown
) {
  if (Array.isArray(headerValue)) {
    for (const value of headerValue) {
      const normalized = normalizeIdempotencyKey(value)
      if (normalized) {
        return normalized
      }
    }
  } else {
    const normalizedHeader = normalizeIdempotencyKey(headerValue)
    if (normalizedHeader) {
      return normalizedHeader
    }
  }
  return normalizeIdempotencyKey(bodyValue)
}

export function beginOrderCreateIdempotency(params: {
  tenantId: string
  routeKey: 'orders' | 'order-terminals'
  idempotencyKey: string | null
  fingerprintPayload: unknown
}) : BeginOrderCreateResult {
  const now = Date.now()
  cleanupExpiredEntries(now)

  const fingerprint = toFingerprint(params.fingerprintPayload)
  const source: EntrySource = params.idempotencyKey ? 'explicit' : 'derived'
  const rawKey = params.idempotencyKey ?? `auto:${fingerprint}`
  const storeKey = `${params.routeKey}:${params.tenantId}:${rawKey}`
  const entry = idempotencyStore.get(storeKey)

  if (entry && entry.expiresAt > now) {
    if (entry.fingerprint !== fingerprint) {
      return {
        status: 'conflict',
        reason: 'payload_mismatch',
      }
    }
    if (entry.status === 'in_progress') {
      return {
        status: 'in_progress',
      }
    }
    return {
      status: 'replay',
      orderId: entry.orderId,
    }
  }

  const ttl = source === 'explicit' ? DEFAULT_EXPLICIT_TTL_MS : DEFAULT_DERIVED_TTL_MS
  idempotencyStore.set(storeKey, {
    key: storeKey,
    fingerprint,
    status: 'in_progress',
    source,
    orderId: null,
    expiresAt: now + ttl,
    updatedAt: now,
  })

  return {
    status: 'proceed',
    reservation: {
      key: storeKey,
      fingerprint,
    },
  }
}

export function completeOrderCreateIdempotency(
  reservation: {
    key: string
    fingerprint: string
  },
  orderId: string
) {
  const current = idempotencyStore.get(reservation.key)
  if (!current || current.fingerprint !== reservation.fingerprint) {
    return
  }
  const now = Date.now()
  const ttl = current.source === 'explicit' ? DEFAULT_EXPLICIT_TTL_MS : DEFAULT_DERIVED_TTL_MS
  current.status = 'completed'
  current.orderId = orderId
  current.expiresAt = now + ttl
  current.updatedAt = now
  idempotencyStore.set(reservation.key, current)
}

export function releaseOrderCreateIdempotency(reservation: {
  key: string
  fingerprint: string
}) {
  const current = idempotencyStore.get(reservation.key)
  if (!current || current.fingerprint !== reservation.fingerprint) {
    return
  }
  if (current.status === 'in_progress') {
    idempotencyStore.delete(reservation.key)
  }
}
