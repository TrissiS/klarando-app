# Settings IA P0 Implementation Plan

## Grundlage
Dieses P0-Umsetzungspaket basiert auf:

- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\SETTINGS_INFORMATION_ARCHITECTURE_REDESIGN.md`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\DELIVERY_AVAILABILITY_ARCHITECTURE.md`
- fachlich ergänzend auf der vorhandenen Delivery-Zeitfenster-UI-Doku:
  - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\DELIVERY_TIME_WINDOWS_UI_REFACTOR.md`

Hinweis:
Die angeforderte Datei `DELIVERY_TIME_SIMPLIFICATION_PLAN.md` ist im aktuellen Workspace nicht vorhanden. Für die P0-Planung wurde deshalb die vorhandene Zeitfenster-Refactor-Doku als naheliegende fachliche Referenz verwendet.

## Ziel
Die Admin-Einstellungen sollen kurzfristig deutlich übersichtlicher werden, ohne in P0 bereits eine tiefe Datenmigration oder Backend-Neuarchitektur auszulösen.

P0 bedeutet hier:

- fachliche Entflechtung der UI
- klare neue Abschnittsstruktur
- Stripe-only Sichtbarkeit im aktiven Payment-UI
- Trennung von Lieferdienst, Liefergebiet und Ausnahmen
- Herauslösen von Compliance aus der Sammelkomponente

## Leitplanken für P0

- Keine Änderung der fachlichen Kernpersistenz als Voraussetzung.
- Keine harte Entfernung von Legacy-Backendpfaden.
- Keine tiefe Migration von `openingHours`, `deliveryHours`, `holidayHours`, `ordering`, `deliveryScheduling`.
- Fokus auf UI-Struktur, Benennung, Gruppierung, Legacy-Ausblendung.

## Empfohlene Umsetzungsreihenfolge

1. `P0-SET-001` Menüstruktur neu ordnen
2. `P0-SET-002` PayPal aus aktiver Oberfläche entfernen
3. `P0-SET-003` Lieferdienst-Bereich vereinfachen
4. `P0-SET-004` Liefergebiete & Kosten trennen
5. `P0-SET-005` Feiertage & Ausnahmen auslagern
6. `P0-SET-006` Compliance aus `AppSettingsFields` herauslösen

## Quick Wins

- PayPal-Karte aus `/admin/settings` ausblenden
- Stripe in `Zahlungen` klar als einzige aktive Payment-Schiene darstellen
- `Kundensicht & Debug` direkt unter `Lieferdienst` gruppieren
- `ServiceAreaEditor` fachlich in `Liefergebiete & Kosten` verorten
- `holidayHours` aus dem gemischten Zeitblock in einen eigenen Abschnitt verschieben

## Go-Live-Relevanz

Direkt produktiv sichtbar und für Admins sofort verständlich:

- weniger Fehlbedienung durch klarere Zuständigkeiten
- weniger Verwechslung zwischen Lieferzeiten und Liefergebiet
- keine irreführende PayPal-Sichtbarkeit mehr
- bessere Lesbarkeit für Öffnungszeiten, Lieferdienst und Ausnahmen
- bessere Basis für spätere Delivery-Availability-Debugansicht

---

## Ticket `P0-SET-001`
### Titel
Menüstruktur neu ordnen

### Ziel
Die Admin-Einstellungen werden in sieben fachlich saubere Hauptbereiche gegliedert:

1. Betrieb & Öffnungszeiten
2. Lieferdienst
3. Liefergebiete & Kosten
4. Feiertage & Ausnahmen
5. Zahlungen
6. Rechtliches & Compliance
7. App & Darstellung

### Betroffene Dateien

- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\AdminLayout.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\settings\page.tsx`
- optional für Legacy-Hinweise:
  - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\app-settings\page.tsx`
  - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\payments\page.tsx`
  - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\lieferung\page.tsx`

### UI-Auswirkung

- Die bisherige Sammelseite wirkt wie mehrere klar benannte Fachbereiche.
- Admins erkennen schneller, wo sie Öffnungszeiten, Lieferdienst, Liefergebiet, Zahlungen oder Rechtliches bearbeiten.
- Alte Sammelüberschriften wie `App, Öffnungszeiten & Lieferzeiten` verschwinden zugunsten der neuen Struktur.

### Akzeptanzkriterien

- Die sieben Hauptbereiche sind sichtbar und eindeutig benannt.
- Der Bereich `Zahlungen` ist fachlich getrennt von allgemeinen Settings.
- `Lieferdienst` und `Liefergebiete & Kosten` erscheinen getrennt.
- `Rechtliches & Compliance` ist nicht mehr nur Randhinweis, sondern eigener Bereich.

### Risiko

- Mittel: Navigation, Anker und mentale Modelle der Admins ändern sich.
- Technisch geringes Risiko, da primär Struktur und Beschriftung betroffen sind.

### Aufwandsschätzung

- Mittel

---

## Ticket `P0-SET-002`
### Titel
PayPal aus aktiver Oberfläche entfernen

### Ziel
PayPal soll nicht mehr als aktive Zahlungsoption im Admin erscheinen. Stripe bleibt die einzige aktive Zahlungsart in der Oberfläche.

### Betroffene Dateien

- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\settings\page.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\payments\page.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\AdminLayout.tsx`
- Referenzkontext:
  - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\finanzen\page.tsx`

### UI-Auswirkung

- Keine sichtbaren PayPal-Karten mehr für neue Admin-Nutzer.
- Keine PayPal-Merchant-/Onboarding-Felder mehr im aktiven Settings-Flow.
- `Zahlungen` zeigt nur Stripe-relevante Inhalte bzw. verweist auf `Finanzen -> Abrechnung & Zahlungen`.

### Akzeptanzkriterien

- In `/admin/settings` ist keine aktive PayPal-Karte mehr sichtbar.
- Stripe wird als einzige aktive Payment-Schiene dargestellt.
- Legacy-PayPal bleibt technisch bestehen, wird aber nicht als normaler Konfigurationsweg angeboten.
- Neue Kunden/Admins sehen keine PayPal-Karten mehr.

### Risiko

- Gering bis mittel: fachlich klar sinnvoll, aber bei alten Tenants darf keine Backend-Legacy versehentlich zerstört werden.

### Aufwandsschätzung

- Klein

---

## Ticket `P0-SET-003`
### Titel
Lieferdienst-Bereich vereinfachen

### Ziel
Der Lieferdienst-Bereich soll nur noch operative Lieferzeit- und Bestelllogik zeigen.

### Enthalten

- Lieferzeiten je Wochentag
- Mindestvorlauf
- maximale Vorbestellungstage
- Bestellannahme aktiv/pausiert
- Kundensicht & Debug

### Betroffene Dateien

- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\AppSettingsFields.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\settings\page.tsx`
- fachlicher Backend-Bezug:
  - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\lib\delivery-availability.ts`
  - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\routes\delivery.ts`

### UI-Auswirkung

- Der Bereich wird kürzer, verständlicher und klar auf Lieferbetrieb fokussiert.
- `Kundensicht & Debug` wird als Teil der Lieferverfügbarkeit nachvollziehbar.
- Die UI kann die kompaktere Wochenübersicht aus `DELIVERY_TIME_WINDOWS_UI_REFACTOR.md` aufnehmen, statt lange vertikale Zeitfensterblöcke zu zeigen.

### Akzeptanzkriterien

- Im Lieferdienst-Bereich stehen nur lieferbezogene Zeit- und Bestelllogiken.
- Keine Polygon-, PLZ-, Radius- oder Kostenfelder mehr im Lieferdienst-Block.
- Bestellannahme aktiv/pausiert ist klar sichtbar.
- `Kundensicht & Debug` bleibt erreichbar.
- Die Darstellung der Lieferzeiten ist kompakter und tagbezogen verständlich.

### Risiko

- Mittel: `AppSettingsFields.tsx` ist aktuell stark vermischt.
- Fachliches Risiko gering, wenn die Persistenz unverändert bleibt.

### Aufwandsschätzung

- Mittel

---

## Ticket `P0-SET-004`
### Titel
Liefergebiete & Kosten trennen

### Ziel
Liefergebiets- und Kostenlogik sollen als eigener Bereich dargestellt werden, vollständig getrennt von Zeitfenstern.

### Enthalten

- PLZ
- Radius
- Polygon
- Lieferkosten
- Mindestbestellwert
- ausgeschlossene Bereiche

Keine Zeiten mehr in diesem Bereich.

### Betroffene Dateien

- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\AppSettingsFields.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\ServiceAreaEditor.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\settings\page.tsx`
- fachlicher Referenzbezug:
  - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\lib\delivery-availability.ts`

### UI-Auswirkung

- `ServiceAreaEditor` wird endlich als Gebietswerkzeug verstanden und nicht mehr als Teil des Zeitmanagements.
- Lieferkosten und Mindestbestellwert erscheinen direkt im Kontext des Liefergebiets.
- Der Unterschied zwischen `wo liefern wir?` und `wann liefern wir?` wird für Admins eindeutig.

### Akzeptanzkriterien

- In `Liefergebiete & Kosten` erscheinen keine Öffnungs-, Liefer- oder Feiertagszeiten.
- PLZ, Radius, Polygon und Ausschlüsse sind in einem gemeinsamen Fachbereich gebündelt.
- Lieferkosten und Mindestbestellwert stehen im selben Gebietskontext.

### Risiko

- Gering bis mittel: Strukturänderung, aber der zugrunde liegende Editor bleibt derselbe.

### Aufwandsschätzung

- Mittel

---

## Ticket `P0-SET-005`
### Titel
Feiertage & Ausnahmen auslagern

### Ziel
Feiertage, Urlaub, Sonderöffnungen und Sonderlieferzeiten sollen als eigener Bereich sichtbar werden und nicht mehr zwischen Standardzeiten versteckt sein.

### Enthalten

- Feiertage
- Urlaub
- Sonderöffnungen
- Sonderlieferzeiten

### Betroffene Dateien

- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\AppSettingsFields.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\settings\page.tsx`
- fachlicher Referenzbezug:
  - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\lib\delivery-availability.ts`

### UI-Auswirkung

- `holidayHours` erhält einen klaren eigenen Platz.
- Admins verstehen, dass Ausnahmen die normalen Tagesfenster überschreiben.
- Die neue Delivery-Availability-Logik lässt sich später besser mit diesem Abschnitt verknüpfen.

### Akzeptanzkriterien

- Feiertage/Ausnahmen sind als eigener Abschnitt sichtbar.
- Standardzeiten und Ausnahmen sind klar getrennt.
- Texte machen deutlich, dass diese Einträge normale Öffnungs- bzw. Lieferzeiten überschreiben.
- Sonderlieferzeiten sind nicht mehr im normalen Lieferdienstblock versteckt.

### Risiko

- Gering: gleiche Daten, nur sauberer gruppiert.

### Aufwandsschätzung

- Klein bis mittel

---

## Ticket `P0-SET-006`
### Titel
Compliance aus `AppSettingsFields` herauslösen

### Ziel
Rechtliche und Compliance-Themen werden aus der gemischten Settings-Komponente herausgelöst und als eigener Bereich dargestellt.

### Enthalten

- Impressum
- Datenschutz
- AGB
- Widerruf
- Cookies
- Jugendschutz

### Betroffene Dateien

- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\AppSettingsFields.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\admin\settings\page.tsx`
- fachlicher Modellbezug:
  - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\lib\business-settings.ts`

### UI-Auswirkung

- Rechtliches steht nicht mehr zwischen Liefergebiet, Lieferzeiten und Customer-App-Feldern.
- Admins finden Impressum, Datenschutz und AGB an einer erwartbaren Stelle.
- Bereiche wie Cookies und Zustimmungen werden als Compliance-Thema sichtbar.
- Widerruf und Jugendschutz können in P0 zunächst als sichtbare Untergruppe vorbereitet werden, auch wenn dafür evtl. noch nicht alle Detailfelder existieren.

### Akzeptanzkriterien

- `Rechtliches & Compliance` ist als eigener UI-Bereich sichtbar.
- Impressum, Datenschutz und AGB sind dort gebündelt.
- Cookie-/Einwilligungslogik liegt nicht mehr im Liefer-/App-Mischblock.
- Fehlende juristische Detailfelder für Widerruf/Jugendschutz werden nicht stillschweigend ignoriert, sondern klar als spätere Ergänzung kenntlich gemacht.

### Risiko

- Mittel: nicht alle gewünschten Unterthemen haben heute schon voll ausgeprägte eigene Felder.

### Aufwandsschätzung

- Mittel

---

## P1-Abgrenzung

- Steuer-, Auszahlungs- und Gebührenfelder vollständig nach `Finanzen -> Abrechnung & Zahlungen` verschieben
- `AppSettingsFields.tsx` technisch in mehrere echte Fachkomponenten zerlegen
- Customer-App-Darstellung noch feiner von Betriebs-/Lieferlogik trennen
- Admin-Suche und Deep Links auf neue Struktur angleichen
- Delivery-Debug tiefer an `buildDeliveryAvailability(...)` anbinden

## P2-Abgrenzung

- PayPal-Backend komplett stilllegen oder entfernen
- Legacy-Zeitfelder technisch abbauen
- Business-Settings-Datenstruktur fachlich entkoppeln
- komplette Bereinigung alter Routen und Legacy-Begriffe

## Zusammenfassung

Dieses P0-Paket schafft schnelle Klarheit im Admin, ohne riskante Tiefeneingriffe:

- neue Menülogik
- Stripe-only aktive Payment-Sicht
- klarer Lieferdienst-Bereich
- klarer Liefergebiets-Bereich
- klarer Ausnahme-Bereich
- klarer Compliance-Bereich

Damit wird die Admin-Oberfläche kurzfristig deutlich verständlicher und zugleich vorbereitend für spätere P1/P2-Bereinigungen.
