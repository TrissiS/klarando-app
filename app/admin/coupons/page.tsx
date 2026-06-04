'use client'

import { useEffect, useMemo, useState, type ReactNode } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  createCoupon,
  deleteCoupon,
  getCoupons,
  updateCoupon,
  type Coupon,
  type CouponDiscountType,
  type CouponOrderType,
} from '@/lib/api'

function toDateTimeLocal(value: string | null) {
  if (!value) {
    return ''
  }
  const date = new Date(value)
  if (Number.isNaN(date.getTime())) {
    return ''
  }
  const offsetMs = date.getTimezoneOffset() * 60000
  return new Date(date.getTime() - offsetMs).toISOString().slice(0, 16)
}

function toIsoOrNull(value: string) {
  if (!value) {
    return null
  }
  const date = new Date(value)
  return Number.isNaN(date.getTime()) ? null : date.toISOString()
}

function orderTypeLabel(type: CouponOrderType) {
  if (type === 'DELIVERY') {
    return 'Nur Lieferung'
  }
  if (type === 'PICKUP') {
    return 'Nur Abholung'
  }
  return 'Lieferung & Abholung'
}

export default function AdminCouponsPage() {
  const [coupons, setCoupons] = useState<Coupon[]>([])
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [selectedCouponId, setSelectedCouponId] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [success, setSuccess] = useState<string | null>(null)

  const [code, setCode] = useState('')
  const [name, setName] = useState('')
  const [description, setDescription] = useState('')
  const [discountType, setDiscountType] = useState<CouponDiscountType>('PERCENT')
  const [discountPercent, setDiscountPercent] = useState('10')
  const [discountValueCents, setDiscountValueCents] = useState('')
  const [minOrderValueCents, setMinOrderValueCents] = useState('')
  const [maxUses, setMaxUses] = useState('')
  const [maxUsesPerCustomer, setMaxUsesPerCustomer] = useState('')
  const [validFrom, setValidFrom] = useState('')
  const [validUntil, setValidUntil] = useState('')
  const [appliesToOrderType, setAppliesToOrderType] = useState<CouponOrderType>('ALL')
  const [newCustomersOnly, setNewCustomersOnly] = useState(false)
  const [isActive, setIsActive] = useState(true)

  const selectedCoupon = useMemo(
    () => coupons.find((coupon) => coupon.id === selectedCouponId) ?? null,
    [coupons, selectedCouponId]
  )

  async function loadCoupons() {
    setLoading(true)
    setError(null)
    try {
      const rows = await getCoupons()
      setCoupons(rows)
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Gutscheine konnten nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    void loadCoupons()
  }, [])

  useEffect(() => {
    if (!selectedCoupon) {
      return
    }

    setCode(selectedCoupon.code)
    setName(selectedCoupon.name)
    setDescription(selectedCoupon.description ?? '')
    setDiscountType(selectedCoupon.discountType)
    setDiscountPercent(selectedCoupon.discountPercent ?? '')
    setDiscountValueCents(selectedCoupon.discountValueCents?.toString() ?? '')
    setMinOrderValueCents(selectedCoupon.minOrderValueCents?.toString() ?? '')
    setMaxUses(selectedCoupon.maxUses?.toString() ?? '')
    setMaxUsesPerCustomer(selectedCoupon.maxUsesPerCustomer?.toString() ?? '')
    setValidFrom(toDateTimeLocal(selectedCoupon.validFrom))
    setValidUntil(toDateTimeLocal(selectedCoupon.validUntil))
    setAppliesToOrderType(selectedCoupon.appliesToOrderType)
    setNewCustomersOnly(selectedCoupon.newCustomersOnly)
    setIsActive(selectedCoupon.isActive)
  }, [selectedCoupon])

  function resetForm() {
    setSelectedCouponId(null)
    setCode('')
    setName('')
    setDescription('')
    setDiscountType('PERCENT')
    setDiscountPercent('10')
    setDiscountValueCents('')
    setMinOrderValueCents('')
    setMaxUses('')
    setMaxUsesPerCustomer('')
    setValidFrom('')
    setValidUntil('')
    setAppliesToOrderType('ALL')
    setNewCustomersOnly(false)
    setIsActive(true)
  }

  async function handleSave() {
    if (!code.trim() || !name.trim()) {
      setError('Code und Name sind erforderlich')
      return
    }

    setSaving(true)
    setError(null)
    setSuccess(null)

    const payload = {
      code: code.trim().toUpperCase(),
      name: name.trim(),
      description: description.trim() || null,
      discountType,
      discountPercent: discountType === 'PERCENT' ? Number(discountPercent) : null,
      discountValueCents: discountType === 'AMOUNT' ? Number(discountValueCents) : null,
      minOrderValueCents: minOrderValueCents ? Number(minOrderValueCents) : null,
      maxUses: maxUses ? Number(maxUses) : null,
      maxUsesPerCustomer: maxUsesPerCustomer ? Number(maxUsesPerCustomer) : null,
      validFrom: toIsoOrNull(validFrom),
      validUntil: toIsoOrNull(validUntil),
      appliesToOrderType,
      newCustomersOnly,
      isActive,
    }

    try {
      if (selectedCouponId) {
        await updateCoupon(selectedCouponId, payload)
        setSuccess('Gutschein aktualisiert.')
      } else {
        await createCoupon(payload)
        setSuccess('Gutschein erstellt.')
      }

      await loadCoupons()
      resetForm()
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Gutschein konnte nicht gespeichert werden')
    } finally {
      setSaving(false)
    }
  }

  async function handleDelete(coupon: Coupon) {
    if (!window.confirm(`Gutschein ${coupon.code} wirklich loeschen?`)) {
      return
    }

    setError(null)
    setSuccess(null)

    try {
      await deleteCoupon(coupon.id)
      setSuccess('Gutschein geloescht.')
      await loadCoupons()
      if (selectedCouponId === coupon.id) {
        resetForm()
      }
    } catch (deleteError) {
      setError(deleteError instanceof Error ? deleteError.message : 'Gutschein konnte nicht geloescht werden')
    }
  }

  return (
    <AdminLayout title="Gutscheine" subtitle="Rabattcodes fuer den Checkout verwalten">
      <div className="space-y-6">
        <div className="rounded-2xl border border-sky-200 bg-sky-50 px-4 py-3 text-sm text-sky-900">
          Gutscheine sind Rabattcodes fuer den Checkout. Produktaktionen, Menues und
          Bildschirmkampagnen werden separat unter Aktionen gepflegt.
        </div>

        <div className="rounded-2xl border border-rose-200 bg-white p-5 shadow-sm">
          <h2 className="text-lg font-semibold text-rose-950">
            {selectedCouponId ? 'Gutschein bearbeiten' : 'Neuer Gutschein'}
          </h2>
          <p className="mt-1 text-sm text-rose-900/70">
            Rabattcode-Verwaltung fuer Lieferung, Abholung und Checkout-Validierung.
          </p>

          <div className="mt-4 grid gap-3 md:grid-cols-2">
            <Field label="Code">
              <input value={code} onChange={(event) => setCode(event.target.value)} className="input" placeholder="WILLKOMMEN10" />
            </Field>
            <Field label="Name">
              <input value={name} onChange={(event) => setName(event.target.value)} className="input" placeholder="Willkommensrabatt" />
            </Field>
            <Field label="Beschreibung" className="md:col-span-2">
              <input value={description} onChange={(event) => setDescription(event.target.value)} className="input" placeholder="Optional" />
            </Field>
            <Field label="Rabattart">
              <select value={discountType} onChange={(event) => setDiscountType(event.target.value as CouponDiscountType)} className="input">
                <option value="PERCENT">Prozent</option>
                <option value="AMOUNT">Betrag (Cent)</option>
                <option value="FREE_DELIVERY">Kostenlose Lieferung</option>
              </select>
            </Field>
            {discountType === 'PERCENT' ? (
              <Field label="Rabatt in %">
                <input value={discountPercent} onChange={(event) => setDiscountPercent(event.target.value)} className="input" type="number" min="0" max="100" step="0.01" />
              </Field>
            ) : discountType === 'AMOUNT' ? (
              <Field label="Rabattwert in Cent">
                <input value={discountValueCents} onChange={(event) => setDiscountValueCents(event.target.value)} className="input" type="number" min="1" />
              </Field>
            ) : (
              <Field label="Rabattwert">
                <input value="Kostenlose Lieferung" readOnly className="input bg-rose-50" />
              </Field>
            )}
            <Field label="Mindestbestellwert in Cent">
              <input value={minOrderValueCents} onChange={(event) => setMinOrderValueCents(event.target.value)} className="input" type="number" min="0" />
            </Field>
            <Field label="Max. Nutzungen gesamt">
              <input value={maxUses} onChange={(event) => setMaxUses(event.target.value)} className="input" type="number" min="0" />
            </Field>
            <Field label="Max. Nutzung pro Kunde">
              <input value={maxUsesPerCustomer} onChange={(event) => setMaxUsesPerCustomer(event.target.value)} className="input" type="number" min="0" />
            </Field>
            <Field label="Gueltig von">
              <input type="datetime-local" value={validFrom} onChange={(event) => setValidFrom(event.target.value)} className="input" />
            </Field>
            <Field label="Gueltig bis">
              <input type="datetime-local" value={validUntil} onChange={(event) => setValidUntil(event.target.value)} className="input" />
            </Field>
            <Field label="Gilt fuer">
              <select value={appliesToOrderType} onChange={(event) => setAppliesToOrderType(event.target.value as CouponOrderType)} className="input">
                <option value="ALL">Lieferung & Abholung</option>
                <option value="DELIVERY">Nur Lieferung</option>
                <option value="PICKUP">Nur Abholung</option>
              </select>
            </Field>
          </div>

          <div className="mt-4 flex flex-wrap gap-4 text-sm text-rose-900">
            <label className="flex items-center gap-2">
              <input type="checkbox" checked={newCustomersOnly} onChange={(event) => setNewCustomersOnly(event.target.checked)} />
              Nur Neukunden
            </label>
            <label className="flex items-center gap-2">
              <input type="checkbox" checked={isActive} onChange={(event) => setIsActive(event.target.checked)} />
              Aktiv
            </label>
          </div>

          {error ? <p className="mt-3 text-sm text-red-700">{error}</p> : null}
          {success ? <p className="mt-3 text-sm text-emerald-700">{success}</p> : null}

          <div className="mt-4 flex gap-3">
            <button type="button" onClick={() => void handleSave()} disabled={saving} className="rounded-lg bg-slate-900 px-4 py-2 text-sm font-medium text-white hover:bg-slate-800 disabled:opacity-60">
              {saving ? 'Speichern...' : selectedCouponId ? 'Gutschein aktualisieren' : 'Gutschein speichern'}
            </button>
            <button type="button" onClick={resetForm} className="rounded-lg border border-rose-200 bg-white px-4 py-2 text-sm text-rose-900 hover:bg-rose-50">
              Zuruecksetzen
            </button>
          </div>
        </div>

        <div className="rounded-2xl border border-rose-200 bg-white p-5 shadow-sm">
          <h2 className="text-lg font-semibold text-rose-950">Gutscheinliste</h2>
          {loading ? (
            <p className="mt-3 text-sm text-rose-900/70">Lade Gutscheine...</p>
          ) : coupons.length === 0 ? (
            <p className="mt-3 text-sm text-rose-900/70">Noch keine Gutscheine vorhanden.</p>
          ) : (
            <div className="mt-4 overflow-x-auto">
              <table className="min-w-full text-sm">
                <thead>
                  <tr className="text-left text-xs uppercase text-rose-700">
                    <th className="pb-2 pr-4">Code</th>
                    <th className="pb-2 pr-4">Name</th>
                    <th className="pb-2 pr-4">Rabatt</th>
                    <th className="pb-2 pr-4">Gueltigkeit</th>
                    <th className="pb-2 pr-4">Typ</th>
                    <th className="pb-2 pr-4">Status</th>
                    <th className="pb-2 text-right">Aktionen</th>
                  </tr>
                </thead>
                <tbody>
                  {coupons.map((coupon) => (
                    <tr key={coupon.id} className="border-t border-rose-100">
                      <td className="py-2 pr-4 font-medium text-rose-950">{coupon.code}</td>
                      <td className="py-2 pr-4 text-rose-900">{coupon.name}</td>
                      <td className="py-2 pr-4 text-rose-900">
                        {coupon.discountType === 'PERCENT'
                          ? `${coupon.discountPercent ?? '0'} %`
                          : coupon.discountType === 'AMOUNT'
                            ? `${(coupon.discountValueCents ?? 0) / 100} EUR`
                            : 'Lieferung frei'}
                      </td>
                      <td className="py-2 pr-4 text-rose-900/80">
                        {coupon.validFrom ? new Date(coupon.validFrom).toLocaleDateString('de-DE') : 'Sofort'} -{' '}
                        {coupon.validUntil ? new Date(coupon.validUntil).toLocaleDateString('de-DE') : 'Offen'}
                      </td>
                      <td className="py-2 pr-4 text-rose-900/80">{orderTypeLabel(coupon.appliesToOrderType)}</td>
                      <td className="py-2 pr-4 text-rose-900/80">
                        <span className={`rounded-full px-2 py-1 text-xs ${coupon.isActive ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-200 text-slate-700'}`}>
                          {coupon.isActive ? 'Aktiv' : 'Inaktiv'}
                        </span>
                      </td>
                      <td className="py-2 text-right">
                        <button type="button" onClick={() => setSelectedCouponId(coupon.id)} className="mr-2 rounded-md border border-rose-200 px-3 py-1 text-xs text-rose-900 hover:bg-rose-50">
                          Bearbeiten
                        </button>
                        <button type="button" onClick={() => void handleDelete(coupon)} className="rounded-md bg-rose-600 px-3 py-1 text-xs text-white hover:bg-rose-700">
                          Loeschen
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}

          {!loading && coupons.length > 0 ? (
            <p className="mt-4 text-xs text-rose-800/70">
              Coupon-Validierung via <code>POST /api/coupons/validate</code> ist vorbereitet. Diese
              Codes gelten nur fuer den Checkout und ersetzen keine Produktaktionen.
            </p>
          ) : null}
        </div>
      </div>
    </AdminLayout>
  )
}

function Field({ label, children, className }: { label: string; children: ReactNode; className?: string }) {
  return (
    <label className={className}>
      <span className="mb-1 block text-xs font-medium uppercase tracking-wide text-rose-800">{label}</span>
      {children}
    </label>
  )
}
