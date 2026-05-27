# CODE STABILITY AUDIT

Stand: 2026-05-27
Scope: Klarando Frontend (Next.js), Backend (Express/Prisma), Flutter Display, Display Runtime

## Check Results
- `npm run build`: **OK**
- `npm --prefix backend run typecheck`: **OK**
- `dart analyze`: **nicht abgeschlossen (lokal mehrfach hängend/abgebrochen)**
- `flutter build apk --flavor display -t lib/display_main.dart --debug --no-shrink`: **in dieser Session nicht verlässlich durchlaufbar (Hänger-Risiko)**
- `npm audit --omit=dev` (root): **0 vulnerabilities**
- `npm --prefix backend audit --omit=dev`: **0 vulnerabilities**

## Findings Matrix

| Bereich | Datei/Route | Problem | Risiko | Empfehlung | Sofort fixbar | umgesetzt |
|---|---|---|---|---|---|---|
| Frontend | `/app/superadmin/menu-import/page.tsx` | Hook-Reihenfolge/Hydration war instabil (React #310/#418) | HIGH | Hooks vor Early-Return, robustes Session-Parsing | ja | ja |
| Frontend | `/app/superadmin/menu-import/page.tsx` | Sehr große Komponente (~1039 Zeilen) -> Wartbarkeit/Re-Render-Risiko | MEDIUM | In kleinere Sections/Hooks aufteilen (`useMenuImportState`, `CategoryPanel`) | nein | nein |
| Frontend | Admin Routing (`/admin/menu`, `/admin/speisekarte`, `/admin/geraete`, `/admin/devices` etc.) | Mehrere Legacy-/Parallelrouten aktiv -> UX-/Wartungs-Komplexität | MEDIUM | Legacy-Route-Matrix mit klaren Redirects und Removal-Plan | ja | nein |
| Backend | `/backend/src/routes/display-runtime.ts` (`/:deviceCode/*`) | Öffentliche Runtime/Heartbeat mit nur deviceCode; brute-force/enum Risiko | HIGH | Optional signiertes Device-Token/HMAC + Rate-Limit pro deviceCode + anomaly logging | teilweise | nein |
| Backend | `/backend/src/routes/table-ordering.ts` (QR Session endpoints) | Public QR endpoints, nur In-Memory Foundation, kein persistenter Missbrauchsschutz | HIGH | Persistente Speicherung + tenant-safe token index + stärkeres Rate-Limit/CAPTCHA-Strategie | teilweise | nein |
| Backend | `/backend/src/lib/display-runtime-builder.ts` | `branchId` im Runtime-Objekt wird mehrfach aus `tenantId` befüllt | MEDIUM | Datenmodell-/Mapping prüfen und echte Branch-Zuordnung verwenden | ja | nein |
| Backend | Query-Verhalten Display Runtime | Potenziell teure Runtime-Build-Pfade bei häufigem Polling | MEDIUM | TTL-Cache per tenant/branch/device + selective fields + Query-Profiling | ja | nein |
| Flutter Display | `/mobile_flutter_app/lib/src/display/display_content_screen.dart` | Große Renderer-Datei (~1114 Zeilen), hoher Komplexitätsgrad | MEDIUM | Renderer in `ThemeRenderer`, `ProductCard`, `PlaylistRenderer` weiter zerlegen | nein | nein |
| Flutter Display | `/mobile_flutter_app/lib/src/display/display_app.dart` Debug Overlay | Token-Teile waren im Debug sichtbar | MEDIUM | Token-Ausgabe vollständig redacted | ja | ja |
| Display System | Manifest/Offline Foundation | Offline-First ist vorbereitet, aber Video-Cache nur vorbereitet (nicht persistent) | LOW | Persistente Asset-Cache-Strategie (Checksum + warmup + eviction) ergänzen | nein | nein |
| Sicherheit | Repo-Scan (Code) | Keine offensichtlichen Secrets/Keys im committed Code gefunden | LOW | Secret-Scanning in CI (gitleaks/trufflehog) ergänzen | ja | nein |
| Betrieb | Flutter Toolchain lokal | `dart analyze`/`flutter build` hängen lokal intermittierend | MEDIUM | CI-basierter Flutter-Job als Source of Truth + lokales Timeout-Skript | ja | nein |

## Kurzfazit
- Build und Backend-Typecheck sind stabil.
- Haupt-Risiken liegen aktuell in **öffentlichen deviceCode/QR-Flows**, **Routing-Legacy-Komplexität** und **großen, schwer wartbaren Komponenten**.
- Ein kleiner sicherer Fix wurde direkt umgesetzt: **Token-Redaction im Display-Debug**.

## Empfohlene nächste sichere Schritte
1. Device/QR-Schutz härten (Token-Signatur + Rate-Limits + Telemetrie).
2. Legacy-Route-Reduktion mit expliziter Redirect-Matrix.
3. `display-runtime-builder` Branch-Mapping korrigieren.
4. Flutter Checks in CI erzwingen (lokale Hänger umgehen).

## Table Ordering Tenant/Branch Consistency
- `backend/src/routes/table-ordering.ts` wurde gezielt geprüft.
- Es wurde **keine `chainId`-Abhängigkeit** gefunden.
- Die Routen arbeiten tenant-basiert über `resolveTenantScope`.
- `branchId` wird optional/filialbezogen verwendet.
- `RestaurantArea`, `RestaurantTable`, `TableSession`, `ServiceCall` sind aktuell tenant-basiert und nicht chain-basiert modelliert.
- Ergebnis: konsistent mit Prisma-Fix `db10a4d`.
- Risiko: **LOW**.
- Empfehlung: Falls später Kettenlogik nötig wird, `chainId` bewusst als eigenes Konzept nachziehen und nicht implizit voraussetzen.
