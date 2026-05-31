'use client'

import { useEffect, useMemo, useState } from 'react'
import { getOrders, updateOrderStatus } from '@/lib/api'

type KitchenOrder = {
  id: string
  publicOrderCode?: string | null
  status: string
  total: string
  createdAt: string
  items: {
    id: string
    quantity: number
    product: {
      name: string
    }
  }[]
}

export default function KitchenPage() {
  const [orders, setOrders] = useState<KitchenOrder[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  async function loadOrders() {
    try {
      setLoading(true)
      setError('')

      const data = await getOrders()
      setOrders(data)
    } catch (err) {
      console.error(err)
      setError(err instanceof Error ? err.message : 'Bestellungen konnten nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  async function handleStatusChange(
    orderId: string,
    status: 'open' | 'preparing' | 'done' | 'archived'
  ) {
    try {
      setError('')
      await updateOrderStatus(orderId, status)
      await loadOrders()
    } catch (err) {
      console.error(err)
      setError(err instanceof Error ? err.message : 'Status konnte nicht aktualisiert werden')
    }
  }

  useEffect(() => {
    loadOrders()

    const interval = setInterval(loadOrders, 3000)
    return () => clearInterval(interval)
  }, [])

  const openOrders = useMemo(
    () => orders.filter((order) => order.status === 'open'),
    [orders]
  )

  const preparingOrders = useMemo(
    () => orders.filter((order) => order.status === 'preparing'),
    [orders]
  )

  const doneOrders = useMemo(
    () => orders.filter((order) => order.status === 'done'),
    [orders]
  )

  return (
    <main className="min-h-screen bg-slate-950 p-6 text-white">
      <div className="mx-auto max-w-7xl">
        <div className="mb-6">
          <p className="text-sm font-medium text-orange-400">Kitchen Board</p>
          <h1 className="text-3xl font-bold">Küche</h1>
          <p className="mt-2 text-sm text-slate-400">
            Bestellungen nach Status verwalten.
          </p>
        </div>

        {error && (
          <div className="mb-4 rounded-2xl border border-red-400/30 bg-red-500/10 px-4 py-3 text-sm text-red-200">
            {error}
          </div>
        )}

        {loading ? (
          <p className="text-slate-300">Lade Bestellungen...</p>
        ) : (
          <div className="grid gap-6 lg:grid-cols-3">
            <StatusColumn
              title="Offen"
              tone="yellow"
              orders={openOrders}
              emptyText="Keine offenen Bestellungen"
              renderActions={(order) => (
                <button
                  onClick={() => handleStatusChange(order.id, 'preparing')}
                  className="rounded-xl bg-blue-600 px-3 py-2 text-sm font-semibold text-white transition hover:bg-blue-700"
                >
                  In Arbeit
                </button>
              )}
            />

            <StatusColumn
              title="In Arbeit"
              tone="blue"
              orders={preparingOrders}
              emptyText="Keine Bestellungen in Arbeit"
              renderActions={(order) => (
                <div className="flex flex-wrap gap-2">
                  <button
                    onClick={() => handleStatusChange(order.id, 'done')}
                    className="rounded-xl bg-green-600 px-3 py-2 text-sm font-semibold text-white transition hover:bg-green-700"
                  >
                    Fertig
                  </button>
                  <button
                    onClick={() => handleStatusChange(order.id, 'open')}
                    className="rounded-xl bg-yellow-500 px-3 py-2 text-sm font-semibold text-black transition hover:bg-yellow-400"
                  >
                    Zurück
                  </button>
                </div>
              )}
            />

            <StatusColumn
              title="Fertig"
              tone="green"
              orders={doneOrders}
              emptyText="Keine fertigen Bestellungen"
              renderActions={(order) => (
                <div className="flex flex-wrap gap-2">
                  <button
                    onClick={() => handleStatusChange(order.id, 'archived')}
                    className="rounded-xl bg-slate-700 px-3 py-2 text-sm font-semibold text-white transition hover:bg-slate-600"
                  >
                    Archivieren
                  </button>

                  <button
                    onClick={() => handleStatusChange(order.id, 'open')}
                    className="rounded-xl bg-yellow-500 px-3 py-2 text-sm font-semibold text-black transition hover:bg-yellow-400"
                  >
                    Wieder öffnen
                  </button>
                </div>
              )}
            />
          </div>
        )}
      </div>
    </main>
  )
}

function StatusColumn({
  title,
  tone,
  orders,
  emptyText,
  renderActions,
}: {
  title: string
  tone: 'yellow' | 'blue' | 'green'
  orders: KitchenOrder[]
  emptyText: string
  renderActions: (order: KitchenOrder) => React.ReactNode
}) {
  const toneMap = {
    yellow: 'border-yellow-400/30 bg-yellow-500/10 text-yellow-300',
    blue: 'border-blue-400/30 bg-blue-500/10 text-blue-300',
    green: 'border-green-400/30 bg-green-500/10 text-green-300',
  }

  return (
    <section className="rounded-3xl border border-slate-800 bg-slate-900 p-4">
      <div className={`mb-4 rounded-2xl border px-4 py-3 ${toneMap[tone]}`}>
        <div className="flex items-center justify-between gap-3">
          <h2 className="text-lg font-bold">{title}</h2>
          <span className="rounded-full bg-black/20 px-3 py-1 text-sm font-semibold">
            {orders.length}
          </span>
        </div>
      </div>

      <div className="space-y-4">
        {orders.length === 0 ? (
          <div className="rounded-2xl border border-dashed border-slate-700 p-6 text-center text-sm text-slate-400">
            {emptyText}
          </div>
        ) : (
          orders.map((order) => (
            <OrderCard key={order.id} order={order}>
              {renderActions(order)}
            </OrderCard>
          ))
        )}
      </div>
    </section>
  )
}

function OrderCard({
  order,
  children,
}: {
  order: KitchenOrder
  children: React.ReactNode
}) {
  return (
    <div className="rounded-3xl border border-slate-700 bg-slate-800 p-5 shadow-lg">
      <div className="mb-4 flex items-start justify-between gap-3">
        <div>
          <p className="text-sm text-slate-400">Bestellung</p>
          <h3 className="text-xl font-bold">
            #{(order.publicOrderCode?.trim() || order.id.slice(0, 6)).toUpperCase()}
          </h3>
        </div>
        <div className="text-right">
          <p className="text-sm text-slate-400">Uhrzeit</p>
          <p className="font-medium">
            {new Date(order.createdAt).toLocaleTimeString()}
          </p>
        </div>
      </div>

      <div className="space-y-2 rounded-2xl bg-slate-900/50 p-4">
        {order.items.map((item) => (
          <div key={item.id} className="flex items-center justify-between gap-3">
            <span className="font-medium">{item.product.name}</span>
            <span className="rounded-lg bg-slate-700 px-2 py-1 text-sm">
              x{item.quantity}
            </span>
          </div>
        ))}
      </div>

      <div className="mt-4 flex items-center justify-between border-t border-slate-700 pt-4">
        <span className="text-slate-400">Gesamt</span>
        <span className="text-lg font-bold">{order.total} €</span>
      </div>

      <div className="mt-4">{children}</div>
    </div>
  )
}
