import { Router, type Response } from 'express'
import { Prisma, UserRole } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { requireAuth } from '../middleware/auth'
import { hashPassword } from '../auth/password'
import {
  importBusinessTemplateToTenant,
  TenantImportError,
} from '../lib/business-template-import'
import { writeAuditLog } from '../lib/audit'

const router = Router()

type OnboardingErrorCode =
  | 'TENANT_NOT_FOUND'
  | 'TEMPLATE_IMPORT_FAILED'
  | 'EMAIL_ALREADY_EXISTS'
  | 'TENANT_CREATE_FAILED'
  | 'DATABASE_PROVISIONING_FAILED'

class OnboardingError extends Error {
  constructor(
    public readonly code: OnboardingErrorCode,
    message: string,
    public readonly details?: string
  ) {
    super(message)
    this.name = 'OnboardingError'
  }
}

function onboardingErrorResponse(
  res: Response,
  status: number,
  error: OnboardingError
) {
  return res.status(status).json({
    code: error.code,
    message: error.message,
    details: error.details,
    error: error.message,
  })
}

type ImportBusinessTemplateOptions = {
  importCategories: boolean
  importProducts: boolean
  importIngredients: boolean
  importProductIngredients: boolean
  importAllergens: boolean
  importPriceSuggestions: boolean
  overwriteExisting: boolean
}

type OnboardingPayload = {
  company: {
    name: string
    type: 'INDEPENDENT' | 'CHAIN' | 'FRANCHISE'
    contactName: string
    email: string
    phone?: string | null
  }
  admin: {
    name: string
    email: string
    password: string
    role: 'CHAINADMIN' | 'ADMIN'
  }
  branch: {
    name: string
    addressLine?: string | null
    email?: string | null
  }
  templateImport?: {
    templateId?: string | null
    enabled?: boolean
    options?: Partial<ImportBusinessTemplateOptions>
  }
}

function normalizeEmail(value: string) {
  return value.trim().toLowerCase()
}

function isValidEmail(value: string) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value.trim())
}

function validatePassword(value: string) {
  const trimmed = value.trim()
  if (trimmed.length < 10) {
    return 'Passwort muss mindestens 10 Zeichen lang sein.'
  }
  if (!/[A-Z]/.test(trimmed) || !/[a-z]/.test(trimmed) || !/[0-9]/.test(trimmed)) {
    return 'Passwort muss Groß-/Kleinbuchstaben und Zahlen enthalten.'
  }
  return null
}

function slugCode(value: string) {
  return value
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 24)
}

async function nextUniqueChainCode(companyName: string) {
  const base = slugCode(companyName) || 'chain'
  let candidate = base
  let attempt = 1
  while (true) {
    const exists = await prisma.chain.findUnique({
      where: { code: candidate },
      select: { id: true },
    })
    if (!exists) {
      return candidate
    }
    attempt += 1
    candidate = `${base}-${attempt}`
  }
}

router.post('/business', requireAuth, async (req, res) => {
  try {
    const actor = req.authUser
    if (!actor || actor.role !== UserRole.SUPERADMIN) {
      return res.status(403).json({ error: 'Nur SUPERADMIN darf den Onboarding-Assistenten nutzen.' })
    }

    const payload = req.body as OnboardingPayload
    if (!payload?.company?.name?.trim()) {
      return res.status(400).json({ error: 'Unternehmensname fehlt.' })
    }
    if (!payload?.company?.email?.trim()) {
      return res.status(400).json({ error: 'Unternehmens-E-Mail fehlt.' })
    }
    if (!isValidEmail(payload.company.email)) {
      return res.status(400).json({ error: 'Unternehmens-E-Mail ist ungültig.' })
    }
    if (!payload?.admin?.name?.trim() || !payload?.admin?.email?.trim() || !payload?.admin?.password?.trim()) {
      return res.status(400).json({ error: 'Admin-Daten sind unvollständig.' })
    }
    if (!isValidEmail(payload.admin.email)) {
      return res.status(400).json({ error: 'Admin-E-Mail ist ungültig.' })
    }
    const passwordValidationError = validatePassword(payload.admin.password)
    if (passwordValidationError) {
      return res.status(400).json({ error: passwordValidationError })
    }
    if (!payload?.branch?.name?.trim()) {
      return res.status(400).json({ error: 'Filialname fehlt.' })
    }
    if (!['INDEPENDENT', 'CHAIN', 'FRANCHISE'].includes(payload.company.type)) {
      return res.status(400).json({ error: 'Ungültiger Unternehmens-Typ.' })
    }
    if (!['CHAINADMIN', 'ADMIN'].includes(payload.admin.role)) {
      return res.status(400).json({ error: 'Ungültige Admin-Rolle.' })
    }
    if (payload.company.type === 'INDEPENDENT' && payload.admin.role !== 'ADMIN') {
      return res.status(400).json({ error: 'Bei Einzelunternehmen ist nur die Rolle ADMIN erlaubt.' })
    }
    if (payload.branch.email && !isValidEmail(payload.branch.email)) {
      return res.status(400).json({ error: 'Filial-E-Mail ist ungültig.' })
    }

    const adminEmail = normalizeEmail(payload.admin.email)
    const companyEmail = normalizeEmail(payload.company.email)
    const existingUser = await prisma.user.findUnique({
      where: { email: adminEmail },
      select: { id: true },
    })
    if (existingUser) {
      return onboardingErrorResponse(
        res,
        409,
        new OnboardingError(
          'EMAIL_ALREADY_EXISTS',
          'Ein Benutzer mit dieser Admin-E-Mail existiert bereits.'
        )
      )
    }

    const chainCode = await nextUniqueChainCode(payload.company.name)
    const adminRole = payload.admin.role === 'CHAINADMIN' ? UserRole.CHAINADMIN : UserRole.ADMIN

    const result = await prisma.$transaction(async (tx) => {
      const chain = await tx.chain.create({
        data: {
          name: payload.company.name.trim(),
          code: chainCode,
          type: payload.company.type,
          status: 'ACTIVE',
          contactName: payload.company.contactName?.trim() || null,
          contactEmail: companyEmail,
          contactPhone: payload.company.phone?.trim() || null,
        },
      })

      let tenant
      try {
        tenant = await tx.tenant.create({
          data: {
            chainId: chain.id,
            name: payload.branch.name.trim(),
            email: payload.branch.email?.trim()
              ? normalizeEmail(payload.branch.email)
              : companyEmail,
            status: 'ACTIVE',
            addressLine: payload.branch.addressLine?.trim() || null,
          },
        })
      } catch (tenantCreateError) {
        throw new OnboardingError(
          'TENANT_CREATE_FAILED',
          'Filiale konnte nicht erstellt werden.',
          tenantCreateError instanceof Error ? tenantCreateError.message : undefined
        )
      }

      const adminUser = await tx.user.create({
        data: {
          name: payload.admin.name.trim(),
          email: adminEmail,
          passwordHash: hashPassword(payload.admin.password),
          role: adminRole,
          isActive: true,
          chainId: chain.id,
          tenantId: adminRole === UserRole.ADMIN ? tenant.id : null,
        },
      })

      let templateImportResult: Awaited<ReturnType<typeof importBusinessTemplateToTenant>> | null = null
      if (payload.templateImport?.enabled && payload.templateImport.templateId) {
        try {
          templateImportResult = await importBusinessTemplateToTenant(
            {
              templateId: payload.templateImport.templateId,
              tenantId: tenant.id,
              options: payload.templateImport.options,
            },
            tx
          )
        } catch (importError) {
          if (importError instanceof TenantImportError && importError.code === 'TENANT_NOT_FOUND') {
            throw new OnboardingError(
              'TENANT_NOT_FOUND',
              importError.message,
              importError.details
            )
          }
          throw new OnboardingError(
            'TEMPLATE_IMPORT_FAILED',
            'Vorlage konnte nicht in die Filiale importiert werden.',
            importError instanceof Error ? importError.message : undefined
          )
        }
      }

      return {
        chain,
        tenant,
        adminUser,
        templateImportResult,
      }
    })

    await writeAuditLog({
      req,
      module: 'onboarding',
      action: 'business_onboarding_completed',
      targetType: 'chain',
      targetId: result.chain.id,
      chainId: result.chain.id,
      tenantId: result.tenant.id,
      metadata: {
        chainType: result.chain.type,
        adminRole,
        templateImported: Boolean(result.templateImportResult),
      },
    })

    return res.status(201).json({
      chain: {
        id: result.chain.id,
        name: result.chain.name,
        code: result.chain.code,
        type: result.chain.type,
        status: result.chain.status,
      },
      tenant: {
        id: result.tenant.id,
        name: result.tenant.name,
        status: result.tenant.status,
      },
      admin: {
        id: result.adminUser.id,
        name: result.adminUser.name,
        email: result.adminUser.email,
        role: result.adminUser.role,
      },
      templateImport: result.templateImportResult,
    })
  } catch (error) {
    console.error('ONBOARDING BUSINESS ERROR:', error)
    if (error instanceof OnboardingError) {
      const status = error.code === 'EMAIL_ALREADY_EXISTS' ? 409 : 400
      return onboardingErrorResponse(res, status, error)
    }

    if (error instanceof Prisma.PrismaClientKnownRequestError) {
      if (error.code === 'P2002') {
        return onboardingErrorResponse(
          res,
          409,
          new OnboardingError(
            'EMAIL_ALREADY_EXISTS',
            'E-Mail ist bereits vergeben.',
            error.message
          )
        )
      }
      return onboardingErrorResponse(
        res,
        500,
        new OnboardingError(
          'DATABASE_PROVISIONING_FAILED',
          'Datenbankvorgang im Onboarding fehlgeschlagen.',
          error.message
        )
      )
    }

    return onboardingErrorResponse(
      res,
      500,
      new OnboardingError(
        'DATABASE_PROVISIONING_FAILED',
        'Onboarding konnte nicht abgeschlossen werden.',
        error instanceof Error ? error.message : undefined
      )
    )
  }
})

export default router
