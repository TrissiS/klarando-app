import { getCategories, getProducts } from '@/lib/api'

export const dynamic = 'force-dynamic'

export default async function TestApiPage() {
  let categories = [] as Awaited<ReturnType<typeof getCategories>>
  let products = [] as Awaited<ReturnType<typeof getProducts>>
  let loadError = ''

  try {
    ;[categories, products] = await Promise.all([getCategories(), getProducts()])
  } catch (error) {
    loadError =
      error instanceof Error
        ? error.message
        : 'API-Daten konnten nicht geladen werden.'
  }

  return (
    <main style={{ padding: '24px' }}>
      <h1>API Test</h1>

      {loadError ? (
        <p style={{ marginBottom: '24px', color: '#b91c1c' }}>
          Backend/API aktuell nicht erreichbar: {loadError}
        </p>
      ) : null}

      <section style={{ marginBottom: '32px' }}>
        <h2>Kategorien</h2>
        {categories.length === 0 ? (
          <p>Keine Kategorien gefunden.</p>
        ) : (
          <ul>
            {categories.map((category) => (
              <li key={category.id}>
                {category.name} (Sortierung: {category.sortOrder})
              </li>
            ))}
          </ul>
        )}
      </section>

      <section>
        <h2>Produkte</h2>
        {products.length === 0 ? (
          <p>Keine Produkte gefunden.</p>
        ) : (
          <ul>
            {products.map((product) => (
              <li key={product.id}>
                <strong>{product.name}</strong> - {product.price} EUR
                <br />
                Nummer: {product.productNumber}
                <br />
                Kategorie: {product.category?.name ?? 'Keine Kategorie'}
              </li>
            ))}
          </ul>
        )}
      </section>
    </main>
  )
}
