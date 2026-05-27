import crypto from 'crypto'
import { PermissionKey } from '@prisma/client'
import { Router } from 'express'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { requirePermission } from '../middleware/auth'

const router = Router()

type MemoryArea = { id: string; tenantId: string; branchId: string | null; name: string; sortOrder: number }
type MemoryTable = {
  id: string
  tenantId: string
  branchId: string | null
  areaId: string | null
  tableNumber: string
  name: string | null
  seats: number
  qrCodeToken: string
  active: boolean
  status: 'FREE' | 'OCCUPIED' | 'WAITING_SERVICE' | 'WAITING_PAYMENT'
}
type MemorySession = {
  id: string
  tenantId: string
  branchId: string | null
  tableId: string
  status: 'OPEN' | 'ORDERING' | 'SERVED' | 'PAYMENT_REQUESTED' | 'CLOSED'
  openedAt: string
  closedAt: string | null
}
type MemoryCall = {
  id: string
  tenantId: string
  branchId: string | null
  tableId: string
  sessionId: string | null
  type: 'WAITER' | 'PAYMENT' | 'HELP' | 'CUTLERY' | 'CUSTOM'
  status: 'OPEN' | 'ACKNOWLEDGED' | 'DONE'
  message: string | null
  createdAt: string
  resolvedAt: string | null
}

const memoryStore = {
  areas: new Map<string, MemoryArea[]>(),
  tables: new Map<string, MemoryTable[]>(),
  sessions: new Map<string, MemorySession[]>(),
  calls: new Map<string, MemoryCall[]>(),
}

function normalizeText(value: unknown) {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function uid(prefix: string) {
  return `${prefix}_${crypto.randomBytes(10).toString('hex')}`
}

function getTenantCollections(tenantId: string) {
  if (!memoryStore.areas.has(tenantId)) memoryStore.areas.set(tenantId, [])
  if (!memoryStore.tables.has(tenantId)) memoryStore.tables.set(tenantId, [])
  if (!memoryStore.sessions.has(tenantId)) memoryStore.sessions.set(tenantId, [])
  if (!memoryStore.calls.has(tenantId)) memoryStore.calls.set(tenantId, [])
  return {
    areas: memoryStore.areas.get(tenantId)!,
    tables: memoryStore.tables.get(tenantId)!,
    sessions: memoryStore.sessions.get(tenantId)!,
    calls: memoryStore.calls.get(tenantId)!,
  }
}

function requireScopeTenantId(tenantId: string | null) {
  if (!tenantId) {
    throw new Error('tenantId fehlt')
  }
  return tenantId
}

router.get('/areas', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const branchId = normalizeText(req.query.branchId)
    const tenantId = requireScopeTenantId(scope.tenantId)
    const { areas } = getTenantCollections(tenantId)
    res.json({
      mode: 'FOUNDATION_ONLY',
      areas: areas.filter((area) => (!branchId ? true : area.branchId === branchId)).sort((a, b) => a.sortOrder - b.sortOrder),
    })
  } catch (error) {
    const scoped = asTenantScopeError(error)
    if (scoped) return res.status(scoped.status).json({ error: scoped.message })
    console.error('TABLE_ORDERING_AREAS_GET_FAILED', error)
    res.status(500).json({ error: 'Bereiche konnten nicht geladen werden.' })
  }
})

router.post('/areas', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.body?.tenantId)
    const name = normalizeText(req.body?.name)
    if (!name) return res.status(400).json({ error: 'Name ist erforderlich.' })
    const branchId = normalizeText(req.body?.branchId)
    const tenantId = requireScopeTenantId(scope.tenantId)
    const { areas } = getTenantCollections(tenantId)
    const area: MemoryArea = { id: uid('area'), tenantId, branchId, name, sortOrder: Number(req.body?.sortOrder) || 0 }
    areas.push(area)
    res.status(201).json({ mode: 'FOUNDATION_ONLY', area })
  } catch (error) {
    const scoped = asTenantScopeError(error)
    if (scoped) return res.status(scoped.status).json({ error: scoped.message })
    console.error('TABLE_ORDERING_AREAS_POST_FAILED', error)
    res.status(500).json({ error: 'Bereich konnte nicht erstellt werden.' })
  }
})

router.get('/tables', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const branchId = normalizeText(req.query.branchId)
    const tenantId = requireScopeTenantId(scope.tenantId)
    const { tables, areas } = getTenantCollections(tenantId)
    res.json({
      mode: 'FOUNDATION_ONLY',
      tables: tables
        .filter((table) => (!branchId ? true : table.branchId === branchId))
        .map((table) => ({ ...table, areaName: areas.find((area) => area.id === table.areaId)?.name ?? null })),
    })
  } catch (error) {
    const scoped = asTenantScopeError(error)
    if (scoped) return res.status(scoped.status).json({ error: scoped.message })
    console.error('TABLE_ORDERING_TABLES_GET_FAILED', error)
    res.status(500).json({ error: 'Tische konnten nicht geladen werden.' })
  }
})

router.post('/tables', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.body?.tenantId)
    const tableNumber = normalizeText(req.body?.tableNumber)
    if (!tableNumber) return res.status(400).json({ error: 'Tischnummer ist erforderlich.' })
    const branchId = normalizeText(req.body?.branchId)
    const areaId = normalizeText(req.body?.areaId)
    const tenantId = requireScopeTenantId(scope.tenantId)
    const { tables } = getTenantCollections(tenantId)
    const table: MemoryTable = {
      id: uid('table'),
      tenantId,
      branchId,
      areaId,
      tableNumber,
      name: normalizeText(req.body?.name),
      seats: Number(req.body?.seats) > 0 ? Number(req.body?.seats) : 2,
      qrCodeToken: uid('qr'),
      active: req.body?.active !== false,
      status: 'FREE',
    }
    tables.push(table)
    res.status(201).json({ mode: 'FOUNDATION_ONLY', table })
  } catch (error) {
    const scoped = asTenantScopeError(error)
    if (scoped) return res.status(scoped.status).json({ error: scoped.message })
    console.error('TABLE_ORDERING_TABLES_POST_FAILED', error)
    res.status(500).json({ error: 'Tisch konnte nicht erstellt werden.' })
  }
})

router.patch('/tables/:id', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.body?.tenantId)
    const tenantId = requireScopeTenantId(scope.tenantId)
    const { tables } = getTenantCollections(tenantId)
    const table = tables.find((entry) => entry.id === req.params.id)
    if (!table) return res.status(404).json({ error: 'Tisch nicht gefunden.' })

    table.areaId = normalizeText(req.body?.areaId) ?? table.areaId
    table.tableNumber = normalizeText(req.body?.tableNumber) ?? table.tableNumber
    table.name = normalizeText(req.body?.name)
    table.seats = Number(req.body?.seats) > 0 ? Number(req.body?.seats) : table.seats
    if (typeof req.body?.active === 'boolean') table.active = req.body.active
    if (typeof req.body?.status === 'string') table.status = req.body.status

    res.json({ mode: 'FOUNDATION_ONLY', table })
  } catch (error) {
    const scoped = asTenantScopeError(error)
    if (scoped) return res.status(scoped.status).json({ error: scoped.message })
    console.error('TABLE_ORDERING_TABLES_PATCH_FAILED', error)
    res.status(500).json({ error: 'Tisch konnte nicht aktualisiert werden.' })
  }
})

router.get('/session/:qrCodeToken', async (req, res) => {
  const token = normalizeText(req.params.qrCodeToken)
  if (!token) return res.status(400).json({ error: 'Ungültiger QR-Code.' })

  for (const [tenantId, tables] of memoryStore.tables.entries()) {
    const table = tables.find((entry) => entry.qrCodeToken === token && entry.active)
    if (!table) continue
    const { sessions, areas } = getTenantCollections(tenantId)
    const session = sessions.find((entry) => entry.tableId === table.id && entry.status !== 'CLOSED') ?? null
    return res.json({
      mode: 'FOUNDATION_ONLY',
      tenant: { id: tenantId, name: 'Tenant' },
      table: { ...table, areaName: areas.find((area) => area.id === table.areaId)?.name ?? null },
      session,
    })
  }

  return res.status(404).json({ error: 'Tisch nicht gefunden.' })
})

router.post('/session/:qrCodeToken/start', async (req, res) => {
  const token = normalizeText(req.params.qrCodeToken)
  if (!token) return res.status(400).json({ error: 'Ungültiger QR-Code.' })

  for (const [tenantId, tables] of memoryStore.tables.entries()) {
    const table = tables.find((entry) => entry.qrCodeToken === token && entry.active)
    if (!table) continue
    const { sessions } = getTenantCollections(tenantId)
    const existing = sessions.find((entry) => entry.tableId === table.id && entry.status !== 'CLOSED')
    if (existing) return res.json({ mode: 'FOUNDATION_ONLY', session: existing, reused: true })

    const session: MemorySession = {
      id: uid('session'),
      tenantId,
      branchId: table.branchId,
      tableId: table.id,
      status: 'OPEN',
      openedAt: new Date().toISOString(),
      closedAt: null,
    }
    sessions.push(session)
    table.status = 'OCCUPIED'
    return res.status(201).json({ mode: 'FOUNDATION_ONLY', session, reused: false })
  }

  return res.status(404).json({ error: 'Tisch nicht gefunden.' })
})

router.post('/session/:qrCodeToken/service-call', async (req, res) => {
  const token = normalizeText(req.params.qrCodeToken)
  if (!token) return res.status(400).json({ error: 'Ungültiger QR-Code.' })

  for (const [tenantId, tables] of memoryStore.tables.entries()) {
    const table = tables.find((entry) => entry.qrCodeToken === token && entry.active)
    if (!table) continue
    const { sessions, calls } = getTenantCollections(tenantId)
    const session = sessions.find((entry) => entry.tableId === table.id && entry.status !== 'CLOSED')
    if (!session) return res.status(400).json({ error: 'Keine aktive Tisch-Session.' })

    const typeRaw = (normalizeText(req.body?.type) ?? 'WAITER').toUpperCase()
    const type: MemoryCall['type'] =
      typeRaw === 'PAYMENT' || typeRaw === 'HELP' || typeRaw === 'CUTLERY' || typeRaw === 'CUSTOM' ? typeRaw : 'WAITER'

    const openCalls = calls.filter((entry) => entry.tableId === table.id && entry.status === 'OPEN')
    const latestOpen = openCalls.length > 0 ? openCalls[openCalls.length - 1] : null
    if (latestOpen && Date.now() - new Date(latestOpen.createdAt).getTime() < 10_000) {
      return res.status(429).json({ error: 'Bitte kurz warten, bevor erneut gerufen wird.' })
    }

    const call: MemoryCall = {
      id: uid('call'),
      tenantId,
      branchId: table.branchId,
      tableId: table.id,
      sessionId: session.id,
      type,
      status: 'OPEN',
      message: normalizeText(req.body?.message),
      createdAt: new Date().toISOString(),
      resolvedAt: null,
    }

    calls.push(call)
    table.status = type === 'PAYMENT' ? 'WAITING_PAYMENT' : 'WAITING_SERVICE'
    if (type === 'PAYMENT') session.status = 'PAYMENT_REQUESTED'
    return res.status(201).json({ mode: 'FOUNDATION_ONLY', serviceCall: call })
  }

  return res.status(404).json({ error: 'Tisch nicht gefunden.' })
})

router.post('/session/:qrCodeToken/payment-request', async (req, res) => {
  const token = normalizeText(req.params.qrCodeToken)
  if (!token) return res.status(400).json({ error: 'Ungültiger QR-Code.' })

  for (const [tenantId, tables] of memoryStore.tables.entries()) {
    const table = tables.find((entry) => entry.qrCodeToken === token && entry.active)
    if (!table) continue
    const { sessions, calls } = getTenantCollections(tenantId)
    const session = sessions.find((entry) => entry.tableId === table.id && entry.status !== 'CLOSED')
    if (!session) return res.status(400).json({ error: 'Keine aktive Tisch-Session.' })

    const call: MemoryCall = {
      id: uid('call'),
      tenantId,
      branchId: table.branchId,
      tableId: table.id,
      sessionId: session.id,
      type: 'PAYMENT',
      status: 'OPEN',
      message: normalizeText(req.body?.message) ?? 'Rechnung angefordert',
      createdAt: new Date().toISOString(),
      resolvedAt: null,
    }

    calls.push(call)
    table.status = 'WAITING_PAYMENT'
    session.status = 'PAYMENT_REQUESTED'
    return res.status(201).json({ mode: 'FOUNDATION_ONLY', serviceCall: call })
  }

  return res.status(404).json({ error: 'Tisch nicht gefunden.' })
})

export default router
