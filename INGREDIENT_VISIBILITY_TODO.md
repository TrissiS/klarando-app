# Ingredient Visibility Flags TODO

Implemented dataflow:
- Customer App: `showInCustomerApp` is applied in `backend/src/routes/tenant.ts`.
- TV/MenuBoard: `showInMenuBoard` is applied in `backend/src/lib/display-runtime-builder.ts`.

Prepared but not yet fully wired in renderers:
- `showInOrderDisplay`
- `showInOrderDesk`
- `showInCashierDisplay`

These flags are already persisted in `ProductIngredient` and editable in Admin.
Next step is to thread the flags into the specific Order Display / OrderDesk / Cashier runtime payloads and render filters.
