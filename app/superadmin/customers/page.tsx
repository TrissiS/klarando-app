'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import {
  archiveCustomerMaster,
  createCustomerMaster,
  getAccessContext,
  getAppCustomerAnalytics,
  getCustomerMasterList,
  sendAppCustomerCampaign,
  updateCustomerMaster,
  type AccessContext,
  type AppCustomerAnalyticsRecord,
  type CustomerMasterRecord,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

const navItems = [
  { href: '/superadmin', label: 'Dashboard' },
  { href: '/superadmin/orders', label: 'Bestellungen' },
  { href: '/superadmin/app-settings', label: 'App Einstellungen' },
  { href: '/superadmin/misc-settings', label: 'Sonstige Einstellungen' },
  { href: '/superadmin/business-data', label: 'Stammdaten & Abrechnung' },
  { href: '/superadmin/customers', label: 'Kundenstamm' },
  { href: '/superadmin/drivers', label: 'Fahrer' },
  { href: '/superadmin/security', label: 'Admin Verwaltung' },
]

type CampaignChannel = 'EMAIL' | 'PUSH' | 'EMAIL_AND_PUSH'

type CustomerFormState = {
  tenantId: string
  firstName: string
  lastName: string
  email: string
  phone: string
  street: string
  zipCode: string
  city: string
  marketingOptIn: boolean
}

const emptyForm: CustomerFormState = {
  tenantId: '',
  firstName: '',
  lastName: '',
  email: '',
  phone: '',
  street: '',
  zipCode: '',
  city: '',
  marketingOptIn: false,
}

function formatMoney(value: number) {
  return value.toLocaleString('de-DE', { style: 'currency', currency: 'EUR' })
}

function formatDateTime(value: string | null) {
  if (!value) return '-'
  const parsed = new Date(value)
  return Number.isNaN(parsed.getTime()) ? value : parsed.toLocaleString('de-DE')
}

export default function SuperadminCustomersPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [customers, setCustomers] = useState<CustomerMasterRecord[]>([])
  const [appCustomers, setAppCustomers] = useState<AppCustomerAnalyticsRecord[]>([])
  const [form, setForm] = useState<CustomerFormState>(emptyForm)

  const [query, setQuery] = useState('')
  const [chainIdFilter, setChainIdFilter] = useState('')
  const [tenantIdFilter, setTenantIdFilter] = useState('')
  const [showInactive, setShowInactive] = useState(false)
  const [appShowInactive, setAppShowInactive] = useState(false)
  const [appMarketingOnly, setAppMarketingOnly] = useState(false)
  const [behaviorDays, setBehaviorDays] = useState(180)
  const [selectedAppCustomerId, setSelectedAppCustomerId] = useState<string | null>(null)

  const [campaignChannel, setCampaignChannel] = useState<CampaignChannel>('EMAIL')
  const [campaignSubject, setCampaignSubject] = useState('')
  const [campaignMessage, setCampaignMessage] = useState('')

  const [isLoadingBase, setIsLoadingBase] = useState(true)
  const [isLoadingCustomers, setIsLoadingCustomers] = useState(false)
  const [isLoadingAppCustomers, setIsLoadingAppCustomers] = useState(false)
  const [isSaving, setIsSaving] = useState(false)
  const [isSendingCampaign, setIsSendingCampaign] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }
    setSession(parsed)
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    async function loadBase() {
      if (!token) return
      try {
        setIsLoadingBase(true)
        setError('')
        const accessContext = await getAccessContext(token)
        setContext(accessContext)
        if (!form.tenantId && accessContext.tenants[0]?.id) {
          setForm((current) => ({ ...current, tenantId: accessContext.tenants[0].id }))
        }
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Kontext konnte nicht geladen werden')
      } finally {
        setIsLoadingBase(false)
      }
    }
    void loadBase()
  }, [token])

  const tenantOptions = useMemo(() => {
    if (!context) return []
    if (!chainIdFilter) return context.tenants
    return context.tenants.filter((tenant) => tenant.chainId === chainIdFilter)
  }, [context, chainIdFilter])

  useEffect(() => {
    if (tenantIdFilter && !tenantOptions.some((tenant) => tenant.id === tenantIdFilter)) {
      setTenantIdFilter('')
    }
  }, [tenantIdFilter, tenantOptions])

  useEffect(() => {
    async function loadCustomers() {
      if (!token) return
      try {
        setIsLoadingCustomers(true)
        setError('')
        setCustomers(
          await getCustomerMasterList(token, {
            chainId: chainIdFilter || undefined,
            tenantId: tenantIdFilter || undefined,
            q: query || undefined,
            active: showInactive ? undefined : true,
            limit: 300,
          })
        )
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'Kundenstamm konnte nicht geladen werden')
      } finally {
        setIsLoadingCustomers(false)
      }
    }
    void loadCustomers()
  }, [token, query, chainIdFilter, tenantIdFilter, showInactive])

  useEffect(() => {
    async function loadAppCustomers() {
      if (!token) return
      try {
        setIsLoadingAppCustomers(true)
        setError('')
        const response = await getAppCustomerAnalytics(token, {
          chainId: chainIdFilter || undefined,
          tenantId: tenantIdFilter || undefined,
          q: query || undefined,
          marketingOptIn: appMarketingOnly ? true : undefined,
          isActive: appShowInactive ? undefined : true,
          behaviorDays,
          limit: 400,
        })
        setAppCustomers(response.rows)
      } catch (loadError) {
        setError(loadError instanceof Error ? loadError.message : 'App-Kunden konnten nicht geladen werden')
      } finally {
        setIsLoadingAppCustomers(false)
      }
    }
    void loadAppCustomers()
  }, [token, query, chainIdFilter, tenantIdFilter, appMarketingOnly, appShowInactive, behaviorDays])

  async function handleCreateCustomer() {
    if (!token) return
    if (!form.tenantId || !form.firstName.trim()) {
      setError('Filiale und Vorname sind erforderlich.')
      return
    }

    try {
      setIsSaving(true)
      setError('')
      await createCustomerMaster(token, {
        tenantId: form.tenantId,
        firstName: form.firstName.trim(),
        lastName: form.lastName.trim() || null,
        email: form.email.trim() || null,
        phone: form.phone.trim() || null,
        street: form.street.trim() || null,
        zipCode: form.zipCode.trim() || null,
        city: form.city.trim() || null,
        marketingOptIn: form.marketingOptIn,
      })
      setForm((current) => ({ ...emptyForm, tenantId: current.tenantId }))
      setSuccess('Kunde wurde angelegt.')
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Kunde konnte nicht angelegt werden')
    } finally {
      setIsSaving(false)
    }
  }

  async function handleToggleActive(customer: CustomerMasterRecord) {
    if (!token) return
    try {
      setIsSaving(true)
      await updateCustomerMaster(token, customer.id, { isActive: !customer.isActive })
      setCustomers((current) =>
        current.map((entry) =>
          entry.id === customer.id ? { ...entry, isActive: !customer.isActive } : entry
        )
      )
    } catch (updateError) {
      setError(updateError instanceof Error ? updateError.message : 'Status konnte nicht geaendert werden')
    } finally {
      setIsSaving(false)
    }
  }

  async function handleArchive(customerId: string) {
    if (!token) return
    try {
      setIsSaving(true)
      await archiveCustomerMaster(token, customerId)
      setCustomers((current) => current.filter((entry) => entry.id !== customerId))
    } catch (archiveError) {
      setError(archiveError instanceof Error ? archiveError.message : 'Kunde konnte nicht archiviert werden')
    } finally {
      setIsSaving(false)
    }
  }

  async function handleCampaignSend() {
    if (!token) return
    if (!campaignMessage.trim()) {
      setError('Bitte Kampagnen-Text eingeben.')
      return
    }
    try {
      setIsSendingCampaign(true)
      setError('')
      const response = await sendAppCustomerCampaign(token, {
        channel: campaignChannel,
        subject: campaignSubject.trim() || null,
        message: campaignMessage.trim(),
        chainId: chainIdFilter || null,
        tenantId: tenantIdFilter || null,
        q: query.trim() || null,
      })
      setSuccess(`Kampagne wurde vorgemerkt. Empfaenger: ${response.recipientCount}`)
      setCampaignMessage('')
    } catch (campaignError) {
      setError(campaignError instanceof Error ? campaignError.message : 'Kampagne konnte nicht gestartet werden')
    } finally {
      setIsSendingCampaign(false)
    }
  }

  const appTotals = useMemo(() => {
    const result = { users: 0, orders: 0, revenue: 0, optIn: 0, repeatBuyers: 0 }
    for (const row of appCustomers) {
      result.users += 1
      result.orders += row.metrics.orderCount
      result.revenue += row.metrics.totalRevenue
      if (row.marketingOptIn) result.optIn += 1
      if (row.metrics.orderCount >= 3) result.repeatBuyers += 1
    }
    return result
  }, [appCustomers])

  if (!session) return null

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Kundenstammdatenbank"
      subtitle="Kundenstamm plus automatische App-Kundenanalyse"
      navItems={navItems}
    >
      {error ? <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
      {success ? <div className="mb-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{success}</div> : null}

      {isLoadingBase ? <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">Lade Kontext...</section> : (
        <div className="grid gap-6">
          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Filter</h2>
            <div className="mt-4 grid gap-3 md:grid-cols-5">
              <input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Suche Name, E-Mail, Telefon" className="input-ui md:col-span-2" />
              <select value={chainIdFilter} onChange={(event) => setChainIdFilter(event.target.value)} className="input-ui">
                <option value="">Alle Ketten</option>
                {context?.chains.map((chain) => <option key={chain.id} value={chain.id}>{chain.name}</option>)}
              </select>
              <select value={tenantIdFilter} onChange={(event) => setTenantIdFilter(event.target.value)} className="input-ui">
                <option value="">Alle Filialen</option>
                {tenantOptions.map((tenant) => <option key={tenant.id} value={tenant.id}>{tenant.name}</option>)}
              </select>
              <label className="flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm">
                <input type="checkbox" checked={showInactive} onChange={(event) => setShowInactive(event.target.checked)} /> Inaktive manuelle Kunden
              </label>
            </div>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">Kundenstamm (manuell)</h2>
            <div className="mt-4 grid gap-3 lg:grid-cols-4">
              <select value={form.tenantId} onChange={(event) => setForm((current) => ({ ...current, tenantId: event.target.value }))} className="input-ui">
                <option value="">Filiale waehlen</option>
                {context?.tenants.map((tenant) => <option key={tenant.id} value={tenant.id}>{tenant.name}</option>)}
              </select>
              <input value={form.firstName} onChange={(event) => setForm((current) => ({ ...current, firstName: event.target.value }))} placeholder="Vorname" className="input-ui" />
              <input value={form.lastName} onChange={(event) => setForm((current) => ({ ...current, lastName: event.target.value }))} placeholder="Nachname" className="input-ui" />
              <input value={form.email} onChange={(event) => setForm((current) => ({ ...current, email: event.target.value }))} placeholder="E-Mail" className="input-ui" />
              <input value={form.phone} onChange={(event) => setForm((current) => ({ ...current, phone: event.target.value }))} placeholder="Telefon" className="input-ui" />
              <input value={form.street} onChange={(event) => setForm((current) => ({ ...current, street: event.target.value }))} placeholder="Strasse" className="input-ui" />
              <input value={form.zipCode} onChange={(event) => setForm((current) => ({ ...current, zipCode: event.target.value }))} placeholder="PLZ" className="input-ui" />
              <input value={form.city} onChange={(event) => setForm((current) => ({ ...current, city: event.target.value }))} placeholder="Ort" className="input-ui" />
              <label className="flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2 text-sm">
                <input type="checkbox" checked={form.marketingOptIn} onChange={(event) => setForm((current) => ({ ...current, marketingOptIn: event.target.checked }))} /> Marketing Opt-In
              </label>
            </div>
            <button type="button" onClick={() => void handleCreateCustomer()} disabled={isSaving} className="mt-4 rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white disabled:opacity-60">
              {isSaving ? 'Speichert...' : 'Kundenstamm speichern'}
            </button>

            <div className="mt-4 overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
              <table className="w-full min-w-[900px] border-collapse">
                <thead>
                  <tr><th className="th-ui">Name</th><th className="th-ui">Kontakt</th><th className="th-ui">Filiale</th><th className="th-ui">Status</th><th className="th-ui">Aktionen</th></tr>
                </thead>
                <tbody>
                  {isLoadingCustomers ? <tr><td className="td-ui" colSpan={5}>Lade Kundenstamm...</td></tr> : customers.length === 0 ? <tr><td className="td-ui" colSpan={5}>Keine Kundeneintraege gefunden.</td></tr> : customers.map((customer) => (
                    <tr key={customer.id}>
                      <td className="td-ui">{customer.firstName} {customer.lastName || ''}</td>
                      <td className="td-ui">{customer.email || '-'}<p className="text-xs text-rose-900/70">{customer.phone || '-'}</p></td>
                      <td className="td-ui">{customer.tenant?.name || customer.tenantId}</td>
                      <td className="td-ui">{customer.isActive ? 'Aktiv' : 'Inaktiv'}</td>
                      <td className="td-ui"><div className="flex gap-2"><button type="button" onClick={() => void handleToggleActive(customer)} className="btn-mini-outline">{customer.isActive ? 'Deaktivieren' : 'Aktivieren'}</button><button type="button" onClick={() => void handleArchive(customer.id)} className="btn-mini-danger">Archivieren</button></div></td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
            <h2 className="text-xl font-semibold">App-Kunden (automatisch)</h2>
            <div className="mt-3 flex flex-wrap gap-2 text-sm">
              <label className="rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2">Verhaltenstage <select className="ml-2 rounded-md border border-rose-200 px-2 py-1" value={String(behaviorDays)} onChange={(event) => setBehaviorDays(Number(event.target.value || 180))}><option value="30">30</option><option value="90">90</option><option value="180">180</option><option value="365">365</option></select></label>
              <label className="flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2"><input type="checkbox" checked={appMarketingOnly} onChange={(event) => setAppMarketingOnly(event.target.checked)} /> Nur Marketing Opt-In</label>
              <label className="flex items-center gap-2 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 px-3 py-2"><input type="checkbox" checked={appShowInactive} onChange={(event) => setAppShowInactive(event.target.checked)} /> Inaktive App-Konten</label>
            </div>

            <div className="mt-4 grid gap-3 md:grid-cols-5">
              <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3"><p className="text-xs uppercase tracking-wide text-rose-900/70">App-Kunden</p><p className="mt-1 text-2xl font-semibold">{appTotals.users}</p></article>
              <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3"><p className="text-xs uppercase tracking-wide text-rose-900/70">Bestellungen</p><p className="mt-1 text-2xl font-semibold">{appTotals.orders}</p></article>
              <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3"><p className="text-xs uppercase tracking-wide text-rose-900/70">Umsatz</p><p className="mt-1 text-2xl font-semibold">{formatMoney(appTotals.revenue)}</p></article>
              <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3"><p className="text-xs uppercase tracking-wide text-rose-900/70">Opt-In</p><p className="mt-1 text-2xl font-semibold text-fuchsia-700">{appTotals.optIn}</p></article>
              <article className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3"><p className="text-xs uppercase tracking-wide text-rose-900/70">Wiederkaeufer</p><p className="mt-1 text-2xl font-semibold text-orange-700">{appTotals.repeatBuyers}</p></article>
            </div>

            <div className="mt-4 grid gap-4 lg:grid-cols-[1fr_360px]">
              <div className="overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
                <table className="w-full min-w-[1100px] border-collapse">
                  <thead><tr><th className="th-ui">Kunde</th><th className="th-ui">Bestellungen/Umsatz</th><th className="th-ui">Verhalten</th><th className="th-ui">Ort</th><th className="th-ui">Status</th></tr></thead>
                  <tbody>
                    {isLoadingAppCustomers ? <tr><td className="td-ui" colSpan={5}>Lade App-Kunden...</td></tr> : appCustomers.length === 0 ? <tr><td className="td-ui" colSpan={5}>Keine App-Kunden im aktuellen Filter.</td></tr> : appCustomers.map((customer) => (
                      <tr key={customer.id} className={selectedAppCustomerId === customer.id ? 'bg-amber-50/50' : undefined} onClick={() => setSelectedAppCustomerId((current) => current === customer.id ? null : customer.id)}>
                        <td className="td-ui"><p className="font-semibold">{customer.fullName}</p><p className="text-sm text-rose-900/75">{customer.email}</p><p className="text-xs text-rose-900/60">Login: {formatDateTime(customer.lastLoginAt)}</p></td>
                        <td className="td-ui"><p>{customer.metrics.orderCount} Bestellungen</p><p className="text-sm text-rose-900/75">{formatMoney(customer.metrics.totalRevenue)}</p><p className="text-xs text-rose-900/60">Avg {formatMoney(customer.metrics.avgOrderValue)}</p></td>
                        <td className="td-ui"><p>{customer.metrics.favoriteServiceType || '-'}</p><p className="text-xs text-rose-900/70">{customer.metrics.topCategories.slice(0, 2).map((entry) => `${entry.name} (${entry.count})`).join(', ') || '-'}</p><p className="text-xs text-rose-900/70">{customer.metrics.topProducts.slice(0, 2).map((entry) => `${entry.name} (${entry.count})`).join(', ') || '-'}</p></td>
                        <td className="td-ui">{customer.metrics.primaryLocation?.zipCode || customer.zipCode || '-'}<p className="text-xs text-rose-900/70">{customer.metrics.primaryLocation?.city || customer.city || '-'}</p></td>
                        <td className="td-ui">{customer.isActive ? 'Aktiv' : 'Inaktiv'}<p className="text-xs text-rose-900/70">Marketing: {customer.marketingOptIn ? 'Ja' : 'Nein'}</p></td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>

              <aside className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 p-4">
                <h3 className="text-lg font-semibold">Kampagne an Opt-In-Kunden</h3>
                <p className="mt-1 text-sm text-rose-900/70">Nutzt den aktuellen Filter (Kette/Filiale/Suche).</p>
                <label className="mt-3 block text-sm">Kanal<select className="input-ui mt-1" value={campaignChannel} onChange={(event) => setCampaignChannel(event.target.value as CampaignChannel)}><option value="EMAIL">E-Mail</option><option value="PUSH">Push</option><option value="EMAIL_AND_PUSH">E-Mail + Push</option></select></label>
                <label className="mt-3 block text-sm">Betreff<input className="input-ui mt-1" value={campaignSubject} onChange={(event) => setCampaignSubject(event.target.value)} placeholder="z. B. Wochenangebot" /></label>
                <label className="mt-3 block text-sm">Nachricht<textarea className="input-ui mt-1 min-h-[120px]" value={campaignMessage} onChange={(event) => setCampaignMessage(event.target.value)} placeholder="Angebot oder Info..." /></label>
                <button type="button" onClick={() => void handleCampaignSend()} disabled={isSendingCampaign} className="mt-3 w-full rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-semibold text-white disabled:opacity-60">{isSendingCampaign ? 'Startet...' : 'Kampagne starten'}</button>
                {selectedAppCustomerId ? <p className="mt-3 text-xs text-rose-900/65">Detailauswahl aktiv. Letzte Bestellung: {formatDateTime(appCustomers.find((entry) => entry.id === selectedAppCustomerId)?.metrics.lastOrderAt || null)}</p> : null}
              </aside>
            </div>
          </section>
        </div>
      )}
    </BackofficeLayout>
  )
}
