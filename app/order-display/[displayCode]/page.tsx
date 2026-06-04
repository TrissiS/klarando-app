import Link from 'next/link'

type Props = {
  params: Promise<{
    displayCode: string
  }>
}

export default async function LegacyOrderDisplayBlockedPage({ params }: Props) {
  const resolved = await params

  return (
    <main className="flex min-h-screen items-center justify-center bg-slate-950 p-6 text-white">
      <div className="w-full max-w-3xl rounded-2xl border border-amber-400/60 bg-amber-500/15 p-6">
        <p className="text-sm font-semibold uppercase tracking-wide text-amber-100">
          ORDER DISPLAY LEGACY ROUTE
        </p>
        <h1 className="mt-2 text-2xl font-extrabold">
          Diese Route ist kein Menübildschirm mehr
        </h1>
        <p className="mt-3 text-sm text-amber-100/90">
          Route: <span className="font-mono">/order-display/[displayCode]</span>
        </p>
        <p className="mt-1 text-sm text-amber-100/90">
          displayCode: <span className="font-mono">{resolved.displayCode}</span>
        </p>
        <p className="mt-4 text-sm text-amber-50">
          TV- und Menübildschirme laufen ausschließlich über{' '}
          <span className="font-mono">/screen/[deviceCode]</span>.
        </p>
        <p className="mt-2 text-sm text-amber-100/90">
          Order Displays bleiben fachlich für Bestellanzeigen, Abholmonitore und
          Kassendisplays relevant, werden aber nicht mehr über diese öffentliche Legacy-Route
          geöffnet.
        </p>
        <div className="mt-5 flex flex-wrap gap-3">
          <Link
            href="/admin/screen-studio?tab=devices"
            className="rounded-xl bg-white px-4 py-2 text-sm font-semibold text-slate-900 hover:bg-slate-100"
          >
            Zum Bildschirmstudio
          </Link>
          <Link
            href="/admin/order-displays"
            className="rounded-xl border border-white/30 px-4 py-2 text-sm font-semibold text-white hover:bg-white/10"
          >
            Zur Bestellanzeigen-Verwaltung
          </Link>
        </div>
      </div>
    </main>
  )
}
