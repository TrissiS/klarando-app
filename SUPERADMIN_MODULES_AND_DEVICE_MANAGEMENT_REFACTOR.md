# Superadmin Modules And Device Management Refactor

## Alte Probleme
- Modulfreigaben waren visuell zu eng und Rechte in kleinen Scrollbereichen versteckt.
- Pakete/Preise waren nicht kontextnah mit Modul- und Nutzerauswahl verbunden.
- Geräteübersicht war aufgeteilt und OrderDesk-Aktionen waren nicht vollständig sichtbar.

## Neue Struktur
- Superadmin-Modulbereich wurde auf klare Tabs umgestellt:
  - Pakete
  - Modulfreigaben
  - Einzelrechte
  - Geräte & Zugänge
  - Gebühren
- Oben zentrale Filter:
  - Kette
  - Filiale
  - Benutzer
  - Suche
- Statuskarten zeigen schnell:
  - Paketvorlagen
  - aktive Module
  - Einzelrechte
  - Zusatzkosten

## Geräteübersicht
- Neue zentrale Seite: `/superadmin/devices`
- Tabs:
  - Alle Geräte
  - Displays
  - OrderDesk
  - Fahrergeräte
  - Offline Geräte
- Filter:
  - Tenant
  - Chain
  - Suche
- Einheitliche Statuslogik:
  - `online` < 30s
  - `instabil` 30–120s
  - `offline` > 120s oder kein `lastSeenAt`
  - `inactive` deaktiviert

## OrderDesk löschen / entkoppeln
- Neue Backend-Aktionen:
  - `PATCH /api/orderdesk-devices/bindings/:bindingId/deactivate`
  - `DELETE /api/orderdesk-devices/bindings/:bindingId` (soft-delete via `isActive=false`)
  - `POST /api/orderdesk-devices/bindings/:bindingId/reset-pairing`
- Scope-Schutz:
  - Zugriff nur im erlaubten Tenant-Scope (Admin/Chainadmin/Superadmin entsprechend Rechtekontext)
- UI mit doppelter Bestätigung für Entkoppeln/Löschen.

## Rechte- und Paketstruktur
- Paketauswahl plus Einzelrechte in einer großen, lesbaren Oberfläche.
- Einzelrechte gruppiert nach Präfix (z. B. `ORDERS`, `PRODUCTS`, `SETTINGS`) ohne Mini-Scrollbox.
- Rechte lassen sich mit Suchfeld filtern und gemeinsam speichern.

## Offene Punkte
- Gebührenwerte sind als MVP-Struktur sichtbar; persistente Paketpreisverwaltung kann als nächster Schritt an die Billing-Datenhaltung gekoppelt werden.
- Geräte-Detailansicht (Drawer mit Historie/IP/User-Agent) kann im Folge-Update ergänzt werden.
