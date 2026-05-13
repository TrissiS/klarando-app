"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const node_crypto_1 = require("node:crypto");
const client_1 = require("@prisma/client");
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
async function verifyGoogleIdToken(idToken) {
    const response = await fetch(`https://oauth2.googleapis.com/tokeninfo?id_token=${encodeURIComponent(idToken)}`);
    if (!response.ok) {
        throw new Error('GOOGLE_TOKEN_INVALID');
    }
    const payload = (await response.json());
    const providerUserId = normalizeText(payload.sub);
    if (!providerUserId) {
        throw new Error('GOOGLE_TOKEN_INVALID');
    }
    const expectedAud = normalizeText(process.env.GOOGLE_OAUTH_CLIENT_ID);
    if (expectedAud) {
        const tokenAud = normalizeText(payload.aud);
        if (!tokenAud || tokenAud !== expectedAud) {
            throw new Error('GOOGLE_AUDIENCE_MISMATCH');
        }
    }
    const issuer = normalizeText(payload.iss);
    if (issuer && issuer !== 'accounts.google.com' && issuer !== 'https://accounts.google.com') {
        throw new Error('GOOGLE_ISSUER_INVALID');
    }
    const email = normalizeEmail(payload.email);
    return {
        providerUserId,
        email,
        fullName: normalizeText(payload.name),
        emailVerified: payload.email_verified === true ||
            normalizeText(payload.email_verified)?.toLowerCase() === 'true',
    };
}
async function verifyFacebookAccessToken(accessToken) {
    const appId = normalizeText(process.env.FACEBOOK_APP_ID);
    const appSecret = normalizeText(process.env.FACEBOOK_APP_SECRET);
    if (!appId || !appSecret) {
        throw new Error('FACEBOOK_CONFIG_MISSING');
    }
    const appToken = `${appId}|${appSecret}`;
    const debugUri = new URL('https://graph.facebook.com/debug_token');
    debugUri.searchParams.set('input_token', accessToken);
    debugUri.searchParams.set('access_token', appToken);
    const debugResponse = await fetch(debugUri);
    if (!debugResponse.ok) {
        throw new Error('FACEBOOK_TOKEN_INVALID');
    }
    const debugPayload = (await debugResponse.json());
    const debugData = debugPayload.data;
    const isValid = Boolean(debugData?.is_valid);
    const userId = normalizeText(debugData?.user_id);
    const tokenAppId = normalizeText(debugData?.app_id);
    if (!isValid || !userId) {
        throw new Error('FACEBOOK_TOKEN_INVALID');
    }
    if (tokenAppId && tokenAppId !== appId) {
        throw new Error('FACEBOOK_APP_MISMATCH');
    }
    const meUri = new URL('https://graph.facebook.com/me');
    meUri.searchParams.set('fields', 'id,name,email');
    meUri.searchParams.set('access_token', accessToken);
    const meResponse = await fetch(meUri);
    if (!meResponse.ok) {
        throw new Error('FACEBOOK_PROFILE_INVALID');
    }
    const me = (await meResponse.json());
    const providerUserId = normalizeText(me.id);
    if (!providerUserId) {
        throw new Error('FACEBOOK_PROFILE_INVALID');
    }
    return {
        providerUserId,
        email: normalizeEmail(me.email),
        fullName: normalizeText(me.name),
    };
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
router.post('/email-status', rate_limit_1.rateLimitRegistration, async (req, res) => {
    try {
        const email = normalizeEmail(req.body.email);
        if (!email || !isValidEmail(email)) {
            return res.status(400).json({ error: 'Bitte gültige E-Mail-Adresse angeben' });
        }
        const account = await prisma_1.prisma.appCustomerAccount.findUnique({
            where: { email },
            select: {
                id: true,
                isActive: true,
            },
        });
        return res.json({
            exists: Boolean(account && account.isActive),
        });
    }
    catch (error) {
        console.error('APP AUTH EMAIL STATUS ERROR:', error);
        return res.status(500).json({ error: 'E-Mail-Status konnte nicht geprüft werden' });
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
router.post('/social/google', rate_limit_1.rateLimitAuthLogin, async (req, res) => {
    try {
        const idToken = normalizeText(req.body.idToken);
        const fallbackEmail = normalizeEmail(req.body.email);
        const fallbackName = normalizeText(req.body.name);
        if (!idToken) {
            return res.status(400).json({ error: 'idToken fehlt' });
        }
        const verified = await verifyGoogleIdToken(idToken);
        const email = verified.email ?? fallbackEmail;
        if (!email || !isValidEmail(email)) {
            return res.status(400).json({ error: 'Google-Konto liefert keine gültige E-Mail-Adresse' });
        }
        const result = await prisma_1.prisma.$transaction(async (tx) => {
            const providerLink = await tx.appCustomerAuthProvider.findUnique({
                where: {
                    provider_providerUserId: {
                        provider: client_1.AppAuthProvider.GOOGLE,
                        providerUserId: verified.providerUserId,
                    },
                },
                include: {
                    appCustomer: true,
                },
            });
            let account = providerLink?.appCustomer ?? null;
            if (!account) {
                account = await tx.appCustomerAccount.findUnique({
                    where: { email },
                });
            }
            if (!account) {
                const generatedName = verified.fullName ?? fallbackName ?? email.split('@')[0] ?? 'Klarando Kunde';
                account = await tx.appCustomerAccount.create({
                    data: {
                        email,
                        fullName: generatedName,
                        passwordHash: (0, password_1.hashPassword)(createRandomSecret()),
                        isActive: true,
                        lastLoginAt: new Date(),
                    },
                });
            }
            else {
                account = await tx.appCustomerAccount.update({
                    where: { id: account.id },
                    data: {
                        fullName: verified.fullName ?? fallbackName ?? account.fullName,
                        isActive: true,
                        lastLoginAt: new Date(),
                    },
                });
            }
            await tx.appCustomerAuthProvider.upsert({
                where: {
                    provider_providerUserId: {
                        provider: client_1.AppAuthProvider.GOOGLE,
                        providerUserId: verified.providerUserId,
                    },
                },
                update: {
                    appCustomerId: account.id,
                    email,
                    emailVerified: verified.emailVerified,
                    metadata: {
                        linkedAt: new Date().toISOString(),
                    },
                },
                create: {
                    appCustomerId: account.id,
                    provider: client_1.AppAuthProvider.GOOGLE,
                    providerUserId: verified.providerUserId,
                    email,
                    emailVerified: verified.emailVerified,
                    metadata: {
                        linkedAt: new Date().toISOString(),
                    },
                },
            });
            return account;
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'app-auth',
            action: 'app_customer_social_google_login',
            targetType: 'appCustomerAccount',
            targetId: result.id,
            metadata: {
                email: result.email,
            },
        });
        const token = (0, app_token_1.signAppAuthToken)({
            sub: result.id,
            email: result.email,
        });
        return res.json({
            token,
            user: mapAppCustomerUser(result),
        });
    }
    catch (error) {
        if (error instanceof Error) {
            if (error.message === 'GOOGLE_TOKEN_INVALID' ||
                error.message === 'GOOGLE_AUDIENCE_MISMATCH' ||
                error.message === 'GOOGLE_ISSUER_INVALID') {
                return res.status(401).json({ error: 'Google-Anmeldung konnte nicht verifiziert werden' });
            }
        }
        console.error('APP AUTH SOCIAL GOOGLE ERROR:', error);
        return res.status(500).json({ error: 'Google-Anmeldung konnte nicht verarbeitet werden' });
    }
});
router.post('/social/facebook', rate_limit_1.rateLimitAuthLogin, async (req, res) => {
    try {
        const accessToken = normalizeText(req.body.accessToken);
        const manualEmail = normalizeEmail(req.body.email);
        if (!accessToken) {
            return res.status(400).json({ error: 'accessToken fehlt' });
        }
        const verified = await verifyFacebookAccessToken(accessToken);
        const email = verified.email ?? manualEmail;
        if (!email || !isValidEmail(email)) {
            return res.status(400).json({
                error: 'Facebook liefert keine E-Mail. Bitte E-Mail im Login ergänzen.',
                code: 'EMAIL_REQUIRED',
            });
        }
        const result = await prisma_1.prisma.$transaction(async (tx) => {
            const providerLink = await tx.appCustomerAuthProvider.findUnique({
                where: {
                    provider_providerUserId: {
                        provider: client_1.AppAuthProvider.FACEBOOK,
                        providerUserId: verified.providerUserId,
                    },
                },
                include: {
                    appCustomer: true,
                },
            });
            let account = providerLink?.appCustomer ?? null;
            if (!account) {
                account = await tx.appCustomerAccount.findUnique({
                    where: { email },
                });
            }
            if (!account) {
                account = await tx.appCustomerAccount.create({
                    data: {
                        email,
                        fullName: verified.fullName ?? email.split('@')[0] ?? 'Klarando Kunde',
                        passwordHash: (0, password_1.hashPassword)(createRandomSecret()),
                        isActive: true,
                        lastLoginAt: new Date(),
                    },
                });
            }
            else {
                account = await tx.appCustomerAccount.update({
                    where: { id: account.id },
                    data: {
                        fullName: verified.fullName ?? account.fullName,
                        isActive: true,
                        lastLoginAt: new Date(),
                    },
                });
            }
            await tx.appCustomerAuthProvider.upsert({
                where: {
                    provider_providerUserId: {
                        provider: client_1.AppAuthProvider.FACEBOOK,
                        providerUserId: verified.providerUserId,
                    },
                },
                update: {
                    appCustomerId: account.id,
                    email,
                    emailVerified: true,
                    metadata: {
                        linkedAt: new Date().toISOString(),
                    },
                },
                create: {
                    appCustomerId: account.id,
                    provider: client_1.AppAuthProvider.FACEBOOK,
                    providerUserId: verified.providerUserId,
                    email,
                    emailVerified: true,
                    metadata: {
                        linkedAt: new Date().toISOString(),
                    },
                },
            });
            return account;
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'app-auth',
            action: 'app_customer_social_facebook_login',
            targetType: 'appCustomerAccount',
            targetId: result.id,
            metadata: {
                email: result.email,
            },
        });
        const token = (0, app_token_1.signAppAuthToken)({
            sub: result.id,
            email: result.email,
        });
        return res.json({
            token,
            user: mapAppCustomerUser(result),
        });
    }
    catch (error) {
        if (error instanceof Error) {
            if (error.message === 'FACEBOOK_CONFIG_MISSING' ||
                error.message === 'FACEBOOK_TOKEN_INVALID' ||
                error.message === 'FACEBOOK_PROFILE_INVALID' ||
                error.message === 'FACEBOOK_APP_MISMATCH') {
                return res.status(401).json({ error: 'Facebook-Anmeldung konnte nicht verifiziert werden' });
            }
        }
        console.error('APP AUTH SOCIAL FACEBOOK ERROR:', error);
        return res.status(500).json({ error: 'Facebook-Anmeldung konnte nicht verarbeitet werden' });
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
