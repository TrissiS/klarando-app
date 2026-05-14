'use client'

import { useEffect, useMemo, useRef, useState } from 'react'
import { InternalLiveMap, type InternalMapMarker } from '@/app/Components/maps/InternalLiveMap'
import {
  acceptPublicOrderDisplayOrder,
  createPublicDriverDeviceSession,
  dispatchPublicOrderDisplayOrder,
  getPublicOrderDisplayFeed,
  revokePublicDriverDeviceSession,
  updatePublicOrderDisplayItemStatus,
  updatePublicOrderDisplayOrderStatus,
  updatePublicOrderDisplayPaymentStatus,
  type DriverDeviceSessionCreateResponse,
  type Order,
  type PublicOrderDisplayFeed,
} from '@/lib/api'
import {
  fetchDisplayRuntimeConfig,
  readCachedDisplayRuntimeConfig,
  type DisplayRuntimeConfig,
  type DisplayRuntimeConnectionState,
} from '@/lib/display-runtime'
import { DisplayConnectionStatus } from '@/app/Components/display/DisplayConnectionStatus'
import { DisplayRuntimeShell } from '@/app/Components/display/DisplayRuntimeShell'
import {
  ageAlertStyle,
  displayRoleLabel,
  formatClock,
  formatDateTime,
  formatElapsed,
  formatPickupNumber,
  getSortedDisplayOrders,
  hexToRgba,
  orderStatusLabel,
  paymentStatusLabel,
  paymentStatusStyle,
  sanitizeHexColor,
  statusAnimationStyle,
  statusColorFor,
} from './display-helpers'
import { StatCard } from './stat-card'

type Props = {
  params: Promise<{
    displayCode: string
  }>
}

const DISPLAY_META_PREFIX = '@@klarando-display-meta:'
const OSM_GEOCODING_ENDPOINT = 'https://nominatim.openstreetmap.org/search'

type DeliveryTargetCoordinates = {
  latitude: number
  longitude: number
}

function resolveAutoScaleFactor(width: number, height: number) {
  const widthScale = width / 1680
  const heightScale = height / 960
  return Math.min(1.2, Math.max(0.7, Math.min(widthScale, heightScale)))
}

function requiresPopupAcceptance(order: Order) {
  return (
    order.sourceChannel === 'APP' ||
    order.sourceChannel === 'DELIVERY' ||
    order.sourceChannel === 'TERMINAL'
  )
}

function resolveCustomerHint(order: Order) {
  const name = order.customerName || order.appCustomerAccount?.fullName || 'Unbekannt'
  const service = order.serviceType === 'DELIVERY' ? 'Lieferung' : 'Abholung'
  const location =
    order.serviceType === 'DELIVERY'
      ? [order.customerAddress, order.customerZipCode, order.customerCity]
          .filter(Boolean)
          .join(', ') || 'Lieferadresse fehlt'
      : 'Abholung im Lokal'
  return { name, service, location }
}

function resolveShowDeliveryMapCard(notes: string | null | undefined) {
  if (!notes) {
    return true
  }

  const firstLine = notes.split('\n')[0]?.trim() || ''
  if (!firstLine.startsWith(DISPLAY_META_PREFIX)) {
    return true
  }

  const encoded = firstLine.slice(DISPLAY_META_PREFIX.length).trim()
  try {
    const parsed = JSON.parse(encoded) as { showDeliveryMapCard?: boolean }
    return parsed.showDeliveryMapCard !== false
  } catch {
    return true
  }
}

function resolveDeliveryMapQuery(order: Order) {
  if (order.serviceType !== 'DELIVERY') {
    return null
  }

  const parts = [order.customerAddress, order.customerZipCode, order.customerCity].filter(Boolean)
  if (parts.length === 0) {
    return null
  }

  return parts.join(', ')
}

function resolveValidDriverCoordinates(order: Order): DeliveryTargetCoordinates | null {
  if (!order.driverLocation) {
    return null
  }
  const latitude = Number(order.driverLocation.latitude)
  const longitude = Number(order.driverLocation.longitude)
  if (!Number.isFinite(latitude) || !Number.isFinite(longitude)) {
    return null
  }
  return { latitude, longitude }
}

function resolveOrderMapMarkers(
  order: Order,
  destinationCoordinates: DeliveryTargetCoordinates | null
): InternalMapMarker[] {
  const markers: InternalMapMarker[] = []
  const driverCoordinates = resolveValidDriverCoordinates(order)

  if (driverCoordinates) {
    markers.push({
      id: `${order.id}-driver`,
      kind: 'driver',
      label: 'Fahrer',
      latitude: driverCoordinates.latitude,
      longitude: driverCoordinates.longitude,
    })
  }

  if (destinationCoordinates) {
    markers.push({
      id: `${order.id}-customer`,
      kind: 'customer',
      label: 'Kunde',
      latitude: destinationCoordinates.latitude,
      longitude: destinationCoordinates.longitude,
    })
  }

  return markers
}

function resolveOrderComplaintEntries(order: Order) {
  const complaints = Array.isArray(order.complaints) ? order.complaints : []
  const unresolved = complaints.filter((entry) => !entry.isResolved)
  return unresolved.length > 0 ? unresolved : complaints
}

function resolveOpenStreetMapLink(coordinates: DeliveryTargetCoordinates | null) {
  if (!coordinates) {
    return null
  }
  return `https://www.openstreetmap.org/?mlat=${coordinates.latitude}&mlon=${coordinates.longitude}#map=16/${coordinates.latitude}/${coordinates.longitude}`
}

function playAlertBeep() {
  if (typeof window === 'undefined') {
    return
  }

  const context = new window.AudioContext()
  const oscillator = context.createOscillator()
  const gain = context.createGain()
  oscillator.type = 'square'
  oscillator.frequency.value = 880
  gain.gain.value = 0.06
  oscillator.connect(gain)
  gain.connect(context.destination)
  oscillator.start()
  oscillator.stop(context.currentTime + 0.16)
  oscillator.onended = () => {
    void context.close()
  }
}

function formatCountdownFromSeconds(totalSeconds: number) {
  const safe = Math.max(0, Math.floor(totalSeconds))
  const hours = Math.floor(safe / 3600)
  const minutes = Math.floor((safe % 3600) / 60)
  const seconds = safe % 60

  if (hours > 0) {
    return `${hours.toString().padStart(2, '0')}:${minutes
      .toString()
      .padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
  }

  return `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
}

function resolvePopupPositionLines(order: Order) {
  return order.items.map((item) => {
    const modifiers =
      item.modifierSnapshot && item.modifierSnapshot.length > 0
        ? ` | Optionen: ${item.modifierSnapshot.map((entry) => entry.name).join(', ')}`
        : ''
    return `${item.quantity}x ${item.product.name}${modifiers}`
  })
}

function resolveTimeBadge(order: Order, nowMs: number) {
  if (order.estimatedReadyAt) {
    const remainingSeconds = Math.ceil(
      (new Date(order.estimatedReadyAt).getTime() - nowMs) / 1000
    )
    if (remainingSeconds >= 0) {
      return {
        label: `Restlaufzeit ${formatCountdownFromSeconds(remainingSeconds)}`,
        isAlert: remainingSeconds <= 5 * 60,
      }
    }

    return {
      label: `Ueberfaellig ${formatCountdownFromSeconds(Math.abs(remainingSeconds))}`,
      isAlert: true,
    }
  }

  return {
    label: `Laufzeit ${formatElapsed(order.createdAt, nowMs)}`,
    isAlert: false,
  }
}

function resolveAcceptedRuntimeLabel(order: Order, nowMs: number) {
  if (!order.acceptedAt) {
    return null
  }

  return formatElapsed(order.acceptedAt, nowMs)
}

function resolveDeliveryRuntimeLabel(order: Order, nowMs: number) {
  if (!order.driverDepartedAt) {
    return null
  }
  return formatElapsed(order.driverDepartedAt, nowMs)
}


export default function OrderDisplayPage({ params }: Props) {
  const [displayCode, setDisplayCode] = useState('')
  const [feed, setFeed] = useState<PublicOrderDisplayFeed | null>(null)
  const [loading, setLoading] = useState(true)
  const [savingOrderId, setSavingOrderId] = useState<string | null>(null)
  const [error, setError] = useState('')
  const [nowMs, setNowMs] = useState(Date.now())
  const [highlightedOrderIds, setHighlightedOrderIds] = useState<Record<string, number>>({})
  const [layoutScale, setLayoutScale] = useState(1)
  const [viewportHeight, setViewportHeight] = useState<number | null>(null)
  const [alertOrderQueue, setAlertOrderQueue] = useState<Order[]>([])
  const [activeAlertOrder, setActiveAlertOrder] = useState<Order | null>(null)
  const [selectedEtaMinutes, setSelectedEtaMinutes] = useState(45)
  const [acceptingOrderId, setAcceptingOrderId] = useState<string | null>(null)
  const [dispatchingOrderId, setDispatchingOrderId] = useState<string | null>(null)
  const [driverAssignOrder, setDriverAssignOrder] = useState<Order | null>(null)
  const [driverAssignUserId, setDriverAssignUserId] = useState('')
  const [driverAssignDeviceLabel, setDriverAssignDeviceLabel] = useState('')
  const [driverAssignEtaMinutes, setDriverAssignEtaMinutes] = useState('45')
  const [driverDeviceLabel, setDriverDeviceLabel] = useState('')
  const [driverDeviceHours, setDriverDeviceHours] = useState('12')
  const [driverDeviceSession, setDriverDeviceSession] = useState<DriverDeviceSessionCreateResponse | null>(
    null
  )
  const [creatingDriverDeviceQr, setCreatingDriverDeviceQr] = useState(false)
  const [revokingDriverDeviceSessionId, setRevokingDriverDeviceSessionId] = useState<string | null>(null)
  const [showDriverQuickConnect, setShowDriverQuickConnect] = useState(false)
  const [blinkAlert, setBlinkAlert] = useState(false)
  const [deliveryMapExpanded, setDeliveryMapExpanded] = useState(false)
  const [activeComplaintOrderId, setActiveComplaintOrderId] = useState<string | null>(null)
  const [activeRouteMapOrderId, setActiveRouteMapOrderId] = useState<string | null>(null)
  const [showAllRouteMaps, setShowAllRouteMaps] = useState(false)
  const [deliveryTargetCoordinatesByOrderId, setDeliveryTargetCoordinatesByOrderId] = useState<
    Record<string, DeliveryTargetCoordinates>
  >({})
  const [deliveryTargetStatusByOrderId, setDeliveryTargetStatusByOrderId] = useState<
    Record<string, 'pending' | 'resolved' | 'failed' | 'missing_address'>
  >({})
  const [runtimeConfig, setRuntimeConfig] = useState<DisplayRuntimeConfig | null>(null)
  const [connectionState, setConnectionState] = useState<DisplayRuntimeConnectionState>('online')
  const isLowPerformanceMode = runtimeConfig?.performanceMode === 'LOW'
  const previousOrderStatusRef = useRef<Map<string, string>>(new Map())
  const previousSeenOrderIdsRef = useRef<Set<string>>(new Set())
  const dismissedAlertUntilRef = useRef<Map<string, number>>(new Map())

  useEffect(() => {
    const handle = window.setInterval(() => {
      setNowMs(Date.now())
    }, 1000)
    return () => window.clearInterval(handle)
  }, [])

  useEffect(() => {
    params.then((resolved) => {
      setDisplayCode(resolved.displayCode.toUpperCase())
    })
  }, [params])

  useEffect(() => {
    if (!displayCode) {
      return
    }

    let isMounted = true
    let timer: ReturnType<typeof setTimeout> | null = null

    const loadRuntime = async () => {
      try {
        setConnectionState((current) => (current === 'offline_cached' ? 'reconnecting' : current))
        const config = await fetchDisplayRuntimeConfig(displayCode)
        if (!isMounted) {
          return
        }
        setRuntimeConfig(config)
        setConnectionState('online')
        const retryMs = document.hidden
          ? Math.max(25000, config.refreshIntervalMs * 2)
          : Math.max(isLowPerformanceMode ? 12000 : 8000, config.refreshIntervalMs)
        timer = setTimeout(() => {
          void loadRuntime()
        }, retryMs)
      } catch {
        if (!isMounted) {
          return
        }
        const cachedConfig = readCachedDisplayRuntimeConfig(displayCode)
        if (cachedConfig) {
          setRuntimeConfig(cachedConfig)
          setConnectionState('offline_cached')
        } else {
          setConnectionState('reconnecting')
        }
        timer = setTimeout(() => {
          void loadRuntime()
        }, document.hidden ? 25000 : isLowPerformanceMode ? 14000 : 10000)
      }
    }

    void loadRuntime()

    return () => {
      isMounted = false
      if (timer) {
        clearTimeout(timer)
      }
    }
  }, [displayCode, isLowPerformanceMode])

  async function loadFeed() {
    if (!displayCode) {
      return
    }

    try {
      setLoading(true)
      setError('')
      const data = await getPublicOrderDisplayFeed(displayCode)
      const now = Date.now()
      const nextStatusMap = new Map<string, string>()
      const changed: Record<string, number> = {}
      const nextSeenIds = new Set<string>()
      for (const order of data.orders) {
        nextSeenIds.add(order.id)
        nextStatusMap.set(order.id, order.status)
        const previousStatus = previousOrderStatusRef.current.get(order.id)
        if (previousStatus && previousStatus !== order.status) {
          changed[order.id] = now + Math.max(1200, data.display.statusAnimationDurationMs)
        }
      }
      previousSeenOrderIdsRef.current = nextSeenIds
      previousOrderStatusRef.current = nextStatusMap
      if (Object.keys(changed).length > 0) {
        setHighlightedOrderIds((current) => ({
          ...current,
          ...changed,
        }))
      }
      setFeed(data)
    } catch (loadError) {
      setError(
        loadError instanceof Error
          ? loadError.message
          : 'Bestell-Display Daten konnten nicht geladen werden'
      )
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadFeed()
  }, [displayCode])

  useEffect(() => {
    if (!feed?.orders) {
      return
    }

    const deliveryOrders = feed.orders.filter((order) => order.serviceType === 'DELIVERY')
    if (deliveryOrders.length === 0) {
      return
    }

    let cancelled = false

    const geocodeMissingTargets = async () => {
      for (const order of deliveryOrders) {
        if (cancelled) {
          return
        }
        if (deliveryTargetCoordinatesByOrderId[order.id]) {
          continue
        }
        if (deliveryTargetStatusByOrderId[order.id] === 'pending' || deliveryTargetStatusByOrderId[order.id] === 'resolved') {
          continue
        }

        const destinationAddress = resolveDeliveryMapQuery(order)
        if (!destinationAddress) {
          setDeliveryTargetStatusByOrderId((current) => ({
            ...current,
            [order.id]: 'missing_address',
          }))
          continue
        }

        setDeliveryTargetStatusByOrderId((current) => ({
          ...current,
          [order.id]: 'pending',
        }))

        try {
          const query = new URLSearchParams({
            q: destinationAddress,
            format: 'jsonv2',
            limit: '1',
          })
          const response = await fetch(`${OSM_GEOCODING_ENDPOINT}?${query.toString()}`)
          if (!response.ok) {
            throw new Error(`Geocoding HTTP ${response.status}`)
          }
          const payload = (await response.json()) as Array<{
            lat?: string | number
            lon?: string | number
          }>
          const location = payload?.[0]
          const latitude = Number(location?.lat)
          const longitude = Number(location?.lon)
          if (!Number.isFinite(latitude) || !Number.isFinite(longitude)) {
            throw new Error('Geocoding ohne gültige Koordinaten')
          }
          if (cancelled) {
            return
          }
          setDeliveryTargetCoordinatesByOrderId((current) => ({
            ...current,
            [order.id]: {
              latitude,
              longitude,
            },
          }))
          setDeliveryTargetStatusByOrderId((current) => ({
            ...current,
            [order.id]: 'resolved',
          }))
        } catch {
          if (cancelled) {
            return
          }
          setDeliveryTargetStatusByOrderId((current) => ({
            ...current,
            [order.id]: 'failed',
          }))
        }
      }
    }

    void geocodeMissingTargets()

    return () => {
      cancelled = true
    }
  }, [feed?.orders, deliveryTargetCoordinatesByOrderId, deliveryTargetStatusByOrderId])

  useEffect(() => {
    if (!feed?.display.refreshIntervalSec || !displayCode) {
      return
    }

    const baseIntervalMs = Math.max(feed.display.refreshIntervalSec, isLowPerformanceMode ? 6 : 4) * 1000
    const intervalMs = document.hidden
      ? Math.max(20000, baseIntervalMs * 2)
      : baseIntervalMs
    const handle = window.setInterval(() => {
      void loadFeed()
    }, intervalMs)

    return () => window.clearInterval(handle)
  }, [displayCode, feed?.display.refreshIntervalSec, isLowPerformanceMode])

  useEffect(() => {
    const timer = window.setInterval(() => {
      const now = Date.now()
      setHighlightedOrderIds((current) => {
        const nextEntries = Object.entries(current).filter(([, until]) => until > now)
        if (nextEntries.length === Object.keys(current).length) {
          return current
        }
        return Object.fromEntries(nextEntries)
      })
    }, 500)
    return () => window.clearInterval(timer)
  }, [])

  useEffect(() => {
    if (activeAlertOrder || alertOrderQueue.length === 0) {
      return
    }
    setSelectedEtaMinutes(45)
    setActiveAlertOrder(alertOrderQueue[0])
    setAlertOrderQueue((current) => current.slice(1))
  }, [activeAlertOrder, alertOrderQueue])

  useEffect(() => {
    if (!feed || feed.display.displayRole !== 'CASH') {
      return
    }

    const now = Date.now()
    for (const [orderId, until] of dismissedAlertUntilRef.current.entries()) {
      if (until <= now) {
        dismissedAlertUntilRef.current.delete(orderId)
      }
    }

    const candidates = feed.orders.filter(
      (order) =>
        requiresPopupAcceptance(order) &&
        !order.acceptedAt &&
        order.status !== 'archived' &&
        order.status !== 'done' &&
        !dismissedAlertUntilRef.current.has(order.id)
    )
    if (candidates.length === 0) {
      return
    }

    setAlertOrderQueue((current) => {
      const knownIds = new Set(current.map((entry) => entry.id))
      if (activeAlertOrder) {
        knownIds.add(activeAlertOrder.id)
      }

      const next = [...current]
      for (const order of candidates) {
        if (!knownIds.has(order.id)) {
          next.push(order)
          knownIds.add(order.id)
        }
      }
      return next
    })
  }, [feed, activeAlertOrder])

  useEffect(() => {
    if (!activeAlertOrder || feed?.display.displayRole !== 'CASH') {
      setBlinkAlert(false)
      return
    }

    let count = 0
    setBlinkAlert(true)
    playAlertBeep()
    const handle = window.setInterval(() => {
      count += 1
      setBlinkAlert((current) => !current)
      if (count <= 7) {
        playAlertBeep()
      }
    }, 1400)

    return () => {
      window.clearInterval(handle)
      setBlinkAlert(false)
    }
  }, [activeAlertOrder, feed?.display.displayRole])

  useEffect(() => {
    setDeliveryMapExpanded(false)
  }, [activeAlertOrder?.id])

  const autoScaleEnabled = feed?.display.autoScaleLayout ?? true
  useEffect(() => {
    if (!autoScaleEnabled) {
      setLayoutScale(1)
      setViewportHeight(null)
      return
    }

    const applyScale = () => {
      setLayoutScale(resolveAutoScaleFactor(window.innerWidth, window.innerHeight))
      setViewportHeight(window.innerHeight)
    }

    applyScale()
    window.addEventListener('resize', applyScale)
    return () => window.removeEventListener('resize', applyScale)
  }, [autoScaleEnabled])

  async function setOrderStatus(
    orderId: string,
    status: 'pending_payment' | 'open' | 'preparing' | 'out_for_delivery' | 'done' | 'archived'
  ) {
    if (!feed) {
      return
    }
    const order = feed.orders.find((entry) => entry.id === orderId)

    if (status === 'archived' && order?.paymentStatus !== 'PAID') {
      setError('Unbezahlte Bestellungen koennen nicht archiviert werden.')
      return
    }

    try {
      setSavingOrderId(orderId)
      setError('')
      await updatePublicOrderDisplayOrderStatus(feed.display.displayCode, orderId, status)
      await loadFeed()
    } catch (statusError) {
      setError(
        statusError instanceof Error
          ? statusError.message
          : 'Status konnte nicht aktualisiert werden'
      )
    } finally {
      setSavingOrderId(null)
    }
  }

  useEffect(() => {
    if (!driverAssignOrder) {
      return
    }

    setDriverAssignUserId((current) => {
      if (current) {
        return current
      }
      if (driverAssignOrder.assignedDriverId) {
        return driverAssignOrder.assignedDriverId
      }
      return feed?.drivers[0]?.id || ''
    })
    setDriverAssignDeviceLabel((current) => {
      if (current) {
        return current
      }
      return driverAssignOrder.assignedDriverName || ''
    })
    setDriverAssignEtaMinutes(String(driverAssignOrder.estimatedMinutes ?? 45))
  }, [driverAssignOrder, feed?.drivers])

  function openDriverAssignModal(order: Order) {
    if (!feed) {
      return
    }

    if (order.serviceType !== 'DELIVERY') {
      setError('Fahrerzuweisung ist nur fuer Lieferbestellungen verfuegbar')
      return
    }

    if (feed.drivers.length === 0) {
      const deviceCount = feed.activeDriverDevices.filter((entry) => entry.isActive).length
      if (deviceCount === 0) {
        setError(
          'Keine aktiven Fahrer oder Fahrergeraete vorhanden. Bitte zuerst DRIVER-Benutzer oder QR-Geraet verbinden.'
        )
        return
      }
    }

    setError('')
    setDriverAssignOrder(order)
    setDriverAssignUserId(order.assignedDriverId || feed.drivers[0]?.id || '')
    setDriverAssignDeviceLabel(order.assignedDriverName || '')
    setDriverAssignEtaMinutes(String(order.estimatedMinutes ?? 45))
  }

  async function dispatchOrderToDriver(
    order: Order,
    params: {
      driverUserId?: string | null
      driverName?: string | null
      estimatedMinutes: number | null
    }
  ) {
    if (!feed) {
      return
    }

    if (order.serviceType !== 'DELIVERY') {
      setError('Fahrerzuweisung ist nur fuer Lieferbestellungen verfuegbar')
      return
    }

    if (
      params.estimatedMinutes !== null &&
      (!Number.isFinite(params.estimatedMinutes) ||
        params.estimatedMinutes < 5 ||
        params.estimatedMinutes > 240)
    ) {
      setError('Lieferzeit muss zwischen 5 und 240 Minuten liegen')
      return
    }

    let resolvedDriverUserId: string | null = null
    let resolvedDriverName: string | null = null

    if (params.driverUserId && params.driverUserId.trim().length > 0) {
      const selectedDriver = feed.drivers.find((entry) => entry.id === params.driverUserId) || null
      if (!selectedDriver) {
        setError('Fahrer konnte nicht gefunden werden. Bitte Fahrer aus der Liste waehlen.')
        return
      }
      resolvedDriverUserId = selectedDriver.id
      resolvedDriverName = selectedDriver.name
    } else {
      const trimmedName = params.driverName?.trim() || ''
      if (!trimmedName) {
        setError('Bitte Fahrer oder verbundenes Fahrergeraet auswaehlen.')
        return
      }
      resolvedDriverName = trimmedName
    }

    try {
      setDispatchingOrderId(order.id)
      setError('')
      await dispatchPublicOrderDisplayOrder(feed.display.displayCode, order.id, {
        driverUserId: resolvedDriverUserId,
        driverName: resolvedDriverName,
        estimatedMinutes:
          params.estimatedMinutes === null ? undefined : Math.round(params.estimatedMinutes),
      })
      setDriverAssignOrder(null)
      setDriverAssignDeviceLabel('')
      setDriverAssignUserId('')
      await loadFeed()
    } catch (dispatchError) {
      setError(
        dispatchError instanceof Error
          ? dispatchError.message
          : 'Fahrerzuweisung konnte nicht gespeichert werden'
      )
    } finally {
      setDispatchingOrderId(null)
    }
  }

  async function confirmDriverAssignment() {
    if (!driverAssignOrder) {
      return
    }

    const normalizedEta = driverAssignEtaMinutes.trim()
    const parsedEta = normalizedEta.length === 0 ? null : Number(normalizedEta)
    if (parsedEta !== null && (!Number.isFinite(parsedEta) || parsedEta < 5 || parsedEta > 240)) {
      setError('Lieferzeit muss zwischen 5 und 240 Minuten liegen')
      return
    }

    await dispatchOrderToDriver(
      driverAssignOrder,
      {
        driverUserId: driverAssignUserId || null,
        driverName: driverAssignDeviceLabel || null,
        estimatedMinutes: parsedEta === null ? null : Math.round(parsedEta),
      }
    )
  }

  async function createDriverDeviceQrSession() {
    if (!feed || feed.display.displayRole !== 'CASH') {
      return
    }
    const parsedHours = Number(driverDeviceHours)
    if (!Number.isFinite(parsedHours) || parsedHours < 1 || parsedHours > 168) {
      setError('Zugangszeit fuer Fahrergeraet muss zwischen 1 und 168 Stunden liegen.')
      return
    }

    try {
      setCreatingDriverDeviceQr(true)
      setError('')
      const session = await createPublicDriverDeviceSession(feed.display.displayCode, {
        accessHours: Math.round(parsedHours),
        deviceLabel: driverDeviceLabel.trim() || undefined,
      })
      setDriverDeviceSession(session)
      setDriverDeviceLabel(session.deviceLabel)
      await loadFeed()
    } catch (sessionError) {
      setError(
        sessionError instanceof Error
          ? sessionError.message
          : 'Fahrergeraet-QR konnte nicht erstellt werden'
      )
    } finally {
      setCreatingDriverDeviceQr(false)
    }
  }

  async function revokeDriverDeviceSession(sessionId: string) {
    if (!feed) {
      return
    }

    try {
      setRevokingDriverDeviceSessionId(sessionId)
      setError('')
      await revokePublicDriverDeviceSession(feed.display.displayCode, sessionId)
      if (driverDeviceSession?.sessionId === sessionId) {
        setDriverDeviceSession(null)
      }
      await loadFeed()
    } catch (sessionError) {
      setError(
        sessionError instanceof Error
          ? sessionError.message
          : 'Fahrergeraet konnte nicht getrennt werden'
      )
    } finally {
      setRevokingDriverDeviceSessionId(null)
    }
  }

  async function setItemStatus(orderId: string, itemId: string, status: 'OPEN' | 'DONE') {
    if (!feed) {
      return
    }

    try {
      setSavingOrderId(orderId)
      setError('')
      await updatePublicOrderDisplayItemStatus(feed.display.displayCode, orderId, itemId, status)
      await loadFeed()
    } catch (statusError) {
      setError(
        statusError instanceof Error
          ? statusError.message
          : 'Positionsstatus konnte nicht aktualisiert werden'
      )
    } finally {
      setSavingOrderId(null)
    }
  }

  async function markOrderPaid(order: Order) {
    if (!feed) {
      return
    }

    if (order.paymentStatus === 'PAID') {
      return
    }

    try {
      setSavingOrderId(order.id)
      setError('')
      await updatePublicOrderDisplayPaymentStatus(feed.display.displayCode, order.id, true)
      await loadFeed()
    } catch (paymentError) {
      setError(
        paymentError instanceof Error
          ? paymentError.message
          : 'Zahlungsstatus konnte nicht aktualisiert werden'
      )
    } finally {
      setSavingOrderId(null)
    }
  }

  async function acceptOrderWithEta(order: Order, estimatedMinutes: number) {
    if (!feed) {
      return
    }

    try {
      setAcceptingOrderId(order.id)
      setError('')
      await acceptPublicOrderDisplayOrder(feed.display.displayCode, order.id, estimatedMinutes)
      dismissedAlertUntilRef.current.set(order.id, Date.now() + 90 * 1000)
      setAlertOrderQueue((current) => current.filter((entry) => entry.id !== order.id))
      setActiveAlertOrder(null)
      await loadFeed()
    } catch (acceptError) {
      setError(
        acceptError instanceof Error
          ? acceptError.message
          : 'Bestellannahme konnte nicht gespeichert werden'
      )
    } finally {
      setAcceptingOrderId(null)
    }
  }

  const sortedOrders = useMemo(() => getSortedDisplayOrders(feed), [feed])
  const complaintOrders = useMemo(
    () =>
      sortedOrders.filter(
        (order) => (order.complaintOpen ?? false) || (order.complaintCount ?? 0) > 0
      ),
    [sortedOrders]
  )
  const activeComplaintOrder = useMemo(
    () => complaintOrders.find((order) => order.id === activeComplaintOrderId) ?? null,
    [activeComplaintOrderId, complaintOrders]
  )
  const activeRouteMapOrder = useMemo(
    () => sortedOrders.find((order) => order.id === activeRouteMapOrderId) ?? null,
    [activeRouteMapOrderId, sortedOrders]
  )
  const mapModalOrders = showAllRouteMaps
    ? sortedOrders.filter(
        (order) =>
          order.serviceType === 'DELIVERY' &&
          order.status !== 'archived' &&
          order.status !== 'done'
      )
    : activeRouteMapOrder
      ? [activeRouteMapOrder]
      : []

  const preparingCount = sortedOrders.filter((order) => order.status === 'preparing').length
  const openCount = sortedOrders.filter((order) => order.status === 'open').length
  const unpaidCount = sortedOrders.filter((order) => order.paymentStatus !== 'PAID').length
  const readyCount = sortedOrders.filter((order) => order.status === 'done').length
  const complaintOpenCount = complaintOrders.length
  const touchActionButtonClass =
    'min-h-[52px] rounded-xl px-5 py-3 text-base font-semibold transition disabled:cursor-not-allowed disabled:opacity-60'

  if (loading && !feed) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-slate-950 px-6 text-white">
        <p>Bestell-Display wird geladen...</p>
      </main>
    )
  }

  if (!feed) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-slate-950 px-6 text-white">
        <p className="max-w-xl text-center text-white/80">
          {error || 'Bestell-Display ist nicht verfuegbar.'}
        </p>
      </main>
    )
  }

  const displayBackground = sanitizeHexColor(feed.display.displayBackgroundColor, '#020617')
  const orderCardBackground = sanitizeHexColor(feed.display.orderCardBackgroundColor, '#0f172a')
  const showDeliveryMapCard = resolveShowDeliveryMapCard(feed.display.notes)
  const activeAlertOrderTargetCoordinates = activeAlertOrder
    ? deliveryTargetCoordinatesByOrderId[activeAlertOrder.id] ?? null
    : null
  const activeAlertOrderDriverCoordinates = activeAlertOrder
    ? resolveValidDriverCoordinates(activeAlertOrder)
    : null
  const activeAlertOrderMarkers = activeAlertOrder
    ? resolveOrderMapMarkers(activeAlertOrder, activeAlertOrderTargetCoordinates)
    : []
  const activeAlertOrderTargetLink = resolveOpenStreetMapLink(activeAlertOrderTargetCoordinates)
  const mediaMode =
    feed.display.backgroundMediaMode === 'IMAGE' || feed.display.backgroundMediaMode === 'VIDEO'
      ? feed.display.backgroundMediaMode
      : 'NONE'
  const mediaUrl = feed.display.backgroundMediaUrl
  const runtimeLastSyncMs = runtimeConfig?.lastSyncAt ? Date.parse(runtimeConfig.lastSyncAt) : Number.NaN
  const connectionStaleSeconds = Number.isFinite(runtimeLastSyncMs)
    ? Math.max(0, Math.floor((Date.now() - runtimeLastSyncMs) / 1000))
    : null
  const layoutStyle = autoScaleEnabled
    ? {
        transform: `scale(${layoutScale})`,
        transformOrigin: 'top center',
        width: `${100 / layoutScale}%`,
        minHeight: viewportHeight ? `${viewportHeight / layoutScale}px` : undefined,
      }
    : undefined

  return (
    <main
      className="safe-area-padding relative min-h-screen overflow-x-hidden overflow-y-auto px-3 py-4 text-white sm:px-4 sm:py-5 md:px-6"
      style={{ background: displayBackground }}
    >
      <DisplayRuntimeShell runtimeConfig={runtimeConfig}>
      <DisplayConnectionStatus state={connectionState} staleSeconds={connectionStaleSeconds} />
      {mediaMode === 'IMAGE' && mediaUrl ? (
        <div
          className="pointer-events-none absolute inset-0 bg-cover bg-center opacity-35"
          style={{ backgroundImage: `url(${mediaUrl})` }}
        />
      ) : null}
      {mediaMode === 'VIDEO' && mediaUrl ? (
        <video
          className="pointer-events-none absolute inset-0 h-full w-full object-cover opacity-30"
          src={mediaUrl}
          autoPlay
          loop
          muted
          playsInline
        />
      ) : null}
      <div className="pointer-events-none absolute inset-0 bg-slate-950/45" />
      <div className="relative mx-auto max-w-7xl" style={layoutStyle}>
        <header
          className="rounded-3xl border border-slate-800 px-5 py-4 shadow-xl"
          style={{ background: hexToRgba(orderCardBackground, 0.82) }}
        >
          <p className="text-xs uppercase tracking-[0.2em] text-cyan-300">Klarando Display</p>
          <div className="mt-2 flex flex-wrap items-end justify-between gap-3">
            <div>
              <h1 className="break-words text-2xl font-bold sm:text-3xl">{feed.display.name}</h1>
              <p className="text-sm text-slate-300">
                {displayRoleLabel(feed.display.displayRole)} | Code: {feed.display.displayCode} |
                Standort: {feed.display.location || '-'}
              </p>
            </div>
          </div>
        </header>

        {error ? (
          <div className="mt-4 rounded-2xl border border-red-300/30 bg-red-500/10 px-4 py-3 text-sm text-red-100">
            {error}
          </div>
        ) : null}

        {activeAlertOrder && feed.display.displayRole === 'CASH' ? (
          <section
            className={`mt-4 rounded-3xl border px-5 py-4 transition ${
              blinkAlert
                ? 'border-amber-300/80 bg-amber-400/20'
                : 'border-amber-300/35 bg-amber-400/10'
            }`}
          >
            <div className="flex flex-wrap items-start justify-between gap-3">
              <div>
                <p className="text-xs uppercase tracking-[0.2em] text-amber-200">
                  Neue Bestellung
                </p>
                <h2 className="mt-1 break-words text-xl font-bold">
                  #{activeAlertOrder.id.slice(0, 8).toUpperCase()} |{' '}
                  {resolveCustomerHint(activeAlertOrder).name}
                </h2>
                <p className="mt-1 text-sm text-slate-200">
                  {resolveCustomerHint(activeAlertOrder).service} |{' '}
                  {resolveCustomerHint(activeAlertOrder).location}
                </p>
                <p className="text-xs text-cyan-100/90">
                  Kanal: {activeAlertOrder.sourceChannel}
                </p>
                <p className="text-xs text-slate-300">
                  Gesamt {Number(activeAlertOrder.total).toFixed(2)} EUR
                  {Number(activeAlertOrder.deliveryFee || 0) > 0
                    ? ` (inkl. Liefergebuehr ${Number(activeAlertOrder.deliveryFee).toFixed(2)} EUR)`
                    : ''}
                </p>
                <div className="mt-3 grid gap-3 md:grid-cols-[minmax(0,1.35fr)_minmax(0,1fr)]">
                  {showDeliveryMapCard ? (
                    <div className="w-full rounded-2xl border border-amber-100/35 bg-slate-900/35 p-2.5">
                      <div className="mb-2 flex items-center justify-between gap-2">
                        <p className="text-xs font-semibold uppercase tracking-[0.14em] text-amber-100/90">
                          Lieferkarte
                        </p>
                        <button
                          type="button"
                          onClick={() => setDeliveryMapExpanded((current) => !current)}
                          className="min-h-[40px] rounded-md border border-slate-400/40 px-3 py-2 text-xs font-semibold text-slate-100 hover:bg-slate-700/40"
                        >
                          {deliveryMapExpanded ? 'Klein' : 'Vergroessern'}
                        </button>
                      </div>
                      <div
                        className={`overflow-hidden rounded-xl border border-slate-500/40 transition-all ${
                          deliveryMapExpanded ? 'h-72' : 'h-40'
                        }`}
                      >
                        {activeAlertOrderMarkers.length > 0 ? (
                          <InternalLiveMap
                            markers={activeAlertOrderMarkers}
                            className="h-full w-full"
                            showConnectionLine
                          />
                        ) : (
                          <div className="flex h-full items-center justify-center px-3 text-center text-xs text-amber-100/85">
                            {deliveryTargetStatusByOrderId[activeAlertOrder.id] === 'pending'
                              ? 'Lieferadresse wird geocodiert...'
                              : 'Lieferadresse vorhanden, Karte noch nicht verfügbar.'}
                          </div>
                        )}
                      </div>
                      {activeAlertOrderTargetLink ? (
                        <a
                          href={activeAlertOrderTargetLink}
                          target="_blank"
                          rel="noreferrer"
                          className="mt-2 inline-block text-xs font-semibold text-cyan-200 underline"
                        >
                          Ziel in OpenStreetMap öffnen
                        </a>
                      ) : null}
                      {!activeAlertOrderDriverCoordinates ? (
                        <p className="mt-2 text-xs text-slate-300">Fahrerposition noch nicht verfügbar.</p>
                      ) : null}
                    </div>
                  ) : null}
                  <div className="h-fit rounded-xl border border-amber-200/35 bg-slate-900/35 px-3 py-2">
                    <p className="text-[11px] font-semibold uppercase tracking-[0.14em] text-amber-100/90">
                      Positionen ({activeAlertOrder.items.length})
                    </p>
                    <div className="mt-1.5 space-y-1 text-xs text-slate-100">
                      {resolvePopupPositionLines(activeAlertOrder).map((line, index) => (
                        <p key={`${activeAlertOrder.id}-line-${index}`}>{line}</p>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
              <button
                type="button"
                onClick={() => {
                  dismissedAlertUntilRef.current.set(activeAlertOrder.id, Date.now() + 2 * 60 * 1000)
                  setActiveAlertOrder(null)
                }}
                className="min-h-[52px] rounded-xl border border-slate-500 px-5 py-3 text-base font-semibold text-slate-200 hover:bg-slate-700/40"
              >
                Spaeter
              </button>
            </div>

            <div className="mt-4 flex flex-wrap gap-2">
              {[15, 20, 30, 45, 60].map((minutes) => (
                <button
                  key={minutes}
                  type="button"
                  onClick={() => setSelectedEtaMinutes(minutes)}
                  className={`min-h-[52px] rounded-xl px-5 py-3 text-base font-semibold transition ${
                    selectedEtaMinutes === minutes
                      ? 'bg-cyan-500 text-white'
                      : 'bg-slate-800 text-slate-200 hover:bg-slate-700'
                  }`}
                >
                  {minutes} min
                </button>
              ))}
            </div>

            <div className="mt-4">
              <button
                type="button"
                disabled={acceptingOrderId === activeAlertOrder.id}
                onClick={() => void acceptOrderWithEta(activeAlertOrder, selectedEtaMinutes)}
                className="min-h-[54px] rounded-xl bg-emerald-600 px-6 py-3 text-base font-semibold text-white transition hover:bg-emerald-700 disabled:cursor-not-allowed disabled:opacity-60"
              >
                {acceptingOrderId === activeAlertOrder.id
                  ? 'Wird bestaetigt...'
                  : `Bestellung annehmen (${selectedEtaMinutes} min)`}
              </button>
            </div>
          </section>
        ) : null}

        <div className="mt-4 grid gap-4 md:grid-cols-3">
          <StatCard label="Offene Bestellungen" value={String(sortedOrders.length)} tone="neutral" />
          {feed.display.displayRole === 'CASH' ? (
            <>
              <StatCard label="Unbezahlt" value={String(unpaidCount)} tone="danger" />
              <StatCard label="Fertig (nicht archiviert)" value={String(readyCount)} tone="success" />
              {complaintOpenCount > 0 ? (
                <StatCard
                  label="Reklamation offen"
                  value={String(complaintOpenCount)}
                  tone="warning"
                />
              ) : null}
            </>
          ) : feed.display.displayRole === 'PICKUP' ? (
            <>
              <StatCard label="Offen" value={String(openCount)} tone="warning" />
              <StatCard label="Abholbereit" value={String(readyCount)} tone="success" />
            </>
          ) : (
            <>
              <StatCard label="In Zubereitung" value={String(preparingCount)} tone="info" />
              <StatCard label="Neu" value={String(openCount)} tone="warning" />
            </>
          )}
        </div>

        {feed.display.displayRole === 'CASH' && complaintOpenCount > 0 ? (
          <section className="mt-4 rounded-2xl border border-amber-300/40 bg-amber-500/10 px-4 py-3">
            <div className="flex flex-wrap items-center justify-between gap-2">
              <p className="text-sm font-semibold text-amber-100">
                Offene Reklamationen: {complaintOpenCount}
              </p>
              <div className="flex flex-wrap gap-2">
                {complaintOrders.map((order) => (
                  <button
                    key={`complaint-open-${order.id}`}
                    type="button"
                    onClick={() => setActiveComplaintOrderId(order.id)}
                    className="min-h-[42px] rounded-lg border border-amber-300/60 bg-slate-900/45 px-3 py-2 text-xs font-semibold text-amber-100 hover:bg-slate-800/70"
                  >
                    Reklamation #{order.id.slice(0, 8).toUpperCase()}
                  </button>
                ))}
              </div>
            </div>
          </section>
        ) : null}

        {feed.display.displayRole === 'CASH' ? (
          <section className="mt-4 space-y-3">
            <div className="flex flex-wrap items-center justify-between gap-2">
              <button
                type="button"
                onClick={() => setShowDriverQuickConnect((current) => !current)}
                className="min-h-[44px] rounded-xl border border-cyan-300/40 bg-cyan-500/15 px-4 py-2 text-sm font-semibold text-cyan-100 hover:bg-cyan-500/25"
              >
                {showDriverQuickConnect
                  ? 'Fahrer-Schnellverbindung ausblenden'
                  : 'Fahrer-Schnellverbindung'}
              </button>
              <p className="rounded-xl border border-cyan-300/40 bg-cyan-500/15 px-3 py-1.5 text-sm font-semibold text-cyan-100">
                Aktiv: {feed.activeDriverDevices.filter((entry) => entry.isActive).length}
              </p>
            </div>

            {showDriverQuickConnect ? (
              <div
                className="rounded-3xl border border-cyan-300/30 bg-slate-900/45 px-4 py-4"
                style={{ backdropFilter: 'blur(2px)' }}
              >
                <p className="text-xs uppercase tracking-[0.16em] text-cyan-200">Fahrergeraete (QR)</p>
                <p className="mt-1 text-sm text-slate-300">
                  QR-Code am Kassendisplay erzeugen, in Fahrer-App scannen und Geraet direkt verbinden.
                </p>

                <div className="mt-3 grid gap-3 lg:grid-cols-[1fr_320px]">
                  <div className="space-y-3 rounded-2xl border border-slate-600/70 bg-slate-950/35 p-3">
                    <div className="grid gap-3 sm:grid-cols-2">
                      <label className="block">
                        <span className="mb-1 block text-sm font-medium text-slate-200">Geraetename</span>
                        <input
                          type="text"
                          value={driverDeviceLabel}
                          onChange={(event) => setDriverDeviceLabel(event.target.value)}
                          placeholder="z. B. Fahrer Handy 1"
                          className="w-full rounded-xl border border-slate-500 bg-slate-900 px-3 py-2 text-sm text-white outline-none focus:border-cyan-300"
                        />
                      </label>
                      <label className="block">
                        <span className="mb-1 block text-sm font-medium text-slate-200">Zugangszeit (Stunden)</span>
                        <input
                          type="number"
                          min={1}
                          max={168}
                          value={driverDeviceHours}
                          onChange={(event) => setDriverDeviceHours(event.target.value)}
                          className="w-full rounded-xl border border-slate-500 bg-slate-900 px-3 py-2 text-sm text-white outline-none focus:border-cyan-300"
                        />
                      </label>
                    </div>
                    <button
                      type="button"
                      disabled={creatingDriverDeviceQr}
                      onClick={() => void createDriverDeviceQrSession()}
                      className="min-h-[50px] rounded-xl bg-cyan-600 px-5 py-2.5 text-base font-semibold text-white hover:bg-cyan-700 disabled:cursor-not-allowed disabled:opacity-60"
                    >
                      {creatingDriverDeviceQr ? 'QR wird erstellt...' : 'QR-Code erstellen'}
                    </button>

                    <div className="max-h-56 overflow-auto rounded-xl border border-slate-700/70 bg-slate-950/35">
                      {feed.activeDriverDevices.length === 0 ? (
                        <p className="px-3 py-4 text-sm text-slate-400">Noch kein Fahrergeraet verbunden.</p>
                      ) : (
                        <ul className="divide-y divide-slate-800">
                          {feed.activeDriverDevices.map((session) => (
                            <li key={session.sessionId} className="flex items-center justify-between gap-3 px-3 py-2.5">
                              <div>
                                <p className="text-sm font-semibold text-slate-100">{session.driverName || session.deviceLabel}</p>
                                <p className="text-xs text-slate-400">
                                  {session.isOnline ? 'Online' : 'Offline'} | Ablauf:{' '}
                                  {formatDateTime(session.expiresAt)}
                                </p>
                              </div>
                              <button
                                type="button"
                                onClick={() => void revokeDriverDeviceSession(session.sessionId)}
                                disabled={revokingDriverDeviceSessionId === session.sessionId}
                                className="rounded-lg border border-rose-300/45 px-3 py-1.5 text-xs font-semibold text-rose-100 hover:bg-rose-500/20 disabled:cursor-not-allowed disabled:opacity-60"
                              >
                                {revokingDriverDeviceSessionId === session.sessionId ? 'Trennt...' : 'Trennen'}
                              </button>
                            </li>
                          ))}
                        </ul>
                      )}
                    </div>
                  </div>

                  <div className="rounded-2xl border border-slate-600/70 bg-slate-950/35 p-3">
                    {driverDeviceSession?.qrImageUrl ? (
                      <div className="text-center">
                        {/* eslint-disable-next-line @next/next/no-img-element */}
                        <img
                          src={driverDeviceSession.qrImageUrl}
                          alt="Fahrergeraet QR"
                          className="mx-auto h-64 w-64 rounded-2xl border border-slate-600 bg-white p-2"
                        />
                        <p className="mt-2 text-sm font-semibold text-cyan-100">{driverDeviceSession.deviceLabel}</p>
                        <p className="text-xs text-slate-300">
                          Gueltig bis {formatDateTime(driverDeviceSession.expiresAt)}
                        </p>
                      </div>
                    ) : (
                      <div className="flex h-full min-h-[200px] items-center justify-center rounded-xl border border-dashed border-slate-600 text-sm text-slate-400">
                        Noch kein QR erstellt.
                      </div>
                    )}
                  </div>
                </div>
              </div>
            ) : null}
          </section>
        ) : null}

        <section className="mt-5 space-y-3">
          {sortedOrders.length === 0 ? (
            <div
              className="rounded-3xl border border-dashed border-slate-700 px-6 py-10 text-center text-slate-300"
              style={{ background: hexToRgba(orderCardBackground, 0.55) }}
            >
              Keine offenen Bestellungen.
            </div>
          ) : (
            sortedOrders.map((order) => {
              const pickupNumber = formatPickupNumber(order.pickupNumber)
              const isPickupOnlyNumberMode =
                feed.display.displayRole === 'PICKUP' && feed.display.pickupShowOnlyNumber
              const elapsedSeconds = Math.max(
                0,
                Math.floor((nowMs - new Date(order.createdAt).getTime()) / 1000)
              )
              const timeBadge = resolveTimeBadge(order, nowMs)
              const isAgeAlertActive =
                feed.display.showOrderAge &&
                feed.display.orderAgeAlertThresholdSec > 0 &&
                elapsedSeconds >= feed.display.orderAgeAlertThresholdSec
              const orderTargetCoordinates = deliveryTargetCoordinatesByOrderId[order.id] ?? null
              const orderMapMarkers = resolveOrderMapMarkers(order, orderTargetCoordinates)
              const hasDriverCoordinates = Boolean(resolveValidDriverCoordinates(order))
              const acceptedRuntimeLabel = resolveAcceptedRuntimeLabel(order, nowMs)
              const deliveryRuntimeLabel = resolveDeliveryRuntimeLabel(order, nowMs)
              const isStatusAnimating =
                Boolean(highlightedOrderIds[order.id]) && feed.display.statusAnimationMode !== 'NONE'
              const statusChipAnimation = isStatusAnimating
                ? statusAnimationStyle(
                    feed.display.statusAnimationMode,
                    feed.display.statusAnimationDurationMs
                  )
                : undefined

              return (
                <article
                  key={order.id}
                  className="rounded-3xl border border-l-4 px-4 py-4 shadow-lg"
                  style={{
                    borderColor: hexToRgba(statusColorFor(feed.display, order.status), 0.38),
                    borderLeftColor: statusColorFor(feed.display, order.status),
                    background: hexToRgba(orderCardBackground, 0.88),
                    ...(isStatusAnimating ? statusChipAnimation : undefined),
                  }}
                >
                <div className="flex flex-wrap items-start justify-between gap-3">
                  <div className="flex items-start gap-3">
                    <div>
                      {isPickupOnlyNumberMode && pickupNumber ? (
                        <p className="text-3xl font-black tracking-[0.2em] text-amber-300">
                          #{pickupNumber}
                        </p>
                      ) : null}
                      {!isPickupOnlyNumberMode && feed.display.showOrderNumber ? (
                        <p className="text-lg font-semibold">
                          Bestellung #{order.id.slice(0, 8).toUpperCase()}
                        </p>
                      ) : null}
                      {feed.display.showPickupNumber && pickupNumber ? (
                        <p className="text-sm font-semibold text-amber-300">Abholnummer {pickupNumber}</p>
                      ) : null}
                      <p className="text-sm text-slate-300">
                        {formatClock(order.createdAt)} | Kanal: {order.sourceChannel}
                        {feed.display.showTerminalInfo
                          ? ` | Terminal: ${order.terminal?.name || '-'}`
                          : ''}
                      </p>
                      {feed.display.showOrderAge ? (
                        <p
                          className={`mt-1 inline-flex rounded-lg border px-2.5 py-1 font-bold ${
                            isAgeAlertActive || timeBadge.isAlert
                              ? 'bg-red-500/25 text-red-100'
                              : 'bg-slate-900/45 text-slate-100'
                          }`}
                          style={{
                            fontSize: `${feed.display.orderAgeFontSize}px`,
                            borderColor: isAgeAlertActive || timeBadge.isAlert
                              ? 'rgba(239, 68, 68, 0.75)'
                              : 'rgba(148, 163, 184, 0.45)',
                            ...((isAgeAlertActive || timeBadge.isAlert)
                              ? ageAlertStyle(
                                  feed.display.orderAgeAlertAnimationMode,
                                  feed.display.statusAnimationDurationMs
                                )
                              : undefined),
                          }}
                        >
                          {timeBadge.label}
                        </p>
                      ) : null}
                      {feed.display.showPaymentInfo || feed.display.showTotal ? (
                        <p className="text-xs text-slate-400">
                          {feed.display.showPaymentInfo ? `Zahlung: ${order.paymentMethod || '-'}` : ''}
                          {feed.display.showPaymentInfo && feed.display.showTotal ? ' | ' : ''}
                          {feed.display.showTotal
                            ? `Gesamt: ${Number(order.total).toFixed(2)} EUR`
                            : ''}
                        </p>
                      ) : null}
                      {order.acceptedAt || order.estimatedReadyAt ? (
                        <p className="text-xs text-cyan-200">
                          Annahme: {order.acceptedAt ? formatDateTime(order.acceptedAt) : '-'} | ETA:{' '}
                          {order.estimatedReadyAt ? formatDateTime(order.estimatedReadyAt) : '-'}
                        </p>
                      ) : null}
                      {acceptedRuntimeLabel ? (
                        <p className="mt-1 inline-flex rounded-lg border border-cyan-300/45 bg-cyan-400/20 px-2.5 py-1 text-sm font-bold text-cyan-50">
                          Seit Annahme: {acceptedRuntimeLabel}
                        </p>
                      ) : null}
                      {deliveryRuntimeLabel ? (
                        <p className="mt-1 inline-flex rounded-lg border border-indigo-300/45 bg-indigo-500/20 px-2.5 py-1 text-sm font-bold text-indigo-100">
                          Seit Fahrerstart: {deliveryRuntimeLabel}
                        </p>
                      ) : null}
                      {order.status === 'out_for_delivery' || order.assignedDriverName ? (
                        <p className="text-xs text-cyan-100">
                          Fahrer: {order.assignedDriverName || order.assignedDriver?.name || '-'} | Abfahrt:{' '}
                          {order.driverDepartedAt ? formatDateTime(order.driverDepartedAt) : '-'}
                        </p>
                      ) : null}
                      {order.complaintOpen && (order.complaintCount ?? 0) > 0 ? (
                        <button
                          type="button"
                          onClick={() => setActiveComplaintOrderId(order.id)}
                          className="mt-2 min-h-[42px] rounded-lg border border-amber-300/70 bg-amber-500/20 px-3 py-2 text-left text-xs font-semibold text-amber-100 hover:bg-amber-500/35"
                        >
                          Reklamation offen ({order.complaintCount ?? 1}){order.latestComplaintMessage ? ` | ${order.latestComplaintMessage}` : ''}
                        </button>
                      ) : null}
                      {feed.display.showStatusBadge || feed.display.showPaymentInfo ? (
                        <div className="mt-2 flex flex-wrap items-center gap-2">
                          {feed.display.showStatusBadge ? (
                            <span
                              className="rounded-lg border px-2.5 py-1 text-xs font-semibold"
                              style={{
                                background: hexToRgba(statusColorFor(feed.display, order.status), 0.2),
                                borderColor: hexToRgba(statusColorFor(feed.display, order.status), 0.45),
                                color: '#f8fafc',
                                ...statusChipAnimation,
                              }}
                            >
                              Status: {orderStatusLabel(order.status)}
                            </span>
                          ) : null}
                          {feed.display.showPaymentInfo ? (
                            <span
                              className="rounded-lg border px-2.5 py-1 text-xs font-semibold"
                              style={paymentStatusStyle(order.paymentStatus)}
                            >
                              {paymentStatusLabel(order.paymentStatus)}
                            </span>
                          ) : null}
                          {(order.complaintCount ?? 0) > 0 ? (
                            <span
                              className={`rounded-lg border px-2.5 py-1 text-xs font-semibold ${
                                order.complaintOpen
                                  ? 'border-amber-300/70 bg-amber-500/20 text-amber-100'
                                  : 'border-slate-500/70 bg-slate-700/35 text-slate-200'
                              }`}
                            >
                              Reklamation {order.complaintCount}
                            </span>
                          ) : null}
                          {order.signatureCaptured ? (
                            <span className="rounded-lg border border-emerald-300/60 bg-emerald-500/20 px-2.5 py-1 text-xs font-semibold text-emerald-100">
                              Signatur vorhanden
                            </span>
                          ) : null}
                        </div>
                      ) : null}
                    </div>
                  </div>

                  <div className="flex max-w-full flex-wrap items-stretch justify-end gap-2.5">
                    {orderMapMarkers.length > 0 || (order.serviceType === 'DELIVERY' && hasDriverCoordinates) ? (
                      <div className="w-[320px] rounded-xl border border-cyan-300/35 bg-slate-950/35 p-2">
                        <p className="mb-1 text-[11px] font-semibold uppercase tracking-[0.14em] text-cyan-100">
                          Fahrer und Lieferziel
                        </p>
                        <div className="overflow-hidden rounded-lg border border-slate-700/80">
                          {orderMapMarkers.length > 0 ? (
                            <InternalLiveMap
                              markers={orderMapMarkers}
                              className="h-28 w-full"
                              showConnectionLine
                            />
                          ) : (
                            <div className="flex h-28 items-center justify-center px-2 text-center text-[11px] text-slate-300">
                              {deliveryTargetStatusByOrderId[order.id] === 'pending'
                                ? 'Lieferziel wird geocodiert...'
                                : 'Lieferadresse vorhanden, Karte noch nicht verfügbar.'}
                            </div>
                          )}
                        </div>
                        {!hasDriverCoordinates ? (
                          <p className="mt-2 text-[11px] text-slate-300">
                            Fahrerposition noch nicht verfügbar.
                          </p>
                        ) : null}
                        <div className="mt-2 flex flex-wrap gap-2">
                          <button
                            type="button"
                            onClick={() => {
                              setActiveRouteMapOrderId(order.id)
                              setShowAllRouteMaps(false)
                            }}
                            className="min-h-[38px] rounded-md border border-cyan-300/60 bg-cyan-500/20 px-2.5 py-1 text-xs font-semibold text-cyan-100 hover:bg-cyan-500/35"
                          >
                            Karte vergroessern
                          </button>
                          <button
                            type="button"
                            onClick={() => {
                              setActiveRouteMapOrderId(order.id)
                              setShowAllRouteMaps(true)
                            }}
                            className="min-h-[38px] rounded-md border border-slate-400/60 bg-slate-700/45 px-2.5 py-1 text-xs font-semibold text-slate-100 hover:bg-slate-600/55"
                          >
                            Alle Lieferungen
                          </button>
                        </div>
                      </div>
                    ) : null}
                    {feed.display.showStatusBadge ? (
                      <span
                        className="rounded-xl border px-3 py-1 text-xs font-semibold"
                        style={{
                          background: hexToRgba(statusColorFor(feed.display, order.status), 0.2),
                          borderColor: hexToRgba(statusColorFor(feed.display, order.status), 0.45),
                          color: '#f8fafc',
                          ...statusChipAnimation,
                        }}
                      >
                        {orderStatusLabel(order.status)}
                      </span>
                    ) : null}

                    {feed.display.displayRole === 'CASH' ? (
                      <>
                        {requiresPopupAcceptance(order) ? (
                          order.acceptedAt ? (
                            <button
                              type="button"
                              disabled={savingOrderId === order.id || acceptingOrderId === order.id}
                              onClick={() => {
                                setSelectedEtaMinutes(order.estimatedMinutes || 45)
                                setActiveAlertOrder(order)
                              }}
                              className={`${touchActionButtonClass} bg-amber-500 text-slate-950 hover:bg-amber-400`}
                            >
                              ETA aktualisieren
                            </button>
                          ) : (
                            <span className="inline-flex min-h-[52px] items-center rounded-xl border border-amber-300/45 bg-amber-200/10 px-4 py-3 text-sm font-semibold text-amber-100">
                              Annahme ueber Popup
                            </span>
                          )
                        ) : null}
                        {order.paymentStatus !== 'PAID' ? (
                          <button
                            type="button"
                            disabled={savingOrderId === order.id}
                            onClick={() => void markOrderPaid(order)}
                            className={`${touchActionButtonClass} bg-emerald-600 text-white hover:bg-emerald-700`}
                          >
                            Als bezahlt
                          </button>
                        ) : null}
                        {order.status !== 'open' ? (
                          <button
                            type="button"
                            disabled={savingOrderId === order.id}
                            onClick={() => void setOrderStatus(order.id, 'open')}
                            className={`${touchActionButtonClass} bg-indigo-600 text-white hover:bg-indigo-700`}
                          >
                            {order.status === 'pending_payment'
                              ? 'Stopp'
                              : order.status === 'preparing'
                                ? 'Stopp'
                                : 'Wieder offen'}
                          </button>
                        ) : null}
                        {order.status !== 'preparing' ? (
                          <button
                            type="button"
                            disabled={savingOrderId === order.id}
                            onClick={() => void setOrderStatus(order.id, 'preparing')}
                            className={`${touchActionButtonClass} bg-blue-600 text-white hover:bg-blue-700`}
                          >
                            Start
                          </button>
                        ) : null}
                        {order.status !== 'done' ? (
                          <button
                            type="button"
                            disabled={savingOrderId === order.id}
                            onClick={() => void setOrderStatus(order.id, 'done')}
                            className={`${touchActionButtonClass} bg-green-600 text-white hover:bg-green-700`}
                          >
                            Fertig
                          </button>
                        ) : null}
                        {order.status === 'done' && order.paymentStatus === 'PAID' ? (
                          <button
                            type="button"
                            disabled={savingOrderId === order.id}
                            onClick={() => void setOrderStatus(order.id, 'archived')}
                            className={`${touchActionButtonClass} bg-slate-700 text-white hover:bg-slate-800`}
                          >
                            Archivieren
                          </button>
                        ) : null}
                        {order.status === 'done' && order.paymentStatus !== 'PAID' ? (
                          <span className="inline-flex min-h-[52px] items-center rounded-xl border border-amber-300/45 bg-amber-200/10 px-4 py-3 text-sm font-semibold text-amber-100">
                            Erst Zahlung, dann Archiv
                          </span>
                        ) : null}
                        {(order.complaintOpen ?? false) || (order.complaintCount ?? 0) > 0 ? (
                          <button
                            type="button"
                            onClick={() => setActiveComplaintOrderId(order.id)}
                            className={`${touchActionButtonClass} bg-amber-600 text-slate-950 hover:bg-amber-500`}
                          >
                            Reklamation
                          </button>
                        ) : null}
                        {order.serviceType === 'DELIVERY' &&
                        order.status !== 'archived' &&
                        order.status !== 'out_for_delivery' ? (
                          <button
                            type="button"
                            disabled={
                              savingOrderId === order.id || dispatchingOrderId === order.id
                            }
                            onClick={() => openDriverAssignModal(order)}
                            className={`${touchActionButtonClass} bg-cyan-600 text-white hover:bg-cyan-700`}
                          >
                            {dispatchingOrderId === order.id
                              ? 'Fahrer wird gesetzt...'
                              : 'Fahrer zuweisen'}
                          </button>
                        ) : null}
                        {order.serviceType === 'DELIVERY' &&
                        order.status === 'out_for_delivery' ? (
                          <span className="inline-flex min-h-[52px] items-center rounded-xl border border-cyan-300/40 bg-cyan-400/20 px-4 py-3 text-sm font-semibold text-cyan-50">
                            Fahrer unterwegs
                          </span>
                        ) : null}
                      </>
                    ) : feed.display.displayRole === 'PICKUP' ? (
                      <span className="rounded-lg border border-slate-600 bg-slate-900/40 px-3 py-1.5 text-xs font-semibold text-slate-200">
                        Info-Display (keine Bedienung)
                      </span>
                    ) : (
                      <>
                        {order.status !== 'preparing' ? (
                          <button
                            type="button"
                            disabled={savingOrderId === order.id}
                            onClick={() => void setOrderStatus(order.id, 'preparing')}
                            className={`${touchActionButtonClass} bg-blue-600 text-white hover:bg-blue-700`}
                          >
                            Start
                          </button>
                        ) : null}
                        {order.status === 'preparing' ? (
                          <button
                            type="button"
                            disabled={savingOrderId === order.id}
                            onClick={() => void setOrderStatus(order.id, 'open')}
                            className={`${touchActionButtonClass} bg-indigo-600 text-white hover:bg-indigo-700`}
                          >
                            Stopp
                          </button>
                        ) : null}
                        {order.status !== 'done' ? (
                          <button
                            type="button"
                            disabled={savingOrderId === order.id}
                            onClick={() => void setOrderStatus(order.id, 'done')}
                            className={`${touchActionButtonClass} bg-green-600 text-white hover:bg-green-700`}
                          >
                            Fertig
                          </button>
                        ) : null}
                      </>
                    )}
                  </div>
                </div>

                {feed.display.showItems ? (
                  <div
                    className="mt-3 rounded-2xl border px-3 py-3"
                    style={{
                      borderColor: 'rgba(148, 163, 184, 0.35)',
                      background: hexToRgba(orderCardBackground, 0.5),
                    }}
                  >
                    <p className="mb-2 text-xs uppercase tracking-wide text-slate-400">
                      Positionen ({order.items.length})
                    </p>
                    <div className="space-y-1.5 text-sm text-slate-200">
                      {order.items.map((item) => (
                        <div
                          key={item.id}
                          className={`rounded-xl px-2 py-1 ${
                            item.productionStatus === 'DONE' ? 'bg-emerald-500/10' : ''
                          }`}
                        >
                          <div className="flex items-center justify-between gap-3">
                            <span
                              className={item.productionStatus === 'DONE' ? 'line-through opacity-70' : undefined}
                            >
                              <span className="mr-1.5 text-base font-black">{item.quantity}x</span>
                              <span className="break-words">{item.product.name}</span>
                            </span>
                            <div className="flex items-center gap-2">
                              <span>{Number(item.price).toFixed(2)} EUR</span>
                              {feed.display.displayRole !== 'PICKUP' ? (
                                <button
                                  type="button"
                                  disabled={savingOrderId === order.id}
                                  onClick={() =>
                                    void setItemStatus(
                                      order.id,
                                      item.id,
                                      item.productionStatus === 'DONE' ? 'OPEN' : 'DONE'
                                    )
                                  }
                                  className={`rounded-md px-2 py-1 text-[11px] font-semibold text-white transition disabled:cursor-not-allowed disabled:opacity-60 ${
                                    item.productionStatus === 'DONE'
                                      ? 'bg-slate-700 hover:bg-slate-800'
                                      : 'bg-emerald-600 hover:bg-emerald-700'
                                  }`}
                                >
                                  {item.productionStatus === 'DONE' ? 'Wieder offen' : 'Position fertig'}
                                </button>
                              ) : null}
                            </div>
                          </div>
                          {item.modifierSnapshot && item.modifierSnapshot.length > 0 ? (
                            <p className="text-xs text-slate-400">
                              Optionen:{' '}
                              {item.modifierSnapshot
                                .map(
                                  (modifier) =>
                                    `${modifier.name} (${modifier.priceDelta >= 0 ? '+' : ''}${modifier.priceDelta.toFixed(2)} EUR)`
                                )
                                .join(', ')}
                            </p>
                          ) : null}
                        </div>
                      ))}
                    </div>
                  </div>
                ) : null}
              </article>
              )
            })
          )}
        </section>
      </div>
      {activeComplaintOrder ? (
        <div className="fixed inset-0 z-[69] flex items-center justify-center bg-slate-950/75 p-4">
          <div className="w-full max-w-3xl rounded-3xl border border-amber-300/45 bg-slate-900 p-5 text-white shadow-2xl">
            <div className="flex items-start justify-between gap-3">
              <div>
                <p className="text-xs uppercase tracking-[0.14em] text-amber-200">Reklamation</p>
                <h3 className="mt-1 text-xl font-bold">
                  #{activeComplaintOrder.id.slice(0, 8).toUpperCase()} |{' '}
                  {activeComplaintOrder.customerName || 'Kunde'}
                </h3>
                <p className="mt-1 text-sm text-slate-300">
                  Telefon: {activeComplaintOrder.customerPhone || '-'} | Adresse:{' '}
                  {[activeComplaintOrder.customerAddress, activeComplaintOrder.customerZipCode, activeComplaintOrder.customerCity]
                    .filter(Boolean)
                    .join(', ') || '-'}
                </p>
              </div>
              <button
                type="button"
                onClick={() => setActiveComplaintOrderId(null)}
                className="min-h-[44px] rounded-xl border border-slate-500 px-4 py-2 text-sm font-semibold text-slate-200 hover:bg-slate-800"
              >
                Schliessen
              </button>
            </div>
            <div className="mt-4 max-h-[65vh] space-y-3 overflow-auto pr-1">
              {resolveOrderComplaintEntries(activeComplaintOrder).length === 0 ? (
                <div className="rounded-xl border border-amber-300/35 bg-amber-500/10 p-3">
                  <p className="text-sm text-amber-100">
                    Noch keine Detaildaten zur Reklamation vorhanden.
                  </p>
                  {activeComplaintOrder.latestComplaintMessage ? (
                    <p className="mt-1 text-sm text-slate-100">
                      Letzter Hinweis: {activeComplaintOrder.latestComplaintMessage}
                    </p>
                  ) : null}
                </div>
              ) : (
                resolveOrderComplaintEntries(activeComplaintOrder).map((complaint) => (
                <div
                  key={complaint.id}
                  className="rounded-xl border border-amber-300/35 bg-amber-500/10 p-3"
                >
                  <p className="text-xs text-amber-100">
                    {formatDateTime(complaint.createdAt)} | {complaint.createdBy || 'app_customer'}
                  </p>
                  <p className="mt-1 text-sm text-slate-100">{complaint.message}</p>
                  {complaint.images.length > 0 ? (
                    <div className="mt-2 grid gap-2 sm:grid-cols-2">
                      {complaint.images.map((imageUrl, index) => (
                        <a
                          key={`${complaint.id}-img-${index}`}
                          href={imageUrl}
                          target="_blank"
                          rel="noreferrer"
                          className="block overflow-hidden rounded-lg border border-slate-600/70"
                        >
                          <img
                            src={imageUrl}
                            alt={`Reklamationsbild ${index + 1}`}
                            className="h-40 w-full object-cover"
                          />
                        </a>
                      ))}
                    </div>
                  ) : (
                    <p className="mt-2 text-xs text-slate-300">Kein Bild angehaengt.</p>
                  )}
                </div>
                ))
              )}
            </div>
          </div>
        </div>
      ) : null}
      {mapModalOrders.length > 0 ? (
        <div className="fixed inset-0 z-[68] flex items-center justify-center bg-slate-950/80 p-4">
          <div className="w-full max-w-6xl rounded-3xl border border-cyan-300/45 bg-slate-900 p-5 text-white shadow-2xl">
            <div className="flex flex-wrap items-start justify-between gap-3">
              <div>
                <p className="text-xs uppercase tracking-[0.14em] text-cyan-200">Live-Kartenansicht</p>
                <h3 className="mt-1 text-xl font-bold">
                  {showAllRouteMaps ? 'Alle aktiven Lieferungen' : `Bestellung #${mapModalOrders[0].id.slice(0, 8).toUpperCase()}`}
                </h3>
              </div>
              <div className="flex flex-wrap gap-2">
                <button
                  type="button"
                  onClick={() => setShowAllRouteMaps((current) => !current)}
                  className="min-h-[44px] rounded-xl border border-cyan-300/60 bg-cyan-500/20 px-4 py-2 text-sm font-semibold text-cyan-100 hover:bg-cyan-500/35"
                >
                  {showAllRouteMaps ? 'Nur diese Bestellung' : 'Alle Lieferungen'}
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setActiveRouteMapOrderId(null)
                    setShowAllRouteMaps(false)
                  }}
                  className="min-h-[44px] rounded-xl border border-slate-500 px-4 py-2 text-sm font-semibold text-slate-200 hover:bg-slate-800"
                >
                  Schliessen
                </button>
              </div>
            </div>
            <div className="mt-4 grid gap-3 lg:grid-cols-2">
              {mapModalOrders.map((mapOrder) => {
                const orderTargetCoordinates = deliveryTargetCoordinatesByOrderId[mapOrder.id] ?? null
                const mapMarkers = resolveOrderMapMarkers(mapOrder, orderTargetCoordinates)
                if (mapMarkers.length === 0) {
                  return (
                    <div
                      key={`route-map-${mapOrder.id}`}
                      className="rounded-xl border border-cyan-300/35 bg-slate-950/35 p-3"
                    >
                      <p className="mb-1 text-xs font-semibold text-cyan-100">
                        #{mapOrder.id.slice(0, 8).toUpperCase()} |{' '}
                        {[mapOrder.customerAddress, mapOrder.customerZipCode, mapOrder.customerCity]
                          .filter(Boolean)
                          .join(', ') || '-'}
                      </p>
                      <p className="text-xs text-slate-300">
                        {deliveryTargetStatusByOrderId[mapOrder.id] === 'pending'
                          ? 'Lieferziel wird geocodiert...'
                          : 'Lieferadresse vorhanden, Karte noch nicht verfügbar.'}
                      </p>
                    </div>
                  )
                }
                return (
                  <div
                    key={`route-map-${mapOrder.id}`}
                    className="rounded-xl border border-cyan-300/35 bg-slate-950/35 p-2"
                  >
                    <p className="mb-1 text-xs font-semibold text-cyan-100">
                      #{mapOrder.id.slice(0, 8).toUpperCase()} |{' '}
                      {[mapOrder.customerAddress, mapOrder.customerZipCode, mapOrder.customerCity]
                        .filter(Boolean)
                        .join(', ') || '-'}
                    </p>
                    <InternalLiveMap
                      markers={mapMarkers}
                      className="h-64 w-full rounded-lg"
                      showConnectionLine
                    />
                  </div>
                )
              })}
            </div>
          </div>
        </div>
      ) : null}
      {driverAssignOrder ? (
        <div className="fixed inset-0 z-[70] flex items-center justify-center bg-slate-950/75 p-4">
          <div className="w-full max-w-3xl rounded-3xl border border-slate-600 bg-slate-900 p-5 text-white shadow-2xl">
            <div className="flex items-start justify-between gap-3">
              <div>
                <p className="text-xs uppercase tracking-[0.16em] text-cyan-200">Fahrerzuweisung</p>
                <h3 className="mt-1 text-2xl font-bold">
                  #{driverAssignOrder.id.slice(0, 8).toUpperCase()} | {driverAssignOrder.customerName || 'Lieferauftrag'}
                </h3>
                <p className="mt-1 text-sm text-slate-300">
                  Lieferadresse: {[driverAssignOrder.customerAddress, driverAssignOrder.customerZipCode, driverAssignOrder.customerCity]
                    .filter(Boolean)
                    .join(', ') || 'nicht hinterlegt'}
                </p>
              </div>
              <button
                type="button"
                onClick={() => {
                  setDriverAssignOrder(null)
                  setDriverAssignUserId('')
                  setDriverAssignDeviceLabel('')
                }}
                className="min-h-[46px] rounded-xl border border-slate-500 px-4 py-2 text-sm font-semibold text-slate-200 hover:bg-slate-800"
              >
                Schliessen
              </button>
            </div>

            <div className="mt-4">
              <p className="text-sm font-semibold text-cyan-100">Angemeldete Fahrer</p>
              <div className="mt-2 grid gap-2 sm:grid-cols-2">
                {feed.drivers.map((driver) => {
                  const active = driverAssignUserId === driver.id
                  return (
                    <button
                      key={driver.id}
                      type="button"
                      onClick={() => {
                        setDriverAssignUserId(driver.id)
                        setDriverAssignDeviceLabel(driver.name)
                      }}
                      className={`min-h-[64px] rounded-xl border px-4 py-3 text-left text-base font-semibold transition ${
                        active
                          ? 'border-cyan-300 bg-cyan-500/25 text-white'
                          : 'border-slate-600 bg-slate-800 text-slate-200 hover:bg-slate-700'
                      }`}
                    >
                      {driver.name}
                    </button>
                  )
                })}
              </div>
            </div>

            {feed.activeDriverDevices.filter((entry) => entry.isActive).length > 0 ? (
              <div className="mt-4">
                <p className="text-sm font-semibold text-cyan-100">Verbundene Fahrergeraete</p>
                <div className="mt-2 grid gap-2 sm:grid-cols-2">
                  {feed.activeDriverDevices
                    .filter((entry) => entry.isActive)
                    .map((session) => {
                      const label = session.driverName || session.deviceLabel
                      const active = !driverAssignUserId && driverAssignDeviceLabel === label
                      return (
                        <button
                          key={session.sessionId}
                          type="button"
                          onClick={() => {
                            setDriverAssignUserId('')
                            setDriverAssignDeviceLabel(label)
                          }}
                          className={`min-h-[64px] rounded-xl border px-4 py-3 text-left text-base font-semibold transition ${
                            active
                              ? 'border-amber-300 bg-amber-500/20 text-white'
                              : 'border-slate-600 bg-slate-800 text-slate-200 hover:bg-slate-700'
                          }`}
                        >
                          <div>{label}</div>
                          <div className="mt-1 text-xs font-medium text-slate-300">
                            {session.isOnline ? 'Online' : 'Offline'} | Ablauf {formatDateTime(session.expiresAt)}
                          </div>
                        </button>
                      )
                    })}
                </div>
              </div>
            ) : null}

            <div className="mt-4 grid gap-3 sm:grid-cols-[220px_1fr] sm:items-end">
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-cyan-100">Lieferzeit (Minuten)</span>
                <input
                  type="number"
                  min={5}
                  max={240}
                  value={driverAssignEtaMinutes}
                  onChange={(event) => setDriverAssignEtaMinutes(event.target.value)}
                  className="w-full rounded-xl border border-slate-500 bg-slate-800 px-3 py-2.5 text-base text-white outline-none focus:border-cyan-300 focus:ring-2 focus:ring-cyan-500/30"
                />
              </label>
              <div className="flex flex-wrap gap-2">
                {[15, 20, 30, 45, 60].map((minutes) => (
                  <button
                    key={`driver-eta-${minutes}`}
                    type="button"
                    onClick={() => setDriverAssignEtaMinutes(String(minutes))}
                    className={`min-h-[48px] rounded-xl px-4 py-2 text-sm font-semibold transition ${
                      driverAssignEtaMinutes === String(minutes)
                        ? 'bg-cyan-500 text-white'
                        : 'bg-slate-800 text-slate-200 hover:bg-slate-700'
                    }`}
                  >
                    {minutes} min
                  </button>
                ))}
              </div>
            </div>

            <div className="mt-5 flex flex-wrap justify-end gap-3">
              <button
                type="button"
                onClick={() => {
                  setDriverAssignOrder(null)
                  setDriverAssignUserId('')
                  setDriverAssignDeviceLabel('')
                }}
                className="min-h-[50px] rounded-xl border border-slate-500 px-5 py-2.5 text-base font-semibold text-slate-200 hover:bg-slate-800"
              >
                Abbrechen
              </button>
              <button
                type="button"
                onClick={() => void confirmDriverAssignment()}
                disabled={
                  dispatchingOrderId === driverAssignOrder.id ||
                  (!driverAssignUserId && !driverAssignDeviceLabel)
                }
                className="min-h-[50px] rounded-xl bg-cyan-600 px-6 py-2.5 text-base font-semibold text-white hover:bg-cyan-700 disabled:cursor-not-allowed disabled:opacity-60"
              >
                {dispatchingOrderId === driverAssignOrder.id ? 'Wird gespeichert...' : 'Fahrer unterwegs setzen'}
              </button>
            </div>
          </div>
        </div>
      ) : null}
      <style jsx global>{`
        @keyframes klarandoBlink {
          0%,
          49% {
            opacity: 1;
          }
          50%,
          100% {
            opacity: 0.35;
          }
        }
        @keyframes klarandoPulse {
          0%,
          100% {
            transform: scale(1);
          }
          50% {
            transform: scale(1.03);
          }
        }
        @keyframes klarandoGlow {
          0%,
          100% {
            filter: drop-shadow(0 0 0px rgba(56, 189, 248, 0));
          }
          50% {
            filter: drop-shadow(0 0 10px rgba(56, 189, 248, 0.7));
          }
        }

        ${isLowPerformanceMode
          ? `
        .klarando-status-animated {
          animation: none !important;
        }`
          : ''}

        @media (prefers-reduced-motion: reduce) {
          * {
            animation: none !important;
            transition: none !important;
          }
        }
      `}</style>
      </DisplayRuntimeShell>
    </main>
  )
}
