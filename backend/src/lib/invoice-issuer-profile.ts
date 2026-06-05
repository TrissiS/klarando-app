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
}

export type InvoiceIssuerProfile = {
  name: string
  legalForm: string | null
  owner: string | null
  street: string
  zip: string
  city: string
  country: string
  email: string
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
}

const DEFAULT_INVOICE_ISSUER_PROFILE: InvoiceIssuerProfile = {
  name: 'Klarando',
  legalForm: 'Einzelunternehmen',
  owner: 'Tristan Stenger',
  street: 'Untere Wiesenstr. 6',
  zip: '57271',
  city: 'Hilchenbach',
  country: 'DE',
  email: 'info@klarando.com',
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
}

function nonEmptyString(value: unknown) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed.length ? trimmed : null
}

export function resolveInvoiceIssuerProfile(
  profile: PlatformBillingSettingsLike | null | undefined
): InvoiceIssuerProfile {
  return {
    name: nonEmptyString(profile?.companyName) ?? DEFAULT_INVOICE_ISSUER_PROFILE.name,
    legalForm: nonEmptyString(profile?.legalForm) ?? DEFAULT_INVOICE_ISSUER_PROFILE.legalForm,
    owner: nonEmptyString(profile?.managingDirector) ?? DEFAULT_INVOICE_ISSUER_PROFILE.owner,
    street: nonEmptyString(profile?.street) ?? DEFAULT_INVOICE_ISSUER_PROFILE.street,
    zip: nonEmptyString(profile?.zipCode) ?? DEFAULT_INVOICE_ISSUER_PROFILE.zip,
    city: nonEmptyString(profile?.city) ?? DEFAULT_INVOICE_ISSUER_PROFILE.city,
    country: nonEmptyString(profile?.countryCode) ?? DEFAULT_INVOICE_ISSUER_PROFILE.country,
    email: nonEmptyString(profile?.invoiceEmail) ?? DEFAULT_INVOICE_ISSUER_PROFILE.email,
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
  }
}
