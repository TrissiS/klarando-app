"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ensureProvisioningRegistryTables = ensureProvisioningRegistryTables;
exports.provisionChainDatabase = provisionChainDatabase;
exports.provisionTenantDatabase = provisionTenantDatabase;
exports.assignDatabaseToChain = assignDatabaseToChain;
exports.assignDatabaseToTenant = assignDatabaseToTenant;
exports.storeUnassignedDatabase = storeUnassignedDatabase;
exports.removeUnassignedDatabaseByName = removeUnassignedDatabaseByName;
exports.releaseChainDatabaseToUnassigned = releaseChainDatabaseToUnassigned;
exports.releaseTenantDatabaseToUnassigned = releaseTenantDatabaseToUnassigned;
exports.findDatabaseAssignmentsByName = findDatabaseAssignmentsByName;
exports.removeDatabaseAssignmentsByName = removeDatabaseAssignmentsByName;
exports.dropDatabasePermanently = dropDatabasePermanently;
exports.createEmptyDatabase = createEmptyDatabase;
exports.databaseExists = databaseExists;
exports.buildDatabaseUrlFromName = buildDatabaseUrlFromName;
exports.getDatabaseRegistryOverview = getDatabaseRegistryOverview;
const client_1 = require("@prisma/client");
const crypto_1 = require("crypto");
const prisma_1 = require("./prisma");
const POSTGRES_IDENTIFIER_MAX_LENGTH = 63;
const PROVISIONING_REGISTRY_ADVISORY_LOCK_KEY = 824420511;
const REGISTRY_TABLES_DDL = `
  CREATE TABLE IF NOT EXISTS chain_database_registry (
    chain_id TEXT PRIMARY KEY,
    database_name TEXT NOT NULL UNIQUE,
    database_url TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
  );

  CREATE TABLE IF NOT EXISTS tenant_database_registry (
    tenant_id TEXT PRIMARY KEY,
    database_name TEXT NOT NULL UNIQUE,
    database_url TEXT NOT NULL,
    chain_code TEXT,
    tenant_name TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
  );

  CREATE TABLE IF NOT EXISTS unassigned_database_registry (
    id TEXT PRIMARY KEY,
    database_name TEXT NOT NULL UNIQUE,
    database_url TEXT NOT NULL,
    label TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
  );
`;
function isProductionEnvironment() {
    return (process.env.NODE_ENV || '').trim().toLowerCase() === 'production';
}
function isExplicitlyAllowed(value) {
    return (value || '').trim().toLowerCase() === 'true';
}
function assertDestructiveDatabaseActionAllowed(actionName) {
    if (isProductionEnvironment() &&
        !isExplicitlyAllowed(process.env.ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS)) {
        throw new Error(`DB-Aktion "${actionName}" ist in Produktion blockiert. Setze ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS=true nur fuer explizit freigegebene Wartungsfenster.`);
    }
}
function normalizeIdentifier(rawValue) {
    const normalized = rawValue
        .trim()
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, '_')
        .replace(/^_+|_+$/g, '');
    return normalized || 'tenant';
}
function quotePostgresIdentifier(identifier) {
    return `"${identifier.replace(/"/g, '""')}"`;
}
function buildDatabaseUrlWithName(baseUrl, databaseName) {
    const parsed = new URL(baseUrl);
    parsed.pathname = `/${databaseName}`;
    return parsed.toString();
}
function resolveAdminDatabaseUrl(baseUrl) {
    const parsed = new URL(baseUrl);
    parsed.pathname = '/postgres';
    parsed.searchParams.delete('schema');
    return parsed.toString();
}
function trimDatabaseIdentifier(name) {
    if (name.length <= POSTGRES_IDENTIFIER_MAX_LENGTH) {
        return name;
    }
    return name.slice(0, POSTGRES_IDENTIFIER_MAX_LENGTH);
}
function deriveChainDatabaseName(chainCode, chainId) {
    const normalizedCode = normalizeIdentifier(chainCode);
    const normalizedId = chainId.replace(/[^a-zA-Z0-9]/g, '').toLowerCase().slice(0, 10);
    let name = `klarando_${normalizedCode}_${normalizedId}`;
    if (!/^[a-z_]/.test(name)) {
        name = `k_${name}`;
    }
    return trimDatabaseIdentifier(name);
}
function deriveTenantDatabaseName(scope, tenantId) {
    const normalizedScope = normalizeIdentifier(scope);
    const normalizedId = tenantId.replace(/[^a-zA-Z0-9]/g, '').toLowerCase().slice(0, 10);
    let name = `klarando_tenant_${normalizedScope}_${normalizedId}`;
    if (!/^[a-z_]/.test(name)) {
        name = `t_${name}`;
    }
    return trimDatabaseIdentifier(name);
}
async function ensureRegistryTablesWithLock(tx) {
    await tx.$executeRaw `SELECT pg_advisory_xact_lock(${PROVISIONING_REGISTRY_ADVISORY_LOCK_KEY})`;
    await tx.$executeRawUnsafe(REGISTRY_TABLES_DDL);
}
async function ensureChainRegistryTable() {
    await prisma_1.prisma.$transaction(async (tx) => {
        await ensureRegistryTablesWithLock(tx);
    });
}
async function ensureTenantRegistryTable() {
    await prisma_1.prisma.$transaction(async (tx) => {
        await ensureRegistryTablesWithLock(tx);
    });
}
async function ensureUnassignedRegistryTable() {
    await prisma_1.prisma.$transaction(async (tx) => {
        await ensureRegistryTablesWithLock(tx);
    });
}
async function ensureProvisioningRegistryTables() {
    await prisma_1.prisma.$transaction(async (tx) => {
        await ensureRegistryTablesWithLock(tx);
    });
}
async function createDatabaseIfMissing(options) {
    const adminPrisma = new client_1.PrismaClient({
        datasources: {
            db: {
                url: options.adminDatabaseUrl,
            },
        },
    });
    let created = false;
    try {
        const existingDatabase = await adminPrisma.$queryRaw `
      SELECT datname
      FROM pg_database
      WHERE datname = ${options.databaseName}
      LIMIT 1
    `;
        if (existingDatabase.length === 0) {
            assertDestructiveDatabaseActionAllowed('CREATE DATABASE');
            const createWithDefaultTemplate = async () => {
                try {
                    await adminPrisma.$executeRawUnsafe(`CREATE DATABASE ${quotePostgresIdentifier(options.databaseName)} TEMPLATE template0`);
                }
                catch (template0Error) {
                    await adminPrisma.$executeRawUnsafe(`CREATE DATABASE ${quotePostgresIdentifier(options.databaseName)}`);
                    console.warn('CREATE DATABASE WITH TEMPLATE template0 failed, fallback to default template used:', template0Error);
                }
            };
            if (options.templateDatabase) {
                try {
                    await adminPrisma.$executeRawUnsafe(`CREATE DATABASE ${quotePostgresIdentifier(options.databaseName)} TEMPLATE ${quotePostgresIdentifier(options.templateDatabase)}`);
                }
                catch (templateError) {
                    console.warn(`CREATE DATABASE WITH TEMPLATE ${options.templateDatabase} failed, fallback to standard template:`, templateError);
                    await createWithDefaultTemplate();
                }
            }
            else {
                await createWithDefaultTemplate();
            }
            created = true;
        }
    }
    finally {
        await adminPrisma.$disconnect();
    }
    return created;
}
function buildManualDatabaseName(label) {
    const normalizedLabel = normalizeIdentifier(label || 'pool');
    const timeSuffix = Date.now().toString(36);
    const randomSuffix = Math.floor(Math.random() * 1679616)
        .toString(36)
        .padStart(4, '0');
    let name = `klarando_manual_${normalizedLabel}_${timeSuffix}_${randomSuffix}`;
    if (!/^[a-z_]/.test(name)) {
        name = `m_${name}`;
    }
    return trimDatabaseIdentifier(name);
}
function resolveBaseDatabaseUrl() {
    const baseDatabaseUrl = process.env.DATABASE_URL;
    if (!baseDatabaseUrl) {
        throw new Error('DATABASE_URL fehlt, Datenbank kann nicht erstellt werden.');
    }
    return baseDatabaseUrl;
}
async function provisionChainDatabase(chainId, chainCode) {
    const separateDbEnabled = (process.env.ENABLE_SEPARATE_CHAIN_DATABASES || 'true').trim().toLowerCase() !== 'false';
    if (!separateDbEnabled) {
        return {
            enabled: false,
            created: false,
            databaseName: null,
            databaseUrl: null,
        };
    }
    const baseDatabaseUrl = resolveBaseDatabaseUrl();
    const databaseName = deriveChainDatabaseName(chainCode, chainId);
    const databaseUrl = buildDatabaseUrlWithName(baseDatabaseUrl, databaseName);
    const adminDatabaseUrl = process.env.DATABASE_ADMIN_URL?.trim() || resolveAdminDatabaseUrl(baseDatabaseUrl);
    const templateDatabase = process.env.CHAIN_DATABASE_TEMPLATE?.trim() || process.env.TENANT_DATABASE_TEMPLATE?.trim() || '';
    const created = await createDatabaseIfMissing({
        adminDatabaseUrl,
        databaseName,
        templateDatabase,
    });
    await assignDatabaseToChain({
        chainId,
        databaseName,
        databaseUrl,
    });
    return {
        enabled: true,
        created,
        databaseName,
        databaseUrl,
    };
}
async function provisionTenantDatabase(options) {
    const separateDbEnabled = (process.env.ENABLE_SEPARATE_TENANT_DATABASES || 'true').trim().toLowerCase() !== 'false';
    if (!separateDbEnabled) {
        return {
            enabled: false,
            created: false,
            databaseName: null,
            databaseUrl: null,
        };
    }
    const baseDatabaseUrl = resolveBaseDatabaseUrl();
    const scope = options.tenantName?.trim() || options.chainCode?.trim() || options.tenantId;
    const databaseName = deriveTenantDatabaseName(scope, options.tenantId);
    const databaseUrl = buildDatabaseUrlWithName(baseDatabaseUrl, databaseName);
    const adminDatabaseUrl = process.env.DATABASE_ADMIN_URL?.trim() || resolveAdminDatabaseUrl(baseDatabaseUrl);
    const templateDatabase = process.env.TENANT_DATABASE_TEMPLATE?.trim() || '';
    const created = await createDatabaseIfMissing({
        adminDatabaseUrl,
        databaseName,
        templateDatabase,
    });
    await assignDatabaseToTenant({
        tenantId: options.tenantId,
        databaseName,
        databaseUrl,
        chainCode: options.chainCode,
        tenantName: options.tenantName,
    });
    return {
        enabled: true,
        created,
        databaseName,
        databaseUrl,
    };
}
async function assignDatabaseToChain(options) {
    await ensureChainRegistryTable();
    await prisma_1.prisma.$executeRaw `
    INSERT INTO chain_database_registry (chain_id, database_name, database_url, created_at, updated_at)
    VALUES (${options.chainId}, ${options.databaseName}, ${options.databaseUrl}, NOW(), NOW())
    ON CONFLICT (chain_id)
    DO UPDATE SET
      database_name = EXCLUDED.database_name,
      database_url = EXCLUDED.database_url,
      updated_at = NOW()
  `;
}
async function assignDatabaseToTenant(options) {
    await ensureTenantRegistryTable();
    await prisma_1.prisma.$executeRaw `
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
  `;
}
async function storeUnassignedDatabase(options) {
    await ensureUnassignedRegistryTable();
    await prisma_1.prisma.$executeRaw `
    INSERT INTO unassigned_database_registry (
      id,
      database_name,
      database_url,
      label,
      created_at,
      updated_at
    )
    VALUES (
      ${(0, crypto_1.randomUUID)()},
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
  `;
}
async function removeUnassignedDatabaseByName(databaseName) {
    assertDestructiveDatabaseActionAllowed('DELETE unassigned_database_registry');
    await ensureUnassignedRegistryTable();
    await prisma_1.prisma.$executeRaw `
    DELETE FROM unassigned_database_registry
    WHERE database_name = ${databaseName}
  `;
}
async function releaseChainDatabaseToUnassigned(chainId, label) {
    assertDestructiveDatabaseActionAllowed('RELEASE chain database assignment');
    await ensureProvisioningRegistryTables();
    const rows = await prisma_1.prisma.$queryRaw `
    SELECT
      database_name AS "databaseName",
      database_url AS "databaseUrl"
    FROM chain_database_registry
    WHERE chain_id = ${chainId}
    LIMIT 1
  `;
    const row = rows[0];
    if (!row) {
        return null;
    }
    await prisma_1.prisma.$executeRaw `
    DELETE FROM chain_database_registry
    WHERE chain_id = ${chainId}
  `;
    await storeUnassignedDatabase({
        databaseName: row.databaseName,
        databaseUrl: row.databaseUrl,
        label: label || null,
    });
    return row;
}
async function releaseTenantDatabaseToUnassigned(tenantId, label) {
    assertDestructiveDatabaseActionAllowed('RELEASE tenant database assignment');
    await ensureProvisioningRegistryTables();
    const rows = await prisma_1.prisma.$queryRaw `
    SELECT
      database_name AS "databaseName",
      database_url AS "databaseUrl"
    FROM tenant_database_registry
    WHERE tenant_id = ${tenantId}
    LIMIT 1
  `;
    const row = rows[0];
    if (!row) {
        return null;
    }
    await prisma_1.prisma.$executeRaw `
    DELETE FROM tenant_database_registry
    WHERE tenant_id = ${tenantId}
  `;
    await storeUnassignedDatabase({
        databaseName: row.databaseName,
        databaseUrl: row.databaseUrl,
        label: label || null,
    });
    return row;
}
async function findDatabaseAssignmentsByName(databaseName) {
    await ensureProvisioningRegistryTables();
    const [chainAssignments, tenantAssignments, unassignedEntries] = await Promise.all([
        prisma_1.prisma.$queryRaw `
      SELECT chain_id AS "chainId"
      FROM chain_database_registry
      WHERE database_name = ${databaseName}
    `,
        prisma_1.prisma.$queryRaw `
      SELECT tenant_id AS "tenantId"
      FROM tenant_database_registry
      WHERE database_name = ${databaseName}
    `,
        prisma_1.prisma.$queryRaw `
      SELECT id
      FROM unassigned_database_registry
      WHERE database_name = ${databaseName}
    `,
    ]);
    return {
        chainAssignments,
        tenantAssignments,
        unassignedEntries,
    };
}
async function removeDatabaseAssignmentsByName(databaseName) {
    assertDestructiveDatabaseActionAllowed('DELETE database assignments');
    await ensureProvisioningRegistryTables();
    const [removedChains, removedTenants, removedUnassigned] = await Promise.all([
        prisma_1.prisma.$executeRaw `
      DELETE FROM chain_database_registry
      WHERE database_name = ${databaseName}
    `,
        prisma_1.prisma.$executeRaw `
      DELETE FROM tenant_database_registry
      WHERE database_name = ${databaseName}
    `,
        prisma_1.prisma.$executeRaw `
      DELETE FROM unassigned_database_registry
      WHERE database_name = ${databaseName}
    `,
    ]);
    return {
        removedChains: Number(removedChains || 0),
        removedTenants: Number(removedTenants || 0),
        removedUnassigned: Number(removedUnassigned || 0),
    };
}
async function dropDatabasePermanently(databaseName) {
    assertDestructiveDatabaseActionAllowed('DROP DATABASE');
    if (!/^[a-z_][a-z0-9_]{0,62}$/.test(databaseName)) {
        throw new Error('Ungueltiger Datenbankname');
    }
    const baseDatabaseUrl = resolveBaseDatabaseUrl();
    const adminDatabaseUrl = process.env.DATABASE_ADMIN_URL?.trim() || resolveAdminDatabaseUrl(baseDatabaseUrl);
    const protectedDatabases = new Set(['postgres', 'template0', 'template1']);
    for (const url of [baseDatabaseUrl, adminDatabaseUrl]) {
        const parsed = new URL(url);
        const name = parsed.pathname.replace(/^\//, '').trim().toLowerCase();
        if (name) {
            protectedDatabases.add(name);
        }
    }
    if (protectedDatabases.has(databaseName)) {
        throw new Error('Diese Datenbank ist geschuetzt und kann nicht geloescht werden');
    }
    const adminPrisma = new client_1.PrismaClient({
        datasources: {
            db: {
                url: adminDatabaseUrl,
            },
        },
    });
    try {
        await adminPrisma.$executeRaw `
      SELECT pg_terminate_backend(pid)
      FROM pg_stat_activity
      WHERE datname = ${databaseName}
        AND pid <> pg_backend_pid()
    `;
        await adminPrisma.$executeRawUnsafe(`DROP DATABASE IF EXISTS ${quotePostgresIdentifier(databaseName)}`);
    }
    finally {
        await adminPrisma.$disconnect();
    }
}
async function createEmptyDatabase(options) {
    const baseDatabaseUrl = resolveBaseDatabaseUrl();
    let databaseName = typeof options?.databaseName === 'string' && options.databaseName.trim().length > 0
        ? normalizeIdentifier(options.databaseName).slice(0, POSTGRES_IDENTIFIER_MAX_LENGTH)
        : buildManualDatabaseName(options?.label);
    if (!/^[a-z_]/.test(databaseName)) {
        databaseName = `m_${databaseName}`.slice(0, POSTGRES_IDENTIFIER_MAX_LENGTH);
    }
    const databaseUrl = buildDatabaseUrlWithName(baseDatabaseUrl, databaseName);
    const adminDatabaseUrl = process.env.DATABASE_ADMIN_URL?.trim() || resolveAdminDatabaseUrl(baseDatabaseUrl);
    const templateDatabase = options?.templateDatabase?.trim() ||
        process.env.MANUAL_DATABASE_TEMPLATE?.trim() ||
        '';
    const created = await createDatabaseIfMissing({
        adminDatabaseUrl,
        databaseName,
        templateDatabase,
    });
    return {
        created,
        databaseName,
        databaseUrl,
    };
}
async function databaseExists(databaseName) {
    const baseDatabaseUrl = resolveBaseDatabaseUrl();
    const adminDatabaseUrl = process.env.DATABASE_ADMIN_URL?.trim() || resolveAdminDatabaseUrl(baseDatabaseUrl);
    const adminPrisma = new client_1.PrismaClient({
        datasources: {
            db: {
                url: adminDatabaseUrl,
            },
        },
    });
    try {
        const existingDatabase = await adminPrisma.$queryRaw `
      SELECT datname
      FROM pg_database
      WHERE datname = ${databaseName}
      LIMIT 1
    `;
        return existingDatabase.length > 0;
    }
    finally {
        await adminPrisma.$disconnect();
    }
}
function buildDatabaseUrlFromName(databaseName) {
    const baseDatabaseUrl = resolveBaseDatabaseUrl();
    return buildDatabaseUrlWithName(baseDatabaseUrl, databaseName);
}
async function getDatabaseRegistryOverview() {
    await ensureProvisioningRegistryTables();
    const [chainAssignments, tenantAssignments, unassignedDatabases] = await Promise.all([
        prisma_1.prisma.$queryRaw `
      SELECT
        chain_id AS "chainId",
        database_name AS "databaseName",
        database_url AS "databaseUrl",
        created_at AS "createdAt",
        updated_at AS "updatedAt"
      FROM chain_database_registry
      ORDER BY updated_at DESC
    `,
        prisma_1.prisma.$queryRaw `
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
        prisma_1.prisma.$queryRaw `
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
    ]);
    return {
        chainAssignments,
        tenantAssignments,
        unassignedDatabases,
    };
}
