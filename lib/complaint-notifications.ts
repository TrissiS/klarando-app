import type { Order } from '@/lib/api'

const STORAGE_KEY = 'klarando.complaints.read.v1'

export type ComplaintAlertItem = {
  id: string
  complaintId: string
  orderId: string
  customerName: string
  branchLabel: string
  createdAt: string
  message: string
  isResolved: boolean
}

type ReadState = Record<string, string>

function safeParseReadState(raw: string | null): ReadState {
  if (!raw) return {}
  try {
    const parsed = JSON.parse(raw) as unknown
    if (!parsed || typeof parsed !== 'object') return {}
    const normalized: ReadState = {}
    for (const [key, value] of Object.entries(parsed as Record<string, unknown>)) {
      if (typeof value === 'string') {
        normalized[key] = value
      }
    }
    return normalized
  } catch {
    return {}
  }
}

function resolveBranchLabel(order: Order): string {
  const terminalLabel = order.terminal?.location?.trim()
  if (terminalLabel) return terminalLabel
  const tenantLabel = order.tenant?.name?.trim()
  if (tenantLabel) return tenantLabel
  return 'Unbekannte Filiale'
}

export function getComplaintAlertId(orderId: string, complaintId: string): string {
  return `${orderId}:${complaintId}`
}

export function getComplaintReadState(): ReadState {
  if (typeof window === 'undefined') return {}
  return safeParseReadState(window.localStorage.getItem(STORAGE_KEY))
}

export function markComplaintAlertRead(alertId: string): void {
  if (typeof window === 'undefined') return
  const current = getComplaintReadState()
  current[alertId] = new Date().toISOString()
  window.localStorage.setItem(STORAGE_KEY, JSON.stringify(current))
}

export function markComplaintAlertsRead(alertIds: string[]): void {
  if (typeof window === 'undefined' || alertIds.length === 0) return
  const current = getComplaintReadState()
  const now = new Date().toISOString()
  for (const alertId of alertIds) {
    current[alertId] = now
  }
  window.localStorage.setItem(STORAGE_KEY, JSON.stringify(current))
}

export function collectComplaintAlerts(orders: Order[]): ComplaintAlertItem[] {
  const alerts: ComplaintAlertItem[] = []
  for (const order of orders) {
    const complaints = Array.isArray(order.complaints) ? order.complaints : []
    for (const complaint of complaints) {
      const complaintId = complaint.id || `fallback-${order.id}`
      const id = getComplaintAlertId(order.id, complaintId)
      alerts.push({
        id,
        complaintId,
        orderId: order.id,
        customerName:
          order.customerName?.trim() ||
          order.appCustomerAccount?.fullName?.trim() ||
          'Unbekannter Kunde',
        branchLabel: resolveBranchLabel(order),
        createdAt: complaint.createdAt,
        message: complaint.message?.trim() || 'Keine Begründung angegeben',
        isResolved: Boolean(complaint.isResolved),
      })
    }
  }

  return alerts.sort((a, b) => {
    const aTime = Date.parse(a.createdAt)
    const bTime = Date.parse(b.createdAt)
    if (Number.isNaN(aTime) && Number.isNaN(bTime)) return 0
    if (Number.isNaN(aTime)) return 1
    if (Number.isNaN(bTime)) return -1
    return bTime - aTime
  })
}
