import type {
  OrderDisplay,
  OrderDisplayAgeAlertAnimationMode,
  OrderDisplayBackgroundMediaMode,
  OrderDisplayRole,
  OrderDisplayStatusAnimationMode,
} from '@/lib/api'

export type OrderDisplaySortMode =
  | 'PRIORITY_OLDEST'
  | 'PRIORITY_NEWEST'
  | 'DONE_FIRST_OPEN_LAST'

export type OrderDisplayPreset = {
  name: string
  displayRole: OrderDisplayRole
  refreshIntervalSec: number
  sortMode: OrderDisplaySortMode
  doneAutoHideSec: number
  location: string
  announceOnMenuScreens: boolean
  menuAnnouncementDurationSec: number
  displayBackgroundColor: string
  orderCardBackgroundColor: string
  statusColorPendingPayment: string
  statusColorOpen: string
  statusColorPreparing: string
  statusColorDone: string
  showOrderAge: boolean
  showTerminalInfo: boolean
  showPaymentInfo: boolean
  showTotal: boolean
  showItems: boolean
  showStatusBadge: boolean
  showPickupNumber: boolean
  showOrderNumber: boolean
  autoScaleLayout: boolean
  pickupShowOnlyNumber: boolean
  pickupShowOpen: boolean
  pickupShowPreparing: boolean
  pickupShowDone: boolean
  statusAnimationMode: OrderDisplayStatusAnimationMode
  statusAnimationDurationMs: number
  orderAgeFontSize: number
  orderAgeAlertThresholdSec: number
  orderAgeAlertAnimationMode: OrderDisplayAgeAlertAnimationMode
  backgroundMediaMode: OrderDisplayBackgroundMediaMode
  backgroundMediaUrl: string | null
  notes: string
}

export const STANDARD_ORDER_DISPLAY_PRESETS: OrderDisplayPreset[] = [
  {
    name: 'Kassen-Display',
    displayRole: 'CASH',
    refreshIntervalSec: 5,
    sortMode: 'PRIORITY_OLDEST',
    doneAutoHideSec: 0,
    location: 'Kasse',
    announceOnMenuScreens: false,
    menuAnnouncementDurationSec: 45,
    displayBackgroundColor: '#020617',
    orderCardBackgroundColor: '#0f172a',
    statusColorPendingPayment: '#ef4444',
    statusColorOpen: '#f97316',
    statusColorPreparing: '#3b82f6',
    statusColorDone: '#16a34a',
    showOrderAge: true,
    showTerminalInfo: true,
    showPaymentInfo: true,
    showTotal: true,
    showItems: true,
    showStatusBadge: true,
    showPickupNumber: true,
    showOrderNumber: true,
    autoScaleLayout: true,
    pickupShowOnlyNumber: false,
    pickupShowOpen: true,
    pickupShowPreparing: true,
    pickupShowDone: true,
    statusAnimationMode: 'BLINK',
    statusAnimationDurationMs: 1800,
    orderAgeFontSize: 26,
    orderAgeAlertThresholdSec: 900,
    orderAgeAlertAnimationMode: 'BLINK',
    backgroundMediaMode: 'NONE',
    backgroundMediaUrl: null,
    notes: 'Zentrale Bearbeitung von Terminal-Bestellungen inkl. Zahlungsstatus',
  },
  {
    name: 'Kuechen-Display',
    displayRole: 'KITCHEN',
    refreshIntervalSec: 4,
    sortMode: 'PRIORITY_OLDEST',
    doneAutoHideSec: 0,
    location: 'Kueche',
    announceOnMenuScreens: false,
    menuAnnouncementDurationSec: 45,
    displayBackgroundColor: '#020617',
    orderCardBackgroundColor: '#0f172a',
    statusColorPendingPayment: '#ef4444',
    statusColorOpen: '#f97316',
    statusColorPreparing: '#3b82f6',
    statusColorDone: '#16a34a',
    showOrderAge: true,
    showTerminalInfo: true,
    showPaymentInfo: false,
    showTotal: false,
    showItems: true,
    showStatusBadge: true,
    showPickupNumber: true,
    showOrderNumber: true,
    autoScaleLayout: true,
    pickupShowOnlyNumber: false,
    pickupShowOpen: true,
    pickupShowPreparing: true,
    pickupShowDone: true,
    statusAnimationMode: 'PULSE',
    statusAnimationDurationMs: 1600,
    orderAgeFontSize: 30,
    orderAgeAlertThresholdSec: 720,
    orderAgeAlertAnimationMode: 'BLINK',
    backgroundMediaMode: 'NONE',
    backgroundMediaUrl: null,
    notes: 'Zubereitung von offenen Bestellungen',
  },
  {
    name: 'Abhol-Display',
    displayRole: 'PICKUP',
    refreshIntervalSec: 5,
    sortMode: 'DONE_FIRST_OPEN_LAST',
    doneAutoHideSec: 60,
    location: 'Ausgabe',
    announceOnMenuScreens: true,
    menuAnnouncementDurationSec: 60,
    displayBackgroundColor: '#020617',
    orderCardBackgroundColor: '#0f172a',
    statusColorPendingPayment: '#ef4444',
    statusColorOpen: '#f97316',
    statusColorPreparing: '#3b82f6',
    statusColorDone: '#16a34a',
    showOrderAge: true,
    showTerminalInfo: false,
    showPaymentInfo: false,
    showTotal: false,
    showItems: true,
    showStatusBadge: true,
    showPickupNumber: true,
    showOrderNumber: false,
    autoScaleLayout: true,
    pickupShowOnlyNumber: true,
    pickupShowOpen: true,
    pickupShowPreparing: true,
    pickupShowDone: true,
    statusAnimationMode: 'GLOW',
    statusAnimationDurationMs: 2200,
    orderAgeFontSize: 34,
    orderAgeAlertThresholdSec: 600,
    orderAgeAlertAnimationMode: 'PULSE',
    backgroundMediaMode: 'NONE',
    backgroundMediaUrl: null,
    notes: 'Fertige Bestellungen und Abholnummern',
  },
]

export function normalizeText(input: string) {
  const trimmed = input.trim()
  return trimmed.length > 0 ? trimmed : null
}

export function normalizeIdList(values: string[]) {
  return Array.from(new Set(values.map((entry) => entry.trim()).filter(Boolean)))
}

export function normalizeHexColorInput(input: string) {
  const value = input.trim().toLowerCase()
  return /^#[0-9a-f]{6}$/.test(value) ? value : null
}

export function roleLabel(role: OrderDisplayRole) {
  if (role === 'CASH') {
    return 'Kassen-Display'
  }

  if (role === 'PICKUP') {
    return 'Abhol-Display'
  }

  return 'Kuechen-Display'
}

export function sortModeLabel(mode: string) {
  if (mode === 'PRIORITY_NEWEST') {
    return 'Status + neueste zuerst'
  }

  if (mode === 'DONE_FIRST_OPEN_LAST') {
    return 'Fertig oben, Offen unten'
  }

  return 'Status + aelteste zuerst'
}

export function sortDisplays(entries: OrderDisplay[]) {
  const roleOrder: Record<OrderDisplayRole, number> = {
    CASH: 0,
    KITCHEN: 1,
    PICKUP: 2,
  }

  return [...entries].sort((left, right) => {
    const byRole = roleOrder[left.displayRole] - roleOrder[right.displayRole]
    if (byRole !== 0) {
      return byRole
    }
    return left.name.localeCompare(right.name, 'de-DE')
  })
}
