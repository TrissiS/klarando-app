'use client'

import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'

const displaySections = [
  {
    href: '/admin/order-displays',
    title: 'Bestell-Displays',
    description:
      'Kuechen-, Kassen- und Abhol-Displays fuer Status, Countdown und Darstellung konfigurieren.',
  },
  {
    href: '/admin/terminals',
    title: 'Bestellterminals',
    description:
      'Self-Order-Terminals erstellen, Zahlungsarten steuern und mit Displays verknuepfen.',
  },
  {
    href: '/admin/screen',
    title: 'Produkte auf Bildschirm',
    description:
      'Produktanzeige, Layout, Farben und Sichtbarkeit fuer Menuebilder und grosse Screens steuern (inkl. V2: Drag & Drop, Listenmodus, Angebotsfelder).',
  },
]

export default function AdminDisplaysOverviewPage() {
  return (
    <AdminLayout
      title="Bildschirme & Displays"
      subtitle="Alle Bildschirm- und Displaybereiche zentral an einem Ort verwalten"
    >
      <section className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
        {displaySections.map((section) => (
          <Link
            key={section.href}
            href={section.href}
            className="rounded-3xl bg-white p-6 shadow-sm ring-1 ring-[var(--brand-border)] transition hover:-translate-y-0.5 hover:shadow-md"
          >
            <h2 className="text-xl font-semibold text-[var(--brand-ink)]">{section.title}</h2>
            <p className="mt-2 text-sm text-rose-900/75">{section.description}</p>
            <span className="mt-4 inline-flex rounded-xl bg-slate-900 px-3 py-2 text-sm font-semibold text-white">
              Bereich oeffnen
            </span>
          </Link>
        ))}
      </section>
    </AdminLayout>
  )
}
