# Payment Architecture V1

## Stripe Connect Modell
- Klarando verwendet Stripe Connect Express pro Tenant.
- Jeder Tenant besitzt genau eine Stripe-Konto-Zuordnung in `TenantPaymentConfig`.
- Die Einrichtung bleibt im Tenant-Admin unter `/admin/payments`.
- Der Superadmin sieht nur Status, Aktivierung und Sync-Informationen.

## Admin-Flow
1. `POST /api/payments/connect/onboard`
2. Connected Account anlegen oder wiederverwenden
3. Account-Link erzeugen
4. Admin zu Stripe weiterleiten
5. Rueckkehr zu Klarando ueber `STRIPE_CONNECT_RETURN_URL`
6. Status ueber `GET /api/payments/connect/status` abrufen

## Statusfelder
- `stripeAccountId`
- `stripeOnboarded`
- `stripeChargesEnabled`
- `stripePayoutsEnabled`
- `stripeDetailsSubmitted`
- `stripeRequirementsDue.currentlyDue`
- `stripeRequirementsDue.eventuallyDue`
- `stripeLastStatusSyncAt`

## Webhooks
- `POST /api/payments/webhook`
- Legacy-kompatibel weiter vorhanden: `POST /api/webhooks/stripe`
- Signaturpruefung via `STRIPE_WEBHOOK_SECRET`
- Wichtige Events:
  - `account.updated`
  - `payment_intent.succeeded`
  - `payment_intent.payment_failed`
  - `charge.refunded`
  - `refund.created`
  - `refund.updated`

## Env-Variablen
- `STRIPE_SECRET_KEY`
- `STRIPE_WEBHOOK_SECRET`
- `STRIPE_CONNECT_RETURN_URL`
- `STRIPE_CONNECT_REFRESH_URL`
- `STRIPE_PLATFORM_FEE_PERCENT`
- `STRIPE_PLATFORM_FEE_FIXED_CENTS`
- `NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY`

## Checkout-Vorbereitung
- PaymentIntent bleibt tenantgebunden mit `transfer_data.destination`.
- Plattformgebuehr wird serverseitig ueber `application_fee_amount` vorbereitet.
- Dieselbe Struktur kann spaeter fuer Checkout Session weiterverwendet werden.
- Tenant-spezifische Provisionen bleiben in `TenantPaymentConfig` anschlussfaehig.

## Testablauf
1. Tenant-Admin oeffnet `/admin/payments`
2. `Stripe-Konto verbinden` klicken
3. Stripe-Onboarding durchlaufen
4. Rueckkehr zu Klarando pruefen
5. `Status aktualisieren` klicken
6. Statusampel und Requirement-Listen pruefen

## Livegang-Checkliste
- Test-Keys durch Live-Keys ersetzen
- Return- und Refresh-URLs pruefen
- Webhook in Stripe auf `/api/payments/webhook` setzen
- `STRIPE_WEBHOOK_SECRET` hinterlegen
- Tenant einmal komplett onboarden
- Zahlungsstatus im Tenant-Admin und Superadmin pruefen
