'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import { getCmsPageById, type CmsPage } from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'
import CmsPageRenderer from '@/components/cms/CmsPageRenderer'

export default function CmsPreviewPage() {
  const params = useParams<{ pageId: string }>()
  const pageId = typeof params?.pageId === 'string' ? params.pageId : ''
  const [page, setPage] = useState<CmsPage | null>(null)
  const [error, setError] = useState('')

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/superadmin'
      return
    }
    const token = parsed.accessToken || localStorage.getItem('accessToken') || ''
    if (!token) {
      setError('Nicht eingeloggt.')
      return
    }
    if (!pageId) {
      setError('Seite nicht gefunden.')
      return
    }
    getCmsPageById(token, pageId)
      .then(setPage)
      .catch((cause) => {
        setError(cause instanceof Error ? cause.message : 'Vorschau konnte nicht geladen werden')
      })
  }, [pageId])

  return (
    <main className="min-h-screen bg-slate-100 px-4 py-6 md:px-8">
      <div className="mx-auto w-full max-w-6xl">
        <header className="mb-4 rounded-2xl border border-slate-200 bg-white px-4 py-3">
          <h1 className="text-xl font-semibold text-[var(--brand-ink)]">
            CMS Vorschau {page ? `· ${page.title}` : ''}
          </h1>
          <p className="text-sm text-slate-600">Entwurfsvorschau nur für Superadmin</p>
        </header>
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
        {page ? <CmsPageRenderer blocks={page.contentJson || []} /> : null}
      </div>
    </main>
  )
}
