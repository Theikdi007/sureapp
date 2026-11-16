// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentPageDto _$ContentPageDtoFromJson(Map<String, dynamic> json) =>
    _ContentPageDto(
      slug: json['slug'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ContentPageDtoToJson(_ContentPageDto instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'title': instance.title,
      'body': instance.body,
      'updatedAt': instance.updatedAt,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(contentRepository)
final contentRepositoryProvider = ContentRepositoryProvider._();

final class ContentRepositoryProvider
    extends
        $FunctionalProvider<
          ContentRepository,
          ContentRepository,
          ContentRepository
        >
    with $Provider<ContentRepository> {
  ContentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contentRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contentRepositoryHash();

  @$internal
  @override
  $ProviderElement<ContentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContentRepository create(Ref ref) {
    return contentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContentRepository>(value),
    );
  }
}

String _$contentRepositoryHash() => r'a68353811e3ccaf990518048031e2d3e63a69556';

@ProviderFor(contentPage)
final contentPageProvider = ContentPageFamily._();

final class ContentPageProvider
    extends
        $FunctionalProvider<
          AsyncValue<ContentPageDto>,
          ContentPageDto,
          FutureOr<ContentPageDto>
        >
    with $FutureModifier<ContentPageDto>, $FutureProvider<ContentPageDto> {
  ContentPageProvider._({
    required ContentPageFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'contentPageProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$contentPageHash();

  @override
  String toString() {
    return r'contentPageProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ContentPageDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ContentPageDto> create(Ref ref) {
    final argument = this.argument as String;
    return contentPage(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ContentPageProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$contentPageHash() => r'7ba5a8c28f367a907d7e503b61dde541b7704f04';

final class ContentPageFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ContentPageDto>, String> {
  ContentPageFamily._()
    : super(
        retry: null,
        name: r'contentPageProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ContentPageProvider call(String slug) =>
      ContentPageProvider._(argument: slug, from: this);

  @override
  String toString() => r'contentPageProvider';
}
