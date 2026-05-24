'use client'

type Props = {
  params: Promise<{
    displayCode: string
  }>
}

export default async function LegacyOrderDisplayBlockedPage({ params }: Props) {
  const resolved = await params
  return (
    <main className="flex min-h-screen items-center justify-center bg-slate-950 p-6 text-white">
      <div className="w-full max-w-3xl rounded-2xl border border-red-400/60 bg-red-500/20 p-6">
        <p className="text-sm font-semibold uppercase tracking-wide text-red-100">
          LEGACY DISPLAY ROUTE BLOCKED
        </p>
        <h1 className="mt-2 text-2xl font-extrabold">Diese Route ist für TV-Displays deaktiviert</h1>
        <p className="mt-3 text-sm text-red-100/90">
          Route: <span className="font-mono">/order-display/[displayCode]</span>
        </p>
        <p className="mt-1 text-sm text-red-100/90">
          displayCode: <span className="font-mono">{resolved.displayCode}</span>
        </p>
        <p className="mt-3 text-sm text-red-100/90">
          Zulässig ist nur: <span className="font-mono">/screen/[deviceCode]</span>
        </p>
      </div>
    </main>
  )
}
