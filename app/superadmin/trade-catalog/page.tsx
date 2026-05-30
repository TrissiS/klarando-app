'use client'

import { useEffect, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import { createTradeCatalogItem, getTradeCatalogItems, type TradeCatalogItem } from '@/lib/api'

export default function SuperadminTradeCatalogPage() {
  const [rows, setRows] = useState<TradeCatalogItem[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [saving, setSaving] = useState(false)
  const [draftName, setDraftName] = useState('')
  const [draftBrand, setDraftBrand] = useState('')
  const [draftCategory, setDraftCategory] = useState('')
  const [draftVolume, setDraftVolume] = useState('')
  const [draftDeposit, setDraftDeposit] = useState('0.00')
  const [draftAgeRestriction, setDraftAgeRestriction] = useState<'NONE' | 'AGE_16' | 'AGE_18'>('NONE')

  async function load() {
    try {
      setLoading(true)
      setError('')
      const items = await getTradeCatalogItems()
      setRows(items)
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Handelsartikel konnten nicht geladen werden.')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void load()
  }, [])

  async function handleCreate(event: React.FormEvent) {
    event.preventDefault()
    try {
      setSaving(true)
      setError('')
      await createTradeCatalogItem({
        name: draftName,
        brand: draftBrand || null,
        category: draftCategory || null,
        contentVolumeLiters: draftVolume ? Number(draftVolume) : null,
        deposit: Number(draftDeposit || 0),
        ageRestriction: draftAgeRestriction,
      })
      setDraftName('')
      setDraftBrand('')
      setDraftCategory('')
      setDraftVolume('')
      setDraftDeposit('0.00')
      setDraftAgeRestriction('NONE')
      await load()
    } catch (createError) {
      setError(createError instanceof Error ? createError.message : 'Handelsartikel konnte nicht erstellt werden.')
    } finally {
      setSaving(false)
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Handelsartikel"
      subtitle="Zentraler Klarando-Katalog für Getränke und Standardartikel"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-4">
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}

        <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
          <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Artikel hinzufügen</h2>
          <form onSubmit={handleCreate} className="mt-3 grid gap-3 md:grid-cols-3">
            <input value={draftName} onChange={(event) => setDraftName(event.target.value)} placeholder="Name" required className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" />
            <input value={draftBrand} onChange={(event) => setDraftBrand(event.target.value)} placeholder="Marke" className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" />
            <input value={draftCategory} onChange={(event) => setDraftCategory(event.target.value)} placeholder="Kategorie" className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" />
            <input type="number" step="0.001" min={0} value={draftVolume} onChange={(event) => setDraftVolume(event.target.value)} placeholder="Inhalt Liter" className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" />
            <input type="number" step="0.01" min={0} value={draftDeposit} onChange={(event) => setDraftDeposit(event.target.value)} placeholder="Pfand" className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm" />
            <select value={draftAgeRestriction} onChange={(event) => setDraftAgeRestriction(event.target.value as 'NONE' | 'AGE_16' | 'AGE_18')} className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm">
              <option value="NONE">Keine Altersfreigabe</option>
              <option value="AGE_16">ab 16</option>
              <option value="AGE_18">ab 18</option>
            </select>
            <button type="submit" disabled={saving} className="md:col-span-3 rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white">
              {saving ? 'Speichert…' : 'Handelsartikel anlegen'}
            </button>
          </form>
        </section>

        <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-sm">
          <div className="mb-3 flex items-center justify-between">
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Katalogübersicht</h2>
            <button type="button" onClick={() => void load()} className="rounded-lg border border-[var(--brand-border)] bg-white px-3 py-1.5 text-xs font-semibold text-rose-900/80">Neu laden</button>
          </div>
          <div className="overflow-x-auto">
            <table className="min-w-full text-left text-sm">
              <thead>
                <tr className="border-b border-slate-200 text-slate-500">
                  <th className="px-2 py-2">Name</th>
                  <th className="px-2 py-2">Marke</th>
                  <th className="px-2 py-2">Kategorie</th>
                  <th className="px-2 py-2">Inhalt</th>
                  <th className="px-2 py-2">Pfand</th>
                  <th className="px-2 py-2">Alter</th>
                  <th className="px-2 py-2">Status</th>
                </tr>
              </thead>
              <tbody>
                {!loading && rows.length === 0 ? (
                  <tr>
                    <td colSpan={7} className="px-2 py-3 text-slate-500">Keine Handelsartikel gefunden.</td>
                  </tr>
                ) : null}
                {rows.map((row) => (
                  <tr key={row.id} className="border-b border-slate-100">
                    <td className="px-2 py-2">{row.name}</td>
                    <td className="px-2 py-2">{row.brand || '-'}</td>
                    <td className="px-2 py-2">{row.category || '-'}</td>
                    <td className="px-2 py-2">{row.contentVolumeLiters ? `${row.contentVolumeLiters} l` : '-'}</td>
                    <td className="px-2 py-2">{Number(row.deposit).toFixed(2)} €</td>
                    <td className="px-2 py-2">{row.ageRestriction === 'AGE_16' ? 'ab 16' : row.ageRestriction === 'AGE_18' ? 'ab 18' : '-'}</td>
                    <td className="px-2 py-2">{row.isActive ? 'Aktiv' : 'Inaktiv'}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </BackofficeLayout>
  )
}
