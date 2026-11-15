import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';

/// Design system `TextField` (forms/TextField.jsx), `outline` / `large`:
/// 48 high, radius 12, 1 px `border-neutral` (critical on error), 14 pt
/// side padding, 18 pt start icon in `ink-faded` 8 pt from the text, 16 pt
/// text.
class SureTextField extends StatelessWidget {
  const SureTextField({
    super.key,
    this.controller,
    this.placeholder,
    this.startIcon,
    this.error = false,
    this.obscureText = false,
    this.autofocus = false,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onChanged,
    this.onSubmitted,
    this.semanticLabel,
    this.code = false,
  });

  /// Codes and IDs: capitals, no autocorrect or smart punctuation.
  final bool code;

  final TextEditingController? controller;
  final String? placeholder;
  final IconData? startIcon;
  final bool error;
  final bool obscureText;
  final bool autofocus;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  /// Read by screen readers (the visual label sits above the field).
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final border = OutlineInputBorder(
      borderRadius: SureRadius.all(SureRadius.medium),
      borderSide: BorderSide(color: error ? c.critical : c.border),
    );
    return Semantics(
      label: semanticLabel,
      child: Opacity(
        opacity: enabled ? 1 : 0.6,
        child: TextField(
          controller: controller,
          autofocus: autofocus,
          enabled: enabled,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          autofillHints: autofillHints,
          autocorrect: !code,
          enableSuggestions: !code,
          smartDashesType: code ? SmartDashesType.disabled : null,
          smartQuotesType: code ? SmartQuotesType.disabled : null,
          textCapitalization: code
              ? TextCapitalization.characters
              : TextCapitalization.none,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          cursorColor: c.primaryInk,
          style: SureText.body2().copyWith(color: c.ink),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: c.raised,
            hintText: placeholder,
            hintStyle: SureText.body2().copyWith(color: c.inkFaded),
            constraints: const BoxConstraints(minHeight: 48),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            prefixIcon: startIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 14,
                      end: SureSpace.x2,
                    ),
                    child: Icon(startIcon, size: 18, color: c.inkFaded),
                  ),
            prefixIconConstraints: const BoxConstraints(),
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            disabledBorder: border,
            errorBorder: border,
            focusedErrorBorder: border,
          ),
        ),
      ),
    );
  }
}

/// 13/500 `ink-faded` label above a field (prototype forms).
class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontFamily: SureTypography.fontFamily,
      fontSize: 13,
      height: 18 / 13,
      fontWeight: SureTypography.medium,
      color: context.colors.inkFaded,
    ),
  );
}

/// 12/500 critical text under a field (prototype `pwdErr`), announced when
/// it appears.
class FieldError extends StatelessWidget {
  const FieldError(this.message, {super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    if (message == null) return const SizedBox.shrink();
    return Semantics(
      liveRegion: true,
      child: Text(
        message!,
        style: SureText.caption1(SureTypography.medium)
            .copyWith(color: context.colors.badge),
      ),
    );
  }
}
