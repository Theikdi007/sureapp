import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';

part 'content_repository.freezed.dart';
part 'content_repository.g.dart';

/// Text pages served by `GET content/{slug}`.
abstract final class ContentSlugs {
  static const terms = 'terms';
  static const privacy = 'privacy';
  static const returnPolicy = 'return-policy';
}

/// `ContentPageDto`: [body] is plain text with line breaks.
@freezed
abstract class ContentPageDto with _$ContentPageDto {
  const factory ContentPageDto({
    required String slug,
    required String title,
    required String body,
    String? updatedAt,
  }) = _ContentPageDto;

  factory ContentPageDto.fromJson(Map<String, dynamic> json) =>
      _$ContentPageDtoFromJson(json);
}

abstract interface class ContentRepository {
  Future<ContentPageDto> page(String slug);
}

@Riverpod(keepAlive: true)
ContentRepository contentRepository(Ref ref) =>
    ApiContentRepository(ref.watch(dioProvider));

@riverpod
Future<ContentPageDto> contentPage(Ref ref, String slug) =>
    ref.watch(contentRepositoryProvider).page(slug);

class ApiContentRepository implements ContentRepository {
  ApiContentRepository(this._dio);

  final Dio _dio;

  @override
  Future<ContentPageDto> page(String slug) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'content/${Uri.encodeComponent(slug)}',
      options: Options(extra: {RequestFlags.skipAuth: true}),
    );
    return ContentPageDto.fromJson(res.data!);
  });
}
