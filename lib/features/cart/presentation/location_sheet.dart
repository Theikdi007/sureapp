import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/api_exception.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../home/data/home_dtos.dart' show AddressDto;
import '../../profile/presentation/address_sheet.dart';
import '../../profile/presentation/profile_providers.dart';
import '../../repairs/presentation/repairs_screen.dart' show LoadingBlock;

part 'location_sheet.g.dart';

/// The address the member picked in "Choose your location" (Home header or
/// checkout). Null means the API's default (`home.deliverTo`, the quote's
/// address). Kept across launches; an address that is gone, or belongs to
/// another member, falls back to the default.
@Riverpod(keepAlive: true)
class DeliveryAddress extends _$DeliveryAddress {
  @override
  AddressDto? build() {
    ref.watch(currentMemberIdProvider);
    Future.microtask(_restore);
    return null;
  }

  Future<void> _restore() async {
    final id = await ref.read(appPrefsProvider).deliveryAddressId();
    if (id == null || !ref.mounted || state != null) return;
    try {
      final saved = await ref.read(savedAddressesProvider.future);
      if (!ref.mounted || state != null) return;
      state = saved.where((a) => a.id == id).firstOrNull;
    } on Object {
      // Signed out or offline: the API's default address shows.
    }
  }

  void choose(AddressDto address) {
    state = address;
    ref.read(appPrefsProvider).setDeliveryAddressId(address.id);
  }

  /// After an address is edited or deleted elsewhere.
  void sync(List<AddressDto> saved) {
    final current = state;
    if (current == null) return;
    state = saved.where((a) => a.id == current.id).firstOrNull;
    if (state == null) ref.read(appPrefsProvider).setDeliveryAddressId(null);
  }
}

IconData addressIcon(String? icon) => switch (icon) {
  'briefcase' => LucideIcons.briefcase,
  'building' || 'building-2' => LucideIcons.building2,
  'house' || 'home' => LucideIcons.house,
  _ => LucideIcons.mapPinHouse,
};

/// Prototype "Choose your location" (`GET addresses`). Returns the picked
/// address, or null when dismissed. Also lets the member add one.
Future<AddressDto?> showLocationSheet(
  BuildContext context, {
  String? selectedId,
}) => showSureSheet<AddressDto>(
  context,
  title: 'Choose your location',
  // Prototype: title only, no close button (tap outside to dismiss).
  showClose: false,
  builder: (_) => _LocationBody(selectedId: selectedId),
);

class _LocationBody extends ConsumerWidget {
  const _LocationBody({required this.selectedId});

  final String? selectedId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final addresses = ref.watch(savedAddressesProvider);
    final list = addresses.value ?? const <AddressDto>[];
    final addButton = SureButton(
      label: list.isEmpty ? 'Add an address' : 'Add new address',
      startIcon: LucideIcons.plus,
      variant: list.isEmpty
          ? SureButtonVariant.solid
          : SureButtonVariant.outline,
      // A new address is the one the member means to use: pick it.
      onPressed: () async {
        final added = await showAddressSheet(context);
        if (added != null && context.mounted) Navigator.of(context).pop(added);
      },
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          switch (addresses) {
            AsyncData() when list.isEmpty => const EmptyState(
              icon: LucideIcons.mapPin,
              title: 'No saved addresses',
              description: 'Add one to see delivery options for your area',
            ),
            AsyncData() => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final a in list) ...[
                  SelectRow(
                    icon: addressIcon(a.icon),
                    title: a.label,
                    description: a.fullText,
                    selected: a.id == selectedId,
                    onSelect: () => Navigator.of(context).pop(a),
                  ),
                  const SizedBox(height: 12),
                ],
              ],
            ),
            AsyncError(:final error) when !addresses.isLoading => EmptyState(
              icon: LucideIcons.wifiOff,
              title: "Couldn't load your addresses",
              description: error is ApiException ? error.userMessage : null,
              action: SureLink(
                'Try again',
                onTap: () => ref.invalidate(savedAddressesProvider),
              ),
            ),
            _ => const LoadingBlock(),
          },
          if (addresses.hasValue && list.length < 10) addButton,
          const SizedBox(height: 12),
          Text(
            'Delivery availability depends on your area',
            textAlign: TextAlign.center,
            style: SureText.caption1().copyWith(color: c.inkFaded),
          ),
          const SizedBox(height: SureSpace.x1),
        ],
      ),
    );
  }
}
