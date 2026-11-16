import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import 'app_config_dto.dart';

part 'app_config_repository.g.dart';

abstract interface class AppConfigRepository {
  Future<AppConfigDto> fetch();
}

@Riverpod(keepAlive: true)
AppConfigRepository appConfigRepository(Ref ref) =>
    ApiAppConfigRepository(ref.watch(dioProvider));

/// Loaded once at launch; the splash screen waits for it.
@Riverpod(keepAlive: true)
Future<AppConfigDto> remoteAppConfig(Ref ref) =>
    ref.watch(appConfigRepositoryProvider).fetch();

class ApiAppConfigRepository implements AppConfigRepository {
  ApiAppConfigRepository(this._dio);

  final Dio _dio;

  @override
  Future<AppConfigDto> fetch() => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'app-config',
      options: Options(extra: {RequestFlags.skipAuth: true}),
    );
    return AppConfigDto.fromJson(res.data!);
  });
}
