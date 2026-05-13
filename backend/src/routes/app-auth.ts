import { Router } from 'express'
import { randomBytes } from 'node:crypto'
import { AppAuthProvider } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { hashPassword, needsPasswordRehash, verifyPassword } from '../auth/password'
import { signAppAuthToken, verifyAppAuthToken } from '../auth/app-token'
import { writeAuditLog } from '../lib/audit'
import { rateLimitAuthLogin, rateLimitRegistration } from '../middleware/rate-limit'

const router = Router()
const SOCIAL_PROVIDERS = ['GOOGLE', 'FACEBOOK', 'APPLE'] as const
type SocialProvider = (typeof SOCIAL_PROVIDERS)[number]

function normalizeText(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeEmail(value: unknown) {
  const text = normalizeText(value)
  if (!text) {
    return null
  }
  return text.toLowerCase()
}

function isValidEmail(value: string) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)
}

function isValidZipCode(value: string | null) {
  if (!value) {
    return true
  }
  return /^\d{5}$/.test(value.replace(/[^\d]/g, ''))
}

function parseBoolean(value: unknown) {
  if (typeof value === 'boolean') {
    return value
  }
  if (typeof value === 'string') {
    const normalized = value.trim().toLowerCase()
    return normalized === 'true' || normalized === '1' || normalized === 'yes'
  }
  return false
}

function parseSocialProvider(value: unknown): SocialProvider | null {
  if (typeof value !== 'string') {
    return null
  }
  const normalized = value.trim().toUpperCase()
  if ((SOCIAL_PROVIDERS as readonly string[]).includes(normalized)) {
    return normalized as SocialProvider
  }
  return null
}

function createRandomSecret() {
  return `${randomBytes(24).toString('hex')}!Kla1`
}

type GoogleTokenInfo = {
  sub?: string
  email?: string
  email_verified?: string | boolean
  name?: string
  aud?: string
  iss?: string
}

async function verifyGoogleIdToken(idToken: string): Promise<{
  providerUserId: string
  email: string | null
  fullName: string | null
  emailVerified: boolean
}> {
  const response = await fetch(
    `https://oauth2.googleapis.com/tokeninfo?id_token=${encodeURIComponent(idToken)}`
  )
  if (!response.ok) {
    throw new Error('GOOGLE_TOKEN_INVALID')
  }
  const payload = (await response.json()) as GoogleTokenInfo
  const providerUserId = normalizeText(payload.sub)
  if (!providerUserId) {
    throw new Error('GOOGLE_TOKEN_INVALID')
  }

  const expectedAud = normalizeText(process.env.GOOGLE_OAUTH_CLIENT_ID)
  if (expectedAud) {
    const tokenAud = normalizeText(payload.aud)
    if (!tokenAud || tokenAud !== expectedAud) {
      throw new Error('GOOGLE_AUDIENCE_MISMATCH')
    }
  }

  const issuer = normalizeText(payload.iss)
  if (issuer && issuer !== 'accounts.google.com' && issuer !== 'https://accounts.google.com') {
    throw new Error('GOOGLE_ISSUER_INVALID')
  }

  const email = normalizeEmail(payload.email)
  return {
    providerUserId,
    email,
    fullName: normalizeText(payload.name),
    emailVerified:
      payload.email_verified === true ||
      normalizeText(payload.email_verified)?.toLowerCase() === 'true',
  }
}

type FacebookDebugTokenResponse = {
  data?: {
    app_id?: string
    type?: string
    application?: string
    is_valid?: boolean
    user_id?: string
  }
}

type FacebookMeResponse = {
  id?: string
  email?: string
  name?: string
}

async function verifyFacebookAccessToken(accessToken: string): Promise<{
  providerUserId: string
  email: string | null
  fullName: string | null
}> {
  const appId = normalizeText(process.env.FACEBOOK_APP_ID)
  const appSecret = normalizeText(process.env.FACEBOOK_APP_SECRET)
  if (!appId || !appSecret) {
    throw new Error('FACEBOOK_CONFIG_MISSING')
  }

  const appToken = `${appId}|${appSecret}`
  const debugUri = new URL('https://graph.facebook.com/debug_token')
  debugUri.searchParams.set('input_token', accessToken)
  debugUri.searchParams.set('access_token', appToken)

  const debugResponse = await fetch(debugUri)
  if (!debugResponse.ok) {
    throw new Error('FACEBOOK_TOKEN_INVALID')
  }
  const debugPayload = (await debugResponse.json()) as FacebookDebugTokenResponse
  const debugData = debugPayload.data
  const isValid = Boolean(debugData?.is_valid)
  const userId = normalizeText(debugData?.user_id)
  const tokenAppId = normalizeText(debugData?.app_id)

  if (!isValid || !userId) {
    throw new Error('FACEBOOK_TOKEN_INVALID')
  }
  if (tokenAppId && tokenAppId !== appId) {
    throw new Error('FACEBOOK_APP_MISMATCH')
  }

  const meUri = new URL('https://graph.facebook.com/me')
  meUri.searchParams.set('fields', 'id,name,email')
  meUri.searchParams.set('access_token', accessToken)

  const meResponse = await fetch(meUri)
  if (!meResponse.ok) {
    throw new Error('FACEBOOK_PROFILE_INVALID')
  }
  const me = (await meResponse.json()) as FacebookMeResponse
  const providerUserId = normalizeText(me.id)
  if (!providerUserId) {
    throw new Error('FACEBOOK_PROFILE_INVALID')
  }

  return {
    providerUserId,
    email: normalizeEmail(me.email),
    fullName: normalizeText(me.name),
  }
}

function mapAppCustomerUser(account: {
  id: string
  email: string
  fullName: string
  phone: string | null
  street: string | null
  zipCode: string | null
  city: string | null
  marketingOptIn: boolean
  deletionRequestedAt: Date | null
}) {
  return {
    id: account.id,
    email: account.email,
    fullName: account.fullName,
    phone: account.phone,
    street: account.street,
    zipCode: account.zipCode,
    city: account.city,
    marketingOptIn: account.marketingOptIn,
    deletionRequestedAt: account.deletionRequestedAt,
  }
}

function normalizeZipCode(value: unknown) {
  const text = normalizeText(value)
  if (!text) {
    return null
  }
  const digits = text.replace(/[^\d]/g, '')
  return digits.length > 0 ? digits.slice(0, 5) : null
}

function readBearerToken(raw: string | undefined) {
  if (!raw || !raw.toLowerCase().startsWith('bearer ')) {
    return null
  }
  return raw.slice(7).trim()
}

async function resolveAccountFromRequest(authorizationHeader: string | undefined) {
  const token = readBearerToken(authorizationHeader)
  if (!token) {
    return null
  }

  const payload = verifyAppAuthToken(token)
  if (!payload) {
    return null
  }

  const account = await prisma.appCustomerAccount.findUnique({
    where: {
      id: payload.sub,
    },
  })

  if (!account || !account.isActive || account.email !== payload.email) {
    return null
  }

  return account
}

router.post('/register', rateLimitRegistration, async (req, res) => {
  try {
    const email = normalizeEmail((req.body as { email?: unknown }).email)
    const fullName = normalizeText((req.body as { fullName?: unknown }).fullName)
    const passwordRaw = normalizeText((req.body as { password?: unknown }).password)
    const phone = normalizeText((req.body as { phone?: unknown }).phone)
    const street = normalizeText((req.body as { street?: unknown }).street)
    const zipCode = normalizeZipCode((req.body as { zipCode?: unknown }).zipCode)
    const city = normalizeText((req.body as { city?: unknown }).city)
    const marketingOptIn = Boolean((req.body as { marketingOptIn?: unknown }).marketingOptIn)
    const privacyAccepted = parseBoolean((req.body as { privacyAccepted?: unknown }).privacyAccepted)
    const termsAccepted = parseBoolean((req.body as { termsAccepted?: unknown }).termsAccepted)

    if (!email || !fullName || !passwordRaw) {
      return res.status(400).json({ error: 'email, fullName und password sind erforderlich' })
    }

    if (!isValidEmail(email)) {
      return res.status(400).json({ error: 'E-Mail ist ungueltig' })
    }

    if (passwordRaw.length < 8) {
      return res.status(400).json({ error: 'Passwort muss mindestens 8 Zeichen haben' })
    }

    if (!isValidZipCode(zipCode)) {
      return res.status(400).json({ error: 'PLZ ist ungueltig' })
    }

    if (!privacyAccepted) {
      return res.status(400).json({ error: 'Datenschutz muss akzeptiert werden' })
    }
    if (!termsAccepted) {
      return res.status(400).json({ error: 'AGB muessen akzeptiert werden' })
    }

    const existing = await prisma.appCustomerAccount.findUnique({
      where: { email },
      select: { id: true },
    })
    if (existing) {
      return res.status(409).json({ error: 'Fuer diese E-Mail existiert bereits ein Konto' })
    }

    const created = await prisma.appCustomerAccount.create({
      data: {
        email,
        fullName,
        passwordHash: hashPassword(passwordRaw),
        phone,
        street,
        zipCode,
        city,
        marketingOptIn,
      },
    })

    await writeAuditLog({
      req,
      module: 'app-auth',
      action: 'app_customer_registered',
      targetType: 'appCustomerAccount',
      targetId: created.id,
      metadata: {
        email: created.email,
        privacyAccepted,
        termsAccepted,
      },
    })

    const token = signAppAuthToken({
      sub: created.id,
      email: created.email,
    })

    return res.status(201).json({
      token,
      user: mapAppCustomerUser(created),
    })
  } catch (error) {
    console.error('APP AUTH REGISTER ERROR:', error)
    return res.status(500).json({ error: 'Registrierung konnte nicht abgeschlossen werden' })
  }
})

router.post('/email-status', rateLimitRegistration, async (req, res) => {
  try {
    const email = normalizeEmail((req.body as { email?: unknown }).email)
    if (!email || !isValidEmail(email)) {
      return res.status(400).json({ error: 'Bitte gültige E-Mail-Adresse angeben' })
    }

    const account = await prisma.appCustomerAccount.findUnique({
      where: { email },
      select: {
        id: true,
        isActive: true,
      },
    })

    return res.json({
      exists: Boolean(account && account.isActive),
    })
  } catch (error) {
    console.error('APP AUTH EMAIL STATUS ERROR:', error)
    return res.status(500).json({ error: 'E-Mail-Status konnte nicht geprüft werden' })
  }
})

router.post('/login', rateLimitAuthLogin, async (req, res) => {
  try {
    const email = normalizeEmail((req.body as { email?: unknown }).email)
    const passwordRaw = normalizeText((req.body as { password?: unknown }).password)

    if (!email || !passwordRaw) {
      return res.status(400).json({ error: 'email und password fehlen' })
    }

    const account = await prisma.appCustomerAccount.findUnique({
      where: { email },
    })

    if (!account || !account.isActive || !verifyPassword(passwordRaw, account.passwordHash)) {
      return res.status(401).json({ error: 'Login fehlgeschlagen' })
    }

    const updated = await prisma.appCustomerAccount.update({
      where: { id: account.id },
      data: {
        lastLoginAt: new Date(),
        passwordHash: needsPasswordRehash(account.passwordHash)
          ? hashPassword(passwordRaw)
          : account.passwordHash,
      },
    })

    await writeAuditLog({
      req,
      module: 'app-auth',
      action: 'app_customer_login_success',
      targetType: 'appCustomerAccount',
      targetId: updated.id,
      metadata: {
        email: updated.email,
      },
    })

    const token = signAppAuthToken({
      sub: updated.id,
      email: updated.email,
    })

    return res.json({
      token,
      user: mapAppCustomerUser(updated),
    })
  } catch (error) {
    console.error('APP AUTH LOGIN ERROR:', error)
    return res.status(500).json({ error: 'Login konnte nicht verarbeitet werden' })
  }
})

router.post('/social-quickstart', rateLimitRegistration, async (req, res) => {
  try {
    const provider = parseSocialProvider((req.body as { provider?: unknown }).provider)
    const email = normalizeEmail((req.body as { email?: unknown }).email)
    const fullName = normalizeText((req.body as { fullName?: unknown }).fullName)
    const phone = normalizeText((req.body as { phone?: unknown }).phone)
    const street = normalizeText((req.body as { street?: unknown }).street)
    const zipCode = normalizeZipCode((req.body as { zipCode?: unknown }).zipCode)
    const city = normalizeText((req.body as { city?: unknown }).city)
    const marketingOptIn = parseBoolean((req.body as { marketingOptIn?: unknown }).marketingOptIn)
    const privacyAccepted = parseBoolean((req.body as { privacyAccepted?: unknown }).privacyAccepted)
    const termsAccepted = parseBoolean((req.body as { termsAccepted?: unknown }).termsAccepted)

    if (!provider) {
      return res
        .status(400)
        .json({ error: 'provider muss GOOGLE, FACEBOOK oder APPLE sein' })
    }
    if (!email || !isValidEmail(email)) {
      return res.status(400).json({ error: 'E-Mail ist ungueltig' })
    }
    if (!fullName) {
      return res.status(400).json({ error: 'fullName ist erforderlich' })
    }
    if (!isValidZipCode(zipCode)) {
      return res.status(400).json({ error: 'PLZ ist ungueltig' })
    }
    if (!privacyAccepted || !termsAccepted) {
      return res
        .status(400)
        .json({ error: 'Datenschutz und AGB muessen fuer Schnellkonto akzeptiert werden' })
    }

    const existing = await prisma.appCustomerAccount.findUnique({
      where: { email },
    })

    const account = existing
      ? await prisma.appCustomerAccount.update({
          where: { id: existing.id },
          data: {
            fullName: fullName || existing.fullName,
            phone: phone ?? existing.phone,
            street: street ?? existing.street,
            zipCode: zipCode ?? existing.zipCode,
            city: city ?? existing.city,
            marketingOptIn,
            lastLoginAt: new Date(),
          },
        })
      : await prisma.appCustomerAccount.create({
          data: {
            email,
            fullName,
            passwordHash: hashPassword(createRandomSecret()),
            phone,
            street,
            zipCode,
            city,
            marketingOptIn,
            isActive: true,
            lastLoginAt: new Date(),
          },
        })

    await writeAuditLog({
      req,
      module: 'app-auth',
      action: existing ? 'app_customer_social_login' : 'app_customer_social_registered',
      targetType: 'appCustomerAccount',
      targetId: account.id,
      metadata: {
        email: account.email,
        provider,
        privacyAccepted,
        termsAccepted,
      },
    })

    const token = signAppAuthToken({
      sub: account.id,
      email: account.email,
    })

    return res.status(existing ? 200 : 201).json({
      token,
      user: mapAppCustomerUser(account),
      provider,
    })
  } catch (error) {
    console.error('APP AUTH SOCIAL QUICKSTART ERROR:', error)
    return res.status(500).json({ error: 'Schnellkonto konnte nicht verarbeitet werden' })
  }
})

router.post('/social/google', rateLimitAuthLogin, async (req, res) => {
  try {
    const idToken = normalizeText((req.body as { idToken?: unknown }).idToken)
    const fallbackEmail = normalizeEmail((req.body as { email?: unknown }).email)
    const fallbackName = normalizeText((req.body as { name?: unknown }).name)
    if (!idToken) {
      return res.status(400).json({ error: 'idToken fehlt' })
    }

    const verified = await verifyGoogleIdToken(idToken)
    const email = verified.email ?? fallbackEmail
    if (!email || !isValidEmail(email)) {
      return res.status(400).json({ error: 'Google-Konto liefert keine gültige E-Mail-Adresse' })
    }

    const result = await prisma.$transaction(async (tx) => {
      const providerLink = await tx.appCustomerAuthProvider.findUnique({
        where: {
          provider_providerUserId: {
            provider: AppAuthProvider.GOOGLE,
            providerUserId: verified.providerUserId,
          },
        },
        include: {
          appCustomer: true,
        },
      })

      let account = providerLink?.appCustomer ?? null
      if (!account) {
        account = await tx.appCustomerAccount.findUnique({
          where: { email },
        })
      }

      if (!account) {
        const generatedName =
          verified.fullName ?? fallbackName ?? email.split('@')[0] ?? 'Klarando Kunde'
        account = await tx.appCustomerAccount.create({
          data: {
            email,
            fullName: generatedName,
            passwordHash: hashPassword(createRandomSecret()),
            isActive: true,
            lastLoginAt: new Date(),
          },
        })
      } else {
        account = await tx.appCustomerAccount.update({
          where: { id: account.id },
          data: {
            fullName: verified.fullName ?? fallbackName ?? account.fullName,
            isActive: true,
            lastLoginAt: new Date(),
          },
        })
      }

      await tx.appCustomerAuthProvider.upsert({
        where: {
          provider_providerUserId: {
            provider: AppAuthProvider.GOOGLE,
            providerUserId: verified.providerUserId,
          },
        },
        update: {
          appCustomerId: account.id,
          email,
          emailVerified: verified.emailVerified,
          metadata: {
            linkedAt: new Date().toISOString(),
          },
        },
        create: {
          appCustomerId: account.id,
          provider: AppAuthProvider.GOOGLE,
          providerUserId: verified.providerUserId,
          email,
          emailVerified: verified.emailVerified,
          metadata: {
            linkedAt: new Date().toISOString(),
          },
        },
      })

      return account
    })

    await writeAuditLog({
      req,
      module: 'app-auth',
      action: 'app_customer_social_google_login',
      targetType: 'appCustomerAccount',
      targetId: result.id,
      metadata: {
        email: result.email,
      },
    })

    const token = signAppAuthToken({
      sub: result.id,
      email: result.email,
    })

    return res.json({
      token,
      user: mapAppCustomerUser(result),
    })
  } catch (error) {
    if (error instanceof Error) {
      if (
        error.message === 'GOOGLE_TOKEN_INVALID' ||
        error.message === 'GOOGLE_AUDIENCE_MISMATCH' ||
        error.message === 'GOOGLE_ISSUER_INVALID'
      ) {
        return res.status(401).json({ error: 'Google-Anmeldung konnte nicht verifiziert werden' })
      }
    }
    console.error('APP AUTH SOCIAL GOOGLE ERROR:', error)
    return res.status(500).json({ error: 'Google-Anmeldung konnte nicht verarbeitet werden' })
  }
})

router.post('/social/facebook', rateLimitAuthLogin, async (req, res) => {
  try {
    const accessToken = normalizeText((req.body as { accessToken?: unknown }).accessToken)
    const manualEmail = normalizeEmail((req.body as { email?: unknown }).email)
    if (!accessToken) {
      return res.status(400).json({ error: 'accessToken fehlt' })
    }

    const verified = await verifyFacebookAccessToken(accessToken)
    const email = verified.email ?? manualEmail
    if (!email || !isValidEmail(email)) {
      return res.status(400).json({
        error: 'Facebook liefert keine E-Mail. Bitte E-Mail im Login ergänzen.',
        code: 'EMAIL_REQUIRED',
      })
    }

    const result = await prisma.$transaction(async (tx) => {
      const providerLink = await tx.appCustomerAuthProvider.findUnique({
        where: {
          provider_providerUserId: {
            provider: AppAuthProvider.FACEBOOK,
            providerUserId: verified.providerUserId,
          },
        },
        include: {
          appCustomer: true,
        },
      })

      let account = providerLink?.appCustomer ?? null
      if (!account) {
        account = await tx.appCustomerAccount.findUnique({
          where: { email },
        })
      }

      if (!account) {
        account = await tx.appCustomerAccount.create({
          data: {
            email,
            fullName: verified.fullName ?? email.split('@')[0] ?? 'Klarando Kunde',
            passwordHash: hashPassword(createRandomSecret()),
            isActive: true,
            lastLoginAt: new Date(),
          },
        })
      } else {
        account = await tx.appCustomerAccount.update({
          where: { id: account.id },
          data: {
            fullName: verified.fullName ?? account.fullName,
            isActive: true,
            lastLoginAt: new Date(),
          },
        })
      }

      await tx.appCustomerAuthProvider.upsert({
        where: {
          provider_providerUserId: {
            provider: AppAuthProvider.FACEBOOK,
            providerUserId: verified.providerUserId,
          },
        },
        update: {
          appCustomerId: account.id,
          email,
          emailVerified: true,
          metadata: {
            linkedAt: new Date().toISOString(),
          },
        },
        create: {
          appCustomerId: account.id,
          provider: AppAuthProvider.FACEBOOK,
          providerUserId: verified.providerUserId,
          email,
          emailVerified: true,
          metadata: {
            linkedAt: new Date().toISOString(),
          },
        },
      })

      return account
    })

    await writeAuditLog({
      req,
      module: 'app-auth',
      action: 'app_customer_social_facebook_login',
      targetType: 'appCustomerAccount',
      targetId: result.id,
      metadata: {
        email: result.email,
      },
    })

    const token = signAppAuthToken({
      sub: result.id,
      email: result.email,
    })

    return res.json({
      token,
      user: mapAppCustomerUser(result),
    })
  } catch (error) {
    if (error instanceof Error) {
      if (
        error.message === 'FACEBOOK_CONFIG_MISSING' ||
        error.message === 'FACEBOOK_TOKEN_INVALID' ||
        error.message === 'FACEBOOK_PROFILE_INVALID' ||
        error.message === 'FACEBOOK_APP_MISMATCH'
      ) {
        return res.status(401).json({ error: 'Facebook-Anmeldung konnte nicht verifiziert werden' })
      }
    }
    console.error('APP AUTH SOCIAL FACEBOOK ERROR:', error)
    return res.status(500).json({ error: 'Facebook-Anmeldung konnte nicht verarbeitet werden' })
  }
})

router.get('/me', async (req, res) => {
  try {
    const account = await resolveAccountFromRequest(req.header('authorization') || undefined)
    if (!account) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    return res.json({
      user: mapAppCustomerUser(account),
    })
  } catch (error) {
    console.error('APP AUTH ME ERROR:', error)
    return res.status(500).json({ error: 'Konto konnte nicht geladen werden' })
  }
})

router.patch('/me', async (req, res) => {
  try {
    const account = await resolveAccountFromRequest(req.header('authorization') || undefined)
    if (!account) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    const fullName = normalizeText((req.body as { fullName?: unknown }).fullName)
    const phone = normalizeText((req.body as { phone?: unknown }).phone)
    const street = normalizeText((req.body as { street?: unknown }).street)
    const zipCode = normalizeZipCode((req.body as { zipCode?: unknown }).zipCode)
    const city = normalizeText((req.body as { city?: unknown }).city)
    const marketingOptIn = parseBoolean((req.body as { marketingOptIn?: unknown }).marketingOptIn)

    if (!fullName) {
      return res.status(400).json({ error: 'fullName ist erforderlich' })
    }
    if (!isValidZipCode(zipCode)) {
      return res.status(400).json({ error: 'PLZ ist ungueltig' })
    }

    const updated = await prisma.appCustomerAccount.update({
      where: { id: account.id },
      data: {
        fullName,
        phone,
        street,
        zipCode,
        city,
        marketingOptIn,
      },
    })

    await writeAuditLog({
      req,
      module: 'app-auth',
      action: 'app_customer_profile_updated',
      targetType: 'appCustomerAccount',
      targetId: updated.id,
      metadata: {
        email: updated.email,
      },
    })

    return res.json({
      user: mapAppCustomerUser(updated),
    })
  } catch (error) {
    console.error('APP AUTH UPDATE PROFILE ERROR:', error)
    return res.status(500).json({ error: 'Profil konnte nicht gespeichert werden' })
  }
})

router.post('/request-deletion', async (req, res) => {
  try {
    const account = await resolveAccountFromRequest(req.header('authorization') || undefined)
    if (!account) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }

    const note = normalizeText((req.body as { note?: unknown }).note)

    const updated = await prisma.appCustomerAccount.update({
      where: { id: account.id },
      data: {
        deletionRequestedAt: account.deletionRequestedAt || new Date(),
        deletionRequestNote: note,
      },
    })

    await writeAuditLog({
      req,
      module: 'app-auth',
      action: 'app_customer_deletion_requested',
      targetType: 'appCustomerAccount',
      targetId: updated.id,
      metadata: {
        email: updated.email,
      },
    })

    return res.json({
      ok: true,
      deletionRequestedAt: updated.deletionRequestedAt,
    })
  } catch (error) {
    console.error('APP AUTH REQUEST DELETION ERROR:', error)
    return res.status(500).json({ error: 'Kontoloeschung konnte nicht angefragt werden' })
  }
})

export default router
