'use client'

import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'

type Props = {
  categoriesCount: number
  productsCount: number
  ingredientsCount: number
  suppliersCount: number
  actionsCount: number
  screenDevicesCount: number
  screenVisibleProductsCount: number
  orderTerminalCount: number
  orderDisplayCount: number
  checkoutReadyTerminalCount: number
  storageScope?: string
  visibleCardIds?: string[]
  reorderEnabled?: boolean
}

type StatItem = {
  id: string
  label: string
  value: number
  hint: string
  href: string
  sourceLabel: string
}

const STORAGE_KEY_BASE = 'klarando.admin.dashboard.stats.order.v1'

export default function AdminStats({
  categoriesCount,
  productsCount,
  ingredientsCount,
  suppliersCount,
  actionsCount,
  screenDevicesCount,
  screenVisibleProductsCount,
  orderTerminalCount,
  orderDisplayCount,
  checkoutReadyTerminalCount,
  storageScope,
  visibleCardIds,
  reorderEnabled = false,
}: Props) {
  const [draggingCardId, setDraggingCardId] = useState<string | null>(null)
  const items = useMemo<StatItem[]>(
    () => [
      {
        id: 'categories',
        label: 'Kategorien',
        value: categoriesCount,
        hint: 'Menüstruktur',
        href: '/admin/products?tab=categories',
        sourceLabel: 'Quelle öffnen',
      },
      {
        id: 'products',
        label: 'Produkte',
        value: productsCount,
        hint: 'Artikel im System',
        href: '/admin/products?tab=products',
        sourceLabel: 'Quelle öffnen',
      },
      {
        id: 'ingredients',
        label: 'Zutaten',
        value: ingredientsCount,
        hint: 'Basis für Kalkulation',
        href: '/admin/products?tab=ingredients',
        sourceLabel: 'Quelle öffnen',
      },
      {
        id: 'suppliers',
        label: 'Lieferanten',
        value: suppliersCount,
        hint: 'Stammdaten Einkauf',
        href: '/admin/stock?tab=suppliers',
        sourceLabel: 'Quelle öffnen',
      },
      {
        id: 'actions',
        label: 'Aktionen',
        value: actionsCount,
        hint: 'Angebote und Rabatte',
        href: '/admin/actions',
        sourceLabel: 'Quelle öffnen',
      },
      {
        id: 'screens-active',
        label: 'Bildschirme aktiv',
        value: screenDevicesCount,
        hint: 'Verbundene Ausspielgeräte',
        href: '/admin/screen',
        sourceLabel: 'Quelle öffnen',
      },
      {
        id: 'screen-products',
        label: 'Sichtbar auf Screen',
        value: screenVisibleProductsCount,
        hint: 'Aktive Bildschirm-Produkte',
        href: '/admin/screen',
        sourceLabel: 'Quelle öffnen',
      },
      {
        id: 'terminals',
        label: 'Bestellterminals',
        value: orderTerminalCount,
        hint: 'Self-Order Geräte',
        href: '/admin/terminals',
        sourceLabel: 'Quelle öffnen',
      },
      {
        id: 'order-displays',
        label: 'Bestell-Displays',
        value: orderDisplayCount,
        hint: 'Küchen- und Ausgabedisplays',
        href: '/admin/order-displays',
        sourceLabel: 'Quelle öffnen',
      },
      {
        id: 'checkout-ready',
        label: 'Direkt abrechenbar',
        value: checkoutReadyTerminalCount,
        hint: 'Aktive Terminals mit Zahlung',
        href: '/admin/terminals',
        sourceLabel: 'Quelle öffnen',
      },
    ],
    [
      categoriesCount,
      productsCount,
      ingredientsCount,
      suppliersCount,
      actionsCount,
      screenDevicesCount,
      screenVisibleProductsCount,
      orderTerminalCount,
      orderDisplayCount,
      checkoutReadyTerminalCount,
    ]
  )

  const filteredItems = useMemo(() => {
    if (!visibleCardIds || visibleCardIds.length === 0) {
      return items
    }
    const allowed = new Set(visibleCardIds)
    return items.filter((item) => allowed.has(item.id))
  }, [items, visibleCardIds])
  const itemIds = useMemo(() => filteredItems.map((item) => item.id), [filteredItems])
  const [cardOrder, setCardOrder] = useState<string[]>(itemIds)
  const storageKey = `${STORAGE_KEY_BASE}:${storageScope || 'default'}`

  useEffect(() => {
    setCardOrder((current) => {
      const missing = itemIds.filter((id) => !current.includes(id))
      const cleaned = current.filter((id) => itemIds.includes(id))
      return [...cleaned, ...missing]
    })
  }, [itemIds])

  useEffect(() => {
    try {
      const raw = window.localStorage.getItem(storageKey)
      if (!raw) {
        return
      }

      const parsed = JSON.parse(raw) as string[]
      if (!Array.isArray(parsed)) {
        return
      }

      const filtered = parsed.filter((id) => itemIds.includes(id))
      const missing = itemIds.filter((id) => !filtered.includes(id))
      setCardOrder([...filtered, ...missing])
    } catch {
      // ignore malformed local storage
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  useEffect(() => {
    window.localStorage.setItem(storageKey, JSON.stringify(cardOrder))
  }, [cardOrder, storageKey])

  function moveCard(sourceId: string, targetId: string) {
    if (!sourceId || !targetId || sourceId === targetId) {
      return
    }

    setCardOrder((current) => {
      const sourceIndex = current.indexOf(sourceId)
      const targetIndex = current.indexOf(targetId)
      if (sourceIndex < 0 || targetIndex < 0) {
        return current
      }

      const next = [...current]
      const [moved] = next.splice(sourceIndex, 1)
      next.splice(targetIndex, 0, moved)
      return next
    })
  }

  const itemById = useMemo(
    () => new Map(filteredItems.map((item) => [item.id, item])),
    [filteredItems]
  )

  if (filteredItems.length === 0) {
    return (
      <div className="rounded-3xl border border-dashed border-[var(--brand-border)] bg-rose-50/70 px-4 py-4 text-sm text-rose-900/80">
        Keine Daten vorhanden.
      </div>
    )
  }

  return (
    <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-10">
      {cardOrder.map((cardId) => {
        const item = itemById.get(cardId)
        if (!item) {
          return null
        }

        return (
          <div
            key={item.id}
            draggable={reorderEnabled}
            onDragStart={reorderEnabled ? () => setDraggingCardId(item.id) : undefined}
            onDragEnd={reorderEnabled ? () => setDraggingCardId(null) : undefined}
            onDragOver={reorderEnabled ? (event) => event.preventDefault() : undefined}
            onDrop={
              reorderEnabled
                ? () => {
                    if (!draggingCardId) return
                    moveCard(draggingCardId, item.id)
                    setDraggingCardId(null)
                  }
                : undefined
            }
            className={`rounded-3xl border-2 p-5 shadow-sm ring-1 transition ${
              reorderEnabled && draggingCardId === item.id
                ? 'border-orange-300 bg-orange-50/50 ring-orange-100'
                : `border-transparent bg-white ring-[var(--brand-border)] ${
                    reorderEnabled ? 'hover:border-[var(--brand-border)]' : ''
                  }`
            }`}
          >
            <p className="text-sm text-rose-900/70">{item.label}</p>
            <p className="mt-2 text-3xl font-bold">{item.value}</p>
            <p className="mt-1 text-sm text-slate-400">{item.hint}</p>
            <div className="mt-3">
              <Link
                href={item.href}
                className="inline-flex items-center rounded-lg border border-[var(--brand-border)] bg-white px-2.5 py-1 text-xs font-semibold text-[var(--brand-ink)] transition hover:bg-rose-50/60"
              >
                {item.sourceLabel}
              </Link>
            </div>
          </div>
        )
      })}
    </div>
  )
}
