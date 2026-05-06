"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.hashPassword = hashPassword;
exports.verifyPassword = verifyPassword;
const crypto_1 = __importDefault(require("crypto"));
const PASSWORD_SALT = process.env.PASSWORD_SALT || 'klarando-default-salt';
function hashPassword(password) {
    return crypto_1.default
        .createHash('sha256')
        .update(`${PASSWORD_SALT}:${password}`)
        .digest('hex');
}
function verifyPassword(password, hash) {
    return hashPassword(password) === hash;
}
