import { prisma } from './prisma'

function resolvePickupWindowStart(now: Date) {
  const start = new Date(now)
  if (now.getHours() >= 12) {
    start.setHours(12, 0, 0, 0)
  } else {
    start.setHours(0, 0, 0, 0)
  }
  return start
}

export async function generateNextPickupNumberForTenant(tenantId: string, now = new Date()) {
  const windowStart = resolvePickupWindowStart(now)

  const lastOrder = await prisma.order.findFirst({
    where: {
      tenantId,
      pickupNumber: {
        not: null,
      },
      createdAt: {
        gte: windowStart,
      },
    },
    select: {
      pickupNumber: true,
      createdAt: true,
    },
    orderBy: [{ createdAt: 'desc' }],
  })

  const last = lastOrder?.pickupNumber ?? 0
  return (last % 999) + 1
}

