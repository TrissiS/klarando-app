"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.hashPassword = hashPassword;
exports.verifyPassword = verifyPassword;
exports.needsPasswordRehash = needsPasswordRehash;
const crypto_1 = __importDefault(require("crypto"));
const bcryptjs_1 = __importDefault(require("bcryptjs"));
const LEGACY_PASSWORD_SALT = process.env.PASSWORD_SALT || 'klarando-default-salt';
const BCRYPT_COST = Number(process.env.PASSWORD_BCRYPT_COST || 12);
function isBcryptHash(hash) {
    return hash.startsWith('$2a$') || hash.startsWith('$2b$') || hash.startsWith('$2y$');
}
function hashPasswordLegacy(password) {
    return crypto_1.default
        .createHash('sha256')
        .update(`${LEGACY_PASSWORD_SALT}:${password}`)
        .digest('hex');
}
function isLegacySha256Hash(hash) {
    return /^[a-f0-9]{64}$/i.test(hash);
}
function hashPassword(password) {
    return bcryptjs_1.default.hashSync(password, BCRYPT_COST);
}
function verifyPassword(password, hash) {
    if (isBcryptHash(hash)) {
        return bcryptjs_1.default.compareSync(password, hash);
    }
    if (isLegacySha256Hash(hash)) {
        return hashPasswordLegacy(password) === hash;
    }
    return false;
}
function needsPasswordRehash(hash) {
    return !isBcryptHash(hash);
}
