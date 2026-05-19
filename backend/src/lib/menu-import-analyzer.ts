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

function mapCategoryProducts(category: any): MenuImportCategory['products'] {
  const rawProducts = Array.isArray(category?.products)
    ? category.products
    : Array.isArray(category?.items)
      ? category.items
      : []

  return rawProducts
    .map((product: any) => {
      const name = typeof product?.name === 'string' ? product.name.trim() : ''
      if (!name) return null
      return {
        name,
        productNumber:
          typeof product?.productNumber === 'string' && product.productNumber.trim().length > 0
            ? product.productNumber.trim()
            : null,
        description:
          typeof product?.description === 'string' && product.description.trim().length > 0
            ? product.description.trim()
            : null,
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
        ingredients: normalizeTextList(product?.ingredients),
        allergens: normalizeTextList(product?.allergens),
        additives: normalizeTextList(product?.additives),
        notes:
          typeof product?.notes === 'string' && product.notes.trim().length > 0
            ? product.notes.trim()
            : null,
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
        const products = mapCategoryProducts(category)
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
      if (category && Array.isArray(category.items) && !Array.isArray(category.products)) {
        return {
          ...category,
          products: category.items,
        }
      }
      return category
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

  const isCategoryLine = (line: string) => {
    const hasPrice = /\d+[,.]\d{2}\s*€?/.test(line)
    const looksShort = line.length <= 28
    const hasOnlyLetters = /^[A-Za-zÄÖÜäöüß &+\-/]+$/.test(line)
    return !hasPrice && looksShort && hasOnlyLetters
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
    const chunk = textChunks[index]
    const chunkStartedAt = Date.now()
    const rawOutput = await callOpenAiJsonStructure(apiKey, textModel, chunk, 90_000)

    if (debugEnabled) {
      debugParts.push(
        `CHUNK ${index + 1}/${textChunks.length}`,
        `OCR CHUNK LENGTH: ${chunk.length}`,
        `STRUCT RAW RESPONSE:`,
        rawOutput.slice(0, 1200),
        ''
      )
    }

    const { parsed, repaired } = tryParseStructuredChunk(rawOutput)
    if (!parsed) {
      console.error('MENU_IMPORT_RAW_RESPONSE_PREVIEW', rawOutput.slice(0, 4000))
      chunkResults.push({
        ...fallbackResult,
        warnings: [
          'KI-Rohantwort konnte nicht als JSON gelesen werden.',
          `Chunk ${index + 1} konnte nicht strukturiert werden.`,
        ],
      })
      continue
    }

    const normalized = normalizeAnalysis(parsed)
    if (repaired) normalized.warnings.push('JSON wurde automatisch repariert.')
    if (looksTruncatedJson(rawOutput)) normalized.warnings.push('OpenAI Antwort wurde vermutlich abgeschnitten.')

    console.info('MENU_IMPORT_CHUNK_DONE', {
      chunk: `${index + 1}/${textChunks.length}`,
      model: textModel,
      categories: normalized.categories.length,
      products: normalized.categories.reduce((acc, category) => acc + category.products.length, 0),
      durationMs: Date.now() - chunkStartedAt,
    })

    chunkResults.push(normalized)
  }

  const merged: MenuImportAnalysisResult = {
    restaurantName:
      chunkResults.find((entry) => entry.restaurantName && entry.restaurantName.trim().length > 0)?.restaurantName ||
      null,
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

    for (const promotion of chunkResult.promotions) {
      const exists = merged.promotions.some(
        (entry) =>
          entry.name.toLocaleLowerCase('de-DE') === promotion.name.toLocaleLowerCase('de-DE') &&
          (entry.weekday || '') === (promotion.weekday || '')
      )
      if (!exists) merged.promotions.push(promotion)
    }

    for (const category of chunkResult.categories) {
      const key = category.name.toLocaleLowerCase('de-DE')
      const existing = categoryMap.get(key)
      if (!existing) {
        categoryMap.set(key, {
          ...category,
          products: [...category.products],
        })
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
    merged.warnings.push('OCR erkannt, aber Strukturierung hat keine Produkte erzeugt.')
  }

  if (debugEnabled) {
    const categoryDebug = merged.categories
      .map((category) => `${category.name}: ${category.products.length} Produkte`)
      .join('\n')

    merged.debugRawResponsePreview = [
      `VISION MODEL: ${visionModel}`,
      `TEXT MODEL: ${textModel}`,
      `OCR LENGTH: ${ocrText.length}`,
      `TEXT CHUNKS: ${textChunks.length}`,
      '',
      'VERARBEITETE KATEGORIEN:',
      categoryDebug || '(keine)',
      '',
      'OCR TEXT:',
      ocrText.slice(0, 2000),
      '',
      ...debugParts,
    ]
      .join('\n')
      .slice(0, 4000)
  }

  return normalizeAnalysis(merged)
}
