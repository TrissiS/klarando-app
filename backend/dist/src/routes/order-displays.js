"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const crypto_1 = __importDefault(require("crypto"));
const client_1 = require("@prisma/client");
const express_1 = require("express");
const order_display_utils_1 = require("../lib/order-display-utils");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const pickup_number_1 = require("../lib/pickup-number");
const business_settings_1 = require("../lib/business-settings");
const driver_device_token_1 = require("../auth/driver-device-token");
const driver_device_sessions_1 = require("../lib/driver-device-sessions");
const receipt_jobs_80mm_1 = require("../lib/receipt-jobs-80mm");
const escpos_encoder_80mm_1 = require("../lib/escpos-encoder-80mm");
const tenant_scope_1 = require("../lib/tenant-scope");
const rate_limit_1 = require("../middleware/rate-limit");
const router = (0, express_1.Router)();
function normalizeComplaintText(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function sanitizeComplaintImagePayload(input) {
    if (typeof input !== 'string') {
        return null;
    }
    const trimmed = input.trim();
    if (!trimmed) {
        return null;
    }
    if (trimmed.startsWith('data:image/') ||
        trimmed.startsWith('http://') ||
        trimmed.startsWith('https://')) {
        return trimmed;
    }
    return null;
}
function parseComplaintPayloadFromAuditMetadata(metadata) {
    if (!metadata || typeof metadata !== 'object' || Array.isArray(metadata)) {
        return null;
    }
    const source = metadata;
    const message = normalizeComplaintText(source.message);
    if (!message) {
        return null;
    }
    const complaintId = (0, order_display_utils_1.normalizeText)(typeof source.complaintId === 'string' ? source.complaintId : null);
    const createdBy = (0, order_display_utils_1.normalizeText)(typeof source.createdBy === 'string' ? source.createdBy : null);
    const images = (Array.isArray(source.images) ? source.images : [])
        .map((entry) => sanitizeComplaintImagePayload(entry))
        .filter((entry) => Boolean(entry))
        .slice(0, 5);
    return {
        complaintId,
        createdBy,
        message,
        images,
    };
}
function parseDriverLocationFromAuditMetadata(metadata) {
    if (!metadata || typeof metadata !== 'object' || Array.isArray(metadata)) {
        return null;
    }
    const source = metadata;
    const latitude = Number(source.latitude);
    const longitude = Number(source.longitude);
    if (!Number.isFinite(latitude) || !Number.isFinite(longitude)) {
        return null;
    }
    const accuracyMeters = Number(source.accuracyMeters);
    const heading = Number(source.heading);
    const speedKmh = Number(source.speedKmh);
    return {
        latitude,
        longitude,
        accuracyMeters: Number.isFinite(accuracyMeters) ? accuracyMeters : null,
        heading: Number.isFinite(heading) ? heading : null,
        speedKmh: Number.isFinite(speedKmh) ? speedKmh : null,
    };
}
async function loadLatestDriverLocationByOrderId(orderIds) {
    const normalizedIds = Array.from(new Set(orderIds.filter(Boolean)));
    const locationByOrderId = new Map();
    if (normalizedIds.length === 0) {
        return locationByOrderId;
    }
    const rows = await prisma_1.prisma.auditLog.findMany({
        where: {
            module: 'driver_tracking',
            action: 'location_ping',
            targetType: 'order',
            targetId: {
                in: normalizedIds,
            },
        },
        select: {
            targetId: true,
            metadata: true,
            createdAt: true,
        },
        orderBy: {
            createdAt: 'desc',
        },
        take: Math.min(5000, Math.max(200, normalizedIds.length * 20)),
    });
    for (const row of rows) {
        if (!row.targetId || locationByOrderId.has(row.targetId)) {
            continue;
        }
        const parsed = parseDriverLocationFromAuditMetadata(row.metadata);
        if (!parsed) {
            continue;
        }
        locationByOrderId.set(row.targetId, {
            ...parsed,
            updatedAt: row.createdAt.toISOString(),
        });
    }
    return locationByOrderId;
}
async function loadOrderComplaintStateByOrderId(orderIds) {
    const normalizedOrderIds = Array.from(new Set(orderIds.filter(Boolean)));
    const stateByOrderId = new Map();
    if (normalizedOrderIds.length === 0) {
        return stateByOrderId;
    }
    const rows = await prisma_1.prisma.auditLog.findMany({
        where: {
            module: 'order_complaint',
            action: {
                in: ['created', 'resolved'],
            },
            targetType: 'order',
            targetId: {
                in: normalizedOrderIds,
            },
        },
        select: {
            id: true,
            targetId: true,
            action: true,
            metadata: true,
            createdAt: true,
        },
        orderBy: {
            createdAt: 'asc',
        },
        take: Math.min(12000, Math.max(300, normalizedOrderIds.length * 40)),
    });
    for (const row of rows) {
        const orderId = (0, order_display_utils_1.normalizeText)(row.targetId);
        if (!orderId) {
            continue;
        }
        const current = stateByOrderId.get(orderId) ??
            {
                complaintOpen: false,
                complaintCount: 0,
                latestComplaintAt: null,
                latestComplaintMessage: null,
                latestComplaintImageCount: 0,
                complaints: [],
            };
        if (row.action === 'created') {
            const payload = parseComplaintPayloadFromAuditMetadata(row.metadata);
            if (payload) {
                const complaintEntry = {
                    id: payload.complaintId ?? row.id,
                    message: payload.message,
                    images: payload.images,
                    createdAt: row.createdAt.toISOString(),
                    createdBy: payload.createdBy ?? null,
                    isResolved: false,
                };
                current.complaints.push(complaintEntry);
                current.complaintCount = current.complaints.length;
                current.complaintOpen = true;
                current.latestComplaintAt = complaintEntry.createdAt;
                current.latestComplaintMessage = complaintEntry.message;
                current.latestComplaintImageCount = complaintEntry.images.length;
            }
        }
        else if (row.action === 'resolved') {
            let resolved = false;
            if (row.metadata && typeof row.metadata === 'object' && !Array.isArray(row.metadata)) {
                const source = row.metadata;
                const complaintId = (0, order_display_utils_1.normalizeText)(typeof source.complaintId === 'string' ? source.complaintId : null);
                if (complaintId) {
                    const target = [...current.complaints]
                        .reverse()
                        .find((entry) => entry.id === complaintId && !entry.isResolved);
                    if (target) {
                        target.isResolved = true;
                        resolved = true;
                    }
                }
            }
            if (!resolved) {
                const target = [...current.complaints].reverse().find((entry) => !entry.isResolved);
                if (target) {
                    target.isResolved = true;
                }
            }
            current.complaintOpen = current.complaints.some((entry) => !entry.isResolved);
        }
        stateByOrderId.set(orderId, current);
    }
    for (const orderId of normalizedOrderIds) {
        if (!stateByOrderId.has(orderId)) {
            stateByOrderId.set(orderId, {
                complaintOpen: false,
                complaintCount: 0,
                latestComplaintAt: null,
                latestComplaintMessage: null,
                latestComplaintImageCount: 0,
                complaints: [],
            });
        }
    }
    return stateByOrderId;
}
function parseDriverAccessHours(value) {
    const parsed = Number(value);
    if (!Number.isFinite(parsed)) {
        return null;
    }
    const rounded = Math.round(parsed);
    if (rounded < 1 || rounded > 168) {
        return null;
    }
    return rounded;
}
function createDriverDeviceSessionId() {
    return `drv_${Date.now().toString(36)}_${crypto_1.default.randomBytes(6).toString('hex')}`;
}
function normalizeDeviceLabel(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim().slice(0, 80);
    return trimmed.length > 0 ? trimmed : null;
}
function normalizeModifierSnapshot(value) {
    if (!Array.isArray(value)) {
        return null;
    }
    const items = value
        .map((entry) => {
        if (!entry || typeof entry !== 'object') {
            return null;
        }
        const source = entry;
        if (typeof source.name !== 'string' || !source.name.trim()) {
            return null;
        }
        const parsedDelta = Number(source.priceDelta);
        return {
            name: source.name.trim(),
            priceDelta: Number.isFinite(parsedDelta) ? parsedDelta : 0,
        };
    })
        .filter((entry) => Boolean(entry));
    return items.length > 0 ? items : null;
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.ORDERS_READ), async (req, res) => {
    try {
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, req.query.tenantId);
        const tenantId = scope.tenantId;
        const displays = await prisma_1.prisma.orderDisplay.findMany({
            where: { tenantId },
            orderBy: [{ displayRole: 'asc' }, { name: 'asc' }],
        });
        return res.json(displays.map(order_display_utils_1.mapDisplayOutput));
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('GET ORDER DISPLAYS ERROR:', error);
        return res.status(500).json({ error: 'Bestell-Displays konnten nicht geladen werden' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.ORDERS_WRITE), async (req, res) => {
    try {
        const { tenantId, name, displayCode, displayRole, location, isActive, refreshIntervalSec, sortMode, doneAutoHideSec, sourceTerminalIds, announceOnMenuScreens, menuAnnouncementDurationSec, displayBackgroundColor, orderCardBackgroundColor, statusColorPendingPayment, statusColorOpen, statusColorPreparing, statusColorDone, showOrderAge, showTerminalInfo, showPaymentInfo, showTotal, showItems, showStatusBadge, showPickupNumber, showOrderNumber, autoScaleLayout, pickupShowOnlyNumber, pickupShowOpen, pickupShowPreparing, pickupShowDone, statusAnimationMode, statusAnimationDurationMs, orderAgeFontSize, orderAgeAlertThresholdSec, orderAgeAlertAnimationMode, backgroundMediaMode, backgroundMediaUrl, notes, } = req.body;
        if (!tenantId || !(0, order_display_utils_1.normalizeText)(name)) {
            return res.status(400).json({ error: 'tenantId und name sind erforderlich' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantId);
        const scopedTenantId = scope.tenantId;
        const normalizedRole = displayRole ?? client_1.OrderDisplayRole.KITCHEN;
        if (!Object.values(client_1.OrderDisplayRole).includes(normalizedRole)) {
            return res.status(400).json({ error: 'ungueltige displayRole' });
        }
        const normalizedSortMode = ((0, order_display_utils_1.normalizeText)(sortMode)?.toUpperCase() ??
            'PRIORITY_OLDEST');
        if (!order_display_utils_1.DISPLAY_SORT_MODES.has(normalizedSortMode)) {
            return res.status(400).json({ error: 'ungueltige sortMode' });
        }
        const normalizedStatusAnimationMode = (0, order_display_utils_1.normalizeText)(statusAnimationMode)?.toUpperCase() ?? 'NONE';
        if (!order_display_utils_1.DISPLAY_STATUS_ANIMATION_MODES.has(normalizedStatusAnimationMode)) {
            return res.status(400).json({ error: 'ungueltige statusAnimationMode' });
        }
        const normalizedAgeAlertAnimationMode = (0, order_display_utils_1.normalizeText)(orderAgeAlertAnimationMode)?.toUpperCase() ?? 'BLINK';
        if (!order_display_utils_1.DISPLAY_AGE_ALERT_ANIMATION_MODES.has(normalizedAgeAlertAnimationMode)) {
            return res.status(400).json({ error: 'ungueltige orderAgeAlertAnimationMode' });
        }
        const normalizedBackgroundMediaMode = (0, order_display_utils_1.normalizeText)(backgroundMediaMode)?.toUpperCase() ?? 'NONE';
        if (!order_display_utils_1.DISPLAY_BACKGROUND_MEDIA_MODES.has(normalizedBackgroundMediaMode)) {
            return res.status(400).json({ error: 'ungueltige backgroundMediaMode' });
        }
        const normalizedBackgroundMediaUrl = (0, order_display_utils_1.normalizeText)(backgroundMediaUrl);
        if (normalizedBackgroundMediaMode !== 'NONE' && !normalizedBackgroundMediaUrl) {
            return res.status(400).json({
                error: 'backgroundMediaUrl ist erforderlich, wenn backgroundMediaMode aktiv ist',
            });
        }
        const normalizedDisplayBgColor = (0, order_display_utils_1.normalizeColorHex)(displayBackgroundColor);
        const normalizedOrderCardBgColor = (0, order_display_utils_1.normalizeColorHex)(orderCardBackgroundColor);
        const normalizedPendingColor = (0, order_display_utils_1.normalizeColorHex)(statusColorPendingPayment);
        const normalizedOpenColor = (0, order_display_utils_1.normalizeColorHex)(statusColorOpen);
        const normalizedPreparingColor = (0, order_display_utils_1.normalizeColorHex)(statusColorPreparing);
        const normalizedDoneColor = (0, order_display_utils_1.normalizeColorHex)(statusColorDone);
        if (normalizedDisplayBgColor === null ||
            normalizedOrderCardBgColor === null ||
            normalizedPendingColor === null ||
            normalizedOpenColor === null ||
            normalizedPreparingColor === null ||
            normalizedDoneColor === null) {
            return res.status(400).json({ error: 'ungueltige Farbe (erwartet #RRGGBB)' });
        }
        const normalizedSourceTerminalIds = (0, order_display_utils_1.normalizeIdList)(sourceTerminalIds);
        if (normalizedSourceTerminalIds.length > 0) {
            const count = await prisma_1.prisma.orderTerminal.count({
                where: {
                    tenantId: scopedTenantId,
                    id: {
                        in: normalizedSourceTerminalIds,
                    },
                },
            });
            if (count !== normalizedSourceTerminalIds.length) {
                return res.status(400).json({ error: 'Mindestens ein Quell-Terminal ist ungueltig' });
            }
        }
        const normalizedCode = (0, order_display_utils_1.normalizeText)(displayCode) ?? (await (0, order_display_utils_1.createUniqueDisplayCode)());
        const created = await prisma_1.prisma.orderDisplay.create({
            data: {
                tenantId: scopedTenantId,
                name: (0, order_display_utils_1.normalizeText)(name) ?? 'Bestell-Display',
                displayCode: normalizedCode.toUpperCase(),
                displayRole: normalizedRole,
                location: (0, order_display_utils_1.normalizeText)(location),
                isActive: isActive ?? true,
                refreshIntervalSec: (0, order_display_utils_1.clampRefreshInterval)(refreshIntervalSec) ?? 10,
                sortMode: normalizedSortMode,
                doneAutoHideSec: (0, order_display_utils_1.clampDoneAutoHide)(doneAutoHideSec) ?? 0,
                sourceTerminalIds: (0, order_display_utils_1.serializeIdList)(normalizedSourceTerminalIds),
                announceOnMenuScreens: announceOnMenuScreens ?? true,
                menuAnnouncementDurationSec: (0, order_display_utils_1.clampAnnouncementDuration)(menuAnnouncementDurationSec) ?? 45,
                displayBackgroundColor: normalizedDisplayBgColor ?? '#020617',
                orderCardBackgroundColor: normalizedOrderCardBgColor ?? '#0f172a',
                statusColorPendingPayment: normalizedPendingColor ?? '#ef4444',
                statusColorOpen: normalizedOpenColor ?? '#f97316',
                statusColorPreparing: normalizedPreparingColor ?? '#3b82f6',
                statusColorDone: normalizedDoneColor ?? '#16a34a',
                showOrderAge: showOrderAge ?? true,
                showTerminalInfo: showTerminalInfo ?? true,
                showPaymentInfo: showPaymentInfo ?? true,
                showTotal: showTotal ?? true,
                showItems: showItems ?? true,
                showStatusBadge: showStatusBadge ?? true,
                showPickupNumber: showPickupNumber ?? true,
                showOrderNumber: showOrderNumber ?? true,
                autoScaleLayout: autoScaleLayout ?? true,
                pickupShowOnlyNumber: pickupShowOnlyNumber ?? false,
                pickupShowOpen: pickupShowOpen ?? true,
                pickupShowPreparing: pickupShowPreparing ?? true,
                pickupShowDone: pickupShowDone ?? true,
                statusAnimationMode: normalizedStatusAnimationMode,
                statusAnimationDurationMs: (0, order_display_utils_1.clampAnimationDuration)(statusAnimationDurationMs) ?? 2200,
                orderAgeFontSize: (0, order_display_utils_1.clampOrderAgeFontSize)(orderAgeFontSize) ?? 22,
                orderAgeAlertThresholdSec: (0, order_display_utils_1.clampOrderAgeAlertThreshold)(orderAgeAlertThresholdSec) ?? 900,
                orderAgeAlertAnimationMode: normalizedAgeAlertAnimationMode,
                backgroundMediaMode: normalizedBackgroundMediaMode,
                backgroundMediaUrl: normalizedBackgroundMediaUrl,
                notes: (0, order_display_utils_1.normalizeText)(notes),
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'order_display',
            action: 'order_display_created',
            targetType: 'order_display',
            targetId: created.id,
            tenantId: created.tenantId,
            metadata: {
                name: created.name,
                displayCode: created.displayCode,
                displayRole: created.displayRole,
            },
        });
        return res.status(201).json((0, order_display_utils_1.mapDisplayOutput)(created));
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('CREATE ORDER DISPLAY ERROR:', error);
        return res.status(500).json({ error: 'Bestell-Display konnte nicht erstellt werden' });
    }
});
router.patch('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.ORDERS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { name, displayRole, location, isActive, refreshIntervalSec, sortMode, doneAutoHideSec, sourceTerminalIds, announceOnMenuScreens, menuAnnouncementDurationSec, displayBackgroundColor, orderCardBackgroundColor, statusColorPendingPayment, statusColorOpen, statusColorPreparing, statusColorDone, showOrderAge, showTerminalInfo, showPaymentInfo, showTotal, showItems, showStatusBadge, showPickupNumber, showOrderNumber, autoScaleLayout, pickupShowOnlyNumber, pickupShowOpen, pickupShowPreparing, pickupShowDone, statusAnimationMode, statusAnimationDurationMs, orderAgeFontSize, orderAgeAlertThresholdSec, orderAgeAlertAnimationMode, backgroundMediaMode, backgroundMediaUrl, notes, } = req.body;
        if (!id) {
            return res.status(400).json({ error: 'id ist erforderlich' });
        }
        const existing = await prisma_1.prisma.orderDisplay.findUnique({
            where: { id },
            select: {
                id: true,
                tenantId: true,
            },
        });
        if (!existing) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        await (0, tenant_scope_1.resolveTenantScope)(req, existing.tenantId);
        if (displayRole !== undefined && !Object.values(client_1.OrderDisplayRole).includes(displayRole)) {
            return res.status(400).json({ error: 'ungueltige displayRole' });
        }
        const normalizedSortMode = sortMode === undefined ? undefined : ((0, order_display_utils_1.normalizeText)(sortMode)?.toUpperCase() ?? undefined);
        if (normalizedSortMode !== undefined && !order_display_utils_1.DISPLAY_SORT_MODES.has(normalizedSortMode)) {
            return res.status(400).json({ error: 'ungueltige sortMode' });
        }
        const normalizedStatusAnimationMode = statusAnimationMode === undefined
            ? undefined
            : (0, order_display_utils_1.normalizeText)(statusAnimationMode)?.toUpperCase() ?? undefined;
        if (normalizedStatusAnimationMode !== undefined &&
            !order_display_utils_1.DISPLAY_STATUS_ANIMATION_MODES.has(normalizedStatusAnimationMode)) {
            return res.status(400).json({ error: 'ungueltige statusAnimationMode' });
        }
        const normalizedAgeAlertAnimationMode = orderAgeAlertAnimationMode === undefined
            ? undefined
            : (0, order_display_utils_1.normalizeText)(orderAgeAlertAnimationMode)?.toUpperCase() ?? undefined;
        if (normalizedAgeAlertAnimationMode !== undefined &&
            !order_display_utils_1.DISPLAY_AGE_ALERT_ANIMATION_MODES.has(normalizedAgeAlertAnimationMode)) {
            return res.status(400).json({ error: 'ungueltige orderAgeAlertAnimationMode' });
        }
        const normalizedBackgroundMediaMode = backgroundMediaMode === undefined
            ? undefined
            : (0, order_display_utils_1.normalizeText)(backgroundMediaMode)?.toUpperCase() ?? undefined;
        if (normalizedBackgroundMediaMode !== undefined &&
            !order_display_utils_1.DISPLAY_BACKGROUND_MEDIA_MODES.has(normalizedBackgroundMediaMode)) {
            return res.status(400).json({ error: 'ungueltige backgroundMediaMode' });
        }
        const normalizedBackgroundMediaUrl = backgroundMediaUrl === undefined ? undefined : (0, order_display_utils_1.normalizeText)(backgroundMediaUrl);
        if (normalizedBackgroundMediaMode !== undefined &&
            normalizedBackgroundMediaMode !== 'NONE' &&
            !normalizedBackgroundMediaUrl) {
            return res.status(400).json({
                error: 'backgroundMediaUrl ist erforderlich, wenn backgroundMediaMode aktiv ist',
            });
        }
        const resolvedBackgroundMediaUrl = normalizedBackgroundMediaMode === undefined
            ? normalizedBackgroundMediaUrl
            : normalizedBackgroundMediaMode === 'NONE'
                ? null
                : normalizedBackgroundMediaUrl;
        const normalizedDisplayBgColor = displayBackgroundColor === undefined
            ? undefined
            : (0, order_display_utils_1.normalizeColorHex)(displayBackgroundColor);
        const normalizedOrderCardBgColor = orderCardBackgroundColor === undefined
            ? undefined
            : (0, order_display_utils_1.normalizeColorHex)(orderCardBackgroundColor);
        const normalizedPendingColor = statusColorPendingPayment === undefined
            ? undefined
            : (0, order_display_utils_1.normalizeColorHex)(statusColorPendingPayment);
        const normalizedOpenColor = statusColorOpen === undefined ? undefined : (0, order_display_utils_1.normalizeColorHex)(statusColorOpen);
        const normalizedPreparingColor = statusColorPreparing === undefined
            ? undefined
            : (0, order_display_utils_1.normalizeColorHex)(statusColorPreparing);
        const normalizedDoneColor = statusColorDone === undefined ? undefined : (0, order_display_utils_1.normalizeColorHex)(statusColorDone);
        if (normalizedDisplayBgColor === null ||
            normalizedOrderCardBgColor === null ||
            normalizedPendingColor === null ||
            normalizedOpenColor === null ||
            normalizedPreparingColor === null ||
            normalizedDoneColor === null) {
            return res.status(400).json({ error: 'ungueltige Farbe (erwartet #RRGGBB)' });
        }
        const normalizedSourceTerminalIds = sourceTerminalIds === undefined ? undefined : (0, order_display_utils_1.normalizeIdList)(sourceTerminalIds);
        if (normalizedSourceTerminalIds && normalizedSourceTerminalIds.length > 0) {
            const count = await prisma_1.prisma.orderTerminal.count({
                where: {
                    tenantId: existing.tenantId,
                    id: {
                        in: normalizedSourceTerminalIds,
                    },
                },
            });
            if (count !== normalizedSourceTerminalIds.length) {
                return res.status(400).json({ error: 'Mindestens ein Quell-Terminal ist ungueltig' });
            }
        }
        const updated = await prisma_1.prisma.orderDisplay.update({
            where: { id },
            data: {
                name: name === undefined ? undefined : (0, order_display_utils_1.normalizeText)(name) ?? undefined,
                displayRole,
                location: location === undefined ? undefined : (0, order_display_utils_1.normalizeText)(location),
                isActive,
                refreshIntervalSec: (0, order_display_utils_1.clampRefreshInterval)(refreshIntervalSec),
                sortMode: normalizedSortMode,
                doneAutoHideSec: (0, order_display_utils_1.clampDoneAutoHide)(doneAutoHideSec),
                sourceTerminalIds: sourceTerminalIds === undefined
                    ? undefined
                    : (0, order_display_utils_1.serializeIdList)(normalizedSourceTerminalIds || []),
                announceOnMenuScreens,
                menuAnnouncementDurationSec: (0, order_display_utils_1.clampAnnouncementDuration)(menuAnnouncementDurationSec),
                displayBackgroundColor: normalizedDisplayBgColor,
                orderCardBackgroundColor: normalizedOrderCardBgColor,
                statusColorPendingPayment: normalizedPendingColor,
                statusColorOpen: normalizedOpenColor,
                statusColorPreparing: normalizedPreparingColor,
                statusColorDone: normalizedDoneColor,
                showOrderAge,
                showTerminalInfo,
                showPaymentInfo,
                showTotal,
                showItems,
                showStatusBadge,
                showPickupNumber,
                showOrderNumber,
                autoScaleLayout,
                pickupShowOnlyNumber,
                pickupShowOpen,
                pickupShowPreparing,
                pickupShowDone,
                statusAnimationMode: normalizedStatusAnimationMode,
                statusAnimationDurationMs: (0, order_display_utils_1.clampAnimationDuration)(statusAnimationDurationMs),
                orderAgeFontSize: (0, order_display_utils_1.clampOrderAgeFontSize)(orderAgeFontSize),
                orderAgeAlertThresholdSec: (0, order_display_utils_1.clampOrderAgeAlertThreshold)(orderAgeAlertThresholdSec),
                orderAgeAlertAnimationMode: normalizedAgeAlertAnimationMode,
                backgroundMediaMode: normalizedBackgroundMediaMode,
                backgroundMediaUrl: resolvedBackgroundMediaUrl,
                notes: notes === undefined ? undefined : (0, order_display_utils_1.normalizeText)(notes),
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'order_display',
            action: 'order_display_updated',
            targetType: 'order_display',
            targetId: updated.id,
            tenantId: existing.tenantId,
            metadata: {
                name: updated.name,
                isActive: updated.isActive,
                displayRole: updated.displayRole,
            },
        });
        return res.json((0, order_display_utils_1.mapDisplayOutput)(updated));
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('UPDATE ORDER DISPLAY ERROR:', error);
        return res.status(500).json({ error: 'Bestell-Display konnte nicht aktualisiert werden' });
    }
});
router.delete('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.ORDERS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        if (!id) {
            return res.status(400).json({ error: 'id ist erforderlich' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, req.query.tenantId);
        const tenantId = scope.tenantId;
        const existing = await prisma_1.prisma.orderDisplay.findUnique({
            where: { id },
            select: {
                id: true,
                tenantId: true,
                name: true,
            },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        await prisma_1.prisma.orderDisplay.delete({
            where: { id },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'order_display',
            action: 'order_display_deleted',
            targetType: 'order_display',
            targetId: existing.id,
            tenantId,
            metadata: {
                name: existing.name,
            },
        });
        return res.json({ ok: true });
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('DELETE ORDER DISPLAY ERROR:', error);
        return res.status(500).json({ error: 'Bestell-Display konnte nicht geloescht werden' });
    }
});
router.get('/public/:displayCode/feed', async (req, res) => {
    try {
        const displayCode = Array.isArray(req.params.displayCode)
            ? req.params.displayCode[0]
            : req.params.displayCode;
        if (!displayCode) {
            return res.status(400).json({ error: 'displayCode fehlt' });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: displayCode.toUpperCase() },
            select: {
                id: true,
                tenantId: true,
                name: true,
                displayCode: true,
                displayRole: true,
                location: true,
                isActive: true,
                refreshIntervalSec: true,
                sortMode: true,
                doneAutoHideSec: true,
                sourceTerminalIds: true,
                announceOnMenuScreens: true,
                menuAnnouncementDurationSec: true,
                displayBackgroundColor: true,
                orderCardBackgroundColor: true,
                statusColorPendingPayment: true,
                statusColorOpen: true,
                statusColorPreparing: true,
                statusColorDone: true,
                showOrderAge: true,
                showTerminalInfo: true,
                showPaymentInfo: true,
                showTotal: true,
                showItems: true,
                showStatusBadge: true,
                showPickupNumber: true,
                showOrderNumber: true,
                autoScaleLayout: true,
                pickupShowOnlyNumber: true,
                pickupShowOpen: true,
                pickupShowPreparing: true,
                pickupShowDone: true,
                statusAnimationMode: true,
                statusAnimationDurationMs: true,
                orderAgeFontSize: true,
                orderAgeAlertThresholdSec: true,
                orderAgeAlertAnimationMode: true,
                backgroundMediaMode: true,
                backgroundMediaUrl: true,
                notes: true,
                createdAt: true,
                updatedAt: true,
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        if (!display.isActive) {
            return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' });
        }
        const acceptedTerminalIds = (0, order_display_utils_1.parseStoredIdList)(display.sourceTerminalIds);
        const statusList = (0, order_display_utils_1.feedStatusesForDisplay)(display);
        const assignmentField = (0, order_display_utils_1.roleOrderField)(display.displayRole);
        const where = {
            tenantId: display.tenantId,
            status: {
                in: statusList,
            },
            [assignmentField]: display.id,
        };
        if (acceptedTerminalIds.length > 0) {
            where.AND = [
                {
                    OR: [
                        {
                            terminalId: {
                                in: acceptedTerminalIds,
                            },
                        },
                        {
                            sourceChannel: {
                                in: ['APP', 'DELIVERY'],
                            },
                        },
                    ],
                },
            ];
        }
        const sortNewest = display.sortMode === 'PRIORITY_NEWEST';
        const fetchedOrders = await prisma_1.prisma.order.findMany({
            where,
            include: {
                terminal: {
                    select: {
                        id: true,
                        name: true,
                        terminalCode: true,
                        location: true,
                    },
                },
                items: {
                    include: {
                        product: {
                            include: {
                                category: {
                                    select: {
                                        id: true,
                                        name: true,
                                        imageUrl: true,
                                    },
                                },
                            },
                        },
                    },
                },
            },
            orderBy: sortNewest ? [{ createdAt: 'desc' }] : [{ createdAt: 'asc' }],
            take: 150,
        });
        const drivers = await prisma_1.prisma.user.findMany({
            where: {
                tenantId: display.tenantId,
                role: 'DRIVER',
                isActive: true,
            },
            select: {
                id: true,
                name: true,
            },
            orderBy: [{ name: 'asc' }],
        });
        const complaintStateByOrderId = await loadOrderComplaintStateByOrderId(fetchedOrders.map((order) => order.id));
        const latestDriverLocations = await loadLatestDriverLocationByOrderId(fetchedOrders.map((order) => order.id));
        const doneAutoHideMs = Math.max(0, display.doneAutoHideSec) * 1000;
        const nowMs = Date.now();
        const orders = doneAutoHideMs > 0
            ? fetchedOrders.filter((order) => {
                if (order.status !== 'done') {
                    return true;
                }
                const doneSince = order.forwardedToKitchenAt
                    ? new Date(order.forwardedToKitchenAt).getTime()
                    : new Date(order.createdAt).getTime();
                return nowMs - doneSince <= doneAutoHideMs;
            })
            : fetchedOrders;
        const ordersWithComplaintInfo = orders.map((order) => ({
            ...order,
            driverLocation: latestDriverLocations.get(order.id) ?? null,
            complaintOpen: complaintStateByOrderId.get(order.id)?.complaintOpen ?? false,
            complaintCount: complaintStateByOrderId.get(order.id)?.complaintCount ?? 0,
            latestComplaintAt: complaintStateByOrderId.get(order.id)?.latestComplaintAt ?? null,
            latestComplaintMessage: complaintStateByOrderId.get(order.id)?.latestComplaintMessage ?? null,
            latestComplaintImageCount: complaintStateByOrderId.get(order.id)?.latestComplaintImageCount ?? 0,
            complaints: complaintStateByOrderId.get(order.id)?.complaints ?? [],
        }));
        const activeDriverDevices = await (0, driver_device_sessions_1.listDriverDeviceSessionsForTenant)(display.tenantId, {
            displayCode: display.displayCode,
        });
        const nowIso = new Date().toISOString();
        const displayType = display.displayRole === 'KITCHEN'
            ? 'KITCHEN'
            : display.displayRole === 'PICKUP'
                ? 'PICKUP_NUMBERS'
                : 'MIXED';
        return res.json({
            status: display.isActive ? 'online' : 'inactive',
            serverTime: nowIso,
            displayType,
            ...(0, order_display_utils_1.mapDisplayOutput)(display),
            display: (0, order_display_utils_1.mapDisplayOutput)(display),
            orders: ordersWithComplaintInfo,
            drivers,
            activeDriverDevices,
            generatedAt: nowIso,
        });
    }
    catch (error) {
        console.error('GET PUBLIC ORDER DISPLAY FEED ERROR:', error);
        return res.status(500).json({ error: 'Bestell-Display Feed konnte nicht geladen werden' });
    }
});
router.get('/public/:displayCode/orders/:orderId/receipt-jobs', async (req, res) => {
    try {
        const displayCode = Array.isArray(req.params.displayCode)
            ? req.params.displayCode[0]
            : req.params.displayCode;
        const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId;
        const queryKind = Array.isArray(req.query.kind) ? req.query.kind[0] : req.query.kind;
        const queryTrackingUrl = Array.isArray(req.query.trackingUrl)
            ? req.query.trackingUrl[0]
            : req.query.trackingUrl;
        const queryLocale = Array.isArray(req.query.locale) ? req.query.locale[0] : req.query.locale;
        const queryTimeZone = Array.isArray(req.query.timeZone)
            ? req.query.timeZone[0]
            : req.query.timeZone;
        const kindParam = (0, order_display_utils_1.normalizeText)(typeof queryKind === 'string' ? queryKind : null)?.toLowerCase() ?? 'both';
        const trackingUrl = (0, order_display_utils_1.normalizeText)(typeof queryTrackingUrl === 'string' ? queryTrackingUrl : null);
        const locale = (0, order_display_utils_1.normalizeText)(typeof queryLocale === 'string' ? queryLocale : null) ?? 'de-DE';
        const timeZone = (0, order_display_utils_1.normalizeText)(typeof queryTimeZone === 'string' ? queryTimeZone : null) ?? 'Europe/Berlin';
        if (!displayCode || !orderId) {
            return res.status(400).json({ error: 'displayCode oder orderId fehlt' });
        }
        if (!['customer', 'kitchen', 'both'].includes(kindParam)) {
            return res.status(400).json({ error: 'kind muss customer, kitchen oder both sein' });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: displayCode.toUpperCase() },
            select: {
                id: true,
                tenantId: true,
                displayRole: true,
                displayCode: true,
                isActive: true,
                sourceTerminalIds: true,
                tenant: {
                    select: {
                        name: true,
                        email: true,
                        businessSettings: true,
                    },
                },
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        if (!display.isActive) {
            return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' });
        }
        const existingOrder = await prisma_1.prisma.order.findUnique({
            where: { id: orderId },
            select: {
                id: true,
                tenantId: true,
                sourceChannel: true,
                terminalId: true,
                cashDisplayId: true,
                kitchenDisplayId: true,
                pickupDisplayId: true,
            },
        });
        if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
            return res.status(404).json({ error: 'Bestellung nicht gefunden' });
        }
        const expectedDisplayIdField = (0, order_display_utils_1.roleOrderField)(display.displayRole);
        const assignedDisplayId = expectedDisplayIdField === 'cashDisplayId'
            ? existingOrder.cashDisplayId
            : expectedDisplayIdField === 'pickupDisplayId'
                ? existingOrder.pickupDisplayId
                : existingOrder.kitchenDisplayId;
        if (assignedDisplayId !== display.id) {
            return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Display' });
        }
        const acceptedTerminalIds = (0, order_display_utils_1.parseStoredIdList)(display.sourceTerminalIds);
        const isAppOrder = existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY';
        if (acceptedTerminalIds.length > 0 &&
            !isAppOrder &&
            (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))) {
            return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' });
        }
        const order = await prisma_1.prisma.order.findUnique({
            where: { id: orderId },
            select: {
                id: true,
                createdAt: true,
                sourceChannel: true,
                serviceType: true,
                subtotal: true,
                deliveryFee: true,
                total: true,
                estimatedMinutes: true,
                assignedDriverName: true,
                customerName: true,
                customerPhone: true,
                customerAddress: true,
                customerZipCode: true,
                customerCity: true,
                appCustomerAccount: {
                    select: {
                        fullName: true,
                    },
                },
                assignedDriver: {
                    select: {
                        name: true,
                    },
                },
                items: {
                    select: {
                        quantity: true,
                        price: true,
                        modifierSnapshot: true,
                        product: {
                            select: {
                                name: true,
                            },
                        },
                    },
                },
            },
        });
        if (!order) {
            return res.status(404).json({ error: 'Bestellung nicht gefunden' });
        }
        const normalizedOrder = {
            ...order,
            items: order.items.map((item) => ({
                ...item,
                modifierSnapshot: normalizeModifierSnapshot(item.modifierSnapshot),
            })),
        };
        const parsedSettings = (0, business_settings_1.parseSettings)(display.tenant.businessSettings, {
            name: display.tenant.name,
            email: display.tenant.email,
        });
        const tenantProfile = {
            name: parsedSettings.businessName ?? display.tenant.name,
            street: parsedSettings.street,
            zipCode: parsedSettings.zipCode,
            city: parsedSettings.city,
            phone: parsedSettings.phone,
        };
        const options = {
            tenantProfile,
            trackingUrl,
            locale,
            timeZone,
        };
        const jobs = [];
        if (kindParam === 'customer' || kindParam === 'both') {
            const render = (0, receipt_jobs_80mm_1.buildCustomerReceiptJob80mm)(normalizedOrder, options);
            const encoded = (0, escpos_encoder_80mm_1.encodeReceiptToEscPosBytes)(render);
            jobs.push({
                kind: 'CUSTOMER',
                templateId: render.templateId,
                codepage: render.codepage,
                charsPerLine: render.charsPerLine,
                commands: render.commands,
                escposBase64: encoded.base64,
                escposHex: encoded.hex,
                bytesLength: encoded.bytes.length,
            });
        }
        if (kindParam === 'kitchen' || kindParam === 'both') {
            const render = (0, receipt_jobs_80mm_1.buildKitchenReceiptJob80mm)(normalizedOrder, options);
            const encoded = (0, escpos_encoder_80mm_1.encodeReceiptToEscPosBytes)(render);
            jobs.push({
                kind: 'KITCHEN',
                templateId: render.templateId,
                codepage: render.codepage,
                charsPerLine: render.charsPerLine,
                commands: render.commands,
                escposBase64: encoded.base64,
                escposHex: encoded.hex,
                bytesLength: encoded.bytes.length,
            });
        }
        return res.json({
            ok: true,
            displayCode: display.displayCode,
            orderId: order.id,
            requestedAt: new Date().toISOString(),
            jobs,
        });
    }
    catch (error) {
        console.error('GET PUBLIC ORDER DISPLAY RECEIPT JOBS ERROR:', error);
        return res.status(500).json({ error: 'Receipt-Jobs konnten nicht erstellt werden' });
    }
});
router.post('/public/:displayCode/driver-devices/session', rate_limit_1.rateLimitDisplayPairing, async (req, res) => {
    try {
        const displayCode = Array.isArray(req.params.displayCode)
            ? req.params.displayCode[0]
            : req.params.displayCode;
        if (!displayCode) {
            return res.status(400).json({ error: 'displayCode fehlt' });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: displayCode.toUpperCase() },
            select: {
                id: true,
                tenantId: true,
                displayCode: true,
                isActive: true,
                tenant: {
                    select: {
                        name: true,
                        email: true,
                        businessSettings: true,
                    },
                },
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        if (!display.isActive) {
            return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' });
        }
        const parsedTenantSettings = (0, business_settings_1.parseSettings)(display.tenant.businessSettings, {
            name: display.tenant.name,
            email: display.tenant.email,
        });
        const requestedHours = parseDriverAccessHours(req.body.accessHours);
        const accessHours = requestedHours ?? parsedTenantSettings.driver.defaultAccessHours;
        const normalizedDeviceLabel = normalizeDeviceLabel(req.body.deviceLabel) ??
            `Fahrergeraet ${new Date().toLocaleString('de-DE')}`;
        const sessionId = createDriverDeviceSessionId();
        const expiresAtMs = Date.now() + accessHours * 60 * 60 * 1000;
        const expiresAtIso = new Date(expiresAtMs).toISOString();
        const pairingToken = (0, driver_device_token_1.signDriverDeviceToken)({
            sid: sessionId,
            tenantId: display.tenantId,
            displayCode: display.displayCode,
            deviceLabel: normalizedDeviceLabel,
            driverUserId: null,
            driverName: null,
            kind: 'PAIRING',
            expiresAtMs,
        });
        const pairingPayload = `klarando-driver-pair:${display.displayCode}:${pairingToken}`;
        await (0, audit_1.writeAuditLog)({
            req,
            module: driver_device_sessions_1.DRIVER_DEVICE_SESSION_MODULE,
            action: 'session_issued',
            targetType: driver_device_sessions_1.DRIVER_DEVICE_SESSION_TARGET_TYPE,
            targetId: sessionId,
            tenantId: display.tenantId,
            metadata: {
                displayId: display.id,
                displayCode: display.displayCode,
                deviceLabel: normalizedDeviceLabel,
                expiresAt: expiresAtIso,
                driverUserId: null,
                driverName: null,
            },
        });
        return res.status(201).json({
            ok: true,
            sessionId,
            displayCode: display.displayCode,
            tenantId: display.tenantId,
            deviceLabel: normalizedDeviceLabel,
            accessHours,
            expiresAt: expiresAtIso,
            pairingToken,
            pairingPayload,
            qrImageUrl: `https://api.qrserver.com/v1/create-qr-code/?size=340x340&data=${encodeURIComponent(pairingPayload)}`,
        });
    }
    catch (error) {
        console.error('CREATE DRIVER DEVICE SESSION ERROR:', error);
        return res.status(500).json({ error: 'Fahrergeraet-QR konnte nicht erstellt werden' });
    }
});
router.get('/public/:displayCode/driver-devices/active', async (req, res) => {
    try {
        const displayCode = Array.isArray(req.params.displayCode)
            ? req.params.displayCode[0]
            : req.params.displayCode;
        if (!displayCode) {
            return res.status(400).json({ error: 'displayCode fehlt' });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: displayCode.toUpperCase() },
            select: {
                id: true,
                tenantId: true,
                displayCode: true,
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        const sessions = await (0, driver_device_sessions_1.listDriverDeviceSessionsForTenant)(display.tenantId, {
            displayCode: display.displayCode,
        });
        return res.json({
            total: sessions.length,
            sessions,
            generatedAt: new Date().toISOString(),
        });
    }
    catch (error) {
        console.error('GET ACTIVE DRIVER DEVICES ERROR:', error);
        return res.status(500).json({ error: 'Aktive Fahrergeraete konnten nicht geladen werden' });
    }
});
router.post('/public/:displayCode/driver-devices/revoke', async (req, res) => {
    try {
        const displayCode = Array.isArray(req.params.displayCode)
            ? req.params.displayCode[0]
            : req.params.displayCode;
        const rawSessionId = req.body.sessionId;
        const sessionId = (0, order_display_utils_1.normalizeText)(typeof rawSessionId === 'string' ? rawSessionId : null);
        if (!displayCode || !sessionId) {
            return res.status(400).json({ error: 'displayCode oder sessionId fehlt' });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: displayCode.toUpperCase() },
            select: {
                id: true,
                tenantId: true,
                displayCode: true,
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        const session = await (0, driver_device_sessions_1.resolveDriverDeviceSession)(sessionId, display.tenantId);
        if (!session || session.displayCode !== display.displayCode) {
            return res.status(404).json({ error: 'Fahrergeraete-Session nicht gefunden' });
        }
        if (session.revokedAt) {
            return res.status(409).json({ error: 'Session wurde bereits getrennt' });
        }
        await (0, audit_1.writeAuditLog)({
            req,
            module: driver_device_sessions_1.DRIVER_DEVICE_SESSION_MODULE,
            action: 'session_revoked',
            targetType: driver_device_sessions_1.DRIVER_DEVICE_SESSION_TARGET_TYPE,
            targetId: sessionId,
            tenantId: display.tenantId,
            metadata: {
                displayId: display.id,
                displayCode: display.displayCode,
                deviceLabel: session.deviceLabel,
                expiresAt: session.expiresAt,
                driverUserId: session.driverUserId,
                driverName: session.driverName,
            },
        });
        return res.json({ ok: true, sessionId });
    }
    catch (error) {
        console.error('REVOKE DRIVER DEVICE SESSION ERROR:', error);
        return res.status(500).json({ error: 'Fahrergeraete-Session konnte nicht getrennt werden' });
    }
});
router.post('/public/:displayCode/orders/:orderId/status', async (req, res) => {
    try {
        const displayCode = Array.isArray(req.params.displayCode)
            ? req.params.displayCode[0]
            : req.params.displayCode;
        const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId;
        const { status } = req.body;
        if (!displayCode || !orderId || !status) {
            return res.status(400).json({ error: 'displayCode, orderId oder status fehlt' });
        }
        if (!order_display_utils_1.DISPLAY_STATUS_VALUES.has(status)) {
            return res.status(400).json({ error: 'Ungueltiger Status' });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: displayCode.toUpperCase() },
            select: {
                id: true,
                tenantId: true,
                displayRole: true,
                isActive: true,
                sourceTerminalIds: true,
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        if (!display.isActive) {
            return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' });
        }
        if (display.displayRole === 'PICKUP') {
            return res.status(403).json({
                error: 'Abhol-Display ist nur fuer Anzeige konfiguriert und kann keine Statusaenderung ausfuehren',
            });
        }
        const existingOrder = await prisma_1.prisma.order.findUnique({
            where: { id: orderId },
            select: {
                id: true,
                tenantId: true,
                serviceType: true,
                sourceChannel: true,
                terminalId: true,
                cashDisplayId: true,
                kitchenDisplayId: true,
                pickupDisplayId: true,
                pickupNumber: true,
            },
        });
        if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
            return res.status(404).json({ error: 'Bestellung nicht gefunden' });
        }
        const expectedDisplayIdField = (0, order_display_utils_1.roleOrderField)(display.displayRole);
        const assignedDisplayId = expectedDisplayIdField === 'cashDisplayId'
            ? existingOrder.cashDisplayId
            : expectedDisplayIdField === 'pickupDisplayId'
                ? existingOrder.pickupDisplayId
                : existingOrder.kitchenDisplayId;
        if (assignedDisplayId !== display.id) {
            return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Display' });
        }
        const acceptedTerminalIds = (0, order_display_utils_1.parseStoredIdList)(display.sourceTerminalIds);
        const isAppOrder = existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY';
        if (acceptedTerminalIds.length > 0 &&
            !isAppOrder &&
            (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))) {
            return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' });
        }
        if (status === 'archived' && display.displayRole !== 'CASH') {
            return res.status(403).json({
                error: 'Archivierung ist nur am Kassendisplay zulaessig',
            });
        }
        if (status === 'out_for_delivery') {
            if (display.displayRole !== 'CASH') {
                return res.status(403).json({
                    error: 'Status Fahrer unterwegs darf nur am Kassendisplay gesetzt werden',
                });
            }
            if (existingOrder.serviceType !== 'DELIVERY') {
                return res.status(400).json({
                    error: 'Nur Lieferbestellungen koennen auf Fahrer unterwegs gesetzt werden',
                });
            }
        }
        const shouldAssignPickupNumber = existingOrder.pickupNumber === null &&
            (status === 'open' ||
                status === 'preparing' ||
                status === 'out_for_delivery' ||
                status === 'done');
        const resolvedPickupNumber = shouldAssignPickupNumber
            ? await (0, pickup_number_1.generateNextPickupNumberForTenant)(display.tenantId)
            : existingOrder.pickupNumber;
        let pickupAnnouncedAt;
        let pickupAnnounceUntil;
        if (status === 'done' && existingOrder.pickupDisplayId && resolvedPickupNumber !== null) {
            const pickupDisplay = await prisma_1.prisma.orderDisplay.findUnique({
                where: { id: existingOrder.pickupDisplayId },
                select: {
                    announceOnMenuScreens: true,
                    menuAnnouncementDurationSec: true,
                },
            });
            if (pickupDisplay?.announceOnMenuScreens) {
                const now = new Date();
                pickupAnnouncedAt = now;
                pickupAnnounceUntil = new Date(now.getTime() + pickupDisplay.menuAnnouncementDurationSec * 1000);
            }
        }
        if (status === 'archived') {
            pickupAnnouncedAt = null;
            pickupAnnounceUntil = null;
        }
        if (status === 'done') {
            await prisma_1.prisma.orderItem.updateMany({
                where: {
                    orderId,
                },
                data: {
                    productionStatus: 'DONE',
                    productionDoneAt: new Date(),
                },
            });
        }
        else if (status === 'open') {
            await prisma_1.prisma.orderItem.updateMany({
                where: {
                    orderId,
                },
                data: {
                    productionStatus: 'OPEN',
                    productionDoneAt: null,
                },
            });
        }
        const updated = await prisma_1.prisma.order.update({
            where: { id: orderId },
            data: {
                status,
                pickupNumber: shouldAssignPickupNumber ? resolvedPickupNumber : undefined,
                forwardedToKitchenAt: status === 'open' ||
                    status === 'preparing' ||
                    status === 'out_for_delivery' ||
                    status === 'done'
                    ? new Date()
                    : undefined,
                driverDepartedAt: status === 'out_for_delivery' ? new Date() : undefined,
                pickupAnnouncedAt,
                pickupAnnounceUntil,
            },
            include: {
                terminal: {
                    select: {
                        id: true,
                        name: true,
                        terminalCode: true,
                        location: true,
                    },
                },
                items: {
                    include: {
                        product: {
                            include: {
                                category: {
                                    select: {
                                        id: true,
                                        name: true,
                                        imageUrl: true,
                                    },
                                },
                            },
                        },
                    },
                },
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE PUBLIC ORDER DISPLAY STATUS ERROR:', error);
        return res.status(500).json({ error: 'Status konnte nicht aktualisiert werden' });
    }
});
router.post('/public/:displayCode/orders/:orderId/items/:itemId/status', async (req, res) => {
    try {
        const displayCode = Array.isArray(req.params.displayCode)
            ? req.params.displayCode[0]
            : req.params.displayCode;
        const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId;
        const itemId = Array.isArray(req.params.itemId) ? req.params.itemId[0] : req.params.itemId;
        const { status } = req.body;
        if (!displayCode || !orderId || !itemId || !status) {
            return res.status(400).json({ error: 'displayCode, orderId, itemId oder status fehlt' });
        }
        const normalizedItemStatus = (0, order_display_utils_1.normalizeText)(status)?.toUpperCase();
        if (normalizedItemStatus !== 'OPEN' && normalizedItemStatus !== 'DONE') {
            return res.status(400).json({ error: 'Ungueltiger Item-Status (OPEN oder DONE)' });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: displayCode.toUpperCase() },
            select: {
                id: true,
                tenantId: true,
                displayRole: true,
                isActive: true,
                sourceTerminalIds: true,
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        if (!display.isActive) {
            return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' });
        }
        if (display.displayRole === 'PICKUP') {
            return res.status(403).json({
                error: 'Abhol-Display ist nur fuer Anzeige konfiguriert und kann keine Positionen bearbeiten',
            });
        }
        const existingOrder = await prisma_1.prisma.order.findUnique({
            where: { id: orderId },
            select: {
                id: true,
                tenantId: true,
                sourceChannel: true,
                terminalId: true,
                cashDisplayId: true,
                kitchenDisplayId: true,
                pickupDisplayId: true,
                pickupNumber: true,
                status: true,
            },
        });
        if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
            return res.status(404).json({ error: 'Bestellung nicht gefunden' });
        }
        const expectedDisplayIdField = (0, order_display_utils_1.roleOrderField)(display.displayRole);
        const assignedDisplayId = expectedDisplayIdField === 'cashDisplayId'
            ? existingOrder.cashDisplayId
            : expectedDisplayIdField === 'pickupDisplayId'
                ? existingOrder.pickupDisplayId
                : existingOrder.kitchenDisplayId;
        if (assignedDisplayId !== display.id) {
            return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Display' });
        }
        const acceptedTerminalIds = (0, order_display_utils_1.parseStoredIdList)(display.sourceTerminalIds);
        const isAppOrder = existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY';
        if (acceptedTerminalIds.length > 0 &&
            !isAppOrder &&
            (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))) {
            return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' });
        }
        const existingItem = await prisma_1.prisma.orderItem.findUnique({
            where: { id: itemId },
            select: {
                id: true,
                orderId: true,
            },
        });
        if (!existingItem || existingItem.orderId !== existingOrder.id) {
            return res.status(404).json({ error: 'Bestellposition nicht gefunden' });
        }
        const now = new Date();
        await prisma_1.prisma.orderItem.update({
            where: { id: existingItem.id },
            data: {
                productionStatus: normalizedItemStatus,
                productionDoneAt: normalizedItemStatus === 'DONE' ? now : null,
            },
        });
        const itemStatuses = await prisma_1.prisma.orderItem.findMany({
            where: { orderId: existingOrder.id },
            select: { productionStatus: true },
        });
        const allDone = itemStatuses.length > 0 &&
            itemStatuses.every((entry) => entry.productionStatus.toUpperCase() === 'DONE');
        const anyDone = itemStatuses.some((entry) => entry.productionStatus.toUpperCase() === 'DONE');
        const nextStatus = allDone ? 'done' : anyDone ? 'preparing' : 'open';
        const shouldAssignPickupNumber = existingOrder.pickupNumber === null &&
            (nextStatus === 'open' || nextStatus === 'preparing' || nextStatus === 'done');
        const resolvedPickupNumber = shouldAssignPickupNumber
            ? await (0, pickup_number_1.generateNextPickupNumberForTenant)(display.tenantId)
            : existingOrder.pickupNumber;
        if (nextStatus !== existingOrder.status || shouldAssignPickupNumber) {
            await prisma_1.prisma.order.update({
                where: { id: existingOrder.id },
                data: {
                    status: nextStatus,
                    pickupNumber: shouldAssignPickupNumber ? resolvedPickupNumber : undefined,
                    forwardedToKitchenAt: new Date(),
                },
            });
        }
        const updated = await prisma_1.prisma.order.findUnique({
            where: { id: existingOrder.id },
            include: {
                terminal: {
                    select: {
                        id: true,
                        name: true,
                        terminalCode: true,
                        location: true,
                    },
                },
                items: {
                    include: {
                        product: {
                            include: {
                                category: {
                                    select: {
                                        id: true,
                                        name: true,
                                        imageUrl: true,
                                    },
                                },
                            },
                        },
                    },
                },
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE PUBLIC ORDER DISPLAY ITEM STATUS ERROR:', error);
        return res.status(500).json({ error: 'Positionsstatus konnte nicht aktualisiert werden' });
    }
});
router.post('/public/:displayCode/orders/:orderId/payment', async (req, res) => {
    try {
        const displayCode = Array.isArray(req.params.displayCode)
            ? req.params.displayCode[0]
            : req.params.displayCode;
        const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId;
        const { paid } = req.body;
        if (!displayCode || !orderId || typeof paid !== 'boolean') {
            return res.status(400).json({ error: 'displayCode, orderId oder paid fehlt' });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: displayCode.toUpperCase() },
            select: {
                id: true,
                tenantId: true,
                displayRole: true,
                isActive: true,
                sourceTerminalIds: true,
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        if (!display.isActive) {
            return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' });
        }
        if (display.displayRole !== 'CASH') {
            return res.status(403).json({ error: 'Zahlungsstatus darf nur am Kassendisplay geaendert werden' });
        }
        const existingOrder = await prisma_1.prisma.order.findUnique({
            where: { id: orderId },
            select: {
                id: true,
                tenantId: true,
                sourceChannel: true,
                terminalId: true,
                cashDisplayId: true,
                paymentStatus: true,
            },
        });
        if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
            return res.status(404).json({ error: 'Bestellung nicht gefunden' });
        }
        if (existingOrder.cashDisplayId !== display.id) {
            return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Kassendisplay' });
        }
        const acceptedTerminalIds = (0, order_display_utils_1.parseStoredIdList)(display.sourceTerminalIds);
        const isAppOrder = existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY';
        if (acceptedTerminalIds.length > 0 &&
            !isAppOrder &&
            (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))) {
            return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' });
        }
        if (!paid) {
            return res.status(400).json({
                error: 'Rueckgaengig ist am Kassendisplay deaktiviert. Zahlung kann hier nur als bezahlt markiert werden.',
            });
        }
        const updated = await prisma_1.prisma.order.update({
            where: { id: orderId },
            data: {
                paymentStatus: paid ? 'PAID' : 'UNPAID',
                paidAt: paid ? new Date() : null,
            },
            include: {
                terminal: {
                    select: {
                        id: true,
                        name: true,
                        terminalCode: true,
                        location: true,
                    },
                },
                items: {
                    include: {
                        product: {
                            include: {
                                category: {
                                    select: {
                                        id: true,
                                        name: true,
                                        imageUrl: true,
                                    },
                                },
                            },
                        },
                    },
                },
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE PUBLIC ORDER DISPLAY PAYMENT ERROR:', error);
        return res.status(500).json({ error: 'Zahlungsstatus konnte nicht aktualisiert werden' });
    }
});
router.post('/public/:displayCode/orders/:orderId/accept', async (req, res) => {
    try {
        const displayCode = Array.isArray(req.params.displayCode)
            ? req.params.displayCode[0]
            : req.params.displayCode;
        const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId;
        const { estimatedMinutes } = req.body;
        const parsedEstimatedMinutes = Number(estimatedMinutes);
        if (!displayCode ||
            !orderId ||
            !Number.isFinite(parsedEstimatedMinutes) ||
            parsedEstimatedMinutes < 5 ||
            parsedEstimatedMinutes > 240) {
            return res.status(400).json({
                error: 'displayCode, orderId oder estimatedMinutes (5-240) fehlt',
            });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: displayCode.toUpperCase() },
            select: {
                id: true,
                tenantId: true,
                displayRole: true,
                isActive: true,
                sourceTerminalIds: true,
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        if (!display.isActive) {
            return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' });
        }
        if (display.displayRole !== 'CASH') {
            return res
                .status(403)
                .json({ error: 'Annahme mit Zeitvorschlag ist nur am Kassendisplay erlaubt' });
        }
        const existingOrder = await prisma_1.prisma.order.findUnique({
            where: { id: orderId },
            select: {
                id: true,
                tenantId: true,
                sourceChannel: true,
                terminalId: true,
                cashDisplayId: true,
                pickupNumber: true,
                status: true,
            },
        });
        if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
            return res.status(404).json({ error: 'Bestellung nicht gefunden' });
        }
        if (existingOrder.cashDisplayId !== display.id) {
            return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Kassendisplay' });
        }
        const acceptedTerminalIds = (0, order_display_utils_1.parseStoredIdList)(display.sourceTerminalIds);
        const isAppOrder = existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY';
        if (acceptedTerminalIds.length > 0 &&
            !isAppOrder &&
            (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))) {
            return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' });
        }
        const now = new Date();
        const estimatedReadyAt = new Date(now.getTime() + parsedEstimatedMinutes * 60 * 1000);
        const pickupNumber = existingOrder.pickupNumber ?? (await (0, pickup_number_1.generateNextPickupNumberForTenant)(display.tenantId));
        const updated = await prisma_1.prisma.order.update({
            where: { id: orderId },
            data: {
                acceptedAt: now,
                estimatedMinutes: Math.round(parsedEstimatedMinutes),
                estimatedReadyAt,
                pickupNumber,
                status: existingOrder.status === 'pending_payment' ? 'open' : existingOrder.status,
                forwardedToKitchenAt: now,
            },
            include: {
                terminal: {
                    select: {
                        id: true,
                        name: true,
                        terminalCode: true,
                        location: true,
                    },
                },
                tenant: {
                    select: {
                        id: true,
                        name: true,
                    },
                },
                appCustomerAccount: {
                    select: {
                        id: true,
                        email: true,
                        fullName: true,
                    },
                },
                items: {
                    include: {
                        product: {
                            include: {
                                category: {
                                    select: {
                                        id: true,
                                        name: true,
                                        imageUrl: true,
                                    },
                                },
                            },
                        },
                    },
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'order_display',
            action: 'order_accepted_with_eta',
            targetType: 'order',
            targetId: updated.id,
            tenantId: updated.tenantId,
            metadata: {
                displayId: display.id,
                displayRole: display.displayRole,
                estimatedMinutes: Math.round(parsedEstimatedMinutes),
                pickupNumber,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('ACCEPT ORDER WITH ETA ERROR:', error);
        return res.status(500).json({ error: 'Bestellannahme konnte nicht gespeichert werden' });
    }
});
router.post('/public/:displayCode/orders/:orderId/dispatch', async (req, res) => {
    try {
        const displayCode = Array.isArray(req.params.displayCode)
            ? req.params.displayCode[0]
            : req.params.displayCode;
        const orderId = Array.isArray(req.params.orderId) ? req.params.orderId[0] : req.params.orderId;
        const { driverUserId, driverName, estimatedMinutes } = req.body;
        const normalizedDriverUserId = (0, order_display_utils_1.normalizeText)(driverUserId);
        const normalizedDriverName = (0, order_display_utils_1.normalizeText)(driverName);
        const parsedEstimatedMinutes = estimatedMinutes === undefined || estimatedMinutes === null
            ? null
            : Math.trunc(Number(estimatedMinutes));
        if (!displayCode || !orderId) {
            return res.status(400).json({ error: 'displayCode oder orderId fehlt' });
        }
        if (parsedEstimatedMinutes !== null &&
            (!Number.isFinite(parsedEstimatedMinutes) ||
                parsedEstimatedMinutes < 5 ||
                parsedEstimatedMinutes > 240)) {
            return res
                .status(400)
                .json({ error: 'estimatedMinutes muss zwischen 5 und 240 Minuten liegen' });
        }
        const display = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: displayCode.toUpperCase() },
            select: {
                id: true,
                tenantId: true,
                displayRole: true,
                isActive: true,
                sourceTerminalIds: true,
            },
        });
        if (!display) {
            return res.status(404).json({ error: 'Bestell-Display nicht gefunden' });
        }
        if (!display.isActive) {
            return res.status(403).json({ error: 'Bestell-Display ist deaktiviert' });
        }
        if (display.displayRole !== 'CASH') {
            return res.status(403).json({
                error: 'Fahrerzuweisung ist nur am Kassendisplay erlaubt',
            });
        }
        const existingOrder = await prisma_1.prisma.order.findUnique({
            where: { id: orderId },
            select: {
                id: true,
                tenantId: true,
                sourceChannel: true,
                terminalId: true,
                cashDisplayId: true,
                serviceType: true,
                status: true,
                estimatedMinutes: true,
                pickupNumber: true,
                acceptedAt: true,
                driverAssignedAt: true,
            },
        });
        if (!existingOrder || existingOrder.tenantId !== display.tenantId) {
            return res.status(404).json({ error: 'Bestellung nicht gefunden' });
        }
        if (existingOrder.cashDisplayId !== display.id) {
            return res.status(403).json({ error: 'Bestellung gehoert nicht zu diesem Kassendisplay' });
        }
        if (existingOrder.serviceType !== 'DELIVERY') {
            return res.status(400).json({ error: 'Nur Lieferbestellungen koennen einem Fahrer zugeordnet werden' });
        }
        if (existingOrder.status === 'archived') {
            return res.status(400).json({ error: 'Archivierte Bestellungen koennen nicht versendet werden' });
        }
        const acceptedTerminalIds = (0, order_display_utils_1.parseStoredIdList)(display.sourceTerminalIds);
        const isAppOrder = existingOrder.sourceChannel === 'APP' || existingOrder.sourceChannel === 'DELIVERY';
        if (acceptedTerminalIds.length > 0 &&
            !isAppOrder &&
            (!existingOrder.terminalId || !acceptedTerminalIds.includes(existingOrder.terminalId))) {
            return res.status(403).json({ error: 'Bestellung stammt nicht aus zugelassenem Terminal' });
        }
        let resolvedDriver = null;
        if (normalizedDriverUserId) {
            const candidate = await prisma_1.prisma.user.findUnique({
                where: { id: normalizedDriverUserId },
                select: {
                    id: true,
                    name: true,
                    role: true,
                    isActive: true,
                    tenantId: true,
                },
            });
            if (!candidate || !candidate.isActive || candidate.role !== 'DRIVER') {
                return res.status(400).json({ error: 'Fahrer ist ungueltig oder inaktiv' });
            }
            if (candidate.tenantId !== existingOrder.tenantId) {
                return res.status(400).json({ error: 'Fahrer gehoert nicht zur Filiale dieser Bestellung' });
            }
            resolvedDriver = {
                id: candidate.id,
                name: candidate.name,
            };
        }
        if (!resolvedDriver && !normalizedDriverName) {
            return res.status(400).json({ error: 'Bitte Fahrer auswaehlen oder Fahrernamen eingeben' });
        }
        const now = new Date();
        const nextEstimatedMinutes = parsedEstimatedMinutes ?? existingOrder.estimatedMinutes ?? 30;
        const estimatedReadyAt = new Date(now.getTime() + nextEstimatedMinutes * 60 * 1000);
        const pickupNumber = existingOrder.pickupNumber ?? (await (0, pickup_number_1.generateNextPickupNumberForTenant)(display.tenantId));
        const updated = await prisma_1.prisma.order.update({
            where: { id: orderId },
            data: {
                status: 'out_for_delivery',
                assignedDriverId: resolvedDriver?.id ?? null,
                assignedDriverName: normalizedDriverName ?? resolvedDriver?.name ?? null,
                driverAssignedAt: existingOrder.driverAssignedAt ?? now,
                driverDepartedAt: now,
                acceptedAt: existingOrder.acceptedAt ?? now,
                estimatedMinutes: nextEstimatedMinutes,
                estimatedReadyAt,
                pickupNumber,
                forwardedToKitchenAt: now,
            },
            include: {
                terminal: {
                    select: {
                        id: true,
                        name: true,
                        terminalCode: true,
                        location: true,
                    },
                },
                assignedDriver: {
                    select: {
                        id: true,
                        name: true,
                        email: true,
                    },
                },
                items: {
                    include: {
                        product: {
                            include: {
                                category: {
                                    select: {
                                        id: true,
                                        name: true,
                                        imageUrl: true,
                                    },
                                },
                            },
                        },
                    },
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'order_display',
            action: 'order_dispatched_to_driver',
            targetType: 'order',
            targetId: updated.id,
            tenantId: updated.tenantId,
            metadata: {
                displayId: display.id,
                driverUserId: resolvedDriver?.id ?? null,
                driverName: normalizedDriverName ?? resolvedDriver?.name ?? null,
                estimatedMinutes: nextEstimatedMinutes,
                pickupNumber,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('DISPATCH ORDER TO DRIVER ERROR:', error);
        return res.status(500).json({ error: 'Fahrerzuweisung konnte nicht gespeichert werden' });
    }
});
exports.default = router;
