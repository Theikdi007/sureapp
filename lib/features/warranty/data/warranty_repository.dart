import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
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
    ApiWarrantyRepository(ref.watch(dioProvider));

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
