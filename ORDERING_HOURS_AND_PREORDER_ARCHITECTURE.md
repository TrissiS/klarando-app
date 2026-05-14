# Ordering Hours & Preorder Architecture (MVP)

## Zielbild
Klarando soll pro Filiale steuern können:
- bis wann Liefer- und Abholbestellungen angenommen werden
- ob Vorbestellungen außerhalb der Öffnungszeit möglich sind
- ob Lieferung manuell pausiert ist
- welche klare Kundenmeldung angezeigt wird

## MVP-Grundlage (technisch vorbereitet)
- Neue Settings-Struktur in `businessSettings.ordering`:
  - `deliveryEnabled`
  - `pickupEnabled`
  - `preorderEnabled`
  - `deliveryPauseEnabled`
  - `deliveryCutoffMinutesBeforeClose`
  - `pickupCutoffMinutesBeforeClose`
  - `preorderEarliestTime`
  - `preorderMaxDays`
  - `closingSoonThresholdMinutes`
  - `manualNoticeText`
- Defaults und Sanitizing in `backend/src/lib/business-settings.ts`
- Zentrale Logik in `backend/src/lib/ordering-availability.ts`:
  - `getTenantOrderingAvailability(tenantId, orderType, now)`
  - `getTenantOrderingAvailabilityFromSettings(settings, orderType, now)`

## Rückgabeformat der Verfügbarkeitslogik
Die Funktion liefert:
- `isOpen`
- `canOrderNow`
- `canPreorder`
- `nextAvailableTime`
- `closingSoon`
- `minutesUntilCutoff`
- `message`
- `allowedOrderTypes`

## Entscheidungslogik (MVP)
1. Öffnungs-/Servicefenster bestimmen (Tag + Uhrzeit)
2. Order-Type prüfen (`DELIVERY`/`PICKUP`)
3. Globales Ordering prüfen (`customerApp.orderingEnabled`)
4. Modus aktiv/inaktiv prüfen (`deliveryEnabled`/`pickupEnabled`)
5. Lieferpause berücksichtigen (`deliveryPauseEnabled`)
6. Annahmeschluss berechnen (`close - cutoffMinutesBeforeClose`)
7. `canOrderNow` / `canPreorder` bestimmen
8. Kundentext erzeugen (inkl. „schließt bald“)
9. Optional `manualNoticeText` als Override

## Adminbereich (MVP-Plan)
Zielbereich:
- **Admin → Lieferbetrieb → Bestellzeiten**

Empfohlene UI-Sektionen:
- Öffnungszeiten
- Lieferzeiten
- Abholzeiten
- Annahmeschluss Lieferung/Abholung
- Vorbestellung (an/aus, früheste Zeit, max. Tage)
- Lieferpause (manuell)
- Hinweistext (optional)

## Customer App/Web (MVP-Plan)
Statuszustände:
- geöffnet
- bald geschlossen
- geschlossen, Vorbestellung möglich
- geschlossen, keine Bestellung möglich
- Lieferung pausiert

Anzeigen:
- kurzer verständlicher Statushinweis (`message`)
- früheste nächste Zeit (`nextAvailableTime`)
- erlaubte Bestellarten (`allowedOrderTypes`)

## Tenant-Sicherheit
- Einstellungen bleiben tenantbezogen über `tenant.businessSettings`
- Chainadmin nur für eigene Chain-Tenants
- Superadmin global
- Verfügbarkeitsfunktion arbeitet strikt mit `tenantId`

## Was vor MVP noch fehlt
- API-Endpoint für Customer-Web/App (z. B. `/api/tenant/:id/ordering-availability`)
- UI-Form in Admin für die neuen Felder
- Checkout-Anbindung für Sperrlogik + Vorbestellhinweise
- Zeitzonen-/Feiertagslogik (später verfeinern)

## Nicht Teil dieses MVP
- komplexe Kalender-Ausnahmen
- mehrere Zeitfenster pro Tag
- kapazitätsbasierte Slot-Engine
- dynamische ETA-Prognose aus Fahrerauslastung
