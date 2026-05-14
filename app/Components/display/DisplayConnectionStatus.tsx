'use client'

import { type DisplayRuntimeConnectionState } from '@/lib/display-runtime'

type Props = {
  state: DisplayRuntimeConnectionState
  staleSeconds?: number | null
}

const statusMap: Record<DisplayRuntimeConnectionState, { label: string; className: string }> = {
  online: {
    label: 'Online',
    className: 'border-emerald-300/40 bg-emerald-500/20 text-emerald-100',
  },
  reconnecting: {
    label: 'Verbindung instabil',
    className: 'border-amber-300/40 bg-amber-500/20 text-amber-100',
  },
  offline_cached: {
    label: 'Verbindung unterbrochen',
    className: 'border-slate-400/40 bg-slate-700/50 text-slate-100',
  },
}

function formatAgo(seconds: number) {
  if (seconds < 60) {
    return 'gerade eben'
  }
  if (seconds < 3600) {
    return `vor ${Math.floor(seconds / 60)} Min.`
  }
  return `vor ${Math.floor(seconds / 3600)} Std.`
}

export function DisplayConnectionStatus({ state, staleSeconds = null }: Props) {
  if (state === 'online') {
    return null
  }
  const status = statusMap[state]
  const staleLabel = staleSeconds != null ? ` • Letzte Verbindung ${formatAgo(staleSeconds)}` : ''
  return (
    <div className="absolute right-3 top-3 z-50">
      <span className={`rounded-full border px-3 py-1 text-xs font-semibold ${status.className}`}>
        {status.label}
        {staleLabel}
      </span>
    </div>
  )
}
