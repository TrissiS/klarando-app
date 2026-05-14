'use client'

import { useEffect, useMemo, useRef, useState } from 'react'
import type {
  BusinessServiceArea,
  BusinessServiceAreaPolygonPoint,
  BusinessServiceAreaStrategy,
} from '@/lib/api'

type Props = {
  title: string
  subtitle?: string
  value: BusinessServiceArea
  disabled?: boolean
  onChange: (next: BusinessServiceArea) => void
}

const STRATEGY_OPTIONS: Array<{ value: BusinessServiceAreaStrategy; label: string }> = [
  { value: 'ZIP_LIST', label: 'Nur PLZ-Liste' },
  { value: 'RADIUS', label: 'Nur Radius' },
  { value: 'ZIP_OR_RADIUS', label: 'PLZ ODER Radius' },
  { value: 'ZIP_AND_RADIUS', label: 'PLZ UND Radius' },
  { value: 'POLYGON', label: 'Google Maps Polygon' },
]

const GOOGLE_MAPS_SCRIPT_ID = 'klarando-google-maps-script'
const DEFAULT_MAP_CENTER = { lat: 52.52, lng: 13.405 }
const POLYGON_OPTIONS = {
  fillColor: '#fb923c',
  fillOpacity: 0.2,
  strokeColor: '#ea580c',
  strokeOpacity: 1,
  strokeWeight: 2,
}

declare global {
  interface Window {
    google?: {
      maps?: {
        Map: new (
          element: HTMLElement,
          options: {
            center: { lat: number; lng: number }
            zoom: number
            mapTypeControl?: boolean
            streetViewControl?: boolean
            fullscreenControl?: boolean
          }
        ) => GoogleMap
        Polygon: new (options: {
          map?: GoogleMap
          paths?: BusinessServiceAreaPolygonPoint[]
          editable?: boolean
          draggable?: boolean
          fillColor?: string
          fillOpacity?: number
          strokeColor?: string
          strokeOpacity?: number
          strokeWeight?: number
        }) => GooglePolygon
        LatLngBounds: new () => GoogleLatLngBounds
        drawing?: {
          DrawingManager: new (options: {
            map?: GoogleMap
            drawingMode?: unknown
            drawingControl?: boolean
            drawingControlOptions?: {
              drawingModes?: unknown[]
            }
            polygonOptions?: {
              editable?: boolean
              draggable?: boolean
              fillColor?: string
              fillOpacity?: number
              strokeColor?: string
              strokeOpacity?: number
              strokeWeight?: number
            }
          }) => GoogleDrawingManager
          OverlayType: {
            POLYGON: string
          }
        }
        event: {
          addListener: (
            target: unknown,
            eventName: string,
            handler: (...args: unknown[]) => void
          ) => unknown
          removeListener: (listener: unknown) => void
        }
      }
    }
    __klarandoGoogleMapsLoader?: Promise<void>
  }
}

type GoogleMap = {
  fitBounds: (bounds: GoogleLatLngBounds) => void
  setCenter: (center: { lat: number; lng: number }) => void
  setZoom: (zoom: number) => void
}

type GoogleLatLng = {
  lat: () => number
  lng: () => number
}

type GoogleMVCArray = {
  getLength: () => number
  getAt: (index: number) => GoogleLatLng
}

type GooglePolygon = {
  getPath: () => GoogleMVCArray
  setPath: (path: BusinessServiceAreaPolygonPoint[]) => void
  setMap: (map: GoogleMap | null) => void
  setEditable: (editable: boolean) => void
}

type GoogleDrawingManager = {
  setMap: (map: GoogleMap | null) => void
  setDrawingMode: (mode: unknown) => void
  setOptions: (options: { drawingControl?: boolean }) => void
}

type GoogleOverlayCompleteEvent = {
  overlay?: GooglePolygon
}

type GoogleLatLngBounds = {
  extend: (point: { lat: number; lng: number }) => void
}

function parseZipList(value: string) {
  return Array.from(
    new Set(
      value
        .split(/[\n,;]+/)
        .map((entry) => entry.replace(/[^\d]/g, '').trim())
        .filter((entry) => /^\d{5}$/.test(entry))
    )
  )
}

function parseTextList(value: string) {
  return Array.from(
    new Set(
      value
        .split(/[\n,;]+/)
        .map((entry) => entry.trim().toLowerCase())
        .filter((entry) => entry.length > 1)
    )
  )
}

function parseNumber(value: string) {
  const normalized = value.replace(',', '.').trim()
  if (!normalized) {
    return null
  }

  const parsed = Number(normalized)
  return Number.isFinite(parsed) ? parsed : null
}

function normalizePoint(point: BusinessServiceAreaPolygonPoint) {
  return {
    lat: Number(point.lat.toFixed(6)),
    lng: Number(point.lng.toFixed(6)),
  }
}

function normalizePolygonPath(path: BusinessServiceAreaPolygonPoint[]) {
  return path
    .filter(
      (point) =>
        Number.isFinite(point.lat) &&
        Number.isFinite(point.lng) &&
        point.lat >= -90 &&
        point.lat <= 90 &&
        point.lng >= -180 &&
        point.lng <= 180
    )
    .map(normalizePoint)
    .slice(0, 200)
}

function serializeList(items: string[]) {
  return items.join('\n')
}

function serializePolygonPath(path: BusinessServiceAreaPolygonPoint[]) {
  return path.map((point) => `${point.lat.toFixed(6)},${point.lng.toFixed(6)}`).join(';')
}

function buildGoogleMapsUrl(area: BusinessServiceArea) {
  if (typeof area.centerLatitude === 'number' && typeof area.centerLongitude === 'number') {
    return `https://www.google.com/maps?q=${area.centerLatitude},${area.centerLongitude}`
  }

  const queryParts = [area.centerStreet, area.centerZipCode, area.centerCity]
    .map((entry) => (entry || '').trim())
    .filter((entry) => entry.length > 0)

  if (queryParts.length === 0) {
    return null
  }

  return `https://www.google.com/maps?q=${encodeURIComponent(queryParts.join(', '))}`
}

function hasMapsConsent() {
  if (typeof window === 'undefined') return false
  try {
    const raw = window.localStorage.getItem('klarando.cookieConsent.v1')
    if (!raw) return false
    const parsed = JSON.parse(raw) as { maps?: boolean }
    return parsed.maps === true
  } catch {
    return false
  }
}

async function loadGoogleMapsApi(apiKey: string) {
  if (typeof window === 'undefined') {
    throw new Error('Google Maps ist nur im Browser verfuegbar.')
  }

  if (window.google?.maps?.drawing) {
    return
  }

  if (window.__klarandoGoogleMapsLoader) {
    await window.__klarandoGoogleMapsLoader
    return
  }

  window.__klarandoGoogleMapsLoader = new Promise<void>((resolve, reject) => {
    const existingScript = document.getElementById(GOOGLE_MAPS_SCRIPT_ID)
    if (existingScript) {
      existingScript.addEventListener('load', () => resolve(), { once: true })
      existingScript.addEventListener('error', () => reject(new Error('Google Maps konnte nicht geladen werden.')), {
        once: true,
      })
      return
    }

    const script = document.createElement('script')
    script.id = GOOGLE_MAPS_SCRIPT_ID
    script.async = true
    script.defer = true
    script.src = `https://maps.googleapis.com/maps/api/js?key=${encodeURIComponent(apiKey)}&libraries=drawing`
    script.onload = () => resolve()
    script.onerror = () => reject(new Error('Google Maps konnte nicht geladen werden.'))
    document.head.appendChild(script)
  })

  await window.__klarandoGoogleMapsLoader
}

function extractPolygonPath(polygon: GooglePolygon | null) {
  if (!polygon) {
    return [] as BusinessServiceAreaPolygonPoint[]
  }

  const path = polygon.getPath()
  const next: BusinessServiceAreaPolygonPoint[] = []
  for (let index = 0; index < path.getLength(); index += 1) {
    const point = path.getAt(index)
    next.push(
      normalizePoint({
        lat: point.lat(),
        lng: point.lng(),
      })
    )
  }

  return normalizePolygonPath(next)
}

export default function ServiceAreaEditor({
  title,
  subtitle,
  value,
  disabled = false,
  onChange,
}: Props) {
  const [zipCodesInput, setZipCodesInput] = useState(() => serializeList(value.zipCodes))
  const [excludedZipCodesInput, setExcludedZipCodesInput] = useState(() =>
    serializeList(value.excludedZipCodes)
  )
  const [excludedStreetsInput, setExcludedStreetsInput] = useState(() =>
    serializeList(value.excludedStreets)
  )
  const [zipCodesFocused, setZipCodesFocused] = useState(false)
  const [excludedZipCodesFocused, setExcludedZipCodesFocused] = useState(false)
  const [excludedStreetsFocused, setExcludedStreetsFocused] = useState(false)
  const [mapsReady, setMapsReady] = useState(false)
  const [mapsError, setMapsError] = useState('')
  const mapContainerRef = useRef<HTMLDivElement | null>(null)
  const mapRef = useRef<GoogleMap | null>(null)
  const polygonRef = useRef<GooglePolygon | null>(null)
  const drawingManagerRef = useRef<GoogleDrawingManager | null>(null)
  const polygonListenersRef = useRef<unknown[]>([])
  const latestValueRef = useRef(value)
  const googleMapsApiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY || ''
  const [mapsConsentGranted, setMapsConsentGranted] = useState(false)

  useEffect(() => {
    if (typeof window === 'undefined') return
    const refresh = () => setMapsConsentGranted(hasMapsConsent())
    refresh()
    window.addEventListener('storage', refresh)
    return () => window.removeEventListener('storage', refresh)
  }, [])

  function patch(next: Partial<BusinessServiceArea>) {
    onChange({
      ...value,
      ...next,
    })
  }

  function patchWithLatest(next: Partial<BusinessServiceArea>) {
    onChange({
      ...latestValueRef.current,
      ...next,
    })
  }

  function clearPolygonListeners() {
    if (!window.google?.maps?.event) {
      polygonListenersRef.current = []
      return
    }

    polygonListenersRef.current.forEach((listener) => {
      window.google?.maps?.event?.removeListener(listener)
    })
    polygonListenersRef.current = []
  }

  function fitMapToPolygon(path: BusinessServiceAreaPolygonPoint[]) {
    if (!mapRef.current || !window.google?.maps || path.length === 0) {
      return
    }

    const bounds = new window.google.maps.LatLngBounds()
    path.forEach((point) => bounds.extend(point))
    mapRef.current.fitBounds(bounds)
  }

  function syncPolygonToSettings() {
    const nextPath = extractPolygonPath(polygonRef.current)
    patchWithLatest({
      polygonPath: nextPath,
      strategy: nextPath.length >= 3 ? 'POLYGON' : latestValueRef.current.strategy,
    })
  }

  function attachPolygonListeners() {
    if (!window.google?.maps?.event || !polygonRef.current) {
      return
    }

    clearPolygonListeners()
    const path = polygonRef.current.getPath()
    const events = ['insert_at', 'set_at', 'remove_at']
    polygonListenersRef.current = events.map((eventName) =>
      window.google?.maps?.event?.addListener(path, eventName, syncPolygonToSettings)
    )
  }

  const polygonPath = useMemo(
    () => normalizePolygonPath(value.polygonPath || []),
    [value.polygonPath]
  )
  const zipCodesSerialized = serializeList(value.zipCodes)
  const excludedZipCodesSerialized = serializeList(value.excludedZipCodes)
  const excludedStreetsSerialized = serializeList(value.excludedStreets)
  const polygonPathSerialized = serializePolygonPath(polygonPath)
  const googleMapsUrl = useMemo(() => buildGoogleMapsUrl(value), [value])

  useEffect(() => {
    latestValueRef.current = value
  }, [value])

  useEffect(() => {
    if (!zipCodesFocused) {
      setZipCodesInput(zipCodesSerialized)
    }
  }, [zipCodesSerialized, zipCodesFocused])

  useEffect(() => {
    if (!excludedZipCodesFocused) {
      setExcludedZipCodesInput(excludedZipCodesSerialized)
    }
  }, [excludedZipCodesSerialized, excludedZipCodesFocused])

  useEffect(() => {
    if (!excludedStreetsFocused) {
      setExcludedStreetsInput(excludedStreetsSerialized)
    }
  }, [excludedStreetsSerialized, excludedStreetsFocused])

  useEffect(() => {
    if (!mapsConsentGranted) {
      setMapsReady(false)
      setMapsError('Google Maps ist deaktiviert, bis Standort/Maps im Consent freigegeben wurde.')
      return
    }

    if (!googleMapsApiKey) {
      setMapsReady(false)
      setMapsError('')
      return
    }

    let cancelled = false

    async function setupMap() {
      try {
        await loadGoogleMapsApi(googleMapsApiKey)
        if (cancelled || !window.google?.maps || !mapContainerRef.current) {
          return
        }

        const initialCenter =
          typeof value.centerLatitude === 'number' && typeof value.centerLongitude === 'number'
            ? { lat: value.centerLatitude, lng: value.centerLongitude }
            : polygonPath[0] || DEFAULT_MAP_CENTER

        if (!mapRef.current) {
          mapRef.current = new window.google.maps.Map(mapContainerRef.current, {
            center: initialCenter,
            zoom: polygonPath.length >= 3 ? 12 : 6,
            mapTypeControl: false,
            streetViewControl: false,
            fullscreenControl: false,
          })
        }

        if (!drawingManagerRef.current && window.google.maps.drawing) {
          const drawingManager = new window.google.maps.drawing.DrawingManager({
            map: mapRef.current,
            drawingMode: null,
            drawingControl: !disabled,
            drawingControlOptions: {
              drawingModes: [window.google.maps.drawing.OverlayType.POLYGON],
            },
            polygonOptions: {
              ...POLYGON_OPTIONS,
              editable: !disabled,
              draggable: false,
            },
          })
          drawingManagerRef.current = drawingManager

          window.google.maps.event.addListener(
            drawingManager,
            'overlaycomplete',
            (...args: unknown[]) => {
              const event = args[0] as GoogleOverlayCompleteEvent | undefined
              const overlay = event?.overlay
              if (!overlay) {
                return
              }

              if (polygonRef.current) {
                clearPolygonListeners()
                polygonRef.current.setMap(null)
              }

              polygonRef.current = overlay
              overlay.setEditable(!disabled)
              attachPolygonListeners()
              syncPolygonToSettings()
              drawingManagerRef.current?.setDrawingMode(null)
            }
          )
        }

        setMapsReady(true)
        setMapsError('')
      } catch (error) {
        if (!cancelled) {
          setMapsReady(false)
          setMapsError(error instanceof Error ? error.message : 'Google Maps konnte nicht geladen werden.')
        }
      }
    }

    void setupMap()

    return () => {
      cancelled = true
    }
  }, [googleMapsApiKey, disabled, mapsConsentGranted, polygonPath, value.centerLatitude, value.centerLongitude])

  useEffect(() => {
    if (!mapsReady || !window.google?.maps || !mapRef.current) {
      return
    }

    drawingManagerRef.current?.setOptions({ drawingControl: !disabled })

    if (polygonPath.length < 3) {
      clearPolygonListeners()
      if (polygonRef.current) {
        polygonRef.current.setMap(null)
        polygonRef.current = null
      }
      return
    }

    const currentPath = extractPolygonPath(polygonRef.current)
    const currentSerialized = serializePolygonPath(currentPath)
    if (!polygonRef.current) {
      polygonRef.current = new window.google.maps.Polygon({
        map: mapRef.current,
        paths: polygonPath,
        editable: !disabled,
        draggable: false,
        ...POLYGON_OPTIONS,
      })
      attachPolygonListeners()
      fitMapToPolygon(polygonPath)
      return
    }

    polygonRef.current.setEditable(!disabled)
    if (currentSerialized !== polygonPathSerialized) {
      polygonRef.current.setPath(polygonPath)
    }
  }, [mapsReady, disabled, polygonPath, polygonPathSerialized])

  useEffect(() => {
    return () => {
      clearPolygonListeners()
      polygonRef.current?.setMap(null)
      drawingManagerRef.current?.setMap(null)
    }
  }, [])

  return (
    <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
      <h3 className="text-lg font-semibold">{title}</h3>
      {subtitle ? <p className="mt-1 text-sm text-rose-900/70">{subtitle}</p> : null}

      <div className="mt-4 grid gap-3 sm:grid-cols-2">
        <label className="inline-flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm text-rose-900/85">
          <input
            type="checkbox"
            checked={value.enabled}
            disabled={disabled}
            onChange={(event) => patch({ enabled: event.target.checked })}
          />
          Bereich aktiv
        </label>

        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Regeltyp</span>
          <select
            value={value.strategy}
            disabled={disabled || !value.enabled}
            onChange={(event) =>
              patch({
                strategy: event.target.value as BusinessServiceAreaStrategy,
              })
            }
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          >
            {STRATEGY_OPTIONS.map((entry) => (
              <option key={entry.value} value={entry.value}>
                {entry.label}
              </option>
            ))}
          </select>
        </label>

        <label className="block sm:col-span-2">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">
            Erlaubte PLZ (eine pro Zeile oder komma-getrennt)
          </span>
          <textarea
            rows={3}
            value={zipCodesInput}
            disabled={disabled || !value.enabled}
            onFocus={() => setZipCodesFocused(true)}
            onChange={(event) => {
              setZipCodesInput(event.target.value)
              patch({ zipCodes: parseZipList(event.target.value) })
            }}
            onBlur={(event) => {
              setZipCodesFocused(false)
              patch({ zipCodes: parseZipList(event.target.value) })
            }}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">
            Ausgeschlossene PLZ
          </span>
          <textarea
            rows={3}
            value={excludedZipCodesInput}
            disabled={disabled || !value.enabled}
            onFocus={() => setExcludedZipCodesFocused(true)}
            onChange={(event) => {
              setExcludedZipCodesInput(event.target.value)
              patch({ excludedZipCodes: parseZipList(event.target.value) })
            }}
            onBlur={(event) => {
              setExcludedZipCodesFocused(false)
              patch({ excludedZipCodes: parseZipList(event.target.value) })
            }}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">
            Ausgeschlossene Strassen (Teiltext)
          </span>
          <textarea
            rows={3}
            value={excludedStreetsInput}
            disabled={disabled || !value.enabled}
            onFocus={() => setExcludedStreetsFocused(true)}
            onChange={(event) => {
              setExcludedStreetsInput(event.target.value)
              patch({ excludedStreets: parseTextList(event.target.value) })
            }}
            onBlur={(event) => {
              setExcludedStreetsFocused(false)
              patch({ excludedStreets: parseTextList(event.target.value) })
            }}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Radius (km)</span>
          <input
            type="number"
            min={0}
            max={120}
            step={0.1}
            value={value.radiusKm ?? ''}
            disabled={disabled || !value.enabled}
            onChange={(event) => patch({ radiusKm: parseNumber(event.target.value) })}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Mittelpunkt-PLZ</span>
          <input
            value={value.centerZipCode ?? ''}
            disabled={disabled || !value.enabled}
            onChange={(event) =>
              patch({ centerZipCode: event.target.value.replace(/[^\d]/g, '').slice(0, 5) || null })
            }
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Mittelpunkt Breite (lat)</span>
          <input
            type="number"
            step={0.000001}
            value={value.centerLatitude ?? ''}
            disabled={disabled || !value.enabled}
            onChange={(event) => patch({ centerLatitude: parseNumber(event.target.value) })}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Mittelpunkt Laenge (lng)</span>
          <input
            type="number"
            step={0.000001}
            value={value.centerLongitude ?? ''}
            disabled={disabled || !value.enabled}
            onChange={(event) => patch({ centerLongitude: parseNumber(event.target.value) })}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Mittelpunkt Ort</span>
          <input
            value={value.centerCity ?? ''}
            disabled={disabled || !value.enabled}
            onChange={(event) => patch({ centerCity: event.target.value.trim() || null })}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <label className="block sm:col-span-2">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Mittelpunkt Strasse</span>
          <input
            value={value.centerStreet ?? ''}
            disabled={disabled || !value.enabled}
            onChange={(event) => patch({ centerStreet: event.target.value.trim() || null })}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <div className="sm:col-span-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
          <p className="font-medium text-[var(--brand-ink)]">Google Maps Hilfe</p>
          <p className="mt-1 text-xs text-rose-900/75">
            Mit Regeltyp <span className="font-semibold">Google Maps Polygon</span> kannst du das Gebiet direkt zeichnen.
          </p>
          {googleMapsUrl ? (
            <a
              href={googleMapsUrl}
              target="_blank"
              rel="noreferrer"
              className="mt-2 inline-flex rounded-lg border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-semibold text-slate-800 transition hover:bg-rose-50"
            >
              Google Maps oeffnen
            </a>
          ) : (
            <p className="mt-2 text-xs text-rose-900/70">
              Fuer Kartenansicht bitte zuerst Mittelpunkt (PLZ/Ort/Strasse oder Lat/Lng) eintragen.
            </p>
          )}

          {googleMapsApiKey ? (
            <div className="mt-3">
              {mapsError ? (
                <p className="rounded-lg border border-red-200 bg-red-50 px-3 py-2 text-xs text-red-700">
                  {mapsError}
                </p>
              ) : (
                <>
                  <div
                    ref={mapContainerRef}
                    className={`h-72 w-full rounded-xl border border-[var(--brand-border)] ${
                      disabled || !value.enabled ? 'pointer-events-none opacity-70' : ''
                    }`}
                  />
                  <div className="mt-2 flex flex-wrap items-center gap-2 text-xs text-rose-900/75">
                    <span>Polygonpunkte: {polygonPath.length}</span>
                    {!mapsReady ? <span>Karte laedt...</span> : null}
                    <button
                      type="button"
                      disabled={disabled || !value.enabled || !mapsReady}
                      onClick={() => {
                        drawingManagerRef.current?.setDrawingMode(
                          window.google?.maps?.drawing?.OverlayType.POLYGON || null
                        )
                        patch({ strategy: 'POLYGON' })
                      }}
                      className="rounded-lg border border-[var(--brand-border)] bg-white px-2 py-1 font-semibold text-slate-800 transition hover:bg-rose-50 disabled:cursor-not-allowed disabled:opacity-60"
                    >
                      Polygon zeichnen
                    </button>
                    <button
                      type="button"
                      disabled={disabled || !value.enabled || polygonPath.length === 0}
                      onClick={() => patch({ polygonPath: [] })}
                      className="rounded-lg border border-red-300 bg-white px-2 py-1 font-semibold text-red-700 transition hover:bg-red-50 disabled:cursor-not-allowed disabled:opacity-60"
                    >
                      Polygon loeschen
                    </button>
                  </div>
                </>
              )}
            </div>
          ) : (
            <p className="mt-2 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
              Fuer Polygon-Zeichnung bitte `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY` setzen.
            </p>
          )}
        </div>

        <label className="block sm:col-span-2">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Interne Notiz</span>
          <textarea
            rows={2}
            value={value.notes ?? ''}
            disabled={disabled || !value.enabled}
            onChange={(event) => patch({ notes: event.target.value.trim() || null })}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>
      </div>
    </article>
  )
}

