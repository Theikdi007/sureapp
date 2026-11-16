#!/usr/bin/env bash
# Store builds of Sure (Play App Bundle and App Store IPA).
#
#   tool/release/build.sh            # both
#   tool/release/build.sh android    # build/app/outputs/bundle/release/app-release.aab
#   tool/release/build.sh ios        # build/ios/ipa/*.ipa
#
# Server: FLAVOR=staging (default, the Yammobots test server) or
#   FLAVOR=prod API_BASE_URL=https://… tool/release/build.sh
# Version: the `version:` line of pubspec.yaml (name+build). Both numbers
# must be higher than the live Sure Benefits app.
set -euo pipefail
cd "$(dirname "$0")/../.."

target="${1:-all}"
flavor="${FLAVOR:-staging}"
case "$flavor" in
  staging) api="${API_BASE_URL:-https://surestoremobileapi.yammobots.com}" ;;
  prod)
    api="${API_BASE_URL:-}"
    [ -n "$api" ] || { echo "FLAVOR=prod needs API_BASE_URL" >&2; exit 1; } ;;
  *) echo "FLAVOR must be staging or prod" >&2; exit 1 ;;
esac

version="$(sed -n 's/^version: *//p' pubspec.yaml)"
symbols="build/symbols/$version"
args=(
  --release
  --obfuscate --split-debug-info="$symbols"
  --dart-define=FLAVOR="$flavor"
  --dart-define=API_BASE_URL="$api"
)

echo "Sure $version · $flavor · $api"
if [ -n "$(git status --porcelain)" ]; then
  echo "warning: uncommitted changes are included in this build" >&2
fi

flutter pub get
flutter analyze
flutter test --exclude-tags live

if [ "$target" = all ] || [ "$target" = android ]; then
  [ -f android/key.properties ] || {
    echo "android/key.properties missing: a store bundle must be signed" \
      "with the Sure Benefits upload key (see docs/release.md)" >&2
    exit 1
  }
  flutter build appbundle "${args[@]}"
fi

if [ "$target" = all ] || [ "$target" = ios ]; then
  flutter build ipa "${args[@]}" --export-options-plist=ios/ExportOptions.plist
fi

echo "Done. Keep $symbols: it turns obfuscated crash stacks back into code."
