// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_detail_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rewardDetail)
final rewardDetailProvider = RewardDetailFamily._();

final class RewardDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<RewardDetailDto>,
          RewardDetailDto,
          FutureOr<RewardDetailDto>
        >
    with $FutureModifier<RewardDetailDto>, $FutureProvider<RewardDetailDto> {
  RewardDetailProvider._({
    required RewardDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'rewardDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$rewardDetailHash();

  @override
  String toString() {
    return r'rewardDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<RewardDetailDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RewardDetailDto> create(Ref ref) {
    final argument = this.argument as String;
    return rewardDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RewardDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$rewardDetailHash() => r'0e89fe915b90bec566d50446a5f2a5f02b2dbf8a';

final class RewardDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<RewardDetailDto>, String> {
  RewardDetailFamily._()
    : super(
        retry: null,
        name: r'rewardDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RewardDetailProvider call(String id) =>
      RewardDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'rewardDetailProvider';
}
