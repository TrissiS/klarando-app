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

export async function analyzeMenuImages(
  images: MenuImportImage[],
  tenantContext: MenuImportTenantContext
): Promise<MenuImportAnalysisResult> {
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

  const userContent: Array<Record<string, unknown>> = [
    {
      type: 'text',
      text: [
        'Analysiere Speisekartenbilder für einen internen Import-Assistenten.',
        `Tenant: ${tenantContext.tenantName} (${tenantContext.tenantId}).`,
        'Sprache: Deutsch.',
        'Erkenne Kategorien, Produkte, Preise, Varianten, Tagesangebote, Zutaten, Allergene und Zusatzstoffe.',
        'Wichtig: Keine Produkte oder Preise erfinden.',
        'Wenn eine Produktnummer/Artikelnummer erkennbar ist, trage sie als productNumber ein, sonst null.',
        'Wenn Preis unklar ist: price = null.',
        'Wenn Allergene/Zutaten unklar sind: leer lassen und Warnung schreiben.',
        'Confidence immer zwischen 0 und 1.',
        'Antworte ausschließlich mit gültigem JSON.',
        'Kein Markdown. Kein Erklärungstext. Keine Code-Fences.',
      ].join('\n'),
    },
  ]

  for (const image of images) {
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
  let response: Response
  try {
    response = await fetch('https://api.openai.com/v1/chat/completions', {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${apiKey}`,
        'Content-Type': 'application/json',
      },
      signal: controller.signal,
      body: JSON.stringify({
        model: selectedModel,
        messages: [
          {
            role: 'system',
            content:
              'Du extrahierst Speisekarten strukturiert für Klarando. Antworte ausschließlich mit gültigem JSON, ohne Markdown und ohne Codeblöcke.',
          },
          {
            role: 'user',
            content: userContent,
          },
        ],
        response_format: {
          type: 'json_object',
        },
        max_tokens: 3500,
      }),
    })
  } catch (fetchError) {
    const isAbort =
      fetchError instanceof Error &&
      (fetchError.name === 'AbortError' || /aborted|timeout/i.test(fetchError.message))
    console.error('MENU_IMPORT_ANALYZE_FETCH_ERROR', {
      model: selectedModel,
      imageCount: images.length,
      timeoutMs,
      durationMs: Date.now() - startedAt,
      isAbort,
      message: fetchError instanceof Error ? fetchError.message : String(fetchError),
    })
    throw new Error(
      isAbort
        ? 'KI-Analyse hat zu lange gedauert. Bitte mit weniger/kleineren Bildern erneut versuchen.'
        : 'KI-Analyse konnte den OpenAI-Dienst nicht erreichen.'
    )
  } finally {
    clearTimeout(timeout)
  }

  if (!response.ok) {
    const failureBody = await response.text()
    console.error('MENU_IMPORT_ANALYZE_OPENAI_ERROR', {
      model: selectedModel,
      imageCount: images.length,
      mimeTypes: images.map((entry) => entry.mimeType),
      status: response.status,
      message: failureBody.slice(0, 500),
    })
    throw new Error(`OpenAI Analyse fehlgeschlagen (${response.status}): ${failureBody.slice(0, 500)}`)
  }

  const payload = (await response.json()) as {
    choices?: Array<{
      message?: {
        content?: string | Array<{ type?: string; text?: string }>
      }
    }>
  }

  const messageContent = payload.choices?.[0]?.message?.content
  const rawOutput =
    typeof messageContent === 'string'
      ? messageContent
      : Array.isArray(messageContent)
        ? messageContent
            .map((entry) => (typeof entry.text === 'string' ? entry.text : ''))
            .join('\n')
            .trim()
        : ''

  if (!rawOutput) {
    throw new Error('OpenAI Analyse lieferte kein strukturiertes Ergebnis.')
  }

  try {
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
    console.info('MENU_IMPORT_ANALYZE_SUCCESS', {
      model: selectedModel,
      imageCount: images.length,
      durationMs: Date.now() - startedAt,
      categoryCount: safe.categories?.length ?? 0,
    })
    return normalizeAnalysis(safe)
  } catch (parseError) {
    console.error('MENU_IMPORT_ANALYZE_JSON_PARSE_ERROR', {
      model: selectedModel,
      imageCount: images.length,
      message: parseError instanceof Error ? parseError.message : 'JSON parse failed',
      responsePreview: rawOutput.slice(0, 2000),
    })
    throw new Error('KI hat keine gültige JSON-Struktur geliefert. Bitte erneut analysieren oder anderes Bild verwenden.')
  }
}
