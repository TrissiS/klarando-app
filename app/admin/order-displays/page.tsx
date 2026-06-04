'use client'

import { useEffect, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import type { SessionUser } from '@/lib/app-data'

export default function AdminOrderDisplaysPage() {
  const [session, setSession] = useState<SessionUser | null>(null)

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null
    if (!parsed || !parsed.accessToken) {
      window.location.href = '/'
      return
    }
    setSession(parsed)
  }, [])

  if (!session) return null

  return (
    <AdminLayout
      title="Bestellanzeigen & Abholmonitore"
      subtitle="Dieser Bereich ist nur noch für Bestellanzeigen, Pickup-Monitore und Legacy-Zuordnung relevant."
    >
      <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
        <p className="text-sm text-slate-700">
          Menübildschirme und TV-Vorschauen laufen ausschließlich über das Bildschirmstudio und
          die Route <span className="font-mono">/screen/[deviceCode]</span>.
        </p>
        <p className="mt-2 text-sm text-slate-700">
          Diese Seite dient nur noch als fachlicher Einstieg für Bestellanzeigen,
          Abholmonitore und bestehende Legacy-Konfigurationen rund um CASH, KITCHEN und PICKUP.
        </p>
        <button
          type="button"
          onClick={() => {
            window.location.href = '/admin/screen-studio?tab=devices'
          }}
          className="mt-3 rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800"
        >
          Zum Bildschirmstudio (Menübildschirme)
        </button>
      </div>
    </AdminLayout>
  )
}
