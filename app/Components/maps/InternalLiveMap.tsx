'use client'

import { useEffect } from 'react'
import { divIcon, LatLngBounds, type LatLngExpression } from 'leaflet'
import { MapContainer, Marker, Polyline, TileLayer, useMap } from 'react-leaflet'

type MapMarkerKind = 'driver' | 'customer' | 'restaurant'

export type InternalMapMarker = {
  id: string
  kind: MapMarkerKind
  label: string
  latitude: number
  longitude: number
  color?: string
}

type Props = {
  markers: InternalMapMarker[]
  className?: string
  showConnectionLine?: boolean
  zoom?: number
  onMarkerClick?: (marker: InternalMapMarker) => void
}

function createMarkerIcon(kind: MapMarkerKind, customColor?: string) {
  const color =
    customColor || (kind === 'driver' ? '#06b6d4' : kind === 'customer' ? '#f97316' : '#22c55e')
  const glyph = kind === 'driver' ? 'F' : kind === 'customer' ? 'K' : 'R'

  return divIcon({
    className: '',
    html: `<div style="display:flex;align-items:center;justify-content:center;width:28px;height:28px;border-radius:999px;border:2px solid #f8fafc;background:${color};box-shadow:0 4px 12px rgba(15,23,42,.28);font-size:11px;font-weight:700;color:#f8fafc;">${glyph}</div>`,
    iconSize: [28, 28],
    iconAnchor: [14, 14],
  })
}

function FitToMarkers({ markers }: { markers: InternalMapMarker[] }) {
  const map = useMap()

  useEffect(() => {
    if (markers.length === 0) {
      return
    }
    if (markers.length === 1) {
      map.setView([markers[0].latitude, markers[0].longitude], 14)
      return
    }
    const bounds = new LatLngBounds(
      markers.map((marker) => [marker.latitude, marker.longitude] as [number, number])
    )
    map.fitBounds(bounds, { padding: [28, 28] })
  }, [map, markers])

  return null
}

export function InternalLiveMap({
  markers,
  className,
  showConnectionLine = true,
  zoom = 13,
  onMarkerClick,
}: Props) {
  const safeMarkers = markers.filter(
    (marker) => Number.isFinite(marker.latitude) && Number.isFinite(marker.longitude)
  )

  const center: LatLngExpression = safeMarkers.length
    ? [safeMarkers[0].latitude, safeMarkers[0].longitude]
    : [50.9375, 6.9603]

  const driver = safeMarkers.find((entry) => entry.kind === 'driver')
  const customer = safeMarkers.find((entry) => entry.kind === 'customer')
  const showLine = Boolean(showConnectionLine && driver && customer)
  const linePositions: [number, number][] = showLine
    ? [
        [driver!.latitude, driver!.longitude],
        [customer!.latitude, customer!.longitude],
      ]
    : []

  return (
    <MapContainer
      center={center}
      zoom={zoom}
      scrollWheelZoom={false}
      className={className || 'h-full w-full'}
      attributionControl={false}
    >
      <TileLayer
        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
      />
      {showLine ? (
        <Polyline
          positions={linePositions}
          pathOptions={{ color: '#06b6d4', weight: 4, opacity: 0.8 }}
        />
      ) : null}
      {safeMarkers.map((marker) => (
        <Marker
          key={marker.id}
          position={[marker.latitude, marker.longitude]}
          icon={createMarkerIcon(marker.kind, marker.color)}
          title={marker.label}
          eventHandlers={
            onMarkerClick
              ? {
                  click: () => onMarkerClick(marker),
                }
              : undefined
          }
        />
      ))}
      <FitToMarkers markers={safeMarkers} />
    </MapContainer>
  )
}
