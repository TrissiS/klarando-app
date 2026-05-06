'use client'

import { useEffect, useState } from 'react'
import {
  createProductIngredient,
  getIngredients,
  getProducts,
  getProductIngredients,
  type Ingredient,
  type Product,
  type ProductIngredient,
} from '@/lib/api'

export default function ProductIngredientsPage() {
  const [products, setProducts] = useState<Product[]>([])
  const [ingredients, setIngredients] = useState<Ingredient[]>([])
  const [productIngredients, setProductIngredients] = useState<ProductIngredient[]>([])

  const [selectedProductId, setSelectedProductId] = useState('')
  const [selectedIngredientId, setSelectedIngredientId] = useState('')
  const [quantity, setQuantity] = useState('')

  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  async function loadBaseData() {
    try {
      setLoading(true)
      const [productData, ingredientData] = await Promise.all([
        getProducts(),
        getIngredients(),
      ])

      setProducts(productData)
      setIngredients(ingredientData)

      if (productData.length > 0 && !selectedProductId) {
        setSelectedProductId(productData[0].id)
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Fehler beim Laden')
    } finally {
      setLoading(false)
    }
  }

  async function loadProductIngredients(productId: string) {
    try {
      const data = await getProductIngredients(productId)
      setProductIngredients(data)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Fehler beim Laden der Produkt-Zutaten')
    }
  }

  useEffect(() => {
    loadBaseData()
  }, [])

  useEffect(() => {
    if (selectedProductId) {
      loadProductIngredients(selectedProductId)
    }
  }, [selectedProductId])

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()

    try {
      setSaving(true)
      setError('')
      setSuccess('')

      await createProductIngredient({
        productId: selectedProductId,
        ingredientId: selectedIngredientId,
        quantity: Number(quantity),
      })

      setSelectedIngredientId('')
      setQuantity('')
      setSuccess('Zutat dem Produkt hinzugefügt')

      await loadProductIngredients(selectedProductId)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Fehler beim Speichern')
    } finally {
      setSaving(false)
    }
  }

  return (
    <main style={{ padding: '24px', maxWidth: '900px' }}>
      <h1>Produkt-Zutaten</h1>

      {error && <p style={{ color: 'red' }}>{error}</p>}
      {success && <p style={{ color: 'green' }}>{success}</p>}

      {loading ? (
        <p>Lade Daten...</p>
      ) : (
        <>
          <section style={{ marginBottom: '32px' }}>
            <h2>Produkt auswählen</h2>
            <select
              value={selectedProductId}
              onChange={(e) => setSelectedProductId(e.target.value)}
              style={{ width: '100%', padding: '8px', maxWidth: '500px' }}
            >
              {products.map((product) => (
                <option key={product.id} value={product.id}>
                  {product.name}
                </option>
              ))}
            </select>
          </section>

          <section style={{ marginBottom: '32px' }}>
            <h2>Zutat hinzufügen</h2>

            <form onSubmit={handleSubmit} style={{ display: 'grid', gap: '12px', maxWidth: '500px' }}>
              <div>
                <label>Zutat</label>
                <br />
                <select
                  value={selectedIngredientId}
                  onChange={(e) => setSelectedIngredientId(e.target.value)}
                  required
                  style={{ width: '100%', padding: '8px' }}
                >
                  <option value="">Bitte wählen</option>
                  {ingredients.map((ingredient) => (
                    <option key={ingredient.id} value={ingredient.id}>
                      {ingredient.name} ({ingredient.unit})
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label>Menge</label>
                <br />
                <input
                  type="number"
                  step="0.01"
                  value={quantity}
                  onChange={(e) => setQuantity(e.target.value)}
                  required
                  style={{ width: '100%', padding: '8px' }}
                />
              </div>

              <button type="submit" disabled={saving} style={{ padding: '10px 16px', cursor: 'pointer' }}>
                {saving ? 'Speichert...' : 'Zutat zuweisen'}
              </button>
            </form>
          </section>

          <section>
            <h2>Zugewiesene Zutaten</h2>

            {productIngredients.length === 0 ? (
              <p>Für dieses Produkt sind noch keine Zutaten hinterlegt.</p>
            ) : (
              <ul>
                {productIngredients.map((item) => (
                  <li key={item.id} style={{ marginBottom: '12px' }}>
                    <strong>{item.ingredient.name}</strong>
                    <br />
                    Menge: {item.quantity} {item.ingredient.unit}
                    <br />
                    Einkaufspreis netto: {item.ingredient.purchasePrice} €
                  </li>
                ))}
              </ul>
            )}
          </section>
        </>
      )}
    </main>
  )
}
