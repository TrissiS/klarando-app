# Admin UI Refactor

## Navigation-Konzept
- Sidebar bleibt das primäre Navigationssystem für Hauptbereiche.
- Workspace-Tabs im Seitenkopf bleiben für Unterseiten innerhalb eines Bereichs.
- Doppelte Bereichs-Buttons im Content wurden aus den Workspace-Startseiten entfernt.

## Rollen-Konzept
- UI-Visibility-Modes vorbereitet:
  - `operator` (Standard Admin)
  - `power-user` (Chainadmin)
  - `superadmin`
- Das Layout setzt `data-ui-visibility-mode` für nachgelagerte UI-Regeln.
- Technische Build-/Commit-Metadaten in der Sidebar werden nur noch für interne Rollen angezeigt:
  - superadmin
  - developer
  - support

## Versteckte Elemente / Reduktion
- Auf den Workspace-Seiten wurden technische Hinweise für normale Betreiber entfernt:
  - `LIMITED`
  - `In Vorbereitung`
  - Produktionsreife-Hinweise
  - Warn- und Debugtexte im Content
- Betroffene Seiten:
  - `/admin/menu`
  - `/admin/billing`
  - `/admin/delivery`
  - `/admin/devices`

## Footer-Regeln
- Footer ist nicht mehr als `fixed` Element erzwungen.
- Footer wird normal im Seitenfluss gerendert und bleibt dadurch zuverlässig erreichbar.
- Konflikte mit verschachtelten Scrollcontainern wurden reduziert.

## Neue UX-Regeln
- Weniger Textwände, klarere KPI-Karten, primäre Aktionen über Tabs.
- Operator-Ansichten zeigen nur betriebsrelevante Inhalte.
- Interne/technische Informationen werden rollenbasiert begrenzt.
- Workspace-Seiten folgen einem konsistenten Muster:
  1. Workspace-Header
  2. Tabs
  3. KPI-Stats
  4. Fachinhalt statt doppelter Navigation
