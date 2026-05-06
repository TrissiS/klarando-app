import path from 'path'
import dotenv from 'dotenv'
import { OrderDisplayRole } from '@prisma/client'
import { prisma } from '../src/lib/prisma'
import { parseSettings } from '../src/lib/business-settings'

dotenv.config({ path: path.resolve(__dirname, '../.env') })
dotenv.config({ path: path.resolve(__dirname, '../../.env.local') })

type Severity = 'CRITICAL' | 'WARN'

type Finding = {
  severity: Severity
  scope: 'GLOBAL' | 'TENANT'
  tenantId?: string
  tenantName?: string
  code: string
  message: string
}

function isMissing(value: string | null | undefined) {
  return !value || value.trim().length === 0
}

function isWeakSecret(value: string | null | undefined) {
  if (isMissing(value)) {
    return true
  }

  const normalized = String(value).trim().toLowerCase()
  if (normalized.length < 24) {
    return true
  }

  const weakValues = new Set([
    'klarando-change-me',
    'change-me-in-production',
    'change-me',
    'secret',
    'default',
  ])

  return weakValues.has(normalized)
}

function toMap(entries: Array<{ tenantId: string; _count: { _all: number } }>) {
  return new Map(entries.map((entry) => [entry.tenantId, entry._count._all]))
}

function addFinding(list: Finding[], finding: Finding) {
  list.push(finding)
}

async function run() {
  const findings: Finding[] = []

  const authSecret = process.env.AUTH_SECRET || ''
  const appAuthSecret = process.env.APP_AUTH_SECRET || ''
  const passwordSalt = process.env.PASSWORD_SALT || ''
  const authEnforce = process.env.AUTH_ENFORCE === 'true'
  const nodeEnv = (process.env.NODE_ENV || '').toLowerCase()
  const mapsApiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY || ''

  if (!authEnforce) {
    addFinding(findings, {
      severity: 'CRITICAL',
      scope: 'GLOBAL',
      code: 'AUTH_ENFORCE_DISABLED',
      message: 'AUTH_ENFORCE ist nicht aktiv. Rollenrechte sind damit nicht erzwungen.',
    })
  }

  if (isWeakSecret(authSecret)) {
    addFinding(findings, {
      severity: 'CRITICAL',
      scope: 'GLOBAL',
      code: 'AUTH_SECRET_DEFAULT',
      message: 'AUTH_SECRET fehlt oder nutzt den Default-Wert.',
    })
  }

  const effectiveAppSecret = appAuthSecret || authSecret
  if (isWeakSecret(effectiveAppSecret)) {
    addFinding(findings, {
      severity: 'CRITICAL',
      scope: 'GLOBAL',
      code: 'APP_AUTH_SECRET_DEFAULT',
      message: 'APP_AUTH_SECRET fehlt oder nutzt den Default-Wert.',
    })
  } else if (isMissing(appAuthSecret)) {
    addFinding(findings, {
      severity: 'WARN',
      scope: 'GLOBAL',
      code: 'APP_AUTH_SECRET_SHARED',
      message: 'APP_AUTH_SECRET ist nicht gesetzt und teilt sich AUTH_SECRET.',
    })
  }

  if (!passwordSalt || passwordSalt === 'klarando-default-salt') {
    addFinding(findings, {
      severity: 'WARN',
      scope: 'GLOBAL',
      code: 'PASSWORD_SALT_DEFAULT',
      message: 'PASSWORD_SALT nutzt noch den Default-Wert.',
    })
  }

  if (nodeEnv !== 'production') {
    addFinding(findings, {
      severity: 'WARN',
      scope: 'GLOBAL',
      code: 'NODE_ENV_NOT_PRODUCTION',
      message: `NODE_ENV steht auf "${process.env.NODE_ENV || 'leer'}".`,
    })
  }

  const [tenants, productCountsRaw, categoryCountsRaw, ingredientCountsRaw, terminalCountsRaw, displays] =
    await Promise.all([
      prisma.tenant.findMany({
        select: {
          id: true,
          name: true,
          email: true,
          businessSettings: true,
        },
        orderBy: [{ name: 'asc' }],
      }),
      prisma.product.groupBy({
        by: ['tenantId'],
        _count: { _all: true },
      }),
      prisma.category.groupBy({
        by: ['tenantId'],
        _count: { _all: true },
      }),
      prisma.ingredient.groupBy({
        by: ['tenantId'],
        _count: { _all: true },
      }),
      prisma.orderTerminal.groupBy({
        by: ['tenantId'],
        where: { isActive: true },
        _count: { _all: true },
      }),
      prisma.orderDisplay.findMany({
        where: { isActive: true },
        select: {
          tenantId: true,
          displayRole: true,
        },
      }),
    ])

  const productCounts = toMap(productCountsRaw)
  const categoryCounts = toMap(categoryCountsRaw)
  const ingredientCounts = toMap(ingredientCountsRaw)
  const terminalCounts = toMap(terminalCountsRaw)
  const displayByTenant = new Map<
    string,
    { cash: number; kitchen: number; pickup: number }
  >()

  for (const display of displays) {
    const current = displayByTenant.get(display.tenantId) || {
      cash: 0,
      kitchen: 0,
      pickup: 0,
    }
    if (display.displayRole === OrderDisplayRole.CASH) {
      current.cash += 1
    } else if (display.displayRole === OrderDisplayRole.KITCHEN) {
      current.kitchen += 1
    } else if (display.displayRole === OrderDisplayRole.PICKUP) {
      current.pickup += 1
    }
    displayByTenant.set(display.tenantId, current)
  }

  for (const tenant of tenants) {
    const settings = parseSettings(tenant.businessSettings, {
      name: tenant.name,
      email: tenant.email,
    })
    const appEnabled = settings.customerApp.listingEnabled || settings.customerApp.orderingEnabled
    const orderingEnabled = settings.customerApp.orderingEnabled
    const products = productCounts.get(tenant.id) || 0
    const categories = categoryCounts.get(tenant.id) || 0
    const ingredients = ingredientCounts.get(tenant.id) || 0
    const activeTerminals = terminalCounts.get(tenant.id) || 0
    const displayInfo = displayByTenant.get(tenant.id) || { cash: 0, kitchen: 0, pickup: 0 }

    const scopeBase = {
      scope: 'TENANT' as const,
      tenantId: tenant.id,
      tenantName: tenant.name,
    }

    if (appEnabled) {
      const requiredForPublicApp: Array<[string, string | null]> = [
        ['businessName', settings.businessName],
        ['street', settings.street],
        ['zipCode', settings.zipCode],
        ['city', settings.city],
        ['phone', settings.phone],
        ['email', settings.email],
        ['imprintUrl', settings.imprintUrl],
        ['privacyPolicyUrl', settings.privacyPolicyUrl],
        ['termsUrl', settings.termsUrl],
        ['supportEmail', settings.supportEmail],
        ['accountDeletionEmail', settings.accountDeletionEmail],
      ]

      for (const [field, value] of requiredForPublicApp) {
        if (isMissing(value)) {
          addFinding(findings, {
            ...scopeBase,
            severity: 'CRITICAL',
            code: 'MISSING_PUBLIC_APP_FIELD',
            message: `Pflichtangabe fuer App fehlt: ${field}`,
          })
        }
      }
    }

    if (orderingEnabled) {
      if (products === 0) {
        addFinding(findings, {
          ...scopeBase,
          severity: 'CRITICAL',
          code: 'NO_PRODUCTS',
          message: 'App-Bestellungen sind aktiv, aber es gibt keine Produkte.',
        })
      }

      if (categories === 0) {
        addFinding(findings, {
          ...scopeBase,
          severity: 'WARN',
          code: 'NO_CATEGORIES',
          message: 'Keine Kategorien vorhanden. App wirkt dadurch unstrukturiert.',
        })
      }

      if (displayInfo.cash === 0) {
        addFinding(findings, {
          ...scopeBase,
          severity: 'CRITICAL',
          code: 'NO_CASH_DISPLAY',
          message: 'Keine aktive CASH-Anzeige fuer eingehende App-Bestellungen vorhanden.',
        })
      }

      if (displayInfo.kitchen === 0) {
        addFinding(findings, {
          ...scopeBase,
          severity: 'WARN',
          code: 'NO_KITCHEN_DISPLAY',
          message: 'Keine aktive KITCHEN-Anzeige vorhanden.',
        })
      }

      if (activeTerminals === 0) {
        addFinding(findings, {
          ...scopeBase,
          severity: 'WARN',
          code: 'NO_ACTIVE_TERMINAL',
          message: 'Kein aktives Bestellterminal vorhanden.',
        })
      }

      const deliveryEnabled = settings.deliveryArea.enabled
      const pickupEnabled = settings.pickupArea.enabled
      if (!deliveryEnabled && !pickupEnabled) {
        addFinding(findings, {
          ...scopeBase,
          severity: 'CRITICAL',
          code: 'NO_SERVICE_TYPE',
          message: 'Weder Lieferung noch Abholung sind aktiviert.',
        })
      }
    }

    if (settings.deliveryArea.strategy === 'ZIP_LIST' && settings.deliveryArea.zipCodes.length === 0) {
      addFinding(findings, {
        ...scopeBase,
        severity: 'WARN',
        code: 'DELIVERY_ZIP_OPEN',
        message:
          'Liefergebiet hat ZIP_LIST ohne PLZ-Eintraege. Damit ist Lieferung potentiell fuer alle PLZ offen.',
      })
    }

    if (settings.pickupArea.strategy === 'ZIP_LIST' && settings.pickupArea.zipCodes.length === 0) {
      addFinding(findings, {
        ...scopeBase,
        severity: 'WARN',
        code: 'PICKUP_ZIP_OPEN',
        message:
          'Abholgebiet hat ZIP_LIST ohne PLZ-Eintraege. Damit ist Abholung potentiell fuer alle PLZ offen.',
      })
    }

    const usesPolygon =
      settings.deliveryArea.strategy === 'POLYGON' || settings.pickupArea.strategy === 'POLYGON'
    if (usesPolygon && isMissing(mapsApiKey)) {
      addFinding(findings, {
        ...scopeBase,
        severity: 'WARN',
        code: 'MAPS_KEY_MISSING',
        message: 'Polygon-Strategie aktiv, aber NEXT_PUBLIC_GOOGLE_MAPS_API_KEY fehlt.',
      })
    }

    if (!settings.compliance.cookieConsentRequired) {
      addFinding(findings, {
        ...scopeBase,
        severity: 'WARN',
        code: 'COOKIE_CONSENT_DISABLED',
        message: 'Cookie-Consent ist deaktiviert.',
      })
    }

    if (!settings.compliance.requireTermsConsentAtCheckout) {
      addFinding(findings, {
        ...scopeBase,
        severity: 'WARN',
        code: 'CHECKOUT_TERMS_CONSENT_DISABLED',
        message: 'AGB-Zustimmung im Checkout ist deaktiviert.',
      })
    }

    if (
      isMissing(settings.payoutIban) ||
      isMissing(settings.payoutAccountHolder) ||
      isMissing(settings.payoutBankName)
    ) {
      addFinding(findings, {
        ...scopeBase,
        severity: 'WARN',
        code: 'PAYOUT_DATA_INCOMPLETE',
        message: 'Auszahlungsdaten sind unvollstaendig (Kontoinhaber/Bank/IBAN).',
      })
    }

    if (ingredients === 0 && products > 0) {
      addFinding(findings, {
        ...scopeBase,
        severity: 'WARN',
        code: 'NO_INGREDIENTS',
        message: 'Keine Zutaten angelegt. Kalkulation/Allergenpflege ist eingeschraenkt.',
      })
    }
  }

  const critical = findings.filter((entry) => entry.severity === 'CRITICAL')
  const warnings = findings.filter((entry) => entry.severity === 'WARN')

  console.log('')
  console.log('=== KLARANDO GO-LIVE CHECK ===')
  console.log(`Tenants geprueft: ${tenants.length}`)
  console.log(`CRITICAL: ${critical.length}`)
  console.log(`WARN: ${warnings.length}`)
  console.log('')

  if (findings.length === 0) {
    console.log('Keine offenen Punkte gefunden.')
  } else {
    for (const finding of findings) {
      const tenantLabel =
        finding.scope === 'TENANT'
          ? ` | ${finding.tenantName} (${finding.tenantId})`
          : ''
      console.log(`[${finding.severity}] ${finding.code}${tenantLabel}`)
      console.log(`  -> ${finding.message}`)
    }
  }

  console.log('')
  console.log('Hinweis:')
  console.log(
    'Der Check deckt technische und prozessuale Mindestpunkte ab und ersetzt keine Rechtsberatung.'
  )

  if (critical.length > 0) {
    process.exitCode = 1
  }
}

run()
  .catch((error) => {
    console.error('Go-Live-Check fehlgeschlagen:', error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
