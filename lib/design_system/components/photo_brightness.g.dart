// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_brightness.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether the top strip of a photo is light, so a screen drawn edge to edge
/// over it can pick dark status bar icons there (white icons vanish on a
/// light photo, such as the API's grey "no photo" picture).
///
/// Uses the same cache as `SureImage`, so it costs no extra download. Null
/// while unknown or when the image can't be read (keep the default).

@ProviderFor(photoTopIsLight)
final photoTopIsLightProvider = PhotoTopIsLightFamily._();

/// Whether the top strip of a photo is light, so a screen drawn edge to edge
/// over it can pick dark status bar icons there (white icons vanish on a
/// light photo, such as the API's grey "no photo" picture).
///
/// Uses the same cache as `SureImage`, so it costs no extra download. Null
/// while unknown or when the image can't be read (keep the default).

final class PhotoTopIsLightProvider
    extends $FunctionalProvider<AsyncValue<bool?>, bool?, FutureOr<bool?>>
    with $FutureModifier<bool?>, $FutureProvider<bool?> {
  /// Whether the top strip of a photo is light, so a screen drawn edge to edge
  /// over it can pick dark status bar icons there (white icons vanish on a
  /// light photo, such as the API's grey "no photo" picture).
  ///
  /// Uses the same cache as `SureImage`, so it costs no extra download. Null
  /// while unknown or when the image can't be read (keep the default).
  PhotoTopIsLightProvider._({
    required PhotoTopIsLightFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'photoTopIsLightProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$photoTopIsLightHash();

  @override
  String toString() {
    return r'photoTopIsLightProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool?> create(Ref ref) {
    final argument = this.argument as String;
    return photoTopIsLight(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PhotoTopIsLightProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$photoTopIsLightHash() => r'a557bb7f1ae58e8f5f7bb3b0a6f6d73823413ccf';

/// Whether the top strip of a photo is light, so a screen drawn edge to edge
/// over it can pick dark status bar icons there (white icons vanish on a
/// light photo, such as the API's grey "no photo" picture).
///
/// Uses the same cache as `SureImage`, so it costs no extra download. Null
/// while unknown or when the image can't be read (keep the default).

final class PhotoTopIsLightFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool?>, String> {
  PhotoTopIsLightFamily._()
    : super(
        retry: null,
        name: r'photoTopIsLightProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Whether the top strip of a photo is light, so a screen drawn edge to edge
  /// over it can pick dark status bar icons there (white icons vanish on a
  /// light photo, such as the API's grey "no photo" picture).
  ///
  /// Uses the same cache as `SureImage`, so it costs no extra download. Null
  /// while unknown or when the image can't be read (keep the default).

  PhotoTopIsLightProvider call(String url) =>
      PhotoTopIsLightProvider._(argument: url, from: this);

  @override
  String toString() => r'photoTopIsLightProvider';
}
