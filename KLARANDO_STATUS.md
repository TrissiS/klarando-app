# KLARANDO Statusbericht

Stand: 2026-05-06
Projektpfad: `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app`

## 1) Aktueller Stand

Klarando ist bereits eine funktionsreiche Plattform mit Web-Frontend (Next.js), Backend-API (Express + Prisma + PostgreSQL) und Flutter-Apps (Kunde/Fahrer/OrderDesk).

Die Basis für Multi-Tenancy ist im Datenmodell vorhanden (`Chain` + `Tenant`), aber die Tenant-Isolation ist im API-Layer noch nicht überall konsequent erzwungen.

Kurzfazit:
- Datenmodell: grundsätzlich mandantenfähig
- Rollenmodell: weitgehend vorhanden
- API-Schutz: teilweise gut, teilweise lückenhaft
- Produktivhärtung: noch nicht ausreichend für sicheren Live-Betrieb bei mehreren Filialen/Ketten

## 2) Technologie und Architektur

Frontend:
- Next.js 16 + React 19 + TypeScript
- Bereiche vorhanden: `app/admin`, `app/superadmin`, `app/chainadmin`, `app/main-app`, `app/order-display`, `app/terminal`, `app/pos`

Backend:
- Express 5 + TypeScript
- Prisma ORM + PostgreSQL
- Zentrale Route-Mounts in `backend/src/server.ts`

Mobile:
- Flutter-App in `mobile_flutter_app`
- Separate Einstiegspunkte vorhanden, u. a. `cashier_display_app.dart` (Klarando OrderDesk) und `driver_delivery_app.dart`

Datenbank:
- Prisma-Schema in `backend/prisma/schema.prisma`
- Migrationen vorhanden (`backend/prisma/migrations`)

## 3) Vorhandene Kernfunktionen

Auth/Login:
- Admin-Login vorhanden: `backend/src/routes/auth.ts`
- Kunden-App-Login/Registrierung vorhanden: `backend/src/routes/app-auth.ts`
- Token-basierte Auth vorhanden: `backend/src/auth/token.ts`, `backend/src/auth/app-token.ts`

Rollen/Berechtigungen:
- Rollen vorhanden: `SUPERADMIN`, `CHAINADMIN`, `ADMIN`, `STAFF`, `DRIVER`
- Permissions vorhanden: `TENANTS_*`, `USERS_*`, `PRODUCTS_*`, `INVENTORY_*`, `ORDERS_*`, `SETTINGS_*`, `AUDIT_READ`
- Middleware vorhanden: `requireAuth`, `requirePermission`

Mandantenstruktur:
- `Chain` und `Tenant` sind implementiert
- Viele Entitäten sind mit `tenantId` verknüpft (Produkte, Kategorien, Bestellungen, Lager, Displays, Terminals, Personal)
- Kettenzugriffe vorhanden: `ChainAdminTenantAccess`

Bestellungen/OrderDesk/Fahrer:
- Bestellung, Routing und Display-Logik sind umfangreich implementiert
- OrderDesk-Pairing/Binding ist vorhanden (`orderdesk-devices`)
- Fahrer-Zuweisung und Driver-Device-Sessions sind vorhanden

## 4) Prüfung der Zielrollen gegen Projektziel

Gewünschte Rollen laut Ziel:
- superadmin
- chain_admin
- branch_admin
- staff
- driver
- customer

Ist-Zustand:
- `superadmin` vorhanden (`SUPERADMIN`)
- `chain_admin` vorhanden (`CHAINADMIN`)
- `branch_admin` aktuell faktisch `ADMIN` auf Tenant-Ebene
- `staff` vorhanden (`STAFF`)
- `driver` vorhanden (`DRIVER`)
- `customer` ist als separates Konto-Modell vorhanden (`AppCustomerAccount`), nicht als `UserRole`

Bewertung:
- Funktional passt das größtenteils.
- Für klare Governance sollte die Benennung im Frontend/Backend vereinheitlicht werden (`branch_admin` vs `ADMIN`, `customer` als eigenes Auth-Domain-Modell dokumentieren).

## 5) Multi-Tenant-Isolation: Bewertung

Positiv:
- Das DB-Modell ist tenant-zentriert.
- Viele Queries filtern bereits über `tenantId`.

Kritisch:
- In mehreren Routen wird `tenantId` direkt aus Query/Body übernommen, ohne durchgängig serverseitig gegen die Rolle/Scope des eingeloggten Benutzers zu validieren.
- Dadurch besteht Risiko für Cross-Tenant-Zugriffe, wenn ein Benutzer fremde `tenantId` mitsendet.

Beispiele für Scope-Risiko:
- `backend/src/routes/categories.ts`
- `backend/src/routes/products.ts`
- ähnliche Muster in mehreren CRUD-Routen

Fazit:
- Mandantenfähigkeit ist strukturell vorhanden, aber noch nicht "hart" genug erzwungen.

## 6) Sicherheitsrisiken (priorisiert)

Hoch:
1. Unzureichend geschützte Admin-Analytics-Endpunkte in Orders
- Betroffen: `backend/src/routes/orders.ts`
- Risiko: Einsicht in tenantbezogene Kennzahlen ohne ausreichende Absicherung
- Status: im Rahmen dieser Analyse teilweise abgesichert (siehe Abschnitt "Umgesetzte kleine Verbesserungen")

2. Tenant-Scope nicht überall serverseitig erzwungen
- Risiko: Datenzugriff über fremde `tenantId`
- Betrifft v. a. CRUD-Routen, die nur auf übergebene `tenantId` vertrauen

3. Passwort-Hashing ist zu schwach
- Aktuell: SHA-256 mit globalem Salt (`backend/src/auth/password.ts`)
- Risiko: deutlich schwächer als heutiger Standard
- Empfehlung: Argon2id oder bcrypt mit individuellem Salt/Work-Factor

Mittel:
4. Auth kann per Env abgeschaltet werden
- `AUTH_ENFORCE` steuert zentrale Durchsetzung
- Fehlkonfiguration in Produktion wäre kritisch

5. CORS aktuell sehr offen
- `app.use(cors())` ohne eingeschränkte Origins

6. Keine Rate-Limits für Login/Bestellendpunkte
- Erhöht Risiko für Brute Force und API-Missbrauch

7. Display-/Public-Endpunkte stark auf Codes basiert
- Funktional gewollt, aber härter absichern (Token/Signatur, Rotation, Ablauf)

## 7) Produktverwaltung pro Filiale

Ist:
- Produkte/Kategorien sind tenantbezogen modelliert
- Beziehungen zu Zutaten/Modifikatoren/Lager vorhanden

Baustelle:
- API muss konsequent prüfen, ob der anfragende Benutzer auf diese Tenant-ID zugreifen darf

## 8) Bestellrouting zur richtigen Filiale

Ist:
- Routing zu Displays/Terminals ist umfangreich implementiert
- `Order` enthält `tenantId`, Display-IDs, Terminal-ID

Baustelle:
- Order-Erstellung sollte klar zwischen öffentlichen App-Bestellungen und internen POS/Terminal-Aktionen getrennt und abgesichert sein

## 9) OrderDesk-Struktur

Ist:
- Pairing-Session, Binding, Heartbeat, Gerätebindung vorhanden
- Superadmin-Reset für Bindings vorhanden

Baustelle:
- Auch hier Tenant-Scope bei Admin-Endpunkten strikt zentralisieren
- Public-Bind-Flows weiter härten (Ablauf, Missbrauchsschutz, Monitoring)

## 10) Fahrer-Zuweisung

Ist:
- Fahrer-Rolle und Assignment-Felder in `Order` vorhanden
- Driver-Device-Sessions und Status-/Tracking-Mechanik vorhanden

Baustelle:
- End-to-End-Absicherung/Validierung pro Tenant bei allen Fahreraktionen prüfen und vereinheitlichen

## 11) Datenbankmodell: Bewertung und Sollbild

Aktuelles Modell ist gut als Basis und enthält bereits die wichtigsten Entitäten:
- `Chain`
- `Tenant`
- `User`
- `Product`
- `Category`
- `Order`
- `OrderItem`
- `StaffMember` (statt separatem `drivers`-Table)
- Driver-Zuordnung direkt in `Order` + User-Relation

Empfohlenes Sollbild (ohne harten Umbau, nur klare Regeln):
- `chains` = Kette
- `tenants` = Filiale (jeder Datensatz ist ein Mandant)
- `users` mit Rollen + Scope (`chainId`/`tenantId`)
- `products`, `categories`, `orders`, `order_items`, `drivers` immer tenantgebunden
- Driver-Zuweisung als eigene Historie ergänzen (`driver_assignments`), falls mehr Nachvollziehbarkeit benötigt wird

Wichtigste Regel:
- Jede mutierende und lesende API muss den effektiven Scope serverseitig aus `req.authUser` ableiten und darf nie nur der clientseitig gesendeten `tenantId` vertrauen.

## 12) Umgebungsvariablen und Deployment (IONOS/VPS)

Vorhanden:
- Relevante Variablen sind im Code vorgesehen (`DATABASE_URL`, `AUTH_SECRET`, `APP_AUTH_SECRET`, `AUTH_ENFORCE`, ...)
- Go-Live-Checks und Betriebsdokumente sind vorhanden (`docs/GO_LIVE_CHECKLIST_DE.md`, `backend/scripts/go-live-check.ts`)

Fehlend/ausbaufähig für IONOS/VPS:
- Einheitliches Linux-Deployment-Setup (systemd/pm2 Reverse-Proxy-Runbook)
- Härtungskonzept für CORS, TLS, Security-Header, Rate-Limits
- Standardisierte CI/CD-Pipeline mit automatischen Checks
- Automatisierte Backup/Restore-Nachweise im Betriebsprozess

## 13) Fehlende Kernfunktionen für ein sauberes Multi-Tenant-MVP

1. Zentrale Tenant-Scope-Guard-Schicht für alle relevanten Routen
2. Härtung der Auth-Sicherheit (Passwort-Hashing modernisieren)
3. API-Härtung (CORS, Rate-Limits, Security-Header)
4. Rollen-/Namenskonsistenz (branch_admin/Admin, customer-Domain)
5. Automatisierte Tests für Rechte und Tenant-Isolation

## 14) Konkrete Prioritäten für MVP

P0 (sofort):
- Alle API-Routen auf serverseitige Scope-Erzwingung umstellen
- Offene/leak-gefährdete Admin-Endpunkte absichern
- `AUTH_ENFORCE=true` und starke Secrets als harte Produktionsvorgabe

P1 (direkt danach):
- Passwort-Hashing auf Argon2id/bcrypt migrieren
- CORS auf erlaubte Domains begrenzen
- Rate-Limits für Login, Bestellungen und Public-Endpunkte

P2 (kurzfristig):
- Rollenmodell und Bezeichnungen harmonisieren
- End-to-End-Tests für: superadmin, chainadmin, branch admin, staff, driver, customer
- Deployment-Runbook für IONOS/VPS finalisieren

## 15) Umgesetzte kleine, sichere Verbesserungen in dieser Analyse

Datei geändert:
- `backend/src/routes/orders.ts`

Änderungen:
1. `GET /api/orders/dashboard/admin` mit `requirePermission(PermissionKey.ORDERS_READ)` abgesichert.
2. `GET /api/orders/ratings/admin` mit `requirePermission(PermissionKey.ORDERS_READ)` abgesichert.
3. Fallback in `resolveScopedTenantIdsForRatings(...)` für nicht authentifizierte Requests auf leere Scope-Menge gesetzt.

Ziel:
- Schnelle Reduktion des Datenleck-Risikos bei Admin-Analytics ohne großen Architekturumbau.

## 16) Offene nächste Schritte

1. Tenant-Scope-Guard als zentrale Utility einführen und in CRUD-Routen ausrollen.
2. Kritische Routen zuerst: `products`, `categories`, `ingredients`, `suppliers`, `stock`, `order-terminals`, `order-displays`, `orderdesk-devices`.
3. Passwort-Hash-Migration planen (Bestands-Hashes + Login-Migrationspfad).
4. Mindestens einen automatisierten Isolation-Test je Rolle erstellen.

---

Wenn wir den nächsten Schritt starten, ist der wichtigste Hebel jetzt eindeutig:
**Tenant-Isolation im API-Layer zentral und verpflichtend machen.**
