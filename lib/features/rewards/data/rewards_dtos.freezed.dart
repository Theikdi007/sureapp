// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rewards_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RewardCardDto {

 String get id; String get title; String? get partner; String? get benefit; int get cost; String? get imageUrl; String? get validUntil; int? get stockLeft; bool get featured; bool get birthday; String get state; List<String> get methods; String get kind;
/// Create a copy of RewardCardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardCardDtoCopyWith<RewardCardDto> get copyWith => _$RewardCardDtoCopyWithImpl<RewardCardDto>(this as RewardCardDto, _$identity);

  /// Serializes this RewardCardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RewardCardDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardCardDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.partner, _this.partner) || other.partner == _this.partner)&&(identical(other.benefit, _this.benefit) || other.benefit == _this.benefit)&&(identical(other.cost, _this.cost) || other.cost == _this.cost)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.validUntil, _this.validUntil) || other.validUntil == _this.validUntil)&&(identical(other.stockLeft, _this.stockLeft) || other.stockLeft == _this.stockLeft)&&(identical(other.featured, _this.featured) || other.featured == _this.featured)&&(identical(other.birthday, _this.birthday) || other.birthday == _this.birthday)&&(identical(other.state, _this.state) || other.state == _this.state)&&const DeepCollectionEquality().equals(other.methods, _this.methods)&&(identical(other.kind, _this.kind) || other.kind == _this.kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RewardCardDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.partner,_this.benefit,_this.cost,_this.imageUrl,_this.validUntil,_this.stockLeft,_this.featured,_this.birthday,_this.state,const DeepCollectionEquality().hash(_this.methods),_this.kind);
}

@override
String toString() {
  final _this = this as RewardCardDto;
  return 'RewardCardDto(id: ${_this.id}, title: ${_this.title}, partner: ${_this.partner}, benefit: ${_this.benefit}, cost: ${_this.cost}, imageUrl: ${_this.imageUrl}, validUntil: ${_this.validUntil}, stockLeft: ${_this.stockLeft}, featured: ${_this.featured}, birthday: ${_this.birthday}, state: ${_this.state}, methods: ${_this.methods}, kind: ${_this.kind})';
}


}

/// @nodoc
abstract mixin class $RewardCardDtoCopyWith<$Res>  {
  factory $RewardCardDtoCopyWith(RewardCardDto value, $Res Function(RewardCardDto) _then) = _$RewardCardDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? partner, String? benefit, int cost, String? imageUrl, String? validUntil, int? stockLeft, bool featured, bool birthday, String state, List<String> methods, String kind
});




}
/// @nodoc
class _$RewardCardDtoCopyWithImpl<$Res>
    implements $RewardCardDtoCopyWith<$Res> {
  _$RewardCardDtoCopyWithImpl(this._self, this._then);

  final RewardCardDto _self;
  final $Res Function(RewardCardDto) _then;

/// Create a copy of RewardCardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? partner = freezed,Object? benefit = freezed,Object? cost = null,Object? imageUrl = freezed,Object? validUntil = freezed,Object? stockLeft = freezed,Object? featured = null,Object? birthday = null,Object? state = null,Object? methods = null,Object? kind = null,}) {
  return _then(RewardCardDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as String?,benefit: freezed == benefit ? _self.benefit : benefit // ignore: cast_nullable_to_non_nullable
as String?,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,stockLeft: freezed == stockLeft ? _self.stockLeft : stockLeft // ignore: cast_nullable_to_non_nullable
as int?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,birthday: null == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as bool,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,methods: null == methods ? _self.methods : methods // ignore: cast_nullable_to_non_nullable
as List<String>,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RewardCardDto].
extension RewardCardDtoPatterns on RewardCardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardCardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardCardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardCardDto value)  $default,){
final _that = this;
switch (_that) {
case _RewardCardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardCardDto value)?  $default,){
final _that = this;
switch (_that) {
case _RewardCardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? partner,  String? benefit,  int cost,  String? imageUrl,  String? validUntil,  int? stockLeft,  bool featured,  bool birthday,  String state,  List<String> methods,  String kind)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardCardDto() when $default != null:
return $default(_that.id,_that.title,_that.partner,_that.benefit,_that.cost,_that.imageUrl,_that.validUntil,_that.stockLeft,_that.featured,_that.birthday,_that.state,_that.methods,_that.kind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? partner,  String? benefit,  int cost,  String? imageUrl,  String? validUntil,  int? stockLeft,  bool featured,  bool birthday,  String state,  List<String> methods,  String kind)  $default,) {final _that = this;
switch (_that) {
case _RewardCardDto():
return $default(_that.id,_that.title,_that.partner,_that.benefit,_that.cost,_that.imageUrl,_that.validUntil,_that.stockLeft,_that.featured,_that.birthday,_that.state,_that.methods,_that.kind);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? partner,  String? benefit,  int cost,  String? imageUrl,  String? validUntil,  int? stockLeft,  bool featured,  bool birthday,  String state,  List<String> methods,  String kind)?  $default,) {final _that = this;
switch (_that) {
case _RewardCardDto() when $default != null:
return $default(_that.id,_that.title,_that.partner,_that.benefit,_that.cost,_that.imageUrl,_that.validUntil,_that.stockLeft,_that.featured,_that.birthday,_that.state,_that.methods,_that.kind);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RewardCardDto extends RewardCardDto {
  const _RewardCardDto({required this.id, required this.title, this.partner, this.benefit, required this.cost, this.imageUrl, this.validUntil, this.stockLeft, this.featured = false, this.birthday = false, this.state = 'available',  List<String> methods = const [], this.kind = 'coupon'}): _methods = methods,super._();
  factory _RewardCardDto.fromJson(Map<String, dynamic> json) => _$RewardCardDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? partner;
@override final  String? benefit;
@override final  int cost;
@override final  String? imageUrl;
@override final  String? validUntil;
@override final  int? stockLeft;
@override@JsonKey() final  bool featured;
@override@JsonKey() final  bool birthday;
@override@JsonKey() final  String state;
 final  List<String> _methods;
@override@JsonKey() List<String> get methods {
  if (_methods is EqualUnmodifiableListView) return _methods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_methods);
}

@override@JsonKey() final  String kind;

/// Create a copy of RewardCardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardCardDtoCopyWith<_RewardCardDto> get copyWith => __$RewardCardDtoCopyWithImpl<_RewardCardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardCardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardCardDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.partner, partner) || other.partner == partner)&&(identical(other.benefit, benefit) || other.benefit == benefit)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.stockLeft, stockLeft) || other.stockLeft == stockLeft)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.state, state) || other.state == state)&&const DeepCollectionEquality().equals(other.methods, _methods)&&(identical(other.kind, kind) || other.kind == kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,partner,benefit,cost,imageUrl,validUntil,stockLeft,featured,birthday,state,const DeepCollectionEquality().hash(_methods),kind);
}

@override
String toString() {
    return 'RewardCardDto(id: $id, title: $title, partner: $partner, benefit: $benefit, cost: $cost, imageUrl: $imageUrl, validUntil: $validUntil, stockLeft: $stockLeft, featured: $featured, birthday: $birthday, state: $state, methods: $methods, kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$RewardCardDtoCopyWith<$Res> implements $RewardCardDtoCopyWith<$Res> {
  factory _$RewardCardDtoCopyWith(_RewardCardDto value, $Res Function(_RewardCardDto) _then) = __$RewardCardDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? partner, String? benefit, int cost, String? imageUrl, String? validUntil, int? stockLeft, bool featured, bool birthday, String state, List<String> methods, String kind
});




}
/// @nodoc
class __$RewardCardDtoCopyWithImpl<$Res>
    implements _$RewardCardDtoCopyWith<$Res> {
  __$RewardCardDtoCopyWithImpl(this._self, this._then);

  final _RewardCardDto _self;
  final $Res Function(_RewardCardDto) _then;

/// Create a copy of RewardCardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? partner = freezed,Object? benefit = freezed,Object? cost = null,Object? imageUrl = freezed,Object? validUntil = freezed,Object? stockLeft = freezed,Object? featured = null,Object? birthday = null,Object? state = null,Object? methods = null,Object? kind = null,}) {
  return _then(_RewardCardDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as String?,benefit: freezed == benefit ? _self.benefit : benefit // ignore: cast_nullable_to_non_nullable
as String?,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,stockLeft: freezed == stockLeft ? _self.stockLeft : stockLeft // ignore: cast_nullable_to_non_nullable
as int?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,birthday: null == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as bool,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,methods: null == methods ? _self._methods : methods // ignore: cast_nullable_to_non_nullable
as List<String>,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RewardSectionDto {

 String get key; String get title; List<RewardCardDto> get items;
/// Create a copy of RewardSectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardSectionDtoCopyWith<RewardSectionDto> get copyWith => _$RewardSectionDtoCopyWithImpl<RewardSectionDto>(this as RewardSectionDto, _$identity);

  /// Serializes this RewardSectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RewardSectionDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardSectionDto&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RewardSectionDto;
  return Object.hash(runtimeType,_this.key,_this.title,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as RewardSectionDto;
  return 'RewardSectionDto(key: ${_this.key}, title: ${_this.title}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $RewardSectionDtoCopyWith<$Res>  {
  factory $RewardSectionDtoCopyWith(RewardSectionDto value, $Res Function(RewardSectionDto) _then) = _$RewardSectionDtoCopyWithImpl;
@useResult
$Res call({
 String key, String title, List<RewardCardDto> items
});




}
/// @nodoc
class _$RewardSectionDtoCopyWithImpl<$Res>
    implements $RewardSectionDtoCopyWith<$Res> {
  _$RewardSectionDtoCopyWithImpl(this._self, this._then);

  final RewardSectionDto _self;
  final $Res Function(RewardSectionDto) _then;

/// Create a copy of RewardSectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? title = null,Object? items = null,}) {
  return _then(RewardSectionDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RewardCardDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [RewardSectionDto].
extension RewardSectionDtoPatterns on RewardSectionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardSectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardSectionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardSectionDto value)  $default,){
final _that = this;
switch (_that) {
case _RewardSectionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardSectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _RewardSectionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String title,  List<RewardCardDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardSectionDto() when $default != null:
return $default(_that.key,_that.title,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String title,  List<RewardCardDto> items)  $default,) {final _that = this;
switch (_that) {
case _RewardSectionDto():
return $default(_that.key,_that.title,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String title,  List<RewardCardDto> items)?  $default,) {final _that = this;
switch (_that) {
case _RewardSectionDto() when $default != null:
return $default(_that.key,_that.title,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RewardSectionDto implements RewardSectionDto {
  const _RewardSectionDto({required this.key, required this.title,  List<RewardCardDto> items = const []}): _items = items;
  factory _RewardSectionDto.fromJson(Map<String, dynamic> json) => _$RewardSectionDtoFromJson(json);

@override final  String key;
@override final  String title;
 final  List<RewardCardDto> _items;
@override@JsonKey() List<RewardCardDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of RewardSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardSectionDtoCopyWith<_RewardSectionDto> get copyWith => __$RewardSectionDtoCopyWithImpl<_RewardSectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardSectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardSectionDto&&(identical(other.key, key) || other.key == key)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,title,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'RewardSectionDto(key: $key, title: $title, items: $items)';
}


}

/// @nodoc
abstract mixin class _$RewardSectionDtoCopyWith<$Res> implements $RewardSectionDtoCopyWith<$Res> {
  factory _$RewardSectionDtoCopyWith(_RewardSectionDto value, $Res Function(_RewardSectionDto) _then) = __$RewardSectionDtoCopyWithImpl;
@override @useResult
$Res call({
 String key, String title, List<RewardCardDto> items
});




}
/// @nodoc
class __$RewardSectionDtoCopyWithImpl<$Res>
    implements _$RewardSectionDtoCopyWith<$Res> {
  __$RewardSectionDtoCopyWithImpl(this._self, this._then);

  final _RewardSectionDto _self;
  final $Res Function(_RewardSectionDto) _then;

/// Create a copy of RewardSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? title = null,Object? items = null,}) {
  return _then(_RewardSectionDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RewardCardDto>,
  ));
}


}


/// @nodoc
mixin _$RewardsHomeDto {

 int get points; int? get expiringPoints; String? get expiringOn; bool get birthdayToday; List<RewardCardDto> get featured; List<RewardSectionDto> get sections;
/// Create a copy of RewardsHomeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardsHomeDtoCopyWith<RewardsHomeDto> get copyWith => _$RewardsHomeDtoCopyWithImpl<RewardsHomeDto>(this as RewardsHomeDto, _$identity);

  /// Serializes this RewardsHomeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RewardsHomeDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardsHomeDto&&(identical(other.points, _this.points) || other.points == _this.points)&&(identical(other.expiringPoints, _this.expiringPoints) || other.expiringPoints == _this.expiringPoints)&&(identical(other.expiringOn, _this.expiringOn) || other.expiringOn == _this.expiringOn)&&(identical(other.birthdayToday, _this.birthdayToday) || other.birthdayToday == _this.birthdayToday)&&const DeepCollectionEquality().equals(other.featured, _this.featured)&&const DeepCollectionEquality().equals(other.sections, _this.sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RewardsHomeDto;
  return Object.hash(runtimeType,_this.points,_this.expiringPoints,_this.expiringOn,_this.birthdayToday,const DeepCollectionEquality().hash(_this.featured),const DeepCollectionEquality().hash(_this.sections));
}

@override
String toString() {
  final _this = this as RewardsHomeDto;
  return 'RewardsHomeDto(points: ${_this.points}, expiringPoints: ${_this.expiringPoints}, expiringOn: ${_this.expiringOn}, birthdayToday: ${_this.birthdayToday}, featured: ${_this.featured}, sections: ${_this.sections})';
}


}

/// @nodoc
abstract mixin class $RewardsHomeDtoCopyWith<$Res>  {
  factory $RewardsHomeDtoCopyWith(RewardsHomeDto value, $Res Function(RewardsHomeDto) _then) = _$RewardsHomeDtoCopyWithImpl;
@useResult
$Res call({
 int points, int? expiringPoints, String? expiringOn, bool birthdayToday, List<RewardCardDto> featured, List<RewardSectionDto> sections
});




}
/// @nodoc
class _$RewardsHomeDtoCopyWithImpl<$Res>
    implements $RewardsHomeDtoCopyWith<$Res> {
  _$RewardsHomeDtoCopyWithImpl(this._self, this._then);

  final RewardsHomeDto _self;
  final $Res Function(RewardsHomeDto) _then;

/// Create a copy of RewardsHomeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? expiringPoints = freezed,Object? expiringOn = freezed,Object? birthdayToday = null,Object? featured = null,Object? sections = null,}) {
  return _then(RewardsHomeDto(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,expiringPoints: freezed == expiringPoints ? _self.expiringPoints : expiringPoints // ignore: cast_nullable_to_non_nullable
as int?,expiringOn: freezed == expiringOn ? _self.expiringOn : expiringOn // ignore: cast_nullable_to_non_nullable
as String?,birthdayToday: null == birthdayToday ? _self.birthdayToday : birthdayToday // ignore: cast_nullable_to_non_nullable
as bool,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as List<RewardCardDto>,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<RewardSectionDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [RewardsHomeDto].
extension RewardsHomeDtoPatterns on RewardsHomeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardsHomeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardsHomeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardsHomeDto value)  $default,){
final _that = this;
switch (_that) {
case _RewardsHomeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardsHomeDto value)?  $default,){
final _that = this;
switch (_that) {
case _RewardsHomeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points,  int? expiringPoints,  String? expiringOn,  bool birthdayToday,  List<RewardCardDto> featured,  List<RewardSectionDto> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardsHomeDto() when $default != null:
return $default(_that.points,_that.expiringPoints,_that.expiringOn,_that.birthdayToday,_that.featured,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points,  int? expiringPoints,  String? expiringOn,  bool birthdayToday,  List<RewardCardDto> featured,  List<RewardSectionDto> sections)  $default,) {final _that = this;
switch (_that) {
case _RewardsHomeDto():
return $default(_that.points,_that.expiringPoints,_that.expiringOn,_that.birthdayToday,_that.featured,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points,  int? expiringPoints,  String? expiringOn,  bool birthdayToday,  List<RewardCardDto> featured,  List<RewardSectionDto> sections)?  $default,) {final _that = this;
switch (_that) {
case _RewardsHomeDto() when $default != null:
return $default(_that.points,_that.expiringPoints,_that.expiringOn,_that.birthdayToday,_that.featured,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RewardsHomeDto implements RewardsHomeDto {
  const _RewardsHomeDto({required this.points, this.expiringPoints, this.expiringOn, this.birthdayToday = false,  List<RewardCardDto> featured = const [],  List<RewardSectionDto> sections = const []}): _featured = featured,_sections = sections;
  factory _RewardsHomeDto.fromJson(Map<String, dynamic> json) => _$RewardsHomeDtoFromJson(json);

@override final  int points;
@override final  int? expiringPoints;
@override final  String? expiringOn;
@override@JsonKey() final  bool birthdayToday;
 final  List<RewardCardDto> _featured;
@override@JsonKey() List<RewardCardDto> get featured {
  if (_featured is EqualUnmodifiableListView) return _featured;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featured);
}

 final  List<RewardSectionDto> _sections;
@override@JsonKey() List<RewardSectionDto> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of RewardsHomeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardsHomeDtoCopyWith<_RewardsHomeDto> get copyWith => __$RewardsHomeDtoCopyWithImpl<_RewardsHomeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardsHomeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardsHomeDto&&(identical(other.points, points) || other.points == points)&&(identical(other.expiringPoints, expiringPoints) || other.expiringPoints == expiringPoints)&&(identical(other.expiringOn, expiringOn) || other.expiringOn == expiringOn)&&(identical(other.birthdayToday, birthdayToday) || other.birthdayToday == birthdayToday)&&const DeepCollectionEquality().equals(other.featured, _featured)&&const DeepCollectionEquality().equals(other.sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,points,expiringPoints,expiringOn,birthdayToday,const DeepCollectionEquality().hash(_featured),const DeepCollectionEquality().hash(_sections));
}

@override
String toString() {
    return 'RewardsHomeDto(points: $points, expiringPoints: $expiringPoints, expiringOn: $expiringOn, birthdayToday: $birthdayToday, featured: $featured, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$RewardsHomeDtoCopyWith<$Res> implements $RewardsHomeDtoCopyWith<$Res> {
  factory _$RewardsHomeDtoCopyWith(_RewardsHomeDto value, $Res Function(_RewardsHomeDto) _then) = __$RewardsHomeDtoCopyWithImpl;
@override @useResult
$Res call({
 int points, int? expiringPoints, String? expiringOn, bool birthdayToday, List<RewardCardDto> featured, List<RewardSectionDto> sections
});




}
/// @nodoc
class __$RewardsHomeDtoCopyWithImpl<$Res>
    implements _$RewardsHomeDtoCopyWith<$Res> {
  __$RewardsHomeDtoCopyWithImpl(this._self, this._then);

  final _RewardsHomeDto _self;
  final $Res Function(_RewardsHomeDto) _then;

/// Create a copy of RewardsHomeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? expiringPoints = freezed,Object? expiringOn = freezed,Object? birthdayToday = null,Object? featured = null,Object? sections = null,}) {
  return _then(_RewardsHomeDto(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,expiringPoints: freezed == expiringPoints ? _self.expiringPoints : expiringPoints // ignore: cast_nullable_to_non_nullable
as int?,expiringOn: freezed == expiringOn ? _self.expiringOn : expiringOn // ignore: cast_nullable_to_non_nullable
as String?,birthdayToday: null == birthdayToday ? _self.birthdayToday : birthdayToday // ignore: cast_nullable_to_non_nullable
as bool,featured: null == featured ? _self._featured : featured // ignore: cast_nullable_to_non_nullable
as List<RewardCardDto>,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<RewardSectionDto>,
  ));
}


}


/// @nodoc
mixin _$RewardDetailDto {

 RewardCardDto get card; String? get description; String? get terms; int get claimedCount; int? get availableCount; String? get supportPhone; List<String> get shops; String get ctaLabel; bool get ctaEnabled; String? get hint; int get shortBy;
/// Create a copy of RewardDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardDetailDtoCopyWith<RewardDetailDto> get copyWith => _$RewardDetailDtoCopyWithImpl<RewardDetailDto>(this as RewardDetailDto, _$identity);

  /// Serializes this RewardDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RewardDetailDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardDetailDto&&(identical(other.card, _this.card) || other.card == _this.card)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.terms, _this.terms) || other.terms == _this.terms)&&(identical(other.claimedCount, _this.claimedCount) || other.claimedCount == _this.claimedCount)&&(identical(other.availableCount, _this.availableCount) || other.availableCount == _this.availableCount)&&(identical(other.supportPhone, _this.supportPhone) || other.supportPhone == _this.supportPhone)&&const DeepCollectionEquality().equals(other.shops, _this.shops)&&(identical(other.ctaLabel, _this.ctaLabel) || other.ctaLabel == _this.ctaLabel)&&(identical(other.ctaEnabled, _this.ctaEnabled) || other.ctaEnabled == _this.ctaEnabled)&&(identical(other.hint, _this.hint) || other.hint == _this.hint)&&(identical(other.shortBy, _this.shortBy) || other.shortBy == _this.shortBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RewardDetailDto;
  return Object.hash(runtimeType,_this.card,_this.description,_this.terms,_this.claimedCount,_this.availableCount,_this.supportPhone,const DeepCollectionEquality().hash(_this.shops),_this.ctaLabel,_this.ctaEnabled,_this.hint,_this.shortBy);
}

@override
String toString() {
  final _this = this as RewardDetailDto;
  return 'RewardDetailDto(card: ${_this.card}, description: ${_this.description}, terms: ${_this.terms}, claimedCount: ${_this.claimedCount}, availableCount: ${_this.availableCount}, supportPhone: ${_this.supportPhone}, shops: ${_this.shops}, ctaLabel: ${_this.ctaLabel}, ctaEnabled: ${_this.ctaEnabled}, hint: ${_this.hint}, shortBy: ${_this.shortBy})';
}


}

/// @nodoc
abstract mixin class $RewardDetailDtoCopyWith<$Res>  {
  factory $RewardDetailDtoCopyWith(RewardDetailDto value, $Res Function(RewardDetailDto) _then) = _$RewardDetailDtoCopyWithImpl;
@useResult
$Res call({
 RewardCardDto card, String? description, String? terms, int claimedCount, int? availableCount, String? supportPhone, List<String> shops, String ctaLabel, bool ctaEnabled, String? hint, int shortBy
});


$RewardCardDtoCopyWith<$Res> get card;

}
/// @nodoc
class _$RewardDetailDtoCopyWithImpl<$Res>
    implements $RewardDetailDtoCopyWith<$Res> {
  _$RewardDetailDtoCopyWithImpl(this._self, this._then);

  final RewardDetailDto _self;
  final $Res Function(RewardDetailDto) _then;

/// Create a copy of RewardDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? card = null,Object? description = freezed,Object? terms = freezed,Object? claimedCount = null,Object? availableCount = freezed,Object? supportPhone = freezed,Object? shops = null,Object? ctaLabel = null,Object? ctaEnabled = null,Object? hint = freezed,Object? shortBy = null,}) {
  return _then(RewardDetailDto(
card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as RewardCardDto,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,terms: freezed == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as String?,claimedCount: null == claimedCount ? _self.claimedCount : claimedCount // ignore: cast_nullable_to_non_nullable
as int,availableCount: freezed == availableCount ? _self.availableCount : availableCount // ignore: cast_nullable_to_non_nullable
as int?,supportPhone: freezed == supportPhone ? _self.supportPhone : supportPhone // ignore: cast_nullable_to_non_nullable
as String?,shops: null == shops ? _self.shops : shops // ignore: cast_nullable_to_non_nullable
as List<String>,ctaLabel: null == ctaLabel ? _self.ctaLabel : ctaLabel // ignore: cast_nullable_to_non_nullable
as String,ctaEnabled: null == ctaEnabled ? _self.ctaEnabled : ctaEnabled // ignore: cast_nullable_to_non_nullable
as bool,hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,shortBy: null == shortBy ? _self.shortBy : shortBy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RewardDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RewardCardDtoCopyWith<$Res> get card {
  
  return $RewardCardDtoCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}


/// Adds pattern-matching-related methods to [RewardDetailDto].
extension RewardDetailDtoPatterns on RewardDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _RewardDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _RewardDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RewardCardDto card,  String? description,  String? terms,  int claimedCount,  int? availableCount,  String? supportPhone,  List<String> shops,  String ctaLabel,  bool ctaEnabled,  String? hint,  int shortBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardDetailDto() when $default != null:
return $default(_that.card,_that.description,_that.terms,_that.claimedCount,_that.availableCount,_that.supportPhone,_that.shops,_that.ctaLabel,_that.ctaEnabled,_that.hint,_that.shortBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RewardCardDto card,  String? description,  String? terms,  int claimedCount,  int? availableCount,  String? supportPhone,  List<String> shops,  String ctaLabel,  bool ctaEnabled,  String? hint,  int shortBy)  $default,) {final _that = this;
switch (_that) {
case _RewardDetailDto():
return $default(_that.card,_that.description,_that.terms,_that.claimedCount,_that.availableCount,_that.supportPhone,_that.shops,_that.ctaLabel,_that.ctaEnabled,_that.hint,_that.shortBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RewardCardDto card,  String? description,  String? terms,  int claimedCount,  int? availableCount,  String? supportPhone,  List<String> shops,  String ctaLabel,  bool ctaEnabled,  String? hint,  int shortBy)?  $default,) {final _that = this;
switch (_that) {
case _RewardDetailDto() when $default != null:
return $default(_that.card,_that.description,_that.terms,_that.claimedCount,_that.availableCount,_that.supportPhone,_that.shops,_that.ctaLabel,_that.ctaEnabled,_that.hint,_that.shortBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RewardDetailDto implements RewardDetailDto {
  const _RewardDetailDto({required this.card, this.description, this.terms, this.claimedCount = 0, this.availableCount, this.supportPhone,  List<String> shops = const [], required this.ctaLabel, this.ctaEnabled = false, this.hint, this.shortBy = 0}): _shops = shops;
  factory _RewardDetailDto.fromJson(Map<String, dynamic> json) => _$RewardDetailDtoFromJson(json);

@override final  RewardCardDto card;
@override final  String? description;
@override final  String? terms;
@override@JsonKey() final  int claimedCount;
@override final  int? availableCount;
@override final  String? supportPhone;
 final  List<String> _shops;
@override@JsonKey() List<String> get shops {
  if (_shops is EqualUnmodifiableListView) return _shops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shops);
}

@override final  String ctaLabel;
@override@JsonKey() final  bool ctaEnabled;
@override final  String? hint;
@override@JsonKey() final  int shortBy;

/// Create a copy of RewardDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardDetailDtoCopyWith<_RewardDetailDto> get copyWith => __$RewardDetailDtoCopyWithImpl<_RewardDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardDetailDto&&(identical(other.card, card) || other.card == card)&&(identical(other.description, description) || other.description == description)&&(identical(other.terms, terms) || other.terms == terms)&&(identical(other.claimedCount, claimedCount) || other.claimedCount == claimedCount)&&(identical(other.availableCount, availableCount) || other.availableCount == availableCount)&&(identical(other.supportPhone, supportPhone) || other.supportPhone == supportPhone)&&const DeepCollectionEquality().equals(other.shops, _shops)&&(identical(other.ctaLabel, ctaLabel) || other.ctaLabel == ctaLabel)&&(identical(other.ctaEnabled, ctaEnabled) || other.ctaEnabled == ctaEnabled)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.shortBy, shortBy) || other.shortBy == shortBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,card,description,terms,claimedCount,availableCount,supportPhone,const DeepCollectionEquality().hash(_shops),ctaLabel,ctaEnabled,hint,shortBy);
}

@override
String toString() {
    return 'RewardDetailDto(card: $card, description: $description, terms: $terms, claimedCount: $claimedCount, availableCount: $availableCount, supportPhone: $supportPhone, shops: $shops, ctaLabel: $ctaLabel, ctaEnabled: $ctaEnabled, hint: $hint, shortBy: $shortBy)';
}


}

/// @nodoc
abstract mixin class _$RewardDetailDtoCopyWith<$Res> implements $RewardDetailDtoCopyWith<$Res> {
  factory _$RewardDetailDtoCopyWith(_RewardDetailDto value, $Res Function(_RewardDetailDto) _then) = __$RewardDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 RewardCardDto card, String? description, String? terms, int claimedCount, int? availableCount, String? supportPhone, List<String> shops, String ctaLabel, bool ctaEnabled, String? hint, int shortBy
});


@override $RewardCardDtoCopyWith<$Res> get card;

}
/// @nodoc
class __$RewardDetailDtoCopyWithImpl<$Res>
    implements _$RewardDetailDtoCopyWith<$Res> {
  __$RewardDetailDtoCopyWithImpl(this._self, this._then);

  final _RewardDetailDto _self;
  final $Res Function(_RewardDetailDto) _then;

/// Create a copy of RewardDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? card = null,Object? description = freezed,Object? terms = freezed,Object? claimedCount = null,Object? availableCount = freezed,Object? supportPhone = freezed,Object? shops = null,Object? ctaLabel = null,Object? ctaEnabled = null,Object? hint = freezed,Object? shortBy = null,}) {
  return _then(_RewardDetailDto(
card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as RewardCardDto,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,terms: freezed == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as String?,claimedCount: null == claimedCount ? _self.claimedCount : claimedCount // ignore: cast_nullable_to_non_nullable
as int,availableCount: freezed == availableCount ? _self.availableCount : availableCount // ignore: cast_nullable_to_non_nullable
as int?,supportPhone: freezed == supportPhone ? _self.supportPhone : supportPhone // ignore: cast_nullable_to_non_nullable
as String?,shops: null == shops ? _self._shops : shops // ignore: cast_nullable_to_non_nullable
as List<String>,ctaLabel: null == ctaLabel ? _self.ctaLabel : ctaLabel // ignore: cast_nullable_to_non_nullable
as String,ctaEnabled: null == ctaEnabled ? _self.ctaEnabled : ctaEnabled // ignore: cast_nullable_to_non_nullable
as bool,hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,shortBy: null == shortBy ? _self.shortBy : shortBy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RewardDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RewardCardDtoCopyWith<$Res> get card {
  
  return $RewardCardDtoCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}


/// @nodoc
mixin _$RewardClaimDto {

 String get rewardId; String get method; String get title; String? get code; String? get claimingId; String? get shopName; int get pointsUsed; int get balance; String get note;
/// Create a copy of RewardClaimDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardClaimDtoCopyWith<RewardClaimDto> get copyWith => _$RewardClaimDtoCopyWithImpl<RewardClaimDto>(this as RewardClaimDto, _$identity);

  /// Serializes this RewardClaimDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RewardClaimDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardClaimDto&&(identical(other.rewardId, _this.rewardId) || other.rewardId == _this.rewardId)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.claimingId, _this.claimingId) || other.claimingId == _this.claimingId)&&(identical(other.shopName, _this.shopName) || other.shopName == _this.shopName)&&(identical(other.pointsUsed, _this.pointsUsed) || other.pointsUsed == _this.pointsUsed)&&(identical(other.balance, _this.balance) || other.balance == _this.balance)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RewardClaimDto;
  return Object.hash(runtimeType,_this.rewardId,_this.method,_this.title,_this.code,_this.claimingId,_this.shopName,_this.pointsUsed,_this.balance,_this.note);
}

@override
String toString() {
  final _this = this as RewardClaimDto;
  return 'RewardClaimDto(rewardId: ${_this.rewardId}, method: ${_this.method}, title: ${_this.title}, code: ${_this.code}, claimingId: ${_this.claimingId}, shopName: ${_this.shopName}, pointsUsed: ${_this.pointsUsed}, balance: ${_this.balance}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $RewardClaimDtoCopyWith<$Res>  {
  factory $RewardClaimDtoCopyWith(RewardClaimDto value, $Res Function(RewardClaimDto) _then) = _$RewardClaimDtoCopyWithImpl;
@useResult
$Res call({
 String rewardId, String method, String title, String? code, String? claimingId, String? shopName, int pointsUsed, int balance, String note
});




}
/// @nodoc
class _$RewardClaimDtoCopyWithImpl<$Res>
    implements $RewardClaimDtoCopyWith<$Res> {
  _$RewardClaimDtoCopyWithImpl(this._self, this._then);

  final RewardClaimDto _self;
  final $Res Function(RewardClaimDto) _then;

/// Create a copy of RewardClaimDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rewardId = null,Object? method = null,Object? title = null,Object? code = freezed,Object? claimingId = freezed,Object? shopName = freezed,Object? pointsUsed = null,Object? balance = null,Object? note = null,}) {
  return _then(RewardClaimDto(
rewardId: null == rewardId ? _self.rewardId : rewardId // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,claimingId: freezed == claimingId ? _self.claimingId : claimingId // ignore: cast_nullable_to_non_nullable
as String?,shopName: freezed == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String?,pointsUsed: null == pointsUsed ? _self.pointsUsed : pointsUsed // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RewardClaimDto].
extension RewardClaimDtoPatterns on RewardClaimDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardClaimDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardClaimDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardClaimDto value)  $default,){
final _that = this;
switch (_that) {
case _RewardClaimDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardClaimDto value)?  $default,){
final _that = this;
switch (_that) {
case _RewardClaimDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String rewardId,  String method,  String title,  String? code,  String? claimingId,  String? shopName,  int pointsUsed,  int balance,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardClaimDto() when $default != null:
return $default(_that.rewardId,_that.method,_that.title,_that.code,_that.claimingId,_that.shopName,_that.pointsUsed,_that.balance,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String rewardId,  String method,  String title,  String? code,  String? claimingId,  String? shopName,  int pointsUsed,  int balance,  String note)  $default,) {final _that = this;
switch (_that) {
case _RewardClaimDto():
return $default(_that.rewardId,_that.method,_that.title,_that.code,_that.claimingId,_that.shopName,_that.pointsUsed,_that.balance,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String rewardId,  String method,  String title,  String? code,  String? claimingId,  String? shopName,  int pointsUsed,  int balance,  String note)?  $default,) {final _that = this;
switch (_that) {
case _RewardClaimDto() when $default != null:
return $default(_that.rewardId,_that.method,_that.title,_that.code,_that.claimingId,_that.shopName,_that.pointsUsed,_that.balance,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RewardClaimDto implements RewardClaimDto {
  const _RewardClaimDto({required this.rewardId, required this.method, required this.title, this.code, this.claimingId, this.shopName, required this.pointsUsed, required this.balance, this.note = ''});
  factory _RewardClaimDto.fromJson(Map<String, dynamic> json) => _$RewardClaimDtoFromJson(json);

@override final  String rewardId;
@override final  String method;
@override final  String title;
@override final  String? code;
@override final  String? claimingId;
@override final  String? shopName;
@override final  int pointsUsed;
@override final  int balance;
@override@JsonKey() final  String note;

/// Create a copy of RewardClaimDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardClaimDtoCopyWith<_RewardClaimDto> get copyWith => __$RewardClaimDtoCopyWithImpl<_RewardClaimDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardClaimDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardClaimDto&&(identical(other.rewardId, rewardId) || other.rewardId == rewardId)&&(identical(other.method, method) || other.method == method)&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.claimingId, claimingId) || other.claimingId == claimingId)&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.pointsUsed, pointsUsed) || other.pointsUsed == pointsUsed)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,rewardId,method,title,code,claimingId,shopName,pointsUsed,balance,note);
}

@override
String toString() {
    return 'RewardClaimDto(rewardId: $rewardId, method: $method, title: $title, code: $code, claimingId: $claimingId, shopName: $shopName, pointsUsed: $pointsUsed, balance: $balance, note: $note)';
}


}

/// @nodoc
abstract mixin class _$RewardClaimDtoCopyWith<$Res> implements $RewardClaimDtoCopyWith<$Res> {
  factory _$RewardClaimDtoCopyWith(_RewardClaimDto value, $Res Function(_RewardClaimDto) _then) = __$RewardClaimDtoCopyWithImpl;
@override @useResult
$Res call({
 String rewardId, String method, String title, String? code, String? claimingId, String? shopName, int pointsUsed, int balance, String note
});




}
/// @nodoc
class __$RewardClaimDtoCopyWithImpl<$Res>
    implements _$RewardClaimDtoCopyWith<$Res> {
  __$RewardClaimDtoCopyWithImpl(this._self, this._then);

  final _RewardClaimDto _self;
  final $Res Function(_RewardClaimDto) _then;

/// Create a copy of RewardClaimDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rewardId = null,Object? method = null,Object? title = null,Object? code = freezed,Object? claimingId = freezed,Object? shopName = freezed,Object? pointsUsed = null,Object? balance = null,Object? note = null,}) {
  return _then(_RewardClaimDto(
rewardId: null == rewardId ? _self.rewardId : rewardId // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,claimingId: freezed == claimingId ? _self.claimingId : claimingId // ignore: cast_nullable_to_non_nullable
as String?,shopName: freezed == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String?,pointsUsed: null == pointsUsed ? _self.pointsUsed : pointsUsed // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ShopCheckDto {

 String get shopCode; String get shopName; bool get allowed;
/// Create a copy of ShopCheckDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopCheckDtoCopyWith<ShopCheckDto> get copyWith => _$ShopCheckDtoCopyWithImpl<ShopCheckDto>(this as ShopCheckDto, _$identity);

  /// Serializes this ShopCheckDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShopCheckDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopCheckDto&&(identical(other.shopCode, _this.shopCode) || other.shopCode == _this.shopCode)&&(identical(other.shopName, _this.shopName) || other.shopName == _this.shopName)&&(identical(other.allowed, _this.allowed) || other.allowed == _this.allowed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShopCheckDto;
  return Object.hash(runtimeType,_this.shopCode,_this.shopName,_this.allowed);
}

@override
String toString() {
  final _this = this as ShopCheckDto;
  return 'ShopCheckDto(shopCode: ${_this.shopCode}, shopName: ${_this.shopName}, allowed: ${_this.allowed})';
}


}

/// @nodoc
abstract mixin class $ShopCheckDtoCopyWith<$Res>  {
  factory $ShopCheckDtoCopyWith(ShopCheckDto value, $Res Function(ShopCheckDto) _then) = _$ShopCheckDtoCopyWithImpl;
@useResult
$Res call({
 String shopCode, String shopName, bool allowed
});




}
/// @nodoc
class _$ShopCheckDtoCopyWithImpl<$Res>
    implements $ShopCheckDtoCopyWith<$Res> {
  _$ShopCheckDtoCopyWithImpl(this._self, this._then);

  final ShopCheckDto _self;
  final $Res Function(ShopCheckDto) _then;

/// Create a copy of ShopCheckDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shopCode = null,Object? shopName = null,Object? allowed = null,}) {
  return _then(ShopCheckDto(
shopCode: null == shopCode ? _self.shopCode : shopCode // ignore: cast_nullable_to_non_nullable
as String,shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,allowed: null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShopCheckDto].
extension ShopCheckDtoPatterns on ShopCheckDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopCheckDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopCheckDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopCheckDto value)  $default,){
final _that = this;
switch (_that) {
case _ShopCheckDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopCheckDto value)?  $default,){
final _that = this;
switch (_that) {
case _ShopCheckDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String shopCode,  String shopName,  bool allowed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopCheckDto() when $default != null:
return $default(_that.shopCode,_that.shopName,_that.allowed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String shopCode,  String shopName,  bool allowed)  $default,) {final _that = this;
switch (_that) {
case _ShopCheckDto():
return $default(_that.shopCode,_that.shopName,_that.allowed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String shopCode,  String shopName,  bool allowed)?  $default,) {final _that = this;
switch (_that) {
case _ShopCheckDto() when $default != null:
return $default(_that.shopCode,_that.shopName,_that.allowed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShopCheckDto implements ShopCheckDto {
  const _ShopCheckDto({required this.shopCode, required this.shopName, this.allowed = false});
  factory _ShopCheckDto.fromJson(Map<String, dynamic> json) => _$ShopCheckDtoFromJson(json);

@override final  String shopCode;
@override final  String shopName;
@override@JsonKey() final  bool allowed;

/// Create a copy of ShopCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopCheckDtoCopyWith<_ShopCheckDto> get copyWith => __$ShopCheckDtoCopyWithImpl<_ShopCheckDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShopCheckDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopCheckDto&&(identical(other.shopCode, shopCode) || other.shopCode == shopCode)&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.allowed, allowed) || other.allowed == allowed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,shopCode,shopName,allowed);
}

@override
String toString() {
    return 'ShopCheckDto(shopCode: $shopCode, shopName: $shopName, allowed: $allowed)';
}


}

/// @nodoc
abstract mixin class _$ShopCheckDtoCopyWith<$Res> implements $ShopCheckDtoCopyWith<$Res> {
  factory _$ShopCheckDtoCopyWith(_ShopCheckDto value, $Res Function(_ShopCheckDto) _then) = __$ShopCheckDtoCopyWithImpl;
@override @useResult
$Res call({
 String shopCode, String shopName, bool allowed
});




}
/// @nodoc
class __$ShopCheckDtoCopyWithImpl<$Res>
    implements _$ShopCheckDtoCopyWith<$Res> {
  __$ShopCheckDtoCopyWithImpl(this._self, this._then);

  final _ShopCheckDto _self;
  final $Res Function(_ShopCheckDto) _then;

/// Create a copy of ShopCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shopCode = null,Object? shopName = null,Object? allowed = null,}) {
  return _then(_ShopCheckDto(
shopCode: null == shopCode ? _self.shopCode : shopCode // ignore: cast_nullable_to_non_nullable
as String,shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,allowed: null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MemberBenefitDto {

 String get id; String get title; String? get partner; String? get code; String? get instruction; String? get imageUrl; String? get terms; List<String> get shops;
/// Create a copy of MemberBenefitDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberBenefitDtoCopyWith<MemberBenefitDto> get copyWith => _$MemberBenefitDtoCopyWithImpl<MemberBenefitDto>(this as MemberBenefitDto, _$identity);

  /// Serializes this MemberBenefitDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MemberBenefitDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberBenefitDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.partner, _this.partner) || other.partner == _this.partner)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.instruction, _this.instruction) || other.instruction == _this.instruction)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.terms, _this.terms) || other.terms == _this.terms)&&const DeepCollectionEquality().equals(other.shops, _this.shops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MemberBenefitDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.partner,_this.code,_this.instruction,_this.imageUrl,_this.terms,const DeepCollectionEquality().hash(_this.shops));
}

@override
String toString() {
  final _this = this as MemberBenefitDto;
  return 'MemberBenefitDto(id: ${_this.id}, title: ${_this.title}, partner: ${_this.partner}, code: ${_this.code}, instruction: ${_this.instruction}, imageUrl: ${_this.imageUrl}, terms: ${_this.terms}, shops: ${_this.shops})';
}


}

/// @nodoc
abstract mixin class $MemberBenefitDtoCopyWith<$Res>  {
  factory $MemberBenefitDtoCopyWith(MemberBenefitDto value, $Res Function(MemberBenefitDto) _then) = _$MemberBenefitDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? partner, String? code, String? instruction, String? imageUrl, String? terms, List<String> shops
});




}
/// @nodoc
class _$MemberBenefitDtoCopyWithImpl<$Res>
    implements $MemberBenefitDtoCopyWith<$Res> {
  _$MemberBenefitDtoCopyWithImpl(this._self, this._then);

  final MemberBenefitDto _self;
  final $Res Function(MemberBenefitDto) _then;

/// Create a copy of MemberBenefitDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? partner = freezed,Object? code = freezed,Object? instruction = freezed,Object? imageUrl = freezed,Object? terms = freezed,Object? shops = null,}) {
  return _then(MemberBenefitDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,instruction: freezed == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,terms: freezed == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as String?,shops: null == shops ? _self.shops : shops // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberBenefitDto].
extension MemberBenefitDtoPatterns on MemberBenefitDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberBenefitDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberBenefitDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberBenefitDto value)  $default,){
final _that = this;
switch (_that) {
case _MemberBenefitDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberBenefitDto value)?  $default,){
final _that = this;
switch (_that) {
case _MemberBenefitDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? partner,  String? code,  String? instruction,  String? imageUrl,  String? terms,  List<String> shops)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberBenefitDto() when $default != null:
return $default(_that.id,_that.title,_that.partner,_that.code,_that.instruction,_that.imageUrl,_that.terms,_that.shops);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? partner,  String? code,  String? instruction,  String? imageUrl,  String? terms,  List<String> shops)  $default,) {final _that = this;
switch (_that) {
case _MemberBenefitDto():
return $default(_that.id,_that.title,_that.partner,_that.code,_that.instruction,_that.imageUrl,_that.terms,_that.shops);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? partner,  String? code,  String? instruction,  String? imageUrl,  String? terms,  List<String> shops)?  $default,) {final _that = this;
switch (_that) {
case _MemberBenefitDto() when $default != null:
return $default(_that.id,_that.title,_that.partner,_that.code,_that.instruction,_that.imageUrl,_that.terms,_that.shops);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberBenefitDto implements MemberBenefitDto {
  const _MemberBenefitDto({required this.id, required this.title, this.partner, this.code, this.instruction, this.imageUrl, this.terms,  List<String> shops = const []}): _shops = shops;
  factory _MemberBenefitDto.fromJson(Map<String, dynamic> json) => _$MemberBenefitDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? partner;
@override final  String? code;
@override final  String? instruction;
@override final  String? imageUrl;
@override final  String? terms;
 final  List<String> _shops;
@override@JsonKey() List<String> get shops {
  if (_shops is EqualUnmodifiableListView) return _shops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shops);
}


/// Create a copy of MemberBenefitDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberBenefitDtoCopyWith<_MemberBenefitDto> get copyWith => __$MemberBenefitDtoCopyWithImpl<_MemberBenefitDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberBenefitDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberBenefitDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.partner, partner) || other.partner == partner)&&(identical(other.code, code) || other.code == code)&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.terms, terms) || other.terms == terms)&&const DeepCollectionEquality().equals(other.shops, _shops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,partner,code,instruction,imageUrl,terms,const DeepCollectionEquality().hash(_shops));
}

@override
String toString() {
    return 'MemberBenefitDto(id: $id, title: $title, partner: $partner, code: $code, instruction: $instruction, imageUrl: $imageUrl, terms: $terms, shops: $shops)';
}


}

/// @nodoc
abstract mixin class _$MemberBenefitDtoCopyWith<$Res> implements $MemberBenefitDtoCopyWith<$Res> {
  factory _$MemberBenefitDtoCopyWith(_MemberBenefitDto value, $Res Function(_MemberBenefitDto) _then) = __$MemberBenefitDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? partner, String? code, String? instruction, String? imageUrl, String? terms, List<String> shops
});




}
/// @nodoc
class __$MemberBenefitDtoCopyWithImpl<$Res>
    implements _$MemberBenefitDtoCopyWith<$Res> {
  __$MemberBenefitDtoCopyWithImpl(this._self, this._then);

  final _MemberBenefitDto _self;
  final $Res Function(_MemberBenefitDto) _then;

/// Create a copy of MemberBenefitDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? partner = freezed,Object? code = freezed,Object? instruction = freezed,Object? imageUrl = freezed,Object? terms = freezed,Object? shops = null,}) {
  return _then(_MemberBenefitDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,instruction: freezed == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,terms: freezed == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as String?,shops: null == shops ? _self._shops : shops // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
