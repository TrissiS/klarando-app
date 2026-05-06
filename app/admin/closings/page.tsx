'use client'

import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'

const cards = [
  {
    href: '/admin/closings/daily',
    title: 'Tagesabschluss',
    description:
      'Kassenbestand, Barausgaben und Trinkgeld je Tag erfassen, speichern und einreichen.',
  },
  {
    href: '/admin/closings/monthly',
    title: 'Monatsabschluss',
    description:
      'Tagesabschluesse eines Monats pruefen und den Monatsabschluss gesammelt einreichen.',
  },
  {
    href: '/admin/closings/archive',
    title: 'Abschlussarchiv',
    description:
      'Historische Abschluesse durchsuchen, filtern und schnell die passenden Tage finden.',
  },
]

export default function AdminClosingsMenuPage() {
  return (
    <AdminLayout
      title="Abschlussmenue"
      subtitle="Waehle den passenden Abschlussbereich fuer Tages- oder Monatsabschluss"
    >
      <section className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
        {cards.map((card) => (
          <Link
            key={card.href}
            href={card.href}
            className="rounded-3xl bg-white p-6 shadow-sm ring-1 ring-[var(--brand-border)] transition hover:-translate-y-0.5 hover:shadow-md"
          >
            <h2 className="text-xl font-semibold text-[var(--brand-ink)]">{card.title}</h2>
            <p className="mt-2 text-sm text-rose-900/75">{card.description}</p>
            <span className="mt-4 inline-flex rounded-xl bg-slate-900 px-3 py-2 text-sm font-semibold text-white">
              Bereich oeffnen
            </span>
          </Link>
        ))}
      </section>
    </AdminLayout>
  )
}
