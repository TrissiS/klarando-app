"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.rateLimitOrderDeskPairing = exports.rateLimitDisplayPairing = exports.rateLimitDriverDeviceLogin = exports.rateLimitPublicOrderCreate = exports.rateLimitTokenRefresh = exports.rateLimitPasswordReset = exports.rateLimitRegistration = exports.rateLimitAuthLogin = void 0;
exports.createRateLimit = createRateLimit;
const buckets = new Map();
function getDefaultClientKey(req) {
    const ip = req.ip || req.socket.remoteAddress || 'unknown';
    return ip;
}
function normalizeOptionalText(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim().toLowerCase();
    return trimmed.length > 0 ? trimmed : null;
}
function createRateLimit(options) {
    return (req, res, next) => {
        const now = Date.now();
        const keyPart = options.keyGenerator?.(req) ?? getDefaultClientKey(req);
        const key = `${options.name}:${keyPart}`;
        const bucket = buckets.get(key) ?? { hits: [] };
        bucket.hits = bucket.hits.filter((entry) => entry > now - options.windowMs);
        if (bucket.hits.length >= options.max) {
            const oldestHit = bucket.hits[0] ?? now;
            const retryAfterMs = Math.max(0, options.windowMs - (now - oldestHit));
            const retryAfterSeconds = Math.max(1, Math.ceil(retryAfterMs / 1000));
            res.setHeader('Retry-After', String(retryAfterSeconds));
            return res.status(429).json({
                error: options.message ?? 'Zu viele Anfragen. Bitte spaeter erneut versuchen.',
                retryAfterSeconds,
            });
        }
        bucket.hits.push(now);
        buckets.set(key, bucket);
        return next();
    };
}
exports.rateLimitAuthLogin = createRateLimit({
    name: 'auth-login',
    windowMs: 15 * 60 * 1000,
    max: 12,
    message: 'Zu viele Login-Versuche. Bitte spaeter erneut versuchen.',
    keyGenerator: (req) => `${getDefaultClientKey(req)}:${normalizeOptionalText(req.body?.email) ?? 'unknown'}`,
});
exports.rateLimitRegistration = createRateLimit({
    name: 'app-register',
    windowMs: 60 * 60 * 1000,
    max: 8,
    message: 'Zu viele Registrierungsversuche. Bitte spaeter erneut versuchen.',
    keyGenerator: (req) => `${getDefaultClientKey(req)}:${normalizeOptionalText(req.body?.email) ?? 'unknown'}`,
});
exports.rateLimitPasswordReset = createRateLimit({
    name: 'password-reset',
    windowMs: 60 * 60 * 1000,
    max: 6,
    message: 'Zu viele Passwort-Reset-Anfragen. Bitte spaeter erneut versuchen.',
    keyGenerator: (req) => `${getDefaultClientKey(req)}:${normalizeOptionalText(req.body?.email) ?? 'unknown'}`,
});
exports.rateLimitTokenRefresh = createRateLimit({
    name: 'token-refresh',
    windowMs: 10 * 60 * 1000,
    max: 30,
    message: 'Zu viele Token-Refresh-Anfragen. Bitte spaeter erneut versuchen.',
});
exports.rateLimitPublicOrderCreate = createRateLimit({
    name: 'public-order-create',
    windowMs: 5 * 60 * 1000,
    max: 25,
    message: 'Zu viele Bestellanfragen. Bitte kurz warten und erneut versuchen.',
});
exports.rateLimitDriverDeviceLogin = createRateLimit({
    name: 'driver-device-login',
    windowMs: 15 * 60 * 1000,
    max: 15,
    message: 'Zu viele Fahrergeraet-Login-Versuche. Bitte spaeter erneut versuchen.',
});
exports.rateLimitDisplayPairing = createRateLimit({
    name: 'display-pairing',
    windowMs: 10 * 60 * 1000,
    max: 20,
    message: 'Zu viele Pairing-Anfragen. Bitte spaeter erneut versuchen.',
});
exports.rateLimitOrderDeskPairing = createRateLimit({
    name: 'orderdesk-pairing',
    windowMs: 10 * 60 * 1000,
    max: 20,
    message: 'Zu viele OrderDesk-Pairing-Anfragen. Bitte spaeter erneut versuchen.',
});
