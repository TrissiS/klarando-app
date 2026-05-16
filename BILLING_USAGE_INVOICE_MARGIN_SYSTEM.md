# Klarando Billing / Usage / Invoice / Margin (MVP)

## Abrechnungslogik
- Zeitraum: Monat (`YYYY-MM`), serverseitig als UTC-Monatsfenster.
- Zählung: `ordersCounted` aus bezahlten/abgeschlossenen Bestellungen (laut TenantBillingSettings).
- Inklusivbestellungen: `includedOrders` aus `TenantBillingPlan`.
- Zusatzbestellungen: `max(ordersCounted - includedOrders, 0)`.
- Gebührenbestandteile:
  - Monatsgebühr (`monthlyFeeCents`)
  - Provision auf Zusatzbestellungen (MVP über Zusatzumsatz-Schätzung)
  - Fixbetrag pro Zusatzbestellung (`fixedFeePerOrderCents`)
- Umsatz/Gebühr/Marge getrennt:
  - gezählter Umsatz (`countedRevenueCents`)
  - Klarando-Gebühr netto/brutto
  - Marge (MVP = Gebühren netto)

## Inklusivbestellungen
- Anzeige für Admin/Chainadmin:
  - „X von Y Inklusivbestellungen verbraucht“
  - „Ab Bestellung Y+1 fallen Provision/Fixbetrag an“
- Statuslogik pro Tenant:
  - `WITHIN_INCLUDED`
  - `NEAR_INCLUDED_LIMIT`
  - `CHARGEABLE`
  - `INVOICE_OPEN`
  - `INVOICE_PAID`

## Provision / Fixbetrag
- Provision: `commissionAfterIncludedOrdersPercent` oder fallback `commissionPercent`.
- Fixbetrag: `fixedFeePerOrderCents * extraOrders`.
- Monatsgebühr wird immer separat berücksichtigt.

## Rechnungsflow
- Superadmin:
  - `POST /api/billing/runs/preview` -> Vorschau + Warnungen
  - `POST /api/billing/runs` -> BillingRun + Rechnungsentwürfe
  - `POST /api/billing/invoices/:id/finalize` -> Statuswechsel DRAFT -> ISSUED
- Wichtig:
  - Nach Finalisierung darf Rechnung nicht erneut überschrieben werden.
  - Korrekturen später über Korrektur-/Stornorechnung.

## Rechtliche Pflichtfelder (technisch vorbereitet)
- Ausstellerdaten im API-PDF-MVP enthalten:
  - Klarando Einzelunternehmen
  - Tristan Stenger
  - Untere Wiesenstr. 6, 57271 Hilchenbach
  - info@klarando.com
  - USt-IdNr. DE314972366
- Empfängerfelder kommen aus `BillingProfile`.
- Warnungen im Preview bei fehlenden Pflichtangaben.

## E-Rechnung Vorbereitung
- API liefert strukturierte Rechnungsdaten.
- Hinweisfelder für ZUGFeRD/XRechnung sind vorbereitet.
- Finaler XML/PDF-Hybrid-Export folgt in späterer Ausbaustufe.

## Margenübersicht
- Superadmin-Summary (`/api/billing/summary`):
  - Plattformumsatz netto/brutto
  - erwartete Klarando-Marge (MVP)
  - offene/bezahlte Rechnungen
  - Anzahl inklusiver/kostenpflichtiger Betriebe

## Neue/erweiterte Endpunkte
- Superadmin:
  - `GET /api/billing/summary?month=YYYY-MM`
  - `GET /api/billing/tenants?month=YYYY-MM`
  - `POST /api/billing/runs/preview`
  - `POST /api/billing/runs`
  - `POST /api/billing/invoices/:id/finalize`
  - `GET /api/billing/invoices/:id/pdf`
- Admin:
  - `GET /api/finance/usage/current`
  - `GET /api/finance/invoices`
- Chainadmin:
  - `GET /api/finance/chain/usage/current`
  - `GET /api/finance/chain/invoices`

## Offene Punkte (für Steuerberaterprüfung)
- Steuerlogik je Land/Steuersatz final juristisch prüfen.
- Behandlung von Gutschrift-/Korrekturrechnungen vollständig ergänzen.
- Payment-/Hosting-Kosten für echte Nettomarge anreichern.
- E-Mail-Versand + PDF-Renderer produktionsfest machen.
