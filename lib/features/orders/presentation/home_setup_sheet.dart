import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../design_system/components/order_components.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../cart/data/checkout_dtos.dart';
import '../../cart/presentation/location_sheet.dart';
import '../../catalog/presentation/widgets/catalog_widgets.dart'
    show showApiError;
import '../../home/data/home_dtos.dart' show AddressDto;
import '../../profile/presentation/profile_providers.dart';
import '../data/order_dtos.dart';
import '../data/orders_repository.dart';

/// Prototype "Schedule Home Visit" sheet from product detail.
/// `GET home-setup/slots`, then `POST home-setup/bookings` with one
/// Idempotency-Key per confirm (reused when that confirm is retried).
Future<HomeSetupBookingDto?> showScheduleHomeVisit(
  BuildContext context, {
  required String productId,
  required String device,
}) => showSureSheet<HomeSetupBookingDto>(
  context,
  title: 'Schedule Home Visit',
  builder: (context) => _ScheduleBody(productId: productId, device: device),
);

class _ScheduleBody extends ConsumerStatefulWidget {
  const _ScheduleBody({required this.productId, required this.device});

  final String productId;
  final String device;

  @override
  ConsumerState<_ScheduleBody> createState() => _ScheduleBodyState();
}

class _ScheduleBodyState extends ConsumerState<_ScheduleBody> {
  late Future<List<HomeSetupSlotDayDto>> _days;
  String? _date;
  String? _slot;
  // Picked in this sheet; until then the member's chosen delivery address,
  // else their default one.
  AddressDto? _address;
  bool _sending = false;
  IdempotencyKey? _key;

  @override
  void initState() {
    super.initState();
    _days = ref.read(ordersRepositoryProvider).slots();
  }

  AddressDto? _visitAddress() {
    if (_address case final a?) return a;
    if (ref.watch(deliveryAddressProvider) case final a?) return a;
    final saved = ref.watch(savedAddressesProvider).value ?? const [];
    return saved.where((a) => a.isDefault).firstOrNull ?? saved.firstOrNull;
  }

  Future<void> _changeAddress() async {
    final picked = await showLocationSheet(
      context,
      selectedId: _visitAddress()?.id,
    );
    if (picked != null && mounted) setState(() => _address = picked);
  }

  Future<void> _confirm() async {
    final address = _visitAddress();
    if (_date == null || _slot == null || address == null || _sending) {
      return;
    }
    _key ??= IdempotencyKey.generate();
    setState(() => _sending = true);
    try {
      final b = await ref
          .read(ordersRepositoryProvider)
          .book(
            BookHomeSetupRequest(
              productId: widget.productId,
              device: widget.device,
              date: _date!,
              slot: _slot!,
              // The technician and the branch email need the address.
              addressId: address.id,
            ),
            key: _key!,
          );
      if (mounted) Navigator.of(context).pop(b);
    } on Object catch (e) {
      // Any server answer ends this action; a timeout keeps the key.
      if (e is ApiException && e.status != null) _key = null;
      if (!mounted) return;
      showApiError(context, e);
      if (e is ApiException &&
          (e.code == 'mobile.slot_full' || e.code == 'mobile.slot_invalid')) {
        setState(() {
          _slot = null;
          _days = ref.read(ordersRepositoryProvider).slots();
        });
      }
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final label = SureText.caption1().copyWith(color: c.inkFaded);
    return FutureBuilder(
      future: _days,
      builder: (context, snap) {
        if (snap.hasError) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Text(
                  snap.error is ApiException
                      ? (snap.error! as ApiException).userMessage
                      : "Couldn't load visit times.",
                  textAlign: TextAlign.center,
                  style: SureText.body3().copyWith(color: c.inkFaded),
                ),
                const SizedBox(height: 12),
                SureLink(
                  'Try again',
                  onTap: () => setState(
                    () => _days = ref.read(ordersRepositoryProvider).slots(),
                  ),
                ),
              ],
            ),
          );
        }
        final days = snap.data;
        if (days == null) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Center(
              child: SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: c.primaryInk,
                ),
              ),
            ),
          );
        }
        final day = days.where((d) => d.date == _date).firstOrNull;
        final address = _visitAddress();
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Pick a date', style: label),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final d in days) ...[
                      if (d != days.first) const SizedBox(width: 8),
                      CalendarCell(
                        weekday: d.weekday,
                        day: d.day,
                        selected: d.date == _date,
                        onTap: () => setState(() {
                          _date = d.date;
                          final still = d.slots.any(
                            (s) => s.slot == _slot && s.available,
                          );
                          if (!still) _slot = null;
                        }),
                      ),
                    ],
                  ],
                ),
              ),
              // Prototype: 4 under the cells, then 14 above the label.
              const SizedBox(height: 18),
              Text('Pick a time', style: label),
              const SizedBox(height: 8),
              if (day == null)
                Text(
                  'Choose a date to see times',
                  style: SureText.caption1().copyWith(color: c.inkFaded),
                )
              else
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final s in day.slots)
                      SmallChoiceButton(
                        label: s.label,
                        selected: s.slot == _slot,
                        onTap: s.available
                            ? () => setState(() => _slot = s.slot)
                            : null,
                      ),
                  ],
                ),
              const SizedBox(height: 18),
              Text('Visit address', style: label),
              const SizedBox(height: 8),
              _AddressRow(address: address, onChange: _changeAddress),
              const SizedBox(height: 18),
              SureButton(
                label: 'Confirm schedule',
                loading: _sending,
                onPressed: _date != null && _slot != null && address != null
                    ? _confirm
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}

/// The visit address with Change (opens "Choose your location", which also
/// lets the member add one).
class _AddressRow extends StatelessWidget {
  const _AddressRow({required this.address, required this.onChange});

  final AddressDto? address;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final a = address;
    return Semantics(
      button: true,
      label: a == null
          ? 'Add a visit address'
          : 'Visit address ${a.label}, ${a.fullText}. Change',
      excludeSemantics: true,
      child: InkWell(
        onTap: onChange,
        borderRadius: SureRadius.all(SureRadius.large),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: SureRadius.all(SureRadius.large),
            border: Border.all(color: c.border),
          ),
          child: Row(
            children: [
              Icon(LucideIcons.mapPinHouse, size: 20, color: c.ink),
              const SizedBox(width: 12),
              Expanded(
                child: a == null
                    ? Text(
                        'Add an address for the visit',
                        style: SureText.body3().copyWith(color: c.inkFaded),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            a.label,
                            style: SureText.body3(SureTypography.medium)
                                .copyWith(color: c.ink),
                          ),
                          Text(
                            a.fullText,
                            style: SureText.caption1().copyWith(
                              color: c.inkFaded,
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(width: 8),
              Text(
                a == null ? 'Add' : 'Change',
                style: SureText.body3(SureTypography.medium)
                    .copyWith(color: c.primaryInk),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
