// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pointsHistory)
final pointsHistoryProvider = PointsHistoryFamily._();

final class PointsHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PointEntryDto>>,
          List<PointEntryDto>,
          FutureOr<List<PointEntryDto>>
        >
    with
        $FutureModifier<List<PointEntryDto>>,
        $FutureProvider<List<PointEntryDto>> {
  PointsHistoryProvider._({
    required PointsHistoryFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'pointsHistoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pointsHistoryHash();

  @override
  String toString() {
    return r'pointsHistoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<PointEntryDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PointEntryDto>> create(Ref ref) {
    final argument = this.argument as bool;
    return pointsHistory(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PointsHistoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pointsHistoryHash() => r'0867944295bd07828850156436c06459e2191863';

final class PointsHistoryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<PointEntryDto>>, bool> {
  PointsHistoryFamily._()
    : super(
        retry: null,
        name: r'pointsHistoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PointsHistoryProvider call(bool club) =>
      PointsHistoryProvider._(argument: club, from: this);

  @override
  String toString() => r'pointsHistoryProvider';
}
