# Security Route Matrix (`access.ts`)

| Route / Datei | Auth erforderlich | Permission erforderlich | Tenant-Scope geschuetzt | Kritikalitaet | Offene Risiken |
|---|---|---|---|---|---|
| `GET /access/roles` (`backend/src/routes/access.ts`) | ja | ja (`USERS_READ`) | nein (global) | niedrig | Gibt globale Rollen/Permissions aus; beabsichtigt, aber sensitiv fuer internen Rechtekatalog. |
| `GET /access/context` (`backend/src/routes/access.ts`) | ja | ja (`USERS_READ`) | ja | mittel | Keine zentrale `resolveTenantScope`-Pruefung notwendig, Scope erfolgt ueber Rollenfilter. |
| `GET /access/users` (`backend/src/routes/access.ts`) | ja | ja (`USERS_READ`) | ja | hoch | Superadmin kann bewusst global filtern; fuer Nicht-Superadmin wird Scope erzwungen. |
| `POST /access/users` (`backend/src/routes/access.ts`) | ja | ja (`USERS_WRITE`) | ja | hoch | Nur `SUPERADMIN`/`CHAINADMIN`/`ADMIN`; Rollen-/Tenant-Grenzen serverseitig. |
| `PATCH /access/users/:id` (`backend/src/routes/access.ts`) | ja | ja (`USERS_WRITE`) | ja | hoch | Nicht-Superadmin darf `chainId`/`tenantId` nicht anpassen. |
| `DELETE /access/users/:id` (`backend/src/routes/access.ts`) | ja | ja (`USERS_WRITE`) | ja | hoch | Selbstloeschung und Loeschung des letzten Superadmins blockiert. |
| `GET /access/drivers/overview` (`backend/src/routes/access.ts`) | ja | ja (`USERS_READ`) | ja | hoch | Driver-Statistiken tenant-begrenzt; keine Cross-Tenant-Order-Aggregation mehr. |
| `GET /access/drivers/:id` (`backend/src/routes/access.ts`) | ja | ja (`USERS_READ`) | ja | hoch | Driver muss Tenant haben, sonst `409`; Orders tenant-gefiltert. |
| `GET /access/users/:id/permissions` (`backend/src/routes/access.ts`) | ja | ja (`USERS_READ`) | ja | hoch | Zugriff auf fremde Benutzer ueber Rollenlogik und Tenant-Scope geblockt. |
| `PUT /access/users/:id/permissions` (`backend/src/routes/access.ts`) | ja | ja (`USERS_WRITE`) | ja | hoch | Nicht-Superadmin darf nur Permissions innerhalb der Rollen-Defaults setzen (keine Rechteausweitung). |
| `GET /access/audit` (`backend/src/routes/access.ts`) | ja | ja (`AUDIT_READ`) | ja | mittel | Scope laeuft jetzt ueber `enforceAuditScope`; Superadmin bleibt global. |

## Kurzfazit

- Alle kritischen User-/Driver-/Permission-Routen in `access.ts` sind jetzt tenant- und rollenbegrenzt.
- Tenant-Filter aus Query/Body werden nicht mehr blind akzeptiert.
- Rechteausweitung durch Nicht-Superadmins bei Permission-Zuweisung ist unterbunden.
