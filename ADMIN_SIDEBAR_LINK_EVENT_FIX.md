# Admin Sidebar Link Event Fix

## Warum Mausrad funktionierte, Linksklick aber nicht
- Die Sidebar-Links waren bereits echte `<Link href>`-Links.
- Das Problem war kein `preventDefault`, sondern ein Layout-/Stacking-Thema auf `/admin`: Der Content-Bereich konnte im Desktop-Layout in den Sidebar-Bereich hineinragen.
- Dadurch wurden normale Linksklicks teils vom Content-Layer abgefangen, während „im neuen Tab öffnen“ (Mausrad/Mittelklick) subjektiv häufiger funktionierte.

## Komponente, die blockierte
- Kein einzelner Button/Handler blockierte die Navigation.
- Der blockierende Effekt kam aus der Layout-Überlagerung zwischen:
  - `app/Components/admin/AdminLayout.tsx`
  - `app/Components/admin/BackofficeLayout.tsx`

## Konkreter Fix
- Desktop-Sidebar auf feste, eigene Ebene gesetzt:
  - `aside`: `fixed inset-y-0 left-0 z-[120]`
- Content-Wrapper beginnt ab Desktop **rechts** neben Sidebar:
  - `md:ml-[276px]` (Kompakt)
  - `md:ml-[248px]` (Touch)
- Sidebar bleibt `pointer-events-auto`.
- Mobile Overlay bleibt separat mit eigenem Z-Index und nur unter `md`.

## Echte href-Links
- Sidebar-Einträge bleiben echte `Link href="..."`-Navigation.
- Keine verschachtelten Button-in-Link-Patterns für Navigation.

## elementFromPoint-Test (so prüfen)
Auf `/admin` in DevTools-Konsole:

```js
document.elementFromPoint(40, 260)
document.elementFromPoint(40, 300)
document.elementFromPoint(40, 350)
```

Erwartung nach Fix:
- Rückgabe ist Sidebar-Navigation (`A`, `SPAN` oder Kindelement eines Sidebar-Links), nicht Dashboard-Content.
