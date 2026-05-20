'use client'

import { useEffect, useState } from 'react'
import SectionOverview from '@/app/Components/admin/SectionOverview'
import { getCategories, getIngredients, getProducts } from '@/lib/api'

export default function MenuOverviewPage() {
  const [productsCount, setProductsCount] = useState<number | null>(null)
  const [categoriesCount, setCategoriesCount] = useState<number | null>(null)
  const [ingredientsCount, setIngredientsCount] = useState<number | null>(null)

  useEffect(() => {
    let cancelled = false
    ;(async () => {
      try {
        const [products, categories, ingredients] = await Promise.all([
          getProducts(),
          getCategories(),
          getIngredients(),
        ])
        if (cancelled) return
        setProductsCount(products.length)
        setCategoriesCount(categories.length)
        setIngredientsCount(ingredients.length)
      } catch {
        if (cancelled) return
        setProductsCount(null)
        setCategoriesCount(null)
        setIngredientsCount(null)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [])

  return (
    <SectionOverview
      title="Speisekarte"
      subtitle="Produkte, Kategorien, Zutaten und Import zentral verwalten."
      metrics={[
        { label: 'Produkte', value: productsCount ?? '—' },
        { label: 'Kategorien', value: categoriesCount ?? '—' },
        { label: 'Zutaten', value: ingredientsCount ?? '—' },
        { label: 'Menüstatus', value: 'Aktiv' },
      ]}
      warnings={[]}
      quickActions={[
        { href: '/admin/products', label: 'Produkte bearbeiten' },
        { href: '/admin/categories', label: 'Kategorien verwalten' },
        { href: '/admin/business-templates', label: 'Business-Vorlagen öffnen' },
      ]}
    />
  )
}
