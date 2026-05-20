'use client'

import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'

type Metric = {
  label: string
  value: string | number
}

type QuickAction = {
  href: string
  label: string
}

type SectionOverviewProps = {
  title: string
  subtitle: string
  metrics: Metric[]
  warnings: string[]
  quickActions: QuickAction[]
}

export default function SectionOverview({
  title,
  subtitle,
  metrics,
  warnings,
  quickActions,
}: SectionOverviewProps) {
  return (
    <AdminLayout title={title} subtitle={subtitle}>
      <div className="space-y-4">
        <section className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
          <div className="text-sm font-semibold text-slate-700">Kennzahlen</div>
          <div className="mt-3 grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
            {metrics.map((entry) => (
              <div key={entry.label} className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2">
                <div className="text-xs text-slate-600">{entry.label}</div>
                <div className="mt-1 text-lg font-semibold text-slate-900">{entry.value}</div>
              </div>
            ))}
          </div>
        </section>

        <section className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
          <div className="text-sm font-semibold text-slate-700">Warnungen</div>
          <ul className="mt-2 space-y-1 text-sm text-slate-700">
            {warnings.length === 0 ? <li>Keine offenen Warnungen.</li> : warnings.map((entry) => <li key={entry}>- {entry}</li>)}
          </ul>
        </section>

        <section className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
          <div className="text-sm font-semibold text-slate-700">Schnellaktionen</div>
          <div className="mt-3 flex flex-wrap gap-2">
            {quickActions.map((action) => (
              <Link
                key={action.href}
                href={action.href}
                className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50"
              >
                {action.label}
              </Link>
            ))}
          </div>
        </section>
      </div>
    </AdminLayout>
  )
}
