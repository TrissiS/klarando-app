"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.normalizeProductModifierKind = normalizeProductModifierKind;
exports.isSizeProductModifierKind = isSizeProductModifierKind;
exports.decodeStoredProductModifierName = decodeStoredProductModifierName;
exports.encodeStoredProductModifierName = encodeStoredProductModifierName;
exports.isSizeProductModifierName = isSizeProductModifierName;
const SIZE_STORAGE_PREFIX = '[SIZE] ';
function normalizeProductModifierKind(input, fallback = 'OPTION') {
    if (typeof input !== 'string') {
        return fallback;
    }
    const normalized = input.trim().toUpperCase();
    return normalized === 'SIZE' ? 'SIZE' : 'OPTION';
}
function isSizeProductModifierKind(input) {
    return normalizeProductModifierKind(input) === 'SIZE';
}
function decodeStoredProductModifierName(rawName) {
    const source = rawName.trim();
    if (source.toUpperCase().startsWith(SIZE_STORAGE_PREFIX.toUpperCase())) {
        const displayName = source.slice(SIZE_STORAGE_PREFIX.length).trim();
        return {
            kind: 'SIZE',
            displayName: displayName || source,
            storedName: source,
        };
    }
    return {
        kind: 'OPTION',
        displayName: source,
        storedName: source,
    };
}
function encodeStoredProductModifierName(displayName, kind) {
    const cleaned = displayName.trim();
    if (kind === 'SIZE') {
        return `${SIZE_STORAGE_PREFIX}${cleaned}`;
    }
    return cleaned;
}
function isSizeProductModifierName(rawName) {
    return decodeStoredProductModifierName(rawName).kind === 'SIZE';
}
