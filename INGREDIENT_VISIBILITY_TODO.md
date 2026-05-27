# Ingredient Visibility Renderer Wiring

Connected now:
- Customer App: `showInCustomerApp` + `displayNameOverride` + structured nutrition table
  - backend/src/routes/tenant.ts
  - mobile_flutter_app/lib/src/core/klarando_api.dart
  - mobile_flutter_app/lib/src/features/order/order_page.dart
- TV/MenuBoard: `showInMenuBoard` + `displayNameOverride`
  - backend/src/lib/display-runtime-builder.ts
  - backend/src/routes/screen.ts
- OrderDesk/Kitchen catalog feed: `showInOrderDesk` + `displayNameOverride`
  - backend/src/routes/order-terminals.ts

Open follow-up:
- Order/Pickup/Cashier Display ingredient visibility (`showInOrderDisplay`, `showInCashierDisplay`)
  Currently those displays render order queues/modifier snapshots, not product ingredient lists in the same pipeline.
  Needs dedicated mapping in the display/order runtime where ingredient lines are shown.
