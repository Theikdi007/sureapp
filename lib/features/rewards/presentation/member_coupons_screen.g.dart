// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_coupons_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(memberBenefits)
final memberBenefitsProvider = MemberBenefitsProvider._();

final class MemberBenefitsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MemberBenefitDto>>,
          List<MemberBenefitDto>,
          FutureOr<List<MemberBenefitDto>>
        >
    with
        $FutureModifier<List<MemberBenefitDto>>,
        $FutureProvider<List<MemberBenefitDto>> {
  MemberBenefitsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memberBenefitsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memberBenefitsHash();

  @$internal
  @override
  $FutureProviderElement<List<MemberBenefitDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MemberBenefitDto>> create(Ref ref) {
    return memberBenefits(ref);
  }
}

String _$memberBenefitsHash() => r'3442cfb35a70f8e1103850b1fada255a8d476375';
