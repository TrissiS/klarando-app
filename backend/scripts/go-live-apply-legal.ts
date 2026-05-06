import path from 'path'
import dotenv from 'dotenv'
import { prisma } from '../src/lib/prisma'
import { parseSettings } from '../src/lib/business-settings'

dotenv.config({ path: path.resolve(__dirname, '../.env') })
dotenv.config({ path: path.resolve(__dirname, '../../.env.local') })

type Options = {
  imprintUrl: string | null
  privacyUrl: string | null
  termsUrl: string | null
  supportEmail: string | null
  deletionEmail: string | null
  street: string | null
  zipCode: string | null
  city: string | null
  phone: string | null
  force: boolean
}

function readArg(name: string) {
  const prefix = `--${name}=`
  const found = process.argv.find((entry) => entry.startsWith(prefix))
  if (!found) {
    return null
  }
  const value = found.slice(prefix.length).trim()
  return value.length > 0 ? value : null
}

function hasFlag(name: string) {
  return process.argv.includes(`--${name}`)
}

function normalizeEmail(value: string | null) {
  return value ? value.trim().toLowerCase() : null
}

function normalizeText(value: string | null) {
  return value ? value.trim() : null
}

function setIfMissing(
  target: Record<string, unknown>,
  key: string,
  value: string | null,
  force: boolean
) {
  if (!value) {
    return false
  }
  const current = target[key]
  const currentText = typeof current === 'string' ? current.trim() : ''
  if (!force && currentText.length > 0) {
    return false
  }
  target[key] = value
  return true
}

function parseOptions(): Options {
  return {
    imprintUrl: normalizeText(readArg('imprint-url')),
    privacyUrl: normalizeText(readArg('privacy-url')),
    termsUrl: normalizeText(readArg('terms-url')),
    supportEmail: normalizeEmail(readArg('support-email')),
    deletionEmail: normalizeEmail(readArg('deletion-email')),
    street: normalizeText(readArg('street')),
    zipCode: normalizeText(readArg('zip')),
    city: normalizeText(readArg('city')),
    phone: normalizeText(readArg('phone')),
    force: hasFlag('force'),
  }
}

async function run() {
  const options = parseOptions()
  const hasAnyInput =
    Boolean(options.imprintUrl) ||
    Boolean(options.privacyUrl) ||
    Boolean(options.termsUrl) ||
    Boolean(options.supportEmail) ||
    Boolean(options.deletionEmail) ||
    Boolean(options.street) ||
    Boolean(options.zipCode) ||
    Boolean(options.city) ||
    Boolean(options.phone)

  if (!hasAnyInput) {
    console.log('Keine Parameter gesetzt.')
    console.log('Beispiel:')
    console.log(
      'npm run go-live:apply-legal -- --imprint-url=https://... --privacy-url=https://... --terms-url=https://... --support-email=support@... --deletion-email=delete@...'
    )
    process.exitCode = 1
    return
  }

  const tenants = await prisma.tenant.findMany({
    select: {
      id: true,
      name: true,
      email: true,
      businessSettings: true,
    },
    orderBy: [{ name: 'asc' }],
  })

  let touched = 0
  for (const tenant of tenants) {
    const parsed = parseSettings(tenant.businessSettings, {
      name: tenant.name,
      email: tenant.email,
    })
    const appEnabled = parsed.customerApp.listingEnabled || parsed.customerApp.orderingEnabled
    if (!appEnabled) {
      continue
    }

    const raw =
      tenant.businessSettings && typeof tenant.businessSettings === 'object'
        ? JSON.parse(JSON.stringify(tenant.businessSettings))
        : {}
    const settings = raw as Record<string, unknown>

    let changed = false
    changed =
      setIfMissing(settings, 'imprintUrl', options.imprintUrl, options.force) || changed
    changed =
      setIfMissing(settings, 'privacyPolicyUrl', options.privacyUrl, options.force) || changed
    changed = setIfMissing(settings, 'termsUrl', options.termsUrl, options.force) || changed
    changed =
      setIfMissing(settings, 'supportEmail', options.supportEmail, options.force) || changed
    changed =
      setIfMissing(
        settings,
        'accountDeletionEmail',
        options.deletionEmail,
        options.force
      ) || changed
    changed = setIfMissing(settings, 'street', options.street, options.force) || changed
    changed = setIfMissing(settings, 'zipCode', options.zipCode, options.force) || changed
    changed = setIfMissing(settings, 'city', options.city, options.force) || changed
    changed = setIfMissing(settings, 'phone', options.phone, options.force) || changed

    if (!changed) {
      continue
    }

    await prisma.tenant.update({
      where: { id: tenant.id },
      data: {
        businessSettings: settings,
      },
    })
    touched += 1
    console.log(`Aktualisiert: ${tenant.name} (${tenant.id})`)
  }

  console.log('')
  console.log(`Fertig. Aktualisierte Filialen: ${touched}`)
}

run()
  .catch((error) => {
    console.error('Bulk-Update fehlgeschlagen:', error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
