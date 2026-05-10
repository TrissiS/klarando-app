'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import DisplayDeviceManagementPanel from '@/app/Components/admin/DisplayDeviceManagementPanel'
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
      subtitle="Globale Übersicht über alle Display-Geräte, Status und Vorschauen"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <DisplayDeviceManagementPanel token={token} roleScope="superadmin" />
    </BackofficeLayout>
  )
}

