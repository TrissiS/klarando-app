'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import { API_BASE_URL } from '@/lib/config'
import {
  getAccessUsers,
  getStoredAccessToken,
  type AccessUser,
} from '@/lib/api'

type CustomerRow = {
  id: string
  name: string
  emailMasked: string | null
  status: string
  createdAt: string
  lastLoginAt: string | null
  orderCount: number
}

type CustomerDetail = {
  id: string
  fullName: string
  email: string | null
  phone: string | null
  street: string | null
  zipCode: string | null
  city: string | null
  marketingOptIn: boolean
  favorites?: Array<{ productId: string; productName: string | null; tenantName: string | null }>
  addresses?: Array<{ street: string | null; zipCode: string | null; city: string | null }>
  orders?: Array<{ id: string; status: string; total: number | null; createdAt: string }>
  loginProviders?: string[]
  pushStatus?: { hasPushTokens: boolean; tokenCount: number }
}

function formatDate(value: string | null) {
  if (!value) return '-'
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) return value
  return parsed.toLocaleString('de-DE')
}

export default function SuperadminCustomerManagementPage() {
  const [token, setToken] = useState('')
  const [tab, setTab] = useState<'internal' | 'customers'>('internal')
  const [query, setQuery] = useState('')
  const [users, setUsers] = useState<AccessUser[]>([])
  const [customers, setCustomers] = useState<CustomerRow[]>([])
  const [selectedCustomerId, setSelectedCustomerId] = useState('')
  const [customerDetail, setCustomerDetail] = useState<CustomerDetail | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')

  useEffect(() => {
    setToken(getStoredAccessToken() || '')
  }, [])

  async function api<T>(path: string, init?: RequestInit): Promise<T> {
    const response = await fetch(`${API_BASE_URL}${path}`, {
      ...init,
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${token}`,
        ...(init?.headers ?? {}),
      },
    })
    const payload = await response.json().catch(() => null)
    if (!response.ok) {
      throw new Error((payload as { error?: string } | null)?.error || 'API Fehler')
    }
    return payload as T
  }

  async function loadUsersAndCustomers() {
    if (!token) return
    try {
      setLoading(true)
      setError('')
      const [loadedUsers, customerPayload] = await Promise.all([
        getAccessUsers(token),
        api<{ customers: CustomerRow[] }>(
          `/api/superadmin/privacy/customers${query.trim() ? `?q=${encodeURIComponent(query.trim())}` : ''}`
        ),
      ])
      setUsers(loadedUsers)
      setCustomers(customerPayload.customers || [])
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Kundenverwaltung konnte nicht geladen werden.')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadUsersAndCustomers()
  }, [token])

  const filteredUsers = useMemo(() => {
    const q = query.trim().toLowerCase()
    return users.filter((entry) => {
      if (!q) return true
      return `${entry.name} ${entry.email} ${entry.role}`.toLowerCase().includes(q)
    })
  }, [users, query])

  const selectedCustomer = useMemo(
    () => customers.find((entry) => entry.id === selectedCustomerId) || null,
    [customers, selectedCustomerId]
  )

  useEffect(() => {
    if (!selectedCustomer) {
      return
    }
    console.log('SELECTED_CUSTOMER', selectedCustomer)
    console.log('CUSTOMER_DETAIL_RENDER', customerDetail)
  }, [selectedCustomer, customerDetail])

  async function openCustomerDetail(customerId: string) {
    if (!token) return
    try {
      const payload = await api<{ customer: CustomerDetail }>(
        `/api/superadmin/privacy/customers/${customerId}`
      )
      setSelectedCustomerId(customerId)
      setCustomerDetail(payload.customer)
      console.log('CUSTOMER_DETAIL_RENDER', payload.customer)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Kundendetail konnte nicht geladen werden.')
    }
  }

  async function exportCustomer(customerId: string) {
    if (!token) return
    try {
      const response = await fetch(`${API_BASE_URL}/api/superadmin/privacy/customers/${customerId}/export`, {
        headers: { Authorization: `Bearer ${token}` },
      })
      const payload = await response.json()
      if (!response.ok) {
        throw new Error((payload as { error?: string }).error || 'Export fehlgeschlagen.')
      }
      const data = JSON.stringify(payload, null, 2)
      const blob = new Blob([data], { type: 'application/json' })
      const url = URL.createObjectURL(blob)
      const anchor = document.createElement('a')
      anchor.href = url
      anchor.download = `klarando-customer-export-${customerId}.json`
      anchor.click()
      URL.revokeObjectURL(url)
      setInfo('DSGVO Export wurde heruntergeladen.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Export fehlgeschlagen.')
    }
  }

  async function anonymizeCustomer(customerId: string) {
    const reason = window.prompt('Grund für Anonymisierung (Pflichtfeld):')?.trim()
    if (!reason) return
    const confirm = window.confirm('DSGVO-Prüfung bestätigen und Konto anonymisieren?')
    if (!confirm) return
    try {
      await api(`/api/superadmin/privacy/customers/${customerId}/anonymize`, {
        method: 'POST',
        body: JSON.stringify({ reason, confirmPrivacyCheck: true }),
      })
      setInfo('Konto wurde anonymisiert.')
      await loadUsersAndCustomers()
      if (selectedCustomerId == customerId) {
        await openCustomerDetail(customerId)
      }
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Anonymisierung fehlgeschlagen.')
    }
  }

  async function createDeleteRequest(customerId: string) {
    const reason = window.prompt('Grund für Löschantrag (optional):')?.trim() || null
    try {
      await api(`/api/superadmin/privacy/customers/${customerId}/delete-request`, {
        method: 'POST',
        body: JSON.stringify({ reason }),
      })
      setInfo('Löschantrag wurde erstellt.')
      await loadUsersAndCustomers()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Löschantrag fehlgeschlagen.')
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Kundenverwaltung"
      subtitle="Interne Plattformbenutzer und registrierte App-Kunden zentral verwalten"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-4">
        <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
          <div className="flex flex-wrap items-center gap-2">
            <button
              type="button"
              onClick={() => setTab('internal')}
              className={`rounded-xl px-3 py-2 text-sm font-semibold ${
                tab === 'internal' ? 'bg-slate-900 text-white' : 'bg-slate-100 text-slate-700'
              }`}
            >
              Benutzer & Rechte
            </button>
            <button
              type="button"
              onClick={() => setTab('customers')}
              className={`rounded-xl px-3 py-2 text-sm font-semibold ${
                tab === 'customers' ? 'bg-slate-900 text-white' : 'bg-slate-100 text-slate-700'
              }`}
            >
              App-Kunden
            </button>
            <input
              value={query}
              onChange={(event) => setQuery(event.target.value)}
              placeholder={tab === 'internal' ? 'Benutzer suchen…' : 'Kunden suchen…'}
              className="ml-auto min-w-[260px] rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm"
            />
            <button
              type="button"
              onClick={() => void loadUsersAndCustomers()}
              className="rounded-xl bg-slate-900 px-3 py-2 text-sm font-semibold text-white"
            >
              Aktualisieren
            </button>
          </div>
        </section>

        {error ? <div className="rounded-xl border border-red-200 bg-red-50 px-3 py-2 text-sm text-red-700">{error}</div> : null}
        {info ? <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-3 py-2 text-sm text-emerald-700">{info}</div> : null}

        {tab === 'internal' ? (
          <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h2 className="mb-3 text-base font-semibold text-[var(--brand-ink)]">Interne Plattformbenutzer</h2>
            <div className="overflow-auto">
              <table className="min-w-full text-left text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-slate-500">
                    <th className="px-2 py-2">Name</th>
                    <th className="px-2 py-2">E-Mail</th>
                    <th className="px-2 py-2">Rolle</th>
                    <th className="px-2 py-2">Rechte</th>
                    <th className="px-2 py-2">Fahrer</th>
                    <th className="px-2 py-2">Mitarbeiter</th>
                    <th className="px-2 py-2">Einladungen</th>
                  </tr>
                </thead>
                <tbody>
                  {!loading && filteredUsers.length === 0 ? (
                    <tr>
                      <td colSpan={7} className="px-2 py-3 text-slate-500">Keine internen Benutzer gefunden.</td>
                    </tr>
                  ) : null}
                  {filteredUsers.map((user) => (
                    <tr key={user.id} className="border-b border-slate-100">
                      <td className="px-2 py-2">{user.name}</td>
                      <td className="px-2 py-2">{user.email}</td>
                      <td className="px-2 py-2">{user.role}</td>
                      <td className="px-2 py-2">rollenbasiert</td>
                      <td className="px-2 py-2">{user.role === 'DRIVER' ? 'Ja' : '-'}</td>
                      <td className="px-2 py-2">{user.role === 'STAFF' ? 'Ja' : '-'}</td>
                      <td className="px-2 py-2">Vorbereitet</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        ) : null}

        {tab === 'customers' ? (
          <section className="grid gap-4 lg:grid-cols-[1.2fr_1fr]">
            <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
              <h2 className="mb-3 text-base font-semibold text-[var(--brand-ink)]">Registrierte App-Kunden</h2>
              <div className="overflow-auto">
                <table className="min-w-full text-left text-sm">
                  <thead>
                    <tr className="border-b border-slate-200 text-slate-500">
                      <th className="px-2 py-2">Name</th>
                      <th className="px-2 py-2">E-Mail</th>
                      <th className="px-2 py-2">Status</th>
                      <th className="px-2 py-2">Registriert</th>
                      <th className="px-2 py-2">letzter Login</th>
                      <th className="px-2 py-2">Bestellungen</th>
                      <th className="px-2 py-2">Aktionen</th>
                    </tr>
                  </thead>
                  <tbody>
                    {!loading && customers.length === 0 ? (
                      <tr>
                        <td colSpan={7} className="px-2 py-3 text-slate-500">Keine registrierten Kunden gefunden.</td>
                      </tr>
                    ) : null}
                    {customers.map((customer) => (
                      <tr
                        key={customer.id}
                        className={`cursor-pointer border-b border-slate-100 ${
                          selectedCustomerId === customer.id ? 'bg-orange-50' : 'hover:bg-slate-50'
                        }`}
                        onClick={() => {
                          console.log('CUSTOMER_ROW_CLICK', customer)
                          void openCustomerDetail(customer.id)
                        }}
                      >
                        <td className="px-2 py-2">{customer.name}</td>
                        <td className="px-2 py-2">{customer.emailMasked || '-'}</td>
                        <td className="px-2 py-2">{customer.status}</td>
                        <td className="px-2 py-2">{formatDate(customer.createdAt)}</td>
                        <td className="px-2 py-2">{formatDate(customer.lastLoginAt)}</td>
                        <td className="px-2 py-2">{customer.orderCount}</td>
                        <td className="px-2 py-2">
                          <div className="flex flex-wrap gap-1">
                            <button
                              onClick={(event) => {
                                event.stopPropagation()
                                console.log('CUSTOMER_ROW_CLICK', customer)
                                void openCustomerDetail(customer.id)
                              }}
                              className="rounded bg-slate-100 px-2 py-1 text-xs"
                            >
                              Detail
                            </button>
                            <button onClick={(event) => { event.stopPropagation(); void exportCustomer(customer.id) }} className="rounded bg-blue-100 px-2 py-1 text-xs text-blue-800">DSGVO Export</button>
                            <button onClick={(event) => { event.stopPropagation(); void createDeleteRequest(customer.id) }} className="rounded bg-amber-100 px-2 py-1 text-xs text-amber-800">Konto löschen</button>
                            <button onClick={(event) => { event.stopPropagation(); void anonymizeCustomer(customer.id) }} className="rounded bg-rose-600 px-2 py-1 text-xs text-white">Anonymisieren</button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </article>

            <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
              <h3 className="mb-3 text-base font-semibold text-[var(--brand-ink)]">Kundendetail</h3>
              {!selectedCustomer || !customerDetail ? (
                <p className="text-sm text-slate-600">Bitte links einen Kunden auswählen.</p>
              ) : (
                <div className="space-y-3 text-sm">
                  <p><strong>Name:</strong> {customerDetail.fullName}</p>
                  <p><strong>E-Mail:</strong> {customerDetail.email || '-'}</p>
                  <p><strong>Telefon:</strong> {customerDetail.phone || '-'}</p>
                  <p><strong>Adresse:</strong> {[customerDetail.street, customerDetail.zipCode, customerDetail.city].filter(Boolean).join(', ') || '-'}</p>
                  <p><strong>Werbeeinwilligung:</strong> {customerDetail.marketingOptIn ? 'Ja' : 'Nein'}</p>
                  <p><strong>Push-Status:</strong> {customerDetail.pushStatus?.hasPushTokens ? `aktiv (${customerDetail.pushStatus.tokenCount})` : 'keine Tokens'}</p>
                  <p><strong>Login-Provider:</strong> {(customerDetail.loginProviders || []).join(', ') || '-'}</p>
                  <div>
                    <p className="font-semibold">Adressen</p>
                    <ul className="list-disc pl-5">
                      {(customerDetail.addresses || []).length === 0 ? (
                        <li>Keine</li>
                      ) : (
                        (customerDetail.addresses || []).slice(0, 8).map((entry, index) => (
                          <li key={`${entry.street}-${entry.zipCode}-${entry.city}-${index}`}>
                            {[entry.street, entry.zipCode, entry.city].filter(Boolean).join(', ') || '-'}
                          </li>
                        ))
                      )}
                    </ul>
                  </div>
                  <div>
                    <p className="font-semibold">Favoriten</p>
                    <ul className="list-disc pl-5">
                      {(customerDetail.favorites || []).length === 0 ? <li>Keine</li> : (customerDetail.favorites || []).slice(0, 8).map((entry) => <li key={`${entry.productId}-${entry.tenantName}`}>{entry.productName || entry.productId}</li>)}
                    </ul>
                  </div>
                  <div>
                    <p className="font-semibold">Bestellungen</p>
                    <ul className="list-disc pl-5">
                      {(customerDetail.orders || []).length === 0 ? <li>Keine</li> : (customerDetail.orders || []).slice(0, 8).map((entry) => <li key={entry.id}>{entry.id} · {entry.status} · {formatDate(entry.createdAt)}</li>)}
                    </ul>
                  </div>
                </div>
              )}
            </article>
          </section>
        ) : null}
      </div>
    </BackofficeLayout>
  )
}
