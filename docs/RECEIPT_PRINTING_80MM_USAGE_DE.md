# 80mm Receipt Printing - Nutzung

Stand: 2026-05-04

## Was ist jetzt enthalten

- Backend-Endpoint fuer druckfertige Jobs:
  - `GET /api/order-displays/public/:displayCode/orders/:orderId/receipt-jobs`
- 80mm Renderer + Templates:
  - `backend/src/lib/receipt-template-80mm.ts`
  - `backend/src/lib/receipt-renderer-80mm.ts`
  - `backend/src/lib/receipt-jobs-80mm.ts`
- ESC/POS Encoder:
  - `backend/src/lib/escpos-encoder-80mm.ts`
- Frontend/Shared Client-Utilities:
  - `lib/receipt-template-80mm.ts`
  - `lib/receipt-renderer-80mm.ts`
  - `lib/receipt-jobs-80mm.ts`
  - `lib/escpos-printer-80mm.ts`
  - `lib/receipt-print-queue-80mm.ts`

## API Beispiel

```http
GET /api/order-displays/public/CASH01/orders/<ORDER_ID>/receipt-jobs?kind=both&locale=de-DE&timeZone=Europe/Berlin
```

Antwort (gekürzt):

```json
{
  "ok": true,
  "displayCode": "CASH01",
  "orderId": "....",
  "jobs": [
    {
      "kind": "CUSTOMER",
      "templateId": "klarando.customer.80mm.v1",
      "escposBase64": "G0AB...",
      "bytesLength": 1542
    },
    {
      "kind": "KITCHEN",
      "templateId": "klarando.kitchen.80mm.v1",
      "escposBase64": "G0AB...",
      "bytesLength": 1317
    }
  ]
}
```

## Android Umsetzung (MVP)

1. Polling wie bisher auf Feed (`/feed`) fuer neue Orders.
2. Bei Druck-Event API fuer Receipt-Job aufrufen.
3. `escposBase64` decodieren zu `ByteArray`.
4. ByteArray an Vendor-SDK oder ESC/POS Transport senden.
5. Bei Fehler in lokale Retry-Queue legen.

Hinweis:
- Falls der Drucker keine Umlaute in UTF-8 korrekt rendert, im Druckadapter ASCII-Fallback aktivieren.

## Debug ohne Hardware

Falls noch kein Zielgeraet vorhanden ist:
- Druckmodus in Klarando OrderDesk auf `Debug-Log (ohne Druck)` stellen.
- Jeder Druckjob wird lokal als JSONL-Zeile protokolliert.
- Damit kann der komplette Receipt-Flow validiert werden, bevor ein echtes 80mm-Geraet angeschlossen ist.
