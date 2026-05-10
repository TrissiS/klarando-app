'use client'

import { useEffect, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import DisplayDeviceManagementPanel from '@/app/Components/admin/DisplayDeviceManagementPanel'
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
      subtitle="Online/Offline-Status, Pairing und Browser-Vorschau für alle Displays deiner Filiale"
    >
      <DisplayDeviceManagementPanel token={token} roleScope="admin" fixedTenantId={session.tenantId || null} />
    </AdminLayout>
  )
}
