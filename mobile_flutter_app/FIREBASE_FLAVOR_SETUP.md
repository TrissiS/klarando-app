## Firebase Flavor Setup (Android)

Configured Android package names:

- `com.klarando.customer`
- `com.klarando.orderdesk`
- `com.klarando.driver`
- `com.klarando.display`

Expected Firebase config file locations:

- `android/app/src/customer/google-services.json`
- `android/app/src/orderdesk/google-services.json`
- `android/app/src/driver/google-services.json`
- `android/app/src/display/google-services.json`

Current repository state:

- Present: `android/app/google-services.json` (root, customer package)
- Present: `android/app/src/customer/google-services.json` (copied from root)
- Missing: `android/app/src/orderdesk/google-services.json`
- Missing: `android/app/src/driver/google-services.json`
- Missing: `android/app/src/display/google-services.json`

Firebase Console actions still required:

1. Add Android app `com.klarando.orderdesk` and download its `google-services.json` to:
   `android/app/src/orderdesk/google-services.json`
2. Add Android app `com.klarando.driver` and download its `google-services.json` to:
   `android/app/src/driver/google-services.json`
3. Add Android app `com.klarando.display` and download its `google-services.json` to:
   `android/app/src/display/google-services.json`

Notes:

- Creating Firebase Android apps does **not** make these apps public in Play Store.
- Keep root `android/app/google-services.json` during transition to avoid breaking existing customer builds.
