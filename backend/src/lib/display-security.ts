import crypto from 'crypto'

export function createToken(bytes = 32) {
  return crypto.randomBytes(bytes).toString('hex')
}

export function hashToken(token: string) {
  return crypto.createHash('sha256').update(token).digest('hex')
}

export function verifyToken(token: string, hash: string) {
  const computed = hashToken(token)
  if (computed.length !== hash.length) return false
  return crypto.timingSafeEqual(Buffer.from(computed), Buffer.from(hash))
}

export function createPairingCode() {
  return Math.floor(100000 + Math.random() * 900000).toString()
}
