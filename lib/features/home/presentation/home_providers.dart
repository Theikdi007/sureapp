import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/money.dart';
import '../../catalog/data/catalog_dtos.dart';
import '../../catalog/presentation/shop_state.dart';
import '../data/home_dtos.dart';
import '../data/home_repository.dart';

part 'home_providers.g.dart';

/// `GET home`. Kept alive so switching tabs doesn't reload it.
@Riverpod(keepAlive: true)
Future<HomeDto> homeData(Ref ref) async {
  final home = await ref.watch(homeRepositoryProvider).home();
  ref.read(shopCountsProvider.notifier).seed(home.counts);
  // Fresher bell count than the cached home answer.
  Future.microtask(() => ref.read(shopCountsProvider.notifier).refreshUnread());
  return home;
}

class FeedState {
  const FeedState({
    this.items = const [],
    this.nextCursor,
    this.loading = false,
    this.error,
  });

  final List<ProductCardDto> items;
  final String? nextCursor;
  final bool loading;
  final Object? error;

  bool get done => nextCursor == null;
}

/// "For You": first page from `home.forYou`, then `products/feed` pages
/// as the user scrolls.
@Riverpod(keepAlive: true)
class ForYouFeed extends _$ForYouFeed {
  @override
  FeedState build() {
    final home = ref.watch(homeDataProvider).value;
    if (home == null) return const FeedState();
    return FeedState(
      items: home.forYou.items,
      nextCursor: home.forYou.nextCursor,
    );
  }

  Future<void> loadMore() async {
    if (state.loading || state.done) return;
    state = FeedState(
      items: state.items,
      nextCursor: state.nextCursor,
      loading: true,
    );
    try {
      final Page<ProductCardDto> page = await ref
          .read(homeRepositoryProvider)
          .feed(cursor: state.nextCursor);
      state = FeedState(
        items: [...state.items, ...page.items],
        nextCursor: page.nextCursor,
      );
    } on Object catch (e) {
      state = FeedState(
        items: state.items,
        nextCursor: state.nextCursor,
        error: e,
      );
    }
  }
}
