import { OrderDisplayRole } from '@prisma/client'
import { prisma } from './prisma'

export const DISPLAY_STATUS_VALUES = new Set([
  'pending_payment',
  'open',
  'preparing',
  'out_for_delivery',
  'done',
  'archived',
])

export const DISPLAY_SORT_MODES = new Set([
  'PRIORITY_OLDEST',
  'PRIORITY_NEWEST',
  'DONE_FIRST_OPEN_LAST',
])

export const DISPLAY_STATUS_ANIMATION_MODES = new Set(['NONE', 'BLINK', 'PULSE', 'GLOW'])
export const DISPLAY_AGE_ALERT_ANIMATION_MODES = new Set(['NONE', 'BLINK', 'PULSE'])
export const DISPLAY_BACKGROUND_MEDIA_MODES = new Set(['NONE', 'IMAGE', 'VIDEO'])

export function normalizeText(input?: string | null) {
  if (input === undefined) {
    return undefined
  }

  if (input === null) {
    return null
  }

  const trimmed = input.trim()
  return trimmed.length > 0 ? trimmed : null
}

export function clampRefreshInterval(value?: number) {
  if (value === undefined || !Number.isFinite(value)) {
    return undefined
  }

  return Math.min(120, Math.max(3, Math.trunc(value)))
}

export function clampAnnouncementDuration(value?: number) {
  if (value === undefined || !Number.isFinite(value)) {
    return undefined
  }

  return Math.min(600, Math.max(10, Math.trunc(value)))
}

export function clampDoneAutoHide(value?: number) {
  if (value === undefined || !Number.isFinite(value)) {
    return undefined
  }

  return Math.min(3600, Math.max(0, Math.trunc(value)))
}

export function clampAnimationDuration(value?: number) {
  if (value === undefined || !Number.isFinite(value)) {
    return undefined
  }

  return Math.min(12000, Math.max(500, Math.trunc(value)))
}

export function clampOrderAgeFontSize(value?: number) {
  if (value === undefined || !Number.isFinite(value)) {
    return undefined
  }

  return Math.min(72, Math.max(12, Math.trunc(value)))
}

export function clampOrderAgeAlertThreshold(value?: number) {
  if (value === undefined || !Number.isFinite(value)) {
    return undefined
  }

  return Math.min(7200, Math.max(0, Math.trunc(value)))
}

export function normalizeColorHex(input?: string | null) {
  if (input === undefined) {
    return undefined
  }

  if (input === null) {
    return null
  }

  const trimmed = input.trim()
  if (!/^#[0-9A-Fa-f]{6}$/.test(trimmed)) {
    return null
  }

  return trimmed.toLowerCase()
}

export function normalizeIdList(input?: string[] | string | null) {
  if (input === undefined || input === null) {
    return [] as string[]
  }

  const rawItems = Array.isArray(input) ? input : input.split(',')
  return Array.from(new Set(rawItems.map((entry) => entry.trim()).filter((entry) => entry.length > 0)))
}

export function serializeIdList(ids: string[]) {
  return ids.length > 0 ? ids.join(',') : null
}

export function parseStoredIdList(value?: string | null) {
  return normalizeIdList(value || null)
}

type DisplayRecord = {
  id: string
  tenantId: string
  name: string
  displayCode: string
  displayRole: OrderDisplayRole
  location: string | null
  isActive: boolean
  refreshIntervalSec: number
  sortMode: string
  doneAutoHideSec: number
  sourceTerminalIds: string | null
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
  statusAnimationMode: string
  statusAnimationDurationMs: number
  orderAgeFontSize: number
  orderAgeAlertThresholdSec: number
  orderAgeAlertAnimationMode: string
  backgroundMediaMode: string
  backgroundMediaUrl: string | null
  notes: string | null
  createdAt: Date
  updatedAt: Date
}

export function mapDisplayOutput(display: DisplayRecord) {
  return {
    ...display,
    role: display.displayRole,
    sourceTerminalIds: parseStoredIdList(display.sourceTerminalIds),
  }
}

export function feedStatusesForDisplay(display: {
  displayRole: OrderDisplayRole
  pickupShowOpen: boolean
  pickupShowPreparing: boolean
  pickupShowDone: boolean
}) {
  if (display.displayRole === 'CASH') {
    return ['pending_payment', 'open', 'preparing', 'out_for_delivery', 'done']
  }

  if (display.displayRole === 'PICKUP') {
    const statuses: string[] = []
    if (display.pickupShowOpen) {
      statuses.push('open')
    }
    if (display.pickupShowPreparing) {
      statuses.push('preparing')
    }
    if (display.pickupShowDone) {
      statuses.push('done')
    }
    return statuses.length > 0 ? statuses : ['done']
  }

  return ['open', 'preparing']
}

export function roleOrderField(role: OrderDisplayRole) {
  if (role === 'CASH') {
    return 'cashDisplayId'
  }

  if (role === 'PICKUP') {
    return 'pickupDisplayId'
  }

  return 'kitchenDisplayId'
}

function generateDisplayCode() {
  const alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
  let output = 'OD-'

  for (let index = 0; index < 8; index += 1) {
    output += alphabet[Math.floor(Math.random() * alphabet.length)]
  }

  return output
}

export async function createUniqueDisplayCode() {
  for (let attempt = 0; attempt < 10; attempt += 1) {
    const code = generateDisplayCode()
    const existing = await prisma.orderDisplay.findUnique({
      where: { displayCode: code },
      select: { id: true },
    })

    if (!existing) {
      return code
    }
  }

  return `${generateDisplayCode()}${Date.now().toString().slice(-2)}`
}
