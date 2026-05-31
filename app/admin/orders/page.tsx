'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import OrderDetailsModal from '@/app/Components/admin/OrderDetailsModal'
import {
  getChains,
  getManagedTenants,
  getOrderManagementList,
  resolveOrderComplaint,
  updateOrderStatus,
  type Order,
  type ManagedChain,
  type ManagedTenant,
  type OrderManagementResponse,
} from '@/lib/api'

type RoleScope = 'admin' | 'chainadmin' | 'superadmin' | 'staff'

const SOURCE_OPTIONS = [
  { value: 'ALL', label: 'Alle Kanaele' },
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

function displayOrderNumber(order: Order) {
  const publicCode = (order.publicOrderCode || '').trim().toUpperCase()
  if (publicCode) {
    return publicCode
  }
  const compact = order.id.replace(/-/g, '').slice(-8).toUpperCase()
  return compact || order.id
}

export default function AdminOrdersPage() {
  const [role, setRole] = useState<RoleScope>('admin')
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
  const [cancellingOrderId, setCancellingOrderId] = useState<string | null>(null)
  const [showOpenUnpaidOnly, setShowOpenUnpaidOnly] = useState(false)
  const [resolvingComplaintId, setResolvingComplaintId] = useState<string | null>(null)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [data, setData] = useState<OrderManagementResponse | null>(null)
  const [selectedOrder, setSelectedOrder] = useState<Order | null>(null)

  useEffect(() => {
    try {
      const rawSession = localStorage.getItem('sessionUser')
      const parsed = rawSession ? (JSON.parse(rawSession) as { role?: string; accessToken?: string }) : null
      const normalizedRole = (parsed?.role || '').trim().toLowerCase()
      if (
        normalizedRole === 'superadmin' ||
        normalizedRole === 'chainadmin' ||
        normalizedRole === 'staff' ||
        normalizedRole === 'admin'
      ) {
        setRole(normalizedRole)
      }
      setToken(parsed?.accessToken || localStorage.getItem('accessToken') || '')
    } catch {
      setToken(localStorage.getItem('accessToken') || '')
    }
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
    if (!accessToken) return
    const [loadedTenants, loadedChains] = await Promise.all([
      getManagedTenants(accessToken),
      role === 'superadmin' ? getChains(accessToken) : Promise.resolve([] as ManagedChain[]),
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
      setSuccess('')

      const response = await getOrderManagementList({
        tenantId: selectedTenantId || undefined,
        chainId: role === 'superadmin' ? selectedChainId || undefined : undefined,
        source: selectedSource,
        status: selectedStatus,
        limit: 300,
      })
      setData(response)
      return response
    } catch (loadError) {
      const messageRaw =
        loadError instanceof Error ? loadError.message : 'Bestellungen konnten nicht geladen werden'
      const message =
        messageRaw === 'Bestelluebersicht konnte nicht geladen werden'
          ? 'Bestellübersicht konnte nicht geladen werden. Bitte Filter prüfen oder erneut laden.'
          : messageRaw
      setError(message)
      return null
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
  }, [token, role])

  useEffect(() => {
    if (!token || loading) return
    void loadOrders({ silent: true })
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedTenantId, selectedChainId, selectedSource, selectedStatus])

  const appOrders = data?.orders.filter((entry) => entry.sourceChannel === 'APP' || entry.sourceChannel === 'DELIVERY') || []
  const terminalOrders = data?.orders.filter((entry) => entry.sourceChannel === 'TERMINAL') || []
  const complaintOpenOrders =
    data?.orders.filter((entry) => (entry.complaintOpen ?? false) || (entry.complaintCount ?? 0) > 0) || []
  const openUnpaidOrders =
    data?.orders.filter(
      (entry) =>
        entry.paymentStatus !== 'PAID' &&
        entry.status !== 'done' &&
        entry.status !== 'archived'
    ) || []
  const baseOrders = showOpenUnpaidOnly ? openUnpaidOrders : data?.orders || []

  const displayedOrders = useMemo(() => {
    const normalizedSearch = searchText.trim().toLowerCase()

    return baseOrders.filter((order) => {
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
        order.publicOrderCode || '',
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
  }, [baseOrders, searchText, selectedPaymentStatus, selectedServiceType])

  function resolveTenantName(order: Order) {
    return order.tenant?.name || tenantNameById.get(order.tenantId) || order.tenantId
  }

  function resolveChainName(order: Order) {
    return order.tenant?.chain?.name || '-'
  }

  async function handleCancelOrder(order: Order) {
    if (cancellingOrderId) return
    const tenantName = resolveTenantName(order)
    const confirmed = window.confirm(
      `Bestellung wirklich stornieren?\n\nFiliale: ${tenantName}\nBestellung: ${order.id}\nStatus: ${statusLabel(
        order.status
      )}\nZahlung: ${order.paymentStatus}`
    )
    if (!confirmed) return

    try {
      setCancellingOrderId(order.id)
      setError('')
      setSuccess('')
      await updateOrderStatus(order.id, 'archived')
      setSuccess(`Bestellung #${displayOrderNumber(order)} wurde storniert.`)
      await loadOrders({ silent: true })
      if (selectedOrder?.id === order.id) {
        setSelectedOrder(null)
      }
    } catch (cancelError) {
      setError(cancelError instanceof Error ? cancelError.message : 'Bestellung konnte nicht storniert werden')
    } finally {
      setCancellingOrderId(null)
    }
  }

  async function handleResolveComplaint(order: Order, complaintId: string) {
    if (!complaintId || resolvingComplaintId) return
    const confirmed = window.confirm(
      `Reklamation wirklich als erledigt markieren?\n\nBestellung: #${displayOrderNumber(order)}\nReklamation: ${complaintId}`
    )
    if (!confirmed) return

    try {
      setResolvingComplaintId(complaintId)
      setError('')
      setSuccess('')
      await resolveOrderComplaint(order.id, complaintId)
      setSuccess(`Reklamation ${complaintId} wurde als erledigt markiert.`)
      const refreshed = await loadOrders({ silent: true })
      const updatedOrder = refreshed?.orders.find((entry) => entry.id === order.id) || null
      setSelectedOrder(updatedOrder)
    } catch (resolveError) {
      setError(
        resolveError instanceof Error
          ? resolveError.message
          : 'Reklamation konnte nicht erledigt werden'
      )
    } finally {
      setResolvingComplaintId(null)
    }
  }

  return (
    <AdminLayout
      title="Bestellungen"
      subtitle="App- und Terminalbestellungen je Filiale verfolgen, offene unbezahlte Bestellungen einsehen und manuell stornieren"
    >
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

          {role === 'superadmin' ? (
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
          ) : null}

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

          <label className="flex items-end">
            <span className="w-full rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2.5 text-sm text-rose-900">
              <span className="flex items-center justify-between gap-2">
                <span>Nur offen + unbezahlt</span>
                <input
                  type="checkbox"
                  checked={showOpenUnpaidOnly}
                  onChange={(event) => setShowOpenUnpaidOnly(event.target.checked)}
                  className="h-4 w-4 accent-rose-600"
                />
              </span>
            </span>
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
          <p className="text-xs uppercase tracking-wide text-rose-900/70">Offen + unbezahlt</p>
          <p className="mt-2 text-3xl font-bold text-rose-700">{openUnpaidOrders.length}</p>
        </article>
        <article className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <p className="text-xs uppercase tracking-wide text-rose-900/70">Reklamationen</p>
          <p className="mt-2 text-3xl font-bold text-amber-700">{complaintOpenOrders.length}</p>
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
            Keine Bestellungen fuer den aktuellen Filter gefunden.
          </p>
        ) : (
          <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
            <table className="w-full min-w-[1700px] border-collapse">
              <thead>
                <tr>
                  <th className="th-ui">Zeit</th>
                  <th className="th-ui">Bestellnr.</th>
                  <th className="th-ui">Filiale</th>
                  <th className="th-ui">Kette</th>
                  <th className="th-ui">Kanal</th>
                  <th className="th-ui">Status</th>
                  <th className="th-ui">Kunde</th>
                  <th className="th-ui">Service</th>
                  <th className="th-ui">ETA</th>
                  <th className="th-ui">Zahlung</th>
                  <th className="th-ui">Summe</th>
                  <th className="th-ui">Reklamation</th>
                  <th className="th-ui">Signatur</th>
                  <th className="th-ui">Artikel</th>
                  <th className="th-ui">Aktion</th>
                </tr>
              </thead>
              <tbody>
                {displayedOrders.map((order) => {
                  const chainName = resolveChainName(order)
                  const tenantName = resolveTenantName(order)
                  const customerName = order.customerName || order.appCustomerAccount?.fullName || '-'
                  const serviceLabel = order.serviceType === 'DELIVERY' ? 'Lieferung' : order.serviceType === 'PICKUP' ? 'Abholung' : '-'
                  const etaLabel = order.estimatedMinutes
                    ? `${order.estimatedMinutes} min (${formatDateTime(order.estimatedReadyAt)})`
                    : '-'
                  const paymentLabel = `${order.paymentMethod || '-'} | ${order.paymentStatus}`
                  const canCancel =
                    order.paymentStatus !== 'PAID' &&
                    order.status !== 'done' &&
                    order.status !== 'archived'

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
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{formatDateTime(order.createdAt)}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm font-semibold">
                        #{displayOrderNumber(order)}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{tenantName}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{chainName}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{sourceLabel(order.sourceChannel)}</td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">{statusLabel(order.status)}</td>
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
                          Zwischensumme {formatMoney(order.subtotal)} | Liefergebuehr {formatMoney(order.deliveryFee)}
                        </p>
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {order.complaintOpen ? (
                          <span className="inline-flex rounded-full border border-amber-300 bg-amber-50 px-2 py-1 text-xs font-semibold text-amber-700">
                            Offen ({order.complaintCount || 1})
                          </span>
                        ) : (order.complaintCount || 0) > 0 ? (
                          <span className="inline-flex rounded-full border border-slate-300 bg-slate-50 px-2 py-1 text-xs font-semibold text-slate-600">
                            Vorhanden ({order.complaintCount})
                          </span>
                        ) : (
                          <span className="text-xs text-rose-900/60">-</span>
                        )}
                        {order.latestComplaintMessage ? (
                          <p className="mt-1 max-w-[220px] truncate text-xs text-rose-900/70" title={order.latestComplaintMessage}>
                            {order.latestComplaintMessage}
                          </p>
                        ) : null}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {order.signatureCaptured ? (
                          <span className="inline-flex rounded-full border border-emerald-300 bg-emerald-50 px-2 py-1 text-xs font-semibold text-emerald-700">
                            Ja
                          </span>
                        ) : (
                          <span className="text-xs text-rose-900/60">Nein</span>
                        )}
                        {order.signatureSignerName ? (
                          <p className="mt-1 text-xs text-rose-900/70">{order.signatureSignerName}</p>
                        ) : null}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {order.items.map((item) => `${item.quantity}x ${item.product.name}`).join(', ')}
                      </td>
                      <td className="border-t border-slate-100 px-3 py-2 text-sm">
                        {canCancel ? (
                          <button
                            type="button"
                            onClick={(event) => {
                              event.stopPropagation()
                              void handleCancelOrder(order)
                            }}
                            disabled={Boolean(cancellingOrderId)}
                            className="rounded-lg border border-rose-200 bg-rose-50 px-3 py-1.5 text-xs font-semibold text-rose-700 transition hover:bg-rose-100 disabled:cursor-not-allowed disabled:opacity-60"
                          >
                            {cancellingOrderId === order.id ? 'Storniert...' : 'Stornieren'}
                          </button>
                        ) : (
                          <span className="text-xs text-rose-900/60">-</span>
                        )}
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
          onResolveComplaint={(complaintId) => handleResolveComplaint(selectedOrder, complaintId)}
          resolvingComplaintId={resolvingComplaintId}
          onClose={() => setSelectedOrder(null)}
        />
      ) : null}
    </AdminLayout>
  )
}
