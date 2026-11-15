// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repairs_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepairDto {

 String get number; String get device; String? get serial; String get issue; String get state; String get statusLabel; bool get active; String? get storeName;/// The card's second line ("Yangon HQ · Ready Fri, 24 Jul").
 String get meta; String get receivedAt; String? get promisedAt;
/// Create a copy of RepairDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepairDtoCopyWith<RepairDto> get copyWith => _$RepairDtoCopyWithImpl<RepairDto>(this as RepairDto, _$identity);

  /// Serializes this RepairDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RepairDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepairDto&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.device, _this.device) || other.device == _this.device)&&(identical(other.serial, _this.serial) || other.serial == _this.serial)&&(identical(other.issue, _this.issue) || other.issue == _this.issue)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.storeName, _this.storeName) || other.storeName == _this.storeName)&&(identical(other.meta, _this.meta) || other.meta == _this.meta)&&(identical(other.receivedAt, _this.receivedAt) || other.receivedAt == _this.receivedAt)&&(identical(other.promisedAt, _this.promisedAt) || other.promisedAt == _this.promisedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RepairDto;
  return Object.hash(runtimeType,_this.number,_this.device,_this.serial,_this.issue,_this.state,_this.statusLabel,_this.active,_this.storeName,_this.meta,_this.receivedAt,_this.promisedAt);
}

@override
String toString() {
  final _this = this as RepairDto;
  return 'RepairDto(number: ${_this.number}, device: ${_this.device}, serial: ${_this.serial}, issue: ${_this.issue}, state: ${_this.state}, statusLabel: ${_this.statusLabel}, active: ${_this.active}, storeName: ${_this.storeName}, meta: ${_this.meta}, receivedAt: ${_this.receivedAt}, promisedAt: ${_this.promisedAt})';
}


}

/// @nodoc
abstract mixin class $RepairDtoCopyWith<$Res>  {
  factory $RepairDtoCopyWith(RepairDto value, $Res Function(RepairDto) _then) = _$RepairDtoCopyWithImpl;
@useResult
$Res call({
 String number, String device, String? serial, String issue, String state, String statusLabel, bool active, String? storeName, String meta, String receivedAt, String? promisedAt
});




}
/// @nodoc
class _$RepairDtoCopyWithImpl<$Res>
    implements $RepairDtoCopyWith<$Res> {
  _$RepairDtoCopyWithImpl(this._self, this._then);

  final RepairDto _self;
  final $Res Function(RepairDto) _then;

/// Create a copy of RepairDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? device = null,Object? serial = freezed,Object? issue = null,Object? state = null,Object? statusLabel = null,Object? active = null,Object? storeName = freezed,Object? meta = null,Object? receivedAt = null,Object? promisedAt = freezed,}) {
  return _then(RepairDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,serial: freezed == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String?,issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,storeName: freezed == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String?,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as String,promisedAt: freezed == promisedAt ? _self.promisedAt : promisedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RepairDto].
extension RepairDtoPatterns on RepairDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepairDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepairDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepairDto value)  $default,){
final _that = this;
switch (_that) {
case _RepairDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepairDto value)?  $default,){
final _that = this;
switch (_that) {
case _RepairDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  String device,  String? serial,  String issue,  String state,  String statusLabel,  bool active,  String? storeName,  String meta,  String receivedAt,  String? promisedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepairDto() when $default != null:
return $default(_that.number,_that.device,_that.serial,_that.issue,_that.state,_that.statusLabel,_that.active,_that.storeName,_that.meta,_that.receivedAt,_that.promisedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  String device,  String? serial,  String issue,  String state,  String statusLabel,  bool active,  String? storeName,  String meta,  String receivedAt,  String? promisedAt)  $default,) {final _that = this;
switch (_that) {
case _RepairDto():
return $default(_that.number,_that.device,_that.serial,_that.issue,_that.state,_that.statusLabel,_that.active,_that.storeName,_that.meta,_that.receivedAt,_that.promisedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  String device,  String? serial,  String issue,  String state,  String statusLabel,  bool active,  String? storeName,  String meta,  String receivedAt,  String? promisedAt)?  $default,) {final _that = this;
switch (_that) {
case _RepairDto() when $default != null:
return $default(_that.number,_that.device,_that.serial,_that.issue,_that.state,_that.statusLabel,_that.active,_that.storeName,_that.meta,_that.receivedAt,_that.promisedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RepairDto implements RepairDto {
  const _RepairDto({required this.number, required this.device, this.serial, required this.issue, required this.state, required this.statusLabel, required this.active, this.storeName, required this.meta, required this.receivedAt, this.promisedAt});
  factory _RepairDto.fromJson(Map<String, dynamic> json) => _$RepairDtoFromJson(json);

@override final  String number;
@override final  String device;
@override final  String? serial;
@override final  String issue;
@override final  String state;
@override final  String statusLabel;
@override final  bool active;
@override final  String? storeName;
/// The card's second line ("Yangon HQ · Ready Fri, 24 Jul").
@override final  String meta;
@override final  String receivedAt;
@override final  String? promisedAt;

/// Create a copy of RepairDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepairDtoCopyWith<_RepairDto> get copyWith => __$RepairDtoCopyWithImpl<_RepairDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RepairDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepairDto&&(identical(other.number, number) || other.number == number)&&(identical(other.device, device) || other.device == device)&&(identical(other.serial, serial) || other.serial == serial)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.state, state) || other.state == state)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.active, active) || other.active == active)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.promisedAt, promisedAt) || other.promisedAt == promisedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,device,serial,issue,state,statusLabel,active,storeName,meta,receivedAt,promisedAt);
}

@override
String toString() {
    return 'RepairDto(number: $number, device: $device, serial: $serial, issue: $issue, state: $state, statusLabel: $statusLabel, active: $active, storeName: $storeName, meta: $meta, receivedAt: $receivedAt, promisedAt: $promisedAt)';
}


}

/// @nodoc
abstract mixin class _$RepairDtoCopyWith<$Res> implements $RepairDtoCopyWith<$Res> {
  factory _$RepairDtoCopyWith(_RepairDto value, $Res Function(_RepairDto) _then) = __$RepairDtoCopyWithImpl;
@override @useResult
$Res call({
 String number, String device, String? serial, String issue, String state, String statusLabel, bool active, String? storeName, String meta, String receivedAt, String? promisedAt
});




}
/// @nodoc
class __$RepairDtoCopyWithImpl<$Res>
    implements _$RepairDtoCopyWith<$Res> {
  __$RepairDtoCopyWithImpl(this._self, this._then);

  final _RepairDto _self;
  final $Res Function(_RepairDto) _then;

/// Create a copy of RepairDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? device = null,Object? serial = freezed,Object? issue = null,Object? state = null,Object? statusLabel = null,Object? active = null,Object? storeName = freezed,Object? meta = null,Object? receivedAt = null,Object? promisedAt = freezed,}) {
  return _then(_RepairDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,serial: freezed == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String?,issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,storeName: freezed == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String?,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as String,promisedAt: freezed == promisedAt ? _self.promisedAt : promisedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
