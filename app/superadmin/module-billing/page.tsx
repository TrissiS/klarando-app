'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  AdminButton,
  AdminFormGrid,
  AdminPageShell,
  AdminSectionCard,
  AdminSelect,
  AdminTextInput,
} from '@/app/Components/admin/ui/AdminUi'
import {
  applyTenantFeaturePackage,
  getAccessContext,
  getChainFeatureModules,
  getEffectiveFeatureModules,
  getFeatureModuleCatalog,
  getTenantBillingConfig,
  syncTenantBillingUsage,
  updateChainFeatureModules,
  updateTenantBillingConfig,
  updateTenantFeatureModules,
  type AccessContext,
  type BillingPeriodType,
  type BillingPlanType,
  type EffectiveFeatureModuleEntry,
  type FeeBearerType,
  type FeatureModuleDefinition,
  type FeaturePackageTemplate,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type BillingFormState = {
  planType: BillingPlanType
  billingPeriod: BillingPeriodType
  monthlyFeeCents: number
  includedOrders: number
  commissionPercent: number
  commissionAfterIncludedOrdersPercent: number | null
  fixedFeePerOrderCents: number
  paymentFeeBearer: FeeBearerType
  activeFrom: string
}

function mapBillingForm(data: Awaited<ReturnType<typeof getTenantBillingConfig>>) {
  return {
    planType: data.plan.planType,
    billingPeriod: data.plan.billingPeriod,
    monthlyFeeCents: data.plan.monthlyFeeCents,
    includedOrders: data.plan.includedOrders,
    commissionPercent: Number(data.plan.commissionPercent || 0),
    commissionAfterIncludedOrdersPercent: data.plan.commissionAfterIncludedOrdersPercent,
    fixedFeePerOrderCents: data.plan.fixedFeePerOrderCents,
    paymentFeeBearer: data.settings.paymentFeeBearer,
    activeFrom: data.plan.activeFrom ? new Date(data.plan.activeFrom).toISOString().slice(0, 10) : '',
  } satisfies BillingFormState
}

export default function SuperadminModuleBillingPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')
  const [context, setContext] = useState<AccessContext | null>(null)
  const [catalog, setCatalog] = useState<FeatureModuleDefinition[]>([])
  const [packages, setPackages] = useState<FeaturePackageTemplate[]>([])
  const [tenantId, setTenantId] = useState('')
  const [chainId, setChainId] = useState('')
  const [tenantModules, setTenantModules] = useState<EffectiveFeatureModuleEntry[]>([])
  const [chainSettings, setChainSettings] = useState<Record<string, boolean>>({})
  const [billingForm, setBillingForm] = useState<BillingFormState | null>(null)
  const [usageText, setUsageText] = useState('')
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')
  const [busy, setBusy] = useState(false)

  const role = (session?.role || '').toLowerCase()
  const canEdit = role === 'superadmin'

  const filteredTenants = useMemo(() => {
    if (!context) return []
    if (role !== 'chainadmin') return context.tenants
    return context.tenants.filter((entry) => entry.chainId === context.me?.chainId)
  }, [context, role])

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed) {
      window.location.href = '/'
      return
    }
    if (parsed.role !== 'superadmin' && parsed.role !== 'chainadmin') {
      window.location.href = '/admin'
      return
    }
    setSession(parsed)
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  useEffect(() => {
    if (!token) return
    void (async () => {
      try {
        const [ctx, moduleCatalog] = await Promise.all([getAccessContext(token), getFeatureModuleCatalog(token)])
        setContext(ctx)
        setCatalog(moduleCatalog.modules)
        setPackages(moduleCatalog.packages)
        setChainId((role === 'chainadmin' ? ctx.me?.chainId : ctx.chains[0]?.id) || '')
        setTenantId(ctx.tenants[0]?.id || '')
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : 'Seite konnte nicht geladen werden')
      }
    })()
  }, [token, role])

  useEffect(() => {
    if (!token || !tenantId) return
    void (async () => {
      const [effective, billing] = await Promise.all([
        getEffectiveFeatureModules(token, tenantId),
        getTenantBillingConfig(token, tenantId),
      ])
      setTenantModules(effective.modules)
      setBillingForm(mapBillingForm(billing))
      setUsageText(`Orders gezählt: ${billing.usage.ordersCounted} | Umsatz: ${(billing.usage.revenueCountedCents / 100).toFixed(2)} EUR`)
    })().catch((cause) => setError(cause instanceof Error ? cause.message : 'Tenant-Daten konnten nicht geladen werden'))
  }, [token, tenantId])

  useEffect(() => {
    if (!token || !chainId) return
    void getChainFeatureModules(token, chainId)
      .then((response) => {
        const next: Record<string, boolean> = {}
        for (const entry of response.settings) next[entry.featureKey] = entry.enabled
        setChainSettings(next)
      })
      .catch(() => setChainSettings({}))
  }, [token, chainId])

  async function withSave(action: () => Promise<void>, message: string) {
    try {
      setBusy(true)
      setError('')
      await action()
      setInfo(message)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Aktion fehlgeschlagen')
    } finally {
      setBusy(false)
    }
  }

  return (
    <BackofficeLayout brand="Superadmin" title="Module & Pakete" subtitle="Feature-Freigaben und Abrechnungsmodell pro Betrieb" navItems={SUPERADMIN_NAV_ITEMS}>
      {error ? <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
      {info ? <div className="mb-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-800">{info}</div> : null}
      <AdminPageShell>

      <AdminSectionCard title="Betrieb auswählen">
        <AdminFormGrid>
          <AdminSelect label="Kette" value={chainId} onChange={(event) => setChainId(event.target.value)}>
            {(context?.chains || []).map((chain) => <option key={chain.id} value={chain.id}>{chain.name}</option>)}
          </AdminSelect>
          <AdminSelect label="Filiale" value={tenantId} onChange={(event) => setTenantId(event.target.value)}>
            {filteredTenants.filter((entry) => !chainId || entry.chainId === chainId).map((tenant) => <option key={tenant.id} value={tenant.id}>{tenant.name}</option>)}
          </AdminSelect>
        </AdminFormGrid>
      </AdminSectionCard>

      <AdminSectionCard title="Pakete & Module">
        <div className="mt-3 flex flex-wrap gap-2">
          {packages.map((entry) => (
            <AdminButton key={entry.key} type="button" variant="secondary" disabled={!canEdit || busy || !tenantId} onClick={() => withSave(async () => {
              await applyTenantFeaturePackage(token, tenantId, entry.key)
              const effective = await getEffectiveFeatureModules(token, tenantId)
              setTenantModules(effective.modules)
            }, `Paket ${entry.name} angewendet.`)}>{entry.name}</AdminButton>
          ))}
        </div>
        <div className="mt-4 grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
          {tenantModules.map((entry) => (
            <label key={entry.key} className="flex items-center justify-between rounded-xl border border-[var(--brand-border)] px-3 py-2 text-xs">
              <span>{entry.name}</span>
              <input type="checkbox" checked={entry.enabled} disabled={!canEdit || busy} onChange={(event) => withSave(async () => {
                await updateTenantFeatureModules(token, tenantId, { featureKey: entry.key, enabled: event.target.checked })
                const effective = await getEffectiveFeatureModules(token, tenantId)
                setTenantModules(effective.modules)
              }, 'Modulstatus gespeichert.')} />
            </label>
          ))}
        </div>
        <h3 className="mt-5 text-sm font-semibold text-rose-900">Chain-Vorgaben</h3>
        <div className="mt-2 grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
          {catalog.map((entry) => (
            <label key={`chain-${entry.key}`} className="flex items-center justify-between rounded-xl border border-[var(--brand-border)] px-3 py-2 text-xs">
              <span>{entry.name}</span>
              <input type="checkbox" checked={chainSettings[entry.key] ?? entry.defaultEnabled} disabled={!canEdit || busy || !chainId} onChange={(event) => withSave(async () => {
                await updateChainFeatureModules(token, chainId, { featureKey: entry.key, enabled: event.target.checked })
                const response = await getChainFeatureModules(token, chainId)
                const next: Record<string, boolean> = {}
                for (const row of response.settings) next[row.featureKey] = row.enabled
                setChainSettings(next)
              }, 'Chain-Vorgabe gespeichert.')} />
            </label>
          ))}
        </div>
      </AdminSectionCard>

      <AdminSectionCard title="Abrechnung" description={usageText || 'Usage wird geladen...'}>
        {billingForm ? (
          <AdminFormGrid>
            <AdminTextInput type="number" label="Monatsgebühr (Cent)" value={billingForm.monthlyFeeCents} onChange={(event) => setBillingForm((current) => current ? { ...current, monthlyFeeCents: Number(event.target.value || 0) } : current)} disabled={!canEdit} />
            <AdminTextInput type="number" label="Provision (%)" value={billingForm.commissionPercent} onChange={(event) => setBillingForm((current) => current ? { ...current, commissionPercent: Number(event.target.value || 0) } : current)} disabled={!canEdit} />
            <AdminTextInput type="number" label="Inklusive Bestellungen" value={billingForm.includedOrders} onChange={(event) => setBillingForm((current) => current ? { ...current, includedOrders: Number(event.target.value || 0) } : current)} disabled={!canEdit} />
            <AdminTextInput type="number" label="Fixbetrag pro Order (Cent)" value={billingForm.fixedFeePerOrderCents} onChange={(event) => setBillingForm((current) => current ? { ...current, fixedFeePerOrderCents: Number(event.target.value || 0) } : current)} disabled={!canEdit} />
            <AdminTextInput type="date" label="Aktiv ab" value={billingForm.activeFrom} onChange={(event) => setBillingForm((current) => current ? { ...current, activeFrom: event.target.value } : current)} disabled={!canEdit} />
            <AdminButton type="button" disabled={!canEdit || busy} onClick={() => withSave(async () => {
              await updateTenantBillingConfig(token, tenantId, billingForm)
              await syncTenantBillingUsage(token, tenantId)
              const billing = await getTenantBillingConfig(token, tenantId)
              setBillingForm(mapBillingForm(billing))
              setUsageText(`Orders gezählt: ${billing.usage.ordersCounted} | Umsatz: ${(billing.usage.revenueCountedCents / 100).toFixed(2)} EUR`)
            }, 'Abrechnung gespeichert und Usage aktualisiert.')}>Speichern</AdminButton>
          </AdminFormGrid>
        ) : null}
      </AdminSectionCard>
      </AdminPageShell>
    </BackofficeLayout>
  )
}

