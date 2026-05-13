'use client'

import { useEffect, useMemo, useState } from 'react'
import {
  LayoutDashboard,
  Shapes,
  Package,
  CookingPot,
  CheckCircle2,
  AlertCircle,
  PlusCircle,
  Tags,
  Euro,
  Warehouse,
  Hash,
  Percent,
  type LucideIcon,
} from 'lucide-react'
import {
  createCategory,
  createIngredient,
  createProduct,
  getCategories,
  getIngredients,
  getProducts,
  type Category,
  type Ingredient,
  type Product,
} from '@/lib/api'

type AdminTab = 'overview' | 'categories' | 'products' | 'ingredients'

export default function AdminPage() {
  const [activeTab, setActiveTab] = useState<AdminTab>('overview')

  const [categories, setCategories] = useState<Category[]>([])
  const [products, setProducts] = useState<Product[]>([])
  const [ingredients, setIngredients] = useState<Ingredient[]>([])

  const [categoryName, setCategoryName] = useState('')
  const [categorySortOrder, setCategorySortOrder] = useState('0')

  const [productNumber, setProductNumber] = useState('')
  const [productName, setProductName] = useState('')
  const [price, setPrice] = useState('')
  const [vatRate, setVatRate] = useState('19')
  const [categoryId, setCategoryId] = useState('')

  const [ingredientName, setIngredientName] = useState('')
  const [ingredientUnit, setIngredientUnit] = useState('g')
  const [purchasePrice, setPurchasePrice] = useState('')
  const [deposit, setDeposit] = useState('0')
  const [supplier, setSupplier] = useState('')
  const [articleNumber, setArticleNumber] = useState('')

  const [loading, setLoading] = useState(true)
  const [savingCategory, setSavingCategory] = useState(false)
  const [savingProduct, setSavingProduct] = useState(false)
  const [savingIngredient, setSavingIngredient] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  async function loadData() {
    try {
      setLoading(true)
      setError('')

      const [categoryData, productData, ingredientData] = await Promise.all([
        getCategories(),
        getProducts(),
        getIngredients(),
      ])

      setCategories(categoryData)
      setProducts(productData)
      setIngredients(ingredientData)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Fehler beim Laden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadData()
  }, [])

  async function handleCategorySubmit(e: React.FormEvent) {
    e.preventDefault()

    try {
      setSavingCategory(true)
      setError('')
      setSuccess('')

      await createCategory({
        name: categoryName,
        sortOrder: Number(categorySortOrder),
      })

      setCategoryName('')
      setCategorySortOrder('0')
      setSuccess('Kategorie erfolgreich erstellt')
      setActiveTab('categories')

      await loadData()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Fehler beim Speichern der Kategorie')
    } finally {
      setSavingCategory(false)
    }
  }

  async function handleProductSubmit(e: React.FormEvent) {
    e.preventDefault()

    try {
      setSavingProduct(true)
      setError('')
      setSuccess('')

      await createProduct({
        categoryId: categoryId || null,
        productNumber,
        name: productName,
        price: Number(price),
        vatRate: Number(vatRate),
        available: true,
      })

      setProductNumber('')
      setProductName('')
      setPrice('')
      setVatRate('19')
      setCategoryId('')
      setSuccess('Produkt erfolgreich erstellt')
      setActiveTab('products')

      await loadData()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Fehler beim Speichern des Produkts')
    } finally {
      setSavingProduct(false)
    }
  }

  async function handleIngredientSubmit(e: React.FormEvent) {
    e.preventDefault()

    try {
      setSavingIngredient(true)
      setError('')
      setSuccess('')

      await createIngredient({
        name: ingredientName,
        unit: ingredientUnit,
        purchasePrice: Number(purchasePrice),
        deposit: Number(deposit),
        supplier,
        articleNumber,
      })

      setIngredientName('')
      setIngredientUnit('g')
      setPurchasePrice('')
      setDeposit('0')
      setSupplier('')
      setArticleNumber('')
      setSuccess('Zutat erfolgreich erstellt')
      setActiveTab('ingredients')

      await loadData()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Fehler beim Speichern der Zutat')
    } finally {
      setSavingIngredient(false)
    }
  }

  const stats = useMemo(
    () => [
      {
        label: 'Kategorien',
        value: categories.length,
        hint: 'Menuestruktur',
        icon: Shapes,
        tone: 'orange' as const,
      },
      {
        label: 'Produkte',
        value: products.length,
        hint: 'Speisekarte',
        icon: Package,
        tone: 'slate' as const,
      },
      {
        label: 'Zutaten',
        value: ingredients.length,
        hint: 'EK & Kalkulation',
        icon: CookingPot,
        tone: 'emerald' as const,
      },
    ],
    [categories.length, products.length, ingredients.length]
  )

  const latestProducts = useMemo(() => products.slice(0, 4), [products])
  const latestIngredients = useMemo(() => ingredients.slice(0, 4), [ingredients])

  return (
    <main className="min-h-screen bg-rose-50 text-[var(--brand-ink)]">
      <div className="flex min-h-screen">
        <aside className="hidden w-76 shrink-0 border-r border-[var(--brand-border)] bg-slate-950 text-slate-100 lg:flex lg:flex-col">
          <div className="border-b border-slate-800 px-6 py-6">
            <div className="flex items-center gap-3">
              <div className="flex h-11 w-11 items-center justify-center rounded-2xl bg-orange-600 text-white shadow-lg shadow-orange-900/30">
                <CookingPot size={20} />
              </div>
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.22em] text-orange-400">
                  Döner SaaS
                </p>
                <h1 className="text-xl font-bold">Admin Panel</h1>
              </div>
            </div>

            <p className="mt-4 text-sm text-slate-400">
              Produkte, Kategorien und Zutaten an einem Ort verwalten.
            </p>
          </div>

          <nav className="flex-1 px-4 py-6">
            <div className="space-y-2">
              <SidebarButton
                icon={LayoutDashboard}
                active={activeTab === 'overview'}
                onClick={() => setActiveTab('overview')}
                label="Uebersicht"
                sublabel="Dashboard"
              />
              <SidebarButton
                icon={Shapes}
                active={activeTab === 'categories'}
                onClick={() => setActiveTab('categories')}
                label="Kategorien"
                sublabel="Menuegruppen"
              />
              <SidebarButton
                icon={Package}
                active={activeTab === 'products'}
                onClick={() => setActiveTab('products')}
                label="Produkte"
                sublabel="Speisekarte"
              />
              <SidebarButton
                icon={CookingPot}
                active={activeTab === 'ingredients'}
                onClick={() => setActiveTab('ingredients')}
                label="Zutaten"
                sublabel="EK & Einkauf"
              />
            </div>
          </nav>

          <div className="border-t border-slate-800 px-6 py-5">
            <div className="rounded-2xl bg-slate-900 px-4 py-4 ring-1 ring-slate-800">
              <div className="flex items-center gap-2 text-emerald-400">
                <CheckCircle2 size={16} />
                <span className="text-xs font-semibold uppercase tracking-wide">
                  Systemstatus
                </span>
              </div>
              <p className="mt-2 text-sm text-slate-200">
                Backend und Frontend verbunden
              </p>
            </div>
          </div>
        </aside>

        <div className="flex-1">
          <header className="border-b border-[var(--brand-border)] bg-white">
            <div className="mx-auto flex max-w-7xl flex-col gap-4 px-6 py-6 md:flex-row md:items-center md:justify-between">
              <div>
                <p className="text-sm font-medium text-orange-600">
                  Imbiss Verwaltung
                </p>
                <h2 className="mt-1 text-3xl font-bold tracking-tight">
                  Admin Dashboard
                </h2>
                <p className="mt-2 text-sm text-rose-900/70">
                  Eine klare Oberflaeche fuer Kategorien, Produkte und Zutaten.
                </p>
              </div>

              <div className="flex flex-wrap gap-2 lg:hidden">
                <TopTabButton
                  active={activeTab === 'overview'}
                  onClick={() => setActiveTab('overview')}
                  icon={LayoutDashboard}
                >
                  Uebersicht
                </TopTabButton>
                <TopTabButton
                  active={activeTab === 'categories'}
                  onClick={() => setActiveTab('categories')}
                  icon={Shapes}
                >
                  Kategorien
                </TopTabButton>
                <TopTabButton
                  active={activeTab === 'products'}
                  onClick={() => setActiveTab('products')}
                  icon={Package}
                >
                  Produkte
                </TopTabButton>
                <TopTabButton
                  active={activeTab === 'ingredients'}
                  onClick={() => setActiveTab('ingredients')}
                  icon={CookingPot}
                >
                  Zutaten
                </TopTabButton>
              </div>
            </div>
          </header>

          <div className="mx-auto max-w-7xl px-6 py-8">
            {error && (
              <MessageBanner variant="error" icon={AlertCircle}>
                {error}
              </MessageBanner>
            )}

            {success && (
              <MessageBanner variant="success" icon={CheckCircle2}>
                {success}
              </MessageBanner>
            )}

            <div className="mb-8 grid gap-4 md:grid-cols-3">
              {stats.map((stat) => (
                <StatCard
                  key={stat.label}
                  label={stat.label}
                  value={stat.value}
                  hint={stat.hint}
                  icon={stat.icon}
                  tone={stat.tone}
                />
              ))}
            </div>

            {activeTab === 'overview' && (
              <div className="grid gap-6 xl:grid-cols-3">
                <Card className="xl:col-span-2">
                  <CardHeader
                    title="Schnellzugriff"
                    subtitle="Neue Daten direkt anlegen oder Bereiche oeffnen."
                  />
                  <div className="grid gap-4 md:grid-cols-3">
                    <QuickActionCard
                      title="Kategorie anlegen"
                      text="Neue Menuegruppe wie Döner, Pizza oder Getränke."
                      buttonLabel="Zu Kategorien"
                      onClick={() => setActiveTab('categories')}
                      color="orange"
                      icon={Shapes}
                    />
                    <QuickActionCard
                      title="Produkt anlegen"
                      text="Neuen Artikel mit Preis und Kategorie erstellen."
                      buttonLabel="Zu Produkten"
                      onClick={() => setActiveTab('products')}
                      color="slate"
                      icon={Package}
                    />
                    <QuickActionCard
                      title="Zutat anlegen"
                      text="Zutaten fuer Kalkulation und Einkauf erfassen."
                      buttonLabel="Zu Zutaten"
                      onClick={() => setActiveTab('ingredients')}
                      color="emerald"
                      icon={CookingPot}
                    />
                  </div>
                </Card>

                <Card>
                  <CardHeader title="Projektstatus" subtitle="Aktueller Systemstand" />
                  <div className="space-y-3">
                    <StatusRow label="Backend" value="Aktiv" tone="green" />
                    <StatusRow label="Datenbank" value="Verbunden" tone="green" />
                    <StatusRow label="Produkte" value={`${products.length} vorhanden`} tone="slate" />
                    <StatusRow label="Zutaten" value={`${ingredients.length} vorhanden`} tone="slate" />
                  </div>
                </Card>

                <Card>
                  <CardHeader
                    title="Neueste Produkte"
                    subtitle="Die zuletzt angezeigten Produkte"
                    action={
                      <button
                        onClick={() => setActiveTab('products')}
                        className="text-sm font-medium text-orange-600 hover:text-orange-700"
                      >
                        Alle anzeigen
                      </button>
                    }
                  />
                  {loading ? (
                    <EmptyText text="Lade Produkte..." />
                  ) : latestProducts.length === 0 ? (
                    <EmptyText text="Noch keine Produkte vorhanden." />
                  ) : (
                    <div className="space-y-3">
                      {latestProducts.map((product) => (
                        <SimpleListCard
                          key={product.id}
                          title={product.name}
                          subtitle={`Nr. ${product.productNumber}`}
                          badge={`${product.price} EUR`}
                        />
                      ))}
                    </div>
                  )}
                </Card>

                <Card className="xl:col-span-2">
                  <CardHeader
                    title="Neueste Zutaten"
                    subtitle="Schneller Ueberblick ueber deine Zutaten"
                    action={
                      <button
                        onClick={() => setActiveTab('ingredients')}
                        className="text-sm font-medium text-orange-600 hover:text-orange-700"
                      >
                        Alle anzeigen
                      </button>
                    }
                  />
                  {loading ? (
                    <EmptyText text="Lade Zutaten..." />
                  ) : latestIngredients.length === 0 ? (
                    <EmptyText text="Noch keine Zutaten vorhanden." />
                  ) : (
                    <div className="grid gap-4 md:grid-cols-2">
                      {latestIngredients.map((ingredient) => (
                        <SimpleIngredientCard key={ingredient.id} ingredient={ingredient} />
                      ))}
                    </div>
                  )}
                </Card>
              </div>
            )}

            {activeTab === 'categories' && (
              <div className="grid gap-6 xl:grid-cols-[420px_1fr]">
                <Card>
                  <CardHeader
                    title="Neue Kategorie"
                    subtitle="Kategorien fuer Menue, Bildschirm und Struktur anlegen."
                  />
                  <form onSubmit={handleCategorySubmit} className="space-y-4">
                    <FormField label="Kategoriename" icon={Tags}>
                      <input
                        type="text"
                        value={categoryName}
                        onChange={(e) => setCategoryName(e.target.value)}
                        required
                        className="input-ui"
                        placeholder="z. B. Döner"
                      />
                    </FormField>

                    <FormField label="Sortierung" icon={Hash}>
                      <input
                        type="number"
                        value={categorySortOrder}
                        onChange={(e) => setCategorySortOrder(e.target.value)}
                        required
                        className="input-ui"
                      />
                    </FormField>

                    <PrimaryButton
                      type="submit"
                      disabled={savingCategory}
                      color="orange"
                      icon={PlusCircle}
                    >
                      {savingCategory ? 'Speichert...' : 'Kategorie speichern'}
                    </PrimaryButton>
                  </form>
                </Card>

                <Card>
                  <CardHeader
                    title="Kategorienliste"
                    subtitle="Alle vorhandenen Menuegruppen."
                    action={<CountBadge tone="orange">{categories.length} Eintraege</CountBadge>}
                  />
                  {loading ? (
                    <EmptyText text="Lade Kategorien..." />
                  ) : categories.length === 0 ? (
                    <EmptyText text="Keine Kategorien vorhanden." />
                  ) : (
                    <div className="grid gap-3 md:grid-cols-2">
                      {categories.map((cat) => (
                        <SimpleListCard
                          key={cat.id}
                          title={cat.name}
                          subtitle={`Sortierung: ${cat.sortOrder}`}
                          icon={Shapes}
                        />
                      ))}
                    </div>
                  )}
                </Card>
              </div>
            )}

            {activeTab === 'products' && (
              <div className="grid gap-6 xl:grid-cols-[420px_1fr]">
                <Card>
                  <CardHeader
                    title="Neues Produkt"
                    subtitle="Produkte mit Preis, MwSt und Kategorie anlegen."
                  />
                  <form onSubmit={handleProductSubmit} className="space-y-4">
                    <FormField label="Produktnummer" icon={Hash}>
                      <input
                        type="text"
                        value={productNumber}
                        onChange={(e) => setProductNumber(e.target.value)}
                        required
                        className="input-ui"
                        placeholder="z. B. 101"
                      />
                    </FormField>

                    <FormField label="Name" icon={Package}>
                      <input
                        type="text"
                        value={productName}
                        onChange={(e) => setProductName(e.target.value)}
                        required
                        className="input-ui"
                        placeholder="z. B. Döner mit Kaese"
                      />
                    </FormField>

                    <div className="grid grid-cols-2 gap-4">
                      <FormField label="Verkaufspreis (Brutto)" icon={Euro}>
                        <input
                          type="number"
                          step="0.01"
                          value={price}
                          onChange={(e) => setPrice(e.target.value)}
                          required
                          className="input-ui"
                          placeholder="8.50"
                        />
                      </FormField>

                      <FormField label="MwSt" icon={Percent}>
                        <select
                          value={vatRate}
                          onChange={(e) => setVatRate(e.target.value)}
                          className="input-ui"
                        >
                          <option value="19">19%</option>
                          <option value="7">7%</option>
                        </select>
                      </FormField>
                    </div>

                    <FormField label="Kategorie" icon={Shapes}>
                      <select
                        value={categoryId}
                        onChange={(e) => setCategoryId(e.target.value)}
                        className="input-ui"
                      >
                        <option value="">Keine Kategorie</option>
                        {categories.map((category) => (
                          <option key={category.id} value={category.id}>
                            {category.name}
                          </option>
                        ))}
                      </select>
                    </FormField>

                    <PrimaryButton
                      type="submit"
                      disabled={savingProduct}
                      color="slate"
                      icon={PlusCircle}
                    >
                      {savingProduct ? 'Speichert...' : 'Produkt speichern'}
                    </PrimaryButton>
                  </form>
                </Card>

                <Card>
                  <CardHeader
                    title="Produktliste"
                    subtitle="Alle Produkte mit Preis und Kategorie."
                    action={<CountBadge tone="slate">{products.length} Eintraege</CountBadge>}
                  />
                  {loading ? (
                    <EmptyText text="Lade Produkte..." />
                  ) : products.length === 0 ? (
                    <EmptyText text="Keine Produkte vorhanden." />
                  ) : (
                    <div className="grid gap-4 md:grid-cols-2">
                      {products.map((product) => (
                        <ProductCard key={product.id} product={product} />
                      ))}
                    </div>
                  )}
                </Card>
              </div>
            )}

            {activeTab === 'ingredients' && (
              <div className="grid gap-6 xl:grid-cols-[420px_1fr]">
                <Card>
                  <CardHeader
                    title="Neue Zutat"
                    subtitle="Zutaten fuer Kalkulation und Allergene anlegen."
                  />
                  <form onSubmit={handleIngredientSubmit} className="space-y-4">
                    <FormField label="Name" icon={CookingPot}>
                      <input
                        type="text"
                        value={ingredientName}
                        onChange={(e) => setIngredientName(e.target.value)}
                        required
                        className="input-ui"
                        placeholder="z. B. Dönerbrot"
                      />
                    </FormField>

                    <FormField label="Einheit" icon={Warehouse}>
                      <select
                        value={ingredientUnit}
                        onChange={(e) => setIngredientUnit(e.target.value)}
                        className="input-ui"
                      >
                        <option value="g">g</option>
                        <option value="kg">kg</option>
                        <option value="ml">ml</option>
                        <option value="l">l</option>
                        <option value="Stueck">Stueck</option>
                        <option value="Dose">Dose</option>
                      </select>
                    </FormField>

                    <div className="grid grid-cols-2 gap-4">
                      <FormField label="Einkaufspreis (Netto)" icon={Euro}>
                        <input
                          type="number"
                          step="0.01"
                          value={purchasePrice}
                          onChange={(e) => setPurchasePrice(e.target.value)}
                          required
                          className="input-ui"
                          placeholder="0.45"
                        />
                      </FormField>

                      <FormField label="Pfand (Brutto)" icon={Euro}>
                        <input
                          type="number"
                          step="0.01"
                          value={deposit}
                          onChange={(e) => setDeposit(e.target.value)}
                          className="input-ui"
                        />
                      </FormField>
                    </div>

                    <FormField label="Grosshaendler" icon={Warehouse}>
                      <input
                        type="text"
                        value={supplier}
                        onChange={(e) => setSupplier(e.target.value)}
                        className="input-ui"
                        placeholder="z. B. Metro"
                      />
                    </FormField>

                    <FormField label="Artikelnummer" icon={Hash}>
                      <input
                        type="text"
                        value={articleNumber}
                        onChange={(e) => setArticleNumber(e.target.value)}
                        className="input-ui"
                        placeholder="z. B. BR-001"
                      />
                    </FormField>

                    <PrimaryButton
                      type="submit"
                      disabled={savingIngredient}
                      color="emerald"
                      icon={PlusCircle}
                    >
                      {savingIngredient ? 'Speichert...' : 'Zutat speichern'}
                    </PrimaryButton>
                  </form>
                </Card>

                <Card>
                  <CardHeader
                    title="Zutatenliste"
                    subtitle="Einkauf, Einheit und Lieferanten im Ueberblick."
                    action={<CountBadge tone="emerald">{ingredients.length} Eintraege</CountBadge>}
                  />
                  {loading ? (
                    <EmptyText text="Lade Zutaten..." />
                  ) : ingredients.length === 0 ? (
                    <EmptyText text="Keine Zutaten vorhanden." />
                  ) : (
                    <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
                      {ingredients.map((ingredient) => (
                        <IngredientCard key={ingredient.id} ingredient={ingredient} />
                      ))}
                    </div>
                  )}
                </Card>
              </div>
            )}
          </div>
        </div>
      </div>

    </main>
  )
}
function Card({
  children,
  className = '',
}: {
  children: React.ReactNode
  className?: string
}) {
  return (
    <section className={`rounded-3xl bg-white p-6 shadow-sm ring-1 ring-[var(--brand-border)] ${className}`}>
      {children}
    </section>
  )
}

function CardHeader({
  title,
  subtitle,
  action,
}: {
  title: string
  subtitle?: string
  action?: React.ReactNode
}) {
  return (
    <div className="mb-5 flex items-start justify-between gap-4">
      <div>
        <h3 className="text-xl font-semibold">{title}</h3>
        {subtitle && <p className="mt-1 text-sm text-rose-900/70">{subtitle}</p>}
      </div>
      {action}
    </div>
  )
}

function CountBadge({
  children,
  tone,
}: {
  children: React.ReactNode
  tone: 'orange' | 'slate' | 'emerald'
}) {
  const map = {
    orange: 'bg-orange-100 text-orange-700',
    slate: 'bg-rose-50 text-rose-900/85',
    emerald: 'bg-emerald-100 text-emerald-700',
  }

  return (
    <span className={`rounded-full px-3 py-1 text-xs font-medium ${map[tone]}`}>
      {children}
    </span>
  )
}

function MessageBanner({
  children,
  icon: Icon,
  variant,
}: {
  children: React.ReactNode
  icon: LucideIcon
  variant: 'error' | 'success'
}) {
  const styles =
    variant === 'error'
      ? 'mb-6 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700'
      : 'mb-6 rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700'

  return (
    <div className={styles}>
      <div className="flex items-center gap-2">
        <Icon size={18} />
        <span>{children}</span>
      </div>
    </div>
  )
}

function StatCard({
  label,
  value,
  hint,
  icon: Icon,
  tone,
}: {
  label: string
  value: number
  hint: string
  icon: LucideIcon
  tone: 'orange' | 'slate' | 'emerald'
}) {
  const toneMap = {
    orange: 'bg-orange-100 text-orange-700',
    slate: 'bg-rose-50 text-rose-900/85',
    emerald: 'bg-emerald-100 text-emerald-700',
  }

  return (
    <div className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
      <div className="flex items-start justify-between gap-4">
        <div>
          <p className="text-sm text-rose-900/70">{label}</p>
          <p className="mt-2 text-3xl font-bold">{value}</p>
          <p className="mt-1 text-sm text-slate-400">{hint}</p>
        </div>
        <div className={`rounded-2xl p-3 ${toneMap[tone]}`}>
          <Icon size={20} />
        </div>
      </div>
    </div>
  )
}

function SidebarButton({
  active,
  onClick,
  label,
  sublabel,
  icon: Icon,
}: {
  active: boolean
  onClick: () => void
  label: string
  sublabel: string
  icon: LucideIcon
}) {
  return (
    <button
      onClick={onClick}
      className={`w-full rounded-2xl px-4 py-3 text-left transition ${
        active
          ? 'bg-orange-600 text-white'
          : 'bg-transparent text-slate-200 hover:bg-slate-900'
      }`}
    >
      <div className="flex items-center gap-3">
        <Icon size={18} />
        <div>
          <p className="font-semibold">{label}</p>
          <p className={`mt-1 text-sm ${active ? 'text-orange-100' : 'text-slate-400'}`}>
            {sublabel}
          </p>
        </div>
      </div>
    </button>
  )
}

function TopTabButton({
  active,
  onClick,
  children,
  icon: Icon,
}: {
  active: boolean
  onClick: () => void
  children: React.ReactNode
  icon: LucideIcon
}) {
  return (
    <button
      onClick={onClick}
      className={`inline-flex items-center gap-2 rounded-xl px-4 py-2 text-sm font-medium transition ${
        active
          ? 'bg-slate-900 text-white'
          : 'bg-rose-50 text-rose-900/85 hover:bg-slate-200'
      }`}
    >
      <Icon size={16} />
      {children}
    </button>
  )
}

function FormField({
  label,
  children,
  icon: Icon,
}: {
  label: string
  children: React.ReactNode
  icon?: LucideIcon
}) {
  return (
    <div>
      <label className="mb-1.5 flex items-center gap-2 text-sm font-medium text-rose-900/85">
        {Icon ? <Icon size={15} className="text-rose-900/70" /> : null}
        {label}
      </label>
      {children}
    </div>
  )
}

function PrimaryButton({
  children,
  onClick,
  disabled,
  type = 'button',
  icon: Icon,
  color,
}: {
  children: React.ReactNode
  onClick?: () => void
  disabled?: boolean
  type?: 'button' | 'submit'
  icon?: LucideIcon
  color: 'orange' | 'slate' | 'emerald'
}) {
  const map = {
    orange: 'bg-orange-600 hover:bg-orange-700',
    slate: 'bg-slate-900 hover:bg-slate-800',
    emerald: 'bg-emerald-600 hover:bg-emerald-700',
  }

  return (
    <button
      type={type}
      onClick={onClick}
      disabled={disabled}
      className={`inline-flex w-full items-center justify-center gap-2 rounded-xl px-4 py-2.5 text-sm font-semibold text-white transition disabled:cursor-not-allowed disabled:opacity-60 ${map[color]}`}
    >
      {Icon ? <Icon size={16} /> : null}
      {children}
    </button>
  )
}

function StatusRow({
  label,
  value,
  tone,
}: {
  label: string
  value: string
  tone: 'green' | 'slate'
}) {
  const toneClass =
    tone === 'green'
      ? 'bg-green-100 text-green-700'
      : 'bg-rose-50 text-rose-900/85'

  return (
    <div className="flex items-center justify-between rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
      <span className="text-sm font-medium text-rose-900/85">{label}</span>
      <span className={`rounded-full px-3 py-1 text-xs font-semibold ${toneClass}`}>
        {value}
      </span>
    </div>
  )
}

function QuickActionCard({
  title,
  text,
  buttonLabel,
  onClick,
  color,
  icon: Icon,
}: {
  title: string
  text: string
  buttonLabel: string
  onClick: () => void
  color: 'orange' | 'slate' | 'emerald'
  icon: LucideIcon
}) {
  const colorMap = {
    orange: 'bg-orange-600 hover:bg-orange-700',
    slate: 'bg-slate-900 hover:bg-slate-800',
    emerald: 'bg-emerald-600 hover:bg-emerald-700',
  }

  const iconMap = {
    orange: 'bg-orange-100 text-orange-700',
    slate: 'bg-rose-50 text-rose-900/85',
    emerald: 'bg-emerald-100 text-emerald-700',
  }

  return (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
      <div className={`inline-flex rounded-2xl p-3 ${iconMap[color]}`}>
        <Icon size={18} />
      </div>
      <h4 className="mt-4 font-semibold">{title}</h4>
      <p className="mt-2 text-sm text-rose-900/70">{text}</p>
      <button
        onClick={onClick}
        className={`mt-4 rounded-xl px-4 py-2 text-sm font-semibold text-white transition ${colorMap[color]}`}
      >
        {buttonLabel}
      </button>
    </div>
  )
}

function EmptyText({ text }: { text: string }) {
  return <p className="text-sm text-rose-900/70">{text}</p>
}

function SimpleListCard({
  title,
  subtitle,
  badge,
  icon: Icon,
}: {
  title: string
  subtitle: string
  badge?: string
  icon?: LucideIcon
}) {
  return (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 px-4 py-3">
      <div className="flex items-start justify-between gap-3">
        <div className="flex items-start gap-3">
          {Icon ? (
            <div className="mt-0.5 rounded-xl bg-white p-2 ring-1 ring-[var(--brand-border)]">
              <Icon size={16} className="text-rose-900/75" />
            </div>
          ) : null}
          <div>
            <p className="font-semibold">{title}</p>
            <p className="text-sm text-rose-900/70">{subtitle}</p>
          </div>
        </div>
        {badge ? (
          <span className="rounded-xl bg-white px-3 py-1 text-sm font-semibold ring-1 ring-[var(--brand-border)]">
            {badge}
          </span>
        ) : null}
      </div>
    </div>
  )
}

function ProductCard({ product }: { product: Product }) {
  return (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex items-start gap-3">
          <div className="rounded-2xl bg-white p-3 ring-1 ring-[var(--brand-border)]">
            <Package size={18} className="text-rose-900/85" />
          </div>
          <div>
            <h4 className="font-semibold">{product.name}</h4>
            <p className="text-sm text-rose-900/70">Nr. {product.productNumber || "-"}</p>
          </div>
        </div>
        <div className="rounded-xl bg-white px-3 py-1.5 text-sm font-semibold ring-1 ring-[var(--brand-border)]">
          {product.price} EUR
        </div>
      </div>

      <div className="space-y-1 text-sm text-rose-900/75">
        <p>MwSt: {product.vatRate}%</p>
        <p>Kategorie: {product.category?.name ?? 'Keine Kategorie'}</p>
      </div>
    </div>
  )
}

function IngredientCard({ ingredient }: { ingredient: Ingredient }) {
  return (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex items-start gap-3">
          <div className="rounded-2xl bg-white p-3 ring-1 ring-[var(--brand-border)]">
            <CookingPot size={18} className="text-emerald-700" />
          </div>
          <div>
            <h4 className="font-semibold">{ingredient.name}</h4>
            <p className="text-sm text-rose-900/70">
              {ingredient.supplier || 'Kein Grosshaendler'}
            </p>
          </div>
        </div>
        <span className="rounded-xl bg-white px-3 py-1 text-xs font-medium ring-1 ring-[var(--brand-border)]">
          {ingredient.unit}
        </span>
      </div>

      <div className="space-y-1 text-sm text-rose-900/75">
        <p>EK: {ingredient.purchasePrice} EUR</p>
        {Number(ingredient.deposit) > 0 ? <p>Pfand (Brutto): {ingredient.deposit} EUR</p> : null}
        <p>Artikelnummer: {ingredient.articleNumber || '-'}</p>
      </div>
    </div>
  )
}

function SimpleIngredientCard({ ingredient }: { ingredient: Ingredient }) {
  return (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-4">
      <div className="flex items-start justify-between gap-3">
        <div className="flex items-start gap-3">
          <div className="rounded-2xl bg-white p-3 ring-1 ring-[var(--brand-border)]">
            <CookingPot size={18} className="text-emerald-700" />
          </div>
          <div>
            <p className="font-semibold">{ingredient.name}</p>
            <p className="text-sm text-rose-900/70">
              {ingredient.supplier || 'Kein Grosshaendler'}
            </p>
          </div>
        </div>
        <span className="rounded-xl bg-white px-3 py-1 text-sm font-medium ring-1 ring-[var(--brand-border)]">
          {ingredient.unit}
        </span>
      </div>
      <p className="mt-3 text-sm text-rose-900/75">
        EK: {ingredient.purchasePrice} EUR
        {Number(ingredient.deposit) > 0 ? ` | Pfand (Brutto): ${ingredient.deposit} EUR` : ''}
      </p>
    </div>
  )
}


