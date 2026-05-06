# Loyalty-/Sammelkarten-Architektur (Planung)

## Zielbild
Klarando soll nach dem Pilot eine flexible Loyalty-Engine bieten, die filial- und kettenweit konfigurierbar ist, ohne Tenant-Trennung zu verletzen.

Unterstützte Regeltypen (später):
- Pro Bestellung: 1 Stempel je qualifizierter Bestellung
- Pro Produkt: 1 Stempel je Produkt/Produktgruppe (z. B. „Döner“)
- Pro Umsatz: z. B. 1 Punkt je 5,00 EUR
- Belohnung nach X Stempeln/Punkten
- Gültigkeit: pro Filiale oder pro Kette

## Architekturprinzipien
- Tenant-first: Jede Loyalty-Konfiguration gehört eindeutig zu `tenantId` (Filiale) oder `chainId` (Kette).
- Event-basiert: Punkte/Stempel entstehen ausschließlich aus nachvollziehbaren Bestell-Events.
- Idempotent: Keine Doppelgutschriften bei Re-Delivery/Retry.
- Revisionssicher: Jede Änderung und jede Buchung ist auditierbar.

## Datenmodell-Vorschlag

### 1) `loyalty_programs`
- `id`
- `tenant_id` (nullable, wenn chain-weit)
- `chain_id` (nullable, wenn filial-weit)
- `scope` (`BRANCH` | `CHAIN`)
- `name`
- `status` (`DRAFT` | `ACTIVE` | `PAUSED` | `ARCHIVED`)
- `stamp_unit_type` (`ORDER` | `PRODUCT` | `REVENUE`)
- `stamp_unit_value` (z. B. 1 Bestellung, 1 Produkt, 5.00 EUR)
- `reward_threshold` (z. B. 10 Stempel)
- `reward_type` (`FREE_PRODUCT` | `DISCOUNT_FIXED` | `DISCOUNT_PERCENT`)
- `reward_value`
- `reward_product_id` (optional)
- `valid_from`, `valid_until` (optional)
- `stackable_with_coupons` (bool)
- `created_at`, `updated_at`

### 2) `loyalty_program_products` (für Produkt-basierte Regeln)
- `id`
- `program_id`
- `product_id`
- `multiplier` (optional, default 1)

### 3) `customer_loyalty_accounts`
- `id`
- `customer_id`
- `tenant_id` / `chain_id` (passend zum Programm-Scope)
- `program_id`
- `current_points`
- `lifetime_points`
- `last_activity_at`
- `created_at`, `updated_at`
- Unique: (`customer_id`, `program_id`)

### 4) `loyalty_ledger_entries` (Buchungsjournal)
- `id`
- `program_id`
- `customer_loyalty_account_id`
- `order_id` (optional, aber bei Bestellfluss i. d. R. gesetzt)
- `entry_type` (`EARN` | `REDEEM` | `REVERSE` | `EXPIRE` | `ADJUST`)
- `points_delta` (positiv/negativ)
- `reason_code` (`ORDER_COMPLETED`, `ORDER_REFUNDED`, `MANUAL_ADJUSTMENT`, ...)
- `idempotency_key` (unique)
- `metadata_json`
- `created_by_user_id` (optional)
- `created_at`

### 5) `loyalty_rewards`
- `id`
- `program_id`
- `customer_id`
- `redeemed_order_id` (optional)
- `status` (`ISSUED` | `REDEEMED` | `CANCELLED` | `EXPIRED`)
- `reward_payload_json`
- `issued_at`, `redeemed_at`, `expires_at`

## Regelauflösung pro Tenant/Filiale
- Beim Order-Event wird zuerst tenant-spezifisches Programm geprüft.
- Falls kein aktives Filialprogramm vorhanden: chain-weites Programm als Fallback.
- Keine tenant-fremde Auflösung: Query immer serverseitig über erlaubte Tenant-Scope-IDs.

## Admin-Einstellungen (später)
- Programmanlage je Filiale/Kette
- Regeltyp (Bestellung/Produkt/Umsatz)
- Schwelle + Belohnung
- Gültigkeitsfenster
- Mindestbestellwert
- Ausschlüsse (z. B. reduzierte Artikel)
- Ein/Aus (Pause)
- Simulationsansicht („Diese Bestellung ergibt X Punkte“)

## Kundenansicht (App/Web)
- Aktueller Sammelstand (Punkte/Stempel)
- Fortschrittsbalken bis zur Belohnung
- Letzte Buchungen (Transparenz)
- Verfügbare Belohnungen + Ablaufdatum
- Einlöselogik im Checkout

## Missbrauchsschutz
- Idempotency-Key pro Loyalty-Buchung (gebunden an Order-Event)
- Punkte erst bei validem Status (z. B. `DELIVERED`/`COMPLETED`)
- Kein Earn auf stornierte/fraud-verdächtige Orders
- Serverseitige Berechnung (nie clientseitig vertrauen)
- Rate-Limits für Einlöse-Endpunkte
- Audit-Log bei manuellen Korrekturen

## Rückerstattung / Storno
- Vollstorno: Earn-Buchung vollständig rückgängig (`REVERSE`)
- Teilrückerstattung: proportionale Punktkorrektur
- Bereits eingelöste Belohnung bei Refund:
  - Wenn technisch möglich: Reward stornieren
  - Sonst negative Ausgleichsbuchung (`ADJUST`/`REVERSE`)
- Korrekturen immer als neue Ledger-Entry, niemals „silent overwrite“

## Multi-Tenant-Sicherheit
- Loyalty-Programme und Ledger strikt mit `tenant_id`/`chain_id` verknüpfen.
- Admin-/Staff-Routen nur im erlaubten Tenant-Scope.
- Customer sieht nur eigene Loyalty-Konten.
- Keine Route darf Scope aus Body ungeprüft übernehmen.

## MVP später (nach Pilot) vs. nicht vor Pilot

### Nicht vor Pilot (verschieben)
- Komplexe Multi-Programm-Kombinationen
- Cross-Channel-Coupons + Loyalty-Stacking-Regeln
- Gamification (Badges, Levels)
- Expiry-Engine mit vielen Sonderfällen

### Sinnvolles MVP nach erfolgreichem Pilot
- Genau 1 aktives Programm je Filiale
- Regeltyp zunächst nur `ORDER` oder `REVENUE`
- Belohnung: fester Rabatt oder Free-Product
- Earn erst bei `DELIVERED`
- Vollstorno-Reversal
- Einfache Kundenansicht + Basisaudit

## Empfohlene Umsetzung nach erfolgreichem Pilot
1. Phase 1: Tabellen + Ledger + serverseitige Earn-Berechnung (ohne UI-Overload)
2. Phase 2: Admin-UI für Programmanlage und Basisregeln
3. Phase 3: Customer-UI (Fortschritt + Einlösen)
4. Phase 4: Refund/Teilrefund-Automatik + Monitoring
5. Phase 5: Erweiterte Regeln (Produktlisten, Kettenprogramme, Ablaufregeln)

## Technische Leitplanken
- Keine direkten Punkteschreibzugriffe aus Clients.
- Alle Buchungen über zentralen Service (`LoyaltyEngine`) mit Idempotenzprüfung.
- Events/Logs: `loyalty_earned`, `loyalty_redeemed`, `loyalty_reversed`, `loyalty_adjusted`.
- Feature-Flag pro Tenant, damit rollout-kontrolliert aktiviert werden kann.
