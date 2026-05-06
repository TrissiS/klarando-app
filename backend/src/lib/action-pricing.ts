import { ActionKind, ActionValueType } from '@prisma/client'
import { prisma } from './prisma'

type ActionPricingSource = {
  id: string
  name: string
  displayAsMenu: boolean
  kind: ActionKind
  valueType: ActionValueType
  value: number
  isActive: boolean
  startAt: Date | null
  endAt: Date | null
  weeklyDays: string | null
  dailyStartTime: string | null
  dailyEndTime: string | null
  productIds: string[]
}

export type ProductPriceOffer = {
  productId: string
  originalPrice: number
  effectivePrice: number
  hasOffer: boolean
  actionId: string | null
  actionName: string | null
  actionValueType: ActionValueType | null
  actionValue: number | null
}

function parseWeeklyDays(raw: string | null): number[] {
  if (!raw) {
    return []
  }

  return raw
    .split(',')
    .map((entry) => Number(entry))
    .filter((entry) => Number.isInteger(entry) && entry >= 1 && entry <= 7)
}

function parseTime(raw: string | null) {
  if (!raw || !/^\d{2}:\d{2}$/.test(raw)) {
    return null
  }

  const [hourText, minuteText] = raw.split(':')
  const hour = Number(hourText)
  const minute = Number(minuteText)
  if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
    return null
  }

  return `${hourText}:${minuteText}`
}

function currentTimeHHMM(date = new Date()) {
  const hour = String(date.getHours()).padStart(2, '0')
  const minute = String(date.getMinutes()).padStart(2, '0')
  return `${hour}:${minute}`
}

function isActionCurrentlyActive(action: ActionPricingSource, now = new Date()) {
  if (!action.isActive) {
    return false
  }

  if (action.startAt && now < action.startAt) {
    return false
  }

  if (action.endAt && now > action.endAt) {
    return false
  }

  const startTime = parseTime(action.dailyStartTime)
  const endTime = parseTime(action.dailyEndTime)
  if (startTime && endTime) {
    const nowHHMM = currentTimeHHMM(now)
    if (nowHHMM < startTime || nowHHMM > endTime) {
      return false
    }
  }

  if (action.kind === ActionKind.WEEKLY) {
    const weekday = now.getDay() === 0 ? 7 : now.getDay()
    const allowed = parseWeeklyDays(action.weeklyDays)
    if (allowed.length === 0 || !allowed.includes(weekday)) {
      return false
    }
  }

  return true
}

function calculateActionPrice(basePrice: number, action: Pick<ActionPricingSource, 'valueType' | 'value'>) {
  if (action.valueType === ActionValueType.FIXED_PRICE) {
    return Math.max(0, action.value)
  }

  const factor = 1 - action.value / 100
  return Math.max(0, basePrice * factor)
}

export async function resolveProductOffers(
  tenantId: string,
  products: Array<{ id: string; price: number }>
) {
  const byProductId = new Map<string, ProductPriceOffer>()
  if (products.length === 0) {
    return byProductId
  }

  for (const product of products) {
    byProductId.set(product.id, {
      productId: product.id,
      originalPrice: product.price,
      effectivePrice: product.price,
      hasOffer: false,
      actionId: null,
      actionName: null,
      actionValueType: null,
      actionValue: null,
    })
  }

  const productIds = products.map((entry) => entry.id)
  const actions = await prisma.action.findMany({
    where: {
      tenantId,
      isActive: true,
      products: {
        some: {
          productId: {
            in: productIds,
          },
        },
      },
    },
    select: {
      id: true,
      name: true,
      displayAsMenu: true,
      kind: true,
      valueType: true,
      value: true,
      isActive: true,
      startAt: true,
      endAt: true,
      weeklyDays: true,
      dailyStartTime: true,
      dailyEndTime: true,
      products: {
        select: {
          productId: true,
        },
      },
    },
  })

  const now = new Date()
  for (const action of actions) {
    const source: ActionPricingSource = {
      ...action,
      value: Number(action.value),
      productIds: action.products.map((entry) => entry.productId),
    }

    if (!isActionCurrentlyActive(source, now)) {
      continue
    }
    if (source.displayAsMenu) {
      continue
    }

    for (const productId of source.productIds) {
      const current = byProductId.get(productId)
      if (!current) {
        continue
      }

      const calculated = calculateActionPrice(current.originalPrice, source)
      const rounded = Number(calculated.toFixed(2))
      const candidate = Math.min(current.originalPrice, rounded)
      if (candidate >= current.effectivePrice) {
        continue
      }

      byProductId.set(productId, {
        ...current,
        effectivePrice: candidate,
        hasOffer: true,
        actionId: source.id,
        actionName: source.name,
        actionValueType: source.valueType,
        actionValue: source.value,
      })
    }
  }

  return byProductId
}
