'use client'

import { useEffect, useMemo, useState } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'
import {
  createCmsPage,
  getCmsPages,
  publishCmsPage,
  updateCmsPage,
  type CmsBlock,
  type CmsBlockType,
  type CmsPage,
} from '@/lib/api'
import type { SessionUser } from '@/lib/app-data'

const BLOCK_TYPES: CmsBlockType[] = ['Hero', 'FeatureGrid', 'TextImage', 'FAQ', 'CTA', 'PromotionSlider', 'LegalNoticeBlock']

function defaultBlock(type: CmsBlockType): CmsBlock {
  if (type === 'Hero') return { type, data: { headline: 'Willkommen bei Klarando', subline: 'Digitale Bestellungen ohne Umwege.', buttonText: 'Jetzt bestellen', buttonUrl: '/main-app', imageUrl: '' } }
  if (type === 'FeatureGrid') return { type, data: { title: 'Vorteile', items: [{ title: 'Schnell starten', text: 'Ohne lange Einrichtung.', icon: 'rocket' }] } }
  if (type === 'TextImage') return { type, data: { title: 'Über Klarando', text: 'Klarando verbindet Gäste und Betriebe.', imageUrl: '', imagePosition: 'left' } }
  if (type === 'FAQ') return { type, data: { title: 'Häufige Fragen', items: [{ question: 'Wie starte ich?', answer: 'Einfach registrieren und loslegen.' }] } }
  if (type === 'CTA') return { type, data: { headline: 'Partner werden', text: 'Teste Klarando im Pilotbetrieb.', buttonText: 'Partner werden', buttonUrl: '/partner' } }
  if (type === 'PromotionSlider') return { type, data: { placement: 'PUBLIC_HOMEPAGE', audience: 'ALL', maxItems: 8 } }
  return { type, data: { title: 'Rechtlicher Hinweis', text: 'Rechtstexte werden weiterhin separat gepflegt.', linkLabel: 'Rechtliches öffnen', linkUrl: '/infos' } }
}

export default function SuperadminCmsPage() {
  const [token, setToken] = useState('')
  const [pages, setPages] = useState<CmsPage[]>([])
  const [selectedPageId, setSelectedPageId] = useState<string>('')
  const [saving, setSaving] = useState(false)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')
  const [draft, setDraft] = useState<Partial<CmsPage>>({})
  const [newPage, setNewPage] = useState({ key: '', slug: '', title: '' })

  const selectedPage = useMemo(
    () => pages.find((entry) => entry.id === selectedPageId) || null,
    [pages, selectedPageId]
  )

  async function loadPages(currentToken = token) {
    if (!currentToken) return
    setLoading(true)
    setError('')
    try {
      const rows = await getCmsPages(currentToken)
      setPages(rows)
      if (!selectedPageId && rows[0]) {
        setSelectedPageId(rows[0].id)
      }
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'CMS-Seiten konnten nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    const rawSession = localStorage.getItem('sessionUser')
    const parsed = rawSession ? (JSON.parse(rawSession) as SessionUser) : null
    if (!parsed || parsed.role !== 'superadmin') {
      window.location.href = '/superadmin'
      return
    }
    const accessToken = parsed.accessToken || localStorage.getItem('accessToken') || ''
    setToken(accessToken)
    void loadPages(accessToken)
  }, [])

  useEffect(() => {
    if (!selectedPage) {
      setDraft({})
      return
    }
    setDraft(selectedPage)
  }, [selectedPageId, selectedPage])

  async function handleCreatePage() {
    if (!token) return
    if (!newPage.key.trim() || !newPage.slug.trim() || !newPage.title.trim()) {
      setError('Bitte Key, Slug und Titel ausfüllen.')
      return
    }
    setSaving(true)
    setError('')
    setInfo('')
    try {
      const created = await createCmsPage(token, {
        key: newPage.key,
        slug: newPage.slug,
        title: newPage.title,
        status: 'DRAFT',
        contentJson: [defaultBlock('Hero'), defaultBlock('FeatureGrid'), defaultBlock('CTA')],
      })
      setPages((prev) => [created, ...prev])
      setSelectedPageId(created.id)
      setNewPage({ key: '', slug: '', title: '' })
      setInfo('CMS-Seite wurde erstellt.')
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Seite konnte nicht erstellt werden')
    } finally {
      setSaving(false)
    }
  }

  function updateBlock(index: number, patch: Record<string, unknown>) {
    const blocks = Array.isArray(draft.contentJson) ? [...draft.contentJson] : []
    const current = blocks[index]
    if (!current) return
    blocks[index] = { ...current, data: { ...current.data, ...patch } }
    setDraft((prev) => ({ ...prev, contentJson: blocks }))
  }

  function moveBlock(index: number, direction: -1 | 1) {
    const blocks = Array.isArray(draft.contentJson) ? [...draft.contentJson] : []
    const target = index + direction
    if (target < 0 || target >= blocks.length) return
    const temp = blocks[index]
    blocks[index] = blocks[target]
    blocks[target] = temp
    setDraft((prev) => ({ ...prev, contentJson: blocks }))
  }

  function removeBlock(index: number) {
    const blocks = Array.isArray(draft.contentJson) ? [...draft.contentJson] : []
    blocks.splice(index, 1)
    setDraft((prev) => ({ ...prev, contentJson: blocks }))
  }

  function addBlock(type: CmsBlockType) {
    const blocks = Array.isArray(draft.contentJson) ? [...draft.contentJson] : []
    blocks.push(defaultBlock(type))
    setDraft((prev) => ({ ...prev, contentJson: blocks }))
  }

  async function handleSaveDraft() {
    if (!token || !selectedPage) return
    setSaving(true)
    setError('')
    setInfo('')
    try {
      await updateCmsPage(token, selectedPage.id, {
        key: draft.key || selectedPage.key,
        slug: draft.slug || selectedPage.slug,
        title: draft.title || selectedPage.title,
        seoTitle: draft.seoTitle || null,
        seoDescription: draft.seoDescription || null,
        ogImageUrl: draft.ogImageUrl || null,
        status: 'DRAFT',
        contentJson: Array.isArray(draft.contentJson) ? draft.contentJson : [],
      })
      setInfo('Entwurf gespeichert.')
      await loadPages(token)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Entwurf konnte nicht gespeichert werden')
    } finally {
      setSaving(false)
    }
  }

  async function handlePublish() {
    if (!token || !selectedPage) return
    setSaving(true)
    setError('')
    setInfo('')
    try {
      await updateCmsPage(token, selectedPage.id, {
        key: draft.key || selectedPage.key,
        slug: draft.slug || selectedPage.slug,
        title: draft.title || selectedPage.title,
        seoTitle: draft.seoTitle || null,
        seoDescription: draft.seoDescription || null,
        ogImageUrl: draft.ogImageUrl || null,
        contentJson: Array.isArray(draft.contentJson) ? draft.contentJson : [],
      })
      await publishCmsPage(token, selectedPage.id)
      setInfo('Seite wurde veröffentlicht.')
      await loadPages(token)
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Seite konnte nicht veröffentlicht werden')
    } finally {
      setSaving(false)
    }
  }

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Website / CMS"
      subtitle="Klarando Site Builder für zentrale Website-Inhalte"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-5">
        {error ? <div className="rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div> : null}
        {info ? <div className="rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{info}</div> : null}

        <section className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
          <h2 className="text-base font-semibold text-[var(--brand-ink)]">Neue Seite anlegen</h2>
          <div className="mt-3 grid gap-3 md:grid-cols-4">
            <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm" placeholder="Key (z. B. homepage)" value={newPage.key} onChange={(event) => setNewPage((prev) => ({ ...prev, key: event.target.value }))} />
            <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm" placeholder="Slug (z. B. home)" value={newPage.slug} onChange={(event) => setNewPage((prev) => ({ ...prev, slug: event.target.value }))} />
            <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm md:col-span-2" placeholder="Titel" value={newPage.title} onChange={(event) => setNewPage((prev) => ({ ...prev, title: event.target.value }))} />
          </div>
          <button type="button" onClick={() => void handleCreatePage()} disabled={saving} className="mt-3 rounded-xl bg-[var(--brand-strong)] px-4 py-2 text-sm font-semibold text-white disabled:opacity-60">
            Seite erstellen
          </button>
        </section>

        <section className="grid gap-4 lg:grid-cols-[300px_1fr]">
          <aside className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Seiten</h3>
            {loading ? <p className="mt-2 text-sm text-slate-500">Lade...</p> : null}
            <div className="mt-3 space-y-2">
              {pages.map((page) => (
                <button
                  key={page.id}
                  type="button"
                  onClick={() => setSelectedPageId(page.id)}
                  className={`w-full rounded-xl border px-3 py-2 text-left text-sm ${page.id === selectedPageId ? 'border-rose-300 bg-rose-50' : 'border-slate-200 bg-white'}`}
                >
                  <p className="font-semibold text-[var(--brand-ink)]">{page.title}</p>
                  <p className="text-xs text-slate-500">/{page.slug} · {page.status}</p>
                </button>
              ))}
            </div>
          </aside>

          <div className="rounded-2xl border border-[var(--brand-border)] bg-white p-4">
            {!selectedPage ? (
              <p className="text-sm text-slate-500">Bitte eine CMS-Seite auswählen.</p>
            ) : (
              <div className="space-y-4">
                <div className="grid gap-3 md:grid-cols-2">
                  <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm" value={draft.title || ''} onChange={(event) => setDraft((prev) => ({ ...prev, title: event.target.value }))} placeholder="Seitentitel" />
                  <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm" value={draft.slug || ''} onChange={(event) => setDraft((prev) => ({ ...prev, slug: event.target.value }))} placeholder="Slug" />
                  <input className="rounded-xl border border-slate-300 px-3 py-2 text-sm md:col-span-2" value={draft.seoTitle || ''} onChange={(event) => setDraft((prev) => ({ ...prev, seoTitle: event.target.value }))} placeholder="SEO-Titel" />
                  <textarea className="rounded-xl border border-slate-300 px-3 py-2 text-sm md:col-span-2" value={draft.seoDescription || ''} onChange={(event) => setDraft((prev) => ({ ...prev, seoDescription: event.target.value }))} placeholder="SEO-Beschreibung" />
                </div>

                <div className="rounded-2xl border border-slate-200 bg-slate-50 p-3">
                  <p className="text-xs font-semibold uppercase tracking-wide text-slate-600">Blöcke</p>
                  <div className="mt-2 flex flex-wrap gap-2">
                    {BLOCK_TYPES.map((type) => (
                      <button key={type} type="button" onClick={() => addBlock(type)} className="rounded-lg border border-slate-300 bg-white px-2 py-1 text-xs font-medium text-slate-700">
                        + {type}
                      </button>
                    ))}
                  </div>
                </div>

                <div className="space-y-3">
                  {(Array.isArray(draft.contentJson) ? draft.contentJson : []).map((block, index) => (
                    <article key={`${index}-${block.type}`} className="rounded-2xl border border-slate-200 p-3">
                      <div className="flex flex-wrap items-center justify-between gap-2">
                        <p className="text-sm font-semibold text-[var(--brand-ink)]">{block.type}</p>
                        <div className="flex gap-1">
                          <button type="button" onClick={() => moveBlock(index, -1)} className="rounded-lg border border-slate-300 px-2 py-1 text-xs">↑</button>
                          <button type="button" onClick={() => moveBlock(index, 1)} className="rounded-lg border border-slate-300 px-2 py-1 text-xs">↓</button>
                          <button type="button" onClick={() => removeBlock(index)} className="rounded-lg border border-red-200 px-2 py-1 text-xs text-red-700">Löschen</button>
                        </div>
                      </div>
                      <textarea
                        className="mt-2 min-h-24 w-full rounded-xl border border-slate-300 px-3 py-2 font-mono text-xs"
                        value={JSON.stringify(block.data, null, 2)}
                        onChange={(event) => {
                          try {
                            const parsed = JSON.parse(event.target.value) as Record<string, unknown>
                            updateBlock(index, parsed)
                          } catch {
                            // keep current value until valid JSON
                          }
                        }}
                      />
                    </article>
                  ))}
                </div>

                <div className="flex flex-wrap gap-2">
                  <button type="button" onClick={() => void handleSaveDraft()} disabled={saving} className="rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 disabled:opacity-60">
                    Als Entwurf speichern
                  </button>
                  <button type="button" onClick={() => void handlePublish()} disabled={saving} className="rounded-xl bg-emerald-600 px-4 py-2 text-sm font-semibold text-white disabled:opacity-60">
                    Veröffentlichen
                  </button>
                  <a
                    href={`/superadmin/cms/preview/${selectedPage.id}`}
                    target="_blank"
                    rel="noreferrer"
                    className="rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700"
                  >
                    Vorschau öffnen
                  </a>
                </div>
              </div>
            )}
          </div>
        </section>
      </div>
    </BackofficeLayout>
  )
}
