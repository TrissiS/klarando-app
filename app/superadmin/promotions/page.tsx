'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createPromotion,
  getPromotionsAdmin,
  updatePromotion,
  type PlatformPromotion,
  type PromotionPlacementKey,
  type PromotionTargetAudience,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

type FormState = {
  title: string
  description: string
  imageUrl: string
  buttonText: string
  linkUrl: string
  productLink: string
  merchantLink: string
  targetAudience: PromotionTargetAudience
  placement: PromotionPlacementKey
  startsAt: string
  endsAt: string
  priority: number
  rotationSeconds: number
  isActive: boolean
}

const defaultForm: FormState = {
  title: '',
  description: '',
  imageUrl: '',
  buttonText: '',
  linkUrl: '',
  productLink: '',
  merchantLink: '',
  targetAudience: 'ALL',
  placement: 'MAIN_APP',
  startsAt: '',
  endsAt: '',
  priority: 100,
  rotationSeconds: 10,
  isActive: true,
}

export default function SuperadminPromotionsPage() {
  const [token, setToken] = useState('')
  const [form, setForm] = useState<FormState>(defaultForm)
  const [rows, setRows] = useState<PlatformPromotion[]>([])
  const [loading, setLoading] = useState(false)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')

  async function loadRows(nextToken = token) {
    if (!nextToken) return
    setLoading(true)
    setError('')
    try {
      const response = await getPromotionsAdmin(nextToken)
      setRows(response)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Aktionen konnten nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    const raw = localStorage.getItem('sessionUser')
    const parsed = raw ? (JSON.parse(raw) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/superadmin'
      return
    }
    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    setToken(accessToken)
    void loadRows(accessToken)
  }, [])

  const activeCount = useMemo(() => rows.filter((row) => row.isActive).length, [rows])

  async function handleCreate() {
    if (!token) return
    if (!form.title.trim()) {
      setError('Bitte einen Titel eingeben.')
      return
    }
    setSaving(true)
    setError('')
    setInfo('')
    try {
      await createPromotion(token, {
        ...form,
        startsAt: form.startsAt || null,
        endsAt: form.endsAt || null,
      })
      setInfo('Aktion wurde gespeichert.')
      setForm(defaultForm)
      await loadRows(token)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Aktion konnte nicht erstellt werden')
    } finally {
      setSaving(false)
    }
  }

  async function togglePromotion(entry: PlatformPromotion) {
    if (!token) return
    try {
      await updatePromotion(token, entry.id, { isActive: !entry.isActive })
      await loadRows(token)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Status konnte nicht geändert werden')
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Aktionen & News"
      subtitle="Zentrale Promotions für Website, Apps und Dashboards"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-5">
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
        {info ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{info}</div> : null}

        <section className="grid gap-3 md:grid-cols-2">
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Gesamt</p>
            <p className="mt-1 text-2xl font-semibold text-[var(--brand-ink)]">{rows.length}</p>
          </article>
          <article className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Aktiv</p>
            <p className="mt-1 text-2xl font-semibold text-[var(--brand-ink)]">{activeCount}</p>
          </article>
        </section>

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
          <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Neue Aktion anlegen</h2>
          <p className="mt-1 text-sm text-rose-900/70">Nur geprüfte Links verwenden. Keine Skripte oder HTML einfügen.</p>
          <div className="mt-4 grid gap-3 md:grid-cols-2">
            <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm" placeholder="Titel" value={form.title} onChange={(e) => setForm((v) => ({ ...v, title: e.target.value }))} />
            <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm" placeholder="Button-Text" value={form.buttonText} onChange={(e) => setForm((v) => ({ ...v, buttonText: e.target.value }))} />
            <textarea className="rounded-xl border border-slate-300 px-3 py-2 text-sm md:col-span-2" placeholder="Beschreibung" value={form.description} onChange={(e) => setForm((v) => ({ ...v, description: e.target.value }))} />
            <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm md:col-span-2" placeholder="Bild-/Banner-URL (https://...)" value={form.imageUrl} onChange={(e) => setForm((v) => ({ ...v, imageUrl: e.target.value }))} />
            <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm md:col-span-2" placeholder="Linkziel (https://... oder /intern)" value={form.linkUrl} onChange={(e) => setForm((v) => ({ ...v, linkUrl: e.target.value }))} />
            <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm" placeholder="Produktlink (optional)" value={form.productLink} onChange={(e) => setForm((v) => ({ ...v, productLink: e.target.value }))} />
            <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm" placeholder="Händlerlink (optional)" value={form.merchantLink} onChange={(e) => setForm((v) => ({ ...v, merchantLink: e.target.value }))} />
            <select className="rounded-xl border border-slate-300 px-3 py-2 text-sm" value={form.targetAudience} onChange={(e) => setForm((v) => ({ ...v, targetAudience: e.target.value as PromotionTargetAudience }))}>
              <option value="ALL">Alle</option>
              <option value="CUSTOMER">Kunden</option>
              <option value="ADMIN">Händler/Admin</option>
              <option value="DRIVER">Fahrer</option>
              <option value="CHAINADMIN">Chainadmin</option>
              <option value="SUPERADMIN">Superadmin</option>
            </select>
            <select className="rounded-xl border border-slate-300 px-3 py-2 text-sm" value={form.placement} onChange={(e) => setForm((v) => ({ ...v, placement: e.target.value as PromotionPlacementKey }))}>
              <option value="MAIN_APP">Hauptseite</option>
              <option value="PUBLIC_HOMEPAGE">Public Homepage</option>
              <option value="ADMIN_DASHBOARD">Admin-Dashboard</option>
              <option value="CUSTOMER_APP">Customer App</option>
              <option value="MERCHANT_APP">Merchant App</option>
              <option value="DRIVER_APP">Driver App</option>
            </select>
            <input type="datetime-local" className="rounded-xl border border-slate-300 px-3 py-2 text-sm" value={form.startsAt} onChange={(e) => setForm((v) => ({ ...v, startsAt: e.target.value }))} />
            <input type="datetime-local" className="rounded-xl border border-slate-300 px-3 py-2 text-sm" value={form.endsAt} onChange={(e) => setForm((v) => ({ ...v, endsAt: e.target.value }))} />
            <input type="number" className="rounded-xl border border-slate-300 px-3 py-2 text-sm" value={form.priority} onChange={(e) => setForm((v) => ({ ...v, priority: Number(e.target.value || 100) }))} />
            <input type="number" className="rounded-xl border border-slate-300 px-3 py-2 text-sm" value={form.rotationSeconds} onChange={(e) => setForm((v) => ({ ...v, rotationSeconds: Number(e.target.value || 10) }))} />
            <label className="flex items-center gap-2 text-sm text-rose-900">
              <input type="checkbox" checked={form.isActive} onChange={(e) => setForm((v) => ({ ...v, isActive: e.target.checked }))} />
              Aktiv
            </label>
          </div>
          <button type="button" onClick={() => void handleCreate()} disabled={saving} className="mt-4 rounded-xl bg-[var(--brand-strong)] px-4 py-2 text-sm font-semibold text-white disabled:opacity-60">
            {saving ? 'Speichern...' : 'Aktion speichern'}
          </button>
        </section>

        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Bestehende Aktionen</h3>
          {loading ? <p className="mt-3 text-sm text-rose-900/70">Lade Aktionen...</p> : null}
          {!loading ? (
            <div className="mt-3 grid gap-3 md:grid-cols-2">
              {rows.map((entry) => (
                <article key={entry.id} className="rounded-2xl border border-slate-200 bg-white p-4">
                  <div className="flex items-start justify-between gap-3">
                    <div>
                      <h4 className="text-sm font-semibold text-[var(--brand-ink)]">{entry.title}</h4>
                      <p className="mt-1 text-xs text-rose-900/70">{entry.description || 'Ohne Beschreibung'}</p>
                    </div>
                    <button
                      type="button"
                      onClick={() => void togglePromotion(entry)}
                      className={`rounded-lg px-2 py-1 text-xs font-semibold ${entry.isActive ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-100 text-slate-700'}`}
                    >
                      {entry.isActive ? 'Aktiv' : 'Inaktiv'}
                    </button>
                  </div>
                  <p className="mt-2 text-[11px] text-slate-500">
                    Placement: {entry.placements[0]?.placement || '-'} · Zielgruppe: {entry.targetings[0]?.audience || '-'} · Rotation: {entry.rotationSeconds}s
                  </p>
                </article>
              ))}
              {rows.length === 0 ? <p className="text-sm text-slate-500">Noch keine Aktionen vorhanden.</p> : null}
            </div>
          ) : null}
        </section>
      </div>
    </BackofficeLayout>
  )
}
