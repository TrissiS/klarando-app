export type PayoutProfile = {
  payoutAccountHolder: string
  payoutBankName: string
  payoutIban: string
  payoutBic: string
  payoutEmail: string
  payoutReference: string
}

function normalizeText(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeEmail(value: unknown) {
  const text = normalizeText(value)
  return text ? text.toLowerCase() : null
}

function normalizeIban(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const normalized = value.replace(/\s+/g, '').toUpperCase()
  if (!/^[A-Z]{2}[A-Z0-9]{13,32}$/.test(normalized)) {
    return null
  }
  return normalized
}

function normalizeBic(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const normalized = value.replace(/\s+/g, '').toUpperCase()
  if (!/^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(normalized)) {
    return null
  }
  return normalized
}

export function readDefaultPayoutProfile(): PayoutProfile {
  return {
    payoutAccountHolder:
      normalizeText(process.env.DEFAULT_PAYOUT_ACCOUNT_HOLDER) || 'Klarando Betreiber',
    payoutBankName:
      normalizeText(process.env.DEFAULT_PAYOUT_BANK_NAME) || 'Klarando Partnerbank',
    payoutIban:
      normalizeIban(process.env.DEFAULT_PAYOUT_IBAN) || 'DE89370400440532013000',
    payoutBic: normalizeBic(process.env.DEFAULT_PAYOUT_BIC) || 'COBADEFFXXX',
    payoutEmail:
  normalizeEmail(process.env.DEFAULT_PAYOUT_EMAIL) || 'abrechnung@klarando.com',
    payoutReference:
      normalizeText(process.env.DEFAULT_PAYOUT_REFERENCE) || 'KLARANDO-ORDER',
  }
}

export function normalizePayoutFieldPatch(input: {
  payoutAccountHolder?: unknown
  payoutBankName?: unknown
  payoutIban?: unknown
  payoutBic?: unknown
  payoutEmail?: unknown
  payoutReference?: unknown
}) {
  const next: Partial<PayoutProfile> = {}
  const errors: string[] = []

  if (input.payoutAccountHolder !== undefined) {
    const value = normalizeText(input.payoutAccountHolder)
    if (!value) {
      errors.push('payoutAccountHolder ist ungueltig')
    } else {
      next.payoutAccountHolder = value
    }
  }

  if (input.payoutBankName !== undefined) {
    const value = normalizeText(input.payoutBankName)
    if (!value) {
      errors.push('payoutBankName ist ungueltig')
    } else {
      next.payoutBankName = value
    }
  }

  if (input.payoutIban !== undefined) {
    const value = normalizeIban(input.payoutIban)
    if (!value) {
      errors.push('payoutIban ist ungueltig')
    } else {
      next.payoutIban = value
    }
  }

  if (input.payoutBic !== undefined) {
    const value = normalizeBic(input.payoutBic)
    if (!value) {
      errors.push('payoutBic ist ungueltig')
    } else {
      next.payoutBic = value
    }
  }

  if (input.payoutEmail !== undefined) {
    const value = normalizeEmail(input.payoutEmail)
    if (!value) {
      errors.push('payoutEmail ist ungueltig')
    } else {
      next.payoutEmail = value
    }
  }

  if (input.payoutReference !== undefined) {
    const value = normalizeText(input.payoutReference)
    if (!value) {
      errors.push('payoutReference ist ungueltig')
    } else {
      next.payoutReference = value
    }
  }

  return { next, errors }
}

export function mergePayoutProfile(
  base: Partial<PayoutProfile> | null | undefined,
  fallback: PayoutProfile
): PayoutProfile {
  return {
    payoutAccountHolder: base?.payoutAccountHolder || fallback.payoutAccountHolder,
    payoutBankName: base?.payoutBankName || fallback.payoutBankName,
    payoutIban: base?.payoutIban || fallback.payoutIban,
    payoutBic: base?.payoutBic || fallback.payoutBic,
    payoutEmail: base?.payoutEmail || fallback.payoutEmail,
    payoutReference: base?.payoutReference || fallback.payoutReference,
  }
}
