# Release builds

Sure ships as an **update to the Sure Benefits listing** on Google Play and
the App Store, so the app ids, signing key and Apple team are the Sure
Benefits ones.

| | Android | iOS |
|---|---|---|
| App id | `com.isuremyanmar.surebenefits` | `com.isuremyanmar.surebenefits.uat` (UAT, TestFlight) |
| Name on the home screen | Sure | Sure |
| Signing | Sure Benefits upload key, `android/key.properties` | Team `QRAHT2PGD4`, automatic signing |
| Output | `build/app/outputs/bundle/release/app-release.aab` | `build/ios/ipa/*.ipa` |

## Build

```sh
tool/release/build.sh            # Android and iOS
tool/release/build.sh android
tool/release/build.sh ios
```

The script runs `flutter analyze` and the unit tests first, then builds with
`--obfuscate --split-debug-info=build/symbols/<version>`. **Archive that
symbols folder for every store build**: crash stacks from an obfuscated build
can only be read with it (`flutter symbolize`).

Server: the default is `FLAVOR=staging` (the Yammobots test server). Once the
production URL is published:

```sh
FLAVOR=prod API_BASE_URL=https://… tool/release/build.sh
```

## Before every store build

1. **Version** in `pubspec.yaml` (`version: <name>+<build>`): both numbers
   must be higher than the live Sure Benefits app (Play versionCode, App
   Store build number), and `<name>` at least the API's `minimumVersion`
   (`GET app-config`).
2. **Android key**: `android/key.properties` pointing at the Sure Benefits
   upload keystore (never commit either file):
   ```properties
   storeFile=/absolute/path/to/upload-keystore.jks
   storePassword=…
   keyAlias=upload
   keyPassword=…
   ```
   Without it the script stops; a plain `flutter build appbundle` would be
   debug-signed and Play rejects it.
3. **Apple account**: Xcode › Settings › Accounts must have an Apple ID in
   team `QRAHT2PGD4`.
4. **Push**: the App ID `com.isuremyanmar.surebenefits.uat` needs the Push
   Notifications capability (Apple Developer › Identifiers), and the APNs key
   must be uploaded in the Firebase console (project `surebenefits-2fabd`).
   Until then iOS signing fails on the `aps-environment` entitlement.

## Later: the live App Store id

Updating the live Sure Benefits App Store app needs its own bundle id
(probably without `.uat`), that app's `GoogleService-Info.plist`, and its
Firebase iOS app id in `lib/core/push/firebase_options.dart`.

## Upload

- Android: Play Console › Internal testing › Create release › upload the
  `.aab`.
- iOS: `xcrun altool --upload-app -f build/ios/ipa/*.ipa -t ios` with an App
  Store Connect API key, or open the archive in Xcode › Organizer ›
  Distribute App; then add testers in TestFlight.
