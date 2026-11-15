// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductCardDto {

 String get id; String get name; String? get brand; String? get imageUrl; Money get price; Money? get compareAt; int? get discountPercent; bool get inStock; double? get rating; int get reviewCount; bool get wished; String? get defaultSku;
/// Create a copy of ProductCardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCardDtoCopyWith<ProductCardDto> get copyWith => _$ProductCardDtoCopyWithImpl<ProductCardDto>(this as ProductCardDto, _$identity);

  /// Serializes this ProductCardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductCardDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductCardDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.compareAt, _this.compareAt) || other.compareAt == _this.compareAt)&&(identical(other.discountPercent, _this.discountPercent) || other.discountPercent == _this.discountPercent)&&(identical(other.inStock, _this.inStock) || other.inStock == _this.inStock)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.reviewCount, _this.reviewCount) || other.reviewCount == _this.reviewCount)&&(identical(other.wished, _this.wished) || other.wished == _this.wished)&&(identical(other.defaultSku, _this.defaultSku) || other.defaultSku == _this.defaultSku));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductCardDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.brand,_this.imageUrl,_this.price,_this.compareAt,_this.discountPercent,_this.inStock,_this.rating,_this.reviewCount,_this.wished,_this.defaultSku);
}

@override
String toString() {
  final _this = this as ProductCardDto;
  return 'ProductCardDto(id: ${_this.id}, name: ${_this.name}, brand: ${_this.brand}, imageUrl: ${_this.imageUrl}, price: ${_this.price}, compareAt: ${_this.compareAt}, discountPercent: ${_this.discountPercent}, inStock: ${_this.inStock}, rating: ${_this.rating}, reviewCount: ${_this.reviewCount}, wished: ${_this.wished}, defaultSku: ${_this.defaultSku})';
}


}

/// @nodoc
abstract mixin class $ProductCardDtoCopyWith<$Res>  {
  factory $ProductCardDtoCopyWith(ProductCardDto value, $Res Function(ProductCardDto) _then) = _$ProductCardDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? brand, String? imageUrl, Money price, Money? compareAt, int? discountPercent, bool inStock, double? rating, int reviewCount, bool wished, String? defaultSku
});


$MoneyCopyWith<$Res> get price;$MoneyCopyWith<$Res>? get compareAt;

}
/// @nodoc
class _$ProductCardDtoCopyWithImpl<$Res>
    implements $ProductCardDtoCopyWith<$Res> {
  _$ProductCardDtoCopyWithImpl(this._self, this._then);

  final ProductCardDto _self;
  final $Res Function(ProductCardDto) _then;

/// Create a copy of ProductCardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? brand = freezed,Object? imageUrl = freezed,Object? price = null,Object? compareAt = freezed,Object? discountPercent = freezed,Object? inStock = null,Object? rating = freezed,Object? reviewCount = null,Object? wished = null,Object? defaultSku = freezed,}) {
  return _then(ProductCardDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,compareAt: freezed == compareAt ? _self.compareAt : compareAt // ignore: cast_nullable_to_non_nullable
as Money?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,wished: null == wished ? _self.wished : wished // ignore: cast_nullable_to_non_nullable
as bool,defaultSku: freezed == defaultSku ? _self.defaultSku : defaultSku // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProductCardDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of ProductCardDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get compareAt {
    if (_self.compareAt == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.compareAt!, (value) {
    return _then(_self.copyWith(compareAt: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductCardDto].
extension ProductCardDtoPatterns on ProductCardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductCardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductCardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductCardDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductCardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductCardDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductCardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? brand,  String? imageUrl,  Money price,  Money? compareAt,  int? discountPercent,  bool inStock,  double? rating,  int reviewCount,  bool wished,  String? defaultSku)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductCardDto() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.imageUrl,_that.price,_that.compareAt,_that.discountPercent,_that.inStock,_that.rating,_that.reviewCount,_that.wished,_that.defaultSku);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? brand,  String? imageUrl,  Money price,  Money? compareAt,  int? discountPercent,  bool inStock,  double? rating,  int reviewCount,  bool wished,  String? defaultSku)  $default,) {final _that = this;
switch (_that) {
case _ProductCardDto():
return $default(_that.id,_that.name,_that.brand,_that.imageUrl,_that.price,_that.compareAt,_that.discountPercent,_that.inStock,_that.rating,_that.reviewCount,_that.wished,_that.defaultSku);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? brand,  String? imageUrl,  Money price,  Money? compareAt,  int? discountPercent,  bool inStock,  double? rating,  int reviewCount,  bool wished,  String? defaultSku)?  $default,) {final _that = this;
switch (_that) {
case _ProductCardDto() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.imageUrl,_that.price,_that.compareAt,_that.discountPercent,_that.inStock,_that.rating,_that.reviewCount,_that.wished,_that.defaultSku);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductCardDto implements ProductCardDto {
  const _ProductCardDto({required this.id, required this.name, this.brand, this.imageUrl, required this.price, this.compareAt, this.discountPercent, required this.inStock, this.rating, this.reviewCount = 0, this.wished = false, this.defaultSku});
  factory _ProductCardDto.fromJson(Map<String, dynamic> json) => _$ProductCardDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? brand;
@override final  String? imageUrl;
@override final  Money price;
@override final  Money? compareAt;
@override final  int? discountPercent;
@override final  bool inStock;
@override final  double? rating;
@override@JsonKey() final  int reviewCount;
@override@JsonKey() final  bool wished;
@override final  String? defaultSku;

/// Create a copy of ProductCardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCardDtoCopyWith<_ProductCardDto> get copyWith => __$ProductCardDtoCopyWithImpl<_ProductCardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductCardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductCardDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.compareAt, compareAt) || other.compareAt == compareAt)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.wished, wished) || other.wished == wished)&&(identical(other.defaultSku, defaultSku) || other.defaultSku == defaultSku));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,brand,imageUrl,price,compareAt,discountPercent,inStock,rating,reviewCount,wished,defaultSku);
}

@override
String toString() {
    return 'ProductCardDto(id: $id, name: $name, brand: $brand, imageUrl: $imageUrl, price: $price, compareAt: $compareAt, discountPercent: $discountPercent, inStock: $inStock, rating: $rating, reviewCount: $reviewCount, wished: $wished, defaultSku: $defaultSku)';
}


}

/// @nodoc
abstract mixin class _$ProductCardDtoCopyWith<$Res> implements $ProductCardDtoCopyWith<$Res> {
  factory _$ProductCardDtoCopyWith(_ProductCardDto value, $Res Function(_ProductCardDto) _then) = __$ProductCardDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? brand, String? imageUrl, Money price, Money? compareAt, int? discountPercent, bool inStock, double? rating, int reviewCount, bool wished, String? defaultSku
});


@override $MoneyCopyWith<$Res> get price;@override $MoneyCopyWith<$Res>? get compareAt;

}
/// @nodoc
class __$ProductCardDtoCopyWithImpl<$Res>
    implements _$ProductCardDtoCopyWith<$Res> {
  __$ProductCardDtoCopyWithImpl(this._self, this._then);

  final _ProductCardDto _self;
  final $Res Function(_ProductCardDto) _then;

/// Create a copy of ProductCardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? brand = freezed,Object? imageUrl = freezed,Object? price = null,Object? compareAt = freezed,Object? discountPercent = freezed,Object? inStock = null,Object? rating = freezed,Object? reviewCount = null,Object? wished = null,Object? defaultSku = freezed,}) {
  return _then(_ProductCardDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,compareAt: freezed == compareAt ? _self.compareAt : compareAt // ignore: cast_nullable_to_non_nullable
as Money?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,wished: null == wished ? _self.wished : wished // ignore: cast_nullable_to_non_nullable
as bool,defaultSku: freezed == defaultSku ? _self.defaultSku : defaultSku // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProductCardDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of ProductCardDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get compareAt {
    if (_self.compareAt == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.compareAt!, (value) {
    return _then(_self.copyWith(compareAt: value));
  });
}
}


/// @nodoc
mixin _$BrandDto {

 String get id; String get name; String? get logoUrl; String get initial; String get color; String get backgroundColor; int get productCount;
/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandDtoCopyWith<BrandDto> get copyWith => _$BrandDtoCopyWithImpl<BrandDto>(this as BrandDto, _$identity);

  /// Serializes this BrandDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BrandDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.logoUrl, _this.logoUrl) || other.logoUrl == _this.logoUrl)&&(identical(other.initial, _this.initial) || other.initial == _this.initial)&&(identical(other.color, _this.color) || other.color == _this.color)&&(identical(other.backgroundColor, _this.backgroundColor) || other.backgroundColor == _this.backgroundColor)&&(identical(other.productCount, _this.productCount) || other.productCount == _this.productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BrandDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.logoUrl,_this.initial,_this.color,_this.backgroundColor,_this.productCount);
}

@override
String toString() {
  final _this = this as BrandDto;
  return 'BrandDto(id: ${_this.id}, name: ${_this.name}, logoUrl: ${_this.logoUrl}, initial: ${_this.initial}, color: ${_this.color}, backgroundColor: ${_this.backgroundColor}, productCount: ${_this.productCount})';
}


}

/// @nodoc
abstract mixin class $BrandDtoCopyWith<$Res>  {
  factory $BrandDtoCopyWith(BrandDto value, $Res Function(BrandDto) _then) = _$BrandDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? logoUrl, String initial, String color, String backgroundColor, int productCount
});




}
/// @nodoc
class _$BrandDtoCopyWithImpl<$Res>
    implements $BrandDtoCopyWith<$Res> {
  _$BrandDtoCopyWithImpl(this._self, this._then);

  final BrandDto _self;
  final $Res Function(BrandDto) _then;

/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? initial = null,Object? color = null,Object? backgroundColor = null,Object? productCount = null,}) {
  return _then(BrandDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,initial: null == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BrandDto].
extension BrandDtoPatterns on BrandDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrandDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrandDto value)  $default,){
final _that = this;
switch (_that) {
case _BrandDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrandDto value)?  $default,){
final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? logoUrl,  String initial,  String color,  String backgroundColor,  int productCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.initial,_that.color,_that.backgroundColor,_that.productCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? logoUrl,  String initial,  String color,  String backgroundColor,  int productCount)  $default,) {final _that = this;
switch (_that) {
case _BrandDto():
return $default(_that.id,_that.name,_that.logoUrl,_that.initial,_that.color,_that.backgroundColor,_that.productCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? logoUrl,  String initial,  String color,  String backgroundColor,  int productCount)?  $default,) {final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.initial,_that.color,_that.backgroundColor,_that.productCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandDto implements BrandDto {
  const _BrandDto({required this.id, required this.name, this.logoUrl, this.initial = '', required this.color, required this.backgroundColor, this.productCount = 0});
  factory _BrandDto.fromJson(Map<String, dynamic> json) => _$BrandDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? logoUrl;
@override@JsonKey() final  String initial;
@override final  String color;
@override final  String backgroundColor;
@override@JsonKey() final  int productCount;

/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandDtoCopyWith<_BrandDto> get copyWith => __$BrandDtoCopyWithImpl<_BrandDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.color, color) || other.color == color)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,logoUrl,initial,color,backgroundColor,productCount);
}

@override
String toString() {
    return 'BrandDto(id: $id, name: $name, logoUrl: $logoUrl, initial: $initial, color: $color, backgroundColor: $backgroundColor, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class _$BrandDtoCopyWith<$Res> implements $BrandDtoCopyWith<$Res> {
  factory _$BrandDtoCopyWith(_BrandDto value, $Res Function(_BrandDto) _then) = __$BrandDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? logoUrl, String initial, String color, String backgroundColor, int productCount
});




}
/// @nodoc
class __$BrandDtoCopyWithImpl<$Res>
    implements _$BrandDtoCopyWith<$Res> {
  __$BrandDtoCopyWithImpl(this._self, this._then);

  final _BrandDto _self;
  final $Res Function(_BrandDto) _then;

/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? initial = null,Object? color = null,Object? backgroundColor = null,Object? productCount = null,}) {
  return _then(_BrandDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,initial: null == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$VendorDto {

 String get id; String get name; String get initials; String get color; String get backgroundColor; String get tagline; double get rating; int get ratingCount; int get followers; int get productCount; bool get following;
/// Create a copy of VendorDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VendorDtoCopyWith<VendorDto> get copyWith => _$VendorDtoCopyWithImpl<VendorDto>(this as VendorDto, _$identity);

  /// Serializes this VendorDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VendorDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VendorDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.initials, _this.initials) || other.initials == _this.initials)&&(identical(other.color, _this.color) || other.color == _this.color)&&(identical(other.backgroundColor, _this.backgroundColor) || other.backgroundColor == _this.backgroundColor)&&(identical(other.tagline, _this.tagline) || other.tagline == _this.tagline)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.ratingCount, _this.ratingCount) || other.ratingCount == _this.ratingCount)&&(identical(other.followers, _this.followers) || other.followers == _this.followers)&&(identical(other.productCount, _this.productCount) || other.productCount == _this.productCount)&&(identical(other.following, _this.following) || other.following == _this.following));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VendorDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.initials,_this.color,_this.backgroundColor,_this.tagline,_this.rating,_this.ratingCount,_this.followers,_this.productCount,_this.following);
}

@override
String toString() {
  final _this = this as VendorDto;
  return 'VendorDto(id: ${_this.id}, name: ${_this.name}, initials: ${_this.initials}, color: ${_this.color}, backgroundColor: ${_this.backgroundColor}, tagline: ${_this.tagline}, rating: ${_this.rating}, ratingCount: ${_this.ratingCount}, followers: ${_this.followers}, productCount: ${_this.productCount}, following: ${_this.following})';
}


}

/// @nodoc
abstract mixin class $VendorDtoCopyWith<$Res>  {
  factory $VendorDtoCopyWith(VendorDto value, $Res Function(VendorDto) _then) = _$VendorDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String initials, String color, String backgroundColor, String tagline, double rating, int ratingCount, int followers, int productCount, bool following
});




}
/// @nodoc
class _$VendorDtoCopyWithImpl<$Res>
    implements $VendorDtoCopyWith<$Res> {
  _$VendorDtoCopyWithImpl(this._self, this._then);

  final VendorDto _self;
  final $Res Function(VendorDto) _then;

/// Create a copy of VendorDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? initials = null,Object? color = null,Object? backgroundColor = null,Object? tagline = null,Object? rating = null,Object? ratingCount = null,Object? followers = null,Object? productCount = null,Object? following = null,}) {
  return _then(VendorDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,initials: null == initials ? _self.initials : initials // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VendorDto].
extension VendorDtoPatterns on VendorDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VendorDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VendorDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VendorDto value)  $default,){
final _that = this;
switch (_that) {
case _VendorDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VendorDto value)?  $default,){
final _that = this;
switch (_that) {
case _VendorDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String initials,  String color,  String backgroundColor,  String tagline,  double rating,  int ratingCount,  int followers,  int productCount,  bool following)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VendorDto() when $default != null:
return $default(_that.id,_that.name,_that.initials,_that.color,_that.backgroundColor,_that.tagline,_that.rating,_that.ratingCount,_that.followers,_that.productCount,_that.following);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String initials,  String color,  String backgroundColor,  String tagline,  double rating,  int ratingCount,  int followers,  int productCount,  bool following)  $default,) {final _that = this;
switch (_that) {
case _VendorDto():
return $default(_that.id,_that.name,_that.initials,_that.color,_that.backgroundColor,_that.tagline,_that.rating,_that.ratingCount,_that.followers,_that.productCount,_that.following);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String initials,  String color,  String backgroundColor,  String tagline,  double rating,  int ratingCount,  int followers,  int productCount,  bool following)?  $default,) {final _that = this;
switch (_that) {
case _VendorDto() when $default != null:
return $default(_that.id,_that.name,_that.initials,_that.color,_that.backgroundColor,_that.tagline,_that.rating,_that.ratingCount,_that.followers,_that.productCount,_that.following);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VendorDto implements VendorDto {
  const _VendorDto({required this.id, required this.name, required this.initials, required this.color, required this.backgroundColor, required this.tagline, required this.rating, this.ratingCount = 0, this.followers = 0, this.productCount = 0, this.following = false});
  factory _VendorDto.fromJson(Map<String, dynamic> json) => _$VendorDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String initials;
@override final  String color;
@override final  String backgroundColor;
@override final  String tagline;
@override final  double rating;
@override@JsonKey() final  int ratingCount;
@override@JsonKey() final  int followers;
@override@JsonKey() final  int productCount;
@override@JsonKey() final  bool following;

/// Create a copy of VendorDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VendorDtoCopyWith<_VendorDto> get copyWith => __$VendorDtoCopyWithImpl<_VendorDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VendorDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VendorDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.initials, initials) || other.initials == initials)&&(identical(other.color, color) || other.color == color)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.following, following) || other.following == following));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,initials,color,backgroundColor,tagline,rating,ratingCount,followers,productCount,following);
}

@override
String toString() {
    return 'VendorDto(id: $id, name: $name, initials: $initials, color: $color, backgroundColor: $backgroundColor, tagline: $tagline, rating: $rating, ratingCount: $ratingCount, followers: $followers, productCount: $productCount, following: $following)';
}


}

/// @nodoc
abstract mixin class _$VendorDtoCopyWith<$Res> implements $VendorDtoCopyWith<$Res> {
  factory _$VendorDtoCopyWith(_VendorDto value, $Res Function(_VendorDto) _then) = __$VendorDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String initials, String color, String backgroundColor, String tagline, double rating, int ratingCount, int followers, int productCount, bool following
});




}
/// @nodoc
class __$VendorDtoCopyWithImpl<$Res>
    implements _$VendorDtoCopyWith<$Res> {
  __$VendorDtoCopyWithImpl(this._self, this._then);

  final _VendorDto _self;
  final $Res Function(_VendorDto) _then;

/// Create a copy of VendorDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? initials = null,Object? color = null,Object? backgroundColor = null,Object? tagline = null,Object? rating = null,Object? ratingCount = null,Object? followers = null,Object? productCount = null,Object? following = null,}) {
  return _then(_VendorDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,initials: null == initials ? _self.initials : initials // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BannerDto {

 String get id; String get imageUrl; String? get title; String? get subtitle; LinkDto get link;
/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerDtoCopyWith<BannerDto> get copyWith => _$BannerDtoCopyWithImpl<BannerDto>(this as BannerDto, _$identity);

  /// Serializes this BannerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BannerDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.subtitle, _this.subtitle) || other.subtitle == _this.subtitle)&&(identical(other.link, _this.link) || other.link == _this.link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BannerDto;
  return Object.hash(runtimeType,_this.id,_this.imageUrl,_this.title,_this.subtitle,_this.link);
}

@override
String toString() {
  final _this = this as BannerDto;
  return 'BannerDto(id: ${_this.id}, imageUrl: ${_this.imageUrl}, title: ${_this.title}, subtitle: ${_this.subtitle}, link: ${_this.link})';
}


}

/// @nodoc
abstract mixin class $BannerDtoCopyWith<$Res>  {
  factory $BannerDtoCopyWith(BannerDto value, $Res Function(BannerDto) _then) = _$BannerDtoCopyWithImpl;
@useResult
$Res call({
 String id, String imageUrl, String? title, String? subtitle, LinkDto link
});


$LinkDtoCopyWith<$Res> get link;

}
/// @nodoc
class _$BannerDtoCopyWithImpl<$Res>
    implements $BannerDtoCopyWith<$Res> {
  _$BannerDtoCopyWithImpl(this._self, this._then);

  final BannerDto _self;
  final $Res Function(BannerDto) _then;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = null,Object? title = freezed,Object? subtitle = freezed,Object? link = null,}) {
  return _then(BannerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as LinkDto,
  ));
}
/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LinkDtoCopyWith<$Res> get link {
  
  return $LinkDtoCopyWith<$Res>(_self.link, (value) {
    return _then(_self.copyWith(link: value));
  });
}
}


/// Adds pattern-matching-related methods to [BannerDto].
extension BannerDtoPatterns on BannerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerDto value)  $default,){
final _that = this;
switch (_that) {
case _BannerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerDto value)?  $default,){
final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String imageUrl,  String? title,  String? subtitle,  LinkDto link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
return $default(_that.id,_that.imageUrl,_that.title,_that.subtitle,_that.link);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String imageUrl,  String? title,  String? subtitle,  LinkDto link)  $default,) {final _that = this;
switch (_that) {
case _BannerDto():
return $default(_that.id,_that.imageUrl,_that.title,_that.subtitle,_that.link);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String imageUrl,  String? title,  String? subtitle,  LinkDto link)?  $default,) {final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
return $default(_that.id,_that.imageUrl,_that.title,_that.subtitle,_that.link);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerDto implements BannerDto {
  const _BannerDto({required this.id, required this.imageUrl, this.title, this.subtitle, required this.link});
  factory _BannerDto.fromJson(Map<String, dynamic> json) => _$BannerDtoFromJson(json);

@override final  String id;
@override final  String imageUrl;
@override final  String? title;
@override final  String? subtitle;
@override final  LinkDto link;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerDtoCopyWith<_BannerDto> get copyWith => __$BannerDtoCopyWithImpl<_BannerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,imageUrl,title,subtitle,link);
}

@override
String toString() {
    return 'BannerDto(id: $id, imageUrl: $imageUrl, title: $title, subtitle: $subtitle, link: $link)';
}


}

/// @nodoc
abstract mixin class _$BannerDtoCopyWith<$Res> implements $BannerDtoCopyWith<$Res> {
  factory _$BannerDtoCopyWith(_BannerDto value, $Res Function(_BannerDto) _then) = __$BannerDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String imageUrl, String? title, String? subtitle, LinkDto link
});


@override $LinkDtoCopyWith<$Res> get link;

}
/// @nodoc
class __$BannerDtoCopyWithImpl<$Res>
    implements _$BannerDtoCopyWith<$Res> {
  __$BannerDtoCopyWithImpl(this._self, this._then);

  final _BannerDto _self;
  final $Res Function(_BannerDto) _then;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = null,Object? title = freezed,Object? subtitle = freezed,Object? link = null,}) {
  return _then(_BannerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as LinkDto,
  ));
}

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LinkDtoCopyWith<$Res> get link {
  
  return $LinkDtoCopyWith<$Res>(_self.link, (value) {
    return _then(_self.copyWith(link: value));
  });
}
}


/// @nodoc
mixin _$FlashDealsDto {

 String? get endsAt; List<ProductCardDto> get items;
/// Create a copy of FlashDealsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashDealsDtoCopyWith<FlashDealsDto> get copyWith => _$FlashDealsDtoCopyWithImpl<FlashDealsDto>(this as FlashDealsDto, _$identity);

  /// Serializes this FlashDealsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FlashDealsDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashDealsDto&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FlashDealsDto;
  return Object.hash(runtimeType,_this.endsAt,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as FlashDealsDto;
  return 'FlashDealsDto(endsAt: ${_this.endsAt}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $FlashDealsDtoCopyWith<$Res>  {
  factory $FlashDealsDtoCopyWith(FlashDealsDto value, $Res Function(FlashDealsDto) _then) = _$FlashDealsDtoCopyWithImpl;
@useResult
$Res call({
 String? endsAt, List<ProductCardDto> items
});




}
/// @nodoc
class _$FlashDealsDtoCopyWithImpl<$Res>
    implements $FlashDealsDtoCopyWith<$Res> {
  _$FlashDealsDtoCopyWithImpl(this._self, this._then);

  final FlashDealsDto _self;
  final $Res Function(FlashDealsDto) _then;

/// Create a copy of FlashDealsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? endsAt = freezed,Object? items = null,}) {
  return _then(FlashDealsDto(
endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProductCardDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashDealsDto].
extension FlashDealsDtoPatterns on FlashDealsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashDealsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashDealsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashDealsDto value)  $default,){
final _that = this;
switch (_that) {
case _FlashDealsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashDealsDto value)?  $default,){
final _that = this;
switch (_that) {
case _FlashDealsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? endsAt,  List<ProductCardDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashDealsDto() when $default != null:
return $default(_that.endsAt,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? endsAt,  List<ProductCardDto> items)  $default,) {final _that = this;
switch (_that) {
case _FlashDealsDto():
return $default(_that.endsAt,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? endsAt,  List<ProductCardDto> items)?  $default,) {final _that = this;
switch (_that) {
case _FlashDealsDto() when $default != null:
return $default(_that.endsAt,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlashDealsDto implements FlashDealsDto {
  const _FlashDealsDto({this.endsAt,  List<ProductCardDto> items = const []}): _items = items;
  factory _FlashDealsDto.fromJson(Map<String, dynamic> json) => _$FlashDealsDtoFromJson(json);

@override final  String? endsAt;
 final  List<ProductCardDto> _items;
@override@JsonKey() List<ProductCardDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of FlashDealsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashDealsDtoCopyWith<_FlashDealsDto> get copyWith => __$FlashDealsDtoCopyWithImpl<_FlashDealsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashDealsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashDealsDto&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,endsAt,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'FlashDealsDto(endsAt: $endsAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$FlashDealsDtoCopyWith<$Res> implements $FlashDealsDtoCopyWith<$Res> {
  factory _$FlashDealsDtoCopyWith(_FlashDealsDto value, $Res Function(_FlashDealsDto) _then) = __$FlashDealsDtoCopyWithImpl;
@override @useResult
$Res call({
 String? endsAt, List<ProductCardDto> items
});




}
/// @nodoc
class __$FlashDealsDtoCopyWithImpl<$Res>
    implements _$FlashDealsDtoCopyWith<$Res> {
  __$FlashDealsDtoCopyWithImpl(this._self, this._then);

  final _FlashDealsDto _self;
  final $Res Function(_FlashDealsDto) _then;

/// Create a copy of FlashDealsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? endsAt = freezed,Object? items = null,}) {
  return _then(_FlashDealsDto(
endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProductCardDto>,
  ));
}


}


/// @nodoc
mixin _$FacetDto {

 String get key; String get label; int get count;
/// Create a copy of FacetDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacetDtoCopyWith<FacetDto> get copyWith => _$FacetDtoCopyWithImpl<FacetDto>(this as FacetDto, _$identity);

  /// Serializes this FacetDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FacetDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacetDto&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.count, _this.count) || other.count == _this.count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FacetDto;
  return Object.hash(runtimeType,_this.key,_this.label,_this.count);
}

@override
String toString() {
  final _this = this as FacetDto;
  return 'FacetDto(key: ${_this.key}, label: ${_this.label}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $FacetDtoCopyWith<$Res>  {
  factory $FacetDtoCopyWith(FacetDto value, $Res Function(FacetDto) _then) = _$FacetDtoCopyWithImpl;
@useResult
$Res call({
 String key, String label, int count
});




}
/// @nodoc
class _$FacetDtoCopyWithImpl<$Res>
    implements $FacetDtoCopyWith<$Res> {
  _$FacetDtoCopyWithImpl(this._self, this._then);

  final FacetDto _self;
  final $Res Function(FacetDto) _then;

/// Create a copy of FacetDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,Object? count = null,}) {
  return _then(FacetDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FacetDto].
extension FacetDtoPatterns on FacetDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacetDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacetDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacetDto value)  $default,){
final _that = this;
switch (_that) {
case _FacetDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacetDto value)?  $default,){
final _that = this;
switch (_that) {
case _FacetDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String label,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacetDto() when $default != null:
return $default(_that.key,_that.label,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String label,  int count)  $default,) {final _that = this;
switch (_that) {
case _FacetDto():
return $default(_that.key,_that.label,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String label,  int count)?  $default,) {final _that = this;
switch (_that) {
case _FacetDto() when $default != null:
return $default(_that.key,_that.label,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FacetDto implements FacetDto {
  const _FacetDto({required this.key, required this.label, this.count = 0});
  factory _FacetDto.fromJson(Map<String, dynamic> json) => _$FacetDtoFromJson(json);

@override final  String key;
@override final  String label;
@override@JsonKey() final  int count;

/// Create a copy of FacetDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacetDtoCopyWith<_FacetDto> get copyWith => __$FacetDtoCopyWithImpl<_FacetDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FacetDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacetDto&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,label,count);
}

@override
String toString() {
    return 'FacetDto(key: $key, label: $label, count: $count)';
}


}

/// @nodoc
abstract mixin class _$FacetDtoCopyWith<$Res> implements $FacetDtoCopyWith<$Res> {
  factory _$FacetDtoCopyWith(_FacetDto value, $Res Function(_FacetDto) _then) = __$FacetDtoCopyWithImpl;
@override @useResult
$Res call({
 String key, String label, int count
});




}
/// @nodoc
class __$FacetDtoCopyWithImpl<$Res>
    implements _$FacetDtoCopyWith<$Res> {
  __$FacetDtoCopyWithImpl(this._self, this._then);

  final _FacetDto _self;
  final $Res Function(_FacetDto) _then;

/// Create a copy of FacetDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,Object? count = null,}) {
  return _then(_FacetDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SearchFacetsDto {

 List<FacetDto> get categories; List<FacetDto> get brands; List<FacetDto> get vendors;
/// Create a copy of SearchFacetsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchFacetsDtoCopyWith<SearchFacetsDto> get copyWith => _$SearchFacetsDtoCopyWithImpl<SearchFacetsDto>(this as SearchFacetsDto, _$identity);

  /// Serializes this SearchFacetsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SearchFacetsDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchFacetsDto&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&const DeepCollectionEquality().equals(other.brands, _this.brands)&&const DeepCollectionEquality().equals(other.vendors, _this.vendors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SearchFacetsDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.categories),const DeepCollectionEquality().hash(_this.brands),const DeepCollectionEquality().hash(_this.vendors));
}

@override
String toString() {
  final _this = this as SearchFacetsDto;
  return 'SearchFacetsDto(categories: ${_this.categories}, brands: ${_this.brands}, vendors: ${_this.vendors})';
}


}

/// @nodoc
abstract mixin class $SearchFacetsDtoCopyWith<$Res>  {
  factory $SearchFacetsDtoCopyWith(SearchFacetsDto value, $Res Function(SearchFacetsDto) _then) = _$SearchFacetsDtoCopyWithImpl;
@useResult
$Res call({
 List<FacetDto> categories, List<FacetDto> brands, List<FacetDto> vendors
});




}
/// @nodoc
class _$SearchFacetsDtoCopyWithImpl<$Res>
    implements $SearchFacetsDtoCopyWith<$Res> {
  _$SearchFacetsDtoCopyWithImpl(this._self, this._then);

  final SearchFacetsDto _self;
  final $Res Function(SearchFacetsDto) _then;

/// Create a copy of SearchFacetsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? brands = null,Object? vendors = null,}) {
  return _then(SearchFacetsDto(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<FacetDto>,brands: null == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as List<FacetDto>,vendors: null == vendors ? _self.vendors : vendors // ignore: cast_nullable_to_non_nullable
as List<FacetDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchFacetsDto].
extension SearchFacetsDtoPatterns on SearchFacetsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchFacetsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchFacetsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchFacetsDto value)  $default,){
final _that = this;
switch (_that) {
case _SearchFacetsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchFacetsDto value)?  $default,){
final _that = this;
switch (_that) {
case _SearchFacetsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FacetDto> categories,  List<FacetDto> brands,  List<FacetDto> vendors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchFacetsDto() when $default != null:
return $default(_that.categories,_that.brands,_that.vendors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FacetDto> categories,  List<FacetDto> brands,  List<FacetDto> vendors)  $default,) {final _that = this;
switch (_that) {
case _SearchFacetsDto():
return $default(_that.categories,_that.brands,_that.vendors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FacetDto> categories,  List<FacetDto> brands,  List<FacetDto> vendors)?  $default,) {final _that = this;
switch (_that) {
case _SearchFacetsDto() when $default != null:
return $default(_that.categories,_that.brands,_that.vendors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchFacetsDto implements SearchFacetsDto {
  const _SearchFacetsDto({ List<FacetDto> categories = const [],  List<FacetDto> brands = const [],  List<FacetDto> vendors = const []}): _categories = categories,_brands = brands,_vendors = vendors;
  factory _SearchFacetsDto.fromJson(Map<String, dynamic> json) => _$SearchFacetsDtoFromJson(json);

 final  List<FacetDto> _categories;
@override@JsonKey() List<FacetDto> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<FacetDto> _brands;
@override@JsonKey() List<FacetDto> get brands {
  if (_brands is EqualUnmodifiableListView) return _brands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brands);
}

 final  List<FacetDto> _vendors;
@override@JsonKey() List<FacetDto> get vendors {
  if (_vendors is EqualUnmodifiableListView) return _vendors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vendors);
}


/// Create a copy of SearchFacetsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchFacetsDtoCopyWith<_SearchFacetsDto> get copyWith => __$SearchFacetsDtoCopyWithImpl<_SearchFacetsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchFacetsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchFacetsDto&&const DeepCollectionEquality().equals(other.categories, _categories)&&const DeepCollectionEquality().equals(other.brands, _brands)&&const DeepCollectionEquality().equals(other.vendors, _vendors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_brands),const DeepCollectionEquality().hash(_vendors));
}

@override
String toString() {
    return 'SearchFacetsDto(categories: $categories, brands: $brands, vendors: $vendors)';
}


}

/// @nodoc
abstract mixin class _$SearchFacetsDtoCopyWith<$Res> implements $SearchFacetsDtoCopyWith<$Res> {
  factory _$SearchFacetsDtoCopyWith(_SearchFacetsDto value, $Res Function(_SearchFacetsDto) _then) = __$SearchFacetsDtoCopyWithImpl;
@override @useResult
$Res call({
 List<FacetDto> categories, List<FacetDto> brands, List<FacetDto> vendors
});




}
/// @nodoc
class __$SearchFacetsDtoCopyWithImpl<$Res>
    implements _$SearchFacetsDtoCopyWith<$Res> {
  __$SearchFacetsDtoCopyWithImpl(this._self, this._then);

  final _SearchFacetsDto _self;
  final $Res Function(_SearchFacetsDto) _then;

/// Create a copy of SearchFacetsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? brands = null,Object? vendors = null,}) {
  return _then(_SearchFacetsDto(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<FacetDto>,brands: null == brands ? _self._brands : brands // ignore: cast_nullable_to_non_nullable
as List<FacetDto>,vendors: null == vendors ? _self._vendors : vendors // ignore: cast_nullable_to_non_nullable
as List<FacetDto>,
  ));
}


}


/// @nodoc
mixin _$ProductSearchDto {

 List<ProductCardDto> get items; String? get nextCursor; int get total; bool? get brandHasProducts; SearchFacetsDto get facets;
/// Create a copy of ProductSearchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSearchDtoCopyWith<ProductSearchDto> get copyWith => _$ProductSearchDtoCopyWithImpl<ProductSearchDto>(this as ProductSearchDto, _$identity);

  /// Serializes this ProductSearchDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductSearchDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSearchDto&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.nextCursor, _this.nextCursor) || other.nextCursor == _this.nextCursor)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.brandHasProducts, _this.brandHasProducts) || other.brandHasProducts == _this.brandHasProducts)&&(identical(other.facets, _this.facets) || other.facets == _this.facets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductSearchDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.nextCursor,_this.total,_this.brandHasProducts,_this.facets);
}

@override
String toString() {
  final _this = this as ProductSearchDto;
  return 'ProductSearchDto(items: ${_this.items}, nextCursor: ${_this.nextCursor}, total: ${_this.total}, brandHasProducts: ${_this.brandHasProducts}, facets: ${_this.facets})';
}


}

/// @nodoc
abstract mixin class $ProductSearchDtoCopyWith<$Res>  {
  factory $ProductSearchDtoCopyWith(ProductSearchDto value, $Res Function(ProductSearchDto) _then) = _$ProductSearchDtoCopyWithImpl;
@useResult
$Res call({
 List<ProductCardDto> items, String? nextCursor, int total, bool? brandHasProducts, SearchFacetsDto facets
});


$SearchFacetsDtoCopyWith<$Res> get facets;

}
/// @nodoc
class _$ProductSearchDtoCopyWithImpl<$Res>
    implements $ProductSearchDtoCopyWith<$Res> {
  _$ProductSearchDtoCopyWithImpl(this._self, this._then);

  final ProductSearchDto _self;
  final $Res Function(ProductSearchDto) _then;

/// Create a copy of ProductSearchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nextCursor = freezed,Object? total = null,Object? brandHasProducts = freezed,Object? facets = null,}) {
  return _then(ProductSearchDto(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProductCardDto>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,brandHasProducts: freezed == brandHasProducts ? _self.brandHasProducts : brandHasProducts // ignore: cast_nullable_to_non_nullable
as bool?,facets: null == facets ? _self.facets : facets // ignore: cast_nullable_to_non_nullable
as SearchFacetsDto,
  ));
}
/// Create a copy of ProductSearchDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchFacetsDtoCopyWith<$Res> get facets {
  
  return $SearchFacetsDtoCopyWith<$Res>(_self.facets, (value) {
    return _then(_self.copyWith(facets: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductSearchDto].
extension ProductSearchDtoPatterns on ProductSearchDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSearchDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSearchDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSearchDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductSearchDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSearchDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSearchDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductCardDto> items,  String? nextCursor,  int total,  bool? brandHasProducts,  SearchFacetsDto facets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSearchDto() when $default != null:
return $default(_that.items,_that.nextCursor,_that.total,_that.brandHasProducts,_that.facets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductCardDto> items,  String? nextCursor,  int total,  bool? brandHasProducts,  SearchFacetsDto facets)  $default,) {final _that = this;
switch (_that) {
case _ProductSearchDto():
return $default(_that.items,_that.nextCursor,_that.total,_that.brandHasProducts,_that.facets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductCardDto> items,  String? nextCursor,  int total,  bool? brandHasProducts,  SearchFacetsDto facets)?  $default,) {final _that = this;
switch (_that) {
case _ProductSearchDto() when $default != null:
return $default(_that.items,_that.nextCursor,_that.total,_that.brandHasProducts,_that.facets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSearchDto implements ProductSearchDto {
  const _ProductSearchDto({ List<ProductCardDto> items = const [], this.nextCursor, this.total = 0, this.brandHasProducts, this.facets = const SearchFacetsDto()}): _items = items;
  factory _ProductSearchDto.fromJson(Map<String, dynamic> json) => _$ProductSearchDtoFromJson(json);

 final  List<ProductCardDto> _items;
@override@JsonKey() List<ProductCardDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? nextCursor;
@override@JsonKey() final  int total;
@override final  bool? brandHasProducts;
@override@JsonKey() final  SearchFacetsDto facets;

/// Create a copy of ProductSearchDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSearchDtoCopyWith<_ProductSearchDto> get copyWith => __$ProductSearchDtoCopyWithImpl<_ProductSearchDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSearchDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSearchDto&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.total, total) || other.total == total)&&(identical(other.brandHasProducts, brandHasProducts) || other.brandHasProducts == brandHasProducts)&&(identical(other.facets, facets) || other.facets == facets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nextCursor,total,brandHasProducts,facets);
}

@override
String toString() {
    return 'ProductSearchDto(items: $items, nextCursor: $nextCursor, total: $total, brandHasProducts: $brandHasProducts, facets: $facets)';
}


}

/// @nodoc
abstract mixin class _$ProductSearchDtoCopyWith<$Res> implements $ProductSearchDtoCopyWith<$Res> {
  factory _$ProductSearchDtoCopyWith(_ProductSearchDto value, $Res Function(_ProductSearchDto) _then) = __$ProductSearchDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCardDto> items, String? nextCursor, int total, bool? brandHasProducts, SearchFacetsDto facets
});


@override $SearchFacetsDtoCopyWith<$Res> get facets;

}
/// @nodoc
class __$ProductSearchDtoCopyWithImpl<$Res>
    implements _$ProductSearchDtoCopyWith<$Res> {
  __$ProductSearchDtoCopyWithImpl(this._self, this._then);

  final _ProductSearchDto _self;
  final $Res Function(_ProductSearchDto) _then;

/// Create a copy of ProductSearchDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextCursor = freezed,Object? total = null,Object? brandHasProducts = freezed,Object? facets = null,}) {
  return _then(_ProductSearchDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProductCardDto>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,brandHasProducts: freezed == brandHasProducts ? _self.brandHasProducts : brandHasProducts // ignore: cast_nullable_to_non_nullable
as bool?,facets: null == facets ? _self.facets : facets // ignore: cast_nullable_to_non_nullable
as SearchFacetsDto,
  ));
}

/// Create a copy of ProductSearchDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchFacetsDtoCopyWith<$Res> get facets {
  
  return $SearchFacetsDtoCopyWith<$Res>(_self.facets, (value) {
    return _then(_self.copyWith(facets: value));
  });
}
}


/// @nodoc
mixin _$SwatchDto {

 String get value; String get label; String? get hex; bool get available;
/// Create a copy of SwatchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwatchDtoCopyWith<SwatchDto> get copyWith => _$SwatchDtoCopyWithImpl<SwatchDto>(this as SwatchDto, _$identity);

  /// Serializes this SwatchDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SwatchDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwatchDto&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.hex, _this.hex) || other.hex == _this.hex)&&(identical(other.available, _this.available) || other.available == _this.available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SwatchDto;
  return Object.hash(runtimeType,_this.value,_this.label,_this.hex,_this.available);
}

@override
String toString() {
  final _this = this as SwatchDto;
  return 'SwatchDto(value: ${_this.value}, label: ${_this.label}, hex: ${_this.hex}, available: ${_this.available})';
}


}

/// @nodoc
abstract mixin class $SwatchDtoCopyWith<$Res>  {
  factory $SwatchDtoCopyWith(SwatchDto value, $Res Function(SwatchDto) _then) = _$SwatchDtoCopyWithImpl;
@useResult
$Res call({
 String value, String label, String? hex, bool available
});




}
/// @nodoc
class _$SwatchDtoCopyWithImpl<$Res>
    implements $SwatchDtoCopyWith<$Res> {
  _$SwatchDtoCopyWithImpl(this._self, this._then);

  final SwatchDto _self;
  final $Res Function(SwatchDto) _then;

/// Create a copy of SwatchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,Object? hex = freezed,Object? available = null,}) {
  return _then(SwatchDto(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,hex: freezed == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String?,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SwatchDto].
extension SwatchDtoPatterns on SwatchDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SwatchDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwatchDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SwatchDto value)  $default,){
final _that = this;
switch (_that) {
case _SwatchDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SwatchDto value)?  $default,){
final _that = this;
switch (_that) {
case _SwatchDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String label,  String? hex,  bool available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwatchDto() when $default != null:
return $default(_that.value,_that.label,_that.hex,_that.available);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String label,  String? hex,  bool available)  $default,) {final _that = this;
switch (_that) {
case _SwatchDto():
return $default(_that.value,_that.label,_that.hex,_that.available);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String label,  String? hex,  bool available)?  $default,) {final _that = this;
switch (_that) {
case _SwatchDto() when $default != null:
return $default(_that.value,_that.label,_that.hex,_that.available);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SwatchDto implements SwatchDto {
  const _SwatchDto({required this.value, required this.label, this.hex, this.available = true});
  factory _SwatchDto.fromJson(Map<String, dynamic> json) => _$SwatchDtoFromJson(json);

@override final  String value;
@override final  String label;
@override final  String? hex;
@override@JsonKey() final  bool available;

/// Create a copy of SwatchDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwatchDtoCopyWith<_SwatchDto> get copyWith => __$SwatchDtoCopyWithImpl<_SwatchDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SwatchDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwatchDto&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,value,label,hex,available);
}

@override
String toString() {
    return 'SwatchDto(value: $value, label: $label, hex: $hex, available: $available)';
}


}

/// @nodoc
abstract mixin class _$SwatchDtoCopyWith<$Res> implements $SwatchDtoCopyWith<$Res> {
  factory _$SwatchDtoCopyWith(_SwatchDto value, $Res Function(_SwatchDto) _then) = __$SwatchDtoCopyWithImpl;
@override @useResult
$Res call({
 String value, String label, String? hex, bool available
});




}
/// @nodoc
class __$SwatchDtoCopyWithImpl<$Res>
    implements _$SwatchDtoCopyWith<$Res> {
  __$SwatchDtoCopyWithImpl(this._self, this._then);

  final _SwatchDto _self;
  final $Res Function(_SwatchDto) _then;

/// Create a copy of SwatchDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,Object? hex = freezed,Object? available = null,}) {
  return _then(_SwatchDto(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,hex: freezed == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String?,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$OptionGroupDto {

 String get key; String get label; List<SwatchDto> get options;
/// Create a copy of OptionGroupDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptionGroupDtoCopyWith<OptionGroupDto> get copyWith => _$OptionGroupDtoCopyWithImpl<OptionGroupDto>(this as OptionGroupDto, _$identity);

  /// Serializes this OptionGroupDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OptionGroupDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptionGroupDto&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.label, _this.label) || other.label == _this.label)&&const DeepCollectionEquality().equals(other.options, _this.options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OptionGroupDto;
  return Object.hash(runtimeType,_this.key,_this.label,const DeepCollectionEquality().hash(_this.options));
}

@override
String toString() {
  final _this = this as OptionGroupDto;
  return 'OptionGroupDto(key: ${_this.key}, label: ${_this.label}, options: ${_this.options})';
}


}

/// @nodoc
abstract mixin class $OptionGroupDtoCopyWith<$Res>  {
  factory $OptionGroupDtoCopyWith(OptionGroupDto value, $Res Function(OptionGroupDto) _then) = _$OptionGroupDtoCopyWithImpl;
@useResult
$Res call({
 String key, String label, List<SwatchDto> options
});




}
/// @nodoc
class _$OptionGroupDtoCopyWithImpl<$Res>
    implements $OptionGroupDtoCopyWith<$Res> {
  _$OptionGroupDtoCopyWithImpl(this._self, this._then);

  final OptionGroupDto _self;
  final $Res Function(OptionGroupDto) _then;

/// Create a copy of OptionGroupDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,Object? options = null,}) {
  return _then(OptionGroupDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<SwatchDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [OptionGroupDto].
extension OptionGroupDtoPatterns on OptionGroupDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptionGroupDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptionGroupDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptionGroupDto value)  $default,){
final _that = this;
switch (_that) {
case _OptionGroupDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptionGroupDto value)?  $default,){
final _that = this;
switch (_that) {
case _OptionGroupDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String label,  List<SwatchDto> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptionGroupDto() when $default != null:
return $default(_that.key,_that.label,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String label,  List<SwatchDto> options)  $default,) {final _that = this;
switch (_that) {
case _OptionGroupDto():
return $default(_that.key,_that.label,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String label,  List<SwatchDto> options)?  $default,) {final _that = this;
switch (_that) {
case _OptionGroupDto() when $default != null:
return $default(_that.key,_that.label,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptionGroupDto implements OptionGroupDto {
  const _OptionGroupDto({required this.key, required this.label,  List<SwatchDto> options = const []}): _options = options;
  factory _OptionGroupDto.fromJson(Map<String, dynamic> json) => _$OptionGroupDtoFromJson(json);

@override final  String key;
@override final  String label;
 final  List<SwatchDto> _options;
@override@JsonKey() List<SwatchDto> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of OptionGroupDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptionGroupDtoCopyWith<_OptionGroupDto> get copyWith => __$OptionGroupDtoCopyWithImpl<_OptionGroupDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptionGroupDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptionGroupDto&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,label,const DeepCollectionEquality().hash(_options));
}

@override
String toString() {
    return 'OptionGroupDto(key: $key, label: $label, options: $options)';
}


}

/// @nodoc
abstract mixin class _$OptionGroupDtoCopyWith<$Res> implements $OptionGroupDtoCopyWith<$Res> {
  factory _$OptionGroupDtoCopyWith(_OptionGroupDto value, $Res Function(_OptionGroupDto) _then) = __$OptionGroupDtoCopyWithImpl;
@override @useResult
$Res call({
 String key, String label, List<SwatchDto> options
});




}
/// @nodoc
class __$OptionGroupDtoCopyWithImpl<$Res>
    implements _$OptionGroupDtoCopyWith<$Res> {
  __$OptionGroupDtoCopyWithImpl(this._self, this._then);

  final _OptionGroupDto _self;
  final $Res Function(_OptionGroupDto) _then;

/// Create a copy of OptionGroupDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,Object? options = null,}) {
  return _then(_OptionGroupDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<SwatchDto>,
  ));
}


}


/// @nodoc
mixin _$VariantDto {

 String get sku; String get name; Map<String, String> get picks; Money get price; Money? get compareAt; bool get inStock; int? get availableQty; String get stockText;
/// Create a copy of VariantDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantDtoCopyWith<VariantDto> get copyWith => _$VariantDtoCopyWithImpl<VariantDto>(this as VariantDto, _$identity);

  /// Serializes this VariantDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VariantDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariantDto&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.picks, _this.picks)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.compareAt, _this.compareAt) || other.compareAt == _this.compareAt)&&(identical(other.inStock, _this.inStock) || other.inStock == _this.inStock)&&(identical(other.availableQty, _this.availableQty) || other.availableQty == _this.availableQty)&&(identical(other.stockText, _this.stockText) || other.stockText == _this.stockText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VariantDto;
  return Object.hash(runtimeType,_this.sku,_this.name,const DeepCollectionEquality().hash(_this.picks),_this.price,_this.compareAt,_this.inStock,_this.availableQty,_this.stockText);
}

@override
String toString() {
  final _this = this as VariantDto;
  return 'VariantDto(sku: ${_this.sku}, name: ${_this.name}, picks: ${_this.picks}, price: ${_this.price}, compareAt: ${_this.compareAt}, inStock: ${_this.inStock}, availableQty: ${_this.availableQty}, stockText: ${_this.stockText})';
}


}

/// @nodoc
abstract mixin class $VariantDtoCopyWith<$Res>  {
  factory $VariantDtoCopyWith(VariantDto value, $Res Function(VariantDto) _then) = _$VariantDtoCopyWithImpl;
@useResult
$Res call({
 String sku, String name, Map<String, String> picks, Money price, Money? compareAt, bool inStock, int? availableQty, String stockText
});


$MoneyCopyWith<$Res> get price;$MoneyCopyWith<$Res>? get compareAt;

}
/// @nodoc
class _$VariantDtoCopyWithImpl<$Res>
    implements $VariantDtoCopyWith<$Res> {
  _$VariantDtoCopyWithImpl(this._self, this._then);

  final VariantDto _self;
  final $Res Function(VariantDto) _then;

/// Create a copy of VariantDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sku = null,Object? name = null,Object? picks = null,Object? price = null,Object? compareAt = freezed,Object? inStock = null,Object? availableQty = freezed,Object? stockText = null,}) {
  return _then(VariantDto(
sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picks: null == picks ? _self.picks : picks // ignore: cast_nullable_to_non_nullable
as Map<String, String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,compareAt: freezed == compareAt ? _self.compareAt : compareAt // ignore: cast_nullable_to_non_nullable
as Money?,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,availableQty: freezed == availableQty ? _self.availableQty : availableQty // ignore: cast_nullable_to_non_nullable
as int?,stockText: null == stockText ? _self.stockText : stockText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of VariantDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of VariantDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get compareAt {
    if (_self.compareAt == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.compareAt!, (value) {
    return _then(_self.copyWith(compareAt: value));
  });
}
}


/// Adds pattern-matching-related methods to [VariantDto].
extension VariantDtoPatterns on VariantDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VariantDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VariantDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VariantDto value)  $default,){
final _that = this;
switch (_that) {
case _VariantDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VariantDto value)?  $default,){
final _that = this;
switch (_that) {
case _VariantDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sku,  String name,  Map<String, String> picks,  Money price,  Money? compareAt,  bool inStock,  int? availableQty,  String stockText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VariantDto() when $default != null:
return $default(_that.sku,_that.name,_that.picks,_that.price,_that.compareAt,_that.inStock,_that.availableQty,_that.stockText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sku,  String name,  Map<String, String> picks,  Money price,  Money? compareAt,  bool inStock,  int? availableQty,  String stockText)  $default,) {final _that = this;
switch (_that) {
case _VariantDto():
return $default(_that.sku,_that.name,_that.picks,_that.price,_that.compareAt,_that.inStock,_that.availableQty,_that.stockText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sku,  String name,  Map<String, String> picks,  Money price,  Money? compareAt,  bool inStock,  int? availableQty,  String stockText)?  $default,) {final _that = this;
switch (_that) {
case _VariantDto() when $default != null:
return $default(_that.sku,_that.name,_that.picks,_that.price,_that.compareAt,_that.inStock,_that.availableQty,_that.stockText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VariantDto implements VariantDto {
  const _VariantDto({required this.sku, required this.name,  Map<String, String> picks = const {}, required this.price, this.compareAt, required this.inStock, this.availableQty, required this.stockText}): _picks = picks;
  factory _VariantDto.fromJson(Map<String, dynamic> json) => _$VariantDtoFromJson(json);

@override final  String sku;
@override final  String name;
 final  Map<String, String> _picks;
@override@JsonKey() Map<String, String> get picks {
  if (_picks is EqualUnmodifiableMapView) return _picks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_picks);
}

@override final  Money price;
@override final  Money? compareAt;
@override final  bool inStock;
@override final  int? availableQty;
@override final  String stockText;

/// Create a copy of VariantDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantDtoCopyWith<_VariantDto> get copyWith => __$VariantDtoCopyWithImpl<_VariantDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariantDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantDto&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.picks, _picks)&&(identical(other.price, price) || other.price == price)&&(identical(other.compareAt, compareAt) || other.compareAt == compareAt)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.availableQty, availableQty) || other.availableQty == availableQty)&&(identical(other.stockText, stockText) || other.stockText == stockText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sku,name,const DeepCollectionEquality().hash(_picks),price,compareAt,inStock,availableQty,stockText);
}

@override
String toString() {
    return 'VariantDto(sku: $sku, name: $name, picks: $picks, price: $price, compareAt: $compareAt, inStock: $inStock, availableQty: $availableQty, stockText: $stockText)';
}


}

/// @nodoc
abstract mixin class _$VariantDtoCopyWith<$Res> implements $VariantDtoCopyWith<$Res> {
  factory _$VariantDtoCopyWith(_VariantDto value, $Res Function(_VariantDto) _then) = __$VariantDtoCopyWithImpl;
@override @useResult
$Res call({
 String sku, String name, Map<String, String> picks, Money price, Money? compareAt, bool inStock, int? availableQty, String stockText
});


@override $MoneyCopyWith<$Res> get price;@override $MoneyCopyWith<$Res>? get compareAt;

}
/// @nodoc
class __$VariantDtoCopyWithImpl<$Res>
    implements _$VariantDtoCopyWith<$Res> {
  __$VariantDtoCopyWithImpl(this._self, this._then);

  final _VariantDto _self;
  final $Res Function(_VariantDto) _then;

/// Create a copy of VariantDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sku = null,Object? name = null,Object? picks = null,Object? price = null,Object? compareAt = freezed,Object? inStock = null,Object? availableQty = freezed,Object? stockText = null,}) {
  return _then(_VariantDto(
sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picks: null == picks ? _self._picks : picks // ignore: cast_nullable_to_non_nullable
as Map<String, String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,compareAt: freezed == compareAt ? _self.compareAt : compareAt // ignore: cast_nullable_to_non_nullable
as Money?,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,availableQty: freezed == availableQty ? _self.availableQty : availableQty // ignore: cast_nullable_to_non_nullable
as int?,stockText: null == stockText ? _self.stockText : stockText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of VariantDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of VariantDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get compareAt {
    if (_self.compareAt == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.compareAt!, (value) {
    return _then(_self.copyWith(compareAt: value));
  });
}
}


/// @nodoc
mixin _$SpecDto {

 String get label; String get value;
/// Create a copy of SpecDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecDtoCopyWith<SpecDto> get copyWith => _$SpecDtoCopyWithImpl<SpecDto>(this as SpecDto, _$identity);

  /// Serializes this SpecDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SpecDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecDto&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.value, _this.value) || other.value == _this.value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SpecDto;
  return Object.hash(runtimeType,_this.label,_this.value);
}

@override
String toString() {
  final _this = this as SpecDto;
  return 'SpecDto(label: ${_this.label}, value: ${_this.value})';
}


}

/// @nodoc
abstract mixin class $SpecDtoCopyWith<$Res>  {
  factory $SpecDtoCopyWith(SpecDto value, $Res Function(SpecDto) _then) = _$SpecDtoCopyWithImpl;
@useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class _$SpecDtoCopyWithImpl<$Res>
    implements $SpecDtoCopyWith<$Res> {
  _$SpecDtoCopyWithImpl(this._self, this._then);

  final SpecDto _self;
  final $Res Function(SpecDto) _then;

/// Create a copy of SpecDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,}) {
  return _then(SpecDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpecDto].
extension SpecDtoPatterns on SpecDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecDto value)  $default,){
final _that = this;
switch (_that) {
case _SpecDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecDto value)?  $default,){
final _that = this;
switch (_that) {
case _SpecDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecDto() when $default != null:
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value)  $default,) {final _that = this;
switch (_that) {
case _SpecDto():
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SpecDto() when $default != null:
return $default(_that.label,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpecDto implements SpecDto {
  const _SpecDto({required this.label, required this.value});
  factory _SpecDto.fromJson(Map<String, dynamic> json) => _$SpecDtoFromJson(json);

@override final  String label;
@override final  String value;

/// Create a copy of SpecDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecDtoCopyWith<_SpecDto> get copyWith => __$SpecDtoCopyWithImpl<_SpecDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecDto&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,value);
}

@override
String toString() {
    return 'SpecDto(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SpecDtoCopyWith<$Res> implements $SpecDtoCopyWith<$Res> {
  factory _$SpecDtoCopyWith(_SpecDto value, $Res Function(_SpecDto) _then) = __$SpecDtoCopyWithImpl;
@override @useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class __$SpecDtoCopyWithImpl<$Res>
    implements _$SpecDtoCopyWith<$Res> {
  __$SpecDtoCopyWithImpl(this._self, this._then);

  final _SpecDto _self;
  final $Res Function(_SpecDto) _then;

/// Create a copy of SpecDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,}) {
  return _then(_SpecDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SellerDto {

 String get id; String get name; String get initials; String get color; String get backgroundColor;
/// Create a copy of SellerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerDtoCopyWith<SellerDto> get copyWith => _$SellerDtoCopyWithImpl<SellerDto>(this as SellerDto, _$identity);

  /// Serializes this SellerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SellerDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.initials, _this.initials) || other.initials == _this.initials)&&(identical(other.color, _this.color) || other.color == _this.color)&&(identical(other.backgroundColor, _this.backgroundColor) || other.backgroundColor == _this.backgroundColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SellerDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.initials,_this.color,_this.backgroundColor);
}

@override
String toString() {
  final _this = this as SellerDto;
  return 'SellerDto(id: ${_this.id}, name: ${_this.name}, initials: ${_this.initials}, color: ${_this.color}, backgroundColor: ${_this.backgroundColor})';
}


}

/// @nodoc
abstract mixin class $SellerDtoCopyWith<$Res>  {
  factory $SellerDtoCopyWith(SellerDto value, $Res Function(SellerDto) _then) = _$SellerDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String initials, String color, String backgroundColor
});




}
/// @nodoc
class _$SellerDtoCopyWithImpl<$Res>
    implements $SellerDtoCopyWith<$Res> {
  _$SellerDtoCopyWithImpl(this._self, this._then);

  final SellerDto _self;
  final $Res Function(SellerDto) _then;

/// Create a copy of SellerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? initials = null,Object? color = null,Object? backgroundColor = null,}) {
  return _then(SellerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,initials: null == initials ? _self.initials : initials // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerDto].
extension SellerDtoPatterns on SellerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerDto value)  $default,){
final _that = this;
switch (_that) {
case _SellerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerDto value)?  $default,){
final _that = this;
switch (_that) {
case _SellerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String initials,  String color,  String backgroundColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerDto() when $default != null:
return $default(_that.id,_that.name,_that.initials,_that.color,_that.backgroundColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String initials,  String color,  String backgroundColor)  $default,) {final _that = this;
switch (_that) {
case _SellerDto():
return $default(_that.id,_that.name,_that.initials,_that.color,_that.backgroundColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String initials,  String color,  String backgroundColor)?  $default,) {final _that = this;
switch (_that) {
case _SellerDto() when $default != null:
return $default(_that.id,_that.name,_that.initials,_that.color,_that.backgroundColor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerDto implements SellerDto {
  const _SellerDto({required this.id, required this.name, required this.initials, required this.color, required this.backgroundColor});
  factory _SellerDto.fromJson(Map<String, dynamic> json) => _$SellerDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String initials;
@override final  String color;
@override final  String backgroundColor;

/// Create a copy of SellerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerDtoCopyWith<_SellerDto> get copyWith => __$SellerDtoCopyWithImpl<_SellerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.initials, initials) || other.initials == initials)&&(identical(other.color, color) || other.color == color)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,initials,color,backgroundColor);
}

@override
String toString() {
    return 'SellerDto(id: $id, name: $name, initials: $initials, color: $color, backgroundColor: $backgroundColor)';
}


}

/// @nodoc
abstract mixin class _$SellerDtoCopyWith<$Res> implements $SellerDtoCopyWith<$Res> {
  factory _$SellerDtoCopyWith(_SellerDto value, $Res Function(_SellerDto) _then) = __$SellerDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String initials, String color, String backgroundColor
});




}
/// @nodoc
class __$SellerDtoCopyWithImpl<$Res>
    implements _$SellerDtoCopyWith<$Res> {
  __$SellerDtoCopyWithImpl(this._self, this._then);

  final _SellerDto _self;
  final $Res Function(_SellerDto) _then;

/// Create a copy of SellerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? initials = null,Object? color = null,Object? backgroundColor = null,}) {
  return _then(_SellerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,initials: null == initials ? _self.initials : initials // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RatingBucketDto {

 int get stars; int get count; num get percent;
/// Create a copy of RatingBucketDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingBucketDtoCopyWith<RatingBucketDto> get copyWith => _$RatingBucketDtoCopyWithImpl<RatingBucketDto>(this as RatingBucketDto, _$identity);

  /// Serializes this RatingBucketDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RatingBucketDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingBucketDto&&(identical(other.stars, _this.stars) || other.stars == _this.stars)&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.percent, _this.percent) || other.percent == _this.percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RatingBucketDto;
  return Object.hash(runtimeType,_this.stars,_this.count,_this.percent);
}

@override
String toString() {
  final _this = this as RatingBucketDto;
  return 'RatingBucketDto(stars: ${_this.stars}, count: ${_this.count}, percent: ${_this.percent})';
}


}

/// @nodoc
abstract mixin class $RatingBucketDtoCopyWith<$Res>  {
  factory $RatingBucketDtoCopyWith(RatingBucketDto value, $Res Function(RatingBucketDto) _then) = _$RatingBucketDtoCopyWithImpl;
@useResult
$Res call({
 int stars, int count, num percent
});




}
/// @nodoc
class _$RatingBucketDtoCopyWithImpl<$Res>
    implements $RatingBucketDtoCopyWith<$Res> {
  _$RatingBucketDtoCopyWithImpl(this._self, this._then);

  final RatingBucketDto _self;
  final $Res Function(RatingBucketDto) _then;

/// Create a copy of RatingBucketDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stars = null,Object? count = null,Object? percent = null,}) {
  return _then(RatingBucketDto(
stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingBucketDto].
extension RatingBucketDtoPatterns on RatingBucketDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingBucketDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingBucketDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingBucketDto value)  $default,){
final _that = this;
switch (_that) {
case _RatingBucketDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingBucketDto value)?  $default,){
final _that = this;
switch (_that) {
case _RatingBucketDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stars,  int count,  num percent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingBucketDto() when $default != null:
return $default(_that.stars,_that.count,_that.percent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stars,  int count,  num percent)  $default,) {final _that = this;
switch (_that) {
case _RatingBucketDto():
return $default(_that.stars,_that.count,_that.percent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stars,  int count,  num percent)?  $default,) {final _that = this;
switch (_that) {
case _RatingBucketDto() when $default != null:
return $default(_that.stars,_that.count,_that.percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingBucketDto implements RatingBucketDto {
  const _RatingBucketDto({required this.stars, this.count = 0, this.percent = 0});
  factory _RatingBucketDto.fromJson(Map<String, dynamic> json) => _$RatingBucketDtoFromJson(json);

@override final  int stars;
@override@JsonKey() final  int count;
@override@JsonKey() final  num percent;

/// Create a copy of RatingBucketDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingBucketDtoCopyWith<_RatingBucketDto> get copyWith => __$RatingBucketDtoCopyWithImpl<_RatingBucketDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingBucketDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingBucketDto&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,stars,count,percent);
}

@override
String toString() {
    return 'RatingBucketDto(stars: $stars, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class _$RatingBucketDtoCopyWith<$Res> implements $RatingBucketDtoCopyWith<$Res> {
  factory _$RatingBucketDtoCopyWith(_RatingBucketDto value, $Res Function(_RatingBucketDto) _then) = __$RatingBucketDtoCopyWithImpl;
@override @useResult
$Res call({
 int stars, int count, num percent
});




}
/// @nodoc
class __$RatingBucketDtoCopyWithImpl<$Res>
    implements _$RatingBucketDtoCopyWith<$Res> {
  __$RatingBucketDtoCopyWithImpl(this._self, this._then);

  final _RatingBucketDto _self;
  final $Res Function(_RatingBucketDto) _then;

/// Create a copy of RatingBucketDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stars = null,Object? count = null,Object? percent = null,}) {
  return _then(_RatingBucketDto(
stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$RatingSummaryDto {

 num get average; int get count; List<RatingBucketDto> get distribution;
/// Create a copy of RatingSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingSummaryDtoCopyWith<RatingSummaryDto> get copyWith => _$RatingSummaryDtoCopyWithImpl<RatingSummaryDto>(this as RatingSummaryDto, _$identity);

  /// Serializes this RatingSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RatingSummaryDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingSummaryDto&&(identical(other.average, _this.average) || other.average == _this.average)&&(identical(other.count, _this.count) || other.count == _this.count)&&const DeepCollectionEquality().equals(other.distribution, _this.distribution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RatingSummaryDto;
  return Object.hash(runtimeType,_this.average,_this.count,const DeepCollectionEquality().hash(_this.distribution));
}

@override
String toString() {
  final _this = this as RatingSummaryDto;
  return 'RatingSummaryDto(average: ${_this.average}, count: ${_this.count}, distribution: ${_this.distribution})';
}


}

/// @nodoc
abstract mixin class $RatingSummaryDtoCopyWith<$Res>  {
  factory $RatingSummaryDtoCopyWith(RatingSummaryDto value, $Res Function(RatingSummaryDto) _then) = _$RatingSummaryDtoCopyWithImpl;
@useResult
$Res call({
 num average, int count, List<RatingBucketDto> distribution
});




}
/// @nodoc
class _$RatingSummaryDtoCopyWithImpl<$Res>
    implements $RatingSummaryDtoCopyWith<$Res> {
  _$RatingSummaryDtoCopyWithImpl(this._self, this._then);

  final RatingSummaryDto _self;
  final $Res Function(RatingSummaryDto) _then;

/// Create a copy of RatingSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? average = null,Object? count = null,Object? distribution = null,}) {
  return _then(RatingSummaryDto(
average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as num,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,distribution: null == distribution ? _self.distribution : distribution // ignore: cast_nullable_to_non_nullable
as List<RatingBucketDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingSummaryDto].
extension RatingSummaryDtoPatterns on RatingSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _RatingSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _RatingSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num average,  int count,  List<RatingBucketDto> distribution)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingSummaryDto() when $default != null:
return $default(_that.average,_that.count,_that.distribution);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num average,  int count,  List<RatingBucketDto> distribution)  $default,) {final _that = this;
switch (_that) {
case _RatingSummaryDto():
return $default(_that.average,_that.count,_that.distribution);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num average,  int count,  List<RatingBucketDto> distribution)?  $default,) {final _that = this;
switch (_that) {
case _RatingSummaryDto() when $default != null:
return $default(_that.average,_that.count,_that.distribution);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingSummaryDto implements RatingSummaryDto {
  const _RatingSummaryDto({this.average = 0, this.count = 0,  List<RatingBucketDto> distribution = const []}): _distribution = distribution;
  factory _RatingSummaryDto.fromJson(Map<String, dynamic> json) => _$RatingSummaryDtoFromJson(json);

@override@JsonKey() final  num average;
@override@JsonKey() final  int count;
 final  List<RatingBucketDto> _distribution;
@override@JsonKey() List<RatingBucketDto> get distribution {
  if (_distribution is EqualUnmodifiableListView) return _distribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_distribution);
}


/// Create a copy of RatingSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingSummaryDtoCopyWith<_RatingSummaryDto> get copyWith => __$RatingSummaryDtoCopyWithImpl<_RatingSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingSummaryDto&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.distribution, _distribution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,average,count,const DeepCollectionEquality().hash(_distribution));
}

@override
String toString() {
    return 'RatingSummaryDto(average: $average, count: $count, distribution: $distribution)';
}


}

/// @nodoc
abstract mixin class _$RatingSummaryDtoCopyWith<$Res> implements $RatingSummaryDtoCopyWith<$Res> {
  factory _$RatingSummaryDtoCopyWith(_RatingSummaryDto value, $Res Function(_RatingSummaryDto) _then) = __$RatingSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 num average, int count, List<RatingBucketDto> distribution
});




}
/// @nodoc
class __$RatingSummaryDtoCopyWithImpl<$Res>
    implements _$RatingSummaryDtoCopyWith<$Res> {
  __$RatingSummaryDtoCopyWithImpl(this._self, this._then);

  final _RatingSummaryDto _self;
  final $Res Function(_RatingSummaryDto) _then;

/// Create a copy of RatingSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? average = null,Object? count = null,Object? distribution = null,}) {
  return _then(_RatingSummaryDto(
average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as num,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,distribution: null == distribution ? _self._distribution : distribution // ignore: cast_nullable_to_non_nullable
as List<RatingBucketDto>,
  ));
}


}


/// @nodoc
mixin _$ReviewDto {

 String get id; String get name; String get initial; int get rating; String? get text; String get createdAt; bool get verifiedBuyer; bool get mine;
/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDtoCopyWith<ReviewDto> get copyWith => _$ReviewDtoCopyWithImpl<ReviewDto>(this as ReviewDto, _$identity);

  /// Serializes this ReviewDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReviewDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.initial, _this.initial) || other.initial == _this.initial)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.verifiedBuyer, _this.verifiedBuyer) || other.verifiedBuyer == _this.verifiedBuyer)&&(identical(other.mine, _this.mine) || other.mine == _this.mine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReviewDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.initial,_this.rating,_this.text,_this.createdAt,_this.verifiedBuyer,_this.mine);
}

@override
String toString() {
  final _this = this as ReviewDto;
  return 'ReviewDto(id: ${_this.id}, name: ${_this.name}, initial: ${_this.initial}, rating: ${_this.rating}, text: ${_this.text}, createdAt: ${_this.createdAt}, verifiedBuyer: ${_this.verifiedBuyer}, mine: ${_this.mine})';
}


}

/// @nodoc
abstract mixin class $ReviewDtoCopyWith<$Res>  {
  factory $ReviewDtoCopyWith(ReviewDto value, $Res Function(ReviewDto) _then) = _$ReviewDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String initial, int rating, String? text, String createdAt, bool verifiedBuyer, bool mine
});




}
/// @nodoc
class _$ReviewDtoCopyWithImpl<$Res>
    implements $ReviewDtoCopyWith<$Res> {
  _$ReviewDtoCopyWithImpl(this._self, this._then);

  final ReviewDto _self;
  final $Res Function(ReviewDto) _then;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? initial = null,Object? rating = null,Object? text = freezed,Object? createdAt = null,Object? verifiedBuyer = null,Object? mine = null,}) {
  return _then(ReviewDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,initial: null == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,verifiedBuyer: null == verifiedBuyer ? _self.verifiedBuyer : verifiedBuyer // ignore: cast_nullable_to_non_nullable
as bool,mine: null == mine ? _self.mine : mine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewDto].
extension ReviewDtoPatterns on ReviewDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewDto value)  $default,){
final _that = this;
switch (_that) {
case _ReviewDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String initial,  int rating,  String? text,  String createdAt,  bool verifiedBuyer,  bool mine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
return $default(_that.id,_that.name,_that.initial,_that.rating,_that.text,_that.createdAt,_that.verifiedBuyer,_that.mine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String initial,  int rating,  String? text,  String createdAt,  bool verifiedBuyer,  bool mine)  $default,) {final _that = this;
switch (_that) {
case _ReviewDto():
return $default(_that.id,_that.name,_that.initial,_that.rating,_that.text,_that.createdAt,_that.verifiedBuyer,_that.mine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String initial,  int rating,  String? text,  String createdAt,  bool verifiedBuyer,  bool mine)?  $default,) {final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
return $default(_that.id,_that.name,_that.initial,_that.rating,_that.text,_that.createdAt,_that.verifiedBuyer,_that.mine);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewDto implements ReviewDto {
  const _ReviewDto({required this.id, required this.name, this.initial = '', required this.rating, this.text, required this.createdAt, this.verifiedBuyer = false, this.mine = false});
  factory _ReviewDto.fromJson(Map<String, dynamic> json) => _$ReviewDtoFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String initial;
@override final  int rating;
@override final  String? text;
@override final  String createdAt;
@override@JsonKey() final  bool verifiedBuyer;
@override@JsonKey() final  bool mine;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewDtoCopyWith<_ReviewDto> get copyWith => __$ReviewDtoCopyWithImpl<_ReviewDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.text, text) || other.text == text)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.verifiedBuyer, verifiedBuyer) || other.verifiedBuyer == verifiedBuyer)&&(identical(other.mine, mine) || other.mine == mine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,initial,rating,text,createdAt,verifiedBuyer,mine);
}

@override
String toString() {
    return 'ReviewDto(id: $id, name: $name, initial: $initial, rating: $rating, text: $text, createdAt: $createdAt, verifiedBuyer: $verifiedBuyer, mine: $mine)';
}


}

/// @nodoc
abstract mixin class _$ReviewDtoCopyWith<$Res> implements $ReviewDtoCopyWith<$Res> {
  factory _$ReviewDtoCopyWith(_ReviewDto value, $Res Function(_ReviewDto) _then) = __$ReviewDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String initial, int rating, String? text, String createdAt, bool verifiedBuyer, bool mine
});




}
/// @nodoc
class __$ReviewDtoCopyWithImpl<$Res>
    implements _$ReviewDtoCopyWith<$Res> {
  __$ReviewDtoCopyWithImpl(this._self, this._then);

  final _ReviewDto _self;
  final $Res Function(_ReviewDto) _then;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? initial = null,Object? rating = null,Object? text = freezed,Object? createdAt = null,Object? verifiedBuyer = null,Object? mine = null,}) {
  return _then(_ReviewDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,initial: null == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,verifiedBuyer: null == verifiedBuyer ? _self.verifiedBuyer : verifiedBuyer // ignore: cast_nullable_to_non_nullable
as bool,mine: null == mine ? _self.mine : mine // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$HomeSetupOfferDto {

 bool get eligible; String get summary; List<String> get perks;/// The member's booked visits for this product (`HomeSetupBookingDto`),
/// kept raw here; the Orders feature parses them.
 List<Map<String, dynamic>> get upcoming;
/// Create a copy of HomeSetupOfferDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSetupOfferDtoCopyWith<HomeSetupOfferDto> get copyWith => _$HomeSetupOfferDtoCopyWithImpl<HomeSetupOfferDto>(this as HomeSetupOfferDto, _$identity);

  /// Serializes this HomeSetupOfferDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeSetupOfferDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSetupOfferDto&&(identical(other.eligible, _this.eligible) || other.eligible == _this.eligible)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&const DeepCollectionEquality().equals(other.perks, _this.perks)&&const DeepCollectionEquality().equals(other.upcoming, _this.upcoming));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeSetupOfferDto;
  return Object.hash(runtimeType,_this.eligible,_this.summary,const DeepCollectionEquality().hash(_this.perks),const DeepCollectionEquality().hash(_this.upcoming));
}

@override
String toString() {
  final _this = this as HomeSetupOfferDto;
  return 'HomeSetupOfferDto(eligible: ${_this.eligible}, summary: ${_this.summary}, perks: ${_this.perks}, upcoming: ${_this.upcoming})';
}


}

/// @nodoc
abstract mixin class $HomeSetupOfferDtoCopyWith<$Res>  {
  factory $HomeSetupOfferDtoCopyWith(HomeSetupOfferDto value, $Res Function(HomeSetupOfferDto) _then) = _$HomeSetupOfferDtoCopyWithImpl;
@useResult
$Res call({
 bool eligible, String summary, List<String> perks, List<Map<String, dynamic>> upcoming
});




}
/// @nodoc
class _$HomeSetupOfferDtoCopyWithImpl<$Res>
    implements $HomeSetupOfferDtoCopyWith<$Res> {
  _$HomeSetupOfferDtoCopyWithImpl(this._self, this._then);

  final HomeSetupOfferDto _self;
  final $Res Function(HomeSetupOfferDto) _then;

/// Create a copy of HomeSetupOfferDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eligible = null,Object? summary = null,Object? perks = null,Object? upcoming = null,}) {
  return _then(HomeSetupOfferDto(
eligible: null == eligible ? _self.eligible : eligible // ignore: cast_nullable_to_non_nullable
as bool,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,perks: null == perks ? _self.perks : perks // ignore: cast_nullable_to_non_nullable
as List<String>,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeSetupOfferDto].
extension HomeSetupOfferDtoPatterns on HomeSetupOfferDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSetupOfferDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSetupOfferDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSetupOfferDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeSetupOfferDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSetupOfferDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSetupOfferDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool eligible,  String summary,  List<String> perks,  List<Map<String, dynamic>> upcoming)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSetupOfferDto() when $default != null:
return $default(_that.eligible,_that.summary,_that.perks,_that.upcoming);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool eligible,  String summary,  List<String> perks,  List<Map<String, dynamic>> upcoming)  $default,) {final _that = this;
switch (_that) {
case _HomeSetupOfferDto():
return $default(_that.eligible,_that.summary,_that.perks,_that.upcoming);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool eligible,  String summary,  List<String> perks,  List<Map<String, dynamic>> upcoming)?  $default,) {final _that = this;
switch (_that) {
case _HomeSetupOfferDto() when $default != null:
return $default(_that.eligible,_that.summary,_that.perks,_that.upcoming);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSetupOfferDto implements HomeSetupOfferDto {
  const _HomeSetupOfferDto({this.eligible = false, this.summary = '',  List<String> perks = const [],  List<Map<String, dynamic>> upcoming = const []}): _perks = perks,_upcoming = upcoming;
  factory _HomeSetupOfferDto.fromJson(Map<String, dynamic> json) => _$HomeSetupOfferDtoFromJson(json);

@override@JsonKey() final  bool eligible;
@override@JsonKey() final  String summary;
 final  List<String> _perks;
@override@JsonKey() List<String> get perks {
  if (_perks is EqualUnmodifiableListView) return _perks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_perks);
}

/// The member's booked visits for this product (`HomeSetupBookingDto`),
/// kept raw here; the Orders feature parses them.
 final  List<Map<String, dynamic>> _upcoming;
/// The member's booked visits for this product (`HomeSetupBookingDto`),
/// kept raw here; the Orders feature parses them.
@override@JsonKey() List<Map<String, dynamic>> get upcoming {
  if (_upcoming is EqualUnmodifiableListView) return _upcoming;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcoming);
}


/// Create a copy of HomeSetupOfferDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSetupOfferDtoCopyWith<_HomeSetupOfferDto> get copyWith => __$HomeSetupOfferDtoCopyWithImpl<_HomeSetupOfferDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSetupOfferDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSetupOfferDto&&(identical(other.eligible, eligible) || other.eligible == eligible)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.perks, _perks)&&const DeepCollectionEquality().equals(other.upcoming, _upcoming));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,eligible,summary,const DeepCollectionEquality().hash(_perks),const DeepCollectionEquality().hash(_upcoming));
}

@override
String toString() {
    return 'HomeSetupOfferDto(eligible: $eligible, summary: $summary, perks: $perks, upcoming: $upcoming)';
}


}

/// @nodoc
abstract mixin class _$HomeSetupOfferDtoCopyWith<$Res> implements $HomeSetupOfferDtoCopyWith<$Res> {
  factory _$HomeSetupOfferDtoCopyWith(_HomeSetupOfferDto value, $Res Function(_HomeSetupOfferDto) _then) = __$HomeSetupOfferDtoCopyWithImpl;
@override @useResult
$Res call({
 bool eligible, String summary, List<String> perks, List<Map<String, dynamic>> upcoming
});




}
/// @nodoc
class __$HomeSetupOfferDtoCopyWithImpl<$Res>
    implements _$HomeSetupOfferDtoCopyWith<$Res> {
  __$HomeSetupOfferDtoCopyWithImpl(this._self, this._then);

  final _HomeSetupOfferDto _self;
  final $Res Function(_HomeSetupOfferDto) _then;

/// Create a copy of HomeSetupOfferDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eligible = null,Object? summary = null,Object? perks = null,Object? upcoming = null,}) {
  return _then(_HomeSetupOfferDto(
eligible: null == eligible ? _self.eligible : eligible // ignore: cast_nullable_to_non_nullable
as bool,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,perks: null == perks ? _self._perks : perks // ignore: cast_nullable_to_non_nullable
as List<String>,upcoming: null == upcoming ? _self._upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}


/// @nodoc
mixin _$FreshnessDto {

 String get source; String? get checkedAt; String? get syncedAt;
/// Create a copy of FreshnessDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreshnessDtoCopyWith<FreshnessDto> get copyWith => _$FreshnessDtoCopyWithImpl<FreshnessDto>(this as FreshnessDto, _$identity);

  /// Serializes this FreshnessDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FreshnessDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreshnessDto&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.checkedAt, _this.checkedAt) || other.checkedAt == _this.checkedAt)&&(identical(other.syncedAt, _this.syncedAt) || other.syncedAt == _this.syncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FreshnessDto;
  return Object.hash(runtimeType,_this.source,_this.checkedAt,_this.syncedAt);
}

@override
String toString() {
  final _this = this as FreshnessDto;
  return 'FreshnessDto(source: ${_this.source}, checkedAt: ${_this.checkedAt}, syncedAt: ${_this.syncedAt})';
}


}

/// @nodoc
abstract mixin class $FreshnessDtoCopyWith<$Res>  {
  factory $FreshnessDtoCopyWith(FreshnessDto value, $Res Function(FreshnessDto) _then) = _$FreshnessDtoCopyWithImpl;
@useResult
$Res call({
 String source, String? checkedAt, String? syncedAt
});




}
/// @nodoc
class _$FreshnessDtoCopyWithImpl<$Res>
    implements $FreshnessDtoCopyWith<$Res> {
  _$FreshnessDtoCopyWithImpl(this._self, this._then);

  final FreshnessDto _self;
  final $Res Function(FreshnessDto) _then;

/// Create a copy of FreshnessDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? checkedAt = freezed,Object? syncedAt = freezed,}) {
  return _then(FreshnessDto(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,checkedAt: freezed == checkedAt ? _self.checkedAt : checkedAt // ignore: cast_nullable_to_non_nullable
as String?,syncedAt: freezed == syncedAt ? _self.syncedAt : syncedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FreshnessDto].
extension FreshnessDtoPatterns on FreshnessDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreshnessDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreshnessDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreshnessDto value)  $default,){
final _that = this;
switch (_that) {
case _FreshnessDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreshnessDto value)?  $default,){
final _that = this;
switch (_that) {
case _FreshnessDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String source,  String? checkedAt,  String? syncedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FreshnessDto() when $default != null:
return $default(_that.source,_that.checkedAt,_that.syncedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String source,  String? checkedAt,  String? syncedAt)  $default,) {final _that = this;
switch (_that) {
case _FreshnessDto():
return $default(_that.source,_that.checkedAt,_that.syncedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String source,  String? checkedAt,  String? syncedAt)?  $default,) {final _that = this;
switch (_that) {
case _FreshnessDto() when $default != null:
return $default(_that.source,_that.checkedAt,_that.syncedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FreshnessDto extends FreshnessDto {
  const _FreshnessDto({required this.source, this.checkedAt, this.syncedAt}): super._();
  factory _FreshnessDto.fromJson(Map<String, dynamic> json) => _$FreshnessDtoFromJson(json);

@override final  String source;
@override final  String? checkedAt;
@override final  String? syncedAt;

/// Create a copy of FreshnessDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreshnessDtoCopyWith<_FreshnessDto> get copyWith => __$FreshnessDtoCopyWithImpl<_FreshnessDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreshnessDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreshnessDto&&(identical(other.source, source) || other.source == source)&&(identical(other.checkedAt, checkedAt) || other.checkedAt == checkedAt)&&(identical(other.syncedAt, syncedAt) || other.syncedAt == syncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,source,checkedAt,syncedAt);
}

@override
String toString() {
    return 'FreshnessDto(source: $source, checkedAt: $checkedAt, syncedAt: $syncedAt)';
}


}

/// @nodoc
abstract mixin class _$FreshnessDtoCopyWith<$Res> implements $FreshnessDtoCopyWith<$Res> {
  factory _$FreshnessDtoCopyWith(_FreshnessDto value, $Res Function(_FreshnessDto) _then) = __$FreshnessDtoCopyWithImpl;
@override @useResult
$Res call({
 String source, String? checkedAt, String? syncedAt
});




}
/// @nodoc
class __$FreshnessDtoCopyWithImpl<$Res>
    implements _$FreshnessDtoCopyWith<$Res> {
  __$FreshnessDtoCopyWithImpl(this._self, this._then);

  final _FreshnessDto _self;
  final $Res Function(_FreshnessDto) _then;

/// Create a copy of FreshnessDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? checkedAt = freezed,Object? syncedAt = freezed,}) {
  return _then(_FreshnessDto(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,checkedAt: freezed == checkedAt ? _self.checkedAt : checkedAt // ignore: cast_nullable_to_non_nullable
as String?,syncedAt: freezed == syncedAt ? _self.syncedAt : syncedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductDetailDto {

 String get id; String get name; String? get nameMy; String? get brand; List<String> get images; Money get price; Money? get compareAt; int? get discountPercent; bool get inStock; String? get deliveryPromise; String? get description; String? get warrantyLabel; List<OptionGroupDto> get options; List<VariantDto> get variants; String? get defaultSku; List<SpecDto> get specs; SellerDto? get seller; RatingSummaryDto get rating; List<ReviewDto> get topReviews; List<ProductCardDto> get similar; HomeSetupOfferDto get homeSetup; bool get wished; String get shareUrl; FreshnessDto? get freshness;
/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailDtoCopyWith<ProductDetailDto> get copyWith => _$ProductDetailDtoCopyWithImpl<ProductDetailDto>(this as ProductDetailDto, _$identity);

  /// Serializes this ProductDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductDetailDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameMy, _this.nameMy) || other.nameMy == _this.nameMy)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&const DeepCollectionEquality().equals(other.images, _this.images)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.compareAt, _this.compareAt) || other.compareAt == _this.compareAt)&&(identical(other.discountPercent, _this.discountPercent) || other.discountPercent == _this.discountPercent)&&(identical(other.inStock, _this.inStock) || other.inStock == _this.inStock)&&(identical(other.deliveryPromise, _this.deliveryPromise) || other.deliveryPromise == _this.deliveryPromise)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.warrantyLabel, _this.warrantyLabel) || other.warrantyLabel == _this.warrantyLabel)&&const DeepCollectionEquality().equals(other.options, _this.options)&&const DeepCollectionEquality().equals(other.variants, _this.variants)&&(identical(other.defaultSku, _this.defaultSku) || other.defaultSku == _this.defaultSku)&&const DeepCollectionEquality().equals(other.specs, _this.specs)&&(identical(other.seller, _this.seller) || other.seller == _this.seller)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&const DeepCollectionEquality().equals(other.topReviews, _this.topReviews)&&const DeepCollectionEquality().equals(other.similar, _this.similar)&&(identical(other.homeSetup, _this.homeSetup) || other.homeSetup == _this.homeSetup)&&(identical(other.wished, _this.wished) || other.wished == _this.wished)&&(identical(other.shareUrl, _this.shareUrl) || other.shareUrl == _this.shareUrl)&&(identical(other.freshness, _this.freshness) || other.freshness == _this.freshness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductDetailDto;
  return Object.hashAll([runtimeType,_this.id,_this.name,_this.nameMy,_this.brand,const DeepCollectionEquality().hash(_this.images),_this.price,_this.compareAt,_this.discountPercent,_this.inStock,_this.deliveryPromise,_this.description,_this.warrantyLabel,const DeepCollectionEquality().hash(_this.options),const DeepCollectionEquality().hash(_this.variants),_this.defaultSku,const DeepCollectionEquality().hash(_this.specs),_this.seller,_this.rating,const DeepCollectionEquality().hash(_this.topReviews),const DeepCollectionEquality().hash(_this.similar),_this.homeSetup,_this.wished,_this.shareUrl,_this.freshness]);
}

@override
String toString() {
  final _this = this as ProductDetailDto;
  return 'ProductDetailDto(id: ${_this.id}, name: ${_this.name}, nameMy: ${_this.nameMy}, brand: ${_this.brand}, images: ${_this.images}, price: ${_this.price}, compareAt: ${_this.compareAt}, discountPercent: ${_this.discountPercent}, inStock: ${_this.inStock}, deliveryPromise: ${_this.deliveryPromise}, description: ${_this.description}, warrantyLabel: ${_this.warrantyLabel}, options: ${_this.options}, variants: ${_this.variants}, defaultSku: ${_this.defaultSku}, specs: ${_this.specs}, seller: ${_this.seller}, rating: ${_this.rating}, topReviews: ${_this.topReviews}, similar: ${_this.similar}, homeSetup: ${_this.homeSetup}, wished: ${_this.wished}, shareUrl: ${_this.shareUrl}, freshness: ${_this.freshness})';
}


}

/// @nodoc
abstract mixin class $ProductDetailDtoCopyWith<$Res>  {
  factory $ProductDetailDtoCopyWith(ProductDetailDto value, $Res Function(ProductDetailDto) _then) = _$ProductDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? nameMy, String? brand, List<String> images, Money price, Money? compareAt, int? discountPercent, bool inStock, String? deliveryPromise, String? description, String? warrantyLabel, List<OptionGroupDto> options, List<VariantDto> variants, String? defaultSku, List<SpecDto> specs, SellerDto? seller, RatingSummaryDto rating, List<ReviewDto> topReviews, List<ProductCardDto> similar, HomeSetupOfferDto homeSetup, bool wished, String shareUrl, FreshnessDto? freshness
});


$MoneyCopyWith<$Res> get price;$MoneyCopyWith<$Res>? get compareAt;$SellerDtoCopyWith<$Res>? get seller;$RatingSummaryDtoCopyWith<$Res> get rating;$HomeSetupOfferDtoCopyWith<$Res> get homeSetup;$FreshnessDtoCopyWith<$Res>? get freshness;

}
/// @nodoc
class _$ProductDetailDtoCopyWithImpl<$Res>
    implements $ProductDetailDtoCopyWith<$Res> {
  _$ProductDetailDtoCopyWithImpl(this._self, this._then);

  final ProductDetailDto _self;
  final $Res Function(ProductDetailDto) _then;

/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameMy = freezed,Object? brand = freezed,Object? images = null,Object? price = null,Object? compareAt = freezed,Object? discountPercent = freezed,Object? inStock = null,Object? deliveryPromise = freezed,Object? description = freezed,Object? warrantyLabel = freezed,Object? options = null,Object? variants = null,Object? defaultSku = freezed,Object? specs = null,Object? seller = freezed,Object? rating = null,Object? topReviews = null,Object? similar = null,Object? homeSetup = null,Object? wished = null,Object? shareUrl = null,Object? freshness = freezed,}) {
  return _then(ProductDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameMy: freezed == nameMy ? _self.nameMy : nameMy // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,compareAt: freezed == compareAt ? _self.compareAt : compareAt // ignore: cast_nullable_to_non_nullable
as Money?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,deliveryPromise: freezed == deliveryPromise ? _self.deliveryPromise : deliveryPromise // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,warrantyLabel: freezed == warrantyLabel ? _self.warrantyLabel : warrantyLabel // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<OptionGroupDto>,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<VariantDto>,defaultSku: freezed == defaultSku ? _self.defaultSku : defaultSku // ignore: cast_nullable_to_non_nullable
as String?,specs: null == specs ? _self.specs : specs // ignore: cast_nullable_to_non_nullable
as List<SpecDto>,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as SellerDto?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as RatingSummaryDto,topReviews: null == topReviews ? _self.topReviews : topReviews // ignore: cast_nullable_to_non_nullable
as List<ReviewDto>,similar: null == similar ? _self.similar : similar // ignore: cast_nullable_to_non_nullable
as List<ProductCardDto>,homeSetup: null == homeSetup ? _self.homeSetup : homeSetup // ignore: cast_nullable_to_non_nullable
as HomeSetupOfferDto,wished: null == wished ? _self.wished : wished // ignore: cast_nullable_to_non_nullable
as bool,shareUrl: null == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String,freshness: freezed == freshness ? _self.freshness : freshness // ignore: cast_nullable_to_non_nullable
as FreshnessDto?,
  ));
}
/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get compareAt {
    if (_self.compareAt == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.compareAt!, (value) {
    return _then(_self.copyWith(compareAt: value));
  });
}/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerDtoCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $SellerDtoCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingSummaryDtoCopyWith<$Res> get rating {
  
  return $RatingSummaryDtoCopyWith<$Res>(_self.rating, (value) {
    return _then(_self.copyWith(rating: value));
  });
}/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeSetupOfferDtoCopyWith<$Res> get homeSetup {
  
  return $HomeSetupOfferDtoCopyWith<$Res>(_self.homeSetup, (value) {
    return _then(_self.copyWith(homeSetup: value));
  });
}/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FreshnessDtoCopyWith<$Res>? get freshness {
    if (_self.freshness == null) {
    return null;
  }

  return $FreshnessDtoCopyWith<$Res>(_self.freshness!, (value) {
    return _then(_self.copyWith(freshness: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductDetailDto].
extension ProductDetailDtoPatterns on ProductDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? nameMy,  String? brand,  List<String> images,  Money price,  Money? compareAt,  int? discountPercent,  bool inStock,  String? deliveryPromise,  String? description,  String? warrantyLabel,  List<OptionGroupDto> options,  List<VariantDto> variants,  String? defaultSku,  List<SpecDto> specs,  SellerDto? seller,  RatingSummaryDto rating,  List<ReviewDto> topReviews,  List<ProductCardDto> similar,  HomeSetupOfferDto homeSetup,  bool wished,  String shareUrl,  FreshnessDto? freshness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.nameMy,_that.brand,_that.images,_that.price,_that.compareAt,_that.discountPercent,_that.inStock,_that.deliveryPromise,_that.description,_that.warrantyLabel,_that.options,_that.variants,_that.defaultSku,_that.specs,_that.seller,_that.rating,_that.topReviews,_that.similar,_that.homeSetup,_that.wished,_that.shareUrl,_that.freshness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? nameMy,  String? brand,  List<String> images,  Money price,  Money? compareAt,  int? discountPercent,  bool inStock,  String? deliveryPromise,  String? description,  String? warrantyLabel,  List<OptionGroupDto> options,  List<VariantDto> variants,  String? defaultSku,  List<SpecDto> specs,  SellerDto? seller,  RatingSummaryDto rating,  List<ReviewDto> topReviews,  List<ProductCardDto> similar,  HomeSetupOfferDto homeSetup,  bool wished,  String shareUrl,  FreshnessDto? freshness)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailDto():
return $default(_that.id,_that.name,_that.nameMy,_that.brand,_that.images,_that.price,_that.compareAt,_that.discountPercent,_that.inStock,_that.deliveryPromise,_that.description,_that.warrantyLabel,_that.options,_that.variants,_that.defaultSku,_that.specs,_that.seller,_that.rating,_that.topReviews,_that.similar,_that.homeSetup,_that.wished,_that.shareUrl,_that.freshness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? nameMy,  String? brand,  List<String> images,  Money price,  Money? compareAt,  int? discountPercent,  bool inStock,  String? deliveryPromise,  String? description,  String? warrantyLabel,  List<OptionGroupDto> options,  List<VariantDto> variants,  String? defaultSku,  List<SpecDto> specs,  SellerDto? seller,  RatingSummaryDto rating,  List<ReviewDto> topReviews,  List<ProductCardDto> similar,  HomeSetupOfferDto homeSetup,  bool wished,  String shareUrl,  FreshnessDto? freshness)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.nameMy,_that.brand,_that.images,_that.price,_that.compareAt,_that.discountPercent,_that.inStock,_that.deliveryPromise,_that.description,_that.warrantyLabel,_that.options,_that.variants,_that.defaultSku,_that.specs,_that.seller,_that.rating,_that.topReviews,_that.similar,_that.homeSetup,_that.wished,_that.shareUrl,_that.freshness);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDetailDto implements ProductDetailDto {
  const _ProductDetailDto({required this.id, required this.name, this.nameMy, this.brand,  List<String> images = const [], required this.price, this.compareAt, this.discountPercent, required this.inStock, this.deliveryPromise, this.description, this.warrantyLabel,  List<OptionGroupDto> options = const [],  List<VariantDto> variants = const [], this.defaultSku,  List<SpecDto> specs = const [], this.seller, this.rating = const RatingSummaryDto(),  List<ReviewDto> topReviews = const [],  List<ProductCardDto> similar = const [], this.homeSetup = const HomeSetupOfferDto(), this.wished = false, this.shareUrl = '', this.freshness}): _images = images,_options = options,_variants = variants,_specs = specs,_topReviews = topReviews,_similar = similar;
  factory _ProductDetailDto.fromJson(Map<String, dynamic> json) => _$ProductDetailDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? nameMy;
@override final  String? brand;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  Money price;
@override final  Money? compareAt;
@override final  int? discountPercent;
@override final  bool inStock;
@override final  String? deliveryPromise;
@override final  String? description;
@override final  String? warrantyLabel;
 final  List<OptionGroupDto> _options;
@override@JsonKey() List<OptionGroupDto> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  List<VariantDto> _variants;
@override@JsonKey() List<VariantDto> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

@override final  String? defaultSku;
 final  List<SpecDto> _specs;
@override@JsonKey() List<SpecDto> get specs {
  if (_specs is EqualUnmodifiableListView) return _specs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specs);
}

@override final  SellerDto? seller;
@override@JsonKey() final  RatingSummaryDto rating;
 final  List<ReviewDto> _topReviews;
@override@JsonKey() List<ReviewDto> get topReviews {
  if (_topReviews is EqualUnmodifiableListView) return _topReviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topReviews);
}

 final  List<ProductCardDto> _similar;
@override@JsonKey() List<ProductCardDto> get similar {
  if (_similar is EqualUnmodifiableListView) return _similar;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_similar);
}

@override@JsonKey() final  HomeSetupOfferDto homeSetup;
@override@JsonKey() final  bool wished;
@override@JsonKey() final  String shareUrl;
@override final  FreshnessDto? freshness;

/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailDtoCopyWith<_ProductDetailDto> get copyWith => __$ProductDetailDtoCopyWithImpl<_ProductDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameMy, nameMy) || other.nameMy == nameMy)&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other.images, _images)&&(identical(other.price, price) || other.price == price)&&(identical(other.compareAt, compareAt) || other.compareAt == compareAt)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.deliveryPromise, deliveryPromise) || other.deliveryPromise == deliveryPromise)&&(identical(other.description, description) || other.description == description)&&(identical(other.warrantyLabel, warrantyLabel) || other.warrantyLabel == warrantyLabel)&&const DeepCollectionEquality().equals(other.options, _options)&&const DeepCollectionEquality().equals(other.variants, _variants)&&(identical(other.defaultSku, defaultSku) || other.defaultSku == defaultSku)&&const DeepCollectionEquality().equals(other.specs, _specs)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.topReviews, _topReviews)&&const DeepCollectionEquality().equals(other.similar, _similar)&&(identical(other.homeSetup, homeSetup) || other.homeSetup == homeSetup)&&(identical(other.wished, wished) || other.wished == wished)&&(identical(other.shareUrl, shareUrl) || other.shareUrl == shareUrl)&&(identical(other.freshness, freshness) || other.freshness == freshness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,name,nameMy,brand,const DeepCollectionEquality().hash(_images),price,compareAt,discountPercent,inStock,deliveryPromise,description,warrantyLabel,const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_variants),defaultSku,const DeepCollectionEquality().hash(_specs),seller,rating,const DeepCollectionEquality().hash(_topReviews),const DeepCollectionEquality().hash(_similar),homeSetup,wished,shareUrl,freshness]);
}

@override
String toString() {
    return 'ProductDetailDto(id: $id, name: $name, nameMy: $nameMy, brand: $brand, images: $images, price: $price, compareAt: $compareAt, discountPercent: $discountPercent, inStock: $inStock, deliveryPromise: $deliveryPromise, description: $description, warrantyLabel: $warrantyLabel, options: $options, variants: $variants, defaultSku: $defaultSku, specs: $specs, seller: $seller, rating: $rating, topReviews: $topReviews, similar: $similar, homeSetup: $homeSetup, wished: $wished, shareUrl: $shareUrl, freshness: $freshness)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailDtoCopyWith<$Res> implements $ProductDetailDtoCopyWith<$Res> {
  factory _$ProductDetailDtoCopyWith(_ProductDetailDto value, $Res Function(_ProductDetailDto) _then) = __$ProductDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? nameMy, String? brand, List<String> images, Money price, Money? compareAt, int? discountPercent, bool inStock, String? deliveryPromise, String? description, String? warrantyLabel, List<OptionGroupDto> options, List<VariantDto> variants, String? defaultSku, List<SpecDto> specs, SellerDto? seller, RatingSummaryDto rating, List<ReviewDto> topReviews, List<ProductCardDto> similar, HomeSetupOfferDto homeSetup, bool wished, String shareUrl, FreshnessDto? freshness
});


@override $MoneyCopyWith<$Res> get price;@override $MoneyCopyWith<$Res>? get compareAt;@override $SellerDtoCopyWith<$Res>? get seller;@override $RatingSummaryDtoCopyWith<$Res> get rating;@override $HomeSetupOfferDtoCopyWith<$Res> get homeSetup;@override $FreshnessDtoCopyWith<$Res>? get freshness;

}
/// @nodoc
class __$ProductDetailDtoCopyWithImpl<$Res>
    implements _$ProductDetailDtoCopyWith<$Res> {
  __$ProductDetailDtoCopyWithImpl(this._self, this._then);

  final _ProductDetailDto _self;
  final $Res Function(_ProductDetailDto) _then;

/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameMy = freezed,Object? brand = freezed,Object? images = null,Object? price = null,Object? compareAt = freezed,Object? discountPercent = freezed,Object? inStock = null,Object? deliveryPromise = freezed,Object? description = freezed,Object? warrantyLabel = freezed,Object? options = null,Object? variants = null,Object? defaultSku = freezed,Object? specs = null,Object? seller = freezed,Object? rating = null,Object? topReviews = null,Object? similar = null,Object? homeSetup = null,Object? wished = null,Object? shareUrl = null,Object? freshness = freezed,}) {
  return _then(_ProductDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameMy: freezed == nameMy ? _self.nameMy : nameMy // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,compareAt: freezed == compareAt ? _self.compareAt : compareAt // ignore: cast_nullable_to_non_nullable
as Money?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,deliveryPromise: freezed == deliveryPromise ? _self.deliveryPromise : deliveryPromise // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,warrantyLabel: freezed == warrantyLabel ? _self.warrantyLabel : warrantyLabel // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<OptionGroupDto>,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<VariantDto>,defaultSku: freezed == defaultSku ? _self.defaultSku : defaultSku // ignore: cast_nullable_to_non_nullable
as String?,specs: null == specs ? _self._specs : specs // ignore: cast_nullable_to_non_nullable
as List<SpecDto>,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as SellerDto?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as RatingSummaryDto,topReviews: null == topReviews ? _self._topReviews : topReviews // ignore: cast_nullable_to_non_nullable
as List<ReviewDto>,similar: null == similar ? _self._similar : similar // ignore: cast_nullable_to_non_nullable
as List<ProductCardDto>,homeSetup: null == homeSetup ? _self.homeSetup : homeSetup // ignore: cast_nullable_to_non_nullable
as HomeSetupOfferDto,wished: null == wished ? _self.wished : wished // ignore: cast_nullable_to_non_nullable
as bool,shareUrl: null == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String,freshness: freezed == freshness ? _self.freshness : freshness // ignore: cast_nullable_to_non_nullable
as FreshnessDto?,
  ));
}

/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get compareAt {
    if (_self.compareAt == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.compareAt!, (value) {
    return _then(_self.copyWith(compareAt: value));
  });
}/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerDtoCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $SellerDtoCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingSummaryDtoCopyWith<$Res> get rating {
  
  return $RatingSummaryDtoCopyWith<$Res>(_self.rating, (value) {
    return _then(_self.copyWith(rating: value));
  });
}/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeSetupOfferDtoCopyWith<$Res> get homeSetup {
  
  return $HomeSetupOfferDtoCopyWith<$Res>(_self.homeSetup, (value) {
    return _then(_self.copyWith(homeSetup: value));
  });
}/// Create a copy of ProductDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FreshnessDtoCopyWith<$Res>? get freshness {
    if (_self.freshness == null) {
    return null;
  }

  return $FreshnessDtoCopyWith<$Res>(_self.freshness!, (value) {
    return _then(_self.copyWith(freshness: value));
  });
}
}

// dart format on
