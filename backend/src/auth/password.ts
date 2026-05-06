import crypto from 'crypto'
import bcrypt from 'bcryptjs'

const LEGACY_PASSWORD_SALT = process.env.PASSWORD_SALT || 'klarando-default-salt'
const BCRYPT_COST = Number(process.env.PASSWORD_BCRYPT_COST || 12)

function isBcryptHash(hash: string) {
  return hash.startsWith('$2a$') || hash.startsWith('$2b$') || hash.startsWith('$2y$')
}

function hashPasswordLegacy(password: string) {
  return crypto
    .createHash('sha256')
    .update(`${LEGACY_PASSWORD_SALT}:${password}`)
    .digest('hex')
}

function isLegacySha256Hash(hash: string) {
  return /^[a-f0-9]{64}$/i.test(hash)
}

export function hashPassword(password: string) {
  return bcrypt.hashSync(password, BCRYPT_COST)
}

export function verifyPassword(password: string, hash: string) {
  if (isBcryptHash(hash)) {
    return bcrypt.compareSync(password, hash)
  }

  if (isLegacySha256Hash(hash)) {
    return hashPasswordLegacy(password) === hash
  }

  return false
}

export function needsPasswordRehash(hash: string) {
  return !isBcryptHash(hash)
}
