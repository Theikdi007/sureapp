import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/core_providers.dart';
import 'core/platform/device_caps.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Draw under the status and navigation bars on every Android version,
  // like iOS: the bars are transparent over the page (see AppTheme.statusBar).
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  final config = AppConfig.fromEnvironment();
  final caps = await DeviceCaps.load();

  runApp(
    ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(config),
        deviceCapsProvider.overrideWithValue(caps),
      ],
      child: const SureApp(),
    ),
  );
}
