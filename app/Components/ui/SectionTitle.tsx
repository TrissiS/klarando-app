type Props = {
  title: string
  subtitle?: string
}

export default function SectionTitle({ title, subtitle }: Props) {
  return (
    <div className="mb-4">
      <h2 className="text-xl font-bold text-[var(--brand-ink)]">{title}</h2>
      {subtitle ? (
        <p className="mt-1 text-sm text-rose-900/70">{subtitle}</p>
      ) : null}
    </div>
  )
}
