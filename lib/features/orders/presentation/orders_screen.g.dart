// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orderList)
final orderListProvider = OrderListFamily._();

final class OrderListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderSummaryDto>>,
          List<OrderSummaryDto>,
          FutureOr<List<OrderSummaryDto>>
        >
    with
        $FutureModifier<List<OrderSummaryDto>>,
        $FutureProvider<List<OrderSummaryDto>> {
  OrderListProvider._({
    required OrderListFamily super.from,
    required OrderTab super.argument,
  }) : super(
         retry: null,
         name: r'orderListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderListHash();

  @override
  String toString() {
    return r'orderListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<OrderSummaryDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderSummaryDto>> create(Ref ref) {
    final argument = this.argument as OrderTab;
    return orderList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderListHash() => r'19c9b2cbfce915330bf80776f171fa4b297c88a2';

final class OrderListFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<OrderSummaryDto>>, OrderTab> {
  OrderListFamily._()
    : super(
        retry: null,
        name: r'orderListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrderListProvider call(OrderTab tab) =>
      OrderListProvider._(argument: tab, from: this);

  @override
  String toString() => r'orderListProvider';
}

@ProviderFor(homeSetupBookings)
final homeSetupBookingsProvider = HomeSetupBookingsProvider._();

final class HomeSetupBookingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<HomeSetupBookingDto>>,
          List<HomeSetupBookingDto>,
          FutureOr<List<HomeSetupBookingDto>>
        >
    with
        $FutureModifier<List<HomeSetupBookingDto>>,
        $FutureProvider<List<HomeSetupBookingDto>> {
  HomeSetupBookingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeSetupBookingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeSetupBookingsHash();

  @$internal
  @override
  $FutureProviderElement<List<HomeSetupBookingDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<HomeSetupBookingDto>> create(Ref ref) {
    return homeSetupBookings(ref);
  }
}

String _$homeSetupBookingsHash() => r'b9b70587063d8abd9fdb747603cf541f58d32f0f';

/// Asks the Orders tab to show a tab ('all', 'unfulfilled', 'fulfilled',
/// 'setup') next time it builds, e.g. Profile › Scheduled Home Services.

@ProviderFor(RequestedOrdersTab)
final requestedOrdersTabProvider = RequestedOrdersTabProvider._();

/// Asks the Orders tab to show a tab ('all', 'unfulfilled', 'fulfilled',
/// 'setup') next time it builds, e.g. Profile › Scheduled Home Services.
final class RequestedOrdersTabProvider
    extends $NotifierProvider<RequestedOrdersTab, String?> {
  /// Asks the Orders tab to show a tab ('all', 'unfulfilled', 'fulfilled',
  /// 'setup') next time it builds, e.g. Profile › Scheduled Home Services.
  RequestedOrdersTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'requestedOrdersTabProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$requestedOrdersTabHash();

  @$internal
  @override
  RequestedOrdersTab create() => RequestedOrdersTab();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$requestedOrdersTabHash() =>
    r'9f72131fd294c0b04e6c0136af538ece0872a96a';

/// Asks the Orders tab to show a tab ('all', 'unfulfilled', 'fulfilled',
/// 'setup') next time it builds, e.g. Profile › Scheduled Home Services.

abstract class _$RequestedOrdersTab extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(homeSetupBooking)
final homeSetupBookingProvider = HomeSetupBookingFamily._();

final class HomeSetupBookingProvider
    extends
        $FunctionalProvider<
          AsyncValue<HomeSetupBookingDto>,
          HomeSetupBookingDto,
          FutureOr<HomeSetupBookingDto>
        >
    with
        $FutureModifier<HomeSetupBookingDto>,
        $FutureProvider<HomeSetupBookingDto> {
  HomeSetupBookingProvider._({
    required HomeSetupBookingFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'homeSetupBookingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$homeSetupBookingHash();

  @override
  String toString() {
    return r'homeSetupBookingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<HomeSetupBookingDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HomeSetupBookingDto> create(Ref ref) {
    final argument = this.argument as String;
    return homeSetupBooking(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is HomeSetupBookingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$homeSetupBookingHash() => r'dd11ed009b1944c0d8b3d656af040e019dafb945';

final class HomeSetupBookingFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<HomeSetupBookingDto>, String> {
  HomeSetupBookingFamily._()
    : super(
        retry: null,
        name: r'homeSetupBookingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HomeSetupBookingProvider call(String number) =>
      HomeSetupBookingProvider._(argument: number, from: this);

  @override
  String toString() => r'homeSetupBookingProvider';
}
