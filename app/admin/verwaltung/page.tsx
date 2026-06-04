'use client'

import { useEffect, useState } from 'react'
import SectionOverview from '@/app/Components/admin/SectionOverview'
import { getAccessUsers, getStoredAccessToken } from '@/lib/api'

export default function AdminManagementOverviewPage() {
  const [userCount, setUserCount] = useState<number | null>(null)

  useEffect(() => {
    let cancelled = false
    ;(async () => {
      try {
        const token = getStoredAccessToken()
        if (!token) return
        const users = await getAccessUsers(token)
        if (!cancelled) setUserCount(users.length)
      } catch {
        if (!cancelled) setUserCount(null)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [])

  return (
    <SectionOverview
      title="Verwaltung"
      subtitle="Benutzer, Filialdaten und Systemeinstellungen verwalten."
      metrics={[
        { label: 'Benutzer', value: userCount ?? '—' },
        { label: 'Rechtematrix', value: 'Aktiv' },
        { label: 'Filialdaten', value: 'Pflegbar' },
        { label: 'Offene Warnungen', value: 0 },
      ]}
      warnings={[]}
      quickActions={[
        { href: '/admin/staff', label: 'Benutzer & Rechte' },
        { href: '/admin/settings#business-settings', label: 'Filialdaten' },
        { href: '/admin/settings', label: 'Einstellungen' },
      ]}
    />
  )
}
