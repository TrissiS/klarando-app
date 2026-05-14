# Admin Navigation & Finance Refactor

## Alte Probleme
- Links in Sidebar waren durch überlagerte/unnötig komplexe Z-Index- und Pointer-Event-Struktur unzuverlässig klickbar.
- Navigation war teilweise technisch statt prozessorientiert aufgebaut.
- Business-Vorlagen hatten keine konsequente Artikelnummern-Übernahme in Produktdaten.
- Betreiber hatten keine fokussierte Finanzübersicht im Admin.

## Neue Menüstruktur (Admin)
- Tagesgeschäft
- Speisekarte
- Lieferbetrieb
- Geräte
- Marketing
- Finanzen
- Verwaltung

Die Struktur ist in `app/Components/admin/AdminLayout.tsx` zentralisiert und nutzt weiterhin Modul-/Permission-Checks.

## Sidebar-Link-Bug
- Entfernt:
  - zusätzliche Debug-Overlays im Layout
  - unnötige `z-*`/`pointer-events-*` Komplexität an Link-Containern
- Ergebnis:
  - Menüpunkte reagieren wieder zuverlässig auf normalen Linksklick.

## Business-Vorlagen: Artikelnummern
- `BusinessTemplateProduct.productNumber` wird jetzt als Artikelnummer aktiv genutzt.
- Neu: `BusinessTemplateProduct.ean` (optional).
- Import in Tenant-Produkte übernimmt jetzt:
  - `productNumber`
  - `ean`
- Seed erzeugt pro Template automatisch stabile Artikelnummern (Format wie `DON-001`), falls nicht gesetzt.

## Finanzbereich für Betreiber
- Neue Seite: `/admin/finanzen`
- Neue Backend-API: `GET /api/finance/overview?tenantId=...&days=...`
- Zeigt:
  - Bruttosumme (bezahlt)
  - Klarando-Gebühren
  - voraussichtliche Auszahlung
  - Transaktionsliste mit Zahlungsstatus/-art, Trinkgeld, Gebühren
- Tenant-Scope bleibt serverseitig erzwungen.

## Gebührenlogik (Superadmin)
- Bestehende Superadmin-Abrechnungslogik bleibt in `Module & Pakete`.
- Zusätzlicher Einstieg: `/superadmin/fees` (Alias auf bestehende Seite).
- Zentrale Berechnung vorbereitet über:
  - `backend/src/lib/klarando-fees.ts`
  - `calculateKlarandoFees(...)`

## Offene Payment-Punkte
- Provider-Gebühren (PayPal/Stripe) sind im MVP nur optional berücksichtigt.
- Auszahlungsläufe/Settlement-Status sind noch kein kompletter End-to-End-Payout-Prozess.
- Rechnungsdokumente/Export bleiben als nächster Schritt.

## Nächste Schritte (PayPal/Stripe)
1. Provider-Fee je Transaktion persistieren und in Finanzübersicht einblenden.
2. Auszahlungsstatus (`pending`, `paid_out`) und Batch-Historie ergänzen.
3. CSV/DATEV-Export für Betreiber und Superadmin.
4. Gebührenhistorie mit `activeFrom`/Versionierung pro Tenant/Chain.

