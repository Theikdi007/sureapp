// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orderDetail)
final orderDetailProvider = OrderDetailFamily._();

final class OrderDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<OrderDetailDto>,
          OrderDetailDto,
          FutureOr<OrderDetailDto>
        >
    with $FutureModifier<OrderDetailDto>, $FutureProvider<OrderDetailDto> {
  OrderDetailProvider._({
    required OrderDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'orderDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderDetailHash();

  @override
  String toString() {
    return r'orderDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<OrderDetailDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<OrderDetailDto> create(Ref ref) {
    final argument = this.argument as String;
    return orderDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderDetailHash() => r'54fd635a1e8654c5978cfc2d8d089ab41142407e';

final class OrderDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<OrderDetailDto>, String> {
  OrderDetailFamily._()
    : super(
        retry: null,
        name: r'orderDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrderDetailProvider call(String number) =>
      OrderDetailProvider._(argument: number, from: this);

  @override
  String toString() => r'orderDetailProvider';
}

@ProviderFor(orderTracking)
final orderTrackingProvider = OrderTrackingFamily._();

final class OrderTrackingProvider
    extends
        $FunctionalProvider<
          AsyncValue<TrackingDto>,
          TrackingDto,
          FutureOr<TrackingDto>
        >
    with $FutureModifier<TrackingDto>, $FutureProvider<TrackingDto> {
  OrderTrackingProvider._({
    required OrderTrackingFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'orderTrackingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderTrackingHash();

  @override
  String toString() {
    return r'orderTrackingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TrackingDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TrackingDto> create(Ref ref) {
    final argument = this.argument as String;
    return orderTracking(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderTrackingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderTrackingHash() => r'08e07cc43ce37dc298643242adfbe5933cea1471';

final class OrderTrackingFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TrackingDto>, String> {
  OrderTrackingFamily._()
    : super(
        retry: null,
        name: r'orderTrackingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrderTrackingProvider call(String number) =>
      OrderTrackingProvider._(argument: number, from: this);

  @override
  String toString() => r'orderTrackingProvider';
}
