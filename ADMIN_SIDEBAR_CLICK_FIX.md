# Admin Sidebar Click Fix

## Gefundene Ursache
- In `BackofficeLayout` konnte die Desktop-Sidebar aus dem alten `collapsed` Zustand als schmale vertikale Leiste stehen bleiben. Dadurch wirkte Navigation überlagert/unzuverlässig.
- Zusätzlich war die Klickfläche nicht in allen Sidebar-Containern explizit als `pointer-events-auto` abgesichert.
- Im Mobile-/Drawer-Flow wurden Links zwar gerendert, aber nicht überall explizit mit „Menü schließen“ gekoppelt.

## Geänderte Dateien
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\AdminLayout.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\BackofficeLayout.tsx`

## Konkrete Lösung
- Desktop-Collapse-Verhalten in `BackofficeLayout` entfernt (P0-Stabilitätsfix): Sidebar ist auf Desktop wieder konsistent voll sichtbar.
- Sidebar-Container in beiden Layouts zusätzlich auf `pointer-events-auto` abgesichert:
  - `aside`
  - `nav`
- Nav-Links schließen im Mobile-Fall explizit das Menü (`setMobileNavOpen(false)`), ohne `preventDefault` oder Routing-Hacks.
- Menüsuche bleibt oben sichtbar und filtert weiter nur Labels, ohne Link-Klicks zu blockieren.

## Manuelle Testliste
1. Admin Dashboard → Produkte
2. Admin Dashboard → Finanzen
3. Admin Dashboard → Displays
4. Chainadmin Dashboard → Display-Geräte
5. Superadmin Dashboard → Billing
6. Superadmin Dashboard → Promotions
7. Menüsuche benutzen und danach Link anklicken

## Ergebnis
- Alle Sidebar-Einträge sind wieder als normale `Link`-Navigation mit Linksklick ausgelegt.
- Keine zusätzliche Overlay-/Pointer-Blocklogik aktiv, wenn Mobile-Menü geschlossen ist.
- Suchfeld bleibt sichtbar und beeinflusst nur die Filterung, nicht das Klickverhalten.
