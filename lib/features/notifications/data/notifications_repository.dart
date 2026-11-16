import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
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
    ApiNotificationsRepository(ref.watch(dioProvider));

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
