# ADMIN UX Refactor Plan (Erweitert)

## Ziel
Der Adminbereich bekommt zwei klar definierte Darstellungsmodi, damit Klarando sowohl für Verwaltung (Desktop) als auch für den Betrieb (Tablet/Kasse/Küche) sauber nutzbar bleibt.

## Modus 1: Kompakt
- Einsatz: Desktop, PC, Backoffice, Superadmin
- Fokus: mehr Informationsdichte
- Eigenschaften:
- kleinere Abstände
- dichtere Tabellenzeilen
- kompaktere Karten
- schmalere Sidebar
- kleinere Buttons und Eingabefelder

## Modus 2: Touch
- Einsatz: Tablet, Kasse, Küche, Bedienung per Finger
- Fokus: sichere Touch-Bedienung
- Eigenschaften:
- größere Buttons
- größere Schrift
- mehr Abstände
- weniger visuelle Dichte
- größere Interaktionsflächen

## Umsetzung (MVP)
- Umschalter im Admin-Header: `Kompakt` / `Touch`
- Speicherung pro Nutzer lokal über `localStorage`:
- Key: `klarando.adminUiMode`
- Standardlogik:
- große Desktop-Breite: `compact`
- kleinere Geräte/Tablet: `touch`
- keine Backend-Änderung notwendig

## Bereits angepasste Bereiche
- `AdminLayout`:
- Sidebar-Breite je Modus
- kompaktere/luftigere Navigation
- angepasste Header-/Content-Abstände
- persistenter Modus-Umschalter
- `BackofficeLayout` (Superadmin + Chainadmin):
- gleicher Modus-Umschalter
- gemeinsame `localStorage`-Einstellung
- gleiche Dichte-Logik für Sidebar, Navigation und Content-Spacings
- globale Klassen für Modus-spezifische Dichte:
- Karten
- Tabellen (`th-ui`, `td-ui`)
- Formulare (`input-ui`)
- Buttons (`btn-ui`)

## Offene Punkte (nächste Schritte)
- Superadmin-/Chainadmin-Layouts auf denselben Modus-Hook vereinheitlichen
- Modus auch in Modals/Dialogs konsequent anwenden
- Dichte-Regeln für weitere Tabellenkomponenten ohne `th-ui`/`td-ui` vereinheitlichen
- Optional: Nutzerprofil-Einstellung serverseitig speichern (statt nur lokal)
- Optional: Touch-Modus automatisch sperren/favorisieren für dedizierte Kassen-Geräte
