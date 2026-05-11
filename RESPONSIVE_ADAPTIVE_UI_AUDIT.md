# Responsive & Adaptive UI Audit (Klarando)

## Geprüfte Bereiche
- Web/Next.js: Admin-Layout, Backoffice-Layout, Business-Template-UI, Display-Feed (`/screen/[deviceCode]`), Order-Display (`/order-display/[displayCode]`)
- Gemeinsame UI-Bausteine: Admin-UI Table-Komponente, globale Styles (`app/globals.css`)
- Mobile (Flutter): Projektstruktur vorhanden (`mobile_flutter_app`), Analyse/Test-Lauf ausgeführt (siehe Check-Abschnitt)

## Behobene Probleme
- Safe-Area-Unterstützung ergänzt:
  - Neue CSS-Hilfsklasse `.safe-area-padding` für Notch-Geräte/TV-Sticks
  - In Admin-/Backoffice-/Display-Root-Containern aktiviert
- Admin- und Backoffice-Oberflächen robuster auf kleineren Viewports:
  - Bessere mobile Einbettung ohne abgeschnittene Header-/Sidebar-Bereiche
- Business-Template-UI verbessert:
  - Suchfeld/Filter flexibel statt fixer Breiten
  - Import-Dialog mit `max-height` + `overflow-y-auto`
  - Lange Inhalte (`Kategorien`, `Produkte`, `Zutaten`) brechen sauber um
  - Deutsche Umlaute in Nutzertexten korrigiert
- Tabellen-Responsiveness verbessert:
  - `AdminTable` Mindestbreite von 760 auf 640 (mobil besser scrollbar)
- Screen-/TV-Ansicht verbessert (`/screen/[deviceCode]`):
  - Angebotsfenster-Breite/-Höhe auf kleine Viewports begrenzt
  - Titel/Untertitel und Produktnamen mit Wortumbruch (`break-words` / `overflowWrap: anywhere`)
  - Logo skaliert auf kleinen Displays konservativer
- Order-Display verbessert (`/order-display/[displayCode]`):
  - Safe-Area aktiv
  - Wortumbruch bei Titel/Bestellkopf/Produktnamen ergänzt

## Verbleibende Risiken
- Nicht jede einzelne Unterseite wurde visuell manuell in allen Breakpoints durchgeklickt (breites Projekt).
- Einige große Display-/Operationsseiten enthalten weiterhin umfangreiche Inline-Layouts, die mittelfristig in kleinere responsive Komponenten zerlegt werden sollten.
- Flutter-App benötigt eine stabile lokale Flutter-Toolchain; ohne diese sind automatische Qualitätschecks eingeschränkt.

## Empfehlungen (nächste Iteration)
- Einheitliche `ResponsivePageShell` für alle großen Webseiten (inkl. Standard-Empty/Loading/Error State).
- Tabellen-zu-Karten-Muster für die größten Admin-Listen vereinheitlichen.
- Display-Ansichten mit dedizierten Presets testen:
  - 720p, 1080p, 4K (Landscape)
  - 1080x1920 (Portrait-Kiosk)
- Playwright-Snapshot-Tests für Kernseiten in festen Größen ergänzen.

## Testgrößen für QA
- 360x800 (Smartphone)
- 768x1024 (Tablet)
- 1366x768 (Laptop)
- 1920x1080 (TV)
- 3840x2160 (4K)
- jeweils Hoch-/Querformat für relevante Views

## Geänderte Dateien (dieser Schritt)
- `app/globals.css`
- `app/Components/admin/AdminLayout.tsx`
- `app/Components/admin/BackofficeLayout.tsx`
- `app/Components/admin/BusinessTemplateManager.tsx`
- `app/Components/admin/ui/AdminUi.tsx`
- `app/screen/[deviceCode]/page.tsx`
- `app/order-display/[displayCode]/page.tsx`
