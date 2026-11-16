import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';
import '../../catalog/data/catalog_dtos.dart';
import 'home_dtos.dart';

part 'home_repository.g.dart';

/// Home tab: `GET home`, `GET products/feed`.
abstract interface class HomeRepository {
  Future<HomeDto> home();
  Future<Page<ProductCardDto>> feed({String? cursor, int limit = 10});
}

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) =>
    ApiHomeRepository(ref.watch(dioProvider));

class ApiHomeRepository implements HomeRepository {
  ApiHomeRepository(this._dio);

  final Dio _dio;

  @override
  Future<HomeDto> home() => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>('home');
    return HomeDto.fromJson(res.data!);
  });

  @override
  Future<Page<ProductCardDto>> feed({String? cursor, int limit = 10}) =>
      apiCall(() async {
        final res = await _dio.get<Map<String, dynamic>>(
          'products/feed',
          queryParameters: {'cursor': ?cursor, 'limit': limit},
        );
        return Page.fromJson(res.data!, ProductCardDto.fromJson);
      });
}
