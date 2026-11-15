import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/myanmar_time.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_image.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_colors.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../catalog/presentation/shop_state.dart';
import '../../catalog/presentation/widgets/catalog_widgets.dart';
import '../../repairs/presentation/repairs_screen.dart' show LoadingBlock;
import '../data/notifications_repository.dart';

part 'notifications_screen.g.dart';

/// The API's Lucide icon names → icons. Unknown names get a bell.
IconData notificationIcon(String name) => switch (name) {
  'coins' => LucideIcons.coins,
  'package' || 'package-check' => LucideIcons.package,
  'truck' => LucideIcons.truck,
  'shield-check' => LucideIcons.shieldCheck,
  'wrench' => LucideIcons.wrench,
  'gift' => LucideIcons.gift,
  'ticket' => LucideIcons.ticket,
  'zap' => LucideIcons.zap,
  'tag' || 'percent' => LucideIcons.tag,
  'star' => LucideIcons.star,
  'crown' || 'award' => LucideIcons.crown,
  'house' || 'calendar-check' => LucideIcons.calendarCheck,
  'arrow-up-right' => LucideIcons.arrowUpRight,
  'megaphone' => LucideIcons.megaphone,
  'cake' => LucideIcons.cake,
  _ => LucideIcons.bell,
};

/// "Just now", "5m ago", "3h ago", "Yesterday", then a Myanmar-time date.
String notificationTime(String iso, {DateTime? now}) {
  final at = DateTime.parse(iso).toUtc();
  final diff = (now ?? DateTime.now()).toUtc().difference(at);
  if (diff.inMinutes < 1) return 'Just now';
  if (diff.inHours < 1) return '${diff.inMinutes}m ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  final mm = MyanmarTime.fromUtc(at);
  final today = MyanmarTime.fromUtc((now ?? DateTime.now()).toUtc());
  final days = DateTime(
    today.year,
    today.month,
    today.day,
  ).difference(DateTime(mm.year, mm.month, mm.day)).inDays;
  if (days == 1) return 'Yesterday';
  return DateFormat(mm.year == today.year ? 'd MMM' : 'd MMM y').format(mm);
}

class NotificationFeedState {
  const NotificationFeedState({
    this.items = const [],
    this.nextCursor,
    this.loading = false,
    this.error,
    this.started = false,
  });

  final List<NotificationDto> items;
  final String? nextCursor;
  final bool loading;
  final Object? error;
  final bool started;

  bool get done => started && nextCursor == null;
}

/// One tab's pages (`GET notifications?tab=&cursor=`).
@riverpod
class NotificationFeed extends _$NotificationFeed {
  @override
  NotificationFeedState build(NotificationTab tab) {
    Future.microtask(loadMore);
    return const NotificationFeedState(loading: true);
  }

  bool _busy = false;

  Future<void> loadMore() async {
    if (_busy || state.done) return;
    _busy = true;
    state = NotificationFeedState(
      items: state.items,
      nextCursor: state.nextCursor,
      loading: true,
      started: state.started,
    );
    try {
      final page = await ref
          .read(notificationsRepositoryProvider)
          .list(tab, cursor: state.nextCursor);
      state = NotificationFeedState(
        items: [...state.items, ...page.items],
        nextCursor: page.nextCursor,
        started: true,
      );
    } on Object catch (e) {
      state = NotificationFeedState(
        items: state.items,
        nextCursor: state.nextCursor,
        error: e,
        started: state.started,
      );
    } finally {
      _busy = false;
    }
  }

  void markRead(String id) => state = NotificationFeedState(
    items: [
      for (final n in state.items) n.id == id ? n.copyWith(unread: false) : n,
    ],
    nextCursor: state.nextCursor,
    started: state.started,
  );
}

/// Notifications (prototype `Notifications`): All · Updates · Activity.
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  NotificationTab _tab = NotificationTab.all;
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.extentAfter < 400) {
        ref.read(notificationFeedProvider(_tab).notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _open(NotificationDto n) async {
    await context.push(AppRoutes.notification(n.id));
    if (!mounted) return;
    ref.read(notificationFeedProvider(_tab).notifier).markRead(n.id);
    ref.read(shopCountsProvider.notifier).refreshUnread();
  }

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(notificationFeedProvider(_tab));
    return PageScaffold(
      title: 'Notifications',
      maxContentWidth: 720,
      controller: _scroll,
      // Prototype: 16 above and below the tabs (the header row leaves 4).
      pinnedHeight: 60,
      pinnedBelowHeader: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: PillTabs(
          fullWidth: false,
          items: const [
            ('all', 'All'),
            ('updates', 'Updates'),
            ('activity', 'Activity'),
          ],
          value: _tab.name,
          onChanged: (id) =>
              setState(() => _tab = NotificationTab.values.byName(id)),
        ),
      ),
      onRefresh: () async {
        ref.invalidate(notificationFeedProvider(_tab));
        await ref.read(shopCountsProvider.notifier).refreshUnread();
      },
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            PageScaffold.sidePadding,
            4,
            PageScaffold.sidePadding,
            0,
          ),
          sliver: _body(feed),
        ),
      ],
    );
  }

  Widget _body(NotificationFeedState feed) {
    if (feed.items.isEmpty) {
      return SliverToBoxAdapter(
        child: switch (feed) {
          NotificationFeedState(:final error?) => EmptyState(
            icon: LucideIcons.wifiOff,
            title: "Couldn't load notifications",
            description: error is ApiException ? error.userMessage : null,
            action: SureLink(
              'Try again',
              onTap: () => ref.invalidate(notificationFeedProvider(_tab)),
            ),
          ),
          NotificationFeedState(started: true, loading: false) =>
            const EmptyState(
              icon: LucideIcons.bellOff,
              title: 'No notifications yet',
              description: 'Order updates, rewards and offers show up here',
            ),
          _ => const LoadingBlock(),
        },
      );
    }
    return SliverList.separated(
      itemCount: feed.items.length + 1,
      separatorBuilder: (_, _) => const SizedBox(height: SureSpace.x3),
      itemBuilder: (context, i) {
        if (i == feed.items.length) {
          if (feed.loading) return const LoadingBlock(height: 56);
          if (feed.error != null) {
            return Center(
              child: SureLink(
                'Load more',
                onTap: () => ref
                    .read(notificationFeedProvider(_tab).notifier)
                    .loadMore(),
              ),
            );
          }
          return const SizedBox.shrink();
        }
        final n = feed.items[i];
        return NotificationItem(notification: n, onTap: () => _open(n));
      },
    );
  }
}

/// The prototype's notification card shadow (`0 1px 3px`, half the
/// card-shadow strength).
List<BoxShadow> _softShadow(SureColors c) => [
  BoxShadow(
    color: c.shadow.withValues(alpha: c.shadow.a * 0.5),
    offset: const Offset(0, 1),
    blurRadius: 3,
  ),
];

/// Design system `NotificationItem`: avatar icon, title and time, two-line
/// body, electric unread dot. Unread rows sit on primary-faded.
class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
  });

  final NotificationDto notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final n = notification;
    final time = notificationTime(n.createdAt);
    return Semantics(
      button: true,
      label: '${n.unread ? 'Unread. ' : ''}${n.title}. ${n.body}. $time',
      excludeSemantics: true,
      child: PressScale(
        onTap: onTap,
        scale: 0.99,
        // The prototype wraps each item in a radius-20 card with a soft
        // 1 pt shadow (no border).
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: n.unread ? c.primaryFaded : c.raised,
            borderRadius: SureRadius.all(SureRadius.larger),
            boxShadow: _softShadow(c),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: n.unread ? c.primaryFaded : c.neutralFaded,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  notificationIcon(n.icon),
                  size: 20,
                  color: c.primaryInk,
                ),
              ),
              const SizedBox(width: SureSpace.x3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            n.title,
                            style: SureText.body3(
                              n.unread
                                  ? SureTypography.bold
                                  : SureTypography.medium,
                            ).copyWith(color: c.ink),
                          ),
                        ),
                        const SizedBox(width: SureSpace.x2),
                        Text(
                          time,
                          style: SureText.caption1().copyWith(
                            color: c.inkFaded,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      n.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: SureText.caption1().copyWith(color: c.inkFaded),
                    ),
                  ],
                ),
              ),
              if (n.unread) ...[
                const SizedBox(width: SureSpace.x2),
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: SureBrand.electric,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// `GET notifications/{id}` (marks it read).
@riverpod
Future<NotificationDto> notificationDetail(Ref ref, String id) =>
    ref.watch(notificationsRepositoryProvider).detail(id);

/// Notification Detail (prototype `Notification Detail`): icon, title,
/// kind and time, body, image, and the link's action.
class NotificationDetailScreen extends ConsumerWidget {
  const NotificationDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final detail = ref.watch(notificationDetailProvider(id));
    return PageScaffold(
      title: 'Notification',
      headerGap: 20,
      maxContentWidth: 720,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: PageScaffold.sidePadding,
          ),
          sliver: SliverToBoxAdapter(
            child: switch (detail) {
              AsyncData(:final value) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: c.card,
                      borderRadius: SureRadius.all(SureRadius.xl),
                      boxShadow: _softShadow(c),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: c.primaryFaded,
                                borderRadius: SureRadius.all(14),
                              ),
                              child: Icon(
                                notificationIcon(value.icon),
                                size: 20,
                                color: c.primaryInk,
                              ),
                            ),
                            const SizedBox(width: SureSpace.x3),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Semantics(
                                    header: true,
                                    child: Text(
                                      value.title,
                                      style: SureTypography.style(
                                        size: 17,
                                        height: 24 / 17,
                                        weight: SureTypography.bold,
                                        color: c.ink,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${value.kind == 'update' ? 'Update' : 'Activity'}'
                                    ' · ${MyanmarTime.format(value.createdAt)}',
                                    style: SureText.caption1().copyWith(
                                      color: c.inkFaded,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        SelectableText(
                          value.body,
                          style: SureText.body3().copyWith(
                            color: c.inkFaded,
                            height: 1.6,
                          ),
                        ),
                        if (value.imageUrl case final img?) ...[
                          const SizedBox(height: 14),
                          ClipRRect(
                            borderRadius: SureRadius.all(SureRadius.large),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: SureImage(img),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (value.link case final link?) ...[
                    const SizedBox(height: SureSpace.x5),
                    SureButton(
                      label: linkActionLabel(link),
                      onPressed: () => openLink(context, link),
                    ),
                  ],
                ],
              ),
              AsyncError(:final error) when !detail.isLoading => EmptyState(
                icon: LucideIcons.bellOff,
                title: "Couldn't open this notification",
                description: error is ApiException ? error.userMessage : null,
                action: SureLink(
                  'Try again',
                  onTap: () => ref.invalidate(notificationDetailProvider(id)),
                ),
              ),
              _ => const LoadingBlock(),
            },
          ),
        ),
      ],
    );
  }
}
