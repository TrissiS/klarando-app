import Link from 'next/link'
import type { Metadata } from 'next'
import LegalShell from '@/app/Components/legal/LegalShell'

export const metadata: Metadata = {
  title: 'Infos | Klarando',
  description: 'Rechtliche Informationen von Klarando',
}

const entries = [
  {
    href: '/impressum',
    title: 'Impressum',
    text: 'Angaben zum Anbieter und Kontaktinformationen.',
  },
  {
    href: '/datenschutz',
    title: 'Datenschutz',
    text: 'Informationen zur Verarbeitung personenbezogener Daten.',
  },
  {
    href: '/agb',
    title: 'AGB',
    text: 'Allgemeine Geschaeftsbedingungen fuer Plattform und Bestellungen.',
  },
]

export default function InfosPage() {
  return (
    <LegalShell
      title="Rechtliche Informationen"
      subtitle="Schnellzugriff auf Impressum, Datenschutz und AGB."
      updatedAt="15.04.2026"
    >
      <div className="grid gap-4 sm:grid-cols-3">
        {entries.map((entry) => (
          <Link
            key={entry.href}
            href={entry.href}
            className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 p-4 transition hover:bg-rose-50"
          >
            <p className="text-base font-bold text-[var(--brand-ink)]">{entry.title}</p>
            <p className="mt-1 text-sm text-rose-900/80">{entry.text}</p>
          </Link>
        ))}
      </div>
    </LegalShell>
  )
}
