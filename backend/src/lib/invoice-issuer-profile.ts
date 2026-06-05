type PlatformBillingSettingsLike = {
  companyName?: string | null
  legalForm?: string | null
  street?: string | null
  zipCode?: string | null
  city?: string | null
  countryCode?: string | null
  vatId?: string | null
  taxNumber?: string | null
  managingDirector?: string | null
  invoiceEmail?: string | null
  phone?: string | null
  website?: string | null
  bankName?: string | null
  iban?: string | null
  bic?: string | null
  sepaCreditorId?: string | null
  invoiceLogoUrl?: string | null
  invoicePrimaryColor?: string | null
  invoiceAccentColor?: string | null
  invoiceFooter?: string | null
  invoicePaymentInfo?: string | null
  standardPaymentTargetDays?: number | null
  supportEmail?: string | null
}

export type InvoiceIssuerProfile = {
  name: string
  legalForm: string | null
  owner: string | null
  street: string
  houseNumber: string | null
  zip: string
  city: string
  country: string
  email: string
  supportEmail: string
  phone: string | null
  website: string | null
  vatId: string
  taxNumber: string | null
  logoUrl: string | null
  bankName: string | null
  iban: string | null
  bic: string | null
  creditorId: string | null
  invoicePrimaryColor: string | null
  invoiceAccentColor: string | null
  paymentInfo: string | null
  footer: string | null
  paymentTargetDays: number | null
}

export type InvoiceIssuerSnapshot = {
  name: string
  legalForm: string | null
  owner: string | null
  street: string
  houseNumber: string | null
  zip: string
  city: string
  country: string
  email: string
  supportEmail: string
  phone: string | null
  website: string | null
  vatId: string
  taxNumber: string | null
  logoUrl: string | null
  bankName: string | null
  iban: string | null
  bic: string | null
  creditorId: string | null
  paymentInfo: string | null
  paymentTargetDays: number | null
}

export type InvoiceIssuerReadiness = {
  exportReady: boolean
  hasVatId: boolean
  hasTaxNumber: boolean
  hasBankData: boolean
  hasCreditorId: boolean
  missingFields: string[]
  warnings: string[]
}

const DEFAULT_INVOICE_ISSUER_PROFILE: InvoiceIssuerProfile = {
  name: 'Klarando',
  legalForm: 'Einzelunternehmen',
  owner: 'Tristan Stenger',
  street: 'Untere Wiesenstr. 6',
  houseNumber: '6',
  zip: '57271',
  city: 'Hilchenbach',
  country: 'DE',
  email: 'info@klarando.com',
  supportEmail: 'info@klarando.com',
  phone: null,
  website: null,
  vatId: 'DE314972366',
  taxNumber: null,
  logoUrl: null,
  bankName: null,
  iban: null,
  bic: null,
  creditorId: null,
  invoicePrimaryColor: '#0f172a',
  invoiceAccentColor: '#e2e8f0',
  paymentInfo: null,
  footer: null,
  paymentTargetDays: 14,
}

function nonEmptyString(value: unknown) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed.length ? trimmed : null
}

function splitStreetParts(street: string) {
  const match = street.match(/^(.*?)(?:\s+(\d+[a-zA-Z\-\/]*))$/)
  if (!match) {
    return {
      street,
      houseNumber: null,
    }
  }
  return {
    street: match[1].trim() || street,
    houseNumber: match[2].trim() || null,
  }
}

export function resolveInvoiceIssuerProfile(
  profile: PlatformBillingSettingsLike | null | undefined
): InvoiceIssuerProfile {
  const fullStreet = nonEmptyString(profile?.street) ?? DEFAULT_INVOICE_ISSUER_PROFILE.street
  const streetParts = splitStreetParts(fullStreet)
  const email = nonEmptyString(profile?.invoiceEmail) ?? DEFAULT_INVOICE_ISSUER_PROFILE.email

  return {
    name: nonEmptyString(profile?.companyName) ?? DEFAULT_INVOICE_ISSUER_PROFILE.name,
    legalForm: nonEmptyString(profile?.legalForm) ?? DEFAULT_INVOICE_ISSUER_PROFILE.legalForm,
    owner: nonEmptyString(profile?.managingDirector) ?? DEFAULT_INVOICE_ISSUER_PROFILE.owner,
    street: streetParts.street,
    houseNumber: streetParts.houseNumber ?? DEFAULT_INVOICE_ISSUER_PROFILE.houseNumber,
    zip: nonEmptyString(profile?.zipCode) ?? DEFAULT_INVOICE_ISSUER_PROFILE.zip,
    city: nonEmptyString(profile?.city) ?? DEFAULT_INVOICE_ISSUER_PROFILE.city,
    country: nonEmptyString(profile?.countryCode) ?? DEFAULT_INVOICE_ISSUER_PROFILE.country,
    email,
    supportEmail: nonEmptyString(profile?.supportEmail) ?? email,
    phone: nonEmptyString(profile?.phone) ?? DEFAULT_INVOICE_ISSUER_PROFILE.phone,
    website: nonEmptyString(profile?.website) ?? DEFAULT_INVOICE_ISSUER_PROFILE.website,
    vatId: nonEmptyString(profile?.vatId) ?? DEFAULT_INVOICE_ISSUER_PROFILE.vatId,
    taxNumber: nonEmptyString(profile?.taxNumber) ?? DEFAULT_INVOICE_ISSUER_PROFILE.taxNumber,
    logoUrl: nonEmptyString(profile?.invoiceLogoUrl) ?? DEFAULT_INVOICE_ISSUER_PROFILE.logoUrl,
    bankName: nonEmptyString(profile?.bankName) ?? DEFAULT_INVOICE_ISSUER_PROFILE.bankName,
    iban: nonEmptyString(profile?.iban) ?? DEFAULT_INVOICE_ISSUER_PROFILE.iban,
    bic: nonEmptyString(profile?.bic) ?? DEFAULT_INVOICE_ISSUER_PROFILE.bic,
    creditorId: nonEmptyString(profile?.sepaCreditorId) ?? DEFAULT_INVOICE_ISSUER_PROFILE.creditorId,
    invoicePrimaryColor:
      nonEmptyString(profile?.invoicePrimaryColor) ?? DEFAULT_INVOICE_ISSUER_PROFILE.invoicePrimaryColor,
    invoiceAccentColor:
      nonEmptyString(profile?.invoiceAccentColor) ?? DEFAULT_INVOICE_ISSUER_PROFILE.invoiceAccentColor,
    paymentInfo: nonEmptyString(profile?.invoicePaymentInfo) ?? DEFAULT_INVOICE_ISSUER_PROFILE.paymentInfo,
    footer: nonEmptyString(profile?.invoiceFooter) ?? DEFAULT_INVOICE_ISSUER_PROFILE.footer,
    paymentTargetDays:
      typeof profile?.standardPaymentTargetDays === 'number' && Number.isFinite(profile.standardPaymentTargetDays)
        ? Math.max(1, profile.standardPaymentTargetDays)
        : DEFAULT_INVOICE_ISSUER_PROFILE.paymentTargetDays,
  }
}

export function buildInvoiceIssuerSnapshot(profile: InvoiceIssuerProfile): InvoiceIssuerSnapshot {
  return {
    name: profile.name,
    legalForm: profile.legalForm,
    owner: profile.owner,
    street: profile.street,
    houseNumber: profile.houseNumber,
    zip: profile.zip,
    city: profile.city,
    country: profile.country,
    email: profile.email,
    supportEmail: profile.supportEmail,
    phone: profile.phone,
    website: profile.website,
    vatId: profile.vatId,
    taxNumber: profile.taxNumber,
    logoUrl: profile.logoUrl,
    bankName: profile.bankName,
    iban: profile.iban,
    bic: profile.bic,
    creditorId: profile.creditorId,
    paymentInfo: profile.paymentInfo,
    paymentTargetDays: profile.paymentTargetDays,
  }
}

export function evaluateInvoiceIssuerReadiness(profile: InvoiceIssuerProfile): InvoiceIssuerReadiness {
  const missingFields: string[] = []
  const warnings: string[] = []
  const hasVatId = Boolean(nonEmptyString(profile.vatId))
  const hasTaxNumber = Boolean(nonEmptyString(profile.taxNumber))
  const hasBankData = Boolean(nonEmptyString(profile.bankName) && nonEmptyString(profile.iban) && nonEmptyString(profile.bic))
  const hasCreditorId = Boolean(nonEmptyString(profile.creditorId))

  if (!hasVatId) {
    missingFields.push('USt-ID')
    warnings.push('USt-ID fehlt im Rechnungssteller-Profil.')
  }
  if (!hasTaxNumber) {
    missingFields.push('Steuernummer')
    warnings.push('Steuernummer fehlt im Rechnungssteller-Profil.')
  }
  if (!hasBankData) {
    missingFields.push('Bankdaten')
    warnings.push('Bankname, IBAN oder BIC fehlen im Rechnungssteller-Profil.')
  }
  if (!hasCreditorId) {
    missingFields.push('Gläubiger-ID')
    warnings.push('Gläubiger-ID fehlt im Rechnungssteller-Profil.')
  }

  return {
    exportReady: missingFields.length === 0,
    hasVatId,
    hasTaxNumber,
    hasBankData,
    hasCreditorId,
    missingFields,
    warnings,
  }
}
