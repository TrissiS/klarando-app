# KLARANDO Auslesung fuer ChatGPT

Stand: 2026-05-20
Commit: `98a7eb5`

## 1) Kurzfazit
Diese Auslesung zeigt den aktuellen technischen Stand von Klarando, mit Fokus auf:
- was bereits vorhanden ist,
- was doppelt wirkt,
- was wahrscheinlich noch fehlt oder nachgeschaerft werden sollte.

Wichtig: Das ist eine technische Bestandsaufnahme aus dem aktuellen Repo-Stand, keine rechtliche Abnahme.

## 2) Aktuelle Struktur (kompakt)

### Frontend (Next.js)
- App-Routes (`app/**/page.tsx`): **81 Seiten**
- Relevante Hauptbereiche vorhanden:
  - `admin/*`
  - `chainadmin/*`
  - `superadmin/*`
  - Display: `/screen/[deviceCode]`, `/order-display/[displayCode]`, `/terminal/[terminalCode]`

### Backend (Express + Prisma)
- API-Routen-Dateien (`backend/src/routes/*.ts`): **41**
- Kernbereiche vorhanden:
  - Auth/Access, Orders, Products, Ingredients, Settings
  - Display (`display.ts`, `display-runtime.ts`, `display-pairing.ts`)
  - Billing (`billing.ts`), Payments, Webhooks
  - Menu Import (`superadmin-menu-import.ts`)

## 3) Was wirkt doppelt / potenziell redundant

### A) Oeffentliche Rechtstexte doppelt erreichbar
Mehrfach vorhandene Seiten:
- `app/impressum/page.tsx` und `app/infos/impressum/page.tsx`
- `app/datenschutz/page.tsx` und `app/infos/datenschutz/page.tsx`
- `app/agb/page.tsx` und `app/infos/agb/page.tsx`

Empfehlung:
- Eine kanonische URL-Strategie festlegen (z. B. `/infos/*` als canonical),
- die jeweils andere URL per Redirect/Canonical-Tag stabilisieren.

### B) Technische Route unter `app/Components/*`
Gefunden:
- `app/Components/admin/page.tsx`
- `app/Components/admin/calculation/page.tsx`
- `app/Components/admin/screen/page.tsx`

Das wirkt wie Komponenten-Ordner, der als Route ausgerollt wurde.
Empfehlung:
- pruefen, ob diese Routen bewusst produktiv sind.
- falls nein: in nicht-route-faehige Ordnerstruktur verschieben (z. B. ausserhalb `app/`) oder Redirect setzen.

### C) Display-Endpunkte konsolidierungsbeduerftig
Parallel vorhanden:
- `display.ts`
- `display-runtime.ts`
- `screen.ts`
- `admin-displays.ts`

Empfehlung:
- Runtime-Builder als Single-Source beibehalten,
- Alt-Endpunkte intern nur noch weiterleiten oder als Legacy markieren,
- dokumentierte Endpunkt-Matrix pflegen.

## 4) Was wahrscheinlich noch fehlt / offen ist

### A) Eindeutige "Done-Definition" je Bereich
Es gibt viele Architektur-/Planungs-MDs. Was meist fehlt, ist eine einheitliche "Produktiv-Checkliste mit Status je Feature".
Empfehlung:
- pro Modul: `READY`, `LIMITED`, `IN_PREPARATION` mit Owner und Datum.

### B) Konsistente Feature-Flags im UI
Teilweise sind Features vorbereitet, aber je nach Seite unterschiedlich sichtbar.
Empfehlung:
- einheitliche "disabled + Hinweis"-Komponente fuer nicht aktivierte Features,
- keine klickbaren toten Buttons.

### C) End-to-End-Nachweis fuer kritische Flows
Vor allem fuer:
- Menu Import -> Produktanlage -> Zutatenlinking,
- Display Runtime -> TV-Client -> Offline-Snapshot,
- Billing Draft -> Freigabe -> Versandstatus.

Empfehlung:
- kleine Smoke-Tests / Playbooks pro kritischem Flow versionieren.

## 5) Positiver Stand (wichtig)
- Build faehig (zuletzt erfolgreich).
- Service-Area-Polygon-Flow frisch repariert (Persistenz/Validierung/Testpunkt).
- Display-/Screen-Architektur und Billing sind dokumentiert und strukturell deutlich weiter als ein MVP-Standard.

## 6) Empfohlene naechste 5 Aufraeum-Schritte
1. Canonical/Redirect fuer `impressum`, `datenschutz`, `agb` festziehen.
2. `app/Components/*` als Route-Bereich fachlich pruefen und ggf. entfernen/verschieben.
3. Display-Endpunkt-Matrix dokumentieren (`legacy`, `primary`, `internal`).
4. Einheitliches Feature-Gating-Pattern in Admin/Superadmin durchziehen.
5. Eine zentrale "Production Readiness Matrix" mit Ampelstatus je Modul anlegen.

## 7) Datei-Hinweis
Diese Auslesung ist als technischer Snapshot fuer weitere ChatGPT-/Codex-Runden gedacht und kann als Referenz fuer gezielte Folgeaufgaben genutzt werden.
