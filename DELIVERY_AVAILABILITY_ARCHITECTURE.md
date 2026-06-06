# Delivery Availability Architecture

## Ziel
`buildDeliveryAvailability(...)` ist die neue zentrale serverseitige Berechnung fuer die Frage:

- Ist Lieferung jetzt moeglich?
- Falls nein: warum nicht?
- Falls spaeter: wann wieder?
- Welche Lieferfenster gelten heute?

Tracking bleibt vorerst unveraendert. Seit der Checkout-Umstellung nutzt `POST /api/orders` fuer Lieferbestellungen bereits dieselbe zentrale Availability-Berechnung. Diese Architekturdatei beschreibt die gemeinsame Ziel-Basis.

## Dateien
- Kernlogik: [delivery-availability.ts](C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\lib\delivery-availability.ts)
- Test-/Analyse-Route: [delivery.ts](C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\routes\delivery.ts)

## Eingaben

### `buildDeliveryAvailability(...)`
Eingaben:
- `settings: BusinessSettings`
- `now?: Date`
- `deliveryAreaInput?:`
  - `zipCode`
  - `street`
  - `latitude`
  - `longitude`

### Datenquellen innerhalb von `settings`
- `timeManagement.openingHours`
- `timeManagement.deliveryHours`
- `timeManagement.holidayHours`
- `timeManagement.ordering`
- `timeManagement.deliveryScheduling`
- `orderIntake`
- `deliveryArea`
- `customerApp.orderingEnabled`

## Berechnungslogik

### 1. Basisfenster
Fuer den aktuellen Tag wird zuerst ein gemeinsames Basisfenster aus:
- `openingHours`
- `deliveryHours`

gebildet.

Regel:
- Nur die Schnittmenge aus Betriebszeit und Lieferzeit ist relevant.

### 2. Feiertags-Override
Wenn fuer das Datum ein Feiertags- oder Ausnahme-Eintrag existiert:
- `holidayHours` ueberschreibt Tagesfenster
- `isClosed = true` schliesst komplett
- offene Feiertagszeiten begrenzen die Tagesfenster

### 3. Slot-/Vorbestelllogik
`deliveryScheduling` wird als zusaetzliche Schicht daruebergelegt:
- `allowedDeliveryDays`
- `deliveryMode`
- `immediateDeliveryEnabled`
- `minDaysAhead`
- `orderCutoffTime`
- `maxPreorderDays`
- `timeSlots`

Regel:
- ohne konfigurierte Slots gilt das Basisfenster
- mit konfigurierten Slots gilt die Schnittmenge aus Basisfenster und heutigen Slots

### 4. Bestellannahme
Zusatzpruefung:
- `orderIntake.orderIntakeEnabled`
- `orderIntake.services.deliveryEnabledNow`
- `timeManagement.ordering.deliveryPauseEnabled`
- `timeManagement.ordering.deliveryEnabled`
- `customerApp.orderingEnabled`

### 5. Liefergebiet
Wenn Standort-/Adressdaten uebergeben werden:
- `deliveryArea` wird ueber `matchServiceArea(...)` geprueft

Aktuell bewusst defensiv:
- ohne Adressdaten wird nicht hart blockiert
- stattdessen entsteht ein Debug-Hinweis

### 6. Naechster Lieferzeitpunkt
`nextDeliveryAt` wird ueber die heute und kuenftig gueltigen Lieferfenster gesucht:
- unter Beruecksichtigung von Mindestvorlauf
- Cutoff
- erlaubten Liefertagen
- Feiertagen
- Slots

## Ausgaben

`buildDeliveryAvailability(...)` liefert:

```ts
{
  isDeliveryAvailable: boolean,
  nextDeliveryAt: Date | null,
  customerMessage: string,
  blockingReasons: string[],
  debugReasons: string[],
  todayDeliveryWindows: Array<{
    start: string,
    end: string,
    source: 'BASE_WINDOW' | 'SLOT',
  }>,
}
```

### Bedeutung
- `isDeliveryAvailable`
  - Lieferung ist jetzt sofort bestellbar
- `nextDeliveryAt`
  - naechster serverseitig gefundener Lieferzeitpunkt
  - aktuell `null`, wenn Lieferung sofort moeglich ist
- `customerMessage`
  - kundenseitiger Text fuer offenen/geschlossenen/pause/out-of-area Zustand
- `blockingReasons`
  - maschinenlesbare Gruende
- `debugReasons`
  - technische Erklaerungen fuer Admin/Superadmin/Test
- `todayDeliveryWindows`
  - heutige effektive Lieferfenster nach allen Regeln

## Beispiel-Blocking-Reasons
- `CUSTOMER_APP_ORDERING_DISABLED`
- `DELIVERY_MODE_DISABLED`
- `ORDER_INTAKE_PAUSED`
- `ORDER_INTAKE_DELIVERY_DISABLED`
- `DELIVERY_PAUSED`
- `DELIVERY_AREA_LOCATION_REQUIRED`
- `DELIVERY_AREA_CONFIGURATION_INCOMPLETE`
- `DELIVERY_AREA_OUT_OF_RANGE`
- `MINIMUM_LEAD_TIME_ACTIVE`
- `NO_DELIVERY_WINDOWS_AVAILABLE`
- `OUTSIDE_DELIVERY_WINDOWS`

## Interne API

### Route
- `GET /api/delivery/availability`

### Query-Parameter
- `tenantId` erforderlich
- `at` optional ISO-Datum fuer Tests
- `zipCode` optional
- `street` optional
- `latitude` optional
- `longitude` optional

### Auth
- intern
- `SETTINGS_READ` erforderlich
- Tenant-Scoping ueber `resolveTenantScope(...)`

## Checkout-Nutzung

### Verwendender Pfad
- `POST /api/orders`
- Datei: [orders.ts](C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\routes\orders.ts)

### Regel
- nur Lieferbestellungen (`serviceType = DELIVERY`) nutzen die zentrale `buildDeliveryAvailability(...)`-Pruefung
- Abholung bleibt bewusst auf der bestehenden Pickup-Logik

### Blockierungs-Response
Wenn Lieferung laut zentraler Availability nicht moeglich ist, antwortet Checkout mit:

```json
{
  "error": "DELIVERY_NOT_AVAILABLE",
  "message": "...",
  "blockingReasons": ["..."]
}
```

HTTP-Status:
- `409 Conflict`

### Abgrenzung Lieferung vs. Abholung
- Lieferung:
  - nutzt zentrale Delivery-Availability
  - kann ueber `blockingReasons` maschinenlesbar blockiert werden
- Abholung:
  - bleibt vorerst bei der bestehenden Pickup-Pruefung
  - wird nicht versehentlich durch Lieferzeiten blockiert

## Beispiele

### Beispiel 1: Lieferung jetzt offen
- Oeffnungszeiten: 11:00-22:00
- Lieferzeiten: 12:00-21:00
- keine Pause
- keine Feiertage
- kein Mindestvorlauf
- aktuelle Uhrzeit 18:30

Ergebnis:
- `isDeliveryAvailable = true`
- `nextDeliveryAt = null`
- `todayDeliveryWindows = [{ start: '12:00', end: '21:00', source: 'BASE_WINDOW' }]`

### Beispiel 2: Heute geschlossen, Vorbestellung moeglich
- aktuelle Uhrzeit 22:30
- naechstes Fenster morgen 12:00

Ergebnis:
- `isDeliveryAvailable = false`
- `nextDeliveryAt = morgen 12:00`
- `customerMessage` zeigt Vorbestell-Hinweis

### Beispiel 3: Liefergebiet ausserhalb
- Zeiten waeren offen
- Adresse matched `deliveryArea` nicht

Ergebnis:
- `isDeliveryAvailable = false`
- `blockingReasons` enthaelt `DELIVERY_AREA_OUT_OF_RANGE`
- `customerMessage` erklaert das Liefergebiet

## Bewusst noch nicht enthalten
- ETA laufender Bestellungen
- Fahrerverfuegbarkeit
- KI-Prognosen
- Customer-App-Umstellung
- Checkout-Umstellung
- Admin-UI-Umstellung

## Naechster geplanter Einsatz
Diese Architektur ist vorbereitet fuer spaetere Tickets:
- Checkout auf dieselbe Availability-Quelle umstellen
- Discovery/Customer-App auf dieselbe Availability-Quelle umstellen
- Admin-Debug-Vorschau auf dieselbe Availability-Quelle umstellen
