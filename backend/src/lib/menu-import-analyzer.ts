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
    sourceLanguage: 'de',
    categories: (result.categories || []).map((category, categoryIndex) => ({
      ...category,
      sortOrder: Number.isFinite(Number(category.sortOrder))
        ? Number(category.sortOrder)
        : categoryIndex + 1,
      confidence: clampConfidence(category.confidence),
      products: (category.products || []).map((product) => ({
        ...product,
        price: product.price === null || Number.isFinite(Number(product.price)) ? product.price : null,
        confidence: clampConfidence(product.confidence),
        variants: (product.variants || []).map((variant) => ({
          ...variant,
          price: variant.price === null || Number.isFinite(Number(variant.price)) ? variant.price : null,
          confidence: clampConfidence(variant.confidence),
        })),
      })),
    })),
    promotions: (result.promotions || []).map((promotion) => ({
      ...promotion,
      price: promotion.price === null || Number.isFinite(Number(promotion.price)) ? promotion.price : null,
      confidence: clampConfidence(promotion.confidence),
    })),
    warnings: Array.isArray(result.warnings) ? result.warnings.filter(Boolean) : [],
  }
}

export async function analyzeMenuImages(
  images: MenuImportImage[],
  tenantContext: MenuImportTenantContext
): Promise<MenuImportAnalysisResult> {
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
        'Wenn Preis unklar ist: price = null.',
        'Wenn Allergene/Zutaten unklar sind: leer lassen und Warnung schreiben.',
        'Confidence immer zwischen 0 und 1.',
        'Antworte nur mit gültigem JSON.',
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

  const response = await fetch('https://api.openai.com/v1/chat/completions', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${apiKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      model: selectedModel,
      messages: [
        {
          role: 'system',
          content:
            'Du extrahierst Speisekarten strukturiert für Klarando. Gib ausschließlich JSON gemäß Schema zurück.',
        },
        {
          role: 'user',
          content: userContent,
        },
      ],
      response_format: {
        type: 'json_schema',
        json_schema: menuImportSchema,
      },
      max_tokens: 6000,
    }),
  })

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
    const parsed = JSON.parse(rawOutput) as MenuImportAnalysisResult
    return normalizeAnalysis(parsed)
  } catch (parseError) {
    console.error('MENU_IMPORT_ANALYZE_JSON_PARSE_ERROR', {
      model: selectedModel,
      imageCount: images.length,
      message: parseError instanceof Error ? parseError.message : 'JSON parse failed',
      responsePreview: rawOutput.slice(0, 800),
    })
    throw new Error('OpenAI Antwort konnte nicht als JSON gelesen werden.')
  }
}
