# Delivery Slots & Wunschlieferdatum (MVP-Architektur)

## Zielbild
- Jeder Tenant steuert, ob Lieferung sofort möglich ist oder nur über geplante Liefertermine.
- Kund:innen sehen im Checkout nur gültige Tage und Zeitfenster.
- Admins pflegen die Regeln unter `Admin → Lieferbetrieb → Liefertermine`.

## Liefermodi (pro Tenant)
- `IMMEDIATE`: Sofortlieferung aktiv, optional mit Zeitfenstern.
- `NEXT_DAY`: frühestens Folgetag.
- `AFTER_DAYS`: frühestens in X Tagen.
- `SLOT_ONLY`: nur Wunschliefertermine/Zeitfenster.

## MVP-Datenbasis
In `businessSettings.deliveryScheduling`:
- `deliveryMode`
- `immediateDeliveryEnabled`
- `minDaysAhead`
- `orderCutoffTime`
- `allowedDeliveryDays`
- `maxPreorderDays`
- `customerHint`
- `timeSlots[]` mit `day`, `start`, `end`, `maxOrders` (vorbereitet)

## Zentrale Backend-Funktion
Datei: `backend/src/lib/delivery-slots.ts`

`getAvailableDeliverySlots(tenantId, orderType, now)` liefert:
- `earliestDeliveryAt`
- `availableDates`
- `timeSlots`
- `reason`
- `message`

Logik im MVP:
- berücksichtigt Liefermodus
- berücksichtigt Bestellschluss (`orderCutoffTime`)
- berücksichtigt erlaubte Liefertage
- berücksichtigt Vorbestellhorizont (`maxPreorderDays`)
- blockiert Lieferung bei pausierter/deaktivierter Lieferung

## Adminbereich (MVP-Plan)
Neuer Bereich: `Admin → Lieferbetrieb → Liefertermine`

Einstellungen:
- Sofortlieferung aktiv/inaktiv
- Liefermodus
- früheste Lieferung (Folgetag/X Tage)
- erlaubte Liefertage
- Lieferzeitfenster je Wochentag
- Bestellschluss
- max. Vorbestelltage
- Hinweistext für Kund:innen

## Customer App/Web (MVP-Plan)
Checkout zeigt:
- frühester möglicher Lieferzeitpunkt
- verfügbare Tage
- verfügbare Zeitfenster
- deaktivierte Tage ausgegraut
- verständliche Hinweise (z. B. „Lieferung frühestens morgen möglich“)

## Order-Speicherung (nächster Schritt)
Für Bestellung vorbereiten:
- `requestedDeliveryDate`
- `requestedDeliveryTimeSlot`
- `deliveryMode`
- `isPreorder`

Hinweis: Diese Felder sind für den nächsten Schema-/Migrationsschritt vorgesehen.

## Tenant-Sicherheit
- Admin: nur eigener Tenant
- Chainadmin: nur eigene Chain
- Superadmin: global
- Slot-API immer tenant-scoped, keine ungeprüfte `tenantId` aus Client übernehmen

## Nicht im MVP
- Tourenoptimierung
- Fahrer-Routenplanung
- harte Kapazitätsbegrenzung pro Slot (nur Feld vorbereitet)
- Feiertagskalender/Blackout-Days pro Region
