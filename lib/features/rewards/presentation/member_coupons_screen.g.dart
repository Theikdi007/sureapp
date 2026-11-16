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

@ProviderFor(memberBenefitDetail)
final memberBenefitDetailProvider = MemberBenefitDetailFamily._();

final class MemberBenefitDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<MemberBenefitDto>,
          MemberBenefitDto,
          FutureOr<MemberBenefitDto>
        >
    with $FutureModifier<MemberBenefitDto>, $FutureProvider<MemberBenefitDto> {
  MemberBenefitDetailProvider._({
    required MemberBenefitDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'memberBenefitDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$memberBenefitDetailHash();

  @override
  String toString() {
    return r'memberBenefitDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MemberBenefitDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MemberBenefitDto> create(Ref ref) {
    final argument = this.argument as String;
    return memberBenefitDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MemberBenefitDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$memberBenefitDetailHash() =>
    r'98b043588400d4758c374193f0ca283212d3e7bc';

final class MemberBenefitDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MemberBenefitDto>, String> {
  MemberBenefitDetailFamily._()
    : super(
        retry: null,
        name: r'memberBenefitDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MemberBenefitDetailProvider call(String id) =>
      MemberBenefitDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'memberBenefitDetailProvider';
}
