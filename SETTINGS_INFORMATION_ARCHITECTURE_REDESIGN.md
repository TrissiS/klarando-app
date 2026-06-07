# Settings Information Architecture Redesign

## Ziel
Die Admin-Einstellungen sollen fachlich sauber getrennt, verständlich benannt und ohne doppelte Zuständigkeiten aufgebaut werden. Die neue Struktur muss verhindern, dass Zeitlogik, Lieferlogik, Zahlungslogik und rechtliche Inhalte weiterhin in einer einzigen Sammelseite vermischt werden.

Wichtige Leitlinie:

- Es gibt genau eine fachliche Stelle pro Thema.
- Liefergebiet und Lieferzeiten werden getrennt verwaltet.
- Stripe ist die einzige aktive Payment-Schiene.
- PayPal darf im Admin nicht mehr als aktive Zahlungsoption erscheinen.

## Ist-Zustand

### Aktuelle Hauptprobleme

1. `app/admin/settings/page.tsx` ist aktuell eine Sammel-Masterseite für zu viele unterschiedliche Domänen.
2. `app/Components/admin/AppSettingsFields.tsx` mischt in einer Komponente:
   - Lieferkosten
   - Mindestbestellwert
   - Servicegebühr
   - Bestellmodus
   - Öffnungszeiten
   - Lieferzeiten
   - Feiertage
   - Vorbestellung
   - Lieferplanung je Tag
   - Servicegebiet/Polygon/PLZ/Radius
   - Customer-App-Sichtbarkeit
3. Zeitlogik existiert doppelt bzw. gespiegelt:
   - `openingHours`
   - `deliveryHours`
   - `holidayHours`
   - `ordering`
   - `deliveryScheduling`
   - zusätzlich Legacy-Mirror in `backend/src/routes/business-settings.ts`
4. PayPal ist im Admin weiterhin sichtbar, obwohl Stripe bereits die aktive Zielarchitektur ist.
5. Es gibt bereits Legacy-Seiten, aber die Informationsarchitektur ist im UI noch nicht konsequent bereinigt.

### Aktuelle UI-Bereiche

In `app/admin/settings/page.tsx` sind derzeit u. a. folgende Karten/Abschnitte sichtbar:

- `Geschäft & Betreiber`
- `Steuer, IDs & Abrechnung`
- Branding / Customer-App-Medien
- `App, Öffnungszeiten & Lieferzeiten`
- `Kundensicht & Debug`
- `Datenschutz & Compliance`
- `Zahlungen · PayPal`
- `Notizen`

Zusätzlich existieren angrenzende Routen:

- `/admin/settings`
- `/admin/app-settings` als Legacy-Weiterleitung
- `/admin/lieferung` als Lieferzonen-Hinweisseite
- `/admin/delivery` als Delivery-Workspace
- `/admin/finanzen` als neue zentrale Finanzseite
- `/admin/payments` als Legacy-Zahlungsseite

## Zielbild: neue Menüstruktur

### 1. Betrieb & Öffnungszeiten

Inhalt:

- Ladenöffnungszeiten
- Bestellannahme aktiv / pausiert
- Abholzeiten
- Sonderöffnungen
- Filial-Grunddaten nur soweit fachlich für den Betrieb relevant

Zweck:

- Alles, was die allgemeine Betriebsverfügbarkeit und den stationären Filialbetrieb steuert.

### 2. Lieferdienst

Inhalt:

- Lieferdienst aktiv
- Lieferzeiten je Wochentag
- Mindestvorlauf
- maximale Vorbestelltage
- Bestellannahmeschluss
- Sofortbestellung / Vorbestellung
- Live-Kundensicht & Debug

Hinweis:

- Diese Lieferzeiten sind die zentrale Quelle für App, Checkout, Order-Validierung und Store-Open-Status im Lieferkontext.

### 3. Liefergebiete & Kosten

Inhalt:

- PLZ
- Radius
- Polygon
- ausgeschlossene Bereiche
- Lieferkosten
- Mindestbestellwert
- Lieferhinweis / Gebührenhinweis

Wichtig:

- Keine Tageszeiten mehr in diesem Bereich.

### 4. Feiertage & Ausnahmen

Inhalt:

- Feiertage
- Urlaub
- geschlossene Tage
- Sonderöffnungszeiten
- abweichende Lieferzeiten

Ziel:

- Alle Abweichungen vom Standardbetrieb an einer Stelle bündeln.

### 5. Zahlungen

Inhalt:

- Stripe Connect
- Auszahlungskonto
- Zahlungsarten
- Gebührenhinweise
- Status der Stripe-Einrichtung

Wichtig:

- PayPal wird aus dem aktiven Admin entfernt oder klar als Legacy ausgeblendet.
- Verlinkung auf die zentrale Finanzseite `Finanzen -> Abrechnung & Zahlungen`.

### 6. Rechtliches & Compliance

Inhalt:

- Impressum
- Datenschutz
- AGB
- Widerruf
- Cookies
- Jugendschutz
- DSGVO-Hinweise

Ziel:

- Rechtliche Inhalte von operativen Filial- und Lieferlogiken trennen.

### 7. App & Darstellung

Inhalt:

- Logo
- Titelbild
- Betreiberbeschreibung
- App-Farben
- Kundentexte
- Sichtbarkeit einzelner Customer-App-Elemente

Ziel:

- Alles, was Darstellung, Branding und kundennahe Texte betrifft, an einer Stelle bündeln.

## Zielbild: Kartenstruktur innerhalb der neuen Bereiche

### Betrieb & Öffnungszeiten

- Karte `Filialbetrieb`
- Karte `Ladenöffnungszeiten`
- Karte `Abholbetrieb`
- Karte `Bestellannahme`

### Lieferdienst

- Karte `Lieferbetrieb`
- Karte `Lieferzeiten`
- Karte `Vorbestellung & Vorlauf`
- Karte `Checkout- / Kundensicht-Debug`

### Liefergebiete & Kosten

- Karte `Liefergebiet`
- Karte `Liefermodell`
- Karte `Lieferkosten`
- Karte `Mindestbestellwert & Hinweise`

### Feiertage & Ausnahmen

- Karte `Feiertage`
- Karte `Sonderöffnungen`
- Karte `Geschlossene Tage / Urlaub`
- Karte `Abweichende Lieferzeiten`

### Zahlungen

- Karte `Stripe Connect`
- Karte `Auszahlungen`
- Karte `Zahlungsarten`
- Karte `Gebührenhinweise`

### Rechtliches & Compliance

- Karte `Rechtstexte`
- Karte `Datenschutz & Einwilligungen`
- Karte `DSGVO-Kontakte & Aufbewahrung`

### App & Darstellung

- Karte `Branding`
- Karte `Header & Medien`
- Karte `Kundentexte`
- Karte `Customer-App-Anzeigeoptionen`

## Aktuelle Felder -> neue Zielstruktur

| Aktuelles Feld / Block | Aktuelle Quelle | Neue Zielsektion |
| --- | --- | --- |
| `businessName`, `legalName`, `operatorName`, `phone`, `street`, `zipCode`, `city`, `country`, `email`, `website` | `app/admin/settings/page.tsx` | Betrieb & Öffnungszeiten |
| `openingHours` / `timeManagement.openingHours` | `AppSettingsFields` / Backend Settings | Betrieb & Öffnungszeiten |
| `pickupArea.enabled` | Settings-Modell | Betrieb & Öffnungszeiten |
| Bestellannahme pausiert `timeManagement.ordering.deliveryPauseEnabled` | `AppSettingsFields` | Betrieb & Öffnungszeiten |
| `deliveryHours` / `timeManagement.deliveryHours` | `AppSettingsFields` / Backend Settings | Lieferdienst |
| `deliveryScheduling.deliveryMode` | `AppSettingsFields` | Lieferdienst |
| `deliveryScheduling.orderCutoffTime` | `AppSettingsFields` | Lieferdienst |
| `deliveryScheduling.minDaysAhead` | `AppSettingsFields` | Lieferdienst |
| `deliveryScheduling.maxPreorderDays` | `AppSettingsFields` | Lieferdienst |
| `deliveryScheduling.allowedDeliveryDays` | `AppSettingsFields` | Lieferdienst |
| `deliveryScheduling.timeSlots[].maxOrders` | `AppSettingsFields` | Lieferdienst |
| `timeManagement.ordering.preorderEnabled` | `AppSettingsFields` | Lieferdienst |
| `timeManagement.ordering.deliveryCutoffMinutesBeforeClose` | `AppSettingsFields` | Lieferdienst |
| `timeManagement.ordering.preorderMaxDays` | `AppSettingsFields` | Lieferdienst |
| `timeManagement.ordering.manualNoticeText` | `AppSettingsFields` | Lieferdienst |
| Kundensicht / Availability Preview / Debug | `app/admin/settings/page.tsx` | Lieferdienst |
| `deliveryArea.*` | `ServiceAreaEditor` | Liefergebiete & Kosten |
| `deliveryFeeNote` | `app/admin/settings/page.tsx` / `AppSettingsFields` | Liefergebiete & Kosten |
| `minOrderValue` | `app/admin/settings/page.tsx` / `AppSettingsFields` | Liefergebiete & Kosten |
| `holidayHours` / `timeManagement.holidayHours` | `AppSettingsFields` | Feiertage & Ausnahmen |
| Sonderöffnungen / geschlossen pro Datum | `holidayHours` | Feiertage & Ausnahmen |
| `imprintUrl`, `privacyPolicyUrl`, `termsUrl`, `supportEmail`, `accountDeletionEmail` | `AppSettingsFields` | Rechtliches & Compliance |
| `compliance.*` | `AppSettingsFields` | Rechtliches & Compliance |
| `logoUrl`, `customerApp.orderHeaderImageUrl`, `customerApp.localInfoTitle`, `customerApp.localInfoText` | `app/admin/settings/page.tsx` | App & Darstellung |
| `customerApp.listingDisplay.*` | `AppSettingsFields` | App & Darstellung |
| `customerApp.listingEnabled`, `orderingEnabled`, `guestRegistrationEnabled`, `guestCheckoutEnabled` | `AppSettingsFields` | App & Darstellung oder Produkt-/Rollout-Einstellungen, je nach späterer Produktentscheidung |
| `serviceFee.*` | `AppSettingsFields` | Nicht in Admin-Einstellungen; fachlich eher Finanzen / Checkout-Gebühren |
| `vatId`, `taxNumber`, `revenueId`, `taxOffice`, `payout*` | `app/admin/settings/page.tsx` | Nicht Teil der neuen Settings-Hauptseite; besser in Finanzen / Abrechnung |
| PayPal-Konfiguration | `app/admin/settings/page.tsx`, `lib/api.ts`, `backend/src/routes/payments-paypal.ts` | Legacy / ausblenden |

## Doppelte oder fachlich falsch platzierte Inhalte

### 1. Zeitlogik doppelt

Aktuell doppelt oder gespiegelt vorhanden:

- `openingHours`
- `deliveryHours`
- `holidayHours`
- `ordering`
- `deliveryScheduling`
- `timeManagement.*`

Zusätzlich spiegelt `backend/src/routes/business-settings.ts` Legacy-Felder zurück:

- `next.openingHours = requested.timeManagement.openingHours`
- `next.holidayHours = requested.timeManagement.holidayHours`
- `next.deliveryHours = requested.timeManagement.deliveryHours`
- `next.ordering = requested.timeManagement.ordering`
- `next.deliveryScheduling = requested.timeManagement.deliveryScheduling`

Fachliche Folge:

- UI und Backend signalisieren aktuell mehrere Quellen, obwohl eigentlich `timeManagement` die Master-Struktur sein sollte.

### 2. Liefergebiet und Lieferzeiten vermischt

`ServiceAreaEditor` sitzt aktuell mitten in `AppSettingsFields`, direkt neben:

- Öffnungszeiten
- Lieferzeiten
- Feiertagen
- Vorbestellung
- Gebühren

Fachlich sollte getrennt werden:

- Liefergebiete & Kosten
- Lieferdienst-Zeiten

### 3. Finanzthemen in Settings vermischt

Aktuell befinden sich in Settings noch:

- Steuerdaten
- Auszahlungsdaten
- Servicegebühr
- PayPal

Obwohl bereits eine neue Finanz-Masterseite existiert:

- `/admin/finanzen`

### 4. Compliance nur halb zentralisiert

Rechtliches & Compliance ist teilweise schon fachlich separiert, aber:

- auf der Settings-Seite nur als Hinweis sichtbar
- in `AppSettingsFields` weiterhin als optionaler Block modelliert

## Entfernen / Verstecken / Legacy

### Sofort aus aktiver Admin-IA entfernen

- Karte `Zahlungen · PayPal` in `app/admin/settings/page.tsx`
- sichtbare PayPal-Felder:
  - `paypalMerchantId`
  - `paypalEmail`
  - `paypalOnboardingStatus`
  - `paypalEnvironment`
  - `paypalPaymentsEnabled`
- Legacy-Seite `/admin/payments` sollte nur noch auf `/admin/finanzen` verweisen

### Als Legacy markieren

- `/admin/app-settings`
- `/admin/payments`
- Zeit-Mirror-Felder außerhalb von `timeManagement`
- Backend-Persistenz für Altfelder:
  - `openingHours`
  - `holidayHours`
  - `deliveryHours`
  - `ordering`
  - `deliveryScheduling`

### In Finanzen verschieben

- Steuerdaten / Abrechnungsdaten
- Auszahlungsfelder
- Servicegebühr, wenn sie fachlich als Checkout-/Finanzgebühr geführt wird

## PayPal-Komponenten: aktuelle Sichtbarkeit und Bewertung

### Sichtbar oder noch aktiv im Code

- `app/admin/settings/page.tsx`
- `lib/api.ts`
- `backend/src/routes/payments-paypal.ts`
- teilweise Reporting-/Abschlusskontexte mit PayPal-Referenzen

### Bewertung

- PayPal ist technisch noch nicht vollständig entfernt.
- PayPal darf laut Zielbild nicht mehr als aktive Payment-Option im Admin auftauchen.
- Empfehlung:
  - UI sofort ausblenden
  - Backend-Routen als Legacy markieren
  - spätere vollständige Entfernung als separates Migrationspaket planen

## Stripe-Komponenten: relevante aktive Zielstruktur

### Aktive Stripe-Bereiche

- `app/admin/finanzen/page.tsx`
- `app/superadmin/billing/page.tsx`
- `backend/src/routes/payments.ts`
- `backend/src/services/stripe.ts`
- Stripe-Felder im Tenant-Modell in `backend/prisma/schema.prisma`

### Fachliche Einordnung

Stripe gehört in:

- `Zahlungen`
- `Finanzen -> Abrechnung & Zahlungen`

Nicht mehr in:

- gemischte Filial-Settings
- alte Payment-Legacy-Seiten

## Routenbewertung: behalten vs. Legacy

### Behalten

- `/admin/settings`
- `/admin/finanzen`
- `/api/business-settings`
- `/api/payments/connect/onboard`
- `/api/payments/connect/refresh`
- `/api/payments/connect/status`
- `/api/payments/connect/dashboard-link`
- vorhandene Delivery-Availability-/Preview-APIs für Debugzwecke

### Beibehalten, aber fachlich neu sortieren

- `/admin/lieferung`
- `/admin/delivery`

Diese Routen sollten künftig klar getrennt beschreiben:

- Liefergebiet / Lieferkosten
- operative Lieferung / Fahrer / Touren

### Legacy

- `/admin/app-settings`
- `/admin/payments`
- `/api/payments/paypal/*`
- direkte Nutzung alter Zeitfeld-Mirror außerhalb von `timeManagement`

## Empfohlene neue Seiten- und Menüordnung

### Admin-Menü

1. Betrieb & Öffnungszeiten
2. Lieferdienst
3. Liefergebiete & Kosten
4. Feiertage & Ausnahmen
5. Finanzen
   - Abrechnung & Zahlungen
6. Rechtliches & Compliance
7. App & Darstellung

### Fachliche Trennung

- `Betrieb & Öffnungszeiten` = stationärer Grundbetrieb
- `Lieferdienst` = wann Lieferung angeboten wird
- `Liefergebiete & Kosten` = wo und zu welchen Konditionen geliefert wird
- `Feiertage & Ausnahmen` = alles, was Standardzeiten überschreibt
- `Finanzen` = Stripe, Provision, Gebühren, Auszahlung, Steuerbezug
- `Rechtliches & Compliance` = juristische Pflichtinhalte
- `App & Darstellung` = Branding und Kundentexte

## Alt -> Neu Mapping auf Seitenebene

| Alt | Neu |
| --- | --- |
| `/admin/settings` Sammelseite | in mehrere fachliche Einstellungsbereiche aufteilen |
| `/admin/app-settings` | Legacy-Redirect behalten, aber nicht mehr als Arbeitsseite nutzen |
| `App, Öffnungszeiten & Lieferzeiten` Karte | aufteilen in `Betrieb & Öffnungszeiten`, `Lieferdienst`, `Liefergebiete & Kosten`, `Feiertage & Ausnahmen`, `App & Darstellung` |
| `Kundensicht & Debug` | als Unterkarte in `Lieferdienst` |
| `Zahlungen · PayPal` | entfernen / verstecken / Legacy |
| Stripe-Status aus verstreuten Zahlungsseiten | zentral nach `Finanzen -> Abrechnung & Zahlungen` |
| Steuer-/Payout-Daten in Settings | in `Finanzen` überführen |

## Umsetzungs-Tickets

### P0

1. Settings-Seite fachlich zerlegen und neue Bereichsstruktur definieren.
2. PayPal-Karte aus Admin-Settings entfernen oder vollständig als Legacy verstecken.
3. Zeitlogik auf eine sichtbare Master-Struktur reduzieren:
   - UI nur noch auf `timeManagement` ausrichten
   - Altfelder nicht mehr als eigene Quelle darstellen
4. Liefergebiet / Lieferzeiten / Feiertage im UI konsequent trennen.
5. Stripe als einzige aktive Payment-Schiene im Admin deutlich machen.

### P1

1. Steuer-, Auszahlungs- und Gebührenfelder aus Settings in `Finanzen -> Abrechnung & Zahlungen` überführen.
2. Compliance in eine eigenständige, klar benannte Unterseite oder saubere Kartenstruktur auslagern.
3. Customer-App-Darstellung von operativen Liefer-/Zeit-Settings trennen.
4. Legacy-Routen im UI sichtbar als veraltet markieren oder aus der Navigation entfernen.

### P2

1. PayPal-Backend technisch vollständig stilllegen oder entfernen.
2. Backend-Migrationspfad für Legacy-Zeitfelder dokumentieren und später bereinigen.
3. Admin-Navigation und Suchindex (`admin-search`) auf neue Informationsarchitektur anpassen.
4. Schulungs-/Onboarding-Hinweise für Admins ergänzen, damit die neue Struktur schneller verstanden wird.

## Konkrete Empfehlung für die nächste Umsetzungsphase

Empfohlene Reihenfolge:

1. PayPal im Admin ausblenden.
2. `AppSettingsFields` fachlich in mehrere kleinere Settings-Bausteine zerlegen.
3. Neue Navigations- und Kartenstruktur im Admin aufbauen.
4. Legacy-Weiterleitungen und Legacy-Bezeichnungen bereinigen.
5. Erst danach Backend-Legacyfelder schrittweise technisch abbauen.

## Fazit

Die aktuelle Admin-Einstellungsseite ist nicht nur optisch zu breit, sondern fachlich unscharf. Die größte Ursache ist die Vermischung von:

- Betriebszeiten
- Lieferzeiten
- Liefergebieten
- Ausnahmen
- App-Darstellung
- Payments
- Compliance

Die neue Zielstruktur trennt diese Domänen sauber. Besonders wichtig ist:

- Stripe bleibt die einzige aktive Zahlungsoption.
- PayPal wird aus der aktiven Admin-Oberfläche entfernt.
- Lieferzeiten und Liefergebiet werden strikt getrennt.
- Feiertage und Ausnahmen erhalten eine eigene, verständliche Heimat.
