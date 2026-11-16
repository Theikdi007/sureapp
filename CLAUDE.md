# Sure App (Flutter)

SureStore shopping + iSure loyalty app for Android and iOS. Package `sure_app`, app id `com.isuremyanmar.surebenefits` (Android) and bundle id `com.isuremyanmar.surebenefits.uat` (iOS), matching the Firebase project `surebenefits-2fabd` (`android/app/google-services.json`, `ios/Runner/GoogleService-Info.plist`).

## Sources of truth
- **API:** `design-ref/api/sure-app-api.html` (Sure App API v1, base path `/api/mobile/v1`). Live: https://claude.ai/artifact/K5qum6hBb3ojjtXh1XHsM3
  - The "Screens → calls" section lists which endpoints each screen uses. Follow it.
  - "Not in this release" lists features we must NOT build (QR/bank payment, points at checkout, live chat, rider map, phone change, account deletion, saved cards).
- **Design:** `design-ref/prototype/` (React prototype + `SureStoreDesignSystem`). Live: https://claude.ai/artifact/JHDDxhkuAFoFYpk8PL3NDg
  - `tokens-extracted.css`: every CSS token (brand: `sure-neon #A0F04B`, `sure-dark-green #14372D`, `sure-ink #14161B`, `sure-fresh #73D755`).
  - `unpacked/design-system.bundle.js`: component source (core / forms / navigation / commerce).
  - `unpacked/prototype-app.html`: screens (HomeScreen, ProductDetailScreen, OrdersScreen, AdsScreen, CartSheet …).
  - Fonts: the prototype renders **Outfit** (weight ≥ 700 at ≥ 18 px: headings, numbers) and **IBM Plex Sans** (everything else). Both are SIL OFL and ship in `assets/fonts` (static cuts from Google Fonts; rule in `SureTypography.familyFor`). The KH Teka / KH Interference files in `unpacked/` are commercial (Kurppa Hosk): do not ship them without a license.
- `design-ref/` is reference data only: never import it from app code.

## Stack
Riverpod 3 (`riverpod_annotation` + `riverpod_generator`), go_router (ShellRoute for tabs), dio, freezed + json_serializable, flutter_secure_storage, cached_network_image.
Codegen: `dart run build_runner build -d`.

## Layout
- `lib/core/` config (flavors), network (dio + interceptors), storage, router, utils
- `lib/design_system/` tokens, theme (light/dark ThemeExtension), glass, adaptive, components
- `lib/features/<feature>/{data,domain,presentation}`
- `lib/shared/` cross-feature models/widgets

## API rules (from the API doc)
- Headers: `X-App-Version`, `X-Platform` (ios|android), `X-Device-Name` on sign-in, `Accept-Language` (en, my).
- Auth: access token 15 min, refresh 30 days. On 401 `mobile.unauthenticated` → `POST auth/refresh`, store BOTH new tokens, retry once.
- `Idempotency-Key: <uuid>` on writes that create something or move points; one key per user action, reused on its retries.
- Money is `{value, currency}`. **Never compute money in the app**: all totals come from the API. Points are ints.
- Timestamps are UTC ISO 8601; display in Myanmar time (UTC+06:30).
- Lists: `?cursor=&limit=` → `{items, nextCursor}`; `nextCursor == null` means last page.
- Missing optional fields = null.

## Environments
Test server (Yammobots): `API_BASE_URL=https://surestoremobileapi.yammobots.com` (serves `/api/mobile/v1`; Swagger UI at `/swagger/index.html`, Scalar at `/scalar/v1`, spec at `/openapi/v1.json`. Response bodies are untyped in the spec, so check DTOs against live responses). Prod URL not published yet. `surestoreapi.yammobots.com` (SureStore shop system) and `test-surebenefitsadmin.yammobots.com` (iSure admin web panel) are backend systems: the app never calls them. Every repository has an interface with a `Mock…` impl (data from the API doc's JSON examples) and an `Api…` impl.
Flavor/base URL come from `--dart-define=FLAVOR=mock|staging|prod --dart-define=API_BASE_URL=...`. Default is `mock`.

## UI requirements
- **Liquid Glass:** use only `GlassSurface` (design_system/glass). It picks one of three tiers: shader glass on iOS 26+ capable devices, `BackdropFilter` frosted glass elsewhere, solid when performance is low or Reduce Transparency is on. Keep text contrast readable.
- **Responsive:** width classes are compact <600, medium 600–840, expanded >840. Compact → bottom nav. Medium/expanded → navigation rail plus list-detail two-pane.
- **Foldables** (Galaxy Z Fold, Pixel Fold, foldable iPhone): use `MediaQuery.displayFeatures` to find the hinge. Never place content across it. Tabletop posture puts content on top and controls on the bottom. State must survive fold/unfold.
- Respect SafeArea and large text scaling, and support both orientations. Use tokens; no hard-coded colors or sizes.

## Workflow
- Build in the order of the API doc's "Screens → calls" table: auth → home/catalog/product → bag/checkout → orders → rewards/loyalty → support/warranty/repairs → profile/notifications.
- Run `flutter analyze` before calling a task done.
