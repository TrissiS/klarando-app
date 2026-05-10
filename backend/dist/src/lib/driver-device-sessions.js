"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DRIVER_DEVICE_SESSION_TARGET_TYPE = exports.DRIVER_DEVICE_SESSION_MODULE = void 0;
exports.listDriverDeviceSessionsForTenant = listDriverDeviceSessionsForTenant;
exports.resolveDriverDeviceSession = resolveDriverDeviceSession;
const prisma_1 = require("./prisma");
exports.DRIVER_DEVICE_SESSION_MODULE = 'driver_device_session';
exports.DRIVER_DEVICE_SESSION_TARGET_TYPE = 'driver_device_session';
function normalizeText(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function parseIsoTimestamp(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const parsed = new Date(value);
    if (Number.isNaN(parsed.getTime())) {
        return null;
    }
    return parsed.toISOString();
}
function readSessionMetadata(metadata) {
    if (!metadata || typeof metadata !== 'object' || Array.isArray(metadata)) {
        return null;
    }
    const source = metadata;
    return {
        displayCode: normalizeText(source.displayCode),
        displayId: normalizeText(source.displayId),
        deviceLabel: normalizeText(source.deviceLabel),
        expiresAt: parseIsoTimestamp(source.expiresAt),
        driverUserId: normalizeText(source.driverUserId),
        driverName: normalizeText(source.driverName),
    };
}
async function listDriverDeviceSessionsForTenant(tenantId, options) {
    const now = Date.now();
    const lookbackStart = new Date(now - 14 * 24 * 60 * 60 * 1000);
    const rows = await prisma_1.prisma.auditLog.findMany({
        where: {
            tenantId,
            module: exports.DRIVER_DEVICE_SESSION_MODULE,
            targetType: exports.DRIVER_DEVICE_SESSION_TARGET_TYPE,
            action: {
                in: ['session_issued', 'session_bound', 'session_heartbeat', 'session_revoked'],
            },
            createdAt: {
                gte: lookbackStart,
            },
        },
        select: {
            targetId: true,
            action: true,
            metadata: true,
            createdAt: true,
        },
        orderBy: {
            createdAt: 'asc',
        },
        take: 10000,
    });
    const bySessionId = new Map();
    for (const row of rows) {
        const sessionId = normalizeText(row.targetId);
        if (!sessionId) {
            continue;
        }
        const metadata = readSessionMetadata(row.metadata);
        if (!metadata) {
            continue;
        }
        if (row.action === 'session_issued') {
            if (!metadata.displayCode || !metadata.deviceLabel || !metadata.expiresAt) {
                continue;
            }
            bySessionId.set(sessionId, {
                sessionId,
                tenantId,
                displayCode: metadata.displayCode.toUpperCase(),
                displayId: metadata.displayId,
                deviceLabel: metadata.deviceLabel,
                issuedAt: row.createdAt.toISOString(),
                expiresAt: metadata.expiresAt,
                lastHeartbeatAt: null,
                revokedAt: null,
                driverUserId: metadata.driverUserId,
                driverName: metadata.driverName,
            });
            continue;
        }
        const existing = bySessionId.get(sessionId);
        if (!existing) {
            continue;
        }
        if (row.action === 'session_bound') {
            existing.driverUserId = metadata.driverUserId;
            existing.driverName = metadata.driverName;
            if (metadata.deviceLabel) {
                existing.deviceLabel = metadata.deviceLabel;
            }
            if (metadata.displayCode) {
                existing.displayCode = metadata.displayCode.toUpperCase();
            }
            if (metadata.displayId) {
                existing.displayId = metadata.displayId;
            }
            if (metadata.expiresAt) {
                existing.expiresAt = metadata.expiresAt;
            }
            continue;
        }
        if (row.action === 'session_heartbeat') {
            existing.lastHeartbeatAt = row.createdAt.toISOString();
            continue;
        }
        if (row.action === 'session_revoked') {
            existing.revokedAt = row.createdAt.toISOString();
            continue;
        }
    }
    const displayCodeFilter = normalizeText(options?.displayCode)?.toUpperCase() ?? null;
    const sessions = Array.from(bySessionId.values())
        .map((entry) => {
        const expiresAtMs = new Date(entry.expiresAt).getTime();
        const isActive = !entry.revokedAt && Number.isFinite(expiresAtMs) && expiresAtMs > now;
        const heartbeatAtMs = entry.lastHeartbeatAt
            ? new Date(entry.lastHeartbeatAt).getTime()
            : Number.NaN;
        const isOnline = isActive && Number.isFinite(heartbeatAtMs) && now - heartbeatAtMs <= 90000;
        return {
            sessionId: entry.sessionId,
            tenantId: entry.tenantId,
            displayCode: entry.displayCode,
            displayId: entry.displayId,
            deviceLabel: entry.deviceLabel,
            issuedAt: entry.issuedAt,
            expiresAt: entry.expiresAt,
            lastHeartbeatAt: entry.lastHeartbeatAt,
            revokedAt: entry.revokedAt,
            driverUserId: entry.driverUserId,
            driverName: entry.driverName,
            isActive,
            isOnline,
        };
    })
        .filter((entry) => {
        if (displayCodeFilter && entry.displayCode !== displayCodeFilter) {
            return false;
        }
        if (options?.includeExpired) {
            return true;
        }
        return entry.isActive;
    })
        .sort((left, right) => {
        const leftIssued = new Date(left.issuedAt).getTime();
        const rightIssued = new Date(right.issuedAt).getTime();
        return rightIssued - leftIssued;
    });
    return sessions;
}
async function resolveDriverDeviceSession(sessionId, tenantId) {
    const sessions = await listDriverDeviceSessionsForTenant(tenantId, {
        includeExpired: true,
    });
    const match = sessions.find((entry) => entry.sessionId === sessionId);
    return match ?? null;
}
