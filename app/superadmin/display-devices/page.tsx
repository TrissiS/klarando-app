'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import type { SessionUser } from '@/lib/app-data'

export default function SuperadminDisplayDevicesPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null

    if (!parsed || parsed.role !== 'superadmin') {
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
    <BackofficeLayout
      brand="Superadmin"
      title="Display-Geräteverwaltung"
      subtitle="Dieser Bereich wurde in die zentrale Geräteübersicht verschoben."
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
        <p className="text-sm text-slate-700">
          Bitte nutze ab sofort die zentrale Seite „Geräte“ für Display-, OrderDesk- und Fahrergeräte.
        </p>
        <button
          type="button"
          onClick={() => {
            window.location.href = '/superadmin/devices'
          }}
          className="mt-3 rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800"
        >
          Zur Geräteübersicht
        </button>
      </div>
    </BackofficeLayout>
  )
}

