# Delivery Zones And Tours Separation

## Unterschied
- **Lieferzonen**: Regeln zur Lieferbarkeit und Kosten (PLZ/Radius/Polygon, Ausschlüsse, Gebühren, Mindestbestellwert).
- **Touren**: Fahrer- und Routenplanung (offene Lieferungen, Tourzuweisung, Status, Stop-Reihenfolge).

## Ursache
- Beide Tabs zeigten bisher auf dieselbe App-Settings-Logik und wirkten dadurch fachlich identisch.

## Umgesetzt
- Lieferbetrieb-Navigation getrennt:
  - `Lieferzonen` bleibt auf `/admin/app-settings?section=delivery-area`.
  - `Touren` zeigt jetzt eigene Route `/admin/tours`.
- In `app-settings` wird im `delivery-area`-Kontext der Bereich `Lieferzeiten je Tag` ausgeblendet, damit Lieferzonen nur Gebiets-/Kostenlogik zeigen.
- Neue Touren-MVP-Platzhalterseite mit Karten:
  - Offene Lieferungen
  - Geplante Touren
  - Fahrer verfügbar
  - Tourstatus
  - Hinweis zur späteren Modul-Erweiterung

## Später für Touren
- DeliveryTour / DeliveryTourStop
- assignedDriverId
- Statusfluss: geplant, unterwegs, abgeschlossen, abgebrochen
- ETA/Fahrzeit
- Reihenfolge und Bündelung

## Offene Punkte
- Backend-Tourenmodell und APIs noch nicht final implementiert.
- Aktuell bewusst sauberer UI-MVP ohne falsche Lieferzonen-Duplikate.
