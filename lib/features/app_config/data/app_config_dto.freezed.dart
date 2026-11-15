// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfigDto {

 String get minimumVersion; String get latestVersion; bool get updateRequired; String get supportPhone; String? get supportChatUrl; String get currency; int get pointValueMmk; List<PayMethodOptionDto> get checkoutPayments; List<OnboardingSlideDto> get onboarding; String? get serverTime;
/// Create a copy of AppConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigDtoCopyWith<AppConfigDto> get copyWith => _$AppConfigDtoCopyWithImpl<AppConfigDto>(this as AppConfigDto, _$identity);

  /// Serializes this AppConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppConfigDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfigDto&&(identical(other.minimumVersion, _this.minimumVersion) || other.minimumVersion == _this.minimumVersion)&&(identical(other.latestVersion, _this.latestVersion) || other.latestVersion == _this.latestVersion)&&(identical(other.updateRequired, _this.updateRequired) || other.updateRequired == _this.updateRequired)&&(identical(other.supportPhone, _this.supportPhone) || other.supportPhone == _this.supportPhone)&&(identical(other.supportChatUrl, _this.supportChatUrl) || other.supportChatUrl == _this.supportChatUrl)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.pointValueMmk, _this.pointValueMmk) || other.pointValueMmk == _this.pointValueMmk)&&const DeepCollectionEquality().equals(other.checkoutPayments, _this.checkoutPayments)&&const DeepCollectionEquality().equals(other.onboarding, _this.onboarding)&&(identical(other.serverTime, _this.serverTime) || other.serverTime == _this.serverTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppConfigDto;
  return Object.hash(runtimeType,_this.minimumVersion,_this.latestVersion,_this.updateRequired,_this.supportPhone,_this.supportChatUrl,_this.currency,_this.pointValueMmk,const DeepCollectionEquality().hash(_this.checkoutPayments),const DeepCollectionEquality().hash(_this.onboarding),_this.serverTime);
}

@override
String toString() {
  final _this = this as AppConfigDto;
  return 'AppConfigDto(minimumVersion: ${_this.minimumVersion}, latestVersion: ${_this.latestVersion}, updateRequired: ${_this.updateRequired}, supportPhone: ${_this.supportPhone}, supportChatUrl: ${_this.supportChatUrl}, currency: ${_this.currency}, pointValueMmk: ${_this.pointValueMmk}, checkoutPayments: ${_this.checkoutPayments}, onboarding: ${_this.onboarding}, serverTime: ${_this.serverTime})';
}


}

/// @nodoc
abstract mixin class $AppConfigDtoCopyWith<$Res>  {
  factory $AppConfigDtoCopyWith(AppConfigDto value, $Res Function(AppConfigDto) _then) = _$AppConfigDtoCopyWithImpl;
@useResult
$Res call({
 String minimumVersion, String latestVersion, bool updateRequired, String supportPhone, String? supportChatUrl, String currency, int pointValueMmk, List<PayMethodOptionDto> checkoutPayments, List<OnboardingSlideDto> onboarding, String? serverTime
});




}
/// @nodoc
class _$AppConfigDtoCopyWithImpl<$Res>
    implements $AppConfigDtoCopyWith<$Res> {
  _$AppConfigDtoCopyWithImpl(this._self, this._then);

  final AppConfigDto _self;
  final $Res Function(AppConfigDto) _then;

/// Create a copy of AppConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minimumVersion = null,Object? latestVersion = null,Object? updateRequired = null,Object? supportPhone = null,Object? supportChatUrl = freezed,Object? currency = null,Object? pointValueMmk = null,Object? checkoutPayments = null,Object? onboarding = null,Object? serverTime = freezed,}) {
  return _then(AppConfigDto(
minimumVersion: null == minimumVersion ? _self.minimumVersion : minimumVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,updateRequired: null == updateRequired ? _self.updateRequired : updateRequired // ignore: cast_nullable_to_non_nullable
as bool,supportPhone: null == supportPhone ? _self.supportPhone : supportPhone // ignore: cast_nullable_to_non_nullable
as String,supportChatUrl: freezed == supportChatUrl ? _self.supportChatUrl : supportChatUrl // ignore: cast_nullable_to_non_nullable
as String?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,pointValueMmk: null == pointValueMmk ? _self.pointValueMmk : pointValueMmk // ignore: cast_nullable_to_non_nullable
as int,checkoutPayments: null == checkoutPayments ? _self.checkoutPayments : checkoutPayments // ignore: cast_nullable_to_non_nullable
as List<PayMethodOptionDto>,onboarding: null == onboarding ? _self.onboarding : onboarding // ignore: cast_nullable_to_non_nullable
as List<OnboardingSlideDto>,serverTime: freezed == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfigDto].
extension AppConfigDtoPatterns on AppConfigDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfigDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _AppConfigDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfigDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String minimumVersion,  String latestVersion,  bool updateRequired,  String supportPhone,  String? supportChatUrl,  String currency,  int pointValueMmk,  List<PayMethodOptionDto> checkoutPayments,  List<OnboardingSlideDto> onboarding,  String? serverTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfigDto() when $default != null:
return $default(_that.minimumVersion,_that.latestVersion,_that.updateRequired,_that.supportPhone,_that.supportChatUrl,_that.currency,_that.pointValueMmk,_that.checkoutPayments,_that.onboarding,_that.serverTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String minimumVersion,  String latestVersion,  bool updateRequired,  String supportPhone,  String? supportChatUrl,  String currency,  int pointValueMmk,  List<PayMethodOptionDto> checkoutPayments,  List<OnboardingSlideDto> onboarding,  String? serverTime)  $default,) {final _that = this;
switch (_that) {
case _AppConfigDto():
return $default(_that.minimumVersion,_that.latestVersion,_that.updateRequired,_that.supportPhone,_that.supportChatUrl,_that.currency,_that.pointValueMmk,_that.checkoutPayments,_that.onboarding,_that.serverTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String minimumVersion,  String latestVersion,  bool updateRequired,  String supportPhone,  String? supportChatUrl,  String currency,  int pointValueMmk,  List<PayMethodOptionDto> checkoutPayments,  List<OnboardingSlideDto> onboarding,  String? serverTime)?  $default,) {final _that = this;
switch (_that) {
case _AppConfigDto() when $default != null:
return $default(_that.minimumVersion,_that.latestVersion,_that.updateRequired,_that.supportPhone,_that.supportChatUrl,_that.currency,_that.pointValueMmk,_that.checkoutPayments,_that.onboarding,_that.serverTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfigDto implements AppConfigDto {
  const _AppConfigDto({required this.minimumVersion, required this.latestVersion, required this.updateRequired, required this.supportPhone, this.supportChatUrl, required this.currency, required this.pointValueMmk,  List<PayMethodOptionDto> checkoutPayments = const [],  List<OnboardingSlideDto> onboarding = const [], this.serverTime}): _checkoutPayments = checkoutPayments,_onboarding = onboarding;
  factory _AppConfigDto.fromJson(Map<String, dynamic> json) => _$AppConfigDtoFromJson(json);

@override final  String minimumVersion;
@override final  String latestVersion;
@override final  bool updateRequired;
@override final  String supportPhone;
@override final  String? supportChatUrl;
@override final  String currency;
@override final  int pointValueMmk;
 final  List<PayMethodOptionDto> _checkoutPayments;
@override@JsonKey() List<PayMethodOptionDto> get checkoutPayments {
  if (_checkoutPayments is EqualUnmodifiableListView) return _checkoutPayments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checkoutPayments);
}

 final  List<OnboardingSlideDto> _onboarding;
@override@JsonKey() List<OnboardingSlideDto> get onboarding {
  if (_onboarding is EqualUnmodifiableListView) return _onboarding;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_onboarding);
}

@override final  String? serverTime;

/// Create a copy of AppConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigDtoCopyWith<_AppConfigDto> get copyWith => __$AppConfigDtoCopyWithImpl<_AppConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfigDto&&(identical(other.minimumVersion, minimumVersion) || other.minimumVersion == minimumVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.updateRequired, updateRequired) || other.updateRequired == updateRequired)&&(identical(other.supportPhone, supportPhone) || other.supportPhone == supportPhone)&&(identical(other.supportChatUrl, supportChatUrl) || other.supportChatUrl == supportChatUrl)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.pointValueMmk, pointValueMmk) || other.pointValueMmk == pointValueMmk)&&const DeepCollectionEquality().equals(other.checkoutPayments, _checkoutPayments)&&const DeepCollectionEquality().equals(other.onboarding, _onboarding)&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,minimumVersion,latestVersion,updateRequired,supportPhone,supportChatUrl,currency,pointValueMmk,const DeepCollectionEquality().hash(_checkoutPayments),const DeepCollectionEquality().hash(_onboarding),serverTime);
}

@override
String toString() {
    return 'AppConfigDto(minimumVersion: $minimumVersion, latestVersion: $latestVersion, updateRequired: $updateRequired, supportPhone: $supportPhone, supportChatUrl: $supportChatUrl, currency: $currency, pointValueMmk: $pointValueMmk, checkoutPayments: $checkoutPayments, onboarding: $onboarding, serverTime: $serverTime)';
}


}

/// @nodoc
abstract mixin class _$AppConfigDtoCopyWith<$Res> implements $AppConfigDtoCopyWith<$Res> {
  factory _$AppConfigDtoCopyWith(_AppConfigDto value, $Res Function(_AppConfigDto) _then) = __$AppConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 String minimumVersion, String latestVersion, bool updateRequired, String supportPhone, String? supportChatUrl, String currency, int pointValueMmk, List<PayMethodOptionDto> checkoutPayments, List<OnboardingSlideDto> onboarding, String? serverTime
});




}
/// @nodoc
class __$AppConfigDtoCopyWithImpl<$Res>
    implements _$AppConfigDtoCopyWith<$Res> {
  __$AppConfigDtoCopyWithImpl(this._self, this._then);

  final _AppConfigDto _self;
  final $Res Function(_AppConfigDto) _then;

/// Create a copy of AppConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minimumVersion = null,Object? latestVersion = null,Object? updateRequired = null,Object? supportPhone = null,Object? supportChatUrl = freezed,Object? currency = null,Object? pointValueMmk = null,Object? checkoutPayments = null,Object? onboarding = null,Object? serverTime = freezed,}) {
  return _then(_AppConfigDto(
minimumVersion: null == minimumVersion ? _self.minimumVersion : minimumVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,updateRequired: null == updateRequired ? _self.updateRequired : updateRequired // ignore: cast_nullable_to_non_nullable
as bool,supportPhone: null == supportPhone ? _self.supportPhone : supportPhone // ignore: cast_nullable_to_non_nullable
as String,supportChatUrl: freezed == supportChatUrl ? _self.supportChatUrl : supportChatUrl // ignore: cast_nullable_to_non_nullable
as String?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,pointValueMmk: null == pointValueMmk ? _self.pointValueMmk : pointValueMmk // ignore: cast_nullable_to_non_nullable
as int,checkoutPayments: null == checkoutPayments ? _self._checkoutPayments : checkoutPayments // ignore: cast_nullable_to_non_nullable
as List<PayMethodOptionDto>,onboarding: null == onboarding ? _self._onboarding : onboarding // ignore: cast_nullable_to_non_nullable
as List<OnboardingSlideDto>,serverTime: freezed == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PayMethodOptionDto {

 String get code; String get title; String get description; bool get enabled; String? get disabledReason;
/// Create a copy of PayMethodOptionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayMethodOptionDtoCopyWith<PayMethodOptionDto> get copyWith => _$PayMethodOptionDtoCopyWithImpl<PayMethodOptionDto>(this as PayMethodOptionDto, _$identity);

  /// Serializes this PayMethodOptionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PayMethodOptionDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayMethodOptionDto&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.disabledReason, _this.disabledReason) || other.disabledReason == _this.disabledReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PayMethodOptionDto;
  return Object.hash(runtimeType,_this.code,_this.title,_this.description,_this.enabled,_this.disabledReason);
}

@override
String toString() {
  final _this = this as PayMethodOptionDto;
  return 'PayMethodOptionDto(code: ${_this.code}, title: ${_this.title}, description: ${_this.description}, enabled: ${_this.enabled}, disabledReason: ${_this.disabledReason})';
}


}

/// @nodoc
abstract mixin class $PayMethodOptionDtoCopyWith<$Res>  {
  factory $PayMethodOptionDtoCopyWith(PayMethodOptionDto value, $Res Function(PayMethodOptionDto) _then) = _$PayMethodOptionDtoCopyWithImpl;
@useResult
$Res call({
 String code, String title, String description, bool enabled, String? disabledReason
});




}
/// @nodoc
class _$PayMethodOptionDtoCopyWithImpl<$Res>
    implements $PayMethodOptionDtoCopyWith<$Res> {
  _$PayMethodOptionDtoCopyWithImpl(this._self, this._then);

  final PayMethodOptionDto _self;
  final $Res Function(PayMethodOptionDto) _then;

/// Create a copy of PayMethodOptionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? title = null,Object? description = null,Object? enabled = null,Object? disabledReason = freezed,}) {
  return _then(PayMethodOptionDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,disabledReason: freezed == disabledReason ? _self.disabledReason : disabledReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PayMethodOptionDto].
extension PayMethodOptionDtoPatterns on PayMethodOptionDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayMethodOptionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayMethodOptionDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayMethodOptionDto value)  $default,){
final _that = this;
switch (_that) {
case _PayMethodOptionDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayMethodOptionDto value)?  $default,){
final _that = this;
switch (_that) {
case _PayMethodOptionDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String title,  String description,  bool enabled,  String? disabledReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayMethodOptionDto() when $default != null:
return $default(_that.code,_that.title,_that.description,_that.enabled,_that.disabledReason);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String title,  String description,  bool enabled,  String? disabledReason)  $default,) {final _that = this;
switch (_that) {
case _PayMethodOptionDto():
return $default(_that.code,_that.title,_that.description,_that.enabled,_that.disabledReason);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String title,  String description,  bool enabled,  String? disabledReason)?  $default,) {final _that = this;
switch (_that) {
case _PayMethodOptionDto() when $default != null:
return $default(_that.code,_that.title,_that.description,_that.enabled,_that.disabledReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PayMethodOptionDto implements PayMethodOptionDto {
  const _PayMethodOptionDto({required this.code, required this.title, required this.description, required this.enabled, this.disabledReason});
  factory _PayMethodOptionDto.fromJson(Map<String, dynamic> json) => _$PayMethodOptionDtoFromJson(json);

@override final  String code;
@override final  String title;
@override final  String description;
@override final  bool enabled;
@override final  String? disabledReason;

/// Create a copy of PayMethodOptionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayMethodOptionDtoCopyWith<_PayMethodOptionDto> get copyWith => __$PayMethodOptionDtoCopyWithImpl<_PayMethodOptionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PayMethodOptionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayMethodOptionDto&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.disabledReason, disabledReason) || other.disabledReason == disabledReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,title,description,enabled,disabledReason);
}

@override
String toString() {
    return 'PayMethodOptionDto(code: $code, title: $title, description: $description, enabled: $enabled, disabledReason: $disabledReason)';
}


}

/// @nodoc
abstract mixin class _$PayMethodOptionDtoCopyWith<$Res> implements $PayMethodOptionDtoCopyWith<$Res> {
  factory _$PayMethodOptionDtoCopyWith(_PayMethodOptionDto value, $Res Function(_PayMethodOptionDto) _then) = __$PayMethodOptionDtoCopyWithImpl;
@override @useResult
$Res call({
 String code, String title, String description, bool enabled, String? disabledReason
});




}
/// @nodoc
class __$PayMethodOptionDtoCopyWithImpl<$Res>
    implements _$PayMethodOptionDtoCopyWith<$Res> {
  __$PayMethodOptionDtoCopyWithImpl(this._self, this._then);

  final _PayMethodOptionDto _self;
  final $Res Function(_PayMethodOptionDto) _then;

/// Create a copy of PayMethodOptionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? title = null,Object? description = null,Object? enabled = null,Object? disabledReason = freezed,}) {
  return _then(_PayMethodOptionDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,disabledReason: freezed == disabledReason ? _self.disabledReason : disabledReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OnboardingSlideDto {

 String get imageUrl; String get title; String get subtitle;
/// Create a copy of OnboardingSlideDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingSlideDtoCopyWith<OnboardingSlideDto> get copyWith => _$OnboardingSlideDtoCopyWithImpl<OnboardingSlideDto>(this as OnboardingSlideDto, _$identity);

  /// Serializes this OnboardingSlideDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OnboardingSlideDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingSlideDto&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.subtitle, _this.subtitle) || other.subtitle == _this.subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OnboardingSlideDto;
  return Object.hash(runtimeType,_this.imageUrl,_this.title,_this.subtitle);
}

@override
String toString() {
  final _this = this as OnboardingSlideDto;
  return 'OnboardingSlideDto(imageUrl: ${_this.imageUrl}, title: ${_this.title}, subtitle: ${_this.subtitle})';
}


}

/// @nodoc
abstract mixin class $OnboardingSlideDtoCopyWith<$Res>  {
  factory $OnboardingSlideDtoCopyWith(OnboardingSlideDto value, $Res Function(OnboardingSlideDto) _then) = _$OnboardingSlideDtoCopyWithImpl;
@useResult
$Res call({
 String imageUrl, String title, String subtitle
});




}
/// @nodoc
class _$OnboardingSlideDtoCopyWithImpl<$Res>
    implements $OnboardingSlideDtoCopyWith<$Res> {
  _$OnboardingSlideDtoCopyWithImpl(this._self, this._then);

  final OnboardingSlideDto _self;
  final $Res Function(OnboardingSlideDto) _then;

/// Create a copy of OnboardingSlideDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageUrl = null,Object? title = null,Object? subtitle = null,}) {
  return _then(OnboardingSlideDto(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingSlideDto].
extension OnboardingSlideDtoPatterns on OnboardingSlideDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingSlideDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingSlideDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingSlideDto value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingSlideDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingSlideDto value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingSlideDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imageUrl,  String title,  String subtitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingSlideDto() when $default != null:
return $default(_that.imageUrl,_that.title,_that.subtitle);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imageUrl,  String title,  String subtitle)  $default,) {final _that = this;
switch (_that) {
case _OnboardingSlideDto():
return $default(_that.imageUrl,_that.title,_that.subtitle);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imageUrl,  String title,  String subtitle)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingSlideDto() when $default != null:
return $default(_that.imageUrl,_that.title,_that.subtitle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnboardingSlideDto implements OnboardingSlideDto {
  const _OnboardingSlideDto({required this.imageUrl, required this.title, required this.subtitle});
  factory _OnboardingSlideDto.fromJson(Map<String, dynamic> json) => _$OnboardingSlideDtoFromJson(json);

@override final  String imageUrl;
@override final  String title;
@override final  String subtitle;

/// Create a copy of OnboardingSlideDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingSlideDtoCopyWith<_OnboardingSlideDto> get copyWith => __$OnboardingSlideDtoCopyWithImpl<_OnboardingSlideDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnboardingSlideDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingSlideDto&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,imageUrl,title,subtitle);
}

@override
String toString() {
    return 'OnboardingSlideDto(imageUrl: $imageUrl, title: $title, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class _$OnboardingSlideDtoCopyWith<$Res> implements $OnboardingSlideDtoCopyWith<$Res> {
  factory _$OnboardingSlideDtoCopyWith(_OnboardingSlideDto value, $Res Function(_OnboardingSlideDto) _then) = __$OnboardingSlideDtoCopyWithImpl;
@override @useResult
$Res call({
 String imageUrl, String title, String subtitle
});




}
/// @nodoc
class __$OnboardingSlideDtoCopyWithImpl<$Res>
    implements _$OnboardingSlideDtoCopyWith<$Res> {
  __$OnboardingSlideDtoCopyWithImpl(this._self, this._then);

  final _OnboardingSlideDto _self;
  final $Res Function(_OnboardingSlideDto) _then;

/// Create a copy of OnboardingSlideDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageUrl = null,Object? title = null,Object? subtitle = null,}) {
  return _then(_OnboardingSlideDto(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
