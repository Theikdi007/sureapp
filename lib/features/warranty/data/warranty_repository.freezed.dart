// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warranty_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarrantyPlanDto {

 String get id; String get source; String get planName; String get device; String? get serial; String? get endsOn; bool get active; String get expiryText; String? get policyUrl;
/// Create a copy of WarrantyPlanDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarrantyPlanDtoCopyWith<WarrantyPlanDto> get copyWith => _$WarrantyPlanDtoCopyWithImpl<WarrantyPlanDto>(this as WarrantyPlanDto, _$identity);

  /// Serializes this WarrantyPlanDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WarrantyPlanDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarrantyPlanDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.planName, _this.planName) || other.planName == _this.planName)&&(identical(other.device, _this.device) || other.device == _this.device)&&(identical(other.serial, _this.serial) || other.serial == _this.serial)&&(identical(other.endsOn, _this.endsOn) || other.endsOn == _this.endsOn)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.expiryText, _this.expiryText) || other.expiryText == _this.expiryText)&&(identical(other.policyUrl, _this.policyUrl) || other.policyUrl == _this.policyUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WarrantyPlanDto;
  return Object.hash(runtimeType,_this.id,_this.source,_this.planName,_this.device,_this.serial,_this.endsOn,_this.active,_this.expiryText,_this.policyUrl);
}

@override
String toString() {
  final _this = this as WarrantyPlanDto;
  return 'WarrantyPlanDto(id: ${_this.id}, source: ${_this.source}, planName: ${_this.planName}, device: ${_this.device}, serial: ${_this.serial}, endsOn: ${_this.endsOn}, active: ${_this.active}, expiryText: ${_this.expiryText}, policyUrl: ${_this.policyUrl})';
}


}

/// @nodoc
abstract mixin class $WarrantyPlanDtoCopyWith<$Res>  {
  factory $WarrantyPlanDtoCopyWith(WarrantyPlanDto value, $Res Function(WarrantyPlanDto) _then) = _$WarrantyPlanDtoCopyWithImpl;
@useResult
$Res call({
 String id, String source, String planName, String device, String? serial, String? endsOn, bool active, String expiryText, String? policyUrl
});




}
/// @nodoc
class _$WarrantyPlanDtoCopyWithImpl<$Res>
    implements $WarrantyPlanDtoCopyWith<$Res> {
  _$WarrantyPlanDtoCopyWithImpl(this._self, this._then);

  final WarrantyPlanDto _self;
  final $Res Function(WarrantyPlanDto) _then;

/// Create a copy of WarrantyPlanDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? source = null,Object? planName = null,Object? device = null,Object? serial = freezed,Object? endsOn = freezed,Object? active = null,Object? expiryText = null,Object? policyUrl = freezed,}) {
  return _then(WarrantyPlanDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,serial: freezed == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String?,endsOn: freezed == endsOn ? _self.endsOn : endsOn // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,expiryText: null == expiryText ? _self.expiryText : expiryText // ignore: cast_nullable_to_non_nullable
as String,policyUrl: freezed == policyUrl ? _self.policyUrl : policyUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WarrantyPlanDto].
extension WarrantyPlanDtoPatterns on WarrantyPlanDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarrantyPlanDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarrantyPlanDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarrantyPlanDto value)  $default,){
final _that = this;
switch (_that) {
case _WarrantyPlanDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarrantyPlanDto value)?  $default,){
final _that = this;
switch (_that) {
case _WarrantyPlanDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String source,  String planName,  String device,  String? serial,  String? endsOn,  bool active,  String expiryText,  String? policyUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarrantyPlanDto() when $default != null:
return $default(_that.id,_that.source,_that.planName,_that.device,_that.serial,_that.endsOn,_that.active,_that.expiryText,_that.policyUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String source,  String planName,  String device,  String? serial,  String? endsOn,  bool active,  String expiryText,  String? policyUrl)  $default,) {final _that = this;
switch (_that) {
case _WarrantyPlanDto():
return $default(_that.id,_that.source,_that.planName,_that.device,_that.serial,_that.endsOn,_that.active,_that.expiryText,_that.policyUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String source,  String planName,  String device,  String? serial,  String? endsOn,  bool active,  String expiryText,  String? policyUrl)?  $default,) {final _that = this;
switch (_that) {
case _WarrantyPlanDto() when $default != null:
return $default(_that.id,_that.source,_that.planName,_that.device,_that.serial,_that.endsOn,_that.active,_that.expiryText,_that.policyUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarrantyPlanDto implements WarrantyPlanDto {
  const _WarrantyPlanDto({required this.id, required this.source, required this.planName, required this.device, this.serial, this.endsOn, required this.active, required this.expiryText, this.policyUrl});
  factory _WarrantyPlanDto.fromJson(Map<String, dynamic> json) => _$WarrantyPlanDtoFromJson(json);

@override final  String id;
@override final  String source;
@override final  String planName;
@override final  String device;
@override final  String? serial;
@override final  String? endsOn;
@override final  bool active;
@override final  String expiryText;
@override final  String? policyUrl;

/// Create a copy of WarrantyPlanDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarrantyPlanDtoCopyWith<_WarrantyPlanDto> get copyWith => __$WarrantyPlanDtoCopyWithImpl<_WarrantyPlanDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarrantyPlanDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarrantyPlanDto&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.device, device) || other.device == device)&&(identical(other.serial, serial) || other.serial == serial)&&(identical(other.endsOn, endsOn) || other.endsOn == endsOn)&&(identical(other.active, active) || other.active == active)&&(identical(other.expiryText, expiryText) || other.expiryText == expiryText)&&(identical(other.policyUrl, policyUrl) || other.policyUrl == policyUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,source,planName,device,serial,endsOn,active,expiryText,policyUrl);
}

@override
String toString() {
    return 'WarrantyPlanDto(id: $id, source: $source, planName: $planName, device: $device, serial: $serial, endsOn: $endsOn, active: $active, expiryText: $expiryText, policyUrl: $policyUrl)';
}


}

/// @nodoc
abstract mixin class _$WarrantyPlanDtoCopyWith<$Res> implements $WarrantyPlanDtoCopyWith<$Res> {
  factory _$WarrantyPlanDtoCopyWith(_WarrantyPlanDto value, $Res Function(_WarrantyPlanDto) _then) = __$WarrantyPlanDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String source, String planName, String device, String? serial, String? endsOn, bool active, String expiryText, String? policyUrl
});




}
/// @nodoc
class __$WarrantyPlanDtoCopyWithImpl<$Res>
    implements _$WarrantyPlanDtoCopyWith<$Res> {
  __$WarrantyPlanDtoCopyWithImpl(this._self, this._then);

  final _WarrantyPlanDto _self;
  final $Res Function(_WarrantyPlanDto) _then;

/// Create a copy of WarrantyPlanDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? source = null,Object? planName = null,Object? device = null,Object? serial = freezed,Object? endsOn = freezed,Object? active = null,Object? expiryText = null,Object? policyUrl = freezed,}) {
  return _then(_WarrantyPlanDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,serial: freezed == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String?,endsOn: freezed == endsOn ? _self.endsOn : endsOn // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,expiryText: null == expiryText ? _self.expiryText : expiryText // ignore: cast_nullable_to_non_nullable
as String,policyUrl: freezed == policyUrl ? _self.policyUrl : policyUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WarrantyCoverDto {

 String get name; String? get description; String? get policy; String? get endsOn;
/// Create a copy of WarrantyCoverDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarrantyCoverDtoCopyWith<WarrantyCoverDto> get copyWith => _$WarrantyCoverDtoCopyWithImpl<WarrantyCoverDto>(this as WarrantyCoverDto, _$identity);

  /// Serializes this WarrantyCoverDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WarrantyCoverDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarrantyCoverDto&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.policy, _this.policy) || other.policy == _this.policy)&&(identical(other.endsOn, _this.endsOn) || other.endsOn == _this.endsOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WarrantyCoverDto;
  return Object.hash(runtimeType,_this.name,_this.description,_this.policy,_this.endsOn);
}

@override
String toString() {
  final _this = this as WarrantyCoverDto;
  return 'WarrantyCoverDto(name: ${_this.name}, description: ${_this.description}, policy: ${_this.policy}, endsOn: ${_this.endsOn})';
}


}

/// @nodoc
abstract mixin class $WarrantyCoverDtoCopyWith<$Res>  {
  factory $WarrantyCoverDtoCopyWith(WarrantyCoverDto value, $Res Function(WarrantyCoverDto) _then) = _$WarrantyCoverDtoCopyWithImpl;
@useResult
$Res call({
 String name, String? description, String? policy, String? endsOn
});




}
/// @nodoc
class _$WarrantyCoverDtoCopyWithImpl<$Res>
    implements $WarrantyCoverDtoCopyWith<$Res> {
  _$WarrantyCoverDtoCopyWithImpl(this._self, this._then);

  final WarrantyCoverDto _self;
  final $Res Function(WarrantyCoverDto) _then;

/// Create a copy of WarrantyCoverDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? policy = freezed,Object? endsOn = freezed,}) {
  return _then(WarrantyCoverDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,policy: freezed == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as String?,endsOn: freezed == endsOn ? _self.endsOn : endsOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WarrantyCoverDto].
extension WarrantyCoverDtoPatterns on WarrantyCoverDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarrantyCoverDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarrantyCoverDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarrantyCoverDto value)  $default,){
final _that = this;
switch (_that) {
case _WarrantyCoverDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarrantyCoverDto value)?  $default,){
final _that = this;
switch (_that) {
case _WarrantyCoverDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description,  String? policy,  String? endsOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarrantyCoverDto() when $default != null:
return $default(_that.name,_that.description,_that.policy,_that.endsOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description,  String? policy,  String? endsOn)  $default,) {final _that = this;
switch (_that) {
case _WarrantyCoverDto():
return $default(_that.name,_that.description,_that.policy,_that.endsOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description,  String? policy,  String? endsOn)?  $default,) {final _that = this;
switch (_that) {
case _WarrantyCoverDto() when $default != null:
return $default(_that.name,_that.description,_that.policy,_that.endsOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarrantyCoverDto implements WarrantyCoverDto {
  const _WarrantyCoverDto({required this.name, this.description, this.policy, this.endsOn});
  factory _WarrantyCoverDto.fromJson(Map<String, dynamic> json) => _$WarrantyCoverDtoFromJson(json);

@override final  String name;
@override final  String? description;
@override final  String? policy;
@override final  String? endsOn;

/// Create a copy of WarrantyCoverDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarrantyCoverDtoCopyWith<_WarrantyCoverDto> get copyWith => __$WarrantyCoverDtoCopyWithImpl<_WarrantyCoverDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarrantyCoverDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarrantyCoverDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.policy, policy) || other.policy == policy)&&(identical(other.endsOn, endsOn) || other.endsOn == endsOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,description,policy,endsOn);
}

@override
String toString() {
    return 'WarrantyCoverDto(name: $name, description: $description, policy: $policy, endsOn: $endsOn)';
}


}

/// @nodoc
abstract mixin class _$WarrantyCoverDtoCopyWith<$Res> implements $WarrantyCoverDtoCopyWith<$Res> {
  factory _$WarrantyCoverDtoCopyWith(_WarrantyCoverDto value, $Res Function(_WarrantyCoverDto) _then) = __$WarrantyCoverDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, String? policy, String? endsOn
});




}
/// @nodoc
class __$WarrantyCoverDtoCopyWithImpl<$Res>
    implements _$WarrantyCoverDtoCopyWith<$Res> {
  __$WarrantyCoverDtoCopyWithImpl(this._self, this._then);

  final _WarrantyCoverDto _self;
  final $Res Function(_WarrantyCoverDto) _then;

/// Create a copy of WarrantyCoverDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? policy = freezed,Object? endsOn = freezed,}) {
  return _then(_WarrantyCoverDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,policy: freezed == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as String?,endsOn: freezed == endsOn ? _self.endsOn : endsOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WarrantyPlanDetailDto {

 WarrantyPlanDto get plan; String? get variant; List<WarrantyCoverDto> get covers;
/// Create a copy of WarrantyPlanDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarrantyPlanDetailDtoCopyWith<WarrantyPlanDetailDto> get copyWith => _$WarrantyPlanDetailDtoCopyWithImpl<WarrantyPlanDetailDto>(this as WarrantyPlanDetailDto, _$identity);

  /// Serializes this WarrantyPlanDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WarrantyPlanDetailDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarrantyPlanDetailDto&&(identical(other.plan, _this.plan) || other.plan == _this.plan)&&(identical(other.variant, _this.variant) || other.variant == _this.variant)&&const DeepCollectionEquality().equals(other.covers, _this.covers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WarrantyPlanDetailDto;
  return Object.hash(runtimeType,_this.plan,_this.variant,const DeepCollectionEquality().hash(_this.covers));
}

@override
String toString() {
  final _this = this as WarrantyPlanDetailDto;
  return 'WarrantyPlanDetailDto(plan: ${_this.plan}, variant: ${_this.variant}, covers: ${_this.covers})';
}


}

/// @nodoc
abstract mixin class $WarrantyPlanDetailDtoCopyWith<$Res>  {
  factory $WarrantyPlanDetailDtoCopyWith(WarrantyPlanDetailDto value, $Res Function(WarrantyPlanDetailDto) _then) = _$WarrantyPlanDetailDtoCopyWithImpl;
@useResult
$Res call({
 WarrantyPlanDto plan, String? variant, List<WarrantyCoverDto> covers
});


$WarrantyPlanDtoCopyWith<$Res> get plan;

}
/// @nodoc
class _$WarrantyPlanDetailDtoCopyWithImpl<$Res>
    implements $WarrantyPlanDetailDtoCopyWith<$Res> {
  _$WarrantyPlanDetailDtoCopyWithImpl(this._self, this._then);

  final WarrantyPlanDetailDto _self;
  final $Res Function(WarrantyPlanDetailDto) _then;

/// Create a copy of WarrantyPlanDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plan = null,Object? variant = freezed,Object? covers = null,}) {
  return _then(WarrantyPlanDetailDto(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as WarrantyPlanDto,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,covers: null == covers ? _self.covers : covers // ignore: cast_nullable_to_non_nullable
as List<WarrantyCoverDto>,
  ));
}
/// Create a copy of WarrantyPlanDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarrantyPlanDtoCopyWith<$Res> get plan {
  
  return $WarrantyPlanDtoCopyWith<$Res>(_self.plan, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarrantyPlanDetailDto].
extension WarrantyPlanDetailDtoPatterns on WarrantyPlanDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarrantyPlanDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarrantyPlanDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarrantyPlanDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _WarrantyPlanDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarrantyPlanDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _WarrantyPlanDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WarrantyPlanDto plan,  String? variant,  List<WarrantyCoverDto> covers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarrantyPlanDetailDto() when $default != null:
return $default(_that.plan,_that.variant,_that.covers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WarrantyPlanDto plan,  String? variant,  List<WarrantyCoverDto> covers)  $default,) {final _that = this;
switch (_that) {
case _WarrantyPlanDetailDto():
return $default(_that.plan,_that.variant,_that.covers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WarrantyPlanDto plan,  String? variant,  List<WarrantyCoverDto> covers)?  $default,) {final _that = this;
switch (_that) {
case _WarrantyPlanDetailDto() when $default != null:
return $default(_that.plan,_that.variant,_that.covers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarrantyPlanDetailDto implements WarrantyPlanDetailDto {
  const _WarrantyPlanDetailDto({required this.plan, this.variant,  List<WarrantyCoverDto> covers = const []}): _covers = covers;
  factory _WarrantyPlanDetailDto.fromJson(Map<String, dynamic> json) => _$WarrantyPlanDetailDtoFromJson(json);

@override final  WarrantyPlanDto plan;
@override final  String? variant;
 final  List<WarrantyCoverDto> _covers;
@override@JsonKey() List<WarrantyCoverDto> get covers {
  if (_covers is EqualUnmodifiableListView) return _covers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_covers);
}


/// Create a copy of WarrantyPlanDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarrantyPlanDetailDtoCopyWith<_WarrantyPlanDetailDto> get copyWith => __$WarrantyPlanDetailDtoCopyWithImpl<_WarrantyPlanDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarrantyPlanDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarrantyPlanDetailDto&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.variant, variant) || other.variant == variant)&&const DeepCollectionEquality().equals(other.covers, _covers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,plan,variant,const DeepCollectionEquality().hash(_covers));
}

@override
String toString() {
    return 'WarrantyPlanDetailDto(plan: $plan, variant: $variant, covers: $covers)';
}


}

/// @nodoc
abstract mixin class _$WarrantyPlanDetailDtoCopyWith<$Res> implements $WarrantyPlanDetailDtoCopyWith<$Res> {
  factory _$WarrantyPlanDetailDtoCopyWith(_WarrantyPlanDetailDto value, $Res Function(_WarrantyPlanDetailDto) _then) = __$WarrantyPlanDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 WarrantyPlanDto plan, String? variant, List<WarrantyCoverDto> covers
});


@override $WarrantyPlanDtoCopyWith<$Res> get plan;

}
/// @nodoc
class __$WarrantyPlanDetailDtoCopyWithImpl<$Res>
    implements _$WarrantyPlanDetailDtoCopyWith<$Res> {
  __$WarrantyPlanDetailDtoCopyWithImpl(this._self, this._then);

  final _WarrantyPlanDetailDto _self;
  final $Res Function(_WarrantyPlanDetailDto) _then;

/// Create a copy of WarrantyPlanDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plan = null,Object? variant = freezed,Object? covers = null,}) {
  return _then(_WarrantyPlanDetailDto(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as WarrantyPlanDto,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,covers: null == covers ? _self._covers : covers // ignore: cast_nullable_to_non_nullable
as List<WarrantyCoverDto>,
  ));
}

/// Create a copy of WarrantyPlanDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarrantyPlanDtoCopyWith<$Res> get plan {
  
  return $WarrantyPlanDtoCopyWith<$Res>(_self.plan, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// @nodoc
mixin _$WarrantyClaimDto {

 String get number; String get planId; String get planName; String get device; String get description; String get status; String get statusLabel; String get filedAt; String get meta;/// Set when the claim has a photo; load it with
/// [WarrantyRepository.claimPhoto] (it needs the bearer token).
 String? get photoUrl; String? get staffNote;
/// Create a copy of WarrantyClaimDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarrantyClaimDtoCopyWith<WarrantyClaimDto> get copyWith => _$WarrantyClaimDtoCopyWithImpl<WarrantyClaimDto>(this as WarrantyClaimDto, _$identity);

  /// Serializes this WarrantyClaimDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WarrantyClaimDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarrantyClaimDto&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.planId, _this.planId) || other.planId == _this.planId)&&(identical(other.planName, _this.planName) || other.planName == _this.planName)&&(identical(other.device, _this.device) || other.device == _this.device)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.filedAt, _this.filedAt) || other.filedAt == _this.filedAt)&&(identical(other.meta, _this.meta) || other.meta == _this.meta)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.staffNote, _this.staffNote) || other.staffNote == _this.staffNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WarrantyClaimDto;
  return Object.hash(runtimeType,_this.number,_this.planId,_this.planName,_this.device,_this.description,_this.status,_this.statusLabel,_this.filedAt,_this.meta,_this.photoUrl,_this.staffNote);
}

@override
String toString() {
  final _this = this as WarrantyClaimDto;
  return 'WarrantyClaimDto(number: ${_this.number}, planId: ${_this.planId}, planName: ${_this.planName}, device: ${_this.device}, description: ${_this.description}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, filedAt: ${_this.filedAt}, meta: ${_this.meta}, photoUrl: ${_this.photoUrl}, staffNote: ${_this.staffNote})';
}


}

/// @nodoc
abstract mixin class $WarrantyClaimDtoCopyWith<$Res>  {
  factory $WarrantyClaimDtoCopyWith(WarrantyClaimDto value, $Res Function(WarrantyClaimDto) _then) = _$WarrantyClaimDtoCopyWithImpl;
@useResult
$Res call({
 String number, String planId, String planName, String device, String description, String status, String statusLabel, String filedAt, String meta, String? photoUrl, String? staffNote
});




}
/// @nodoc
class _$WarrantyClaimDtoCopyWithImpl<$Res>
    implements $WarrantyClaimDtoCopyWith<$Res> {
  _$WarrantyClaimDtoCopyWithImpl(this._self, this._then);

  final WarrantyClaimDto _self;
  final $Res Function(WarrantyClaimDto) _then;

/// Create a copy of WarrantyClaimDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? planId = null,Object? planName = null,Object? device = null,Object? description = null,Object? status = null,Object? statusLabel = null,Object? filedAt = null,Object? meta = null,Object? photoUrl = freezed,Object? staffNote = freezed,}) {
  return _then(WarrantyClaimDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,filedAt: null == filedAt ? _self.filedAt : filedAt // ignore: cast_nullable_to_non_nullable
as String,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,staffNote: freezed == staffNote ? _self.staffNote : staffNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WarrantyClaimDto].
extension WarrantyClaimDtoPatterns on WarrantyClaimDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarrantyClaimDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarrantyClaimDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarrantyClaimDto value)  $default,){
final _that = this;
switch (_that) {
case _WarrantyClaimDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarrantyClaimDto value)?  $default,){
final _that = this;
switch (_that) {
case _WarrantyClaimDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  String planId,  String planName,  String device,  String description,  String status,  String statusLabel,  String filedAt,  String meta,  String? photoUrl,  String? staffNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarrantyClaimDto() when $default != null:
return $default(_that.number,_that.planId,_that.planName,_that.device,_that.description,_that.status,_that.statusLabel,_that.filedAt,_that.meta,_that.photoUrl,_that.staffNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  String planId,  String planName,  String device,  String description,  String status,  String statusLabel,  String filedAt,  String meta,  String? photoUrl,  String? staffNote)  $default,) {final _that = this;
switch (_that) {
case _WarrantyClaimDto():
return $default(_that.number,_that.planId,_that.planName,_that.device,_that.description,_that.status,_that.statusLabel,_that.filedAt,_that.meta,_that.photoUrl,_that.staffNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  String planId,  String planName,  String device,  String description,  String status,  String statusLabel,  String filedAt,  String meta,  String? photoUrl,  String? staffNote)?  $default,) {final _that = this;
switch (_that) {
case _WarrantyClaimDto() when $default != null:
return $default(_that.number,_that.planId,_that.planName,_that.device,_that.description,_that.status,_that.statusLabel,_that.filedAt,_that.meta,_that.photoUrl,_that.staffNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarrantyClaimDto implements WarrantyClaimDto {
  const _WarrantyClaimDto({required this.number, required this.planId, required this.planName, required this.device, required this.description, required this.status, required this.statusLabel, required this.filedAt, required this.meta, this.photoUrl, this.staffNote});
  factory _WarrantyClaimDto.fromJson(Map<String, dynamic> json) => _$WarrantyClaimDtoFromJson(json);

@override final  String number;
@override final  String planId;
@override final  String planName;
@override final  String device;
@override final  String description;
@override final  String status;
@override final  String statusLabel;
@override final  String filedAt;
@override final  String meta;
/// Set when the claim has a photo; load it with
/// [WarrantyRepository.claimPhoto] (it needs the bearer token).
@override final  String? photoUrl;
@override final  String? staffNote;

/// Create a copy of WarrantyClaimDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarrantyClaimDtoCopyWith<_WarrantyClaimDto> get copyWith => __$WarrantyClaimDtoCopyWithImpl<_WarrantyClaimDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarrantyClaimDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarrantyClaimDto&&(identical(other.number, number) || other.number == number)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.device, device) || other.device == device)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.filedAt, filedAt) || other.filedAt == filedAt)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.staffNote, staffNote) || other.staffNote == staffNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,planId,planName,device,description,status,statusLabel,filedAt,meta,photoUrl,staffNote);
}

@override
String toString() {
    return 'WarrantyClaimDto(number: $number, planId: $planId, planName: $planName, device: $device, description: $description, status: $status, statusLabel: $statusLabel, filedAt: $filedAt, meta: $meta, photoUrl: $photoUrl, staffNote: $staffNote)';
}


}

/// @nodoc
abstract mixin class _$WarrantyClaimDtoCopyWith<$Res> implements $WarrantyClaimDtoCopyWith<$Res> {
  factory _$WarrantyClaimDtoCopyWith(_WarrantyClaimDto value, $Res Function(_WarrantyClaimDto) _then) = __$WarrantyClaimDtoCopyWithImpl;
@override @useResult
$Res call({
 String number, String planId, String planName, String device, String description, String status, String statusLabel, String filedAt, String meta, String? photoUrl, String? staffNote
});




}
/// @nodoc
class __$WarrantyClaimDtoCopyWithImpl<$Res>
    implements _$WarrantyClaimDtoCopyWith<$Res> {
  __$WarrantyClaimDtoCopyWithImpl(this._self, this._then);

  final _WarrantyClaimDto _self;
  final $Res Function(_WarrantyClaimDto) _then;

/// Create a copy of WarrantyClaimDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? planId = null,Object? planName = null,Object? device = null,Object? description = null,Object? status = null,Object? statusLabel = null,Object? filedAt = null,Object? meta = null,Object? photoUrl = freezed,Object? staffNote = freezed,}) {
  return _then(_WarrantyClaimDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,filedAt: null == filedAt ? _self.filedAt : filedAt // ignore: cast_nullable_to_non_nullable
as String,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,staffNote: freezed == staffNote ? _self.staffNote : staffNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
