'use client'

import { useEffect, useState } from 'react'
import SectionOverview from '@/app/Components/admin/SectionOverview'
import { getOrderDisplays, getOrderTerminals, getScreenDevices } from '@/lib/api'

export default function DevicesOverviewPage() {
  const [screenCount, setScreenCount] = useState<number | null>(null)
  const [terminalCount, setTerminalCount] = useState<number | null>(null)
  const [displayCount, setDisplayCount] = useState<number | null>(null)

  useEffect(() => {
    let cancelled = false
    ;(async () => {
      try {
        const [screens, terminals, displays] = await Promise.all([
          getScreenDevices(),
          getOrderTerminals(),
          getOrderDisplays(),
        ])
        if (cancelled) return
        setScreenCount(screens.length)
        setTerminalCount(terminals.length)
        setDisplayCount(displays.length)
      } catch {
        if (cancelled) return
        setScreenCount(null)
        setTerminalCount(null)
        setDisplayCount(null)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [])

  return (
    <SectionOverview
      title="Geräte"
      subtitle="Bildschirme, Terminals und gekoppelte Geräte im Blick behalten."
      metrics={[
        { label: 'Screens', value: screenCount ?? '—' },
        { label: 'OrderDesk-Terminals', value: terminalCount ?? '—' },
        { label: 'Order-Displays', value: displayCount ?? '—' },
        { label: 'Gerätezustand', value: 'Überwacht' },
      ]}
      warnings={[]}
      quickActions={[
        { href: '/admin/screen-studio', label: 'Bildschirmstudio öffnen' },
        { href: '/admin/display-devices', label: 'Display-Geräte verwalten' },
        { href: '/admin/terminals', label: 'OrderDesk-Geräte öffnen' },
      ]}
    />
  )
}
