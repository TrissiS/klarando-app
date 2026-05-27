import { Router } from 'express'
import { prisma } from '../lib/prisma'

const router = Router()

function normalizeCodeParam(value: string | string[] | undefined) {
  if (Array.isArray(value)) {
    return value[0]?.trim().toUpperCase() || ''
  }
  return value?.trim().toUpperCase() || ''
}

type Role = 'KITCHEN' | 'PICKUP' | 'CASH'

async function buildOrderDisplayRuntimeByRole(deviceCode: string, role: Role) {
  const display = await prisma.orderDisplay.findUnique({
    where: { displayCode: deviceCode },
    select: {
      id: true,
      tenantId: true,
      name: true,
      displayCode: true,
      displayRole: true,
      isActive: true,
      refreshIntervalSec: true,
      showPaymentInfo: true,
      showItems: true,
      showPickupNumber: true,
      statusColorOpen: true,
      statusColorPreparing: true,
      statusColorDone: true,
      statusColorPendingPayment: true,
      displayBackgroundColor: true,
      orderCardBackgroundColor: true,
      pickupShowOpen: true,
      pickupShowPreparing: true,
      pickupShowDone: true,
    },
  })
  if (!display || display.displayRole !== role) return null

  const orderWhereBase = { tenantId: display.tenantId }
  const roleWhere =
    role === 'KITCHEN'
      ? { kitchenDisplayId: display.id }
      : role === 'PICKUP'
        ? { pickupDisplayId: display.id }
        : { cashDisplayId: display.id }

  const orders = await prisma.order.findMany({
    where: {
      ...orderWhereBase,
      ...roleWhere,
    },
    select: {
      id: true,
      customerName: true,
      pickupNumber: true,
      status: true,
      total: true,
      paymentStatus: true,
      createdAt: true,
      estimatedReadyAt: true,
      items: {
        select: {
          quantity: true,
          product: {
            select: {
              name: true,
            },
          },
        },
      },
      tableId: true,
    },
    orderBy: [{ createdAt: 'asc' }],
    take: 150,
  })

  return {
    display: {
      id: display.id,
      displayCode: display.displayCode,
      name: display.name,
      role: display.displayRole,
      isActive: display.isActive,
      refreshIntervalSec: display.refreshIntervalSec,
      showPaymentInfo: display.showPaymentInfo,
      showItems: display.showItems,
      showPickupNumber: display.showPickupNumber,
      displayBackgroundColor: display.displayBackgroundColor,
      orderCardBackgroundColor: display.orderCardBackgroundColor,
      statusColors: {
        open: display.statusColorOpen,
        preparing: display.statusColorPreparing,
        done: display.statusColorDone,
        pendingPayment: display.statusColorPendingPayment,
      },
      pickupVisibility: {
        open: display.pickupShowOpen,
        preparing: display.pickupShowPreparing,
        done: display.pickupShowDone,
      },
    },
    orders,
    serviceCalls: [],
    serverTime: new Date().toISOString(),
  }
}

router.get('/kitchen-display/:deviceCode/runtime', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) return res.status(400).json({ error: 'deviceCode fehlt' })
    const runtime = await buildOrderDisplayRuntimeByRole(code, 'KITCHEN')
    if (!runtime) return res.status(404).json({ error: 'Küchen-Display nicht gefunden' })
    return res.json({
      primary: true,
      route: '/api/kitchen-display/:deviceCode/runtime',
      displayType: 'KITCHEN_DISPLAY',
      ...runtime,
    })
  } catch (error) {
    console.error('GET KITCHEN DISPLAY RUNTIME ERROR:', error)
    return res.status(500).json({ error: 'Küchen-Display Runtime konnte nicht geladen werden' })
  }
})

router.get('/pickup-display/:deviceCode/runtime', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) return res.status(400).json({ error: 'deviceCode fehlt' })
    const runtime = await buildOrderDisplayRuntimeByRole(code, 'PICKUP')
    if (!runtime) return res.status(404).json({ error: 'Abhol-Display nicht gefunden' })
    return res.json({
      primary: true,
      route: '/api/pickup-display/:deviceCode/runtime',
      displayType: 'PICKUP_DISPLAY',
      ...runtime,
    })
  } catch (error) {
    console.error('GET PICKUP DISPLAY RUNTIME ERROR:', error)
    return res.status(500).json({ error: 'Abhol-Display Runtime konnte nicht geladen werden' })
  }
})

router.get('/cashier-display/:deviceCode/runtime', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) return res.status(400).json({ error: 'deviceCode fehlt' })
    const runtime = await buildOrderDisplayRuntimeByRole(code, 'CASH')
    if (!runtime) return res.status(404).json({ error: 'Kassen-Display nicht gefunden' })
    return res.json({
      primary: true,
      route: '/api/cashier-display/:deviceCode/runtime',
      displayType: 'CASHIER_DISPLAY',
      ...runtime,
    })
  } catch (error) {
    console.error('GET CASHIER DISPLAY RUNTIME ERROR:', error)
    return res.status(500).json({ error: 'Kassen-Display Runtime konnte nicht geladen werden' })
  }
})

export default router
