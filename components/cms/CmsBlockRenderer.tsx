'use client'

import PromotionSlider from '@/components/PromotionSlider'
import type { CmsBlock } from '@/lib/api'

function stringValue(value: unknown) {
  return typeof value === 'string' ? value : ''
}

export default function CmsBlockRenderer({ block }: { block: CmsBlock }) {
  if (block.type === 'Hero') {
    return (
      <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-6">
        <h1 className="text-3xl font-bold text-[var(--brand-ink)]">{stringValue(block.data.headline) || 'Willkommen bei Klarando'}</h1>
        <p className="mt-3 text-rose-900/80">{stringValue(block.data.subline) || 'Digitales Bestellen, modernes Liefergeschäft und klare Prozesse.'}</p>
      </section>
    )
  }

  if (block.type === 'FeatureGrid') {
    const items = Array.isArray(block.data.items) ? block.data.items : []
    return (
      <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-6">
        <h2 className="text-2xl font-semibold text-[var(--brand-ink)]">{stringValue(block.data.title) || 'Vorteile'}</h2>
        <div className="mt-4 grid gap-3 md:grid-cols-3">
          {items.map((entry, index) => {
            const row = entry && typeof entry === 'object' ? (entry as Record<string, unknown>) : {}
            return (
              <article key={`${index}-${stringValue(row.title)}`} className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                <h3 className="font-semibold text-[var(--brand-ink)]">{stringValue(row.title) || `Feature ${index + 1}`}</h3>
                <p className="mt-2 text-sm text-rose-900/75">{stringValue(row.text)}</p>
              </article>
            )
          })}
        </div>
      </section>
    )
  }

  if (block.type === 'TextImage') {
    const imagePosition = stringValue(block.data.imagePosition) === 'right' ? 'md:flex-row-reverse' : 'md:flex-row'
    return (
      <section className={`flex flex-col gap-4 rounded-3xl border border-[var(--brand-border)] bg-white p-6 ${imagePosition}`}>
        <div className="flex-1">
          <h2 className="text-2xl font-semibold text-[var(--brand-ink)]">{stringValue(block.data.title)}</h2>
          <p className="mt-3 text-rose-900/80 whitespace-pre-line">{stringValue(block.data.text)}</p>
        </div>
        {stringValue(block.data.imageUrl) ? (
          <img src={stringValue(block.data.imageUrl)} alt={stringValue(block.data.title) || 'Klarando'} className="h-48 w-full rounded-2xl object-cover md:w-80" />
        ) : null}
      </section>
    )
  }

  if (block.type === 'FAQ') {
    const items = Array.isArray(block.data.items) ? block.data.items : []
    return (
      <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-6">
        <h2 className="text-2xl font-semibold text-[var(--brand-ink)]">{stringValue(block.data.title) || 'Häufige Fragen'}</h2>
        <div className="mt-4 space-y-3">
          {items.map((entry, index) => {
            const row = entry && typeof entry === 'object' ? (entry as Record<string, unknown>) : {}
            return (
              <article key={`${index}-${stringValue(row.question)}`} className="rounded-2xl border border-slate-200 p-4">
                <h3 className="font-semibold text-[var(--brand-ink)]">{stringValue(row.question)}</h3>
                <p className="mt-2 text-sm text-rose-900/80">{stringValue(row.answer)}</p>
              </article>
            )
          })}
        </div>
      </section>
    )
  }

  if (block.type === 'CTA') {
    return (
      <section className="rounded-3xl bg-gradient-to-r from-orange-500 to-rose-500 p-6 text-white">
        <h2 className="text-2xl font-bold">{stringValue(block.data.headline) || 'Jetzt starten'}</h2>
        <p className="mt-2 text-white/90">{stringValue(block.data.text)}</p>
        {stringValue(block.data.buttonText) && stringValue(block.data.buttonUrl) ? (
          <a href={stringValue(block.data.buttonUrl)} className="mt-4 inline-flex rounded-xl bg-white px-4 py-2 text-sm font-semibold text-rose-700">
            {stringValue(block.data.buttonText)}
          </a>
        ) : null}
      </section>
    )
  }

  if (block.type === 'PromotionSlider') {
    const placement = stringValue(block.data.placement) || 'PUBLIC_HOMEPAGE'
    const audience = stringValue(block.data.audience) || 'ALL'
    return <PromotionSlider placement={placement as never} audience={audience as never} />
  }

  return (
    <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-6">
      <h2 className="text-2xl font-semibold text-[var(--brand-ink)]">{stringValue(block.data.title) || 'Rechtlicher Hinweis'}</h2>
      <p className="mt-2 text-rose-900/80">{stringValue(block.data.text)}</p>
      {stringValue(block.data.linkLabel) && stringValue(block.data.linkUrl) ? (
        <a href={stringValue(block.data.linkUrl)} className="mt-3 inline-flex text-sm font-semibold text-rose-700 hover:text-rose-900">
          {stringValue(block.data.linkLabel)}
        </a>
      ) : null}
    </section>
  )
}
