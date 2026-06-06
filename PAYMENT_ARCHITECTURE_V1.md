# Payment Architecture V1

## Stripe Connect Modell
- Klarando verwendet Stripe Connect Express pro Tenant.
- Jeder Tenant besitzt genau eine Stripe-Konto-Zuordnung in `TenantPaymentConfig`.
- Die Einrichtung bleibt im Tenant-Admin unter `/admin/payments`.
- Der Superadmin sieht nur Status, Aktivierung und Sync-Informationen.

## Admin-Flow
1. `POST /api/stripe/connect/account` oder legacy `POST /api/payments/connect/onboard`
2. Connected Account anlegen oder bestehenden Account wiederverwenden
3. `POST /api/stripe/connect/onboarding-link` oder legacy `POST /api/payments/connect/refresh`
4. Admin zu Stripe weiterleiten
5. Rueckkehr zu Klarando ueber `STRIPE_CONNECT_RETURN_URL`
6. Status ueber `GET /api/stripe/connect/status` oder legacy `GET /api/payments/connect/status` abrufen
7. Optionales Express-Login via `POST /api/payments/connect/dashboard-link`

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
- `STRIPE_CHECKOUT_BASE_URL`
- `NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY`

## Checkout-Vorbereitung
- `POST /api/payments/stripe/payment-intent` erzeugt tenantgebundene PaymentIntents.
- Die Bestellung muss bereits mit `paymentMethod=STRIPE` angelegt worden sein.
- PaymentIntent bleibt tenantgebunden mit `transfer_data.destination`.
- Plattformgebuehr wird serverseitig ueber `application_fee_amount` vorbereitet.
- Fuer bestehende Kunden-Clients bleibt Stripe Checkout Session unter `POST /api/payments/checkout-session` kompatibel.
- Bestellungen werden erst ueber den Stripe-Webhook auf `PAID` gesetzt.
- Admin-UI zeigt deutlich an, ob Stripe im Testmodus oder Live-Modus laeuft.

## Testablauf
1. Tenant-Admin oeffnet `/admin/payments`
2. `Stripe einrichten` klicken
3. Stripe-Onboarding durchlaufen
4. Rueckkehr zu Klarando pruefen
5. `Status aktualisieren` klicken
6. Testmodus-Hinweis, Statusampel und Requirement-Listen pruefen
7. Optional `Stripe Dashboard oeffnen` pruefen

## Livegang-Checkliste
- Test-Keys durch Live-Keys ersetzen
- Return- und Refresh-URLs pruefen
- Webhook in Stripe auf `/api/payments/webhook` setzen
- `STRIPE_WEBHOOK_SECRET` hinterlegen
- Tenant einmal komplett onboarden
- Zahlungsstatus im Tenant-Admin und Superadmin pruefen
