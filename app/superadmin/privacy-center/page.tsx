'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import { getStoredAccessToken } from '@/lib/api'
import { API_BASE_URL } from '@/lib/config'

type TabKey = 'customers' | 'requests' | 'consents' | 'audit' | 'retention' | 'processing'

type PrivacyCustomerRow = {
  id: string
  name: string
  emailMasked: string | null
  phoneMasked: string | null
  status: string
  createdAt: string
  lastLoginAt: string | null
  loginType: string[]
  orderCount: number
  lastOrderAt: string | null
  marketingOptIn: boolean
  consents: {
    location: boolean
    deliveryUpdates: boolean
    favoriteOffers: boolean
    marketing: boolean
  }
}

function formatDate(value: string | null) {
  if (!value) return '-'
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) return value
  return parsed.toLocaleString('de-DE')
}

export default function SuperadminPrivacyCenterPage() {
  const [activeTab, setActiveTab] = useState<TabKey>('customers')
  const [token, setToken] = useState('')
  const [customers, setCustomers] = useState<PrivacyCustomerRow[]>([])
  const [requests, setRequests] = useState<any[]>([])
  const [auditLogs, setAuditLogs] = useState<any[]>([])
  const [query, setQuery] = useState('')
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [loading, setLoading] = useState(false)

  useEffect(() => {
    setToken(getStoredAccessToken() || '')
  }, [])

  async function apiCall<T>(path: string, init?: RequestInit): Promise<T> {
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
      throw new Error((payload as any)?.error || 'API Fehler')
    }
    return payload as T
  }

  async function loadAll() {
    if (!token) return
    setLoading(true)
    setError('')
    try {
      const [customerPayload, requestPayload, auditPayload] = await Promise.all([
        apiCall<{ customers: PrivacyCustomerRow[] }>(
          `/api/superadmin/privacy/customers${query.trim() ? `?q=${encodeURIComponent(query.trim())}` : ''}`
        ),
        apiCall<{ requests: any[] }>('/api/superadmin/privacy/delete-requests'),
        apiCall<{ logs: any[] }>('/api/superadmin/privacy/audit-log'),
      ])
      setCustomers(customerPayload.customers || [])
      setRequests(requestPayload.requests || [])
      setAuditLogs(auditPayload.logs || [])
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Datenschutzcenter konnte nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadAll()
  }, [token])

  const consentStats = useMemo(() => {
    const totals = {
      location: 0,
      delivery: 0,
      favorites: 0,
      marketing: 0,
    }
    for (const row of customers) {
      if (row.consents.location) totals.location += 1
      if (row.consents.deliveryUpdates) totals.delivery += 1
      if (row.consents.favoriteOffers) totals.favorites += 1
      if (row.consents.marketing) totals.marketing += 1
    }
    return totals
  }, [customers])

  async function anonymizeCustomer(customerId: string) {
    const reason = window.prompt('Grund für Anonymisierung (Pflichtfeld):')?.trim()
    if (!reason) return
    const confirmed = window.confirm('DSGVO-Prüfung bestätigen und Kunden anonymisieren?')
    if (!confirmed) return

    try {
      await apiCall(`/api/superadmin/privacy/customers/${customerId}/anonymize`, {
        method: 'POST',
        body: JSON.stringify({ reason, confirmPrivacyCheck: true }),
      })
      setSuccess('Kunde wurde anonymisiert.')
      await loadAll()
    } catch (actionError) {
      setError(actionError instanceof Error ? actionError.message : 'Anonymisierung fehlgeschlagen')
    }
  }

  async function createDeleteRequest(customerId: string) {
    const reason = window.prompt('Grund für Löschantrag (optional):')?.trim() || null
    try {
      await apiCall(`/api/superadmin/privacy/customers/${customerId}/delete-request`, {
        method: 'POST',
        body: JSON.stringify({ reason }),
      })
      setSuccess('Löschantrag wurde erstellt.')
      await loadAll()
    } catch (actionError) {
      setError(actionError instanceof Error ? actionError.message : 'Löschantrag fehlgeschlagen')
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Kunden & Datenschutz"
      subtitle="DSGVO-Anfragen, Anonymisierung und Einwilligungen zentral verwalten"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-4">
        <div className="rounded-2xl border border-orange-200 bg-white p-4">
          <div className="flex flex-wrap items-center gap-2">
            {[
              ['customers', 'Kunden'],
              ['requests', 'DSGVO-Anfragen'],
              ['consents', 'Einwilligungen'],
              ['audit', 'Audit-Log'],
              ['retention', 'Aufbewahrung'],
              ['processing', 'Verarbeitungstätigkeiten'],
            ].map(([key, label]) => (
              <button
                key={key}
                onClick={() => setActiveTab(key as TabKey)}
                className={`rounded-xl px-3 py-1.5 text-sm font-semibold ${
                  activeTab === key ? 'bg-orange-500 text-white' : 'bg-orange-50 text-orange-700'
                }`}
              >
                {label}
              </button>
            ))}
          </div>
          <div className="mt-3 flex gap-2">
            <input
              value={query}
              onChange={(event) => setQuery(event.target.value)}
              placeholder="Kunden suchen..."
              className="w-full rounded-xl border border-orange-200 px-3 py-2 text-sm"
            />
            <button
              onClick={() => void loadAll()}
              className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white"
            >
              Aktualisieren
            </button>
          </div>
        </div>

        {error ? <div className="rounded-xl border border-red-200 bg-red-50 px-3 py-2 text-sm text-red-700">{error}</div> : null}
        {success ? <div className="rounded-xl border border-emerald-200 bg-emerald-50 px-3 py-2 text-sm text-emerald-700">{success}</div> : null}

        {activeTab === 'customers' ? (
          <div className="rounded-2xl border border-slate-200 bg-white p-4">
            <h2 className="mb-3 text-lg font-semibold">Kunden</h2>
            {loading ? <p className="text-sm text-slate-500">Lade Daten...</p> : null}
            <div className="overflow-auto">
              <table className="min-w-full text-left text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-slate-500">
                    <th className="px-2 py-2">ID</th>
                    <th className="px-2 py-2">Name</th>
                    <th className="px-2 py-2">E-Mail</th>
                    <th className="px-2 py-2">Telefon</th>
                    <th className="px-2 py-2">Status</th>
                    <th className="px-2 py-2">Bestellungen</th>
                    <th className="px-2 py-2">Aktion</th>
                  </tr>
                </thead>
                <tbody>
                  {customers.map((customer) => (
                    <tr key={customer.id} className="border-b border-slate-100">
                      <td className="px-2 py-2 font-mono text-xs">{customer.id.slice(0, 8)}</td>
                      <td className="px-2 py-2">{customer.name}</td>
                      <td className="px-2 py-2">{customer.emailMasked || '-'}</td>
                      <td className="px-2 py-2">{customer.phoneMasked || '-'}</td>
                      <td className="px-2 py-2">{customer.status}</td>
                      <td className="px-2 py-2">{customer.orderCount}</td>
                      <td className="px-2 py-2">
                        <div className="flex gap-2">
                          <button
                            onClick={() => void createDeleteRequest(customer.id)}
                            className="rounded-lg bg-amber-100 px-2 py-1 text-xs font-semibold text-amber-800"
                          >
                            Löschantrag
                          </button>
                          <button
                            onClick={() => void anonymizeCustomer(customer.id)}
                            className="rounded-lg bg-rose-600 px-2 py-1 text-xs font-semibold text-white"
                          >
                            Anonymisieren
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        ) : null}

        {activeTab === 'requests' ? (
          <div className="rounded-2xl border border-slate-200 bg-white p-4">
            <h2 className="mb-3 text-lg font-semibold">DSGVO-Anfragen</h2>
            <ul className="space-y-2 text-sm">
              {requests.map((request) => (
                <li key={request.id} className="rounded-lg border border-slate-200 p-2">
                  <div className="font-medium">{request.customer?.fullName || request.customerId}</div>
                  <div>Status: {request.status}</div>
                  <div>Angefragt: {formatDate(request.requestedAt)}</div>
                </li>
              ))}
            </ul>
          </div>
        ) : null}

        {activeTab === 'consents' ? (
          <div className="rounded-2xl border border-slate-200 bg-white p-4 text-sm">
            <h2 className="mb-3 text-lg font-semibold">Einwilligungen (Übersicht)</h2>
            <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
              <div className="rounded-xl bg-slate-50 p-3">Standort: {consentStats.location}</div>
              <div className="rounded-xl bg-slate-50 p-3">Lieferupdates: {consentStats.delivery}</div>
              <div className="rounded-xl bg-slate-50 p-3">Favoriten-Angebote: {consentStats.favorites}</div>
              <div className="rounded-xl bg-slate-50 p-3">Marketing: {consentStats.marketing}</div>
            </div>
          </div>
        ) : null}

        {activeTab === 'audit' ? (
          <div className="rounded-2xl border border-slate-200 bg-white p-4">
            <h2 className="mb-3 text-lg font-semibold">Audit-Log</h2>
            <ul className="space-y-2 text-sm">
              {auditLogs.map((entry) => (
                <li key={entry.id} className="rounded-lg border border-slate-200 p-2">
                  <div className="font-medium">{entry.actionType}</div>
                  <div>Kunde: {entry.customerId}</div>
                  <div>Zeitpunkt: {formatDate(entry.createdAt)}</div>
                </li>
              ))}
            </ul>
          </div>
        ) : null}

        {activeTab === 'retention' ? (
          <div className="rounded-2xl border border-slate-200 bg-white p-4 text-sm">
            <h2 className="mb-2 text-lg font-semibold">Aufbewahrung</h2>
            <p>Bestellungen und Umsätze bleiben aus steuerlichen Gründen erhalten. Standardaktion ist Anonymisierung statt Hard Delete.</p>
          </div>
        ) : null}

        {activeTab === 'processing' ? (
          <div className="rounded-2xl border border-slate-200 bg-white p-4 text-sm">
            <h2 className="mb-2 text-lg font-semibold">Verarbeitungstätigkeiten</h2>
            <p>Zwecke, Datenkategorien, Rechtsgrundlagen und TOM-Hinweise sind in der Architektur-Dokumentation vorbereitet.</p>
          </div>
        ) : null}
      </div>
    </BackofficeLayout>
  )
}
