'use client'

import { useEffect, useMemo } from 'react'
import { MapContainer, Marker, Polygon, TileLayer, useMap, useMapEvents } from 'react-leaflet'
import { divIcon, LatLngBounds, type LatLng } from 'leaflet'
import type { BusinessServiceAreaPolygonPoint } from '@/lib/api'

type Props = {
  center: { lat: number; lng: number }
  polygonPath: BusinessServiceAreaPolygonPoint[]
  canEditMap: boolean
  disabled: boolean
  enabled: boolean
  mapMode?: 'polygon' | 'test'
  onAddPoint: (point: BusinessServiceAreaPolygonPoint) => void
  onMovePoint: (index: number, point: BusinessServiceAreaPolygonPoint) => void
  onRemovePoint: (index: number) => void
  onSetTestPoint?: (point: BusinessServiceAreaPolygonPoint) => void
  testPoint?: BusinessServiceAreaPolygonPoint | null
}

function fitMap(map: ReturnType<typeof useMap>, points: BusinessServiceAreaPolygonPoint[]) {
  if (points.length === 0) return
  if (points.length === 1) {
    map.setView([points[0].lat, points[0].lng], 13)
    return
  }
  const bounds = new LatLngBounds(points.map((point) => [point.lat, point.lng] as [number, number]))
  map.fitBounds(bounds, { padding: [28, 28] })
}

function MapAutoFit({ points }: { points: BusinessServiceAreaPolygonPoint[] }) {
  const map = useMap()
  useEffect(() => {
    map.invalidateSize()
    fitMap(map, points)
  }, [map, points])
  return null
}

function MapClickCapture({
  disabled,
  enabled,
  mapMode = 'polygon',
  onAddPoint,
  onSetTestPoint,
}: {
  disabled: boolean
  enabled: boolean
  mapMode?: 'polygon' | 'test'
  onAddPoint: (point: BusinessServiceAreaPolygonPoint) => void
  onSetTestPoint?: (point: BusinessServiceAreaPolygonPoint) => void
}) {
  useMapEvents({
    click(event) {
      if (disabled || !enabled) return
      const point = {
        lat: Number(event.latlng.lat.toFixed(6)),
        lng: Number(event.latlng.lng.toFixed(6)),
      }
      if (mapMode === 'test') {
        onSetTestPoint?.(point)
        return
      }
      onAddPoint(point)
    },
  })
  return null
}

function pinIcon(label: string) {
  return divIcon({
    className: '',
    html: `<div style="display:flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:999px;background:#ea580c;color:#fff;border:2px solid #fff;box-shadow:0 2px 8px rgba(0,0,0,.2);font-size:10px;font-weight:700;">${label}</div>`,
    iconSize: [22, 22],
    iconAnchor: [11, 11],
  })
}

export default function ServiceAreaPolygonMap({
  center,
  polygonPath,
  canEditMap,
  disabled,
  enabled,
  mapMode = 'polygon',
  onAddPoint,
  onMovePoint,
  onRemovePoint,
  onSetTestPoint,
  testPoint = null,
}: Props) {
  const polygonPositions = useMemo(
    () =>
      polygonPath
        .map((point) => [Number(point.lat), Number(point.lng)] as [number, number])
        .filter(([lat, lng]) => Number.isFinite(lat) && Number.isFinite(lng)),
    [polygonPath]
  )
  const polygonRenderKey = useMemo(
    () =>
      polygonPositions.length > 0
        ? polygonPositions.map(([lat, lng]) => `${lat}:${lng}`).join('|')
        : 'empty',
    [polygonPositions]
  )

  useEffect(() => {
    console.log('MAP_POLYGON_POINTS_RENDER', polygonPositions.length, polygonPositions)
  }, [polygonPositions])

  return (
    <div className="relative h-full w-full">
      <MapContainer center={[center.lat, center.lng]} zoom={12} className="h-full w-full" scrollWheelZoom>
        <TileLayer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        />
        <MapAutoFit points={polygonPath} />
        <MapClickCapture
          disabled={disabled}
          enabled={enabled}
          mapMode={mapMode}
          onAddPoint={onAddPoint}
          onSetTestPoint={onSetTestPoint}
        />
        {polygonPositions.length >= 3 ? (
          <Polygon
            key={`polygon-${polygonRenderKey}`}
            positions={polygonPositions}
            pathOptions={{ color: '#ea580c', fillColor: '#fb923c', fillOpacity: 0.28, weight: 3 }}
          />
        ) : null}
        {testPoint ? (
          <Marker
            position={[testPoint.lat, testPoint.lng]}
            icon={divIcon({
              className: '',
              html: '<div style="display:flex;align-items:center;justify-content:center;width:24px;height:24px;border-radius:999px;background:#0f766e;color:#fff;border:2px solid #fff;box-shadow:0 2px 8px rgba(0,0,0,.25);font-size:11px;font-weight:700;">T</div>',
              iconSize: [24, 24],
              iconAnchor: [12, 12],
            })}
          />
        ) : null}
        {polygonPath.map((point, index) => (
          <Marker
            key={`polygon-point-${index}`}
            position={[point.lat, point.lng]}
            icon={pinIcon(String(index + 1))}
            draggable={canEditMap}
            eventHandlers={{
              dragend: (event) => {
                const latLng = (event.target as { getLatLng: () => LatLng }).getLatLng()
                onMovePoint(index, { lat: latLng.lat, lng: latLng.lng })
              },
              dblclick: () => {
                if (canEditMap) onRemovePoint(index)
              },
            }}
          />
        ))}
      </MapContainer>
      <div className="pointer-events-none absolute left-2 top-2 z-[1200] rounded-md bg-slate-900/80 px-2 py-1 text-[11px] font-semibold text-white">
        Map polygon points: {polygonPositions.length}
      </div>
    </div>
  )
}
