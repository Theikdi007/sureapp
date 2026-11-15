// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => _ProfileDto(
  memberId: json['memberId'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String,
  phoneDisplay: json['phoneDisplay'] as String,
  email: json['email'] as String?,
  photoUrl: json['photoUrl'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  address: json['address'] as String?,
  township: json['township'] as String?,
  state: json['state'] as String?,
  tier: json['tier'] as String,
  tierLabel: json['tierLabel'] as String,
  memberSinceYear: (json['memberSinceYear'] as num?)?.toInt(),
  birthdayToday: json['birthdayToday'] as bool? ?? false,
);

Map<String, dynamic> _$ProfileDtoToJson(_ProfileDto instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'name': instance.name,
      'phone': instance.phone,
      'phoneDisplay': instance.phoneDisplay,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'dateOfBirth': instance.dateOfBirth,
      'address': instance.address,
      'township': instance.township,
      'state': instance.state,
      'tier': instance.tier,
      'tierLabel': instance.tierLabel,
      'memberSinceYear': instance.memberSinceYear,
      'birthdayToday': instance.birthdayToday,
    };

_PreferencesDto _$PreferencesDtoFromJson(Map<String, dynamic> json) =>
    _PreferencesDto(
      pushEnabled: json['pushEnabled'] as bool,
      preferredPayment: json['preferredPayment'] as String?,
      language: json['language'] as String? ?? 'en',
    );

Map<String, dynamic> _$PreferencesDtoToJson(_PreferencesDto instance) =>
    <String, dynamic>{
      'pushEnabled': instance.pushEnabled,
      'preferredPayment': instance.preferredPayment,
      'language': instance.language,
    };

_PaymentMethodDto _$PaymentMethodDtoFromJson(Map<String, dynamic> json) =>
    _PaymentMethodDto(
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      enabled: json['enabled'] as bool,
      isDefault: json['isDefault'] as bool,
      disabledReason: json['disabledReason'] as String?,
    );

Map<String, dynamic> _$PaymentMethodDtoToJson(_PaymentMethodDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'description': instance.description,
      'enabled': instance.enabled,
      'isDefault': instance.isDefault,
      'disabledReason': instance.disabledReason,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profileRepository)
final profileRepositoryProvider = ProfileRepositoryProvider._();

final class ProfileRepositoryProvider
    extends
        $FunctionalProvider<
          ProfileRepository,
          ProfileRepository,
          ProfileRepository
        >
    with $Provider<ProfileRepository> {
  ProfileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProfileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfileRepository create(Ref ref) {
    return profileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRepository>(value),
    );
  }
}

String _$profileRepositoryHash() => r'b171d245a3184e068bfc1e0d1f3c884b328d1705';
