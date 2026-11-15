import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core_providers.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import 'app_lock.dart';
import 'auth_providers.dart';

extension LockMethodText on LockMethod {
  /// "Face ID", "fingerprint"… for the device the app runs on.
  String name({required bool ios}) => switch (this) {
    LockMethod.face => ios ? 'Face ID' : 'face unlock',
    LockMethod.fingerprint => ios ? 'Touch ID' : 'fingerprint',
    LockMethod.biometrics => 'biometrics',
    LockMethod.screenLock => ios ? 'your passcode' : 'your screen lock',
    LockMethod.none => 'your phone',
  };

  IconData get icon => switch (this) {
    LockMethod.face => LucideIcons.scanFace,
    LockMethod.fingerprint || LockMethod.biometrics => LucideIcons.fingerprint,
    _ => LucideIcons.lock,
  };
}

/// Covers the whole app while [AppLock] is locked (and briefly at launch
/// until the setting is read). Sits above the navigator, so navigation
/// state underneath is kept and resumes as it was after unlocking.
class AppLockGate extends ConsumerWidget {
  const AppLockGate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lock = ref.watch(appLockProvider);
    final signedIn = ref.watch(sessionProvider).value is SignedIn;
    final covered = signedIn && lock.locked;
    return Stack(
      children: [
        // Offstage hides the app from sight and screen readers.
        Offstage(offstage: covered, child: child),
        if (covered)
          Positioned.fill(
            child: lock.loaded
                ? const AppLockScreen()
                : ColoredBox(color: context.colors.page),
          ),
      ],
    );
  }
}

/// Prototype "App Lock": big biometric button, Unlock, and a way back to
/// password sign-in.
class AppLockScreen extends ConsumerStatefulWidget {
  const AppLockScreen({super.key});

  @override
  ConsumerState<AppLockScreen> createState() => _AppLockScreenState();
}

class _AppLockScreenState extends ConsumerState<AppLockScreen> {
  bool _failed = false;
  bool _signingOut = false;

  @override
  void initState() {
    super.initState();
    // Ask straight away, like the system apps do.
    WidgetsBinding.instance.addPostFrameCallback((_) => _unlock());
  }

  Future<void> _unlock() async {
    final ok = await ref.read(appLockProvider.notifier).unlock();
    if (mounted && !ok) setState(() => _failed = true);
  }

  Future<void> _usePassword() async {
    setState(() => _signingOut = true);
    await ref.read(sessionProvider.notifier).signOut();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final method = ref.watch(appLockProvider).method;
    final ios = ref.watch(deviceCapsProvider).isIOS;
    final label = 'Unlock with ${method.name(ios: ios)}';
    final session = ref.watch(sessionProvider).value;
    final phone = session is SignedIn ? session.member?.phoneDisplay : null;
    return Material(
      color: c.page,
      child: SafeArea(
        child: Padding(
          // Prototype: 16 under the status bar, 24 sides and bottom.
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Prototype `PageHeader` (48 high, centered title/subtitle);
              // no back button here, sign-out is the ghost button below.
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Semantics(
                      header: true,
                      child: Text(
                        'App Lock',
                        textAlign: TextAlign.center,
                        style: SureText.body1(SureTypography.bold)
                            .copyWith(color: c.ink),
                      ),
                    ),
                    Text(
                      phone != null ? 'Signed in as $phone' : 'Sure is locked',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: SureText.caption1().copyWith(color: c.inkFaded),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.sizeOf(context).height * 0.5,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Semantics(
                          button: true,
                          label: label,
                          excludeSemantics: true,
                          child: PressScale(
                            onTap: _unlock,
                            scale: 0.95,
                            child: Container(
                              width: 112,
                              height: 112,
                              decoration: BoxDecoration(
                                color: c.primaryFaded,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                method.icon,
                                size: 46,
                                color: c.primaryInk,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: SureSpace.x5),
                        Text(
                          label,
                          textAlign: TextAlign.center,
                          style: SureTypography.style(
                            size: 17,
                            height: 24 / 17,
                            weight: SureTypography.bold,
                            color: c.ink,
                          ),
                        ),
                        const SizedBox(height: SureSpace.x5),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 260),
                          child: Text(
                            _failed
                                ? "That didn't work. Try again, or sign in "
                                      'with your password.'
                                : "No password needed — App Lock verifies "
                                      "it's you",
                            textAlign: TextAlign.center,
                            style: SureTypography.style(
                              size: 13,
                              height: 18 / 13,
                              color: _failed ? c.critical : c.inkFaded,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SureButton(label: 'Unlock', onPressed: _unlock),
              const SizedBox(height: SureSpace.x2),
              SureButton(
                label: 'Sign in with password',
                variant: SureButtonVariant.ghost,
                loading: _signingOut,
                onPressed: _usePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
