'use client'

type Tone = 'info' | 'warn'

const toneClasses: Record<Tone, string> = {
  info: 'border-sky-200 bg-sky-50 text-sky-900',
  warn: 'border-amber-200 bg-amber-50 text-amber-900',
}

export function FeatureUnavailableNotice({
  title,
  message,
  tone = 'info',
}: {
  title: string
  message: string
  tone?: Tone
}) {
  return (
    <div className={`rounded-2xl border px-4 py-3 text-sm ${toneClasses[tone]}`}>
      <p className="font-semibold">{title}</p>
      <p className="mt-1">{message}</p>
    </div>
  )
}

export function ApiMissingNotice({ apiName }: { apiName: string }) {
  return (
    <FeatureUnavailableNotice
      title="API nicht angebunden"
      message={`Die Funktion benötigt ${apiName}. Bitte vor Nutzung anbinden.`}
      tone="warn"
    />
  )
}

export function ComingSoonAction({
  label,
  hint = 'Diese Funktion ist in Vorbereitung.',
}: {
  label: string
  hint?: string
}) {
  return (
    <button
      type="button"
      disabled
      title={hint}
      className="cursor-not-allowed rounded-xl border border-slate-300 bg-slate-100 px-3 py-2 text-sm font-semibold text-slate-500"
    >
      {label}
    </button>
  )
}
