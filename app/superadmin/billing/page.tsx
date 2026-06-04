'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import ImplementationNotice from '@/app/Components/admin/ImplementationNotice'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createBillingRun,
  createBillingRunPreview,
  getBillingInvoices,
  getBillingSummary,
  getBillingTenants,
  type BillingInvoice,
  type BillingSummaryResponse,
  type BillingTenantRow,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

function currentMonth() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

function centsToEuro(value: number) {
  return `${(Math.max(0, value) / 100).toFixed(2)} €`
}

function statusLabel(value: string) {
  const map: Record<string, string> = {
    WITHIN_INCLUDED: 'Innerhalb Kontingent',
    NEAR_INCLUDED_LIMIT: 'Kontingent fast verbraucht',
    CHARGEABLE: 'Kostenpflichtig',
    INVOICE_OPEN: 'Rechnung offen',
    INVOICE_PAID: 'Bezahlt',
    DRAFT: 'Entwurf',
    FINALIZED: 'Finalisiert',
    PAID: 'Bezahlt',
  }
  return map[value] || value
}

type SectionLink = {
  href: string
  label: string
}

function SectionCard({
  id,
  title,
  description,
  children,
  links = [],
}: {
  id: string
  title: string
  description: string
  children: React.ReactNode
  links?: SectionLink[]
}) {
  return (
    <section id={id} className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm scroll-mt-24">
      <div className="flex flex-wrap items-start justify-between gap-3">
        <div>
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">{title}</h3>
          <p className="mt-1 text-sm text-slate-600">{description}</p>
        </div>
        {links.length > 0 ? (
          <div className="flex flex-wrap gap-2">
            {links.map((link) => (
              <a
                key={link.href}
                href={link.href}
                className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-xs font-medium text-slate-700 hover:bg-slate-100"
              >
                {link.label}
              </a>
            ))}
          </div>
        ) : null}
      </div>
      <div className="mt-4">{children}</div>
    </section>
  )
}

export default function SuperadminBillingPage() {
  const [token, setToken] = useState('')
  const [month, setMonth] = useState(currentMonth())
  const [tenantFilter, setTenantFilter] = useState('')
  const [statusFilter, setStatusFilter] = useState('')
  const [summary, setSummary] = useState<BillingSummaryResponse | null>(null)
  const [rows, setRows] = useState<BillingTenantRow[]>([])
  const [invoices, setInvoices] = useState<BillingInvoice[]>([])
  const [warnings, setWarnings] = useState<Array<{ tenantId: string; message: string }>>([])
  const [loading, setLoading] = useState(false)
  const [previewLoading, setPreviewLoading] = useState(false)
  const [creatingRun, setCreatingRun] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/superadmin'
      return
    }
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  async function loadOverview() {
    if (!token) return
    try {
      setLoading(true)
      setError('')
      const [summaryResult, tenantResult, invoiceResult] = await Promise.all([
        getBillingSummary(token, { month, tenantId: tenantFilter || undefined }),
        getBillingTenants(token, {
          month,
          tenantId: tenantFilter || undefined,
          status: statusFilter || undefined,
        }),
        getBillingInvoices(token, {}),
      ])
      setSummary(summaryResult)
      setRows(tenantResult.rows)
      setInvoices(invoiceResult)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Billing & Finanzen konnten nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadOverview()
  }, [token, month, tenantFilter, statusFilter])

  async function handlePreview() {
    if (!token) return
    try {
      setPreviewLoading(true)
      setInfo('')
      const result = await createBillingRunPreview(token, {
        month,
        tenantId: tenantFilter || undefined,
      })
      setWarnings(result.warnings)
      setInfo(`Vorschau aktualisiert: ${result.rows.length} Betriebe geprüft.`)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Vorschau konnte nicht erzeugt werden')
    } finally {
      setPreviewLoading(false)
    }
  }

  async function handleCreateRun() {
    if (!token) return
    try {
      setCreatingRun(true)
      setError('')
      const result = await createBillingRun(token, { month })
      setInfo(`Monatsabrechnung erstellt. ${result.invoicesCreated} Rechnungsentwürfe wurden erzeugt.`)
      await loadOverview()
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Monatsabrechnung konnte nicht erstellt werden')
    } finally {
      setCreatingRun(false)
    }
  }

  const cards = useMemo(() => {
    const fallback = {
      tenants: 0,
      platformRevenueNetCents: 0,
      platformRevenueGrossCents: 0,
      estimatedMarginNetCents: 0,
      openInvoices: 0,
      paidInvoices: 0,
      includedTenants: 0,
      chargeableTenants: 0,
    }
    return summary?.summary || fallback
  }, [summary])

  const invoiceDrafts = useMemo(
    () => invoices.filter((invoice) => invoice.status === 'DRAFT').slice(0, 10),
    [invoices]
  )

  const recentInvoices = useMemo(() => invoices.slice(0, 10), [invoices])

  const chargeableRows = useMemo(() => rows.filter((row) => row.extraOrders > 0).slice(0, 8), [rows])
  const topUsageRows = useMemo(
    () =>
      [...rows]
        .sort((left, right) => right.ordersCounted - left.ordersCounted)
        .slice(0, 8),
    [rows]
  )

  const distinctPlanTypes = useMemo(() => {
    return Array.from(new Set(rows.map((row) => row.planType).filter(Boolean)))
  }, [rows])

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Billing & Finanzen"
      subtitle="Zentrale Masterseite für Abrechnung, Nutzung, Rechnungsentwürfe und Finanzstatus im Superadmin"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-5">
        {error ? (
          <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
            {error}
          </div>
        ) : null}
        {info ? (
          <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">
            {info}
          </div>
        ) : null}

        <ImplementationNotice
          title="Billing-Masterseite aktiviert"
          message="Diese Seite ist jetzt der zentrale Einstieg für Billing & Finanzen. Die bisherigen Seiten „Gebühren & Provisionen“ und „Modulfreigaben“ bleiben nur noch als Legacy-Verweise bestehen."
          tone="info"
        />

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
          <div className="flex flex-wrap items-end gap-3">
            <label className="text-sm">
              Monat
              <input
                type="month"
                value={month}
                onChange={(event) => setMonth(event.target.value)}
                className="ml-2 rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm">
              Tenant (optional)
              <input
                value={tenantFilter}
                onChange={(event) => setTenantFilter(event.target.value)}
                placeholder="tenantId"
                className="ml-2 rounded-xl border border-slate-300 px-3 py-2 text-sm"
              />
            </label>
            <label className="text-sm">
              Status
              <select
                value={statusFilter}
                onChange={(event) => setStatusFilter(event.target.value)}
                className="ml-2 rounded-xl border border-slate-300 px-3 py-2 text-sm"
              >
                <option value="">Alle</option>
                <option value="WITHIN_INCLUDED">Innerhalb Kontingent</option>
                <option value="NEAR_INCLUDED_LIMIT">Kontingent fast verbraucht</option>
                <option value="CHARGEABLE">Kostenpflichtig</option>
                <option value="INVOICE_OPEN">Rechnung offen</option>
                <option value="INVOICE_PAID">Bezahlt</option>
              </select>
            </label>
            <button
              type="button"
              onClick={() => void handlePreview()}
              disabled={previewLoading}
              className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-medium"
            >
              Vorschau erstellen
            </button>
            <button
              type="button"
              onClick={() => void handleCreateRun()}
              disabled={creatingRun}
              className="rounded-xl bg-[var(--brand-strong)] px-4 py-2 text-sm font-semibold text-white disabled:opacity-50"
            >
              Monatsabrechnung erstellen
            </button>
          </div>
        </section>

        <section className="grid gap-3 md:grid-cols-2 xl:grid-cols-4">
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Plattformumsatz netto</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">
              {centsToEuro(cards.platformRevenueNetCents)}
            </p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Klarando-Marge (MVP)</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">
              {centsToEuro(cards.estimatedMarginNetCents)}
            </p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Offene Rechnungen</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">{cards.openInvoices}</p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Kostenpflichtige Betriebe</p>
            <p className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">{cards.chargeableTenants}</p>
          </article>
        </section>

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">Bereiche</p>
          <div className="mt-3 flex flex-wrap gap-2">
            <a href="#uebersicht" className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm font-medium text-slate-700 hover:bg-slate-100">Übersicht</a>
            <a href="#tarife-module" className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm font-medium text-slate-700 hover:bg-slate-100">Tarife & Module</a>
            <a href="#nutzung" className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm font-medium text-slate-700 hover:bg-slate-100">Nutzung</a>
            <a href="#provisionen" className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm font-medium text-slate-700 hover:bg-slate-100">Provisionen</a>
            <a href="#rechnungsentwuerfe" className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm font-medium text-slate-700 hover:bg-slate-100">Rechnungsentwürfe</a>
            <a href="#rechnungen" className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm font-medium text-slate-700 hover:bg-slate-100">Rechnungen</a>
            <a href="#mahnungen" className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm font-medium text-slate-700 hover:bg-slate-100">Mahnungen</a>
            <a href="#exporte" className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-sm font-medium text-slate-700 hover:bg-slate-100">Exporte</a>
          </div>
        </section>

        {warnings.length ? (
          <section className="rounded-3xl border border-amber-200 bg-amber-50 p-4">
            <h3 className="text-sm font-semibold text-amber-900">Warnungen zur Abrechnung</h3>
            <ul className="mt-2 list-disc space-y-1 pl-5 text-sm text-amber-900">
              {warnings.slice(0, 10).map((warning, index) => (
                <li key={`${warning.tenantId}-${index}`}>{warning.message}</li>
              ))}
            </ul>
          </section>
        ) : null}

        <SectionCard
          id="uebersicht"
          title="Übersicht"
          description="Zentrale Zusammenfassung für Umsatz, Gebühren, Rechnungen und kostenpflichtige Betriebe."
          links={[{ href: '/superadmin/payments', label: 'Zahlungsstatus öffnen' }]}
        >
          {loading ? <p className="text-sm text-slate-600">Lade Übersicht…</p> : null}
          {!loading ? (
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-4">
              <InfoStat label="Tenants im Zeitraum" value={rows.length} />
              <InfoStat label="Bezahlte Rechnungen" value={cards.paidInvoices} />
              <InfoStat label="Im Kontingent" value={cards.includedTenants} />
              <InfoStat label="Bruttoumsatz Plattform" value={centsToEuro(cards.platformRevenueGrossCents)} />
            </div>
          ) : null}
        </SectionCard>

        <SectionCard
          id="tarife-module"
          title="Tarife & Module"
          description="Tariftypen sind bereits sichtbar. Modulpreise und zentrale Modulpflege werden schrittweise in diese Masterseite überführt."
        >
          <ImplementationNotice
            title="Vorbereitet"
            tone="preparation"
            message="Die frühere Seite „Modulfreigaben“ ist kein zweiter aktiver Billing-Bereich mehr. Tarif- und Modulthemen werden von hier aus weiter konsolidiert."
          />
          <div className="mt-4 grid gap-3 md:grid-cols-2 xl:grid-cols-4">
            <InfoStat label="Aktive Tariftypen" value={distinctPlanTypes.length} />
            <InfoStat label="Tarifliste" value={distinctPlanTypes.length ? distinctPlanTypes.join(', ') : 'Noch keine Daten'} />
            <InfoStat label="Modulgebühren" value="Vorbereitet" />
            <InfoStat label="Serverseitige Modulpreise" value="Folgeticket" />
          </div>
        </SectionCard>

        <SectionCard
          id="nutzung"
          title="Nutzung"
          description="Bestellungen, Inklusivkontingente und Zusatzbestellungen je Tenant auf Basis der vorhandenen Billing-Zählung."
        >
          {topUsageRows.length === 0 ? (
            <p className="text-sm text-slate-600">Keine Nutzungsdaten im ausgewählten Zeitraum.</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                    <th className="px-2 py-2">Tenant</th>
                    <th className="px-2 py-2">Bestellungen</th>
                    <th className="px-2 py-2">Inklusive</th>
                    <th className="px-2 py-2">Zusatz</th>
                    <th className="px-2 py-2">Status</th>
                  </tr>
                </thead>
                <tbody>
                  {topUsageRows.map((row) => (
                    <tr key={row.tenantId} className="border-b border-slate-100">
                      <td className="px-2 py-2">
                        <p className="font-medium text-[var(--brand-ink)]">{row.tenantName}</p>
                        <p className="text-xs text-slate-500">{row.chainName || 'Ohne Chain'}</p>
                      </td>
                      <td className="px-2 py-2">{row.ordersCounted}</td>
                      <td className="px-2 py-2">
                        {row.includedOrders} ({row.includedUsagePercent.toFixed(0)} %)
                      </td>
                      <td className="px-2 py-2">{row.extraOrders}</td>
                      <td className="px-2 py-2">{statusLabel(row.status)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </SectionCard>

        <SectionCard
          id="provisionen"
          title="Provisionen"
          description="Read-only Zusammenfassung der aktuell berechneten Provisionswerte. Die frühere Seite „Gebühren & Provisionen“ bleibt nur als Legacy-Verweis erhalten."
        >
          {chargeableRows.length === 0 ? (
            <p className="text-sm text-slate-600">Aktuell keine kostenpflichtigen Zusatzbestellungen im ausgewählten Zeitraum.</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                    <th className="px-2 py-2">Tenant</th>
                    <th className="px-2 py-2">Provision</th>
                    <th className="px-2 py-2">Zusatzbestellungen</th>
                    <th className="px-2 py-2">Provisionsbetrag</th>
                    <th className="px-2 py-2">Fixbetrag</th>
                  </tr>
                </thead>
                <tbody>
                  {chargeableRows.map((row) => (
                    <tr key={row.tenantId} className="border-b border-slate-100">
                      <td className="px-2 py-2">{row.tenantName}</td>
                      <td className="px-2 py-2">{row.commissionPercentApplied.toFixed(2)} %</td>
                      <td className="px-2 py-2">{row.extraOrders}</td>
                      <td className="px-2 py-2">{centsToEuro(row.commissionCents)}</td>
                      <td className="px-2 py-2">{centsToEuro(row.fixedFeesCents)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </SectionCard>

        <SectionCard
          id="rechnungsentwuerfe"
          title="Rechnungsentwürfe"
          description="Aktuelle Entwürfe aus dem bestehenden Billing-System. Keine zweite Entwurfslogik auf Legacy-Seiten."
        >
          {invoiceDrafts.length === 0 ? (
            <p className="text-sm text-slate-600">Keine offenen Rechnungsentwürfe vorhanden.</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                    <th className="px-2 py-2">Rechnung</th>
                    <th className="px-2 py-2">Tenant</th>
                    <th className="px-2 py-2">Zeitraum</th>
                    <th className="px-2 py-2">Betrag</th>
                    <th className="px-2 py-2">Status</th>
                  </tr>
                </thead>
                <tbody>
                  {invoiceDrafts.map((invoice) => (
                    <tr key={invoice.id} className="border-b border-slate-100">
                      <td className="px-2 py-2">{invoice.invoiceNumber}</td>
                      <td className="px-2 py-2">{invoice.tenant?.name || '-'}</td>
                      <td className="px-2 py-2">
                        {new Date(invoice.periodStart).toLocaleDateString('de-DE')} –{' '}
                        {new Date(invoice.periodEnd).toLocaleDateString('de-DE')}
                      </td>
                      <td className="px-2 py-2">{centsToEuro(invoice.totalGrossCents)}</td>
                      <td className="px-2 py-2">{statusLabel(invoice.status)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </SectionCard>

        <SectionCard
          id="rechnungen"
          title="Rechnungen"
          description="Letzte Rechnungen aus dem aktuellen Billing-System. Detailpflege bleibt auf dem bestehenden Datenmodell, nicht auf Parallelseiten."
        >
          {recentInvoices.length === 0 ? (
            <p className="text-sm text-slate-600">Noch keine Rechnungen vorhanden.</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 text-left text-xs uppercase tracking-wide text-slate-500">
                    <th className="px-2 py-2">Rechnung</th>
                    <th className="px-2 py-2">Tenant</th>
                    <th className="px-2 py-2">Betrag</th>
                    <th className="px-2 py-2">Status</th>
                    <th className="px-2 py-2">Offen</th>
                  </tr>
                </thead>
                <tbody>
                  {recentInvoices.map((invoice) => (
                    <tr key={invoice.id} className="border-b border-slate-100">
                      <td className="px-2 py-2">{invoice.invoiceNumber}</td>
                      <td className="px-2 py-2">{invoice.tenant?.name || '-'}</td>
                      <td className="px-2 py-2">{centsToEuro(invoice.totalGrossCents)}</td>
                      <td className="px-2 py-2">{statusLabel(invoice.status)}</td>
                      <td className="px-2 py-2">{centsToEuro(invoice.openAmountCents)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </SectionCard>

        <SectionCard
          id="mahnungen"
          title="Mahnungen"
          description="Kein aktiver Mahnlauf wird hier vorgetäuscht. Dieser Bereich bleibt sichtbar, aber bewusst als vorbereitet markiert."
        >
          <ImplementationNotice
            title="Vorbereitet"
            tone="preparation"
            message="Mahnstufen, Eskalation und rechtliche Mahnlogik sind noch nicht als konsolidierter Billing-Bereich umgesetzt."
          />
        </SectionCard>

        <SectionCard
          id="exporte"
          title="Exporte"
          description="DATEV- und E-Rechnungsvorbereitung folgt erst nach sauberer Konsolidierung der Rechnungsdomäne."
        >
          <ImplementationNotice
            title="Vorbereitet"
            tone="preparation"
            message="Exportformate werden noch nicht als produktiver Masterflow angeboten. ZUGFeRD/XRechnung und DATEV bleiben Folgethemen."
          />
        </SectionCard>
      </div>
    </BackofficeLayout>
  )
}

function InfoStat({ label, value }: { label: string; value: string | number }) {
  return (
    <article className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
      <p className="text-xs uppercase tracking-wide text-slate-500">{label}</p>
      <p className="mt-1 text-lg font-semibold text-slate-900">{value}</p>
    </article>
  )
}
