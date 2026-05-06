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

              <div className="relative aspect-video bg-slate-950">
                <iframe
                  src={`/screen/${device.deviceCode}`}
                  title={`Bildschirm ${device.name}`}
                  className="h-full w-full border-0"
                  loading="lazy"
                />
              </div>
            </article>
          ))}
        </div>
      )}
    </section>
  )
}

