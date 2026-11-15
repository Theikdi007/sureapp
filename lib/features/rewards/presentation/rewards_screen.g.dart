// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rewardsHome)
final rewardsHomeProvider = RewardsHomeProvider._();

final class RewardsHomeProvider
    extends
        $FunctionalProvider<
          AsyncValue<RewardsHomeDto>,
          RewardsHomeDto,
          FutureOr<RewardsHomeDto>
        >
    with $FutureModifier<RewardsHomeDto>, $FutureProvider<RewardsHomeDto> {
  RewardsHomeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rewardsHomeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rewardsHomeHash();

  @$internal
  @override
  $FutureProviderElement<RewardsHomeDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RewardsHomeDto> create(Ref ref) {
    return rewardsHome(ref);
  }
}

String _$rewardsHomeHash() => r'd1c797f9d681496514ad9f004762d5058faeece6';
