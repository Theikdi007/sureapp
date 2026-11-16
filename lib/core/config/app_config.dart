/// Build-time configuration from `--dart-define`.
///
///   flutter run                                   # staging test server
///   flutter run --dart-define=FLAVOR=prod --dart-define=API_BASE_URL=https://…
///
/// The app always talks to the real Sure App API. Test stand-ins live only
/// under `test/support/mocks` and are injected with provider overrides.
enum AppFlavor { staging, prod }

class AppConfig {
  const AppConfig({required this.flavor, required this.apiBaseUrl});

  /// The Yammobots test server (Sure App API).
  static const stagingBaseUrl = 'https://surestoremobileapi.yammobots.com';

  factory AppConfig.fromEnvironment() {
    const flavorName = String.fromEnvironment(
      'FLAVOR',
      defaultValue: 'staging',
    );
    const baseUrl = String.fromEnvironment('API_BASE_URL');
    final flavor = AppFlavor.values.firstWhere(
      (f) => f.name == flavorName,
      orElse: () => throw StateError('Unknown FLAVOR=$flavorName'),
    );
    if (flavor == AppFlavor.prod && baseUrl.isEmpty) {
      throw StateError('API_BASE_URL is required for FLAVOR=prod');
    }
    return AppConfig(
      flavor: flavor,
      apiBaseUrl: baseUrl.isEmpty ? stagingBaseUrl : baseUrl,
    );
  }

  final AppFlavor flavor;

  /// Host only, e.g. `https://surestoremobileapi.yammobots.com`.
  final String apiBaseUrl;

  static const apiBasePath = '/api/mobile/v1';

  String get apiRoot => '$apiBaseUrl$apiBasePath/';
}
