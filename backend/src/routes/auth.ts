import { Router } from 'express'
import crypto from 'crypto'
import { PermissionKey, UserRole } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { getDefaultPermissions, DEFAULT_ROLE_PERMISSIONS } from '../auth/permissions'
import { hashPassword, needsPasswordRehash, verifyPassword } from '../auth/password'
import { signAuthToken } from '../auth/token'
import { requireAuth, requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { rateLimitAuthLogin } from '../middleware/rate-limit'
import { isMailConfigured, sendMail } from '../lib/mail'

const router = Router()

type LoginBody = {
  email?: string
  password?: string
}

type ForgotPasswordBody = {
  email?: string
}

type ResetPasswordBody = {
  token?: string
  password?: string
}

function validatePasswordRules(value: string) {
  const trimmed = value.trim()
  if (trimmed.length < 10) {
    return 'Passwort muss mindestens 10 Zeichen lang sein.'
  }
  if (!/[A-Z]/.test(trimmed) || !/[a-z]/.test(trimmed) || !/[0-9]/.test(trimmed)) {
    return 'Passwort muss Groß-/Kleinbuchstaben und Zahlen enthalten.'
  }
  return null
}

function hashResetToken(token: string) {
  return crypto.createHash('sha256').update(token).digest('hex')
}

function buildPasswordResetLink(token: string) {
  const appUrl = (process.env.PUBLIC_APP_URL || 'http://localhost:3000').trim().replace(/\/+$/, '')
  return `${appUrl}/reset-password?token=${encodeURIComponent(token)}`
}

async function loadSupportedUserRolesFromDatabase() {
  try {
    const rows = await prisma.$queryRawUnsafe<Array<{ role: string }>>(
      'SELECT unnest(enum_range(NULL::"UserRole"))::text AS role'
    )
    return new Set(rows.map((entry) => entry.role))
  } catch (error) {
    console.warn('LOAD USER ROLE ENUM ERROR:', error)
    return null
  }
}

async function seedRolePermissions() {
  try {
    const supportedRoles = await loadSupportedUserRolesFromDatabase()
    const rows = Object.entries(DEFAULT_ROLE_PERMISSIONS).flatMap(([role, permissions]) =>
      (supportedRoles && !supportedRoles.has(role)
        ? []
        : permissions.map((permission) => ({
            role: role as UserRole,
            permission,
          })))
    )

    if (rows.length === 0) {
      return
    }

    await prisma.rolePermission.createMany({
      data: rows,
      skipDuplicates: true,
    })
  } catch (error) {
    console.error('SEED ROLE PERMISSIONS ERROR:', error)
  }
}

async function resolvePermissionsForUser(userId: string, role: UserRole) {
  const dbRolePermissions = await prisma.rolePermission.findMany({
    where: { role },
    select: { permission: true },
  })

  const rolePermissions =
    dbRolePermissions.length > 0
      ? dbRolePermissions.map((entry) => entry.permission)
      : getDefaultPermissions(role)

  const userPermissions = await prisma.userPermission.findMany({
    where: { userId },
    select: { permission: true, allowed: true },
  })

  const effective = new Set<PermissionKey>(rolePermissions)

  for (const entry of userPermissions) {
    if (entry.allowed) {
      effective.add(entry.permission)
      continue
    }

    effective.delete(entry.permission)
  }

  return Array.from(effective)
}

router.post('/bootstrap-superadmin', async (req, res) => {
  try {
    const { email, password, name } = req.body as {
      email?: string
      password?: string
      name?: string
    }

    if (!email || !password) {
      return res.status(400).json({ error: 'email und password sind erforderlich' })
    }

    const normalizedEmail = email.trim().toLowerCase()
    const superadminCount = await prisma.user.count({
      where: { role: UserRole.SUPERADMIN },
    })

    if (superadminCount > 0 && req.authUser?.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Bootstrap nur fuer Superadmin erlaubt' })
    }

    await seedRolePermissions()

    const created = await prisma.user.create({
      data: {
        email: normalizedEmail,
        name: name?.trim() || 'Superadmin',
        passwordHash: hashPassword(password),
        role: UserRole.SUPERADMIN,
      },
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        createdAt: true,
      },
    })

    await writeAuditLog({
      req,
      module: 'auth',
      action: 'bootstrap_superadmin',
      targetType: 'user',
      targetId: created.id,
      metadata: { email: created.email },
    })

    return res.status(201).json(created)
  } catch (error) {
    console.error('BOOTSTRAP SUPERADMIN ERROR:', error)
    return res.status(500).json({ error: 'Superadmin konnte nicht erstellt werden' })
  }
})

router.post('/login', rateLimitAuthLogin, async (req, res) => {
  try {
    const { email, password } = req.body as LoginBody

    if (!email || !password) {
      return res.status(400).json({ error: 'email und password fehlen' })
    }

    const normalizedEmail = email.trim().toLowerCase()
    const user = await prisma.user.findUnique({
      where: { email: normalizedEmail },
    })

    if (!user || !user.isActive || !verifyPassword(password, user.passwordHash)) {
      await writeAuditLog({
        req,
        module: 'auth',
        action: 'login_failed',
        metadata: { email: normalizedEmail },
      })

      return res.status(401).json({ error: 'Login fehlgeschlagen' })
    }

    if (needsPasswordRehash(user.passwordHash)) {
      await prisma.user.update({
        where: { id: user.id },
        data: {
          passwordHash: hashPassword(password),
        },
      })
    }

    const permissions = await resolvePermissionsForUser(user.id, user.role)

    const token = signAuthToken({
      sub: user.id,
      email: user.email,
      role: user.role,
      chainId: user.chainId,
      tenantId: user.tenantId,
    })

    await writeAuditLog({
      req,
      module: 'auth',
      action: 'login_success',
      targetType: 'user',
      targetId: user.id,
      chainId: user.chainId,
      tenantId: user.tenantId,
    })

    return res.json({
      token,
      user: {
        id: user.id,
        email: user.email,
        name: user.name,
        role: user.role,
        chainId: user.chainId,
        tenantId: user.tenantId,
      },
      permissions,
    })
  } catch (error) {
    console.error('LOGIN ERROR:', error)
    return res.status(500).json({ error: 'Login konnte nicht verarbeitet werden' })
  }
})

router.post('/forgot-password', async (req, res) => {
  const genericMessage =
    'Wenn ein Konto mit dieser E-Mail existiert, wurde ein Link zum Zurücksetzen versendet.'
  try {
    const { email } = req.body as ForgotPasswordBody
    const normalizedEmail = typeof email === 'string' ? email.trim().toLowerCase() : ''
    if (!normalizedEmail) {
      return res.json({ ok: true, message: genericMessage })
    }

    const user = await prisma.user.findUnique({
      where: { email: normalizedEmail },
      select: {
        id: true,
        email: true,
        isActive: true,
        tenantId: true,
        chainId: true,
      },
    })

    if (user && user.isActive) {
      const rawToken = crypto.randomBytes(32).toString('hex')
      const tokenHash = hashResetToken(rawToken)
      const expiresAt = new Date(Date.now() + 30 * 60 * 1000)

      await prisma.passwordResetToken.create({
        data: {
          userId: user.id,
          tokenHash,
          expiresAt,
          requestedIp: req.ip || req.socket.remoteAddress || null,
          userAgent: req.get('user-agent') || null,
        },
      })

      const resetLink = buildPasswordResetLink(rawToken)
      const subject = 'Klarando Passwort zurücksetzen'
      const text = `Hallo,\n\nhier ist dein Link zum Zurücksetzen deines Passworts:\n${resetLink}\n\nDer Link ist 30 Minuten gültig und nur einmal nutzbar.\nWenn du das nicht angefordert hast, ignoriere diese E-Mail.\n\nViele Grüße\nKlarando`
      const html = `
        <p>Hallo,</p>
        <p>hier ist dein Link zum Zurücksetzen deines Passworts:</p>
        <p><a href="${resetLink}">${resetLink}</a></p>
        <p>Der Link ist <strong>30 Minuten</strong> gültig und nur einmal nutzbar.</p>
        <p>Wenn du das nicht angefordert hast, ignoriere diese E-Mail.</p>
        <p>Viele Grüße<br/>Klarando</p>
      `

      try {
        if (isMailConfigured()) {
          await sendMail({
            to: user.email,
            subject,
            text,
            html,
          })
        } else {
          console.warn('FORGOT PASSWORD MAIL SKIPPED: SMTP nicht konfiguriert')
        }
      } catch (mailError) {
        console.error('FORGOT PASSWORD MAIL ERROR:', mailError)
      }

      await writeAuditLog({
        req,
        module: 'auth',
        action: 'password_reset_requested',
        targetType: 'user',
        targetId: user.id,
        chainId: user.chainId,
        tenantId: user.tenantId,
      })
    }

    return res.json({ ok: true, message: genericMessage })
  } catch (error) {
    console.error('FORGOT PASSWORD ERROR:', error)
    return res.json({ ok: true, message: genericMessage })
  }
})

router.post('/reset-password', async (req, res) => {
  try {
    const { token, password } = req.body as ResetPasswordBody
    if (!token || !password) {
      return res.status(400).json({ error: 'Token und Passwort sind erforderlich.' })
    }

    const passwordValidationError = validatePasswordRules(password)
    if (passwordValidationError) {
      return res.status(400).json({ error: passwordValidationError })
    }

    const tokenHash = hashResetToken(token)
    const resetToken = await prisma.passwordResetToken.findUnique({
      where: { tokenHash },
      include: {
        user: {
          select: {
            id: true,
            email: true,
            chainId: true,
            tenantId: true,
            isActive: true,
          },
        },
      },
    })

    if (
      !resetToken ||
      resetToken.usedAt ||
      resetToken.expiresAt.getTime() < Date.now() ||
      !resetToken.user?.isActive
    ) {
      return res.status(400).json({ error: 'Reset-Link ist ungültig oder abgelaufen.' })
    }

    await prisma.$transaction(async (tx) => {
      await tx.user.update({
        where: { id: resetToken.userId },
        data: {
          passwordHash: hashPassword(password),
        },
      })

      await tx.passwordResetToken.update({
        where: { id: resetToken.id },
        data: {
          usedAt: new Date(),
        },
      })

      await tx.passwordResetToken.updateMany({
        where: {
          userId: resetToken.userId,
          usedAt: null,
          id: { not: resetToken.id },
        },
        data: {
          usedAt: new Date(),
        },
      })
    })

    await writeAuditLog({
      req,
      module: 'auth',
      action: 'password_reset_success',
      targetType: 'user',
      targetId: resetToken.user.id,
      chainId: resetToken.user.chainId,
      tenantId: resetToken.user.tenantId,
    })

    return res.json({ ok: true, message: 'Passwort wurde erfolgreich zurückgesetzt.' })
  } catch (error) {
    console.error('RESET PASSWORD ERROR:', error)
    return res.status(500).json({ error: 'Passwort konnte nicht zurückgesetzt werden.' })
  }
})

router.get('/me', requireAuth, async (req, res) => {
  if (!req.authUser) {
    return res.status(401).json({ error: 'Nicht eingeloggt' })
  }

  return res.json({
    user: {
      id: req.authUser.id,
      email: req.authUser.email,
      name: req.authUser.name,
      role: req.authUser.role,
      chainId: req.authUser.chainId,
      tenantId: req.authUser.tenantId,
    },
    permissions: Array.from(req.authUser.permissions),
  })
})

router.get('/permissions/matrix', requirePermission(PermissionKey.USERS_READ), async (_req, res) => {
  try {
    await seedRolePermissions()

    const rows = await prisma.rolePermission.findMany({
      orderBy: [{ role: 'asc' }, { permission: 'asc' }],
    })

    return res.json(rows)
  } catch (error) {
    console.error('GET PERMISSION MATRIX ERROR:', error)
    return res.status(500).json({ error: 'Permissions konnten nicht geladen werden' })
  }
})

export { seedRolePermissions }
export default router
