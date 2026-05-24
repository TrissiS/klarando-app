'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  getAccessContext,
  getDisplayDeviceOverview,
  getStoredAccessToken,
  type AccessContext,
  type DisplayDeviceOverviewRow,
} from '@/lib/api'

type ReadinessStatus = 'READY' | 'LIMITED' | 'IN_PREPARATION' | 'BROKEN'

const rows: Array<{
  module: string
  status: ReadinessStatus
  lastError: string
  todos: string
  risk: string
  nextStep: string
}> = [
  {
    module: 'Menü-Import',
    status: 'LIMITED',
    lastError: 'OCR/Parser Edgecases bei Sonderkarten',
    todos: 'Fallback-Regeln und QA-Testset weiter schärfen',
    risk: 'Mittel',
    nextStep: 'Regression-Set mit Referenzkarten',
  },
  {
    module: 'Display Runtime',
    status: 'LIMITED',
    lastError: 'Legacy/Primary Kompatibilität in Restpfaden',
    todos: 'Runtime-Builder überall zentral nutzen',
    risk: 'Mittel',
    nextStep: 'Legacy-Endpunkte intern auf Builder führen',
  },
  {
    module: 'OrderDesk',
    status: 'LIMITED',
    lastError: 'Einzelne Geräteaktionen noch unterschiedlich',
    todos: 'Action-Matrix je Gerätetyp vereinheitlichen',
    risk: 'Mittel',
    nextStep: 'Feature-Gating pro Button erzwingen',
  },
  {
    module: 'Fahrer-App',
    status: 'IN_PREPARATION',
    lastError: 'Einheitlicher Device-Action-Flow fehlt',
    todos: 'Driver-spezifische Geräteschnittstellen finalisieren',
    risk: 'Mittel',
    nextStep: 'Driver Device API standardisieren',
  },
  {
    module: 'Billing',
    status: 'LIMITED',
    lastError: 'Rechtliche Detailprozesse noch offen',
    todos: 'Invoice Flow + Freigabeprozess weiter härten',
    risk: 'Mittel',
    nextStep: 'Freigabe + Versandstatus End-to-End testen',
  },
  {
    module: 'Payment',
    status: 'IN_PREPARATION',
    lastError: 'Einzug nur vorbereitet',
    todos: 'Provider-Anbindung schrittweise in Testmodus',
    risk: 'Hoch',
    nextStep: 'Provider Sandbox Flow integrieren',
  },
  {
    module: 'POS',
    status: 'IN_PREPARATION',
    lastError: 'Device-Quelle noch nicht vollständig angeschlossen',
    todos: 'POS APIs und Statuspfade verbinden',
    risk: 'Mittel',
    nextStep: 'POS Device Adapter einführen',
  },
  {
    module: 'Delivery Polygon',
    status: 'READY',
    lastError: '—',
    todos: 'Weitere E2E-Checks ergänzen',
    risk: 'Niedrig',
    nextStep: 'Smoke-Test in Release-Checklist',
  },
  {
    module: 'Geräte-Kopplung',
    status: 'LIMITED',
    lastError: 'Nicht alle Gerätetypen gleich weit',
    todos: 'Nicht angebundene Aktionen klar disabled halten',
    risk: 'Mittel',
    nextStep: 'Kopplungsflow je Gerätetyp abschließen',
  },
]

const statusClass: Record<ReadinessStatus, string> = {
  READY: 'bg-emerald-100 text-emerald-700',
  LIMITED: 'bg-amber-100 text-amber-700',
  IN_PREPARATION: 'bg-slate-200 text-slate-700',
  BROKEN: 'bg-rose-100 text-rose-700',
}

export default function SuperadminReadinessPage() {
  const [displayRows, setDisplayRows] = useState<DisplayDeviceOverviewRow[]>([])
  const [accessContext, setAccessContext] = useState<AccessContext | null>(null)
  const [lastApiError, setLastApiError] = useState('—')

  useEffect(() => {
    let cancelled = false
    ;(async () => {
      try {
        const token = getStoredAccessToken()
        if (!token) return
        const [context, displays] = await Promise.all([
          getAccessContext(token),
          getDisplayDeviceOverview(token),
        ])
        if (cancelled) return
        setAccessContext(context)
        setDisplayRows(displays.rows || [])
      } catch (error) {
        if (cancelled) return
        setLastApiError(error instanceof Error ? error.message : 'Unbekannter API-Fehler')
      }
    })()
    return () => {
      cancelled = true
    }
  }, [])

  const readinessStats = useMemo(() => {
    const offlineDevices = displayRows.filter((row) => row.status === 'offline').length
    const unpairedDisplays = displayRows.filter((row) => !row.pairingSupported).length
    const incompleteBranches = (accessContext?.tenants || []).filter((tenant) => !tenant.name?.trim()).length
    return {
      offlineDevices,
      unpairedDisplays,
      missingModulePrices: 'N/A (lokale Preis-Drafts, zentrale API folgt)',
      incompleteBranches,
    }
  }, [accessContext?.tenants, displayRows])

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Production Readiness"
      subtitle="Ampelstatus für zentrale Klarando-Bereiche."
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="mb-4 grid gap-3 md:grid-cols-2 xl:grid-cols-5">
        <div className="rounded-2xl border border-slate-200 bg-white p-3 shadow-sm">
          <p className="text-xs text-slate-500">Letzter API-Fehler</p>
          <p className="mt-1 text-sm font-semibold text-slate-900">{lastApiError}</p>
        </div>
        <div className="rounded-2xl border border-slate-200 bg-white p-3 shadow-sm">
          <p className="text-xs text-slate-500">Offline-Geräte</p>
          <p className="mt-1 text-sm font-semibold text-slate-900">{readinessStats.offlineDevices}</p>
        </div>
        <div className="rounded-2xl border border-slate-200 bg-white p-3 shadow-sm">
          <p className="text-xs text-slate-500">Ungepaarte Displays</p>
          <p className="mt-1 text-sm font-semibold text-slate-900">{readinessStats.unpairedDisplays}</p>
        </div>
        <div className="rounded-2xl border border-slate-200 bg-white p-3 shadow-sm">
          <p className="text-xs text-slate-500">Fehlende Modulpreise</p>
          <p className="mt-1 text-sm font-semibold text-slate-900">{readinessStats.missingModulePrices}</p>
        </div>
        <div className="rounded-2xl border border-slate-200 bg-white p-3 shadow-sm">
          <p className="text-xs text-slate-500">Unvollständige Filialen</p>
          <p className="mt-1 text-sm font-semibold text-slate-900">{readinessStats.incompleteBranches}</p>
        </div>
      </div>
      <div className="overflow-x-auto rounded-2xl border border-slate-200 bg-white">
        <table className="min-w-full text-sm">
          <thead className="bg-slate-50 text-left text-xs uppercase tracking-wide text-slate-500">
            <tr>
              <th className="px-3 py-2">Modul</th>
              <th className="px-3 py-2">Status</th>
              <th className="px-3 py-2">Letzter Fehler</th>
              <th className="px-3 py-2">Offene TODOs</th>
              <th className="px-3 py-2">Risiko</th>
              <th className="px-3 py-2">Nächster Schritt</th>
            </tr>
          </thead>
          <tbody>
            {rows.map((row) => (
              <tr key={row.module} className="border-t border-slate-100">
                <td className="px-3 py-2 font-semibold text-slate-900">{row.module}</td>
                <td className="px-3 py-2">
                  <span className={`rounded-full px-2 py-1 text-xs font-semibold ${statusClass[row.status]}`}>
                    {row.status}
                  </span>
                </td>
                <td className="px-3 py-2 text-slate-700">{row.lastError}</td>
                <td className="px-3 py-2 text-slate-700">{row.todos}</td>
                <td className="px-3 py-2 text-slate-700">{row.risk}</td>
                <td className="px-3 py-2 text-slate-700">{row.nextStep}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </BackofficeLayout>
  )
}
