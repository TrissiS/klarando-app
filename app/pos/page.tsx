'use client'

import { useEffect, useMemo, useState } from 'react'
import { createOrder, getProducts, type Product } from '@/lib/api'

type CartItem = {
  productId: string
  name: string
  price: number
  quantity: number
}

export default function PosPage() {
  const [products, setProducts] = useState<Product[]>([])
  const [cart, setCart] = useState<CartItem[]>([])
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  async function loadProducts() {
    try {
      setLoading(true)
      setError('')

      const data = await getProducts({ availableOnly: true })
      setProducts(data)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Fehler beim Laden der Produkte')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadProducts()
  }, [])

  function addToCart(product: Product) {
    const price = Number(product.price)

    setCart((prev) => {
      const existing = prev.find((item) => item.productId === product.id)

      if (existing) {
        return prev.map((item) =>
          item.productId === product.id
            ? { ...item, quantity: item.quantity + 1 }
            : item
        )
      }

      return [
        ...prev,
        {
          productId: product.id,
          name: product.name,
          price,
          quantity: 1,
        },
      ]
    })
  }

  function increaseQuantity(productId: string) {
    setCart((prev) =>
      prev.map((item) =>
        item.productId === productId
          ? { ...item, quantity: item.quantity + 1 }
          : item
      )
    )
  }

  function decreaseQuantity(productId: string) {
    setCart((prev) =>
      prev
        .map((item) =>
          item.productId === productId
            ? { ...item, quantity: item.quantity - 1 }
            : item
        )
        .filter((item) => item.quantity > 0)
    )
  }

  function removeFromCart(productId: string) {
    setCart((prev) => prev.filter((item) => item.productId !== productId))
  }

  const total = useMemo(() => {
    return cart.reduce((sum, item) => sum + item.price * item.quantity, 0)
  }, [cart])

  async function handleSubmitOrder() {
    try {
      if (cart.length === 0) {
        setError('Warenkorb ist leer')
        return
      }

      setSaving(true)
      setError('')
      setSuccess('')

      await createOrder(
        cart.map((item) => ({
          productId: item.productId,
          quantity: item.quantity,
        }))
      )

      setCart([])
      setSuccess('Bestellung erfolgreich erstellt')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Fehler beim Erstellen der Bestellung')
    } finally {
      setSaving(false)
    }
  }

  return (
    <main className="min-h-screen bg-slate-100 p-6">
      <div className="mx-auto max-w-7xl">
        <div className="mb-6">
          <p className="text-sm font-medium text-orange-600">POS</p>
          <h1 className="text-3xl font-bold">Kasse</h1>
          <p className="mt-2 text-sm text-slate-500">
            Produkte auswählen und Bestellung direkt erfassen.
          </p>
        </div>

        {error && (
          <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
            {error}
          </div>
        )}

        {success && (
          <div className="mb-4 rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
            {success}
          </div>
        )}

        <div className="grid gap-6 lg:grid-cols-[1fr_380px]">
          <section className="rounded-3xl bg-white p-6 shadow-sm ring-1 ring-slate-200">
            <div className="mb-4 flex items-center justify-between">
              <h2 className="text-xl font-semibold">Produkte</h2>
            </div>

            {loading ? (
              <p className="text-sm text-slate-500">Lade Produkte...</p>
            ) : products.length === 0 ? (
              <p className="text-sm text-slate-500">Keine Produkte vorhanden.</p>
            ) : (
              <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
                {products.map((product) => (
                  <button
                    key={product.id}
                    onClick={() => addToCart(product)}
                    className="rounded-2xl border border-slate-200 bg-slate-50 p-4 text-left transition hover:bg-orange-50 hover:border-orange-200"
                  >
                    <div className="flex items-start justify-between gap-3">
                      <div>
                        <p className="font-semibold">{product.name}</p>
                        <p className="text-sm text-slate-500">
                          {product.category?.name ?? 'Keine Kategorie'}
                        </p>
                      </div>
                      <span className="rounded-xl bg-white px-3 py-1 text-sm font-semibold ring-1 ring-slate-200">
                        {product.price} €
                      </span>
                    </div>

                    <p className="mt-3 text-sm text-slate-500">
                      Nr. {product.productNumber || "-"}
                    </p>
                  </button>
                ))}
              </div>
            )}
          </section>

          <aside className="rounded-3xl bg-white p-6 shadow-sm ring-1 ring-slate-200">
            <div className="mb-4">
              <h2 className="text-xl font-semibold">Warenkorb</h2>
              <p className="mt-1 text-sm text-slate-500">
                Ausgewählte Produkte für die Bestellung.
              </p>
            </div>

            {cart.length === 0 ? (
              <p className="text-sm text-slate-500">Noch nichts im Warenkorb.</p>
            ) : (
              <div className="space-y-4">
                {cart.map((item) => (
                  <div
                    key={item.productId}
                    className="rounded-2xl border border-slate-200 bg-slate-50 p-4"
                  >
                    <div className="flex items-start justify-between gap-3">
                      <div>
                        <p className="font-semibold">{item.name}</p>
                        <p className="text-sm text-slate-500">
                          {item.price.toFixed(2)} € pro Stück
                        </p>
                      </div>

                      <button
                        onClick={() => removeFromCart(item.productId)}
                        className="text-sm text-red-600 hover:text-red-700"
                      >
                        Entfernen
                      </button>
                    </div>

                    <div className="mt-4 flex items-center justify-between">
                      <div className="flex items-center gap-2">
                        <button
                          onClick={() => decreaseQuantity(item.productId)}
                          className="h-9 w-9 rounded-xl bg-slate-200 text-lg"
                        >
                          -
                        </button>
                        <span className="min-w-[24px] text-center font-semibold">
                          {item.quantity}
                        </span>
                        <button
                          onClick={() => increaseQuantity(item.productId)}
                          className="h-9 w-9 rounded-xl bg-slate-200 text-lg"
                        >
                          +
                        </button>
                      </div>

                      <p className="font-semibold">
                        {(item.price * item.quantity).toFixed(2)} €
                      </p>
                    </div>
                  </div>
                ))}

                <div className="border-t border-slate-200 pt-4">
                  <div className="mb-4 flex items-center justify-between text-lg font-bold">
                    <span>Gesamt</span>
                    <span>{total.toFixed(2)} €</span>
                  </div>

                  <button
                    onClick={handleSubmitOrder}
                    disabled={saving}
                    className="w-full rounded-2xl bg-orange-600 px-4 py-3 font-semibold text-white transition hover:bg-orange-700 disabled:opacity-60"
                  >
                    {saving ? 'Speichert...' : 'Bestellung abschicken'}
                  </button>
                </div>
              </div>
            )}
          </aside>
        </div>
      </div>
    </main>
  )
}
function printOrder(order: any) {
  const printWindow = window.open('', '_blank')

  if (!printWindow) return

  printWindow.document.write(`
    <html>
      <head>
        <title>Bon</title>
      </head>
      <body>
        <div id="print-root"></div>
      </body>
    </html>
  `)

  printWindow.document.close()

  setTimeout(() => {
    printWindow.print()
    printWindow.close()
  }, 300)
}
