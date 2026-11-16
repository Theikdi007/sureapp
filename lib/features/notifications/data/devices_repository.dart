import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';

part 'devices_repository.g.dart';

/// Push tokens (API doc → "Notifications and push"). The API saves the token
/// and registers it with iSure, which sends loyalty pushes itself.
abstract interface class DevicesRepository {
  /// `POST devices`: after sign-in and whenever FCM gives a new token.
  /// [platform] is `ios` or `android`.
  Future<void> register({required String token, required String platform});

  /// `DELETE devices/{token}`: on sign-out.
  Future<void> unregister(String token);
}

@Riverpod(keepAlive: true)
DevicesRepository devicesRepository(Ref ref) =>
    ApiDevicesRepository(ref.watch(dioProvider));

class ApiDevicesRepository implements DevicesRepository {
  ApiDevicesRepository(this._dio);

  final Dio _dio;

  @override
  Future<void> register({required String token, required String platform}) =>
      apiCall(
        () => _dio.post<void>(
          'devices',
          data: {'token': token, 'platform': platform},
        ),
      );

  @override
  Future<void> unregister(String token) =>
      apiCall(() => _dio.delete<void>('devices/${Uri.encodeComponent(token)}'));
}
