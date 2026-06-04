import { Request, Router } from 'express'
import {
  BillingUsageCounterKey,
  BillingPeriodType,
  BillingPlanType,
  FeatureModuleKey,
  FeeBearer,
  PermissionKey,
  Prisma,
  UserRole,
} from '@prisma/client'
import { prisma } from '../lib/prisma'
import { hashPassword } from '../auth/password'
import { getDefaultPermissions } from '../auth/permissions'
import { signOrderDeskDeviceToken } from '../auth/orderdesk-device-token'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import {
  calculateBillingUsageSnapshot,
  FEATURE_MODULE_REGISTRY,
  FEATURE_PACKAGES,
  moduleKeyFromString,
  resolveEffectiveFeatureSetForTenant,
} from '../lib/feature-modules'
import { parseDisplayMetaFromNotes } from '../lib/display-performance-mode'
import { listDriverDeviceSessionsForTenant } from '../lib/driver-device-sessions'

const router = Router()
const ALL_PERMISSIONS = Object.values(PermissionKey)
const ALL_USER_ROLES = Object.values(UserRole)
let cachedSupportedUserRoles: Set<UserRole> | null = null
let supportedUserRolesPromise: Promise<Set<UserRole>> | null = null

async function loadSupportedUserRoles() {
  if (cachedSupportedUserRoles) {
    return cachedSupportedUserRoles
  }

  if (supportedUserRolesPromise) {
    return supportedUserRolesPromise
  }

  supportedUserRolesPromise = (async () => {
    try {
      const rows = await prisma.$queryRawUnsafe<Array<{ role: string }>>(
        'SELECT unnest(enum_range(NULL::\"UserRole\"))::text AS role'
      )
      const resolved = new Set<UserRole>()
      for (const row of rows) {
        if (ALL_USER_ROLES.includes(row.role as UserRole)) {
          resolved.add(row.role as UserRole)
        }
      }

      if (resolved.size === 0) {
        cachedSupportedUserRoles = new Set(ALL_USER_ROLES)
      } else {
        cachedSupportedUserRoles = resolved
      }
    } catch (error) {
      console.warn('LOAD SUPPORTED USER ROLES ERROR:', error)
      cachedSupportedUserRoles = new Set(ALL_USER_ROLES)
    } finally {
      supportedUserRolesPromise = null
    }

    return cachedSupportedUserRoles as Set<UserRole>
  })()

  return supportedUserRolesPromise
}

async function isUserRoleSupported(role: UserRole) {
  const roles = await loadSupportedUserRoles()
  return roles.has(role)
}

function resolvePublicApiBaseUrl() {
  const candidate =
    typeof process.env.PUBLIC_API_BASE_URL === 'string'
      ? process.env.PUBLIC_API_BASE_URL.trim()
      : typeof process.env.NEXT_PUBLIC_API_BASE_URL === 'string'
        ? process.env.NEXT_PUBLIC_API_BASE_URL.trim()
        : typeof process.env.NEXT_PUBLIC_API_URL === 'string'
          ? process.env.NEXT_PUBLIC_API_URL.trim()
          : ''
  if (!candidate) {
    return 'https://api.klarando.com'
  }
  return candidate.replace(/\/+$/, '')
}

function encodeOrderDeskPairingPayload(payload: Record<string, unknown>) {
  const jsonPayload = JSON.stringify(payload)
  const hexPayload = Buffer.from(jsonPayload, 'utf8').toString('hex').toUpperCase()
  return `KOD${hexPayload}`
}

const DISPLAY_STATUS_ONLINE_MS = 60_000
const ORDERDESK_PAIRING_SESSION_MS = 15 * 60 * 1000
const DISPLAY_MANAGEMENT_TYPES = new Set([
  'MENU',
  'OFFERS',
  'PICKUP_NUMBERS',
  'KITCHEN',
  'ADVERTISING',
  'MIXED',
])

type DisplayManagementType =
  | 'MENU'
  | 'OFFERS'
  | 'PICKUP_NUMBERS'
  | 'KITCHEN'
  | 'ADVERTISING'
  | 'MIXED'

type DisplayManagementStatus = 'online' | 'offline' | 'inactive'

type DisplaySourceKind = 'ORDER_DISPLAY' | 'SCREEN_DEVICE' | 'DISPLAY_DEVICE'

type DisplayRecord = {
  id: string
  entityId: string
  sourceKind: DisplaySourceKind
  screenId: string | null
  tenantId: string
  tenantName: string | null
  chainId: string | null
  chainName: string | null
  name: string
  displayType: DisplayManagementType
  code: string
  isActive: boolean
  lastSeenAt: string | null
  lastSyncAt: string | null
  resolution: string | null
  deviceInfo: {
    alias: string | null
    model: string | null
    platform: string | null
    appVersion: string | null
    source: 'ORDERDESK_BINDING' | 'SCREEN_DEVICE' | 'DISPLAY_DEVICE'
    diagnostics?: {
      effectiveResolution: string | null
      devicePixelRatio: number | null
      orientation: string | null
      fullscreenSupported: boolean | null
      touchSupported: boolean | null
      estimatedPerformanceClass: string | null
      supportedVideoFormats: string[]
      recommendedResolution: string | null
      lastDiagnosticsAt: string | null
    } | null
  } | null
  status: DisplayManagementStatus
  previewPath: string
  editablePath: string
  pairingSupported: boolean
}

function parseDisplayManagementType(value: unknown): DisplayManagementType | null {
  if (typeof value !== 'string') {
    return null
  }
  const normalized = value.trim().toUpperCase()
  return DISPLAY_MANAGEMENT_TYPES.has(normalized)
    ? (normalized as DisplayManagementType)
    : null
}

function mapOrderDisplayRoleToType(role: 'CASH' | 'KITCHEN' | 'PICKUP'): DisplayManagementType {
  if (role === 'KITCHEN') {
    return 'KITCHEN'
  }
  if (role === 'PICKUP') {
    return 'PICKUP_NUMBERS'
  }
  return 'MIXED'
}

function parseScreenDeviceType(value: unknown, fallbackName: string): DisplayManagementType {
  if (typeof value === 'string') {
    const direct = parseDisplayManagementType(value)
    if (direct) {
      return direct
    }
  }

  const loweredName = fallbackName.trim().toLowerCase()
  if (loweredName.includes('angebot')) {
    return 'OFFERS'
  }
  if (loweredName.includes('werbung') || loweredName.includes('ad')) {
    return 'ADVERTISING'
  }
  if (loweredName.includes('abhol')) {
    return 'PICKUP_NUMBERS'
  }

  return 'MENU'
}

function computeDisplayStatus(
  isActive: boolean,
  lastSeenAt: Date | string | null | undefined
): DisplayManagementStatus {
  if (!isActive) {
    return 'inactive'
  }

  if (!lastSeenAt) {
    return 'offline'
  }

  const parsed = lastSeenAt instanceof Date ? lastSeenAt : new Date(lastSeenAt)
  if (Number.isNaN(parsed.getTime())) {
    return 'offline'
  }

  return Date.now() - parsed.getTime() <= DISPLAY_STATUS_ONLINE_MS ? 'online' : 'offline'
}

function parseDisplayRef(input: string | null | undefined) {
  if (!input) {
    return null
  }
  const trimmed = input.trim()
  if (trimmed.startsWith('order:')) {
    const entityId = trimmed.slice('order:'.length).trim()
    return entityId ? { sourceKind: 'ORDER_DISPLAY' as const, entityId } : null
  }
  if (trimmed.startsWith('screen:')) {
    const entityId = trimmed.slice('screen:'.length).trim()
    return entityId ? { sourceKind: 'SCREEN_DEVICE' as const, entityId } : null
  }
  return null
}

function createOrderDeskPairingSessionId() {
  const randomPart = Math.random().toString(36).slice(2, 10)
  return `odpk_${Date.now().toString(36)}_${randomPart}`
}

function parseRole(value?: string) {
  if (!value) {
    return null
  }

  if (ALL_USER_ROLES.includes(value as UserRole)) {
    return value as UserRole
  }

  return null
}

function parsePermissions(values: unknown) {
  if (!Array.isArray(values)) {
    return null
  }

  const parsed: PermissionKey[] = []

  for (const raw of values) {
    if (typeof raw !== 'string') {
      return null
    }

    if (!ALL_PERMISSIONS.includes(raw as PermissionKey)) {
      return null
    }

    parsed.push(raw as PermissionKey)
  }

  return Array.from(new Set(parsed))
}

function parsePositiveInt(value: unknown, fallback: number, max: number) {
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return fallback
  }
  return Math.min(Math.max(Math.round(parsed), 1), max)
}

function parseOptionalBoolean(value: unknown) {
  if (typeof value === 'boolean') {
    return value
  }

  if (typeof value === 'string') {
    const lowered = value.trim().toLowerCase()
    if (lowered === 'true' || lowered === '1' || lowered === 'yes') {
      return true
    }
    if (lowered === 'false' || lowered === '0' || lowered === 'no') {
      return false
    }
  }

  return null
}

function parseScopedId(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const trimmed = value.trim()
  return trimmed.length > 0 ? trimmed : null
}

function parseFeatureModuleKey(value: unknown) {
  return moduleKeyFromString(value)
}

function parseOptionalInt(value: unknown) {
  if (value === null || value === undefined || value === '') {
    return null
  }
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return null
  }
  return Math.round(parsed)
}

function parseOptionalDecimal(value: unknown) {
  if (value === null || value === undefined || value === '') {
    return null
  }
  const parsed = Number(value)
  if (!Number.isFinite(parsed)) {
    return null
  }
  return parsed
}

function parseBillingPlanType(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const normalized = value.trim().toUpperCase()
  const parsed = normalized as BillingPlanType
  return Object.values(BillingPlanType).includes(parsed) ? parsed : null
}

function parseBillingPeriodType(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const normalized = value.trim().toUpperCase()
  const parsed = normalized as BillingPeriodType
  return Object.values(BillingPeriodType).includes(parsed) ? parsed : null
}

function parseFeeBearer(value: unknown) {
  if (typeof value !== 'string') {
    return null
  }
  const normalized = value.trim().toUpperCase()
  const parsed = normalized as FeeBearer
  return Object.values(FeeBearer).includes(parsed) ? parsed : null
}

function ensureSuperadmin(req: Request) {
  if (req.authUser?.role !== UserRole.SUPERADMIN) {
    return 'Nur Superadmin darf diese Aktion ausfuehren'
  }
  return null
}

function canManageUsersRole(role: UserRole | undefined) {
  return role === UserRole.SUPERADMIN || role === UserRole.CHAINADMIN || role === UserRole.ADMIN
}

function enforceTargetUserAccess(
  req: Request,
  target: {
    id: string
    role: UserRole
    chainId: string | null
    tenantId: string | null
  },
  mode: 'read' | 'write'
) {
  const actor = req.authUser

  if (!actor) {
    return null
  }

  if (actor.role === UserRole.SUPERADMIN) {
    return null
  }

  if (actor.role === UserRole.CHAINADMIN) {
    if (!actor.chainId || target.chainId !== actor.chainId) {
      return 'Kein Zugriff auf diesen Benutzer'
    }

    if (
      mode === 'write' &&
      (target.role === UserRole.SUPERADMIN || target.role === UserRole.CHAINADMIN)
    ) {
      return 'CHAINADMIN darf diese Rolle nicht bearbeiten'
    }

    return null
  }

  if (actor.role === UserRole.ADMIN) {
    if (!actor.tenantId || target.tenantId !== actor.tenantId) {
      return 'Kein Zugriff auf diesen Benutzer'
    }

    if (mode === 'write' && target.role !== UserRole.STAFF && target.role !== UserRole.DRIVER) {
      return 'ADMIN darf nur STAFF/DRIVER bearbeiten'
    }

    return null
  }

  if (actor.id !== target.id) {
    return 'Kein Zugriff auf diesen Benutzer'
  }

  return null
}

async function resolveEffectivePermissionsForUser(userId: string, role: UserRole) {
  const dbRolePermissions = await prisma.rolePermission.findMany({
    where: { role },
    select: { permission: true },
  })

  const defaultPermissions =
    dbRolePermissions.length > 0
      ? dbRolePermissions.map((entry) => entry.permission)
      : getDefaultPermissions(role)

  const userOverrides = await prisma.userPermission.findMany({
    where: { userId },
    select: { permission: true, allowed: true },
  })

  const effective = new Set<PermissionKey>(defaultPermissions)

  for (const entry of userOverrides) {
    if (entry.allowed) {
      effective.add(entry.permission)
      continue
    }

    effective.delete(entry.permission)
  }

  return Array.from(effective).sort()
}

function enforceUserScope(req: Request, where: Record<string, unknown>) {
  const user = req.authUser

  if (!user) {
    return where
  }

  if (user.role === UserRole.CHAINADMIN && user.chainId) {
    return { ...where, chainId: user.chainId }
  }

  if (user.role === UserRole.ADMIN && user.tenantId) {
    return { ...where, tenantId: user.tenantId }
  }

  if (user.role === UserRole.STAFF) {
    return { ...where, id: user.id }
  }

  if (user.role === UserRole.DRIVER) {
    return { ...where, id: user.id }
  }

  return where
}

function enforceTenantScope(req: Request, where: Record<string, unknown>) {
  const user = req.authUser

  if (!user) {
    return where
  }

  if (user.role === UserRole.CHAINADMIN && user.chainId) {
    return { ...where, chainId: user.chainId }
  }

  if (
    (user.role === UserRole.ADMIN || user.role === UserRole.STAFF || user.role === UserRole.DRIVER) &&
    user.tenantId
  ) {
    return { ...where, id: user.tenantId }
  }

  return where
}

function enforceAuditScope(req: Request, where: Record<string, unknown>) {
  const user = req.authUser

  if (!user) {
    return where
  }

  if (user.role === UserRole.CHAINADMIN && user.chainId) {
    return { ...where, chainId: user.chainId }
  }

  if (
    (user.role === UserRole.ADMIN || user.role === UserRole.STAFF || user.role === UserRole.DRIVER) &&
    user.tenantId
  ) {
    return { ...where, tenantId: user.tenantId }
  }

  return where
}

async function loadDisplayOverviewRows(tenantIds: string[]) {
  const [orderDisplays, screenDevices, orderDeskBindings, displayDevices] = await Promise.all([
    prisma.orderDisplay.findMany({
      where: {
        tenantId: {
          in: tenantIds,
        },
      },
      select: {
        id: true,
        tenantId: true,
        name: true,
        displayCode: true,
        displayRole: true,
        isActive: true,
        updatedAt: true,
        tenant: {
          select: {
            id: true,
            name: true,
            chainId: true,
            chain: {
              select: {
                id: true,
                name: true,
              },
            },
          },
        },
      },
      orderBy: [{ tenantId: 'asc' }, { name: 'asc' }],
    }),
    prisma.screenDevice.findMany({
      where: {
        tenantId: {
          in: tenantIds,
        },
      },
      select: {
        id: true,
        tenantId: true,
        name: true,
        deviceCode: true,
        isActive: true,
        resolutionWidth: true,
        resolutionHeight: true,
        orientation: true,
        notes: true,
        lastSeenAt: true,
        updatedAt: true,
        tenant: {
          select: {
            id: true,
            name: true,
            chainId: true,
            chain: {
              select: {
                id: true,
                name: true,
              },
            },
          },
        },
      },
      orderBy: [{ tenantId: 'asc' }, { name: 'asc' }],
    }),
    prisma.orderDeskDeviceBinding.findMany({
      where: {
        tenantId: {
          in: tenantIds,
        },
      },
      select: {
        id: true,
        tenantId: true,
        displayId: true,
        isActive: true,
        deviceAlias: true,
        deviceModel: true,
        devicePlatform: true,
        appVersion: true,
        lastSeenAt: true,
        updatedAt: true,
      },
      orderBy: [{ updatedAt: 'desc' }],
    }),
    prisma.displayDevice.findMany({
      where: {
        tenantId: {
          in: tenantIds,
        },
        revokedAt: null,
      },
      select: {
        id: true,
        tenantId: true,
        name: true,
        status: true,
        screenId: true,
        lastSeenAt: true,
        appVersion: true,
        platform: true,
        updatedAt: true,
        screen: {
          select: {
            id: true,
            name: true,
            orientation: true,
            resolutionPreset: true,
            layoutType: true,
          },
        },
        tenant: {
          select: {
            id: true,
            name: true,
            chainId: true,
            chain: {
              select: {
                id: true,
                name: true,
              },
            },
          },
        },
      },
      orderBy: [{ tenantId: 'asc' }, { name: 'asc' }],
    }),
  ])

  const bindingsByDisplayId = new Map<
    string,
    Array<{
      id: string
      tenantId: string
      displayId: string
      isActive: boolean
      deviceAlias: string | null
      deviceModel: string | null
      devicePlatform: string | null
      appVersion: string | null
      lastSeenAt: Date | null
      updatedAt: Date
    }>
  >()

  for (const binding of orderDeskBindings) {
    const list = bindingsByDisplayId.get(binding.displayId) || []
    list.push(binding)
    bindingsByDisplayId.set(binding.displayId, list)
  }

  const screenDeviceCodeByTenantAndCode = new Map<string, string>()
  for (const device of screenDevices) {
    screenDeviceCodeByTenantAndCode.set(
      `${device.tenantId}:${device.deviceCode.toUpperCase()}`,
      device.deviceCode
    )
  }

  const rows: DisplayRecord[] = []

  for (const display of orderDisplays) {
    const resolvedDeviceCode =
      screenDeviceCodeByTenantAndCode.get(
        `${display.tenantId}:${display.displayCode.toUpperCase()}`
      ) ?? display.displayCode
    const bindings = bindingsByDisplayId.get(display.id) || []
    const latestBinding = bindings
      .slice()
      .sort((left, right) => {
        const leftTs = left.lastSeenAt?.getTime() ?? 0
        const rightTs = right.lastSeenAt?.getTime() ?? 0
        if (leftTs !== rightTs) {
          return rightTs - leftTs
        }
        return right.updatedAt.getTime() - left.updatedAt.getTime()
      })[0]

    const lastSeenCandidate =
      latestBinding?.lastSeenAt ??
      (bindings.length > 0
        ? bindings.reduce<Date | null>((latest, entry) => {
            if (!entry.lastSeenAt) {
              return latest
            }
            if (!latest || entry.lastSeenAt.getTime() > latest.getTime()) {
              return entry.lastSeenAt
            }
            return latest
          }, null)
        : null)
    const lastSyncCandidate =
      bindings.length > 0
        ? bindings.reduce<Date>((latest, entry) =>
            entry.updatedAt.getTime() > latest.getTime() ? entry.updatedAt : latest
          , bindings[0].updatedAt)
        : display.updatedAt

    rows.push({
      id: `order:${display.id}`,
      entityId: display.id,
      sourceKind: 'ORDER_DISPLAY',
      screenId: null,
      tenantId: display.tenantId,
      tenantName: display.tenant?.name ?? null,
      chainId: display.tenant?.chainId ?? null,
      chainName: display.tenant?.chain?.name ?? null,
      name: display.name,
      displayType: mapOrderDisplayRoleToType(display.displayRole),
      code: display.displayCode,
      isActive: display.isActive,
      lastSeenAt: lastSeenCandidate ? lastSeenCandidate.toISOString() : null,
      lastSyncAt: lastSyncCandidate ? lastSyncCandidate.toISOString() : null,
      resolution: null,
      deviceInfo: latestBinding
        ? {
            alias: latestBinding.deviceAlias,
            model: latestBinding.deviceModel,
            platform: latestBinding.devicePlatform,
            appVersion: latestBinding.appVersion,
            source: 'ORDERDESK_BINDING',
          }
        : null,
      status: computeDisplayStatus(display.isActive, lastSeenCandidate),
      previewPath: `/screen/${resolvedDeviceCode}`,
      editablePath: '/admin/screen-studio',
      pairingSupported: true,
    })
  }

  for (const device of screenDevices) {
    const parsedNotesType =
      (() => {
        const noteText = device.notes || ''
        const lines = noteText.split('\n')
        const firstLine = lines[0]?.trim() || ''
        if (!firstLine.startsWith('@@klarando-screen-device-meta:')) {
          return null
        }
        try {
          const json = JSON.parse(firstLine.slice('@@klarando-screen-device-meta:'.length))
          return parseDisplayManagementType(
            json && typeof json === 'object' ? (json as { displayType?: unknown }).displayType : null
          )
        } catch {
          return null
        }
      })()

    const resolution = `${device.resolutionWidth}x${device.resolutionHeight}`
    const diagnostics = parseDisplayMetaFromNotes(device.notes).diagnostics ?? null
    const diagnosticsOverview = diagnostics
      ? {
          effectiveResolution:
            diagnostics.viewportWidth && diagnostics.viewportHeight
              ? `${diagnostics.viewportWidth}x${diagnostics.viewportHeight}`
              : resolution,
          devicePixelRatio:
            typeof diagnostics.devicePixelRatio === 'number' ? diagnostics.devicePixelRatio : null,
          orientation: diagnostics.orientation ?? device.orientation ?? null,
          fullscreenSupported:
            typeof diagnostics.fullscreenSupported === 'boolean'
              ? diagnostics.fullscreenSupported
              : null,
          touchSupported:
            typeof diagnostics.touchSupported === 'boolean' ? diagnostics.touchSupported : null,
          estimatedPerformanceClass: diagnostics.estimatedPerformanceClass ?? null,
          supportedVideoFormats: diagnostics.supportedVideoFormats ?? [],
          recommendedResolution: diagnostics.recommendedResolution ?? null,
          lastDiagnosticsAt: diagnostics.measuredAt ?? null,
        }
      : null
    rows.push({
      id: `screen:${device.id}`,
      entityId: device.id,
      sourceKind: 'SCREEN_DEVICE',
      screenId: null,
      tenantId: device.tenantId,
      tenantName: device.tenant?.name ?? null,
      chainId: device.tenant?.chainId ?? null,
      chainName: device.tenant?.chain?.name ?? null,
      name: device.name,
      displayType: parsedNotesType ?? parseScreenDeviceType(null, device.name),
      code: device.deviceCode,
      isActive: device.isActive,
      lastSeenAt: device.lastSeenAt ? device.lastSeenAt.toISOString() : null,
      lastSyncAt: device.updatedAt ? device.updatedAt.toISOString() : null,
      resolution,
      deviceInfo: {
        alias: device.name,
        model: null,
        platform: null,
        appVersion: null,
        source: 'SCREEN_DEVICE',
        diagnostics: diagnosticsOverview,
      },
      status: computeDisplayStatus(device.isActive, device.lastSeenAt),
      previewPath: `/screen/${device.deviceCode}`,
      editablePath: '/admin/screen-studio',
      pairingSupported: false,
    })
  }

  for (const device of displayDevices) {
    const status = !device.screenId
      ? 'inactive'
      : computeDisplayStatus(device.status !== 'REVOKED', device.lastSeenAt)
    rows.push({
      id: device.id,
      entityId: device.id,
      sourceKind: 'DISPLAY_DEVICE',
      screenId: device.screenId,
      tenantId: device.tenantId,
      tenantName: device.tenant?.name ?? null,
      chainId: device.tenant?.chainId ?? null,
      chainName: device.tenant?.chain?.name ?? null,
      name: device.name,
      displayType: parseScreenDeviceType(device.screen?.layoutType ?? null, device.screen?.name ?? device.name),
      code: device.id,
      isActive: device.status !== 'REVOKED' && Boolean(device.screenId),
      lastSeenAt: device.lastSeenAt ? device.lastSeenAt.toISOString() : null,
      lastSyncAt: device.updatedAt ? device.updatedAt.toISOString() : null,
      resolution: device.screen?.resolutionPreset ?? null,
      deviceInfo: {
        alias: device.name,
        model: device.screen?.name ?? null,
        platform: device.platform,
        appVersion: device.appVersion,
        source: 'DISPLAY_DEVICE',
        diagnostics: null,
      },
      status,
      previewPath: `/display-client?deviceId=${encodeURIComponent(device.id)}`,
      editablePath: '/admin/screen-studio',
      pairingSupported: false,
    })
  }

  return rows
}

router.get('/roles', requirePermission(PermissionKey.USERS_READ), async (_req, res) => {
  const supportedRoles = await loadSupportedUserRoles()
  return res.json({
    roles: Array.from(supportedRoles),
    permissions: Object.values(PermissionKey),
  })
})

router.get('/context', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    const actor = req.authUser

    const tenantWhere = enforceTenantScope(req, {})
    const tenants = await prisma.tenant.findMany({
      where: tenantWhere,
      select: {
        id: true,
        name: true,
        chainId: true,
        email: true,
        status: true,
        addressLine: true,
        createdAt: true,
      },
      orderBy: { createdAt: 'desc' },
    })

    let chainWhere: Record<string, unknown> = {}

    if (actor?.role === UserRole.CHAINADMIN && actor.chainId) {
      chainWhere = { id: actor.chainId }
    }

    if (
      (actor?.role === UserRole.ADMIN ||
        actor?.role === UserRole.STAFF ||
        actor?.role === UserRole.DRIVER) &&
      actor.tenantId
    ) {
      const tenant = tenants.find((entry) => entry.id === actor.tenantId)
      chainWhere = tenant?.chainId ? { id: tenant.chainId } : { id: '__none__' }
    }

    const chains = await prisma.chain.findMany({
      where: chainWhere,
      select: {
        id: true,
        name: true,
        code: true,
        status: true,
        createdAt: true,
      },
      orderBy: { createdAt: 'desc' },
    })

    return res.json({
      me: actor
        ? {
            id: actor.id,
            role: actor.role,
            chainId: actor.chainId,
            tenantId: actor.tenantId,
          }
        : null,
      chains,
      tenants,
    })
  } catch (error) {
    console.error('GET ACCESS CONTEXT ERROR:', error)
    return res.status(500).json({ error: 'Kontext konnte nicht geladen werden' })
  }
})

router.get('/displays/overview', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const requestedTenantId = parseScopedId(req.query.tenantId)
    const requestedChainId = parseScopedId(req.query.chainId)
    const requestedStatus = parseScopedId(req.query.status)?.toLowerCase() || null
    const requestedDisplayType = parseDisplayManagementType(req.query.displayType)
    const queryText = parseScopedId(req.query.q)?.toLowerCase() || null

    let tenantScope
    if (requestedTenantId) {
      tenantScope = await resolveTenantScope(req, requestedTenantId)
    } else {
      tenantScope = await resolveTenantScope(req, null, { allowMissingTenant: true })
    }

    let tenantIds = tenantScope.tenantId
      ? [tenantScope.tenantId]
      : [...tenantScope.allowedTenantIds]

    if (requestedChainId) {
      const actor = req.authUser
      if (!actor) {
        return res.status(401).json({ error: 'Nicht eingeloggt' })
      }
      if (actor.role === UserRole.CHAINADMIN && actor.chainId !== requestedChainId) {
        return res.status(403).json({ error: 'Keine Berechtigung fuer diese Kette' })
      }

      const chainTenantIds = await prisma.tenant.findMany({
        where: { chainId: requestedChainId },
        select: { id: true },
      })
      const chainTenantIdSet = new Set(chainTenantIds.map((entry) => entry.id))
      tenantIds = tenantIds.filter((id) => chainTenantIdSet.has(id))
    }

    if (tenantIds.length === 0) {
      return res.json({
        generatedAt: new Date().toISOString(),
        rows: [],
        summary: {
          total: 0,
          online: 0,
          offline: 0,
          inactive: 0,
        },
      })
    }

    let rows = await loadDisplayOverviewRows(tenantIds)

    if (requestedDisplayType) {
      rows = rows.filter((entry) => entry.displayType === requestedDisplayType)
    }

    if (requestedStatus && ['online', 'offline', 'inactive'].includes(requestedStatus)) {
      rows = rows.filter((entry) => entry.status === requestedStatus)
    }

    if (queryText) {
      rows = rows.filter((entry) => {
        const haystack = [
          entry.name,
          entry.code,
          entry.displayType,
          entry.tenantName || '',
          entry.chainName || '',
          entry.status,
        ]
          .join(' ')
          .toLowerCase()
        return haystack.includes(queryText)
      })
    }

    const summary = {
      total: rows.length,
      online: rows.filter((entry) => entry.status === 'online').length,
      offline: rows.filter((entry) => entry.status === 'offline').length,
      inactive: rows.filter((entry) => entry.status === 'inactive').length,
    }

    return res.json({
      generatedAt: new Date().toISOString(),
      rows,
      summary,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET DISPLAY OVERVIEW ERROR:', error)
    return res.status(500).json({ error: 'Display-Uebersicht konnte nicht geladen werden' })
  }
})

router.get('/driver-devices/overview', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    const requestedTenantId = parseScopedId(req.query.tenantId)
    const requestedChainId = parseScopedId(req.query.chainId)

    let tenantScope
    if (requestedTenantId) {
      tenantScope = await resolveTenantScope(req, requestedTenantId)
    } else {
      tenantScope = await resolveTenantScope(req, null, { allowMissingTenant: true })
    }

    let tenantIds = tenantScope.tenantId
      ? [tenantScope.tenantId]
      : [...tenantScope.allowedTenantIds]

    if (requestedChainId) {
      const actor = req.authUser
      if (!actor) {
        return res.status(401).json({ error: 'Nicht eingeloggt' })
      }
      if (actor.role === UserRole.CHAINADMIN && actor.chainId !== requestedChainId) {
        return res.status(403).json({ error: 'Keine Berechtigung fuer diese Kette' })
      }

      const chainTenantIds = await prisma.tenant.findMany({
        where: { chainId: requestedChainId },
        select: { id: true },
      })
      const chainTenantIdSet = new Set(chainTenantIds.map((entry) => entry.id))
      tenantIds = tenantIds.filter((id) => chainTenantIdSet.has(id))
    }

    if (tenantIds.length === 0) {
      return res.json({
        generatedAt: new Date().toISOString(),
        rows: [],
      })
    }

    const tenants = await prisma.tenant.findMany({
      where: {
        id: {
          in: tenantIds,
        },
      },
      select: {
        id: true,
        name: true,
        chainId: true,
        chain: {
          select: {
            id: true,
            name: true,
          },
        },
      },
      orderBy: [{ name: 'asc' }],
    })

    const rowsNested = await Promise.all(
      tenants.map(async (tenant) => {
        const sessions = await listDriverDeviceSessionsForTenant(tenant.id, {
          includeExpired: true,
        })
        return sessions.map((session) => ({
          sessionId: session.sessionId,
          tenantId: tenant.id,
          tenantName: tenant.name,
          chainId: tenant.chainId,
          chainName: tenant.chain?.name ?? null,
          displayCode: session.displayCode,
          displayId: session.displayId,
          deviceLabel: session.deviceLabel,
          issuedAt: session.issuedAt,
          expiresAt: session.expiresAt,
          lastHeartbeatAt: session.lastHeartbeatAt,
          revokedAt: session.revokedAt,
          driverUserId: session.driverUserId,
          driverName: session.driverName,
          isActive: session.isActive,
          isOnline: session.isOnline,
        }))
      })
    )

    return res.json({
      generatedAt: new Date().toISOString(),
      rows: rowsNested.flat(),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET DRIVER DEVICE OVERVIEW ERROR:', error)
    return res.status(500).json({ error: 'Fahrergeraete konnten nicht geladen werden' })
  }
})

router.get('/displays/:ref/preview', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const ref = Array.isArray(req.params.ref) ? req.params.ref[0] : req.params.ref
    const parsed = parseDisplayRef(ref)
    if (!parsed) {
      return res.status(400).json({ error: 'Ungueltige Display-Referenz' })
    }

    if (parsed.sourceKind === 'ORDER_DISPLAY') {
      const display = await prisma.orderDisplay.findUnique({
        where: { id: parsed.entityId },
        select: {
          id: true,
          tenantId: true,
          name: true,
          displayCode: true,
          displayRole: true,
          isActive: true,
        },
      })

      if (!display) {
        return res.status(404).json({ error: 'Display nicht gefunden' })
      }

      await resolveTenantScope(req, display.tenantId)
      const linkedScreenDevice = await prisma.screenDevice.findFirst({
        where: {
          tenantId: display.tenantId,
          deviceCode: {
            equals: display.displayCode,
            mode: 'insensitive',
          },
        },
        select: {
          deviceCode: true,
        },
      })
      const resolvedDeviceCode = linkedScreenDevice?.deviceCode ?? display.displayCode

      return res.json({
        id: `order:${display.id}`,
        sourceKind: 'ORDER_DISPLAY',
        displayType: mapOrderDisplayRoleToType(display.displayRole),
        previewUrl: `/screen/${resolvedDeviceCode}`,
        status: computeDisplayStatus(display.isActive, null),
        isActive: display.isActive,
        serverTime: new Date().toISOString(),
      })
    }

    const device = await prisma.screenDevice.findUnique({
      where: { id: parsed.entityId },
      select: {
        id: true,
        tenantId: true,
        name: true,
        deviceCode: true,
        isActive: true,
        lastSeenAt: true,
      },
    })

    if (!device) {
      return res.status(404).json({ error: 'Display nicht gefunden' })
    }

    await resolveTenantScope(req, device.tenantId)

    return res.json({
      id: `screen:${device.id}`,
      sourceKind: 'SCREEN_DEVICE',
      displayType: parseScreenDeviceType(null, device.name),
      previewUrl: `/screen/${device.deviceCode}`,
      status: computeDisplayStatus(device.isActive, device.lastSeenAt),
      isActive: device.isActive,
      serverTime: new Date().toISOString(),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET DISPLAY PREVIEW ERROR:', error)
    return res.status(500).json({ error: 'Display-Vorschau konnte nicht vorbereitet werden' })
  }
})

router.patch('/displays/:ref/active', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const ref = Array.isArray(req.params.ref) ? req.params.ref[0] : req.params.ref
    const parsed = parseDisplayRef(ref)
    if (!parsed) {
      return res.status(400).json({ error: 'Ungueltige Display-Referenz' })
    }

    const payload = req.body as { isActive?: boolean }
    if (typeof payload.isActive !== 'boolean') {
      return res.status(400).json({ error: 'isActive muss true oder false sein' })
    }

    if (parsed.sourceKind === 'ORDER_DISPLAY') {
      const current = await prisma.orderDisplay.findUnique({
        where: { id: parsed.entityId },
        select: { id: true, tenantId: true, name: true, displayCode: true, isActive: true },
      })
      if (!current) {
        return res.status(404).json({ error: 'Display nicht gefunden' })
      }
      await resolveTenantScope(req, current.tenantId)

      const updated = await prisma.orderDisplay.update({
        where: { id: current.id },
        data: { isActive: payload.isActive },
        select: { id: true, tenantId: true, name: true, displayCode: true, isActive: true, updatedAt: true },
      })

      await writeAuditLog({
        req,
        module: 'display_management',
        action: 'order_display_active_toggled',
        targetType: 'order_display',
        targetId: updated.id,
        tenantId: updated.tenantId,
        metadata: {
          displayCode: updated.displayCode,
          isActive: updated.isActive,
        },
      })

      return res.json({
        id: `order:${updated.id}`,
        sourceKind: 'ORDER_DISPLAY',
        isActive: updated.isActive,
        status: computeDisplayStatus(updated.isActive, null),
        updatedAt: updated.updatedAt.toISOString(),
      })
    }

    const current = await prisma.screenDevice.findUnique({
      where: { id: parsed.entityId },
      select: { id: true, tenantId: true, name: true, deviceCode: true, isActive: true, lastSeenAt: true },
    })
    if (!current) {
      return res.status(404).json({ error: 'Display nicht gefunden' })
    }
    await resolveTenantScope(req, current.tenantId)

    const updated = await prisma.screenDevice.update({
      where: { id: current.id },
      data: { isActive: payload.isActive },
      select: {
        id: true,
        tenantId: true,
        name: true,
        deviceCode: true,
        isActive: true,
        lastSeenAt: true,
        updatedAt: true,
      },
    })

    await writeAuditLog({
      req,
      module: 'display_management',
      action: 'screen_device_active_toggled',
      targetType: 'screen_device',
      targetId: updated.id,
      tenantId: updated.tenantId,
      metadata: {
        deviceCode: updated.deviceCode,
        isActive: updated.isActive,
      },
    })

    return res.json({
      id: `screen:${updated.id}`,
      sourceKind: 'SCREEN_DEVICE',
      isActive: updated.isActive,
      status: computeDisplayStatus(updated.isActive, updated.lastSeenAt),
      updatedAt: updated.updatedAt.toISOString(),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('PATCH DISPLAY ACTIVE ERROR:', error)
    return res.status(500).json({ error: 'Display-Status konnte nicht aktualisiert werden' })
  }
})

router.post(
  '/displays/:ref/pairing-code',
  requirePermission(PermissionKey.ORDERS_WRITE),
  async (req, res) => {
    try {
      const ref = Array.isArray(req.params.ref) ? req.params.ref[0] : req.params.ref
      const parsed = parseDisplayRef(ref)
      if (!parsed || parsed.sourceKind !== 'ORDER_DISPLAY') {
        return res.status(400).json({ error: 'Pairing-Code ist nur fuer Bestell-Displays verfuegbar' })
      }

      const payload = req.body as { deviceAlias?: string | null; expiresMinutes?: number | null }
      const display = await prisma.orderDisplay.findUnique({
        where: { id: parsed.entityId },
        select: {
          id: true,
          tenantId: true,
          displayCode: true,
          name: true,
        },
      })

      if (!display) {
        return res.status(404).json({ error: 'Display nicht gefunden' })
      }

      await resolveTenantScope(req, display.tenantId)

      const normalizedAlias =
        typeof payload.deviceAlias === 'string' && payload.deviceAlias.trim().length > 0
          ? payload.deviceAlias.trim().slice(0, 80)
          : `${display.name} OrderDesk`
      const expiresMinutesRaw = Number(payload.expiresMinutes)
      const expiresMinutes =
        Number.isFinite(expiresMinutesRaw) && expiresMinutesRaw >= 1 && expiresMinutesRaw <= 240
          ? Math.round(expiresMinutesRaw)
          : 15
      const sessionId = createOrderDeskPairingSessionId()
      const expiresAt = new Date(Date.now() + expiresMinutes * 60 * 1000)

      await prisma.orderDeskPairingSession.create({
        data: {
          id: sessionId,
          tenantId: display.tenantId,
          displayId: display.id,
          displayCode: display.displayCode,
          deviceAlias: normalizedAlias,
          createdByUserId: req.authUser?.id || null,
          expiresAt,
        },
      })

      const pairingToken = signOrderDeskDeviceToken({
        sid: sessionId,
        tenantId: display.tenantId,
        displayCode: display.displayCode,
        bindingId: null,
        deviceSerial: null,
        deviceAlias: normalizedAlias,
        kind: 'PAIRING',
        expiresAtMs: expiresAt.getTime(),
      })
      const pairingPayload = encodeOrderDeskPairingPayload({
        type: 'ORDER_DESK_PAIRING',
        apiBaseUrl: resolvePublicApiBaseUrl(),
        tenantId: display.tenantId,
        displayCode: display.displayCode,
        pairingToken,
        expiresAt: expiresAt.toISOString(),
      })

      await writeAuditLog({
        req,
        module: 'display_management',
        action: 'pairing_code_regenerated',
        targetType: 'order_display',
        targetId: display.id,
        tenantId: display.tenantId,
        metadata: {
          sessionId,
          displayCode: display.displayCode,
          expiresAt: expiresAt.toISOString(),
        },
      })

      return res.json({
        ok: true,
        sessionId,
        displayId: display.id,
        displayCode: display.displayCode,
        tenantId: display.tenantId,
        expiresAt: expiresAt.toISOString(),
        pairingPayload,
        qrImageUrl: `https://api.qrserver.com/v1/create-qr-code/?size=360x360&data=${encodeURIComponent(
          pairingPayload
        )}`,
      })
    } catch (error) {
      const scopeError = asTenantScopeError(error)
      if (scopeError) {
        return res.status(scopeError.status).json({ error: scopeError.message })
      }
      console.error('CREATE DISPLAY PAIRING CODE ERROR:', error)
      return res.status(500).json({ error: 'Pairing-Code konnte nicht erzeugt werden' })
    }
  }
)

router.get('/users', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    const where: Record<string, unknown> = {}
    const role = parseRole(req.query.role as string | undefined)
    const chainId = parseScopedId(req.query.chainId)
    const tenantId = parseScopedId(req.query.tenantId)

    if (role) {
      if (!(await isUserRoleSupported(role))) {
        return res.json([])
      }
      where.role = role
    }

    if (chainId) {
      where.chainId = chainId
    }

    if (tenantId) {
      where.tenantId = tenantId
      await resolveTenantScope(req, tenantId)
    }

    const scopedWhere = enforceUserScope(req, where)

    const users = await prisma.user.findMany({
      where: scopedWhere,
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        isActive: true,
        chainId: true,
        tenantId: true,
        createdAt: true,
        updatedAt: true,
      },
      orderBy: { createdAt: 'desc' },
    })

    return res.json(users)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET ACCESS USERS ERROR:', error)
    return res.status(500).json({ error: 'Benutzer konnten nicht geladen werden' })
  }
})

router.post('/users', requirePermission(PermissionKey.USERS_WRITE), async (req, res) => {
  try {
    const actor = req.authUser
    if (!canManageUsersRole(actor?.role)) {
      return res.status(403).json({ error: 'Keine Berechtigung zur Benutzerverwaltung' })
    }

    const {
      email,
      name,
      password,
      role: rawRole,
      chainId,
      tenantId,
      isActive,
    } = req.body as {
      email?: string
      name?: string
      password?: string
      role?: string
      chainId?: string | null
      tenantId?: string | null
      isActive?: boolean
    }

    const role = parseRole(rawRole)

    if (!email || !name || !password || !role) {
      return res.status(400).json({ error: 'email, name, password und role sind erforderlich' })
    }
    if (!(await isUserRoleSupported(role))) {
      return res.status(400).json({ error: `Rolle ${role} ist in dieser Datenbank nicht verfuegbar` })
    }

    if (
      actor?.role === UserRole.CHAINADMIN &&
      (role === UserRole.SUPERADMIN || role === UserRole.CHAINADMIN)
    ) {
      return res.status(403).json({ error: 'CHAINADMIN darf diese Rolle nicht erstellen' })
    }

    if (actor?.role === UserRole.ADMIN && role !== UserRole.STAFF && role !== UserRole.DRIVER) {
      return res.status(403).json({ error: 'ADMIN darf nur STAFF/DRIVER erstellen' })
    }

    let resolvedTenantId: string | null = parseScopedId(tenantId) || null
    let resolvedChainId: string | null = parseScopedId(chainId) || null

    if (actor?.role === UserRole.CHAINADMIN) {
      resolvedChainId = actor.chainId
    }

    if (actor?.role === UserRole.ADMIN) {
      resolvedTenantId = actor.tenantId
      resolvedChainId = actor.chainId
    }

    if (role === UserRole.CHAINADMIN && !resolvedChainId) {
      return res.status(400).json({ error: 'CHAINADMIN braucht eine chainId' })
    }

    if (
      (role === UserRole.ADMIN || role === UserRole.STAFF || role === UserRole.DRIVER) &&
      !resolvedTenantId
    ) {
      return res.status(400).json({ error: 'ADMIN/STAFF/DRIVER braucht eine tenantId' })
    }

    if (resolvedTenantId) {
      await resolveTenantScope(req, resolvedTenantId)

      const tenant = await prisma.tenant.findUnique({
        where: { id: resolvedTenantId },
        select: { id: true, chainId: true },
      })

      if (!tenant) {
        return res.status(400).json({ error: 'Ungueltige tenantId' })
      }

      if (actor?.role === UserRole.CHAINADMIN && tenant.chainId !== actor.chainId) {
        return res.status(403).json({ error: 'Filiale gehoert nicht zu deiner Kette' })
      }

      resolvedChainId = tenant.chainId || resolvedChainId
    }

    if (resolvedChainId) {
      const chain = await prisma.chain.findUnique({
        where: { id: resolvedChainId },
        select: { id: true },
      })

      if (!chain) {
        return res.status(400).json({ error: 'Ungueltige chainId' })
      }
    }

    const createdUser = await prisma.user.create({
      data: {
        email: email.trim().toLowerCase(),
        name: name.trim(),
        passwordHash: hashPassword(password),
        role,
        chainId: resolvedChainId,
        tenantId: resolvedTenantId,
        isActive: isActive ?? true,
      },
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        chainId: true,
        tenantId: true,
        isActive: true,
        createdAt: true,
      },
    })

    await writeAuditLog({
      req,
      module: 'access',
      action: 'user_created',
      targetType: 'user',
      targetId: createdUser.id,
      chainId: createdUser.chainId,
      tenantId: createdUser.tenantId,
      metadata: {
        role: createdUser.role,
        email: createdUser.email,
      },
    })

    return res.status(201).json(createdUser)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('CREATE ACCESS USER ERROR:', error)
    return res.status(500).json({ error: 'Benutzer konnte nicht erstellt werden' })
  }
})

router.patch('/users/:id', requirePermission(PermissionKey.USERS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const actor = req.authUser
    if (!canManageUsersRole(actor?.role)) {
      return res.status(403).json({ error: 'Keine Berechtigung zur Benutzerverwaltung' })
    }

    const current = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        role: true,
        chainId: true,
        tenantId: true,
      },
    })

    if (!current) {
      return res.status(404).json({ error: 'Benutzer nicht gefunden' })
    }

    const accessError = enforceTargetUserAccess(req, current, 'write')
    if (accessError) {
      return res.status(403).json({ error: accessError })
    }

    if (current.tenantId) {
      await resolveTenantScope(req, current.tenantId)
    }

    const {
      name,
      role: rawRole,
      chainId,
      tenantId,
      isActive,
      password,
    } = req.body as {
      name?: string
      role?: string
      chainId?: string | null
      tenantId?: string | null
      isActive?: boolean
      password?: string
    }

    const role = rawRole ? parseRole(rawRole) : null

    if (rawRole && !role) {
      return res.status(400).json({ error: 'Ungueltige Rolle' })
    }
    if (role && !(await isUserRoleSupported(role))) {
      return res.status(400).json({ error: `Rolle ${role} ist in dieser Datenbank nicht verfuegbar` })
    }

    if (
      actor?.role === UserRole.CHAINADMIN &&
      role &&
      (role === UserRole.SUPERADMIN || role === UserRole.CHAINADMIN)
    ) {
      return res.status(403).json({ error: 'CHAINADMIN darf diese Rolle nicht setzen' })
    }

    if (
      actor?.role === UserRole.ADMIN &&
      role &&
      role !== UserRole.STAFF &&
      role !== UserRole.DRIVER
    ) {
      return res.status(403).json({ error: 'ADMIN darf nur STAFF/DRIVER setzen' })
    }

    if (actor?.role !== UserRole.SUPERADMIN) {
      if (chainId !== undefined || tenantId !== undefined) {
        return res
          .status(403)
          .json({ error: 'Nur SUPERADMIN darf chainId oder tenantId anpassen' })
      }
    }

    const normalizedTenantId =
      actor?.role === UserRole.SUPERADMIN && tenantId !== undefined
        ? parseScopedId(tenantId)
        : undefined
    const normalizedChainId =
      actor?.role === UserRole.SUPERADMIN && chainId !== undefined
        ? parseScopedId(chainId)
        : undefined

    if (actor?.role === UserRole.SUPERADMIN && normalizedTenantId) {
      await resolveTenantScope(req, normalizedTenantId)
    }

    let validatedChainId = normalizedChainId
    if (actor?.role === UserRole.SUPERADMIN && normalizedTenantId) {
      const tenant = await prisma.tenant.findUnique({
        where: { id: normalizedTenantId },
        select: { id: true, chainId: true },
      })
      if (!tenant) {
        return res.status(400).json({ error: 'Ungueltige tenantId' })
      }
      validatedChainId = tenant.chainId ?? validatedChainId
    }

    const updated = await prisma.user.update({
      where: { id },
      data: {
        name,
        role: role || undefined,
        chainId:
          actor?.role === UserRole.SUPERADMIN
            ? normalizedChainId === undefined
              ? undefined
              : validatedChainId
            : undefined,
        tenantId:
          actor?.role === UserRole.SUPERADMIN
            ? normalizedTenantId === undefined
              ? undefined
              : normalizedTenantId
            : undefined,
        isActive,
        passwordHash: password ? hashPassword(password) : undefined,
      },
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        chainId: true,
        tenantId: true,
        isActive: true,
        updatedAt: true,
      },
    })

    await writeAuditLog({
      req,
      module: 'access',
      action: 'user_updated',
      targetType: 'user',
      targetId: updated.id,
      chainId: updated.chainId,
      tenantId: updated.tenantId,
      metadata: {
        role: updated.role,
        isActive: updated.isActive,
      },
    })

    return res.json(updated)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE ACCESS USER ERROR:', error)
    return res.status(500).json({ error: 'Benutzer konnte nicht aktualisiert werden' })
  }
})

router.delete('/users/:id', requirePermission(PermissionKey.USERS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const actor = req.authUser
    if (!canManageUsersRole(actor?.role)) {
      return res.status(403).json({ error: 'Keine Berechtigung zur Benutzerverwaltung' })
    }

    const current = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        role: true,
        chainId: true,
        tenantId: true,
        email: true,
        name: true,
      },
    })

    if (!current) {
      return res.status(404).json({ error: 'Benutzer nicht gefunden' })
    }

    const accessError = enforceTargetUserAccess(req, current, 'write')
    if (accessError) {
      return res.status(403).json({ error: accessError })
    }

    if (current.tenantId) {
      await resolveTenantScope(req, current.tenantId)
    }

    if (actor?.id === current.id) {
      return res.status(400).json({ error: 'Du kannst dein eigenes Benutzerkonto nicht loeschen' })
    }

    if (current.role === UserRole.SUPERADMIN) {
      const superadminCount = await prisma.user.count({
        where: { role: UserRole.SUPERADMIN },
      })

      if (superadminCount <= 1) {
        return res.status(400).json({ error: 'Der letzte SUPERADMIN kann nicht geloescht werden' })
      }
    }

    await prisma.user.delete({
      where: { id: current.id },
    })

    await writeAuditLog({
      req,
      module: 'access',
      action: 'user_deleted',
      targetType: 'user',
      targetId: current.id,
      chainId: current.chainId,
      tenantId: current.tenantId,
      metadata: {
        role: current.role,
        email: current.email,
        name: current.name,
      },
    })

    return res.json({
      ok: true,
      id: current.id,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DELETE ACCESS USER ERROR:', error)
    return res.status(500).json({ error: 'Benutzer konnte nicht geloescht werden' })
  }
})

router.get('/drivers/overview', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    if (!(await isUserRoleSupported(UserRole.DRIVER))) {
      return res.json({
        generatedAt: new Date().toISOString(),
        rows: [],
      })
    }

    const q =
      typeof req.query.q === 'string' && req.query.q.trim().length > 0
        ? req.query.q.trim()
        : null
    const chainId =
      typeof req.query.chainId === 'string' && req.query.chainId.trim().length > 0
        ? req.query.chainId.trim()
        : null
    const tenantId =
      typeof req.query.tenantId === 'string' && req.query.tenantId.trim().length > 0
        ? req.query.tenantId.trim()
        : null
    const includeInactive = parseOptionalBoolean(req.query.includeInactive) ?? false
    const limit = parsePositiveInt(req.query.limit, 300, 600)
    const scopedTenantId = tenantId ? (await resolveTenantScope(req, tenantId)).tenantId : null

    const scopedUserWhere = enforceAuditScope(req, {
      role: UserRole.DRIVER,
      chainId: chainId || undefined,
      tenantId: scopedTenantId || undefined,
      isActive: includeInactive ? undefined : true,
      OR: q
        ? [
            { name: { contains: q, mode: 'insensitive' as const } },
            { email: { contains: q, mode: 'insensitive' as const } },
          ]
        : undefined,
    }) as Prisma.UserWhereInput

    const drivers = await prisma.user.findMany({
      where: scopedUserWhere,
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        isActive: true,
        chainId: true,
        tenantId: true,
        createdAt: true,
        updatedAt: true,
        chain: {
          select: {
            id: true,
            name: true,
            code: true,
          },
        },
        tenant: {
          select: {
            id: true,
            name: true,
            chainId: true,
          },
        },
      },
      orderBy: [{ isActive: 'desc' }, { name: 'asc' }],
      take: limit,
    })

    if (drivers.length === 0) {
      return res.json({
        generatedAt: new Date().toISOString(),
        rows: [],
      })
    }

    const driverIds = drivers.map((entry) => entry.id)
    const scopedTenantIdsForOrders = Array.from(
      new Set(drivers.map((entry) => entry.tenantId).filter((entry): entry is string => Boolean(entry)))
    )
    const orderStats = await prisma.order.groupBy({
      by: ['assignedDriverId', 'status'],
      where: {
        assignedDriverId: {
          in: driverIds,
        },
        tenantId: {
          in: scopedTenantIdsForOrders,
        },
      },
      _count: {
        _all: true,
      },
      _max: {
        driverAssignedAt: true,
        driverDepartedAt: true,
        createdAt: true,
      },
    })

    const startOfToday = new Date()
    startOfToday.setHours(0, 0, 0, 0)

    const todayStats = await prisma.order.groupBy({
      by: ['assignedDriverId'],
      where: {
        assignedDriverId: {
          in: driverIds,
        },
        tenantId: {
          in: scopedTenantIdsForOrders,
        },
        createdAt: {
          gte: startOfToday,
        },
      },
      _count: {
        _all: true,
      },
    })

    const totalsByDriver = new Map<string, { total: number; active: number; completed: number; lastAt: string | null }>()
    for (const entry of orderStats) {
      if (!entry.assignedDriverId) {
        continue
      }

      const current = totalsByDriver.get(entry.assignedDriverId) || {
        total: 0,
        active: 0,
        completed: 0,
        lastAt: null as string | null,
      }

      current.total += entry._count._all
      if (
        entry.status === 'open' ||
        entry.status === 'preparing' ||
        entry.status === 'out_for_delivery'
      ) {
        current.active += entry._count._all
      }

      if (entry.status === 'done' || entry.status === 'archived') {
        current.completed += entry._count._all
      }

      const timestamps = [
        entry._max.driverDepartedAt,
        entry._max.driverAssignedAt,
        entry._max.createdAt,
      ].filter((value): value is Date => Boolean(value))
      if (timestamps.length > 0) {
        const latest = timestamps.reduce((left, right) => (left > right ? left : right))
        if (!current.lastAt || latest.toISOString() > current.lastAt) {
          current.lastAt = latest.toISOString()
        }
      }

      totalsByDriver.set(entry.assignedDriverId, current)
    }

    const todayByDriver = new Map<string, number>()
    for (const entry of todayStats) {
      if (entry.assignedDriverId) {
        todayByDriver.set(entry.assignedDriverId, entry._count._all)
      }
    }

    const rows = drivers.map((driver) => {
      const stats = totalsByDriver.get(driver.id) || {
        total: 0,
        active: 0,
        completed: 0,
        lastAt: null,
      }
      return {
        ...driver,
        stats: {
          totalAssignedOrders: stats.total,
          activeDeliveries: stats.active,
          completedDeliveries: stats.completed,
          todayAssignedOrders: todayByDriver.get(driver.id) || 0,
          lastAssignmentAt: stats.lastAt,
        },
      }
    })

    return res.json({
      generatedAt: new Date().toISOString(),
      rows,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET DRIVER OVERVIEW ERROR:', error)
    return res.status(500).json({ error: 'Fahrer-Uebersicht konnte nicht geladen werden' })
  }
})

router.get('/drivers/:id', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    if (!(await isUserRoleSupported(UserRole.DRIVER))) {
      return res.status(404).json({ error: 'Fahrer nicht gefunden' })
    }

    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    if (!id) {
      return res.status(400).json({ error: 'id fehlt' })
    }

    const driver = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        email: true,
        name: true,
        role: true,
        isActive: true,
        chainId: true,
        tenantId: true,
        createdAt: true,
        updatedAt: true,
        chain: {
          select: {
            id: true,
            name: true,
            code: true,
          },
        },
        tenant: {
          select: {
            id: true,
            name: true,
          },
        },
      },
    })

    if (!driver || driver.role !== UserRole.DRIVER) {
      return res.status(404).json({ error: 'Fahrer nicht gefunden' })
    }

    const accessError = enforceTargetUserAccess(req, driver, 'read')
    if (accessError) {
      return res.status(403).json({ error: accessError })
    }
    if (!driver.tenantId) {
      return res.status(409).json({ error: 'Fahrer hat keine zugeordnete Filiale' })
    }
    await resolveTenantScope(req, driver.tenantId)

    const grouped = await prisma.order.groupBy({
      by: ['status'],
      where: {
        assignedDriverId: driver.id,
        tenantId: driver.tenantId,
      },
      _count: {
        _all: true,
      },
      _max: {
        driverAssignedAt: true,
        driverDepartedAt: true,
      },
    })

    const recentOrders = await prisma.order.findMany({
      where: {
        assignedDriverId: driver.id,
        tenantId: driver.tenantId,
      },
      select: {
        id: true,
        tenantId: true,
        status: true,
        sourceChannel: true,
        serviceType: true,
        total: true,
        paymentStatus: true,
        pickupNumber: true,
        customerName: true,
        customerAddress: true,
        customerZipCode: true,
        customerCity: true,
        estimatedMinutes: true,
        driverAssignedAt: true,
        driverDepartedAt: true,
        createdAt: true,
        tenant: {
          select: {
            id: true,
            name: true,
            chain: {
              select: {
                id: true,
                name: true,
                code: true,
              },
            },
          },
        },
      },
      orderBy: [{ createdAt: 'desc' }],
      take: 80,
    })

    let totalAssignedOrders = 0
    let activeDeliveries = 0
    let completedDeliveries = 0
    let lastAssignmentAt: string | null = null

    for (const entry of grouped) {
      totalAssignedOrders += entry._count._all

      if (
        entry.status === 'open' ||
        entry.status === 'preparing' ||
        entry.status === 'out_for_delivery'
      ) {
        activeDeliveries += entry._count._all
      }

      if (entry.status === 'done' || entry.status === 'archived') {
        completedDeliveries += entry._count._all
      }

      const timestamps = [entry._max.driverDepartedAt, entry._max.driverAssignedAt].filter(
        (value): value is Date => Boolean(value)
      )
      if (timestamps.length > 0) {
        const latest = timestamps.reduce((left, right) => (left > right ? left : right))
        if (!lastAssignmentAt || latest.toISOString() > lastAssignmentAt) {
          lastAssignmentAt = latest.toISOString()
        }
      }
    }

    return res.json({
      driver,
      summary: {
        totalAssignedOrders,
        activeDeliveries,
        completedDeliveries,
        lastAssignmentAt,
      },
      recentOrders,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET DRIVER DETAIL ERROR:', error)
    return res.status(500).json({ error: 'Fahrer-Details konnten nicht geladen werden' })
  }
})

router.get('/users/:id/permissions', requirePermission(PermissionKey.USERS_READ), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id

    const current = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        role: true,
        chainId: true,
        tenantId: true,
      },
    })

    if (!current) {
      return res.status(404).json({ error: 'Benutzer nicht gefunden' })
    }

    const accessError = enforceTargetUserAccess(req, current, 'read')
    if (accessError) {
      return res.status(403).json({ error: accessError })
    }

    if (current.tenantId) {
      await resolveTenantScope(req, current.tenantId)
    }

    const effectivePermissions = await resolveEffectivePermissionsForUser(current.id, current.role)

    return res.json({
      userId: current.id,
      role: current.role,
      permissions: effectivePermissions,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET USER PERMISSIONS ERROR:', error)
    return res.status(500).json({ error: 'Berechtigungen konnten nicht geladen werden' })
  }
})

router.put('/users/:id/permissions', requirePermission(PermissionKey.USERS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const parsedPermissions = parsePermissions((req.body as { permissions?: unknown }).permissions)
    const actor = req.authUser
    if (!canManageUsersRole(actor?.role)) {
      return res.status(403).json({ error: 'Keine Berechtigung zur Benutzerverwaltung' })
    }

    if (!parsedPermissions) {
      return res.status(400).json({ error: 'permissions sind ungueltig' })
    }

    const current = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        role: true,
        chainId: true,
        tenantId: true,
      },
    })

    if (!current) {
      return res.status(404).json({ error: 'Benutzer nicht gefunden' })
    }

    const accessError = enforceTargetUserAccess(req, current, 'write')
    if (accessError) {
      return res.status(403).json({ error: accessError })
    }

    if (current.tenantId) {
      await resolveTenantScope(req, current.tenantId)
    }

    const roleDefaults = new Set(getDefaultPermissions(current.role))
    if (actor?.role !== UserRole.SUPERADMIN) {
      for (const permission of parsedPermissions) {
        if (!roleDefaults.has(permission)) {
          return res.status(403).json({
            error: `Berechtigung ${permission} darf fuer Rolle ${current.role} nicht vergeben werden`,
          })
        }
      }
    }

    const allowedSet = new Set(parsedPermissions)
    const data = ALL_PERMISSIONS.map((permission) => ({
      userId: current.id,
      permission,
      allowed: allowedSet.has(permission),
    }))

    await prisma.$transaction([
      prisma.userPermission.deleteMany({
        where: { userId: current.id },
      }),
      prisma.userPermission.createMany({
        data,
      }),
    ])

    await writeAuditLog({
      req,
      module: 'access',
      action: 'user_permissions_set',
      targetType: 'user',
      targetId: current.id,
      chainId: current.chainId,
      tenantId: current.tenantId,
      metadata: {
        permissions: parsedPermissions,
      },
    })

    return res.json({
      userId: current.id,
      role: current.role,
      permissions: parsedPermissions.sort(),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('SET USER PERMISSIONS ERROR:', error)
    return res.status(500).json({ error: 'Berechtigungen konnten nicht gespeichert werden' })
  }
})

router.get('/features/catalog', requirePermission(PermissionKey.SETTINGS_READ), async (_req, res) => {
  return res.json({
    modules: FEATURE_MODULE_REGISTRY.map((entry) => ({
      key: entry.key,
      name: entry.name,
      description: entry.description,
      category: entry.category,
      defaultEnabled: entry.defaultEnabled,
      adminNavPath: entry.adminNavPath ?? null,
      requiredPermissions: entry.requiredPermissions ?? [],
      dependencies: entry.dependencies ?? [],
    })),
    packages: FEATURE_PACKAGES,
  })
})

router.get('/features/effective', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const requestedTenantId = parseScopedId(req.query.tenantId)
    let targetTenantId = requestedTenantId

    if (!targetTenantId) {
      targetTenantId = req.authUser?.tenantId ?? null
    }

    if (!targetTenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    await resolveTenantScope(req, targetTenantId)
    const effective = await resolveEffectiveFeatureSetForTenant(targetTenantId)
    if (!effective) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    return res.json(effective)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET EFFECTIVE FEATURES ERROR:', error)
    return res.status(500).json({ error: 'Feature-Scope konnte nicht geladen werden' })
  }
})

router.get('/features/overview', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const requestedTenantId = parseScopedId(req.query.tenantId)
    const requestedChainId = parseScopedId(req.query.chainId)
    const scope = await resolveTenantScope(req, null, { allowMissingTenant: true })

    let tenantIds = [...scope.allowedTenantIds]
    if (requestedTenantId) {
      await resolveTenantScope(req, requestedTenantId)
      tenantIds = [requestedTenantId]
    }

    const where: Prisma.TenantWhereInput = {
      id: {
        in: tenantIds,
      },
    }

    if (requestedChainId) {
      if (req.authUser?.role === UserRole.CHAINADMIN && req.authUser.chainId !== requestedChainId) {
        return res.status(403).json({ error: 'Keine Berechtigung fuer diese Kette' })
      }
      where.chainId = requestedChainId
    }

    const tenants = await prisma.tenant.findMany({
      where,
      select: {
        id: true,
        name: true,
        chainId: true,
        chain: { select: { id: true, name: true } },
      },
      orderBy: { name: 'asc' },
    })

    const rows = await Promise.all(
      tenants.map(async (tenant) => {
        const effective = await resolveEffectiveFeatureSetForTenant(tenant.id)
        const modules = effective?.modules ?? []
        const enabled = modules.filter((entry) => entry.enabled).length
        return {
          tenantId: tenant.id,
          tenantName: tenant.name,
          chainId: tenant.chainId,
          chainName: tenant.chain?.name ?? null,
          enabledModules: enabled,
          disabledModules: Math.max(modules.length - enabled, 0),
          modules,
        }
      })
    )

    return res.json({
      generatedAt: new Date().toISOString(),
      rows,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET FEATURES OVERVIEW ERROR:', error)
    return res.status(500).json({ error: 'Feature-Uebersicht konnte nicht geladen werden' })
  }
})

router.get('/features/chain/:chainId', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const chainId = Array.isArray(req.params.chainId) ? req.params.chainId[0] : req.params.chainId
    const actor = req.authUser
    if (!actor) {
      return res.status(401).json({ error: 'Nicht eingeloggt' })
    }
    if (actor.role === UserRole.CHAINADMIN && actor.chainId !== chainId) {
      return res.status(403).json({ error: 'Keine Berechtigung fuer diese Kette' })
    }

    const chain = await prisma.chain.findUnique({
      where: { id: chainId },
      select: { id: true, name: true, code: true },
    })
    if (!chain) {
      return res.status(404).json({ error: 'Kette nicht gefunden' })
    }

    const settings = await prisma.chainFeatureModuleSetting.findMany({
      where: { chainId: chain.id },
      orderBy: { featureKey: 'asc' },
    })

    return res.json({
      chain,
      settings,
    })
  } catch (error) {
    console.error('GET CHAIN FEATURES ERROR:', error)
    return res.status(500).json({ error: 'Chain-Features konnten nicht geladen werden' })
  }
})

router.put('/features/chain/:chainId', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const superadminError = ensureSuperadmin(req)
    if (superadminError) {
      return res.status(403).json({ error: superadminError })
    }

    const chainId = Array.isArray(req.params.chainId) ? req.params.chainId[0] : req.params.chainId
    const chain = await prisma.chain.findUnique({
      where: { id: chainId },
      select: { id: true },
    })
    if (!chain) {
      return res.status(404).json({ error: 'Kette nicht gefunden' })
    }

    const body = req.body as {
      featureKey?: unknown
      enabled?: unknown
      enabledBySuperadmin?: unknown
      features?: Array<{ featureKey?: unknown; enabled?: unknown }>
    }
    const enabledBySuperadmin = parseOptionalBoolean(body.enabledBySuperadmin)
    const features = Array.isArray(body.features) ? body.features : null
    const singleKey = parseFeatureModuleKey(body.featureKey)
    const singleEnabled = parseOptionalBoolean(body.enabled)

    const updates: Array<{ featureKey: FeatureModuleKey; enabled: boolean }> = []
    if (features && features.length > 0) {
      for (const entry of features) {
        const featureKey = parseFeatureModuleKey(entry.featureKey)
        const enabled = parseOptionalBoolean(entry.enabled)
        if (!featureKey || enabled === null) {
          return res.status(400).json({ error: 'features enthalten ungueltige Werte' })
        }
        updates.push({ featureKey, enabled })
      }
    } else {
      if (!singleKey || singleEnabled === null) {
        return res.status(400).json({ error: 'featureKey oder enabled ungueltig' })
      }
      updates.push({ featureKey: singleKey, enabled: singleEnabled })
    }

    await prisma.$transaction(
      updates.map((entry) =>
        prisma.chainFeatureModuleSetting.upsert({
          where: {
            chainId_featureKey: {
              chainId: chain.id,
              featureKey: entry.featureKey,
            },
          },
          create: {
            chainId: chain.id,
            featureKey: entry.featureKey,
            enabled: entry.enabled,
            enabledBySuperadmin: enabledBySuperadmin ?? true,
            updatedBy: req.authUser?.email ?? 'superadmin',
          },
          update: {
            enabled: entry.enabled,
            enabledBySuperadmin: enabledBySuperadmin ?? true,
            updatedBy: req.authUser?.email ?? 'superadmin',
          },
        })
      )
    )

    await writeAuditLog({
      req,
      module: 'access',
      action: 'chain_features_updated',
      targetType: 'chain',
      targetId: chain.id,
      chainId: chain.id,
      tenantId: null,
      metadata: { updates },
    })

    return res.json({
      ok: true,
      chainId: chain.id,
      settings: await prisma.chainFeatureModuleSetting.findMany({
        where: { chainId: chain.id },
        orderBy: { featureKey: 'asc' },
      }),
    })
  } catch (error) {
    console.error('UPDATE CHAIN FEATURES ERROR:', error)
    return res.status(500).json({ error: 'Chain-Features konnten nicht gespeichert werden' })
  }
})

router.put('/features/tenant/:tenantId', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const superadminError = ensureSuperadmin(req)
    if (superadminError) {
      return res.status(403).json({ error: superadminError })
    }

    const tenantId = Array.isArray(req.params.tenantId) ? req.params.tenantId[0] : req.params.tenantId
    await resolveTenantScope(req, tenantId)

    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: { id: true, chainId: true },
    })

    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    const body = req.body as {
      featureKey?: unknown
      enabled?: unknown
      enabledBySuperadmin?: unknown
      features?: Array<{ featureKey?: unknown; enabled?: unknown }>
    }

    const enabledBySuperadmin = parseOptionalBoolean(body.enabledBySuperadmin)
    const features = Array.isArray(body.features) ? body.features : null
    const singleKey = parseFeatureModuleKey(body.featureKey)
    const singleEnabled = parseOptionalBoolean(body.enabled)

    const updates: Array<{ featureKey: FeatureModuleKey; enabled: boolean }> = []

    if (features && features.length > 0) {
      for (const entry of features) {
        const featureKey = parseFeatureModuleKey(entry.featureKey)
        const enabled = parseOptionalBoolean(entry.enabled)
        if (!featureKey || enabled === null) {
          return res.status(400).json({ error: 'features enthalten ungueltige Werte' })
        }
        updates.push({ featureKey, enabled })
      }
    } else {
      if (!singleKey || singleEnabled === null) {
        return res.status(400).json({ error: 'featureKey oder enabled ungueltig' })
      }
      updates.push({ featureKey: singleKey, enabled: singleEnabled })
    }

    await prisma.$transaction(
      updates.map((entry) =>
        prisma.tenantFeatureModuleSetting.upsert({
          where: {
            tenantId_featureKey: {
              tenantId: tenant.id,
              featureKey: entry.featureKey,
            },
          },
          create: {
            tenantId: tenant.id,
            chainId: tenant.chainId,
            featureKey: entry.featureKey,
            enabled: entry.enabled,
            enabledBySuperadmin: enabledBySuperadmin ?? true,
            updatedBy: req.authUser?.email ?? 'superadmin',
          },
          update: {
            enabled: entry.enabled,
            enabledBySuperadmin: enabledBySuperadmin ?? true,
            updatedBy: req.authUser?.email ?? 'superadmin',
            chainId: tenant.chainId,
          },
        })
      )
    )

    await writeAuditLog({
      req,
      module: 'access',
      action: 'tenant_features_updated',
      targetType: 'tenant',
      targetId: tenant.id,
      chainId: tenant.chainId,
      tenantId: tenant.id,
      metadata: { updates },
    })

    const effective = await resolveEffectiveFeatureSetForTenant(tenant.id)
    return res.json({
      ok: true,
      tenantId: tenant.id,
      effective,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE TENANT FEATURES ERROR:', error)
    return res.status(500).json({ error: 'Feature-Einstellungen konnten nicht gespeichert werden' })
  }
})

router.post('/features/tenant/:tenantId/apply-package', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const superadminError = ensureSuperadmin(req)
    if (superadminError) {
      return res.status(403).json({ error: superadminError })
    }

    const tenantId = Array.isArray(req.params.tenantId) ? req.params.tenantId[0] : req.params.tenantId
    await resolveTenantScope(req, tenantId)
    const packageKey = parseScopedId((req.body as { packageKey?: unknown }).packageKey)?.toUpperCase()
    if (!packageKey) {
      return res.status(400).json({ error: 'packageKey fehlt' })
    }

    const packageEntry = FEATURE_PACKAGES.find((entry) => entry.key === packageKey)
    if (!packageEntry) {
      return res.status(404).json({ error: 'Paket nicht gefunden' })
    }

    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: { id: true, chainId: true },
    })
    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    const enabledSet = new Set(packageEntry.features)
    await prisma.$transaction(
      FEATURE_MODULE_REGISTRY.map((module) =>
        prisma.tenantFeatureModuleSetting.upsert({
          where: {
            tenantId_featureKey: {
              tenantId: tenant.id,
              featureKey: module.key,
            },
          },
          create: {
            tenantId: tenant.id,
            chainId: tenant.chainId,
            featureKey: module.key,
            enabled: enabledSet.has(module.key),
            enabledBySuperadmin: true,
            updatedBy: req.authUser?.email ?? 'superadmin',
          },
          update: {
            enabled: enabledSet.has(module.key),
            enabledBySuperadmin: true,
            updatedBy: req.authUser?.email ?? 'superadmin',
            chainId: tenant.chainId,
          },
        })
      )
    )

    await writeAuditLog({
      req,
      module: 'access',
      action: 'tenant_feature_package_applied',
      targetType: 'tenant',
      targetId: tenant.id,
      chainId: tenant.chainId,
      tenantId: tenant.id,
      metadata: { packageKey },
    })

    const effective = await resolveEffectiveFeatureSetForTenant(tenant.id)
    return res.json({
      ok: true,
      packageKey,
      tenantId: tenant.id,
      effective,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('APPLY TENANT FEATURE PACKAGE ERROR:', error)
    return res.status(500).json({ error: 'Feature-Paket konnte nicht angewendet werden' })
  }
})

router.get('/billing/tenant/:tenantId', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  function buildBillingTenantFallback(input: {
    tenantId: string
    tenantName?: string | null
    chainId?: string | null
    chainName?: string | null
  }) {
    const now = new Date()
    return {
      tenantId: input.tenantId,
      billingEnabled: false,
      profile: null,
      includedOrders: 0,
      commissionPercent: 0,
      fixedFeePerOrder: 0,
      message: 'Für diesen Betrieb ist noch keine Abrechnung eingerichtet.',
      tenant: {
        id: input.tenantId,
        name: input.tenantName || 'Unbekannter Betrieb',
        chainId: input.chainId ?? null,
        chainName: input.chainName ?? null,
      },
      plan: {
        tenantId: input.tenantId,
        chainId: input.chainId ?? null,
        planType: BillingPlanType.REVENUE_SHARE,
        monthlyFeeCents: 0,
        includedOrders: 0,
        commissionPercent: 0,
        commissionAfterIncludedOrdersPercent: null,
        fixedFeePerOrderCents: 0,
        billingPeriod: BillingPeriodType.MONTHLY,
        activeFrom: now.toISOString(),
        activeUntil: null,
        isActive: false,
        notes: null,
        updatedBy: null,
      },
      settings: {
        tenantId: input.tenantId,
        chainId: input.chainId ?? null,
        paymentFeeBearer: FeeBearer.TENANT,
        countOnlyPaidOrders: true,
        countOnlyCompletedOrders: true,
        excludeCanceledOrders: true,
        revenueMode: 'GROSS',
        currency: 'EUR',
        timezone: 'Europe/Berlin',
        notes: null,
        isActive: false,
        updatedBy: null,
      },
      billingProfile: null,
      usage: {
        ordersTotal: 0,
        ordersCounted: 0,
        ordersCanceled: 0,
        revenueGrossCents: 0,
        revenueCountedCents: 0,
      },
      commissionRules: [],
    }
  }

  try {
    const tenantId = Array.isArray(req.params.tenantId) ? req.params.tenantId[0] : req.params.tenantId
    await resolveTenantScope(req, tenantId)

    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: {
        id: true,
        name: true,
        chainId: true,
        chain: { select: { id: true, name: true } },
        tenantBillingPlan: true,
        tenantBillingSettings: true,
        billingProfile: true,
      },
    })

    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    const now = new Date()
    const periodStart = new Date(now.getFullYear(), now.getMonth(), 1)
    const periodEnd = new Date(now.getFullYear(), now.getMonth() + 1, 1)

    let usage = {
      ordersTotal: 0,
      ordersCounted: 0,
      ordersCanceled: 0,
      revenueGrossCents: 0,
      revenueCountedCents: 0,
    }
    try {
      usage = await calculateBillingUsageSnapshot({
        tenantId: tenant.id,
        periodStart,
        periodEnd,
        countOnlyPaidOrders: tenant.tenantBillingSettings?.countOnlyPaidOrders ?? true,
        countOnlyCompletedOrders: tenant.tenantBillingSettings?.countOnlyCompletedOrders ?? true,
        excludeCanceledOrders: tenant.tenantBillingSettings?.excludeCanceledOrders ?? true,
      })
    } catch (usageError) {
      const usageMessage = usageError instanceof Error ? usageError.message : String(usageError)
      console.error('ACCESS_BILLING_TENANT_ERROR', { tenantId: tenant.id, message: usageMessage, source: 'usage_snapshot' })
    }

    let activeRules: Awaited<ReturnType<typeof prisma.commissionRule.findMany>> = []
    try {
      activeRules = await prisma.commissionRule.findMany({
        where: {
          tenantId: tenant.id,
          isActive: true,
        },
        orderBy: [{ priority: 'asc' }, { createdAt: 'asc' }],
      })
    } catch (rulesError) {
      const rulesMessage = rulesError instanceof Error ? rulesError.message : String(rulesError)
      console.error('ACCESS_BILLING_TENANT_ERROR', { tenantId: tenant.id, message: rulesMessage, source: 'commission_rules' })
    }

    const hasBillingConfig = Boolean(tenant.tenantBillingPlan || tenant.tenantBillingSettings || tenant.billingProfile)
    const defaultMessage = hasBillingConfig ? null : 'Noch keine Abrechnungskonfiguration vorhanden.'

    return res.json({
      tenantId: tenant.id,
      billingEnabled: hasBillingConfig,
      profile: tenant.billingProfile ?? null,
      includedOrders: tenant.tenantBillingPlan?.includedOrders ?? 0,
      commissionPercent: tenant.tenantBillingPlan?.commissionPercent ?? 0,
      fixedFeePerOrder: (tenant.tenantBillingPlan?.fixedFeePerOrderCents ?? 0) / 100,
      message: defaultMessage,
      tenant: {
        id: tenant.id,
        name: tenant.name,
        chainId: tenant.chainId,
        chainName: tenant.chain?.name ?? null,
      },
      plan:
        tenant.tenantBillingPlan ??
        {
          tenantId: tenant.id,
          chainId: tenant.chainId,
          planType: BillingPlanType.REVENUE_SHARE,
          monthlyFeeCents: 0,
          includedOrders: 0,
          commissionPercent: 0,
          commissionAfterIncludedOrdersPercent: null,
          fixedFeePerOrderCents: 0,
          billingPeriod: BillingPeriodType.MONTHLY,
          activeFrom: now.toISOString(),
          activeUntil: null,
          isActive: false,
          notes: null,
          updatedBy: null,
        },
      settings:
        tenant.tenantBillingSettings ??
        {
          tenantId: tenant.id,
          chainId: tenant.chainId,
          paymentFeeBearer: FeeBearer.TENANT,
          countOnlyPaidOrders: true,
          countOnlyCompletedOrders: true,
          excludeCanceledOrders: true,
          revenueMode: 'GROSS',
          currency: 'EUR',
          timezone: 'Europe/Berlin',
          notes: null,
          isActive: false,
          updatedBy: null,
        },
      billingProfile:
        tenant.billingProfile ?? {
          tenantId: tenant.id,
          chainId: tenant.chainId,
          companyName: tenant.name,
          legalForm: null,
          contactEmail: null,
          contactPerson: null,
          phone: null,
          website: null,
          vatId: null,
          taxNumber: null,
          street: null,
          zipCode: null,
          city: null,
          countryCode: 'DE',
          invoiceEmail: null,
          paymentMethod: null,
          paymentTermsDays: 14,
          paymentStatus: null,
          sepaActive: false,
          sepaMandateReference: null,
          sepaCreditorId: null,
          bankName: null,
          iban: null,
          bic: null,
          stripeCustomerId: null,
          paymentProviderStatus: null,
          plannedDebitAt: null,
          lastDebitAt: null,
          lastChargebackStatus: null,
          invoiceLogoUrl: null,
          standardPaymentTargetDays: 14,
          managingDirector: null,
          approvedBy: null,
          sentAt: null,
          paidAt: null,
          cancelledAt: null,
          createdBy: null,
          updatedBy: null,
          billingCycleDay: 1,
          sepaPreNotificationDays: 5,
          notes: null,
        },
      usage,
      commissionRules: activeRules,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    const message = error instanceof Error ? error.message : String(error)
    const tenantId = Array.isArray(req.params.tenantId) ? req.params.tenantId[0] : req.params.tenantId
    console.error('ACCESS_BILLING_TENANT_ERROR', { tenantId, message })
    return res.json(buildBillingTenantFallback({ tenantId }))
  }
})

router.get('/billing/overview', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const requestedTenantId = parseScopedId(req.query.tenantId)
    const requestedChainId = parseScopedId(req.query.chainId)
    const scope = await resolveTenantScope(req, null, { allowMissingTenant: true })
    let tenantIds = [...scope.allowedTenantIds]

    if (requestedTenantId) {
      await resolveTenantScope(req, requestedTenantId)
      tenantIds = [requestedTenantId]
    }

    const where: Prisma.TenantWhereInput = {
      id: { in: tenantIds },
    }

    if (requestedChainId) {
      if (req.authUser?.role === UserRole.CHAINADMIN && req.authUser.chainId !== requestedChainId) {
        return res.status(403).json({ error: 'Keine Berechtigung fuer diese Kette' })
      }
      where.chainId = requestedChainId
    }

    const tenants = await prisma.tenant.findMany({
      where,
      select: {
        id: true,
        name: true,
        chainId: true,
        chain: { select: { id: true, name: true } },
        tenantBillingPlan: true,
      },
      orderBy: { name: 'asc' },
    })

    return res.json({
      generatedAt: new Date().toISOString(),
      rows: tenants.map((entry) => ({
        tenantId: entry.id,
        tenantName: entry.name,
        chainId: entry.chainId,
        chainName: entry.chain?.name ?? null,
        plan: entry.tenantBillingPlan,
      })),
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET BILLING OVERVIEW ERROR:', error)
    return res.status(500).json({ error: 'Abrechnungsuebersicht konnte nicht geladen werden' })
  }
})

router.put('/billing/tenant/:tenantId', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const superadminError = ensureSuperadmin(req)
    if (superadminError) {
      return res.status(403).json({ error: superadminError })
    }

    const tenantId = Array.isArray(req.params.tenantId) ? req.params.tenantId[0] : req.params.tenantId
    await resolveTenantScope(req, tenantId)

    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: { id: true, chainId: true },
    })
    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    const body = req.body as {
      planType?: unknown
      monthlyFeeCents?: unknown
      includedOrders?: unknown
      commissionPercent?: unknown
      commissionAfterIncludedOrdersPercent?: unknown
      fixedFeePerOrderCents?: unknown
      billingPeriod?: unknown
      activeFrom?: unknown
      activeUntil?: unknown
      isActive?: unknown
      notes?: unknown
      paymentFeeBearer?: unknown
      countOnlyPaidOrders?: unknown
      countOnlyCompletedOrders?: unknown
      excludeCanceledOrders?: unknown
      revenueMode?: unknown
      currency?: unknown
      timezone?: unknown
      settingsNotes?: unknown
      billingModel?: unknown
      paymentMethod?: unknown
      paymentTermsDays?: unknown
      billingEmail?: unknown
      invoiceEmail?: unknown
      adminRecipients?: unknown
      profileCompanyName?: unknown
      profileStreet?: unknown
      profileZipCode?: unknown
      profileCity?: unknown
      profileCountryCode?: unknown
      profileVatId?: unknown
      profileContactEmail?: unknown
      sepaMandateReference?: unknown
      sepaMandateSignedAt?: unknown
      profileLegalForm?: unknown
      profileTaxNumber?: unknown
      profileManagingDirector?: unknown
      profilePhone?: unknown
      profileWebsite?: unknown
      profileContactPerson?: unknown
      profilePaymentMethod?: unknown
      profilePaymentTermsDays?: unknown
      profilePaymentStatus?: unknown
      profileSepaActive?: unknown
      profileSepaCreditorId?: unknown
      profileBankName?: unknown
      profileIban?: unknown
      profileBic?: unknown
      profileInvoiceLogoUrl?: unknown
      profileStripeCustomerId?: unknown
      profilePaymentProviderStatus?: unknown
    }

    const planType = parseBillingPlanType(body.planType)
    const billingPeriod = parseBillingPeriodType(body.billingPeriod) ?? BillingPeriodType.MONTHLY
    const monthlyFeeCents = parseOptionalInt(body.monthlyFeeCents)
    const includedOrders = parseOptionalInt(body.includedOrders)
    const commissionPercent = parseOptionalDecimal(body.commissionPercent)
    const commissionAfterIncludedOrdersPercent = parseOptionalDecimal(
      body.commissionAfterIncludedOrdersPercent
    )
    const fixedFeePerOrderCents = parseOptionalInt(body.fixedFeePerOrderCents)
    const isActive = parseOptionalBoolean(body.isActive)
    const paymentFeeBearer = parseFeeBearer(body.paymentFeeBearer)
    const countOnlyPaidOrders = parseOptionalBoolean(body.countOnlyPaidOrders)
    const countOnlyCompletedOrders = parseOptionalBoolean(body.countOnlyCompletedOrders)
    const excludeCanceledOrders = parseOptionalBoolean(body.excludeCanceledOrders)
    const paymentTermsDays = parseOptionalInt(body.paymentTermsDays)
    const profilePaymentTermsDays = parseOptionalInt(body.profilePaymentTermsDays)
    const profileSepaActive = parseOptionalBoolean(body.profileSepaActive)

    if (!planType) {
      return res.status(400).json({ error: 'planType ist ungueltig' })
    }

    const activeFrom = parseScopedId(body.activeFrom)
    const activeUntil = parseScopedId(body.activeUntil)
    const activeFromDate = activeFrom ? new Date(activeFrom) : new Date()
    const activeUntilDate = activeUntil ? new Date(activeUntil) : null

    if (Number.isNaN(activeFromDate.getTime())) {
      return res.status(400).json({ error: 'activeFrom ist ungueltig' })
    }
    if (activeUntilDate && Number.isNaN(activeUntilDate.getTime())) {
      return res.status(400).json({ error: 'activeUntil ist ungueltig' })
    }

    const [plan, settings, billingProfile] = await prisma.$transaction([
      prisma.tenantBillingPlan.upsert({
        where: { tenantId: tenant.id },
        create: {
          tenantId: tenant.id,
          chainId: tenant.chainId,
          planType,
          monthlyFeeCents: Math.max(0, monthlyFeeCents ?? 0),
          includedOrders: Math.max(0, includedOrders ?? 0),
          commissionPercent: Math.max(0, commissionPercent ?? 0),
          commissionAfterIncludedOrdersPercent:
            commissionAfterIncludedOrdersPercent === null
              ? null
              : Math.max(0, commissionAfterIncludedOrdersPercent),
          fixedFeePerOrderCents: Math.max(0, fixedFeePerOrderCents ?? 0),
          billingPeriod,
          activeFrom: activeFromDate,
          activeUntil: activeUntilDate,
          isActive: isActive ?? true,
          notes: parseScopedId(body.notes),
          updatedBy: req.authUser?.email ?? 'superadmin',
        },
        update: {
          chainId: tenant.chainId,
          planType,
          monthlyFeeCents: Math.max(0, monthlyFeeCents ?? 0),
          includedOrders: Math.max(0, includedOrders ?? 0),
          commissionPercent: Math.max(0, commissionPercent ?? 0),
          commissionAfterIncludedOrdersPercent:
            commissionAfterIncludedOrdersPercent === null
              ? null
              : Math.max(0, commissionAfterIncludedOrdersPercent),
          fixedFeePerOrderCents: Math.max(0, fixedFeePerOrderCents ?? 0),
          billingPeriod,
          activeFrom: activeFromDate,
          activeUntil: activeUntilDate,
          isActive: isActive ?? true,
          notes: parseScopedId(body.notes),
          updatedBy: req.authUser?.email ?? 'superadmin',
        },
      }),
      prisma.tenantBillingSettings.upsert({
        where: { tenantId: tenant.id },
        create: {
          tenantId: tenant.id,
          chainId: tenant.chainId,
          paymentFeeBearer: paymentFeeBearer ?? FeeBearer.TENANT,
          countOnlyPaidOrders: countOnlyPaidOrders ?? true,
          countOnlyCompletedOrders: countOnlyCompletedOrders ?? true,
          excludeCanceledOrders: excludeCanceledOrders ?? true,
          revenueMode: parseScopedId(body.revenueMode) ?? 'GROSS',
          currency: parseScopedId(body.currency) ?? 'EUR',
          timezone: parseScopedId(body.timezone) ?? 'Europe/Berlin',
          notes: parseScopedId(body.settingsNotes),
          isActive: true,
          updatedBy: req.authUser?.email ?? 'superadmin',
        },
        update: {
          chainId: tenant.chainId,
          paymentFeeBearer: paymentFeeBearer ?? FeeBearer.TENANT,
          countOnlyPaidOrders: countOnlyPaidOrders ?? true,
          countOnlyCompletedOrders: countOnlyCompletedOrders ?? true,
          excludeCanceledOrders: excludeCanceledOrders ?? true,
          revenueMode: parseScopedId(body.revenueMode) ?? 'GROSS',
          currency: parseScopedId(body.currency) ?? 'EUR',
          timezone: parseScopedId(body.timezone) ?? 'Europe/Berlin',
          notes: parseScopedId(body.settingsNotes),
          isActive: true,
          updatedBy: req.authUser?.email ?? 'superadmin',
        },
      }),
      prisma.billingProfile.upsert({
        where: { tenantId: tenant.id },
        create: {
          tenantId: tenant.id,
          chainId: tenant.chainId,
          companyName: parseScopedId(body.profileCompanyName) || `Abrechnung ${tenant.id}`,
          legalForm: parseScopedId(body.profileLegalForm),
          contactEmail: parseScopedId(body.profileContactEmail),
          contactPerson: parseScopedId(body.profileContactPerson),
          phone: parseScopedId(body.profilePhone),
          website: parseScopedId(body.profileWebsite),
          vatId: parseScopedId(body.profileVatId),
          taxNumber: parseScopedId(body.profileTaxNumber),
          street: parseScopedId(body.profileStreet),
          zipCode: parseScopedId(body.profileZipCode),
          city: parseScopedId(body.profileCity),
          countryCode: parseScopedId(body.profileCountryCode) || 'DE',
          invoiceEmail: parseScopedId(body.invoiceEmail) || parseScopedId(body.billingEmail),
          paymentMethod: parseScopedId(body.profilePaymentMethod) || parseScopedId(body.paymentMethod),
          paymentTermsDays: Math.max(1, profilePaymentTermsDays ?? paymentTermsDays ?? 14),
          paymentStatus: parseScopedId(body.profilePaymentStatus),
          sepaActive: profileSepaActive ?? false,
          sepaMandateReference: parseScopedId(body.sepaMandateReference),
          sepaCreditorId: parseScopedId(body.profileSepaCreditorId),
          bankName: parseScopedId(body.profileBankName),
          iban: parseScopedId(body.profileIban),
          bic: parseScopedId(body.profileBic),
          stripeCustomerId: parseScopedId(body.profileStripeCustomerId),
          paymentProviderStatus: parseScopedId(body.profilePaymentProviderStatus),
          invoiceLogoUrl: parseScopedId(body.profileInvoiceLogoUrl),
          standardPaymentTargetDays: Math.max(1, profilePaymentTermsDays ?? paymentTermsDays ?? 14),
          managingDirector: parseScopedId(body.profileManagingDirector),
          createdBy: req.authUser?.email ?? 'superadmin',
          updatedBy: req.authUser?.email ?? 'superadmin',
          billingCycleDay: 1,
          sepaPreNotificationDays: 5,
          notes: JSON.stringify({
            paymentMethod: parseScopedId(body.paymentMethod) || 'BANK_TRANSFER',
            billingModel: parseScopedId(body.billingModel) || 'HYBRID',
            paymentTermsDays: Math.max(1, paymentTermsDays ?? 14),
            adminRecipients: parseScopedId(body.adminRecipients),
            sepaMandateSignedAt: parseScopedId(body.sepaMandateSignedAt),
          }),
        },
        update: {
          chainId: tenant.chainId,
          companyName: parseScopedId(body.profileCompanyName) || `Abrechnung ${tenant.id}`,
          legalForm: parseScopedId(body.profileLegalForm),
          contactEmail: parseScopedId(body.profileContactEmail),
          contactPerson: parseScopedId(body.profileContactPerson),
          phone: parseScopedId(body.profilePhone),
          website: parseScopedId(body.profileWebsite),
          vatId: parseScopedId(body.profileVatId),
          taxNumber: parseScopedId(body.profileTaxNumber),
          street: parseScopedId(body.profileStreet),
          zipCode: parseScopedId(body.profileZipCode),
          city: parseScopedId(body.profileCity),
          countryCode: parseScopedId(body.profileCountryCode) || 'DE',
          invoiceEmail: parseScopedId(body.invoiceEmail) || parseScopedId(body.billingEmail),
          paymentMethod: parseScopedId(body.profilePaymentMethod) || parseScopedId(body.paymentMethod),
          paymentTermsDays: Math.max(1, profilePaymentTermsDays ?? paymentTermsDays ?? 14),
          paymentStatus: parseScopedId(body.profilePaymentStatus),
          sepaActive: profileSepaActive ?? false,
          sepaMandateReference: parseScopedId(body.sepaMandateReference),
          sepaCreditorId: parseScopedId(body.profileSepaCreditorId),
          bankName: parseScopedId(body.profileBankName),
          iban: parseScopedId(body.profileIban),
          bic: parseScopedId(body.profileBic),
          stripeCustomerId: parseScopedId(body.profileStripeCustomerId),
          paymentProviderStatus: parseScopedId(body.profilePaymentProviderStatus),
          invoiceLogoUrl: parseScopedId(body.profileInvoiceLogoUrl),
          standardPaymentTargetDays: Math.max(1, profilePaymentTermsDays ?? paymentTermsDays ?? 14),
          managingDirector: parseScopedId(body.profileManagingDirector),
          updatedBy: req.authUser?.email ?? 'superadmin',
          notes: JSON.stringify({
            paymentMethod: parseScopedId(body.paymentMethod) || 'BANK_TRANSFER',
            billingModel: parseScopedId(body.billingModel) || 'HYBRID',
            paymentTermsDays: Math.max(1, paymentTermsDays ?? 14),
            adminRecipients: parseScopedId(body.adminRecipients),
            sepaMandateSignedAt: parseScopedId(body.sepaMandateSignedAt),
          }),
        },
      }),
    ])

    await writeAuditLog({
      req,
      module: 'access',
      action: 'tenant_billing_updated',
      targetType: 'tenant',
      targetId: tenant.id,
      chainId: tenant.chainId,
      tenantId: tenant.id,
      metadata: {
        planType,
        billingPeriod,
        monthlyFeeCents: plan.monthlyFeeCents,
        includedOrders: plan.includedOrders,
      },
    })

    return res.json({
      ok: true,
      tenantId: tenant.id,
      plan,
      settings,
      billingProfile,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE TENANT BILLING SETTINGS ERROR:', error)
    return res.status(500).json({ error: 'Abrechnung konnte nicht gespeichert werden' })
  }
})

router.post('/billing/tenant/:tenantId/usage/sync', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const superadminError = ensureSuperadmin(req)
    if (superadminError) {
      return res.status(403).json({ error: superadminError })
    }

    const tenantId = Array.isArray(req.params.tenantId) ? req.params.tenantId[0] : req.params.tenantId
    await resolveTenantScope(req, tenantId)

    const tenant = await prisma.tenant.findUnique({
      where: { id: tenantId },
      select: { id: true, chainId: true, tenantBillingSettings: true },
    })
    if (!tenant) {
      return res.status(404).json({ error: 'Filiale nicht gefunden' })
    }

    const body = req.body as { periodStart?: unknown; periodEnd?: unknown }
    const periodStartRaw = parseScopedId(body.periodStart)
    const periodEndRaw = parseScopedId(body.periodEnd)

    const now = new Date()
    const defaultStart = new Date(now.getFullYear(), now.getMonth(), 1)
    const defaultEnd = new Date(now.getFullYear(), now.getMonth() + 1, 1)
    const periodStart = periodStartRaw ? new Date(periodStartRaw) : defaultStart
    const periodEnd = periodEndRaw ? new Date(periodEndRaw) : defaultEnd

    if (Number.isNaN(periodStart.getTime()) || Number.isNaN(periodEnd.getTime()) || periodEnd <= periodStart) {
      return res.status(400).json({ error: 'periodStart/periodEnd ungueltig' })
    }

    const snapshot = await calculateBillingUsageSnapshot({
      tenantId: tenant.id,
      periodStart,
      periodEnd,
      countOnlyPaidOrders: tenant.tenantBillingSettings?.countOnlyPaidOrders ?? true,
      countOnlyCompletedOrders: tenant.tenantBillingSettings?.countOnlyCompletedOrders ?? true,
      excludeCanceledOrders: tenant.tenantBillingSettings?.excludeCanceledOrders ?? true,
    })

    const usagePeriod = await prisma.billingUsagePeriod.upsert({
      where: {
        tenantId_periodStart_periodEnd: {
          tenantId: tenant.id,
          periodStart,
          periodEnd,
        },
      },
      create: {
        tenantId: tenant.id,
        chainId: tenant.chainId,
        periodStart,
        periodEnd,
        status: 'OPEN',
        ordersTotal: snapshot.ordersTotal,
        ordersCounted: snapshot.ordersCounted,
        ordersCanceled: snapshot.ordersCanceled,
        revenueGrossCents: snapshot.revenueGrossCents,
        revenueCountedCents: snapshot.revenueCountedCents,
        snapshotAt: new Date(),
      },
      update: {
        chainId: tenant.chainId,
        ordersTotal: snapshot.ordersTotal,
        ordersCounted: snapshot.ordersCounted,
        ordersCanceled: snapshot.ordersCanceled,
        revenueGrossCents: snapshot.revenueGrossCents,
        revenueCountedCents: snapshot.revenueCountedCents,
        snapshotAt: new Date(),
      },
    })

    const counterValues: Array<{ key: BillingUsageCounterKey; value: number }> = [
      { key: BillingUsageCounterKey.ORDERS_TOTAL, value: snapshot.ordersTotal },
      { key: BillingUsageCounterKey.ORDERS_COUNTED, value: snapshot.ordersCounted },
      { key: BillingUsageCounterKey.ORDERS_CANCELED, value: snapshot.ordersCanceled },
      { key: BillingUsageCounterKey.REVENUE_GROSS_CENTS, value: snapshot.revenueGrossCents },
      { key: BillingUsageCounterKey.REVENUE_COUNTED_CENTS, value: snapshot.revenueCountedCents },
    ]

    await prisma.$transaction(
      counterValues.map((entry) =>
        prisma.billingUsageCounter.upsert({
          where: {
            usagePeriodId_counterKey: {
              usagePeriodId: usagePeriod.id,
              counterKey: entry.key,
            },
          },
          create: {
            usagePeriodId: usagePeriod.id,
            tenantId: tenant.id,
            counterKey: entry.key,
            valueInt: entry.value,
          },
          update: {
            valueInt: entry.value,
          },
        })
      )
    )

    return res.json({
      ok: true,
      tenantId: tenant.id,
      usagePeriodId: usagePeriod.id,
      snapshot,
    })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('SYNC TENANT BILLING USAGE ERROR:', error)
    return res.status(500).json({ error: 'Usage-Stand konnte nicht aktualisiert werden' })
  }
})

router.get('/audit', requirePermission(PermissionKey.AUDIT_READ), async (req, res) => {
  try {
    const limit = Math.min(Number(req.query.limit || 100), 300)
    const module = parseScopedId(req.query.module)
    const tenantId = parseScopedId(req.query.tenantId)
    const chainId = parseScopedId(req.query.chainId)

    const where: Record<string, unknown> = {}

    if (module) {
      where.module = module
    }

    if (tenantId) {
      where.tenantId = tenantId
      await resolveTenantScope(req, tenantId)
    }

    if (chainId) {
      where.chainId = chainId
    }

    const scopedWhere = enforceAuditScope(req, where)

    const logs = await prisma.auditLog.findMany({
      where: scopedWhere,
      orderBy: { createdAt: 'desc' },
      take: Number.isFinite(limit) && limit > 0 ? limit : 100,
    })

    return res.json(logs)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET AUDIT LOGS ERROR:', error)
    return res.status(500).json({ error: 'Audit-Logs konnten nicht geladen werden' })
  }
})

export default router
