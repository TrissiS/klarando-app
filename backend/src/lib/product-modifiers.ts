export type ProductModifierKind = 'OPTION' | 'SIZE'

const SIZE_STORAGE_PREFIX = '[SIZE] '

export function normalizeProductModifierKind(
  input: unknown,
  fallback: ProductModifierKind = 'OPTION'
): ProductModifierKind {
  if (typeof input !== 'string') {
    return fallback
  }

  const normalized = input.trim().toUpperCase()
  return normalized === 'SIZE' ? 'SIZE' : 'OPTION'
}

export function isSizeProductModifierKind(input: unknown) {
  return normalizeProductModifierKind(input) === 'SIZE'
}

export function decodeStoredProductModifierName(rawName: string) {
  const source = rawName.trim()

  if (source.toUpperCase().startsWith(SIZE_STORAGE_PREFIX.toUpperCase())) {
    const displayName = source.slice(SIZE_STORAGE_PREFIX.length).trim()
    return {
      kind: 'SIZE' as ProductModifierKind,
      displayName: displayName || source,
      storedName: source,
    }
  }

  return {
    kind: 'OPTION' as ProductModifierKind,
    displayName: source,
    storedName: source,
  }
}

export function encodeStoredProductModifierName(
  displayName: string,
  kind: ProductModifierKind
) {
  const cleaned = displayName.trim()
  if (kind === 'SIZE') {
    return `${SIZE_STORAGE_PREFIX}${cleaned}`
  }
  return cleaned
}

export function isSizeProductModifierName(rawName: string) {
  return decodeStoredProductModifierName(rawName).kind === 'SIZE'
}
