import Link from 'next/link'

async function loadTableSession(token: string) {
  const base = process.env.NEXT_PUBLIC_API_URL || process.env.NEXT_PUBLIC_API_BASE_URL || ''
  if (!base) return null
  try {
    const response = await fetch(`${base.replace(/\/+$/, '')}/api/table-ordering/session/${encodeURIComponent(token)}`, {
      cache: 'no-store',
    })
    if (!response.ok) return null
    return (await response.json()) as {
      tenant?: { name?: string }
      table?: { tableNumber?: string; name?: string; areaName?: string; status?: string }
      session?: { id?: string; status?: string }
    }
  } catch {
    return null
  }
}

export default async function TableQrPage({ params }: { params: Promise<{ qrCodeToken: string }> }) {
  const { qrCodeToken } = await params
  const payload = await loadTableSession(qrCodeToken)

  return (
    <main className="mx-auto flex min-h-screen w-full max-w-3xl flex-col p-6">
      <h1 className="text-2xl font-semibold">Tisch-Bestellung</h1>
      <p className="mt-2 text-sm text-slate-600">Foundation-Ansicht für QR-Tischmodus in Klarando.</p>

      <section className="mt-6 rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
        <h2 className="text-base font-semibold">Tischinformationen</h2>
        <p className="mt-2 text-sm text-slate-600">Restaurant: {payload?.tenant?.name ?? 'Unbekannt'}</p>
        <p className="text-sm text-slate-600">Tisch: {payload?.table?.tableNumber ?? '-'} {payload?.table?.name ? `(${payload.table.name})` : ''}</p>
        <p className="text-sm text-slate-600">Bereich: {payload?.table?.areaName ?? '-'}</p>
        <p className="text-sm text-slate-600">Status: {payload?.table?.status ?? '-'}</p>
      </section>

      <section className="mt-4 grid gap-3 sm:grid-cols-2">
        <button type="button" className="rounded-lg border border-slate-300 bg-slate-50 px-4 py-3 text-sm font-medium text-slate-700">
          Bestellung starten
        </button>
        <button type="button" className="rounded-lg border border-slate-300 bg-slate-50 px-4 py-3 text-sm font-medium text-slate-700">
          Kellner rufen
        </button>
        <button type="button" className="rounded-lg border border-slate-300 bg-slate-50 px-4 py-3 text-sm font-medium text-slate-700">
          Rechnung anfordern
        </button>
        <button type="button" className="rounded-lg border border-slate-300 bg-slate-50 px-4 py-3 text-sm font-medium text-slate-700">
          Nachbestellen
        </button>
      </section>

      <p className="mt-6 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
        Hinweis: Vollständiger Gast-Checkout ist in Vorbereitung. Diese Seite stellt die sichere Basis ohne tote API-Pfade bereit.
      </p>

      <Link href="/" className="mt-6 text-sm text-orange-600 underline">
        Zur Startseite
      </Link>
    </main>
  )
}
