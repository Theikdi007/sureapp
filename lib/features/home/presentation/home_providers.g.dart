// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `GET home`. Kept alive so switching tabs doesn't reload it.

@ProviderFor(homeData)
final homeDataProvider = HomeDataProvider._();

/// `GET home`. Kept alive so switching tabs doesn't reload it.

final class HomeDataProvider
    extends $FunctionalProvider<AsyncValue<HomeDto>, HomeDto, FutureOr<HomeDto>>
    with $FutureModifier<HomeDto>, $FutureProvider<HomeDto> {
  /// `GET home`. Kept alive so switching tabs doesn't reload it.
  HomeDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeDataHash();

  @$internal
  @override
  $FutureProviderElement<HomeDto> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HomeDto> create(Ref ref) {
    return homeData(ref);
  }
}

String _$homeDataHash() => r'c76242570e11ab08d3f8085618cce316210038de';

/// "For You": first page from `home.forYou`, then `products/feed` pages
/// as the user scrolls.

@ProviderFor(ForYouFeed)
final forYouFeedProvider = ForYouFeedProvider._();

/// "For You": first page from `home.forYou`, then `products/feed` pages
/// as the user scrolls.
final class ForYouFeedProvider
    extends $NotifierProvider<ForYouFeed, FeedState> {
  /// "For You": first page from `home.forYou`, then `products/feed` pages
  /// as the user scrolls.
  ForYouFeedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'forYouFeedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$forYouFeedHash();

  @$internal
  @override
  ForYouFeed create() => ForYouFeed();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedState>(value),
    );
  }
}

String _$forYouFeedHash() => r'c81bce71c60ca23463c7cb456cca62c527c8b52b';

/// "For You": first page from `home.forYou`, then `products/feed` pages
/// as the user scrolls.

abstract class _$ForYouFeed extends $Notifier<FeedState> {
  FeedState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<FeedState, FeedState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FeedState, FeedState>,
              FeedState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
