'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'

export default function LegacyAdminScreenPage() {
  const router = useRouter()

  useEffect(() => {
    router.replace('/admin/screen-studio')
  }, [router])

  return (
    <div className="flex min-h-screen items-center justify-center bg-slate-50 px-6 text-center">
      <div className="rounded-2xl border border-slate-200 bg-white px-6 py-5 shadow-sm">
        <p className="text-sm text-slate-700">Wir leiten dich ins Bildschirmstudio weiter …</p>
      </div>
    </div>
  )
}
