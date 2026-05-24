'use client'

import { useEffect, useMemo, useState } from 'react'
import {
  createPublicTerminalOrder,
  getPublicTerminalConfig,
  type OrderPaymentMethod,
  type PublicOrderTerminalConfig,
  type PublicTerminalProduct,
} from '@/lib/api'

type Props = {
  params: Promise<{
    terminalCode: string
  }>
}

type ProductModifier = PublicTerminalProduct['modifiers'][number]

type CartItem = {
  key: string
  productId: string
  name: string
  unitPrice: number
  quantity: number
  selectedModifierIds: string[]
  selectedModifiers: ProductModifier[]
}

function resolveCategory(product: PublicTerminalProduct) {
  return product.category?.name || 'Allgemein'
}

function formatPickupNumber(value: number | null) {
  if (value === null) {
    return '-'
  }

  return String(value).padStart(3, '0')
}

function formatMoney(value: number) {
  return `${value.toFixed(2)} EUR`
}

function formatModifierDelta(value: string | number) {
  const numeric = Number(value)
  const sign = numeric >= 0 ? '+' : '-'
  return `${sign}${Math.abs(numeric).toFixed(2)} EUR`
}

function formatBeverageContainerType(
  value: PublicTerminalProduct['beverageContainerType'] | null | undefined
) {
  if (value === 'EINWEG') {
    return 'Einweg'
  }
  if (value === 'MEHRWEG') {
    return 'Mehrweg'
  }
  return null
}

function isSizeModifier(modifier: ProductModifier) {
  return modifier.kind === 'SIZE'
}

function modifierSelectionGroupKey(modifier: ProductModifier) {
  if (isSizeModifier(modifier)) {
    return 'SIZE'
  }
  const ingredientGroup = modifier.ingredientId?.trim() || '__default'
  return `OPTION:${ingredientGroup}`
}

function buildCartKey(productId: string, modifierIds: string[]) {
  return `${productId}::${[...modifierIds].sort().join(',')}`
}

function sanitizeHexColor(input: string | null | undefined, fallback: string) {
  if (!input) {
    return fallback
  }

  const value = input.trim()
  if (!/^#[0-9A-Fa-f]{6}$/.test(value)) {
    return fallback
  }

  return value.toLowerCase()
}

function hexToRgba(hex: string, alpha: number) {
  const safeAlpha = Math.min(1, Math.max(0, alpha))
  const normalized = sanitizeHexColor(hex, '#000000').slice(1)
  const red = Number.parseInt(normalized.slice(0, 2), 16)
  const green = Number.parseInt(normalized.slice(2, 4), 16)
  const blue = Number.parseInt(normalized.slice(4, 6), 16)
  return `rgba(${red}, ${green}, ${blue}, ${safeAlpha})`
}

function resolveAutoScaleFactor(width: number, height: number) {
  const widthScale = width / 1440
  const heightScale = height / 900
  return Math.min(1.18, Math.max(0.74, Math.min(widthScale, heightScale)))
}

export default function TerminalPage({ params }: Props) {
  const [terminalCode, setTerminalCode] = useState('')
  const [config, setConfig] = useState<PublicOrderTerminalConfig | null>(null)
  const [cart, setCart] = useState<CartItem[]>([])
  const [search, setSearch] = useState('')
  const [categoryFilter, setCategoryFilter] = useState('ALL')
  const [paymentMethod, setPaymentMethod] = useState<OrderPaymentMethod | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [layoutScale, setLayoutScale] = useState(1)
  const [viewportHeight, setViewportHeight] = useState<number | null>(null)

  const [configuringProduct, setConfiguringProduct] = useState<PublicTerminalProduct | null>(
    null
  )
  const [modifierSelection, setModifierSelection] = useState<Record<string, boolean>>({})

  useEffect(() => {
    params.then((resolved) => {
      setTerminalCode(resolved.terminalCode.toUpperCase())
    })
  }, [params])

  async function loadConfig() {
    if (!terminalCode) {
      return
    }

    try {
      setLoading(true)
      setError('')
      const data = await getPublicTerminalConfig(terminalCode)
      setConfig(data)

      if (data.terminal.allowCardPayment) {
        setPaymentMethod('CARD')
      } else if (data.terminal.allowCashPayment) {
        setPaymentMethod('CASH')
      } else {
        setPaymentMethod(null)
      }
    } catch (loadError) {
      setError(
        loadError instanceof Error
          ? loadError.message
          : 'Terminaldaten konnten nicht geladen werden'
      )
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadConfig()
  }, [terminalCode])

  const accentColor = sanitizeHexColor(config?.terminal.customerAccentColor, '#ea580c')
  const backgroundStart = sanitizeHexColor(config?.terminal.customerBgFromColor, '#ffedd5')
  const backgroundEnd = sanitizeHexColor(config?.terminal.customerBgToColor, '#f8fafc')
  const cardColor = sanitizeHexColor(config?.terminal.customerCardColor, '#ffffff')
  const autoScaleEnabled = config?.terminal.autoScaleLayout ?? true

  useEffect(() => {
    if (!autoScaleEnabled) {
      setLayoutScale(1)
      setViewportHeight(null)
      return
    }

    const applyScale = () => {
      setLayoutScale(resolveAutoScaleFactor(window.innerWidth, window.innerHeight))
      setViewportHeight(window.innerHeight)
    }

    applyScale()
    window.addEventListener('resize', applyScale)
    return () => window.removeEventListener('resize', applyScale)
  }, [autoScaleEnabled])

  const categoryOptions = useMemo(() => {
    if (!config) {
      return [] as string[]
    }

    return Array.from(new Set(config.products.map(resolveCategory)))
  }, [config])

  const filteredProducts = useMemo(() => {
    if (!config) {
      return [] as PublicTerminalProduct[]
    }

    const query = search.trim().toLowerCase()
    return config.products.filter((product) => {
      if (categoryFilter !== 'ALL' && resolveCategory(product) !== categoryFilter) {
        return false
      }

      if (!query) {
        return true
      }

      const source = [
        product.name,
        product.productNumber,
        resolveCategory(product),
        product.ingredients.map((entry) => entry.name).join(','),
        product.allergens.join(','),
      ]
        .join(' ')
        .toLowerCase()

      return source.includes(query)
    })
  }, [categoryFilter, config, search])

  const total = useMemo(() => {
    return cart.reduce((sum, item) => sum + item.unitPrice * item.quantity, 0)
  }, [cart])

  const configuredModifiers = useMemo(() => {
    if (!configuringProduct) {
      return [] as ProductModifier[]
    }
    return configuringProduct.modifiers.filter((modifier) => modifierSelection[modifier.id])
  }, [configuringProduct, modifierSelection])

  const configuredUnitPrice = useMemo(() => {
    if (!configuringProduct) {
      return 0
    }
    const modifierDelta = configuredModifiers.reduce(
      (sum, modifier) => sum + Number(modifier.priceDelta),
      0
    )
    return Math.max(0, Number(configuringProduct.price) + modifierDelta)
  }, [configuredModifiers, configuringProduct])
  const configuringSizeModifiers = useMemo(
    () => (configuringProduct ? configuringProduct.modifiers.filter(isSizeModifier) : []),
    [configuringProduct]
  )
  const configuringExtraModifiers = useMemo(
    () => (configuringProduct ? configuringProduct.modifiers.filter((entry) => !isSizeModifier(entry)) : []),
    [configuringProduct]
  )

  function closeConfigurator() {
    setConfiguringProduct(null)
    setModifierSelection({})
  }

  function addConfiguredProduct(product: PublicTerminalProduct, selectedModifiers: ProductModifier[]) {
    const selectedModifierIds = selectedModifiers.map((entry) => entry.id).sort()
    const modifierDelta = selectedModifiers.reduce(
      (sum, modifier) => sum + Number(modifier.priceDelta),
      0
    )
    const unitPrice = Math.max(0, Number(product.price) + modifierDelta)
    const key = buildCartKey(product.id, selectedModifierIds)

    setCart((current) => {
      const existing = current.find((entry) => entry.key === key)
      if (!existing) {
        return [
          ...current,
          {
            key,
            productId: product.id,
            name: product.name,
            unitPrice,
            quantity: 1,
            selectedModifierIds,
            selectedModifiers: [...selectedModifiers],
          },
        ]
      }

      return current.map((entry) =>
        entry.key === key ? { ...entry, quantity: entry.quantity + 1 } : entry
      )
    })
  }

  function startAddProduct(product: PublicTerminalProduct) {
    const activeModifiers = product.modifiers || []
    if (activeModifiers.length === 0) {
      addConfiguredProduct(product, [])
      return
    }

    const groups = new Map<string, ProductModifier[]>()
    for (const modifier of activeModifiers) {
      const groupKey = modifierSelectionGroupKey(modifier)
      const existing = groups.get(groupKey)
      if (existing) {
        existing.push(modifier)
      } else {
        groups.set(groupKey, [modifier])
      }
    }

    const initialSelection: Record<string, boolean> = Object.fromEntries(
      activeModifiers.map((modifier) => [modifier.id, false])
    )

    for (const [groupKey, groupModifiers] of groups) {
      const defaultModifier = groupModifiers.find((modifier) => modifier.isDefaultSelected)
      const fallbackModifier = groupModifiers[0]
      const selectedModifier = defaultModifier || (groupKey === 'SIZE' ? fallbackModifier : null)
      if (selectedModifier) {
        initialSelection[selectedModifier.id] = true
      }
    }

    setModifierSelection(initialSelection)
    setConfiguringProduct(product)
  }

  function toggleModifier(modifierId: string) {
    if (!configuringProduct) {
      return
    }

    const modifier = configuringProduct.modifiers.find((entry) => entry.id === modifierId)
    if (!modifier) {
      return
    }

    const groupKey = modifierSelectionGroupKey(modifier)
    const groupModifierIds = configuringProduct.modifiers
      .filter((entry) => modifierSelectionGroupKey(entry) === groupKey)
      .map((entry) => entry.id)

    setModifierSelection((current) => {
      const next = { ...current }
      const isCurrentlySelected = Boolean(current[modifierId])

      if (!isSizeModifier(modifier) && isCurrentlySelected) {
        next[modifierId] = false
        return next
      }

      for (const groupModifierId of groupModifierIds) {
        next[groupModifierId] = false
      }
      next[modifierId] = true
      return next
    })
  }

  function confirmConfiguredProduct() {
    if (!configuringProduct) {
      return
    }

    const sizeModifiers = configuringProduct.modifiers.filter(isSizeModifier)
    let finalModifiers = [...configuredModifiers]
    if (sizeModifiers.length > 0 && !finalModifiers.some(isSizeModifier)) {
      const fallbackSize =
        sizeModifiers.find((modifier) => modifier.isDefaultSelected) || sizeModifiers[0]
      if (fallbackSize) {
        finalModifiers = [...finalModifiers, fallbackSize]
      }
    }

    addConfiguredProduct(configuringProduct, finalModifiers)
    closeConfigurator()
  }

  function updateCartQuantity(key: string, delta: number) {
    setCart((current) =>
      current
        .map((entry) => (entry.key === key ? { ...entry, quantity: entry.quantity + delta } : entry))
        .filter((entry) => entry.quantity > 0)
    )
  }

  async function submitOrder() {
    if (!config) {
      return
    }

    if (cart.length === 0) {
      setError('Warenkorb ist leer.')
      return
    }

    if (!paymentMethod) {
      setError('Bitte Zahlungsart auswaehlen.')
      return
    }

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      const markPaid = paymentMethod === 'CARD'
      const forwardToKitchen = config.terminal.autoForwardToKitchen

      const order = await createPublicTerminalOrder(config.terminal.terminalCode, {
        items: cart.map((entry) => ({
          productId: entry.productId,
          quantity: entry.quantity,
          modifierIds: entry.selectedModifierIds,
        })),
        paymentMethod,
        markPaid,
        forwardToKitchen,
      })

      setCart([])
      setSuccess(
        `Bestellung #${order.id.slice(0, 6)} gespeichert | ${
          order.pickupNumber !== null
            ? `Abholnummer ${formatPickupNumber(order.pickupNumber)}`
            : 'Abholnummer wird bei Annahme vergeben'
        }${forwardToKitchen ? ' | an Kuechen-Display weitergeleitet.' : ''}`
      )
    } catch (submitError) {
      setError(
        submitError instanceof Error
          ? submitError.message
          : 'Bestellung konnte nicht erstellt werden'
      )
    } finally {
      setSaving(false)
    }
  }

  if (loading && !config) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-slate-100 px-6">
        <p className="text-slate-700">Terminal wird geladen...</p>
      </main>
    )
  }

  if (!config) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-slate-100 px-6">
        <p className="max-w-xl text-center text-slate-700">
          {error || 'Terminaldaten sind nicht verfuegbar.'}
        </p>
      </main>
    )
  }

  const layoutStyle = autoScaleEnabled
    ? {
        transform: `scale(${layoutScale})`,
        transformOrigin: 'top center',
        width: `${100 / layoutScale}%`,
        minHeight: viewportHeight ? `${viewportHeight / layoutScale}px` : undefined,
      }
    : undefined

  return (
    <main
      className="min-h-screen overflow-x-hidden px-3 py-4 text-slate-900 sm:px-4 sm:py-5 md:px-6"
      style={{
        background: `radial-gradient(circle at top, ${backgroundStart}, ${backgroundEnd} 58%)`,
      }}
    >
      <div className="fixed left-3 top-3 z-50 rounded-xl border border-cyan-200/55 bg-slate-950/85 px-3 py-2 text-[11px] text-cyan-100 shadow-lg backdrop-blur">
        <div className="font-semibold">Display Diagnose</div>
        <div>Route: <span className="font-mono">/terminal/[terminalCode]</span></div>
        <div>Renderer: <span className="font-mono">terminal-renderer-v1</span></div>
        <div>terminalCode: <span className="font-mono">{terminalCode || '-'}</span></div>
      </div>
      <div className="mx-auto max-w-7xl" style={layoutStyle}>
        {config.terminal.customerLogoUrl ? (
          <div className="mb-4 flex justify-center">
            <img
              src={config.terminal.customerLogoUrl}
              alt="Terminal Logo"
              className="max-h-20 max-w-[220px] object-contain"
            />
          </div>
        ) : null}

        {error ? (
          <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
            {error}
          </div>
        ) : null}

        {success ? (
          <div className="mb-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">
            {success}
          </div>
        ) : null}

        <div className="grid gap-6 lg:grid-cols-[minmax(0,1fr)_clamp(300px,30vw,400px)]">
          <section
            className="rounded-3xl border p-5 shadow-sm"
            style={{
              background: cardColor,
              borderColor: hexToRgba(accentColor, 0.2),
            }}
          >
            <div className="grid gap-3 md:grid-cols-2">
              <label className="block">
                <span className="mb-1 block text-sm font-medium text-slate-700">Suche</span>
                <input
                  value={search}
                  onChange={(event) => setSearch(event.target.value)}
                  placeholder="Name, Kategorie, Zutaten"
                  className="input-ui"
                />
              </label>

              <label className="block">
                <span className="mb-1 block text-sm font-medium text-slate-700">Kategorie</span>
                <select
                  value={categoryFilter}
                  onChange={(event) => setCategoryFilter(event.target.value)}
                  className="input-ui"
                >
                  <option value="ALL">Alle Kategorien</option>
                  {categoryOptions.map((category) => (
                    <option key={category} value={category}>
                      {category}
                    </option>
                  ))}
                </select>
              </label>
            </div>

            <div className="mt-4 grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
              {filteredProducts.length === 0 ? (
                <p className="col-span-full rounded-2xl border border-dashed border-slate-300 bg-slate-50 px-4 py-4 text-sm text-slate-600">
                  Keine Produkte gefunden.
                </p>
              ) : (
                filteredProducts.map((product) => (
                  <button
                    key={product.id}
                    type="button"
                    onClick={() => startAddProduct(product)}
                    className="terminal-product rounded-2xl border bg-gradient-to-b from-white to-slate-50 p-4 text-left transition"
                    style={{
                      borderColor: hexToRgba(accentColor, 0.16),
                    }}
                  >
                    <div className="flex items-start justify-between gap-3">
                      <div>
                        <p className="font-semibold text-slate-900">{product.name}</p>
                        <p className="text-xs text-slate-500">{resolveCategory(product)}</p>
                        {formatBeverageContainerType(product.beverageContainerType) ? (
                          <p className="mt-1 text-[11px] font-medium text-slate-500">
                            {formatBeverageContainerType(product.beverageContainerType)}
                          </p>
                        ) : null}
                      </div>
                      <span className="rounded-lg bg-white px-2 py-1 text-sm font-semibold ring-1 ring-slate-200">
                        {Number(product.price).toFixed(2)} EUR
                      </span>
                    </div>

                    {product.ingredients.length > 0 ? (
                      <details className="mt-2 text-xs text-slate-600">
                        <summary className="cursor-pointer font-medium text-slate-700">
                          Zutaten & Allergene anzeigen
                        </summary>
                        <ul className="mt-2 space-y-1">
                          {product.ingredients.map((ingredient) => (
                            <li key={`${product.id}-${ingredient.name}`} className="flex flex-wrap gap-1">
                              <span>{ingredient.name}</span>
                              {ingredient.allergens.map((allergen) => (
                                <span
                                  key={`${product.id}-${ingredient.name}-${allergen}`}
                                  className="rounded-md bg-orange-100 px-1.5 py-0.5 text-[10px] font-semibold text-orange-800"
                                >
                                  {allergen}
                                </span>
                              ))}
                            </li>
                          ))}
                        </ul>
                      </details>
                    ) : null}

                    {product.modifiers.length > 0 ? (
                      <p className="mt-2 text-xs font-medium text-orange-700">
                        {product.modifiers.filter(isSizeModifier).length > 0
                          ? `${product.modifiers.filter(isSizeModifier).length} Groessen + ${
                              product.modifiers.filter((entry) => !isSizeModifier(entry)).length
                            } Optionen`
                          : `${product.modifiers.length} Optionen verfuegbar`}
                      </p>
                    ) : null}
                  </button>
                ))
              )}
            </div>
          </section>

          <aside
            className="h-fit rounded-3xl border p-5 shadow-sm lg:sticky lg:top-4"
            style={{
              background: cardColor,
              borderColor: hexToRgba(accentColor, 0.2),
            }}
          >
            <h2 className="text-xl font-semibold">Warenkorb</h2>

            <div className="mt-4 space-y-3">
              {cart.length === 0 ? (
                <p className="rounded-2xl border border-dashed border-slate-300 bg-slate-50 px-4 py-4 text-sm text-slate-600">
                  Noch keine Produkte im Warenkorb.
                </p>
              ) : (
                cart.map((item) => (
                  <div
                    key={item.key}
                    className="rounded-2xl border border-slate-200 bg-slate-50 px-3 py-3"
                  >
                    <div className="flex items-start justify-between gap-3">
                      <div>
                        <p className="font-medium text-slate-900">{item.name}</p>
                        <p className="text-xs text-slate-500">
                          {formatMoney(item.unitPrice)} pro Stueck
                        </p>
                        {item.selectedModifiers.length > 0 ? (
                          <div className="mt-1 flex flex-wrap gap-1">
                            {item.selectedModifiers.map((modifier) => (
                              <span
                                key={modifier.id}
                                className="rounded-md bg-orange-100 px-2 py-0.5 text-[11px] text-orange-800"
                              >
                                {modifier.name} ({formatModifierDelta(modifier.priceDelta)})
                              </span>
                            ))}
                          </div>
                        ) : null}
                      </div>
                      <p className="font-semibold">
                        {formatMoney(item.unitPrice * item.quantity)}
                      </p>
                    </div>

                    <div className="mt-3 flex items-center gap-2">
                      <button
                        type="button"
                        onClick={() => updateCartQuantity(item.key, -1)}
                        className="h-8 w-8 rounded-lg bg-slate-200 text-lg"
                      >
                        -
                      </button>
                      <span className="min-w-[28px] text-center text-sm font-semibold">
                        {item.quantity}
                      </span>
                      <button
                        type="button"
                        onClick={() => updateCartQuantity(item.key, 1)}
                        className="h-8 w-8 rounded-lg bg-slate-200 text-lg"
                      >
                        +
                      </button>
                    </div>
                  </div>
                ))
              )}
            </div>

            <div className="mt-4 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-4">
              <p className="text-xs uppercase tracking-wide text-slate-500">Zahlungsart</p>
              <div className="mt-2 flex gap-2">
                {config.terminal.allowCardPayment ? (
                  <button
                    type="button"
                    onClick={() => setPaymentMethod('CARD')}
                    className={`rounded-xl px-3 py-2 text-sm font-medium transition ${
                      paymentMethod === 'CARD'
                        ? 'text-white'
                        : 'bg-white text-slate-700 ring-1 ring-slate-200 hover:bg-slate-100'
                    }`}
                    style={
                      paymentMethod === 'CARD'
                        ? {
                            background: accentColor,
                            borderColor: accentColor,
                          }
                        : undefined
                    }
                  >
                    Karte
                  </button>
                ) : null}
                {config.terminal.allowCashPayment ? (
                  <button
                    type="button"
                    onClick={() => setPaymentMethod('CASH')}
                    className={`rounded-xl px-3 py-2 text-sm font-medium transition ${
                      paymentMethod === 'CASH'
                        ? 'text-white'
                        : 'bg-white text-slate-700 ring-1 ring-slate-200 hover:bg-slate-100'
                    }`}
                    style={
                      paymentMethod === 'CASH'
                        ? {
                            background: accentColor,
                            borderColor: accentColor,
                          }
                        : undefined
                    }
                  >
                    Bar
                  </button>
                ) : null}
              </div>
            </div>

            <div className="mt-4 border-t border-slate-200 pt-4">
              <div className="mb-3 flex items-center justify-between text-lg font-bold">
                <span>Gesamt</span>
                <span>{formatMoney(total)}</span>
              </div>
              <button
                type="button"
                onClick={() => void submitOrder()}
                disabled={saving}
                className="w-full rounded-2xl px-4 py-3 font-semibold text-white transition disabled:cursor-not-allowed disabled:opacity-60"
                style={{
                  background: accentColor,
                }}
              >
                {saving ? 'Speichert...' : 'Bestellung abschicken'}
              </button>
            </div>
          </aside>
        </div>
      </div>

      {configuringProduct ? (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-slate-950/55 px-4">
          <div className="w-full max-w-xl rounded-3xl bg-white p-5 shadow-2xl ring-1 ring-slate-200">
            <div className="flex items-start justify-between gap-3">
              <div>
                <h2 className="text-xl font-semibold text-slate-900">{configuringProduct.name}</h2>
                <p className="text-sm text-slate-500">
                  Basispreis: {Number(configuringProduct.price).toFixed(2)} EUR
                </p>
              </div>
              <button
                type="button"
                onClick={closeConfigurator}
                className="rounded-lg bg-slate-100 px-3 py-1.5 text-sm text-slate-700 hover:bg-slate-200"
              >
                Schliessen
              </button>
            </div>

            <div className="mt-4 space-y-3">
              {configuringProduct.modifiers.length === 0 ? (
                <p className="text-sm text-slate-500">Keine Optionen verfuegbar.</p>
              ) : (
                <>
                  {configuringSizeModifiers.length > 0 ? (
                    <div className="space-y-2">
                      <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">
                        Groesse waehlen
                      </p>
                      {configuringSizeModifiers.map((modifier) => (
                        <label
                          key={modifier.id}
                          className="flex items-center justify-between gap-3 rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm"
                        >
                          <span className="flex items-center gap-2">
                            <input
                              type="radio"
                              name="size-modifier"
                              checked={Boolean(modifierSelection[modifier.id])}
                              onChange={() => toggleModifier(modifier.id)}
                            />
                            <span>{modifier.name}</span>
                          </span>
                          <span className="font-medium text-slate-700">
                            {formatModifierDelta(modifier.priceDelta)}
                          </span>
                        </label>
                      ))}
                    </div>
                  ) : null}

                  {configuringExtraModifiers.length > 0 ? (
                    <div className="space-y-2">
                      <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">
                        Zusaetzliche Optionen
                      </p>
                      {configuringExtraModifiers.map((modifier) => (
                        <label
                          key={modifier.id}
                          className="flex items-center justify-between gap-3 rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm"
                        >
                          <span className="flex items-center gap-2">
                            <input
                              type="checkbox"
                              checked={Boolean(modifierSelection[modifier.id])}
                              onChange={() => toggleModifier(modifier.id)}
                            />
                            <span>
                              {modifier.name}
                              {modifier.ingredientName ? ` (${modifier.ingredientName})` : ''}
                            </span>
                          </span>
                          <span className="font-medium text-slate-700">
                            {formatModifierDelta(modifier.priceDelta)}
                          </span>
                        </label>
                      ))}
                    </div>
                  ) : null}
                </>
              )}
            </div>

            <div className="mt-4 flex items-center justify-between rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3">
              <p className="text-sm text-slate-600">Preis mit Auswahl</p>
              <p className="text-xl font-bold text-slate-900">{formatMoney(configuredUnitPrice)}</p>
            </div>

            <div className="mt-4 flex justify-end gap-2">
              <button
                type="button"
                onClick={closeConfigurator}
                className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 transition hover:bg-slate-100"
              >
                Abbrechen
              </button>
              <button
                type="button"
                onClick={confirmConfiguredProduct}
                className="rounded-xl px-4 py-2 text-sm font-semibold text-white transition"
                style={{
                  background: accentColor,
                }}
              >
                In den Warenkorb
              </button>
            </div>
          </div>
        </div>
      ) : null}

      <style jsx global>{`
        .input-ui {
          width: 100%;
          border-radius: 0.75rem;
          border: 1px solid rgb(203 213 225);
          background: white;
          padding: 0.55rem 0.7rem;
          font-size: 0.93rem;
          outline: none;
          transition: 0.2s ease;
        }
        .input-ui:focus {
          border-color: ${accentColor};
          box-shadow: 0 0 0 4px ${hexToRgba(accentColor, 0.16)};
        }
        .terminal-product:hover {
          border-color: ${accentColor} !important;
          box-shadow: 0 10px 22px ${hexToRgba(accentColor, 0.18)};
          transform: translateY(-1px);
        }
      `}</style>
    </main>
  )
}
