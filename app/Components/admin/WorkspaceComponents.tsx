'use client'

import Link from 'next/link'

type WorkspaceTab = {
  href: string
  label: string
}

type WorkspaceStat = {
  label: string
  value: string | number
}

type WorkspaceAction = {
  href?: string
  label: string
  disabled?: boolean
  hint?: string
}

export function WorkspaceHeader({
  title,
  subtitle,
}: {
  title: string
  subtitle: string
}) {
  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
      <h2 className="text-base font-semibold text-slate-900">{title}</h2>
      <p className="mt-1 text-sm text-slate-600">{subtitle}</p>
    </div>
  )
}

export function WorkspaceTabs({ tabs }: { tabs: WorkspaceTab[] }) {
  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
      <p className="text-sm font-semibold text-slate-900">Bereiche</p>
      <div className="mt-3 flex flex-wrap gap-2">
        {tabs.map((tab) => (
          <Link
            key={tab.href}
            href={tab.href}
            className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50"
          >
            {tab.label}
          </Link>
        ))}
      </div>
    </div>
  )
}

export function WorkspaceStats({ stats }: { stats: WorkspaceStat[] }) {
  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
      <p className="text-sm font-semibold text-slate-900">Status</p>
      <div className="mt-3 grid gap-2 sm:grid-cols-2 lg:grid-cols-4">
        {stats.map((stat) => (
          <div key={stat.label} className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2">
            <div className="text-xs text-slate-600">{stat.label}</div>
            <div className="mt-1 text-base font-semibold text-slate-900">{stat.value}</div>
          </div>
        ))}
      </div>
    </div>
  )
}

export function WorkspaceActions({ actions }: { actions: WorkspaceAction[] }) {
  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
      <p className="text-sm font-semibold text-slate-900">Schnellaktionen</p>
      <div className="mt-3 flex flex-wrap gap-2">
        {actions.map((action) =>
          action.href && !action.disabled ? (
            <Link
              key={`${action.label}-${action.href}`}
              href={action.href}
              className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50"
            >
              {action.label}
            </Link>
          ) : (
            <button
              key={action.label}
              type="button"
              disabled
              title={action.hint || 'Diese Funktion ist in Vorbereitung.'}
              className="cursor-not-allowed rounded-xl border border-slate-300 bg-slate-100 px-3 py-2 text-sm font-semibold text-slate-500"
            >
              {action.label}
            </button>
          )
        )}
      </div>
    </div>
  )
}

export function WorkspaceWarnings({ warnings }: { warnings: string[] }) {
  if (warnings.length === 0) return null
  return (
    <div className="rounded-2xl border border-amber-200 bg-amber-50 p-4 text-amber-900 shadow-sm">
      <p className="text-sm font-semibold">Hinweise</p>
      <ul className="mt-2 list-disc pl-5 text-sm">
        {warnings.map((warning) => (
          <li key={warning}>{warning}</li>
        ))}
      </ul>
    </div>
  )
}
