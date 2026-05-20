'use client'

type FeatureGateState = 'READY' | 'LIMITED' | 'IN_PREPARATION'

type FeatureGateBadgeProps = {
  state: FeatureGateState
  label?: string
}

type FeatureGateActionProps = {
  state: FeatureGateState
  label: string
  onClick?: () => void
  inPreparationHint?: string
  className?: string
}

const stateClasses: Record<FeatureGateState, string> = {
  READY: 'border-emerald-300 bg-emerald-50 text-emerald-800',
  LIMITED: 'border-amber-300 bg-amber-50 text-amber-900',
  IN_PREPARATION: 'border-slate-300 bg-slate-100 text-slate-700',
}

export function FeatureGateBadge({ state, label }: FeatureGateBadgeProps) {
  return (
    <span
      className={`inline-flex items-center rounded-full border px-2.5 py-1 text-[11px] font-semibold uppercase tracking-wide ${stateClasses[state]}`}
      title={label || state}
    >
      {label || state.replace('_', ' ')}
    </span>
  )
}

export function FeatureGateAction({
  state,
  label,
  onClick,
  inPreparationHint = 'Diese Funktion ist in Vorbereitung.',
  className = '',
}: FeatureGateActionProps) {
  const disabled = state === 'IN_PREPARATION'

  return (
    <button
      type="button"
      onClick={disabled ? undefined : onClick}
      disabled={disabled}
      title={disabled ? inPreparationHint : label}
      className={`rounded-xl border px-3 py-2 text-sm font-semibold transition ${
        disabled
          ? 'cursor-not-allowed border-slate-300 bg-slate-100 text-slate-500'
          : 'border-[var(--brand-border)] bg-white text-rose-900 hover:bg-rose-50'
      } ${className}`}
    >
      {label}
    </button>
  )
}

export type { FeatureGateState }
