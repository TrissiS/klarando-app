import type { ScreenDevice } from '@/lib/api'

type Props = {
  devices: ScreenDevice[]
}

export default function AdminScreenPreviews({ devices }: Props) {
  const activeDevices = devices.filter((device) => device.isActive).slice(0, 6)

  return (
    <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
      <div className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <h2 className="text-xl font-semibold">Bildschirm-Vorschau</h2>
          <p className="mt-1 text-sm text-rose-900/70">
            Live-Einblick in aktive Displays.
          </p>
        </div>
      </div>

      {activeDevices.length === 0 ? (
        <div className="mt-4 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
          Keine Daten vorhanden.
        </div>
      ) : (
        <div className="mt-4 grid gap-4 md:grid-cols-2 xl:grid-cols-3">
          {activeDevices.map((device) => (
            <article
              key={device.id}
              className="overflow-hidden rounded-2xl border border-[var(--brand-border)] bg-rose-50/60"
            >
              <div className="flex items-center justify-between border-b border-[var(--brand-border)] bg-white px-3 py-2">
                <div>
                  <p className="text-sm font-semibold text-[var(--brand-ink)]">{device.name}</p>
                  <p className="text-xs text-rose-900/70">
                    {device.location || 'Kein Standort'} | {device.deviceCode}
                  </p>
                </div>
                <a
                  href={`/screen/${device.deviceCode}`}
                  target="_blank"
                  rel="noreferrer"
                    className="rounded-lg bg-slate-900 px-2.5 py-1 text-xs font-medium text-white transition hover:bg-slate-800"
                  >
                  Öffnen
                </a>
              </div>

              <div className="relative flex aspect-video items-center justify-center bg-slate-950 p-4 text-center">
                <div>
                  <p className="text-xs font-semibold uppercase tracking-wide text-white/70">
                    Live-Route wird nicht automatisch geladen
                  </p>
                  <p className="mt-2 text-sm text-white/80">
                    Öffne die TV-Ansicht nur bei Bedarf per Klick.
                  </p>
                  <a
                    href={`/screen/${device.deviceCode}`}
                    target="_blank"
                    rel="noreferrer"
                    className="mt-3 inline-flex rounded-lg bg-white px-3 py-1.5 text-xs font-semibold text-slate-900 transition hover:bg-slate-100"
                  >
                    Live-Preview öffnen
                  </a>
                </div>
              </div>
            </article>
          ))}
        </div>
      )}
    </section>
  )
}

