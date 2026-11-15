// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_store_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storeList)
final storeListProvider = StoreListProvider._();

final class StoreListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StoreDto>>,
          List<StoreDto>,
          FutureOr<List<StoreDto>>
        >
    with $FutureModifier<List<StoreDto>>, $FutureProvider<List<StoreDto>> {
  StoreListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storeListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storeListHash();

  @$internal
  @override
  $FutureProviderElement<List<StoreDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<StoreDto>> create(Ref ref) {
    return storeList(ref);
  }
}

String _$storeListHash() => r'358327179c0efff5bc334628727baac0552c88c4';
