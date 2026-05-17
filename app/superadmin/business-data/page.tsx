'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'

export default function SuperadminBusinessDataPage() {
  const router = useRouter()

  useEffect(() => {
    router.replace('/superadmin/app-settings?tab=stammdaten')
  }, [router])

  return null
}
