type MenuImportTenantContext = {
  tenantId: string
  tenantName: string
}

type MenuImportImage = {
  mimeType: string
  base64Data: string
  fileName: string
}

export type MenuImportAnalysisResult = {
  restaurantName: string | null
  sourceLanguage: 'de'
  categories: Array<{
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
  }>
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

const menuImportSchema = {
  name: 'menu_import_analysis',
  strict: true,
  schema: {
    type: 'object',
    additionalProperties: false,
    required: ['restaurantName', 'sourceLanguage', 'categories', 'promotions', 'warnings'],
    properties: {
      restaurantName: { type: ['string', 'null'] },
      sourceLanguage: { type: 'string', enum: ['de'] },
      categories: {
        type: 'array',
        items: {
          type: 'object',
          additionalProperties: false,
          required: ['name', 'sortOrder', 'confidence', 'products'],
          properties: {
            name: { type: 'string' },
            sortOrder: { type: 'number' },
            confidence: { type: 'number' },
            products: {
              type: 'array',
              items: {
                type: 'object',
                additionalProperties: false,
                required: [
                  'name',
                  'productNumber',
                  'description',
                  'price',
                  'variants',
                  'ingredients',
                  'allergens',
                  'additives',
                  'notes',
                  'confidence',
                ],
                properties: {
                  name: { type: 'string' },
                  productNumber: { type: ['string', 'null'] },
                  description: { type: ['string', 'null'] },
                  price: { type: ['number', 'null'] },
                  variants: {
                    type: 'array',
                    items: {
                      type: 'object',
                      additionalProperties: false,
                      required: ['name', 'price', 'confidence'],
                      properties: {
                        name: { type: 'string' },
                        price: { type: ['number', 'null'] },
                        confidence: { type: 'number' },
                      },
                    },
                  },
                  ingredients: {
                    type: 'array',
                    items: { type: 'string' },
                  },
                  allergens: {
                    type: 'array',
                    items: { type: 'string' },
                  },
                  additives: {
                    type: 'array',
                    items: { type: 'string' },
                  },
                  notes: { type: ['string', 'null'] },
                  confidence: { type: 'number' },
                },
              },
            },
          },
        },
      },
      promotions: {
        type: 'array',
        items: {
          type: 'object',
          additionalProperties: false,
          required: ['name', 'description', 'price', 'weekday', 'confidence'],
          properties: {
            name: { type: 'string' },
            description: { type: 'string' },
            price: { type: ['number', 'null'] },
            weekday: { type: ['string', 'null'] },
            confidence: { type: 'number' },
          },
        },
      },
      warnings: {
        type: 'array',
        items: { type: 'string' },
      },
    },
  },
} as const

function clampConfidence(value: unknown) {
  const num = Number(value)
  if (!Number.isFinite(num)) return 0
  if (num < 0) return 0
  if (num > 1) return 1
  return num
}

function normalizeAnalysis(result: MenuImportAnalysisResult): MenuImportAnalysisResult {
  return {
    ...result,
    restaurantName:
      typeof result.restaurantName === 'string' && result.restaurantName.trim().length > 0
        ? result.restaurantName.trim()
        : null,
    sourceLanguage: 'de',
    categories: (Array.isArray(result.categories) ? result.categories : []).map((category, categoryIndex) => ({
      ...category,
      sortOrder: Number.isFinite(Number(category.sortOrder))
        ? Number(category.sortOrder)
        : categoryIndex + 1,
      confidence: clampConfidence(category.confidence),
      products: (category.products || []).map((product) => ({
        ...product,
        productNumber:
          typeof product.productNumber === 'string' && product.productNumber.trim().length > 0
            ? product.productNumber.trim()
            : null,
        price: product.price === null || Number.isFinite(Number(product.price)) ? product.price : null,
        confidence: clampConfidence(product.confidence),
        variants: (product.variants || []).map((variant) => ({
          ...variant,
          price: variant.price === null || Number.isFinite(Number(variant.price)) ? variant.price : null,
          confidence: clampConfidence(variant.confidence),
        })),
      })),
    })),
    promotions: (Array.isArray(result.promotions) ? result.promotions : []).map((promotion) => ({
      ...promotion,
      price: promotion.price === null || Number.isFinite(Number(promotion.price)) ? promotion.price : null,
      confidence: clampConfidence(promotion.confidence),
    })),
    warnings: Array.isArray(result.warnings) ? result.warnings.filter(Boolean) : [],
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
  if (fencedMatch?.[1]) {
    return fencedMatch[1].trim()
  }

  const genericFenceMatch = trimmed.match(/```\s*([\s\S]*?)\s*```/i)
  if (genericFenceMatch?.[1]) {
    return genericFenceMatch[1].trim()
  }

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
  if (openSquare > closeSquare) {
    text += ']'.repeat(openSquare - closeSquare)
  }
  if (openCurly > closeCurly) {
    text += '}'.repeat(openCurly - closeCurly)
  }
  text = text.replace(/,\s*([}\]])/g, '$1')
  return text
}

export async function analyzeMenuImages(
  images: MenuImportImage[],
  tenantContext: MenuImportTenantContext
): Promise<MenuImportAnalysisResult> {
  const debugEnabled =
    process.env.NODE_ENV !== 'production' || String(process.env.MENU_IMPORT_DEBUG || '').toLowerCase() === 'true'

  const withDebug = (result: MenuImportAnalysisResult, preview: string | null): MenuImportAnalysisResult => {
    if (!debugEnabled || !preview) {
      return result
    }
    return {
      ...result,
      debugRawResponsePreview: preview.slice(0, 4000),
    }
  }

  const fallbackResult: MenuImportAnalysisResult = {
    restaurantName: null,
    sourceLanguage: 'de',
    categories: [],
    promotions: [],
    warnings: [
      'KI hat keine gültige JSON-Struktur geliefert. Bitte erneut analysieren.',
      'KI-Rohantwort konnte nicht als JSON gelesen werden.',
    ],
  }

  const startedAt = Date.now()
  const apiKey = process.env.OPENAI_API_KEY
  if (!apiKey) {
    throw new Error('OPENAI_API_KEY ist nicht gesetzt.')
  }

  const selectedModel = (process.env.OPENAI_MENU_IMPORT_MODEL || '').trim() || 'gpt-4.1-mini'
  if (/gpt-5-nano/i.test(selectedModel)) {
    throw new Error('Das gewählte Modell unterstützt keine Bildanalyse. Bitte gpt-4.1-mini nutzen.')
  }

  console.info('MENU_IMPORT_ANALYZE_START', {
    model: selectedModel,
    imageCount: images.length,
    mimeTypes: images.map((entry) => entry.mimeType),
  })

  const chunkSize = 3
  const imageChunks: MenuImportImage[][] = []
  for (let i = 0; i < images.length; i += chunkSize) {
    imageChunks.push(images.slice(i, i + chunkSize))
  }

  const callModel = async (
    modelName: string,
    chunk: MenuImportImage[],
    chunkIndex: number
  ): Promise<string | null> => {
    const userContent: Array<Record<string, unknown>> = [
      {
        type: 'text',
        text: [
          'Analysiere Speisekartenbilder für einen internen Import-Assistenten.',
          `Tenant: ${tenantContext.tenantName} (${tenantContext.tenantId}).`,
          `Chunk: ${chunkIndex + 1}/${imageChunks.length}.`,
          'Sprache: Deutsch.',
          'Erkenne Kategorien, Produkte, Preise, Varianten, Tagesangebote, Zutaten, Allergene und Zusatzstoffe.',
          'Wichtig: Keine Produkte oder Preise erfinden.',
          'Wenn eine Produktnummer/Artikelnummer erkennbar ist, trage sie als productNumber ein, sonst null.',
          'Wenn Preis unklar ist: price = null.',
          'Wenn Allergene/Zutaten unklar sind: leer lassen und Warnung schreiben.',
          'Confidence immer zwischen 0 und 1.',
          'Antworte ausschließlich als JSON-Objekt.',
          'Beginne exakt mit { und ende exakt mit }.',
          'Nutze keine Markdown-Codeblöcke.',
          'Wenn du nichts erkennst, gib categories: [] und warnings zurück.',
          'Die Antwort MUSS vollständig sein.',
          'Beende niemals mitten in einem Objekt oder Array.',
        ].join('\n'),
      },
    ]
    for (const image of chunk) {
      userContent.push({
        type: 'image_url',
        image_url: {
          url: `data:${image.mimeType};base64,${image.base64Data}`,
        },
      })
    }
    const timeoutMs = 90_000
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
          model: modelName,
          messages: [
            {
              role: 'system',
              content:
                'Du bist ein JSON-Extraktor. Antworte ausschließlich mit vollständigem validem JSON. Die Antwort MUSS vollständig sein. Beende niemals mitten in einem Objekt oder Array. Beginne exakt mit { und ende exakt mit }. Kein Markdown. Keine Erklärung. Keine Code-Fences.',
            },
            {
              role: 'user',
              content: [
                ...userContent,
                {
                  type: 'text',
                  text: [
                    'Gib genau ein Root-Objekt mit dieser Struktur zurück:',
                    '{',
                    '  "restaurantName": null,',
                    '  "sourceLanguage": "de",',
                    '  "categories": [],',
                    '  "promotions": [],',
                    '  "warnings": []',
                    '}',
                  ].join('\n'),
                },
              ],
            },
          ],
          response_format: {
            type: 'json_object',
          },
          max_tokens: 12000,
          temperature: 0.1,
        }),
      })

      if (!response.ok) {
        const failureBody = await response.text()
        console.error('MENU_IMPORT_ANALYZE_OPENAI_ERROR', {
          model: modelName,
          imageCount: chunk.length,
          mimeTypes: chunk.map((entry) => entry.mimeType),
          status: response.status,
          message: failureBody.slice(0, 500),
        })
        return null
      }

      const payload = (await response.json()) as {
        choices?: Array<{
          message?: {
            content?: string | Array<{ type?: string; text?: string }>
          }
        }>
      }

      const messageContent = payload.choices?.[0]?.message?.content
      return typeof messageContent === 'string'
        ? messageContent
        : Array.isArray(messageContent)
          ? messageContent
              .map((entry) => (typeof entry.text === 'string' ? entry.text : ''))
              .join('\n')
              .trim()
          : null
    } catch (fetchError) {
      const isAbort =
        fetchError instanceof Error &&
        (fetchError.name === 'AbortError' || /aborted|timeout/i.test(fetchError.message))
      console.error('MENU_IMPORT_ANALYZE_FETCH_ERROR', {
        model: modelName,
        imageCount: chunk.length,
        timeoutMs,
        durationMs: Date.now() - startedAt,
        isAbort,
        message: fetchError instanceof Error ? fetchError.message : String(fetchError),
      })
      return null
    } finally {
      clearTimeout(timeout)
    }
  }

  const parsedChunks: MenuImportAnalysisResult[] = []
  let lastRawOutput = ''
  for (let chunkIndex = 0; chunkIndex < imageChunks.length; chunkIndex += 1) {
    const chunk = imageChunks[chunkIndex]
    let activeModel = selectedModel
    let rawOutput = (await callModel(selectedModel, chunk, chunkIndex)) || ''
    if (!rawOutput && selectedModel !== 'gpt-4o-mini') {
      const fallbackRaw = await callModel('gpt-4o-mini', chunk, chunkIndex)
      if (fallbackRaw) {
        activeModel = 'gpt-4o-mini'
        rawOutput = fallbackRaw
      }
    }
    lastRawOutput = rawOutput || lastRawOutput

    try {
      if (!rawOutput) {
        console.error('MENU_IMPORT_ANALYZE_JSON_PARSE_ERROR', {
          model: activeModel,
          imageCount: chunk.length,
          message: 'empty response',
          responsePreview: '',
        })
        parsedChunks.push(withDebug(fallbackResult, null))
        continue
      }
      const normalizedOutput = normalizeJsonCandidate(rawOutput)
      const parsed = JSON.parse(normalizedOutput) as Partial<MenuImportAnalysisResult>
      const safe: MenuImportAnalysisResult = {
        restaurantName:
          typeof parsed.restaurantName === 'string' || parsed.restaurantName === null
            ? parsed.restaurantName
            : null,
        sourceLanguage: 'de',
        categories: Array.isArray(parsed.categories) ? parsed.categories : [],
        promotions: Array.isArray(parsed.promotions) ? parsed.promotions : [],
        warnings: Array.isArray(parsed.warnings) ? parsed.warnings : [],
      }
      if (looksTruncatedJson(rawOutput)) {
        safe.warnings = Array.isArray(safe.warnings) ? safe.warnings : []
        safe.warnings.push('OpenAI Antwort wurde vermutlich abgeschnitten.')
      }
      console.info('MENU_IMPORT_ANALYZE_SUCCESS', {
        model: activeModel,
        imageCount: chunk.length,
        durationMs: Date.now() - startedAt,
        categoryCount: safe.categories?.length ?? 0,
      })
      parsedChunks.push(normalizeAnalysis(safe))
      continue
    } catch (parseError) {
    if (looksTruncatedJson(rawOutput)) {
      const repaired = attemptRepairJson(rawOutput)
      if (repaired) {
        try {
          const reparsed = JSON.parse(repaired) as Partial<MenuImportAnalysisResult>
          const safe: MenuImportAnalysisResult = {
            restaurantName:
              typeof reparsed.restaurantName === 'string' || reparsed.restaurantName === null
                ? reparsed.restaurantName
                : null,
            sourceLanguage: 'de',
            categories: Array.isArray(reparsed.categories) ? reparsed.categories : [],
            promotions: Array.isArray(reparsed.promotions) ? reparsed.promotions : [],
            warnings: Array.isArray(reparsed.warnings) ? reparsed.warnings : [],
          }
          safe.warnings.push('OpenAI Antwort wurde vermutlich abgeschnitten.')
          safe.warnings.push('JSON wurde automatisch repariert.')
            parsedChunks.push(withDebug(normalizeAnalysis(safe), rawOutput.slice(0, 4000)))
            continue
        } catch {
          // continue with other repair/fallback attempts
        }
      }
    }

    const normalizedOutput = normalizeJsonCandidate(rawOutput)
    const firstBrace = normalizedOutput.indexOf('{')
    const lastBrace = normalizedOutput.lastIndexOf('}')
    if (firstBrace >= 0 && lastBrace > firstBrace) {
      const candidate = normalizedOutput.slice(firstBrace, lastBrace + 1)
      try {
        const reparsed = JSON.parse(candidate) as Partial<MenuImportAnalysisResult>
        const safe: MenuImportAnalysisResult = {
          restaurantName:
            typeof reparsed.restaurantName === 'string' || reparsed.restaurantName === null
              ? reparsed.restaurantName
              : null,
          sourceLanguage: 'de',
          categories: Array.isArray(reparsed.categories) ? reparsed.categories : [],
          promotions: Array.isArray(reparsed.promotions) ? reparsed.promotions : [],
          warnings: Array.isArray(reparsed.warnings) ? reparsed.warnings : [],
        }
        const normalizedSafe = normalizeAnalysis(safe)
          parsedChunks.push(withDebug(normalizedSafe, rawOutput.slice(0, 4000)))
          continue
      } catch {
        // keep fallback path below
      }
    }

    console.error('MENU_IMPORT_RAW_RESPONSE_PREVIEW', rawOutput.slice(0, 4000))
    console.error('MENU_IMPORT_ANALYZE_JSON_PARSE_ERROR', {
      model: activeModel,
      imageCount: chunk.length,
      message: parseError instanceof Error ? parseError.message : 'JSON parse failed',
      responsePreview: rawOutput.slice(0, 4000),
    })
      parsedChunks.push(withDebug(fallbackResult, rawOutput.slice(0, 4000)))
      continue
    }
  }

  const merged: MenuImportAnalysisResult = {
    restaurantName:
      parsedChunks.find((entry) => entry.restaurantName && entry.restaurantName.trim().length > 0)?.restaurantName ??
      null,
    sourceLanguage: 'de',
    categories: [],
    promotions: [],
    warnings: [],
    debugRawResponsePreview:
      parsedChunks.find((entry) => typeof entry.debugRawResponsePreview === 'string')?.debugRawResponsePreview ??
      (debugEnabled ? lastRawOutput.slice(0, 4000) : undefined),
  }

  const categoryMap = new Map<string, MenuImportAnalysisResult['categories'][number]>()
  for (const chunkResult of parsedChunks) {
    for (const warning of chunkResult.warnings) {
      if (!merged.warnings.includes(warning)) merged.warnings.push(warning)
    }
    for (const promo of chunkResult.promotions) {
      const exists = merged.promotions.some(
        (current) =>
          current.name.toLocaleLowerCase('de-DE') === promo.name.toLocaleLowerCase('de-DE') &&
          (current.weekday || '') === (promo.weekday || '')
      )
      if (!exists) merged.promotions.push(promo)
    }
    for (const category of chunkResult.categories) {
      const key = category.name.toLocaleLowerCase('de-DE')
      const existingCategory = categoryMap.get(key)
      if (!existingCategory) {
        categoryMap.set(key, { ...category, products: [...category.products] })
        continue
      }
      for (const product of category.products) {
        const exists = existingCategory.products.some(
          (p) => p.name.toLocaleLowerCase('de-DE') === product.name.toLocaleLowerCase('de-DE')
        )
        if (!exists) existingCategory.products.push(product)
      }
    }
  }

  merged.categories = Array.from(categoryMap.values()).map((category, index) => ({
    ...category,
    sortOrder: index + 1,
  }))
  return normalizeAnalysis(merged)
}
