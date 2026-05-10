'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import OrderDetailsModal from '@/app/Components/admin/OrderDetailsModal'
import {
  getChains,
  getManagedTenants,
  getOrderManagementList,
  type Order,
  type ManagedChain,
  type ManagedTenant,
  type OrderManagementResponse,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

const SOURCE_OPTIONS = [
  { value: 'ALL', label: 'Alle Kanäle' },
  { value: 'APP_ONLY', label: 'Nur App/Lieferung' },
  { value: 'TERMINAL_ONLY', label: 'Nur Terminal' },
  { value: 'POS', label: 'POS' },
  { value: 'APP', label: 'APP' },
  { value: 'DELIVERY', label: 'DELIVERY' },
  { value: 'TERMINAL', label: 'TERMINAL' },
]

const STATUS_OPTIONS = [
  { value: 'all', label: 'Alle Status' },
  { value: 'pending_payment', label: 'Wartet auf Zahlung' },
  { value: 'open', label: 'Offen' },
  { value: 'preparing', label: 'In Zubereitung' },
  { value: 'out_for_delivery', label: 'Fahrer unterwegs' },
  { value: 'done', label: 'Fertig' },
  { value: 'archived', label: 'Archiviert' },
]

const PAYMENT_OPTIONS = [
  { value: 'all', label: 'Alle Zahlungen' },
  { value: 'PAID', label: 'Bezahlt' },
  { value: 'UNPAID', label: 'Unbezahlt' },
]

const SERVICE_OPTIONS = [
  { value: 'all', label: 'Alle Services' },
  { value: 'DELIVERY', label: 'Lieferung' },
  { value: 'PICKUP', label: 'Abholung' },
]

function formatDateTime(value: string | null | undefined) {
  if (!value) return '-'
  const date = new Date(value)
  return Number.isNaN(date.getTime()) ? '-' : date.toLocaleString('de-DE')
}

function formatMoney(value: number | string) {
  const parsed =
    typeof value === 'number'
      ? value
      : Number.parseFloat(String(value).replace(',', '.'))
  const safe = Number.isFinite(parsed) ? parsed : 0
  return `${safe.toFixed(2)} EUR`
}

function statusLabel(status: string) {
  switch (status) {
    case 'pending_payment':
      return 'Wartet auf Zahlung'
    case 'open':
      return 'Offen'
    case 'preparing':
      return 'In Zubereitung'
    case 'out_for_delivery':
      return 'Fahrer unterwegs'
    case 'done':
      return 'Fertig'
    case 'archived':
      return 'Archiviert'
    default:
      return status
  }
}

function sourceLabel(source: string) {
  switch (source) {
    case 'APP':
      return 'App'
    case 'DELIVERY':
      return 'Lieferung'
    case 'TERMINAL':
      return 'Bestellterminal'
    case 'POS':
      return 'POS'
    default:
      return source
  }
}

export default function SuperadminOrdersPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [tenants, setTenants] = useState<ManagedTenant[]>([])
  const [chains, setChains] = useState<ManagedChain[]>([])
  const [selectedTenantId, setSelectedTenantId] = useState('')
  const [selectedChainId, setSelectedChainId] = useState('')
  const [selectedSource, setSelectedSource] = useState('ALL')
  const [selectedStatus, setSelectedStatus] = useState('all')
  const [selectedPaymentStatus, setSelectedPaymentStatus] = useState('all')
  const [selectedServiceType, setSelectedServiceType] = useState('all')
  const [searchText, setSearchText] = useState('')
  const [loading, setLoading] = useState(true)
  const [refreshing, setRefreshing] = useState(false)
  const [error, setError] = useState('')
  const [data, setData] = useState<OrderManagementResponse | null>(null)
  const [selectedOrder, setSelectedOrder] = useState<Order | null>(null)

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null

    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }

    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    setSession(parsed)
    setToken(accessToken)
  }, [])

  const tenantNameById = useMemo(
    () => new Map(tenants.map((entry) => [entry.id, entry.name])),
    [tenants]
  )

  const filteredTenants = useMemo(() => {
    if (!selectedChainId) return tenants
    return tenants.filter((entry) => entry.chainId === selectedChainId)
  }, [tenants, selectedChainId])

  useEffect(() => {
    if (!selectedTenantId) return
    if (filteredTenants.some((entry) => entry.id === selectedTenantId)) return
    setSelectedTenantId('')
  }, [filteredTenants, selectedTenantId])

  async function loadReferenceData(accessToken: string) {
    const [loadedTenants, loadedChains] = await Promise.all([
      getManagedTenants(accessToken),
      getChains(accessToken),
    ])
    setTenants(loadedTenants)
    setChains(loadedChains)
  }

  async function loadOrders(options?: { silent?: boolean }) {
    const silent = options?.silent ?? false
    try {
      if (!silent) {
        setLoading(true)
      }
      setRefreshing(true)
      setError('')

      const response = await getOrderManagementList({
        tenantId: selectedTenantId || undefined,
        chainId: selectedChainId || undefined,
        source: selectedSource,
        status: selectedStatus,
        limit: 300,
      })
      setData(response)
    } catch (loadError) {
      const message =
        loadError instanceof Error ? loadError.message : 'Bestellungen konnten nicht geladen werden'
      setError(message)
    } finally {
      setLoading(false)
      setRefreshing(false)
    }
  }

  useEffect(() => {
    if (!token) return
    let cancelled = false

    ;(async () => {
      try {
        await loadReferenceData(token)
        if (!cancelled) {
          await loadOrders()
        }
      } catch (loadError) {
        if (cancelled) return
        const message =
          loadError instanceof Error ? loadError.message : 'Grunddaten konnten nicht geladen werden'
        setError(message)
        setLoading(false)
      }
    })()

    return () => {
      cancelled = true
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [token])

  useEffect(() => {
    if (!token || loading) return
    void loadOrders({ silent: true })
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedTenantId, selectedChainId, selectedSource, selectedStatus])

  const displayedOrders = useMemo(() => {
    const normalizedSearch = searchText.trim().toLowerCase()

    return (data?.orders || []).filter((order) => {
      if (selectedPaymentStatus !== 'all' && order.paymentStatus !== selectedPaymentStatus) {
        return false
      }

      if (selectedServiceType !== 'all' && order.serviceType !== selectedServiceType) {
        return false
      }

      if (!normalizedSearch) {
        return true
      }

      const searchableText = [
        order.id,
        order.customerName || '',
        order.customerPhone || '',
        order.customerAddress || '',
        order.customerZipCode || '',
        order.customerCity || '',
        order.appCustomerAccount?.fullName || '',
        order.appCustomerAccount?.email || '',
        order.tenant?.name || '',
        order.tenant?.chain?.name || '',
        order.items.map((item) => item.product.name).join(' '),
      ]
        .join(' ')
        .toLowerCase()

      return searchableText.includes(normalizedSearch)
    })
  }, [data?.orders, searchText, selectedPaymentStatus, selectedServiceType])

  if (!session) {
    return null
  }

  const appOrders =
    data?.orders.filter(
      (entry) => entry.sourceChannel === 'APP' || entry.sourceChannel === 'DELIVERY'
    ) || []
  const terminalOrders = data?.orders.filter((entry) => entry.sourceChannel === 'TERMINAL') || []

  function resolveTenantName(order: Order) {
    return order.tenant?.name || tenantNameById.get(order.tenantId) || order.tenantId
  }

  function resolveChainName(order: Order) {
    return order.tenant?.chain?.name || '-'
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Bestellungen"
      subtitle="Alle App- und Terminalbestellungen kettenübergreifend auswerten"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      {error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}

      <section className="mb-5 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <h2 className="text-xl font-semibold text-[var(--brand-ink)]">Filter</h2>
        <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-6">
          <label className="block md:col-span-2 xl:col-span-2">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Suche</span>
            <input
              value={searchText}
              onChange={(event) => setSearchText(event.target.value)}
              placeholder="Bestellnr., Kunde, Produkt, Filiale..."
              className="input-ui"
            />
          </label>

          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Kette</span>
            <select
              value={selectedChainId}
              onChange={(event) => setSelectedChainId(event.target.value)}
              className="input-ui"
            >
              <option value="">Alle Ketten</option>
              {chains.map((entry) => (
                <option key={entry.id} value={entry.id}>
                  {entry.name}
                </option>
              ))}
            </select>
          </label>

          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Filiale</span>
            <select
              value={selectedTenantId}
              onChange={(event) => setSelectedTenantId(event.target.value)}
              className="input-ui"
            >
              <option value="">Alle Filialen</option>
              {filteredTenants.map((entry) => (
                <option key={entry.id} value={entry.id}>
                  {entry.name}
                </option>
              ))}
            </select>
          </label>

          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Kanal</span>
            <select
              value={selectedSource}
              onChange={(event) => setSelectedSource(event.target.value)}
              className="input-ui"
            >
              {SOURCE_OPTIONS.map((entry) => (
                <option key={entry.value} value={entry.value}>
                  {entry.label}
                </option>
              ))}
            </select>
          </label>

          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Status</span>
            <select
              value={selectedStatus}
              onChange={(event) => setSelectedStatus(event.target.value)}
              className="input-ui"
            >
              {STATUS_OPTIONS.map((entry) => (
                <option key={entry.value} value={entry.value}>
                  {entry.label}
                </option>
              ))}
            </select>
          </label>

          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Zahlung</span>
            <select
              value={selectedPaymentStatus}
              onChange={(event) => setSelectedPaymentStatus(event.target.value)}
              className="input-ui"
            >
              {PAYMENT_OPTIONS.map((entry) => (
                <option key={entry.value} value={entry.value}>
                  {entry.label}
                </option>
              ))}
            </select>
          </label>

          <label className="block">
            <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">Service</span>
            <select
              value={selectedServiceType}
              onChange={(event) => setSelectedServiceType(event.target.value)}
              className="input-ui"
            >
              {SERVICE_OPTIONS.map((entry) => (
                <option key={entry.value} value={entry.value}>
                  {entry.label}
                </option>
              ))}
            </select>
          </label>

          <div className="flex items-end">
            <button
              type="button"
              onClick={() => void loadOrders()}
              disabled={refreshing}
              className="w-full rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
            >
              {refreshing ? 'Aktualisiert...' : 'Aktualisieren'}
            </button>
          </div>
        </div>
      </section>

      <section className="mb-5 grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-xs uppercase tracking-wide text-rose-900/70">Gesamt</p>
          <p className="mt-2 text-3xl font-bold text-[var(--brand-ink)]">{data?.total || 0}</p>
        </article>
        <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-xs uppercase tracking-wide text-rose-900/70">App/Lieferung</p>
          <p className="mt-2 text-3xl font-bold text-emerald-700">{appOrders.length}</p>
        </article>
        <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-xs uppercase tracking-wide text-rose-900/70">Terminals</p>
          <p className="mt-2 text-3xl font-bold text-sky-700">{terminalOrders.length}</p>
        </article>
        <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-xs uppercase tracking-wide text-rose-900/70">Fertig</p>
          <p className="mt-2 text-3xl font-bold text-orange-600">{data?.byStatus.done || 0}</p>
        </article>
        <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-xs uppercase tracking-wide text-rose-900/70">Gefilterte Treffer</p>
          <p className="mt-2 text-3xl font-bold text-violet-700">{displayedOrders.length}</p>
        </article>
      </section>

      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <h2 className="text-xl font-semibold text-[var(--brand-ink)]">Bestellliste</h2>
        <p className="mt-1 text-xs text-rose-900/70">
          Tipp: Auf eine Bestellung klicken, um alle Details zu sehen und per E-Mail zu teilen.
        </p>
        {loading ? (
          <p className="mt-3 text-sm text-rose-900/75">Lade Bestellungen...</p>
        ) : displayedOrders.length === 0 ? (
          <p className="mt-3 rounded-2xl border border-dashed border-[var(--brand-border)] bg-rose-50/60 px-4 py-4 text-sm text-rose-900/75">
            Keine Bestellungen für den aktuellen Filter gefunden.
          </p>
        ) : (
          <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
            <table className="w-full min-w-[1440px] border-collapse">
              <thead>
                <tr>
                  <th className="th-ui">Zeit</th>
                  <th className="th-ui">Filiale</th>
                  <th className="th-ui">Kette</th>
                  <th className="th-ui">Kanal</th>
                  <th className="th-ui">Status</th>
                  <th className="th-ui">Kunde</th>
                  <th className="th-ui">Service</th>
                  <th className="th-ui">ETA</th>
                  <th className="th-ui">Zahlung</th>
                  <th className="th-ui">Summe</th>
                  <th className="th-ui">Artikel</th>
                </tr>
              </thead>
              <tbody>
                {displayedOrders.map((order) => {
                  const chainName = resolveChainName(order)
                  const tenantName = resolveTenantName(order)
                  const customerName = order.customerName || order.appCustomerAccount?.fullName || '-'
                  const serviceLabel =
                    order.serviceType === 'DELIVERY'
                      ? 'Lieferung'
                      : order.serviceType === 'PICKUP'
                      ? 'Abholung'
                      : '-'
                  const etaLabel = order.estimatedMinutes
                    ? `${order.estimatedMinutes} min (${formatDateTime(order.estimatedReadyAt)})`
                    : '-'
                  const paymentLabel = `${order.paymentMethod || '-'} | ${order.paymentStatus}`

                  return (
                    <tr
                      key={order.id}
                      role="button"
                      tabIndex={0}
                      onClick={() => setSelectedOrder(order)}
                      onKeyDown={(event) => {
                        if (event.key === 'Enter' || event.key === ' ') {
                          event.preventDefault()
                          setSelectedOrder(order)
                        }
                      }}
                      className="cursor-pointer transition hover:bg-rose-50/60"
                    >
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {formatDateTime(order.createdAt)}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{tenantName}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{chainName}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {sourceLabel(order.sourceChannel)}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {statusLabel(order.status)}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        <p>{customerName}</p>
                        <p className="text-xs text-rose-900/70">
                          {order.customerAddress
                            ? `${order.customerAddress}, ${order.customerZipCode || ''} ${order.customerCity || ''}`.trim()
                            : order.appCustomerAccount?.email || '-'}
                        </p>
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {serviceLabel}
                        {order.terminal?.name ? (
                          <p className="text-xs text-rose-900/70">Terminal: {order.terminal.name}</p>
                        ) : null}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{etaLabel}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{paymentLabel}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        <p>{formatMoney(order.total)}</p>
                        <p className="text-xs text-rose-900/70">
                          Zwischensumme {formatMoney(order.subtotal)} | Liefergebühr{' '}
                          {formatMoney(order.deliveryFee)}
                        </p>
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {order.items.map((item) => `${item.quantity}x ${item.product.name}`).join(', ')}
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        )}
      </section>
      {selectedOrder ? (
        <OrderDetailsModal
          order={selectedOrder}
          tenantName={resolveTenantName(selectedOrder)}
          chainName={resolveChainName(selectedOrder)}
          onClose={() => setSelectedOrder(null)}
        />
      ) : null}
    </BackofficeLayout>
  )
}


