// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// One tab's pages (`GET notifications?tab=&cursor=`).

@ProviderFor(NotificationFeed)
final notificationFeedProvider = NotificationFeedFamily._();

/// One tab's pages (`GET notifications?tab=&cursor=`).
final class NotificationFeedProvider
    extends $NotifierProvider<NotificationFeed, NotificationFeedState> {
  /// One tab's pages (`GET notifications?tab=&cursor=`).
  NotificationFeedProvider._({
    required NotificationFeedFamily super.from,
    required NotificationTab super.argument,
  }) : super(
         retry: null,
         name: r'notificationFeedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$notificationFeedHash();

  @override
  String toString() {
    return r'notificationFeedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NotificationFeed create() => NotificationFeed();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationFeedState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationFeedState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationFeedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$notificationFeedHash() => r'17a24270a7092aafcc9f81d5eb1b372717b38843';

/// One tab's pages (`GET notifications?tab=&cursor=`).

final class NotificationFeedFamily extends $Family
    with
        $ClassFamilyOverride<
          NotificationFeed,
          NotificationFeedState,
          NotificationFeedState,
          NotificationFeedState,
          NotificationTab
        > {
  NotificationFeedFamily._()
    : super(
        retry: null,
        name: r'notificationFeedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// One tab's pages (`GET notifications?tab=&cursor=`).

  NotificationFeedProvider call(NotificationTab tab) =>
      NotificationFeedProvider._(argument: tab, from: this);

  @override
  String toString() => r'notificationFeedProvider';
}

/// One tab's pages (`GET notifications?tab=&cursor=`).

abstract class _$NotificationFeed extends $Notifier<NotificationFeedState> {
  late final _$args = ref.$arg as NotificationTab;
  NotificationTab get tab => _$args;

  NotificationFeedState build(NotificationTab tab);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<NotificationFeedState, NotificationFeedState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NotificationFeedState, NotificationFeedState>,
              NotificationFeedState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// `GET notifications/{id}` (marks it read).

@ProviderFor(notificationDetail)
final notificationDetailProvider = NotificationDetailFamily._();

/// `GET notifications/{id}` (marks it read).

final class NotificationDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<NotificationDto>,
          NotificationDto,
          FutureOr<NotificationDto>
        >
    with $FutureModifier<NotificationDto>, $FutureProvider<NotificationDto> {
  /// `GET notifications/{id}` (marks it read).
  NotificationDetailProvider._({
    required NotificationDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'notificationDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$notificationDetailHash();

  @override
  String toString() {
    return r'notificationDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<NotificationDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NotificationDto> create(Ref ref) {
    final argument = this.argument as String;
    return notificationDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$notificationDetailHash() =>
    r'9513aaf23d8ed24dd033ff3a2e593b2ab278e459';

/// `GET notifications/{id}` (marks it read).

final class NotificationDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<NotificationDto>, String> {
  NotificationDetailFamily._()
    : super(
        retry: null,
        name: r'notificationDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// `GET notifications/{id}` (marks it read).

  NotificationDetailProvider call(String id) =>
      NotificationDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'notificationDetailProvider';
}
