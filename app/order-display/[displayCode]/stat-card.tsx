export function StatCard({
  label,
  value,
  tone = 'neutral',
}: {
  label: string
  value: string
  tone?: 'neutral' | 'success' | 'warning' | 'danger' | 'info'
}) {
  const toneClass =
    tone === 'success'
      ? 'border-emerald-500/40 bg-emerald-500/10'
      : tone === 'warning'
      ? 'border-orange-500/40 bg-orange-500/10'
      : tone === 'danger'
      ? 'border-red-500/40 bg-red-500/10'
      : tone === 'info'
      ? 'border-blue-500/40 bg-blue-500/10'
      : 'border-slate-800 bg-slate-900/80'

  return (
    <article className={`rounded-2xl border px-4 py-4 ${toneClass}`}>
      <p className="text-xs uppercase tracking-[0.14em] text-slate-400">{label}</p>
      <p className="mt-1 text-3xl font-bold text-white">{value}</p>
    </article>
  )
}
