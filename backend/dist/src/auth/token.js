"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.signAuthToken = signAuthToken;
exports.verifyAuthToken = verifyAuthToken;
const crypto_1 = __importDefault(require("crypto"));
const RESOLVED_AUTH_SECRET = process.env.JWT_SECRET || process.env.AUTH_SECRET || '';
if (!RESOLVED_AUTH_SECRET && process.env.NODE_ENV === 'production') {
    throw new Error('JWT_SECRET oder AUTH_SECRET muss in Produktion gesetzt sein');
}
const AUTH_SECRET = RESOLVED_AUTH_SECRET || 'dev-auth-secret-change-me';
const TOKEN_TTL_SECONDS = Number(process.env.AUTH_TOKEN_TTL_SECONDS || 60 * 60 * 12);
function toBase64Url(value) {
    return Buffer.from(value).toString('base64url');
}
function fromBase64Url(value) {
    return Buffer.from(value, 'base64url').toString('utf8');
}
function signPart(headerPart, payloadPart) {
    return crypto_1.default
        .createHmac('sha256', AUTH_SECRET)
        .update(`${headerPart}.${payloadPart}`)
        .digest('base64url');
}
function signAuthToken(input) {
    const now = Math.floor(Date.now() / 1000);
    const payload = {
        ...input,
        iat: now,
        exp: now + TOKEN_TTL_SECONDS,
    };
    const headerPart = toBase64Url(JSON.stringify({ alg: 'HS256', typ: 'JWT' }));
    const payloadPart = toBase64Url(JSON.stringify(payload));
    const signature = signPart(headerPart, payloadPart);
    return `${headerPart}.${payloadPart}.${signature}`;
}
function verifyAuthToken(token) {
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
        if (payload.exp <= Math.floor(Date.now() / 1000)) {
            return null;
        }
        return payload;
    }
    catch {
        return null;
    }
}
