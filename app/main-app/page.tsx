'use client'

import Link from 'next/link'
import { useState } from 'react'
import PromotionSlider from '@/components/PromotionSlider'
import PublicCmsPage from '@/components/cms/PublicCmsPage'
import { hasMapsConsent } from '@/lib/cookie-consent'
import {
  getPublicTenantDiscovery,
  type PublicTenantDiscoveryMode,
  type PublicTenantDiscoveryTenant,
} from '@/lib/api'

function MainAppFallbackPage() {
  const [zipCode, setZipCode] = useState('')
  const [street, setStreet] = useState('')
  const [mode, setMode] = useState<PublicTenantDiscoveryMode>('all')
  const [location, setLocation] = useState<{ latitude: number; longitude: number } | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [results, setResults] = useState<PublicTenantDiscoveryTenant[]>([])
  const [searchMeta, setSearchMeta] = useState<{ total: number; zipCode: string } | null>(null)

  async function requestLocation() {
    if (!hasMapsConsent()) {
      setError('Standort/Maps ist derzeit nicht freigegeben. Bitte Cookie-Einstellungen anpassen.')
      return
    }

    if (typeof navigator === 'undefined' || !navigator.geolocation) {
      setError('Standortfunktion ist im Browser nicht verfuegbar.')
      return
    }

    await new Promise<void>((resolve) => {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          setLocation({
            latitude: position.coords.latitude,
            longitude: position.coords.longitude,
          })
          setError('')
          resolve()
        },
        () => {
          setError('Standort konnte nicht gelesen werden. Radius-Match bleibt dann nur PLZ-basiert.')
          resolve()
        },
        { enableHighAccuracy: true, timeout: 8000 }
      )
    })
  }

  async function handleSearch(event: React.FormEvent) {
    event.preventDefault()
    const normalizedZip = zipCode.replace(/[^\d]/g, '').slice(0, 5)
    if (normalizedZip.length !== 5) {
      setError('Bitte eine gueltige 5-stellige PLZ eingeben.')
      return
    }

    try {
      setLoading(true)
      setError('')
      const response = await getPublicTenantDiscovery({
        zipCode: normalizedZip,
        street: street.trim() || null,
        mode,
        latitude: location?.latitude ?? null,
        longitude: location?.longitude ?? null,
      })
      setResults(response.tenants)
      setSearchMeta({
        total: response.total,
        zipCode: response.query.zipCode,
      })
    } catch (searchError) {
      setError(searchError instanceof Error ? searchError.message : 'Filialsuche fehlgeschlagen')
      setResults([])
      setSearchMeta(null)
    } finally {
      setLoading(false)
    }
  }

  return (
    <main className="brand-shell min-h-screen text-[var(--brand-ink)]">
      <header className="border-b border-[var(--brand-border)] bg-white/90 backdrop-blur">
        <div className="mx-auto flex w-full max-w-6xl items-center justify-between px-6 py-5">
          <div className="flex items-center gap-3">
            <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-white p-1.5 ring-1 ring-[var(--brand-border)]">
              <img
                src="/klarando_icon.png"
                alt="Klarando Icon"
                className="h-full w-full object-contain"
              />
            </div>
            <div className="min-w-0">
              <img
                src="/klarando_logo_wordmark.png"
                alt="Klarando Logo"
                className="h-9 w-auto max-w-[230px] object-contain"
              />
              <h1 className="text-2xl font-bold text-[var(--brand-ink)]">Haupt-App Filialsuche</h1>
            </div>
          </div>
          <Link
            href="/"
            className="rounded-xl border border-[var(--brand-border)] bg-white px-4 py-2 text-sm font-medium text-rose-900 transition hover:bg-rose-50"
          >
            Zum Login
          </Link>
        </div>
      </header>

      <div className="mx-auto w-full max-w-6xl px-6 py-8">
        <PromotionSlider placement="MAIN_APP" audience="ALL" />

        <section className="brand-panel rounded-3xl p-5">
          <h2 className="text-xl font-semibold">PLZ / Liefergebiet / Abholgebiet</h2>
          <p className="mt-1 text-sm text-rose-900/70">
            Suche alle hinterlegten Imbisse nach PLZ. Optional mit Strasse und Radius per Standort.
          </p>

          <form onSubmit={handleSearch} className="mt-4 grid gap-3 md:grid-cols-5">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900">PLZ</span>
              <input
                value={zipCode}
                onChange={(event) => setZipCode(event.target.value)}
                placeholder="z. B. 10115"
                className="brand-input w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
              />
            </label>

            <label className="block md:col-span-2">
              <span className="mb-1 block text-sm font-medium text-rose-900">
                Strasse (optional)
              </span>
              <input
                value={street}
                onChange={(event) => setStreet(event.target.value)}
                placeholder="z. B. Musterstrasse"
                className="brand-input w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
              />
            </label>

            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900">Modus</span>
              <select
                value={mode}
                onChange={(event) => setMode(event.target.value as PublicTenantDiscoveryMode)}
                className="brand-input w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
              >
                <option value="all">Lieferung + Abholung</option>
                <option value="delivery">Nur Lieferung</option>
                <option value="pickup">Nur Abholung</option>
              </select>
            </label>

            <div className="flex items-end gap-2">
              <button
                type="submit"
                disabled={loading}
                className="brand-button-primary w-full rounded-xl px-4 py-2.5 text-sm font-semibold transition disabled:cursor-not-allowed disabled:opacity-60"
              >
                {loading ? 'Suche...' : 'Filialen suchen'}
              </button>
            </div>
          </form>

          <div className="mt-3 flex flex-wrap items-center gap-2">
            <button
              type="button"
              onClick={() => void requestLocation()}
              className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-xs font-medium text-rose-900 transition hover:bg-rose-50"
            >
              Standort fuer Radius nutzen
            </button>
            <span className="text-xs text-rose-900/70">
              {location
                ? `Standort aktiv (${location.latitude.toFixed(4)}, ${location.longitude.toFixed(4)})`
                : 'Standort nicht aktiv'}
            </span>
          </div>

          {error ? (
            <div className="mt-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
              {error}
            </div>
          ) : null}
        </section>

        <section className="mt-6">
          <div className="mb-3 flex items-center justify-between">
            <h2 className="text-lg font-semibold">Ergebnisse</h2>
            {searchMeta ? (
              <span className="text-sm text-rose-900/75">
                {searchMeta.total} Treffer fuer {searchMeta.zipCode}
              </span>
            ) : null}
          </div>

          <div className="grid gap-4 md:grid-cols-2">
            {results.map((entry) => (
              <article key={entry.tenantId} className="brand-panel rounded-3xl p-5">
                <div className="flex items-start justify-between gap-3">
                  <div>
                    <h3 className="text-lg font-semibold">{entry.tenantName}</h3>
                    <p className="text-sm text-rose-900/70">
                      {entry.chain?.name || 'Unabhaengige Filiale'}
                    </p>
                  </div>
                  {entry.logoUrl ? (
                    <img
                      src={entry.logoUrl}
                      alt={`${entry.tenantName} Logo`}
                      className="h-12 w-12 rounded-xl border border-[var(--brand-border)] bg-white object-contain"
                    />
                  ) : null}
                </div>

                <p className="mt-3 text-sm text-rose-900/85">
                  {[entry.address.street, entry.address.zipCode, entry.address.city]
                    .filter(Boolean)
                    .join(', ') || 'Adresse wird noch gepflegt'}
                </p>

                <div className="mt-3 flex flex-wrap gap-2">
                  <span
                    className={`rounded-full px-3 py-1 text-xs font-semibold ${
                      entry.services.delivery.available
                        ? 'bg-emerald-100 text-emerald-800'
                        : 'bg-rose-100 text-rose-500'
                    }`}
                  >
                    Lieferung {entry.services.delivery.available ? 'moeglich' : 'nicht aktiv'}
                  </span>
                  <span
                    className={`rounded-full px-3 py-1 text-xs font-semibold ${
                      entry.services.pickup.available
                        ? 'bg-sky-100 text-sky-800'
                        : 'bg-rose-100 text-rose-500'
                    }`}
                  >
                    Abholung {entry.services.pickup.available ? 'moeglich' : 'nicht aktiv'}
                  </span>
                </div>

                <div className="mt-3 grid gap-1 text-xs text-rose-900/75">
                  <p>Liefergebuehr: {entry.deliveryFeeNote || '-'}</p>
                  <p>Mindestbestellwert: {entry.minOrderValue || '-'}</p>
                  <p>Telefon: {entry.contact.phone || '-'}</p>
                </div>
              </article>
            ))}

            {searchMeta && results.length === 0 ? (
              <p className="rounded-2xl border border-dashed border-[var(--brand-border)] bg-white px-4 py-4 text-sm text-rose-900/75">
                Keine Filiale passt auf die aktuelle Suche.
              </p>
            ) : null}
          </div>
        </section>

        <footer className="mt-8 rounded-2xl border border-[var(--brand-border)] bg-white/90 p-4 text-sm text-rose-900/80">
          <div className="flex flex-wrap gap-4">
            <Link href="/impressum" className="font-semibold text-rose-700 hover:text-rose-900">
              Impressum
            </Link>
            <Link href="/datenschutz" className="font-semibold text-rose-700 hover:text-rose-900">
              Datenschutz
            </Link>
            <Link href="/agb" className="font-semibold text-rose-700 hover:text-rose-900">
              AGB
            </Link>
            <Link href="/cookies" className="font-semibold text-rose-700 hover:text-rose-900">
              Cookies
            </Link>
            <Link href="/jugendschutz" className="font-semibold text-rose-700 hover:text-rose-900">
              Jugendschutz
            </Link>
          </div>
        </footer>
      </div>
    </main>
  )
}

export default function MainAppPage() {
  return <PublicCmsPage slug="home" fallback={<MainAppFallbackPage />} />
}

