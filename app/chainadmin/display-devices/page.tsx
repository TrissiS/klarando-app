'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { CHAINADMIN_NAV_ITEMS } from '@/app/chainadmin/nav'
import DisplayDeviceManagementPanel from '@/app/Components/admin/DisplayDeviceManagementPanel'
import type { SessionUser } from '@/lib/app-data'

export default function ChainadminDisplayDevicesPage() {
  const [session, setSession] = useState<SessionUser | null>(null)
  const [token, setToken] = useState('')

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null

    if (!parsed || parsed.role !== 'chainadmin') {
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
      brand="Kettenadmin"
      title="Display-Geräteverwaltung"
      subtitle="Alle Displays deiner Kette mit Status, Pairing und Vorschau im Blick"
      navItems={CHAINADMIN_NAV_ITEMS}
    >
      <DisplayDeviceManagementPanel token={token} roleScope="chainadmin" fixedChainId={session.chainId || null} />
    </BackofficeLayout>
  )
}

