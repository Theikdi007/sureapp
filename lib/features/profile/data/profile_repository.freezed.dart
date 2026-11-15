// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDto {

 String get memberId; String get name; String get phone; String get phoneDisplay; String? get email; String? get photoUrl; String? get dateOfBirth; String? get address; String? get township; String? get state; String get tier; String get tierLabel; int? get memberSinceYear; bool get birthdayToday;
/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDtoCopyWith<ProfileDto> get copyWith => _$ProfileDtoCopyWithImpl<ProfileDto>(this as ProfileDto, _$identity);

  /// Serializes this ProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDto&&(identical(other.memberId, _this.memberId) || other.memberId == _this.memberId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.phoneDisplay, _this.phoneDisplay) || other.phoneDisplay == _this.phoneDisplay)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.dateOfBirth, _this.dateOfBirth) || other.dateOfBirth == _this.dateOfBirth)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.township, _this.township) || other.township == _this.township)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.tierLabel, _this.tierLabel) || other.tierLabel == _this.tierLabel)&&(identical(other.memberSinceYear, _this.memberSinceYear) || other.memberSinceYear == _this.memberSinceYear)&&(identical(other.birthdayToday, _this.birthdayToday) || other.birthdayToday == _this.birthdayToday));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileDto;
  return Object.hash(runtimeType,_this.memberId,_this.name,_this.phone,_this.phoneDisplay,_this.email,_this.photoUrl,_this.dateOfBirth,_this.address,_this.township,_this.state,_this.tier,_this.tierLabel,_this.memberSinceYear,_this.birthdayToday);
}

@override
String toString() {
  final _this = this as ProfileDto;
  return 'ProfileDto(memberId: ${_this.memberId}, name: ${_this.name}, phone: ${_this.phone}, phoneDisplay: ${_this.phoneDisplay}, email: ${_this.email}, photoUrl: ${_this.photoUrl}, dateOfBirth: ${_this.dateOfBirth}, address: ${_this.address}, township: ${_this.township}, state: ${_this.state}, tier: ${_this.tier}, tierLabel: ${_this.tierLabel}, memberSinceYear: ${_this.memberSinceYear}, birthdayToday: ${_this.birthdayToday})';
}


}

/// @nodoc
abstract mixin class $ProfileDtoCopyWith<$Res>  {
  factory $ProfileDtoCopyWith(ProfileDto value, $Res Function(ProfileDto) _then) = _$ProfileDtoCopyWithImpl;
@useResult
$Res call({
 String memberId, String name, String phone, String phoneDisplay, String? email, String? photoUrl, String? dateOfBirth, String? address, String? township, String? state, String tier, String tierLabel, int? memberSinceYear, bool birthdayToday
});




}
/// @nodoc
class _$ProfileDtoCopyWithImpl<$Res>
    implements $ProfileDtoCopyWith<$Res> {
  _$ProfileDtoCopyWithImpl(this._self, this._then);

  final ProfileDto _self;
  final $Res Function(ProfileDto) _then;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? memberId = null,Object? name = null,Object? phone = null,Object? phoneDisplay = null,Object? email = freezed,Object? photoUrl = freezed,Object? dateOfBirth = freezed,Object? address = freezed,Object? township = freezed,Object? state = freezed,Object? tier = null,Object? tierLabel = null,Object? memberSinceYear = freezed,Object? birthdayToday = null,}) {
  return _then(ProfileDto(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneDisplay: null == phoneDisplay ? _self.phoneDisplay : phoneDisplay // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,township: freezed == township ? _self.township : township // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,tierLabel: null == tierLabel ? _self.tierLabel : tierLabel // ignore: cast_nullable_to_non_nullable
as String,memberSinceYear: freezed == memberSinceYear ? _self.memberSinceYear : memberSinceYear // ignore: cast_nullable_to_non_nullable
as int?,birthdayToday: null == birthdayToday ? _self.birthdayToday : birthdayToday // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDto].
extension ProfileDtoPatterns on ProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String memberId,  String name,  String phone,  String phoneDisplay,  String? email,  String? photoUrl,  String? dateOfBirth,  String? address,  String? township,  String? state,  String tier,  String tierLabel,  int? memberSinceYear,  bool birthdayToday)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
return $default(_that.memberId,_that.name,_that.phone,_that.phoneDisplay,_that.email,_that.photoUrl,_that.dateOfBirth,_that.address,_that.township,_that.state,_that.tier,_that.tierLabel,_that.memberSinceYear,_that.birthdayToday);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String memberId,  String name,  String phone,  String phoneDisplay,  String? email,  String? photoUrl,  String? dateOfBirth,  String? address,  String? township,  String? state,  String tier,  String tierLabel,  int? memberSinceYear,  bool birthdayToday)  $default,) {final _that = this;
switch (_that) {
case _ProfileDto():
return $default(_that.memberId,_that.name,_that.phone,_that.phoneDisplay,_that.email,_that.photoUrl,_that.dateOfBirth,_that.address,_that.township,_that.state,_that.tier,_that.tierLabel,_that.memberSinceYear,_that.birthdayToday);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String memberId,  String name,  String phone,  String phoneDisplay,  String? email,  String? photoUrl,  String? dateOfBirth,  String? address,  String? township,  String? state,  String tier,  String tierLabel,  int? memberSinceYear,  bool birthdayToday)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
return $default(_that.memberId,_that.name,_that.phone,_that.phoneDisplay,_that.email,_that.photoUrl,_that.dateOfBirth,_that.address,_that.township,_that.state,_that.tier,_that.tierLabel,_that.memberSinceYear,_that.birthdayToday);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDto implements ProfileDto {
  const _ProfileDto({required this.memberId, required this.name, required this.phone, required this.phoneDisplay, this.email, this.photoUrl, this.dateOfBirth, this.address, this.township, this.state, required this.tier, required this.tierLabel, this.memberSinceYear, this.birthdayToday = false});
  factory _ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

@override final  String memberId;
@override final  String name;
@override final  String phone;
@override final  String phoneDisplay;
@override final  String? email;
@override final  String? photoUrl;
@override final  String? dateOfBirth;
@override final  String? address;
@override final  String? township;
@override final  String? state;
@override final  String tier;
@override final  String tierLabel;
@override final  int? memberSinceYear;
@override@JsonKey() final  bool birthdayToday;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDtoCopyWith<_ProfileDto> get copyWith => __$ProfileDtoCopyWithImpl<_ProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDto&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneDisplay, phoneDisplay) || other.phoneDisplay == phoneDisplay)&&(identical(other.email, email) || other.email == email)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.address, address) || other.address == address)&&(identical(other.township, township) || other.township == township)&&(identical(other.state, state) || other.state == state)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.tierLabel, tierLabel) || other.tierLabel == tierLabel)&&(identical(other.memberSinceYear, memberSinceYear) || other.memberSinceYear == memberSinceYear)&&(identical(other.birthdayToday, birthdayToday) || other.birthdayToday == birthdayToday));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,memberId,name,phone,phoneDisplay,email,photoUrl,dateOfBirth,address,township,state,tier,tierLabel,memberSinceYear,birthdayToday);
}

@override
String toString() {
    return 'ProfileDto(memberId: $memberId, name: $name, phone: $phone, phoneDisplay: $phoneDisplay, email: $email, photoUrl: $photoUrl, dateOfBirth: $dateOfBirth, address: $address, township: $township, state: $state, tier: $tier, tierLabel: $tierLabel, memberSinceYear: $memberSinceYear, birthdayToday: $birthdayToday)';
}


}

/// @nodoc
abstract mixin class _$ProfileDtoCopyWith<$Res> implements $ProfileDtoCopyWith<$Res> {
  factory _$ProfileDtoCopyWith(_ProfileDto value, $Res Function(_ProfileDto) _then) = __$ProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 String memberId, String name, String phone, String phoneDisplay, String? email, String? photoUrl, String? dateOfBirth, String? address, String? township, String? state, String tier, String tierLabel, int? memberSinceYear, bool birthdayToday
});




}
/// @nodoc
class __$ProfileDtoCopyWithImpl<$Res>
    implements _$ProfileDtoCopyWith<$Res> {
  __$ProfileDtoCopyWithImpl(this._self, this._then);

  final _ProfileDto _self;
  final $Res Function(_ProfileDto) _then;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? memberId = null,Object? name = null,Object? phone = null,Object? phoneDisplay = null,Object? email = freezed,Object? photoUrl = freezed,Object? dateOfBirth = freezed,Object? address = freezed,Object? township = freezed,Object? state = freezed,Object? tier = null,Object? tierLabel = null,Object? memberSinceYear = freezed,Object? birthdayToday = null,}) {
  return _then(_ProfileDto(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneDisplay: null == phoneDisplay ? _self.phoneDisplay : phoneDisplay // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,township: freezed == township ? _self.township : township // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,tierLabel: null == tierLabel ? _self.tierLabel : tierLabel // ignore: cast_nullable_to_non_nullable
as String,memberSinceYear: freezed == memberSinceYear ? _self.memberSinceYear : memberSinceYear // ignore: cast_nullable_to_non_nullable
as int?,birthdayToday: null == birthdayToday ? _self.birthdayToday : birthdayToday // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PreferencesDto {

 bool get pushEnabled; String? get preferredPayment; String get language;
/// Create a copy of PreferencesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesDtoCopyWith<PreferencesDto> get copyWith => _$PreferencesDtoCopyWithImpl<PreferencesDto>(this as PreferencesDto, _$identity);

  /// Serializes this PreferencesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PreferencesDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesDto&&(identical(other.pushEnabled, _this.pushEnabled) || other.pushEnabled == _this.pushEnabled)&&(identical(other.preferredPayment, _this.preferredPayment) || other.preferredPayment == _this.preferredPayment)&&(identical(other.language, _this.language) || other.language == _this.language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PreferencesDto;
  return Object.hash(runtimeType,_this.pushEnabled,_this.preferredPayment,_this.language);
}

@override
String toString() {
  final _this = this as PreferencesDto;
  return 'PreferencesDto(pushEnabled: ${_this.pushEnabled}, preferredPayment: ${_this.preferredPayment}, language: ${_this.language})';
}


}

/// @nodoc
abstract mixin class $PreferencesDtoCopyWith<$Res>  {
  factory $PreferencesDtoCopyWith(PreferencesDto value, $Res Function(PreferencesDto) _then) = _$PreferencesDtoCopyWithImpl;
@useResult
$Res call({
 bool pushEnabled, String? preferredPayment, String language
});




}
/// @nodoc
class _$PreferencesDtoCopyWithImpl<$Res>
    implements $PreferencesDtoCopyWith<$Res> {
  _$PreferencesDtoCopyWithImpl(this._self, this._then);

  final PreferencesDto _self;
  final $Res Function(PreferencesDto) _then;

/// Create a copy of PreferencesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pushEnabled = null,Object? preferredPayment = freezed,Object? language = null,}) {
  return _then(PreferencesDto(
pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,preferredPayment: freezed == preferredPayment ? _self.preferredPayment : preferredPayment // ignore: cast_nullable_to_non_nullable
as String?,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PreferencesDto].
extension PreferencesDtoPatterns on PreferencesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreferencesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreferencesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreferencesDto value)  $default,){
final _that = this;
switch (_that) {
case _PreferencesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreferencesDto value)?  $default,){
final _that = this;
switch (_that) {
case _PreferencesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool pushEnabled,  String? preferredPayment,  String language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreferencesDto() when $default != null:
return $default(_that.pushEnabled,_that.preferredPayment,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool pushEnabled,  String? preferredPayment,  String language)  $default,) {final _that = this;
switch (_that) {
case _PreferencesDto():
return $default(_that.pushEnabled,_that.preferredPayment,_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool pushEnabled,  String? preferredPayment,  String language)?  $default,) {final _that = this;
switch (_that) {
case _PreferencesDto() when $default != null:
return $default(_that.pushEnabled,_that.preferredPayment,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreferencesDto implements PreferencesDto {
  const _PreferencesDto({required this.pushEnabled, this.preferredPayment, this.language = 'en'});
  factory _PreferencesDto.fromJson(Map<String, dynamic> json) => _$PreferencesDtoFromJson(json);

@override final  bool pushEnabled;
@override final  String? preferredPayment;
@override@JsonKey() final  String language;

/// Create a copy of PreferencesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferencesDtoCopyWith<_PreferencesDto> get copyWith => __$PreferencesDtoCopyWithImpl<_PreferencesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreferencesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreferencesDto&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.preferredPayment, preferredPayment) || other.preferredPayment == preferredPayment)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,pushEnabled,preferredPayment,language);
}

@override
String toString() {
    return 'PreferencesDto(pushEnabled: $pushEnabled, preferredPayment: $preferredPayment, language: $language)';
}


}

/// @nodoc
abstract mixin class _$PreferencesDtoCopyWith<$Res> implements $PreferencesDtoCopyWith<$Res> {
  factory _$PreferencesDtoCopyWith(_PreferencesDto value, $Res Function(_PreferencesDto) _then) = __$PreferencesDtoCopyWithImpl;
@override @useResult
$Res call({
 bool pushEnabled, String? preferredPayment, String language
});




}
/// @nodoc
class __$PreferencesDtoCopyWithImpl<$Res>
    implements _$PreferencesDtoCopyWith<$Res> {
  __$PreferencesDtoCopyWithImpl(this._self, this._then);

  final _PreferencesDto _self;
  final $Res Function(_PreferencesDto) _then;

/// Create a copy of PreferencesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pushEnabled = null,Object? preferredPayment = freezed,Object? language = null,}) {
  return _then(_PreferencesDto(
pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,preferredPayment: freezed == preferredPayment ? _self.preferredPayment : preferredPayment // ignore: cast_nullable_to_non_nullable
as String?,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaymentMethodDto {

 String get code; String get title; String get description; bool get enabled; bool get isDefault; String? get disabledReason;
/// Create a copy of PaymentMethodDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodDtoCopyWith<PaymentMethodDto> get copyWith => _$PaymentMethodDtoCopyWithImpl<PaymentMethodDto>(this as PaymentMethodDto, _$identity);

  /// Serializes this PaymentMethodDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PaymentMethodDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodDto&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.isDefault, _this.isDefault) || other.isDefault == _this.isDefault)&&(identical(other.disabledReason, _this.disabledReason) || other.disabledReason == _this.disabledReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PaymentMethodDto;
  return Object.hash(runtimeType,_this.code,_this.title,_this.description,_this.enabled,_this.isDefault,_this.disabledReason);
}

@override
String toString() {
  final _this = this as PaymentMethodDto;
  return 'PaymentMethodDto(code: ${_this.code}, title: ${_this.title}, description: ${_this.description}, enabled: ${_this.enabled}, isDefault: ${_this.isDefault}, disabledReason: ${_this.disabledReason})';
}


}

/// @nodoc
abstract mixin class $PaymentMethodDtoCopyWith<$Res>  {
  factory $PaymentMethodDtoCopyWith(PaymentMethodDto value, $Res Function(PaymentMethodDto) _then) = _$PaymentMethodDtoCopyWithImpl;
@useResult
$Res call({
 String code, String title, String description, bool enabled, bool isDefault, String? disabledReason
});




}
/// @nodoc
class _$PaymentMethodDtoCopyWithImpl<$Res>
    implements $PaymentMethodDtoCopyWith<$Res> {
  _$PaymentMethodDtoCopyWithImpl(this._self, this._then);

  final PaymentMethodDto _self;
  final $Res Function(PaymentMethodDto) _then;

/// Create a copy of PaymentMethodDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? title = null,Object? description = null,Object? enabled = null,Object? isDefault = null,Object? disabledReason = freezed,}) {
  return _then(PaymentMethodDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,disabledReason: freezed == disabledReason ? _self.disabledReason : disabledReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodDto].
extension PaymentMethodDtoPatterns on PaymentMethodDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodDto value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodDto value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String title,  String description,  bool enabled,  bool isDefault,  String? disabledReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodDto() when $default != null:
return $default(_that.code,_that.title,_that.description,_that.enabled,_that.isDefault,_that.disabledReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String title,  String description,  bool enabled,  bool isDefault,  String? disabledReason)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodDto():
return $default(_that.code,_that.title,_that.description,_that.enabled,_that.isDefault,_that.disabledReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String title,  String description,  bool enabled,  bool isDefault,  String? disabledReason)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodDto() when $default != null:
return $default(_that.code,_that.title,_that.description,_that.enabled,_that.isDefault,_that.disabledReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodDto implements PaymentMethodDto {
  const _PaymentMethodDto({required this.code, required this.title, required this.description, required this.enabled, required this.isDefault, this.disabledReason});
  factory _PaymentMethodDto.fromJson(Map<String, dynamic> json) => _$PaymentMethodDtoFromJson(json);

@override final  String code;
@override final  String title;
@override final  String description;
@override final  bool enabled;
@override final  bool isDefault;
@override final  String? disabledReason;

/// Create a copy of PaymentMethodDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodDtoCopyWith<_PaymentMethodDto> get copyWith => __$PaymentMethodDtoCopyWithImpl<_PaymentMethodDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodDto&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.disabledReason, disabledReason) || other.disabledReason == disabledReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,title,description,enabled,isDefault,disabledReason);
}

@override
String toString() {
    return 'PaymentMethodDto(code: $code, title: $title, description: $description, enabled: $enabled, isDefault: $isDefault, disabledReason: $disabledReason)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodDtoCopyWith<$Res> implements $PaymentMethodDtoCopyWith<$Res> {
  factory _$PaymentMethodDtoCopyWith(_PaymentMethodDto value, $Res Function(_PaymentMethodDto) _then) = __$PaymentMethodDtoCopyWithImpl;
@override @useResult
$Res call({
 String code, String title, String description, bool enabled, bool isDefault, String? disabledReason
});




}
/// @nodoc
class __$PaymentMethodDtoCopyWithImpl<$Res>
    implements _$PaymentMethodDtoCopyWith<$Res> {
  __$PaymentMethodDtoCopyWithImpl(this._self, this._then);

  final _PaymentMethodDto _self;
  final $Res Function(_PaymentMethodDto) _then;

/// Create a copy of PaymentMethodDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? title = null,Object? description = null,Object? enabled = null,Object? isDefault = null,Object? disabledReason = freezed,}) {
  return _then(_PaymentMethodDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,disabledReason: freezed == disabledReason ? _self.disabledReason : disabledReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
