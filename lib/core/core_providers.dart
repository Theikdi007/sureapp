import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'config/app_config.dart';
import 'network/interceptors.dart';
import 'platform/device_caps.dart';
import 'storage/app_prefs.dart';
import 'storage/token_storage.dart';

part 'core_providers.g.dart';

/// Overridden in `main()` with the value read before `runApp`.
@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) => throw UnimplementedError('override in main');

/// Overridden in `main()` with the value read before `runApp`.
@Riverpod(keepAlive: true)
DeviceCaps deviceCaps(Ref ref) => throw UnimplementedError('override in main');

/// Live iOS Reduce Transparency setting (starts with the launch value).
@Riverpod(keepAlive: true)
Stream<bool> reduceTransparency(Ref ref) async* {
  yield ref.watch(deviceCapsProvider).reduceTransparency;
  yield* DeviceCaps.reduceTransparencyChanges;
}

/// `Accept-Language` value: `en` now, `my` is reserved by the API.
@Riverpod(keepAlive: true)
class AppLanguage extends _$AppLanguage {
  @override
  String build() => 'en';

  void set(String code) => state = code;
}

@Riverpod(keepAlive: true)
TokenStorage tokenStorage(Ref ref) => TokenStorage();

/// Bumped when the session ends (refresh failed / signed out remotely). The
/// router listens to it and sends the user to sign-in.
@Riverpod(keepAlive: true)
class SessionEnded extends _$SessionEnded {
  @override
  int build() => 0;

  void signal() => state++;
}

/// Set when any call answers `410 mobile.update_required`.
@Riverpod(keepAlive: true)
class UpdateRequired extends _$UpdateRequired {
  @override
  bool build() => false;

  void signal() => state = true;
}

@Riverpod(keepAlive: true)
AppPrefs appPrefs(Ref ref) => AppPrefs();

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final config = ref.watch(appConfigProvider);
  final caps = ref.watch(deviceCapsProvider);

  Dio build() {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.apiRoot,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dio.interceptors.add(
      AppHeadersInterceptor(
        appVersion: caps.appVersion,
        platform: caps.platform,
        deviceName: caps.deviceName,
        languageCode: () => ref.read(appLanguageProvider),
      ),
    );
    dio.interceptors.add(
      UpdateRequiredInterceptor(
        () => ref.read(updateRequiredProvider.notifier).signal(),
      ),
    );
    return dio;
  }

  final dio = build();
  dio.interceptors.add(
    AuthInterceptor(
      plainDio: build(),
      tokens: ref.watch(tokenStorageProvider),
      onSessionEnded: () => ref.read(sessionEndedProvider.notifier).signal(),
    ),
  );
  return dio;
}
