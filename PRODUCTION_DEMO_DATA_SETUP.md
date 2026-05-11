# Production Demo Data Setup (Safe)

## Warum Admin/Superadmin keine Bestellungen sehen kann
In Production ist das haeufig kein Bug, sondern fehlende Grunddaten:
- keine Chains
- keine Tenants
- Admin ohne `tenantId`
- keine Produkte/Kategorien
- keine Bestellungen

Das Skript `backend/scripts/create-demo-tenant-safe.ts` liefert zuerst eine Diagnose (Counts) und legt danach optional additive Demo-Daten an.

## Safety-Prinzip
- nur mit `NODE_ENV=production`
- nur mit expliziter Freigabe `ALLOW_PRODUCTION_DEMO_DATA_SETUP=true`
- Abbruch, wenn `ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS=true` gesetzt ist
- **keine** `deleteMany`, kein Reset, kein Drop
- nur additive Erstellung/Upsert

## Was das Skript zaehlt
- `users`
- `superadmins`
- `chainadmins`
- `admins`
- `adminUsersWithTenant`
- `tenants`
- `chains`
- `products`
- `categories`
- `orders`
- `rolePermissions`
- `userPermissions`

## Was das Skript (optional) anlegt
- Demo-Chain
- Demo-Tenant
- Demo-Admin (Role `ADMIN`, mit `tenantId` und `chainId`)
- Demo-Kategorie
- Demo-Produkte
- optional eine Demo-Bestellung (`DEMO_CREATE_ORDER=true`)

## ENV-Variablen fuer sicheren Run
Pflicht:
- `NODE_ENV=production`
- `ALLOW_PRODUCTION_DEMO_DATA_SETUP=true`
- `DEMO_ADMIN_PASSWORD=<starkes-passwort-min-12>`

Optional:
- `DEMO_CHAIN_CODE` (default: `KLARANDO-DEMO-CHAIN`)
- `DEMO_CHAIN_NAME` (default: `Klarando Demo Chain`)
- `DEMO_TENANT_NAME` (default: `Demo Filiale`)
- `DEMO_TENANT_EMAIL` (default: `demo-tenant@klarando.local`)
- `DEMO_ADMIN_NAME` (default: `Demo Filialadmin`)
- `DEMO_ADMIN_EMAIL` (default: `demo.admin@klarando.local`)
- `DEMO_CATEGORY_NAME` (default: `Klassiker`)
- `DEMO_CREATE_ORDER=true|false` (default: `false`)

## Ausfuehrung auf dem VPS
Im Projektordner (`/opt/klarando-app`) im Backend-Container oder Host-Umgebung:

1. Build aktualisieren
```bash
npm --prefix backend run build
```

2. Safe Demo Setup starten
```bash
NODE_ENV=production \
ALLOW_PRODUCTION_DEMO_DATA_SETUP=true \
DEMO_ADMIN_PASSWORD='BitteStarkesPasswortSetzen123!' \
npm --prefix backend run demo:setup:safe
```

3. Optional inklusive Demo-Bestellung
```bash
NODE_ENV=production \
ALLOW_PRODUCTION_DEMO_DATA_SETUP=true \
DEMO_ADMIN_PASSWORD='BitteStarkesPasswortSetzen123!' \
DEMO_CREATE_ORDER=true \
npm --prefix backend run demo:setup:safe
```

## Erwartete Ausgabe
- Tabelle `Diagnose VORHER`
- Liste der angelegten/geprueften Demo-Daten
- Tabelle `Diagnose NACHHER`

Damit siehst du direkt, ob Datenbasis fuer Bestelllisten vorhanden ist.

## Zusatztipp fuer Online-Frontend
Wenn online trotzdem keine Daten kommen:
- Frontend-ENV pruefen (`NEXT_PUBLIC_API_BASE_URL`)
- Browser Network Tab auf `/api/*` Antworten pruefen
- Backend-Container Logs pruefen (`docker compose ... logs backend`)
