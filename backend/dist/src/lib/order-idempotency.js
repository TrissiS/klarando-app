"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.extractOrderIdempotencyKey = extractOrderIdempotencyKey;
exports.beginOrderCreateIdempotency = beginOrderCreateIdempotency;
exports.completeOrderCreateIdempotency = completeOrderCreateIdempotency;
exports.releaseOrderCreateIdempotency = releaseOrderCreateIdempotency;
const crypto_1 = __importDefault(require("crypto"));
const DEFAULT_DERIVED_TTL_MS = 45000;
const DEFAULT_EXPLICIT_TTL_MS = 10 * 60 * 1000;
const CLEANUP_INTERVAL_MS = 30000;
const idempotencyStore = new Map();
let lastCleanupAt = 0;
function normalizeIdempotencyKey(input) {
    if (typeof input !== 'string') {
        return null;
    }
    const trimmed = input.trim();
    if (!trimmed) {
        return null;
    }
    if (trimmed.length > 150) {
        return null;
    }
    if (!/^[A-Za-z0-9._:-]+$/.test(trimmed)) {
        return null;
    }
    return trimmed;
}
function stableSerialize(value) {
    if (value === null || value === undefined) {
        return 'null';
    }
    if (typeof value !== 'object') {
        return JSON.stringify(value);
    }
    if (Array.isArray(value)) {
        return `[${value.map((entry) => stableSerialize(entry)).join(',')}]`;
    }
    const source = value;
    const sortedKeys = Object.keys(source).sort((left, right) => left.localeCompare(right));
    return `{${sortedKeys
        .map((key) => `${JSON.stringify(key)}:${stableSerialize(source[key])}`)
        .join(',')}}`;
}
function toFingerprint(value) {
    const serialized = stableSerialize(value);
    return crypto_1.default.createHash('sha256').update(serialized).digest('hex');
}
function cleanupExpiredEntries(now) {
    if (now - lastCleanupAt < CLEANUP_INTERVAL_MS) {
        return;
    }
    lastCleanupAt = now;
    for (const [key, entry] of idempotencyStore.entries()) {
        if (entry.expiresAt <= now) {
            idempotencyStore.delete(key);
        }
    }
}
function extractOrderIdempotencyKey(headerValue, bodyValue) {
    if (Array.isArray(headerValue)) {
        for (const value of headerValue) {
            const normalized = normalizeIdempotencyKey(value);
            if (normalized) {
                return normalized;
            }
        }
    }
    else {
        const normalizedHeader = normalizeIdempotencyKey(headerValue);
        if (normalizedHeader) {
            return normalizedHeader;
        }
    }
    return normalizeIdempotencyKey(bodyValue);
}
function beginOrderCreateIdempotency(params) {
    const now = Date.now();
    cleanupExpiredEntries(now);
    const fingerprint = toFingerprint(params.fingerprintPayload);
    const source = params.idempotencyKey ? 'explicit' : 'derived';
    const rawKey = params.idempotencyKey ?? `auto:${fingerprint}`;
    const storeKey = `${params.routeKey}:${params.tenantId}:${rawKey}`;
    const entry = idempotencyStore.get(storeKey);
    if (entry && entry.expiresAt > now) {
        if (entry.fingerprint !== fingerprint) {
            return {
                status: 'conflict',
                reason: 'payload_mismatch',
            };
        }
        if (entry.status === 'in_progress') {
            return {
                status: 'in_progress',
            };
        }
        return {
            status: 'replay',
            orderId: entry.orderId,
        };
    }
    const ttl = source === 'explicit' ? DEFAULT_EXPLICIT_TTL_MS : DEFAULT_DERIVED_TTL_MS;
    idempotencyStore.set(storeKey, {
        key: storeKey,
        fingerprint,
        status: 'in_progress',
        source,
        orderId: null,
        expiresAt: now + ttl,
        updatedAt: now,
    });
    return {
        status: 'proceed',
        reservation: {
            key: storeKey,
            fingerprint,
        },
    };
}
function completeOrderCreateIdempotency(reservation, orderId) {
    const current = idempotencyStore.get(reservation.key);
    if (!current || current.fingerprint !== reservation.fingerprint) {
        return;
    }
    const now = Date.now();
    const ttl = current.source === 'explicit' ? DEFAULT_EXPLICIT_TTL_MS : DEFAULT_DERIVED_TTL_MS;
    current.status = 'completed';
    current.orderId = orderId;
    current.expiresAt = now + ttl;
    current.updatedAt = now;
    idempotencyStore.set(reservation.key, current);
}
function releaseOrderCreateIdempotency(reservation) {
    const current = idempotencyStore.get(reservation.key);
    if (!current || current.fingerprint !== reservation.fingerprint) {
        return;
    }
    if (current.status === 'in_progress') {
        idempotencyStore.delete(reservation.key);
    }
}
