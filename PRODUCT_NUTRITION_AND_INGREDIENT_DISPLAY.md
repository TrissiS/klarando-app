# Product Nutrition And Ingredient Display Verification

Date: 2026-05-28

## Scope
- Structured nutrition editor persistence
- Ingredient `displayNameOverride` persistence and rendering
- Ingredient visibility flags per channel
- Renderer/API wiring checks after implementation

## 1) Admin Verification
Status: **Implemented (code-level verified)**

- Product editor has structured nutrition fields and keeps legacy `nutritionInfo`.
- Product ingredient relation supports:
  - `displayNameOverride`
  - `showInCustomerApp`
  - `showInOrderDisplay`
  - `showInMenuBoard`
  - `showInOrderDesk`
  - `showInCashierDisplay`
- Save/reload persistence is implemented in backend product routes and Prisma relation fields.

Notes:
- This pass was a targeted technical verification; no manual browser click-test was executed in this step.

## 2) API Contract Verification
Status: **Implemented**

- Product payload contains structured `nutrition` and legacy `nutritionInfo`.
- Tenant catalog mapping includes ingredient visibility flags and `displayNameOverride`.
- Customer-facing ingredient mapping filters by `showInCustomerApp` and prefers override text.

Relevant files:
- `backend/src/routes/products.ts`
- `backend/src/routes/tenant.ts`

## 3) Customer-App Rendering Verification
Status: **Implemented**

- Ingredient display uses override text when present.
- Structured nutrition renders as a readable table block.
- Empty nutrition/details sections are hidden.
- Allergen/additive superscripts and legend logic is present.

Relevant files:
- `mobile_flutter_app/lib/src/core/klarando_api.dart`
- `mobile_flutter_app/lib/src/features/order/order_page.dart`

## 4) Display/Terminal Rendering Verification
Status: **Partially implemented**

- TV/MenuBoard runtime filters ingredients by `showInMenuBoard` and uses override text.
- OrderDesk/terminal product feed filters ingredients by `showInOrderDesk` and uses override text.

Open items:
- `showInOrderDisplay` and `showInCashierDisplay` are persisted and exposed but not yet fully wired into dedicated pickup/cashier renderer pipelines end-to-end.

Relevant files:
- `backend/src/lib/display-runtime-builder.ts`
- `backend/src/routes/screen.ts`
- `backend/src/routes/order-terminals.ts`

## 5) Migration & Prisma Consistency
Status: **Checked**

- Uncommitted migration exists:
  - `backend/prisma/migrations/20260528093000_add_product_structured_nutrition/`
- Prisma checks executed in backend directory:
  - `npx prisma validate --schema prisma/schema.prisma` ✅
  - `npx prisma generate --schema prisma/schema.prisma` ✅

## 6) Build / Typecheck
- `npm --prefix backend run typecheck` ✅
- `npm run build` ✅

## 7) Commit Chain
- `c82112f` Add visible structured nutrition editor to admin products
- `fbab101` Add product ingredient display name override
- `f35a370` Add ingredient visibility flags per output channel
- `a7298e9` Connect product ingredient visibility and nutrition rendering

## 8) Deploy Readiness
Status: **Mostly deploy-ready for implemented scope**

Ready:
- Nutrition editor + persistence
- Customer rendering for nutrition + ingredient override/visibility
- MenuBoard and OrderDesk ingredient visibility wiring

Still open before full channel-complete claim:
- Final end-to-end renderer usage for `showInOrderDisplay` and `showInCashierDisplay` in pickup/cashier display surfaces.
