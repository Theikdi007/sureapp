import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/api_exception.dart';
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
    ref.watch(appConfigProvider).isMock
    ? MockContentRepository()
    : ApiContentRepository(ref.watch(dioProvider));

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

class MockContentRepository implements ContentRepository {
  MockContentRepository({this.latency = const Duration(milliseconds: 250)});

  final Duration latency;

  static const _pages = {
    ContentSlugs.terms: ContentPageDto(
      slug: ContentSlugs.terms,
      title: 'Terms of Services',
      body:
          "Orders are confirmed once we've checked them and can be cancelled "
          'free of charge until they are packed.\nPrices are shown and settled '
          'in MMK.',
      updatedAt: '2026-11-02T08:29:46.0742513+00:00',
    ),
    ContentSlugs.privacy: ContentPageDto(
      slug: ContentSlugs.privacy,
      title: 'Privacy Policy',
      body:
          'We use your phone number to sign you in and to find your orders, '
          'repairs and warranty plans.\nWe never sell your data.',
      updatedAt: '2026-11-02T08:29:46.0742513+00:00',
    ),
    ContentSlugs.returnPolicy: ContentPageDto(
      slug: ContentSlugs.returnPolicy,
      title: 'Return policy',
      body:
          'Unopened items can be returned within 7 days at any SureStore '
          'branch with the receipt.\nFaulty devices are repaired or replaced '
          'under their warranty: file a claim in TechVault Warranty or bring '
          'the device to a service desk.',
      updatedAt: '2026-11-02T08:29:46.0742513+00:00',
    ),
  };

  @override
  Future<ContentPageDto> page(String slug) async {
    await Future<void>.delayed(latency);
    final page = _pages[slug];
    if (page == null) {
      throw const ApiException(
        code: 'mobile.not_found',
        message: "We couldn't find that page.",
        status: 404,
      );
    }
    return page;
  }
}
