import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../glass/glass_surface.dart';
import '../theme/app_theme.dart';
import '../tokens/sure_colors.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';
import 'section_header.dart';
import 'sure_image.dart';

/// Design system `ItemCard` (commerce/ItemCard.jsx): square image (radius
/// 12) with a discount badge and a heart, brand caption, one-line title,
/// price with the struck-through compare price under it, and an outline
/// "Add to bag" button. 12 pt between image, text and button.
///
/// Liquid Glass: the heart floats over the photo on a neon-tinted glass
/// disc (same color as the prototype's faded button).
class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.title,
    required this.price,
    this.brand,
    this.imageUrl,
    this.compareAt,
    this.discount,
    this.wished = false,
    this.adding = false,
    this.onTap,
    this.onWish,
    this.onAdd,
  });

  final String title;
  final String price;
  final String? brand;
  final String? imageUrl;
  final String? compareAt;

  /// e.g. `-10%`.
  final String? discount;
  final bool wished;
  final bool adding;
  final VoidCallback? onTap;
  final VoidCallback? onWish;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PressScale(
      onTap: onTap,
      scale: 0.98,
      semanticLabel: '$title, $price',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: SureRadius.all(SureRadius.medium),
                  child: SureImage(imageUrl),
                ),
                if (discount != null)
                  Positioned(left: 9, top: 8, child: _DiscountBadge(discount!)),
                Positioned(
                  right: 6,
                  top: 6,
                  child: _HeartButton(wished: wished, onTap: onWish),
                ),
              ],
            ),
          ),
          const SizedBox(height: SureSpace.x3),
          if (brand != null)
            Text(
              brand!.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: SureText.caption1(SureTypography.medium)
                  .copyWith(color: c.primaryInk),
            ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: SureText.body2(SureTypography.medium).copyWith(color: c.ink),
          ),
          Text(
            price,
            style: SureText.body2(SureTypography.medium).copyWith(color: c.ink),
          ),
          // Kept even without a compare price so cards in a row line up.
          Visibility(
            visible: compareAt != null,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Text(
              compareAt ?? '–',
              style: SureText.caption1().copyWith(
                color: SureColors.strikePrice,
                decoration: TextDecoration.lineThrough,
                decorationColor: SureColors.strikePrice,
              ),
            ),
          ),
          const SizedBox(height: SureSpace.x3),
          _AddToBag(onTap: onAdd, loading: adding),
        ],
      ),
    );
  }
}

class _DiscountBadge extends StatelessWidget {
  const _DiscountBadge(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: SureSpace.x2),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: c.critical,
        shape: const StadiumBorder(),
      ),
      child: Text(
        text,
        style: SureText.caption1(SureTypography.medium)
            .copyWith(color: c.onBadge, height: 1),
      ),
    );
  }
}

class _HeartButton extends StatelessWidget {
  const _HeartButton({required this.wished, this.onTap});

  final bool wished;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final icon = Icon(
      LucideIcons.heart,
      size: 20,
      color: wished ? c.onPrimary : c.primaryInk,
    );
    return Semantics(
      button: true,
      toggled: wished,
      label: wished ? 'Remove from wishlist' : 'Add to wishlist',
      excludeSemantics: true,
      child: PressScale(
        onTap: onTap,
        // Not yet wished it's glass, which swells under the finger instead
        // (iOS 26); the solid wished disc keeps the prototype's press.
        scale: wished ? 0.92 : 1,
        child: SizedBox.square(
          dimension: 36,
          child: wished
              ? DecoratedBox(
                  decoration: BoxDecoration(
                    color: c.primary,
                    shape: BoxShape.circle,
                  ),
                  child: icon,
                )
              // Prototype: `IconButton` faded primary (neon-faded disc,
              // primary-ink heart), here as neon-tinted Liquid Glass.
              : GlassSurface(
                  borderRadius: SureRadius.all(SureRadius.pill),
                  shadow: false,
                  interactive: true,
                  // Scale the token's own opacity: solid in light, 16 % in dark.
                  tint: c.primaryFaded.withValues(
                    alpha: c.primaryFaded.a * 0.94,
                  ),
                  child: Center(child: icon),
                ),
        ),
      ),
    );
  }
}

/// Outline neutral `Button` size medium (36 high, 14 pt, 18 pt bag icon).
class _AddToBag extends StatelessWidget {
  const _AddToBag({this.onTap, this.loading = false});

  final VoidCallback? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Material(
      color: Colors.transparent,
      shape: StadiumBorder(side: BorderSide(color: c.border)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: loading ? null : onTap,
        child: SizedBox(
          height: 36,
          child: Center(
            child: loading
                ? SizedBox.square(
                    dimension: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: c.primaryInk,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(LucideIcons.shoppingBag, size: 18, color: c.ink),
                        const SizedBox(width: SureSpace.x2),
                        Flexible(
                          child: Text(
                            'Add to bag',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: SureText.body3(SureTypography.medium)
                                .copyWith(color: c.ink, height: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
