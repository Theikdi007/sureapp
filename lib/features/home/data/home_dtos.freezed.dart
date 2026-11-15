// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeDto {

 List<BannerDto> get hero; List<BannerDto> get whatsNew; FlashDealsDto get flashDeals; List<BrandDto> get brands; List<VendorDto> get vendors;@JsonKey(fromJson: _feedFromJson, toJson: _feedToJson) Page<ProductCardDto> get forYou; HomeCountsDto get counts; AddressDto? get deliverTo;
/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDtoCopyWith<HomeDto> get copyWith => _$HomeDtoCopyWithImpl<HomeDto>(this as HomeDto, _$identity);

  /// Serializes this HomeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDto&&const DeepCollectionEquality().equals(other.hero, _this.hero)&&const DeepCollectionEquality().equals(other.whatsNew, _this.whatsNew)&&(identical(other.flashDeals, _this.flashDeals) || other.flashDeals == _this.flashDeals)&&const DeepCollectionEquality().equals(other.brands, _this.brands)&&const DeepCollectionEquality().equals(other.vendors, _this.vendors)&&(identical(other.forYou, _this.forYou) || other.forYou == _this.forYou)&&(identical(other.counts, _this.counts) || other.counts == _this.counts)&&(identical(other.deliverTo, _this.deliverTo) || other.deliverTo == _this.deliverTo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.hero),const DeepCollectionEquality().hash(_this.whatsNew),_this.flashDeals,const DeepCollectionEquality().hash(_this.brands),const DeepCollectionEquality().hash(_this.vendors),_this.forYou,_this.counts,_this.deliverTo);
}

@override
String toString() {
  final _this = this as HomeDto;
  return 'HomeDto(hero: ${_this.hero}, whatsNew: ${_this.whatsNew}, flashDeals: ${_this.flashDeals}, brands: ${_this.brands}, vendors: ${_this.vendors}, forYou: ${_this.forYou}, counts: ${_this.counts}, deliverTo: ${_this.deliverTo})';
}


}

/// @nodoc
abstract mixin class $HomeDtoCopyWith<$Res>  {
  factory $HomeDtoCopyWith(HomeDto value, $Res Function(HomeDto) _then) = _$HomeDtoCopyWithImpl;
@useResult
$Res call({
 List<BannerDto> hero, List<BannerDto> whatsNew, FlashDealsDto flashDeals, List<BrandDto> brands, List<VendorDto> vendors,@JsonKey(fromJson: _feedFromJson, toJson: _feedToJson) Page<ProductCardDto> forYou, HomeCountsDto counts, AddressDto? deliverTo
});


$FlashDealsDtoCopyWith<$Res> get flashDeals;$HomeCountsDtoCopyWith<$Res> get counts;$AddressDtoCopyWith<$Res>? get deliverTo;

}
/// @nodoc
class _$HomeDtoCopyWithImpl<$Res>
    implements $HomeDtoCopyWith<$Res> {
  _$HomeDtoCopyWithImpl(this._self, this._then);

  final HomeDto _self;
  final $Res Function(HomeDto) _then;

/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hero = null,Object? whatsNew = null,Object? flashDeals = null,Object? brands = null,Object? vendors = null,Object? forYou = null,Object? counts = null,Object? deliverTo = freezed,}) {
  return _then(HomeDto(
hero: null == hero ? _self.hero : hero // ignore: cast_nullable_to_non_nullable
as List<BannerDto>,whatsNew: null == whatsNew ? _self.whatsNew : whatsNew // ignore: cast_nullable_to_non_nullable
as List<BannerDto>,flashDeals: null == flashDeals ? _self.flashDeals : flashDeals // ignore: cast_nullable_to_non_nullable
as FlashDealsDto,brands: null == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as List<BrandDto>,vendors: null == vendors ? _self.vendors : vendors // ignore: cast_nullable_to_non_nullable
as List<VendorDto>,forYou: null == forYou ? _self.forYou : forYou // ignore: cast_nullable_to_non_nullable
as Page<ProductCardDto>,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as HomeCountsDto,deliverTo: freezed == deliverTo ? _self.deliverTo : deliverTo // ignore: cast_nullable_to_non_nullable
as AddressDto?,
  ));
}
/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlashDealsDtoCopyWith<$Res> get flashDeals {
  
  return $FlashDealsDtoCopyWith<$Res>(_self.flashDeals, (value) {
    return _then(_self.copyWith(flashDeals: value));
  });
}/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeCountsDtoCopyWith<$Res> get counts {
  
  return $HomeCountsDtoCopyWith<$Res>(_self.counts, (value) {
    return _then(_self.copyWith(counts: value));
  });
}/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<$Res>? get deliverTo {
    if (_self.deliverTo == null) {
    return null;
  }

  return $AddressDtoCopyWith<$Res>(_self.deliverTo!, (value) {
    return _then(_self.copyWith(deliverTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeDto].
extension HomeDtoPatterns on HomeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BannerDto> hero,  List<BannerDto> whatsNew,  FlashDealsDto flashDeals,  List<BrandDto> brands,  List<VendorDto> vendors, @JsonKey(fromJson: _feedFromJson, toJson: _feedToJson)  Page<ProductCardDto> forYou,  HomeCountsDto counts,  AddressDto? deliverTo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeDto() when $default != null:
return $default(_that.hero,_that.whatsNew,_that.flashDeals,_that.brands,_that.vendors,_that.forYou,_that.counts,_that.deliverTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BannerDto> hero,  List<BannerDto> whatsNew,  FlashDealsDto flashDeals,  List<BrandDto> brands,  List<VendorDto> vendors, @JsonKey(fromJson: _feedFromJson, toJson: _feedToJson)  Page<ProductCardDto> forYou,  HomeCountsDto counts,  AddressDto? deliverTo)  $default,) {final _that = this;
switch (_that) {
case _HomeDto():
return $default(_that.hero,_that.whatsNew,_that.flashDeals,_that.brands,_that.vendors,_that.forYou,_that.counts,_that.deliverTo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BannerDto> hero,  List<BannerDto> whatsNew,  FlashDealsDto flashDeals,  List<BrandDto> brands,  List<VendorDto> vendors, @JsonKey(fromJson: _feedFromJson, toJson: _feedToJson)  Page<ProductCardDto> forYou,  HomeCountsDto counts,  AddressDto? deliverTo)?  $default,) {final _that = this;
switch (_that) {
case _HomeDto() when $default != null:
return $default(_that.hero,_that.whatsNew,_that.flashDeals,_that.brands,_that.vendors,_that.forYou,_that.counts,_that.deliverTo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeDto extends HomeDto {
  const _HomeDto({ List<BannerDto> hero = const [],  List<BannerDto> whatsNew = const [], this.flashDeals = const FlashDealsDto(),  List<BrandDto> brands = const [],  List<VendorDto> vendors = const [], @JsonKey(fromJson: _feedFromJson, toJson: _feedToJson) required this.forYou, this.counts = const HomeCountsDto(), this.deliverTo}): _hero = hero,_whatsNew = whatsNew,_brands = brands,_vendors = vendors,super._();
  factory _HomeDto.fromJson(Map<String, dynamic> json) => _$HomeDtoFromJson(json);

 final  List<BannerDto> _hero;
@override@JsonKey() List<BannerDto> get hero {
  if (_hero is EqualUnmodifiableListView) return _hero;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hero);
}

 final  List<BannerDto> _whatsNew;
@override@JsonKey() List<BannerDto> get whatsNew {
  if (_whatsNew is EqualUnmodifiableListView) return _whatsNew;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_whatsNew);
}

@override@JsonKey() final  FlashDealsDto flashDeals;
 final  List<BrandDto> _brands;
@override@JsonKey() List<BrandDto> get brands {
  if (_brands is EqualUnmodifiableListView) return _brands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brands);
}

 final  List<VendorDto> _vendors;
@override@JsonKey() List<VendorDto> get vendors {
  if (_vendors is EqualUnmodifiableListView) return _vendors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vendors);
}

@override@JsonKey(fromJson: _feedFromJson, toJson: _feedToJson) final  Page<ProductCardDto> forYou;
@override@JsonKey() final  HomeCountsDto counts;
@override final  AddressDto? deliverTo;

/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeDtoCopyWith<_HomeDto> get copyWith => __$HomeDtoCopyWithImpl<_HomeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeDto&&const DeepCollectionEquality().equals(other.hero, _hero)&&const DeepCollectionEquality().equals(other.whatsNew, _whatsNew)&&(identical(other.flashDeals, flashDeals) || other.flashDeals == flashDeals)&&const DeepCollectionEquality().equals(other.brands, _brands)&&const DeepCollectionEquality().equals(other.vendors, _vendors)&&(identical(other.forYou, forYou) || other.forYou == forYou)&&(identical(other.counts, counts) || other.counts == counts)&&(identical(other.deliverTo, deliverTo) || other.deliverTo == deliverTo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_hero),const DeepCollectionEquality().hash(_whatsNew),flashDeals,const DeepCollectionEquality().hash(_brands),const DeepCollectionEquality().hash(_vendors),forYou,counts,deliverTo);
}

@override
String toString() {
    return 'HomeDto(hero: $hero, whatsNew: $whatsNew, flashDeals: $flashDeals, brands: $brands, vendors: $vendors, forYou: $forYou, counts: $counts, deliverTo: $deliverTo)';
}


}

/// @nodoc
abstract mixin class _$HomeDtoCopyWith<$Res> implements $HomeDtoCopyWith<$Res> {
  factory _$HomeDtoCopyWith(_HomeDto value, $Res Function(_HomeDto) _then) = __$HomeDtoCopyWithImpl;
@override @useResult
$Res call({
 List<BannerDto> hero, List<BannerDto> whatsNew, FlashDealsDto flashDeals, List<BrandDto> brands, List<VendorDto> vendors,@JsonKey(fromJson: _feedFromJson, toJson: _feedToJson) Page<ProductCardDto> forYou, HomeCountsDto counts, AddressDto? deliverTo
});


@override $FlashDealsDtoCopyWith<$Res> get flashDeals;@override $HomeCountsDtoCopyWith<$Res> get counts;@override $AddressDtoCopyWith<$Res>? get deliverTo;

}
/// @nodoc
class __$HomeDtoCopyWithImpl<$Res>
    implements _$HomeDtoCopyWith<$Res> {
  __$HomeDtoCopyWithImpl(this._self, this._then);

  final _HomeDto _self;
  final $Res Function(_HomeDto) _then;

/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hero = null,Object? whatsNew = null,Object? flashDeals = null,Object? brands = null,Object? vendors = null,Object? forYou = null,Object? counts = null,Object? deliverTo = freezed,}) {
  return _then(_HomeDto(
hero: null == hero ? _self._hero : hero // ignore: cast_nullable_to_non_nullable
as List<BannerDto>,whatsNew: null == whatsNew ? _self._whatsNew : whatsNew // ignore: cast_nullable_to_non_nullable
as List<BannerDto>,flashDeals: null == flashDeals ? _self.flashDeals : flashDeals // ignore: cast_nullable_to_non_nullable
as FlashDealsDto,brands: null == brands ? _self._brands : brands // ignore: cast_nullable_to_non_nullable
as List<BrandDto>,vendors: null == vendors ? _self._vendors : vendors // ignore: cast_nullable_to_non_nullable
as List<VendorDto>,forYou: null == forYou ? _self.forYou : forYou // ignore: cast_nullable_to_non_nullable
as Page<ProductCardDto>,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as HomeCountsDto,deliverTo: freezed == deliverTo ? _self.deliverTo : deliverTo // ignore: cast_nullable_to_non_nullable
as AddressDto?,
  ));
}

/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlashDealsDtoCopyWith<$Res> get flashDeals {
  
  return $FlashDealsDtoCopyWith<$Res>(_self.flashDeals, (value) {
    return _then(_self.copyWith(flashDeals: value));
  });
}/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeCountsDtoCopyWith<$Res> get counts {
  
  return $HomeCountsDtoCopyWith<$Res>(_self.counts, (value) {
    return _then(_self.copyWith(counts: value));
  });
}/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<$Res>? get deliverTo {
    if (_self.deliverTo == null) {
    return null;
  }

  return $AddressDtoCopyWith<$Res>(_self.deliverTo!, (value) {
    return _then(_self.copyWith(deliverTo: value));
  });
}
}


/// @nodoc
mixin _$HomeCountsDto {

 int get unreadNotifications; int get wishlist; int get cartItems;
/// Create a copy of HomeCountsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeCountsDtoCopyWith<HomeCountsDto> get copyWith => _$HomeCountsDtoCopyWithImpl<HomeCountsDto>(this as HomeCountsDto, _$identity);

  /// Serializes this HomeCountsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeCountsDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeCountsDto&&(identical(other.unreadNotifications, _this.unreadNotifications) || other.unreadNotifications == _this.unreadNotifications)&&(identical(other.wishlist, _this.wishlist) || other.wishlist == _this.wishlist)&&(identical(other.cartItems, _this.cartItems) || other.cartItems == _this.cartItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeCountsDto;
  return Object.hash(runtimeType,_this.unreadNotifications,_this.wishlist,_this.cartItems);
}

@override
String toString() {
  final _this = this as HomeCountsDto;
  return 'HomeCountsDto(unreadNotifications: ${_this.unreadNotifications}, wishlist: ${_this.wishlist}, cartItems: ${_this.cartItems})';
}


}

/// @nodoc
abstract mixin class $HomeCountsDtoCopyWith<$Res>  {
  factory $HomeCountsDtoCopyWith(HomeCountsDto value, $Res Function(HomeCountsDto) _then) = _$HomeCountsDtoCopyWithImpl;
@useResult
$Res call({
 int unreadNotifications, int wishlist, int cartItems
});




}
/// @nodoc
class _$HomeCountsDtoCopyWithImpl<$Res>
    implements $HomeCountsDtoCopyWith<$Res> {
  _$HomeCountsDtoCopyWithImpl(this._self, this._then);

  final HomeCountsDto _self;
  final $Res Function(HomeCountsDto) _then;

/// Create a copy of HomeCountsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unreadNotifications = null,Object? wishlist = null,Object? cartItems = null,}) {
  return _then(HomeCountsDto(
unreadNotifications: null == unreadNotifications ? _self.unreadNotifications : unreadNotifications // ignore: cast_nullable_to_non_nullable
as int,wishlist: null == wishlist ? _self.wishlist : wishlist // ignore: cast_nullable_to_non_nullable
as int,cartItems: null == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeCountsDto].
extension HomeCountsDtoPatterns on HomeCountsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeCountsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeCountsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeCountsDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeCountsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeCountsDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeCountsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int unreadNotifications,  int wishlist,  int cartItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeCountsDto() when $default != null:
return $default(_that.unreadNotifications,_that.wishlist,_that.cartItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int unreadNotifications,  int wishlist,  int cartItems)  $default,) {final _that = this;
switch (_that) {
case _HomeCountsDto():
return $default(_that.unreadNotifications,_that.wishlist,_that.cartItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int unreadNotifications,  int wishlist,  int cartItems)?  $default,) {final _that = this;
switch (_that) {
case _HomeCountsDto() when $default != null:
return $default(_that.unreadNotifications,_that.wishlist,_that.cartItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeCountsDto implements HomeCountsDto {
  const _HomeCountsDto({this.unreadNotifications = 0, this.wishlist = 0, this.cartItems = 0});
  factory _HomeCountsDto.fromJson(Map<String, dynamic> json) => _$HomeCountsDtoFromJson(json);

@override@JsonKey() final  int unreadNotifications;
@override@JsonKey() final  int wishlist;
@override@JsonKey() final  int cartItems;

/// Create a copy of HomeCountsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeCountsDtoCopyWith<_HomeCountsDto> get copyWith => __$HomeCountsDtoCopyWithImpl<_HomeCountsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeCountsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeCountsDto&&(identical(other.unreadNotifications, unreadNotifications) || other.unreadNotifications == unreadNotifications)&&(identical(other.wishlist, wishlist) || other.wishlist == wishlist)&&(identical(other.cartItems, cartItems) || other.cartItems == cartItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,unreadNotifications,wishlist,cartItems);
}

@override
String toString() {
    return 'HomeCountsDto(unreadNotifications: $unreadNotifications, wishlist: $wishlist, cartItems: $cartItems)';
}


}

/// @nodoc
abstract mixin class _$HomeCountsDtoCopyWith<$Res> implements $HomeCountsDtoCopyWith<$Res> {
  factory _$HomeCountsDtoCopyWith(_HomeCountsDto value, $Res Function(_HomeCountsDto) _then) = __$HomeCountsDtoCopyWithImpl;
@override @useResult
$Res call({
 int unreadNotifications, int wishlist, int cartItems
});




}
/// @nodoc
class __$HomeCountsDtoCopyWithImpl<$Res>
    implements _$HomeCountsDtoCopyWith<$Res> {
  __$HomeCountsDtoCopyWithImpl(this._self, this._then);

  final _HomeCountsDto _self;
  final $Res Function(_HomeCountsDto) _then;

/// Create a copy of HomeCountsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unreadNotifications = null,Object? wishlist = null,Object? cartItems = null,}) {
  return _then(_HomeCountsDto(
unreadNotifications: null == unreadNotifications ? _self.unreadNotifications : unreadNotifications // ignore: cast_nullable_to_non_nullable
as int,wishlist: null == wishlist ? _self.wishlist : wishlist // ignore: cast_nullable_to_non_nullable
as int,cartItems: null == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AddressDto {

 String get id; String get label; String get recipientName; String get recipientPhone; String get line1; String? get line2; String get township; String get city; String? get region; String? get instructions; String get icon; bool get isDefault; String get shortLabel; String get fullText;
/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<AddressDto> get copyWith => _$AddressDtoCopyWithImpl<AddressDto>(this as AddressDto, _$identity);

  /// Serializes this AddressDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AddressDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.recipientName, _this.recipientName) || other.recipientName == _this.recipientName)&&(identical(other.recipientPhone, _this.recipientPhone) || other.recipientPhone == _this.recipientPhone)&&(identical(other.line1, _this.line1) || other.line1 == _this.line1)&&(identical(other.line2, _this.line2) || other.line2 == _this.line2)&&(identical(other.township, _this.township) || other.township == _this.township)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.region, _this.region) || other.region == _this.region)&&(identical(other.instructions, _this.instructions) || other.instructions == _this.instructions)&&(identical(other.icon, _this.icon) || other.icon == _this.icon)&&(identical(other.isDefault, _this.isDefault) || other.isDefault == _this.isDefault)&&(identical(other.shortLabel, _this.shortLabel) || other.shortLabel == _this.shortLabel)&&(identical(other.fullText, _this.fullText) || other.fullText == _this.fullText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AddressDto;
  return Object.hash(runtimeType,_this.id,_this.label,_this.recipientName,_this.recipientPhone,_this.line1,_this.line2,_this.township,_this.city,_this.region,_this.instructions,_this.icon,_this.isDefault,_this.shortLabel,_this.fullText);
}

@override
String toString() {
  final _this = this as AddressDto;
  return 'AddressDto(id: ${_this.id}, label: ${_this.label}, recipientName: ${_this.recipientName}, recipientPhone: ${_this.recipientPhone}, line1: ${_this.line1}, line2: ${_this.line2}, township: ${_this.township}, city: ${_this.city}, region: ${_this.region}, instructions: ${_this.instructions}, icon: ${_this.icon}, isDefault: ${_this.isDefault}, shortLabel: ${_this.shortLabel}, fullText: ${_this.fullText})';
}


}

/// @nodoc
abstract mixin class $AddressDtoCopyWith<$Res>  {
  factory $AddressDtoCopyWith(AddressDto value, $Res Function(AddressDto) _then) = _$AddressDtoCopyWithImpl;
@useResult
$Res call({
 String id, String label, String recipientName, String recipientPhone, String line1, String? line2, String township, String city, String? region, String? instructions, String icon, bool isDefault, String shortLabel, String fullText
});




}
/// @nodoc
class _$AddressDtoCopyWithImpl<$Res>
    implements $AddressDtoCopyWith<$Res> {
  _$AddressDtoCopyWithImpl(this._self, this._then);

  final AddressDto _self;
  final $Res Function(AddressDto) _then;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? recipientName = null,Object? recipientPhone = null,Object? line1 = null,Object? line2 = freezed,Object? township = null,Object? city = null,Object? region = freezed,Object? instructions = freezed,Object? icon = null,Object? isDefault = null,Object? shortLabel = null,Object? fullText = null,}) {
  return _then(AddressDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: null == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String,line1: null == line1 ? _self.line1 : line1 // ignore: cast_nullable_to_non_nullable
as String,line2: freezed == line2 ? _self.line2 : line2 // ignore: cast_nullable_to_non_nullable
as String?,township: null == township ? _self.township : township // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,shortLabel: null == shortLabel ? _self.shortLabel : shortLabel // ignore: cast_nullable_to_non_nullable
as String,fullText: null == fullText ? _self.fullText : fullText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressDto].
extension AddressDtoPatterns on AddressDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressDto value)  $default,){
final _that = this;
switch (_that) {
case _AddressDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressDto value)?  $default,){
final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String recipientName,  String recipientPhone,  String line1,  String? line2,  String township,  String city,  String? region,  String? instructions,  String icon,  bool isDefault,  String shortLabel,  String fullText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
return $default(_that.id,_that.label,_that.recipientName,_that.recipientPhone,_that.line1,_that.line2,_that.township,_that.city,_that.region,_that.instructions,_that.icon,_that.isDefault,_that.shortLabel,_that.fullText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String recipientName,  String recipientPhone,  String line1,  String? line2,  String township,  String city,  String? region,  String? instructions,  String icon,  bool isDefault,  String shortLabel,  String fullText)  $default,) {final _that = this;
switch (_that) {
case _AddressDto():
return $default(_that.id,_that.label,_that.recipientName,_that.recipientPhone,_that.line1,_that.line2,_that.township,_that.city,_that.region,_that.instructions,_that.icon,_that.isDefault,_that.shortLabel,_that.fullText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String recipientName,  String recipientPhone,  String line1,  String? line2,  String township,  String city,  String? region,  String? instructions,  String icon,  bool isDefault,  String shortLabel,  String fullText)?  $default,) {final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
return $default(_that.id,_that.label,_that.recipientName,_that.recipientPhone,_that.line1,_that.line2,_that.township,_that.city,_that.region,_that.instructions,_that.icon,_that.isDefault,_that.shortLabel,_that.fullText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressDto implements AddressDto {
  const _AddressDto({required this.id, required this.label, required this.recipientName, required this.recipientPhone, required this.line1, this.line2, required this.township, required this.city, this.region, this.instructions, this.icon = 'map-pin-house', this.isDefault = false, required this.shortLabel, required this.fullText});
  factory _AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

@override final  String id;
@override final  String label;
@override final  String recipientName;
@override final  String recipientPhone;
@override final  String line1;
@override final  String? line2;
@override final  String township;
@override final  String city;
@override final  String? region;
@override final  String? instructions;
@override@JsonKey() final  String icon;
@override@JsonKey() final  bool isDefault;
@override final  String shortLabel;
@override final  String fullText;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressDtoCopyWith<_AddressDto> get copyWith => __$AddressDtoCopyWithImpl<_AddressDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.line1, line1) || other.line1 == line1)&&(identical(other.line2, line2) || other.line2 == line2)&&(identical(other.township, township) || other.township == township)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.shortLabel, shortLabel) || other.shortLabel == shortLabel)&&(identical(other.fullText, fullText) || other.fullText == fullText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,recipientName,recipientPhone,line1,line2,township,city,region,instructions,icon,isDefault,shortLabel,fullText);
}

@override
String toString() {
    return 'AddressDto(id: $id, label: $label, recipientName: $recipientName, recipientPhone: $recipientPhone, line1: $line1, line2: $line2, township: $township, city: $city, region: $region, instructions: $instructions, icon: $icon, isDefault: $isDefault, shortLabel: $shortLabel, fullText: $fullText)';
}


}

/// @nodoc
abstract mixin class _$AddressDtoCopyWith<$Res> implements $AddressDtoCopyWith<$Res> {
  factory _$AddressDtoCopyWith(_AddressDto value, $Res Function(_AddressDto) _then) = __$AddressDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String recipientName, String recipientPhone, String line1, String? line2, String township, String city, String? region, String? instructions, String icon, bool isDefault, String shortLabel, String fullText
});




}
/// @nodoc
class __$AddressDtoCopyWithImpl<$Res>
    implements _$AddressDtoCopyWith<$Res> {
  __$AddressDtoCopyWithImpl(this._self, this._then);

  final _AddressDto _self;
  final $Res Function(_AddressDto) _then;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? recipientName = null,Object? recipientPhone = null,Object? line1 = null,Object? line2 = freezed,Object? township = null,Object? city = null,Object? region = freezed,Object? instructions = freezed,Object? icon = null,Object? isDefault = null,Object? shortLabel = null,Object? fullText = null,}) {
  return _then(_AddressDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: null == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String,line1: null == line1 ? _self.line1 : line1 // ignore: cast_nullable_to_non_nullable
as String,line2: freezed == line2 ? _self.line2 : line2 // ignore: cast_nullable_to_non_nullable
as String?,township: null == township ? _self.township : township // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,shortLabel: null == shortLabel ? _self.shortLabel : shortLabel // ignore: cast_nullable_to_non_nullable
as String,fullText: null == fullText ? _self.fullText : fullText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
