"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const node_crypto_1 = require("node:crypto");
const prisma_1 = require("../lib/prisma");
const password_1 = require("../auth/password");
const app_token_1 = require("../auth/app-token");
const audit_1 = require("../lib/audit");
const rate_limit_1 = require("../middleware/rate-limit");
const router = (0, express_1.Router)();
const SOCIAL_PROVIDERS = ['GOOGLE', 'FACEBOOK', 'APPLE'];
function normalizeText(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function normalizeEmail(value) {
    const text = normalizeText(value);
    if (!text) {
        return null;
    }
    return text.toLowerCase();
}
function isValidEmail(value) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
}
function isValidZipCode(value) {
    if (!value) {
        return true;
    }
    return /^\d{5}$/.test(value.replace(/[^\d]/g, ''));
}
function parseBoolean(value) {
    if (typeof value === 'boolean') {
        return value;
    }
    if (typeof value === 'string') {
        const normalized = value.trim().toLowerCase();
        return normalized === 'true' || normalized === '1' || normalized === 'yes';
    }
    return false;
}
function parseSocialProvider(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const normalized = value.trim().toUpperCase();
    if (SOCIAL_PROVIDERS.includes(normalized)) {
        return normalized;
    }
    return null;
}
function createRandomSecret() {
    return `${(0, node_crypto_1.randomBytes)(24).toString('hex')}!Kla1`;
}
function mapAppCustomerUser(account) {
    return {
        id: account.id,
        email: account.email,
        fullName: account.fullName,
        phone: account.phone,
        street: account.street,
        zipCode: account.zipCode,
        city: account.city,
        marketingOptIn: account.marketingOptIn,
        deletionRequestedAt: account.deletionRequestedAt,
    };
}
function normalizeZipCode(value) {
    const text = normalizeText(value);
    if (!text) {
        return null;
    }
    const digits = text.replace(/[^\d]/g, '');
    return digits.length > 0 ? digits.slice(0, 5) : null;
}
function readBearerToken(raw) {
    if (!raw || !raw.toLowerCase().startsWith('bearer ')) {
        return null;
    }
    return raw.slice(7).trim();
}
async function resolveAccountFromRequest(authorizationHeader) {
    const token = readBearerToken(authorizationHeader);
    if (!token) {
        return null;
    }
    const payload = (0, app_token_1.verifyAppAuthToken)(token);
    if (!payload) {
        return null;
    }
    const account = await prisma_1.prisma.appCustomerAccount.findUnique({
        where: {
            id: payload.sub,
        },
    });
    if (!account || !account.isActive || account.email !== payload.email) {
        return null;
    }
    return account;
}
router.post('/register', rate_limit_1.rateLimitRegistration, async (req, res) => {
    try {
        const email = normalizeEmail(req.body.email);
        const fullName = normalizeText(req.body.fullName);
        const passwordRaw = normalizeText(req.body.password);
        const phone = normalizeText(req.body.phone);
        const street = normalizeText(req.body.street);
        const zipCode = normalizeZipCode(req.body.zipCode);
        const city = normalizeText(req.body.city);
        const marketingOptIn = Boolean(req.body.marketingOptIn);
        const privacyAccepted = parseBoolean(req.body.privacyAccepted);
        const termsAccepted = parseBoolean(req.body.termsAccepted);
        if (!email || !fullName || !passwordRaw) {
            return res.status(400).json({ error: 'email, fullName und password sind erforderlich' });
        }
        if (!isValidEmail(email)) {
            return res.status(400).json({ error: 'E-Mail ist ungueltig' });
        }
        if (passwordRaw.length < 8) {
            return res.status(400).json({ error: 'Passwort muss mindestens 8 Zeichen haben' });
        }
        if (!isValidZipCode(zipCode)) {
            return res.status(400).json({ error: 'PLZ ist ungueltig' });
        }
        if (!privacyAccepted) {
            return res.status(400).json({ error: 'Datenschutz muss akzeptiert werden' });
        }
        if (!termsAccepted) {
            return res.status(400).json({ error: 'AGB muessen akzeptiert werden' });
        }
        const existing = await prisma_1.prisma.appCustomerAccount.findUnique({
            where: { email },
            select: { id: true },
        });
        if (existing) {
            return res.status(409).json({ error: 'Fuer diese E-Mail existiert bereits ein Konto' });
        }
        const created = await prisma_1.prisma.appCustomerAccount.create({
            data: {
                email,
                fullName,
                passwordHash: (0, password_1.hashPassword)(passwordRaw),
                phone,
                street,
                zipCode,
                city,
                marketingOptIn,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'app-auth',
            action: 'app_customer_registered',
            targetType: 'appCustomerAccount',
            targetId: created.id,
            metadata: {
                email: created.email,
                privacyAccepted,
                termsAccepted,
            },
        });
        const token = (0, app_token_1.signAppAuthToken)({
            sub: created.id,
            email: created.email,
        });
        return res.status(201).json({
            token,
            user: mapAppCustomerUser(created),
        });
    }
    catch (error) {
        console.error('APP AUTH REGISTER ERROR:', error);
        return res.status(500).json({ error: 'Registrierung konnte nicht abgeschlossen werden' });
    }
});
router.post('/login', rate_limit_1.rateLimitAuthLogin, async (req, res) => {
    try {
        const email = normalizeEmail(req.body.email);
        const passwordRaw = normalizeText(req.body.password);
        if (!email || !passwordRaw) {
            return res.status(400).json({ error: 'email und password fehlen' });
        }
        const account = await prisma_1.prisma.appCustomerAccount.findUnique({
            where: { email },
        });
        if (!account || !account.isActive || !(0, password_1.verifyPassword)(passwordRaw, account.passwordHash)) {
            return res.status(401).json({ error: 'Login fehlgeschlagen' });
        }
        const updated = await prisma_1.prisma.appCustomerAccount.update({
            where: { id: account.id },
            data: {
                lastLoginAt: new Date(),
                passwordHash: (0, password_1.needsPasswordRehash)(account.passwordHash)
                    ? (0, password_1.hashPassword)(passwordRaw)
                    : account.passwordHash,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'app-auth',
            action: 'app_customer_login_success',
            targetType: 'appCustomerAccount',
            targetId: updated.id,
            metadata: {
                email: updated.email,
            },
        });
        const token = (0, app_token_1.signAppAuthToken)({
            sub: updated.id,
            email: updated.email,
        });
        return res.json({
            token,
            user: mapAppCustomerUser(updated),
        });
    }
    catch (error) {
        console.error('APP AUTH LOGIN ERROR:', error);
        return res.status(500).json({ error: 'Login konnte nicht verarbeitet werden' });
    }
});
router.post('/social-quickstart', rate_limit_1.rateLimitRegistration, async (req, res) => {
    try {
        const provider = parseSocialProvider(req.body.provider);
        const email = normalizeEmail(req.body.email);
        const fullName = normalizeText(req.body.fullName);
        const phone = normalizeText(req.body.phone);
        const street = normalizeText(req.body.street);
        const zipCode = normalizeZipCode(req.body.zipCode);
        const city = normalizeText(req.body.city);
        const marketingOptIn = parseBoolean(req.body.marketingOptIn);
        const privacyAccepted = parseBoolean(req.body.privacyAccepted);
        const termsAccepted = parseBoolean(req.body.termsAccepted);
        if (!provider) {
            return res
                .status(400)
                .json({ error: 'provider muss GOOGLE, FACEBOOK oder APPLE sein' });
        }
        if (!email || !isValidEmail(email)) {
            return res.status(400).json({ error: 'E-Mail ist ungueltig' });
        }
        if (!fullName) {
            return res.status(400).json({ error: 'fullName ist erforderlich' });
        }
        if (!isValidZipCode(zipCode)) {
            return res.status(400).json({ error: 'PLZ ist ungueltig' });
        }
        if (!privacyAccepted || !termsAccepted) {
            return res
                .status(400)
                .json({ error: 'Datenschutz und AGB muessen fuer Schnellkonto akzeptiert werden' });
        }
        const existing = await prisma_1.prisma.appCustomerAccount.findUnique({
            where: { email },
        });
        const account = existing
            ? await prisma_1.prisma.appCustomerAccount.update({
                where: { id: existing.id },
                data: {
                    fullName: fullName || existing.fullName,
                    phone: phone ?? existing.phone,
                    street: street ?? existing.street,
                    zipCode: zipCode ?? existing.zipCode,
                    city: city ?? existing.city,
                    marketingOptIn,
                    lastLoginAt: new Date(),
                },
            })
            : await prisma_1.prisma.appCustomerAccount.create({
                data: {
                    email,
                    fullName,
                    passwordHash: (0, password_1.hashPassword)(createRandomSecret()),
                    phone,
                    street,
                    zipCode,
                    city,
                    marketingOptIn,
                    isActive: true,
                    lastLoginAt: new Date(),
                },
            });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'app-auth',
            action: existing ? 'app_customer_social_login' : 'app_customer_social_registered',
            targetType: 'appCustomerAccount',
            targetId: account.id,
            metadata: {
                email: account.email,
                provider,
                privacyAccepted,
                termsAccepted,
            },
        });
        const token = (0, app_token_1.signAppAuthToken)({
            sub: account.id,
            email: account.email,
        });
        return res.status(existing ? 200 : 201).json({
            token,
            user: mapAppCustomerUser(account),
            provider,
        });
    }
    catch (error) {
        console.error('APP AUTH SOCIAL QUICKSTART ERROR:', error);
        return res.status(500).json({ error: 'Schnellkonto konnte nicht verarbeitet werden' });
    }
});
router.get('/me', async (req, res) => {
    try {
        const account = await resolveAccountFromRequest(req.header('authorization') || undefined);
        if (!account) {
            return res.status(401).json({ error: 'Nicht eingeloggt' });
        }
        return res.json({
            user: mapAppCustomerUser(account),
        });
    }
    catch (error) {
        console.error('APP AUTH ME ERROR:', error);
        return res.status(500).json({ error: 'Konto konnte nicht geladen werden' });
    }
});
router.patch('/me', async (req, res) => {
    try {
        const account = await resolveAccountFromRequest(req.header('authorization') || undefined);
        if (!account) {
            return res.status(401).json({ error: 'Nicht eingeloggt' });
        }
        const fullName = normalizeText(req.body.fullName);
        const phone = normalizeText(req.body.phone);
        const street = normalizeText(req.body.street);
        const zipCode = normalizeZipCode(req.body.zipCode);
        const city = normalizeText(req.body.city);
        const marketingOptIn = parseBoolean(req.body.marketingOptIn);
        if (!fullName) {
            return res.status(400).json({ error: 'fullName ist erforderlich' });
        }
        if (!isValidZipCode(zipCode)) {
            return res.status(400).json({ error: 'PLZ ist ungueltig' });
        }
        const updated = await prisma_1.prisma.appCustomerAccount.update({
            where: { id: account.id },
            data: {
                fullName,
                phone,
                street,
                zipCode,
                city,
                marketingOptIn,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'app-auth',
            action: 'app_customer_profile_updated',
            targetType: 'appCustomerAccount',
            targetId: updated.id,
            metadata: {
                email: updated.email,
            },
        });
        return res.json({
            user: mapAppCustomerUser(updated),
        });
    }
    catch (error) {
        console.error('APP AUTH UPDATE PROFILE ERROR:', error);
        return res.status(500).json({ error: 'Profil konnte nicht gespeichert werden' });
    }
});
router.post('/request-deletion', async (req, res) => {
    try {
        const account = await resolveAccountFromRequest(req.header('authorization') || undefined);
        if (!account) {
            return res.status(401).json({ error: 'Nicht eingeloggt' });
        }
        const note = normalizeText(req.body.note);
        const updated = await prisma_1.prisma.appCustomerAccount.update({
            where: { id: account.id },
            data: {
                deletionRequestedAt: account.deletionRequestedAt || new Date(),
                deletionRequestNote: note,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'app-auth',
            action: 'app_customer_deletion_requested',
            targetType: 'appCustomerAccount',
            targetId: updated.id,
            metadata: {
                email: updated.email,
            },
        });
        return res.json({
            ok: true,
            deletionRequestedAt: updated.deletionRequestedAt,
        });
    }
    catch (error) {
        console.error('APP AUTH REQUEST DELETION ERROR:', error);
        return res.status(500).json({ error: 'Kontoloeschung konnte nicht angefragt werden' });
    }
});
exports.default = router;
