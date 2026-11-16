import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../design_system/adaptive/fold_info.dart';
import '../../../design_system/adaptive/two_pane.dart';
import '../../../design_system/adaptive/window_class.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_logo.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_colors.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../app_config/data/app_config_dto.dart';
import '../../app_config/data/app_config_repository.dart';
import 'auth_providers.dart';

/// First-launch slides from `app-config.onboarding`. Skip or finish → login.
///
/// compact: full-bleed image with the text panel over its bottom.
/// wide / book posture: image and text side by side (split at the hinge).
/// tabletop: image above the hinge, text and buttons below.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pages = PageController();
  int _index = 0;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  // The router moves on to login once this is saved.
  void _finish() => ref.read(onboardingDoneProvider.notifier).complete();

  void _next(int count) {
    if (_index >= count - 1) return _finish();
    _pages.nextPage(duration: SureMotion.slow, curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final slides =
        ref.watch(remoteAppConfigProvider).value?.onboarding ?? const [];
    if (slides.isEmpty) {
      // Nothing to show: don't block sign-in.
      WidgetsBinding.instance.addPostFrameCallback((_) => _finish());
      return const Scaffold(body: SizedBox.shrink());
    }
    final slide = slides[_index.clamp(0, slides.length - 1)];
    final last = _index == slides.length - 1;

    final images = PageView.builder(
      controller: _pages,
      itemCount: slides.length,
      onPageChanged: (i) => setState(() => _index = i),
      itemBuilder: (_, i) => _SlideImage(url: slides[i].imageUrl),
    );

    final panel = _TextPanel(
      slide: slide,
      count: slides.length,
      index: _index,
      last: last,
      onDot: (i) => _pages.animateToPage(
        i,
        duration: SureMotion.slow,
        curve: Curves.easeOutCubic,
      ),
      onNext: () => _next(slides.length),
      onSkip: _finish,
    );

    final fold = FoldInfo.of(context);
    final wide = !WindowClass.of(context).isCompact;
    final c = context.colors;

    final Widget body;
    if (fold.posture == FoldPosture.tabletop) {
      body = HingeSplit(
        axis: Axis.vertical,
        first: images,
        second: SafeArea(top: false, child: Center(child: panel)),
      );
    } else if (wide || (fold.isSeparating && fold.isVertical)) {
      body = HingeSplit(
        axis: Axis.horizontal,
        first: images,
        second: SafeArea(left: false, child: Center(child: panel)),
      );
    } else {
      final h = MediaQuery.sizeOf(context).height;
      body = ColoredBox(
        color: SureBrand.darkGray,
        child: Stack(
          children: [
            Positioned.fill(child: images),
            // Bottom 58%: page color up to 42%, fading to clear (prototype).
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: h * 0.58,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [c.page, c.page, c.page.withValues(alpha: 0)],
                      stops: const [0, 0.42, 1],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              // Prototype: 44 pt from the bottom edge, home indicator
              // included.
              child: SafeArea(
                top: false,
                minimum: const EdgeInsets.only(bottom: 44),
                child: panel,
              ),
            ),
          ],
        ),
      );
    }
    // Compact: the status bar sits on the dark photo, so light icons
    // (prototype). Side-by-side layouts keep the page default.
    final overImage =
        fold.posture != FoldPosture.tabletop &&
        !(wide || (fold.isSeparating && fold.isVertical));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overImage
          ? AppTheme.statusBar(Brightness.dark)
          : AppTheme.statusBar(Theme.of(context).brightness),
      child: Scaffold(body: body),
    );
  }
}

class _SlideImage extends StatelessWidget {
  const _SlideImage({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
    imageUrl: url,
    fit: BoxFit.cover,
    width: double.infinity,
    height: double.infinity,
    fadeInDuration: SureMotion.medium,
    placeholder: (_, _) => const _BrandPanel(),
    errorWidget: (_, _, _) => const _BrandPanel(),
  );
}

/// Shown while an image loads or when it can't (offline, mock).
class _BrandPanel extends StatelessWidget {
  const _BrandPanel();

  @override
  Widget build(BuildContext context) => const DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [SureBrand.darkGreen, SureBrand.fresh],
      ),
    ),
    child: Center(child: SureLogo(height: 56)),
  );
}

class _TextPanel extends StatelessWidget {
  const _TextPanel({
    required this.slide,
    required this.count,
    required this.index,
    required this.last,
    required this.onDot,
    required this.onNext,
    required this.onSkip,
  });

  final OnboardingSlideDto slide;
  final int count;
  final int index;
  final bool last;
  final ValueChanged<int> onDot;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    // Prototype panel: 28 pt sides, 44 pt bottom, 20 pt between groups.
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Semantics(
              label: 'Slide ${index + 1} of $count',
              excludeSemantics: true,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < count; i++) ...[
                    if (i > 0) const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => onDot(i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        width: i == index ? 18 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: i == index
                              ? SureBrand.neon
                              : c.ink.withValues(alpha: 0.25),
                          borderRadius: SureRadius.all(SureRadius.pill),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: SureMotion.medium,
              child: Column(
                key: ValueKey(index),
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      slide.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: SureTypography.titleFamily,
                        fontSize: 30,
                        height: 38 / 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                        color: c.ink,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      slide.subtitle,
                      textAlign: TextAlign.center,
                      style: SureText.body3().copyWith(
                        height: 21 / 14,
                        color: c.inkFaded,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SureButton(
              label: last ? 'Get Started' : 'Next',
              endIcon: LucideIcons.arrowRight,
              onPressed: onNext,
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: !last,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Semantics(
                button: true,
                child: GestureDetector(
                  onTap: onSkip,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    child: Text(
                      'Skip',
                      style: SureText.body3(SureTypography.medium)
                          .copyWith(color: c.inkFaded),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
