'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import PromotionSlider from '@/components/PromotionSlider'
import PublicCmsPage from '@/components/cms/PublicCmsPage'
import { hasMapsConsent } from '@/lib/cookie-consent'
import {
  getPublicTenantDiscovery,
  type PublicTenantDiscoveryMode,
  type PublicTenantDiscoveryTenant,
} from '@/lib/api'

type DiscoveryTenantLike = Partial<PublicTenantDiscoveryTenant> & {
  rows?: PublicTenantDiscoveryTenant[]
}

type DiscoveryDiagnostics = {
  currentRoute: string
  discoveryUrl: string
  discoveryLoading: boolean
  discoveryError: string | null
  rawTenantCount: number
  visibleTenantCount: number
  firstTenantName: string | null
  deliveryAvailable: boolean | null
  pickupAvailable: boolean | null
}

function normalizeDiscoveryTenant(entry: DiscoveryTenantLike): PublicTenantDiscoveryTenant {
  const deliveryAvailable = entry.deliveryAvailable ?? entry.services?.delivery?.available ?? false
  const pickupAvailable = entry.pickupAvailable ?? entry.services?.pickup?.available ?? false

  return {
    id: entry.id || entry.tenantId || '',
    tenantId: entry.tenantId || entry.id || '',
    name: entry.name || entry.tenantName || 'Filiale',
    tenantName: entry.tenantName || entry.name || 'Filiale',
    slug: entry.slug || entry.id || entry.tenantId || '',
    ratingAverage: entry.ratingAverage ?? null,
    ratingCount: entry.ratingCount ?? 0,
    chain: entry.chain ?? null,
    contact: entry.contact ?? {
      phone: null,
      email: null,
      website: null,
      supportEmail: null,
      accountDeletionEmail: null,
    },
    legal: entry.legal ?? {
      imprintUrl: null,
      privacyPolicyUrl: null,
      termsUrl: null,
    },
    address: entry.address ?? {
      street: null,
      zipCode: null,
      city: null,
      country: null,
    },
    city: entry.city ?? entry.address?.city ?? null,
    logoUrl: entry.logoUrl ?? null,
    imageUrl: entry.imageUrl ?? entry.logoUrl ?? null,
    deliveryFeeNote: entry.deliveryFeeNote ?? null,
    minOrderValue: entry.minOrderValue ?? null,
    deliveryAvailable,
    pickupAvailable,
    deliveryFee: entry.deliveryFee ?? entry.services?.delivery?.deliveryFee ?? null,
    freeDeliveryFrom: entry.freeDeliveryFrom ?? entry.services?.delivery?.freeDeliveryFrom ?? null,
    estimatedDeliveryMinutes:
      entry.estimatedDeliveryMinutes ?? entry.services?.delivery?.estimatedDeliveryMinutes ?? null,
    openingStatus: entry.openingStatus ?? {
      isOpenNow: false,
      delivery: 'CLOSED',
      pickup: 'CLOSED',
    },
    serviceFee: entry.serviceFee ?? {
      enabled: false,
      mode: 'FIXED',
      fixedAmount: null,
      percent: null,
      label: null,
    },
    customerApp: entry.customerApp ?? {
      listingEnabled: true,
      orderingEnabled: true,
      guestRegistrationEnabled: true,
      guestCheckoutEnabled: true,
      orderHeaderImageUrl: null,
      localInfoTitle: null,
      localInfoText: null,
      listingDisplay: {
        showLogo: true,
        showChainName: true,
        showAddress: true,
        showAvailabilityBadges: true,
        showMinOrderValue: true,
        showDeliveryFeeNote: true,
        showDistance: true,
      },
      navigation: {
        bottomTabs: [],
      },
    },
    orderIntake: entry.orderIntake,
    deliveryScheduling: entry.deliveryScheduling,
    services: {
      delivery: {
        available: deliveryAvailable,
        strategy: entry.services?.delivery?.strategy ?? 'ZIP_LIST',
        minOrderValue:
          entry.services?.delivery?.minOrderValue ??
          (typeof entry.minOrderValue === 'number' ? entry.minOrderValue : null),
        deliveryFee: entry.services?.delivery?.deliveryFee ?? entry.deliveryFee ?? null,
        freeDeliveryFrom: entry.services?.delivery?.freeDeliveryFrom ?? entry.freeDeliveryFrom ?? null,
        estimatedDeliveryMinutes:
          entry.services?.delivery?.estimatedDeliveryMinutes ??
          entry.estimatedDeliveryMinutes ??
          null,
        matchedByZip: entry.services?.delivery?.matchedByZip ?? false,
        matchedByRadius: entry.services?.delivery?.matchedByRadius ?? false,
        matchedByPolygon: entry.services?.delivery?.matchedByPolygon ?? false,
        distanceKm: entry.services?.delivery?.distanceKm ?? null,
        nextAvailableAt: entry.services?.delivery?.nextAvailableAt ?? null,
        debug: entry.services?.delivery?.debug,
      },
      pickup: {
        available: pickupAvailable,
        strategy: entry.services?.pickup?.strategy ?? 'ZIP_LIST',
        matchedByZip: entry.services?.pickup?.matchedByZip ?? false,
        matchedByRadius: entry.services?.pickup?.matchedByRadius ?? false,
        matchedByPolygon: entry.services?.pickup?.matchedByPolygon ?? false,
        distanceKm: entry.services?.pickup?.distanceKm ?? null,
        debug: entry.services?.pickup?.debug,
      },
    },
  }
}

function MainAppFallbackPage({
  onDiagnosticsChange,
  currentRoute,
  debugSearch,
}: {
  onDiagnosticsChange: (diagnostics: DiscoveryDiagnostics) => void
  currentRoute: string
  debugSearch: string
}) {
  const [zipCode, setZipCode] = useState('')
  const [street, setStreet] = useState('')
  const [mode, setMode] = useState<PublicTenantDiscoveryMode>('all')
  const [location, setLocation] = useState<{ latitude: number; longitude: number } | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [results, setResults] = useState<PublicTenantDiscoveryTenant[]>([])
  const [searchMeta, setSearchMeta] = useState<{ total: number; zipCode: string } | null>(null)

  function formatMoney(value: number | null) {
    if (typeof value !== 'number' || !Number.isFinite(value)) {
      return '-'
    }
    return `${value.toFixed(2)} EUR`
  }

  const discoveryUrl = useMemo(() => {
    const query = new URLSearchParams()
    const normalizedZip = zipCode.replace(/[^\d]/g, '').slice(0, 5)
    if (street.trim()) query.set('street', street.trim())
    if (normalizedZip) query.set('zipCode', normalizedZip)
    const currentParams = new URLSearchParams(debugSearch)
    const city = currentParams.get('city')
    if (city) query.set('city', city)
    if (mode && mode !== 'all') query.set('mode', mode)
    if (typeof location?.latitude === 'number') query.set('latitude', String(location.latitude))
    if (typeof location?.longitude === 'number') query.set('longitude', String(location.longitude))
    const suffix = query.toString()
    return `/api/tenants/public/discovery${suffix ? `?${suffix}` : ''}`
  }, [debugSearch, location?.latitude, location?.longitude, mode, street, zipCode])

  useEffect(() => {
    const firstTenant = results[0] ?? null
    onDiagnosticsChange({
      currentRoute,
      discoveryUrl,
      discoveryLoading: loading,
      discoveryError: error || null,
      rawTenantCount: searchMeta?.total ?? results.length,
      visibleTenantCount: results.length,
      firstTenantName: firstTenant?.name || firstTenant?.tenantName || null,
      deliveryAvailable: firstTenant?.deliveryAvailable ?? null,
      pickupAvailable: firstTenant?.pickupAvailable ?? null,
    })
  }, [currentRoute, discoveryUrl, error, loading, onDiagnosticsChange, results, searchMeta])

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
      const responseLike = response as unknown as {
        tenants?: DiscoveryTenantLike[]
        rows?: DiscoveryTenantLike[]
        total?: number
        query?: { zipCode?: string }
      }
      const tenantRows = Array.isArray(responseLike.tenants)
        ? responseLike.tenants
        : Array.isArray(responseLike.rows)
          ? responseLike.rows
          : []
      const normalizedResults = tenantRows
        .map((entry) => normalizeDiscoveryTenant(entry))
        .filter((entry) => entry.deliveryAvailable || entry.pickupAvailable)
      setResults(normalizedResults)
      setSearchMeta({
        total: typeof responseLike.total === 'number' ? responseLike.total : normalizedResults.length,
        zipCode: responseLike.query?.zipCode || normalizedZip,
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
              <article key={entry.id || entry.tenantId} className="brand-panel rounded-3xl p-5">
                <div className="flex items-start justify-between gap-3">
                  <div>
                    <h3 className="text-lg font-semibold">{entry.name || entry.tenantName}</h3>
                    <p className="text-sm text-rose-900/70">
                      {entry.chain?.name || 'Unabhaengige Filiale'}
                    </p>
                  </div>
                  {entry.imageUrl || entry.logoUrl ? (
                    <img
                      src={entry.imageUrl || entry.logoUrl || ''}
                      alt={`${entry.name || entry.tenantName} Logo`}
                      className="h-12 w-12 rounded-xl border border-[var(--brand-border)] bg-white object-contain"
                    />
                  ) : null}
                </div>

                <p className="mt-3 text-sm text-rose-900/85">
                  {[entry.address.street, entry.address.zipCode, entry.city || entry.address.city]
                    .filter(Boolean)
                    .join(', ') || 'Adresse wird noch gepflegt'}
                </p>

                <div className="mt-3 flex flex-wrap gap-2">
                  <span
                    className={`rounded-full px-3 py-1 text-xs font-semibold ${
                      entry.deliveryAvailable
                        ? 'bg-emerald-100 text-emerald-800'
                        : 'bg-rose-100 text-rose-500'
                    }`}
                  >
                    Lieferung {entry.deliveryAvailable ? 'moeglich' : 'nicht verfuegbar'}
                  </span>
                  <span
                    className={`rounded-full px-3 py-1 text-xs font-semibold ${
                      entry.pickupAvailable
                        ? 'bg-sky-100 text-sky-800'
                        : 'bg-rose-100 text-rose-500'
                    }`}
                  >
                    Abholung {entry.pickupAvailable ? 'moeglich' : 'nicht verfuegbar'}
                  </span>
                  <span
                    className={`rounded-full px-3 py-1 text-xs font-semibold ${
                      entry.openingStatus.isOpenNow
                        ? 'bg-amber-100 text-amber-800'
                        : 'bg-slate-200 text-slate-700'
                    }`}
                  >
                    {entry.openingStatus.isOpenNow ? 'Jetzt geoeffnet' : 'Derzeit geschlossen'}
                  </span>
                </div>

                <div className="mt-3 grid gap-1 text-xs text-rose-900/75">
                  <p>Liefergebuehr: {entry.deliveryFee !== null ? formatMoney(entry.deliveryFee) : entry.deliveryFeeNote || '-'}</p>
                  <p>Mindestbestellwert: {entry.services.delivery.minOrderValue !== null ? formatMoney(entry.services.delivery.minOrderValue) : entry.minOrderValue || '-'}</p>
                  <p>Lieferzeit: {typeof entry.estimatedDeliveryMinutes === 'number' ? `${entry.estimatedDeliveryMinutes} Min.` : '-'}</p>
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
  const [routeInfo, setRouteInfo] = useState({
    currentRoute: '/main-app',
    search: '',
    debugEnabled: false,
  })
  const [diagnostics, setDiagnostics] = useState<DiscoveryDiagnostics>({
    currentRoute: '/main-app',
    discoveryUrl: '/api/tenants/public/discovery',
    discoveryLoading: false,
    discoveryError: null,
    rawTenantCount: 0,
    visibleTenantCount: 0,
    firstTenantName: null,
    deliveryAvailable: null,
    pickupAvailable: null,
  })

  useEffect(() => {
    if (typeof window === 'undefined') return
    const params = new URLSearchParams(window.location.search)
    setRouteInfo({
      currentRoute: window.location.pathname || '/main-app',
      search: window.location.search || '',
      debugEnabled: process.env.NODE_ENV === 'development' || params.get('debugDiscovery') === '1',
    })
  }, [])

  useEffect(() => {
    setDiagnostics((current) => ({
      ...current,
      currentRoute: routeInfo.currentRoute,
    }))
  }, [routeInfo.currentRoute])

  return (
    <>
      {routeInfo.debugEnabled ? (
        <section className="mx-auto mt-4 w-full max-w-6xl rounded-2xl border border-amber-300 bg-amber-50 px-4 py-4 text-sm text-amber-950">
          <p className="font-semibold">Discovery Debug</p>
          <div className="mt-2 grid gap-1 font-mono text-xs sm:grid-cols-2">
            <p>currentRoute: {diagnostics.currentRoute}</p>
            <p>discoveryUrl: {diagnostics.discoveryUrl}</p>
            <p>discoveryLoading: {String(diagnostics.discoveryLoading)}</p>
            <p>discoveryError: {diagnostics.discoveryError || '-'}</p>
            <p>rawTenantCount: {diagnostics.rawTenantCount}</p>
            <p>visibleTenantCount: {diagnostics.visibleTenantCount}</p>
            <p>firstTenantName: {diagnostics.firstTenantName || '-'}</p>
            <p>deliveryAvailable: {diagnostics.deliveryAvailable === null ? '-' : String(diagnostics.deliveryAvailable)}</p>
            <p>pickupAvailable: {diagnostics.pickupAvailable === null ? '-' : String(diagnostics.pickupAvailable)}</p>
          </div>
        </section>
      ) : null}
      <PublicCmsPage
        slug="home"
        fallback={
          <MainAppFallbackPage
            onDiagnosticsChange={setDiagnostics}
            currentRoute={routeInfo.currentRoute}
            debugSearch={routeInfo.search}
          />
        }
      />
    </>
  )
}
