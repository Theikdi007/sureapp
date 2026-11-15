import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/upload_photo.dart';

export '../../../shared/models/upload_photo.dart';

part 'warranty_repository.freezed.dart';
part 'warranty_repository.g.dart';

/// `WarrantyPlanDto`: a TechVault plan, either an XtraGuard plan from iSure
/// (`xtraguard`) or the shop warranty on a device SureStore sold (`shop`).
/// [id] is `{source}:{serial}:{n}`.
@freezed
abstract class WarrantyPlanDto with _$WarrantyPlanDto {
  const factory WarrantyPlanDto({
    required String id,
    required String source,
    required String planName,
    required String device,
    String? serial,
    String? endsOn,
    required bool active,
    required String expiryText,
    String? policyUrl,
  }) = _WarrantyPlanDto;

  factory WarrantyPlanDto.fromJson(Map<String, dynamic> json) =>
      _$WarrantyPlanDtoFromJson(json);
}

@freezed
abstract class WarrantyCoverDto with _$WarrantyCoverDto {
  const factory WarrantyCoverDto({
    required String name,
    String? description,
    String? policy,
    String? endsOn,
  }) = _WarrantyCoverDto;

  factory WarrantyCoverDto.fromJson(Map<String, dynamic> json) =>
      _$WarrantyCoverDtoFromJson(json);
}

@freezed
abstract class WarrantyPlanDetailDto with _$WarrantyPlanDetailDto {
  const factory WarrantyPlanDetailDto({
    required WarrantyPlanDto plan,
    String? variant,
    @Default([]) List<WarrantyCoverDto> covers,
  }) = _WarrantyPlanDetailDto;

  factory WarrantyPlanDetailDto.fromJson(Map<String, dynamic> json) =>
      _$WarrantyPlanDetailDtoFromJson(json);
}

@freezed
abstract class WarrantyClaimDto with _$WarrantyClaimDto {
  const factory WarrantyClaimDto({
    required String number,
    required String planId,
    required String planName,
    required String device,
    required String description,
    required String status,
    required String statusLabel,
    required String filedAt,
    required String meta,

    /// Set when the claim has a photo; load it with
    /// [WarrantyRepository.claimPhoto] (it needs the bearer token).
    String? photoUrl,
    String? staffNote,
  }) = _WarrantyClaimDto;

  factory WarrantyClaimDto.fromJson(Map<String, dynamic> json) =>
      _$WarrantyClaimDtoFromJson(json);
}

/// TechVault warranty: plans, claims, report a faulty product.
abstract interface class WarrantyRepository {
  Future<List<WarrantyPlanDto>> plans();
  Future<WarrantyPlanDetailDto> plan(String id);
  Future<List<WarrantyClaimDto>> claims();
  Future<WarrantyClaimDto> claim(String number);

  /// Idempotency-Key required; reuse [key] when retrying the same claim.
  Future<WarrantyClaimDto> fileClaim({
    required String planId,
    required String description,
    UploadPhoto? photo,
    required IdempotencyKey key,
  });

  Future<Uint8List> claimPhoto(String number);
}

@Riverpod(keepAlive: true)
WarrantyRepository warrantyRepository(Ref ref) =>
    ref.watch(appConfigProvider).isMock
    ? MockWarrantyRepository()
    : ApiWarrantyRepository(ref.watch(dioProvider));

class ApiWarrantyRepository implements WarrantyRepository {
  ApiWarrantyRepository(this._dio);

  final Dio _dio;

  String _e(String s) => Uri.encodeComponent(s);

  @override
  Future<List<WarrantyPlanDto>> plans() => apiCall(() async {
    final res = await _dio.get<List<dynamic>>('warranty/plans');
    return [
      for (final p in res.data!)
        WarrantyPlanDto.fromJson(p as Map<String, dynamic>),
    ];
  });

  @override
  Future<WarrantyPlanDetailDto> plan(String id) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'warranty/plans/${_e(id)}',
    );
    return WarrantyPlanDetailDto.fromJson(res.data!);
  });

  @override
  Future<List<WarrantyClaimDto>> claims() => apiCall(() async {
    final res = await _dio.get<List<dynamic>>('warranty/claims');
    return [
      for (final c in res.data!)
        WarrantyClaimDto.fromJson(c as Map<String, dynamic>),
    ];
  });

  @override
  Future<WarrantyClaimDto> claim(String number) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'warranty/claims/${_e(number)}',
    );
    return WarrantyClaimDto.fromJson(res.data!);
  });

  @override
  Future<WarrantyClaimDto> fileClaim({
    required String planId,
    required String description,
    UploadPhoto? photo,
    required IdempotencyKey key,
  }) => apiCall(() async {
    final form = FormData.fromMap({
      'planId': planId,
      'description': description,
      if (photo != null)
        'file': await MultipartFile.fromFile(
          photo.path,
          filename: photo.fileName,
          contentType: DioMediaType.parse(photo.mimeType),
        ),
    });
    final res = await _dio.post<Map<String, dynamic>>(
      'warranty/claims',
      data: form,
      options: key.options,
    );
    return WarrantyClaimDto.fromJson(res.data!);
  });

  @override
  Future<Uint8List> claimPhoto(String number) => apiCall(() async {
    final res = await _dio.get<List<int>>(
      'warranty/claims/${_e(number)}/photo',
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(res.data!);
  });
}

/// The API doc's plan plus an active shop warranty; claims filed in this
/// session are kept in memory.
class MockWarrantyRepository implements WarrantyRepository {
  MockWarrantyRepository({this.latency = const Duration(milliseconds: 350)});

  final Duration latency;

  final List<WarrantyClaimDto> _claims = [
    const WarrantyClaimDto(
      number: 'CLM-1024',
      planId: 'shop:356789104455120:0',
      planName: 'SureStore 12-month warranty',
      device: 'Samsung Galaxy A14 128GB',
      description: 'Speaker crackles at high volume during calls.',
      status: 'in_review',
      statusLabel: 'Under review',
      filedAt: '2026-11-10T03:20:00+00:00',
      meta: 'Filed 10 Nov 2026 · Samsung Galaxy A14 128GB',
      staffNote: 'Bring the device to Yangon HQ; we will check it on the spot.',
    ),
  ];
  final Map<String, WarrantyClaimDto> _byKey = {};

  static const _plans = [
    WarrantyPlanDto(
      id: 'shop:356789104455120:0',
      source: 'shop',
      planName: 'SureStore 12-month warranty',
      device: 'Samsung Galaxy A14 128GB',
      serial: '356789104455120',
      endsOn: '2027-03-02',
      active: true,
      expiryText: '109 days left',
    ),
    WarrantyPlanDto(
      id: 'xtraguard:550100168:0',
      source: 'xtraguard',
      planName: 'Isure Power Adapter Warranty',
      device: 'Apple USB-C Power Adapter',
      endsOn: '2026-04-11',
      active: false,
      expiryText: 'Expired 11 Apr 2026',
      policyUrl: 'https://caremestorage.blob.core.windows.net/caremerss/Careme/581941bb-0cf3-4ac8-9ac3-1c5e31e19268.jpeg',
    ),
  ];

  Future<void> _wait() => Future<void>.delayed(latency);

  static ApiException _notFound(String what) => ApiException(
    code: 'mobile.not_found',
    message: "We couldn't find that $what.",
    status: 404,
  );

  WarrantyPlanDto _findPlan(String id) => _plans.firstWhere(
    (p) => p.id == id,
    orElse: () => throw const ApiException(
      code: 'mobile.plan_not_found',
      message: "That warranty plan isn't on your account.",
      status: 404,
    ),
  );

  @override
  Future<List<WarrantyPlanDto>> plans() async {
    await _wait();
    return _plans;
  }

  @override
  Future<WarrantyPlanDetailDto> plan(String id) async {
    await _wait();
    final plan = _findPlan(id);
    return WarrantyPlanDetailDto(
      plan: plan,
      variant: plan.source == 'shop' ? '128GB · Black' : null,
      covers: plan.source == 'shop'
          ? const [
              WarrantyCoverDto(
                name: 'Manufacturing defects',
                description: 'Parts and labour at any SureStore service desk.',
                endsOn: '2027-03-02',
              ),
              WarrantyCoverDto(
                name: 'Battery',
                description: 'Replaced if capacity drops below 80%.',
                endsOn: '2026-09-02',
              ),
            ]
          : const [
              WarrantyCoverDto(
                name: 'Accidental damage',
                description: 'One repair or replacement.',
                policy: 'XtraGuard terms',
                endsOn: '2026-04-11',
              ),
            ],
    );
  }

  @override
  Future<List<WarrantyClaimDto>> claims() async {
    await _wait();
    return List.unmodifiable(_claims);
  }

  @override
  Future<WarrantyClaimDto> claim(String number) async {
    await _wait();
    return _claims.firstWhere(
      (c) => c.number == number,
      orElse: () => throw _notFound('claim'),
    );
  }

  @override
  Future<WarrantyClaimDto> fileClaim({
    required String planId,
    required String description,
    UploadPhoto? photo,
    required IdempotencyKey key,
  }) async {
    await _wait();
    if (_byKey[key.value] case final done?) return done;
    final plan = _findPlan(planId);
    if (!plan.active) {
      throw const ApiException(
        code: 'mobile.plan_expired',
        message:
            'This plan has expired. Book a paid repair at any store instead.',
        status: 400,
        errors: [
          ApiFieldError(
            field: 'planId',
            code: 'mobile.plan_expired',
            message: 'This plan has expired. Book a paid repair at any store instead.',
          ),
        ],
      );
    }
    if (description.trim().length < 10) {
      throw const ApiException(
        code: 'mobile.claim_too_short',
        message: 'Describe what happened in at least 10 characters.',
        status: 400,
        errors: [
          ApiFieldError(
            field: 'description',
            code: 'mobile.claim_too_short',
            message: 'Describe what happened in at least 10 characters.',
          ),
        ],
      );
    }
    final number = 'CLM-${1024 + _claims.length}';
    final claim = WarrantyClaimDto(
      number: number,
      planId: plan.id,
      planName: plan.planName,
      device: plan.device,
      description: description.trim(),
      status: 'submitted',
      statusLabel: 'Submitted',
      filedAt: DateTime.now().toUtc().toIso8601String(),
      meta: 'Filed just now · ${plan.device}',
    );
    _claims.insert(0, claim);
    _byKey[key.value] = claim;
    return claim;
  }

  @override
  Future<Uint8List> claimPhoto(String number) async => throw _notFound('photo');
}
