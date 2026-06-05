function normalizeOptionalText(value: unknown) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeDriverLabel(value: string | null | undefined) {
  const normalized = normalizeOptionalText(value)
  return normalized ? normalized.toLowerCase() : null
}

export function resolveDriverAssignmentIdentity(input: {
  driverUserId?: string | null
  driverName?: string | null
  canonicalDriverName?: string | null
}) {
  const assignedDriverId = normalizeOptionalText(input.driverUserId)
  const assignedDriverName = assignedDriverId
    ? normalizeOptionalText(input.canonicalDriverName) ?? normalizeOptionalText(input.driverName)
    : normalizeOptionalText(input.driverName) ?? normalizeOptionalText(input.canonicalDriverName)

  return {
    assignedDriverId: assignedDriverId ?? null,
    assignedDriverName: assignedDriverName ?? null,
  }
}

export function isDriverAssignmentMatch(
  order: {
    assignedDriverId: string | null
    assignedDriverName: string | null
  },
  actor: {
    driverUserId: string | null
    driverName: string | null
  }
) {
  const assignedDriverId = normalizeOptionalText(order.assignedDriverId)
  const actorDriverUserId = normalizeOptionalText(actor.driverUserId)

  if (actorDriverUserId) {
    if (assignedDriverId === actorDriverUserId) {
      return true
    }

    if (assignedDriverId) {
      return false
    }
  }

  const assignedName = normalizeDriverLabel(order.assignedDriverName)
  const actorName = normalizeDriverLabel(actor.driverName)
  if (!assignedName || !actorName) {
    return false
  }

  return assignedName === actorName
}

export function buildDriverAssignmentLookup(actor: {
  driverUserId: string | null
  driverName: string | null
}) {
  const driverUserId = normalizeOptionalText(actor.driverUserId)
  const driverName = normalizeOptionalText(actor.driverName)

  if (driverUserId) {
    const clauses: Array<Record<string, unknown>> = [{ assignedDriverId: driverUserId }]
    if (driverName) {
      clauses.push({
        assignedDriverId: null,
        assignedDriverName: driverName,
      })
    }
    return clauses
  }

  if (!driverName) {
    return []
  }

  return [
    {
      assignedDriverId: null,
      assignedDriverName: driverName,
    },
  ]
}
