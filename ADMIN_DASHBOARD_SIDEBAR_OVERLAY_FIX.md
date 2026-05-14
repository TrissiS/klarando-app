# Admin Dashboard Sidebar Overlay Fix

## Ursache
- Die Layout-Stacking-Reihenfolge war im Grenzbereich (kleinere Breite/DevTools offen) nicht robust genug.
- Sidebar und Content lagen zwar nebeneinander, aber ohne harte Isolation konnte der Content-Stack visuell/klicktechnisch in den Sidebar-Bereich hineinwirken.

## Geänderte Dateien
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\AdminLayout.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\app\Components\admin\BackofficeLayout.tsx`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\ADMIN_DASHBOARD_SIDEBAR_OVERLAY_FIX.md`

## Konkreter Fix
1. Layout-Isolation gehärtet:
- Container auf `relative isolate flex min-h-screen min-w-0`.

2. Sidebar als klar separater Interaktionsbereich:
- `aside` auf `z-[90]`.
- Desktop: `md:sticky md:top-0 md:h-screen`.
- `pointer-events-auto` bleibt aktiv.

3. Content-Wrapper strikt hinter Sidebar:
- Wrapper auf `relative z-10 flex-1 overflow-x-hidden`.
- Header auf `relative z-20`.
- Seiteninhalt auf `relative z-10`.

4. Mobile Overlay sauber getrennt:
- Overlay-Z-Index auf `z-[120]` nur im Mobile-Fall (`md:hidden`), damit Desktop-Interaktion nicht beeinflusst wird.

## Warum jetzt klickbar
- Die Sidebar liegt jetzt in einer eigenen, priorisierten Stacking-Ebene.
- Content/Header können den Sidebar-Bereich nicht mehr „überfahren“.
- Durch `sticky + h-screen` bleibt die Sidebar-Fläche stabil und getrennt vom Dashboard-Flow.

## Manuelle Prüfungen
- `/admin` Sidebar-Linkklick getestet.
- `/admin/products` Navigation per normalem Linksklick getestet.
- `/superadmin` Navigation per normalem Linksklick getestet.
- Mit kleinerer Breite/DevTools offen Layout-Stabilität berücksichtigt (kein Desktop-Overlay über Sidebar).
