import type { CSSProperties } from 'react'
import type { Order, PublicOrderDisplayFeed } from '@/lib/api'

export function formatClock(value: string) {
  return new Date(value).toLocaleTimeString('de-DE', {
    hour: '2-digit',
    minute: '2-digit',
  })
}

export function formatDateTime(value: string) {
  return new Date(value).toLocaleString('de-DE')
}

export function formatElapsed(createdAt: string, nowMs: number) {
  const diffSeconds = Math.max(0, Math.floor((nowMs - new Date(createdAt).getTime()) / 1000))
  const hours = Math.floor(diffSeconds / 3600)
  const minutes = Math.floor((diffSeconds % 3600) / 60)
  const seconds = diffSeconds % 60

  if (hours > 0) {
    return `${hours.toString().padStart(2, '0')}:${minutes
      .toString()
      .padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
  }

  return `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
}

export function orderStatusLabel(status: string) {
  if (status === 'cancelled') {
    return 'Storniert'
  }
  if (status === 'delivered') {
    return 'Geliefert'
  }
  if (status === 'driver_assigned') {
    return 'Fahrer zugewiesen'
  }
  if (status === 'archived') {
    return 'Abgeschlossen'
  }
  if (status === 'out_for_delivery') {
    return 'Unterwegs'
  }
  if (status === 'preparing') {
    return 'In Küche'
  }
  if (status === 'done') {
    return 'Fertig'
  }
  if (status === 'accepted') {
    return 'Angenommen'
  }
  if (status === 'pending_payment') {
    return 'Neu (unbezahlt)'
  }
  return 'Neu'
}

export function paymentStatusLabel(paymentStatus: string) {
  return paymentStatus === 'PAID' ? 'Bezahlt' : 'Unbezahlt'
}

export function sanitizeHexColor(color: string | undefined, fallback: string) {
  if (!color) {
    return fallback
  }

  return /^#[0-9a-fA-F]{6}$/.test(color) ? color : fallback
}

export function hexToRgba(hex: string, alpha: number) {
  const safe = sanitizeHexColor(hex, '#334155')
  const r = parseInt(safe.slice(1, 3), 16)
  const g = parseInt(safe.slice(3, 5), 16)
  const b = parseInt(safe.slice(5, 7), 16)
  return `rgba(${r}, ${g}, ${b}, ${alpha})`
}

export function statusColorFor(display: PublicOrderDisplayFeed['display'], status: string) {
  if (status === 'pending_payment') {
    return sanitizeHexColor(display.statusColorPendingPayment, '#ef4444')
  }

  if (status === 'out_for_delivery') {
    return '#06b6d4'
  }

  if (status === 'preparing') {
    return sanitizeHexColor(display.statusColorPreparing, '#3b82f6')
  }

  if (status === 'done') {
    return sanitizeHexColor(display.statusColorDone, '#16a34a')
  }

  return sanitizeHexColor(display.statusColorOpen, '#f97316')
}

export function statusAnimationStyle(
  mode: PublicOrderDisplayFeed['display']['statusAnimationMode'],
  durationMs: number
): CSSProperties | undefined {
  if (mode === 'BLINK') {
    return { animation: `klarandoBlink ${durationMs}ms step-end infinite` }
  }
  if (mode === 'PULSE') {
    return { animation: `klarandoPulse ${durationMs}ms ease-in-out infinite` }
  }
  if (mode === 'GLOW') {
    return { animation: `klarandoGlow ${durationMs}ms ease-in-out infinite` }
  }
  return undefined
}

export function ageAlertStyle(
  mode: PublicOrderDisplayFeed['display']['orderAgeAlertAnimationMode'],
  durationMs: number
): CSSProperties | undefined {
  if (mode === 'BLINK') {
    return { animation: `klarandoBlink ${durationMs}ms step-end infinite` }
  }
  if (mode === 'PULSE') {
    return { animation: `klarandoPulse ${durationMs}ms ease-in-out infinite` }
  }
  return undefined
}

export function paymentStatusStyle(paymentStatus: string): CSSProperties {
  if (paymentStatus === 'PAID') {
    return {
      backgroundColor: 'rgba(22, 163, 74, 0.18)',
      borderColor: 'rgba(22, 163, 74, 0.45)',
      color: '#dcfce7',
    }
  }

  return {
    backgroundColor: 'rgba(245, 158, 11, 0.18)',
    borderColor: 'rgba(245, 158, 11, 0.45)',
    color: '#fef3c7',
  }
}

export function findOrderImage(order: Order) {
  for (const item of order.items) {
    if (item.product.imageUrl) {
      return item.product.imageUrl
    }

    if (item.product.category?.imageUrl) {
      return item.product.category.imageUrl
    }
  }

  return null
}

export function displayRoleLabel(role: string) {
  if (role === 'CASH') {
    return 'Kassen-Display'
  }

  if (role === 'PICKUP') {
    return 'Abhol-Display'
  }

  return 'Kuechen-Display'
}

export function formatPickupNumber(value: number | null) {
  if (value === null) {
    return null
  }

  return String(value).padStart(3, '0')
}

export function getSortedDisplayOrders(feed: PublicOrderDisplayFeed | null) {
  if (!feed) {
    return [] as Order[]
  }

  const priority =
    feed.display.sortMode === 'DONE_FIRST_OPEN_LAST'
      ? new Map<string, number>([
          ['done', 0],
          ['out_for_delivery', 1],
          ['preparing', 2],
          ['pending_payment', 3],
          ['open', 4],
        ])
      : feed.display.displayRole === 'CASH'
      ? new Map<string, number>([
          ['pending_payment', 0],
          ['open', 1],
          ['preparing', 2],
          ['out_for_delivery', 3],
          ['done', 4],
        ])
      : new Map<string, number>([
          ['open', 0],
          ['preparing', 1],
          ['out_for_delivery', 2],
          ['done', 3],
          ['pending_payment', 4],
        ])

  const newestFirst = feed.display.sortMode === 'PRIORITY_NEWEST'

  return [...feed.orders].sort((left, right) => {
    const leftPriority = priority.get(left.status) ?? 5
    const rightPriority = priority.get(right.status) ?? 5
    if (leftPriority !== rightPriority) {
      return leftPriority - rightPriority
    }

    const leftTime = new Date(left.createdAt).getTime()
    const rightTime = new Date(right.createdAt).getTime()
    return newestFirst ? rightTime - leftTime : leftTime - rightTime
  })
}
