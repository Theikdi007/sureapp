import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Device facts read once at startup. Used for app headers and to pick the
/// glass tier.
class DeviceCaps {
  const DeviceCaps({
    required this.platform,
    required this.osMajorVersion,
    required this.deviceName,
    required this.appVersion,
    required this.isLowRamDevice,
    required this.reduceTransparency,
  });

  /// `ios` or `android` (the `X-Platform` value).
  final String platform;
  final int osMajorVersion;
  final String deviceName;
  final String appVersion;
  final bool isLowRamDevice;

  /// iOS "Reduce Transparency" at launch. Live changes come from
  /// [reduceTransparencyChanges].
  final bool reduceTransparency;

  bool get isIOS => platform == 'ios';

  /// iOS 26 introduced Liquid Glass.
  bool get supportsLiquidGlass => isIOS && osMajorVersion >= 26;

  static const _channel = MethodChannel('sure_app/device_caps');
  static const _events = EventChannel('sure_app/reduce_transparency');

  static Stream<bool> get reduceTransparencyChanges => _events
      .receiveBroadcastStream()
      .map((e) => e == true)
      .handleError((Object _) {});

  static Future<DeviceCaps> load() async {
    final info = DeviceInfoPlugin();
    final pkg = await PackageInfo.fromPlatform();
    Map<String, Object?> native = const {};
    try {
      native =
          (await _channel.invokeMapMethod<String, Object?>('read')) ?? const {};
    } on MissingPluginException {
      // Tests / unsupported platform.
    } on PlatformException catch (e) {
      debugPrint('device_caps: $e');
    }

    if (!kIsWeb && Platform.isIOS) {
      final ios = await info.iosInfo;
      return DeviceCaps(
        platform: 'ios',
        osMajorVersion: int.tryParse(ios.systemVersion.split('.').first) ?? 0,
        deviceName: ios.name,
        appVersion: pkg.version,
        isLowRamDevice: false,
        reduceTransparency: native['reduceTransparency'] == true,
      );
    }
    if (!kIsWeb && Platform.isAndroid) {
      final android = await info.androidInfo;
      return DeviceCaps(
        platform: 'android',
        osMajorVersion: android.version.sdkInt,
        deviceName: '${android.manufacturer} ${android.model}',
        appVersion: pkg.version,
        isLowRamDevice: android.isLowRamDevice,
        reduceTransparency: false,
      );
    }
    return DeviceCaps(
      platform: 'android',
      osMajorVersion: 0,
      deviceName: 'unknown',
      appVersion: pkg.version,
      isLowRamDevice: false,
      reduceTransparency: false,
    );
  }
}
