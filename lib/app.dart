import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/settings/theme_setting.dart';
import 'design_system/theme/app_theme.dart';
import 'features/auth/presentation/app_lock_screen.dart';

class SureApp extends ConsumerWidget {
  const SureApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Sure',
      debugShowCheckedModeBanner: false,
      // Default status bar style for screens without an AppBar; screens
      // over dark imagery (onboarding) override it.
      builder: (context, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppTheme.statusBar(Theme.of(context).brightness),
        // App Lock covers everything above the navigator, so the screens
        // underneath keep their state while locked.
        child: AppLockGate(child: child!),
      ),
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ref.watch(themeSettingProvider),
      routerConfig: ref.watch(appRouterProvider),
      supportedLocales: const [Locale('en'), Locale('my')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
