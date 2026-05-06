import { prisma } from './prisma'

function parseStoredIdList(value?: string | null) {
  if (!value) {
    return [] as string[]
  }

  return Array.from(
    new Set(
      value
        .split(',')
        .map((entry) => entry.trim())
        .filter((entry) => entry.length > 0)
    )
  )
}

function hasDisplayTerminalScope(sourceTerminalIds: string | null | undefined) {
  return typeof sourceTerminalIds === 'string' && sourceTerminalIds.trim().length > 0
}

type RoutingRole = 'CASH' | 'KITCHEN' | 'PICKUP'

export async function resolveDisplayRouting(params: {
  tenantId: string
  terminalId?: string | null
}) {
  const displays = await prisma.orderDisplay.findMany({
    where: {
      tenantId: params.tenantId,
      isActive: true,
      displayRole: {
        in: ['CASH', 'KITCHEN', 'PICKUP'],
      },
    },
    select: {
      id: true,
      displayRole: true,
      sourceTerminalIds: true,
      updatedAt: true,
      createdAt: true,
    },
    orderBy: [{ updatedAt: 'desc' }, { createdAt: 'desc' }],
  })

  function pickDisplayId(role: RoutingRole) {
    const candidates = displays.filter((entry) => entry.displayRole === role)
    if (candidates.length === 0) {
      return null
    }

    if (params.terminalId) {
      const scopedMatch = candidates.find((entry) =>
        parseStoredIdList(entry.sourceTerminalIds).includes(params.terminalId as string)
      )
      if (scopedMatch) {
        return scopedMatch.id
      }
    }

    const unrestricted = candidates.find((entry) => !hasDisplayTerminalScope(entry.sourceTerminalIds))
    return unrestricted?.id ?? candidates[0].id
  }

  return {
    cashDisplayId: pickDisplayId('CASH'),
    kitchenDisplayId: pickDisplayId('KITCHEN'),
    pickupDisplayId: pickDisplayId('PICKUP'),
  }
}
