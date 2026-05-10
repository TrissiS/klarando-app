"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DISPLAY_BACKGROUND_MEDIA_MODES = exports.DISPLAY_AGE_ALERT_ANIMATION_MODES = exports.DISPLAY_STATUS_ANIMATION_MODES = exports.DISPLAY_SORT_MODES = exports.DISPLAY_STATUS_VALUES = void 0;
exports.normalizeText = normalizeText;
exports.clampRefreshInterval = clampRefreshInterval;
exports.clampAnnouncementDuration = clampAnnouncementDuration;
exports.clampDoneAutoHide = clampDoneAutoHide;
exports.clampAnimationDuration = clampAnimationDuration;
exports.clampOrderAgeFontSize = clampOrderAgeFontSize;
exports.clampOrderAgeAlertThreshold = clampOrderAgeAlertThreshold;
exports.normalizeColorHex = normalizeColorHex;
exports.normalizeIdList = normalizeIdList;
exports.serializeIdList = serializeIdList;
exports.parseStoredIdList = parseStoredIdList;
exports.mapDisplayOutput = mapDisplayOutput;
exports.feedStatusesForDisplay = feedStatusesForDisplay;
exports.roleOrderField = roleOrderField;
exports.createUniqueDisplayCode = createUniqueDisplayCode;
const prisma_1 = require("./prisma");
exports.DISPLAY_STATUS_VALUES = new Set([
    'pending_payment',
    'open',
    'preparing',
    'out_for_delivery',
    'done',
    'archived',
]);
exports.DISPLAY_SORT_MODES = new Set([
    'PRIORITY_OLDEST',
    'PRIORITY_NEWEST',
    'DONE_FIRST_OPEN_LAST',
]);
exports.DISPLAY_STATUS_ANIMATION_MODES = new Set(['NONE', 'BLINK', 'PULSE', 'GLOW']);
exports.DISPLAY_AGE_ALERT_ANIMATION_MODES = new Set(['NONE', 'BLINK', 'PULSE']);
exports.DISPLAY_BACKGROUND_MEDIA_MODES = new Set(['NONE', 'IMAGE', 'VIDEO']);
function normalizeText(input) {
    if (input === undefined) {
        return undefined;
    }
    if (input === null) {
        return null;
    }
    const trimmed = input.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function clampRefreshInterval(value) {
    if (value === undefined || !Number.isFinite(value)) {
        return undefined;
    }
    return Math.min(120, Math.max(3, Math.trunc(value)));
}
function clampAnnouncementDuration(value) {
    if (value === undefined || !Number.isFinite(value)) {
        return undefined;
    }
    return Math.min(600, Math.max(10, Math.trunc(value)));
}
function clampDoneAutoHide(value) {
    if (value === undefined || !Number.isFinite(value)) {
        return undefined;
    }
    return Math.min(3600, Math.max(0, Math.trunc(value)));
}
function clampAnimationDuration(value) {
    if (value === undefined || !Number.isFinite(value)) {
        return undefined;
    }
    return Math.min(12000, Math.max(500, Math.trunc(value)));
}
function clampOrderAgeFontSize(value) {
    if (value === undefined || !Number.isFinite(value)) {
        return undefined;
    }
    return Math.min(72, Math.max(12, Math.trunc(value)));
}
function clampOrderAgeAlertThreshold(value) {
    if (value === undefined || !Number.isFinite(value)) {
        return undefined;
    }
    return Math.min(7200, Math.max(0, Math.trunc(value)));
}
function normalizeColorHex(input) {
    if (input === undefined) {
        return undefined;
    }
    if (input === null) {
        return null;
    }
    const trimmed = input.trim();
    if (!/^#[0-9A-Fa-f]{6}$/.test(trimmed)) {
        return null;
    }
    return trimmed.toLowerCase();
}
function normalizeIdList(input) {
    if (input === undefined || input === null) {
        return [];
    }
    const rawItems = Array.isArray(input) ? input : input.split(',');
    return Array.from(new Set(rawItems.map((entry) => entry.trim()).filter((entry) => entry.length > 0)));
}
function serializeIdList(ids) {
    return ids.length > 0 ? ids.join(',') : null;
}
function parseStoredIdList(value) {
    return normalizeIdList(value || null);
}
function mapDisplayOutput(display) {
    return {
        ...display,
        role: display.displayRole,
        sourceTerminalIds: parseStoredIdList(display.sourceTerminalIds),
    };
}
function feedStatusesForDisplay(display) {
    if (display.displayRole === 'CASH') {
        return ['pending_payment', 'open', 'preparing', 'out_for_delivery', 'done'];
    }
    if (display.displayRole === 'PICKUP') {
        const statuses = [];
        if (display.pickupShowOpen) {
            statuses.push('open');
        }
        if (display.pickupShowPreparing) {
            statuses.push('preparing');
        }
        if (display.pickupShowDone) {
            statuses.push('done');
        }
        return statuses.length > 0 ? statuses : ['done'];
    }
    return ['open', 'preparing'];
}
function roleOrderField(role) {
    if (role === 'CASH') {
        return 'cashDisplayId';
    }
    if (role === 'PICKUP') {
        return 'pickupDisplayId';
    }
    return 'kitchenDisplayId';
}
function generateDisplayCode() {
    const alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    let output = 'OD-';
    for (let index = 0; index < 8; index += 1) {
        output += alphabet[Math.floor(Math.random() * alphabet.length)];
    }
    return output;
}
async function createUniqueDisplayCode() {
    for (let attempt = 0; attempt < 10; attempt += 1) {
        const code = generateDisplayCode();
        const existing = await prisma_1.prisma.orderDisplay.findUnique({
            where: { displayCode: code },
            select: { id: true },
        });
        if (!existing) {
            return code;
        }
    }
    return `${generateDisplayCode()}${Date.now().toString().slice(-2)}`;
}
