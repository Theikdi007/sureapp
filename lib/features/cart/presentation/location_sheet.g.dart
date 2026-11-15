// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_sheet.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The address the member picked in "Choose your location" (Home header or
/// checkout). Null means the API's default (`home.deliverTo`, the quote's
/// address). Cleared when another member signs in.

@ProviderFor(DeliveryAddress)
final deliveryAddressProvider = DeliveryAddressProvider._();

/// The address the member picked in "Choose your location" (Home header or
/// checkout). Null means the API's default (`home.deliverTo`, the quote's
/// address). Cleared when another member signs in.
final class DeliveryAddressProvider
    extends $NotifierProvider<DeliveryAddress, AddressDto?> {
  /// The address the member picked in "Choose your location" (Home header or
  /// checkout). Null means the API's default (`home.deliverTo`, the quote's
  /// address). Cleared when another member signs in.
  DeliveryAddressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deliveryAddressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deliveryAddressHash();

  @$internal
  @override
  DeliveryAddress create() => DeliveryAddress();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddressDto? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddressDto?>(value),
    );
  }
}

String _$deliveryAddressHash() => r'9d5bf76281dfa4ee817ffee739768e992d70f5d1';

/// The address the member picked in "Choose your location" (Home header or
/// checkout). Null means the API's default (`home.deliverTo`, the quote's
/// address). Cleared when another member signs in.

abstract class _$DeliveryAddress extends $Notifier<AddressDto?> {
  AddressDto? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AddressDto?, AddressDto?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddressDto?, AddressDto?>,
              AddressDto?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
