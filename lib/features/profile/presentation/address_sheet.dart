import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_dialog.dart';
import '../../../design_system/components/sure_text_field.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../home/data/home_dtos.dart' show AddressDto;
import '../data/profile_repository.dart';
import '../../cart/presentation/location_sheet.dart'
    show deliveryAddressProvider;
import 'profile_providers.dart';

/// Add ([address] null) or edit a saved address.
/// Returns the new address after an add; null after an edit or a dismiss.
Future<AddressDto?> showAddressSheet(
  BuildContext context, {
  AddressDto? address,
}) => showSureSheet<AddressDto>(
  context,
  title: address == null ? 'Add New Address' : 'Edit Address',
  maxHeightFactor: 0.9,
  builder: (_) => _AddressForm(address: address),
);

class _AddressForm extends ConsumerStatefulWidget {
  const _AddressForm({this.address});

  final AddressDto? address;

  @override
  ConsumerState<_AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends ConsumerState<_AddressForm> {
  late final _label = TextEditingController(
    text: widget.address?.label ?? 'Home',
  );
  late final _line1 = TextEditingController(text: widget.address?.line1);
  late final _line2 = TextEditingController(text: widget.address?.line2);
  late final _township = TextEditingController(text: widget.address?.township);
  late final _city = TextEditingController(
    text: widget.address?.city ?? 'Yangon',
  );
  late final _instructions = TextEditingController(
    text: widget.address?.instructions,
  );
  late bool _isDefault = widget.address?.isDefault ?? false;
  bool _busy = false;
  ApiException? _error;

  /// One key per new address; reused if the save is retried.
  IdempotencyKey? _key;

  List<TextEditingController> get _all => [
    _label,
    _line1,
    _line2,
    _township,
    _city,
    _instructions,
  ];

  @override
  void initState() {
    super.initState();
    for (final c in _all) {
      c.addListener(_edited);
    }
  }

  @override
  void dispose() {
    for (final c in _all) {
      c.dispose();
    }
    super.dispose();
  }

  void _edited() => setState(() {
    _error = null;
    _key = null;
  });

  bool get _valid =>
      _label.text.trim().isNotEmpty &&
      _line1.text.trim().isNotEmpty &&
      _township.text.trim().isNotEmpty;

  String? _opt(TextEditingController c) =>
      c.text.trim().isEmpty ? null : c.text.trim();

  AddressRequest get _request => AddressRequest(
    label: _label.text.trim(),
    line1: _line1.text.trim(),
    line2: _opt(_line2),
    township: _township.text.trim(),
    city: _opt(_city),
    instructions: _opt(_instructions),
    icon: widget.address?.icon,
    isDefault: _isDefault,
  );

  /// Re-read the list; the delivery choice follows edits and deletes.
  Future<void> _syncChoice() async {
    ref.invalidate(savedAddressesProvider);
    try {
      final saved = await ref.read(savedAddressesProvider.future);
      ref.read(deliveryAddressProvider.notifier).sync(saved);
    } on Object {
      // The list reloads when next shown.
    }
  }

  Future<void> _save() async {
    FocusScope.of(context).unfocus();
    final repo = ref.read(profileRepositoryProvider);
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final AddressDto? saved;
      if (widget.address case final a?) {
        await repo.updateAddress(a.id, _request);
        saved = null;
      } else {
        saved = await repo.addAddress(
          _request,
          key: _key ??= IdempotencyKey.generate(),
        );
      }
      await _syncChoice();
      if (!mounted) return;
      // The toast sits in the root overlay, so it outlives the sheet.
      SureToast.show(
        context,
        widget.address == null ? 'Address saved' : 'Address updated',
        icon: LucideIcons.mapPin,
      );
      Navigator.of(context).pop(saved);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _delete(AddressDto a) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => SureDialog(
        title: const Text('Delete this address?'),
        content: Text(a.fullText),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref.read(profileRepositoryProvider).deleteAddress(a.id);
      await _syncChoice();
      if (!mounted) return;
      SureToast.show(
        context,
        'Address removed',
        icon: LucideIcons.trash2,
        color: SureToastColor.neutral,
      );
      Navigator.of(context).pop();
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final e = _error;
    const keys = [
      'label',
      'line1',
      'line2',
      'township',
      'city',
      'instructions',
    ];
    final general = e != null && !keys.any((k) => e.fieldMessage(k) != null)
        ? e.userMessage
        : null;

    Widget field(
      String label,
      TextEditingController ctl,
      String key, {
      String? hint,
      Iterable<String>? autofill,
    }) => Padding(
      padding: const EdgeInsets.only(bottom: SureSpace.x3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FieldLabel(label),
          const SizedBox(height: 6),
          SureTextField(
            controller: ctl,
            placeholder: hint,
            semanticLabel: label,
            enabled: !_busy,
            autofillHints: autofill,
            error: e?.fieldMessage(key) != null,
          ),
          FieldError(e?.fieldMessage(key)),
        ],
      ),
    );

    // The sheet itself sits above the keyboard (showSureSheet).
    return SingleChildScrollView(
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            field('Label', _label, 'label', hint: 'Home, Office…'),
            field(
              'Address',
              _line1,
              'line1',
              hint: 'House no., street',
              autofill: const [AutofillHints.streetAddressLine1],
            ),
            field(
              'Address line 2 (optional)',
              _line2,
              'line2',
              hint: 'Building, floor, unit',
              autofill: const [AutofillHints.streetAddressLine2],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: field('Township', _township, 'township')),
                const SizedBox(width: SureSpace.x3),
                Expanded(
                  child: field(
                    'City',
                    _city,
                    'city',
                    autofill: const [AutofillHints.addressCity],
                  ),
                ),
              ],
            ),
            field(
              'Delivery note (optional)',
              _instructions,
              'instructions',
              hint: 'Landmark, gate code…',
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Use as my default address',
                    style: SureText.body3(SureTypography.medium)
                        .copyWith(color: c.ink),
                  ),
                ),
                SureSwitch(
                  value: _isDefault,
                  label: 'Use as my default address',
                  onChanged: _busy
                      ? null
                      : (v) => setState(() {
                          _isDefault = v;
                          _key = null;
                        }),
                ),
              ],
            ),
            if (general != null) ...[
              const SizedBox(height: SureSpace.x3),
              InlineAlert(
                icon: LucideIcons.circleAlert,
                critical: true,
                text: general,
              ),
            ],
            const SizedBox(height: 10),
            SureButton(
              label: widget.address == null ? 'Save Address' : 'Update Address',
              size: SureButtonSize.medium,
              loading: _busy,
              onPressed: _valid && !_busy ? _save : null,
            ),
            if (widget.address case final a?) ...[
              const SizedBox(height: 10),
              SureButton(
                label: 'Delete address',
                size: SureButtonSize.medium,
                variant: SureButtonVariant.faded,
                critical: true,
                startIcon: LucideIcons.trash2,
                onPressed: _busy ? null : () => _delete(a),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
