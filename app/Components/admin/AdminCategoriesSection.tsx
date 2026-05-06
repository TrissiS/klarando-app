import { useMemo, useState } from 'react'
import type { Category } from '@/lib/api'

type Props = {
  categories: Category[]
  loading: boolean
  categoryName: string
  setCategoryName: (value: string) => void
  categoryImageUrl: string
  setCategoryImageUrl: (value: string) => void
  onCategoryImageFileChange: (file: File | null) => void
  categorySortOrder: string
  setCategorySortOrder: (value: string) => void
  savingCategory: boolean
  editingCategoryId: string | null
  deletingCategoryId: string | null
  onSubmit: (e: React.FormEvent) => void
  onEdit: (category: Category) => void
  onDelete: (category: Category) => void
  onCancelEdit: () => void
}

export default function AdminCategoriesSection({
  categories,
  loading,
  categoryName,
  setCategoryName,
  categoryImageUrl,
  setCategoryImageUrl,
  onCategoryImageFileChange,
  categorySortOrder,
  setCategorySortOrder,
  savingCategory,
  editingCategoryId,
  deletingCategoryId,
  onSubmit,
  onEdit,
  onDelete,
  onCancelEdit,
}: Props) {
  const [search, setSearch] = useState('')

  const filteredCategories = useMemo(() => {
    const query = search.trim().toLowerCase()
    if (!query) {
      return categories
    }

    return categories.filter((category) =>
      category.name.toLowerCase().includes(query)
    )
  }, [categories, search])

  return (
    <div className="grid min-w-0 gap-6 xl:grid-cols-[minmax(280px,360px)_minmax(0,1fr)]">
      <section className="min-w-0 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <h2 className="text-xl font-semibold">
          {editingCategoryId ? 'Kategorie bearbeiten' : 'Neue Kategorie'}
        </h2>
        <p className="mt-1 text-sm text-rose-900/70">
          Einheitliche Struktur fuer Produkte und Menues.
        </p>

        <form onSubmit={onSubmit} className="mt-4 space-y-3">
          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Name</span>
            <input
              value={categoryName}
              onChange={(event) => setCategoryName(event.target.value)}
              placeholder="z. B. Burger"
              required
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            />
          </label>

          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Sortierung</span>
            <input
              type="number"
              value={categorySortOrder}
              onChange={(event) => setCategorySortOrder(event.target.value)}
              required
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            />
          </label>

          <label className="block">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Kategoriebild</span>
            <input
              type="file"
              accept="image/*"
              onChange={(event) => onCategoryImageFileChange(event.target.files?.[0] || null)}
              className="w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm outline-none transition file:mr-3 file:rounded-lg file:border-0 file:bg-slate-900 file:px-3 file:py-1.5 file:text-xs file:font-semibold file:text-white hover:file:bg-slate-800"
            />
            {categoryImageUrl ? (
              <div className="mt-2 flex items-center gap-3 rounded-xl border border-[var(--brand-border)] bg-rose-50/60 p-2">
                <img
                  src={categoryImageUrl}
                  alt="Kategoriebild Vorschau"
                  className="h-16 w-16 rounded-lg border border-[var(--brand-border)] object-cover"
                />
                <button
                  type="button"
                  onClick={() => setCategoryImageUrl('')}
                  className="rounded-lg border border-red-300 bg-white px-2.5 py-1 text-xs font-medium text-red-700 transition hover:bg-red-50"
                >
                  Bild entfernen
                </button>
              </div>
            ) : (
              <p className="mt-1 text-xs text-rose-900/70">
                Optional fuer Bestellterminal und Kategorienavigation.
              </p>
            )}
          </label>

          <button
            type="submit"
            disabled={savingCategory}
            className="w-full rounded-xl bg-slate-900 px-4 py-2.5 font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
          >
            {savingCategory
              ? 'Speichert...'
              : editingCategoryId
              ? 'Kategorie aktualisieren'
              : 'Kategorie speichern'}
          </button>

          {editingCategoryId ? (
            <button
              type="button"
              onClick={onCancelEdit}
              className="w-full rounded-xl border border-[var(--brand-border)] px-4 py-2.5 font-medium text-rose-900/85 transition hover:bg-rose-50"
            >
              Bearbeitung abbrechen
            </button>
          ) : null}
        </form>
      </section>

      <section className="min-w-0 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="flex flex-wrap items-end justify-between gap-3">
          <div>
            <h2 className="text-xl font-semibold">Kategorienliste</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              {categories.length} Kategorien insgesamt
            </p>
          </div>

          <label className="block w-full max-w-sm">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Suche</span>
            <input
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              placeholder="Nach Name filtern"
              className="w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            />
          </label>
        </div>

        <div className="mt-4 max-w-full overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
          <table className="w-full min-w-[640px] border-collapse">
            <thead>
              <tr>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Bild
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Name
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Sortierung
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Erstellt
                </th>
                <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                  Aktion
                </th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td colSpan={5} className="px-3 py-3 text-sm text-rose-900/70">
                    Lade Kategorien...
                  </td>
                </tr>
              ) : filteredCategories.length === 0 ? (
                <tr>
                  <td colSpan={5} className="px-3 py-3 text-sm text-rose-900/70">
                    Keine Kategorien gefunden.
                  </td>
                </tr>
              ) : (
                filteredCategories.map((category) => (
                  <tr key={category.id}>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      {category.imageUrl ? (
                        <img
                          src={category.imageUrl}
                          alt={`${category.name} Bild`}
                          className="h-12 w-12 rounded-lg border border-[var(--brand-border)] object-cover"
                        />
                      ) : (
                        <span className="text-xs text-slate-400">-</span>
                      )}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm font-medium text-[var(--brand-ink)]">
                      {category.name}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                      {category.sortOrder}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                      {new Date(category.createdAt).toLocaleDateString('de-DE')}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <div className="flex flex-wrap gap-1.5">
                        <button
                          type="button"
                          onClick={() => onEdit(category)}
                          className="rounded-lg bg-slate-900 px-2.5 py-1 text-xs font-medium text-white transition hover:bg-slate-800"
                        >
                          Bearbeiten
                        </button>
                        <button
                          type="button"
                          onClick={() => onDelete(category)}
                          disabled={deletingCategoryId === category.id}
                          className="rounded-lg border border-red-300 bg-white px-2.5 py-1 text-xs font-medium text-red-700 transition hover:bg-red-50 disabled:cursor-not-allowed disabled:opacity-60"
                        >
                          {deletingCategoryId === category.id ? 'Loescht...' : 'Loeschen'}
                        </button>
                      </div>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  )
}

