'use client'

import { useEffect, useState } from 'react'
import { getCalculation, getProducts, type Product } from '@/lib/api'

export default function CalculationPage() {
  const [products, setProducts] = useState<Product[]>([])
  const [selectedProductId, setSelectedProductId] = useState('')
  const [calculation, setCalculation] = useState<any>(null)

  async function loadProducts() {
    const data = await getProducts()
    setProducts(data)

    if (data.length > 0) {
      setSelectedProductId(data[0].id)
    }
  }

  async function loadCalculation(productId: string) {
    const data = await getCalculation(productId)
    setCalculation(data)
  }

  useEffect(() => {
    loadProducts()
  }, [])

  useEffect(() => {
    if (selectedProductId) {
      loadCalculation(selectedProductId)
    }
  }, [selectedProductId])

  return (
    <main style={{ padding: '24px' }}>
      <h1>Kalkulation</h1>

      <select
        value={selectedProductId}
        onChange={(e) => setSelectedProductId(e.target.value)}
        style={{ marginBottom: '20px', padding: '8px' }}
      >
        {products.map((p) => (
          <option key={p.id} value={p.id}>
            {p.name}
          </option>
        ))}
      </select>

      {calculation && (
        <div>
          <h2>{calculation.productName}</h2>

          <p>Verkaufspreis: {calculation.sellingPrice} €</p>
          <p>EK gesamt: {calculation.totalCost.toFixed(2)} €</p>
          <p>Marge: {calculation.margin.toFixed(2)} €</p>
          <p>Marge %: {calculation.marginPercent.toFixed(2)} %</p>

          <h3>Zutaten</h3>
          <ul>
            {calculation.ingredients.map((i: any, idx: number) => (
              <li key={idx}>
                {i.name} – {i.quantity} {i.unit} → {i.cost.toFixed(2)} €
              </li>
            ))}
          </ul>
        </div>
      )}
    </main>
  )
}