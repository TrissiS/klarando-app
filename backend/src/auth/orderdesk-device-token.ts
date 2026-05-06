import crypto from 'crypto'

const BASE_AUTH_SECRET = process.env.JWT_SECRET || process.env.AUTH_SECRET || ''
if (!BASE_AUTH_SECRET && process.env.NODE_ENV === 'production') {
  throw new Error('JWT_SECRET oder AUTH_SECRET muss in Produktion gesetzt sein')
}
const ORDERDESK_DEVICE_SECRET = `${BASE_AUTH_SECRET || 'dev-auth-secret-change-me'}:orderdesk-device`

export type OrderDeskDeviceTokenKind = 'PAIRING' | 'SESSION'

export type OrderDeskDeviceTokenPayload = {
  sid: string
  tenantId: string
  displayCode: string
  bindingId: string | null
  deviceSerial: string | null
  deviceAlias: string | null
  kind: OrderDeskDeviceTokenKind
  iat: number
  exp: number
}

function toBase64Url(value: string) {
  return Buffer.from(value).toString('base64url')
}

function fromBase64Url(value: string) {
  return Buffer.from(value, 'base64url').toString('utf8')
}

function signPart(headerPart: string, payloadPart: string) {
  return crypto
    .createHmac('sha256', ORDERDESK_DEVICE_SECRET)
    .update(`${headerPart}.${payloadPart}`)
    .digest('base64url')
}

export function signOrderDeskDeviceToken(
  input: Omit<OrderDeskDeviceTokenPayload, 'iat' | 'exp'> & { expiresAtMs: number }
) {
  const now = Math.floor(Date.now() / 1000)
  const expiresAtSeconds = Math.max(now + 60, Math.floor(input.expiresAtMs / 1000))
  const payload: OrderDeskDeviceTokenPayload = {
    sid: input.sid,
    tenantId: input.tenantId,
    displayCode: input.displayCode,
    bindingId: input.bindingId,
    deviceSerial: input.deviceSerial,
    deviceAlias: input.deviceAlias,
    kind: input.kind,
    iat: now,
    exp: expiresAtSeconds,
  }

  const headerPart = toBase64Url(JSON.stringify({ alg: 'HS256', typ: 'JWT' }))
  const payloadPart = toBase64Url(JSON.stringify(payload))
  const signature = signPart(headerPart, payloadPart)
  return `${headerPart}.${payloadPart}.${signature}`
}

export function verifyOrderDeskDeviceToken(token: string): OrderDeskDeviceTokenPayload | null {
  const [headerPart, payloadPart, signature] = token.split('.')
  if (!headerPart || !payloadPart || !signature) {
    return null
  }

  const expected = signPart(headerPart, payloadPart)
  if (expected.length !== signature.length) {
    return null
  }
  if (!crypto.timingSafeEqual(Buffer.from(expected), Buffer.from(signature))) {
    return null
  }

  try {
    const payload = JSON.parse(fromBase64Url(payloadPart)) as OrderDeskDeviceTokenPayload
    const now = Math.floor(Date.now() / 1000)
    if (payload.exp <= now) {
      return null
    }
    if (!payload.sid || !payload.tenantId || !payload.displayCode) {
      return null
    }
    if (payload.kind !== 'PAIRING' && payload.kind !== 'SESSION') {
      return null
    }
    return payload
  } catch {
    return null
  }
}
