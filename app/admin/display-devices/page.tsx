'use client'

import { useEffect, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import type { SessionUser } from '@/lib/app-data'

export default function AdminDisplayDevicesPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null

    if (!parsed || parsed.role !== 'admin') {
      window.location.href = '/'
      return
    }

    setSession(parsed)
    setToken(parsed.accessToken || localStorage.getItem('accessToken') || '')
  }, [])

  if (!session || !token) {
    return null
  }

  return (
    <AdminLayout
      title="Display-Geräteverwaltung"
      subtitle="Dieser Bereich wurde in das Bildschirmstudio zusammengeführt."
    >
      <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
        <p className="text-sm text-slate-700">
          Geräte, QR-Pairing, Offline/Sync und Veröffentlichung verwaltest du jetzt zentral im Bildschirmstudio.
        </p>
        <button
          type="button"
          onClick={() => {
            window.location.href = '/admin/screen-studio?tab=devices'
          }}
          className="mt-3 rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800"
        >
          Zum Bildschirmstudio (Geräte)
        </button>
      </div>
    </AdminLayout>
  )
}
