import crypto from 'crypto'

const RESOLVED_APP_SECRET =
  process.env.APP_AUTH_SECRET || process.env.JWT_SECRET || process.env.AUTH_SECRET || ''
if (!RESOLVED_APP_SECRET && process.env.NODE_ENV === 'production') {
  throw new Error('APP_AUTH_SECRET oder JWT_SECRET muss in Produktion gesetzt sein')
}
const APP_AUTH_SECRET = RESOLVED_APP_SECRET || 'dev-app-auth-secret-change-me'
const APP_TOKEN_TTL_SECONDS = Number(process.env.APP_AUTH_TOKEN_TTL_SECONDS || 60 * 60 * 24 * 30)

export type AppAuthTokenPayload = {
  sub: string
  email: string
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
    .createHmac('sha256', APP_AUTH_SECRET)
    .update(`${headerPart}.${payloadPart}`)
    .digest('base64url')
}

export function signAppAuthToken(input: Omit<AppAuthTokenPayload, 'iat' | 'exp'>) {
  const now = Math.floor(Date.now() / 1000)
  const payload: AppAuthTokenPayload = {
    ...input,
    iat: now,
    exp: now + APP_TOKEN_TTL_SECONDS,
  }

  const headerPart = toBase64Url(JSON.stringify({ alg: 'HS256', typ: 'JWT' }))
  const payloadPart = toBase64Url(JSON.stringify(payload))
  const signature = signPart(headerPart, payloadPart)
  return `${headerPart}.${payloadPart}.${signature}`
}

export function verifyAppAuthToken(token: string): AppAuthTokenPayload | null {
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
    const payload = JSON.parse(fromBase64Url(payloadPart)) as AppAuthTokenPayload
    if (payload.exp <= Math.floor(Date.now() / 1000)) {
      return null
    }
    return payload
  } catch {
    return null
  }
}
