"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const fs_1 = require("fs");
const promises_1 = require("fs/promises");
const path_1 = __importDefault(require("path"));
const router = (0, express_1.Router)();
const APP_CONFIG = {
    customer: {
        fileName: 'customer-stable.json',
        packageName: 'com.klarando.customer',
        aliases: ['customer'],
    },
    driver: {
        fileName: 'driver-stable.json',
        packageName: 'com.klarando.driver',
        aliases: ['driver'],
    },
    orderdesk: {
        fileName: 'orderdesk-stable.json',
        packageName: 'com.klarando.orderdesk',
        aliases: ['orderdesk', 'cashier'],
    },
};
const DEFAULT_MANIFEST = {
    platform: 'android',
    latestVersion: '1.0.0',
    minRequiredVersion: '1.0.0',
    buildNumber: 1,
    apkUrl: '',
    sha256: null,
    releaseNotes: 'Initiale Version',
    forceUpdate: false,
    publishedAt: new Date().toISOString(),
    enabled: false,
    status: 'enabled',
};
function resolveManifestDirectory() {
    const backendLocal = path_1.default.resolve(process.cwd(), 'mobile-updates');
    const repoLocal = path_1.default.resolve(process.cwd(), 'backend', 'mobile-updates');
    return {
        backendLocal,
        repoLocal,
    };
}
async function resolveManifestFilePath(fileName) {
    const dirs = resolveManifestDirectory();
    const backendPath = path_1.default.resolve(dirs.backendLocal, fileName);
    try {
        await (0, promises_1.access)(backendPath);
        return backendPath;
    }
    catch {
        return path_1.default.resolve(dirs.repoLocal, fileName);
    }
}
function normalizeAppKey(raw) {
    const normalized = raw.trim().toLowerCase();
    for (const [appKey, config] of Object.entries(APP_CONFIG)) {
        if (config.aliases.includes(normalized)) {
            return appKey;
        }
    }
    return null;
}
function parseVersion(value) {
    if (!value) {
        return [0, 0, 0];
    }
    const core = value.trim().split('-')[0].split('+')[0];
    const parts = core.split('.').map((entry) => Number(entry));
    return [parts[0] || 0, parts[1] || 0, parts[2] || 0];
}
function compareVersions(left, right) {
    const l = parseVersion(left);
    const r = parseVersion(right);
    for (let index = 0; index < 3; index += 1) {
        if (l[index] > r[index]) {
            return 1;
        }
        if (l[index] < r[index]) {
            return -1;
        }
    }
    return 0;
}
function toNumber(value, fallback) {
    const parsed = Number(value);
    return Number.isFinite(parsed) ? Math.max(0, Math.trunc(parsed)) : fallback;
}
function toText(value, fallback) {
    if (typeof value !== 'string') {
        return fallback;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : fallback;
}
function toNullableText(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function toBool(value, fallback) {
    if (typeof value === 'boolean') {
        return value;
    }
    if (typeof value === 'string') {
        const normalized = value.trim().toLowerCase();
        if (normalized === 'true') {
            return true;
        }
        if (normalized === 'false') {
            return false;
        }
    }
    return fallback;
}
function normalizeManifest(value, appKey) {
    const base = {
        appKey,
        ...DEFAULT_MANIFEST,
    };
    if (!value || typeof value !== 'object' || Array.isArray(value)) {
        return base;
    }
    const source = value;
    const latestVersion = toText(source.latestVersion ?? source.latestVersionName, base.latestVersion);
    const minRequiredVersion = toText(source.minRequiredVersion, source.minSupportedVersionName ?? latestVersion);
    const buildNumber = toNumber(source.buildNumber ?? source.latestVersionCode, base.buildNumber);
    const forceUpdate = toBool(source.forceUpdate, toNumber(source.mandatoryFromVersionCode, 0) > 0);
    return {
        appKey,
        platform: 'android',
        latestVersion,
        minRequiredVersion,
        buildNumber,
        apkUrl: toText(source.apkUrl, ''),
        sha256: toNullableText(source.sha256 ?? source.apkSha256),
        releaseNotes: toText(source.releaseNotes ?? source.notes, base.releaseNotes),
        forceUpdate,
        publishedAt: toText(source.publishedAt, new Date().toISOString()),
        enabled: toBool(source.enabled, base.enabled),
        status: toBool(source.enabled, base.enabled) ? 'enabled' : 'disabled',
    };
}
async function loadManifest(appKey) {
    const appConfig = APP_CONFIG[appKey];
    const primaryPath = await resolveManifestFilePath(appConfig.fileName);
    try {
        const raw = await (0, promises_1.readFile)(primaryPath, 'utf8');
        const parsed = JSON.parse(raw);
        return normalizeManifest(parsed, appKey);
    }
    catch (error) {
        if (appKey === 'orderdesk') {
            const legacyPath = await resolveManifestFilePath('cashier-stable.json');
            try {
                const rawLegacy = await (0, promises_1.readFile)(legacyPath, 'utf8');
                const parsedLegacy = JSON.parse(rawLegacy);
                return normalizeManifest(parsedLegacy, appKey);
            }
            catch (legacyError) {
                console.warn('ORDERDESK MANIFEST READ FAILED, using defaults:', legacyError);
            }
        }
        console.warn(`MOBILE UPDATE MANIFEST READ FAILED for ${appKey}, using defaults:`, error);
        return normalizeManifest({}, appKey);
    }
}
function buildApkUrl(req, appKey) {
    return `${req.protocol}://${req.get('host')}/api/mobile-updates/${appKey}/apk`;
}
function buildManifestResponse(manifest, options) {
    const isEnabled = manifest.enabled && manifest.status === 'enabled';
    const currentBuild = options.currentBuildNumber ?? 0;
    const versionCompare = options.currentVersion
        ? compareVersions(manifest.latestVersion, options.currentVersion)
        : 0;
    const hasBuildUpdate = currentBuild > 0 && manifest.buildNumber > currentBuild;
    const hasVersionUpdate = options.currentVersion ? versionCompare > 0 : false;
    return {
        ok: true,
        appKey: manifest.appKey,
        platform: manifest.platform,
        latestVersion: manifest.latestVersion,
        minRequiredVersion: manifest.minRequiredVersion,
        buildNumber: manifest.buildNumber,
        apkUrl: manifest.apkUrl,
        sha256: manifest.sha256,
        releaseNotes: manifest.releaseNotes,
        forceUpdate: Boolean(isEnabled && manifest.forceUpdate),
        publishedAt: manifest.publishedAt,
        enabled: isEnabled,
        updateAvailable: Boolean(isEnabled && (hasBuildUpdate || hasVersionUpdate)),
    };
}
router.get('/:appKey', async (req, res) => {
    const appKey = normalizeAppKey(req.params.appKey ?? '');
    if (!appKey) {
        return res.status(404).json({
            ok: false,
            code: 'UNKNOWN_APP_KEY',
            message: 'Unbekannter App-Key. Erlaubt: customer, driver, orderdesk.',
        });
    }
    const currentVersion = typeof req.query.currentVersion === 'string' ? req.query.currentVersion.trim() : null;
    const currentBuildNumber = typeof req.query.buildNumber === 'string'
        ? toNumber(req.query.buildNumber, 0)
        : null;
    const manifest = await loadManifest(appKey);
    const apkUrl = manifest.apkUrl.trim().length > 0 ? manifest.apkUrl.trim() : buildApkUrl(req, appKey);
    const response = buildManifestResponse({ ...manifest, apkUrl }, { currentVersion, currentBuildNumber });
    return res.json(response);
});
router.get('/:appKey/apk', async (req, res) => {
    const appKey = normalizeAppKey(req.params.appKey ?? '');
    if (!appKey) {
        return res.status(404).json({
            ok: false,
            code: 'UNKNOWN_APP_KEY',
            message: 'Unbekannter App-Key.',
        });
    }
    const manifest = await loadManifest(appKey);
    if (!manifest.enabled) {
        return res.status(404).json({
            ok: false,
            code: 'APK_DISABLED',
            message: 'APK-Download ist für diese App aktuell deaktiviert.',
        });
    }
    const dirs = resolveManifestDirectory();
    const backendPath = path_1.default.resolve(dirs.backendLocal, 'apks', appKey, 'latest.apk');
    const repoPath = path_1.default.resolve(dirs.repoLocal, 'apks', appKey, 'latest.apk');
    let filePath = backendPath;
    try {
        await (0, promises_1.access)(backendPath);
    }
    catch {
        filePath = repoPath;
    }
    try {
        await (0, promises_1.access)(filePath);
    }
    catch {
        return res.status(404).json({
            ok: false,
            code: 'APK_NOT_FOUND',
            message: 'Für diese App ist derzeit keine APK hinterlegt.',
        });
    }
    res.setHeader('Content-Type', 'application/vnd.android.package-archive');
    res.setHeader('Content-Disposition', `attachment; filename="klarando-${appKey}-latest.apk"`);
    res.setHeader('X-Klarando-App-Key', appKey);
    const stream = (0, fs_1.createReadStream)(filePath);
    stream.on('error', () => {
        if (!res.headersSent) {
            res.status(500).json({
                ok: false,
                code: 'APK_STREAM_ERROR',
                message: 'APK-Datei konnte nicht ausgeliefert werden.',
            });
        }
    });
    stream.pipe(res);
});
exports.default = router;
