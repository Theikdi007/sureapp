import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core_providers.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/components/list_layout.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/sure_logo.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../content/data/content_repository.dart';

/// About & Legal (prototype `About & Legal`): brand card, then the text
/// pages from `GET content/{slug}` and the app version.
class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final caps = ref.watch(deviceCapsProvider);
    return PageScaffold(
      title: 'About & Legal',
      headerGap: 18,
      maxContentWidth: 720,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: PageScaffold.sidePadding,
          ),
          sliver: SliverList.list(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                decoration: BoxDecoration(
                  color: c.primaryFaded,
                  borderRadius: SureRadius.all(SureRadius.xl),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SureLogo(height: 36),
                    const SizedBox(height: SureSpace.x2),
                    Text(
                      "Myanmar's ultimate tech marketplace",
                      style: SureText.body3(SureTypography.medium)
                          .copyWith(color: c.ink),
                    ),
                    const SizedBox(height: SureSpace.x2),
                    Text(
                      'Official devices from the brands you trust, with '
                      'TechVault warranty, in-home setup and Shopping Points '
                      'rewards on every purchase.',
                      style: SureText.caption1().copyWith(
                        color: c.inkFaded,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              ListGroup(
                children: [
                  ListRow(
                    icon: LucideIcons.fileText,
                    title: 'Terms of Services',
                    subtitle: 'The fine print',
                    onTap: () =>
                        context.push(AppRoutes.content(ContentSlugs.terms)),
                  ),
                  ListRow(
                    icon: LucideIcons.lock,
                    title: 'Privacy Policy',
                    subtitle: 'How we protect your data',
                    onTap: () =>
                        context.push(AppRoutes.content(ContentSlugs.privacy)),
                  ),
                  ListRow(
                    icon: LucideIcons.rotateCcw,
                    title: 'Return policy',
                    subtitle: 'Returns and faulty devices',
                    onTap: () => context.push(
                      AppRoutes.content(ContentSlugs.returnPolicy),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                'Sure for ${caps.isIOS ? 'iOS' : 'Android'} · '
                'Version ${caps.appVersion}',
                textAlign: TextAlign.center,
                style: SureTypography.style(size: 11, color: c.inkFaded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
