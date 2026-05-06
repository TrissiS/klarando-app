'use client'

import { useEffect, useMemo, useState } from 'react'
import type { Order } from '@/lib/api'

type Props = {
  order: Order
  tenantName: string
  chainName: string
  onClose: () => void
  onResolveComplaint?: (complaintId: string) => Promise<void>
  resolvingComplaintId?: string | null
}

function formatDateTime(value: string | null | undefined) {
  if (!value) return '-'
  const date = new Date(value)
  return Number.isNaN(date.getTime()) ? '-' : date.toLocaleString('de-DE')
}

function formatMoney(value: number | string) {
  const parsed =
    typeof value === 'number' ? value : Number.parseFloat(String(value).replace(',', '.'))
  const safe = Number.isFinite(parsed) ? parsed : 0
  return `${safe.toFixed(2)} EUR`
}

function statusLabel(status: string) {
  switch (status) {
    case 'pending_payment':
      return 'Wartet auf Zahlung'
    case 'open':
      return 'Offen'
    case 'preparing':
      return 'In Zubereitung'
    case 'out_for_delivery':
      return 'Fahrer unterwegs'
    case 'done':
      return 'Fertig'
    case 'archived':
      return 'Archiviert'
    default:
      return status
  }
}

function sourceLabel(source: string) {
  switch (source) {
    case 'APP':
      return 'App'
    case 'DELIVERY':
      return 'Lieferung'
    case 'TERMINAL':
      return 'Bestellterminal'
    case 'POS':
      return 'POS'
    default:
      return source
  }
}

function serviceLabel(serviceType: string | null | undefined) {
  if (serviceType === 'DELIVERY') return 'Lieferung'
  if (serviceType === 'PICKUP') return 'Abholung'
  return '-'
}

function shortOrderNumber(orderId: string) {
  const compact = orderId.replace(/-/g, '').slice(-8).toUpperCase()
  return compact || orderId
}

export default function OrderDetailsModal({
  order,
  tenantName,
  chainName,
  onClose,
  onResolveComplaint,
  resolvingComplaintId,
}: Props) {
  const [recipient, setRecipient] = useState(order.appCustomerAccount?.email || '')
  const [subject, setSubject] = useState(`Bestellung ${shortOrderNumber(order.id)} - ${tenantName}`)

  useEffect(() => {
    function onKeyDown(event: KeyboardEvent) {
      if (event.key === 'Escape') {
        onClose()
      }
    }
    window.addEventListener('keydown', onKeyDown)
    return () => window.removeEventListener('keydown', onKeyDown)
  }, [onClose])

  const orderMailBody = useMemo(() => {
    const lines: string[] = []
    lines.push(`Bestelldetails ${shortOrderNumber(order.id)}`)
    lines.push('')
    lines.push(`Bestellung-ID: ${order.id}`)
    lines.push(`Zeit: ${formatDateTime(order.createdAt)}`)
    lines.push(`Filiale: ${tenantName}`)
    lines.push(`Kette: ${chainName}`)
    lines.push(`Kanal: ${sourceLabel(order.sourceChannel)}`)
    lines.push(`Status: ${statusLabel(order.status)}`)
    lines.push(`Service: ${serviceLabel(order.serviceType)}`)
    lines.push(`Fahrer: ${order.assignedDriverName || order.assignedDriver?.name || '-'}`)
    lines.push(`Kundensignatur: ${order.signatureCaptured ? 'Ja' : 'Nein'}`)
    if (order.signatureSignerName) {
      lines.push(`Signaturname: ${order.signatureSignerName}`)
    }
    lines.push(`Zahlung: ${(order.paymentMethod || '-') + ' | ' + order.paymentStatus}`)
    lines.push(`Summe: ${formatMoney(order.total)}`)
    lines.push(`Zwischensumme: ${formatMoney(order.subtotal)}`)
    lines.push(`Liefergebuehr: ${formatMoney(order.deliveryFee)}`)
    lines.push('')
    lines.push('Kundendaten:')
    lines.push(`Name: ${order.customerName || order.appCustomerAccount?.fullName || '-'}`)
    lines.push(`Telefon: ${order.customerPhone || '-'}`)
    lines.push(`E-Mail: ${order.appCustomerAccount?.email || '-'}`)
    lines.push(`Adresse: ${order.customerAddress || '-'}`)
    lines.push(`PLZ/Ort: ${`${order.customerZipCode || ''} ${order.customerCity || ''}`.trim() || '-'}`)
    lines.push('')
    lines.push('Artikel:')
    order.items.forEach((item, index) => {
      const unitPrice = item.unitBasePrice || item.price
      lines.push(
        `${index + 1}. ${item.quantity}x ${item.product.name} | Einzelpreis ${formatMoney(unitPrice)} | Position ${formatMoney(item.price)}`
      )
      if (item.modifierSnapshot && item.modifierSnapshot.length > 0) {
        const modifierText = item.modifierSnapshot
          .map((modifier) => {
            const deltaText =
              modifier.priceDelta && Number(modifier.priceDelta) !== 0
                ? ` (${modifier.priceDelta > 0 ? '+' : ''}${Number(modifier.priceDelta).toFixed(2)} EUR)`
                : ''
            return `${modifier.name}${deltaText}`
          })
          .join(', ')
        lines.push(`   Optionen: ${modifierText}`)
      }
    })
    if (order.complaints && order.complaints.length > 0) {
      lines.push('')
      lines.push('Reklamationen:')
      order.complaints.forEach((complaint, index) => {
        lines.push(`${index + 1}. ${formatDateTime(complaint.createdAt)} | ${complaint.message}`)
        if (complaint.images.length > 0) {
          lines.push(`   Bilder: ${complaint.images.length}`)
        }
      })
    }
    lines.push('')
    lines.push('Automatisch aus Klarando versendet.')
    return lines.join('\n')
  }, [chainName, order, tenantName])

  function openMailClient() {
    const trimmedRecipient = recipient.trim()
    if (!trimmedRecipient) return
    const mailto = `mailto:${encodeURIComponent(trimmedRecipient)}?subject=${encodeURIComponent(
      subject.trim() || `Bestellung ${shortOrderNumber(order.id)}`
    )}&body=${encodeURIComponent(orderMailBody)}`
    window.location.href = mailto
  }

  return (
    <div className="fixed inset-0 z-[80] flex items-center justify-center bg-slate-900/55 p-4">
      <div className="w-full max-w-4xl rounded-3xl bg-white shadow-2xl ring-1 ring-[var(--brand-border)]">
        <div className="flex items-start justify-between gap-3 border-b border-[var(--brand-border)] px-5 py-4">
          <div>
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Bestell-Details</p>
            <h3 className="mt-1 text-xl font-bold text-[var(--brand-ink)]">
              #{shortOrderNumber(order.id)} - {tenantName}
            </h3>
            <p className="mt-1 text-sm text-rose-900/75">
              {formatDateTime(order.createdAt)} | {statusLabel(order.status)} |{' '}
              {sourceLabel(order.sourceChannel)}
            </p>
          </div>
          <button
            type="button"
            onClick={onClose}
            className="rounded-xl border border-[var(--brand-border)] px-3 py-1.5 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50"
          >
            Schliessen
          </button>
        </div>

        <div className="max-h-[72vh] overflow-y-auto px-5 py-4">
          <div className="grid gap-3 md:grid-cols-2">
            <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/50 p-3">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Kunde</p>
              <p className="mt-2 text-sm text-rose-900/90">
                Name: {order.customerName || order.appCustomerAccount?.fullName || '-'}
              </p>
              <p className="text-sm text-rose-900/90">Telefon: {order.customerPhone || '-'}</p>
              <p className="text-sm text-rose-900/90">E-Mail: {order.appCustomerAccount?.email || '-'}</p>
              <p className="mt-2 text-sm text-rose-900/90">Adresse: {order.customerAddress || '-'}</p>
              <p className="text-sm text-rose-900/90">
                PLZ/Ort: {`${order.customerZipCode || ''} ${order.customerCity || ''}`.trim() || '-'}
              </p>
            </article>

            <article className="rounded-2xl border border-[var(--brand-border)] bg-rose-50/50 p-3">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Bestellung</p>
              <p className="mt-2 text-sm text-rose-900/90">Filiale: {tenantName}</p>
              <p className="text-sm text-rose-900/90">Kette: {chainName}</p>
              <p className="text-sm text-rose-900/90">Service: {serviceLabel(order.serviceType)}</p>
              <p className="text-sm text-rose-900/90">
                Fahrer: {order.assignedDriverName || order.assignedDriver?.name || '-'}
              </p>
              <p className="text-sm text-rose-900/90">
                ETA:{' '}
                {order.estimatedMinutes
                  ? `${order.estimatedMinutes} min (${formatDateTime(order.estimatedReadyAt)})`
                  : '-'}
              </p>
              <p className="text-sm text-rose-900/90">
                Zahlung: {(order.paymentMethod || '-') + ' | ' + order.paymentStatus}
              </p>
              <p className="mt-2 text-sm font-semibold text-[var(--brand-ink)]">
                Gesamt: {formatMoney(order.total)}
              </p>
              <p className="text-xs text-rose-900/70">
                Zwischensumme {formatMoney(order.subtotal)} | Liefergebuehr{' '}
                {formatMoney(order.deliveryFee)}
              </p>
            </article>
          </div>

          <article className="mt-4 rounded-2xl border border-[var(--brand-border)] p-3">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Artikel</p>
            <div className="mt-3 space-y-2">
              {order.items.map((item) => (
                <div
                  key={item.id}
                  className="rounded-xl border border-slate-200 bg-white px-3 py-2 text-sm text-rose-900/90"
                >
                  <p className="font-semibold">
                    {item.quantity}x {item.product.name}
                  </p>
                  <p className="text-xs text-rose-900/75">
                    Einzelpreis {formatMoney(item.unitBasePrice || item.price)} | Position{' '}
                    {formatMoney(item.price)}
                  </p>
                  {item.modifierSnapshot && item.modifierSnapshot.length > 0 ? (
                    <p className="mt-1 text-xs text-rose-900/75">
                      Optionen:{' '}
                      {item.modifierSnapshot
                        .map((modifier) => {
                          const delta =
                            modifier.priceDelta && Number(modifier.priceDelta) !== 0
                              ? ` (${modifier.priceDelta > 0 ? '+' : ''}${Number(modifier.priceDelta).toFixed(2)} EUR)`
                              : ''
                          return `${modifier.name}${delta}`
                        })
                        .join(', ')}
                    </p>
                  ) : null}
                </div>
              ))}
            </div>
          </article>

          <article className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 p-3">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Reklamation & Signatur</p>
            <div className="mt-2 grid gap-3 md:grid-cols-2">
              <div className="rounded-xl border border-slate-200 bg-white p-3">
                <p className="text-sm font-semibold text-rose-900/90">Kundensignatur</p>
                <p className="mt-1 text-sm text-rose-900/80">
                  Status: {order.signatureCaptured ? 'Vorhanden' : 'Nicht vorhanden'}
                </p>
                <p className="text-xs text-rose-900/70">
                  Name: {order.signatureSignerName || '-'}
                </p>
                <p className="text-xs text-rose-900/70">
                  Zeit: {formatDateTime(order.signatureCapturedAt)}
                </p>
                {order.signatureImageDataUrl ? (
                  <a
                    href={order.signatureImageDataUrl}
                    target="_blank"
                    rel="noreferrer"
                    className="mt-2 inline-block text-xs font-semibold text-blue-700 underline"
                  >
                    Signaturbild ansehen
                  </a>
                ) : null}
              </div>

              <div className="rounded-xl border border-slate-200 bg-white p-3">
                <p className="text-sm font-semibold text-rose-900/90">Reklamationen</p>
                {!order.complaints || order.complaints.length === 0 ? (
                  <p className="mt-1 text-sm text-rose-900/70">Keine Reklamation vorhanden.</p>
                ) : (
                  <div className="mt-2 space-y-2">
                    {order.complaints.map((complaint) => (
                      <div key={complaint.id} className="rounded-lg border border-amber-200 bg-amber-50 p-2">
                        <p className="text-xs font-semibold text-amber-900">
                          {formatDateTime(complaint.createdAt)}{' '}
                          {complaint.isResolved ? '(erledigt)' : '(offen)'}
                        </p>
                        <p className="text-sm text-amber-900/90">{complaint.message}</p>
                        {!complaint.isResolved && onResolveComplaint ? (
                          <button
                            type="button"
                            onClick={() => void onResolveComplaint(complaint.id)}
                            disabled={resolvingComplaintId === complaint.id}
                            className="mt-2 rounded-lg border border-amber-300 bg-white px-2 py-1 text-xs font-semibold text-amber-700 hover:bg-amber-100 disabled:cursor-not-allowed disabled:opacity-60"
                          >
                            {resolvingComplaintId === complaint.id
                              ? 'Wird erledigt...'
                              : 'Als erledigt markieren'}
                          </button>
                        ) : null}
                        {complaint.images.length > 0 ? (
                          <div className="mt-2 flex flex-wrap gap-2">
                            {complaint.images.map((image, index) => (
                              <a
                                key={`${complaint.id}-image-${index}`}
                                href={image}
                                target="_blank"
                                rel="noreferrer"
                                className="inline-flex rounded-lg border border-amber-300 bg-white px-2 py-1 text-xs font-semibold text-amber-700 hover:bg-amber-100"
                              >
                                Bild {index + 1}
                              </a>
                            ))}
                          </div>
                        ) : null}
                      </div>
                    ))}
                  </div>
                )}
              </div>
            </div>
          </article>

          <article className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/50 p-3">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Per E-Mail senden</p>
            <div className="mt-3 grid gap-3 md:grid-cols-2">
              <label className="block">
                <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">
                  Empfaenger
                </span>
                <input
                  type="email"
                  value={recipient}
                  onChange={(event) => setRecipient(event.target.value)}
                  placeholder="kunde@beispiel.de"
                  className="input-ui"
                />
              </label>
              <label className="block">
                <span className="mb-1 block text-xs uppercase tracking-wide text-rose-900/70">
                  Betreff
                </span>
                <input
                  value={subject}
                  onChange={(event) => setSubject(event.target.value)}
                  className="input-ui"
                />
              </label>
            </div>
            <p className="mt-2 text-xs text-rose-900/70">
              Oeffnet dein Mailprogramm mit allen Bestellinfos als Text.
            </p>
            <div className="mt-3 flex flex-wrap gap-2">
              <button
                type="button"
                onClick={openMailClient}
                disabled={!recipient.trim()}
                className="rounded-xl bg-slate-900 px-3 py-2 text-sm font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-50"
              >
                E-Mail mit Bestellinfos oeffnen
              </button>
              <button
                type="button"
                onClick={() => navigator.clipboard.writeText(orderMailBody)}
                className="rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm font-medium text-rose-900/85 transition hover:bg-rose-50"
              >
                Mailtext kopieren
              </button>
            </div>
          </article>
        </div>
      </div>
    </div>
  )
}
