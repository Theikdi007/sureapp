import 'package:sure_app/core/push/push_registration.dart';
import 'package:sure_app/features/notifications/data/devices_repository.dart';

/// Remembers registered push tokens instead of calling `devices`.
class MockDevicesRepository implements DevicesRepository {
  final tokens = <String>{};

  @override
  Future<void> register({
    required String token,
    required String platform,
  }) async => tokens.add(token);

  @override
  Future<void> unregister(String token) async => tokens.remove(token);
}

/// No Firebase in tests: hands out a fixed token.
class FakePushMessaging implements PushMessaging {
  FakePushMessaging([this.value = 'test-fcm-token']);

  final String? value;

  @override
  Future<String?> token() async => value;

  @override
  Stream<String> get tokenRefresh => const Stream.empty();
}
