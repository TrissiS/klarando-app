"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const promises_1 = require("fs/promises");
const path_1 = __importDefault(require("path"));
const router = (0, express_1.Router)();
const DEFAULT_MANIFEST = {
    channel: 'stable',
    packageName: 'com.example.klarando.app',
    latestVersionName: '1.0.0',
    latestVersionCode: 1,
    minSupportedVersionCode: 1,
    mandatoryFromVersionCode: 0,
    apkUrl: '',
    apkSha256: null,
    notes: 'Initiale Version',
    publishedAt: new Date().toISOString(),
};
const APP_CONFIG = {
    cashier: {
        fileName: 'cashier-stable.json',
        packageName: 'com.klarando.orderdesk',
    },
    driver: {
        fileName: 'driver-stable.json',
        packageName: 'com.klarando.driver',
    },
    customer: {
        fileName: 'customer-stable.json',
        packageName: 'com.klarando.customer',
    },
};
function normalizeAppKey(value) {
    const normalized = value.trim().toLowerCase();
    if (normalized === 'cashier' || normalized === 'driver' || normalized === 'customer') {
        return normalized;
    }
    return null;
}
function normalizeManifest(value, options) {
    if (!value || typeof value !== 'object' || Array.isArray(value)) {
        return {
            ...DEFAULT_MANIFEST,
            packageName: options.defaultPackageName,
        };
    }
    const source = value;
    const toNumber = (entry, fallback) => {
        const parsed = Number(entry);
        return Number.isFinite(parsed) ? Math.max(0, Math.trunc(parsed)) : fallback;
    };
    const toText = (entry, fallback) => typeof entry === 'string' && entry.trim().length > 0 ? entry.trim() : fallback;
    const fallbackManifest = {
        ...DEFAULT_MANIFEST,
        packageName: options.defaultPackageName,
    };
    return {
        channel: toText(source.channel, fallbackManifest.channel),
        packageName: toText(source.packageName, fallbackManifest.packageName),
        latestVersionName: toText(source.latestVersionName, fallbackManifest.latestVersionName),
        latestVersionCode: toNumber(source.latestVersionCode, fallbackManifest.latestVersionCode),
        minSupportedVersionCode: toNumber(source.minSupportedVersionCode, fallbackManifest.minSupportedVersionCode),
        mandatoryFromVersionCode: toNumber(source.mandatoryFromVersionCode, fallbackManifest.mandatoryFromVersionCode),
        apkUrl: typeof source.apkUrl === 'string' ? source.apkUrl.trim() : '',
        apkSha256: typeof source.apkSha256 === 'string' && source.apkSha256.trim().length > 0
            ? source.apkSha256.trim()
            : null,
        notes: typeof source.notes === 'string' ? source.notes.trim() : '',
        publishedAt: toText(source.publishedAt, new Date().toISOString()),
    };
}
async function loadManifest(appKey) {
    const appConfig = APP_CONFIG[appKey];
    const filePath = path_1.default.resolve(process.cwd(), 'mobile-updates', appConfig.fileName);
    try {
        const raw = await (0, promises_1.readFile)(filePath, 'utf8');
        const parsed = JSON.parse(raw);
        return normalizeManifest(parsed, { defaultPackageName: appConfig.packageName });
    }
    catch (error) {
        console.warn(`MOBILE UPDATE MANIFEST READ FAILED for ${appKey}, using defaults:`, error);
        return {
            ...DEFAULT_MANIFEST,
            packageName: appConfig.packageName,
        };
    }
}
router.get('/:appKey', async (req, res) => {
    const appKey = normalizeAppKey(req.params.appKey ?? '');
    if (!appKey) {
        return res.status(404).json({
            ok: false,
            message: 'Unbekannter App-Kanal. Erlaubt: cashier, driver, customer.',
        });
    }
    const manifest = await loadManifest(appKey);
    return res.json({
        ok: true,
        appKey,
        ...manifest,
    });
});
exports.default = router;
