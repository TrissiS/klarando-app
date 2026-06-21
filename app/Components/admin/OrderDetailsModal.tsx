'use client'

import { useEffect, useMemo, useState } from 'react'
import {
  getOrderStatusHistory,
  type Order,
  type OrderStatusHistoryResponse,
} from '@/lib/api'

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

function formatDuration(seconds: number | null | undefined) {
  if (seconds === null || seconds === undefined || !Number.isFinite(seconds)) return '-'
  if (seconds < 60) return `${seconds} Sek.`
  const minutes = Math.floor(seconds / 60)
  const remainingSeconds = seconds % 60
  if (minutes < 60) {
    return remainingSeconds > 0 ? `${minutes} Min. ${remainingSeconds} Sek.` : `${minutes} Min.`
  }
  const hours = Math.floor(minutes / 60)
  const remainingMinutes = minutes % 60
  return remainingMinutes > 0 ? `${hours} Std. ${remainingMinutes} Min.` : `${hours} Std.`
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

function historySourceLabel(source: string | null | undefined) {
  switch (source) {
    case 'ORDERDESK':
      return 'OrderDesk'
    case 'DRIVER_APP':
      return 'Fahrer-App'
    case 'ADMIN':
      return 'Admin'
    case 'SYSTEM':
      return 'System'
    case 'WEBHOOK':
      return 'Webhook'
    default:
      return source || '-'
  }
}

function displayOrderNumber(order: Order) {
  const publicCode = (order.publicOrderCode || '').trim().toUpperCase()
  if (publicCode) {
    return publicCode
  }
  const compact = order.id.replace(/-/g, '').slice(-8).toUpperCase()
  return compact || order.id
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
  const [subject, setSubject] = useState(`Bestellung #${displayOrderNumber(order)} - ${tenantName}`)
  const [history, setHistory] = useState<OrderStatusHistoryResponse | null>(null)
  const [historyLoading, setHistoryLoading] = useState(false)
  const [historyError, setHistoryError] = useState('')

  useEffect(() => {
    function onKeyDown(event: KeyboardEvent) {
      if (event.key === 'Escape') {
        onClose()
      }
    }
    window.addEventListener('keydown', onKeyDown)
    return () => window.removeEventListener('keydown', onKeyDown)
  }, [onClose])

  useEffect(() => {
    let cancelled = false

    ;(async () => {
      try {
        setHistoryLoading(true)
        setHistoryError('')
        const response = await getOrderStatusHistory(order.id)
        if (!cancelled) {
          setHistory(response)
        }
      } catch (error) {
        if (!cancelled) {
          setHistory(null)
          setHistoryError(
            error instanceof Error ? error.message : 'Statusverlauf konnte nicht geladen werden'
          )
        }
      } finally {
        if (!cancelled) {
          setHistoryLoading(false)
        }
      }
    })()

    return () => {
      cancelled = true
    }
  }, [order.id])

  useEffect(() => {
    setRecipient(order.appCustomerAccount?.email || '')
    setSubject(`Bestellung #${displayOrderNumber(order)} - ${tenantName}`)
  }, [order.id, order.appCustomerAccount?.email, order.publicOrderCode, tenantName])

  const orderMailBody = useMemo(() => {
    const lines: string[] = []
    lines.push(`Bestelldetails #${displayOrderNumber(order)}`)
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
      subject.trim() || `Bestellung #${displayOrderNumber(order)}`
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
              #{displayOrderNumber(order)} - {tenantName}
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

          <article className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-white p-3">
            <div className="flex items-center justify-between gap-3">
              <p className="text-xs uppercase tracking-wide text-rose-900/70">Statusverlauf</p>
              {historyLoading ? (
                <span className="text-xs text-rose-900/60">Wird geladen...</span>
              ) : null}
            </div>

            {historyError ? (
              <div className="mt-3 rounded-xl border border-amber-200 bg-amber-50 px-3 py-2 text-sm text-amber-900">
                {historyError}
              </div>
            ) : null}

            {history?.summary ? (
              <div className="mt-3 grid gap-2 md:grid-cols-3">
                <div className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Bis Annahme</p>
                  <p className="mt-1 text-sm font-semibold text-slate-900">
                    {formatDuration(history.summary.timeToAcceptanceSeconds)}
                  </p>
                </div>
                <div className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Bis Zubereitung</p>
                  <p className="mt-1 text-sm font-semibold text-slate-900">
                    {formatDuration(history.summary.timeToKitchenSeconds)}
                  </p>
                </div>
                <div className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Bis Bereit</p>
                  <p className="mt-1 text-sm font-semibold text-slate-900">
                    {formatDuration(history.summary.timeToReadySeconds)}
                  </p>
                </div>
                <div className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Bis Fahrerstart</p>
                  <p className="mt-1 text-sm font-semibold text-slate-900">
                    {formatDuration(history.summary.timeToDriverHandoverSeconds)}
                  </p>
                </div>
                <div className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Lieferdauer</p>
                  <p className="mt-1 text-sm font-semibold text-slate-900">
                    {formatDuration(history.summary.deliveryDurationSeconds)}
                  </p>
                </div>
                <div className="rounded-xl border border-slate-200 bg-slate-50 px-3 py-2">
                  <p className="text-xs uppercase tracking-wide text-slate-500">Gesamtzeit</p>
                  <p className="mt-1 text-sm font-semibold text-slate-900">
                    {formatDuration(history.summary.totalDurationSeconds)}
                  </p>
                </div>
              </div>
            ) : null}

            {history?.timeline && history.timeline.length > 0 ? (
              <div className="mt-3 overflow-x-auto">
                <table className="min-w-full border-separate border-spacing-y-2 text-sm">
                  <thead>
                    <tr className="text-left text-xs uppercase tracking-wide text-rose-900/60">
                      <th className="px-2 py-1">Zeitpunkt</th>
                      <th className="px-2 py-1">Statuswechsel</th>
                      <th className="px-2 py-1">Geändert von</th>
                      <th className="px-2 py-1">Quelle</th>
                      <th className="px-2 py-1">Gerät / Fahrer</th>
                      <th className="px-2 py-1">Dauer vorher</th>
                    </tr>
                  </thead>
                  <tbody>
                    {history.timeline.map((entry) => (
                      <tr key={entry.id} className="rounded-xl bg-slate-50 text-rose-900/90">
                        <td className="px-2 py-2 align-top">{formatDateTime(entry.timestamp)}</td>
                        <td className="px-2 py-2 align-top">
                          <div className="font-semibold">
                            {entry.fromStatus ? statusLabel(entry.fromStatus) : 'Eingang'} →{' '}
                            {statusLabel(entry.toStatus)}
                          </div>
                          {entry.note ? (
                            <div className="mt-1 text-xs text-rose-900/70">{entry.note}</div>
                          ) : null}
                          {entry.reason ? (
                            <div className="mt-1 text-xs text-rose-900/70">
                              Grund: {entry.reason}
                            </div>
                          ) : null}
                        </td>
                        <td className="px-2 py-2 align-top">
                          {entry.changedBy || '-'}
                          {entry.actorRole ? (
                            <div className="text-xs text-rose-900/60">{entry.actorRole}</div>
                          ) : null}
                        </td>
                        <td className="px-2 py-2 align-top">
                          {historySourceLabel(entry.source)}
                          {entry.isFallback ? (
                            <div className="text-xs text-rose-900/60">Fallback</div>
                          ) : null}
                        </td>
                        <td className="px-2 py-2 align-top">
                          <div>{entry.deviceName || '-'}</div>
                          {entry.driverName ? (
                            <div className="text-xs text-rose-900/60">{entry.driverName}</div>
                          ) : null}
                        </td>
                        <td className="px-2 py-2 align-top">
                          {formatDuration(entry.durationInPreviousStatusSeconds)}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            ) : !historyLoading && !historyError ? (
              <p className="mt-3 text-sm text-rose-900/70">
                Für diese Bestellung liegt noch kein Statusverlauf vor.
              </p>
            ) : null}
          </article>

          <article className="mt-4 rounded-2xl border border-[var(--brand-border)] bg-rose-50/40 p-3">
            <p className="text-xs uppercase tracking-wide text-rose-900/70">Reklamation & Signatur</p>
            <div className="mt-2 grid gap-3 md:grid-cols-2">
              <div className="rounded-xl border border-slate-200 bg-white p-3">
                <p className="text-sm font-semibold text-rose-900/90">Kundensignatur</p>
                <p className="mt-1 text-sm text-rose-900/80">
                  Status:{' '}
                  {(history?.signature.captured ?? order.signatureCaptured)
                    ? 'Vorhanden'
                    : 'Nicht vorhanden'}
                </p>
                <p className="text-xs text-rose-900/70">
                  Name: {history?.signature.signerName || order.signatureSignerName || '-'}
                </p>
                <p className="text-xs text-rose-900/70">
                  Zeit: {formatDateTime(history?.signature.capturedAt || order.signatureCapturedAt)}
                </p>
                <p className="text-xs text-rose-900/70">
                  Quelle: {historySourceLabel(history?.signature.source || null)}
                </p>
                <p className="text-xs text-rose-900/70">
                  Gerät/Fahrer:{' '}
                  {history?.signature.deviceName ||
                    history?.signature.driverName ||
                    order.assignedDriverName ||
                    '-'}
                </p>
                {(history?.signature.imageDataUrl || order.signatureImageDataUrl) ? (
                  <a
                    href={history?.signature.imageDataUrl || order.signatureImageDataUrl || '#'}
                    target="_blank"
                    rel="noreferrer"
                    className="mt-2 inline-block text-xs font-semibold text-blue-700 underline"
                  >
                    Signaturbild ansehen
                  </a>
                ) : history?.signature.captured || order.signatureCaptured ? (
                  <p className="mt-2 text-xs font-medium text-amber-700">
                    {history?.signature.imageError ||
                      'Signaturdaten vorhanden, Bild konnte aber nicht geladen werden.'}
                  </p>
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
