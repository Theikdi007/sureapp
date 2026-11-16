// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_registration.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pushMessaging)
final pushMessagingProvider = PushMessagingProvider._();

final class PushMessagingProvider
    extends $FunctionalProvider<PushMessaging, PushMessaging, PushMessaging>
    with $Provider<PushMessaging> {
  PushMessagingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pushMessagingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pushMessagingHash();

  @$internal
  @override
  $ProviderElement<PushMessaging> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PushMessaging create(Ref ref) {
    return pushMessaging(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PushMessaging value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PushMessaging>(value),
    );
  }
}

String _$pushMessagingHash() => r'8bfcc45c03a4672268006f1bba22d92282d07a49';

@ProviderFor(pushTokens)
final pushTokensProvider = PushTokensProvider._();

final class PushTokensProvider
    extends $FunctionalProvider<PushTokens, PushTokens, PushTokens>
    with $Provider<PushTokens> {
  PushTokensProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pushTokensProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pushTokensHash();

  @$internal
  @override
  $ProviderElement<PushTokens> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PushTokens create(Ref ref) {
    return pushTokens(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PushTokens value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PushTokens>(value),
    );
  }
}

String _$pushTokensHash() => r'2dd1201f6668799cc76072096e2c24921b3cba6d';

/// Keeps this install's push token registered with the API while signed in
/// (`POST devices` after sign-in and on every new token). Sign-out removes
/// it through [PushTokens.unregister] before the session ends.

@ProviderFor(PushRegistration)
final pushRegistrationProvider = PushRegistrationProvider._();

/// Keeps this install's push token registered with the API while signed in
/// (`POST devices` after sign-in and on every new token). Sign-out removes
/// it through [PushTokens.unregister] before the session ends.
final class PushRegistrationProvider
    extends $NotifierProvider<PushRegistration, void> {
  /// Keeps this install's push token registered with the API while signed in
  /// (`POST devices` after sign-in and on every new token). Sign-out removes
  /// it through [PushTokens.unregister] before the session ends.
  PushRegistrationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pushRegistrationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pushRegistrationHash();

  @$internal
  @override
  PushRegistration create() => PushRegistration();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$pushRegistrationHash() => r'c376b1181f80e9dd61ece14bfa48328ef58b7d8a';

/// Keeps this install's push token registered with the API while signed in
/// (`POST devices` after sign-in and on every new token). Sign-out removes
/// it through [PushTokens.unregister] before the session ends.

abstract class _$PushRegistration extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
