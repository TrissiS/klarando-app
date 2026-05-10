'use client'

import type { ReactNode } from 'react'

function cn(...values: Array<string | false | null | undefined>) {
  return values.filter(Boolean).join(' ')
}

export function AdminPageShell({ children, className }: { children: ReactNode; className?: string }) {
  return <div className={cn('mx-auto w-full max-w-[1400px] space-y-6', className)}>{children}</div>
}

export function AdminPageHeader({
  title,
  subtitle,
  action,
}: {
  title: string
  subtitle?: string
  action?: ReactNode
}) {
  return (
    <header className="rounded-3xl border border-[var(--brand-border)] bg-white px-5 py-5 shadow-sm">
      <div className="flex flex-wrap items-start justify-between gap-3">
        <div>
          <h2 className="text-2xl font-bold text-[var(--brand-ink)]">{title}</h2>
          {subtitle ? <p className="mt-1 text-sm text-rose-900/75">{subtitle}</p> : null}
        </div>
        {action ? <div>{action}</div> : null}
      </div>
    </header>
  )
}

export function AdminSectionCard({
  title,
  description,
  children,
  action,
}: {
  title?: string
  description?: string
  children: ReactNode
  action?: ReactNode
}) {
  return (
    <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
      {title || action ? (
        <div className="mb-3 flex flex-wrap items-start justify-between gap-2">
          <div>
            {title ? <h3 className="text-lg font-semibold text-[var(--brand-ink)]">{title}</h3> : null}
            {description ? <p className="mt-1 text-sm text-rose-900/75">{description}</p> : null}
          </div>
          {action ? <div>{action}</div> : null}
        </div>
      ) : null}
      {children}
    </section>
  )
}

export function AdminActionBar({ children }: { children: ReactNode }) {
  return <div className="flex flex-wrap items-center justify-between gap-2">{children}</div>
}

export function AdminFormGrid({ children, twoCols = true }: { children: ReactNode; twoCols?: boolean }) {
  return <div className={cn('grid gap-3', twoCols && 'md:grid-cols-2')}>{children}</div>
}

export function AdminTextInput(
  props: React.InputHTMLAttributes<HTMLInputElement> & { label?: string; hint?: string; error?: string }
) {
  const { label, hint, error, className, ...rest } = props
  return (
    <label className="block text-sm">
      {label ? <span className="mb-1 block text-rose-900/75">{label}</span> : null}
      <input
        {...rest}
        className={cn(
          'w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm text-slate-900 outline-none transition focus:border-orange-400 focus:ring-2 focus:ring-orange-200',
          className
        )}
      />
      {hint ? <span className="mt-1 block text-xs text-rose-900/65">{hint}</span> : null}
      {error ? <span className="mt-1 block text-xs text-red-700">{error}</span> : null}
    </label>
  )
}

export function AdminTextarea(
  props: React.TextareaHTMLAttributes<HTMLTextAreaElement> & { label?: string; hint?: string; error?: string }
) {
  const { label, hint, error, className, ...rest } = props
  return (
    <label className="block text-sm">
      {label ? <span className="mb-1 block text-rose-900/75">{label}</span> : null}
      <textarea
        {...rest}
        className={cn(
          'min-h-[120px] w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm text-slate-900 outline-none transition focus:border-orange-400 focus:ring-2 focus:ring-orange-200',
          className
        )}
      />
      {hint ? <span className="mt-1 block text-xs text-rose-900/65">{hint}</span> : null}
      {error ? <span className="mt-1 block text-xs text-red-700">{error}</span> : null}
    </label>
  )
}

export function AdminSelect(
  props: React.SelectHTMLAttributes<HTMLSelectElement> & { label?: string; hint?: string; error?: string }
) {
  const { label, hint, error, className, children, ...rest } = props
  return (
    <label className="block text-sm">
      {label ? <span className="mb-1 block text-rose-900/75">{label}</span> : null}
      <select
        {...rest}
        className={cn(
          'w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm text-slate-900 outline-none transition focus:border-orange-400 focus:ring-2 focus:ring-orange-200',
          className
        )}
      >
        {children}
      </select>
      {hint ? <span className="mt-1 block text-xs text-rose-900/65">{hint}</span> : null}
      {error ? <span className="mt-1 block text-xs text-red-700">{error}</span> : null}
    </label>
  )
}

export function AdminButton({
  variant = 'primary',
  className,
  ...props
}: React.ButtonHTMLAttributes<HTMLButtonElement> & {
  variant?: 'primary' | 'secondary' | 'danger'
}) {
  return (
    <button
      {...props}
      className={cn(
        'rounded-xl px-3 py-2 text-sm font-semibold transition disabled:cursor-not-allowed disabled:opacity-50',
        variant === 'primary' && 'bg-slate-900 text-white hover:bg-slate-800',
        variant === 'secondary' &&
          'border border-[var(--brand-border)] bg-rose-50 text-rose-900 hover:bg-rose-100',
        variant === 'danger' && 'border border-red-200 bg-red-50 text-red-700 hover:bg-red-100',
        className
      )}
    />
  )
}

export function AdminStatusBadge({
  status,
  label,
}: {
  status: 'online' | 'offline' | 'inactive' | 'success' | 'warning' | 'error' | 'neutral'
  label: string
}) {
  const palette =
    status === 'online' || status === 'success'
      ? 'border-emerald-200 bg-emerald-50 text-emerald-700'
      : status === 'warning'
        ? 'border-amber-200 bg-amber-50 text-amber-700'
        : status === 'offline' || status === 'error'
          ? 'border-red-200 bg-red-50 text-red-700'
          : 'border-slate-200 bg-slate-50 text-slate-700'
  return <span className={cn('inline-flex rounded-full border px-2 py-0.5 text-xs font-semibold', palette)}>{label}</span>
}

export function AdminEmptyState({
  title = 'Keine Daten vorhanden',
  description,
  action,
}: {
  title?: string
  description?: string
  action?: ReactNode
}) {
  return (
    <div className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-5 text-sm text-rose-900/80">
      <p className="font-semibold text-[var(--brand-ink)]">{title}</p>
      {description ? <p className="mt-1">{description}</p> : null}
      {action ? <div className="mt-3">{action}</div> : null}
    </div>
  )
}

export function AdminTabs({
  tabs,
  activeId,
  onChange,
}: {
  tabs: Array<{ id: string; label: string }>
  activeId: string
  onChange: (id: string) => void
}) {
  return (
    <div className="flex flex-wrap gap-2">
      {tabs.map((tab) => (
        <button
          key={tab.id}
          type="button"
          onClick={() => onChange(tab.id)}
          className={cn(
            'rounded-xl border px-3 py-1.5 text-xs font-semibold transition',
            activeId === tab.id
              ? 'border-[var(--brand-ink)] bg-[var(--brand-ink)] text-white'
              : 'border-[var(--brand-border)] bg-white text-rose-900 hover:bg-rose-100'
          )}
        >
          {tab.label}
        </button>
      ))}
    </div>
  )
}

export function AdminTable({ children }: { children: ReactNode }) {
  return (
    <div className="overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
      <table className="min-w-[760px] w-full border-collapse">{children}</table>
    </div>
  )
}
