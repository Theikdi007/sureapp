import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';

/// On-screen number pad from the prototype's phone and code screens:
/// 3 columns 8 apart, 52 pt keys, radius 12, 22/500 digits, blank bottom-left
/// and a delete key bottom-right. Keys scale to 0.96 while pressed.
///
/// A hardware keyboard works too (digits and Backspace) while [focusNode]
/// or the pad's own focus is active.
class NumberKeypad extends StatefulWidget {
  const NumberKeypad({
    super.key,
    required this.onDigit,
    required this.onDelete,
    this.enabled = true,
  });

  final ValueChanged<String> onDigit;
  final VoidCallback onDelete;
  final bool enabled;

  @override
  State<NumberKeypad> createState() => _NumberKeypadState();
}

class _NumberKeypadState extends State<NumberKeypad> {
  final _focus = FocusNode(debugLabel: 'NumberKeypad');

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (!widget.enabled || event is KeyUpEvent) return KeyEventResult.ignored;
    final ch = event.character;
    if (ch != null && RegExp(r'^\d$').hasMatch(ch)) {
      widget.onDigit(ch);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.backspace) {
      widget.onDelete();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    const rows = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['', '0', 'del'],
    ];
    return Focus(
      focusNode: _focus,
      autofocus: true,
      onKeyEvent: _onKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var r = 0; r < rows.length; r++) ...[
            if (r > 0) const SizedBox(height: SureSpace.x2),
            Row(
              children: [
                for (var k = 0; k < 3; k++) ...[
                  if (k > 0) const SizedBox(width: SureSpace.x2),
                  Expanded(
                    child: _Key(
                      value: rows[r][k],
                      enabled: widget.enabled,
                      onTap: switch (rows[r][k]) {
                        '' => null,
                        'del' => widget.onDelete,
                        final d => () => widget.onDigit(d),
                      },
                    ),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _Key extends StatefulWidget {
  const _Key({required this.value, required this.enabled, this.onTap});

  final String value;
  final bool enabled;
  final VoidCallback? onTap;

  @override
  State<_Key> createState() => _KeyState();
}

class _KeyState extends State<_Key> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    if (widget.value.isEmpty) return const SizedBox(height: 52);
    final c = context.colors;
    final isDelete = widget.value == 'del';
    return Semantics(
      button: true,
      label: isDelete ? 'Delete' : widget.value,
      excludeSemantics: true,
      child: AnimatedScale(
        scale: _down ? 0.96 : 1,
        duration: const Duration(milliseconds: 60),
        child: Material(
          color: c.keypad,
          borderRadius: SureRadius.all(SureRadius.medium),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.enabled ? widget.onTap : null,
            onHighlightChanged: (v) => setState(() => _down = v),
            child: SizedBox(
              height: 52,
              child: Center(
                child: isDelete
                    ? Icon(LucideIcons.delete, size: 24, color: c.ink)
                    : Text(
                        widget.value,
                        style: TextStyle(
                          fontFamily: SureTypography.fontFamily,
                          fontSize: 22,
                          fontWeight: SureTypography.medium,
                          color: c.ink,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
