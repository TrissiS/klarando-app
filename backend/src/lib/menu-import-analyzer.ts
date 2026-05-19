import sharp from 'sharp'

type MenuImportTenantContext = {
  tenantId: string
  tenantName: string
}

type MenuImportImage = {
  mimeType: string
  base64Data: string
  fileName: string
}

type MenuImportCategory = {
  name: string
  sortOrder: number
  confidence: number
  products: Array<{
    name: string
    productNumber: string | null
    description: string | null
    price: number | null
    variants: Array<{
      name: string
      price: number | null
      confidence: number
    }>
    ingredients: string[]
    allergens: string[]
    additives: string[]
    notes: string | null
    confidence: number
  }>
}

export type MenuImportAnalysisResult = {
  restaurantName: string | null
  sourceLanguage: 'de'
  categories: MenuImportCategory[]
  promotions: Array<{
    name: string
    description: string
    price: number | null
    weekday: string | null
    confidence: number
  }>
  warnings: string[]
  debugRawResponsePreview?: string
}

function clampConfidence(value: unknown) {
  const num = Number(value)
  if (!Number.isFinite(num)) return 0
  if (num < 0) return 0
  if (num > 1) return 1
  return num
}

function normalizeTextList(values: unknown): string[] {
  if (!Array.isArray(values)) return []
  return values
    .map((entry) => (typeof entry === 'string' ? entry.trim() : ''))
    .filter((entry) => entry.length > 0)
}

const KNOWN_INGREDIENTS = [
  'Tomatensauce',
  'Käse',
  'Salami',
  'Schinken',
  'Pilze',
  'Thunfisch',
  'Zwiebeln',
  'Peperoni',
  'Paprika',
  'Mais',
  'Ananas',
  'Oliven',
  'Fleisch',
  'Drehspießfleisch',
  'Hähnchen',
  'Saucen',
  'Knoblauch',
  'Joghurt',
  'Gurke',
  'Tomaten',
]

function dedupeIngredients(values: string[]): string[] {
  const seen = new Set<string>()
  const out: string[] = []
  for (const value of values) {
    const normalized = value.trim()
    if (!normalized) continue
    const key = normalized.toLocaleLowerCase('de-DE')
    if (seen.has(key)) continue
    seen.add(key)
    out.push(normalized)
  }
  return out
}

function inferDescriptionAndIngredients(
  categoryName: string,
  currentDescription: string | null,
  notes: string | null,
  currentIngredients: string[]
): { description: string | null; ingredients: string[] } {
  const category = categoryName.toLocaleLowerCase('de-DE')
  const combined = `${currentDescription || ''} ${notes || ''}`
  const extracted: string[] = [...currentIngredients]

  for (const ingredient of KNOWN_INGREDIENTS) {
    const pattern = new RegExp(`\\b${ingredient}\\b`, 'i')
    if (pattern.test(combined)) extracted.push(ingredient)
  }

  if (category.includes('pizza')) {
    extracted.push('Tomatensauce', 'Käse')
    if (!currentDescription) {
      const withMatch = combined.match(/mit\\s+([^,.]+)/i)
      const suffix = withMatch ? `, ${withMatch[1].trim()}` : ''
      return {
        description: `mit Tomatensauce und Käse${suffix}`.replace(/,+/g, ','),
        ingredients: dedupeIngredients(extracted),
      }
    }
  }

  if (category.includes('drehspieß') || category.includes('döner')) {
    const withMatch = combined.match(/mit\\s+([^,.]+)/i)
    if (!currentDescription && withMatch?.[1]) {
      return {
        description: `mit ${withMatch[1].trim()}`,
        ingredients: dedupeIngredients(extracted),
      }
    }
  }

  if (category.includes('schnitzel') || category.includes('nudel') || category.includes('salat')) {
    const withMatch = combined.match(/mit\\s+([^,.]+)/i)
    if (!currentDescription && withMatch?.[1]) {
      return {
        description: `mit ${withMatch[1].trim()}`,
        ingredients: dedupeIngredients(extracted),
      }
    }
  }

  return {
    description: currentDescription && currentDescription.trim().length > 0 ? currentDescription.trim() : null,
    ingredients: dedupeIngredients(extracted),
  }
}

function mapCategoryProducts(categoryName: string, category: any): MenuImportCategory['products'] {
  const rawProducts = Array.isArray(category?.products)
    ? category.products
    : Array.isArray(category?.items)
      ? category.items
      : []

  return rawProducts
    .map((product: any) => {
      const name = typeof product?.name === 'string' ? product.name.trim() : ''
      if (!name) return null
      const normalizedDescription =
        typeof product?.description === 'string' && product.description.trim().length > 0
          ? product.description.trim()
          : null
      const normalizedNotes =
        typeof product?.notes === 'string' && product.notes.trim().length > 0 ? product.notes.trim() : null

      const inferred = inferDescriptionAndIngredients(
        categoryName,
        normalizedDescription,
        normalizedNotes,
        normalizeTextList(product?.ingredients)
      )

      return {
        name,
        productNumber:
          typeof product?.productNumber === 'string' && product.productNumber.trim().length > 0
            ? product.productNumber.trim()
            : null,
        description: inferred.description,
        price:
          product?.price === null || Number.isFinite(Number(product?.price)) ? Number(product.price) : null,
        variants: Array.isArray(product?.variants)
          ? product.variants
              .map((variant: any) => {
                const variantName = typeof variant?.name === 'string' ? variant.name.trim() : ''
                if (!variantName) return null
                return {
                  name: variantName,
                  price:
                    variant?.price === null || Number.isFinite(Number(variant?.price))
                      ? Number(variant.price)
                      : null,
                  confidence: clampConfidence(variant?.confidence),
                }
              })
              .filter(Boolean)
          : [],
        ingredients: inferred.ingredients,
        allergens: normalizeTextList(product?.allergens),
        additives: normalizeTextList(product?.additives),
        notes: normalizedNotes,
        confidence: clampConfidence(product?.confidence),
      }
    })
    .filter(Boolean) as MenuImportCategory['products']
}

function normalizeAnalysis(result: Partial<MenuImportAnalysisResult>): MenuImportAnalysisResult {
  const normalizedCategories = Array.isArray(result.categories)
    ? result.categories.map((category: any, index) => {
        const categoryName =
          typeof category?.name === 'string' && category.name.trim().length > 0
            ? category.name.trim()
            : `Kategorie ${index + 1}`
        const products = mapCategoryProducts(categoryName, category)
        return {
          name: categoryName,
          sortOrder: Number.isFinite(Number(category?.sortOrder)) ? Number(category.sortOrder) : index + 1,
          confidence: clampConfidence(category?.confidence),
          products,
        }
      })
    : []

  const normalizedPromotions = Array.isArray(result.promotions)
    ? result.promotions
        .map((promotion: any) => {
          const name = typeof promotion?.name === 'string' ? promotion.name.trim() : ''
          if (!name) return null
          return {
            name,
            description: typeof promotion?.description === 'string' ? promotion.description.trim() : '',
            price:
              promotion?.price === null || Number.isFinite(Number(promotion?.price))
                ? Number(promotion.price)
                : null,
            weekday:
              typeof promotion?.weekday === 'string' && promotion.weekday.trim().length > 0
                ? promotion.weekday.trim()
                : null,
            confidence: clampConfidence(promotion?.confidence),
          }
        })
        .filter(
          (
            promotion
          ): promotion is {
            name: string
            description: string
            price: number | null
            weekday: string | null
            confidence: number
          } => Boolean(promotion)
        )
    : []

  const normalizedWarnings = Array.isArray(result.warnings)
    ? result.warnings
        .map((warning) => (typeof warning === 'string' ? warning.trim() : ''))
        .filter((warning) => warning.length > 0)
    : []

  return {
    restaurantName:
      typeof result.restaurantName === 'string' && result.restaurantName.trim().length > 0
        ? result.restaurantName.trim()
        : null,
    sourceLanguage: 'de',
    categories: normalizedCategories,
    promotions: normalizedPromotions,
    warnings: normalizedWarnings,
    debugRawResponsePreview:
      typeof result.debugRawResponsePreview === 'string' && result.debugRawResponsePreview.trim().length > 0
        ? result.debugRawResponsePreview.slice(0, 4000)
        : undefined,
  }
}

function normalizeJsonCandidate(raw: string): string {
  const trimmed = raw.trim()
  if (!trimmed) return trimmed

  const fencedMatch = trimmed.match(/```json\s*([\s\S]*?)\s*```/i)
  if (fencedMatch?.[1]) return fencedMatch[1].trim()

  const genericFenceMatch = trimmed.match(/```\s*([\s\S]*?)\s*```/i)
  if (genericFenceMatch?.[1]) return genericFenceMatch[1].trim()

  const firstBrace = trimmed.indexOf('{')
  const lastBrace = trimmed.lastIndexOf('}')
  if (firstBrace >= 0 && lastBrace > firstBrace) {
    return trimmed.slice(firstBrace, lastBrace + 1).trim()
  }

  return trimmed
}

function looksTruncatedJson(raw: string): boolean {
  const text = raw.trim()
  if (!text) return false
  if (!text.endsWith('}')) return true
  const openCurly = (text.match(/\{/g) || []).length
  const closeCurly = (text.match(/\}/g) || []).length
  const openSquare = (text.match(/\[/g) || []).length
  const closeSquare = (text.match(/\]/g) || []).length
  return openCurly !== closeCurly || openSquare !== closeSquare
}

function attemptRepairJson(raw: string): string | null {
  let text = normalizeJsonCandidate(raw)
  if (!text) return null

  text = text.replace(/,\s*([}\]])/g, '$1')

  const openCurly = (text.match(/\{/g) || []).length
  const closeCurly = (text.match(/\}/g) || []).length
  const openSquare = (text.match(/\[/g) || []).length
  const closeSquare = (text.match(/\]/g) || []).length

  if (openSquare > closeSquare) text += ']'.repeat(openSquare - closeSquare)
  if (openCurly > closeCurly) text += '}'.repeat(openCurly - closeCurly)

  text = text.replace(/,\s*([}\]])/g, '$1')
  return text
}

function mapItemsToProducts(raw: any): any {
  if (!raw || typeof raw !== 'object') return raw
  if (Array.isArray(raw)) return raw.map(mapItemsToProducts)

  const cloned: any = { ...raw }
  if (Array.isArray(cloned.items) && !Array.isArray(cloned.products)) {
    cloned.products = cloned.items
  }
  if (Array.isArray(cloned.categories)) {
    cloned.categories = cloned.categories.map((category: any) => {
      const renamedCategory =
        category &&
        typeof category.categoryName === 'string' &&
        category.categoryName.trim().length > 0 &&
        (!category.name || String(category.name).trim().length === 0)
          ? { ...category, name: category.categoryName.trim() }
          : category

      if (renamedCategory && Array.isArray(renamedCategory.items) && !Array.isArray(renamedCategory.products)) {
        return {
          ...renamedCategory,
          products: renamedCategory.items,
        }
      }

      if (category && Array.isArray(category.items) && !Array.isArray(category.products)) {
        return {
          ...category,
          products: category.items,
        }
      }
      return renamedCategory
    })
  }
  return cloned
}

function splitOcrTextIntoChunks(ocrText: string): string[] {
  const lines = ocrText
    .split(/\r?\n/)
    .map((line) => line.trim())
    .filter(Boolean)

  if (lines.length < 40) return [ocrText]

  const sections: string[] = []
  let current: string[] = []

  const knownCategories = [
    'Drehspieß',
    'Pommes & Saucen',
    'Lahmacun',
    'Pizza',
    'Schnitzelgerichte',
    'Nudelgerichte',
    'Salate',
    'Getränke',
    'Hamburger',
    'Wurst',
    'Pizza Brötchen',
    'Spezial Gericht',
    'Pizzabrötchen',
  ]

  const isKnownCategory = (line: string) =>
    knownCategories.some((name) => line.toLocaleLowerCase('de-DE').includes(name.toLocaleLowerCase('de-DE')))

  const isCategoryLine = (line: string) => {
    const hasPrice = /\d+[,.]\d{2}\s*€?/.test(line)
    const looksShort = line.length <= 28
    const hasOnlyLetters = /^[A-Za-zÄÖÜäöüß &+\-/]+$/.test(line)
    return isKnownCategory(line) || (!hasPrice && looksShort && hasOnlyLetters)
  }

  for (const line of lines) {
    const startNewSection = isCategoryLine(line) && current.length >= 12
    if (startNewSection) {
      sections.push(current.join('\n'))
      current = [line]
      continue
    }
    current.push(line)
  }

  if (current.length > 0) sections.push(current.join('\n'))

  const merged: string[] = []
  for (const section of sections) {
    if (section.length < 220 && merged.length > 0) {
      merged[merged.length - 1] = `${merged[merged.length - 1]}\n\n${section}`
      continue
    }
    merged.push(section)
  }

  return merged.length > 0 ? merged : [ocrText]
}

function parseFallbackProductsFromChunk(ocrChunk: string): Partial<MenuImportAnalysisResult> {
  const lines = ocrChunk
    .split(/\r?\n/)
    .map((line) => line.trim())
    .filter(Boolean)

  const categories: MenuImportAnalysisResult['categories'] = []
  let currentCategory = 'Ohne Kategorie'
  const categoryWarnings: string[] = []
  const knownCategories = ['drehspieß', 'pommes', 'lahmacun', 'pizza', 'schnitzel', 'nudel', 'salat', 'getränke', 'hamburger', 'wurst', 'pizzabrötchen', 'spezial']

  const ensureCategory = (name: string) => {
    const existing = categories.find((entry) => entry.name.toLocaleLowerCase('de-DE') === name.toLocaleLowerCase('de-DE'))
    if (existing) return existing
    const next = {
      name,
      sortOrder: categories.length + 1,
      confidence: 0.55,
      products: [] as MenuImportAnalysisResult['categories'][number]['products'],
    }
    categories.push(next)
    return next
  }

  for (const line of lines) {
    const lower = line.toLocaleLowerCase('de-DE')
    const isHeading = knownCategories.some((entry) => lower.includes(entry)) && !/\d+[,.]\d{2}/.test(line)
    if (isHeading && line.length <= 40) {
      currentCategory = line
      ensureCategory(currentCategory)
      continue
    }

    const regexMatch = line.match(/^(\d+[A-Z]?)\.\s+(.+?)\s+€?\s*(\d+[,.]\d{2}|\d+)$/)
    const looseMatch = line.match(/^(.+?)\s+€?\s*(\d+[,.]\d{2}|\d+)$/)
    if (!regexMatch && !looseMatch) continue

    const category = ensureCategory(currentCategory)
    if (!categoryWarnings.includes(category.name)) categoryWarnings.push(category.name)

    const number = regexMatch?.[1] ?? null
    const name = (regexMatch?.[2] ?? looseMatch?.[1] ?? '').trim()
    if (!name) continue
    const rawPrice = (regexMatch?.[3] ?? looseMatch?.[2] ?? '').replace(',', '.')
    const parsedPrice = Number(rawPrice)
    const inferred = inferDescriptionAndIngredients(category.name, null, line, [])

    category.products.push({
      productNumber: number,
      name,
      description: inferred.description,
      price: Number.isFinite(parsedPrice) ? parsedPrice : null,
      variants: [],
      ingredients: inferred.ingredients,
      allergens: [],
      additives: [],
      notes: 'Per Fallback aus OCR-Zeile erkannt',
      confidence: 0.55,
    })
  }

  return {
    restaurantName: null,
    sourceLanguage: 'de',
    categories,
    promotions: [],
    warnings: [
      ...categoryWarnings.map((name) => `${name}: Diese Kategorie wurde per OCR-Fallback erstellt.`),
      'Bitte prüfen: automatisch per Fallback erkannt',
    ],
  }
}

function parseMenuText(ocrText: string): Partial<MenuImportAnalysisResult> {
  const lines = ocrText.split(/\r?\n/).map((line) => line.trim()).filter(Boolean)
  const knownCategories = [
    'Drehspieß',
    'Pommes & Saucen',
    'Lahmacun aus Kalbfleisch',
    'Lahmacun',
    'Pizza',
    'Nudelgerichte',
    'Schnitzelgerichte',
    'Salate',
    'Getränke',
    'Hamburger',
    'Wurst',
    'Burger',
    'Pasta',
    'Sushi',
    'Asia',
    'Indisch',
    'Griechisch',
    'Snacks',
    'Menüs',
    'Menü',
  ]
  const correctionMap: Array<[RegExp, string]> = [
    [/\bDahbruch\b/gi, 'Dahlbruch'],
    [/\bDahrbruch\b/gi, 'Dahlbruch'],
    [/\bScucuk\b/gi, 'Sucuk'],
    [/\bScuuk\b/gi, 'Sucuk'],
    [/\bSuccuk\b/gi, 'Sucuk'],
    [/\bSoßen\b/gi, 'Saucen'],
    [/\bWeißkäs\b/gi, 'Weichkäse'],
    [/\bDürüüm\b/gi, 'Dürüm'],
    [/\bdürüm\b/gi, 'Dürüm'],
    [/\bDrehspiess\b/gi, 'Drehspieß'],
    [/\bJägerschitzel\b/gi, 'Jägerschnitzel'],
    [/\bPaprikasnitzel\b/gi, 'Paprikaschnitzel'],
    [/\bZiegeunersauce\b/gi, 'Zigeunersauce'],
    [/\bZiegeursauce\b/gi, 'Zigeunersauce'],
  ]
  const categories: MenuImportAnalysisResult['categories'] = []
  const warnings: string[] = []
  const recognizedProductLines: string[] = []
  const unrecognizedPriceLines: string[] = []
  const uncategorizedProductLines: string[] = []
  const parserCategoryErrors: string[] = []

  const normalizeTypos = (value: string) => {
    let next = value
    for (const [pattern, replacement] of correctionMap) next = next.replace(pattern, replacement)
    return next
  }
  const cleanupMarkdown = (line: string) => line.replace(/^\*+|\*+$/g, '').replace(/\*+/g, '').trim()
  const knownCategoryMatch = (line: string) =>
    knownCategories.find((name) => line.toLocaleLowerCase('de-DE').includes(name.toLocaleLowerCase('de-DE'))) || null
  const isProductLine = (line: string) =>
    /^\s*\d+[A-Z]?\.\s+/.test(line) ||
    /€/.test(line) ||
    /\d+[,.]\d{2}/.test(line) ||
    /\b\d+,-\b/.test(line) ||
    /\bab\s+\d+[,.]\d{2}\s*€?/i.test(line)
  const isCategoryLine = (line: string) => {
    const cleaned = cleanupMarkdown(line).trim()
    if (!cleaned) return false
    if (isProductLine(cleaned)) return false
    if (cleaned.length > 80) return false
    if (knownCategoryMatch(cleaned)) return true
    if (/^\*\*.+\*\*/.test(line)) return true
    if (/:$/.test(cleaned) && !isProductLine(cleaned)) return true
    return /^[\p{L}\s&/+\-(),]{3,80}$/u.test(cleaned)
  }

  const ensureCategory = (name: string) => {
    const normalizedName = name.trim() || 'Unsortiert'
    const existing = categories.find(
      (entry) => entry.name.toLocaleLowerCase('de-DE') === normalizedName.toLocaleLowerCase('de-DE')
    )
    if (existing) return existing
    const created = {
      name: normalizedName,
      sortOrder: categories.length + 1,
      confidence: normalizedName === 'Unsortiert' ? 0.55 : 0.78,
      products: [] as MenuImportAnalysisResult['categories'][number]['products'],
    }
    categories.push(created)
    return created
  }

  const extractVariants = (line: string) =>
    [...line.matchAll(/(?:€\s*)?(\d+[,.]\d{2}|\d+,-)(?:\s*€)?\s*\(([^)]+)\)/g)]
      .map((entry) => {
        const normalizedPrice = entry[1].replace(',-', '.00').replace(',', '.')
        const price = Number(normalizedPrice)
        const label = entry[2].trim()
        if (!label || !Number.isFinite(price)) return null
        return { name: label, price, confidence: 0.68 }
      })
      .filter(Boolean) as Array<{ name: string; price: number; confidence: number }>

  const shouldAutoAssignDonerCategory = (name: string) =>
    /(drehspieß|drehspiess|döner|pommdöner|dürüm|durum|falafel)/i.test(name)

  let currentCategory = ''
  const reassignDebug: string[] = []
  for (const line of lines) {
    if (isCategoryLine(line)) {
      const cleaned = cleanupMarkdown(line).replace(/:$/, '').trim()
      const known = knownCategoryMatch(cleaned)
      currentCategory = known || cleaned
      ensureCategory(currentCategory)
      continue
    }

    const productMatch = line.match(
      /^(\d+[A-Z]?)\.\s+(.+?)\s*-?\s*(?:ab\s*)?(?:€\s*)?(\d+[,.]\d{2}|\d+\.\d{2}|\d+,-|\d+)(?:\s*€)?/i
    )
    const freeFormProductMatch = line.match(
      /^(.+?)\s*-?\s*(?:ab\s*)?(?:€\s*)?(\d+[,.]\d{2}|\d+\.\d{2}|\d+,-|\d+)(?:\s*€)?$/i
    )
    if (!productMatch && !freeFormProductMatch) {
      if (/€|\d+[,.]\d{2}|\d+,-/i.test(line)) {
        unrecognizedPriceLines.push(line)
      } 
      continue
    }

    const productNumber = productMatch?.[1] || null
    const rawName = normalizeTypos((productMatch?.[2] || freeFormProductMatch?.[1] || '').trim())
    const rawPriceToken = productMatch?.[3] || freeFormProductMatch?.[2] || ''
    const rawPrice = Number(rawPriceToken.replace(',-', '.00').replace(',', '.'))
    const variants = extractVariants(line)
    const withMatch = rawName.match(/\bmit\s+(.+)$/i)
    const cleanedName = (withMatch ? rawName.slice(0, withMatch.index) : rawName).trim()

    if (!currentCategory) {
      if (shouldAutoAssignDonerCategory(rawName)) {
        currentCategory = 'Drehspieß'
      } else {
        currentCategory = 'Unsortiert'
        uncategorizedProductLines.push(line)
      }
    }

    const targetCategory = ensureCategory(currentCategory)
    const inferred = inferDescriptionAndIngredients(
      targetCategory.name,
      withMatch?.[1] ? `mit ${withMatch[1].trim()}` : null,
      line,
      []
    )

    targetCategory.products.push({
      productNumber,
      name: cleanedName || rawName,
      description: inferred.description,
      price: Number.isFinite(rawPrice) ? rawPrice : null,
      variants,
      ingredients: inferred.ingredients,
      allergens: [],
      additives: [],
      notes: `Per Fallback aus OCR-Zeile erkannt · Ursprung: ${targetCategory.name}`,
      confidence: Number.isFinite(rawPrice) ? 0.66 : 0.55,
    })
    recognizedProductLines.push(line)

    warnings.push(`${targetCategory.name} / ${cleanedName || rawName}: Bitte prüfen: automatisch per Fallback erkannt`)
    warnings.push(`${targetCategory.name} / ${cleanedName || rawName}: Allergene unklar`)
    warnings.push(`${targetCategory.name} / ${cleanedName || rawName}: Varianten prüfen`)
    if (productNumber) {
      warnings.push(`${targetCategory.name} / ${cleanedName || rawName}: Artikelnummer wird nicht übernommen`)
    }
  }

  for (const category of categories) {
    if (/^\d+[A-Z]?\./.test(category.name) || /€/.test(category.name) || /\d+[,.]\d{2}/.test(category.name)) {
      parserCategoryErrors.push(category.name)
    }
  }

  const unsortedCategory = categories.find(
    (entry) => entry.name.toLocaleLowerCase('de-DE') === 'unsortiert'
  )
  if (unsortedCategory && unsortedCategory.products.length > 0) {
    const donerCategory = ensureCategory('Drehspieß')
    const keepProducts: typeof unsortedCategory.products = []
    for (const product of unsortedCategory.products) {
      if (shouldAutoAssignDonerCategory(product.name)) {
        donerCategory.products.push(product)
      } else {
        keepProducts.push(product)
      }
    }
    unsortedCategory.products = keepProducts
  }

  const expectedCategoryByNumber = (value: string | null): string | null => {
    if (!value) return null
    const num = Number(value.replace(/[^\d]/g, ''))
    if (!Number.isFinite(num)) return null
    if ((num >= 1 && num <= 14) || num === 201) return 'Drehspieß'
    if (num >= 15 && num <= 17) return 'Pommes & Saucen'
    if (num >= 18 && num <= 20) return 'Lahmacun aus Kalbfleisch'
    if (num >= 22 && num <= 42) return 'Pizza'
    if (num >= 46 && num <= 58) return 'Schnitzelgerichte'
    if (num >= 59 && num <= 76) return 'Nudelgerichte'
    return null
  }

  const movedProducts: Array<{ from: string; to: string; name: string }> = []
  for (const category of [...categories]) {
    const keep: typeof category.products = []
    for (const product of category.products) {
      const expected = expectedCategoryByNumber(product.productNumber)
      if (!expected || expected.toLocaleLowerCase('de-DE') === category.name.toLocaleLowerCase('de-DE')) {
        keep.push(product)
        continue
      }
      const toCategory = ensureCategory(expected)
      movedProducts.push({ from: category.name, to: expected, name: product.name })
      product.notes = `${product.notes || ''} · Korrigiert: ${category.name} → ${expected} (Nummernbereich)`.trim()
      toCategory.products.push(product)
      reassignDebug.push(`${product.productNumber || '?'} ${product.name}: ${category.name} -> ${expected} [Nummernbereich]`)
    }
    category.products = keep
  }

  if (movedProducts.length > 0) {
    warnings.push(`${movedProducts.length} Produkte wurden per Nummernbereich neu zugeordnet.`)
  }
  if (parserCategoryErrors.length > 0) {
    warnings.push('Parserfehler: Produktzeile wurde als Kategorie erkannt')
  }
  if (unrecognizedPriceLines.length > 0) warnings.push(`Parser konnte ${unrecognizedPriceLines.length} Preiszeilen nicht erkennen.`)
  if (uncategorizedProductLines.length > 0) warnings.push(`${uncategorizedProductLines.length} Produktzeilen ohne Kategorie wurden "Unsortiert" zugeordnet.`)

  return {
    restaurantName: null,
    sourceLanguage: 'de',
    categories: categories.filter((category) => category.products.length > 0),
    promotions: [],
    warnings,
    debugRawResponsePreview: [
      'PARSER DEBUG',
      `Erkannte Produktzeilen: ${recognizedProductLines.length}`,
      ...recognizedProductLines.slice(0, 40).map((line) => `+ ${line}`),
      '',
      `Nicht erkannte Preiszeilen: ${unrecognizedPriceLines.length}`,
      ...unrecognizedPriceLines.slice(0, 40).map((line) => `- ${line}`),
      '',
      `Ohne Kategorie gefunden: ${uncategorizedProductLines.length}`,
      ...uncategorizedProductLines.slice(0, 40).map((line) => `! ${line}`),
      '',
      'Kategorieblöcke:',
      ...categories.map((category) => `# ${category.name}: ${category.products.length} Produkte`),
      '',
      'Kategoriekorrekturen:',
      ...(reassignDebug.length > 0 ? reassignDebug.slice(0, 60) : ['- keine']),
      '',
      `Parserfehler-Kategorien: ${parserCategoryErrors.length}`,
      ...parserCategoryErrors.map((name) => `x ${name}`),
    ]
      .join('\n')
      .slice(0, 4000),
  }
}

function isOcrLikelyCutOff(ocrText: string): boolean {
  const trimmed = ocrText.trim()
  if (!trimmed) return false
  const tail = trimmed.slice(-32)
  return /[A-Za-zÄÖÜäöüß]$/.test(tail) && !/[.!?)]$/.test(tail)
}

async function callOpenAiJsonStructure(
  apiKey: string,
  textModel: string,
  chunkText: string,
  timeoutMs: number
): Promise<string> {
  const controller = new AbortController()
  const timeout = setTimeout(() => controller.abort(), timeoutMs)

  try {
    const response = await fetch('https://api.openai.com/v1/chat/completions', {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${apiKey}`,
        'Content-Type': 'application/json',
      },
      signal: controller.signal,
      body: JSON.stringify({
        model: textModel,
        messages: [
          {
            role: 'system',
            content: [
              'Du bist ein JSON-Extraktor für Speisekarten.',
              'Antworte ausschließlich mit vollständigem validem JSON.',
              'Verwende NIEMALS "items".',
              'Verwende IMMER "products".',
              'Jede Kategorie MUSS "products" enthalten.',
              'Wenn keine Produkte vorhanden sind: products: [].',
              'Keine Markdown-Codeblöcke. Kein Fließtext.',
            ].join(' '),
          },
          {
            role: 'user',
            content: [
              'Wandle den folgenden Speisekartentext in dieses Schema:',
              '{',
              '  "restaurantName": null,',
              '  "sourceLanguage": "de",',
              '  "categories": [',
              '    {',
              '      "name": "Kategorie",',
              '      "sortOrder": 1,',
              '      "confidence": 0.9,',
              '      "products": [',
              '        {',
              '          "productNumber": "01",',
              '          "name": "Produktname",',
              '          "description": null,',
              '          "price": 7.0,',
              '          "variants": [],',
              '          "ingredients": [],',
              '          "allergens": [],',
              '          "additives": [],',
              '          "notes": null,',
              '          "confidence": 0.9',
              '        }',
              '      ]',
              '    }',
              '  ],',
              '  "promotions": [],',
              '  "warnings": []',
              '}',
              '',
              'Speisekartentext:',
              chunkText,
            ].join('\n'),
          },
        ],
        response_format: { type: 'json_object' },
        temperature: 0.1,
        max_tokens: 16000,
      }),
    })

    if (!response.ok) {
      const failureBody = await response.text()
      console.error('MENU_IMPORT_STRUCT_OPENAI_ERROR', {
        model: textModel,
        status: response.status,
        message: failureBody.slice(0, 600),
      })
      return ''
    }

    const payload = (await response.json()) as {
      choices?: Array<{ message?: { content?: string | Array<{ text?: string }> } }>
    }

    const content = payload.choices?.[0]?.message?.content
    return typeof content === 'string'
      ? content.trim()
      : Array.isArray(content)
        ? content.map((entry) => entry.text || '').join('\n').trim()
        : ''
  } catch (error) {
    console.error('MENU_IMPORT_STRUCT_FETCH_ERROR', {
      model: textModel,
      timeoutMs,
      message: error instanceof Error ? error.message : String(error),
    })
    return ''
  } finally {
    clearTimeout(timeout)
  }
}

function tryParseStructuredChunk(rawOutput: string): { parsed: Partial<MenuImportAnalysisResult> | null; repaired: boolean } {
  if (!rawOutput) return { parsed: null, repaired: false }

  const tryParse = (candidate: string): Partial<MenuImportAnalysisResult> | null => {
    try {
      return JSON.parse(candidate) as Partial<MenuImportAnalysisResult>
    } catch {
      return null
    }
  }

  const normalized = normalizeJsonCandidate(rawOutput)
  let parsed = tryParse(normalized)
  if (parsed) return { parsed: mapItemsToProducts(parsed), repaired: false }

  const repairedCandidate = attemptRepairJson(rawOutput)
  if (repairedCandidate) {
    parsed = tryParse(repairedCandidate)
    if (parsed) return { parsed: mapItemsToProducts(parsed), repaired: true }
  }

  const firstBrace = normalized.indexOf('{')
  const lastBrace = normalized.lastIndexOf('}')
  if (firstBrace >= 0 && lastBrace > firstBrace) {
    parsed = tryParse(normalized.slice(firstBrace, lastBrace + 1))
    if (parsed) return { parsed: mapItemsToProducts(parsed), repaired: true }
  }

  return { parsed: null, repaired: false }
}

export async function analyzeMenuImages(
  images: MenuImportImage[],
  tenantContext: MenuImportTenantContext
): Promise<MenuImportAnalysisResult> {
  const debugEnabled =
    process.env.NODE_ENV !== 'production' || String(process.env.MENU_IMPORT_DEBUG || '').toLowerCase() === 'true'

  const fallbackResult: MenuImportAnalysisResult = {
    restaurantName: null,
    sourceLanguage: 'de',
    categories: [],
    promotions: [],
    warnings: ['KI hat keine gültige JSON-Struktur geliefert. Bitte erneut analysieren.'],
  }

  const apiKey = process.env.OPENAI_API_KEY
  if (!apiKey) throw new Error('OPENAI_API_KEY ist nicht gesetzt.')

  const visionModel = (process.env.OPENAI_MENU_IMPORT_VISION_MODEL || '').trim() || 'gpt-4o-mini'
  const textModel = (process.env.OPENAI_MENU_IMPORT_TEXT_MODEL || '').trim() || 'gpt-4.1-mini'

  console.info('MENU_IMPORT_ANALYZE_START', {
    visionModel,
    textModel,
    imageCount: images.length,
    mimeTypes: images.map((entry) => entry.mimeType),
    tenantId: tenantContext.tenantId,
  })

  const compressImage = async (image: MenuImportImage): Promise<MenuImportImage> => {
    try {
      const source = Buffer.from(image.base64Data, 'base64')
      const buffer = await sharp(source)
        .resize({ width: 1600, withoutEnlargement: true })
        .jpeg({ quality: 75 })
        .toBuffer()
      return { ...image, mimeType: 'image/jpeg', base64Data: buffer.toString('base64') }
    } catch {
      return image
    }
  }

  const callVisionOcr = async (image: MenuImportImage): Promise<string> => {
    const timeoutMs = 120_000
    const controller = new AbortController()
    const timeout = setTimeout(() => controller.abort(), timeoutMs)
    try {
      const response = await fetch('https://api.openai.com/v1/responses', {
        method: 'POST',
        headers: {
          Authorization: `Bearer ${apiKey}`,
          'Content-Type': 'application/json',
        },
        signal: controller.signal,
        body: JSON.stringify({
          model: visionModel,
          input: [
            {
              role: 'user',
              content: [
                {
                  type: 'input_text',
                  text: [
                    'Lies den gesamten sichtbaren Text dieser deutschen Speisekarte aus.',
                    'Gib alle Produktnamen, Nummern, Beschreibungen, Preise, Kategorien und Tagesangebote wieder.',
                    'Antworte als reiner Text. Keine Zusammenfassung. Nichts weglassen.',
                  ].join('\n'),
                },
                {
                  type: 'input_image',
                  image_url: `data:${image.mimeType};base64,${image.base64Data}`,
                },
              ],
            },
          ],
          max_output_tokens: 12000,
        }),
      })

      if (!response.ok) {
        const body = await response.text()
        console.error('MENU_IMPORT_OCR_OPENAI_ERROR', {
          model: visionModel,
          status: response.status,
          message: body.slice(0, 600),
        })
        return ''
      }

      const payload = (await response.json()) as {
        output_text?: string
        output?: Array<{ content?: Array<{ text?: string }> }>
      }

      const text =
        payload.output_text ||
        payload.output?.flatMap((entry) => entry.content || []).map((entry) => entry.text || '').join('\n') ||
        ''
      return text.trim()
    } catch (error) {
      console.error('MENU_IMPORT_OCR_FETCH_ERROR', {
        model: visionModel,
        timeoutMs,
        message: error instanceof Error ? error.message : String(error),
      })
      return ''
    } finally {
      clearTimeout(timeout)
    }
  }

  const preparedImages = await Promise.all(images.map((image) => compressImage(image)))
  const ocrParts = await Promise.all(preparedImages.map((image) => callVisionOcr(image)))
  const ocrText = ocrParts.filter(Boolean).join('\n\n').trim()

  if (!ocrText) {
    return {
      ...fallbackResult,
      warnings: [...fallbackResult.warnings, 'Bild konnte nicht gelesen werden. Bitte schärferes Bild verwenden.'],
    }
  }

  const ocrLikelyCut = isOcrLikelyCutOff(ocrText)
  const textChunks = [ocrText]
  const chunkResults: MenuImportAnalysisResult[] = []
  const debugParts: string[] = []

  for (let index = 0; index < textChunks.length; index += 1) {
    const chunkStartedAt = Date.now()
    const chunk = textChunks[index]
    const parsedChunk = normalizeAnalysis(parseMenuText(chunk))
    chunkResults.push(parsedChunk)
    const chunkProducts = parsedChunk.categories.reduce((acc, category) => acc + category.products.length, 0)
    console.info('MENU_IMPORT_CHUNK_DONE', {
      chunk: `${index + 1}/${textChunks.length}`,
      mode: 'deterministic_parser',
      categories: parsedChunk.categories.length,
      products: chunkProducts,
      durationMs: Date.now() - chunkStartedAt,
    })
    if (debugEnabled) {
      debugParts.push(
        `CHUNK ${index + 1}/${textChunks.length}`,
        `OCR CHUNK LENGTH: ${chunk.length}`,
        `ERGEBNIS PRODUKTE: ${chunkProducts}`,
        'MODE: deterministic_parser',
        'FEHLER: -',
        parsedChunk.debugRawResponsePreview ? parsedChunk.debugRawResponsePreview.slice(0, 800) : 'PARSER DEBUG: -',
        ''
      )
    }
  }

  const merged: MenuImportAnalysisResult = {
    restaurantName: null,
    sourceLanguage: 'de',
    categories: [],
    promotions: [],
    warnings: [],
  }

  const categoryMap = new Map<string, MenuImportCategory>()
  for (const chunkResult of chunkResults) {
    for (const warning of chunkResult.warnings) {
      if (!merged.warnings.includes(warning)) merged.warnings.push(warning)
    }
    for (const category of chunkResult.categories) {
      const key = category.name.toLocaleLowerCase('de-DE')
      const existing = categoryMap.get(key)
      if (!existing) {
        categoryMap.set(key, { ...category, products: [...category.products] })
        continue
      }
      for (const product of category.products) {
        const exists = existing.products.some(
          (entry) =>
            entry.name.toLocaleLowerCase('de-DE') === product.name.toLocaleLowerCase('de-DE') &&
            (entry.productNumber || '') === (product.productNumber || '')
        )
        if (!exists) existing.products.push(product)
      }
    }
  }

  merged.categories = Array.from(categoryMap.values()).map((category, index) => ({
    ...category,
    sortOrder: index + 1,
  }))

  if (ocrLikelyCut) {
    merged.warnings.push('OCR-Text scheint am Bildrand abgeschnitten. Bitte vollständige Karte hochladen.')
  }
  if (merged.categories.length === 0 && ocrText.length > 150) {
    merged.warnings.push('OCR erkannt, aber Parser hat keine Produkte erzeugt.')
  }

  if (debugEnabled) {
    const categoryDebug = merged.categories.map((category) => `${category.name}: ${category.products.length} Produkte`).join('\n')
    merged.debugRawResponsePreview = [
      `VISION MODEL: ${visionModel}`,
      `OCR LENGTH: ${ocrText.length}`,
      `PARSER MODE: deterministic`,
      `TEXT CHUNKS: ${textChunks.length}`,
      '',
      'VERARBEITETE KATEGORIEN:',
      categoryDebug || '(keine)',
      '',
      'OCR TEXT:',
      ocrText.slice(0, 2200),
      '',
      ...debugParts,
    ]
      .join('\n')
      .slice(0, 4000)
  }

  return normalizeAnalysis(merged)
}
