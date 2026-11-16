// Test-only stand-in moved out of the app build; data from the API doc's
// JSON examples and the prototype.

import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/features/notifications/data/notifications_repository.dart';
import 'package:sure_app/shared/models/money.dart';

/// The API doc's examples plus shop notices, in memory so reads stick.
class MockNotificationsRepository implements NotificationsRepository {
  MockNotificationsRepository({
    this.latency = const Duration(milliseconds: 300),
  });

  final Duration latency;

  Future<void> _wait() => Future<void>.delayed(latency);

  final List<NotificationDto> _items = [
    const NotificationDto(
      id: 'm:6d1f2c84-1b0e-4c39-9b8e-1f7f5f3c0a01',
      kind: 'activity',
      icon: 'package',
      title: 'Your order is on its way',
      body: 'APP-26-1193 left the Hleden store. Your courier will call before arriving.',
      createdAt: '2026-11-13T04:10:00+00:00',
      unread: true,
      link: LinkDto(type: 'order', value: 'APP-26-1193'),
    ),
    const NotificationDto(
      id: 'm:6d1f2c84-1b0e-4c39-9b8e-1f7f5f3c0a02',
      kind: 'activity',
      icon: 'shield-check',
      title: 'Warranty claim received',
      body: 'CLM-1024 · We will review it and get back to you.',
      createdAt: '2026-11-10T03:21:00+00:00',
      unread: true,
      link: LinkDto(type: 'warranty_claim', value: 'CLM-1024'),
    ),
    const NotificationDto(
      id: 'i:4719',
      kind: 'activity',
      icon: 'coins',
      title: 'Points Transfer Successful!',
      body: 'You’ve transferred 2 Shopping Points to Ko Aung. Balance: 848,169 Shopping Points.',
      createdAt: '2026-11-09T09:43:32.543+00:00',
      unread: true,
    ),
    const NotificationDto(
      id: 'm:6d1f2c84-1b0e-4c39-9b8e-1f7f5f3c0a03',
      kind: 'update',
      icon: 'zap',
      title: 'Flash deals are live',
      body: 'Up to 30% off Galaxy phones until Sunday.',
      createdAt: '2026-11-08T02:00:00+00:00',
      unread: false,
      link: LinkDto(type: 'deals'),
    ),
  ];

  bool _inTab(NotificationDto n, NotificationTab tab) => switch (tab) {
    NotificationTab.all => true,
    NotificationTab.updates => n.kind == 'update',
    NotificationTab.activity => n.kind == 'activity',
  };

  @override
  Future<UnreadCount> unreadCount() async {
    await _wait();
    final unread = _items.where((n) => n.unread);
    return UnreadCount(
      total: unread.length,
      updates: unread.where((n) => n.kind == 'update').length,
      activity: unread.where((n) => n.kind == 'activity').length,
    );
  }

  @override
  Future<Page<NotificationDto>> list(
    NotificationTab tab, {
    String? cursor,
  }) async {
    await _wait();
    return Page(
      items: [
        for (final n in _items)
          if (_inTab(n, tab)) n,
      ],
    );
  }

  int _index(String id) {
    final i = _items.indexWhere((n) => n.id == id);
    if (i < 0) {
      throw const ApiException(
        code: 'mobile.not_found',
        message: "We couldn't find that notification.",
        status: 404,
      );
    }
    return i;
  }

  @override
  Future<NotificationDto> detail(String id) async {
    await _wait();
    final i = _index(id);
    return _items[i] = _items[i].copyWith(unread: false);
  }

  @override
  Future<void> markRead(String id) async {
    await _wait();
    final i = _index(id);
    _items[i] = _items[i].copyWith(unread: false);
  }
}
