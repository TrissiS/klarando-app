'use client'

import { useEffect } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import type { SessionUser } from '@/lib/app-data'

export default function SuperadminDisplayDevicesPage() {
  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null

    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/'
      return
    }

    const timer = window.setTimeout(() => {
      window.location.replace('/superadmin/devices')
    }, 250)

    return () => window.clearTimeout(timer)
  }, [])

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Display-Geräteverwaltung"
      subtitle="Diese Legacy-Seite verweist nur noch auf die zentrale Geräteübersicht."
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
        <p className="text-sm text-slate-700">
          Du wirst zur zentralen Geräteverwaltung unter <code>/superadmin/devices</code> weitergeleitet.
        </p>
        <button
          type="button"
          onClick={() => {
            window.location.replace('/superadmin/devices')
          }}
          className="mt-3 rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800"
        >
          Jetzt zur Geräteübersicht
        </button>
      </div>
    </BackofficeLayout>
  )
}
