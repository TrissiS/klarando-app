import Link from 'next/link'
import type { ReactNode } from 'react'

type Props = {
  title: string
  subtitle: string
  updatedAt: string
  children: ReactNode
}

export default function LegalShell({ title, subtitle, updatedAt, children }: Props) {
  return (
    <main className="min-h-screen bg-[radial-gradient(circle_at_20%_0%,#ffe7d8_0%,#fff5ef_28%,#fffaf8_62%,#fffdfc_100%)] px-4 py-8 text-[var(--brand-ink)]">
      <div className="mx-auto w-full max-w-4xl">
        <header className="mb-6 rounded-3xl border border-[var(--brand-border)] bg-white/95 p-6 shadow-sm">
          <p className="mb-2 text-xs font-semibold uppercase tracking-[0.18em] text-rose-700">
            Klarando
          </p>
          <h1 className="text-3xl font-extrabold">{title}</h1>
          <p className="mt-2 text-sm text-rose-900/75">{subtitle}</p>
          <p className="mt-3 text-xs text-rose-900/60">Stand: {updatedAt}</p>
        </header>

        <article className="rounded-3xl border border-[var(--brand-border)] bg-white p-6 shadow-sm">
          {children}
        </article>

        <footer className="mt-6 rounded-2xl border border-[var(--brand-border)] bg-white/90 p-4 text-sm text-rose-900/80">
          <div className="flex flex-wrap gap-4">
            <Link href="/impressum" className="font-semibold text-rose-700 hover:text-rose-900">
              Impressum
            </Link>
            <Link href="/datenschutz" className="font-semibold text-rose-700 hover:text-rose-900">
              Datenschutz
            </Link>
            <Link href="/agb" className="font-semibold text-rose-700 hover:text-rose-900">
              AGB
            </Link>
            <Link href="/" className="font-semibold text-rose-700 hover:text-rose-900">
              Zurueck zum Login
            </Link>
          </div>
        </footer>
      </div>
    </main>
  )
}
