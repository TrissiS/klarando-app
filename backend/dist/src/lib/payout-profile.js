"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.readDefaultPayoutProfile = readDefaultPayoutProfile;
exports.normalizePayoutFieldPatch = normalizePayoutFieldPatch;
exports.mergePayoutProfile = mergePayoutProfile;
function normalizeText(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function normalizeEmail(value) {
    const text = normalizeText(value);
    return text ? text.toLowerCase() : null;
}
function normalizeIban(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const normalized = value.replace(/\s+/g, '').toUpperCase();
    if (!/^[A-Z]{2}[A-Z0-9]{13,32}$/.test(normalized)) {
        return null;
    }
    return normalized;
}
function normalizeBic(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const normalized = value.replace(/\s+/g, '').toUpperCase();
    if (!/^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(normalized)) {
        return null;
    }
    return normalized;
}
function readDefaultPayoutProfile() {
    return {
        payoutAccountHolder: normalizeText(process.env.DEFAULT_PAYOUT_ACCOUNT_HOLDER) || 'Klarando Betreiber',
        payoutBankName: normalizeText(process.env.DEFAULT_PAYOUT_BANK_NAME) || 'Klarando Partnerbank',
        payoutIban: normalizeIban(process.env.DEFAULT_PAYOUT_IBAN) || 'DE89370400440532013000',
        payoutBic: normalizeBic(process.env.DEFAULT_PAYOUT_BIC) || 'COBADEFFXXX',
        payoutEmail: normalizeEmail(process.env.DEFAULT_PAYOUT_EMAIL) || 'abrechnung@klarando.com',
        payoutReference: normalizeText(process.env.DEFAULT_PAYOUT_REFERENCE) || 'KLARANDO-ORDER',
    };
}
function normalizePayoutFieldPatch(input) {
    const next = {};
    const errors = [];
    if (input.payoutAccountHolder !== undefined) {
        const value = normalizeText(input.payoutAccountHolder);
        if (!value) {
            errors.push('payoutAccountHolder ist ungueltig');
        }
        else {
            next.payoutAccountHolder = value;
        }
    }
    if (input.payoutBankName !== undefined) {
        const value = normalizeText(input.payoutBankName);
        if (!value) {
            errors.push('payoutBankName ist ungueltig');
        }
        else {
            next.payoutBankName = value;
        }
    }
    if (input.payoutIban !== undefined) {
        const value = normalizeIban(input.payoutIban);
        if (!value) {
            errors.push('payoutIban ist ungueltig');
        }
        else {
            next.payoutIban = value;
        }
    }
    if (input.payoutBic !== undefined) {
        const value = normalizeBic(input.payoutBic);
        if (!value) {
            errors.push('payoutBic ist ungueltig');
        }
        else {
            next.payoutBic = value;
        }
    }
    if (input.payoutEmail !== undefined) {
        const value = normalizeEmail(input.payoutEmail);
        if (!value) {
            errors.push('payoutEmail ist ungueltig');
        }
        else {
            next.payoutEmail = value;
        }
    }
    if (input.payoutReference !== undefined) {
        const value = normalizeText(input.payoutReference);
        if (!value) {
            errors.push('payoutReference ist ungueltig');
        }
        else {
            next.payoutReference = value;
        }
    }
    return { next, errors };
}
function mergePayoutProfile(base, fallback) {
    return {
        payoutAccountHolder: base?.payoutAccountHolder || fallback.payoutAccountHolder,
        payoutBankName: base?.payoutBankName || fallback.payoutBankName,
        payoutIban: base?.payoutIban || fallback.payoutIban,
        payoutBic: base?.payoutBic || fallback.payoutBic,
        payoutEmail: base?.payoutEmail || fallback.payoutEmail,
        payoutReference: base?.payoutReference || fallback.payoutReference,
    };
}
