// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warranty_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(warrantyPlans)
final warrantyPlansProvider = WarrantyPlansProvider._();

final class WarrantyPlansProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WarrantyPlanDto>>,
          List<WarrantyPlanDto>,
          FutureOr<List<WarrantyPlanDto>>
        >
    with
        $FutureModifier<List<WarrantyPlanDto>>,
        $FutureProvider<List<WarrantyPlanDto>> {
  WarrantyPlansProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'warrantyPlansProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$warrantyPlansHash();

  @$internal
  @override
  $FutureProviderElement<List<WarrantyPlanDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<WarrantyPlanDto>> create(Ref ref) {
    return warrantyPlans(ref);
  }
}

String _$warrantyPlansHash() => r'052407c7951de2434cb14216bd996ce126a19813';

@ProviderFor(warrantyPlanDetail)
final warrantyPlanDetailProvider = WarrantyPlanDetailFamily._();

final class WarrantyPlanDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<WarrantyPlanDetailDto>,
          WarrantyPlanDetailDto,
          FutureOr<WarrantyPlanDetailDto>
        >
    with
        $FutureModifier<WarrantyPlanDetailDto>,
        $FutureProvider<WarrantyPlanDetailDto> {
  WarrantyPlanDetailProvider._({
    required WarrantyPlanDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'warrantyPlanDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$warrantyPlanDetailHash();

  @override
  String toString() {
    return r'warrantyPlanDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<WarrantyPlanDetailDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WarrantyPlanDetailDto> create(Ref ref) {
    final argument = this.argument as String;
    return warrantyPlanDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WarrantyPlanDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$warrantyPlanDetailHash() =>
    r'af3873acd75df0f02bb99355bce39769212048bd';

final class WarrantyPlanDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<WarrantyPlanDetailDto>, String> {
  WarrantyPlanDetailFamily._()
    : super(
        retry: null,
        name: r'warrantyPlanDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WarrantyPlanDetailProvider call(String id) =>
      WarrantyPlanDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'warrantyPlanDetailProvider';
}

@ProviderFor(warrantyClaims)
final warrantyClaimsProvider = WarrantyClaimsProvider._();

final class WarrantyClaimsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WarrantyClaimDto>>,
          List<WarrantyClaimDto>,
          FutureOr<List<WarrantyClaimDto>>
        >
    with
        $FutureModifier<List<WarrantyClaimDto>>,
        $FutureProvider<List<WarrantyClaimDto>> {
  WarrantyClaimsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'warrantyClaimsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$warrantyClaimsHash();

  @$internal
  @override
  $FutureProviderElement<List<WarrantyClaimDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<WarrantyClaimDto>> create(Ref ref) {
    return warrantyClaims(ref);
  }
}

String _$warrantyClaimsHash() => r'86ed84ab35a97a3ef910ac4ed149cce9a87c4da7';

@ProviderFor(warrantyClaimPhoto)
final warrantyClaimPhotoProvider = WarrantyClaimPhotoFamily._();

final class WarrantyClaimPhotoProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List>,
          Uint8List,
          FutureOr<Uint8List>
        >
    with $FutureModifier<Uint8List>, $FutureProvider<Uint8List> {
  WarrantyClaimPhotoProvider._({
    required WarrantyClaimPhotoFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'warrantyClaimPhotoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$warrantyClaimPhotoHash();

  @override
  String toString() {
    return r'warrantyClaimPhotoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Uint8List> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List> create(Ref ref) {
    final argument = this.argument as String;
    return warrantyClaimPhoto(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WarrantyClaimPhotoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$warrantyClaimPhotoHash() =>
    r'7803daea242648f2b4589f15b1d6b606124b61e2';

final class WarrantyClaimPhotoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List>, String> {
  WarrantyClaimPhotoFamily._()
    : super(
        retry: null,
        name: r'warrantyClaimPhotoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WarrantyClaimPhotoProvider call(String number) =>
      WarrantyClaimPhotoProvider._(argument: number, from: this);

  @override
  String toString() => r'warrantyClaimPhotoProvider';
}
