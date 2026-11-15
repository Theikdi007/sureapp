import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';

part 'notifications_repository.freezed.dart';
part 'notifications_repository.g.dart';

/// `GET notifications/unread-count`.
class UnreadCount {
  const UnreadCount({
    required this.total,
    required this.updates,
    required this.activity,
  });

  factory UnreadCount.fromJson(Map<String, dynamic> json) => UnreadCount(
    total: json['total'] as int? ?? 0,
    updates: json['updates'] as int? ?? 0,
    activity: json['activity'] as int? ?? 0,
  );

  final int total;
  final int updates;
  final int activity;
}

/// `NotificationTabs`.
enum NotificationTab { all, updates, activity }

/// `NotificationDto`. [id] carries its source (`i:` iSure, `m:` shop) so
/// read marks go to the right place; [kind] is `update` or `activity`;
/// [icon] is a Lucide icon name.
@freezed
abstract class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    required String id,
    required String kind,
    required String icon,
    required String title,
    required String body,
    required String createdAt,
    required bool unread,
    String? imageUrl,
    LinkDto? link,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}

abstract interface class NotificationsRepository {
  Future<UnreadCount> unreadCount();
  Future<Page<NotificationDto>> list(NotificationTab tab, {String? cursor});

  /// One notification; the API marks it read.
  Future<NotificationDto> detail(String id);
  Future<void> markRead(String id);
}

@Riverpod(keepAlive: true)
NotificationsRepository notificationsRepository(Ref ref) =>
    ref.watch(appConfigProvider).isMock
    ? MockNotificationsRepository()
    : ApiNotificationsRepository(ref.watch(dioProvider));

class ApiNotificationsRepository implements NotificationsRepository {
  ApiNotificationsRepository(this._dio);

  final Dio _dio;

  String _id(String id) => Uri.encodeComponent(id);

  @override
  Future<UnreadCount> unreadCount() => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'notifications/unread-count',
    );
    return UnreadCount.fromJson(res.data!);
  });

  @override
  Future<Page<NotificationDto>> list(NotificationTab tab, {String? cursor}) =>
      apiCall(() async {
        final res = await _dio.get<Map<String, dynamic>>(
          'notifications',
          queryParameters: {'tab': tab.name, 'cursor': ?cursor, 'limit': 20},
        );
        return Page.fromJson(res.data!, NotificationDto.fromJson);
      });

  @override
  Future<NotificationDto> detail(String id) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'notifications/${_id(id)}',
    );
    return NotificationDto.fromJson(res.data!);
  });

  @override
  Future<void> markRead(String id) =>
      apiCall(() => _dio.post<void>('notifications/${_id(id)}/read'));
}

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
