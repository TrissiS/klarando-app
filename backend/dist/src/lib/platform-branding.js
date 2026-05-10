"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.normalizePlatformBrandingSettings = normalizePlatformBrandingSettings;
exports.readPlatformBrandingSettings = readPlatformBrandingSettings;
exports.savePlatformBrandingSettings = savePlatformBrandingSettings;
const fs_1 = require("fs");
const path_1 = __importDefault(require("path"));
const DEFAULT_PLATFORM_BRANDING = {
    iconUrl: '/klarando_icon.png',
    wordmarkUrl: '/klarando_logo_wordmark.png',
    sidebarMode: 'ICON_WORDMARK',
    headerMode: 'ICON_WORDMARK',
    sidebarIconSize: 56,
    sidebarWordmarkHeight: 44,
    headerIconSize: 44,
    headerWordmarkHeight: 36,
};
const PLATFORM_BRANDING_FILE_PATH = path_1.default.resolve(__dirname, '..', '..', '..', 'data', 'platform-branding.json');
function clampInt(value, min, max, fallback) {
    const parsed = Number(value);
    if (!Number.isFinite(parsed)) {
        return fallback;
    }
    return Math.min(max, Math.max(min, Math.round(parsed)));
}
function normalizeMode(value, fallback) {
    const raw = typeof value === 'string' ? value.trim().toUpperCase() : '';
    if (raw === 'ICON_ONLY' || raw === 'WORDMARK_ONLY' || raw === 'ICON_WORDMARK' || raw === 'WORDMARK_ICON') {
        return raw;
    }
    return fallback;
}
function normalizeAssetUrl(value, fallback) {
    if (value === null) {
        return null;
    }
    if (typeof value !== 'string') {
        return fallback;
    }
    const trimmed = value.trim();
    if (!trimmed) {
        return null;
    }
    return trimmed;
}
function normalizePlatformBrandingSettings(input, fallback = DEFAULT_PLATFORM_BRANDING) {
    const source = input && typeof input === 'object' && !Array.isArray(input)
        ? input
        : {};
    return {
        iconUrl: normalizeAssetUrl(source.iconUrl, fallback.iconUrl),
        wordmarkUrl: normalizeAssetUrl(source.wordmarkUrl, fallback.wordmarkUrl),
        sidebarMode: normalizeMode(source.sidebarMode, fallback.sidebarMode),
        headerMode: normalizeMode(source.headerMode, fallback.headerMode),
        sidebarIconSize: clampInt(source.sidebarIconSize, 24, 180, fallback.sidebarIconSize),
        sidebarWordmarkHeight: clampInt(source.sidebarWordmarkHeight, 18, 120, fallback.sidebarWordmarkHeight),
        headerIconSize: clampInt(source.headerIconSize, 20, 140, fallback.headerIconSize),
        headerWordmarkHeight: clampInt(source.headerWordmarkHeight, 16, 110, fallback.headerWordmarkHeight),
    };
}
async function readPlatformBrandingSettings() {
    try {
        const raw = await fs_1.promises.readFile(PLATFORM_BRANDING_FILE_PATH, 'utf8');
        const parsed = JSON.parse(raw);
        return normalizePlatformBrandingSettings(parsed);
    }
    catch {
        return DEFAULT_PLATFORM_BRANDING;
    }
}
async function savePlatformBrandingSettings(input) {
    const current = await readPlatformBrandingSettings();
    const normalized = normalizePlatformBrandingSettings(input, current);
    await fs_1.promises.mkdir(path_1.default.dirname(PLATFORM_BRANDING_FILE_PATH), { recursive: true });
    await fs_1.promises.writeFile(PLATFORM_BRANDING_FILE_PATH, JSON.stringify(normalized, null, 2), 'utf8');
    return normalized;
}
