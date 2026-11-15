/// Build-time configuration from `--dart-define`.
///
///   flutter run --dart-define=FLAVOR=staging --dart-define=API_BASE_URL=https://…
enum AppFlavor { mock, staging, prod }

class AppConfig {
  const AppConfig({required this.flavor, required this.apiBaseUrl});

  factory AppConfig.fromEnvironment() {
    const flavorName = String.fromEnvironment('FLAVOR', defaultValue: 'mock');
    const baseUrl = String.fromEnvironment('API_BASE_URL');
    final flavor = AppFlavor.values.firstWhere(
      (f) => f.name == flavorName,
      orElse: () => AppFlavor.mock,
    );
    if (flavor != AppFlavor.mock && baseUrl.isEmpty) {
      throw StateError('API_BASE_URL is required for FLAVOR=${flavor.name}');
    }
    return AppConfig(flavor: flavor, apiBaseUrl: baseUrl);
  }

  final AppFlavor flavor;

  /// Host only, e.g. `https://api.surestore.app`. Empty in mock.
  final String apiBaseUrl;

  static const apiBasePath = '/api/mobile/v1';

  bool get isMock => flavor == AppFlavor.mock;

  String get apiRoot => '$apiBaseUrl$apiBasePath/';
}
