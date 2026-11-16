import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';
import 'loyalty_dtos.dart';

part 'loyalty_repository.freezed.dart';
part 'loyalty_repository.g.dart';

/// `GET loyalty/summary`: points card, rewards header, tier progress.
@freezed
abstract class LoyaltySummaryDto with _$LoyaltySummaryDto {
  const factory LoyaltySummaryDto({
    required int points,
    @Default(0) int earnedThisMonth,
    int? expiringPoints,
    String? expiringOn,
    required num equivalentMmk,
    required String tier,
    required String tierLabel,
    required int clubScore,
    String? nextTier,
    String? nextTierLabel,
    int? nextTierThreshold,
    @Default(0) int progressPercent,
    int? dailyRedeemLimit,
    required num earnRatePer100Ks,
  }) = _LoyaltySummaryDto;

  factory LoyaltySummaryDto.fromJson(Map<String, dynamic> json) =>
      _$LoyaltySummaryDtoFromJson(json);
}

/// Points history filter (`GET loyalty/points?filter=`).
enum PointsFilter { all, expireSoon, expired }

abstract interface class LoyaltyRepository {
  Future<LoyaltySummaryDto> summary();
  Future<TierBenefitsDto> tiers();
  Future<Page<PointEntryDto>> points({
    PointsFilter filter = PointsFilter.all,
    String? cursor,
  });
  Future<PointDetailDto> pointDetail(String transactionId);
  Future<Page<PointEntryDto>> clubScores({String? cursor});
  Future<TransferPreviewDto> transferPreview({
    required String phone,
    required int amount,
  });

  /// Idempotency-Key required.
  Future<TransferResultDto> transfer({
    required String phone,
    required int amount,
    String? note,
    required IdempotencyKey key,
  });
  Future<TopupCodeDto> topupCheck(String code);

  /// Idempotency-Key required.
  Future<TopupCodeDto> topupRedeem(String code, {required IdempotencyKey key});
  Future<MemberQrDto> memberQr();
  Future<List<CounterRequestDto>> counterRequests();

  /// Idempotency-Key required.
  Future<CounterResultDto> counterConfirm({
    required String code,
    required String password,
    required IdempotencyKey key,
  });
}

@Riverpod(keepAlive: true)
LoyaltyRepository loyaltyRepository(Ref ref) =>
    ApiLoyaltyRepository(ref.watch(dioProvider));

/// Signed-in member's points and tier.
@riverpod
Future<LoyaltySummaryDto> loyaltySummary(Ref ref) =>
    ref.watch(loyaltyRepositoryProvider).summary();

class ApiLoyaltyRepository implements LoyaltyRepository {
  ApiLoyaltyRepository(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> _get(String path, [Map<String, dynamic>? q]) =>
      _dio
          .get<Map<String, dynamic>>(path, queryParameters: q)
          .then((r) => r.data!);

  Future<Map<String, dynamic>> _post(
    String path,
    Object body, [
    IdempotencyKey? key,
  ]) => _dio
      .post<Map<String, dynamic>>(path, data: body, options: key?.options)
      .then((r) => r.data!);

  @override
  Future<LoyaltySummaryDto> summary() => apiCall(
    () async => LoyaltySummaryDto.fromJson(await _get('loyalty/summary')),
  );

  @override
  Future<TierBenefitsDto> tiers() => apiCall(
    () async => TierBenefitsDto.fromJson(await _get('loyalty/tiers')),
  );

  @override
  Future<Page<PointEntryDto>> points({
    PointsFilter filter = PointsFilter.all,
    String? cursor,
  }) => apiCall(() async {
    final f = switch (filter) {
      PointsFilter.all => null,
      PointsFilter.expireSoon => 'expire_soon',
      PointsFilter.expired => 'expired',
    };
    return Page.fromJson(
      await _get('loyalty/points', {'filter': ?f, 'cursor': ?cursor}),
      PointEntryDto.fromJson,
    );
  });

  @override
  Future<PointDetailDto> pointDetail(String transactionId) => apiCall(
    () async => PointDetailDto.fromJson(
      await _get('loyalty/points/${Uri.encodeComponent(transactionId)}'),
    ),
  );

  @override
  Future<Page<PointEntryDto>> clubScores({String? cursor}) => apiCall(
    () async => Page.fromJson(
      await _get('loyalty/club-scores', {'cursor': ?cursor}),
      PointEntryDto.fromJson,
    ),
  );

  @override
  Future<TransferPreviewDto> transferPreview({
    required String phone,
    required int amount,
  }) => apiCall(
    () async => TransferPreviewDto.fromJson(
      await _post('loyalty/transfers/preview', {
        'phone': phone,
        'amount': amount,
      }),
    ),
  );

  @override
  Future<TransferResultDto> transfer({
    required String phone,
    required int amount,
    String? note,
    required IdempotencyKey key,
  }) => apiCall(
    () async => TransferResultDto.fromJson(
      await _post('loyalty/transfers', {
        'phone': phone,
        'amount': amount,
        'note': ?note,
      }, key),
    ),
  );

  @override
  Future<TopupCodeDto> topupCheck(String code) => apiCall(
    () async => TopupCodeDto.fromJson(
      await _post('loyalty/topup-codes/check', {'code': code}),
    ),
  );

  @override
  Future<TopupCodeDto> topupRedeem(
    String code, {
    required IdempotencyKey key,
  }) => apiCall(
    () async => TopupCodeDto.fromJson(
      await _post('loyalty/topup-codes/redeem', {'code': code}, key),
    ),
  );

  @override
  Future<MemberQrDto> memberQr() => apiCall(
    () async => MemberQrDto.fromJson(await _get('loyalty/member-qr')),
  );

  @override
  Future<List<CounterRequestDto>> counterRequests() => apiCall(() async {
    final res = await _dio.get<List<dynamic>>('loyalty/counter-requests');
    return [
      for (final r in res.data!)
        CounterRequestDto.fromJson(r as Map<String, dynamic>),
    ];
  });

  @override
  Future<CounterResultDto> counterConfirm({
    required String code,
    required String password,
    required IdempotencyKey key,
  }) => apiCall(
    () async => CounterResultDto.fromJson(
      await _post('loyalty/counter-requests/confirm', {
        'code': code,
        'password': password,
      }, key),
    ),
  );
}
