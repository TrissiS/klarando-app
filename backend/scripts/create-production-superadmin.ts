import { PermissionKey, UserRole } from '@prisma/client'
import { prisma } from '../src/lib/prisma'
import { DEFAULT_ROLE_PERMISSIONS } from '../src/auth/permissions'
import { hashPassword } from '../src/auth/password'

const MIN_PASSWORD_LENGTH = 12

function isProductionEnvironment() {
  return (process.env.NODE_ENV || '').toLowerCase() === 'production'
}

function requireEnv(name: string) {
  const value = process.env[name]
  if (!value || value.trim().length === 0) {
    throw new Error(`ENV ${name} ist erforderlich.`)
  }

  return value.trim()
}

function assertBootstrapGuards() {
  if (!isProductionEnvironment()) {
    throw new Error('Bootstrap ist nur mit NODE_ENV=production erlaubt.')
  }

  if (process.env.ALLOW_PRODUCTION_ADMIN_BOOTSTRAP !== 'true') {
    throw new Error(
      'Bootstrap ist blockiert. Setze ALLOW_PRODUCTION_ADMIN_BOOTSTRAP=true für einen expliziten Run.'
    )
  }
}

function normalizeEmail(rawEmail: string) {
  return rawEmail.trim().toLowerCase()
}

function assertPasswordStrength(password: string) {
  if (password.length < MIN_PASSWORD_LENGTH) {
    throw new Error(`BOOTSTRAP_ADMIN_PASSWORD muss mindestens ${MIN_PASSWORD_LENGTH} Zeichen lang sein.`)
  }
}

function isPasswordResetAllowed() {
  return process.env.BOOTSTRAP_ADMIN_RESET_PASSWORD === 'true'
}

async function seedSuperadminPermissions() {
  const superadminPermissions = DEFAULT_ROLE_PERMISSIONS[UserRole.SUPERADMIN] ?? []
  const rows = superadminPermissions.map((permission) => ({
    role: UserRole.SUPERADMIN,
    permission: permission as PermissionKey,
  }))

  if (rows.length === 0) {
    throw new Error('Es konnten keine SUPERADMIN-Standardrechte geladen werden.')
  }

  await prisma.rolePermission.createMany({
    data: rows,
    skipDuplicates: true,
  })
}

async function run() {
  assertBootstrapGuards()

  const email = normalizeEmail(requireEnv('BOOTSTRAP_ADMIN_EMAIL'))
  const password = requireEnv('BOOTSTRAP_ADMIN_PASSWORD')
  const allowPasswordReset = isPasswordResetAllowed()
  assertPasswordStrength(password)

  const existingUser = await prisma.user.findUnique({
    where: { email },
    select: { id: true, role: true, isActive: true },
  })

  if (existingUser) {
    if (!allowPasswordReset) {
      if (existingUser.role === UserRole.SUPERADMIN) {
        console.log('Superadmin existiert bereits, keine Änderung')
        return
      }

      throw new Error('Es existiert bereits ein User mit dieser E-Mail, aber ohne SUPERADMIN-Rolle.')
    }

    await seedSuperadminPermissions()

    await prisma.user.update({
      where: { id: existingUser.id },
      data: {
        role: UserRole.SUPERADMIN,
        passwordHash: hashPassword(password),
        isActive: true,
      },
    })

    console.log('Superadmin Passwort wurde zurückgesetzt')
    return
  }

  const existingSuperadminCount = await prisma.user.count({
    where: { role: UserRole.SUPERADMIN },
  })

  if (existingSuperadminCount > 0) {
    if (!allowPasswordReset) {
      throw new Error(
        'Es existiert bereits mindestens ein SUPERADMIN. Dieses Bootstrap-Skript erstellt nur den initialen Superadmin.'
      )
    }

    throw new Error(
      'BOOTSTRAP_ADMIN_RESET_PASSWORD=true wurde gesetzt, aber kein User mit BOOTSTRAP_ADMIN_EMAIL gefunden.'
    )
  }

  await seedSuperadminPermissions()

  const createdUser = await prisma.user.create({
    data: {
      email,
      name: 'Klarando Superadmin',
      passwordHash: hashPassword(password),
      role: UserRole.SUPERADMIN,
      isActive: true,
    },
    select: {
      id: true,
      email: true,
      role: true,
      createdAt: true,
    },
  })

  console.log('Superadmin erstellt')
  console.log(`- ID: ${createdUser.id}`)
  console.log(`- E-Mail: ${createdUser.email}`)
  console.log(`- Rolle: ${createdUser.role}`)
  console.log(`- Erstellt am: ${createdUser.createdAt.toISOString()}`)
}

run()
  .catch((error) => {
    console.error('SUPERADMIN BOOTSTRAP FEHLER:', error instanceof Error ? error.message : error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
