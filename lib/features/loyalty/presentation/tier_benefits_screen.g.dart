// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tier_benefits_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tierBenefits)
final tierBenefitsProvider = TierBenefitsProvider._();

final class TierBenefitsProvider
    extends
        $FunctionalProvider<
          AsyncValue<TierBenefitsDto>,
          TierBenefitsDto,
          FutureOr<TierBenefitsDto>
        >
    with $FutureModifier<TierBenefitsDto>, $FutureProvider<TierBenefitsDto> {
  TierBenefitsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tierBenefitsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tierBenefitsHash();

  @$internal
  @override
  $FutureProviderElement<TierBenefitsDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TierBenefitsDto> create(Ref ref) {
    return tierBenefits(ref);
  }
}

String _$tierBenefitsHash() => r'4404a775da030c01ee8192897fabcfae7e349ab0';
