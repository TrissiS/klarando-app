import type { SupplierMaster } from '@/lib/api'
import Card from '@/app/Components/ui/Card'
import SectionTitle from '@/app/Components/ui/SectionTitle'
import TextInput from '@/app/Components/ui/TextInput'
import FieldLabel from '@/app/Components/ui/FieldLabel'
import PrimaryButton from '@/app/Components/ui/PrimaryButton'
import InfoListCard from '@/app/Components/ui/InfoListCard'

type Props = {
  suppliers: SupplierMaster[]
  loading: boolean
  name: string
  setName: (value: string) => void
  contactName: string
  setContactName: (value: string) => void
  phone: string
  setPhone: (value: string) => void
  email: string
  setEmail: (value: string) => void
  notes: string
  setNotes: (value: string) => void
  saving: boolean
  deletingSupplierId: string | null
  editingSupplierId: string | null
  onSubmit: (e: React.FormEvent) => void
  onCancelEdit: () => void
  onEdit: (supplier: SupplierMaster) => void
  onDelete: (supplier: SupplierMaster) => void
}

function formatIngredientLine(supplier: SupplierMaster) {
  if (supplier.ingredients.length === 0) {
    return 'Keine Zutaten zugeordnet'
  }

  const top = supplier.ingredients
    .slice(0, 3)
    .map(
      (ingredient) =>
        `${ingredient.name} (Art: ${ingredient.articleNumber || '-'}, EK: ${ingredient.purchasePrice} EUR)`
    )
    .join(' | ')

  const rest =
    supplier.ingredients.length > 3
      ? ` | +${supplier.ingredients.length - 3} weitere`
      : ''

  return `${top}${rest}`
}

export default function AdminSuppliersSection({
  suppliers,
  loading,
  name,
  setName,
  contactName,
  setContactName,
  phone,
  setPhone,
  email,
  setEmail,
  notes,
  setNotes,
  saving,
  deletingSupplierId,
  editingSupplierId,
  onSubmit,
  onCancelEdit,
  onEdit,
  onDelete,
}: Props) {
  return (
    <div className="grid gap-6 xl:grid-cols-[420px_1fr]">
      <Card>
        <SectionTitle
          title={editingSupplierId ? 'Lieferant bearbeiten' : 'Neuer Lieferant'}
          subtitle="Lieferanten-Stamm mit Kontakt und Notizen"
        />

        <form onSubmit={onSubmit} className="space-y-4">
          <div>
            <FieldLabel>Name</FieldLabel>
            <TextInput
              value={name}
              onChange={setName}
              placeholder="z. B. Metro"
              required
            />
          </div>

          <div>
            <FieldLabel>Ansprechpartner</FieldLabel>
            <TextInput
              value={contactName}
              onChange={setContactName}
              placeholder="z. B. Max Mustermann"
            />
          </div>

          <div>
            <FieldLabel>Telefon</FieldLabel>
            <TextInput
              value={phone}
              onChange={setPhone}
              placeholder="z. B. +49 30 123456"
            />
          </div>

          <div>
            <FieldLabel>E-Mail</FieldLabel>
            <TextInput
              value={email}
              onChange={setEmail}
              placeholder="z. B. einkauf@lieferant.de"
            />
          </div>

          <div>
            <FieldLabel>Notizen</FieldLabel>
            <textarea
              value={notes}
              onChange={(e) => setNotes(e.target.value)}
              placeholder="Freier Text fuer Konditionen, Lieferzeiten usw."
              className="min-h-[96px] w-full rounded-xl border border-[var(--brand-border)] px-3 py-2 outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
            />
          </div>

          <PrimaryButton type="submit" disabled={saving} color="dark">
            {saving
              ? 'Speichert...'
              : editingSupplierId
              ? 'Lieferant aktualisieren'
              : 'Lieferant speichern'}
          </PrimaryButton>

          {editingSupplierId ? (
            <button
              type="button"
              onClick={onCancelEdit}
              className="w-full rounded-xl border border-[var(--brand-border)] px-4 py-2 font-medium text-rose-900/85 transition hover:bg-rose-50"
            >
              Bearbeitung abbrechen
            </button>
          ) : null}
        </form>
      </Card>

      <Card>
        <SectionTitle
          title="Lieferantenliste"
          subtitle="Stamm + Artikelnummern und EK aus deinen Zutaten"
        />

        <div className="mt-4 space-y-3">
          {loading ? (
            <p className="text-sm text-rose-900/70">Lade Lieferanten...</p>
          ) : suppliers.length === 0 ? (
            <p className="text-sm text-rose-900/70">Keine Lieferanten vorhanden.</p>
          ) : (
            suppliers.map((supplier) => (
              <div key={supplier.id} className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/60 p-3">
                <InfoListCard
                  title={supplier.name}
                  lines={[
                    `Ansprechpartner: ${supplier.contactName || '-'}`,
                    `Telefon: ${supplier.phone || '-'}`,
                    `E-Mail: ${supplier.email || '-'}`,
                    `Notizen: ${supplier.notes || '-'}`,
                    `Zutaten: ${supplier.ingredientCount}`,
                    formatIngredientLine(supplier),
                  ]}
                />

                <div className="mt-3 flex gap-2">
                  <button
                    type="button"
                    onClick={() => onEdit(supplier)}
                    className="rounded-xl bg-slate-900 px-3 py-1.5 text-sm font-medium text-white transition hover:bg-slate-800"
                  >
                    Bearbeiten
                  </button>
                  <button
                    type="button"
                    onClick={() => onDelete(supplier)}
                    disabled={deletingSupplierId === supplier.id}
                    className="rounded-xl bg-red-600 px-3 py-1.5 text-sm font-medium text-white transition hover:bg-red-700 disabled:cursor-not-allowed disabled:opacity-60"
                  >
                    {deletingSupplierId === supplier.id ? 'Loesche...' : 'Loeschen'}
                  </button>
                </div>
              </div>
            ))
          )}
        </div>
      </Card>
    </div>
  )
}

