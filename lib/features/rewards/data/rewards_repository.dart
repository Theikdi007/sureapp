import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';
import 'rewards_dtos.dart';

part 'rewards_repository.g.dart';

abstract interface class RewardsRepository {
  Future<RewardsHomeDto> home();

  /// Every reward (or the featured ones), paged.
  Future<Page<RewardCardDto>> rewards({bool featured = false, String? cursor});
  Future<RewardDetailDto> reward(String id);
  Future<ShopCheckDto> checkShop(String id, String shopCode);

  /// Idempotency-Key required. `method`: code | shop | direct | delivery.
  Future<RewardClaimDto> claim(
    String id, {
    required String method,
    String? shopCode,
    String? addressId,
    required IdempotencyKey key,
  });
  Future<Page<MemberBenefitDto>> memberBenefits({String? cursor});

  /// One member coupon with its terms and shops.
  Future<MemberBenefitDto> memberBenefit(String id);
}

@Riverpod(keepAlive: true)
RewardsRepository rewardsRepository(Ref ref) =>
    ApiRewardsRepository(ref.watch(dioProvider));

class ApiRewardsRepository implements RewardsRepository {
  ApiRewardsRepository(this._dio);

  final Dio _dio;

  String _id(String id) => Uri.encodeComponent(id);

  @override
  Future<RewardsHomeDto> home() => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>('rewards/home');
    return RewardsHomeDto.fromJson(res.data!);
  });

  @override
  Future<Page<RewardCardDto>> rewards({
    bool featured = false,
    String? cursor,
  }) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'rewards',
      queryParameters: {if (featured) 'featured': true, 'cursor': ?cursor},
    );
    return Page.fromJson(res.data!, RewardCardDto.fromJson);
  });

  @override
  Future<RewardDetailDto> reward(String id) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>('rewards/${_id(id)}');
    return RewardDetailDto.fromJson(res.data!);
  });

  @override
  Future<ShopCheckDto> checkShop(String id, String shopCode) =>
      apiCall(() async {
        final res = await _dio.get<Map<String, dynamic>>(
          'rewards/${_id(id)}/shops/${_id(shopCode)}',
        );
        return ShopCheckDto.fromJson(res.data!);
      });

  @override
  Future<RewardClaimDto> claim(
    String id, {
    required String method,
    String? shopCode,
    String? addressId,
    required IdempotencyKey key,
  }) => apiCall(() async {
    final res = await _dio.post<Map<String, dynamic>>(
      'rewards/${_id(id)}/claim',
      data: {'method': method, 'shopCode': ?shopCode, 'addressId': ?addressId},
      options: key.options,
    );
    return RewardClaimDto.fromJson(res.data!);
  });

  @override
  Future<Page<MemberBenefitDto>> memberBenefits({String? cursor}) =>
      apiCall(() async {
        final res = await _dio.get<Map<String, dynamic>>(
          'rewards/member-benefits',
          queryParameters: {'cursor': ?cursor},
        );
        return Page.fromJson(res.data!, MemberBenefitDto.fromJson);
      });

  @override
  Future<MemberBenefitDto> memberBenefit(String id) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'rewards/member-benefits/${_id(id)}',
    );
    return MemberBenefitDto.fromJson(res.data!);
  });
}
