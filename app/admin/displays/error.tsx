'use client'

type Props = {
  error: Error & { digest?: string }
  reset: () => void
}

export default function AdminDisplaysError({ error, reset }: Props) {
  return (
    <div className="mx-auto mt-10 max-w-2xl rounded-2xl border border-red-200 bg-red-50 p-6 text-red-800">
      <h1 className="text-xl font-semibold">Bildschirm konnte nicht geladen werden</h1>
      <p className="mt-2 text-sm">
        Es ist ein Fehler aufgetreten. Bitte versuche es erneut oder gehe zurück zur Übersicht.
      </p>
      <p className="mt-3 rounded-lg bg-white/70 px-3 py-2 text-xs text-red-700">
        {error?.message || 'Interner Fehler'}
      </p>
      <div className="mt-4 flex gap-2">
        <button
          type="button"
          onClick={reset}
          className="rounded-lg bg-slate-900 px-3 py-2 text-sm font-semibold text-white"
        >
          Erneut versuchen
        </button>
        <a
          href="/admin/display-devices"
          className="rounded-lg border border-slate-300 px-3 py-2 text-sm font-semibold text-slate-800"
        >
          Zur Übersicht
        </a>
      </div>
    </div>
  )
}

