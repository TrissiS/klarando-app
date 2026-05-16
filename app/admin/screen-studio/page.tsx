'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import DisplayDeviceManagementPanel from '@/app/Components/admin/DisplayDeviceManagementPanel'
import { getDisplayDeviceOverview, getScreenProducts, type DisplayDeviceOverviewRow, type ScreenProduct } from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type StudioTab = 'OVERVIEW' | 'CONTENT' | 'DESIGN' | 'SCHEDULE' | 'WALLS' | 'DEVICES' | 'PREVIEW'

const STUDIO_TABS: Array<{ key: StudioTab; label: string }> = [
  { key: 'OVERVIEW', label: 'Übersicht' },
  { key: 'CONTENT', label: 'Inhalte' },
  { key: 'DESIGN', label: 'Design' },
  { key: 'SCHEDULE', label: 'Zeitplan' },
  { key: 'WALLS', label: 'Screen-Walls' },
  { key: 'DEVICES', label: 'Geräte' },
  { key: 'PREVIEW', label: 'Vorschau' },
]

const DESIGN_TEMPLATES = [
  'Klarando Modern',
  'Fastfood Board',
  'Premium Glas',
  'Klassische Preistafel',
  'Minimal Dunkel',
  'Tagesangebot',
  'Café/Bäckerei',
  'Döner/Imbiss',
  'Pizza',
  'Burger',
]

export default function AdminScreenStudioPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [activeTab, setActiveTab] = useState<StudioTab>('OVERVIEW')
  const [rows, setRows] = useState<DisplayDeviceOverviewRow[]>([])
  const [products, setProducts] = useState<ScreenProduct[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null
    if (!parsed || parsed.role !== 'admin') {
      window.location.href = '/'
      return
    }
    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    setSession(parsed)
    setToken(accessToken)
  }, [])

  useEffect(() => {
    if (!token || !session?.tenantId) return
    void (async () => {
      try {
        setLoading(true)
        setError('')
        const [overview, screenProducts] = await Promise.all([
          getDisplayDeviceOverview(token, { tenantId: session.tenantId || undefined }),
          getScreenProducts(),
        ])
        setRows(overview.rows)
        setProducts(screenProducts)
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Bildschirmstudio konnte nicht geladen werden.')
      } finally {
        setLoading(false)
      }
    })()
  }, [token, session?.tenantId])

  const stats = useMemo(() => {
    const active = rows.filter((row) => row.isActive).length
    const online = rows.filter((row) => row.status === 'online').length
    const visibleProducts = products.filter((product) => product.screen.showOnScreen).length
    const latestSync = rows
      .map((row) => row.lastSyncAt)
      .filter((value): value is string => Boolean(value))
      .sort()
      .at(-1)
    return { active, online, visibleProducts, latestSync }
  }, [rows, products])

  if (!session || !token) return null

  return (
    <AdminLayout
      title="Bildschirmstudio"
      subtitle="Zentrale Steuerung für Inhalte, Design, Zeitplan, Geräte und TV-taugliche Vorschau"
    >
      <div className="space-y-4">
        <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-2">
          <div className="grid gap-2 sm:grid-cols-3 lg:grid-cols-6">
            {STUDIO_TABS.map((tab) => (
              <button
                key={tab.key}
                type="button"
                onClick={() => setActiveTab(tab.key)}
                className={`rounded-xl px-3 py-2 text-sm font-medium transition ${
                  activeTab === tab.key ? 'bg-orange-600 text-white' : 'bg-rose-50 text-rose-900 hover:bg-rose-100'
                }`}
              >
                {tab.label}
              </button>
            ))}
          </div>
        </div>

        {error ? <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}

        {activeTab === 'OVERVIEW' ? (
          <section className="space-y-4">
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-4">
              <StatCard label="Aktive Bildschirme" value={stats.active} />
              <StatCard label="Online" value={stats.online} />
              <StatCard label="Produkte sichtbar" value={stats.visibleProducts} />
              <StatCard label="Letzte Synchronisierung" value={stats.latestSync ? new Date(stats.latestSync).toLocaleString('de-DE') : '-'} />
            </div>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-4">
              <ActionCard title="Bildschirm verbinden" text="QR-Code scannen und vorhandenes Display zuweisen." href="/admin/display-devices" />
              <ActionCard title="Design erstellen" text="Vorlage wählen und Branding anwenden." onClick={() => setActiveTab('DESIGN')} />
              <ActionCard title="Speisekarte importieren" text="Premium-Onboarding und Menü-Import vorbereiten." href="/superadmin/menu-import" />
              <ActionCard title="Vorschau öffnen" text="TV-Simulation in 16:9, 9:16, HD, FullHD, 4K." onClick={() => setActiveTab('PREVIEW')} />
            </div>
          </section>
        ) : null}

        {activeTab === 'CONTENT' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Inhalte</h2>
            <p className="mt-1 text-sm text-rose-900/75">
              Produkte und Kategorien für Bildschirme steuerst du zentral im Menübildschirm-Editor.
            </p>
            <div className="mt-4 grid gap-3 sm:grid-cols-2">
              <ActionCard title="Produkte auf Bildschirm" text="Sichtbarkeit, Sortierung, Fokus und Angebotsbadge verwalten." href="/admin/screen" />
              <ActionCard title="Produkte verwalten" text="Speisekarte pflegen, Kategorien filtern und Produktdaten ergänzen." href="/admin/products" />
            </div>
          </section>
        ) : null}

        {activeTab === 'DESIGN' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Design</h2>
            <p className="mt-1 text-sm text-rose-900/75">Vorlagen wählen und anschließend im Editor feinjustieren.</p>
            <div className="mt-4 grid gap-3 sm:grid-cols-2 xl:grid-cols-5">
              {DESIGN_TEMPLATES.map((template) => (
                <button key={template} type="button" className="rounded-2xl border border-rose-200 bg-rose-50/80 px-4 py-6 text-left text-sm font-medium text-rose-900 hover:bg-rose-100">
                  {template}
                </button>
              ))}
            </div>
            <div className="mt-4">
              <ActionCard title="Design-Editor öffnen" text="Farben, Schriftgrößen, Kartenstil und Logo-Einstellungen bearbeiten." href="/admin/screen" />
            </div>
          </section>
        ) : null}

        {activeTab === 'SCHEDULE' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Zeitplan</h2>
            <p className="mt-1 text-sm text-rose-900/75">
              Daypart-Scheduling (Frühstück, Mittag, Abend, Happy Hour, Wochenende) ist als nächster Ausbauschritt vorbereitet.
            </p>
            <div className="mt-4 grid gap-3 sm:grid-cols-2 xl:grid-cols-5">
              {['Frühstück', 'Mittag', 'Abend', 'Happy Hour', 'Wochenende'].map((slot) => (
                <div key={slot} className="rounded-xl border border-rose-200 bg-rose-50 px-3 py-4 text-sm text-rose-900">
                  {slot}
                </div>
              ))}
            </div>
          </section>
        ) : null}

        {activeTab === 'DEVICES' ? (
          <DisplayDeviceManagementPanel token={token} roleScope="admin" fixedTenantId={session.tenantId || null} studioMode />
        ) : null}

        {activeTab === 'WALLS' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Screen-Walls</h2>
            <p className="mt-1 text-sm text-rose-900/75">
              Architektur für Multi-Screen-Wände (2–6 Displays) ist vorbereitet: synchronisierte Wiedergabe über Serverzeit, Positionszuweisung und Drift-Korrektur.
            </p>
            <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              <InfoCard title="Wall anlegen" text="Layouts: 2x1, 3x1, 4x1, 5x1, 6x1. Später 2x2 und 3x2." />
              <InfoCard title="Sync-Engine" text="wallSessionId, startsAt, timelineDuration, serverzeitbasierte Phase." />
              <InfoCard title="Virtuelles Canvas" text="Ein großes Canvas, jedes Display rendert nur seinen Ausschnitt." />
              <InfoCard title="Fallback" text="Offline-Geräte werden markiert, restliche Wand läuft weiter." />
              <InfoCard title="Drift-Check" text="Regelmäßiger Abgleich, automatische Timeline-Korrektur pro Device." />
              <InfoCard title="Admin-Vorschau" text="Gesamtwand + Einzelanzeige pro Display mit Sync-Status." />
            </div>
            <div className="mt-4 rounded-xl border border-blue-200 bg-blue-50 px-4 py-3 text-sm text-blue-900">
              Umsetzungsschritt: Datenmodell + API-Verträge sind dokumentiert in <code>SCREEN_WALL_ARCHITECTURE.md</code>. UI-MVP folgt auf dieser Basis.
            </div>
          </section>
        ) : null}

        {activeTab === 'PREVIEW' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Vorschau</h2>
            <p className="mt-1 text-sm text-rose-900/75">
              Vorschauprofile: 1920x1080, 1080x1920, 1280x720, 4K. TV-taugliche Darstellung ohne Scrollen in der Display-App ist aktiv.
            </p>
            <div className="mt-4 grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
              {['1920×1080 Querformat', '1080×1920 Hochformat', '1280×720 HD', '3840×2160 4K'].map((preset) => (
                <div key={preset} className="rounded-xl border border-rose-200 bg-rose-50 px-3 py-4 text-sm font-medium text-rose-900">
                  {preset}
                </div>
              ))}
            </div>
            <div className="mt-4">
              <ActionCard title="Live-Preview öffnen" text="Menübildschirm-Vorschau im Browser öffnen." href="/admin/screen" />
            </div>
          </section>
        ) : null}

        {loading ? <p className="text-sm text-rose-900/70">Lade Bildschirmstudio-Daten …</p> : null}
      </div>
    </AdminLayout>
  )
}

function StatCard({ label, value }: { label: string; value: string | number }) {
  return (
    <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-4 shadow-sm">
      <p className="text-xs uppercase tracking-wide text-rose-900/70">{label}</p>
      <p className="mt-1 text-2xl font-bold text-[var(--brand-ink)]">{value}</p>
    </article>
  )
}

function ActionCard({
  title,
  text,
  href,
  onClick,
}: {
  title: string
  text: string
  href?: string
  onClick?: () => void
}) {
  const content = (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/70 px-4 py-4 text-left transition hover:bg-rose-100">
      <p className="text-sm font-semibold text-[var(--brand-ink)]">{title}</p>
      <p className="mt-1 text-xs text-rose-900/75">{text}</p>
    </div>
  )
  if (href) {
    return (
      <a href={href} className="block">
        {content}
      </a>
    )
  }
  return (
    <button type="button" onClick={onClick} className="block w-full text-left">
      {content}
    </button>
  )
}

function InfoCard({ title, text }: { title: string; text: string }) {
  return (
    <article className="rounded-xl border border-rose-200 bg-rose-50 px-3 py-3">
      <p className="text-sm font-semibold text-[var(--brand-ink)]">{title}</p>
      <p className="mt-1 text-xs text-rose-900/75">{text}</p>
    </article>
  )
}
