'use client'

import { useEffect, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import type { SessionUser } from '@/lib/app-data'

export default function AdminDisplaysPage() {
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
      title="Displays"
      subtitle="Display-Verwaltung wurde zentral in das Bildschirmstudio verschoben."
    >
      <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
        <p className="text-sm text-slate-700">
          Bitte nutze ab sofort das Bildschirmstudio für Geräte, Inhalte, Layout, Offline-Sync und Veröffentlichung.
        </p>
        <button
          type="button"
          onClick={() => {
            window.location.href = '/admin/screen-studio'
          }}
          className="mt-3 rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800"
        >
          Zum Bildschirmstudio
        </button>
      </div>
    </AdminLayout>
  )
}
