'use client'

import PublicCmsPage from '@/components/cms/PublicCmsPage'

function FaqFallback() {
  return (
    <main className="brand-shell min-h-screen px-4 py-6 md:px-8">
      <div className="mx-auto w-full max-w-4xl space-y-4">
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-6">
          <h1 className="text-3xl font-bold text-[var(--brand-ink)]">Häufige Fragen</h1>
          <p className="mt-3 text-rose-900/80">
            Hier erscheinen FAQ-Inhalte aus dem Klarando CMS. Solange nichts veröffentlicht ist, bleibt diese Standardansicht aktiv.
          </p>
        </section>
      </div>
    </main>
  )
}

export default function FaqPage() {
  return <PublicCmsPage slug="faq" fallback={<FaqFallback />} />
}
