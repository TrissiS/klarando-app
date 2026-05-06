type Props = {
  title: string
  lines: string[]
}

export default function InfoListCard({ title, lines }: Props) {
  return (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/55 p-4">
      <p className="font-semibold text-[var(--brand-ink)]">{title}</p>

      <div className="mt-2 space-y-1">
        {lines.map((line, index) => (
          <p key={index} className="text-sm text-rose-900/70">
            {line}
          </p>
        ))}
      </div>
    </div>
  )
}
