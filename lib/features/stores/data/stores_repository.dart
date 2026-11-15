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
    ref.watch(appConfigProvider).isMock
    ? MockStoresRepository()
    : ApiStoresRepository(ref.watch(dioProvider));

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

/// The API doc's two stores plus a closed one so the "Closed" state shows.
class MockStoresRepository implements StoresRepository {
  MockStoresRepository({this.latency = const Duration(milliseconds: 300)});

  final Duration latency;

  @override
  Future<List<StoreDto>> stores({double? lat, double? lng}) async {
    await Future<void>.delayed(latency);
    return const [
      StoreDto(
        code: 'YGN-1',
        name: 'Yangon HQ',
        address: 'No. 15, Pyay Road, Kamayut',
        city: 'Yangon',
        phone: '09 750 066 391',
        latitude: 16.8216,
        longitude: 96.135,
        openNow: true,
        hoursToday: '09:00 – 21:00',
        pickup: true,
      ),
      StoreDto(
        code: 'YGN-2',
        name: 'Bogyoke Market',
        city: 'Yangon',
        latitude: 16.7802,
        longitude: 96.1546,
        openNow: true,
        hoursToday: '09:00 – 21:00',
        pickup: true,
      ),
      StoreDto(
        code: 'MDY-1',
        name: 'Mandalay 78th Street',
        address: '78th Street, Chanayethazan',
        city: 'Mandalay',
        latitude: 21.9747,
        longitude: 96.0836,
        openNow: false,
        hoursToday: 'Closed today',
        pickup: false,
      ),
    ];
  }
}
