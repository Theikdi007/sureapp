import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';

part 'stores_repository.freezed.dart';
part 'stores_repository.g.dart';

/// `StoreDto`: a SureStore branch shoppers can visit (Find a Store).
@freezed
abstract class StoreDto with _$StoreDto {
  const factory StoreDto({
    required String code,
    required String name,
    String? address,
    String? city,
    String? phone,
    double? latitude,
    double? longitude,

    /// Set by the API when the call passed `lat`/`lng`.
    String? distance,
    required bool openNow,
    String? hoursToday,
    required bool pickup,
  }) = _StoreDto;

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);
}

extension StoreDtoX on StoreDto {
  bool get hasPosition => latitude != null && longitude != null;

  /// Second line of the store row: address, else city.
  String get addressLine => address ?? city ?? '';
}

/// `GET stores` (public).
abstract interface class StoresRepository {
  /// Sorted by distance when [lat]/[lng] are given.
  Future<List<StoreDto>> stores({double? lat, double? lng});
}

@Riverpod(keepAlive: true)
StoresRepository storesRepository(Ref ref) =>
    ApiStoresRepository(ref.watch(dioProvider));

class ApiStoresRepository implements StoresRepository {
  ApiStoresRepository(this._dio);

  final Dio _dio;

  @override
  Future<List<StoreDto>> stores({double? lat, double? lng}) => apiCall(
    () async {
      final res = await _dio.get<List<dynamic>>(
        'stores',
        queryParameters: {'lat': ?lat, 'lng': ?lng},
      );
      return [
        for (final s in res.data!) StoreDto.fromJson(s as Map<String, dynamic>),
      ];
    },
  );
}
