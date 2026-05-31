const ORDER_PUBLIC_CODE_ALPHABET = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
const ORDER_PUBLIC_CODE_LENGTH = 6
const ORDER_PUBLIC_CODE_MAX_ATTEMPTS = 200

function randomFromAlphabet(length: number) {
  let value = ''
  for (let i = 0; i < length; i += 1) {
    const idx = Math.floor(Math.random() * ORDER_PUBLIC_CODE_ALPHABET.length)
    value += ORDER_PUBLIC_CODE_ALPHABET[idx]
  }
  return value
}

export async function createUniqueOrderPublicCode(db: unknown): Promise<string> {
  const dbAny = db as any
  for (let attempt = 0; attempt < ORDER_PUBLIC_CODE_MAX_ATTEMPTS; attempt += 1) {
    const candidate = randomFromAlphabet(ORDER_PUBLIC_CODE_LENGTH)
    const existing = await dbAny.order.findUnique({
      where: { publicOrderCode: candidate },
      select: { id: true },
    })
    if (!existing) {
      return candidate
    }
  }

  throw new Error('ORDER_PUBLIC_CODE_GENERATION_FAILED')
}
