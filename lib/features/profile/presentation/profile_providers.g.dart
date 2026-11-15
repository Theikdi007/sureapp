// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Who is signed in: memberId, '' when unknown, null when signed out. Only
/// notifies when that changes.

@ProviderFor(currentMemberId)
final currentMemberIdProvider = CurrentMemberIdProvider._();

/// Who is signed in: memberId, '' when unknown, null when signed out. Only
/// notifies when that changes.

final class CurrentMemberIdProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  /// Who is signed in: memberId, '' when unknown, null when signed out. Only
  /// notifies when that changes.
  CurrentMemberIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentMemberIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentMemberIdHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return currentMemberId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$currentMemberIdHash() => r'20c44fb1f58cf8ead1e013b325079a38ff696536';

/// `GET me`, replaced by the answers of `PATCH me` and `PUT me/avatar`.

@ProviderFor(Profile)
final profileProvider = ProfileProvider._();

/// `GET me`, replaced by the answers of `PATCH me` and `PUT me/avatar`.
final class ProfileProvider
    extends $AsyncNotifierProvider<Profile, ProfileDto> {
  /// `GET me`, replaced by the answers of `PATCH me` and `PUT me/avatar`.
  ProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileHash();

  @$internal
  @override
  Profile create() => Profile();
}

String _$profileHash() => r'4b13645e63edb425d7e187a3338d5b692483ecac';

/// `GET me`, replaced by the answers of `PATCH me` and `PUT me/avatar`.

abstract class _$Profile extends $AsyncNotifier<ProfileDto> {
  FutureOr<ProfileDto> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProfileDto>, ProfileDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileDto>, ProfileDto>,
              AsyncValue<ProfileDto>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// `GET me/preferences`; the push switch is optimistic.

@ProviderFor(Preferences)
final preferencesProvider = PreferencesProvider._();

/// `GET me/preferences`; the push switch is optimistic.
final class PreferencesProvider
    extends $AsyncNotifierProvider<Preferences, PreferencesDto> {
  /// `GET me/preferences`; the push switch is optimistic.
  PreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preferencesHash();

  @$internal
  @override
  Preferences create() => Preferences();
}

String _$preferencesHash() => r'2cdcd647d6e5a92dfc0d59418cdb842bc44a3208';

/// `GET me/preferences`; the push switch is optimistic.

abstract class _$Preferences extends $AsyncNotifier<PreferencesDto> {
  FutureOr<PreferencesDto> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PreferencesDto>, PreferencesDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PreferencesDto>, PreferencesDto>,
              AsyncValue<PreferencesDto>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(savedAddresses)
final savedAddressesProvider = SavedAddressesProvider._();

final class SavedAddressesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AddressDto>>,
          List<AddressDto>,
          FutureOr<List<AddressDto>>
        >
    with $FutureModifier<List<AddressDto>>, $FutureProvider<List<AddressDto>> {
  SavedAddressesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedAddressesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedAddressesHash();

  @$internal
  @override
  $FutureProviderElement<List<AddressDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AddressDto>> create(Ref ref) {
    return savedAddresses(ref);
  }
}

String _$savedAddressesHash() => r'105fbde2188f5be3ee2abcfb15d54bbd611dd2b5';

/// `GET payment-methods`; `PUT payment-methods/default` answers the list.

@ProviderFor(PaymentMethods)
final paymentMethodsProvider = PaymentMethodsProvider._();

/// `GET payment-methods`; `PUT payment-methods/default` answers the list.
final class PaymentMethodsProvider
    extends $AsyncNotifierProvider<PaymentMethods, List<PaymentMethodDto>> {
  /// `GET payment-methods`; `PUT payment-methods/default` answers the list.
  PaymentMethodsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentMethodsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentMethodsHash();

  @$internal
  @override
  PaymentMethods create() => PaymentMethods();
}

String _$paymentMethodsHash() => r'33ceed738cbeffcafdd2caf2c235bdc97d4132a6';

/// `GET payment-methods`; `PUT payment-methods/default` answers the list.

abstract class _$PaymentMethods extends $AsyncNotifier<List<PaymentMethodDto>> {
  FutureOr<List<PaymentMethodDto>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<PaymentMethodDto>>, List<PaymentMethodDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PaymentMethodDto>>,
                List<PaymentMethodDto>
              >,
              AsyncValue<List<PaymentMethodDto>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
