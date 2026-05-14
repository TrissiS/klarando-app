# Admin Left-Click Event Blocker Fix

## Gefundener Blocker
- Die Sidebar-Links waren technisch korrekt (`href` vorhanden, `elementFromPoint` traf `<a>`).
- Der Blocker lag im Zusammenspiel aus clientseitiger `Link`-Navigation und den Drag/Drop-Handlern auf `/admin`:
  - `app/admin/page.tsx`:
    - `draggable={reorderModeEnabled}`
    - `onDragStart`
    - `onDragOver={(event) => event.preventDefault()}`
    - `onDrop`
- Auf `/admin` ist dieser Handler-Stack aktiv (Dashboard mit Reorder-Logik), auf vielen Unterseiten nicht. Daher fiel es dort am stärksten auf.

## Warum Mittelklick funktionierte
- Mittelklick/neuer Tab nutzt native Browser-Navigation und umgeht die clientseitige SPA-Interception.
- Normaler Left-Click lief über `next/link`-Interception und wurde in der beschriebenen Event-Kombination teilweise nicht ausgeführt.

## Konkreter Fix
- Sidebar-Navigation in Admin- und Backoffice-Layouts von `next/link` auf native `<a href>` umgestellt.
- Keine custom Router-Push-Logik, keine globalen Click-Hooks.
- Native Left-Click-Navigation ist dadurch robust gegen lokale Drag-/Reorder-Eventpfade auf `/admin`.

## Betroffene Dateien
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\AdminLayout.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\BackofficeLayout.tsx`

## Ergebnis
- Left-Click auf Sidebar-Links navigiert wieder direkt.
- Mittelklick bleibt unverändert möglich.
