'use client'

import { useEffect, useMemo, useState } from 'react'
import dynamic from 'next/dynamic'
import type {
  BusinessServiceArea,
  BusinessServiceAreaPolygonPoint,
  BusinessServiceAreaStrategy,
} from '@/lib/api'
import { hasMapsConsent as hasCookieMapsConsent } from '@/lib/cookie-consent'
const ServiceAreaPolygonMap = dynamic(() => import('./ServiceAreaPolygonMap'), { ssr: false })

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
  { value: 'POLYGON', label: 'OpenStreetMap Polygon' },
]

const DEFAULT_MAP_CENTER = { lat: 52.52, lng: 13.405 }

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
  if (!normalized) return null
  const parsed = Number(normalized)
  return Number.isFinite(parsed) ? parsed : null
}

function normalizePoint(point: BusinessServiceAreaPolygonPoint) {
  return { lat: Number(point.lat.toFixed(6)), lng: Number(point.lng.toFixed(6)) }
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

function getMapCenter(value: BusinessServiceArea, polygonPath: BusinessServiceAreaPolygonPoint[]) {
  if (typeof value.centerLatitude === 'number' && typeof value.centerLongitude === 'number') {
    return { lat: value.centerLatitude, lng: value.centerLongitude }
  }
  if (polygonPath[0]) {
    return polygonPath[0]
  }
  return DEFAULT_MAP_CENTER
}

function isPointInsidePolygon(
  point: BusinessServiceAreaPolygonPoint,
  polygonPath: BusinessServiceAreaPolygonPoint[]
) {
  if (polygonPath.length < 3) return false
  let inside = false
  for (let i = 0, j = polygonPath.length - 1; i < polygonPath.length; j = i++) {
    const pointA = polygonPath[i]
    const pointB = polygonPath[j]
    const intersects =
      pointA.lng > point.lng !== pointB.lng > point.lng &&
      point.lat < ((pointB.lat - pointA.lat) * (point.lng - pointA.lng)) / (pointB.lng - pointA.lng) + pointA.lat
    if (intersects) inside = !inside
  }
  return inside
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
  const [mapsConsentGranted, setMapsConsentGranted] = useState(false)
  const [mapMode, setMapMode] = useState<'polygon' | 'test'>('polygon')
  const [testLatitudeInput, setTestLatitudeInput] = useState('')
  const [testLongitudeInput, setTestLongitudeInput] = useState('')
  const [testPoint, setTestPoint] = useState<BusinessServiceAreaPolygonPoint | null>(null)
  const [testResult, setTestResult] = useState<null | { inside: boolean; message: string }>(null)

  const polygonPath = useMemo(() => normalizePolygonPath(value.polygonPath || []), [value.polygonPath])
  const polygonRenderKey = useMemo(
    () =>
      polygonPath.length > 0
        ? polygonPath.map((point) => `${point.lat}:${point.lng}`).join('|')
        : 'empty',
    [polygonPath]
  )
  const canEditMap = !disabled && value.enabled
  const center = getMapCenter(value, polygonPath)

  useEffect(() => {
    if (typeof window === 'undefined') return
    const refresh = () => setMapsConsentGranted(hasCookieMapsConsent())
    refresh()
    window.addEventListener('storage', refresh)
    return () => window.removeEventListener('storage', refresh)
  }, [])

  function patch(next: Partial<BusinessServiceArea>) {
    onChange({ ...value, ...next })
  }

  function patchStrategy(nextStrategy: BusinessServiceAreaStrategy) {
    console.log('SERVICE_AREA_EDITOR_STRATEGY_CHANGED', {
      previousStrategy: value.strategy,
      nextStrategy,
      zipCodesLength: value.zipCodes.length,
      polygonPathLength: polygonPath.length,
      radiusKm: value.radiusKm,
    })
    patch({ strategy: nextStrategy })
  }

  function patchZipCodes(rawValue: string) {
    const nextZipCodes = parseZipList(rawValue)
    console.log('SERVICE_AREA_EDITOR_ZIPCODES_CHANGED', {
      strategyBefore: value.strategy,
      zipCodesLength: nextZipCodes.length,
      polygonPathLength: polygonPath.length,
      radiusKm: value.radiusKm,
    })
    patch({
      zipCodes: nextZipCodes,
    })
  }

  useEffect(() => {
    if (!zipCodesFocused) setZipCodesInput(serializeList(value.zipCodes))
  }, [value.zipCodes, zipCodesFocused])

  useEffect(() => {
    if (!excludedZipCodesFocused) setExcludedZipCodesInput(serializeList(value.excludedZipCodes))
  }, [value.excludedZipCodes, excludedZipCodesFocused])

  useEffect(() => {
    if (!excludedStreetsFocused) setExcludedStreetsInput(serializeList(value.excludedStreets))
  }, [value.excludedStreets, excludedStreetsFocused])

  function addPolygonPoint(point: BusinessServiceAreaPolygonPoint) {
    const next = normalizePolygonPath([...polygonPath, point])
    patch({
      polygonPath: next,
    })
  }

  function movePolygonPoint(index: number, point: BusinessServiceAreaPolygonPoint) {
    const next = polygonPath.map((entry, pointIndex) => (pointIndex === index ? normalizePoint(point) : entry))
    patch({ polygonPath: normalizePolygonPath(next) })
  }

  function removePolygonPoint(index: number) {
    const next = polygonPath.filter((_, pointIndex) => pointIndex !== index)
    patch({ polygonPath: normalizePolygonPath(next) })
  }

  function parseCoordinateInput(value: string, min: number, max: number) {
    const normalized = value.replace(',', '.').trim()
    if (!normalized) return null
    const parsed = Number(normalized)
    if (!Number.isFinite(parsed) || parsed < min || parsed > max) return null
    return Number(parsed.toFixed(6))
  }

  function runPolygonTest() {
    if (polygonPath.length < 3) {
      setTestResult({
        inside: false,
        message: 'Polygon ist noch ungültig (mindestens 3 Punkte erforderlich).',
      })
      return
    }
    const lat = parseCoordinateInput(testLatitudeInput, -90, 90)
    const lng = parseCoordinateInput(testLongitudeInput, -180, 180)
    if (lat === null || lng === null) {
      setTestResult({
        inside: false,
        message: 'Bitte gültige Testkoordinaten eingeben.',
      })
      return
    }
    const point = { lat, lng }
    setTestPoint(point)
    const inside = isPointInsidePolygon(point, polygonPath)
    setTestResult({
      inside,
      message: inside
        ? 'Testpunkt liegt im Liefergebiet (innerhalb Polygon).'
        : 'Testpunkt liegt außerhalb des Liefergebiets.',
    })
  }

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
            onChange={(event) => patchStrategy(event.target.value as BusinessServiceAreaStrategy)}
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
              patchZipCodes(event.target.value)
            }}
            onBlur={(event) => {
              setZipCodesFocused(false)
              patchZipCodes(event.target.value)
            }}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <label className="block">
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Ausgeschlossene PLZ</span>
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
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Ausgeschlossene Straßen (Teiltext)</span>
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
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Mittelpunkt Länge (lng)</span>
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
          <span className="mb-1 block text-sm font-medium text-rose-900/85">Mittelpunkt Straße</span>
          <input
            value={value.centerStreet ?? ''}
            disabled={disabled || !value.enabled}
            onChange={(event) => patch({ centerStreet: event.target.value.trim() || null })}
            className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none disabled:bg-rose-50"
          />
        </label>

        <div className="sm:col-span-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-3 text-sm text-rose-900/85">
          <p className="font-medium text-[var(--brand-ink)]">OpenStreetMap Liefergebiet</p>
          <p className="mt-1 text-xs text-rose-900/75">
            Klicke in die Karte, um Polygonpunkte zu setzen. Punkte können danach verschoben oder entfernt werden.
          </p>
          {value.strategy === 'POLYGON' && polygonPath.length < 3 ? (
            <p className="mt-2 rounded-lg border border-amber-300 bg-amber-50 px-3 py-2 text-xs text-amber-900">
              Polygon benötigt mindestens 3 Punkte. Für schnelle Tests bitte PLZ-Liste verwenden.
            </p>
          ) : null}
          {!mapsConsentGranted ? (
            <p className="mt-2 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
              Standort/Maps ist im Consent noch nicht freigegeben.
            </p>
          ) : (
            <div className="mt-3">
              <div className={`h-[520px] w-full overflow-hidden rounded-xl border border-[var(--brand-border)] ${canEditMap ? '' : 'pointer-events-none opacity-75'}`}>
                <ServiceAreaPolygonMap
                  key={`service-area-map-${polygonRenderKey}`}
                  center={center}
                  polygonPath={polygonPath}
                  canEditMap={canEditMap}
                  disabled={disabled}
                  enabled={value.enabled}
                  mapMode={mapMode}
                  onAddPoint={addPolygonPoint}
                  onMovePoint={movePolygonPoint}
                  onRemovePoint={removePolygonPoint}
                  onSetTestPoint={(nextPoint) => {
                    setTestPoint(nextPoint)
                    setTestLatitudeInput(String(nextPoint.lat))
                    setTestLongitudeInput(String(nextPoint.lng))
                    const inside = isPointInsidePolygon(nextPoint, polygonPath)
                    setTestResult({
                      inside,
                      message: inside
                        ? 'Testpunkt liegt im Liefergebiet (innerhalb Polygon).'
                        : 'Testpunkt liegt außerhalb des Liefergebiets.',
                    })
                  }}
                  testPoint={testPoint}
                />
              </div>
              <p className="mt-2 text-xs font-semibold text-slate-700">
                Map polygon points: {polygonPath.length}
              </p>
              <div className="mt-2 flex flex-wrap items-center gap-2 text-xs text-rose-900/75">
                <span>Polygonpunkte: {polygonPath.length}</span>
                <button
                  type="button"
                  disabled={!canEditMap}
                  onClick={() => setMapMode('polygon')}
                  className={`rounded-lg border px-2 py-1 font-semibold transition disabled:cursor-not-allowed disabled:opacity-60 ${
                    mapMode === 'polygon'
                      ? 'border-slate-800 bg-slate-800 text-white'
                      : 'border-[var(--brand-border)] bg-white text-slate-800 hover:bg-rose-50'
                  }`}
                >
                  Polygon zeichnen
                </button>
                <button
                  type="button"
                  disabled={!canEditMap}
                  onClick={() => setMapMode('test')}
                  className={`rounded-lg border px-2 py-1 font-semibold transition disabled:cursor-not-allowed disabled:opacity-60 ${
                    mapMode === 'test'
                      ? 'border-teal-700 bg-teal-700 text-white'
                      : 'border-[var(--brand-border)] bg-white text-slate-800 hover:bg-rose-50'
                  }`}
                >
                  Testpunkt setzen
                </button>
                <button
                  type="button"
                  disabled={!canEditMap}
                  onClick={() => patchStrategy('POLYGON')}
                  className="rounded-lg border border-[var(--brand-border)] bg-white px-2 py-1 font-semibold text-slate-800 transition hover:bg-rose-50 disabled:cursor-not-allowed disabled:opacity-60"
                >
                  Polygon-Modus aktivieren
                </button>
                <button
                  type="button"
                  disabled={!canEditMap || polygonPath.length === 0}
                  onClick={() => patch({ polygonPath: [] })}
                  className="rounded-lg border border-red-300 bg-white px-2 py-1 font-semibold text-red-700 transition hover:bg-red-50 disabled:cursor-not-allowed disabled:opacity-60"
                >
                  Polygon löschen
                </button>
              </div>
              <div className="mt-3 rounded-lg border border-[var(--brand-border)] bg-white p-3">
                <p className="text-xs font-semibold text-rose-900/80">Liefergebiet testen (Debug)</p>
                <div className="mt-2 grid gap-2 sm:grid-cols-3">
                  <input
                    value={testLatitudeInput}
                    onChange={(event) => setTestLatitudeInput(event.target.value)}
                    placeholder="Latitude z.B. 51.995"
                    className="rounded-lg border border-[var(--brand-border)] px-2 py-1.5 text-xs outline-none"
                  />
                  <input
                    value={testLongitudeInput}
                    onChange={(event) => setTestLongitudeInput(event.target.value)}
                    placeholder="Longitude z.B. 7.625"
                    className="rounded-lg border border-[var(--brand-border)] px-2 py-1.5 text-xs outline-none"
                  />
                  <button
                    type="button"
                    disabled={!value.enabled}
                    onClick={runPolygonTest}
                    className="rounded-lg border border-slate-800 bg-slate-800 px-2 py-1.5 text-xs font-semibold text-white transition hover:bg-slate-700 disabled:cursor-not-allowed disabled:opacity-60"
                  >
                    Polygon speichern/testen
                  </button>
                </div>
                {testResult ? (
                  <p
                    className={`mt-2 rounded-md px-2 py-1 text-xs ${
                      testResult.inside
                        ? 'border border-green-300 bg-green-50 text-green-800'
                        : 'border border-amber-300 bg-amber-50 text-amber-900'
                    }`}
                  >
                    {testResult.message}
                  </p>
                ) : null}
              </div>
              <p className="mt-1 text-xs text-rose-900/70">
                Tipp: Doppelklick auf einen Punkt entfernt ihn.
              </p>
            </div>
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
