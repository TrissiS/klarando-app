"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.signOrderDeskDeviceToken = signOrderDeskDeviceToken;
exports.verifyOrderDeskDeviceToken = verifyOrderDeskDeviceToken;
const crypto_1 = __importDefault(require("crypto"));
const BASE_AUTH_SECRET = process.env.JWT_SECRET || process.env.AUTH_SECRET || '';
if (!BASE_AUTH_SECRET && process.env.NODE_ENV === 'production') {
    throw new Error('JWT_SECRET oder AUTH_SECRET muss in Produktion gesetzt sein');
}
const ORDERDESK_DEVICE_SECRET = `${BASE_AUTH_SECRET || 'dev-auth-secret-change-me'}:orderdesk-device`;
function toBase64Url(value) {
    return Buffer.from(value).toString('base64url');
}
function fromBase64Url(value) {
    return Buffer.from(value, 'base64url').toString('utf8');
}
function signPart(headerPart, payloadPart) {
    return crypto_1.default
        .createHmac('sha256', ORDERDESK_DEVICE_SECRET)
        .update(`${headerPart}.${payloadPart}`)
        .digest('base64url');
}
function signOrderDeskDeviceToken(input) {
    const now = Math.floor(Date.now() / 1000);
    const expiresAtSeconds = Math.max(now + 60, Math.floor(input.expiresAtMs / 1000));
    const payload = {
        sid: input.sid,
        tenantId: input.tenantId,
        displayCode: input.displayCode,
        bindingId: input.bindingId,
        deviceSerial: input.deviceSerial,
        deviceAlias: input.deviceAlias,
        kind: input.kind,
        iat: now,
        exp: expiresAtSeconds,
    };
    const headerPart = toBase64Url(JSON.stringify({ alg: 'HS256', typ: 'JWT' }));
    const payloadPart = toBase64Url(JSON.stringify(payload));
    const signature = signPart(headerPart, payloadPart);
    return `${headerPart}.${payloadPart}.${signature}`;
}
function verifyOrderDeskDeviceToken(token) {
    const [headerPart, payloadPart, signature] = token.split('.');
    if (!headerPart || !payloadPart || !signature) {
        return null;
    }
    const expected = signPart(headerPart, payloadPart);
    if (expected.length !== signature.length) {
        return null;
    }
    if (!crypto_1.default.timingSafeEqual(Buffer.from(expected), Buffer.from(signature))) {
        return null;
    }
    try {
        const payload = JSON.parse(fromBase64Url(payloadPart));
        const now = Math.floor(Date.now() / 1000);
        if (payload.exp <= now) {
            return null;
        }
        if (!payload.sid || !payload.tenantId || !payload.displayCode) {
            return null;
        }
        if (payload.kind !== 'PAIRING' && payload.kind !== 'SESSION') {
            return null;
        }
        return payload;
    }
    catch {
        return null;
    }
}
