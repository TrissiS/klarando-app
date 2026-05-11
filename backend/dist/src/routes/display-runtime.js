"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const business_settings_1 = require("../lib/business-settings");
const display_performance_mode_1 = require("../lib/display-performance-mode");
const auth_1 = require("../middleware/auth");
const router = (0, express_1.Router)();
function toDisplayTypeFromOrderRole(role) {
    if (role === 'KITCHEN') {
        return 'KITCHEN';
    }
    if (role === 'PICKUP') {
        return 'CUSTOMER';
    }
    return 'ORDER';
}
function normalizeCodeParam(value) {
    if (Array.isArray(value)) {
        return value[0]?.trim().toUpperCase() || '';
    }
    return value?.trim().toUpperCase() || '';
}
function parsePerformanceMode(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const normalized = value.trim().toUpperCase();
    if (normalized === 'AUTO' || normalized === 'NORMAL' || normalized === 'LOW') {
        return normalized;
    }
    return null;
}
router.get('/:deviceCode/config', async (req, res) => {
    try {
        const code = normalizeCodeParam(req.params.deviceCode);
        if (!code) {
            return res.status(400).json({ error: 'deviceCode fehlt' });
        }
        const nowIso = new Date().toISOString();
        const screenDevice = await prisma_1.prisma.screenDevice.findUnique({
            where: { deviceCode: code },
        });
        if (screenDevice) {
            const tenant = await prisma_1.prisma.tenant.findUnique({
                where: { id: screenDevice.tenantId },
                select: {
                    id: true,
                    chainId: true,
                    name: true,
                    businessSettings: true,
                },
            });
            const tenantName = tenant?.name ?? 'Tenant';
            const businessSettings = (0, business_settings_1.parseSettings)(tenant?.businessSettings, {
                name: tenantName,
                email: null,
            });
            const meta = (0, display_performance_mode_1.parseDisplayMetaFromNotes)(screenDevice.notes);
            return res.json({
                deviceCode: screenDevice.deviceCode,
                displayType: 'MENU',
                tenantId: screenDevice.tenantId,
                chainId: tenant?.chainId ?? null,
                displayId: screenDevice.id,
                isActive: screenDevice.isActive,
                branding: {
                    tenantName,
                    logoUrl: businessSettings.logoUrl,
                    primaryColor: screenDevice.accentColorOverride ?? null,
                    secondaryColor: null,
                    textColor: screenDevice.textColorOverride,
                },
                layoutSettings: {
                    orientation: screenDevice.orientation,
                    resolutionWidth: screenDevice.resolutionWidth,
                    resolutionHeight: screenDevice.resolutionHeight,
                },
                refreshIntervalMs: Math.max(5000, screenDevice.refreshIntervalSec * 1000),
                performanceMode: meta.performanceMode ?? 'AUTO',
                assetSettings: {
                    baseUrl: null,
                    preferredFormats: ['mp4', 'webm', 'jpg', 'png'],
                },
                videoBackgroundEnabled: Boolean(screenDevice.backgroundMediaUrlOverride),
                videoBackgroundUrl: screenDevice.backgroundMediaUrlOverride,
                fallbackBackgroundUrl: null,
                cacheVersion: screenDevice.updatedAt.toISOString(),
                lastSeenAt: screenDevice.lastSeenAt?.toISOString() ?? null,
                lastSyncAt: screenDevice.updatedAt.toISOString(),
                updatedAt: screenDevice.updatedAt.toISOString(),
                serverTime: nowIso,
            });
        }
        const orderDisplay = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: code },
        });
        if (!orderDisplay) {
            return res.status(404).json({ error: 'Display nicht gefunden' });
        }
        const tenant = await prisma_1.prisma.tenant.findUnique({
            where: { id: orderDisplay.tenantId },
            select: {
                id: true,
                chainId: true,
                name: true,
                businessSettings: true,
            },
        });
        const tenantName = tenant?.name ?? 'Tenant';
        const businessSettings = (0, business_settings_1.parseSettings)(tenant?.businessSettings, {
            name: tenantName,
            email: null,
        });
        const meta = (0, display_performance_mode_1.parseDisplayMetaFromNotes)(orderDisplay.notes);
        const latestBinding = await prisma_1.prisma.orderDeskDeviceBinding.findFirst({
            where: {
                displayId: orderDisplay.id,
            },
            orderBy: {
                lastSeenAt: 'desc',
            },
            select: {
                lastSeenAt: true,
            },
        });
        return res.json({
            deviceCode: orderDisplay.displayCode,
            displayType: toDisplayTypeFromOrderRole(orderDisplay.displayRole),
            tenantId: orderDisplay.tenantId,
            chainId: tenant?.chainId ?? null,
            displayId: orderDisplay.id,
            isActive: orderDisplay.isActive,
            branding: {
                tenantName,
                logoUrl: businessSettings.logoUrl,
                primaryColor: orderDisplay.statusColorOpen ?? null,
                secondaryColor: null,
                textColor: null,
            },
            layoutSettings: {
                autoScaleLayout: orderDisplay.autoScaleLayout,
            },
            refreshIntervalMs: Math.max(3000, orderDisplay.refreshIntervalSec * 1000),
            performanceMode: meta.performanceMode ?? 'AUTO',
            assetSettings: {
                baseUrl: null,
                preferredFormats: ['mp4', 'webm', 'jpg', 'png'],
            },
            videoBackgroundEnabled: orderDisplay.backgroundMediaMode !== 'NONE' &&
                Boolean(orderDisplay.backgroundMediaUrl),
            videoBackgroundUrl: orderDisplay.backgroundMediaUrl,
            fallbackBackgroundUrl: null,
            cacheVersion: orderDisplay.updatedAt.toISOString(),
            lastSeenAt: latestBinding?.lastSeenAt?.toISOString() ?? null,
            lastSyncAt: orderDisplay.updatedAt.toISOString(),
            updatedAt: orderDisplay.updatedAt.toISOString(),
            serverTime: nowIso,
        });
    }
    catch (error) {
        console.error('GET DISPLAY RUNTIME CONFIG ERROR:', error);
        return res.status(500).json({ error: 'Display-Konfiguration konnte nicht geladen werden' });
    }
});
router.patch('/:deviceCode/performance-mode', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_WRITE), async (req, res) => {
    try {
        const code = normalizeCodeParam(req.params.deviceCode);
        const performanceMode = parsePerformanceMode(req.body.performanceMode);
        if (!code || !performanceMode) {
            return res.status(400).json({ error: 'deviceCode oder performanceMode fehlt/ungueltig' });
        }
        const screenDevice = await prisma_1.prisma.screenDevice.findUnique({
            where: { deviceCode: code },
            select: { id: true, notes: true },
        });
        if (screenDevice) {
            const updatedNotes = (0, display_performance_mode_1.applyPerformanceModeToNotes)(screenDevice.notes, performanceMode);
            await prisma_1.prisma.screenDevice.update({
                where: { id: screenDevice.id },
                data: { notes: updatedNotes },
            });
            return res.json({ ok: true, deviceCode: code, performanceMode });
        }
        const orderDisplay = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: code },
            select: { id: true, notes: true },
        });
        if (!orderDisplay) {
            return res.status(404).json({ error: 'Display nicht gefunden' });
        }
        const updatedNotes = (0, display_performance_mode_1.applyPerformanceModeToNotes)(orderDisplay.notes, performanceMode);
        await prisma_1.prisma.orderDisplay.update({
            where: { id: orderDisplay.id },
            data: { notes: updatedNotes },
        });
        return res.json({ ok: true, deviceCode: code, performanceMode });
    }
    catch (error) {
        console.error('SET DISPLAY PERFORMANCE MODE ERROR:', error);
        return res.status(500).json({ error: 'Performance-Profil konnte nicht gesetzt werden' });
    }
});
router.post('/:deviceCode/heartbeat', async (req, res) => {
    try {
        const code = normalizeCodeParam(req.params.deviceCode);
        if (!code) {
            return res.status(400).json({ error: 'deviceCode fehlt' });
        }
        const now = new Date();
        const screenDevice = await prisma_1.prisma.screenDevice.findUnique({
            where: { deviceCode: code },
            select: {
                id: true,
                isActive: true,
            },
        });
        if (screenDevice) {
            await prisma_1.prisma.screenDevice.update({
                where: { id: screenDevice.id },
                data: {
                    lastSeenAt: now,
                },
            });
            return res.json({
                status: screenDevice.isActive ? 'online' : 'inactive',
                serverTime: now.toISOString(),
                displayId: screenDevice.id,
                displayType: 'MENU',
                recoveryHints: [
                    'Bei Offline-Phasen letzte Konfiguration aus dem Cache nutzen.',
                    'Heartbeat-Intervall auf 20-30 Sekunden setzen.',
                ],
            });
        }
        const orderDisplay = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: code },
            select: {
                id: true,
                isActive: true,
                displayRole: true,
            },
        });
        if (!orderDisplay) {
            return res.status(404).json({ error: 'Display nicht gefunden' });
        }
        await prisma_1.prisma.orderDeskDeviceBinding.updateMany({
            where: {
                displayId: orderDisplay.id,
                isActive: true,
            },
            data: {
                lastSeenAt: now,
            },
        });
        return res.json({
            status: orderDisplay.isActive ? 'online' : 'inactive',
            serverTime: now.toISOString(),
            displayId: orderDisplay.id,
            displayType: toDisplayTypeFromOrderRole(orderDisplay.displayRole),
            recoveryHints: [
                'Bei kurzen Ausfaellen automatische Reconnect-Logik aktiv lassen.',
                'Beim Start zuerst Runtime-Config neu laden, dann Feed pollen.',
            ],
        });
    }
    catch (error) {
        console.error('DISPLAY HEARTBEAT ERROR:', error);
        return res.status(500).json({ error: 'Heartbeat konnte nicht verarbeitet werden' });
    }
});
exports.default = router;
