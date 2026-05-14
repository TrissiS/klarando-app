'use client'

import { useEffect, useState, type ReactNode } from 'react'
import { getPublicCmsPage, type CmsPage } from '@/lib/api'
import CmsPageRenderer from './CmsPageRenderer'

export default function PublicCmsPage({
  slug,
  fallback,
}: {
  slug: string
  fallback: ReactNode
}) {
  const [page, setPage] = useState<CmsPage | null>(null)
  const [loaded, setLoaded] = useState(false)

  useEffect(() => {
    let active = true
    getPublicCmsPage(slug)
      .then((value) => {
        if (!active) return
        setPage(value)
      })
      .finally(() => {
        if (!active) return
        setLoaded(true)
      })
    return () => {
      active = false
    }
  }, [slug])

  if (!loaded) {
    return <>{fallback}</>
  }

  if (!page) {
    return <>{fallback}</>
  }

  return (
    <main className="brand-shell min-h-screen px-4 py-6 md:px-8">
      <div className="mx-auto w-full max-w-6xl">
        <CmsPageRenderer blocks={page.contentJson || []} />
      </div>
    </main>
  )
}
