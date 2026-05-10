"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const crypto_1 = __importDefault(require("crypto"));
const client_1 = require("@prisma/client");
const express_1 = require("express");
const orderdesk_device_token_1 = require("../auth/orderdesk-device-token");
const audit_1 = require("../lib/audit");
const driver_device_sessions_1 = require("../lib/driver-device-sessions");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const tenant_scope_1 = require("../lib/tenant-scope");
const rate_limit_1 = require("../middleware/rate-limit");
const router = (0, express_1.Router)();
const ORDERDESK_DEVICE_MODULE = 'orderdesk_device';
const ORDERDESK_DEVICE_TARGET_TYPE = 'orderdesk_device_binding';
const ORDERDESK_PAIRING_TARGET_TYPE = 'orderdesk_pairing_session';
function normalizeText(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function parsePositiveInteger(value) {
    const parsed = Number(value);
    if (!Number.isFinite(parsed)) {
        return null;
    }
    const rounded = Math.round(parsed);
    if (rounded <= 0) {
        return null;
    }
    return rounded;
}
function parseBoolean(value) {
    if (typeof value === 'boolean') {
        return value;
    }
    if (typeof value === 'string') {
        const normalized = value.trim().toLowerCase();
        if (normalized === 'true' || normalized === '1' || normalized === 'yes') {
            return true;
        }
        if (normalized === 'false' || normalized === '0' || normalized === 'no') {
            return false;
        }
    }
    return null;
}
function normalizeDeviceSerial(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const upper = value.trim().toUpperCase();
    if (upper.length < 4 || upper.length > 120) {
        return null;
    }
    if (!/^[A-Z0-9._:-]+$/.test(upper)) {
        return null;
    }
    return upper;
}
function parsePairingPayload(rawValue) {
    if (typeof rawValue !== 'string') {
        return null;
    }
    const raw = rawValue.trim();
    if (!raw) {
        return null;
    }
    if (raw.startsWith('klarando-orderdesk-pair:')) {
        const parts = raw.split(':');
        if (parts.length < 3) {
            return null;
        }
        return {
            token: parts.slice(2).join(':'),
            displayCode: normalizeText(parts[1])?.toUpperCase() ?? null,
        };
    }
    return {
        token: raw,
        displayCode: null,
    };
}
function createPairingSessionId() {
    return `odpk_${Date.now().toString(36)}_${crypto_1.default.randomBytes(6).toString('hex')}`;
}
function createDefaultAlias() {
    return `OrderDesk ${new Date().toLocaleString('de-DE')}`;
}
router.get('/bindings', (0, auth_1.requirePermission)(client_1.PermissionKey.ORDERS_READ), async (req, res) => {
    try {
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, req.query.tenantId, { allowMissingTenant: true });
        const includeInactive = parseBoolean(req.query.includeInactive) ?? true;
        const bindings = await prisma_1.prisma.orderDeskDeviceBinding.findMany({
            where: {
                ...(scope.tenantId
                    ? { tenantId: scope.tenantId }
                    : {
                        tenantId: {
                            in: scope.allowedTenantIds,
                        },
                    }),
                ...(includeInactive ? {} : { isActive: true }),
            },
            include: {
                display: {
                    select: {
                        id: true,
                        name: true,
                        displayCode: true,
                        displayRole: true,
                        isActive: true,
                    },
                },
            },
            orderBy: [{ isActive: 'desc' }, { lastSeenAt: 'desc' }, { boundAt: 'desc' }],
        });
        return res.json({
            total: bindings.length,
            bindings,
            generatedAt: new Date().toISOString(),
        });
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('GET ORDERDESK BINDINGS ERROR:', error);
        return res.status(500).json({ error: 'OrderDesk-Bindings konnten nicht geladen werden' });
    }
});
router.post('/pairing-session', (0, auth_1.requirePermission)(client_1.PermissionKey.ORDERS_WRITE), rate_limit_1.rateLimitOrderDeskPairing, async (req, res) => {
    try {
        const payload = req.body;
        const tenantId = normalizeText(payload.tenantId);
        const displayId = normalizeText(payload.displayId);
        const displayCode = normalizeText(payload.displayCode)?.toUpperCase() ?? null;
        const deviceAlias = normalizeText(payload.deviceAlias) ?? createDefaultAlias();
        const expiresMinutes = Math.min(180, Math.max(5, parsePositiveInteger(payload.expiresMinutes) ?? 20));
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantId);
        const scopedTenantId = scope.tenantId;
        if (!displayId && !displayCode) {
            return res.status(400).json({ error: 'displayId oder displayCode fehlt' });
        }
        const resolvedDisplayCode = displayCode ?? undefined;
        const display = await prisma_1.prisma.orderDisplay.findFirst({
            where: {
                tenantId: scopedTenantId,
                ...(displayId ? { id: displayId } : { displayCode: resolvedDisplayCode }),
            },
            select: {
                id: true,
                tenantId: true,
                displayCode: true,
                displayRole: true,
                isActive: true,
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Kassen-Display nicht gefunden' });
        }
        if (display.displayRole !== 'CASH') {
            return res.status(400).json({ error: 'OrderDesk darf nur mit Kassendisplay verbunden werden' });
        }
        if (!display.isActive) {
            return res.status(400).json({ error: 'Ausgewähltes Kassendisplay ist inaktiv' });
        }
        const sessionId = createPairingSessionId();
        const expiresAt = new Date(Date.now() + expiresMinutes * 60 * 1000);
        await prisma_1.prisma.orderDeskPairingSession.create({
            data: {
                id: sessionId,
                tenantId: display.tenantId,
                displayId: display.id,
                displayCode: display.displayCode,
                deviceAlias,
                createdByUserId: req.authUser?.id ?? null,
                expiresAt,
            },
        });
        const pairingToken = (0, orderdesk_device_token_1.signOrderDeskDeviceToken)({
            sid: sessionId,
            tenantId: display.tenantId,
            displayCode: display.displayCode,
            bindingId: null,
            deviceSerial: null,
            deviceAlias,
            kind: 'PAIRING',
            expiresAtMs: expiresAt.getTime(),
        });
        const pairingPayload = `klarando-orderdesk-pair:${display.displayCode}:${pairingToken}`;
        await (0, audit_1.writeAuditLog)({
            req,
            module: ORDERDESK_DEVICE_MODULE,
            action: 'pairing_session_created',
            targetType: ORDERDESK_PAIRING_TARGET_TYPE,
            targetId: sessionId,
            tenantId: display.tenantId,
            metadata: {
                displayId: display.id,
                displayCode: display.displayCode,
                deviceAlias,
                expiresAt: expiresAt.toISOString(),
            },
        });
        return res.status(201).json({
            ok: true,
            sessionId,
            tenantId: display.tenantId,
            displayId: display.id,
            displayCode: display.displayCode,
            deviceAlias,
            expiresAt: expiresAt.toISOString(),
            pairingToken,
            pairingPayload,
            qrImageUrl: `https://api.qrserver.com/v1/create-qr-code/?size=360x360&data=${encodeURIComponent(pairingPayload)}`,
        });
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('CREATE ORDERDESK PAIRING SESSION ERROR:', error);
        return res.status(500).json({ error: 'OrderDesk-QR konnte nicht erstellt werden' });
    }
});
router.post('/bindings/:bindingId/reset', (0, auth_1.requirePermission)(client_1.PermissionKey.ORDERS_WRITE), async (req, res) => {
    try {
        if (req.authUser?.role !== client_1.UserRole.SUPERADMIN) {
            return res.status(403).json({ error: 'Nur Superadmin darf OrderDesk-Bindings zurücksetzen' });
        }
        const bindingId = normalizeText(req.params.bindingId);
        if (!bindingId) {
            return res.status(400).json({ error: 'bindingId fehlt' });
        }
        const payload = req.body;
        const reason = normalizeText(payload.reason);
        const binding = await prisma_1.prisma.orderDeskDeviceBinding.findUnique({
            where: { id: bindingId },
            select: {
                id: true,
                tenantId: true,
                displayId: true,
                displayCode: true,
                deviceSerial: true,
                deviceAlias: true,
                isActive: true,
            },
        });
        if (!binding) {
            return res.status(404).json({ error: 'OrderDesk-Binding nicht gefunden' });
        }
        if (!binding.isActive) {
            return res.status(409).json({ error: 'Binding wurde bereits getrennt' });
        }
        const updated = await prisma_1.prisma.orderDeskDeviceBinding.update({
            where: { id: binding.id },
            data: {
                isActive: false,
                resetAt: new Date(),
                resetByUserId: req.authUser?.id ?? null,
                resetReason: reason,
            },
            include: {
                display: {
                    select: {
                        id: true,
                        name: true,
                        displayCode: true,
                        displayRole: true,
                    },
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: ORDERDESK_DEVICE_MODULE,
            action: 'binding_reset',
            targetType: ORDERDESK_DEVICE_TARGET_TYPE,
            targetId: binding.id,
            tenantId: binding.tenantId,
            metadata: {
                displayId: binding.displayId,
                displayCode: binding.displayCode,
                deviceSerial: binding.deviceSerial,
                deviceAlias: binding.deviceAlias,
                reason,
            },
        });
        return res.json({ ok: true, binding: updated });
    }
    catch (error) {
        console.error('RESET ORDERDESK BINDING ERROR:', error);
        return res.status(500).json({ error: 'OrderDesk-Binding konnte nicht zurückgesetzt werden' });
    }
});
router.post('/public/bind', rate_limit_1.rateLimitOrderDeskPairing, async (req, res) => {
    try {
        const payload = req.body;
        const parsedPair = parsePairingPayload(payload.pairingToken ?? payload.pairingPayload ?? payload.qrPayload);
        if (!parsedPair) {
            return res.status(400).json({ error: 'pairingToken oder QR-Payload fehlt' });
        }
        const tokenPayload = (0, orderdesk_device_token_1.verifyOrderDeskDeviceToken)(parsedPair.token);
        if (!tokenPayload || tokenPayload.kind !== 'PAIRING') {
            return res.status(401).json({ error: 'OrderDesk-QR ist ungültig oder abgelaufen' });
        }
        if (parsedPair.displayCode && parsedPair.displayCode !== tokenPayload.displayCode) {
            return res.status(400).json({ error: 'QR-Code gehört nicht zu diesem Kassendisplay' });
        }
        const deviceSerial = normalizeDeviceSerial(payload.deviceSerial);
        if (!deviceSerial) {
            return res.status(400).json({
                error: 'deviceSerial fehlt oder ist ungültig (4-120 Zeichen, A-Z, 0-9, Punkt, Doppelpunkt, Minus, Unterstrich)',
            });
        }
        const pairingSession = await prisma_1.prisma.orderDeskPairingSession.findUnique({
            where: { id: tokenPayload.sid },
            select: {
                id: true,
                tenantId: true,
                displayId: true,
                displayCode: true,
                deviceAlias: true,
                expiresAt: true,
                consumedAt: true,
                revokedAt: true,
            },
        });
        if (!pairingSession) {
            return res.status(404).json({ error: 'Pairing-Session wurde nicht gefunden' });
        }
        if (pairingSession.revokedAt) {
            return res.status(410).json({ error: 'Pairing-Session wurde bereits widerrufen' });
        }
        if (pairingSession.consumedAt) {
            return res.status(409).json({ error: 'Pairing-Session wurde bereits verwendet' });
        }
        if (pairingSession.expiresAt.getTime() <= Date.now()) {
            return res.status(401).json({ error: 'Pairing-Session ist abgelaufen' });
        }
        if (pairingSession.tenantId !== tokenPayload.tenantId ||
            pairingSession.displayCode !== tokenPayload.displayCode) {
            return res.status(401).json({ error: 'Pairing-Session passt nicht zum Token' });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { id: pairingSession.displayId },
            select: {
                id: true,
                tenantId: true,
                displayCode: true,
                displayRole: true,
                isActive: true,
            },
        });
        if (!display || display.tenantId !== pairingSession.tenantId) {
            return res.status(404).json({ error: 'Kassendisplay nicht gefunden' });
        }
        if (display.displayRole !== 'CASH') {
            return res.status(400).json({ error: 'OrderDesk darf nur mit Kassendisplay verbunden werden' });
        }
        if (!display.isActive) {
            return res.status(400).json({ error: 'Kassendisplay ist inaktiv' });
        }
        const normalizedAlias = normalizeText(payload.deviceAlias) ?? pairingSession.deviceAlias;
        const normalizedModel = normalizeText(payload.deviceModel);
        const normalizedPlatform = normalizeText(payload.devicePlatform);
        const normalizedAppVersion = normalizeText(payload.appVersion);
        const existingBinding = await prisma_1.prisma.orderDeskDeviceBinding.findUnique({
            where: { deviceSerial },
            select: {
                id: true,
                tenantId: true,
                displayId: true,
                displayCode: true,
                firstBoundAt: true,
                isActive: true,
            },
        });
        if (existingBinding &&
            existingBinding.isActive &&
            (existingBinding.tenantId !== display.tenantId || existingBinding.displayId !== display.id)) {
            return res.status(409).json({
                error: 'Dieses Gerät ist bereits mit einem anderen System verbunden. Nur Superadmin kann die Bindung zurücksetzen.',
            });
        }
        const now = new Date();
        const binding = existingBinding
            ? await prisma_1.prisma.orderDeskDeviceBinding.update({
                where: { id: existingBinding.id },
                data: {
                    tenantId: display.tenantId,
                    displayId: display.id,
                    displayCode: display.displayCode,
                    deviceAlias: normalizedAlias,
                    deviceModel: normalizedModel,
                    devicePlatform: normalizedPlatform,
                    appVersion: normalizedAppVersion,
                    boundAt: now,
                    lastSeenAt: now,
                    isActive: true,
                    resetAt: null,
                    resetByUserId: null,
                    resetReason: null,
                },
                include: {
                    display: {
                        select: {
                            id: true,
                            name: true,
                            displayCode: true,
                            displayRole: true,
                        },
                    },
                },
            })
            : await prisma_1.prisma.orderDeskDeviceBinding.create({
                data: {
                    deviceSerial,
                    tenantId: display.tenantId,
                    displayId: display.id,
                    displayCode: display.displayCode,
                    deviceAlias: normalizedAlias,
                    deviceModel: normalizedModel,
                    devicePlatform: normalizedPlatform,
                    appVersion: normalizedAppVersion,
                    boundAt: now,
                    firstBoundAt: now,
                    lastSeenAt: now,
                    isActive: true,
                },
                include: {
                    display: {
                        select: {
                            id: true,
                            name: true,
                            displayCode: true,
                            displayRole: true,
                        },
                    },
                },
            });
        await prisma_1.prisma.orderDeskPairingSession.update({
            where: { id: pairingSession.id },
            data: {
                consumedAt: now,
                consumedBySerial: deviceSerial,
            },
        });
        const sessionExpiresAtMs = Date.now() + 365 * 24 * 60 * 60 * 1000;
        const sessionToken = (0, orderdesk_device_token_1.signOrderDeskDeviceToken)({
            sid: pairingSession.id,
            tenantId: display.tenantId,
            displayCode: display.displayCode,
            bindingId: binding.id,
            deviceSerial: binding.deviceSerial,
            deviceAlias: binding.deviceAlias ?? null,
            kind: 'SESSION',
            expiresAtMs: sessionExpiresAtMs,
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: ORDERDESK_DEVICE_MODULE,
            action: existingBinding ? 'binding_refreshed' : 'binding_created',
            targetType: ORDERDESK_DEVICE_TARGET_TYPE,
            targetId: binding.id,
            tenantId: display.tenantId,
            metadata: {
                sessionId: pairingSession.id,
                displayId: display.id,
                displayCode: display.displayCode,
                deviceSerial: binding.deviceSerial,
                deviceAlias: binding.deviceAlias,
                deviceModel: binding.deviceModel,
                devicePlatform: binding.devicePlatform,
                appVersion: binding.appVersion,
            },
        });
        return res.json({
            ok: true,
            authToken: sessionToken,
            binding: {
                id: binding.id,
                tenantId: binding.tenantId,
                displayId: binding.displayId,
                displayCode: binding.displayCode,
                deviceSerial: binding.deviceSerial,
                deviceAlias: binding.deviceAlias,
                deviceModel: binding.deviceModel,
                devicePlatform: binding.devicePlatform,
                appVersion: binding.appVersion,
                firstBoundAt: binding.firstBoundAt.toISOString(),
                boundAt: binding.boundAt.toISOString(),
                lastSeenAt: binding.lastSeenAt?.toISOString() ?? null,
                isActive: binding.isActive,
            },
            display: {
                id: display.id,
                displayCode: display.displayCode,
            },
            mode: existingBinding ? 'REBOUND' : 'BOUND',
            expiresAt: new Date(sessionExpiresAtMs).toISOString(),
            secondsUntilExpiry: Math.max(60, Math.floor((sessionExpiresAtMs - Date.now()) / 1000)),
        });
    }
    catch (error) {
        console.error('PUBLIC ORDERDESK BIND ERROR:', error);
        return res.status(500).json({ error: 'OrderDesk konnte nicht verbunden werden' });
    }
});
router.post('/public/heartbeat', async (req, res) => {
    try {
        const authHeader = req.header('authorization');
        if (!authHeader || !authHeader.toLowerCase().startsWith('bearer ')) {
            return res.status(401).json({
                error: 'OrderDesk-Sitzung fehlt',
                code: 'ORDERDESK_SESSION_MISSING',
            });
        }
        const token = authHeader.slice(7).trim();
        const tokenPayload = (0, orderdesk_device_token_1.verifyOrderDeskDeviceToken)(token);
        if (!tokenPayload || tokenPayload.kind !== 'SESSION') {
            return res.status(401).json({
                error: 'OrderDesk-Sitzung ist ungültig oder abgelaufen',
                code: 'ORDERDESK_SESSION_INVALID',
            });
        }
        if (!tokenPayload.bindingId || !tokenPayload.deviceSerial) {
            return res.status(401).json({
                error: 'OrderDesk-Sitzung ist unvollständig',
                code: 'ORDERDESK_SESSION_INCOMPLETE',
            });
        }
        const binding = await prisma_1.prisma.orderDeskDeviceBinding.findUnique({
            where: { id: tokenPayload.bindingId },
            select: {
                id: true,
                tenantId: true,
                displayCode: true,
                deviceSerial: true,
                isActive: true,
                lastSeenAt: true,
            },
        });
        if (!binding || !binding.isActive) {
            return res.status(403).json({
                error: 'OrderDesk-Bindung ist nicht aktiv. Bitte Superadmin kontaktieren, falls eine Freigabe nötig ist.',
                code: 'ORDERDESK_BINDING_INACTIVE',
                reconnectAction: 'REPAIR_WITH_SUPERADMIN',
            });
        }
        if (binding.tenantId !== tokenPayload.tenantId ||
            binding.displayCode !== tokenPayload.displayCode ||
            binding.deviceSerial !== tokenPayload.deviceSerial) {
            return res.status(403).json({
                error: 'OrderDesk-Sitzung passt nicht zur aktiven Bindung',
                code: 'ORDERDESK_SESSION_BINDING_MISMATCH',
                reconnectAction: 'REBIND_REQUIRED',
            });
        }
        const now = new Date();
        const lastSeenAtIso = binding.lastSeenAt?.toISOString() ?? null;
        const staleMs = binding.lastSeenAt ? now.getTime() - binding.lastSeenAt.getTime() : null;
        const recoveredAfterGap = staleMs !== null && staleMs > 75000;
        await prisma_1.prisma.orderDeskDeviceBinding.update({
            where: { id: binding.id },
            data: {
                lastSeenAt: now,
            },
        });
        if (recoveredAfterGap) {
            await (0, audit_1.writeAuditLog)({
                req,
                module: ORDERDESK_DEVICE_MODULE,
                action: 'heartbeat_recovered',
                targetType: ORDERDESK_DEVICE_TARGET_TYPE,
                targetId: binding.id,
                tenantId: binding.tenantId,
                metadata: {
                    displayCode: binding.displayCode,
                    deviceSerial: binding.deviceSerial,
                    previousLastSeenAt: lastSeenAtIso,
                    reconnectGapMs: staleMs,
                },
            });
        }
        const tenant = await prisma_1.prisma.tenant.findUnique({
            where: { id: binding.tenantId },
            select: {
                id: true,
                name: true,
                chainId: true,
            },
        });
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: binding.displayCode },
            select: {
                id: true,
                displayRole: true,
                isActive: true,
            },
        });
        const tenantAdmins = await prisma_1.prisma.user.findMany({
            where: {
                role: client_1.UserRole.ADMIN,
                isActive: true,
                tenantId: binding.tenantId,
            },
            select: {
                id: true,
                name: true,
                email: true,
            },
            orderBy: { name: 'asc' },
            take: 10,
        });
        const chainAdmins = tenant?.chainId
            ? await prisma_1.prisma.user.findMany({
                where: {
                    role: client_1.UserRole.CHAINADMIN,
                    isActive: true,
                    chainId: tenant.chainId,
                },
                select: {
                    id: true,
                    name: true,
                    email: true,
                },
                orderBy: { name: 'asc' },
                take: 10,
            })
            : [];
        const activeDriverDevices = await (0, driver_device_sessions_1.listDriverDeviceSessionsForTenant)(binding.tenantId);
        const onlineDriverDeviceCount = activeDriverDevices.filter((entry) => entry.isOnline).length;
        return res.json({
            ok: true,
            status: binding.isActive ? 'online' : 'inactive',
            bindingId: binding.id,
            displayId: display?.id ?? null,
            displayCode: binding.displayCode,
            displayType: display?.displayRole === 'KITCHEN'
                ? 'KITCHEN'
                : display?.displayRole === 'PICKUP'
                    ? 'PICKUP_NUMBERS'
                    : 'MIXED',
            tenant: {
                id: tenant?.id ?? binding.tenantId,
                name: tenant?.name ?? null,
            },
            admins: tenantAdmins,
            chainadmins: chainAdmins,
            driverDevices: {
                activeCount: activeDriverDevices.length,
                onlineCount: onlineDriverDeviceCount,
            },
            recovery: {
                recoveredAfterGap,
                reconnectGapMs: staleMs,
                previousLastSeenAt: lastSeenAtIso,
            },
            recoveryHints: recoveredAfterGap
                ? [
                    'Verbindung wurde nach einer Unterbrechung wiederhergestellt',
                    'Bitte Netzwerkqualitaet am Geraet pruefen',
                ]
                : [],
            serverTime: now.toISOString(),
        });
    }
    catch (error) {
        console.error('PUBLIC ORDERDESK HEARTBEAT ERROR:', error);
        return res.status(500).json({ error: 'OrderDesk-Heartbeat konnte nicht verarbeitet werden' });
    }
});
exports.default = router;
