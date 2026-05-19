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
  const lines = ocrText
    .split(/\r?\n/)
    .map((line) => line.trim())
    .filter(Boolean)

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
    'Pizzabrötchen',
    'Spezial Gericht',
  ]

  const categories: MenuImportAnalysisResult['categories'] = []
  const warnings: string[] = []

  const ensureCategory = (name: string) => {
    const normalizedName = name.trim() || 'Ohne Kategorie'
    const existing = categories.find(
      (entry) => entry.name.toLocaleLowerCase('de-DE') === normalizedName.toLocaleLowerCase('de-DE')
    )
    if (existing) return existing
    const created = {
      name: normalizedName,
      sortOrder: categories.length + 1,
      confidence: 0.72,
      products: [] as MenuImportAnalysisResult['categories'][number]['products'],
    }
    categories.push(created)
    return created
  }

  let activeCategory = ensureCategory('Ohne Kategorie')

  const extractVariants = (line: string) => {
    const matches = [...line.matchAll(/(?:\(|\/)\s*([A-Za-zÄÖÜäöüß ]{3,20})\s*\)?\s*\/?\s*€?\s*(\d+[,.]\d{2})/g)]
    return matches.map((entry) => ({
      name: entry[1].trim(),
      price: Number(entry[2].replace(',', '.')),
      confidence: 0.68,
    }))
  }

  for (const line of lines) {
    const heading = line.match(/^\*{0,2}\s*([^*]+?)\s*\*{0,2}$/)
    const headingText = heading?.[1]?.trim() || line
    const isKnownCategory = knownCategories.some((name) =>
      headingText.toLocaleLowerCase('de-DE').includes(name.toLocaleLowerCase('de-DE'))
    )
    const looksCategoryLine = !/\d+[,.]\d{2}/.test(line) && headingText.length <= 36 && /^[\p{L}\s&/+-]+$/u.test(headingText)
    if (isKnownCategory || looksCategoryLine) {
      activeCategory = ensureCategory(headingText)
      continue
    }

    const strictPattern = /^(\d+[A-Z]?)\.\s+(.+?)\s+-?\s*€\s*(\d+[,.]\d{2}|\d+)$/i
    const compactPattern = /^(\d+[A-Z]?)\.\s+(.+?)\s+(\d+[,.]\d{2})$/i
    const priceOnlyPattern = /^(.+?)\s+-?\s*€\s*(\d+[,.]\d{2}|\d+)$/i

    const strictMatch = line.match(strictPattern)
    const compactMatch = line.match(compactPattern)
    const priceOnlyMatch = line.match(priceOnlyPattern)

    const productNumber = strictMatch?.[1] || compactMatch?.[1] || null
    const productName = (strictMatch?.[2] || compactMatch?.[2] || priceOnlyMatch?.[1] || '').trim()
    if (!productName) continue

    const rawPrice = strictMatch?.[3] || compactMatch?.[3] || priceOnlyMatch?.[2] || null
    const price = rawPrice ? Number(rawPrice.replace(',', '.')) : null
    const inferred = inferDescriptionAndIngredients(activeCategory.name, null, line, [])
    const variants = extractVariants(line)

    const fallbackNotes: string[] = ['Per Fallback aus OCR-Zeile erkannt']
    if (!productNumber) fallbackNotes.push('Artikelnummer fehlte in OCR-Zeile')
    if (price === null) fallbackNotes.push('Preis fehlt')

    activeCategory.products.push({
      productNumber,
      name: productName,
      description: inferred.description,
      price: Number.isFinite(price || NaN) ? price : null,
      variants,
      ingredients: inferred.ingredients,
      allergens: [],
      additives: [],
      notes: fallbackNotes.join(' · '),
      confidence: price === null ? 0.55 : 0.66,
    })

    if (price === null) warnings.push(`${activeCategory.name} / ${productName}: Preis fehlt`)
    warnings.push(`${activeCategory.name} / ${productName}: Bitte prüfen: automatisch per Fallback erkannt`)
    warnings.push(`${activeCategory.name} / ${productName}: Allergene unklar`)
    warnings.push(`${activeCategory.name} / ${productName}: Varianten prüfen`)
    if (productNumber) warnings.push(`${activeCategory.name} / ${productName}: Artikelnummer wird nicht übernommen`)
  }

  for (const category of categories) {
    if (category.products.length > 0 && category.confidence < 0.75) {
      warnings.push(`${category.name}: Diese Kategorie wurde per OCR-Fallback erstellt.`)
    }
  }

  return {
    restaurantName: null,
    sourceLanguage: 'de',
    categories: categories.filter((category) => category.products.length > 0),
    promotions: [],
    warnings,
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
  const textChunks = splitOcrTextIntoChunks(ocrText)
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
