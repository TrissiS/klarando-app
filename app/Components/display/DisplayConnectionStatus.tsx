'use client'

import { type DisplayRuntimeConnectionState } from '@/lib/display-runtime'

type Props = {
  state: DisplayRuntimeConnectionState
}

const statusMap: Record<DisplayRuntimeConnectionState, { label: string; className: string }> = {
  online: {
    label: 'Online',
    className: 'border-emerald-300/40 bg-emerald-500/20 text-emerald-100',
  },
  reconnecting: {
    label: 'Verbindung wird erneuert',
    className: 'border-amber-300/40 bg-amber-500/20 text-amber-100',
  },
  offline_cached: {
    label: 'Offline (Cache aktiv)',
    className: 'border-slate-400/40 bg-slate-700/50 text-slate-100',
  },
}

export function DisplayConnectionStatus({ state }: Props) {
  const status = statusMap[state]
  return (
    <div className="absolute right-3 top-3 z-50">
      <span className={`rounded-full border px-3 py-1 text-xs font-semibold ${status.className}`}>
        {status.label}
      </span>
    </div>
  )
}
