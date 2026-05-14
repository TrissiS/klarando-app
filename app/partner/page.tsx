'use client'

import Link from 'next/link'
import PublicCmsPage from '@/components/cms/PublicCmsPage'

function PartnerFallback() {
  return (
    <main className="brand-shell min-h-screen px-4 py-6 md:px-8">
      <div className="mx-auto w-full max-w-4xl space-y-5">
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-6">
          <h1 className="text-3xl font-bold text-[var(--brand-ink)]">Partner werden mit Klarando</h1>
          <p className="mt-3 text-rose-900/80">
            Verbinde Bestellungen, Küche, Lieferung und Displays in einem klaren System.
          </p>
          <Link href="/" className="mt-4 inline-flex rounded-xl bg-[var(--brand-strong)] px-4 py-2 text-sm font-semibold text-white">
            Zum Login
          </Link>
        </section>
      </div>
    </main>
  )
}

export default function PartnerPage() {
  return <PublicCmsPage slug="partner" fallback={<PartnerFallback />} />
}
