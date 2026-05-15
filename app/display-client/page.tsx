'use client'

import { useEffect, useMemo, useState } from 'react'
import { API_BASE_URL } from '@/lib/config'

type DisplayContentResponse = {
  screen?: {
    name?: string
    backgroundColor?: string
    accentColor?: string
    layoutType?: string
  }
  items?: Array<{
    id: string
    type: string
    durationSeconds: number
    config: Record<string, unknown>
  }>
  updatedAt?: string
}

function readTokenFromUrl() {
  if (typeof window === 'undefined') return ''
  const params = new URLSearchParams(window.location.search)
  return params.get('deviceToken') || ''
}

export default function DisplayClientPage() {
  const [token, setToken] = useState('')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [content, setContent] = useState<DisplayContentResponse | null>(null)
  const [activeIndex, setActiveIndex] = useState(0)

  useEffect(() => {
    setToken(readTokenFromUrl())
  }, [])

  useEffect(() => {
    if (!token) {
      setLoading(false)
      setError('Display noch nicht eingerichtet.')
      return
    }

    let mounted = true
    const load = async () => {
      try {
        const response = await fetch(`${API_BASE_URL}/api/display/content`, {
          headers: { Authorization: `Bearer ${token}` },
          cache: 'no-store',
        })
        const data = await response.json().catch(() => ({}))
        if (!response.ok) {
          throw new Error(data?.message || 'Display-Inhalte konnten nicht geladen werden.')
        }
        if (!mounted) return
        setContent(data as DisplayContentResponse)
        setError('')
      } catch (err) {
        if (!mounted) return
        setError(err instanceof Error ? err.message : 'Verbindung wird wiederhergestellt …')
      } finally {
        if (mounted) setLoading(false)
      }
    }

    void load()
    const interval = setInterval(() => {
      void load()
    }, 30000)

    return () => {
      mounted = false
      clearInterval(interval)
    }
  }, [token])

  const items = useMemo(() => content?.items ?? [], [content])

  useEffect(() => {
    if (items.length === 0) return
    const item = items[Math.min(activeIndex, items.length - 1)]
    const duration = Math.max(3, item.durationSeconds || 10)
    const timer = setTimeout(() => {
      setActiveIndex((current) => (current + 1) % items.length)
    }, duration * 1000)
    return () => clearTimeout(timer)
  }, [items, activeIndex])

  const activeItem = items.length > 0 ? items[Math.min(activeIndex, items.length - 1)] : null

  return (
    <main
      className="h-screen w-screen overflow-hidden"
      style={{
        backgroundColor: content?.screen?.backgroundColor || '#111827',
        color: '#ffffff',
      }}
    >
      {loading ? (
        <div className="flex h-full items-center justify-center text-xl">Lade Display …</div>
      ) : error ? (
        <div className="flex h-full items-center justify-center p-8 text-center text-xl">{error}</div>
      ) : activeItem ? (
        <section className="flex h-full w-full items-center justify-center p-10">
          <article className="w-full max-w-6xl rounded-3xl bg-black/20 p-8">
            <p className="mb-2 text-sm uppercase tracking-[0.2em] text-white/70">{activeItem.type}</p>
            <h1 className="text-5xl font-bold">{`${activeItem.config?.title || activeItem.config?.name || 'Klarando Display'}`}</h1>
            <p className="mt-4 text-2xl text-white/80">{`${activeItem.config?.text || activeItem.config?.description || ''}`}</p>
            {activeItem.config?.price ? <p className="mt-6 text-4xl font-semibold">{`${activeItem.config.price} €`}</p> : null}
          </article>
        </section>
      ) : (
        <div className="flex h-full items-center justify-center p-8 text-center text-xl">Display noch nicht eingerichtet.</div>
      )}
    </main>
  )
}
