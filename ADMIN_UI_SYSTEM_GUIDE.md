# Klarando Admin UI System Guide

## Ziel
Einheitliche, responsive Admin-Oberflächen für:

- `admin`
- `chainadmin`
- `superadmin`
- weitere Backoffice-Seiten über `BackofficeLayout`

## Zentrale Komponenten
Datei: `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\ui\AdminUi.tsx`

- `AdminPageShell`
- `AdminPageHeader`
- `AdminSectionCard`
- `AdminTable`
- `AdminFormGrid`
- `AdminTextInput`
- `AdminTextarea`
- `AdminSelect`
- `AdminButton` (`primary`, `secondary`, `danger`)
- `AdminStatusBadge`
- `AdminEmptyState`
- `AdminTabs`
- `AdminActionBar`

## Layout-Regeln
- Inhalt auf `max-width: 1400px` begrenzen
- Einheitliche Card-Optik (`border`, `rounded`, `shadow-sm`)
- Klare Seitenstruktur:
  1. Header/Filter
  2. Inhaltstabellen/Formulare
  3. Hinweise/Info
- Einheitliche Abstände über `space-y-6`, `gap-3`, `rounded-2xl/3xl`

## Sidebar-Verhalten
Aktualisiert in:

- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\AdminLayout.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\BackofficeLayout.tsx`

Verhalten:

- Desktop (>= 1280px): standardmäßig erweitert (manuell einklappbar)
- Tablet (768px bis 1279px): automatisch eingeklappt, manuell erweiterbar
- Mobile (< 768px): Sidebar als Drawer/Overlay

Persistenz:

- Admin: `klarando.admin.sidebar.collapsed.v1`
- Backoffice: `klarando.backoffice.sidebar.collapsed.v1`

## Navigation-Gruppierung (Admin)
Im `AdminLayout` logisch gruppiert:

- Übersicht
- Bestellungen
- Produkte
- Betrieb
- Geräte
- Lager
- Auswertung
- Design

Wichtig:

- nur vorhandene Seiten verlinkt
- keine toten Links
- Unterkategorien pro Bereich in der Subnavigation

## Formular-Regeln
- Inputs für kurze Werte
- Textareas für längere Inhalte (min-height gesetzt)
- Labels/Hilfetexte/Fehlertexte untereinander
- Einspaltig mobil, zwei Spalten ab `md`
- Preis-/Zahlfelder als numerische Inputs

## Tabellen-Regeln
- Tabellen immer in horizontal scrollbarem Container
- klare Header-/Zellenstile
- Status über Badges
- Empty/Loading States klar dargestellt
- Aktionen gebündelt im rechten Bereich

## Modul-Sichtbarkeit
- Deaktivierte Module werden ausgeblendet:
  - Navigation
  - Subnavigation
  - Seiteninhalt (Fallback-Meldung bei Direktaufruf)

Technik:

- `lib/admin-module-visibility.ts`
- effektiver Feature-Scope aus API (`/api/access/features/effective`)

## Aktuell angepasst
- `AdminLayout` (Navigation, Responsive Sidebar, Modul-Guard)
- `BackofficeLayout` (Responsive Sidebar, konsistente Header/Content-Breite)
- `admin` Dashboard Feature-Scope-Integration
- Superadmin-Seite `Module & Pakete` auf zentrale UI-Bausteine vorbereitet
- Chainadmin-Seiten `App-Einstellungen` und `Abschlüsse` auf zentrale UI-Bausteine migriert
- Zentrale Nav-Konfigurationen:
  - `app/superadmin/nav.ts`
  - `app/chainadmin/nav.ts`

## Empfehlung für neue Adminseiten
1. Seite mit `AdminPageShell` aufbauen
2. Abschnittsweise `AdminSectionCard` nutzen
3. Formulare mit `AdminFormGrid` + Input-Komponenten
4. Tabellen über `AdminTable`
5. Aktionen über `AdminActionBar`
6. Empty/Loading/Error immer explizit darstellen
