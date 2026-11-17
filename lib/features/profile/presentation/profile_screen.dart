import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/components/list_layout.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../../core/core_providers.dart';
import '../../../core/settings/theme_setting.dart';
import '../../auth/presentation/app_lock.dart';
import '../../auth/presentation/app_lock_screen.dart' show LockMethodText;
import '../../auth/presentation/auth_providers.dart';
import '../../loyalty/data/loyalty_repository.dart';
import '../../loyalty/presentation/loyalty_widgets.dart';
import '../../orders/data/order_dtos.dart' show HomeSetupBookingStatus;
import '../../loyalty/presentation/points_screen.dart';
import '../../orders/presentation/orders_screen.dart';
import '../../repairs/data/repairs_repository.dart';
import '../../repairs/presentation/repairs_screen.dart' show LoadingBlock;
import '../data/profile_repository.dart';
import 'profile_providers.dart';
import 'profile_widgets.dart';

/// Profile tab (prototype `PROFILE`): member header, Shopping Points,
/// loyalty actions, settings and log out.
///
/// Calls `GET me`, `GET loyalty/summary`, `GET home-setup/bookings`,
/// `GET repairs`, `GET payment-methods`, `PATCH me/preferences`.
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _signingOut = false;

  Future<void> _signOut() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log out?'),
        content: const Text('You can sign in again with your phone number.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Log out'),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    setState(() => _signingOut = true);
    await ref.read(sessionProvider.notifier).signOut();
  }

  Future<void> _setPush(bool on) async {
    try {
      await ref.read(preferencesProvider.notifier).setPush(on);
    } on Object catch (e) {
      if (!mounted) return;
      SureToast.show(
        context,
        e is ApiException ? e.userMessage : "Couldn't change that. Try again.",
        icon: LucideIcons.circleAlert,
        color: SureToastColor.critical,
      );
    }
  }

  Future<void> _setAppLock(bool on) async {
    final result = await ref.read(appLockProvider.notifier).setEnabled(on);
    if (!mounted) return;
    final ios = ref.read(deviceCapsProvider).isIOS;
    final method = ref.read(appLockProvider).method.name(ios: ios);
    switch (result) {
      case AppLockChange.done:
        SureToast.show(
          context,
          on ? 'App Lock on — $method' : 'App Lock turned off',
          icon: on ? LucideIcons.lock : LucideIcons.lockOpen,
          color: on ? SureToastColor.positive : SureToastColor.primary,
        );
      case AppLockChange.unavailable:
        SureToast.show(
          context,
          'Set up a screen lock, Face ID or fingerprint on your phone first',
          icon: LucideIcons.lock,
          color: SureToastColor.neutral,
        );
      case AppLockChange.cancelled:
        break;
    }
  }

  Future<void> _refresh() async {
    ref
      ..invalidate(profileProvider)
      ..invalidate(loyaltySummaryProvider)
      ..invalidate(preferencesProvider)
      ..invalidate(paymentMethodsProvider)
      ..invalidate(homeSetupBookingsProvider)
      ..invalidate(repairListProvider);
    await Future.wait([
      ref.read(profileProvider.future),
      ref.read(loyaltySummaryProvider.future),
    ]).catchError((_) => const <Object>[]);
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);
    final summary = ref.watch(loyaltySummaryProvider);

    return PageScaffold(
      title: 'Profile',
      // Prototype: no page header; the member header comes first.
      showHeader: false,
      headerGap: 20,
      showBack: false,
      maxContentWidth: 720,
      onRefresh: _refresh,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: PageScaffold.sidePadding,
          ),
          sliver: SliverList.list(
            children: [
              switch (profile) {
                AsyncData(:final value) => _ProfileHeader(profile: value),
                AsyncError(:final error) when !profile.isLoading => EmptyState(
                  icon: LucideIcons.userX,
                  title: "Couldn't load your profile",
                  description: error is ApiException ? error.userMessage : null,
                  action: SureLink(
                    'Try again',
                    onTap: () => ref.invalidate(profileProvider),
                  ),
                ),
                _ => const LoadingBlock(height: 72),
              },
              const SizedBox(height: SureSpace.x5),
              if (summary.value case final s?) ...[
                ShoppingPointsCard(
                  summary: s,
                  onHistory: () => context.push(AppRoutes.points),
                ),
                const SizedBox(height: SureSpace.x5),
              ],
              LoyalActions(
                items: [
                  LoyalAction(
                    LucideIcons.arrowUpRight,
                    'Transfer',
                    () => context.push(AppRoutes.transfer),
                  ),
                  LoyalAction(
                    LucideIcons.plus,
                    'Top up',
                    () => context.push(AppRoutes.topUp),
                  ),
                  LoyalAction(
                    LucideIcons.gift,
                    'Rewards',
                    () => context.go(AppRoutes.rewards),
                  ),
                  LoyalAction(
                    LucideIcons.scanQrCode,
                    'Pay in store',
                    () => showPayInStore(context),
                  ),
                ],
              ),
              const SizedBox(height: SureSpace.x5),
              const SectionHeader(
                title: 'Settings',
                size: SectionHeaderSize.small,
              ),
              const SizedBox(height: SureSpace.x5),
              _SettingsList(onPush: _setPush, onAppLock: _setAppLock),
              const SizedBox(height: SureSpace.x5),
              SureButton(
                label: 'Log out',
                startIcon: LucideIcons.logOut,
                variant: SureButtonVariant.outline,
                critical: true,
                loading: _signingOut,
                onPressed: _signOut,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Design system `ProfileHeader`: avatar, featured-3 name, body-3 meta,
/// edit button.
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.profile});

  final ProfileDto profile;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final p = profile;
    final meta = [
      '${p.tierLabel} Member',
      if (p.memberSinceYear case final y?) 'Since $y',
    ].join(' · ');
    return Row(
      children: [
        MemberAvatar(name: p.name, photoUrl: p.photoUrl),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                p.name.isEmpty ? 'Sure member' : p.name,
                style: SureText.featured3().copyWith(color: c.ink),
              ),
              Text(meta, style: SureText.body3().copyWith(color: c.inkFaded)),
              if (p.birthdayToday)
                Text(
                  'Happy birthday! 🎉',
                  style: SureText.caption1(SureTypography.medium)
                      .copyWith(color: c.primaryInk),
                ),
            ],
          ),
        ),
        IconButton(
          tooltip: 'Edit profile',
          onPressed: () => context.push(AppRoutes.account),
          icon: Icon(LucideIcons.pencil, size: 18, color: c.ink),
        ),
      ],
    );
  }
}

class _SettingsList extends ConsumerWidget {
  const _SettingsList({required this.onPush, required this.onAppLock});

  final ValueChanged<bool> onPush;
  final ValueChanged<bool> onAppLock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesProvider).value;
    final payments = ref.watch(paymentMethodsProvider).value;
    final visits = ref.watch(homeSetupBookingsProvider).value;
    final repairs = ref.watch(repairListProvider).value;

    final defaultPay = payments?.where((p) => p.isDefault).firstOrNull;
    final upcoming = visits?.where((b) => b.isScheduled).length ?? 0;
    final activeRepairs = repairs?.where((r) => r.active).length ?? 0;
    final services = [
      if (upcoming > 0)
        '$upcoming upcoming home ${upcoming == 1 ? 'visit' : 'visits'}',
      if (activeRepairs > 0)
        '$activeRepairs ${activeRepairs == 1 ? 'repair' : 'repairs'}',
    ];
    final push = prefs?.pushEnabled;
    final lock = ref.watch(appLockProvider);
    final ios = ref.watch(deviceCapsProvider).isIOS;
    final theme = ref.watch(themeSettingProvider);
    final dark = Theme.of(context).brightness == Brightness.dark;

    return ListGroup(
      children: [
        ListRow(
          icon: LucideIcons.user,
          title: 'Account & Security',
          subtitle: 'Name, phone, password and addresses',
          onTap: () => context.push(AppRoutes.account),
        ),
        ListRow(
          icon: LucideIcons.shoppingBag,
          title: 'My Cart',
          subtitle: "Items you're about to buy",
          onTap: () => context.push(AppRoutes.cart),
        ),
        ListRow(
          icon: LucideIcons.heart,
          title: 'Wishlist',
          subtitle: 'Products you saved',
          onTap: () => context.push(AppRoutes.wishlist),
        ),
        ListRow(
          icon: LucideIcons.calendarCheck,
          title: 'Scheduled Home Services',
          subtitle: services.isEmpty
              ? 'Home setup visits and repairs'
              : services.join(' · '),
          onTap: () {
            ref.read(requestedOrdersTabProvider.notifier).request('setup');
            context.go(AppRoutes.orders);
          },
        ),
        ListRow(
          icon: LucideIcons.creditCard,
          title: 'Payment',
          subtitle: defaultPay == null
              ? 'Choose how you like to pay'
              : '${defaultPay.title} is your default',
          onTap: () => context.push(AppRoutes.paymentMethods),
        ),
        ListRow(
          icon: LucideIcons.bell,
          title: 'Notification',
          subtitle: 'Order updates and offers',
          semanticLabel:
              'Notification, order updates and offers, '
              '${push == null
                  ? 'loading'
                  : push
                  ? 'on'
                  : 'off'}',
          trailing: SureSwitch(
            value: push ?? false,
            onChanged: push == null ? null : onPush,
          ),
          onTap: push == null ? null : () => onPush(!push),
        ),
        ListRow(
          // Prototype: the Face ID icon on iPhone.
          icon: ios || lock.method == LockMethod.face
              ? LucideIcons.scanFace
              : LucideIcons.fingerprint,
          title: 'App Lock',
          subtitle: lock.enabled
              ? 'Unlock with ${lock.method.name(ios: ios)}'
              : 'Off — tap to secure the app',
          semanticLabel: 'App Lock, ${lock.enabled ? 'on' : 'off'}',
          trailing: SureSwitch(value: lock.enabled, onChanged: onAppLock),
          onTap: () => onAppLock(!lock.enabled),
        ),
        ListRow(
          icon: LucideIcons.moon,
          title: 'Dark Mode',
          subtitle: theme == ThemeMode.system
              ? 'Follows your phone setting'
              : 'Easier on the eyes at night',
          semanticLabel:
              'Dark Mode, ${dark ? 'on' : 'off'}'
              '${theme == ThemeMode.system ? ', follows your phone' : ''}',
          trailing: SureSwitch(
            value: dark,
            onChanged: (v) => ref
                .read(themeSettingProvider.notifier)
                .set(v ? ThemeMode.dark : ThemeMode.light),
          ),
          onTap: () => _chooseTheme(context, ref, theme),
        ),
        ListRow(
          icon: LucideIcons.earth,
          title: 'Language',
          subtitle: 'English',
          // Prototype: Burmese isn't ready yet, so the row only says so.
          onTap: () => SureToast.show(
            context,
            'Myanmar language coming soon',
            icon: LucideIcons.earth,
          ),
        ),
        ListRow(
          icon: LucideIcons.fileText,
          title: 'About & Legal',
          subtitle: 'Our story, terms and privacy',
          onTap: () => context.push(AppRoutes.about),
        ),
        ListRow(
          icon: LucideIcons.circleQuestionMark,
          title: 'Help and Support',
          subtitle: 'Repairs, warranty and stores',
          onTap: () => context.go(AppRoutes.support),
        ),
      ],
    );
  }
}

/// Dark Mode row tap: light, dark or follow the phone.
Future<void> _chooseTheme(
  BuildContext context,
  WidgetRef ref,
  ThemeMode current,
) async {
  final picked = await showSureSheet<ThemeMode>(
    context,
    title: 'Appearance',
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (mode, icon, title) in const [
          (ThemeMode.system, LucideIcons.smartphone, 'Same as my phone'),
          (ThemeMode.light, LucideIcons.sun, 'Light'),
          (ThemeMode.dark, LucideIcons.moon, 'Dark'),
        ]) ...[
          SelectRow(
            icon: icon,
            title: title,
            selected: mode == current,
            onSelect: () => Navigator.pop(context, mode),
          ),
          const SizedBox(height: SureSpace.x2),
        ],
      ],
    ),
  );
  if (picked != null) {
    await ref.read(themeSettingProvider.notifier).set(picked);
  }
}
