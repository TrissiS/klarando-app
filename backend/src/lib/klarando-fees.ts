export type KlarandoFeeInput = {
  grossAmountCents: number
  deliveryFeeCents: number
  tipAmountCents: number
  paymentProviderFeeCents?: number
  klarandoPercentFee: number
  klarandoFixedFeeCents: number
}

export type KlarandoFeeResult = {
  grossAmountCents: number
  deliveryFeeCents: number
  tipAmountCents: number
  paymentProviderFeeCents: number
  klarandoPercentFeeCents: number
  klarandoFixedFeeCents: number
  klarandoTotalFeeCents: number
  merchantPayoutAmountCents: number
}

export function calculateKlarandoFees(input: KlarandoFeeInput): KlarandoFeeResult {
  const grossAmountCents = Math.max(0, Math.round(input.grossAmountCents))
  const deliveryFeeCents = Math.max(0, Math.round(input.deliveryFeeCents))
  const tipAmountCents = Math.max(0, Math.round(input.tipAmountCents))
  const paymentProviderFeeCents = Math.max(0, Math.round(input.paymentProviderFeeCents ?? 0))
  const klarandoPercentFee = Number.isFinite(input.klarandoPercentFee) ? Math.max(0, input.klarandoPercentFee) : 0
  const klarandoFixedFeeCents = Math.max(0, Math.round(input.klarandoFixedFeeCents))

  const klarandoPercentFeeCents = Math.max(
    0,
    Math.round((grossAmountCents * klarandoPercentFee) / 100)
  )
  const klarandoTotalFeeCents = Math.max(0, klarandoPercentFeeCents + klarandoFixedFeeCents)
  const merchantPayoutAmountCents = Math.max(
    0,
    grossAmountCents + tipAmountCents - klarandoTotalFeeCents - paymentProviderFeeCents
  )

  return {
    grossAmountCents,
    deliveryFeeCents,
    tipAmountCents,
    paymentProviderFeeCents,
    klarandoPercentFeeCents,
    klarandoFixedFeeCents,
    klarandoTotalFeeCents,
    merchantPayoutAmountCents,
  }
}

