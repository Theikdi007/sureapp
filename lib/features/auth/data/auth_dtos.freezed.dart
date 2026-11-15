// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhoneCheckDto {

@JsonKey(unknownEnumValue: PhoneCheckStatus.unknown) PhoneCheckStatus get status; String get phone; String get phoneDisplay; OtpPurpose? get purpose; int? get resendAfterSeconds;
/// Create a copy of PhoneCheckDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneCheckDtoCopyWith<PhoneCheckDto> get copyWith => _$PhoneCheckDtoCopyWithImpl<PhoneCheckDto>(this as PhoneCheckDto, _$identity);

  /// Serializes this PhoneCheckDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PhoneCheckDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneCheckDto&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.phoneDisplay, _this.phoneDisplay) || other.phoneDisplay == _this.phoneDisplay)&&(identical(other.purpose, _this.purpose) || other.purpose == _this.purpose)&&(identical(other.resendAfterSeconds, _this.resendAfterSeconds) || other.resendAfterSeconds == _this.resendAfterSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PhoneCheckDto;
  return Object.hash(runtimeType,_this.status,_this.phone,_this.phoneDisplay,_this.purpose,_this.resendAfterSeconds);
}

@override
String toString() {
  final _this = this as PhoneCheckDto;
  return 'PhoneCheckDto(status: ${_this.status}, phone: ${_this.phone}, phoneDisplay: ${_this.phoneDisplay}, purpose: ${_this.purpose}, resendAfterSeconds: ${_this.resendAfterSeconds})';
}


}

/// @nodoc
abstract mixin class $PhoneCheckDtoCopyWith<$Res>  {
  factory $PhoneCheckDtoCopyWith(PhoneCheckDto value, $Res Function(PhoneCheckDto) _then) = _$PhoneCheckDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: PhoneCheckStatus.unknown) PhoneCheckStatus status, String phone, String phoneDisplay, OtpPurpose? purpose, int? resendAfterSeconds
});




}
/// @nodoc
class _$PhoneCheckDtoCopyWithImpl<$Res>
    implements $PhoneCheckDtoCopyWith<$Res> {
  _$PhoneCheckDtoCopyWithImpl(this._self, this._then);

  final PhoneCheckDto _self;
  final $Res Function(PhoneCheckDto) _then;

/// Create a copy of PhoneCheckDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? phone = null,Object? phoneDisplay = null,Object? purpose = freezed,Object? resendAfterSeconds = freezed,}) {
  return _then(PhoneCheckDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhoneCheckStatus,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneDisplay: null == phoneDisplay ? _self.phoneDisplay : phoneDisplay // ignore: cast_nullable_to_non_nullable
as String,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as OtpPurpose?,resendAfterSeconds: freezed == resendAfterSeconds ? _self.resendAfterSeconds : resendAfterSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneCheckDto].
extension PhoneCheckDtoPatterns on PhoneCheckDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneCheckDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneCheckDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneCheckDto value)  $default,){
final _that = this;
switch (_that) {
case _PhoneCheckDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneCheckDto value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneCheckDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: PhoneCheckStatus.unknown)  PhoneCheckStatus status,  String phone,  String phoneDisplay,  OtpPurpose? purpose,  int? resendAfterSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneCheckDto() when $default != null:
return $default(_that.status,_that.phone,_that.phoneDisplay,_that.purpose,_that.resendAfterSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: PhoneCheckStatus.unknown)  PhoneCheckStatus status,  String phone,  String phoneDisplay,  OtpPurpose? purpose,  int? resendAfterSeconds)  $default,) {final _that = this;
switch (_that) {
case _PhoneCheckDto():
return $default(_that.status,_that.phone,_that.phoneDisplay,_that.purpose,_that.resendAfterSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: PhoneCheckStatus.unknown)  PhoneCheckStatus status,  String phone,  String phoneDisplay,  OtpPurpose? purpose,  int? resendAfterSeconds)?  $default,) {final _that = this;
switch (_that) {
case _PhoneCheckDto() when $default != null:
return $default(_that.status,_that.phone,_that.phoneDisplay,_that.purpose,_that.resendAfterSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhoneCheckDto implements PhoneCheckDto {
  const _PhoneCheckDto({@JsonKey(unknownEnumValue: PhoneCheckStatus.unknown) required this.status, required this.phone, required this.phoneDisplay, this.purpose, this.resendAfterSeconds});
  factory _PhoneCheckDto.fromJson(Map<String, dynamic> json) => _$PhoneCheckDtoFromJson(json);

@override@JsonKey(unknownEnumValue: PhoneCheckStatus.unknown) final  PhoneCheckStatus status;
@override final  String phone;
@override final  String phoneDisplay;
@override final  OtpPurpose? purpose;
@override final  int? resendAfterSeconds;

/// Create a copy of PhoneCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneCheckDtoCopyWith<_PhoneCheckDto> get copyWith => __$PhoneCheckDtoCopyWithImpl<_PhoneCheckDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhoneCheckDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneCheckDto&&(identical(other.status, status) || other.status == status)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneDisplay, phoneDisplay) || other.phoneDisplay == phoneDisplay)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.resendAfterSeconds, resendAfterSeconds) || other.resendAfterSeconds == resendAfterSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,phone,phoneDisplay,purpose,resendAfterSeconds);
}

@override
String toString() {
    return 'PhoneCheckDto(status: $status, phone: $phone, phoneDisplay: $phoneDisplay, purpose: $purpose, resendAfterSeconds: $resendAfterSeconds)';
}


}

/// @nodoc
abstract mixin class _$PhoneCheckDtoCopyWith<$Res> implements $PhoneCheckDtoCopyWith<$Res> {
  factory _$PhoneCheckDtoCopyWith(_PhoneCheckDto value, $Res Function(_PhoneCheckDto) _then) = __$PhoneCheckDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: PhoneCheckStatus.unknown) PhoneCheckStatus status, String phone, String phoneDisplay, OtpPurpose? purpose, int? resendAfterSeconds
});




}
/// @nodoc
class __$PhoneCheckDtoCopyWithImpl<$Res>
    implements _$PhoneCheckDtoCopyWith<$Res> {
  __$PhoneCheckDtoCopyWithImpl(this._self, this._then);

  final _PhoneCheckDto _self;
  final $Res Function(_PhoneCheckDto) _then;

/// Create a copy of PhoneCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? phone = null,Object? phoneDisplay = null,Object? purpose = freezed,Object? resendAfterSeconds = freezed,}) {
  return _then(_PhoneCheckDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhoneCheckStatus,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneDisplay: null == phoneDisplay ? _self.phoneDisplay : phoneDisplay // ignore: cast_nullable_to_non_nullable
as String,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as OtpPurpose?,resendAfterSeconds: freezed == resendAfterSeconds ? _self.resendAfterSeconds : resendAfterSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$OtpSentDto {

 String get phone; String get phoneDisplay; OtpPurpose get purpose; int get resendAfterSeconds; int get expiresInSeconds;
/// Create a copy of OtpSentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpSentDtoCopyWith<OtpSentDto> get copyWith => _$OtpSentDtoCopyWithImpl<OtpSentDto>(this as OtpSentDto, _$identity);

  /// Serializes this OtpSentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OtpSentDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpSentDto&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.phoneDisplay, _this.phoneDisplay) || other.phoneDisplay == _this.phoneDisplay)&&(identical(other.purpose, _this.purpose) || other.purpose == _this.purpose)&&(identical(other.resendAfterSeconds, _this.resendAfterSeconds) || other.resendAfterSeconds == _this.resendAfterSeconds)&&(identical(other.expiresInSeconds, _this.expiresInSeconds) || other.expiresInSeconds == _this.expiresInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OtpSentDto;
  return Object.hash(runtimeType,_this.phone,_this.phoneDisplay,_this.purpose,_this.resendAfterSeconds,_this.expiresInSeconds);
}

@override
String toString() {
  final _this = this as OtpSentDto;
  return 'OtpSentDto(phone: ${_this.phone}, phoneDisplay: ${_this.phoneDisplay}, purpose: ${_this.purpose}, resendAfterSeconds: ${_this.resendAfterSeconds}, expiresInSeconds: ${_this.expiresInSeconds})';
}


}

/// @nodoc
abstract mixin class $OtpSentDtoCopyWith<$Res>  {
  factory $OtpSentDtoCopyWith(OtpSentDto value, $Res Function(OtpSentDto) _then) = _$OtpSentDtoCopyWithImpl;
@useResult
$Res call({
 String phone, String phoneDisplay, OtpPurpose purpose, int resendAfterSeconds, int expiresInSeconds
});




}
/// @nodoc
class _$OtpSentDtoCopyWithImpl<$Res>
    implements $OtpSentDtoCopyWith<$Res> {
  _$OtpSentDtoCopyWithImpl(this._self, this._then);

  final OtpSentDto _self;
  final $Res Function(OtpSentDto) _then;

/// Create a copy of OtpSentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? phoneDisplay = null,Object? purpose = null,Object? resendAfterSeconds = null,Object? expiresInSeconds = null,}) {
  return _then(OtpSentDto(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneDisplay: null == phoneDisplay ? _self.phoneDisplay : phoneDisplay // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as OtpPurpose,resendAfterSeconds: null == resendAfterSeconds ? _self.resendAfterSeconds : resendAfterSeconds // ignore: cast_nullable_to_non_nullable
as int,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpSentDto].
extension OtpSentDtoPatterns on OtpSentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpSentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpSentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpSentDto value)  $default,){
final _that = this;
switch (_that) {
case _OtpSentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpSentDto value)?  $default,){
final _that = this;
switch (_that) {
case _OtpSentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String phoneDisplay,  OtpPurpose purpose,  int resendAfterSeconds,  int expiresInSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpSentDto() when $default != null:
return $default(_that.phone,_that.phoneDisplay,_that.purpose,_that.resendAfterSeconds,_that.expiresInSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String phoneDisplay,  OtpPurpose purpose,  int resendAfterSeconds,  int expiresInSeconds)  $default,) {final _that = this;
switch (_that) {
case _OtpSentDto():
return $default(_that.phone,_that.phoneDisplay,_that.purpose,_that.resendAfterSeconds,_that.expiresInSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String phoneDisplay,  OtpPurpose purpose,  int resendAfterSeconds,  int expiresInSeconds)?  $default,) {final _that = this;
switch (_that) {
case _OtpSentDto() when $default != null:
return $default(_that.phone,_that.phoneDisplay,_that.purpose,_that.resendAfterSeconds,_that.expiresInSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpSentDto implements OtpSentDto {
  const _OtpSentDto({required this.phone, required this.phoneDisplay, required this.purpose, required this.resendAfterSeconds, required this.expiresInSeconds});
  factory _OtpSentDto.fromJson(Map<String, dynamic> json) => _$OtpSentDtoFromJson(json);

@override final  String phone;
@override final  String phoneDisplay;
@override final  OtpPurpose purpose;
@override final  int resendAfterSeconds;
@override final  int expiresInSeconds;

/// Create a copy of OtpSentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpSentDtoCopyWith<_OtpSentDto> get copyWith => __$OtpSentDtoCopyWithImpl<_OtpSentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpSentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpSentDto&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneDisplay, phoneDisplay) || other.phoneDisplay == phoneDisplay)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.resendAfterSeconds, resendAfterSeconds) || other.resendAfterSeconds == resendAfterSeconds)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,phone,phoneDisplay,purpose,resendAfterSeconds,expiresInSeconds);
}

@override
String toString() {
    return 'OtpSentDto(phone: $phone, phoneDisplay: $phoneDisplay, purpose: $purpose, resendAfterSeconds: $resendAfterSeconds, expiresInSeconds: $expiresInSeconds)';
}


}

/// @nodoc
abstract mixin class _$OtpSentDtoCopyWith<$Res> implements $OtpSentDtoCopyWith<$Res> {
  factory _$OtpSentDtoCopyWith(_OtpSentDto value, $Res Function(_OtpSentDto) _then) = __$OtpSentDtoCopyWithImpl;
@override @useResult
$Res call({
 String phone, String phoneDisplay, OtpPurpose purpose, int resendAfterSeconds, int expiresInSeconds
});




}
/// @nodoc
class __$OtpSentDtoCopyWithImpl<$Res>
    implements _$OtpSentDtoCopyWith<$Res> {
  __$OtpSentDtoCopyWithImpl(this._self, this._then);

  final _OtpSentDto _self;
  final $Res Function(_OtpSentDto) _then;

/// Create a copy of OtpSentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? phoneDisplay = null,Object? purpose = null,Object? resendAfterSeconds = null,Object? expiresInSeconds = null,}) {
  return _then(_OtpSentDto(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneDisplay: null == phoneDisplay ? _self.phoneDisplay : phoneDisplay // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as OtpPurpose,resendAfterSeconds: null == resendAfterSeconds ? _self.resendAfterSeconds : resendAfterSeconds // ignore: cast_nullable_to_non_nullable
as int,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OtpTicketDto {

 String get ticket; OtpPurpose get purpose; String get expiresAt;
/// Create a copy of OtpTicketDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpTicketDtoCopyWith<OtpTicketDto> get copyWith => _$OtpTicketDtoCopyWithImpl<OtpTicketDto>(this as OtpTicketDto, _$identity);

  /// Serializes this OtpTicketDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OtpTicketDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpTicketDto&&(identical(other.ticket, _this.ticket) || other.ticket == _this.ticket)&&(identical(other.purpose, _this.purpose) || other.purpose == _this.purpose)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OtpTicketDto;
  return Object.hash(runtimeType,_this.ticket,_this.purpose,_this.expiresAt);
}

@override
String toString() {
  final _this = this as OtpTicketDto;
  return 'OtpTicketDto(ticket: ${_this.ticket}, purpose: ${_this.purpose}, expiresAt: ${_this.expiresAt})';
}


}

/// @nodoc
abstract mixin class $OtpTicketDtoCopyWith<$Res>  {
  factory $OtpTicketDtoCopyWith(OtpTicketDto value, $Res Function(OtpTicketDto) _then) = _$OtpTicketDtoCopyWithImpl;
@useResult
$Res call({
 String ticket, OtpPurpose purpose, String expiresAt
});




}
/// @nodoc
class _$OtpTicketDtoCopyWithImpl<$Res>
    implements $OtpTicketDtoCopyWith<$Res> {
  _$OtpTicketDtoCopyWithImpl(this._self, this._then);

  final OtpTicketDto _self;
  final $Res Function(OtpTicketDto) _then;

/// Create a copy of OtpTicketDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticket = null,Object? purpose = null,Object? expiresAt = null,}) {
  return _then(OtpTicketDto(
ticket: null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as OtpPurpose,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpTicketDto].
extension OtpTicketDtoPatterns on OtpTicketDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpTicketDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpTicketDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpTicketDto value)  $default,){
final _that = this;
switch (_that) {
case _OtpTicketDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpTicketDto value)?  $default,){
final _that = this;
switch (_that) {
case _OtpTicketDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ticket,  OtpPurpose purpose,  String expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpTicketDto() when $default != null:
return $default(_that.ticket,_that.purpose,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ticket,  OtpPurpose purpose,  String expiresAt)  $default,) {final _that = this;
switch (_that) {
case _OtpTicketDto():
return $default(_that.ticket,_that.purpose,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ticket,  OtpPurpose purpose,  String expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _OtpTicketDto() when $default != null:
return $default(_that.ticket,_that.purpose,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpTicketDto implements OtpTicketDto {
  const _OtpTicketDto({required this.ticket, required this.purpose, required this.expiresAt});
  factory _OtpTicketDto.fromJson(Map<String, dynamic> json) => _$OtpTicketDtoFromJson(json);

@override final  String ticket;
@override final  OtpPurpose purpose;
@override final  String expiresAt;

/// Create a copy of OtpTicketDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpTicketDtoCopyWith<_OtpTicketDto> get copyWith => __$OtpTicketDtoCopyWithImpl<_OtpTicketDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpTicketDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpTicketDto&&(identical(other.ticket, ticket) || other.ticket == ticket)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,ticket,purpose,expiresAt);
}

@override
String toString() {
    return 'OtpTicketDto(ticket: $ticket, purpose: $purpose, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$OtpTicketDtoCopyWith<$Res> implements $OtpTicketDtoCopyWith<$Res> {
  factory _$OtpTicketDtoCopyWith(_OtpTicketDto value, $Res Function(_OtpTicketDto) _then) = __$OtpTicketDtoCopyWithImpl;
@override @useResult
$Res call({
 String ticket, OtpPurpose purpose, String expiresAt
});




}
/// @nodoc
class __$OtpTicketDtoCopyWithImpl<$Res>
    implements _$OtpTicketDtoCopyWith<$Res> {
  __$OtpTicketDtoCopyWithImpl(this._self, this._then);

  final _OtpTicketDto _self;
  final $Res Function(_OtpTicketDto) _then;

/// Create a copy of OtpTicketDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticket = null,Object? purpose = null,Object? expiresAt = null,}) {
  return _then(_OtpTicketDto(
ticket: null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as OtpPurpose,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MemberBriefDto {

 String get memberId; String get name; String get phone; String get phoneDisplay; String get tier; String get tierLabel;
/// Create a copy of MemberBriefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberBriefDtoCopyWith<MemberBriefDto> get copyWith => _$MemberBriefDtoCopyWithImpl<MemberBriefDto>(this as MemberBriefDto, _$identity);

  /// Serializes this MemberBriefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MemberBriefDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberBriefDto&&(identical(other.memberId, _this.memberId) || other.memberId == _this.memberId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.phoneDisplay, _this.phoneDisplay) || other.phoneDisplay == _this.phoneDisplay)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.tierLabel, _this.tierLabel) || other.tierLabel == _this.tierLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MemberBriefDto;
  return Object.hash(runtimeType,_this.memberId,_this.name,_this.phone,_this.phoneDisplay,_this.tier,_this.tierLabel);
}

@override
String toString() {
  final _this = this as MemberBriefDto;
  return 'MemberBriefDto(memberId: ${_this.memberId}, name: ${_this.name}, phone: ${_this.phone}, phoneDisplay: ${_this.phoneDisplay}, tier: ${_this.tier}, tierLabel: ${_this.tierLabel})';
}


}

/// @nodoc
abstract mixin class $MemberBriefDtoCopyWith<$Res>  {
  factory $MemberBriefDtoCopyWith(MemberBriefDto value, $Res Function(MemberBriefDto) _then) = _$MemberBriefDtoCopyWithImpl;
@useResult
$Res call({
 String memberId, String name, String phone, String phoneDisplay, String tier, String tierLabel
});




}
/// @nodoc
class _$MemberBriefDtoCopyWithImpl<$Res>
    implements $MemberBriefDtoCopyWith<$Res> {
  _$MemberBriefDtoCopyWithImpl(this._self, this._then);

  final MemberBriefDto _self;
  final $Res Function(MemberBriefDto) _then;

/// Create a copy of MemberBriefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? memberId = null,Object? name = null,Object? phone = null,Object? phoneDisplay = null,Object? tier = null,Object? tierLabel = null,}) {
  return _then(MemberBriefDto(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneDisplay: null == phoneDisplay ? _self.phoneDisplay : phoneDisplay // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,tierLabel: null == tierLabel ? _self.tierLabel : tierLabel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberBriefDto].
extension MemberBriefDtoPatterns on MemberBriefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberBriefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberBriefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberBriefDto value)  $default,){
final _that = this;
switch (_that) {
case _MemberBriefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberBriefDto value)?  $default,){
final _that = this;
switch (_that) {
case _MemberBriefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String memberId,  String name,  String phone,  String phoneDisplay,  String tier,  String tierLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberBriefDto() when $default != null:
return $default(_that.memberId,_that.name,_that.phone,_that.phoneDisplay,_that.tier,_that.tierLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String memberId,  String name,  String phone,  String phoneDisplay,  String tier,  String tierLabel)  $default,) {final _that = this;
switch (_that) {
case _MemberBriefDto():
return $default(_that.memberId,_that.name,_that.phone,_that.phoneDisplay,_that.tier,_that.tierLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String memberId,  String name,  String phone,  String phoneDisplay,  String tier,  String tierLabel)?  $default,) {final _that = this;
switch (_that) {
case _MemberBriefDto() when $default != null:
return $default(_that.memberId,_that.name,_that.phone,_that.phoneDisplay,_that.tier,_that.tierLabel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberBriefDto implements MemberBriefDto {
  const _MemberBriefDto({required this.memberId, required this.name, required this.phone, required this.phoneDisplay, required this.tier, required this.tierLabel});
  factory _MemberBriefDto.fromJson(Map<String, dynamic> json) => _$MemberBriefDtoFromJson(json);

@override final  String memberId;
@override final  String name;
@override final  String phone;
@override final  String phoneDisplay;
@override final  String tier;
@override final  String tierLabel;

/// Create a copy of MemberBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberBriefDtoCopyWith<_MemberBriefDto> get copyWith => __$MemberBriefDtoCopyWithImpl<_MemberBriefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberBriefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberBriefDto&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneDisplay, phoneDisplay) || other.phoneDisplay == phoneDisplay)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.tierLabel, tierLabel) || other.tierLabel == tierLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,memberId,name,phone,phoneDisplay,tier,tierLabel);
}

@override
String toString() {
    return 'MemberBriefDto(memberId: $memberId, name: $name, phone: $phone, phoneDisplay: $phoneDisplay, tier: $tier, tierLabel: $tierLabel)';
}


}

/// @nodoc
abstract mixin class _$MemberBriefDtoCopyWith<$Res> implements $MemberBriefDtoCopyWith<$Res> {
  factory _$MemberBriefDtoCopyWith(_MemberBriefDto value, $Res Function(_MemberBriefDto) _then) = __$MemberBriefDtoCopyWithImpl;
@override @useResult
$Res call({
 String memberId, String name, String phone, String phoneDisplay, String tier, String tierLabel
});




}
/// @nodoc
class __$MemberBriefDtoCopyWithImpl<$Res>
    implements _$MemberBriefDtoCopyWith<$Res> {
  __$MemberBriefDtoCopyWithImpl(this._self, this._then);

  final _MemberBriefDto _self;
  final $Res Function(_MemberBriefDto) _then;

/// Create a copy of MemberBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? memberId = null,Object? name = null,Object? phone = null,Object? phoneDisplay = null,Object? tier = null,Object? tierLabel = null,}) {
  return _then(_MemberBriefDto(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneDisplay: null == phoneDisplay ? _self.phoneDisplay : phoneDisplay // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,tierLabel: null == tierLabel ? _self.tierLabel : tierLabel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthTokensDto {

 String get accessToken; String get accessTokenExpiresAt; String get refreshToken; String get refreshTokenExpiresAt; MemberBriefDto get member;
/// Create a copy of AuthTokensDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTokensDtoCopyWith<AuthTokensDto> get copyWith => _$AuthTokensDtoCopyWithImpl<AuthTokensDto>(this as AuthTokensDto, _$identity);

  /// Serializes this AuthTokensDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuthTokensDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthTokensDto&&(identical(other.accessToken, _this.accessToken) || other.accessToken == _this.accessToken)&&(identical(other.accessTokenExpiresAt, _this.accessTokenExpiresAt) || other.accessTokenExpiresAt == _this.accessTokenExpiresAt)&&(identical(other.refreshToken, _this.refreshToken) || other.refreshToken == _this.refreshToken)&&(identical(other.refreshTokenExpiresAt, _this.refreshTokenExpiresAt) || other.refreshTokenExpiresAt == _this.refreshTokenExpiresAt)&&(identical(other.member, _this.member) || other.member == _this.member));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuthTokensDto;
  return Object.hash(runtimeType,_this.accessToken,_this.accessTokenExpiresAt,_this.refreshToken,_this.refreshTokenExpiresAt,_this.member);
}

@override
String toString() {
  final _this = this as AuthTokensDto;
  return 'AuthTokensDto(accessToken: ${_this.accessToken}, accessTokenExpiresAt: ${_this.accessTokenExpiresAt}, refreshToken: ${_this.refreshToken}, refreshTokenExpiresAt: ${_this.refreshTokenExpiresAt}, member: ${_this.member})';
}


}

/// @nodoc
abstract mixin class $AuthTokensDtoCopyWith<$Res>  {
  factory $AuthTokensDtoCopyWith(AuthTokensDto value, $Res Function(AuthTokensDto) _then) = _$AuthTokensDtoCopyWithImpl;
@useResult
$Res call({
 String accessToken, String accessTokenExpiresAt, String refreshToken, String refreshTokenExpiresAt, MemberBriefDto member
});


$MemberBriefDtoCopyWith<$Res> get member;

}
/// @nodoc
class _$AuthTokensDtoCopyWithImpl<$Res>
    implements $AuthTokensDtoCopyWith<$Res> {
  _$AuthTokensDtoCopyWithImpl(this._self, this._then);

  final AuthTokensDto _self;
  final $Res Function(AuthTokensDto) _then;

/// Create a copy of AuthTokensDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? accessTokenExpiresAt = null,Object? refreshToken = null,Object? refreshTokenExpiresAt = null,Object? member = null,}) {
  return _then(AuthTokensDto(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresAt: null == accessTokenExpiresAt ? _self.accessTokenExpiresAt : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,refreshTokenExpiresAt: null == refreshTokenExpiresAt ? _self.refreshTokenExpiresAt : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as String,member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as MemberBriefDto,
  ));
}
/// Create a copy of AuthTokensDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberBriefDtoCopyWith<$Res> get member {
  
  return $MemberBriefDtoCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthTokensDto].
extension AuthTokensDtoPatterns on AuthTokensDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthTokensDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthTokensDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthTokensDto value)  $default,){
final _that = this;
switch (_that) {
case _AuthTokensDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthTokensDto value)?  $default,){
final _that = this;
switch (_that) {
case _AuthTokensDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String accessTokenExpiresAt,  String refreshToken,  String refreshTokenExpiresAt,  MemberBriefDto member)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthTokensDto() when $default != null:
return $default(_that.accessToken,_that.accessTokenExpiresAt,_that.refreshToken,_that.refreshTokenExpiresAt,_that.member);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String accessTokenExpiresAt,  String refreshToken,  String refreshTokenExpiresAt,  MemberBriefDto member)  $default,) {final _that = this;
switch (_that) {
case _AuthTokensDto():
return $default(_that.accessToken,_that.accessTokenExpiresAt,_that.refreshToken,_that.refreshTokenExpiresAt,_that.member);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String accessTokenExpiresAt,  String refreshToken,  String refreshTokenExpiresAt,  MemberBriefDto member)?  $default,) {final _that = this;
switch (_that) {
case _AuthTokensDto() when $default != null:
return $default(_that.accessToken,_that.accessTokenExpiresAt,_that.refreshToken,_that.refreshTokenExpiresAt,_that.member);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthTokensDto implements AuthTokensDto {
  const _AuthTokensDto({required this.accessToken, required this.accessTokenExpiresAt, required this.refreshToken, required this.refreshTokenExpiresAt, required this.member});
  factory _AuthTokensDto.fromJson(Map<String, dynamic> json) => _$AuthTokensDtoFromJson(json);

@override final  String accessToken;
@override final  String accessTokenExpiresAt;
@override final  String refreshToken;
@override final  String refreshTokenExpiresAt;
@override final  MemberBriefDto member;

/// Create a copy of AuthTokensDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthTokensDtoCopyWith<_AuthTokensDto> get copyWith => __$AuthTokensDtoCopyWithImpl<_AuthTokensDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthTokensDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthTokensDto&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.accessTokenExpiresAt, accessTokenExpiresAt) || other.accessTokenExpiresAt == accessTokenExpiresAt)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.refreshTokenExpiresAt, refreshTokenExpiresAt) || other.refreshTokenExpiresAt == refreshTokenExpiresAt)&&(identical(other.member, member) || other.member == member));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,accessToken,accessTokenExpiresAt,refreshToken,refreshTokenExpiresAt,member);
}

@override
String toString() {
    return 'AuthTokensDto(accessToken: $accessToken, accessTokenExpiresAt: $accessTokenExpiresAt, refreshToken: $refreshToken, refreshTokenExpiresAt: $refreshTokenExpiresAt, member: $member)';
}


}

/// @nodoc
abstract mixin class _$AuthTokensDtoCopyWith<$Res> implements $AuthTokensDtoCopyWith<$Res> {
  factory _$AuthTokensDtoCopyWith(_AuthTokensDto value, $Res Function(_AuthTokensDto) _then) = __$AuthTokensDtoCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String accessTokenExpiresAt, String refreshToken, String refreshTokenExpiresAt, MemberBriefDto member
});


@override $MemberBriefDtoCopyWith<$Res> get member;

}
/// @nodoc
class __$AuthTokensDtoCopyWithImpl<$Res>
    implements _$AuthTokensDtoCopyWith<$Res> {
  __$AuthTokensDtoCopyWithImpl(this._self, this._then);

  final _AuthTokensDto _self;
  final $Res Function(_AuthTokensDto) _then;

/// Create a copy of AuthTokensDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? accessTokenExpiresAt = null,Object? refreshToken = null,Object? refreshTokenExpiresAt = null,Object? member = null,}) {
  return _then(_AuthTokensDto(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresAt: null == accessTokenExpiresAt ? _self.accessTokenExpiresAt : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,refreshTokenExpiresAt: null == refreshTokenExpiresAt ? _self.refreshTokenExpiresAt : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as String,member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as MemberBriefDto,
  ));
}

/// Create a copy of AuthTokensDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberBriefDtoCopyWith<$Res> get member {
  
  return $MemberBriefDtoCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}

// dart format on
