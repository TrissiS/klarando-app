'use client'

import { useMemo, useState } from 'react'

const tabs = [
  'Übersicht',
  'Räume/Bereiche',
  'Tische',
  'QR-Codes',
  'Service-Rufe',
  'Einstellungen',
] as const

export default function AdminTableOrderingPage() {
  const [activeTab, setActiveTab] = useState<(typeof tabs)[number]>('Übersicht')
  const tabContent = useMemo(() => {
    if (activeTab === 'Übersicht') return 'Table Ordering Foundation ist aktiv. Bereiche, Tische und Session-API sind vorbereitet.'
    if (activeTab === 'Räume/Bereiche') return 'Bereichsverwaltung über /api/table-ordering/areas vorbereitet.'
    if (activeTab === 'Tische') return 'Tischverwaltung inklusive QR-Token über /api/table-ordering/tables vorbereitet.'
    if (activeTab === 'QR-Codes') return 'QR-Flow über /table/:qrCodeToken und Session-Start vorbereitet.'
    if (activeTab === 'Service-Rufe') return 'Service-Calls (Kellner, Rechnung, Hilfe) sind als API-Basis vorbereitet.'
    return 'Weitere Funktionen (Bestellabschluss, Tischcheckout, Druck) sind als nächste Schritte geplant.'
  }, [activeTab])

  return (
    <div className="mx-auto w-full max-w-6xl p-6">
      <h1 className="text-2xl font-semibold">Table Ordering</h1>
      <p className="mt-2 text-sm text-slate-500">
        Gäste bestellen später per Tisch-QR. Dieser Bereich ist als sichere Foundation bereitgestellt.
      </p>

      <div className="mt-6 flex flex-wrap gap-2">
        {tabs.map((tab) => (
          <button
            key={tab}
            type="button"
            onClick={() => setActiveTab(tab)}
            className={`rounded-lg border px-3 py-2 text-sm ${activeTab === tab ? 'border-orange-500 bg-orange-500/10 text-orange-600' : 'border-slate-300 text-slate-600'}`}
          >
            {tab}
          </button>
        ))}
      </div>

      <div className="mt-6 rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
        <h2 className="text-base font-semibold">{activeTab}</h2>
        <p className="mt-2 text-sm text-slate-600">{tabContent}</p>
        <p className="mt-4 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
          In Vorbereitung: Live Tisch-Bestellungen mit Kitchen/OrderDesk Durchleitung und Zahlungsabschluss.
        </p>
      </div>
    </div>
  )
}
