import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/utils/myanmar_time.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../repairs/presentation/repairs_screen.dart' show LoadingBlock;
import '../data/content_repository.dart';

/// A text page (`GET content/{slug}`): terms, privacy, return policy.
/// The body is plain text; each line is a paragraph.
class ContentPageScreen extends ConsumerWidget {
  const ContentPageScreen({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final page = ref.watch(contentPageProvider(slug));
    return PageScaffold(
      headerGap: 16,
      title: page.value?.title ?? '',
      subtitle: switch (page.value?.updatedAt) {
        final at? => 'Updated ${MyanmarTime.format(at, pattern: 'd MMM y')}',
        null => null,
      },
      maxContentWidth: 720,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: PageScaffold.sidePadding,
          ),
          sliver: SliverToBoxAdapter(
            child: switch (page) {
              AsyncData(:final value) => SelectionArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final p in value.body.split('\n'))
                      if (p.trim().isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: SureSpace.x3),
                          child: Text(
                            p.trim(),
                            style: SureText.body2().copyWith(color: c.ink),
                          ),
                        ),
                  ],
                ),
              ),
              AsyncError(:final error) when !page.isLoading => EmptyState(
                icon: LucideIcons.fileX,
                title: "Couldn't load this page",
                description: error is ApiException ? error.userMessage : null,
                action: SureLink(
                  'Try again',
                  onTap: () => ref.invalidate(contentPageProvider(slug)),
                ),
              ),
              _ => const LoadingBlock(),
            },
          ),
        ),
      ],
    );
  }
}
