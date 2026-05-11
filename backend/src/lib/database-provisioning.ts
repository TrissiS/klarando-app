import { Prisma, PrismaClient } from '@prisma/client'
import { randomUUID } from 'crypto'
import { prisma } from './prisma'

const POSTGRES_IDENTIFIER_MAX_LENGTH = 63
const PROVISIONING_REGISTRY_ADVISORY_LOCK_KEY = 824420511

const REGISTRY_TABLES_DDL_STATEMENTS = [
  `
    CREATE TABLE IF NOT EXISTS chain_database_registry (
      chain_id TEXT PRIMARY KEY,
      database_name TEXT NOT NULL UNIQUE,
      database_url TEXT NOT NULL,
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
      updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    )
  `,
  `
    CREATE TABLE IF NOT EXISTS tenant_database_registry (
      tenant_id TEXT PRIMARY KEY,
      database_name TEXT NOT NULL UNIQUE,
      database_url TEXT NOT NULL,
      chain_code TEXT,
      tenant_name TEXT,
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
      updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    )
  `,
  `
    CREATE TABLE IF NOT EXISTS unassigned_database_registry (
      id TEXT PRIMARY KEY,
      database_name TEXT NOT NULL UNIQUE,
      database_url TEXT NOT NULL,
      label TEXT,
      created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
      updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    )
  `,
]

function isProductionEnvironment() {
  return (process.env.NODE_ENV || '').trim().toLowerCase() === 'production'
}

function isExplicitlyAllowed(value: string | undefined) {
  return (value || '').trim().toLowerCase() === 'true'
}

function assertDestructiveDatabaseActionAllowed(actionName: string) {
  if (
    isProductionEnvironment() &&
    !isExplicitlyAllowed(process.env.ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS)
  ) {
    throw new Error(
      `DB-Aktion "${actionName}" ist in Produktion blockiert. Setze ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS=true nur fuer explizit freigegebene Wartungsfenster.`
    )
  }
}

function normalizeIdentifier(rawValue: string) {
  const normalized = rawValue
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '_')
    .replace(/^_+|_+$/g, '')

  return normalized || 'tenant'
}

function quotePostgresIdentifier(identifier: string) {
  return `"${identifier.replace(/"/g, '""')}"`
}

function buildDatabaseUrlWithName(baseUrl: string, databaseName: string) {
  const parsed = new URL(baseUrl)
  parsed.pathname = `/${databaseName}`
  return parsed.toString()
}

function resolveAdminDatabaseUrl(baseUrl: string) {
  const parsed = new URL(baseUrl)
  parsed.pathname = '/postgres'
  parsed.searchParams.delete('schema')
  return parsed.toString()
}

function trimDatabaseIdentifier(name: string) {
  if (name.length <= POSTGRES_IDENTIFIER_MAX_LENGTH) {
    return name
  }

  return name.slice(0, POSTGRES_IDENTIFIER_MAX_LENGTH)
}

function deriveChainDatabaseName(chainCode: string, chainId: string) {
  const normalizedCode = normalizeIdentifier(chainCode)
  const normalizedId = chainId.replace(/[^a-zA-Z0-9]/g, '').toLowerCase().slice(0, 10)
  let name = `klarando_${normalizedCode}_${normalizedId}`

  if (!/^[a-z_]/.test(name)) {
    name = `k_${name}`
  }

  return trimDatabaseIdentifier(name)
}

function deriveTenantDatabaseName(scope: string, tenantId: string) {
  const normalizedScope = normalizeIdentifier(scope)
  const normalizedId = tenantId.replace(/[^a-zA-Z0-9]/g, '').toLowerCase().slice(0, 10)
  let name = `klarando_tenant_${normalizedScope}_${normalizedId}`

  if (!/^[a-z_]/.test(name)) {
    name = `t_${name}`
  }

  return trimDatabaseIdentifier(name)
}

async function ensureRegistryTablesWithLock(tx: Prisma.TransactionClient) {
  await tx.$executeRaw`SELECT pg_advisory_xact_lock(${PROVISIONING_REGISTRY_ADVISORY_LOCK_KEY})`
  for (const statement of REGISTRY_TABLES_DDL_STATEMENTS) {
    await tx.$executeRawUnsafe(statement)
  }
}

async function ensureChainRegistryTable() {
  await prisma.$transaction(async (tx) => {
    await ensureRegistryTablesWithLock(tx)
  })
}

async function ensureTenantRegistryTable() {
  await prisma.$transaction(async (tx) => {
    await ensureRegistryTablesWithLock(tx)
  })
}

async function ensureUnassignedRegistryTable() {
  await prisma.$transaction(async (tx) => {
    await ensureRegistryTablesWithLock(tx)
  })
}

export async function ensureProvisioningRegistryTables() {
  await prisma.$transaction(async (tx) => {
    await ensureRegistryTablesWithLock(tx)
  })
}

export type ChainDatabaseProvisioningResult = {
  enabled: boolean
  created: boolean
  databaseName: string | null
  databaseUrl: string | null
}

export type TenantDatabaseProvisioningResult = {
  enabled: boolean
  created: boolean
  databaseName: string | null
  databaseUrl: string | null
}

async function createDatabaseIfMissing(options: {
  databaseName: string
  templateDatabase: string
  adminDatabaseUrl: string
}) {
  const adminPrisma = new PrismaClient({
    datasources: {
      db: {
        url: options.adminDatabaseUrl,
      },
    },
  })

  let created = false

  try {
    const existingDatabase = await adminPrisma.$queryRaw<Array<{ datname: string }>>`
      SELECT datname
      FROM pg_database
      WHERE datname = ${options.databaseName}
      LIMIT 1
    `

    if (existingDatabase.length === 0) {
      assertDestructiveDatabaseActionAllowed('CREATE DATABASE')

      const createWithDefaultTemplate = async () => {
        try {
          await adminPrisma.$executeRawUnsafe(
            `CREATE DATABASE ${quotePostgresIdentifier(options.databaseName)} TEMPLATE template0`
          )
        } catch (template0Error) {
          await adminPrisma.$executeRawUnsafe(
            `CREATE DATABASE ${quotePostgresIdentifier(options.databaseName)}`
          )
          console.warn(
            'CREATE DATABASE WITH TEMPLATE template0 failed, fallback to default template used:',
            template0Error
          )
        }
      }

      if (options.templateDatabase) {
        try {
          await adminPrisma.$executeRawUnsafe(
            `CREATE DATABASE ${quotePostgresIdentifier(
              options.databaseName
            )} TEMPLATE ${quotePostgresIdentifier(options.templateDatabase)}`
          )
        } catch (templateError) {
          console.warn(
            `CREATE DATABASE WITH TEMPLATE ${options.templateDatabase} failed, fallback to standard template:`,
            templateError
          )
          await createWithDefaultTemplate()
        }
      } else {
        await createWithDefaultTemplate()
      }
      created = true
    }
  } finally {
    await adminPrisma.$disconnect()
  }

  return created
}

function buildManualDatabaseName(label?: string | null) {
  const normalizedLabel = normalizeIdentifier(label || 'pool')
  const timeSuffix = Date.now().toString(36)
  const randomSuffix = Math.floor(Math.random() * 1679616)
    .toString(36)
    .padStart(4, '0')
  let name = `klarando_manual_${normalizedLabel}_${timeSuffix}_${randomSuffix}`

  if (!/^[a-z_]/.test(name)) {
    name = `m_${name}`
  }

  return trimDatabaseIdentifier(name)
}

function resolveBaseDatabaseUrl() {
  const baseDatabaseUrl = process.env.DATABASE_URL
  if (!baseDatabaseUrl) {
    throw new Error('DATABASE_URL fehlt, Datenbank kann nicht erstellt werden.')
  }
  return baseDatabaseUrl
}

type RegistryTimestamp = Date | string

export type ChainDatabaseRegistryEntry = {
  chainId: string
  databaseName: string
  databaseUrl: string
  createdAt: RegistryTimestamp
  updatedAt: RegistryTimestamp
}

export type TenantDatabaseRegistryEntry = {
  tenantId: string
  databaseName: string
  databaseUrl: string
  chainCode: string | null
  tenantName: string | null
  createdAt: RegistryTimestamp
  updatedAt: RegistryTimestamp
}

export type UnassignedDatabaseRegistryEntry = {
  id: string
  databaseName: string
  databaseUrl: string
  label: string | null
  createdAt: RegistryTimestamp
  updatedAt: RegistryTimestamp
}

export async function provisionChainDatabase(
  chainId: string,
  chainCode: string
): Promise<ChainDatabaseProvisioningResult> {
  const separateDbEnabled =
    (process.env.ENABLE_SEPARATE_CHAIN_DATABASES || 'true').trim().toLowerCase() !== 'false'
  if (!separateDbEnabled) {
    return {
      enabled: false,
      created: false,
      databaseName: null,
      databaseUrl: null,
    }
  }

  const baseDatabaseUrl = resolveBaseDatabaseUrl()

  const databaseName = deriveChainDatabaseName(chainCode, chainId)
  const databaseUrl = buildDatabaseUrlWithName(baseDatabaseUrl, databaseName)
  const adminDatabaseUrl = process.env.DATABASE_ADMIN_URL?.trim() || resolveAdminDatabaseUrl(baseDatabaseUrl)
  const templateDatabase =
    process.env.CHAIN_DATABASE_TEMPLATE?.trim() || process.env.TENANT_DATABASE_TEMPLATE?.trim() || ''

  const created = await createDatabaseIfMissing({
    adminDatabaseUrl,
    databaseName,
    templateDatabase,
  })

  await assignDatabaseToChain({
    chainId,
    databaseName,
    databaseUrl,
  })

  return {
    enabled: true,
    created,
    databaseName,
    databaseUrl,
  }
}

export async function provisionTenantDatabase(options: {
  tenantId: string
  tenantName: string | null
  chainCode: string | null
}): Promise<TenantDatabaseProvisioningResult> {
  const separateDbEnabled =
    (process.env.ENABLE_SEPARATE_TENANT_DATABASES || 'true').trim().toLowerCase() !== 'false'
  if (!separateDbEnabled) {
    return {
      enabled: false,
      created: false,
      databaseName: null,
      databaseUrl: null,
    }
  }

  const baseDatabaseUrl = resolveBaseDatabaseUrl()

  const scope = options.tenantName?.trim() || options.chainCode?.trim() || options.tenantId
  const databaseName = deriveTenantDatabaseName(scope, options.tenantId)
  const databaseUrl = buildDatabaseUrlWithName(baseDatabaseUrl, databaseName)
  const adminDatabaseUrl = process.env.DATABASE_ADMIN_URL?.trim() || resolveAdminDatabaseUrl(baseDatabaseUrl)
  const templateDatabase = process.env.TENANT_DATABASE_TEMPLATE?.trim() || ''

  const created = await createDatabaseIfMissing({
    adminDatabaseUrl,
    databaseName,
    templateDatabase,
  })

  await assignDatabaseToTenant({
    tenantId: options.tenantId,
    databaseName,
    databaseUrl,
    chainCode: options.chainCode,
    tenantName: options.tenantName,
  })

  return {
    enabled: true,
    created,
    databaseName,
    databaseUrl,
  }
}

export async function assignDatabaseToChain(options: {
  chainId: string
  databaseName: string
  databaseUrl: string
}) {
  await ensureChainRegistryTable()
  await prisma.$executeRaw`
    INSERT INTO chain_database_registry (chain_id, database_name, database_url, created_at, updated_at)
    VALUES (${options.chainId}, ${options.databaseName}, ${options.databaseUrl}, NOW(), NOW())
    ON CONFLICT (chain_id)
    DO UPDATE SET
      database_name = EXCLUDED.database_name,
      database_url = EXCLUDED.database_url,
      updated_at = NOW()
  `
}

export async function assignDatabaseToTenant(options: {
  tenantId: string
  databaseName: string
  databaseUrl: string
  chainCode?: string | null
  tenantName?: string | null
}) {
  await ensureTenantRegistryTable()
  await prisma.$executeRaw`
    INSERT INTO tenant_database_registry (
      tenant_id,
      database_name,
      database_url,
      chain_code,
      tenant_name,
      created_at,
      updated_at
    )
    VALUES (
      ${options.tenantId},
      ${options.databaseName},
      ${options.databaseUrl},
      ${options.chainCode || null},
      ${options.tenantName || null},
      NOW(),
      NOW()
    )
    ON CONFLICT (tenant_id)
    DO UPDATE SET
      database_name = EXCLUDED.database_name,
      database_url = EXCLUDED.database_url,
      chain_code = EXCLUDED.chain_code,
      tenant_name = EXCLUDED.tenant_name,
      updated_at = NOW()
  `
}

export async function storeUnassignedDatabase(options: {
  databaseName: string
  databaseUrl: string
  label?: string | null
}) {
  await ensureUnassignedRegistryTable()
  await prisma.$executeRaw`
    INSERT INTO unassigned_database_registry (
      id,
      database_name,
      database_url,
      label,
      created_at,
      updated_at
    )
    VALUES (
      ${randomUUID()},
      ${options.databaseName},
      ${options.databaseUrl},
      ${options.label || null},
      NOW(),
      NOW()
    )
    ON CONFLICT (database_name)
    DO UPDATE SET
      database_url = EXCLUDED.database_url,
      label = EXCLUDED.label,
      updated_at = NOW()
  `
}

export async function removeUnassignedDatabaseByName(databaseName: string) {
  assertDestructiveDatabaseActionAllowed('DELETE unassigned_database_registry')
  await ensureUnassignedRegistryTable()
  await prisma.$executeRaw`
    DELETE FROM unassigned_database_registry
    WHERE database_name = ${databaseName}
  `
}

export async function releaseChainDatabaseToUnassigned(
  chainId: string,
  label?: string | null
) {
  assertDestructiveDatabaseActionAllowed('RELEASE chain database assignment')
  await ensureProvisioningRegistryTables()
  const rows = await prisma.$queryRaw<
    Array<{
      databaseName: string
      databaseUrl: string
    }>
  >`
    SELECT
      database_name AS "databaseName",
      database_url AS "databaseUrl"
    FROM chain_database_registry
    WHERE chain_id = ${chainId}
    LIMIT 1
  `

  const row = rows[0]
  if (!row) {
    return null
  }

  await prisma.$executeRaw`
    DELETE FROM chain_database_registry
    WHERE chain_id = ${chainId}
  `

  await storeUnassignedDatabase({
    databaseName: row.databaseName,
    databaseUrl: row.databaseUrl,
    label: label || null,
  })

  return row
}

export async function releaseTenantDatabaseToUnassigned(
  tenantId: string,
  label?: string | null
) {
  assertDestructiveDatabaseActionAllowed('RELEASE tenant database assignment')
  await ensureProvisioningRegistryTables()
  const rows = await prisma.$queryRaw<
    Array<{
      databaseName: string
      databaseUrl: string
    }>
  >`
    SELECT
      database_name AS "databaseName",
      database_url AS "databaseUrl"
    FROM tenant_database_registry
    WHERE tenant_id = ${tenantId}
    LIMIT 1
  `

  const row = rows[0]
  if (!row) {
    return null
  }

  await prisma.$executeRaw`
    DELETE FROM tenant_database_registry
    WHERE tenant_id = ${tenantId}
  `

  await storeUnassignedDatabase({
    databaseName: row.databaseName,
    databaseUrl: row.databaseUrl,
    label: label || null,
  })

  return row
}

export async function findDatabaseAssignmentsByName(databaseName: string) {
  await ensureProvisioningRegistryTables()

  const [chainAssignments, tenantAssignments, unassignedEntries] = await Promise.all([
    prisma.$queryRaw<Array<{ chainId: string }>>`
      SELECT chain_id AS "chainId"
      FROM chain_database_registry
      WHERE database_name = ${databaseName}
    `,
    prisma.$queryRaw<Array<{ tenantId: string }>>`
      SELECT tenant_id AS "tenantId"
      FROM tenant_database_registry
      WHERE database_name = ${databaseName}
    `,
    prisma.$queryRaw<Array<{ id: string }>>`
      SELECT id
      FROM unassigned_database_registry
      WHERE database_name = ${databaseName}
    `,
  ])

  return {
    chainAssignments,
    tenantAssignments,
    unassignedEntries,
  }
}

export async function removeDatabaseAssignmentsByName(databaseName: string) {
  assertDestructiveDatabaseActionAllowed('DELETE database assignments')
  await ensureProvisioningRegistryTables()

  const [removedChains, removedTenants, removedUnassigned] = await Promise.all([
    prisma.$executeRaw`
      DELETE FROM chain_database_registry
      WHERE database_name = ${databaseName}
    `,
    prisma.$executeRaw`
      DELETE FROM tenant_database_registry
      WHERE database_name = ${databaseName}
    `,
    prisma.$executeRaw`
      DELETE FROM unassigned_database_registry
      WHERE database_name = ${databaseName}
    `,
  ])

  return {
    removedChains: Number(removedChains || 0),
    removedTenants: Number(removedTenants || 0),
    removedUnassigned: Number(removedUnassigned || 0),
  }
}

export async function dropDatabasePermanently(databaseName: string) {
  assertDestructiveDatabaseActionAllowed('DROP DATABASE')

  if (!/^[a-z_][a-z0-9_]{0,62}$/.test(databaseName)) {
    throw new Error('Ungueltiger Datenbankname')
  }

  const baseDatabaseUrl = resolveBaseDatabaseUrl()
  const adminDatabaseUrl = process.env.DATABASE_ADMIN_URL?.trim() || resolveAdminDatabaseUrl(baseDatabaseUrl)

  const protectedDatabases = new Set(['postgres', 'template0', 'template1'])
  for (const url of [baseDatabaseUrl, adminDatabaseUrl]) {
    const parsed = new URL(url)
    const name = parsed.pathname.replace(/^\//, '').trim().toLowerCase()
    if (name) {
      protectedDatabases.add(name)
    }
  }

  if (protectedDatabases.has(databaseName)) {
    throw new Error('Diese Datenbank ist geschuetzt und kann nicht geloescht werden')
  }

  const adminPrisma = new PrismaClient({
    datasources: {
      db: {
        url: adminDatabaseUrl,
      },
    },
  })

  try {
    await adminPrisma.$executeRaw`
      SELECT pg_terminate_backend(pid)
      FROM pg_stat_activity
      WHERE datname = ${databaseName}
        AND pid <> pg_backend_pid()
    `
    await adminPrisma.$executeRawUnsafe(
      `DROP DATABASE IF EXISTS ${quotePostgresIdentifier(databaseName)}`
    )
  } finally {
    await adminPrisma.$disconnect()
  }
}

export async function createEmptyDatabase(options?: {
  label?: string | null
  databaseName?: string | null
  templateDatabase?: string | null
}) {
  const baseDatabaseUrl = resolveBaseDatabaseUrl()
  let databaseName =
    typeof options?.databaseName === 'string' && options.databaseName.trim().length > 0
      ? normalizeIdentifier(options.databaseName).slice(0, POSTGRES_IDENTIFIER_MAX_LENGTH)
      : buildManualDatabaseName(options?.label)
  if (!/^[a-z_]/.test(databaseName)) {
    databaseName = `m_${databaseName}`.slice(0, POSTGRES_IDENTIFIER_MAX_LENGTH)
  }
  const databaseUrl = buildDatabaseUrlWithName(baseDatabaseUrl, databaseName)
  const adminDatabaseUrl = process.env.DATABASE_ADMIN_URL?.trim() || resolveAdminDatabaseUrl(baseDatabaseUrl)
  const templateDatabase =
    options?.templateDatabase?.trim() ||
    process.env.MANUAL_DATABASE_TEMPLATE?.trim() ||
    ''

  const created = await createDatabaseIfMissing({
    adminDatabaseUrl,
    databaseName,
    templateDatabase,
  })

  return {
    created,
    databaseName,
    databaseUrl,
  }
}

export async function databaseExists(databaseName: string) {
  const baseDatabaseUrl = resolveBaseDatabaseUrl()
  const adminDatabaseUrl = process.env.DATABASE_ADMIN_URL?.trim() || resolveAdminDatabaseUrl(baseDatabaseUrl)
  const adminPrisma = new PrismaClient({
    datasources: {
      db: {
        url: adminDatabaseUrl,
      },
    },
  })

  try {
    const existingDatabase = await adminPrisma.$queryRaw<Array<{ datname: string }>>`
      SELECT datname
      FROM pg_database
      WHERE datname = ${databaseName}
      LIMIT 1
    `
    return existingDatabase.length > 0
  } finally {
    await adminPrisma.$disconnect()
  }
}

export function buildDatabaseUrlFromName(databaseName: string) {
  const baseDatabaseUrl = resolveBaseDatabaseUrl()
  return buildDatabaseUrlWithName(baseDatabaseUrl, databaseName)
}

export async function getDatabaseRegistryOverview() {
  await ensureProvisioningRegistryTables()

  const [chainAssignments, tenantAssignments, unassignedDatabases] = await Promise.all([
    prisma.$queryRaw<Array<ChainDatabaseRegistryEntry>>`
      SELECT
        chain_id AS "chainId",
        database_name AS "databaseName",
        database_url AS "databaseUrl",
        created_at AS "createdAt",
        updated_at AS "updatedAt"
      FROM chain_database_registry
      ORDER BY updated_at DESC
    `,
    prisma.$queryRaw<Array<TenantDatabaseRegistryEntry>>`
      SELECT
        tenant_id AS "tenantId",
        database_name AS "databaseName",
        database_url AS "databaseUrl",
        chain_code AS "chainCode",
        tenant_name AS "tenantName",
        created_at AS "createdAt",
        updated_at AS "updatedAt"
      FROM tenant_database_registry
      ORDER BY updated_at DESC
    `,
    prisma.$queryRaw<Array<UnassignedDatabaseRegistryEntry>>`
      SELECT
        id,
        database_name AS "databaseName",
        database_url AS "databaseUrl",
        label,
        created_at AS "createdAt",
        updated_at AS "updatedAt"
      FROM unassigned_database_registry
      ORDER BY updated_at DESC
    `,
  ])

  return {
    chainAssignments,
    tenantAssignments,
    unassignedDatabases,
  }
}
