// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stores_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoreDto {

 String get code; String get name; String? get address; String? get city; String? get phone; double? get latitude; double? get longitude;/// Set by the API when the call passed `lat`/`lng`.
 String? get distance; bool get openNow; String? get hoursToday; bool get pickup;
/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreDtoCopyWith<StoreDto> get copyWith => _$StoreDtoCopyWithImpl<StoreDto>(this as StoreDto, _$identity);

  /// Serializes this StoreDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StoreDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDto&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.distance, _this.distance) || other.distance == _this.distance)&&(identical(other.openNow, _this.openNow) || other.openNow == _this.openNow)&&(identical(other.hoursToday, _this.hoursToday) || other.hoursToday == _this.hoursToday)&&(identical(other.pickup, _this.pickup) || other.pickup == _this.pickup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StoreDto;
  return Object.hash(runtimeType,_this.code,_this.name,_this.address,_this.city,_this.phone,_this.latitude,_this.longitude,_this.distance,_this.openNow,_this.hoursToday,_this.pickup);
}

@override
String toString() {
  final _this = this as StoreDto;
  return 'StoreDto(code: ${_this.code}, name: ${_this.name}, address: ${_this.address}, city: ${_this.city}, phone: ${_this.phone}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, distance: ${_this.distance}, openNow: ${_this.openNow}, hoursToday: ${_this.hoursToday}, pickup: ${_this.pickup})';
}


}

/// @nodoc
abstract mixin class $StoreDtoCopyWith<$Res>  {
  factory $StoreDtoCopyWith(StoreDto value, $Res Function(StoreDto) _then) = _$StoreDtoCopyWithImpl;
@useResult
$Res call({
 String code, String name, String? address, String? city, String? phone, double? latitude, double? longitude, String? distance, bool openNow, String? hoursToday, bool pickup
});




}
/// @nodoc
class _$StoreDtoCopyWithImpl<$Res>
    implements $StoreDtoCopyWith<$Res> {
  _$StoreDtoCopyWithImpl(this._self, this._then);

  final StoreDto _self;
  final $Res Function(StoreDto) _then;

/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? address = freezed,Object? city = freezed,Object? phone = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distance = freezed,Object? openNow = null,Object? hoursToday = freezed,Object? pickup = null,}) {
  return _then(StoreDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String?,openNow: null == openNow ? _self.openNow : openNow // ignore: cast_nullable_to_non_nullable
as bool,hoursToday: freezed == hoursToday ? _self.hoursToday : hoursToday // ignore: cast_nullable_to_non_nullable
as String?,pickup: null == pickup ? _self.pickup : pickup // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreDto].
extension StoreDtoPatterns on StoreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreDto value)  $default,){
final _that = this;
switch (_that) {
case _StoreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreDto value)?  $default,){
final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  String? address,  String? city,  String? phone,  double? latitude,  double? longitude,  String? distance,  bool openNow,  String? hoursToday,  bool pickup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
return $default(_that.code,_that.name,_that.address,_that.city,_that.phone,_that.latitude,_that.longitude,_that.distance,_that.openNow,_that.hoursToday,_that.pickup);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  String? address,  String? city,  String? phone,  double? latitude,  double? longitude,  String? distance,  bool openNow,  String? hoursToday,  bool pickup)  $default,) {final _that = this;
switch (_that) {
case _StoreDto():
return $default(_that.code,_that.name,_that.address,_that.city,_that.phone,_that.latitude,_that.longitude,_that.distance,_that.openNow,_that.hoursToday,_that.pickup);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  String? address,  String? city,  String? phone,  double? latitude,  double? longitude,  String? distance,  bool openNow,  String? hoursToday,  bool pickup)?  $default,) {final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
return $default(_that.code,_that.name,_that.address,_that.city,_that.phone,_that.latitude,_that.longitude,_that.distance,_that.openNow,_that.hoursToday,_that.pickup);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreDto implements StoreDto {
  const _StoreDto({required this.code, required this.name, this.address, this.city, this.phone, this.latitude, this.longitude, this.distance, required this.openNow, this.hoursToday, required this.pickup});
  factory _StoreDto.fromJson(Map<String, dynamic> json) => _$StoreDtoFromJson(json);

@override final  String code;
@override final  String name;
@override final  String? address;
@override final  String? city;
@override final  String? phone;
@override final  double? latitude;
@override final  double? longitude;
/// Set by the API when the call passed `lat`/`lng`.
@override final  String? distance;
@override final  bool openNow;
@override final  String? hoursToday;
@override final  bool pickup;

/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreDtoCopyWith<_StoreDto> get copyWith => __$StoreDtoCopyWithImpl<_StoreDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreDto&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.openNow, openNow) || other.openNow == openNow)&&(identical(other.hoursToday, hoursToday) || other.hoursToday == hoursToday)&&(identical(other.pickup, pickup) || other.pickup == pickup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,name,address,city,phone,latitude,longitude,distance,openNow,hoursToday,pickup);
}

@override
String toString() {
    return 'StoreDto(code: $code, name: $name, address: $address, city: $city, phone: $phone, latitude: $latitude, longitude: $longitude, distance: $distance, openNow: $openNow, hoursToday: $hoursToday, pickup: $pickup)';
}


}

/// @nodoc
abstract mixin class _$StoreDtoCopyWith<$Res> implements $StoreDtoCopyWith<$Res> {
  factory _$StoreDtoCopyWith(_StoreDto value, $Res Function(_StoreDto) _then) = __$StoreDtoCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, String? address, String? city, String? phone, double? latitude, double? longitude, String? distance, bool openNow, String? hoursToday, bool pickup
});




}
/// @nodoc
class __$StoreDtoCopyWithImpl<$Res>
    implements _$StoreDtoCopyWith<$Res> {
  __$StoreDtoCopyWithImpl(this._self, this._then);

  final _StoreDto _self;
  final $Res Function(_StoreDto) _then;

/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? address = freezed,Object? city = freezed,Object? phone = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distance = freezed,Object? openNow = null,Object? hoursToday = freezed,Object? pickup = null,}) {
  return _then(_StoreDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String?,openNow: null == openNow ? _self.openNow : openNow // ignore: cast_nullable_to_non_nullable
as bool,hoursToday: freezed == hoursToday ? _self.hoursToday : hoursToday // ignore: cast_nullable_to_non_nullable
as String?,pickup: null == pickup ? _self.pickup : pickup // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
