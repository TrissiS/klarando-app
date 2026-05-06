'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'

export default function AdminIngredientsPage() {
  const router = useRouter()

  useEffect(() => {
    router.replace('/admin/products?tab=ingredients')
  }, [router])

  return null
}
