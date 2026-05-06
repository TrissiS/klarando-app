"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const audit_1 = require("../lib/audit");
const auth_1 = require("../middleware/auth");
const router = (0, express_1.Router)();
const BACKGROUND_MODES = new Set(['COLOR', 'IMAGE', 'VIDEO']);
const OVERLAY_ANIMATIONS = new Set(['NONE', 'FLOAT', 'SLIDE', 'SPARKLE']);
const CARD_STYLES = new Set(['SOFT', 'SHARP', 'GLASS']);
const ALLERGEN_LEGEND_POSITIONS = new Set([
    'TOP_LEFT',
    'TOP_RIGHT',
    'BOTTOM_LEFT',
    'BOTTOM_RIGHT',
    'BOTTOM_CENTER',
]);
const ORIENTATIONS = new Set(['LANDSCAPE', 'PORTRAIT']);
function normalizeText(input) {
    if (!input) {
        return null;
    }
    const trimmed = input.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function normalizeHexColor(input) {
    const normalized = normalizeText(input);
    if (!normalized) {
        return null;
    }
    if (!/^#[0-9A-Fa-f]{6}$/.test(normalized)) {
        return null;
    }
    return normalized.toLowerCase();
}
function parseAllergenCodes(raw) {
    if (!raw) {
        return [];
    }
    return Array.from(new Set(raw
        .split(',')
        .map((entry) => entry.trim().toUpperCase())
        .filter(Boolean))).sort();
}
function collectAllergens(product) {
    const codes = new Set();
    for (const item of product.ingredients) {
        parseAllergenCodes(item.ingredient.allergens).forEach((code) => codes.add(code));
    }
    return Array.from(codes).sort();
}
function collectIngredients(product) {
    return product.ingredients.map((item) => ({
        name: item.ingredient.name,
        allergens: parseAllergenCodes(item.ingredient.allergens),
    }));
}
function mapScreenProduct(product) {
    const setting = product.screenSetting;
    return {
        id: product.id,
        tenantId: product.tenantId,
        productNumber: product.productNumber,
        name: product.name,
        price: product.price,
        available: product.available,
        category: product.category,
        allergens: collectAllergens(product),
        ingredients: collectIngredients(product),
        screen: {
            displayCategory: setting?.displayCategory ?? product.category?.name ?? null,
            sortOrder: setting?.sortOrder ?? product.category?.sortOrder ?? 0,
            showOnScreen: setting?.showOnScreen ?? product.available,
            isFeatured: setting?.isFeatured ?? false,
            badgeText: setting?.badgeText ?? null,
            highlightColor: setting?.highlightColor ?? null,
            updatedAt: setting?.updatedAt ?? null,
        },
    };
}
function sortScreenProducts(left, right) {
    if (left.screen.showOnScreen !== right.screen.showOnScreen) {
        return left.screen.showOnScreen ? -1 : 1;
    }
    if (left.screen.sortOrder !== right.screen.sortOrder) {
        return left.screen.sortOrder - right.screen.sortOrder;
    }
    return left.name.localeCompare(right.name, 'de-DE');
}
function generateDeviceCode() {
    const alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    let output = 'KS-';
    for (let index = 0; index < 8; index += 1) {
        output += alphabet[Math.floor(Math.random() * alphabet.length)];
    }
    return output;
}
async function createUniqueDeviceCode() {
    for (let attempt = 0; attempt < 10; attempt += 1) {
        const code = generateDeviceCode();
        const existing = await prisma_1.prisma.screenDevice.findUnique({
            where: { deviceCode: code },
            select: { id: true },
        });
        if (!existing) {
            return code;
        }
    }
    return `${generateDeviceCode()}${Date.now().toString().slice(-2)}`;
}
router.get('/config', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const config = await prisma_1.prisma.screenSetting.upsert({
            where: { tenantId },
            update: {},
            create: { tenantId },
        });
        return res.json(config);
    }
    catch (error) {
        console.error('GET SCREEN CONFIG ERROR:', error);
        return res.status(500).json({ error: 'Bildschirm-Konfiguration konnte nicht geladen werden' });
    }
});
router.put('/config', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_WRITE), async (req, res) => {
    try {
        const { tenantId, title, subtitle, backgroundMode, backgroundValue, backgroundMediaUrl, overlayAnimation, cardStyle, accentColor, textColor, showAllergens, allergenLegendEnabled, allergenLegendPosition, showPrices, showUnavailable, offerWindowEnabled, offerWindowTitle, offerWindowText, } = req.body;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        if (title !== undefined && !normalizeText(title)) {
            return res.status(400).json({ error: 'Titel darf nicht leer sein' });
        }
        if (backgroundMode !== undefined && !BACKGROUND_MODES.has(backgroundMode)) {
            return res.status(400).json({ error: 'ungueltiger backgroundMode' });
        }
        if (overlayAnimation !== undefined && !OVERLAY_ANIMATIONS.has(overlayAnimation)) {
            return res.status(400).json({ error: 'ungueltige overlayAnimation' });
        }
        if (cardStyle !== undefined && !CARD_STYLES.has(cardStyle)) {
            return res.status(400).json({ error: 'ungueltiger cardStyle' });
        }
        if (allergenLegendPosition !== undefined &&
            !ALLERGEN_LEGEND_POSITIONS.has(allergenLegendPosition)) {
            return res.status(400).json({ error: 'ungueltige allergenLegendPosition' });
        }
        if (allergenLegendEnabled !== undefined &&
            typeof allergenLegendEnabled !== 'boolean') {
            return res.status(400).json({ error: 'allergenLegendEnabled muss true oder false sein' });
        }
        if (accentColor !== undefined && accentColor !== null && !normalizeHexColor(accentColor)) {
            return res.status(400).json({ error: 'accentColor muss im Format #RRGGBB sein' });
        }
        if (textColor !== undefined && textColor !== null && !normalizeHexColor(textColor)) {
            return res.status(400).json({ error: 'textColor muss im Format #RRGGBB sein' });
        }
        const config = await prisma_1.prisma.screenSetting.upsert({
            where: { tenantId },
            update: {
                title: title === undefined ? undefined : normalizeText(title) ?? undefined,
                subtitle: subtitle === undefined ? undefined : normalizeText(subtitle),
                backgroundMode,
                backgroundValue: backgroundValue === undefined ? undefined : normalizeText(backgroundValue),
                backgroundMediaUrl: backgroundMediaUrl === undefined ? undefined : normalizeText(backgroundMediaUrl),
                overlayAnimation,
                cardStyle,
                accentColor: accentColor === undefined
                    ? undefined
                    : normalizeHexColor(accentColor) ?? '#ea580c',
                textColor: textColor === undefined
                    ? undefined
                    : normalizeHexColor(textColor) ?? '#ffffff',
                showAllergens,
                allergenLegendEnabled,
                allergenLegendPosition,
                showPrices,
                showUnavailable,
                offerWindowEnabled,
                offerWindowTitle: offerWindowTitle === undefined ? undefined : normalizeText(offerWindowTitle),
                offerWindowText: offerWindowText === undefined ? undefined : normalizeText(offerWindowText),
            },
            create: {
                tenantId,
                title: normalizeText(title) ?? 'Klarando Menu',
                subtitle: normalizeText(subtitle),
                backgroundMode: backgroundMode && BACKGROUND_MODES.has(backgroundMode) ? backgroundMode : 'COLOR',
                backgroundValue: normalizeText(backgroundValue),
                backgroundMediaUrl: normalizeText(backgroundMediaUrl),
                overlayAnimation: overlayAnimation && OVERLAY_ANIMATIONS.has(overlayAnimation)
                    ? overlayAnimation
                    : 'NONE',
                cardStyle: cardStyle && CARD_STYLES.has(cardStyle) ? cardStyle : 'SOFT',
                accentColor: normalizeHexColor(accentColor) ?? '#ea580c',
                textColor: normalizeHexColor(textColor) ?? '#ffffff',
                showAllergens: showAllergens ?? true,
                allergenLegendEnabled: allergenLegendEnabled ?? true,
                allergenLegendPosition: allergenLegendPosition && ALLERGEN_LEGEND_POSITIONS.has(allergenLegendPosition)
                    ? allergenLegendPosition
                    : 'BOTTOM_RIGHT',
                showPrices: showPrices ?? true,
                showUnavailable: showUnavailable ?? false,
                offerWindowEnabled: offerWindowEnabled ?? false,
                offerWindowTitle: normalizeText(offerWindowTitle),
                offerWindowText: normalizeText(offerWindowText),
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'screen',
            action: 'screen_config_updated',
            targetType: 'screen_setting',
            targetId: config.id,
            tenantId,
            metadata: {
                backgroundMode: config.backgroundMode,
                overlayAnimation: config.overlayAnimation,
            },
        });
        return res.json(config);
    }
    catch (error) {
        console.error('UPDATE SCREEN CONFIG ERROR:', error);
        return res.status(500).json({ error: 'Bildschirm-Konfiguration konnte nicht gespeichert werden' });
    }
});
router.get('/products', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        const categoryId = req.query.categoryId;
        const showOnScreenFilter = req.query.showOnScreen;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const products = await prisma_1.prisma.product.findMany({
            where: {
                tenantId,
                ...(categoryId ? { categoryId } : {}),
            },
            include: {
                category: true,
                screenSetting: true,
                ingredients: {
                    include: {
                        ingredient: {
                            select: {
                                name: true,
                                allergens: true,
                            },
                        },
                    },
                    orderBy: [{ createdAt: 'asc' }],
                },
            },
            orderBy: [{ createdAt: 'desc' }],
        });
        const mapped = products.map(mapScreenProduct).sort(sortScreenProducts);
        if (showOnScreenFilter === 'true') {
            return res.json(mapped.filter((entry) => entry.screen.showOnScreen));
        }
        if (showOnScreenFilter === 'false') {
            return res.json(mapped.filter((entry) => !entry.screen.showOnScreen));
        }
        return res.json(mapped);
    }
    catch (error) {
        console.error('GET SCREEN PRODUCTS ERROR:', error);
        return res.status(500).json({ error: 'Bildschirm-Produkte konnten nicht geladen werden' });
    }
});
router.put('/products/:productId', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const productId = Array.isArray(req.params.productId) ? req.params.productId[0] : req.params.productId;
        const { tenantId, displayCategory, sortOrder, showOnScreen, isFeatured, badgeText, highlightColor, } = req.body;
        if (!productId || !tenantId) {
            return res.status(400).json({ error: 'productId und tenantId sind erforderlich' });
        }
        const product = await prisma_1.prisma.product.findUnique({
            where: { id: productId },
            select: { id: true, tenantId: true, name: true },
        });
        if (!product || product.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Produkt nicht gefunden' });
        }
        const parsedSortOrder = sortOrder === undefined ? undefined : Number.parseInt(String(sortOrder), 10);
        if (parsedSortOrder !== undefined &&
            (!Number.isInteger(parsedSortOrder) || parsedSortOrder < 0 || parsedSortOrder > 9999)) {
            return res.status(400).json({ error: 'sortOrder muss zwischen 0 und 9999 liegen' });
        }
        if (showOnScreen !== undefined && typeof showOnScreen !== 'boolean') {
            return res.status(400).json({ error: 'showOnScreen muss true oder false sein' });
        }
        if (isFeatured !== undefined && typeof isFeatured !== 'boolean') {
            return res.status(400).json({ error: 'isFeatured muss true oder false sein' });
        }
        if (highlightColor !== undefined && highlightColor !== null && !normalizeHexColor(highlightColor)) {
            return res.status(400).json({ error: 'highlightColor muss im Format #RRGGBB sein' });
        }
        const updated = await prisma_1.prisma.screenProductSetting.upsert({
            where: { productId },
            update: {
                displayCategory: displayCategory === undefined ? undefined : normalizeText(displayCategory),
                sortOrder: parsedSortOrder,
                showOnScreen,
                isFeatured,
                badgeText: badgeText === undefined ? undefined : normalizeText(badgeText),
                highlightColor: highlightColor === undefined
                    ? undefined
                    : normalizeHexColor(highlightColor),
            },
            create: {
                tenantId,
                productId,
                displayCategory: normalizeText(displayCategory),
                sortOrder: parsedSortOrder ?? 0,
                showOnScreen: showOnScreen ?? true,
                isFeatured: isFeatured ?? false,
                badgeText: normalizeText(badgeText),
                highlightColor: normalizeHexColor(highlightColor),
            },
        });
        const hydrated = await prisma_1.prisma.product.findUniqueOrThrow({
            where: { id: updated.productId },
            include: {
                category: true,
                screenSetting: true,
                ingredients: {
                    include: {
                        ingredient: {
                            select: {
                                name: true,
                                allergens: true,
                            },
                        },
                    },
                    orderBy: [{ createdAt: 'asc' }],
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'screen',
            action: 'screen_product_updated',
            targetType: 'product',
            targetId: updated.productId,
            tenantId,
            metadata: {
                productName: product.name,
                showOnScreen: updated.showOnScreen,
                sortOrder: updated.sortOrder,
            },
        });
        return res.json(mapScreenProduct(hydrated));
    }
    catch (error) {
        console.error('UPDATE SCREEN PRODUCT ERROR:', error);
        return res.status(500).json({ error: 'Bildschirm-Produkt konnte nicht gespeichert werden' });
    }
});
router.get('/devices', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const devices = await prisma_1.prisma.screenDevice.findMany({
            where: { tenantId },
            orderBy: [{ name: 'asc' }],
        });
        return res.json(devices);
    }
    catch (error) {
        console.error('GET SCREEN DEVICES ERROR:', error);
        return res.status(500).json({ error: 'Bildschirme konnten nicht geladen werden' });
    }
});
router.post('/devices', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_WRITE), async (req, res) => {
    try {
        const { tenantId, name, deviceCode, location, orientation, resolutionWidth, resolutionHeight, refreshIntervalSec, isActive, showPricesOverride, showAllergensOverride, showUnavailableOverride, offerWindowEnabledOverride, backgroundMediaUrlOverride, accentColorOverride, textColorOverride, notes, } = req.body;
        if (!tenantId || !normalizeText(name)) {
            return res.status(400).json({ error: 'tenantId und name sind erforderlich' });
        }
        const normalizedOrientation = orientation ?? 'LANDSCAPE';
        if (!ORIENTATIONS.has(normalizedOrientation)) {
            return res.status(400).json({ error: 'orientation muss LANDSCAPE oder PORTRAIT sein' });
        }
        const width = resolutionWidth === undefined ? 1920 : Number(resolutionWidth);
        const height = resolutionHeight === undefined ? 1080 : Number(resolutionHeight);
        const refresh = refreshIntervalSec === undefined ? 30 : Number(refreshIntervalSec);
        if (!Number.isInteger(width) || width < 320 || width > 10000) {
            return res.status(400).json({ error: 'resolutionWidth ungueltig (320-10000)' });
        }
        if (!Number.isInteger(height) || height < 240 || height > 10000) {
            return res.status(400).json({ error: 'resolutionHeight ungueltig (240-10000)' });
        }
        if (!Number.isInteger(refresh) || refresh < 5 || refresh > 3600) {
            return res.status(400).json({ error: 'refreshIntervalSec ungueltig (5-3600)' });
        }
        if (accentColorOverride !== undefined &&
            accentColorOverride !== null &&
            !normalizeHexColor(accentColorOverride)) {
            return res.status(400).json({ error: 'accentColorOverride muss #RRGGBB sein' });
        }
        if (textColorOverride !== undefined &&
            textColorOverride !== null &&
            !normalizeHexColor(textColorOverride)) {
            return res.status(400).json({ error: 'textColorOverride muss #RRGGBB sein' });
        }
        const normalizedCode = normalizeText(deviceCode) ?? (await createUniqueDeviceCode());
        const device = await prisma_1.prisma.screenDevice.create({
            data: {
                tenantId,
                name: normalizeText(name) ?? 'Bildschirm',
                deviceCode: normalizedCode.toUpperCase(),
                location: normalizeText(location),
                orientation: normalizedOrientation,
                resolutionWidth: width,
                resolutionHeight: height,
                refreshIntervalSec: refresh,
                isActive: isActive ?? true,
                showPricesOverride: showPricesOverride ?? null,
                showAllergensOverride: showAllergensOverride ?? null,
                showUnavailableOverride: showUnavailableOverride ?? null,
                offerWindowEnabledOverride: offerWindowEnabledOverride ?? null,
                backgroundMediaUrlOverride: normalizeText(backgroundMediaUrlOverride),
                accentColorOverride: normalizeHexColor(accentColorOverride),
                textColorOverride: normalizeHexColor(textColorOverride),
                notes: normalizeText(notes),
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'screen',
            action: 'screen_device_created',
            targetType: 'screen_device',
            targetId: device.id,
            tenantId,
            metadata: {
                name: device.name,
                deviceCode: device.deviceCode,
            },
        });
        return res.status(201).json(device);
    }
    catch (error) {
        console.error('CREATE SCREEN DEVICE ERROR:', error);
        return res.status(500).json({ error: 'Bildschirm konnte nicht erstellt werden' });
    }
});
router.patch('/devices/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { tenantId, name, location, orientation, resolutionWidth, resolutionHeight, refreshIntervalSec, isActive, showPricesOverride, showAllergensOverride, showUnavailableOverride, offerWindowEnabledOverride, backgroundMediaUrlOverride, accentColorOverride, textColorOverride, notes, } = req.body;
        if (!id || !tenantId) {
            return res.status(400).json({ error: 'id und tenantId sind erforderlich' });
        }
        const existing = await prisma_1.prisma.screenDevice.findUnique({
            where: { id },
            select: { id: true, tenantId: true, name: true },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Bildschirm nicht gefunden' });
        }
        if (orientation !== undefined && !ORIENTATIONS.has(orientation)) {
            return res.status(400).json({ error: 'orientation muss LANDSCAPE oder PORTRAIT sein' });
        }
        if (resolutionWidth !== undefined &&
            (!Number.isInteger(Number(resolutionWidth)) || Number(resolutionWidth) < 320 || Number(resolutionWidth) > 10000)) {
            return res.status(400).json({ error: 'resolutionWidth ungueltig (320-10000)' });
        }
        if (resolutionHeight !== undefined &&
            (!Number.isInteger(Number(resolutionHeight)) || Number(resolutionHeight) < 240 || Number(resolutionHeight) > 10000)) {
            return res.status(400).json({ error: 'resolutionHeight ungueltig (240-10000)' });
        }
        if (refreshIntervalSec !== undefined &&
            (!Number.isInteger(Number(refreshIntervalSec)) || Number(refreshIntervalSec) < 5 || Number(refreshIntervalSec) > 3600)) {
            return res.status(400).json({ error: 'refreshIntervalSec ungueltig (5-3600)' });
        }
        if (accentColorOverride !== undefined &&
            accentColorOverride !== null &&
            !normalizeHexColor(accentColorOverride)) {
            return res.status(400).json({ error: 'accentColorOverride muss #RRGGBB sein' });
        }
        if (textColorOverride !== undefined &&
            textColorOverride !== null &&
            !normalizeHexColor(textColorOverride)) {
            return res.status(400).json({ error: 'textColorOverride muss #RRGGBB sein' });
        }
        const updated = await prisma_1.prisma.screenDevice.update({
            where: { id },
            data: {
                name: name === undefined ? undefined : normalizeText(name) ?? undefined,
                location: location === undefined ? undefined : normalizeText(location),
                orientation,
                resolutionWidth: resolutionWidth === undefined ? undefined : Number(resolutionWidth),
                resolutionHeight: resolutionHeight === undefined ? undefined : Number(resolutionHeight),
                refreshIntervalSec: refreshIntervalSec === undefined ? undefined : Number(refreshIntervalSec),
                isActive,
                showPricesOverride: showPricesOverride === undefined ? undefined : showPricesOverride,
                showAllergensOverride: showAllergensOverride === undefined ? undefined : showAllergensOverride,
                showUnavailableOverride: showUnavailableOverride === undefined ? undefined : showUnavailableOverride,
                offerWindowEnabledOverride: offerWindowEnabledOverride === undefined
                    ? undefined
                    : offerWindowEnabledOverride,
                backgroundMediaUrlOverride: backgroundMediaUrlOverride === undefined
                    ? undefined
                    : normalizeText(backgroundMediaUrlOverride),
                accentColorOverride: accentColorOverride === undefined
                    ? undefined
                    : normalizeHexColor(accentColorOverride),
                textColorOverride: textColorOverride === undefined
                    ? undefined
                    : normalizeHexColor(textColorOverride),
                notes: notes === undefined ? undefined : normalizeText(notes),
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'screen',
            action: 'screen_device_updated',
            targetType: 'screen_device',
            targetId: updated.id,
            tenantId,
            metadata: {
                name: updated.name,
                isActive: updated.isActive,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE SCREEN DEVICE ERROR:', error);
        return res.status(500).json({ error: 'Bildschirm konnte nicht aktualisiert werden' });
    }
});
router.delete('/devices/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const tenantId = req.query.tenantId;
        if (!id || !tenantId) {
            return res.status(400).json({ error: 'id und tenantId sind erforderlich' });
        }
        const existing = await prisma_1.prisma.screenDevice.findUnique({
            where: { id },
            select: { id: true, tenantId: true, name: true },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Bildschirm nicht gefunden' });
        }
        await prisma_1.prisma.screenDevice.delete({
            where: { id },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'screen',
            action: 'screen_device_deleted',
            targetType: 'screen_device',
            targetId: existing.id,
            tenantId,
            metadata: {
                name: existing.name,
            },
        });
        return res.json({ ok: true });
    }
    catch (error) {
        console.error('DELETE SCREEN DEVICE ERROR:', error);
        return res.status(500).json({ error: 'Bildschirm konnte nicht geloescht werden' });
    }
});
router.get('/public/devices/:deviceCode/feed', async (req, res) => {
    try {
        const deviceCode = Array.isArray(req.params.deviceCode) ? req.params.deviceCode[0] : req.params.deviceCode;
        if (!deviceCode) {
            return res.status(400).json({ error: 'deviceCode fehlt' });
        }
        const device = await prisma_1.prisma.screenDevice.findUnique({
            where: { deviceCode: deviceCode.toUpperCase() },
        });
        if (!device) {
            return res.status(404).json({ error: 'Bildschirm-Code nicht gefunden' });
        }
        if (!device.isActive) {
            return res.status(403).json({ error: 'Bildschirm ist deaktiviert' });
        }
        const baseConfig = await prisma_1.prisma.screenSetting.upsert({
            where: { tenantId: device.tenantId },
            update: {},
            create: { tenantId: device.tenantId },
        });
        const productsRaw = await prisma_1.prisma.product.findMany({
            where: {
                tenantId: device.tenantId,
            },
            include: {
                category: true,
                screenSetting: true,
                ingredients: {
                    include: {
                        ingredient: {
                            select: {
                                name: true,
                                allergens: true,
                            },
                        },
                    },
                    orderBy: [{ createdAt: 'asc' }],
                },
            },
            orderBy: [{ createdAt: 'desc' }],
        });
        const effectiveConfig = {
            ...baseConfig,
            showPrices: device.showPricesOverride === null
                ? baseConfig.showPrices
                : device.showPricesOverride,
            showAllergens: device.showAllergensOverride === null
                ? baseConfig.showAllergens
                : device.showAllergensOverride,
            showUnavailable: device.showUnavailableOverride === null
                ? baseConfig.showUnavailable
                : device.showUnavailableOverride,
            offerWindowEnabled: device.offerWindowEnabledOverride === null
                ? baseConfig.offerWindowEnabled
                : device.offerWindowEnabledOverride,
            backgroundMediaUrl: device.backgroundMediaUrlOverride ?? baseConfig.backgroundMediaUrl,
            accentColor: device.accentColorOverride ?? baseConfig.accentColor,
            textColor: device.textColorOverride ?? baseConfig.textColor,
        };
        const products = productsRaw
            .map(mapScreenProduct)
            .filter((product) => product.screen.showOnScreen)
            .filter((product) => effectiveConfig.showUnavailable || product.available)
            .sort(sortScreenProducts);
        await prisma_1.prisma.screenDevice.update({
            where: { id: device.id },
            data: { lastSeenAt: new Date() },
        });
        return res.json({
            device: {
                id: device.id,
                name: device.name,
                location: device.location,
                deviceCode: device.deviceCode,
                orientation: device.orientation,
                resolutionWidth: device.resolutionWidth,
                resolutionHeight: device.resolutionHeight,
                refreshIntervalSec: device.refreshIntervalSec,
            },
            config: effectiveConfig,
            products,
            generatedAt: new Date().toISOString(),
        });
    }
    catch (error) {
        console.error('GET PUBLIC SCREEN FEED ERROR:', error);
        return res.status(500).json({ error: 'Bildschirm-Feed konnte nicht geladen werden' });
    }
});
exports.default = router;
