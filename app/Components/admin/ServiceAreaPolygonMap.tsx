'use client'

import { useEffect } from 'react'
import { MapContainer, Marker, Polygon, TileLayer, useMap, useMapEvents } from 'react-leaflet'
import { divIcon, LatLngBounds, type LatLng } from 'leaflet'
import type { BusinessServiceAreaPolygonPoint } from '@/lib/api'

type Props = {
  center: { lat: number; lng: number }
  polygonPath: BusinessServiceAreaPolygonPoint[]
  canEditMap: boolean
  disabled: boolean
  enabled: boolean
  onAddPoint: (point: BusinessServiceAreaPolygonPoint) => void
  onMovePoint: (index: number, point: BusinessServiceAreaPolygonPoint) => void
  onRemovePoint: (index: number) => void
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
    fitMap(map, points)
  }, [map, points])
  return null
}

function MapClickCapture({
  disabled,
  enabled,
  onAddPoint,
}: {
  disabled: boolean
  enabled: boolean
  onAddPoint: (point: BusinessServiceAreaPolygonPoint) => void
}) {
  useMapEvents({
    click(event) {
      if (disabled || !enabled) return
      onAddPoint({
        lat: Number(event.latlng.lat.toFixed(6)),
        lng: Number(event.latlng.lng.toFixed(6)),
      })
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
  onAddPoint,
  onMovePoint,
  onRemovePoint,
}: Props) {
  return (
    <MapContainer center={[center.lat, center.lng]} zoom={12} className="h-full w-full" scrollWheelZoom>
      <TileLayer
        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
      />
      <MapAutoFit points={polygonPath} />
      <MapClickCapture disabled={disabled} enabled={enabled} onAddPoint={onAddPoint} />
      {polygonPath.length >= 3 ? (
        <Polygon
          positions={polygonPath.map((point) => [point.lat, point.lng] as [number, number])}
          pathOptions={{ color: '#ea580c', fillColor: '#fb923c', fillOpacity: 0.2, weight: 2 }}
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
  )
}

