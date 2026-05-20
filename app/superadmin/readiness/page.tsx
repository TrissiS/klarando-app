'use client'

import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'

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
  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Production Readiness"
      subtitle="Ampelstatus für zentrale Klarando-Bereiche."
      navItems={SUPERADMIN_NAV_ITEMS}
    >
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
