import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Small app flags that must survive restarts.
class AppPrefs {
  AppPrefs([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _onboardingDoneKey = 'app.onboarding_done';

  Future<bool> onboardingDone() async =>
      await _storage.read(key: _onboardingDoneKey) == 'true';

  Future<void> setOnboardingDone() =>
      _storage.write(key: _onboardingDoneKey, value: 'true');

  static const _themeModeKey = 'app.theme_mode';
  static const _appLockKey = 'app.app_lock';

  /// `light`, `dark`, or null to follow the system.
  Future<String?> themeMode() => _storage.read(key: _themeModeKey);

  Future<void> setThemeMode(String? mode) => mode == null
      ? _storage.delete(key: _themeModeKey)
      : _storage.write(key: _themeModeKey, value: mode);

  Future<bool> appLockEnabled() async =>
      await _storage.read(key: _appLockKey) == 'true';

  Future<void> setAppLockEnabled(bool on) => on
      ? _storage.write(key: _appLockKey, value: 'true')
      : _storage.delete(key: _appLockKey);
}
